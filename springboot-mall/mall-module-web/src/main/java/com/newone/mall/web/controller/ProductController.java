package com.newone.mall.web.controller;

import com.newone.mall.common.utils.Response;
import com.newone.mall.web.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private ProductService productService;

    @GetMapping("/queryAll")
    public Response queryAllProducts() {
        return productService.queryAllProducts();
    }

    @GetMapping("/queryOne/{id}")
    public Response findProductById(@PathVariable Integer id) {
        return productService.findProductById(id);
    }
}
