package com.newone.mall.web.controller;

import com.newone.mall.common.aspect.ApiOperationLog;
import com.newone.mall.common.utils.Response;
import com.newone.mall.web.service.UserService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {
    @Autowired
    private UserService userService;

    @PostMapping("/user/info")
    @ApiOperation(value = "获取用户信息")
    @ApiOperationLog(description = "获取用户信息")
    public Response findUserInfo() {
        return userService.findUserInfo();
    }

    @PostMapping("/register")
    @ApiOperation(value = "用户注册")
    @ApiOperationLog(description = "用户注册")
    public Response registerUser(@RequestParam String username, @RequestParam String password, @RequestParam String confirmPassword) {
        if (!password.equals(confirmPassword)) {
            return Response.fail("两次输入的密码不相等");
        }
        userService.registerUser(username,password);
        return Response.success();
    }
}
