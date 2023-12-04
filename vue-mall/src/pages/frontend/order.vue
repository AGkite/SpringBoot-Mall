<template>
    <div class="order-list">
        <div class="order-item" v-for="(order, index) in orders" :key="index">
            <div class="head">
                <span>下单时间: {{ order.createDate }}</span>
                <span>订单编号: 3632507138640985650</span>
                <span class="down-time">
                    <i class="iconfont icon-down-time"></i>
                    <b>付款截止: {{ order.createDate }}</b>
                </span>
            </div>
            <div class="body">
                <div class="column goods">
                    <ul>
                        <li>
                            <a class="image" >
                                <img :src="order.image" :alt="order.productName" />
                            </a>
                            <div class="info">
                                <p class="name ellipsis-2">{{ order.productName }}</p>
                            </div>
                            <div class="price">￥{{ order.price }}</div>
                            <div class="count">x{{ order.quantity }}</div>
                        </li>
                    </ul>
                </div>
                <div class="column state">
                    <p>{{ orderStatus(order.payType) }}</p>
                </div>
                <div class="column amount">
                    <p class="red">总计:{{ order.totalAmount }}</p>
                    <p>(含运费: {{ order.totalAmount }})</p>
                    <p v-if="order.payType == 0">未支付</p>
                    <p v-else-if="order.payType == 2">微信支付</p>
                    <p v-else="order.payType == 1">支付宝支付</p>
                </div>
                <div class="column action" v-if="order.payType == 0">
                    <el-button type="primary" size="small" @click="payNow(order)">立即付款</el-button>
                    <p><a @click="viewDetails(order)">查看详情</a></p>
                    <p><a @click="cancelOrder(order)">取消订单</a></p>
                </div>
            </div>
        </div>
    </div>
</template>
  
<script setup>
import { ref, onMounted } from 'vue';
import { getOrders } from '@/api/frontend/order';
import { useRoute } from 'vue-router'

const route = useRoute()
const orderObjects = JSON.parse(route.params.orderObjects)
console.log(orderObjects[0].userId)

const orders = ref([]);

onMounted(async () => {
    try {
        // 假设你有一个用户 ID，可以从 Vuex 或其他地方获取
        const userId = orderObjects[0].userId; // 请替换为实际的用户 ID
        const response = await getOrders(userId);
        console.log("order:", response)
        orders.value = response.data.data;
    } catch (error) {
        console.log("订单获取失败！", error)
    }
});

const getPaymentDeadline = (createDate) => {
    // 实现计算付款截止时间的逻辑
    // 返回格式化后的时间字符串
};

const formatCurrency = (amount) => {
    // 实现货币格式化逻辑
    // 返回格式化后的货币字符串
};

const orderStatus = (status) => {
    // 实现订单状态显示逻辑
    // 返回订单状态字符串
};

const paymentMethod = (payType) => {
    // 实现支付方式显示逻辑
    // 返回支付方式字符串
};

const payNow = (order) => {
    // 实现立即付款逻辑
};

const viewDetails = (order) => {
    // 实现查看详情逻辑
};

const cancelOrder = (order) => {
    // 实现取消订单逻辑
};
</script>

<style scoped>
.order-list {
    background: #fff;
    padding: 20px;
}

.order-item {
    margin-bottom: 20px;
    border: 1px solid #f5f5f5;
}

.order-item .head {
    height: 50px;
    line-height: 50px;
    background: #f5f5f5;
    padding: 0 20px;
    overflow: hidden;
}

.order-item .head span {
    margin-right: 20px;
}

.order-item .head span.down-time {
    margin-right: 0;
    float: right;
}

.order-item .head span.down-time i {
    vertical-align: middle;
    margin-right: 3px;
}

.order-item .head span.down-time b {
    vertical-align: middle;
    font-weight: normal;
}

.order-item .head .del {
    margin-right: 0;
    float: right;
    color: #999;
}

.order-item .body {
    display: flex;
    align-items: stretch;
}

.order-item .body .column {
    border-left: 1px solid #f5f5f5;
    text-align: center;
    padding: 20px;
}

.order-item .body .column>p {
    padding-top: 10px;
}

.order-item .body .column:first-child {
    border-left: none;
}

.order-item .body .column.goods {
    flex: 1;
    padding: 0;
    align-self: center;
}

.order-item .body .column.goods ul li {
    border-bottom: 1px solid #f5f5f5;
    padding: 10px;
    display: flex;
}

.order-item .body .column.goods ul li:last-child {
    border-bottom: none;
}

.order-item .body .column.goods ul li .image {
    width: 70px;
    height: 70px;
    border: 1px solid #f5f5f5;
}

.order-item .body .column.goods ul li .info {
    width: 220px;
    text-align: left;
    padding: 0 10px;
}

.order-item .body .column.goods ul li .info p {
    margin-bottom: 5px;
}

.order-item .body .column.goods ul li .info p.name {
    height: 38px;
}

.order-item .body .column.goods ul li .info p.attr {
    color: #999;
    font-size: 12px;
}

.order-item .body .column.goods ul li .info p.attr span {
    margin-right: 5px;
}

.order-item .body .column.goods ul li .price {
    width: 100px;
}

.order-item .body .column.goods ul li .count {
    width: 80px;
}

.order-item .body .column.state {
    width: 120px;
}


.order-item .body .column.amount {
    width: 200px;
}



.order-item .body .column.action {
    width: 140px;
}

.order-item .body .column.action a {
    display: block;
}
</style>