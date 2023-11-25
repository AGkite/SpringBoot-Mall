<template>
  <div class="main">
    <div class="flex">
      <ListBar class="mr-5" />
      <IndexSwiper class="mr-20" />
    </div>
    <div class="bg-white">
      <div class="mx-auto max-w-2xl px-4 py-16 sm:px-6 sm:py-24 lg:max-w-7xl lg:px-8">
        <h2 class="sr-only">Products</h2>

        <div class="grid grid-cols-1 gap-x-6 gap-y-10 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 xl:gap-x-8">
          <!-- 使用v-for动态渲染产品列表 -->
          <div v-for="product in products" :key="product.productId" class="group border-2 rounded-md p-2" @click="goProductDetailPage(product.productId)">
              <div
                class="aspect-h-1 aspect-w-1 w-full overflow-hidden rounded-lg bg-gray-200 xl:aspect-h-8 xl:aspect-w-7">
                <!-- 使用产品的图片字段 -->
                <img :src="product.image" :alt="product.productName"
                  class="h-full w-full object-cover object-center group-hover:opacity-75">
              </div>
              <h3 class="mt-4 text-base text-gray-700 font-mono">{{ product.productName }}</h3>
              <p class="mt-1 text-lg font-medium text-gray-900 text-rose-500">{{ `$${product.price}` }}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import IndexSwiper from '@/components/IndexSwiper.vue'
import ListBar from '@/components/ListBar.vue'
import { getAllProducts } from '@/api/frontend/product'
import { useRouter } from 'vue-router'
				
const router = useRouter()

// 跳转产品详情页
const goProductDetailPage = (productId) => {
    router.push('/detail/' + productId)
}
// 用于保存产品列表的数据
const products = ref([]);

// 在页面加载时获取产品列表
onMounted(async () => {
  try {
    // 调用API获取产品列表数据
    const response = await getAllProducts();
    console.log(response)
    // 将产品列表保存到products变量中
    products.value = response.data.data;
  } catch (error) {
    console.error('Error fetching products:', error);
  }
});
</script>

<style scoped>
.main {
  background-color: white;
}
</style>