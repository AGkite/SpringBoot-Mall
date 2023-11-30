<template>
    <div class="container mx-auto p-4">
      <h1 class="text-3xl font-semibold mb-4">支付页面</h1>
  
      <div v-if="!isLogined">
        未登录!请先登录账号！
      </div>
      <div v-else>
        <el-form :model="paymentForm" label-width="80px">
          <!-- 添加收货地址、收货人和联系电话字段 -->
          <el-form-item label="收货地址">
            <el-input v-model="paymentForm.address"></el-input>
          </el-form-item>
  
          <el-form-item label="收货人">
            <el-input v-model="paymentForm.receiver"></el-input>
          </el-form-item>
  
          <el-form-item label="联系电话">
            <el-input v-model="paymentForm.contactNumber"></el-input>
          </el-form-item>
  
          <el-form-item label="支付方式">
            <el-select v-model="paymentForm.payType">
              <el-option label="未支付" value="0"></el-option>
              <el-option label="支付宝" value="1"></el-option>
              <el-option label="微信" value="2"></el-option>
            </el-select>
          </el-form-item>
  
          <el-form-item label="支付金额">
            <el-input v-model="paymentForm.totalAmount" type="number"></el-input>
          </el-form-item>
  
          <el-form-item>
            <el-button type="primary" @click="submitPayment">支付</el-button>
          </el-form-item>
        </el-form>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref } from 'vue';
  import { useUserStore } from '@/stores/user';
  import { showMessage } from '@/utils/util';
  
  const userStore = useUserStore();
  const isLogined = ref(Object.keys(userStore.userInfo).length > 0);
  const paymentForm = ref({
    address: '',
    receiver: '',
    contactNumber: '',
    payType: '0',
    totalAmount: '',
  });
  
  const submitPayment = () => {
    console.log('提交支付:', {
      address: paymentForm.value.address,
      receiver: paymentForm.value.receiver,
      contactNumber: paymentForm.value.contactNumber,
      payType: paymentForm.value.payType,
      totalAmount: paymentForm.value.totalAmount,
    });
    // 在这里可以添加支付逻辑
  };
  </script>
  
  <style scoped>
  /* 根据需要添加样式 */
  </style>
  