package com.zfl.controller.app.shipmentsapp;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageHelper;
import com.zfl.entity.*;
import com.zfl.entity.receivingappentity.AliPayRespones;
import com.zfl.entity.receivingappentity.Decliver;
import com.zfl.entity.vo.QueryVo;
import com.zfl.jwt.UserJwtService;
import com.zfl.note.MyLog;
import com.zfl.result.Result;
import com.zfl.service.*;
import com.zfl.service.payservice.AliPayService;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @program: express->DeliverController
 * @description: 用户发货控制器
 * @author: zc
 * @create: 2019-08-29 15:43
 **/
@RestController
@RequestMapping("deliver")
public class DeliverController {

    @Autowired
    private AliPayService aliPayService;

    @Autowired
    private TbUserSingleService tbUserSingleService;

    @Autowired
    private UserJwtService userJwtService;

    @Autowired
    private TbOddNumService tbOddNumService;

    @Autowired
    private TbTodayPriceService tbTodayPriceService;

    @Autowired
    private AdminUserService adminUserService;

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private TbUserInfoService tbUserInfoService;

    @Autowired
    private TbEarningsRuleService tbEarningsRuleService;//平台收益规则表

    @Autowired
    private TbVipService vipService;//vip表

    @Autowired
    private TbRecommendService tbRecommendService;//推荐表

    @Autowired
    private TbFundInfoService tbFundInfoService;//交易金额表

    @Autowired
    private TbTerraceEraningsStatisticsService tbTerraceEraningsStatisticsService;//平台收益统计

    @Autowired
    private TbCourierUnitService tbCourierUnitService;


    /**
     * @Description: 普通会员发货  添加订单
     * @Param:
     * @return:
     * @Author: zc
     * @Date: 2019/8/29 11:04
     */
    @MyLog(value = "普通会员发货")
    @PostMapping("userDeliver")
    @RequiresAuthentication
    public Result userDeliver(@RequestBody Decliver decliver){
        //验证
        decliver.validateParams();
        //获取当前登录的用户
        System.out.println(userJwtService.getUser().toString());
        //生成系统订单   4位最好
        String sysOrderNum = UUID.randomUUID().toString().replace("-", "").trim().substring(2,6);
        //先查询此用户单笔快递价格
        double orderPrice = 0;
        TbUserSingle userSingle = tbUserSingleService.getOne(new QueryWrapper<TbUserSingle>().eq("user_id", userJwtService.getUserId()));
        orderPrice = userSingle.getSingleAmount();
        String payUrl = "";
        //支付宝
        AliPayRespones aliPayRespones = new AliPayRespones();
        if (StringUtils.equals(decliver.getPayType(),"1")){
            aliPayRespones = aliPayService.getPreOrder(decliver.getGoodInfo(),orderPrice ,sysOrderNum);
        }
        //微信支付 TODO
        //添加到订单记录表中
        TbOddNum tbOddNum = new TbOddNum();
        //设置对象
        setOddNum(tbOddNum,decliver,aliPayRespones);
        tbOddNum.setUserId(userJwtService.getUserId());
        tbOddNum.setSysNum(sysOrderNum);
        tbOddNum.setPayType(Integer.valueOf(decliver.getPayType()));
        tbOddNum.setOrderArea(decliver.getOrderArea());
        tbOddNum.setPayPrice(orderPrice);//支付金额（快递金额）
        //查询快递区域，把区域代理当做快递员写入订单中
        AdminUser adminUser = adminUserService.getOne(new QueryWrapper<AdminUser>().eq("user_area",decliver.getOrderArea()).eq("user_vip",4));
        tbOddNum.setPickUpPerson(adminUser.getId());
        boolean save = tbOddNumService.save(tbOddNum);
        if (save){
            System.out.println("aliPayRespones.getPayUrl()========="+aliPayRespones.getPayUrl());
            String form=aliPayRespones.getPayUrl().replace("<script>document.forms[0].submit();</script>","");
            System.out.println("form==========="+form);
            return new Result(200,"请求成功",form);
            //return new Result(200,"请求成功","http://www.baidu.com");
        }else {
            return new Result(201,"请求失败","");
        }
    }

