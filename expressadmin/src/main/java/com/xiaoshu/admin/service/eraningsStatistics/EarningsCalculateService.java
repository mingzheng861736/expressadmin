package com.xiaoshu.admin.service.eraningsStatistics;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.xiaoshu.admin.entity.*;
import com.xiaoshu.admin.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author sunzhenpeng
 * @data 2019/9/6
 * @description 收益计算 服务类
 */
@Service
public class EarningsCalculateService{

    @Autowired
    private TbOddNumService tbOddNumService;//订单表服务

    @Autowired
    private TbTodayPriceService tbTodayPriceService;//今日区域快递报价表

    @Autowired
    private TbEarningsRuleService tbEarningsRuleService;//平台收益规则表

    @Autowired
    private AdminUserService adminUserService;//用户表

    @Autowired
    private TbVipService vipService;//vip表

    @Autowired
    private TbRecommendService tbRecommendService;//推荐表

    @Autowired
    private TbFundInfoService tbFundInfoService;//交易金额表

    @Autowired
    private TbTerraceEraningsStatisticsService tbTerraceEraningsStatisticsService;//平台收益统计

    private static List<Integer> failureOrderList;//此list集合用来存放收益计算失败的订单的订单号
    /**
     * 批量计算收益
     * @author sunzhenpeng
     * @date 2019/9/7
     * @param
     * @return java.util.Map<java.lang.String,java.lang.Object>
     */
    public Map<String,Object> batchEarningsCalculate () {

        failureOrderList.clear();//清空用来存放收益计算失败的订单号的list

        Map<String,Object> resultMap = new HashMap<String,Object>();
        boolean result = true;
        String msg = "";
        //获取系统当前时间减一天
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        Date today = calendar.getTime();
        calendar.add(calendar.DATE,-1);
        Date yestoday = calendar.getTime();
        //从订单表查询前一天的所有订单
        QueryWrapper quetyWrapper = new QueryWrapper<TbOddNum>();
        quetyWrapper.ge("add_time",yestoday);//大于等于昨天凌晨
        quetyWrapper.lt("add_time",today);//小于今天凌晨
        quetyWrapper.eq("sender_type",2);//区分，只有退换货才计算收益
        quetyWrapper.eq("is_cancel",0);//订单状态为未取消
        List<TbOddNum> orderList = tbOddNumService.list(quetyWrapper);
        for(TbOddNum order:orderList){
            earningsCalculate(order);
        }
        resultMap.put("result",result);
        resultMap.put("msg",msg);
        return resultMap;
    }
    /**
     * 单个订单收益计算
     * @author sunzhenpeng
     * @date 2019/9/7
     * @param order
     * @return void
     */
    @Transactional
    public void earningsCalculate(TbOddNum order){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        //获取当前区域当天快递公司的报价
        TbTodayPrice tbTodayPrice = tbTodayPriceService.getOne(new QueryWrapper<TbTodayPrice>().like("today",sdf.format(new Date()))
                .eq("area",order.getOrderArea())
                .eq("tracking",order.getTrackingCompany()));
        //快递公司报价
        double todayPrice = tbTodayPrice.getTodayPrice();
        //用户报价
        double userPrice = tbTodayPrice.getTodayUserPrice();
        /*//根据用户报价，去平台收益规则表匹配相应的收益规则
        TbEarningsRule tbEarningsRule = tbEarningsRuleService.getOne(new QueryWrapper<TbEarningsRule>().le("priceScopeLeast",userPrice)
                .gt("priceScopeMax",userPrice));
                double trackingPaymetEarnings = Double.valueOf(tbEarningsRule.getTrackingPaymetEarnings().toString());*/
        //平台溢价收益
        double trackingPaymetEarnings = userPrice - todayPrice;
        //存入平台收益统计表
        TbTerraceEraningsStatistics tbTerraceEraningsStatistics = new TbTerraceEraningsStatistics();
        tbTerraceEraningsStatistics.setEranings(trackingPaymetEarnings);
        tbTerraceEraningsStatistics.setToday(new Date());
        boolean a = tbTerraceEraningsStatisticsService.save(tbTerraceEraningsStatistics);
        if(!a){
            //将失败单号存入list集合
            failureOrderList.add(order.getId());
        }
        //余额收益
        double balance = order.getPayPrice()- userPrice;
        //接下来从余额收益继续计算计算代理、vip收益和推广收益
        //先计算代理收益，
        AdminUser agencyUser = adminUserService.getById(order.getPickUpPerson());//代理人、快递员
        double agencyEarnings = balance*vipService.getById(4).getVipPercentage();
        agencyUser.setRemainingSum(agencyUser.getRemainingSum()+agencyEarnings);
        boolean c = adminUserService.updateById(agencyUser);
        //添加资金来往明细
        boolean cc = tbFundInfoService.save(new TbFundInfo().setUserId(agencyUser.getId())//用户id
                .setFundType(1)//资金流向，0为支出，1为收入
                .setMoney(agencyEarnings)//金额
                .setMoneyPurpose(2)//金额用途
                .setPurposeInfo("代理收益")//用途说明
                .setAddTime(new Date()));//添加时间
        if(!c&&!cc){
            //将失败单号存入list集合
            failureOrderList.add(order.getId());
            //result = false;
            //msg = "代理收益更新失败！";
            //异常信息返回
            //throw new Exception("代理收益更新失败！");
        }
        //接下来计算推广收益
        String recommendUserId = tbRecommendService.getOne(new QueryWrapper<TbRecommend>().eq("recommended",order.getUserId())).getRecommend();
        AdminUser recommendUser = adminUserService.getById(recommendUserId);//推荐人
        double promotionEarnings = vipService.getOne(new QueryWrapper<TbVip>().eq("id",recommendUser.getUserVip())).getPromotionEarnings();
        //推广收益
        double recommendEranings = (balance-agencyEarnings)*promotionEarnings;
        recommendUser.setRemainingSum(recommendUser.getRemainingSum()+recommendEranings);
        boolean d = adminUserService.updateById(recommendUser);
        //添加资金来往明细
        boolean dd = tbFundInfoService.save(new TbFundInfo().setUserId(recommendUser.getId())//用户id
                .setFundType(1)//资金流向，0为支出，1为收入
                .setMoney(recommendEranings)//金额
                .setMoneyPurpose(1)//金额用途
                .setPurposeInfo("推荐推广收益")//用途说明
                .setAddTime(new Date()));//添加时间
        if(!d&&!dd){
            //将失败单号存入list集合
            failureOrderList.add(order.getId());
            //result = false;
            //msg = "推广收益更新失败！";
            //异常信息返回
            //throw new Exception("推广收益更新失败！");
        }
        //剩余的是平台收益
        double earings = balance - agencyEarnings - recommendEranings;
        //存入平台收益统计
        boolean e = tbTerraceEraningsStatisticsService.save(new TbTerraceEraningsStatistics().setEranings(earings).setToday(new Date()));
        if(!e){
            //将失败单号存入list集合
            failureOrderList.add(order.getId());
        }

    }

