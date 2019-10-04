package com.zfl.jwt;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zfl.entity.AdminUser;
import com.zfl.exception.GlobalException;
import com.zfl.result.CodeMsg;
import com.zfl.service.AdminUserService;
import com.zfl.util.SpringContextUtil;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 获取当前登录用户工具类
 * @author Wang926454
 * @date 2019/3/15 11:45
 */
@Component
public class UserJwtService {

    @Autowired
    private AdminUserService adminUserService;

    /**
     * 获取当前登录用户
     * @param
     * @return com.wang.model.UserDto
     * @author Wang926454
     * @date 2019/3/15 11:48
     */
    public AdminUser getUser() {
        String token = SecurityUtils.getSubject().getPrincipal().toString();
        // 解密获得Account
        String account = JWTUtil.getClaim(token, "username");
        AdminUser user = adminUserService.getOne(new QueryWrapper<AdminUser>().eq("account",account));
        // 用户是否存在
        if (user == null) {
            throw new GlobalException(CodeMsg.USER_ERROR.fillArgs(account));
        }
        return user;
    }

    /**
     * 获取当前登录用户Id
     * @param
     * @return com.wang.model.UserDto
     * @author Wang926454
     * @date 2019/3/15 11:48
     */
    public Integer getUserId() {

        return getUser().getId();
    }

    /**
     * 获取当前登录用户Token
     * @param
     * @return com.wang.model.UserDto
     * @author Wang926454
     * @date 2019/3/15 11:48
     */
    public String getToken() {
        return SecurityUtils.getSubject().getPrincipal().toString();
    }

    /**
     * 获取当前登录用户Account
     * @param
     * @return com.wang.model.UserDto
     * @author Wang926454
     * @date 2019/3/15 11:48
     */
    public String getAccount() {
        String token = SecurityUtils.getSubject().getPrincipal().toString();
        // 解密获得Account
        return JWTUtil.getClaim(token, "username");
    }
}
