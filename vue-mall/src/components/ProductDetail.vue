<template>
  <div class="product-details-container">
    <!-- 产品图片 -->
    <div class="product-image">
      <img :src="product.image" :alt="product.productName" />
    </div>
    <!-- 产品信息 -->
    <div class="product-info">
      <h1 class="product-name">{{ product.productName }}</h1>
      <p class="product-description">{{ product.description }}</p>
      <p class="product-category">{{ product.category }}</p>
      <p class="product-price">{{ `$${product.price.toFixed(2)}` }}</p>
      <p class="product-stock">{{ `库存: ${product.stock}` }}</p>

      <!-- 购物数量选择 -->
      <el-input-number v-model="quantity" :min="1" :max="product.stock" class="product-quantity"/>
      
      <!-- 加入购物车 -->
      <button @click="goToCart" class="add-to-cart-button">加入购物车</button>
    </div>
  </div>
</template> 

<script setup>
import { ref, onMounted } from 'vue'
import { getOneProduct } from '@/api/frontend/product'
import { addToCart } from '@/api/frontend/cart'
import { useRoute } from 'vue-router'
import router from '@/router';

const route = useRoute()
const quantity = ref(1)
const product = ref({
  productId: 0,
  productName: "",
  description: "",
  category: "",
  price: 0,
  stock: 10,
  image: ""
})

onMounted(async () => {
  try {
    const response = await getOneProduct(route.params.productId)
    product.value = response.data.data
  } catch (error) {
    console.error('Error fetching product details:', error)
  }
})

const goToCart = async () => {
  try {
    // 调用 addToCart API，传递商品ID、数量等必要数据
    await addToCart(product.value.productId, quantity.value)
    // 成功添加到购物车后，跳转到购物车页面
    router.push('/cart');
  } catch (error) {
    console.error('添加到购物车错误:', error);
  }
}
</script>

<style scoped>
.product-details-container {
  display: flex;
  justify-content: space-evenly;
  margin: 20px;
  background-color: white;
  height: 555px;
  border-radius: 8px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.product-image img {
  max-width: 400px;
  max-height: 400px;
  object-fit: contain;
  margin-top: 30px;
  border-radius: 8px;
}

.product-info {
  max-width: 800px;
  margin-right: 100px;
  margin-top: 50px;
}

.product-name {
  font-size: 1.5rem;
  font-weight: bold;
  margin-bottom: 24px;
}

.product-description {
  font-size: large;
  margin-bottom: 24px;
}

.product-category {
  color: #666;
  margin-bottom: 24px;
}

.product-price {
  color: rgb(247, 97, 43);
  font-size: 1.5rem;
  font-weight: bold;
  margin-bottom: 24px;
}

.product-stock {
  color: green;
  margin-bottom: 24px;
}
.product-quantity {
  display: block;
  margin-bottom: 24px;
}

.add-to-cart-button {
  padding: 10px;
  background-color: #ff8800;
  color: white;
  border: none;
  cursor: pointer;
  border-radius: 8px;
  font-size: 1.25rem;
}

.add-to-cart-button:hover {
  background-color: #fb5a49;
}
</style>  