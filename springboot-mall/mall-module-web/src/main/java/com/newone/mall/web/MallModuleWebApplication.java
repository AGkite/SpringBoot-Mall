package com.newone.mall.web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"com.newone.mall.*"})
public class MallModuleWebApplication {

    public static void main(String[] args) {
        SpringApplication.run(MallModuleWebApplication.class, args);
    }

}
