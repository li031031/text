/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : text_01

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2024-05-15 19:15:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` varchar(50) NOT NULL,
  `cname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '女装');
INSERT INTO `category` VALUES ('2', '男装');
INSERT INTO `category` VALUES ('3', '儿童服饰');
INSERT INTO `category` VALUES ('4', '男包|女包');
INSERT INTO `category` VALUES ('5', '潮流前线');
INSERT INTO `category` VALUES ('6', '大牌领先看');
INSERT INTO `category` VALUES ('7', '天天折扣');

-- ----------------------------
-- Table structure for `product_temp`
-- ----------------------------
DROP TABLE IF EXISTS `product_temp`;
CREATE TABLE `product_temp` (
  `id` varchar(50) NOT NULL,
  `pname` varchar(255) NOT NULL,
  `old_price` float NOT NULL,
  `new_price` float NOT NULL,
  `images` text DEFAULT NULL,
  `is_hot` int(11) DEFAULT NULL,
  `is_sell` int(11) DEFAULT NULL,
  `pdate` datetime DEFAULT NULL,
  `click_count` int(11) DEFAULT NULL,
  `counts` int(11) NOT NULL,
  `uid` varchar(50) DEFAULT NULL,
  `pDesc` text DEFAULT NULL,
  `love_user` text DEFAULT NULL,
  `is_pass` int(11) DEFAULT NULL,
  `csid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_temp
-- ----------------------------
INSERT INTO `product_temp` VALUES ('1', '纯棉商务休闲衬衣', '299', '0', 'static/images/sale (2).jpg', null, null, null, null, '0', null, ';精致与休闲造型兼备的牛津纺衬衫。简约素雅的风格，新潮百搭', null, null, null);
INSERT INTO `product_temp` VALUES ('2', '亲子儿童卫衣', '199', '0', 'static/images/sale (3).jpg', null, null, null, null, '0', null, '2014秋装新款女神的新衣张馨予同款亲子装儿童装卫衣 朗姿LANCY', null, null, null);
INSERT INTO `product_temp` VALUES ('3', '防水台真皮靴子', '499', '0', 'static/images/sale (1).jpg', null, null, null, null, '0', null, '佰缌2014秋冬新款欧美尖头粗跟短靴高跟 防水台真皮铆钉女式靴子', null, null, null);

-- ----------------------------
-- Table structure for `product_temp02`
-- ----------------------------
DROP TABLE IF EXISTS `product_temp02`;
CREATE TABLE `product_temp02` (
  `id` varchar(50) NOT NULL,
  `pname` varchar(255) NOT NULL,
  `images` text DEFAULT NULL,
  `is_hot` int(11) DEFAULT NULL,
  `pdate` datetime DEFAULT NULL,
  `click_count` int(11) DEFAULT NULL,
  `counts` int(11) NOT NULL,
  `uid` varchar(50) DEFAULT NULL,
  `pDesc` text DEFAULT NULL,
  `love_user` text DEFAULT NULL,
  `is_pass` int(11) DEFAULT NULL,
  `csid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_temp02
-- ----------------------------
INSERT INTO `product_temp02` VALUES ('1', '流行风向', 'static/images/pic1.jpg', null, null, null, '0', null, '查看更多', null, null, null);
INSERT INTO `product_temp02` VALUES ('2', '时尚前沿', 'static/images/pic2.jpg', null, null, null, '0', null, '查看更多', null, null, null);
INSERT INTO `product_temp02` VALUES ('3', '踮起脚尖', 'static/images/pic3.jpg', null, null, null, '0', null, '查看更多', null, null, null);
INSERT INTO `product_temp02` VALUES ('4', '独一无二', 'static/images/pic4.jpg', null, null, null, '0', null, '查看更多', null, null, null);

-- ----------------------------
-- Table structure for `subcategories`
-- ----------------------------
DROP TABLE IF EXISTS `subcategories`;
CREATE TABLE `subcategories` (
  `id` varchar(50) NOT NULL,
  `cname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subcategories
-- ----------------------------
INSERT INTO `subcategories` VALUES ('1', '精选女装');
INSERT INTO `subcategories` VALUES ('10', '小脚裤');
INSERT INTO `subcategories` VALUES ('11', '休闲裤');
INSERT INTO `subcategories` VALUES ('12', '个性潮男');
INSERT INTO `subcategories` VALUES ('13', '时尚休闲');
INSERT INTO `subcategories` VALUES ('14', '商务绅士');
INSERT INTO `subcategories` VALUES ('15', '休闲衬衫');
INSERT INTO `subcategories` VALUES ('16', '西服套装');
INSERT INTO `subcategories` VALUES ('17', '直筒西裤');
INSERT INTO `subcategories` VALUES ('18', '打底裤');
INSERT INTO `subcategories` VALUES ('19', '毛衣|针织衫');
INSERT INTO `subcategories` VALUES ('2', '秋装外套');
INSERT INTO `subcategories` VALUES ('20', '儿童男装');
INSERT INTO `subcategories` VALUES ('21', '儿童女装');
INSERT INTO `subcategories` VALUES ('22', '表演服饰');
INSERT INTO `subcategories` VALUES ('23', '亲子装');
INSERT INTO `subcategories` VALUES ('24', '休闲套装');
INSERT INTO `subcategories` VALUES ('25', '秋新款');
INSERT INTO `subcategories` VALUES ('26', '单肩包');
INSERT INTO `subcategories` VALUES ('27', '斜挎包');
INSERT INTO `subcategories` VALUES ('28', '手提包');
INSERT INTO `subcategories` VALUES ('29', '大牌包');
INSERT INTO `subcategories` VALUES ('3', '温暖毛衣');
INSERT INTO `subcategories` VALUES ('30', '钱包');
INSERT INTO `subcategories` VALUES ('31', '珠宝首饰');
INSERT INTO `subcategories` VALUES ('32', '时尚饰品');
INSERT INTO `subcategories` VALUES ('33', '品质手表');
INSERT INTO `subcategories` VALUES ('34', '眼镜配饰');
INSERT INTO `subcategories` VALUES ('35', '男人饰品');
INSERT INTO `subcategories` VALUES ('36', '原创饰品');
INSERT INTO `subcategories` VALUES ('37', 'CHANEL');
INSERT INTO `subcategories` VALUES ('38', 'PARADA');
INSERT INTO `subcategories` VALUES ('39', 'GUCCI');
INSERT INTO `subcategories` VALUES ('4', '毛呢外套');
INSERT INTO `subcategories` VALUES ('40', 'HERMES');
INSERT INTO `subcategories` VALUES ('41', 'Armani');
INSERT INTO `subcategories` VALUES ('42', 'Versace');
INSERT INTO `subcategories` VALUES ('43', '香奈儿8折');
INSERT INTO `subcategories` VALUES ('44', '普拉达7折');
INSERT INTO `subcategories` VALUES ('45', '古驰5折');
INSERT INTO `subcategories` VALUES ('46', '爱马仕9折');
INSERT INTO `subcategories` VALUES ('47', '阿玛尼8折');
INSERT INTO `subcategories` VALUES ('48', '范思哲9折');
INSERT INTO `subcategories` VALUES ('5', '秋冬外套');
INSERT INTO `subcategories` VALUES ('6', '长袖衬衫');
INSERT INTO `subcategories` VALUES ('7', '秋款风衣');
INSERT INTO `subcategories` VALUES ('8', '机车皮衣');
INSERT INTO `subcategories` VALUES ('9', '秋款连衣裙');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=960966934 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'aaa', '123', '2605668545@qq.com', '2024-04-30 17:16:30');
INSERT INTO `users` VALUES ('2', '老孙', '123', '123@qq.com', '2024-04-30 17:32:42');
INSERT INTO `users` VALUES ('29431679', 'lzp001', '123456', '2605668545@qq.com', '2024-05-06 10:41:31');
INSERT INTO `users` VALUES ('136643050', 'lzp006', '123456', '123@qq.com', '2024-05-10 16:51:17');
INSERT INTO `users` VALUES ('292662465', 'lzp0', '123456', '2605668545@qq.com', '2024-05-07 17:23:29');
INSERT INTO `users` VALUES ('960966932', 'qwe', '123', '1234@qq.com', '2024-05-06 09:57:25');
INSERT INTO `users` VALUES ('960966933', 'lzp0012', '123456', '123@qq.com', '2024-05-07 15:55:20');

-- ----------------------------
-- Table structure for `user_table`
-- ----------------------------
DROP TABLE IF EXISTS `user_table`;
CREATE TABLE `user_table` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_table
-- ----------------------------
