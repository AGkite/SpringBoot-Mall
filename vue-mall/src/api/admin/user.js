import axios from "@/axios";

// 登录接口
export function login(username, password) {
    return axios.post("/login", {username, password})
}