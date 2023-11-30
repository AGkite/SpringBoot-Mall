import qs from 'qs';
import { instance, NotInterceptorInstance } from "@/axios";

// 登录接口
export function login(username, password) {
    return NotInterceptorInstance.post("/login", { username, password })
}
// 获取登录用户信息
export function getUserInfo() {
    return instance.post("/user/info")
}
// //用户注册
// export function registerUser(username, password, confirmPassword) {
//     return NotInterceptorInstance.post("/register", { username, password, confirmPassword })
// }
// 注册用户
export function registerUser(username, password, confirmPassword) {
    const data = qs.stringify({ username, password, confirmPassword });
    return NotInterceptorInstance.post("/register", data, {
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    });
  }