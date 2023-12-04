package com.newone.mall.web.service.impl;

import com.newone.mall.common.domain.dos.OrderDO;
import com.newone.mall.common.domain.dos.UserDO;
import com.newone.mall.common.domain.mapper.OrderMapper;
import com.newone.mall.common.domain.mapper.OrderProductMapper;
import com.newone.mall.common.domain.vo.OrderProductVO;
import com.newone.mall.common.utils.Response;
import com.newone.mall.web.service.OrderService;
import com.newone.mall.web.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Slf4j
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private UserService userService;
    @Autowired
    private OrderProductMapper orderProductMapper;
    @Override
    @Transactional
    public int addOrder(OrderDO orderDO) {
        return orderMapper.insert(orderDO);
    }

    @Override
    public Response getOrderProductList(Integer userId) {
//        UserDO user = userService.findUserByName();
//        Integer id = user.getUserId();
        return Response.success(orderProductMapper.getOrderProductList(userId));
    }
}
