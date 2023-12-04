package com.newone.mall.web.service;

import com.newone.mall.common.domain.dos.OrderDO;
import com.newone.mall.common.domain.vo.OrderProductVO;
import com.newone.mall.common.utils.Response;

import java.util.List;

public interface OrderService {
    int addOrder(OrderDO orderDO);
    Response getOrderProductList(Integer userId);
}
