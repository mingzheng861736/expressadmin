package com.xiaoshu.admin.controller.integralShoppingMall;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xiaoshu.admin.entity.TbOrder;
import com.xiaoshu.admin.service.AdminUserService;
import com.xiaoshu.admin.service.TbGoodsService;
import com.xiaoshu.admin.service.TbOrderService;
import com.xiaoshu.common.annotation.SysLog;
import com.xiaoshu.common.base.PageData;
import com.xiaoshu.common.result.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * @author sunzhenpeng
 * @data 2019/9/15
 * @description 订单管理 控制器
 */
@Controller
@RequestMapping("/admin/mall/orderManage")
public class OrderManageController {

    @Autowired
    private TbOrderService tbOrderService;

    @Autowired
    private AdminUserService adminUserService;

    @Autowired
    private TbGoodsService tbGoodsService;

    @GetMapping("inlet")
    @SysLog("跳转积分商城订单列表页面")
    public String list(ModelMap modelMap){

        return "admin/shoppingMall/orderList";
    }

    /**
     *积分商城，订单list
     * @author sunzhenpeng
     * @date 2019/9/15
     * @param page
     * @param request
     * @param limit
     * @param tbOrder
     * @return com.xiaoshu.common.base.PageData<com.xiaoshu.admin.entity.TbOrder>
     */
    @PostMapping("list")
    @ResponseBody
    public PageData<TbOrder> list (@RequestParam(value = "page",defaultValue = "1")Integer page, ServletRequest request,String startDate,String endDate,
                                   @RequestParam(value = "limit",defaultValue = "10")Integer limit, TbOrder tbOrder) throws ParseException {
        PageData<TbOrder> tbOrderList = new PageData<>();
        QueryWrapper<TbOrder> qw = new QueryWrapper<TbOrder>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");
        if(tbOrder.getOrderStatus()!=null)qw.eq("order_status",tbOrder.getOrderStatus());
        if(tbOrder.getId()!=null)qw.eq("id",tbOrder.getId());
        if(startDate!=null&&!startDate.equals(""))qw.ge("order_time",startDate);//大于等于
        if(endDate!=null&&!endDate.equals(""))qw.le("order_time",endDate);//小于等于
        IPage<TbOrder> orderPage = tbOrderService.page(new Page<TbOrder>(page,limit),qw);
        orderPage.getRecords().forEach(t->{
            t.setAdminUser(adminUserService.getById(t.getUserId()));
            t.setTbGoods(tbGoodsService.getById(t.getGoodsId()));
            if(t.getGoodsIntegralTotal()!=t.getPayIntegral()){
                t.setIsPayOff("1");//0为付清，1为未付清
            }else{
                t.setIsPayOff("0");//0为付清，1为未付清
            }

        });
        tbOrderList.setCount(orderPage.getTotal());
        tbOrderList.setData(orderPage.getRecords());
        return tbOrderList;
    }

    /**
     *订单状态变更流转
     * @author sunzhenpeng
     * @date 2019/9/15
     * @param request
     * @param id
     * @param orderStatus
     * @return com.xiaoshu.common.result.Result
     */
    @PostMapping("stateChanges")
    @ResponseBody
    public Result stateChanges (HttpServletRequest request,@RequestParam String id,@RequestParam Integer orderStatus){
        //首先根据订单Id，获取此订单
        TbOrder tbOrder = tbOrderService.getById(id);
        if(orderStatus!=tbOrder.getOrderStatus()){
            return new Result(201,"此定订单状态已变更，请刷新后确认！","");
        }
        if(orderStatus==1||orderStatus==2){
            tbOrder.setOrderStatus(orderStatus+1);
        }else if(orderStatus==0){
            return new Result(201,"未支付的订单不可做状态变更！","");
        }
        else{
            return new Result(201,"此订单状态已完成，无法继续做状态变更！","");
        }
        boolean save = tbOrderService.updateById(tbOrder);
        if(!save){
            return new Result(201,"状态变更失败！","");
        }
        return new Result(200,"状态变更成功！","");
    }

    @GetMapping("orderDetailsInlet")
    @SysLog("跳转积分商城订单详情页面")
    public String orderDetailsInlet(ModelMap modelMap,String id){
        TbOrder tbOrder = tbOrderService.getById(id);
        if(tbOrder.getGoodsIntegralTotal()!=tbOrder.getPayIntegral()){
            tbOrder.setIsPayOff("1");//0为付清，1为未付清
        }else{
            tbOrder.setIsPayOff("0");//0为付清，1为未付清
        }
        tbOrder.setTbGoods(tbGoodsService.getById(tbOrder.getGoodsId()));
        tbOrder.setAdminUser(adminUserService.getById(tbOrder.getUserId()));
        modelMap.addAttribute("tbOrder",tbOrder);
        return "admin/shoppingMall/orderDetails";
    }
}
