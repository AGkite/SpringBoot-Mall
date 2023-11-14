package com.newone.mall.web;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class MallModuleWebApplicationTests {

    @Test
    void contextLoads() {
        log.info("测试打印log");
        log.info("生成日志文件");
    }

}
