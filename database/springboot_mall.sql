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

 Date: 04/12/2023 16:10:06
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
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '订单信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 4, 10003, 1, 0, 3585.98, NULL);
INSERT INTO `orders` VALUES (2, 4, 10019, 5, 0, 675.00, NULL);
INSERT INTO `orders` VALUES (3, 4, 10009, 1, 0, 88.90, NULL);
INSERT INTO `orders` VALUES (4, 4, 10003, 1, 1, 3585.98, NULL);
INSERT INTO `orders` VALUES (5, 4, 10003, 1, 1, 3585.98, NULL);
INSERT INTO `orders` VALUES (6, 4, 10020, 1, 1, 29.99, '2023-12-01 00:53:47');
INSERT INTO `orders` VALUES (7, 4, 10005, 1, 1, 94.25, '2023-12-01 00:57:09');
INSERT INTO `orders` VALUES (8, 4, 10020, 1, 1, 29.99, '2023-12-01 01:10:19');
INSERT INTO `orders` VALUES (9, 4, 10003, 2, 1, 7171.96, '2023-12-01 01:20:13');
INSERT INTO `orders` VALUES (10, 4, 10020, 1, 1, 29.99, '2023-12-01 01:27:50');
INSERT INTO `orders` VALUES (11, 4, 10020, 1, 1, 29.99, '2023-12-01 01:32:49');
INSERT INTO `orders` VALUES (12, 4, 10020, 1, 1, 29.99, '2023-12-01 01:37:08');
INSERT INTO `orders` VALUES (13, 4, 10002, 1, 1, 5299.00, '2023-12-01 01:39:21');
INSERT INTO `orders` VALUES (14, 4, 10005, 3, 1, 282.75, '2023-12-01 01:46:56');
INSERT INTO `orders` VALUES (15, 4, 10020, 2, 1, 59.98, '2023-12-01 01:48:18');
INSERT INTO `orders` VALUES (16, 4, 10001, 4, 1, 67996.00, '2023-12-01 01:49:02');
INSERT INTO `orders` VALUES (17, 4, 10020, 2, 1, 59.98, '2023-12-01 08:40:24');
INSERT INTO `orders` VALUES (18, 4, 10001, 4, 1, 67996.00, '2023-12-01 09:08:31');
INSERT INTO `orders` VALUES (19, 4, 10019, 9, 1, 1215.00, '2023-12-01 09:21:34');
INSERT INTO `orders` VALUES (20, 4, 10019, 2, 1, 270.00, '2023-12-01 09:36:49');
INSERT INTO `orders` VALUES (21, 8, 10019, 2, 2, 270.00, '2023-12-01 09:46:42');
INSERT INTO `orders` VALUES (22, 8, 10020, 1, 1, 29.99, '2023-12-01 09:46:42');
INSERT INTO `orders` VALUES (23, 8, 10020, 1, 0, 29.99, '2023-12-01 09:48:01');
INSERT INTO `orders` VALUES (24, 8, 10021, 1, 0, 47.88, '2023-12-01 09:48:28');
INSERT INTO `orders` VALUES (25, 8, 10020, 1, 1, 29.99, '2023-12-01 09:50:33');
INSERT INTO `orders` VALUES (26, 8, 10026, 1, 1, 2022.81, '2023-12-01 09:51:01');
INSERT INTO `orders` VALUES (27, 9, 10020, 1, 1, 29.99, '2023-12-01 10:04:20');
INSERT INTO `orders` VALUES (28, 9, 10003, 2, 1, 7171.96, '2023-12-01 10:04:20');
INSERT INTO `orders` VALUES (29, 9, 10020, 1, 1, 29.99, '2023-12-01 10:04:46');
INSERT INTO `orders` VALUES (30, 9, 10003, 2, 1, 7171.96, '2023-12-01 10:04:46');
INSERT INTO `orders` VALUES (31, 10, 10003, 1, 1, 3585.98, '2023-12-01 11:38:51');
INSERT INTO `orders` VALUES (32, 10, 10005, 1, 1, 94.25, '2023-12-01 11:38:51');
INSERT INTO `orders` VALUES (33, 10, 10019, 1, 1, 135.00, '2023-12-01 11:44:45');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '产品名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '产品描述',
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '商品类型',
  `price` decimal(10, 2) NOT NULL COMMENT '价格',
  `stock` int NOT NULL COMMENT '库存数量',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '商品图片',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10029 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '产品信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (10001, 'Apple 苹果14promax', 'iPhone 14 Pro Max是苹果公司于2022年9月8日发布的手机产品。iPhone 14 Pro Max搭载6.7英寸OLED材质屏幕，配有深空黑色、银色、金色、暗紫色四款颜色，长度约160.7毫米，宽度约77.6毫米，厚度约7.85毫米，重量约240g。', '电子数码', 16999.00, 100, 'https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/products/digital/i14.png');
