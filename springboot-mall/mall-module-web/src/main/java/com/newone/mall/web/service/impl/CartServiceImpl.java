package com.newone.mall.web.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.newone.mall.common.domain.dos.CartDO;
import com.newone.mall.common.domain.dos.ProductDO;
import com.newone.mall.common.domain.dos.UserDO;
import com.newone.mall.common.domain.mapper.CartMapper;
import com.newone.mall.common.domain.mapper.UserMapper;
import com.newone.mall.common.utils.Response;
import com.newone.mall.web.service.CartService;
import com.newone.mall.web.service.ProductService;
import com.newone.mall.web.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
@Slf4j
public class CartServiceImpl implements CartService {

    @Autowired
    private CartMapper cartMapper;

    @Autowired
    private UserService userService;

    @Autowired
    private ProductService productService;

    @Override
    public List<CartDO> getCartByUserId(Integer userId) {
        return cartMapper.selectByUserId(userId);
    }

    @Override
    public List<CartDO> getCart() {
        UserDO user = userService.findUserByName();
        if (user != null) {
            return cartMapper.selectByUserId(user.getUserId());
        }
        return null;
    }

    @Override
    public int addToCart(Integer productId, int quantity) {
        UserDO user = userService.findUserByName();
        if (user != null) {
            // 查询用户购物车中是否已存在该商品
            CartDO existingCartItem = cartMapper.selectOne(new QueryWrapper<CartDO>()
                    .eq("user_id", user.getUserId())
                    .eq("product_id", productId));

            if (existingCartItem != null) {
                // 如果商品已存在，更新数量
                existingCartItem.setQuantity(existingCartItem.getQuantity() + quantity);
                existingCartItem.setModifyDate(LocalDateTime.now());
                return cartMapper.updateById(existingCartItem);
            } else {
                // 如果商品不存在，插入新的购物车记录
                Response productDO = productService.findProductById(productId);
                ProductDO product = (ProductDO) productDO.getData();

                CartDO cartDO = CartDO.builder()
                        .userId(user.getUserId())
                        .productId(productId)
                        .productName(product.getProductName())
                        .image(product.getImage())
                        .quantity(quantity)
                        .price(product.getPrice())
                        .createDate(LocalDateTime.now())
                        .modifyDate(LocalDateTime.now())
                        .build();

                return cartMapper.insert(cartDO);
            }
        }
        return -1;
    }


    @Override
    public int deleteCartItem(Integer productId) {
        UserDO user = userService.findUserByName();
        Integer userId = user.getUserId();
        QueryWrapper<CartDO> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_id",userId).eq("product_id",productId);
        return cartMapper.delete(queryWrapper);
    }
}
