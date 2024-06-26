import Index from '@/pages/frontend/index.vue'
import Login from '@/pages/frontend/login.vue'
import Detail from '@/components/ProductDetail.vue'
import Cart from '@/pages/frontend/cart.vue'
import Category from '@/pages/frontend/category.vue'
import Register from '@/pages/frontend/register.vue'
import FeedBack from '@/pages/frontend/feedback.vue'
import Payment from '@/pages/frontend/payment.vue'
import Order from '@/pages/frontend/order.vue'
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
    },
    {
        path: '/register',
        component: Register,
        meta: {
            title: 'Register 注册'
        }
    },
    {
        path: '/detail/:productId',
        name: 'detail',
        component: Detail,
        meta: {
            title: 'ProductDetail 商品详情'
        }
    },
    {
        path: '/cart',
        component: Cart,
        meta: {
            title: 'Cart 购物车'
        }
    },
    {
        path: '/category',
        component: Category,
        meta: {
            title: 'Category 商品分类'
        }
    },
    {
        path: '/feedback',
        component: FeedBack,
        meta: {
            title: 'FeedBack 反馈'
        }
    },
    {
        path: '/payment/:total/:selectedItems',
        name: 'selectedItems',
        component: Payment,
        
        meta: {
            title: 'Payment 支付'
        }
    },
    {
        path: '/order/:orderObjects',
        name: 'order',
        component: Order,
        props: true,
        meta: {
            title: 'Order 订单'
        }
    },
    {
        path: '/order',
        component: Order,
        props: true,
        meta: {
            title: 'Order 订单'
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