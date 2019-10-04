package com.zfl.controller.app.shipmentsapp;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.zfl.entity.*;
import com.zfl.entity.receivingappentity.AliPayRespones;
import com.zfl.entity.receivingappentity.Decliver;
import com.zfl.entity.vo.ReceivingAppUserLogin;
import com.zfl.entity.vo.UserRegisterVo;
import com.zfl.jwt.JWTUtil;
import com.zfl.jwt.UserJwtService;
import com.zfl.note.MyLog;
import com.zfl.result.Result;
import com.zfl.service.*;
import com.zfl.service.payservice.AliPayService;
import com.zfl.util.Constants;
import com.zfl.util.Md5Util;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @program: express->LoginController
 * @description: 收货app登录控制器
 * @author: zc
 * @create: 2019-08-28 15:34
 **/
@RestController
@RequestMapping("receiving")
public class LoginController {

    @Autowired
    private AdminUserService adminUserService;

    @Autowired
    private AdminUserRoleService adminUserRoleService;

    @Autowired
    private TbAreaService tbAreaService;

    @Autowired
    private TbRecommendService tbRecommendService;

    @Autowired
    private TbVipService tbVipService;

    @Autowired
    private TbUserSingleService tbUserSingleService;

    @Autowired
    @Qualifier("captchaProducer")
    DefaultKaptcha captchaProducer;

    private static String identifying;

    @GetMapping("/getCaptcha")
    public void getCaptcha(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //设置页面不缓存
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        String verifyCode = captchaProducer.createText();
        //将验证码放到HttpSession里面
        request.getSession().setAttribute(Constants.VALIDATE_CODE, verifyCode);
        //设置输出的内容的类型为JPEG图像
        response.setContentType("image/jpeg");
        BufferedImage bufferedImage = captchaProducer.createImage(verifyCode);
        //写给浏览器
        ImageIO.write(bufferedImage, "JPEG", response.getOutputStream());
    }

    @PostMapping("register")
    @MyLog(value = "用户注册")
    public Result register(@RequestBody UserRegisterVo userRegisterVo,HttpServletRequest request){
        userRegisterVo.validateParams();
        String code = userRegisterVo.getVerifyCode();
        HttpSession session = request.getSession();
        if(session == null){
            return new Result(203,"session超时","");
        }
        String trueCode = (String)session.getAttribute(Constants.VALIDATE_CODE);
        if(StringUtils.isBlank(trueCode)){
            return new Result(203,"验证码超时","");
        }
        if(StringUtils.isBlank(code) || !trueCode.toLowerCase().equals(code.toLowerCase())){
            return new Result(203,"验证码错误","");
        }
        //判断用户选择的区域是否存在
        TbArea tbArea = tbAreaService.getById(userRegisterVo.getArea());
        if (tbArea == null){
            return new Result(203,"用户所在区域不存在","");
        }
        //根据用户账户获得用户对象
        QueryWrapper<AdminUser> qw=new QueryWrapper<>();
        qw.eq("account",userRegisterVo.getAccount());
        AdminUser detectorUser =adminUserService.getOne(qw);
        //如果没有查到对象,返回用户名错误
        if(detectorUser!=null){
            return new Result(201,"用户已存在","");
        }
        Boolean isRegister = adminUserService.registerUser(userRegisterVo);
        if (isRegister){
            String inviteCode = userRegisterVo.getInviteCode();
            if(StringUtils.isNotEmpty(inviteCode)){//注册成，则判断此次注册有没有邀请码，有邀请码则判断邀请人的邀请人数有没有达标，达标则自动升级其会员等级
                autoUpdate(inviteCode);
            }
            //用户注册成功，添加用户寄件个人默认报价
            AdminUser au = adminUserService.getOne(new QueryWrapper<AdminUser>().eq("account",userRegisterVo.getAccount()));
            TbUserSingle userSingle = new TbUserSingle();
            userSingle.setUserId(au.getId());//用户名
            userSingle.setSingleAmount(9.0);//默认价格
            userSingle.setAddTime(new Date());//时间
            tbUserSingleService.save(userSingle);
            return new Result(200,"注册成功","");
        }else {
            return new Result(202,"注册失败","");
        }
    }

