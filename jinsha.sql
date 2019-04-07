SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_item_param
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_param`;
CREATE TABLE `tb_item_param` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_cat_id` bigint(20) DEFAULT NULL COMMENT '商品类目ID',
  `param_data` text COMMENT '参数数据，格式为json格式',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_cat_id` (`item_cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='商品规则参数';
-- ----------------------------
-- Records of tb_item_param
-- ----------------------------
INSERT INTO `tb_item_param` VALUES ('1', '3', '[{\"group\":\"组名1\",\"params\":[\"组员1\",\"组员2\"]},{\"group\":\"组名2\",\"params\":[\"组员1\",\"组员2\"]},{\"group\":\"组名3\",\"params\":[\"组员1\",\"组员2\",\"组员3\",\"组员4\"]}]', '2015-04-03 10:21:22', '2015-04-03 10:21:22');
INSERT INTO `tb_item_param` VALUES ('2', '560', '[{\"group\":\"主体\",\"params\":[\"品牌\",\"型号\",\"颜色\",\"上市年份\"]},{\"group\":\"网络\",\"params\":[\"4G网络制式\",\"3G网络制式\",\"2G网络制式\"]},{\"group\":\"存储\",\"params\":[\"机身内存\",\"储存卡类型\"]}]', '2015-04-03 10:40:12', '2015-04-03 10:40:12');
INSERT INTO `tb_item_param` VALUES ('3', '298', '[{\"group\":\"g1\",\"params\":[\"aa\",\"bb\",\"cc\"]},{\"group\":\"g2\",\"params\":[\"ad\",\"sd\"]},{\"group\":\"g3\",\"params\":[\"sdd\",\"sdfs\",\"dfg\"]}]', '2015-06-05 11:59:45', '2015-06-05 11:59:45');
-- ----------------------------
-- Table structure for tb_item_param_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_param_item`;
CREATE TABLE `tb_item_param_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `param_data` text COMMENT '参数数据，格式为json格式',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='商品规格和商品的关系表';

