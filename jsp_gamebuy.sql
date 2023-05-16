/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : jsp_gamebuy

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-01-09 01:59:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `cover` varchar(45) DEFAULT NULL,
  `image1` varchar(45) DEFAULT NULL,
  `image2` varchar(45) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `intro` varchar(300) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_type_id_idx` (`type_id`),
  CONSTRAINT `fk_type_id` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('181', '小米枪战', '/picture/1568175520968.jpg', '/picture/1568175520986.jpg', '/picture/1568175521004.jpg', '34', '以一对雄伟的大理石坐骑*纪念艾泽拉斯15年来的冲突纷争与战友情谊——这些活生生的岩石致敬了在部落和联盟忠实服役的飞行生物。', '100', '15');
INSERT INTO `goods` VALUES ('182', '星际战争', '/picture/1568176393525.png', '/picture/1568176393546.jpg', '/picture/1568176393562.jpg', '100', '三大种族在科普卢星区的首次交手，引发出波及整个宇宙的霸权之战。超过50个任务，带你重温凯瑞甘从帝国特工蜕变成刀锋女王的传奇经历。', '999', '14');
INSERT INTO `goods` VALUES ('183', '鬼泣', '/picture/1568175586735.jpg', '/picture/1568175586751.jpg', '/picture/1568175586761.jpg', '100', '这个世界需要英雄。与超过4000万*玩家一起加入《守望先锋》的未来战场，从各具特色的士兵、科学家、冒险家和奇人异士中选择你的英雄。扭曲时空、逆反物理、用神奇的力量和武器释放出强大的威力。加入这个终极团队射击游戏，在全球各个著名地点与敌人展开搏斗。*数据来源于公司内部统计以及主要合作伙伴的销售报表。', '100', '14');
INSERT INTO `goods` VALUES ('184', '游戏王国', '/picture/1568175625845.jpg', '/picture/1568175625852.jpg', '/picture/1568175625861.jpg', '100', '4.在奥丹姆尘土飞扬的沙漠中，怪盗军团也许正在崛起，但是希望将伴随着探险者协会而来！与雷诺、伊莉斯、布莱恩和芬利爵士一同挖掘宝藏、对抗坏蛋、完成轻松愉快的任务，在《炉石传说》最新的扩展包“奥丹姆奇兵”中，拯救世界吧！', '34', '16');
INSERT INTO `goods` VALUES ('185', '魔兽争霸', '/picture/1568175649043.png', '/picture/1568175649056.jpg', '/picture/1568175649063.jpg', '100', '《魔兽争霸III：重制版》让这款颠覆性的即时战略游戏彻底重塑，再次演绎艾泽拉斯史诗的起源故事。这是一次完美的重制，不仅视效完全翻新，还加入了一系列现代化的社交和匹配功能，以及各种内容优化。在这款经典的即时战略游戏中，指挥暗夜精灵、亡灵、兽人和人类，体验明枪暗箭、瞬息万变的恢宏战争。', '999', '17');
INSERT INTO `goods` VALUES ('186', '虚灵', '/picture/1568175688718.jpg', '/picture/1568175688726.jpg', '/picture/1568175688732.jpg', '100', '虚灵有一项新把戏，可以联结虚空，帮助你在战场上散播混乱与困惑。使用幻变者道标可以召唤一名虚灵幻变者，将你和你的盟友的外形变为一名艾泽拉斯历史上最为可怕的敌人。', '100', '14');
INSERT INTO `goods` VALUES ('187', '拳皇', '/picture/1568175733876.jpg', '/picture/1568175733883.png', '/picture/1568175733891.jpg', '100', '德哈卡是生性狡诈的原始异虫族群首领，在这些年里历经坎坷，生存的考验让他变得更加强大。虽然很大程度上，是收集更多精华的欲望驱使着他，但是他也愿意与合适的人结盟。德哈卡已经准备好去帮助配得上他的智慧和毅力的人了。', '100', '16');

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` float DEFAULT NULL,
  `amount` int(6) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `paytype` tinyint(1) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_id_idx` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('49', '200', '2', '3', '2', '张广涛', '13022502404', '张广涛大厦', '2019-09-11 12:54:49', '32');

-- ----------------------------
-- Table structure for `orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` float DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_id_idx` (`order_id`),
  KEY `fk_orderitem_goods_id_idx` (`goods_id`),
  CONSTRAINT `fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderitem_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('45', '100', '2', '182', '49');

-- ----------------------------
-- Table structure for `recommend`
-- ----------------------------
DROP TABLE IF EXISTS `recommend`;
CREATE TABLE `recommend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_goods_id_idx` (`goods_id`),
  CONSTRAINT `fk_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recommend
-- ----------------------------
INSERT INTO `recommend` VALUES ('29', '2', '181');
INSERT INTO `recommend` VALUES ('30', '3', '182');
INSERT INTO `recommend` VALUES ('31', '2', '183');
INSERT INTO `recommend` VALUES ('32', '3', '184');
INSERT INTO `recommend` VALUES ('33', '3', '185');
INSERT INTO `recommend` VALUES ('34', '2', '186');
INSERT INTO `recommend` VALUES ('35', '2', '187');
INSERT INTO `recommend` VALUES ('38', '1', '181');

-- ----------------------------
-- Table structure for `type`
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('14', 'FPS游戏');
INSERT INTO `type` VALUES ('15', '枪战游戏');
INSERT INTO `type` VALUES ('16', '推塔游戏');
INSERT INTO `type` VALUES ('17', '策略游戏');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `isadmin` bit(1) DEFAULT NULL,
  `isvalidate` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('32', 'user1', '12456@qq.com', '123456', '张凯丽', '13022502404', '天天创业大厦', '', '');
INSERT INTO `user` VALUES ('33', 'admin', 'admin@qq.com', 'admin', '管理员', '12345678901', null, '', '');