    /**
    * @Description: 发货app端用户登录 
    * @Param: [appUserLogin, response] 
    * @return: com.zfl.result.Result 
    * @Author: zc
    * @Date: 2019/8/29 10:07
    */
    @PostMapping("login")
    @MyLog(value = "用户登陆")
    public Result receivingLogin(@RequestBody ReceivingAppUserLogin appUserLogin, HttpServletResponse response) throws UnsupportedEncodingException {
        appUserLogin.validateParams();
        String verifyCode = appUserLogin.getVerifyCode();
        //通过账号查询用户信息
        AdminUser user = adminUserService.getOne(new QueryWrapper<AdminUser>().eq("account",appUserLogin.getAccount()));
        if (null == user){
            return new Result(201,"用户不存在","");
        }
        //判断用户是否可以登录该app
        if (user.getUserType() != 0){
            return new Result(202,"用户不支持该app","");
        }
        //判断用户状态
        if (!user.getStatus()){
            return new Result(203,"该用户状态异常","");
        }
        String md532Str = Md5Util.md532(appUserLogin.getPassword());
        String targetPass = Md5Util.md532(md532Str+user.getUserSalt());
        if (user.getPass().equals(targetPass)) {
            String token = JWTUtil.sign(appUserLogin.getAccount(), targetPass);
            response.setHeader("token", token);
            return new Result(200,"登录成功",token);
        } else {
            return new Result(204,"用户名或密码错误","");
        }
    }

    /**
     * @Description: 快递员用户登录
     * @Param: [appUserLogin, response]
     * @return: com.zfl.result.Result
     * @Author: zc
     * @Date: 2019/8/29 10:07
     */
    @PostMapping("courierLogin")
    @MyLog(value = "快递员用户登录")
    public Result courierLogin(@RequestBody ReceivingAppUserLogin appUserLogin, HttpServletResponse response) throws UnsupportedEncodingException {
        appUserLogin.validateParams();
        String verifyCode = appUserLogin.getVerifyCode();
        //通过账号查询用户信息
        AdminUser user = adminUserService.getOne(new QueryWrapper<AdminUser>().eq("account",appUserLogin.getAccount()));
        //暂时先判断此用户是不是代理
        if(user.getUserVip()!=4){
            return new Result(201,"您还不是代理，无法登陆！","");
        }
        if (null == user){
            return new Result(201,"用户不存在","");
        }
        //判断用户是否可以登录该app
        if (user.getUserType() != 0){
            return new Result(202,"用户不支持该app","");
        }
        //判断用户状态
        if (!user.getStatus()){
            return new Result(203,"该用户状态异常","");
        }
        String md532Str = Md5Util.md532(appUserLogin.getPassword());
        String targetPass = Md5Util.md532(md532Str+user.getUserSalt());
        if (user.getPass().equals(targetPass)) {
            String token = JWTUtil.sign(appUserLogin.getAccount(), targetPass);
            response.setHeader("token", token);
            return new Result(200,"登录成功",token);
        } else {
            return new Result(204,"用户名或密码错误","");
        }
    }

    //用户邀请自动升级
    public void autoUpdate(String inviteCode ){
        AdminUser ad = adminUserService.getOne(new QueryWrapper<AdminUser>().eq("user_invite_code",inviteCode));
        TbVip vip = tbVipService.getById(ad.getUserVip());
        List<TbRecommend> recommendList = tbRecommendService.list(new QueryWrapper<TbRecommend>().eq("recommend",ad.getId()));
        int size = recommendList.size();
        if(0<=size&&size<20){
            ad.setUserVip(1);
        }else if(20<=size&&size<50){
            ad.setUserVip(2);
        }else if(size>=50){
            ad.setUserVip(3);
        }
        adminUserService.updateById(ad);




    }
}
