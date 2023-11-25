package com.newone.mall.web.service;

import com.newone.mall.common.utils.Response;
import org.springframework.stereotype.Service;


public interface UserService {
    /**
     * 获取当前登录用户信息
     * @return
     */
    Response findUserInfo();
}
