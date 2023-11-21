/*
 Navicat MySQL Data Transfer

 Source Server         : newone
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : springboot_mall

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 21/11/2023 20:35:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `order_id` int NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `user_id` int NOT NULL COMMENT '用户ID',
  `product_id` int NOT NULL COMMENT '产品ID',
  `quantity` int NOT NULL COMMENT '数量',
  `pay_type` tinyint NULL DEFAULT NULL COMMENT '支付方式:0->未支付;1->支付宝;2->微信',
  `total_amount` decimal(10, 2) NOT NULL COMMENT '总金额',
  `create_date` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '产品名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '产品描述',
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品类型',
  `price` decimal(10, 2) NOT NULL COMMENT '价格',
  `stock` int NOT NULL COMMENT '库存数量',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品图片',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '产品信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------

-- ----------------------------
-- Table structure for reviews
-- ----------------------------
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews`  (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '用户ID',
  `product_id` int NOT NULL COMMENT '产品ID',
  `review_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '评论内容',
  `rating` int NULL DEFAULT NULL COMMENT '评分',
  `create_date` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  `modify_date` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`review_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reviews
-- ----------------------------

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart`  (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '用户ID',
  `product_id` int NOT NULL COMMENT '产品ID',
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品名称',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品图片',
  `quantity` int NOT NULL COMMENT '购买数量',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '添加到购物车的价格',
  `create_date` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '加购时间',
  `modify_date` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`cart_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '购物车表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `phone` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号码',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '电子邮件',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收货地址',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除:0:未删除 1:已删除',
  `create_date` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `modify_date` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (4, 'newone', '$2a$10$vmleazkipCvV/6Cp/Vu2R.aGlGcZ4OHw8DGIjZFrb3Z4RcEfcuiRC', '13533077726', 'brownkeerro@gmail.com', 'https://newonehow.com/picture/1.jpg', '广东广州', 0, '2023-11-21 10:22:09', '2023-11-21 10:22:09');

SET FOREIGN_KEY_CHECKS = 1;
