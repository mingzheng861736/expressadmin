package com.xiaoshu.admin.controller.genercontroller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.xiaoshu.admin.entity.*;
import com.xiaoshu.admin.entity.vo.OrderDetailVo;
import com.xiaoshu.admin.entity.vo.OrderSearchVo;
import com.xiaoshu.admin.service.*;
import com.xiaoshu.common.annotation.SysLog;
import com.xiaoshu.common.base.PageData;
import com.xiaoshu.common.result.Result;
import com.xiaoshu.common.util.HttpUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.jsoup.Connection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping("admin/order")
public class OrderController {

    @Autowired
    private TbOddNumService tbOddNumService;

    @Autowired
    private TbTrackingService tbTrackingService;

    @Autowired
    private AdminUserService adminUserService;

    @Autowired
    private TbPayTypeService tbPayTypeService;

    @Autowired
    private TbAreaService tbAreaService;


    @ResponseBody
    @GetMapping("logistics")
    public Result logistics(String id){
        System.out.println(id);
        //查询该订单状态是否为已出单
        TbOddNum oddNumServiceById = tbOddNumService.getById(id);
        if (oddNumServiceById.getOrderState() < 2 ){
            return new Result(201,"该订单还没出单，无法查询物流信息","");
        }
        //请求api获取物流信息
        String apiUrl = "http://127.0.0.1:8080/expressage/findExpressageInfo";
        String paramsJson = oddNumServiceById.getTrackingNumber();
        Connection.Response response = null;
        try {
            response = HttpUtils.post(apiUrl, paramsJson);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return new Result(200,"查询成功",response.body());
    }


    /**
    * @Description: 订单详细信息
    * @Param: [id, modelMap]
    * @return: java.lang.String
    * @Author: zc
    * @Date: 2019/9/5 11:33
    */
    @GetMapping("getLogistics")
    public String getLogistics(String id, ModelMap modelMap){
        TbOddNum tbOddNum = tbOddNumService.getById(id);
        OrderDetailVo orderDetailVo = tbOddNumService.getOrderDetail(tbOddNum);
        modelMap.put("orderDetailVo",orderDetailVo);
        return "admin/order/orderdetail";
    }

    /**
    * @Description: 视图跳转
    * @Param: [modelMap]
    * @return: java.lang.String
    * @Author: zc
    * @Date: 2019/9/5 11:34
    */
    @GetMapping("list")
    @SysLog("跳转订单列表页面")
    public String list(ModelMap modelMap){
        //查询代理
        List<AdminUser> adminUsers = adminUserService.list(new QueryWrapper<AdminUser>()
                .eq("user_type", 1)
                .eq("status", 1));
        //查询支付方式
        List<TbPayType> payTypes = tbPayTypeService.list(null);
        //查询区域
        List<TbArea> areas = tbAreaService.list(null);
        modelMap.put("adminUsers",adminUsers);
        modelMap.put("payTypes",payTypes);
        modelMap.put("areas",areas);
        return "admin/order/orderList";
    }


    @RequiresPermissions("sys:order:list")
    @PostMapping("list")
    @ResponseBody
    public PageData<TbOddNum> list(@RequestParam(value = "page",defaultValue = "1")Integer page,
                                   @RequestParam(value = "limit",defaultValue = "10")Integer limit,
                                   OrderSearchVo orderSearchVo){

        PageData<TbOddNum> tbOddNumPageData = tbOddNumService.listByCondition(page, limit, orderSearchVo);

        return tbOddNumPageData;
    }

    @GetMapping("detail")
    public String detail(String id, ModelMap modelMap){
        TbOddNum tbOddNum = tbOddNumService.getById(id);
        OrderDetailVo orderDetailVo = tbOddNumService.getOrderDetail(tbOddNum);
        modelMap.put("orderDetailVo",orderDetailVo);
        return "admin/order/orderdetail";
    }

    @RequiresPermissions("sys:order:edit")
    @GetMapping("inputTrack")
    public String inputTrack(String id, ModelMap modelMap){
        TbOddNum tbOddNum = tbOddNumService.getById(id);
        modelMap.put("isPay",true);
        //判断订单是否是已支付状态
        if (tbOddNum.getOrderState() == 0){
            modelMap.put("isPay",false);
        }
        modelMap.put("tbOddNum",tbOddNum);
        //查询快递公司
        List<TbTracking> trackings = tbTrackingService.list(new QueryWrapper<TbTracking>().eq("tracking_state", 1));
        modelMap.put("trackings",trackings);
        List<AdminUser> adminUsers = adminUserService.list(new QueryWrapper<AdminUser>()
                .eq("user_type", 1)
                .eq("status", 1));
        modelMap.put("pickUpPersons",adminUsers);
        return "admin/order/inputOrderTrack";
    }

    @RequiresPermissions("sys:order:edit")
    @PostMapping("submitTrack")
    @ResponseBody
    public Result submitTrack(@RequestBody TbOddNum tbOddNum){
        // 此处提交的时候应查询该订单的支付状态 TODO
        TbOddNum targetOrder = tbOddNumService.getById(tbOddNum.getId());
        targetOrder.setAddTime(new Date());
        //查询该区域代理
        String orderArea = targetOrder.getOrderArea();
        if (tbOddNum.getPickUpPerson() == null){
            //查询出代理
            List<AdminUser> adminUsers = adminUserService.list(new QueryWrapper<AdminUser>()
                    .eq("user_area", orderArea)
                    .eq("user_type", 1)
                    .eq("status", 1));
            if (adminUsers.size() == 0){
                return new Result(2,"该区域还没有取件人","");
            }
            //获取当前时间的毫秒数作为随机数种子
            long t = System.currentTimeMillis();
            Random r1 = new Random(t);
            targetOrder.setPickUpPerson(adminUsers.get(r1.nextInt(adminUsers.size())).getId());
        }
        targetOrder.setOrderState(2);
        targetOrder.setOutOddNumTime(new Date());
        targetOrder.setTrackingNumber(tbOddNum.getTrackingNumber());
        targetOrder.setTrackingCompany(tbOddNum.getTrackingCompany());
        boolean update = tbOddNumService.updateById(targetOrder);
        if (update){
            return new Result(0,"出单成功","");
        }else {
            return new Result(1,"出单失败","");
        }
    }

}