    /**
     * 单个订单收益计算
     * @author sunzhenpeng
     * @date 2019/9/7
     * @param order
     * @return void
     */
    @Transactional
    public void earningsCalculate2(TbOddNum order){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        //获取当前区域当天快递公司的报价
        TbTodayPrice tbTodayPrice = tbTodayPriceService.getOne(new QueryWrapper<TbTodayPrice>().like("today",sdf.format(new Date()))
                .eq("area",order.getOrderArea())
                .eq("tracking",order.getTrackingCompany()));
        //快递公司报价
        double todayPrice = tbTodayPrice.getTodayPrice();
        //用户报价
        double userPrice = tbTodayPrice.getTodayUserPrice();
        /*//根据用户报价，去平台收益规则表匹配相应的收益规则
        TbEarningsRule tbEarningsRule = tbEarningsRuleService.getOne(new QueryWrapper<TbEarningsRule>().le("priceScopeLeast",userPrice)
                .gt("priceScopeMax",userPrice));
                double trackingPaymetEarnings = Double.valueOf(tbEarningsRule.getTrackingPaymetEarnings().toString());*/
        //平台溢价收益
        double trackingPaymetEarnings = userPrice - todayPrice;
        //存入平台收益统计表
        TbTerraceEraningsStatistics tbTerraceEraningsStatistics = new TbTerraceEraningsStatistics();
        tbTerraceEraningsStatistics.setEranings(trackingPaymetEarnings);
        tbTerraceEraningsStatistics.setToday(new Date());
        boolean a = tbTerraceEraningsStatisticsService.save(tbTerraceEraningsStatistics);
        if(!a){
            //将失败单号存入list集合
            failureOrderList.add(order.getId());
        }
        //余额收益
        double balance = order.getPayPrice()- userPrice;
        //接下来从余额收益继续计算计算代理、vip收益和推广收益
        //先计算代理收益，
        AdminUser agencyUser = adminUserService.getById(order.getPickUpPerson());//代理人、快递员
        double agencyEarnings = vipService.getById(4).getVipPercentage();
        agencyUser.setRemainingSum(agencyUser.getRemainingSum()+agencyEarnings);
        boolean c = adminUserService.updateById(agencyUser);
        //添加资金来往明细
        boolean cc = tbFundInfoService.save(new TbFundInfo().setUserId(agencyUser.getId())//用户id
                .setFundType(1)//资金流向，0为支出，1为收入
                .setMoney(agencyEarnings)//金额
                .setMoneyPurpose(2)//金额用途
                .setPurposeInfo("代理收益")//用途说明
                .setAddTime(new Date()));//添加时间
        if(!c&&!cc){
            //将失败单号存入list集合
            failureOrderList.add(order.getId());
            //result = false;
            //msg = "代理收益更新失败！";
            //异常信息返回
            //throw new Exception("代理收益更新失败！");
        }
        //接下来计算推广收益
        String recommendUserId = tbRecommendService.getOne(new QueryWrapper<TbRecommend>().eq("recommended",order.getUserId())).getRecommend();
        AdminUser recommendUser = adminUserService.getById(recommendUserId);//推荐人
        double promotionEarnings = vipService.getOne(new QueryWrapper<TbVip>().eq("id",recommendUser.getUserVip())).getPromotionEarnings();
        //推广收益
        double recommendEranings = promotionEarnings;
        recommendUser.setRemainingSum(recommendUser.getRemainingSum()+recommendEranings);
        boolean d = adminUserService.updateById(recommendUser);
        //添加资金来往明细
        boolean dd = tbFundInfoService.save(new TbFundInfo().setUserId(recommendUser.getId())//用户id
                .setFundType(1)//资金流向，0为支出，1为收入
                .setMoney(recommendEranings)//金额
                .setMoneyPurpose(1)//金额用途
                .setPurposeInfo("推荐推广收益")//用途说明
                .setAddTime(new Date()));//添加时间
        if(!d&&!dd){
            //将失败单号存入list集合
            failureOrderList.add(order.getId());
            //result = false;
            //msg = "推广收益更新失败！";
            //异常信息返回
            //throw new Exception("推广收益更新失败！");
        }
        //剩余的是平台收益
        double earings = balance - agencyEarnings - recommendEranings;
        //存入平台收益统计
        boolean e = tbTerraceEraningsStatisticsService.save(new TbTerraceEraningsStatistics().setEranings(earings).setToday(new Date()));
        if(!e){
            //将失败单号存入list集合
            failureOrderList.add(order.getId());
        }

    }

}
