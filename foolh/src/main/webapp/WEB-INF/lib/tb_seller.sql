/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : weixin

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-01-20 09:43:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_seller`
-- ----------------------------
DROP TABLE IF EXISTS `tb_seller`;
CREATE TABLE `tb_seller` (
  `SELLER_ID` varchar(100) NOT NULL,
  `SELLER_NAME` varchar(100) DEFAULT NULL,
  `PID` varchar(100) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`SELLER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_seller
-- ----------------------------
INSERT INTO `tb_seller` VALUES ('1', '商家20', '0', null, null);
INSERT INTO `tb_seller` VALUES ('2', '商家2', '0', null, null);
INSERT INTO `tb_seller` VALUES ('3', '店铺1', '1', null, null);
INSERT INTO `tb_seller` VALUES ('4', '商家3', '0', null, null);
INSERT INTO `tb_seller` VALUES ('5', '店铺2', '1', null, null);
INSERT INTO `tb_seller` VALUES ('6', '店铺3', '2', null, null);
INSERT INTO `tb_seller` VALUES ('7', '商家4', '0', null, null);
INSERT INTO `tb_seller` VALUES ('8', '店铺5', '7', null, null);
INSERT INTO `tb_seller` VALUES ('9', '店铺6', '7', null, null);
