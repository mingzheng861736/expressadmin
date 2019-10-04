package com.zfl.controller.app.shipmentsapp;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zfl.entity.TbOddNum;
import com.zfl.jwt.UserJwtService;
import com.zfl.result.Result;
import com.zfl.service.TbCourierUnitService;
import com.zfl.service.TbOddNumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author sunzhenpeng
 * @data 2019/9/28
 * @description 快递员 控制器
 */
@RestController
@RequestMapping("deliver")
public class CourierController {

    @Autowired
    private TbCourierUnitService tbCourierUnitService;

    @Autowired
    private UserJwtService userJwtService;

    @Autowired
    private TbOddNumService tbOddNumService;

    public Result courierEarings(){
        //获取当前登录快递员的Id
        int userId = userJwtService.getUserId();
        //根据快递员Id，查询此快递员订单
        List<TbOddNum> oddNumList = tbOddNumService.list(new QueryWrapper<TbOddNum>().eq("pick_up_person",userId)
                                                                                        .eq("is_cancel",0));
        //获取此快递员，每一单所获得的收益单价


        return new Result(200,"","");
    }
}
