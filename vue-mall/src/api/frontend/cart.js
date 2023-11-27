import { NotInterceptorInstance } from '@/axios'

//加入购物车接口
export function addToCart(productId,quantity) {
    return NotInterceptorInstance.post(`/cart/add/${productId}/${quantity}`)
}

//查看购物车商品接口
export function findCartList() {
    return NotInterceptorInstance.get(`/cart/allItems`)
}

//删除购物车中商品
export function deleteCartItem(productId) {
    return NotInterceptorInstance.delete(`/cart/del/${productId}`)
}