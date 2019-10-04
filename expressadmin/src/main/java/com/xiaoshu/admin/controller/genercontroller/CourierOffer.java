package com.xiaoshu.admin.controller.genercontroller;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xiaoshu.admin.entity.TbArea;
import com.xiaoshu.admin.entity.TbOddNum;
import com.xiaoshu.admin.entity.TbTodayPrice;
import com.xiaoshu.admin.entity.TbTracking;
import com.xiaoshu.admin.service.*;
import com.xiaoshu.common.annotation.SysLog;
import com.xiaoshu.common.base.PageData;
import com.xiaoshu.common.util.ResponseEntity;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @program: expressadmin->CourierOffer
 * @description: 快递报价
 * @author: zc
 * @create: 2019-09-04 08:41
 **/
@RequestMapping("admin/offer/")
@Controller
public class CourierOffer {

    @Autowired
    private TbTrackingService tbTrackingService;

    @Autowired
    private TbTodayPriceService tbTodayPriceService;

    @Autowired
    private TbAreaService tbAreaService;

    @Autowired
    private TbOddNumService tbOddNumService;

    @Autowired
    private AdminUserService adminUserService;

    private static String hiddenField;

    /**
    * @Description: 视图跳转
    * @Param:
    * @return:
    * @Author:
    * @Date: 2019/9/4 8:42
    */
    @RequestMapping("list")
    public String offerList(ModelMap modelMap){
        //获取快递公司信息
        List<TbTracking> trackings = tbTrackingService.list(null);
        modelMap.put("trackings",trackings);
        return "admin/offer/offerList";
    }
    @PostMapping("list")
    @ResponseBody
    public PageData getOfferList(@RequestParam(value = "page",defaultValue = "1")Integer page,
                                 @RequestParam(value = "limit",defaultValue = "10")Integer limit,
                                 String pickUpPerson,String startTime,String endTime){
        PageData pageData = new PageData();
        if(StringUtils.isBlank(pickUpPerson)&&StringUtils.isBlank(startTime)&&StringUtils.isBlank(endTime)){
            PageHelper.startPage(page,limit);
            List<TbTodayPrice> todayPrices = tbTodayPriceService.list(null);
            todayPrices.forEach(e->{
                e.setTbTracking(tbTrackingService.getById(e.getTracking()));
                e.setTbArea(tbAreaService.getById(e.getArea()));
            });
            PageInfo<TbTodayPrice> pageInfo = new PageInfo<>(todayPrices);
            pageData.setCount(pageInfo.getTotal());
            pageData.setData(pageInfo.getList());
        }else {
            QueryWrapper<TbTodayPrice> qw = new QueryWrapper<>();
            if(StringUtils.isNotBlank(pickUpPerson)){
                qw.eq("tracking",pickUpPerson);
            }
            if(StringUtils.isNotBlank(startTime)){

               if(StringUtils.isNotBlank(endTime)){
                   qw.between("add_time",startTime,endTime);
               }else {
                   SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String dateTime = df.format(new Date());
                   qw.between("add_time",startTime,dateTime);
               }
            }
            if(StringUtils.isNotBlank(endTime)){
                if(StringUtils.isNotBlank(startTime)){
                    qw.between("add_time",startTime,endTime);
                }else {
                    String time = "2019-08-08 00:00:00";
                    qw.between("add_time",time,endTime);
                }
            }

            PageHelper.startPage(page,limit);
            List<TbTodayPrice> todayPrices = tbTodayPriceService.list(qw);
            todayPrices.forEach(e->{
                e.setTbTracking(tbTrackingService.getById(e.getTracking()));
                e.setTbArea(tbAreaService.getById(e.getArea()));
            });
            PageInfo<TbTodayPrice> pageInfo = new PageInfo<>(todayPrices);
            pageData.setCount(pageInfo.getTotal());
            pageData.setData(pageInfo.getList());
        }
        return pageData;
    }