-- ----------------------------
-- Records of tb_item_param_item
-- ----------------------------
INSERT INTO `tb_item_param_item` VALUES ('1', '48', '[{\"group\":\"主体\",\"params\":[{\"k\":\"品牌\",\"v\":\"苹果（Apple）\"},{\"k\":\"型号\",\"v\":\"iPhone 6 A1586\"},{\"k\":\"颜色\",\"v\":\"金色\"},{\"k\":\"上市年份\",\"v\":\"2014\"}]},{\"group\":\"网络\",\"params\":[{\"k\":\"4G网络制式\",\"v\":\"移动4G(TD-LTE)/联通4G(FDD-LTE)/电信4G(FDD-LTE)\"},{\"k\":\"3G网络制式\",\"v\":\"移动3G(TD-SCDMA)/联通3G(WCDMA)/电信3G（CDMA2000）\"},{\"k\":\"2G网络制式\",\"v\":\"移动2G/联通2G(GSM)/电信2G(CDMA)\"}]},{\"group\":\"存储\",\"params\":[{\"k\":\"机身内存\",\"v\":\"16GB ROM\"},{\"k\":\"储存卡类型\",\"v\":\"不支持\"}]}]', '2015-04-03 10:52:55', '2015-04-03 10:52:55');
INSERT INTO `tb_item_param_item` VALUES ('2', '1188043', '[{\"group\":\"主体\",\"params\":[{\"k\":\"品牌\",\"v\":\"锤子\"},{\"k\":\"型号\",\"v\":\"T1(SM705)\"},{\"k\":\"颜色\",\"v\":\"黑色\"},{\"k\":\"上市年份\",\"v\":\"2014年\"}]},{\"group\":\"网络\",\"params\":[{\"k\":\"4G网络制式\",\"v\":\"移动4G（TD-LTE）/联通4G（FDD-LTE）\"},{\"k\":\"3G网络制式\",\"v\":\"移动3G(TD-SCDMA)/联通3G(WCDMA)\"},{\"k\":\"2G网络制式\",\"v\":\"移动2G/联通2G(GSM)\"}]},{\"group\":\"存储\",\"params\":[{\"k\":\"机身内存\",\"v\":\"32GB ROM\"},{\"k\":\"储存卡类型\",\"v\":\"2GB RAM\"}]}]', '2015-04-06 11:24:10', '2015-04-06 11:24:10');
INSERT INTO `tb_item_param_item` VALUES ('3', '1433500495290', '[{\"group\":\"主体\",\"params\":[{\"k\":\"品牌\",\"v\":\"1\"},{\"k\":\"型号\",\"v\":\"2\"},{\"k\":\"颜色\",\"v\":\"3\"},{\"k\":\"上市年份\",\"v\":\"4\"}]},{\"group\":\"网络\",\"params\":[{\"k\":\"4G网络制式\",\"v\":\"a\"},{\"k\":\"3G网络制式\",\"v\":\"b\"},{\"k\":\"2G网络制式\",\"v\":\"c\"}]},{\"group\":\"存储\",\"params\":[{\"k\":\"机身内存\",\"v\":\"de\"},{\"k\":\"储存卡类型\",\"v\":\"ef\"}]}]', '2015-06-05 18:34:52', '2015-06-05 18:34:52');
-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `order_id` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '订单id',
  `payment` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '实付金额。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `payment_type` int(2) DEFAULT NULL COMMENT '支付类型，1、在线支付，2、货到付款',
  `post_fee` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '邮费。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `status` int(10) DEFAULT NULL COMMENT '状态：1、未付款，2、已付款，3、未发货，4、已发货，5、交易成功，6、交易关闭',
  `create_time` datetime DEFAULT NULL COMMENT '订单创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '订单更新时间',
  `payment_time` datetime DEFAULT NULL COMMENT '付款时间',
  `consign_time` datetime DEFAULT NULL COMMENT '发货时间',
  `end_time` datetime DEFAULT NULL COMMENT '交易完成时间',
  `close_time` datetime DEFAULT NULL COMMENT '交易关闭时间',
  `shipping_name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '物流名称',
  `shipping_code` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '物流单号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `buyer_message` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '买家留言',
  `buyer_nick` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '买家昵称',
  `buyer_rate` int(2) DEFAULT NULL COMMENT '买家是否已经评价',
  PRIMARY KEY (`order_id`),
  KEY `create_time` (`create_time`),
  KEY `buyer_nick` (`buyer_nick`),
  KEY `status` (`status`),
  KEY `payment_type` (`payment_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tb_order
-- ----------------------------

