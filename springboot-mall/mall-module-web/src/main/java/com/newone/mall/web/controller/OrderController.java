package com.newone.mall.web.controller;

import com.newone.mall.common.aspect.ApiOperationLog;
import com.newone.mall.common.domain.dos.OrderDO;
import com.newone.mall.common.utils.Response;
import com.newone.mall.common.domain.vo.OrderProductVO;
import com.newone.mall.web.service.OrderService;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@Slf4j
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private OrderService orderService;

    @ApiOperation("添加订单")
    @ApiOperationLog(description = "添加订单")
    @PostMapping("/addOrders")
    public Response addOrders(@RequestBody List<OrderDO> orderList){
        int i = 0;
        try {
            for (OrderDO orderDO : orderList) {
                i += orderService.addOrder(orderDO);
            }
            return Response.success(i);
        } catch (Exception e) {
            log.error("订单写入失败！", e);
            return Response.fail("订单写入失败！");
        }
    }

    @ApiOperation("获取订单信息")
    @ApiOperationLog(description = "获取订单信息")
    @GetMapping("/getOrders/{userId}")
    public Response getOrders(@PathVariable Integer userId) {
//        try {
//            // 调用 Service 层获取订单信息
//            List<OrderProductVO> orderProductList = orderService.getOrderProductList(userId);
//            // 构建成功响应
//            return Response.success(orderProductList);
//        } catch (Exception e) {
//            // 捕获异常，构建失败响应
//            return Response.fail("获取订单信息失败");
//        }
        return orderService.getOrderProductList(userId);
    }

}
