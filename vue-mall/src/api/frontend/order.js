import { instance, NotInterceptorInstance } from '@/axios'

//添加订单
export function addOrders(orderObjects) {
    instance.post("/order/addOrders", orderObjects)
}

//查看所有订单
export function getOrders(userId) {
    return NotInterceptorInstance.get(`/order/getOrders/${userId}`)
}