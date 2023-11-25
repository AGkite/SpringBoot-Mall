import { instance, NotInterceptorInstance } from "@/axios";

// 登录接口
export function login(username, password) {
    return NotInterceptorInstance.post("/login", {username, password})
}
// 获取登录用户信息
export function getUserInfo() {
    return instance.post("/user/info")
}