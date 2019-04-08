/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : yii2blog12

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-04-08 08:47:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goodsName` varchar(300) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `totalPrice` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', 'iphone 8 plugs', '5800.00', '1', null);
INSERT INTO `goods` VALUES ('2', 'vivo R32', '3200.00', '2', null);
INSERT INTO `goods` VALUES ('3', 'NK95', '1600.00', '1', null);
INSERT INTO `goods` VALUES ('4', 'Mi36', '3600.00', '1', null);
INSERT INTO `goods` VALUES ('5', 'vivo9', '1900.00', '1', null);
INSERT INTO `goods` VALUES ('6', 'BJ12', '1300.00', '1', null);
INSERT INTO `goods` VALUES ('7', 'i98', '2300.00', '1', null);
INSERT INTO `goods` VALUES ('8', 'n47', '500.00', '1', null);
INSERT INTO `goods` VALUES ('9', 'm37', '200.00', '1', null);
INSERT INTO `goods` VALUES ('10', 'k87', '100.00', '1', null);
INSERT INTO `goods` VALUES ('11', 'h98', '150.00', '1', null);
INSERT INTO `goods` VALUES ('12', 'o69', '120.00', '1', null);

-- ----------------------------
-- Table structure for `migration`
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', '1554367058');
INSERT INTO `migration` VALUES ('m130524_201442_init', '1554367062');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `expired_at` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '', '$2y$13$KZOgOeggyngXMxV7gXTPvOoZGtPqqt2qHzNKM4az9YmhaerKAB7aG', null, '', '10', '0', '1554544631', '1555149431', 'BMLs5QwwKnyYUjbUYjE97RVUG1Ywgzkr');
