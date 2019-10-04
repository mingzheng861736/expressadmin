package com.zfl.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zfl.entity.AdminUser;
import com.zfl.entity.TbUserInfo;
import com.zfl.jwt.UserJwtService;
import com.zfl.result.Result;
import com.zfl.service.AdminUserService;
import com.zfl.service.TbUserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * 用户明细表 前端控制器
 * </p>
 *
 * @author zc
 * @since 2019-08-28
 */
@RestController
@RequestMapping("/tb-user-info")
@EnableTransactionManagement
public class TbUserInfoController {

    @Autowired
    private TbUserInfoService tbUserInfoService;

    @Autowired
    private AdminUserService adminUserService ;

    @Autowired
    private UserJwtService userJwtService;
    /**
     * @Description 根据用户Id查询用户资料
     * @author sunzhenpeng
     * @date 2019/8/30
     * @param
     * @return com.zfl.result.Result
     */
    @PostMapping("/getUserInfoById")
    public Result getUserInfoById (){
        Integer userId = userJwtService.getUserId();
        Map<String,Object> myProfile = new HashMap<>();
        TbUserInfo tbUserInfo = tbUserInfoService.getOne(new QueryWrapper<TbUserInfo>().eq("user_id",userId));
        AdminUser adminUser = adminUserService.getById(userId);
        if (adminUser == null) {
            return new Result(201,"此用户不存在",myProfile);
        }
        //参数组装
        myProfile.put("userId",adminUser.getId());//用户Id
        myProfile.put("name",adminUser.getName());//姓名、昵称
        myProfile.put("userTel","");//电话
        myProfile.put("userArea","");//所在区域
        myProfile.put("userAddress","");//详细地址
        myProfile.put("isCertification","");//是否认证
        if (tbUserInfo!=null){//tbUserInfo不为空则覆盖前面的空值
            myProfile.put("userTel",tbUserInfo.getUserTel());//电话
            myProfile.put("userArea",tbUserInfo.getUserArea());//所在区域
            myProfile.put("userAddress",tbUserInfo.getUserAddress());//详细地址
            myProfile.put("isCertification",tbUserInfo.getIsCertification());//是否认证
        }
        return new Result(200,"查询成功！",myProfile);
    }
    /**
     *功能描述
     * @author sunzhenpeng
     * @date 2019/8/30
     * @param data
     * @return com.zfl.result.Result
     */
    @PostMapping("/changeUserInfo")
    @Transactional
    public Result changeUserInfo(@RequestBody Map<String,Object> data){
        Integer userId = userJwtService.getUserId();
        AdminUser adminUser = new AdminUser();
        adminUser.setId(userId);
        adminUser.setName((String)data.get("name"));
        boolean a = adminUserService.updateById(adminUser);
        TbUserInfo tbUserInfo = tbUserInfoService.getOne(new QueryWrapper<TbUserInfo>().eq("user_id",userId));
        boolean info = false;
        if(tbUserInfo==null){
            info = true;
            tbUserInfo = new TbUserInfo();
        }
        tbUserInfo.setUserArea((String)data.get("userArea"));
        tbUserInfo.setUserAddress((String)data.get("userAddress"));
        tbUserInfo.setUserTel((String)data.get("userTel"));
        boolean b = false;
        if(info){
            tbUserInfo.setUserId(userId);
            b = tbUserInfoService.save(tbUserInfo);
        }else{
            b = tbUserInfoService.updateById(tbUserInfo);
        }
        if(a==true&&b==true){
            return new Result(200,"修改成功！",data);
        }else {
            return new Result(201,"修改失败！",data);
        }
    }
}
