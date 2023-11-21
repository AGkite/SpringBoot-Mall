package com.newone.mall.web;

import com.newone.mall.common.domain.dos.UserDO;
import com.newone.mall.common.domain.mapper.UserMapper;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDateTime;
import java.util.Date;

@SpringBootTest
@Slf4j
class MallModuleWebApplicationTests {
    @Autowired
    private UserMapper userMapper;
    @Test
    void contextLoads() {
        UserDO userDO = UserDO.builder()
                .username("刘文豪")
                .password("123456")
                .phone("13533077726")
                .email("122345@qq.com")
                .icon("http://newonehow.com")
                .address("广东省广州市")
                .isDeleted(false)
                .createDate(LocalDateTime.now())
                .modifyDate(LocalDateTime.now())
                .build();
        userMapper.insert(userDO);
    }
}
