package com.xiaoshu.admin.controller.homePage;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xiaoshu.admin.entity.*;
import com.xiaoshu.admin.service.*;
import com.xiaoshu.common.base.PageData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author sunzhenpeng
 * @data 2019/9/19
 * @description 首页，数据展示 控制器
 */
@Controller
@RequestMapping("/home_page")
public class HomePageController {
    @Autowired
    private TbAgencyApplyService tbAgencyApplyService;

    @Autowired
    private AdminUserService adminUserService;

    @Autowired
    private TbAreaService tbAreaService;

    @Autowired
    private TbTerraceEraningsStatisticsService tbTerraceEraningsStatisticsService;

    @Autowired
    private TbOddNumService oddNumService;

    @Autowired
    private TbOrderService tbOrderService;

    @Autowired
    private TbGoodsService tbGoodsService;

    /**
     *首页代理待审核列表
     * @author sunzhenpeng
     * @date 2019/9/19
     * @return com.xiaoshu.common.result.Result
     */
    @PostMapping("agencyAudit")
    @ResponseBody
    public PageData<TbAgencyApply> unreviewedOfApply(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                                     @RequestParam(value = "limit", defaultValue = "10") Integer limit, TbAgencyApply tbAgencyApply) {

            PageData<TbAgencyApply> applyPageData = new PageData<>();
            QueryWrapper<TbAgencyApply> applyWrapper = new QueryWrapper<>();
            IPage<TbAgencyApply> userPage = tbAgencyApplyService.page(new Page<>(page,limit),applyWrapper);
            userPage.getRecords().forEach(ap->{
                ap.setAdminUser(adminUserService.getById(ap.getUserId()));
                ap.setTbArea(tbAreaService.getById(ap.getAreaId()));
            });
            applyPageData.setCount(userPage.getTotal());
            applyPageData.setData(userPage.getRecords());
            return applyPageData;
        }

        /**
         *获取平台当月每天的收益记录
         * @author sunzhenpeng
         * @date 2019/9/19
         * @return com.xiaoshu.common.result.Result
         */
        @PostMapping("thisMonthEarnings")
        @ResponseBody
        public Map<String,Object> thisMonthEarnings(HttpServletRequest request){
            Map<String,Object> map = new HashMap<>();
            List<Double> list = new ArrayList<>();
            //获取当前时间
            Calendar a = Calendar.getInstance();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            int today = a.get(Calendar.DAY_OF_MONTH);
            for(int i=1;i<today;i++){
                a.set(Calendar.DATE,i);
                String date = sdf.format(a.getTime());
                TbTerraceEraningsStatistics tbTerraceEraningsStatistics = tbTerraceEraningsStatisticsService.getOne(new QueryWrapper<TbTerraceEraningsStatistics>().eq("today",date));
                double eranings = 0;
                if(tbTerraceEraningsStatistics!=null){
                    eranings = tbTerraceEraningsStatistics.getEranings();
                }
                list.add(eranings);
            }
            map.put("list",list);
            return map;
        }

    /**
     *区域快递统计
     * @author sunzhenpeng
     * @date 2019/9/20
     * @param request
     * @return java.util.List<java.util.Map<java.lang.String,java.lang.Object>>
     */
    @PostMapping("thisMonthExpressNum")
    @ResponseBody
    public List<Map<String,Object>> thisMonthExpressNum(HttpServletRequest request){

        List<Map<String,Object>> list = new ArrayList<>();
        //获取当前时间
        Calendar a = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        a.set(Calendar.DAY_OF_MONTH,1);//当月第一天
        //首先获取区域列表
        List<TbArea> arealist = tbAreaService.list(new QueryWrapper<TbArea>());
       //循环区域列表，根据区域id查询，此区域内时间段内的所有订单
        arealist.forEach(area->{
            Map<String,Object> map = new HashMap<>();
            List<TbOddNum> oddNumList = oddNumService.list(new QueryWrapper<TbOddNum>().eq("order_area",area.getId())
                    .eq("is_cancel",0).ge("add_time",a.getTime()).le("add_time",new Date()));
            map.put("value",oddNumList.size());
            map.put("name",area.getAreaName());
            list.add(map);
        });
        return list;
    }

