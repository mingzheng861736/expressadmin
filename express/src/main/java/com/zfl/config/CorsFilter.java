package com.zfl.config;


import org.apache.catalina.connector.RequestFacade;
import org.springframework.context.annotation.Configuration;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @program: express
 * @description: CORS跨域解决
 * @author: huzi
 * @create: 2019-09-11 14:30
 **/
@Configuration
public class CorsFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,  FilterChain chain)
            throws IOException, ServletException {
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        httpServletResponse.setHeader("Access-Control-Allow-Origin", ((RequestFacade) request).getHeader("origin"));
        httpServletResponse.setHeader("Access-Control-Allow-Headers","User-Agent,token,Origin,Cache-Control,Content-type,Date,Server,withCredentials,AccessToken,username,offlineticket,Authorization");
        httpServletResponse.setHeader("Access-Control-Allow-Credentials", "true");
        httpServletResponse.setHeader("Access-Control-Max-Age", "3600");
        httpServletResponse.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS, HEAD");

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
    }
}
