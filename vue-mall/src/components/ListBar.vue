<template>
    <div class="left-nav">
        <div class="chanel-list-wrap" id="J_MAIN_CHANEL">
            <div v-for="(category, index) in categories" :key="index" class="chanel-container">
                <div class="chanel-container-inner clearfix">
                    <div class="chanel-tags-wrap">
                        <div class="chanel-title">
                            <a href="" class="atbfont">{{ category.icon }}</a>
                            <a href="" class="title">{{ category.name }}</a>
                        </div>
                        <div class="chanel-tags clearfix">
                            <a v-for="(tag, tagIndex) in category.tags" :key="tagIndex"
                                :class="{ 'red': tag.isHighlighted }">{{ tag.name }}</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
  
<script>
export default {
    data() {
        return {
            categories: [
                {
                    icon: '📷',
                    name: '数码',
                    tags: [
                        { name: '手机' },
                        { name: '耳机' },
                        { name: '冰箱' },
                        { name: '华为' },
                        { name: '洗衣机' },
                        { name: '空调' },
                        { name: '键盘', isHighlighted: true },
                        { name: '笔记本' },
                    ],
                },
                {
                    icon: '👚',
                    name: '女士',
                    tags: [
                        { name: '连衣裙冬' },
                        { name: '凉鞋' },
                        { name: '半身裙' },
                        { name: '长裙', isHighlighted: true },
                        { name: '高跟鞋' },
                        { name: '女鞋' },
                        { name: '旗袍' },
                        { name: '女装' },
                    ],
                },
                {
                    icon: '👔',
                    name: '男士',
                    tags: [
                        { name: '拖鞋' },
                        { name: '牛仔裤' },
                        { name: '潮男鞋' },
                        { name: '男鞋' },
                        { name: 'T恤' },
                        { name: '电动车' },
                        { name: '汉服' },
                        { name: '情侣装', isHighlighted: true },
                    ],
                }
            ],
        };
    },
};
</script>
  
<style scoped>
/* 设置图片的样式 */
.chanel-list-wrap {
    display: flex;
    flex-direction: column;
    /* 设置为纵向排布 */
    max-height: 250px; /* 调整最大高度 */
}

.left-nav {
    max-height: 250px; /* 调整最大高度 */
    max-width: 400px; /* 调整最大宽度 */
    margin: 0 auto;
    /* 居中显示 */
}

.chanel-container {
    flex: 0 0 auto;
    margin-bottom: 8px; /* 调整容器之间的间距 */
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s;
}

.chanel-container:hover {
    transform: scale(1.05);
}

.chanel-container-inner {
    padding: 8px;
    /* 调整内边距 */
    box-sizing: border-box;
}

.chanel-title {
    display: flex;
    align-items: center;
    margin-bottom: 4px; /* 调整标题和图标之间的间距 */
}

.atbfont {
    font-size: 18px; /* 调整图标大小 */
    margin-right: 6px; /* 调整图标和标题之间的间距 */
}

.title {
    font-size: 14px; /* 调整标题大小 */
    color: #333;
    text-decoration: none;
}

.chanel-tags {
    display: flex;
    flex-wrap: wrap;
}

.chanel-tags a {
    padding: 5px 8px; /* 调整标签的内边距 */
    margin: 3px;
    background-color: #f0f0f0;
    border-radius: 5px;
    text-decoration: none;
    color: #333;
    transition: background-color 0.3s;
}

.chanel-tags a:hover {
    background-color: #e0e0e0;
}

.red {
    background-color: #ff6700;
    color: rgb(250, 43, 215) !important;
}
</style>
  