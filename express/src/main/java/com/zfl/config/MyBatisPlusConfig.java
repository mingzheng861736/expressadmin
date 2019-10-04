package com.zfl.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

/**
 *@Author: ZC
 *@param: 无参
 *@return: 无返回值
 *@Description: mybatis-plus配置类   扫描MyBatis的Mapper接口所在的包
 *@Date: 2019/7/8 10:51
 */
@Configuration
@MapperScan("com.zfl.mapper")
public class MyBatisPlusConfig {

    @Bean
    @ConfigurationProperties(prefix = "spring.datasource")
    public DataSource dataSource(){
        return new DruidDataSource();
    }

    /**
     * 分页
     * @return
     */
    @Bean
    public PaginationInterceptor paginationInterceptor(){
        return new PaginationInterceptor();
    }


}