<template>
  <div id="app">
    <Header />
    <div class="content">
      <router-view></router-view>
    </div>
    <Footer />
  </div>
</template>

<script setup>
import Header from '@/components/Header.vue';
import Footer from '@/components/Footer.vue'

</script>


<style scoped>
#app {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
  /* 使页面最小高度等于视窗高度，确保 Footer 始终位于底部 */
}

.content {
  flex: 1;
  /* 使内容区域占据剩余空间 */
}
</style>