    @RequiresAuthentication
    @PostMapping("getAllOrderByUser")
    public Result getAllOrder(@RequestBody QueryVo queryVo){
        queryVo.setUserId(userJwtService.getUserId());
        List<TbOddNum> list = tbOddNumService.getOrderByCondition(queryVo);
        list.forEach(o->{
            //根据userId查询用户详情
            TbUserInfo tbUserInfo = tbUserInfoService.getOne(new QueryWrapper<TbUserInfo>().eq("user_id",o.getPickUpPerson()));
            o.setTbUserInfo(tbUserInfo);
        });
        return new Result(200,"请求成功！",list);
    }

    //获取当前项目连接
    private String getUrl(){
        StringBuffer url = request.getRequestURL();
        String tempContextUrl = url.delete(url.length() - request.getRequestURI().length(), url.length()).append(request.getServletContext().getContextPath()).append("/").toString();
        System.out.println("当前项目url:"+tempContextUrl);
        return tempContextUrl;
    }

    @RequiresAuthentication
    @GetMapping("inlet")
    public String list(ModelMap modelMap){

        return "index";
    }


    /**
     * @Description: 设置订单信息
     * @Param: [tbOddNum, decliver, aliPayRespones]
     * @return: void
     * @Author: zc
     * @Date: 2019/8/29 15:44
     */
    private void setOddNum(TbOddNum tbOddNum,Decliver decliver,AliPayRespones aliPayRespones ){
        tbOddNum.setAddresser(decliver.getSenAddress());//发件人信息
        tbOddNum.setRecipients(decliver.getRecipients());//收件人信息
        tbOddNum.setGoodInfo(decliver.getGoodInfo());//商品信息
        tbOddNum.setModeOfDespatch(decliver.getModeOfDespatch());//发货方式
        tbOddNum.setOrderState(0);//订单状态
        tbOddNum.setOrderArea(decliver.getOrderArea());//订单所在区域
        tbOddNum.setTripartiteOrderNum(aliPayRespones.getPayUrl());//第三方平台订单号
        tbOddNum.setSenderType(decliver.getSenderType());//寄件方式
        tbOddNum.setPayType(Integer.parseInt(decliver.getPayType()));//支付方式
        tbOddNum.setRemarks(decliver.getRemarks());//备注
        tbOddNum.setStdmode(decliver.getStdmode());//物品类型
        tbOddNum.setIsCancel(0);//
        }

    @MyLog(value = "确认取单")
    @PostMapping("gatherOrder")
    @RequiresAuthentication
    public Result gatherOrder(@RequestParam Integer id){
        //确认取单
        AdminUser adminUser = userJwtService.getUser();
        if(adminUser==null){
            return new Result<>(201,"请先登录","");
        }
        TbOddNum tbOddNum = tbOddNumService.getById(id);
        if(tbOddNum==null){
            return new Result<>(201,"此订单不存在","");
        }
        //根据userId查询此快递员的每单收益金额
        double unit = tbCourierUnitService.getOne(new QueryWrapper<TbCourierUnit>().eq("user_id",adminUser.getId())).getUnit();
        adminUser.setRemainingSum(adminUser.getRemainingSum()+unit);
        boolean save = adminUserService.updateById(adminUser);
        if(!save)return new Result<>(201,"取单失败！","");
        tbOddNum.setOrderState(4);//确认取单
        boolean uo = tbOddNumService.updateById(tbOddNum);
        if(!uo){
            return new Result<>(201,"取单失败！","");
        }
        return new Result<>(200,"取单成功！","");
    }

