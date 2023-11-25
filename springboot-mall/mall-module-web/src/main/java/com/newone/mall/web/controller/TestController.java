package com.newone.mall.web.controller;

import com.newone.mall.common.utils.JsonUtil;
import com.newone.mall.common.utils.Response;
import com.newone.mall.web.model.TestUser;
import com.newone.mall.common.aspect.ApiOperationLog;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

@RestController
@Slf4j
@Api(tags = "首页模块")
public class TestController {

    @PostMapping("/admin/test")
    @ApiOperationLog(description = "测试接口")
    @ApiOperation(value = "测试接口")
    public Response test(@RequestBody @Validated TestUser testUser) {
        // 打印入参
        log.info(JsonUtil.toJsonString(testUser));

        // 设置三种日期字段值
        testUser.setCreateTime(LocalDateTime.now());
        testUser.setUpdateDate(LocalDate.now());
        testUser.setTime(LocalTime.now());

        return Response.success(testUser);
    }

}
