import Index from '@/pages/frontend/index.vue'
import Login from '@/pages/frontend/login.vue'
import { createRouter, createWebHashHistory } from 'vue-router'

// 统一在这里声明所有路由
const routes = [
    {
        path: '/', // 路由地址
        component: Index, // 对应组件
        meta: { // meta 信息
            title: 'WebMall 首页' // 页面标题
        }
    },
    {
        path: '/index',
        component: Index,
        meta: {
            title: 'WebMall 首页'
        }
    },
    {
        path: '/login', // 路由地址
        component: Login, // 对应组件
        meta: { // meta 信息
            title: 'Login 首页' // 页面标题
        }
    }
]

// 创建路由
const router = createRouter({
    // 指定路由的历史管理方式，hash 模式指的是 URL 的路径是通过 hash 符号（#）进行标识
    history: createWebHashHistory(),
    // routes: routes 的缩写
    routes, 
})

// ES6 模块导出语句，它用于将 router 对象导出，以便其他文件可以导入和使用这个对象
export default router