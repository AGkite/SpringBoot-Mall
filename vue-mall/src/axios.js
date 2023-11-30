import axios from "axios";
import { getToken } from "@/composables/auth"
// 创建 Axios 实例
const instance = axios.create({
    baseURL: "/api", // 你的 API 基础 URL
    timeout: 7000, // 请求超时时间
})
//添加请求拦截器
instance.interceptors.request.use(function (config) {
    //在发送请求之前做些什么
    const token = getToken()
    //console.log('统一添加请求头中的Token:' + token)

    //当token不为空时
    if (token) {
        //添加请求头，key为Authorization, value值的前缀为'Bearer '
        config.headers['Authorization'] = 'Bearer ' + token
    }

    return config;
}, function (error) {
    //对请求错误做些什么
    return Promise.reject(error)
});
//登录请求
const NotInterceptorInstance = axios.create({
    baseURL: "/api", // 你的 API 基础 URL
    timeout: 7000, // 请求超时时间
})
// 暴露出去
export { instance, NotInterceptorInstance };