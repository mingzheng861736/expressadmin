/**
 * @Title: JWTToken.java
 * @Package www.codepeople.cn.shiro
 * @Description: 
 * Copyright: Copyright (c) 2019 www.codepeople.cn Inc. All rights reserved. 
 * Website: www.codepeople.cn
 * 注意：本内容仅限于海南科澜技术信息有限公司内部传阅，禁止外泄以及用于其他的商业目 
 * @Author 刘仁
 * @DateTime 2019年4月1日 下午4:49:43
 * @version V1.0
 */

package com.zfl.jwt;

import org.apache.shiro.authc.AuthenticationToken;

/**
 * @ClassName: JWTToken
 * @Description: 
 * @Author 刘仁
 * @DateTime 2019年4月1日 下午4:49:43 
 */

public class JWTToken implements AuthenticationToken {
	
	private static final long serialVersionUID = 1L;
	// 秘钥
	private String token;
	
	public JWTToken(String token) {
		this.token = token;
	}
	@Override
	public Object getPrincipal() {
		return token;
	}

	
	@Override
	public Object getCredentials() {
		return token;
	}

}