    /**
     *首页今日订单列表
     * @author sunzhenpeng
     * @date 2019/9/20
     * @return com.xiaoshu.common.base.PageData<todayOddNum>
     */
    @PostMapping("todayOddNum")
    @ResponseBody
    public PageData<TbOddNum> todayOddNum(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                                     @RequestParam(value = "limit", defaultValue = "10") Integer limit, TbOddNum tbOddNum) {
        //获取系统当前时间减一天
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        Date today = calendar.getTime();
        PageData<TbOddNum> applyPageData = new PageData<>();
        QueryWrapper<TbOddNum> wrapper = new QueryWrapper<>();
        wrapper.ge("add_time",today);//大于等于今天凌晨
        wrapper.le("add_time",new Date());//小于等于当前时间
        IPage<TbOddNum> oddPage = oddNumService.page(new Page<TbOddNum>(page,limit),wrapper);
        oddPage.getRecords().forEach(op->{
            op.setTbAdminUser(adminUserService.getById(op.getUserId()));//用户
            op.setPickPerson(adminUserService.getById(op.getPickUpPerson()));//快递员
            op.setTbArea(tbAreaService.getById(op.getOrderArea()));//区域
        });
        applyPageData.setCount(oddPage.getTotal());
        applyPageData.setData(oddPage.getRecords());
        return applyPageData;
    }

    @PostMapping("overdueGoodsOrder")
    @ResponseBody
    public PageData<TbOrder> overdueGoodsOrder(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                          @RequestParam(value = "limit", defaultValue = "10") Integer limit, TbOrder tbOrder) {
        PageHelper.startPage(page,limit,true);
        List<TbOrder> overdueList = new ArrayList<>();
        List<TbOrder> list = tbOrderService.outstandingOrder();
        list.forEach(o->{
            //根据商品id获取商品信息
            TbGoods tbGoods = tbGoodsService.getById(o.getGoodsId());
            //获取商品分期期限
            int staging = tbGoods.getGoodsStagingPeriod();
            //获取系统当前时间
            Date thisTime = new Date();
            Calendar a = Calendar.getInstance();
            a.setTime(o.getOrderTime());
            switch (staging){
                case 6:
                    a.add(Calendar.MONTH,staging);//讲订单的下单时间增加相应月数，然后与当前时间比较
                    int b = thisTime.compareTo(a.getTime());
                    if(b<0){//比较结果大于0 则说明此订单未付清且逾期了
                        overdueList.add(o);
                    }
                    break;
                case 12:
                    a.add(Calendar.MONTH,staging);//讲订单的下单时间增加相应月数，然后与当前时间比较
                    int c = thisTime.compareTo(a.getTime());
                    if(c<0){//比较结果大于0 则说明此订单未付清且逾期了
                        overdueList.add(o);
                    }
                    break;
                case 24:
                    a.add(Calendar.MONTH,staging);//讲订单的下单时间增加相应月数，然后与当前时间比较
                    int d = thisTime.compareTo(a.getTime());
                    if(d<0){//比较结果大于0 则说明此订单未付清且逾期了
                        overdueList.add(o);
                    }
                    break;
            }
        });
        overdueList.forEach(t->{
            t.setAdminUser(adminUserService.getById(t.getUserId()));
            t.setTbGoods(tbGoodsService.getById(t.getGoodsId()));
            if(t.getGoodsIntegralTotal()!=t.getPayIntegral()){
                t.setIsPayOff("1");//0为付清，1为未付清
            }else{
                t.setIsPayOff("0");//0为付清，1为未付清
            }
        });
        PageInfo<TbOrder> pageInfo = new PageInfo<>(overdueList);
        pageInfo.getList();
        PageData<TbOrder> orderPage = new PageData<>();
        orderPage.setCount(pageInfo.getTotal());
        orderPage.setData(pageInfo.getList());
        return orderPage;
    }

}
