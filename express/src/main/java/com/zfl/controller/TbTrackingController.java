package com.zfl.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zfl.entity.TbTracking;
import com.zfl.note.MyLog;
import com.zfl.result.Result;
import com.zfl.service.TbTrackingService;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * <p>
 * 快递公司表 前端控制器
 * </p>
 *
 * @author zc
 * @since 2019-08-28
 */
@RestController
@RequestMapping("/tb-tracking")
public class TbTrackingController {

    @Autowired
    private TbTrackingService tbTrackingService;

    @MyLog(value = "获取所有启用中的快递公司")
    @PostMapping("/getList")
    @RequiresAuthentication
    public Result trackingList (HttpServletRequest request){

        List<TbTracking> trackingList = tbTrackingService.list(new QueryWrapper<TbTracking>().eq("tracking_state",1));

        return new Result(200,"",trackingList);
    }

}
