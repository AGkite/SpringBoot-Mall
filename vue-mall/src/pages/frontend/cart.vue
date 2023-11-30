<template>
    <div class="container mx-auto p-4">
        <h1 class="text-3xl font-semibold mb-4">购物车</h1>
        <div v-if="!isLogined">
            未登录!请先登录账号！
        </div>
        <div v-else-if="cartItems.length === 0" class="text-gray-600">
            购物车是空的
        </div>
        <div v-else>
            <transition-group name="cart-item" tag="div" mode="out-in">
                <div v-for="item in cartItems" :key="item.cartId" class="cart-item">
                    <el-checkbox v-model="item.selected" @change="updateHasSelect" class="mr-4"></el-checkbox>
                    <img :src="item.image" :alt="item.productName" class="w-40 h-40 object-cover mr-4 ml-4">
                    <div class="flex-1">
                        <h2 class="text-lg font-semibold">{{ item.productName }}</h2>
                        <p class="text-gray-600">{{ item.quantity }} x ￥{{ item.price }}</p>
                    </div>
                    <el-button-group>
                        <el-button type="danger" :icon="Delete" circle @click="removeFromCart(item.productId)" />
                    </el-button-group>
                </div>
                <!-- 底部结算栏 -->
                <div class="left-20 right-20  bg-white border-t border-gray-300 p-4">
                    <div class="flex justify-between items-center">
                        <div>
                            <el-checkbox v-model="selectAll" @change="updateHasSelect">全选</el-checkbox>
                            <div :class="{ 'hidden': !hasSelect }">
                                <el-button type="danger" size="mini" @click="removeSelected">删除选中</el-button>
                            </div>
                        </div>
                        <div>
                            <span class="text-gray-600">总计：</span>
                            <span class="text-red-500">￥{{ selectedTotalAmount.toFixed(2) }}</span>
                            <el-button type="danger" @click="payment()">去结算</el-button>
                        </div>
                    </div>
                </div>
            </transition-group>
        </div>

    </div>
</template>
  
<script setup>
import { findCartList, deleteCartItem } from '@/api/frontend/cart';
import { ref, onMounted, computed, watch, watchEffect } from 'vue';
import { Delete } from '@element-plus/icons-vue';
import { useUserStore } from '@/stores/user'
import { showMessage } from '@/utils/util'
import router from '../../router';

const userStore = useUserStore();
const cartItems = ref([]);
const selectedItems = ref([]);


// 是否登录，通过 userStore 中的 userInfo 对象是否有数据来判断
// 获取 userInfo 对象所有属性名称的数组
const keys = Object.keys(userStore.userInfo)
// 若大于零，则表示用户已登录
const isLogined = ref(keys.length > 0)
// 监听用户登录状态
// 监听 userStore.userInfo.username 的变化
watch(() => userStore.userInfo.username, (newUsername) => {
    // 当用户名变化时，执行相应的逻辑
    isLogined.value = !!newUsername; // 或者使用其他逻辑来判断是否登录
});
onMounted(async () => {
    try {
        if (isLogined) {
            const response = await findCartList();
            console.log(response);
            cartItems.value = response.data.data.map(item => ({ ...item, selected: false }));
        } else {
            showMessage("未登录账号!")
        }
    } catch (error) {
        console.error('获取购物车商品失败！', error);
    }
});

const removeFromCart = async (productId) => {
    // 实现从购物车中移除商品的逻辑
    try {
        const response = await deleteCartItem(productId)
        if (response.data.success == true) {
            //刷新页面
            location.reload()
        }
    } catch (error) {
        console.log('移除购物车商品失败！', error)
    }
};

// 计算被选中的商品总金额
const selectedTotalAmount = computed(() => {
    return cartItems.value.reduce((total, item) => (item.selected ? total + item.price * item.quantity : total), 0);
});

const hasSelect = ref(false); // 新增变量，表示是否有商品被选中

// 监听商品选中状态变化
watch(cartItems, () => {
    updateHasSelect();// 更新 hasSelect 变量
});
// 更新 hasSelect 变量
const updateHasSelect = () => {
    //判断有没有商品被选中
    hasSelect.value = cartItems.value.some(item => item.selected);
    //选中了的商品信息
    selectedItems.value = cartItems.value.filter(item => item.selected)
    console.log(hasSelect.value)
    console.log(selectedItems.value)
};
// 全选状态
let selectAll = ref(false);

// 监听全选状态变化
watchEffect(() => {
    // 如果全部商品都被选中，则全选按钮也应该是选中状态
    selectAll.value = cartItems.value.every(item => item.selected);
});

// 监听全选按钮变化
watch(selectAll, (newVal) => {
    // 更新每个商品的选中状态
    cartItems.value.forEach(item => (item.selected = newVal));
});

// 删除选中商品
const removeSelected = () => {
    const selectedItems = cartItems.value.filter(item => item.selected);
    // 实现删除选中商品的逻辑
};

//支付
const payment = () => {
    const products = selectedItems.value
    if (hasSelect.value) {
        let total = selectedTotalAmount.value
        router.push({
            path: '/payment',
            query: { total,products }
        }
        )
    } else {
        showMessage("未选中任何商品！","warning")
        return ;
    }

}

</script>
  
<style scoped>
.container {
    background-color: white;
}

.cart-item {
    display: flex;
    align-items: center;
    border-bottom: 1px solid #e5e5e5;
    padding: 12px;
    transition: transform 0.3s ease-out;
}

.cart-item-enter-active,
.cart-item-leave-active {
    transition: opacity 0.5s;
}

.cart-item-enter,
.cart-item-leave-to {
    opacity: 0;
}
</style>
  