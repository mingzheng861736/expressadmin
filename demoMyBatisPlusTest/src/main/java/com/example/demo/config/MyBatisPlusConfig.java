package com.example.demo.config;

import com.alibaba.druid.pool.DruidDataSource;
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
 *@Date:
 */
@Configuration
@MapperScan("com.example.demo.mapper")
public class MyBatisPlusConfig {

    @Bean
    @ConfigurationProperties(prefix = "spring.datasource")
    public DataSource dataSource(){
        return new DruidDataSource();
    }
}