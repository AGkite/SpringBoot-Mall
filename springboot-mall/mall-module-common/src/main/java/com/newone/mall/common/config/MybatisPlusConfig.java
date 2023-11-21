package com.newone.mall.common.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan("com.newone.mall.common.domain.mapper")
public class MybatisPlusConfig {
}