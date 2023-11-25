import '@/assets/main.css'
import 'animate.css'

import { createApp } from 'vue'
import App from '@/App.vue'
//导入Pinia
import { createPinia } from 'pinia'
//Pinia数据持久化
import piniaPluginPersistedstate from 'pinia-plugin-persistedstate'
import VueAwesomeSwiper from 'vue-awesome-swiper'
// 导入路由
import router from '@/router'
//导入Element Plus图标
import * as ElementPlusIconsVue from '@element-plus/icons-vue'

const app = createApp(App)

const pinia = createPinia()
pinia.use(piniaPluginPersistedstate)
//引入图标
for (const [key,component] of Object.entries(ElementPlusIconsVue)) {
    app.component(key,component)
}
app.use(VueAwesomeSwiper)
//应用pinia
app.use(pinia)
// 应用路由
app.use(router)
app.mount('#app')