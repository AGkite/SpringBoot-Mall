import '@/assets/main.css'

import { createApp } from 'vue'
import App from '@/App.vue'
// 导入路由
import router from '@/router'

const app = createApp(App)

// 应用路由
app.use(router)
app.mount('#app')