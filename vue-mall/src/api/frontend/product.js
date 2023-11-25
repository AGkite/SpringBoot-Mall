import { NotInterceptorInstance } from "@/axios";

export function getAllProducts() {
    return NotInterceptorInstance.get("/product/queryAll")
}

export function getOneProduct(id) {
    return NotInterceptorInstance.get(`/product/queryOne/${id}`)
}