-- ----------------------------
-- Table structure for tb_order_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_item`;
CREATE TABLE `tb_order_item` (
  `id` varchar(20) COLLATE utf8_bin NOT NULL,
  `item_id` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '商品id',
  `order_id` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '订单id',
  `num` int(10) DEFAULT NULL COMMENT '商品购买数量',
  `title` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品标题',
  `price` bigint(50) DEFAULT NULL COMMENT '商品单价',
  `total_fee` bigint(50) DEFAULT NULL COMMENT '商品总金额',
  `pic_path` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品图片地址',
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tb_order_item
-- ----------------------------

-- ----------------------------
-- Table structure for tb_order_shipping
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_shipping`;
CREATE TABLE `tb_order_shipping` (
  `order_id` varchar(50) NOT NULL COMMENT '订单ID',
  `receiver_name` varchar(20) DEFAULT NULL COMMENT '收货人全名',
  `receiver_phone` varchar(20) DEFAULT NULL COMMENT '固定电话',
  `receiver_mobile` varchar(30) DEFAULT NULL COMMENT '移动电话',
  `receiver_state` varchar(10) DEFAULT NULL COMMENT '省份',
  `receiver_city` varchar(10) DEFAULT NULL COMMENT '城市',
  `receiver_district` varchar(20) DEFAULT NULL COMMENT '区/县',
  `receiver_address` varchar(200) DEFAULT NULL COMMENT '收货地址，如：xx路xx号',
  `receiver_zip` varchar(6) DEFAULT NULL COMMENT '邮政编码,如：310001',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order_shipping
-- ----------------------------

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码，加密存储',
  `phone` varchar(20) DEFAULT NULL COMMENT '注册手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '注册邮箱',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `phone` (`phone`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('7', 'zhangsan', 'e10adc3949ba59abbe56e057f20f883e', '13488888888', 'aa@a', '2015-04-06 17:03:55', '2015-04-06 17:03:55');
INSERT INTO `tb_user` VALUES ('9', 'zhangsan1', 'e10adc3949ba59abbe56e057f20f883e', '13333333333', null, '2015-04-07 10:32:08', '2015-04-07 10:32:08');
INSERT INTO `tb_user` VALUES ('10', 'zhangsan2', '195d91be1e3ba6f1c857d46f24c5a454', '13333333334', null, '2015-04-07 10:33:37', '2015-04-07 10:33:37');
INSERT INTO `tb_user` VALUES ('11', 'zhangsan3', '195d91be1e3ba6f1c857d46f24c5a454', '13333333335', null, '2015-04-07 10:35:57', '2015-04-07 10:35:57');

-- ----------------------------
-- Table structure for tb_content
-- ----------------------------
DROP TABLE IF EXISTS `tb_content`;
CREATE TABLE `tb_content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NOT NULL COMMENT '内容类目ID',
  `title` varchar(200) DEFAULT NULL COMMENT '内容标题',
  `sub_title` varchar(100) DEFAULT NULL COMMENT '子标题',
  `title_desc` varchar(500) DEFAULT NULL COMMENT '标题描述',
  `url` varchar(500) DEFAULT NULL COMMENT '链接',
  `pic` varchar(300) DEFAULT NULL COMMENT '图片绝对路径',
  `pic2` varchar(300) DEFAULT NULL COMMENT '图片2',
  `content` text COMMENT '内容',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `updated` (`updated`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_content
-- ----------------------------
INSERT INTO `tb_content` VALUES ('28', '89', '标题1', '标题1', '标题1', 'http://www.jd.com', 'http://localhost:9000/images/2015/07/27/1437979301511057.jpg', null, '标题1', '2015-07-27 14:41:57', '2015-07-27 14:41:57');
INSERT INTO `tb_content` VALUES ('29', '89', 'ad2', 'ad2', 'ad2', 'http://www.baidu.com', 'http://localhost:9000/images/2015/07/27/1437979349040954.jpg', null, 'ad2', '2015-07-27 14:42:36', '2015-07-27 14:42:36');
INSERT INTO `tb_content` VALUES ('30', '89', 'ad3', 'ad3', 'ad3', 'http://www.sina.com.cn', 'http://localhost:9000/images/2015/07/27/1437979377450366.jpg', null, '', '2015-07-27 14:42:58', '2015-07-27 14:42:58');
INSERT INTO `tb_content` VALUES ('31', '89', 'ad4', 'ad4', 'ad4', 'ad4', 'http://localhost:9000/images/2015/07/27/1437979392186756.jpg', null, 'ad4', '2015-07-27 14:43:15', '2015-07-27 14:43:15');

-- ----------------------------
-- Table structure for tb_content_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_content_category`;
CREATE TABLE `tb_content_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '类目ID',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父类目ID=0时，代表的是一级的类目',
  `name` varchar(50) DEFAULT NULL COMMENT '分类名称',
  `status` int(1) DEFAULT '1' COMMENT '状态。可选值:1(正常),2(删除)',
  `sort_order` int(4) DEFAULT NULL COMMENT '排列序号，表示同级类目的展现次序，如数值相等则按名称次序排列。取值范围:大于零的整数',
  `is_parent` tinyint(1) DEFAULT '1' COMMENT '该类目是否为父类目，1为true，0为false',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`,`status`) USING BTREE,
  KEY `sort_order` (`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COMMENT='内容分类';

-- ----------------------------
-- Records of tb_content_category
-- ----------------------------
INSERT INTO `tb_content_category` VALUES ('30', '0', '易购商城', '1', '1', '1', '2015-04-03 16:51:38', '2015-04-03 16:51:40');
INSERT INTO `tb_content_category` VALUES ('86', '30', '首页', '1', '1', '1', '2015-06-07 15:36:07', '2015-06-07 15:36:07');
INSERT INTO `tb_content_category` VALUES ('87', '30', '列表页面', '1', '1', '1', '2015-06-07 15:36:16', '2015-06-07 15:36:16');
INSERT INTO `tb_content_category` VALUES ('88', '30', '详细页面', '1', '1', '1', '2015-06-07 15:36:27', '2015-06-07 15:36:27');

-- ----------------------------
-- Table structure for tb_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_item`;
CREATE TABLE `tb_item` (
  `id` bigint(20) NOT NULL COMMENT '商品id，同时也是商品编号',
  `title` varchar(100) NOT NULL COMMENT '商品标题',
  `sell_point` varchar(500) DEFAULT NULL COMMENT '商品卖点',
  `price` bigint(20) NOT NULL COMMENT '商品价格，单位为：分',
  `num` int(10) NOT NULL COMMENT '库存数量',
  `barcode` varchar(30) DEFAULT NULL COMMENT '商品条形码',
  `image` varchar(500) DEFAULT NULL COMMENT '商品图片',
  `cid` bigint(10) NOT NULL COMMENT '所属类目，叶子类目',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '商品状态，1-正常，2-下架，3-删除',
  `created` datetime NOT NULL COMMENT '创建时间',
  `updated` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `status` (`status`),
  KEY `updated` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of tb_item
-- ----------------------------
INSERT INTO `tb_item` VALUES ('536563', 'new2 - 阿尔卡特 (OT-927) 炭黑 联通3G手机 双卡双待', '清仓！仅北京，武汉仓有货！', '29900000', '99999', '', 'http://image.egou.com/jd/4ef8861cf6854de9889f3db9b24dc371.jpg', '560', '1', '2015-03-08 21:33:18', '2015-04-11 20:38:38');
INSERT INTO `tb_item` VALUES ('562379', 'new8- 三星 W999 黑色 电信3G手机 双卡双待双通', '下单送12000毫安移动电源！双3.5英寸魔焕炫屏，以非凡视野纵观天下时局，尊崇翻盖设计，张弛中，尽显从容气度！', '1100', '99999', '', 'http://image.egou.com/jd/d2ac340e728d4c6181e763e772a9944a.jpg', '560', '1', '2015-03-08 21:27:54', '2015-04-12 17:10:43');
INSERT INTO `tb_item` VALUES ('605616', '阿尔卡特 (OT-979) 冰川白 联通3G手机', '清仓！仅上海仓有货！', '30900', '99999', null, 'http://image.egou.com/jd/a69d0d09a1a04164969c2d0369659b1a.jpg', '560', '1', '2015-03-08 21:33:18', '2015-03-08 21:33:18');
-- ----------------------------
-- Table structure for tb_item_cat
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_cat`;
CREATE TABLE `tb_item_cat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '类目ID',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父类目ID=0时，代表的是一级的类目',
  `name` varchar(50) DEFAULT NULL COMMENT '类目名称',
  `status` int(1) DEFAULT '1' COMMENT '状态。可选值:1(正常),2(删除)',
  `sort_order` int(4) DEFAULT NULL COMMENT '排列序号，表示同级类目的展现次序，如数值相等则按名称次序排列。取值范围:大于零的整数',
  `is_parent` tinyint(1) DEFAULT '1' COMMENT '该类目是否为父类目，1为true，0为false',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`,`status`) USING BTREE,
  KEY `sort_order` (`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=1183 DEFAULT CHARSET=utf8 COMMENT='商品类目';

-- ----------------------------
-- Records of tb_item_cat
-- ----------------------------
INSERT INTO `tb_item_cat` VALUES ('1176', '1175', '电影票', '1', '1', '0', '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1177', '1175', '演唱会', '1', '2', '0', '2014-10-15 18:31:55', '2014-10-15 18:31:55');
INSERT INTO `tb_item_cat` VALUES ('1178', '1175', '话剧歌剧', '1', '3', '0', '2014-10-15 18:31:55', '2014-10-15 18:31:55');
-- ----------------------------
-- Table structure for tb_item_desc
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_desc`;
CREATE TABLE `tb_item_desc` (
  `item_id` bigint(20) NOT NULL COMMENT '商品ID',
  `item_desc` text COMMENT '商品描述',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品描述表';
-- ----------------------------
-- Records of tb_item_desc
-- ----------------------------