    @GetMapping("add")
    public String add(ModelMap modelMap){
        //查询所有区域
        List<TbTracking> trackings = tbTrackingService.list(null);
        //查询所有快递
        List<TbArea> tbAreas = tbAreaService.list(null);
        modelMap.put("trackings",trackings);
        modelMap.put("tbAreas",tbAreas);
        return "admin/offer/addOffer";
    }

    /**
    * @Description: 添加报价信息接口   TODO
    * @Param: [user]
    * @return: com.xiaoshu.common.util.ResponseEntity
    * @Author: zc
    * @Date: 2019/9/5 14:05
    */
    @RequiresPermissions("sys:offer:add")
    @PostMapping("add")
    @ResponseBody
    @SysLog("保存新增系统用户数据")
    public ResponseEntity add(@RequestBody String a){
        JSONObject json = (JSONObject)JSONObject.parse(a);

        TbTodayPrice todayPrice = new TbTodayPrice();
        todayPrice.setTracking((String) json.get("pickUpPerson"));
        todayPrice.setArea((String)json.get(("orderArea")));
        double t = Double.valueOf(json.getString("todayPrice"));
        double s = Double.valueOf(json.getString("todayUserPrice"));
        if(t>=s){
            return ResponseEntity.failure("操作失败");
        }
        todayPrice.setTodayPrice(t);
        todayPrice.setTodayUserPrice(s);
        Date date = new Date();
        SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd");
         String time =dateFormat.format(date);
         System.out.println(time);
         todayPrice.setToday(time);

        boolean b=tbTodayPriceService.save(todayPrice);
        if(b){
            return ResponseEntity.success("操作成功");
        }else {
            return ResponseEntity.failure("操作失败");
        }
    }

    @PostMapping("/delete")
    @ResponseBody
    public ResponseEntity delete(@RequestParam(value = "id",required = false)String id){
        if(StringUtils.isBlank(id)){
            return ResponseEntity.failure("ID不能为空");
        }
        boolean b=tbTodayPriceService.removeById(Integer.valueOf(id));
        if(b){
            return ResponseEntity.success("操作成功");
        }else {
            return ResponseEntity.failure("删除失败");
        }
    }



    @GetMapping("/inlet")
    public String offerDeail(String id, ModelMap modelMap) throws ParseException {
        hiddenField = id;
        return "admin/offer/orderByOfferDetail";
    }

    @PostMapping("/offerDeail")
    @ResponseBody
    public PageData getOfferDeail(@RequestParam(value = "page",defaultValue = "1")Integer page,
                                 @RequestParam(value = "limit",defaultValue = "10")Integer limit,
                                  String id){
        id = hiddenField;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //通过id查询相应区域，快递公司对应的订单
        TbTodayPrice tbTodayPrice = tbTodayPriceService.getById(id);
        int orderState = 5;
        List<TbOddNum> oddNums = tbOddNumService.list(new QueryWrapper<TbOddNum>()
                .eq("order_area", tbTodayPrice.getArea())//订单区域2
                .eq("tracking_company",Integer.parseInt(tbTodayPrice.getTracking()))//快递公司7
                .eq("order_state",orderState)//订单状态5
                //.like("add_time", DateUtils.dateFormat(sdf.parse(),DateUtils.DATE_PATTERN))
                .like("add_time",tbTodayPrice.getToday())//添加时间2019-09-07
                .eq("courier_cost",tbTodayPrice.getTodayPrice()));//快递公司今日报价5.0
        oddNums.forEach(e->{
            e.setTbTracking(tbTrackingService.getById(e.getTrackingCompany()));
            e.setTbArea(tbAreaService.getById(e.getOrderArea()));
            e.setTbAdminUser(adminUserService.getById(e.getUserId()));
        });
        PageHelper.startPage(page,limit);
        PageInfo<TbOddNum> pageInfo = new PageInfo<TbOddNum>(oddNums);
        pageInfo.getList();
        PageData<TbOddNum> userPageData = new PageData<>();
        /*IPage<EraningsStatistics> userPage = eraningsStatisticsService.page(new Page<>(page,limit),null);*/
        userPageData.setCount(pageInfo.getTotal());
        userPageData.setData(pageInfo.getList());
        return userPageData;
    }

}
