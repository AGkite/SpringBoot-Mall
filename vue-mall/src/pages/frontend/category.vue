<template>
  <div class="flex justify-center category-main">
      <el-tabs v-model="activeName" class="demo-tabs bg-white w-5/6" @tab-click="handleTabClick">
        <el-tab-pane :label="category" :name="category" v-for="category in categories" :key="category">
          <div class="grid grid-cols-1 gap-x-6 gap-y-10 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 xl:gap-x-8">
            <!-- 使用v-for动态渲染产品列表 -->
            <div v-for="product in filteredProducts" :key="product.productId" class="group border-2 rounded-md p-2"
              @click="goProductDetailPage(product.productId)">
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
        </el-tab-pane>
      </el-tabs>
  </div>
</template>
  
<script setup>
import { ref, onMounted, watch } from 'vue';
import { getAllProducts } from '@/api/frontend/product'
import { useRouter } from 'vue-router'

const router = useRouter()

// 跳转产品详情页
const goProductDetailPage = (productId) => {
  router.push('/detail/' + productId)
}
const activeName = ref('书籍');
const categories = ['书籍', '日用品', '食品', '服装', '电子数码']; // 假设这是你的分类列表

const products = ref([]);
const filteredProducts = ref([]);

onMounted(async () => {
  try {
    const response = await getAllProducts()
    products.value = response.data.data
  } catch (error) {
    console.log("请求数据失败", error)
  }
  // 在组件挂载时，初始化商品数据
  filterProductsByCategory(activeName.value);
});

watch(activeName, (newActiveName) => {
  filterProductsByCategory(newActiveName);
});

const handleTabClick = (tab) => {
  // 切换分类时，更新商品列表
  filterProductsByCategory(tab.name);
};

const filterProductsByCategory = (category) => {
  // 根据选中的分类过滤商品
  if (products.value.length > 0) {
    filteredProducts.value = products.value.filter((product) => product.category === category);
  }
};

const addToCart = (product) => {
  // 处理加入购物车的逻辑，你可以调用你的添加购物车的方法
  console.log('加入购物车', product);
};
</script>
  
<style>
.demo-tabs>.el-tabs__content {
  padding: 32px;
  color: #6b778c;
  font-size: 32px;
  font-weight: 600;
}
.el-tabs__item {
  font-size: 18px !important;
}
</style>
  
  