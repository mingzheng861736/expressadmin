/**
 * @Title: MyRealm.java
 * @Package www.codepeople.cn.shiro
 * @Description: 
 * Copyright: Copyright (c) 2019 www.codepeople.cn Inc. All rights reserved. 
 * Website: www.codepeople.cn
 * 注意：本内容仅限于海南科澜技术信息有限公司内部传阅，禁止外泄以及用于其他的商业目 
 * @Author 刘仁
 * @DateTime 2019年4月1日 下午4:31:33
 * @version V1.0
 */

package com.zfl.shiro;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zfl.entity.AdminRolePermission;
import com.zfl.entity.AdminUser;
import com.zfl.entity.AdminUserRole;
import com.zfl.jwt.JWTToken;
import com.zfl.jwt.JWTUtil;
import com.zfl.service.AdminRolePermissionService;
import com.zfl.service.AdminUserRoleService;
import com.zfl.service.AdminUserService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashSet;
import java.util.List;
import java.util.Set;


/**
 * @ClassName: MyRealm
 * @Description:
 * @Author 刘仁
 * @DateTime 2019年4月1日 下午4:31:33
 */

public class MyRealm extends AuthorizingRealm {

	@Autowired
	private AdminUserService userService;

	@Autowired
	private AdminUserRoleService userRoleService;

	@Autowired
    private AdminRolePermissionService roleMenuService;
	
	@Override
	public boolean supports(AuthenticationToken token) {
		return token instanceof JWTToken;
	}

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		String username = JWTUtil.getUsername(principals.toString());
		AdminUser user = userService.getOne(new QueryWrapper<AdminUser>().eq("account",username));
		SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
		//获取用户所有角色
        List<AdminUserRole> userRoleList = userRoleService.list(new QueryWrapper<AdminUserRole>()
                .eq("user_id", user.getId()));
        Set<String> roleSet = new HashSet<>();
        userRoleList.forEach((e)->roleSet.add(e.getRoleId()+""));
        simpleAuthorizationInfo.addRoles(roleSet);
        //通过角色查询用户所有的权限
        List<AdminRolePermission> roleMenus = roleMenuService.list(new QueryWrapper<AdminRolePermission>().in("role_id", roleSet));
        Set<String> menus = new HashSet<>();
        roleMenus.forEach((e)->menus.add(e.getPermissionId()+""));
		simpleAuthorizationInfo.addStringPermissions(menus);
		return simpleAuthorizationInfo;
	}

	/**
	 * 默认使用此方法进行用户正确与否验证，错误抛出异常即可
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
		String token = (String) authenticationToken.getCredentials();
		// 解密获得username，用于和数据库进行对比
		String username = JWTUtil.getClaim(token,"username");
		if (username == null) {
			throw new AuthenticationException("token 无效！");
		}
		AdminUser user = userService.getOne(new QueryWrapper<AdminUser>().eq("account",username));
		if (user == null) {
			throw new AuthenticationException("用户"+username+"不存在") ;
		}
		if (!JWTUtil.verify(token, username, user.getPass())) {
			throw new AuthenticationException("账户密码错误!");
		}
		return new SimpleAuthenticationInfo(token, token, "my_realm");
	}

}