    @MyLog(value = "取消订单")
    @PostMapping("cancelOrder")
    @RequiresAuthentication
    public Result cancelOrder(@RequestParam Integer id){
        //取消订单
        AdminUser adminUser = userJwtService.getUser();
        if(adminUser==null){
            return new Result<>(201,"请先登录","");
        }
        TbOddNum tbOddNum = tbOddNumService.getById(id);
        if(tbOddNum==null){
            return new Result<>(201,"此订单不存在","");
        }
        //做收益回收
        //首先判断此订单状态
        if(tbOddNum.getOrderState()!=0){//订单状态不为零则说明已经付款
            //获取系统当前时间，与下单时间比较，不在同一天，则需要做收益回收，在同一天则不需要。
            Date date = new Date();//系统当前时间
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date addTime = tbOddNum.getAddTime();
            if(!sdf.format(date).equals(sdf.format(addTime))){//不在同一天，则需要做收益回收
                //获取当前区域当天快递公司的报价
                TbTodayPrice tbTodayPrice = tbTodayPriceService.getOne(new QueryWrapper<TbTodayPrice>().like("today",sdf.format(new Date()))
                        .eq("area",tbOddNum.getOrderArea())
                        .eq("tracking",tbOddNum.getTrackingCompany()));
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
                tbTerraceEraningsStatistics.setEranings(-trackingPaymetEarnings);
                tbTerraceEraningsStatistics.setToday(new Date());
                boolean a = tbTerraceEraningsStatisticsService.save(tbTerraceEraningsStatistics);
                if(!a){
                    return new Result<>(201,"订单取消失败！",tbOddNum);
                }
                //余额收益
                double balance = tbOddNum.getPayPrice()- userPrice;
                //接下来从余额收益继续计算计算代理、vip收益和推广收益
                //先计算代理收益，
                AdminUser agencyUser = adminUserService.getById(tbOddNum.getPickUpPerson());//代理人、快递员
                double agencyEarnings = vipService.getById(4).getVipPercentage();
                agencyUser.setRemainingSum(agencyUser.getRemainingSum()-agencyEarnings);
                boolean c = adminUserService.updateById(agencyUser);
                //添加资金来往明细
                boolean cc = tbFundInfoService.save(new TbFundInfo().setUserId(agencyUser.getId())//用户id
                        .setFundType(0)//资金流向，0为支出，1为收入
                        .setMoney(agencyEarnings)//金额
                        .setMoneyPurpose(2)//金额用途
                        .setPurposeInfo("取消订单")//用途说明
                        .setAddTime(new Date()));//添加时间
                if(!c&&!cc){
                    return new Result<>(201,"订单取消失败！",tbOddNum);
                }
                //接下来计算推广收益
                String recommendUserId = tbRecommendService.getOne(new QueryWrapper<TbRecommend>().eq("recommended",tbOddNum.getUserId())).getRecommend();
                AdminUser recommendUser = adminUserService.getById(recommendUserId);//推荐人
                double promotionEarnings = vipService.getOne(new QueryWrapper<TbVip>().eq("id",recommendUser.getUserVip())).getPromotionEarnings();
                //推广收益
                double recommendEranings = promotionEarnings;
                recommendUser.setRemainingSum(recommendUser.getRemainingSum()+recommendEranings);
                boolean d = adminUserService.updateById(recommendUser);
                //添加资金来往明细
                boolean dd = tbFundInfoService.save(new TbFundInfo().setUserId(recommendUser.getId())//用户id
                        .setFundType(0)//资金流向，0为支出，1为收入
                        .setMoney(recommendEranings)//金额
                        .setMoneyPurpose(1)//金额用途
                        .setPurposeInfo("取消订单")//用途说明
                        .setAddTime(new Date()));//添加时间
                if(!d&&!dd){
                    return new Result<>(201,"订单取消失败！",tbOddNum);
                }
                //剩余的是平台收益
                double earings = balance - agencyEarnings - recommendEranings;
                //存入平台收益统计
                boolean e = tbTerraceEraningsStatisticsService.save(new TbTerraceEraningsStatistics().setEranings(-earings).setToday(new Date()));
                if(!e){
                    return new Result<>(201,"订单取消失败！",tbOddNum);
                }
            }
        }
        tbOddNum.setIsCancel(1);//取消订单
        tbOddNum.setOrderState(-1);//订单状态改为已过期
        boolean uo = tbOddNumService.updateById(tbOddNum);
        if(!uo){
            return new Result<>(201,"订单取消失败！",tbOddNum);
        }

        return new Result<>(200,"订单取消成功！",tbOddNum);
    }
}
