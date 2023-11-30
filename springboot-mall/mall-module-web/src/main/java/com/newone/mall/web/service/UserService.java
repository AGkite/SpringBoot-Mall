package com.newone.mall.web.service;

import com.newone.mall.common.utils.Response;
import com.newone.mall.common.domain.dos.UserDO;
import org.springframework.stereotype.Service;


public interface UserService {
    /**
     * 获取当前登录用户信息
     * @return
     */
    Response findUserInfo();

    /**
     * 获取当前登录用户
     * @return {@link UserDO}
     */
    UserDO findUserByName();

    /**
     * 用户注册
     * @param username
     * @param password
     */
    void registerUser(String username, String password);
}
