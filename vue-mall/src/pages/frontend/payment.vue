<template>
    <h1 class="text-3xl font-semibold mb-4 text-center">收银台</h1>
    <div class="container flex justify-center mx-auto p-4">
        <div v-if="!isLogined">
            未登录!请先登录账号！
        </div>
        <div v-else class="w-1/2">
            <el-form :model="paymentForm" label-width="80px">
                <!-- 添加收货地址、收货人和联系电话字段 -->
                <el-form-item label="收货人">
                    <el-input v-model="paymentForm.receiver"></el-input>
                </el-form-item>

                <el-form-item label="联系电话">
                    <el-input v-model="paymentForm.contactNumber"></el-input>
                </el-form-item>

                <el-form-item label="收货地址">
                    <SelectAddress />
                </el-form-item>

                <el-form-item label="支付方式">
                    <el-button type="success" plain @click="selectedPayType('1')">支付宝支付</el-button>
                    <el-button type="success" plain @click="selectedPayType('2')">微信支付</el-button>
                </el-form-item>

                <el-form-item label="支付金额">
                    <span class="total">{{ total }}元</span>
                    <!-- <span class="total">{{ $route.query.products }}元</span> -->
                </el-form-item>

                <el-form-item>
                    <el-button type="primary" class="w-[100px]" @click="submitPayment">支付</el-button>
                </el-form-item>
            </el-form>
        </div>
    </div>
</template>
  
<script setup>
import { ref, onMounted } from 'vue';
import { useUserStore } from '@/stores/user';
import { showMessage } from '@/utils/util';
import { addOrders } from '@/api/frontend/order';
import SelectAddress from '@/components/Address.vue';
import { useRoute } from 'vue-router'
import router from '@/router'

const route = useRoute()
const userStore = useUserStore();


// 在组件中获取
const total =  route.params.total;
const products = JSON.parse(route.params.selectedItems);
console.log(total)
console.log(products)
//支付方式
const payType = ref('1')

const selectedPayType = (value) => {
    payType.value = value
}

//传递给后端的订单数据
const orderProductList = products.map(product => {
    return {
        userId: product.userId,
        productId: product.productId,
        quantity: product.quantity,
        payType: payType.value, // 这里你需要填写支付方式，可以从前端获取或者后端设置
        totalAmount: product.price * product.quantity
    };
});

console.log("order:", orderProductList);

const isLogined = ref(Object.keys(userStore.userInfo).length > 0);
const paymentForm = ref({
    address: '',
    receiver: '',
    contactNumber: '',
    payType: '0',
    totalAmount: '',
});

const submitPayment =  () => {
    console.log('提交支付:', {
        address: paymentForm.value.address,
        receiver: paymentForm.value.receiver,
        contactNumber: paymentForm.value.contactNumber,
        payType: paymentForm.value.payType,
        totalAmount: paymentForm.value.totalAmount,
    });
    // 在这里可以添加支付逻辑
     addOrders(orderProductList)
    router.push({
        name: 'order',
        params: {
            orderObjects: JSON.stringify(orderProductList)
        }
    });
};
</script>
  
<style scoped>
/* 根据需要添加样式 */
.total {
    display: inline-block;
    margin: 0 6px 0 0;
    color: #ff8209;
    font-weight: 700;
    font-size: 24px;
    font-family: Arial;
    line-height: normal;
}
</style>
  