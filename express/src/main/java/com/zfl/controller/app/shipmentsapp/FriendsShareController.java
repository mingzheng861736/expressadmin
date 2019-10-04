package com.zfl.controller.app.shipmentsapp;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zfl.entity.AdminUser;
import com.zfl.jwt.UserJwtService;
import com.zfl.result.Result;
import com.zfl.service.AdminUserService;
import com.zfl.util.IpUtil;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

/**
 * @author sunzhenpeng
 * @data 2019/8/30
 * @description 分享好友
 */
@RestController
@RequestMapping("/friendsShare")
public class FriendsShareController {

    @Autowired
    private AdminUserService adminUserService;

    @Autowired
    private UserJwtService userJwtService;

    /**
     * @Description 二维码分享，根据邀请码查询用户信息
     * @author sunzhenpeng
     * @date 2019/8/30
     * @param
     * @return com.zfl.result.Result
     */
    @GetMapping("/QrCodeSharing/{inviteCode}")
    public Result QrCodeSharing(@PathVariable("inviteCode") String inviteCode){
        AdminUser user = adminUserService.getOne(new QueryWrapper<AdminUser>().eq("user_invite_code",inviteCode));
        if(user==null){
            return new Result(201,"查询失败！",user);
        }
        return new Result(200,"查询成功！",user);
    }


    @RequiresAuthentication
    @PostMapping("/getInviteCode")
    public Result getInviteCode(HttpServletRequest request){
        //获取当前用户
        AdminUser adminUser = userJwtService.getUser();
        if(adminUser==null){
            return new Result(201,"请先登录","");
        }
        return new Result(200,"查询成功！",adminUser.getUserInviteCode());
    }


}
