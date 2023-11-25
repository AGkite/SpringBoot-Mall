package com.newone.mall.web.service.impl;

import com.newone.mall.common.domain.dos.ProductDO;
import com.newone.mall.common.domain.mapper.ProductMapper;
import com.newone.mall.common.enums.ResponseCodeEnum;
import com.newone.mall.common.utils.Response;
import com.newone.mall.web.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductMapper productMapper;
    @Override
    public Response<List<ProductDO>> queryAllProducts() {
        try {
            List<ProductDO> productDOList = productMapper.selectList(null);
            // 查询成功，返回成功响应
            return Response.success(productDOList);
        } catch (Exception e) {
            // 查询过程中发生异常，返回失败响应
            return Response.fail(ResponseCodeEnum.SELECT_FAIL);
        }
    }

    @Override
    public Response findProductById(Integer id) {
        try {
            ProductDO productDO = productMapper.selectById(id);
            // 查询成功，返回成功响应
            return Response.success(productDO);
        } catch (Exception e) {
            // 查询过程中发生异常，返回失败响应
            return Response.fail(ResponseCodeEnum.SELECT_FAIL);
        }
    }
}