INSERT INTO `products` VALUES (10002, '联想笔记本电脑ThinkBook14+', '联想笔记本电脑ThinkBook14+/16+新品12代酷睿i7/i5轻薄便携商务游戏办公学生ThinkPad官方旗舰店', '电子数码', 5299.00, 56, 'https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/products/digital/thinkbook14.png');
INSERT INTO `products` VALUES (10003, '华为 HUAWEI P20', 'Huawei/华为 P20手机 双卡双待 顺丰包邮 鸿蒙系统', '电子数码', 3585.98, 56, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg');
INSERT INTO `products` VALUES (10005, '《神雕侠侣》', '首版未删减【 神雕侠侣 】全四册 顺丰发货 金庸经典武侠小说正版现货共4册 暑期畅销 朗声旧版 三联版内容书籍全集', '书籍', 94.25, 222, 'https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/products/book/神雕侠侣.png');
INSERT INTO `products` VALUES (10006, 'Redmi K50', '【购机享6期免息】Redmi K50至尊版骁龙8+旗舰处理器红米k50游戏智能5G手机小米手机官方旗舰店', '电子数码', 2999.00, 300, 'https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/products/digital/红米.png');
INSERT INTO `products` VALUES (10008, '黑人牙膏', 'Darlie好来黑人双重薄荷牙膏家庭装家用225g*1支装去牙渍清新口气', '日用品', 6.90, 500, 'https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/products/daily/黑人牙膏.png');
INSERT INTO `products` VALUES (10009, '美汁源果粒橙', '美汁源果味饮料果粒橙橙汁1.25Lx12瓶果汁饮品饮料整箱', '食品', 88.90, 42, 'https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/products/drink/美汁源.png');
INSERT INTO `products` VALUES (10010, '植护抽纸', '植护抽纸餐巾纸抽家用实惠装整箱批婴儿面巾纸卫生纸巾小包擦手纸', '日用品', 34.99, 400, 'https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/products/daily/纸巾.png');
INSERT INTO `products` VALUES (10011, '加厚羽绒服', '加厚羽绒服女东北哈尔滨保暖冬中长款连帽鸭绒毛领潮防风防寒外套', '服装', 220.00, 11, 'https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/products/clothing/羽绒服.png');
INSERT INTO `products` VALUES (10012, 'OFF-WTEDB联名卫衣', 'OFF-WTEDB联名款2022秋季新款连帽卫衣情侣上衣圆领男女同款卫衣\r\n', '服装', 149.88, 5, 'https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/products/clothing/卫衣.png');
INSERT INTO `products` VALUES (10013, '361运动裤男裤', '361运动裤男裤2022秋冬加绒男士直筒束脚卫裤针织裤保暖长裤裤子', '服装', 129.00, 77, 'https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/products/clothing/361长裤.png');
INSERT INTO `products` VALUES (10014, '可口可乐', '可口可乐含汽饮料摩登罐330mlx24罐整箱汽水官方出品经典口味', '食品', 68.99, 78, 'https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/products/drink/可乐.png');
INSERT INTO `products` VALUES (10015, '海飞丝洗发水', '海飞丝洗发水套装清爽去油500g×2瓶+80g×1瓶去屑止痒男女', '日用品', 77.89, 54, 'https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/products/daily/海飞丝.png');
INSERT INTO `products` VALUES (10016, 'LUX 力士沐浴露', '正品LUX 力士沐浴露幽莲魅肤沐浴乳薰衣草香720ml持久留香家庭装', '日用品', 32.90, 88, 'https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/products/daily/力士.png');
INSERT INTO `products` VALUES (10017, '摩可纳咖啡', '荷兰摩可纳8号5无蔗糖学生提神美式咖啡冻干moccona速溶黑咖啡粉', '食品', 79.00, 233, 'https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/products/food/咖啡.png');
INSERT INTO `products` VALUES (10018, '华为 P50', '【优惠550元】HUAWEI/华为 P50 直屏影像旗舰新款智能手机鸿蒙手机拍照游戏通话新款华为官方旗舰店正品官网', '电子数码', 4488.00, 100, 'https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/products/digital/华为.png');
INSERT INTO `products` VALUES (10019, '《天龙八部》', '正版现货 天龙八部全集(共5册) 金庸武侠小说 2020彩图平装朗声旧版 广州出版社 三联版文本 经典文学', '书籍', 135.00, 99, 'https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/products/book/天龙八部.png');
INSERT INTO `products` VALUES (10020, '《解忧杂货店》', '解忧杂货店东野圭吾正版精装继白夜行疾风回旋曲之后又一新书文学', '书籍', 29.99, 55, 'https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/products/book/解忧杂货店.png');
INSERT INTO `products` VALUES (10021, '《Java从入门到精通》', 'Java从入门到精通第六版 明日科技 清华大学出版社java语言程序设计计算机电脑基础编程教程零基础自学全套书籍', '书籍', 47.88, 65, 'https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/products/book/java.png');
INSERT INTO `products` VALUES (10022, '耐克顿外套', '耐克顿外套男士2022新款潮流秋冬男装夹克上衣春秋季运动休闲风衣', '服装', 633.00, 21, 'https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/products/clothing/nike.png');
INSERT INTO `products` VALUES (10024, '耐克NIKE男子运动鞋', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋', '服饰', 120.00, 99, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg');
INSERT INTO `products` VALUES (10026, '小米8', 'MIUI/小米 Xiaomi 8 青春版骁龙660处理器正品全面屏高性价比商务', '电子数码', 2022.81, 12, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg');
INSERT INTO `products` VALUES (10027, '洽洽坚果', '炒货零食大礼包A款锅巴瓜子花生怪味蚕豆恰休闲小吃食品', '食品', 101.30, 90, 'https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/products/food/洽洽坚果.png');
INSERT INTO `products` VALUES (10028, '友臣肉松饼', '\r\n友臣散装肉松饼500g营养早餐面包糕点心零食充饥小吃休闲食品整箱', '食品', 15.90, 200, 'https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/products/food/友臣肉松饼.png');
INSERT INTO `products` VALUES (10029, '《Java核心编程技术》', 'Java概述；Java编程基础；类与对象；JavaAPI实用类；继承和多态性；抽象类与接口；异常处理；文件与输入输出流；图形用户界面设计；数据库编程；多线程与网络编程；Junit。', '书籍', 56.80, 34, 'https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/products/book/java核心编程.jpg');

-- ----------------------------
-- Table structure for reviews
-- ----------------------------
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews`  (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '用户ID',
  `product_id` int NOT NULL COMMENT '产品ID',
  `review_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '评论内容',
  `rating` int NULL DEFAULT NULL COMMENT '评分',
  `create_date` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  `modify_date` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`review_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '评论表' ROW_FORMAT = Dynamic;

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
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '商品名称',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '商品图片',
  `quantity` int NOT NULL COMMENT '购买数量',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '添加到购物车的价格',
  `create_date` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '加购时间',
  `modify_date` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`cart_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '购物车表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------
INSERT INTO `shopping_cart` VALUES (17, 6, 10002, '联想笔记本电脑ThinkBook14+', 'https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/products/digital/thinkbook14.png', 3, 5299.00, '2023-11-30 00:51:48', '2023-11-30 16:28:14');
INSERT INTO `shopping_cart` VALUES (20, 7, 10003, '华为 HUAWEI P20', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 1, 3585.98, '2023-11-30 10:45:25', '2023-11-30 10:45:25');
INSERT INTO `shopping_cart` VALUES (21, 7, 10019, '《天龙八部》', 'https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/products/book/天龙八部.png', 2, 135.00, '2023-11-30 10:45:45', '2023-11-30 10:46:06');
INSERT INTO `shopping_cart` VALUES (22, 7, 10020, '《解忧杂货店》', 'https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/products/book/解忧杂货店.png', 1, 29.99, '2023-11-30 10:46:23', '2023-11-30 10:46:23');
INSERT INTO `shopping_cart` VALUES (23, 6, 10014, '可口可乐', 'https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/products/drink/可乐.png', 1, 68.99, '2023-11-30 16:22:19', '2023-11-30 16:22:19');
INSERT INTO `shopping_cart` VALUES (29, 4, 10019, '《天龙八部》', 'https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/products/book/天龙八部.png', 2, 135.00, '2023-12-01 09:36:01', '2023-12-01 09:36:01');
INSERT INTO `shopping_cart` VALUES (30, 4, 10003, '华为 HUAWEI P20', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 1, 3585.98, '2023-12-01 09:40:21', '2023-12-01 09:40:21');
INSERT INTO `shopping_cart` VALUES (32, 8, 10019, '《天龙八部》', 'https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/products/book/天龙八部.png', 3, 135.00, '2023-12-01 09:46:09', '2023-12-01 09:47:56');
INSERT INTO `shopping_cart` VALUES (33, 8, 10020, '《解忧杂货店》', 'https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/products/book/解忧杂货店.png', 1, 29.99, '2023-12-01 09:46:14', '2023-12-01 09:46:14');
INSERT INTO `shopping_cart` VALUES (34, 8, 10021, '《Java从入门到精通》', 'https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/products/book/java.png', 1, 47.88, '2023-12-01 09:48:16', '2023-12-01 09:48:16');
INSERT INTO `shopping_cart` VALUES (35, 8, 10026, '小米8', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 1, 2022.81, '2023-12-01 09:50:53', '2023-12-01 09:50:53');
INSERT INTO `shopping_cart` VALUES (37, 9, 10020, '《解忧杂货店》', 'https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/products/book/解忧杂货店.png', 1, 29.99, '2023-12-01 10:03:28', '2023-12-01 10:03:28');
INSERT INTO `shopping_cart` VALUES (38, 9, 10003, '华为 HUAWEI P20', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 2, 3585.98, '2023-12-01 10:03:50', '2023-12-01 10:03:50');
INSERT INTO `shopping_cart` VALUES (39, 9, 10019, '《天龙八部》', 'https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/products/book/天龙八部.png', 1, 135.00, '2023-12-01 10:07:55', '2023-12-01 10:07:55');
INSERT INTO `shopping_cart` VALUES (41, 10, 10003, '华为 HUAWEI P20', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 2, 3585.98, '2023-12-01 11:38:20', '2023-12-01 11:44:35');
INSERT INTO `shopping_cart` VALUES (42, 10, 10005, '《神雕侠侣》', 'https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/products/book/神雕侠侣.png', 1, 94.25, '2023-12-01 11:38:29', '2023-12-01 11:38:29');
INSERT INTO `shopping_cart` VALUES (43, 10, 10019, '《天龙八部》', 'https://newonebucket.oss-cn-hongkong.aliyuncs.com/mall/products/book/天龙八部.png', 1, 135.00, '2023-12-01 11:44:11', '2023-12-01 11:44:11');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '密码',
  `phone` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '手机号码',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '邮箱',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '头像',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '收货地址',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除:0:未删除 1:已删除',
  `create_date` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `modify_date` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (10, 'newone', '$2a$10$OMiHtHhnErZwNyE8K71dbOh.hkhfv9OVUmjyPwewRzek0ZBtFHU8u', NULL, NULL, NULL, NULL, 0, '2023-12-01 11:37:43', '2023-12-01 11:37:43');

SET FOREIGN_KEY_CHECKS = 1;
