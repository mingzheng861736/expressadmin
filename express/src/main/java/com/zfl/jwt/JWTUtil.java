/**
 * @Title: JWTUtil.java
 * @Package www.codepeople.cn.util
 * @Description: 
 * Copyright: Copyright (c) 2019 www.codepeople.cn Inc. All rights reserved. 
 * Website: www.codepeople.cn
 * 注意：本内容仅限于海南科澜技术信息有限公司内部传阅，禁止外泄以及用于其他的商业目 
 * @Author 刘仁
 * @DateTime 2019年4月1日 下午4:32:56
 * @version V1.0
 */

package com.zfl.jwt;

import java.io.UnsupportedEncodingException;
import java.util.Date;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTDecodeException;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.zfl.exception.GlobalException;
import com.zfl.result.CodeMsg;
import com.zfl.util.LoggerUtil;

/**
 * @ClassName: JWTUtil
 * @Description: 
 * @Author 刘仁
 * @DateTime 2019年4月1日 下午4:32:56 
 */

public class JWTUtil {
	// 过期时间24小时
	private static final long EXPRIE_TIME = 24*60*60*1000;

	public static boolean verify(String token, String username, String secret) {
		try {
			Algorithm algorithm = Algorithm.HMAC512(secret);
			JWTVerifier verifier = JWT.require(algorithm)
					.withClaim("username", username)
					.build();
			verifier.verify(token);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	/**
	 * @Title: getUsername
	 * @Description: 获取token中的信息无需secret解密也能获得
	 * @Author 刘仁
	 * @DateTime 2019年4月1日 下午4:42:39
	 * @param token
	 * @return
	 */
	public static String getUsername(String token) {
		try {
			DecodedJWT jwt = JWT.decode(token);
			return jwt.getClaim("username").toString();
		} catch (JWTDecodeException e) {
			return null;
		}
	}
	
	public static String sign(String username, String secret) throws UnsupportedEncodingException {
		Date date = new Date(System.currentTimeMillis()+EXPRIE_TIME);
		Algorithm algorithm = Algorithm.HMAC512(secret);
		// 附带username信息
		return JWT.create()
				.withClaim("username", username)
				.withExpiresAt(date)
				.sign(algorithm);
	}
	/**
	 * 获得Token中的信息无需secret解密也能获得
	 * @param token
	 * @param claim
	 * @return java.lang.String
	 * @author Wang926454
	 * @date 2018/9/7 16:54
	 */
	public static String getClaim(String token, String claim) {
		try {
			DecodedJWT jwt = JWT.decode(token);
			// 只能输出String类型，如果是其他类型返回null
			return jwt.getClaim(claim).asString();
		} catch (JWTDecodeException e) {
			LoggerUtil.logger.error("解密Token中的公共信息出现JWTDecodeException异常:" + e.getMessage());
			throw new GlobalException(CodeMsg.TOKEN_ERROR.fillArgs(e.getMessage()));
		}
	}
}