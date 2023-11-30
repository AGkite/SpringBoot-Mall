<template>
  <div>
    <el-cascader :options="options" v-model="selectedOptions" @change="handleChange"></el-cascader>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import pcas from "./pcas/pcas-code.json";

const options = pcas;
const selectedOptions = ref([]);

const handleChange = (value) => {
  console.log(value);
};
</script>

<style scope>
/* 根据需要添加样式 */
</style>
