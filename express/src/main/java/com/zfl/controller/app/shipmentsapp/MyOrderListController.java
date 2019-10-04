package com.zfl.controller.app.shipmentsapp;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zfl.entity.*;
import com.zfl.jwt.UserJwtService;
import com.zfl.note.MyLog;
import com.zfl.result.Result;
import com.zfl.service.*;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author sunzhenpeng
 * @data 2019/9/10
 * @description app我的订单 控制器
 */
@RestController
@RequestMapping("myOrder")
public class MyOrderListController {

    @Autowired
    private TbOddNumService tbOddNumService;

    @Autowired
    private UserJwtService userJwtService;

    @Autowired
    private AdminUserService adminUserService;

    @Autowired
    private TbAreaService tbAreaService;

    @Autowired
    private TbTrackingService tbTrackingService;

    @Autowired
    private TbPayTypeService tbPayTypeService;

    @Autowired
    private TbSenderService tbSenderService;

    @Autowired
    private TbUserInfoService tbUserInfoService;

    /**
     *获取当前用户的订单列表
     * @author sunzhenpeng
     * @date 2019/9/10
     * @return com.zfl.result.Result
     */
    @MyLog(value = "获取当前用户的订单列表")
    @PostMapping("getOrderList")
    @RequiresAuthentication
    public IPage<TbOddNum>  getOrderList(HttpServletRequest request,@RequestParam Integer pageNo,@RequestParam Integer limit){
        AdminUser adminUser = userJwtService.getUser();
        Integer userId = adminUser.getId();

        Page<TbOddNum> page = new Page<>(pageNo,limit);
        IPage<TbOddNum> iPage = tbOddNumService.page(page,new QueryWrapper<TbOddNum>().eq("user_id",userId));
        iPage.getRecords().forEach(t->{
            t.setAdminUser(adminUserService.getById(t.getUserId()));//用户
            t.setTbArea(tbAreaService.getById(t.getOrderArea()));//订单所在区域
            t.setTbTracking(tbTrackingService.getById(t.getTrackingCompany()));//快递公司
            t.setTbPayType(tbPayTypeService.getById(t.getPayType()));//支付方式
            t.setTbSender(tbSenderService.getById(t.getSenderType()));//发货方式
            //根据userId查询用户详情
            TbUserInfo tbUserInfo = tbUserInfoService.getOne(new QueryWrapper<TbUserInfo>().eq("user_id",t.getPickUpPerson()));
            t.setTbUserInfo(tbUserInfo);
        });
        return iPage;
    }

    @MyLog(value = "获取订单详情")
    @PostMapping("getOrderInfo")
    @RequiresAuthentication
    public Result getOrderInfo(@RequestParam Integer id){
        Map<String,Object> map = new HashMap<>();
        AdminUser adminUser = userJwtService.getUser();
        if(adminUser==null){
            return new Result<>(201,"请先登录","");
        }
        TbOddNum tbOddNum = tbOddNumService.getById(id);
        if(tbOddNum==null){
            return new Result<>(201,"此订单不存在","");
        }
        tbOddNum.setAdminUser(adminUserService.getById(tbOddNum.getUserId()));//用户
        tbOddNum.setTbArea(tbAreaService.getById(tbOddNum.getOrderArea()));//订单所在区域
        tbOddNum.setTbTracking(tbTrackingService.getById(tbOddNum.getTrackingCompany()));//快递公司
        tbOddNum.setTbPayType(tbPayTypeService.getById(tbOddNum.getPayType()));//支付方式
        tbOddNum.setTbSender(tbSenderService.getById(tbOddNum.getSenderType()));//发货方式

        TbUserInfo tbUserInfo = tbUserInfoService.getOne(new QueryWrapper<TbUserInfo>().eq("user_id",tbOddNum.getPickUpPerson()));
        tbOddNum.setTbUserInfo(tbUserInfo);
        if(tbUserInfo==null){
            return new Result<>(201,"数据出错！","");
        }
        map.put("order",tbOddNum);
        map.put("userInfo",tbUserInfo);
        return new Result<>(200,"查询成功",map);
    }

    @MyLog(value = "根据当前收益计算订单数量")
    @PostMapping("getOrderNumByEarings")
    @RequiresAuthentication
    public Result getOrderNumByEarings (){
        AdminUser adminUser = userJwtService.getUser();
        //获取用户当前余额
        double remainingSum = adminUser.getRemainingSum();
        if(remainingSum>=0){//如果用户余额大于等于0，则说明用户没有预支积分，则无需计算直接返回
            return new Result<>(201,"没有预支积分！","");
        }

        return new Result<>(200,"查询成功！",remainingSum);
    }

    @PostMapping("getOrderNum")
    @RequiresAuthentication
    public Result getOrderNums (){
        return tbOddNumService.getOrderNum();
    }

}
