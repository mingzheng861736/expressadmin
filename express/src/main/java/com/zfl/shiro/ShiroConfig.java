/**
 * @Title: ShiroConfig.java
 * @Package www.codepeople.cn.shiro
 * @Description: 
 * Copyright: Copyright (c) 2019 www.codepeople.cn Inc. All rights reserved. 
 * Website: www.codepeople.cn
 * 注意：本内容仅限于海南科澜技术信息有限公司内部传阅，禁止外泄以及用于其他的商业目 
 * @Author 刘仁
 * @DateTime 2019年4月1日 下午4:14:32
 * @version V1.0
 */

package com.zfl.shiro;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.Filter;

import com.zfl.jwt.JWTFilter;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;

/**
 * @ClassName: ShiroConfig
 * @Description: 
 * @Author 刘仁
 * @DateTime 2019年4月1日 下午4:14:32 
 */
@Configuration
public class ShiroConfig {

	@Bean
	public ShiroFilterFactoryBean getShiroFilterFactoryBean(@Qualifier("securityManager") DefaultSecurityManager securityManager) {
		ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
		
		// 添加自己的过滤器并且取名为jwt
		Map<String, Filter> filterMap = new HashMap<>();
		filterMap.put("jwt", new JWTFilter());
		shiroFilterFactoryBean.setFilters(filterMap);
		shiroFilterFactoryBean.setSecurityManager(securityManager);
		shiroFilterFactoryBean.setUnauthorizedUrl("/401");
		/**
         * 自定义url规则
         * http://shiro.apache.org/web.html#urls-
         */
		Map<String, String> filterRuleMap = new LinkedHashMap<String, String>();
		// 所有的请求通过我们自己的JWT filter
		filterRuleMap.put("/**", "jwt");
		// 访问401和404页面不通过我们的Filter
		filterRuleMap.put("/401", "anon");
		filterRuleMap.put("/404", "anon");
		
		shiroFilterFactoryBean.setFilterChainDefinitionMap(filterRuleMap);
		return shiroFilterFactoryBean;
	}
	
	@Bean(name = "securityManager")
	public DefaultSecurityManager getDefaultSecurityManager(@Qualifier("myRelam") MyRealm myRealm) {
		DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
		securityManager.setRealm(myRealm);
		return securityManager;
	}
	
	@Bean(name="myRelam")
	public MyRealm getMyRealm() {
		return new MyRealm();
	}
	
	 /**
     * 下面的代码是添加注解支持
     */
    @Bean
    @DependsOn("lifecycleBeanPostProcessor")
    public DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator() {
        DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator = new DefaultAdvisorAutoProxyCreator();
        // 强制使用cglib，防止重复代理和可能引起代理出错的问题
        // https://zhuanlan.zhihu.com/p/29161098
        defaultAdvisorAutoProxyCreator.setProxyTargetClass(true);
        return defaultAdvisorAutoProxyCreator;
    }

    @Bean
    public LifecycleBeanPostProcessor lifecycleBeanPostProcessor() {
        return new LifecycleBeanPostProcessor();
    }

	/**
	 *  开启shiro aop注解支持.
	 *  使用代理方式;所以需要开启代码支持;
	 *  开启 权限注解
	 *  Controller才能使用@RequiresPermissions
	 * @param securityManager
	 * @return
	 */
	@Bean
	public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(SecurityManager securityManager) {
		AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor
				= new AuthorizationAttributeSourceAdvisor();
		authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);
		return authorizationAttributeSourceAdvisor;
	}
}