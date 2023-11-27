<template>
    <div class="product-list-container">
      <el-tabs v-model="activeTab" @tab-click="handleTabClick">
        <el-tab-pane :label="category" :name="category" v-for="category in categories" :key="category">
          <div class="product-items">
            <div v-for="product in filteredProducts" :key="product.productId" class="product-item">
              <img :src="product.image" :alt="product.productName" class="product-image">
              <div class="product-info">
                <h3 class="product-name">{{ product.productName }}</h3>
                <p class="product-description">{{ product.description }}</p>
                <p class="product-price">¥{{ product.price.toFixed(2) }}</p>
                <el-button type="primary" @click="addToCart(product)">加入购物车</el-button>
              </div>
            </div>
          </div>
        </el-tab-pane>
      </el-tabs>
    </div>
  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue';
  import { ElTabs, ElTabPane, ElButton } from 'element-plus';
//   import 'element-plus/lib/theme-chalk/index.css';
  
  const activeTab = ref('书籍');
  const categories = ['书籍', '日用品', '食品', '服装', '电子数码']; // 假设这是你的分类列表
  const products = [
    // 这里应该是你的商品数据，使用提供的单个商品请求响应数据
  ];
  
  const filteredProducts = ref([]);
  
  onMounted(() => {
    // 在组件挂载时，初始化商品数据
    filterProductsByCategory(activeTab.value);
  });
  
  const handleTabClick = (tab) => {
    // 切换分类时，更新商品列表
    filterProductsByCategory(tab.name);
  };
  
  const filterProductsByCategory = (category) => {
    // 根据选中的分类过滤商品
    filteredProducts.value = products.filter((product) => product.category === category);
  };
  
  const addToCart = (product) => {
    // 处理加入购物车的逻辑，你可以调用你的添加购物车的方法
    console.log('加入购物车', product);
  };
  </script>
  
  <style scoped>
  .product-list-container {
    padding: 20px;
  }
  
  .product-items {
    display: flex;
    flex-wrap: wrap;
  }
  
  .product-item {
    border: 1px solid #e5e5e5;
    padding: 10px;
    margin: 10px;
    text-align: center;
  }
  
  .product-image {
    max-width: 100%;
    height: auto;
  }
  
  .product-info {
    margin-top: 10px;
  }
  
  .product-name {
    font-size: 16px;
    font-weight: bold;
  }
  
  .product-description {
    color: #666;
  }
  
  .product-price {
    margin-top: 10px;
    font-size: 18px;
    color: #e44d26;
  }
  </style>
  
  