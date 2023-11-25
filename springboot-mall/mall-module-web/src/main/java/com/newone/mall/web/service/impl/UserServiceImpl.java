package com.newone.mall.web.service.impl;

import com.newone.mall.common.utils.Response;
import com.newone.mall.web.model.vo.FindUserInfoRspVO;
import com.newone.mall.web.service.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    /**
     * 获取当前登录用户信息
     * @return
     */
    @Override
    public Response findUserInfo() {
        // 获取存储在 ThreadLocal 中的用户信息
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        // 拿到用户名
        String username = authentication.getName();
        return Response.success(FindUserInfoRspVO.builder().username(username).build());
    }
}
