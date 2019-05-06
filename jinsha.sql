DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(20) NOT NULL auto_increment PRIMARY key COMMENT 'id',
  `order_id` int(20) NOT NULL COMMENT '订单id',
  `payment` varchar(50)  DEFAULT NULL COMMENT '实付金额。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `payment_type` int(2) DEFAULT NULL COMMENT '支付类型，1、在线支付，2、货到付款',
  `post_fee` varchar(50)   DEFAULT NULL COMMENT '邮费。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `status` int(10) DEFAULT NULL COMMENT '状态：1、未付款，2、已付款，3、未发货，4、已发货，5、交易成功，6、交易关闭',
  `create_time` datetime DEFAULT NULL COMMENT '订单创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '订单更新时间',
  `payment_time` datetime DEFAULT NULL COMMENT '付款时间',
  `consign_time` datetime DEFAULT NULL COMMENT '发货时间',
  `end_time` datetime DEFAULT NULL COMMENT '交易完成时间',
  `close_time` datetime DEFAULT NULL COMMENT '交易关闭时间',
  `shipping_name` varchar(20)   DEFAULT NULL COMMENT '物流名称',
  `shipping_code` varchar(20)   DEFAULT NULL COMMENT '物流单号',
  `user_id` int(20) DEFAULT NULL COMMENT '用户id',
  `buyer_message` varchar(100) DEFAULT NULL COMMENT '买家留言',
  `buyer_nick` varchar(50) DEFAULT NULL COMMENT '买家昵称',
  `buyer_rate` int(2) DEFAULT NULL COMMENT '买家是否已经评价',
  `order_type` int(2) DEFAULT NULL COMMENT '订单类型（待支付、待发货、待收货、已取消、已完成）',
  `order_status` int(2) DEFAULT NULL COMMENT '订单状态（是否需要显示）'
);


DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item` (
  `id` int(20) NOT NULL auto_increment PRIMARY KEY COMMENT '商品订单iD',
  `item_id` varchar(50) NOT NULL COMMENT '商品id',
  `order_id` int(20)   NOT NULL COMMENT '订单id',
  `num` int(10) DEFAULT NULL COMMENT '商品购买数量',
  `title` varchar(200)   DEFAULT NULL COMMENT '商品标题',
  `price` int(50) DEFAULT NULL COMMENT '商品单价',
  `total_fee` int(50) DEFAULT NULL COMMENT '商品总金额',
  `pic_path` varchar(200)   DEFAULT NULL COMMENT '商品图片地址'
);


DROP TABLE IF EXISTS `order_shipping`;
CREATE TABLE `order_shipping` (
  `order_id` INT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '订单ID',
  `receiver_name` varchar(20) DEFAULT NULL COMMENT '收货人全名',
  `receiver_phone` varchar(20) DEFAULT NULL COMMENT '固定电话',
  `receiver_mobile` varchar(30) DEFAULT NULL COMMENT '移动电话',
  `receiver_state` varchar(10) DEFAULT NULL COMMENT '省份',
  `receiver_city` varchar(10) DEFAULT NULL COMMENT '城市',
  `receiver_district` varchar(20) DEFAULT NULL COMMENT '区/县',
  `receiver_address` varchar(200) DEFAULT NULL COMMENT '收货地址，如：xx路xx号',
  `receiver_zip` varchar(6) DEFAULT NULL COMMENT '邮政编码,如：310001',
  `created` datetime DEFAULT NULL
);


DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(20) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '用户id'  ,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码，加密存储',
  `phone` varchar(20) DEFAULT NULL COMMENT '注册手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '注册邮箱',
  `pid` int(20) DEFAULT 0 NOT NULL COMMENT '上级编号',
  `realname` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `age` int(3) DEFAULT NULL COMMENT '年龄',
  `sex` int(1) DEFAULT NULL COMMENT '性别',
  `address` varchar(50) DEFAULT NULL COMMENT '地址',	
  `picture` varchar(50) DEFAULT NULL COMMENT '头像',
  `isProxy` int(1) DEFAULT 0 COMMENT '是否是代理',
  `branch` int(1) DEFAULT NULL COMMENT '所属分支',
  `invitation` varchar(50) DEFAULT NULL COMMENT '邀请码',
  `idcard` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `applytime` datetime DEFAULT NULL COMMENT '申请日期',
  `proxytype` int(5) DEFAULT NULL COMMENT '代理商品',
  `applyreason` varchar(100) DEFAULT NULL COMMENT '申请理由',
  `integral` INT(10) DEFAULT NULL COMMENT '积分',
  `created` datetime NOT NULL
)COMMENT='用户表';


DROP TABLE IF EXISTS `item_content`;
CREATE TABLE `item_content` (
  `id` int(20) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '商品内容ID',
  `title` varchar(200) DEFAULT NULL COMMENT '内容标题',
  `sub_title` varchar(100) DEFAULT NULL COMMENT '子标题',
  `title_desc` varchar(500) DEFAULT NULL COMMENT '标题描述',
  `url` varchar(500) DEFAULT NULL COMMENT '链接',
  `pic` varchar(300) DEFAULT NULL COMMENT '图片绝对路径',
  `pic2` varchar(300) DEFAULT NULL COMMENT '图片2',
  `content` text COMMENT '内容',
  `created` datetime DEFAULT NULL
);


DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `id` int(20) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '商品id，同时也是商品编号',
  `title` varchar(100) NOT NULL COMMENT '商品标题',
  `sell_point` varchar(500) DEFAULT NULL COMMENT '商品卖点',
  `price` int(20) NOT NULL COMMENT '商品价格，单位为：分',
  `num` int(10) NOT NULL COMMENT '库存数量',
  `desc` varchar(30) DEFAULT NULL COMMENT '商品描述图片',
  `image` varchar(500) DEFAULT NULL COMMENT '商品图片',
  `cid` int(20) NOT NULL COMMENT '所属类目，叶子类目',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '商品状态，1-正常，2-下架，3-删除',
  `created` datetime NOT NULL COMMENT '创建时间'
)COMMENT='商品表';


DROP TABLE IF EXISTS `item_cat`;
CREATE TABLE `item_cat` (
  `id` int(20) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '类目ID',
  `parent_id` int(20) DEFAULT NULL COMMENT '父类目ID=0时，代表的是一级的类目',
  `name` varchar(50) DEFAULT NULL COMMENT '类目名称',
  `status` int(1) DEFAULT '1' COMMENT '状态。可选值:1(正常),2(删除)',
  `sort_order` int(4) DEFAULT NULL COMMENT '排列序号，表示同级类目的展现次序，如数值相等则按名称次序排列。取值范围:大于零的整数',
  `is_parent` tinyint(1) DEFAULT '1' COMMENT '该类目是否为父类目，1为true，0为false',
  `created` datetime DEFAULT NULL COMMENT '创建时间'
)COMMENT='商品类目';


DROP TABLE IF EXISTS `shop_cart`;
CREATE TABLE `shop_cart` (
  `id` int(20) NOT NULL auto_increment PRIMARY KEY  COMMENT 'ID',
  `item_id` int(20) NOT NULL COMMENT '商品ID',
  `userid` int(20) NOT NULL COMMENT '用户id',
  `item_count` INT(10) COMMENT '商品数量',
  `created` datetime DEFAULT NULL COMMENT '创建时间'
)COMMENT='购物车表';


DROP TABLE IF EXISTS earn_record;
CREATE TABLE earn_record (
  `id` int(20) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '收益id',
  `uid` int(20) NOT NULL COMMENT '用户id',
  `amount` INT(10) COMMENT '金额',
  `time` datetime DEFAULT NULL COMMENT '时间',
  `type` VARCHAR(10) DEFAULT NULL COMMENT '类型'
)COMMENT='收益表';


DROP TABLE IF EXISTS thit_record;
CREATE TABLE thit_record (
  `id` int(20) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '提现id',
  `uid` int(20) NOT NULL COMMENT '用户id',
  `amount` INT(10) COMMENT '金额',
  `time` datetime DEFAULT NULL COMMENT '时间',
  `type` VARCHAR(10) DEFAULT NULL COMMENT '类型',
  `accnumber` varchar(20) DEFAULT NULL COMMENT '账号'
)COMMENT='提现表';


DROP TABLE IF EXISTS collect_item;
CREATE TABLE collect_item(
	`id` int(20) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '收藏id',
	`uid` int(20) NOT NULL COMMENT '用户id',
	`itemid` int(20) NOT NULL COMMENT '商品id',
	`time` datetime DEFAULT NULL COMMENT '收藏时间'
)comment='收藏表';

DROP TABLE IF EXISTS item_comment;
CREATE TABLE item_comment(
	`id` int(20) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '评价id',
	`userid` int(20) NOT NULL COMMENT '用户id',
	`itemid` int(20) NOT NULL COMMENT '商品id',
	`time` datetime DEFAULT NULL COMMENT '评价时间',
	`content` datetime DEFAULT NULL COMMENT '评价内容'
)COMMENT='评价表';