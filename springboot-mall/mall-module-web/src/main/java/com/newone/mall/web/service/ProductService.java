package com.newone.mall.web.service;

import com.newone.mall.common.utils.Response;

public interface ProductService {
    /**
     * 查询所有商品
     * @return {@link Response}
     */
    Response queryAllProducts();

    Response findProductById(Integer id);
}
