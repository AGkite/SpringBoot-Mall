package com.newone.mall.web.controller;

import com.newone.mall.common.domain.dos.CartDO;
import com.newone.mall.common.utils.Response;
import com.newone.mall.web.service.CartService;
import io.swagger.models.auth.In;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/cart")
public class CartController {
    @Autowired
    private CartService cartService;

    @GetMapping("/allItems")
    public Response getCartByUserId(){
        List<CartDO> cartDOList = cartService.getCart();
        return Response.success(cartDOList);
    }

    @PostMapping("/add/{productId}/{quantity}")
    public Response addToCart(@PathVariable Integer productId, @PathVariable int quantity) {
        int i = cartService.addToCart(productId,quantity);
        if (i>0){
            return Response.success();
        } else {
            return Response.fail();
        }
    }

    @DeleteMapping("/del/{productId}")
    public Response deleteCartItem(@PathVariable Integer productId) {
        int i = cartService.deleteCartItem(productId);
        if (i>0){
            return Response.success();
        } else {
            return Response.fail();
        }
    }
}
