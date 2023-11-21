package com.newone.mall.jwt.handler;

import com.newone.mall.common.utils.Response;
import com.newone.mall.jwt.utils.JwtTokenHelper;
import com.newone.mall.jwt.utils.ResultUtil;
import com.newone.mall.jwt.model.LoginRspVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
@Slf4j
public class RestAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
    @Autowired
    private JwtTokenHelper jwtTokenHelper;
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        //从authentication 对象中获取用户的UserDetails实例，这里是获取用户的用户名
        UserDetails userDetail = (UserDetails) authentication.getPrincipal();
        //通过用户名生成Token
        String username = userDetail.getUsername();
        String token = jwtTokenHelper.generateToken(username);

        //返回Token
        LoginRspVO loginRspVO = LoginRspVO.builder().token(token).build();

        ResultUtil.ok(response, Response.success(loginRspVO));

    }
}
