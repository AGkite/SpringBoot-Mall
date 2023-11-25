<template>
  <div>
    <div class="swiper">
      <div class="swiper-content">
        <div class="swiper-item" v-for="(item, index) in imageurl" :key="index">
          <img :src="item.imageUrl" width="100%" />
        </div>
      </div>
      <div class="page">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
      </div>
    </div>
  </div>
  </template>
  
  <script>
  import { Swiper } from "@/utils/swiper";
  export default {
    name: "Swiper",
    data() {
      return {
        imageurl: [
          {imageUrl:"https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/shop1.jpg"},
          {imageUrl:"https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/shop2.jpg"},
          {imageUrl:"https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/shop3.jpg"},
          {imageUrl:"https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/shop4.jpg"},
        ],
      };
    },
    methods: {
      swiper() {
        new Swiper({
          content: ".swiper-content",
          swiperItem: ".swiper-item",
          page: ".page",
        });
      },
    },
  
    mounted() {
      this.swiper();
    },
  };
  </script>
  
  <style scoped>
  
  .swiper {
    height: 400px;
    width: 800px;
    position: relative;
    overflow: hidden;
    border: 2px solid #e0e0e0;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  }
  .swiper-content {
    position: absolute;
    left: 0;
    display: flex;
  }
  
  .swiper-item {
    height: 400px;
    width: 800px;
  }
  
  img {
    height: 100%;
    width: 100%;
  }
  
  .page {
    position: absolute;
    left: 50%;
    transform: translate(-50%, 0);
    bottom: 10px; /* 调整分页器位置 */
    display: flex;
    gap: 8px; /* 调整分页器间距 */
    justify-content: center; /* 居中分页器 */
  }
  
  span {
    display: inline-block;
    height: 8px; /* 缩小分页器大小 */
    width: 8px; /* 缩小分页器大小 */
    background-color: #888; /* 更浅的分页器颜色 */
    border-radius: 50%; /* 圆形分页器 */
    cursor: pointer;
  }
  
  .textItem{
    position: absolute;
    left: 20px;
    top: 20px;
    font-size: 18px;
    color: #333; /* 调整文本颜色 */
    font-weight: bold;
    font-family: Arial, sans-serif; /* 更通用的字体 */
  }
  </style>
  