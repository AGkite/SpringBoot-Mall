package com.newone.mall.web.service.impl;

import com.newone.mall.common.domain.dos.UserDO;
import com.newone.mall.common.domain.mapper.UserMapper;
import com.newone.mall.common.utils.Response;
import com.newone.mall.jwt.utils.JwtTokenHelper;
import com.newone.mall.web.model.vo.FindUserInfoRspVO;
import com.newone.mall.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    private String username = null;
    /**
     * 获取当前登录用户信息
     * @return
     */
    @Override
    public Response findUserInfo() {
        // 获取存储在 ThreadLocal 中的用户信息
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        // 拿到用户名
        username = authentication.getName();
        System.out.println(username);
        return Response.success(FindUserInfoRspVO.builder().username(username).build());
    }

    @Override
    public UserDO findUserByName() {
        // 拿到用户名
        System.out.println(username);
        if (username != null) {
            return userMapper.findByUsername(username);
        }
        return null;
    }

    /**
     * 用户注册
     * @param username
     * @param password
     */
    @Override
    @Transactional
    public void registerUser(String username, String password) {
        // 使用 BCryptPasswordEncoder 对密码进行加密
        String encryptedPassword = passwordEncoder.encode(password);

        //创建用户对象
        UserDO userDO = UserDO.builder()
                .username(username)
                .password(encryptedPassword)
                .build();
        //将用户保存到数据库
        userMapper.insert(userDO);
    }
    //退出登录
    public void logout() {
        username = null;
    }
}
