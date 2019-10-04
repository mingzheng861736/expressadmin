/*
 Navicat Premium Data Transfer

 Source Server         : xingqisan
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : 192.168.1.118:3306
 Source Schema         : comadmin2

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 04/10/2019 09:05:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_log`;
CREATE TABLE `admin_log`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '操作',
  `method` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作ip',
  `params` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志写入者,为0为系统,其它为管理员id',
  `ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作类型:1插入,2查询,3修改,4删除',
  `createDate` timestamp(0) NULL DEFAULT NULL COMMENT '操作对象id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 622 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_log
-- ----------------------------
INSERT INTO `admin_log` VALUES (1, 'UserRegisterVo(account=zhangsan, password=123456, area=1, inviteCode=, verifyCode=e7x8)', '用户注册', 'com.zfl.controller.app.shipmentsapp.LoginController.register', '[UserRegisterVo(account=zhangsan, password=123456, area=1, inviteCode=, verifyCode=e7x8), org.apache.shiro.web.servlet.ShiroHttpServletRequest@6d121de6]', '192.168.1.77', '2019-09-30 09:30:07');
INSERT INTO `admin_log` VALUES (2, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@72260520]', '192.168.1.77', '2019-09-30 09:30:18');
INSERT INTO `admin_log` VALUES (3, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@133b1323', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@133b1323]', '192.168.1.77', '2019-09-30 09:31:27');
INSERT INTO `admin_log` VALUES (4, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@14040ac7', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@14040ac7]', '192.168.1.77', '2019-09-30 09:33:53');
INSERT INTO `admin_log` VALUES (5, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@32934c78]', '192.168.1.77', '2019-09-30 09:34:11');
INSERT INTO `admin_log` VALUES (6, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@7ddf40c0', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@7ddf40c0]', '192.168.1.77', '2019-09-30 09:34:34');
INSERT INTO `admin_log` VALUES (7, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@72ea92a9', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@72ea92a9]', '192.168.1.77', '2019-09-30 09:36:27');
INSERT INTO `admin_log` VALUES (8, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@32934c78]', '192.168.1.77', '2019-09-30 09:36:46');
INSERT INTO `admin_log` VALUES (9, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@60509d19', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@60509d19]', '192.168.1.77', '2019-09-30 09:36:48');
INSERT INTO `admin_log` VALUES (10, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@1a8be9b7', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@1a8be9b7]', '192.168.1.77', '2019-09-30 09:37:05');
INSERT INTO `admin_log` VALUES (11, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@b394b4f', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@b394b4f]', '192.168.1.77', '2019-09-30 09:39:30');
INSERT INTO `admin_log` VALUES (12, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@d7bef1a', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@d7bef1a]', '192.168.1.77', '2019-09-30 09:39:33');
INSERT INTO `admin_log` VALUES (13, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@9fe6ba5', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@9fe6ba5]', '192.168.1.77', '2019-09-30 09:39:40');
INSERT INTO `admin_log` VALUES (14, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@30dbe42f', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@30dbe42f]', '192.168.1.77', '2019-09-30 09:39:44');
INSERT INTO `admin_log` VALUES (15, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@7698d7ad', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@7698d7ad]', '192.168.1.77', '2019-09-30 09:39:48');
INSERT INTO `admin_log` VALUES (16, 'TbUserSendAddress(id=1, userId=1, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=南阳师范, isDefault=1, recipients=张三, contactNumber=13598654210)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=1, userId=1, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=南阳师范, isDefault=1, recipients=张三, contactNumber=13598654210), 0]', '192.168.1.77', '2019-09-30 09:43:38');
INSERT INTO `admin_log` VALUES (17, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@43a35815', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@43a35815]', '192.168.1.77', '2019-09-30 09:43:38');
INSERT INTO `admin_log` VALUES (18, 'TbUserSendAddress(id=2, userId=1, provinceCode=河南省, cityCode=南阳市, district=宛城区, detailedAddress=理工, isDefault=1, recipients=张三, contactNumber=13598645226)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=2, userId=1, provinceCode=河南省, cityCode=南阳市, district=宛城区, detailedAddress=理工, isDefault=1, recipients=张三, contactNumber=13598645226), 0]', '192.168.1.77', '2019-09-30 09:44:14');
INSERT INTO `admin_log` VALUES (19, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@1a69131', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@1a69131]', '192.168.1.77', '2019-09-30 09:44:14');
INSERT INTO `admin_log` VALUES (20, 'TbUserSendAddress(id=1, userId=1, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=null, isDefault=1, recipients=张三, contactNumber=13598654210)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=1, userId=1, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=null, isDefault=1, recipients=张三, contactNumber=13598654210), 1]', '192.168.1.77', '2019-09-30 09:44:20');
INSERT INTO `admin_log` VALUES (21, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@622028db', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@622028db]', '192.168.1.77', '2019-09-30 09:44:20');
INSERT INTO `admin_log` VALUES (22, 'TbUserSendAddress(id=3, userId=1, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=车站路与卧龙路交叉口蓝钻星座516, isDefault=1, recipients=张三, contactNumber=13598654212)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=3, userId=1, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=车站路与卧龙路交叉口蓝钻星座516, isDefault=1, recipients=张三, contactNumber=13598654212), 0]', '192.168.1.77', '2019-09-30 09:45:24');
INSERT INTO `admin_log` VALUES (23, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@7b88464a', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@7b88464a]', '192.168.1.77', '2019-09-30 09:45:24');
INSERT INTO `admin_log` VALUES (24, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@3c5c7b71', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@3c5c7b71]', '192.168.1.77', '2019-09-30 09:45:28');
INSERT INTO `admin_log` VALUES (25, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@3a11d3fa', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@3a11d3fa]', '192.168.1.77', '2019-09-30 09:45:32');
INSERT INTO `admin_log` VALUES (26, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@60d785c9', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@60d785c9]', '192.168.1.77', '2019-09-30 09:45:34');
INSERT INTO `admin_log` VALUES (27, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@30be1638', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@30be1638]', '192.168.1.77', '2019-09-30 09:45:36');
INSERT INTO `admin_log` VALUES (28, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@6ab446ea', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@6ab446ea]', '192.168.1.77', '2019-09-30 09:45:36');
INSERT INTO `admin_log` VALUES (29, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@9d99c44', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@9d99c44]', '192.168.1.77', '2019-09-30 09:45:38');
INSERT INTO `admin_log` VALUES (30, 'TbUserSendAddress(id=2, userId=1, provinceCode=河南省, cityCode=南阳市, district=宛城区, detailedAddress=null, isDefault=1, recipients=张三, contactNumber=13598645226)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=2, userId=1, provinceCode=河南省, cityCode=南阳市, district=宛城区, detailedAddress=null, isDefault=1, recipients=张三, contactNumber=13598645226), 1]', '192.168.1.77', '2019-09-30 09:45:44');
INSERT INTO `admin_log` VALUES (31, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@5835ab82', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@5835ab82]', '192.168.1.77', '2019-09-30 09:45:44');
INSERT INTO `admin_log` VALUES (32, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@49d1599d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@49d1599d]', '192.168.1.77', '2019-09-30 09:45:47');
INSERT INTO `admin_log` VALUES (33, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@3301031', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@3301031]', '192.168.1.77', '2019-09-30 09:45:49');
INSERT INTO `admin_log` VALUES (34, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@3898683d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@3898683d]', '192.168.1.77', '2019-09-30 09:45:51');
INSERT INTO `admin_log` VALUES (35, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@85f5159', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@85f5159]', '192.168.1.77', '2019-09-30 09:45:54');
INSERT INTO `admin_log` VALUES (36, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@15b3af8b', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@15b3af8b]', '192.168.1.77', '2019-09-30 09:45:55');
INSERT INTO `admin_log` VALUES (37, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@73b02ad7', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@73b02ad7]', '192.168.1.77', '2019-09-30 09:45:57');
INSERT INTO `admin_log` VALUES (38, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@68158e69', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@68158e69]', '192.168.1.77', '2019-09-30 09:45:58');
INSERT INTO `admin_log` VALUES (39, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@a1ed23a', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@a1ed23a]', '192.168.1.77', '2019-09-30 09:45:59');
INSERT INTO `admin_log` VALUES (40, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@383031a7', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@383031a7]', '192.168.1.77', '2019-09-30 09:46:00');
INSERT INTO `admin_log` VALUES (41, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@3825390d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@3825390d]', '192.168.1.77', '2019-09-30 09:46:01');
INSERT INTO `admin_log` VALUES (42, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@24e5c7f6', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@24e5c7f6]', '192.168.1.77', '2019-09-30 09:46:02');
INSERT INTO `admin_log` VALUES (43, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@625c1ef8', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@625c1ef8]', '192.168.1.77', '2019-09-30 09:46:02');
INSERT INTO `admin_log` VALUES (44, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@2cb44205', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@2cb44205]', '192.168.1.77', '2019-09-30 09:46:03');
INSERT INTO `admin_log` VALUES (45, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@722bce8f', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@722bce8f]', '192.168.1.77', '2019-09-30 09:46:26');
INSERT INTO `admin_log` VALUES (46, 'ReceivingAppUserLogin(account=张三, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=张三, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@32934c78]', '192.168.1.77', '2019-09-30 09:46:58');
INSERT INTO `admin_log` VALUES (47, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@32934c78]', '192.168.1.77', '2019-09-30 09:47:12');
INSERT INTO `admin_log` VALUES (48, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@4b7829b7', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@4b7829b7]', '192.168.1.77', '2019-09-30 09:47:15');
INSERT INTO `admin_log` VALUES (49, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@51b21180', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@51b21180]', '192.168.1.77', '2019-09-30 09:50:11');
INSERT INTO `admin_log` VALUES (50, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@14a917bd', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@14a917bd]', '192.168.1.77', '2019-09-30 09:50:16');
INSERT INTO `admin_log` VALUES (51, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@1f51e727', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@1f51e727]', '192.168.1.77', '2019-09-30 09:50:17');
INSERT INTO `admin_log` VALUES (52, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@75b86414]', '192.168.1.111', '2019-09-30 09:57:37');
INSERT INTO `admin_log` VALUES (53, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@30eabfd9', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@30eabfd9]', '192.168.1.111', '2019-09-30 09:58:14');
INSERT INTO `admin_log` VALUES (54, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@37b061c7', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@37b061c7]', '192.168.1.111', '2019-09-30 09:58:17');
INSERT INTO `admin_log` VALUES (55, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@610d942d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@610d942d]', '192.168.1.111', '2019-09-30 09:58:18');
INSERT INTO `admin_log` VALUES (56, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@3fa8738b', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@3fa8738b]', '192.168.1.111', '2019-09-30 09:58:24');
INSERT INTO `admin_log` VALUES (57, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@66fe1e9f', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@66fe1e9f]', '192.168.1.111', '2019-09-30 09:58:25');
INSERT INTO `admin_log` VALUES (58, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@2db3b142', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@2db3b142]', '192.168.1.111', '2019-09-30 09:58:27');
INSERT INTO `admin_log` VALUES (59, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@29abe1f2', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@29abe1f2]', '192.168.1.111', '2019-09-30 09:58:28');
INSERT INTO `admin_log` VALUES (60, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@206ccf22', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@206ccf22]', '192.168.1.111', '2019-09-30 09:58:32');
INSERT INTO `admin_log` VALUES (61, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@39519661', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@39519661]', '192.168.1.111', '2019-09-30 09:58:33');
INSERT INTO `admin_log` VALUES (62, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@41d5ab3c', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@41d5ab3c]', '192.168.1.111', '2019-09-30 09:58:42');
INSERT INTO `admin_log` VALUES (63, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@731eb3e2', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@731eb3e2]', '192.168.1.111', '2019-09-30 09:58:43');
INSERT INTO `admin_log` VALUES (64, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@7ef8771e', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@7ef8771e]', '192.168.1.111', '2019-09-30 09:58:46');
INSERT INTO `admin_log` VALUES (65, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@6c88ba7c', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@6c88ba7c]', '192.168.1.111', '2019-09-30 09:58:47');
INSERT INTO `admin_log` VALUES (66, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@66cde00a', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@66cde00a]', '192.168.1.111', '2019-09-30 09:58:49');
INSERT INTO `admin_log` VALUES (67, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@16cb6da9', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@16cb6da9]', '192.168.1.111', '2019-09-30 09:58:50');
INSERT INTO `admin_log` VALUES (68, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@1653f35f', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@1653f35f]', '192.168.1.111', '2019-09-30 09:58:51');
INSERT INTO `admin_log` VALUES (69, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@53c50a3b', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@53c50a3b]', '192.168.1.111', '2019-09-30 09:58:51');
INSERT INTO `admin_log` VALUES (70, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@5740171a', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@5740171a]', '192.168.1.111', '2019-09-30 09:58:52');
INSERT INTO `admin_log` VALUES (71, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@6b53011e', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@6b53011e]', '192.168.1.111', '2019-09-30 09:58:53');
INSERT INTO `admin_log` VALUES (72, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@1dea9377', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@1dea9377]', '192.168.1.111', '2019-09-30 09:58:54');
INSERT INTO `admin_log` VALUES (73, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@5b9f85b2', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@5b9f85b2]', '192.168.1.111', '2019-09-30 09:58:56');
INSERT INTO `admin_log` VALUES (74, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@366030d0', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@366030d0]', '192.168.1.111', '2019-09-30 09:58:56');
INSERT INTO `admin_log` VALUES (75, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@469d9bb5', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@469d9bb5]', '192.168.1.111', '2019-09-30 09:58:57');
INSERT INTO `admin_log` VALUES (76, 'Decliver(senAddress={\"provinceCityDist\":\"河南省 南阳市 宛城区 理工\",\"name\":\"张三\",\"phone\":\"13598645226\"}, recipients={\"provinceCityDist\":\"河南省 南阳市 卧龙区 车站路与卧龙路交叉口蓝钻星座516\",\"name\":\"张三\",\"phone\":\"13598654212\"}, goodInfo=打扫房间kgVB的接口, senderType=1, modeOfDespatch=1, payType=1, remarks=电饭锅百分比, orderArea=1, stdmode=1)', '普通会员发货', 'com.zfl.controller.app.shipmentsapp.DeliverController.userDeliver', '[Decliver(senAddress={\"provinceCityDist\":\"河南省 南阳市 宛城区 理工\",\"name\":\"张三\",\"phone\":\"13598645226\"}, recipients={\"provinceCityDist\":\"河南省 南阳市 卧龙区 车站路与卧龙路交叉口蓝钻星座516\",\"name\":\"张三\",\"phone\":\"13598654212\"}, goodInfo=打扫房间kgVB的接口, senderType=1, modeOfDespatch=1, payType=1, remarks=电饭锅百分比, orderArea=1, stdmode=1)]', '192.168.1.111', '2019-09-30 10:01:00');
INSERT INTO `admin_log` VALUES (77, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@4ef68aa9', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@4ef68aa9]', '192.168.1.77', '2019-09-30 10:02:13');
INSERT INTO `admin_log` VALUES (78, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@62174ff0', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@62174ff0]', '192.168.1.77', '2019-09-30 10:02:14');
INSERT INTO `admin_log` VALUES (79, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@5bd068cd', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@5bd068cd]', '192.168.1.77', '2019-09-30 10:02:15');
INSERT INTO `admin_log` VALUES (80, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@2e42c47e', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@2e42c47e]', '192.168.1.77', '2019-09-30 10:02:16');
INSERT INTO `admin_log` VALUES (81, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@2fe3b9ee', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@2fe3b9ee]', '192.168.1.77', '2019-09-30 10:02:17');
INSERT INTO `admin_log` VALUES (82, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@7d60999c', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@7d60999c]', '192.168.1.77', '2019-09-30 10:02:17');
INSERT INTO `admin_log` VALUES (83, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@6007d93b', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@6007d93b]', '192.168.1.77', '2019-09-30 10:02:18');
INSERT INTO `admin_log` VALUES (84, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@dc22d1e', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@dc22d1e]', '192.168.1.77', '2019-09-30 10:02:21');
INSERT INTO `admin_log` VALUES (85, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@467c8538', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@467c8538]', '192.168.1.77', '2019-09-30 10:02:22');
INSERT INTO `admin_log` VALUES (86, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@a568b5e', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@a568b5e]', '192.168.1.77', '2019-09-30 10:02:24');
INSERT INTO `admin_log` VALUES (87, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@1af44d9', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@1af44d9]', '192.168.1.77', '2019-09-30 10:02:25');
INSERT INTO `admin_log` VALUES (88, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@41f512ab', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@41f512ab]', '192.168.1.77', '2019-09-30 10:02:26');
INSERT INTO `admin_log` VALUES (89, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@2fc9ae5c]', '192.168.1.77', '2019-09-30 10:03:28');
INSERT INTO `admin_log` VALUES (90, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@31044b8', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@31044b8]', '192.168.1.77', '2019-09-30 10:03:28');
INSERT INTO `admin_log` VALUES (91, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@77a44554', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@77a44554]', '192.168.1.77', '2019-09-30 10:03:28');
INSERT INTO `admin_log` VALUES (92, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@7f350332', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@7f350332]', '192.168.1.77', '2019-09-30 10:03:28');
INSERT INTO `admin_log` VALUES (93, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@a3503d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@a3503d]', '192.168.1.77', '2019-09-30 10:03:28');
INSERT INTO `admin_log` VALUES (94, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@4e928458', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@4e928458]', '192.168.1.77', '2019-09-30 10:04:02');
INSERT INTO `admin_log` VALUES (95, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@1227c206', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@1227c206]', '192.168.1.77', '2019-09-30 10:06:58');
INSERT INTO `admin_log` VALUES (96, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@2d7b4e92', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@2d7b4e92]', '192.168.1.77', '2019-09-30 10:06:59');
INSERT INTO `admin_log` VALUES (97, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@5e5aeff6', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@5e5aeff6]', '192.168.1.77', '2019-09-30 10:07:00');
INSERT INTO `admin_log` VALUES (98, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@16228740', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@16228740]', '192.168.1.77', '2019-09-30 10:07:01');
INSERT INTO `admin_log` VALUES (99, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@179b403b', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@179b403b]', '192.168.1.77', '2019-09-30 10:07:02');
INSERT INTO `admin_log` VALUES (100, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@1675b1e0', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@1675b1e0]', '192.168.1.77', '2019-09-30 10:07:02');
INSERT INTO `admin_log` VALUES (101, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@3d28ca65', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@3d28ca65]', '192.168.1.77', '2019-09-30 10:07:03');
INSERT INTO `admin_log` VALUES (102, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@2b30e0a5', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@2b30e0a5]', '192.168.1.77', '2019-09-30 10:07:04');
INSERT INTO `admin_log` VALUES (103, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@664ebb23', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@664ebb23]', '192.168.1.77', '2019-09-30 10:07:05');
INSERT INTO `admin_log` VALUES (104, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@1f240ba1', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@1f240ba1]', '192.168.1.77', '2019-09-30 10:07:06');
INSERT INTO `admin_log` VALUES (105, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@4e267b8a', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@4e267b8a]', '192.168.1.77', '2019-09-30 10:07:12');
INSERT INTO `admin_log` VALUES (106, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@65a54e3e', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@65a54e3e]', '192.168.1.77', '2019-09-30 10:07:13');
INSERT INTO `admin_log` VALUES (107, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@68721bb', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@68721bb]', '192.168.1.77', '2019-09-30 10:07:17');
INSERT INTO `admin_log` VALUES (108, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@79bb8828', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@79bb8828]', '192.168.1.77', '2019-09-30 10:07:18');
INSERT INTO `admin_log` VALUES (109, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@3f9e6226', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@3f9e6226]', '192.168.1.77', '2019-09-30 10:07:20');
INSERT INTO `admin_log` VALUES (110, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@6a0f226e', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@6a0f226e]', '192.168.1.77', '2019-09-30 10:07:20');
INSERT INTO `admin_log` VALUES (111, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@5c86c767', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@5c86c767]', '192.168.1.77', '2019-09-30 10:07:26');
INSERT INTO `admin_log` VALUES (112, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@947b473', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@947b473]', '192.168.1.77', '2019-09-30 10:07:27');
INSERT INTO `admin_log` VALUES (113, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@4fec76fe', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@4fec76fe]', '192.168.1.77', '2019-09-30 10:07:27');
INSERT INTO `admin_log` VALUES (114, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@24e10223', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@24e10223]', '192.168.1.77', '2019-09-30 10:07:28');
INSERT INTO `admin_log` VALUES (115, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@1992f765', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@1992f765]', '192.168.1.77', '2019-09-30 10:07:29');
INSERT INTO `admin_log` VALUES (116, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@23b3e99b', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@23b3e99b]', '192.168.1.77', '2019-09-30 10:07:30');
INSERT INTO `admin_log` VALUES (117, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@14d5a96a', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@14d5a96a]', '192.168.1.77', '2019-09-30 10:07:31');
INSERT INTO `admin_log` VALUES (118, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@29fca933]', '192.168.1.77', '2019-09-30 10:22:15');
INSERT INTO `admin_log` VALUES (119, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@86ba49d]', '192.168.1.77', '2019-09-30 10:25:16');
INSERT INTO `admin_log` VALUES (120, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@48d8483d]', '192.168.1.77', '2019-09-30 10:25:16');
INSERT INTO `admin_log` VALUES (121, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@48d8483d]', '192.168.1.77', '2019-09-30 10:28:05');
INSERT INTO `admin_log` VALUES (122, 'org.apache.shiro.web.servlet.ShiroHttpServletRequest@47b43a5a', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.shiro.web.servlet.ShiroHttpServletRequest@47b43a5a]', '192.168.1.77', '2019-09-30 10:28:26');
INSERT INTO `admin_log` VALUES (123, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@3d7a57cd]', '192.168.1.111', '2019-09-30 10:45:32');
INSERT INTO `admin_log` VALUES (124, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@3d7a57cd]', '192.168.1.77', '2019-09-30 10:46:16');
INSERT INTO `admin_log` VALUES (125, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@15d16481]', '192.168.1.111', '2019-09-30 10:59:10');
INSERT INTO `admin_log` VALUES (126, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@15d16481]', '192.168.1.55', '2019-09-30 10:59:40');
INSERT INTO `admin_log` VALUES (127, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@32775759]', '192.168.1.111', '2019-09-30 11:15:28');
INSERT INTO `admin_log` VALUES (128, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@701cdd0d]', '192.168.1.111', '2019-09-30 11:15:28');
INSERT INTO `admin_log` VALUES (129, 'org.apache.catalina.connector.RequestFacade@1da2adf4', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@1da2adf4]', '192.168.1.111', '2019-09-30 11:17:00');
INSERT INTO `admin_log` VALUES (130, 'org.apache.catalina.connector.RequestFacade@45eaa00c', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@45eaa00c]', '192.168.1.77', '2019-09-30 11:17:06');
INSERT INTO `admin_log` VALUES (131, 'org.apache.catalina.connector.RequestFacade@1da2adf4', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@1da2adf4]', '192.168.1.77', '2019-09-30 11:17:06');
INSERT INTO `admin_log` VALUES (132, 'org.apache.catalina.connector.RequestFacade@1da2adf4', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@1da2adf4]', '192.168.1.77', '2019-09-30 11:17:12');
INSERT INTO `admin_log` VALUES (133, 'org.apache.catalina.connector.RequestFacade@30d55dae', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@30d55dae]', '192.168.1.77', '2019-09-30 11:17:12');
INSERT INTO `admin_log` VALUES (134, 'org.apache.catalina.connector.RequestFacade@30d55dae', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@30d55dae]', '192.168.1.77', '2019-09-30 11:17:13');
INSERT INTO `admin_log` VALUES (135, 'org.apache.catalina.connector.RequestFacade@1da2adf4', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@1da2adf4]', '192.168.1.111', '2019-09-30 11:17:31');
INSERT INTO `admin_log` VALUES (136, 'org.apache.catalina.connector.RequestFacade@1da2adf4', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@1da2adf4]', '192.168.1.111', '2019-09-30 11:17:32');
INSERT INTO `admin_log` VALUES (137, 'org.apache.catalina.connector.RequestFacade@1da2adf4', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@1da2adf4]', '192.168.1.111', '2019-09-30 11:17:33');
INSERT INTO `admin_log` VALUES (138, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@32775759]', '192.168.1.55', '2019-09-30 11:17:42');
INSERT INTO `admin_log` VALUES (139, 'org.apache.catalina.connector.RequestFacade@1da2adf4', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@1da2adf4]', '192.168.1.111', '2019-09-30 11:17:42');
INSERT INTO `admin_log` VALUES (140, 'org.apache.catalina.connector.RequestFacade@30d55dae', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@30d55dae]', '192.168.1.111', '2019-09-30 11:17:43');
INSERT INTO `admin_log` VALUES (141, 'org.apache.catalina.connector.RequestFacade@45eaa00c', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@45eaa00c]', '192.168.1.55', '2019-09-30 11:17:57');
INSERT INTO `admin_log` VALUES (142, 'Decliver(senAddress={\"provinceCityDist\":\"河南省 南阳市 宛城区 理工\",\"name\":\"张三\",\"phone\":\"13598645226\"}, recipients={}, goodInfo=dfg, senderType=1, modeOfDespatch=1, payType=1, remarks=dgdf, orderArea=1, stdmode=1)', '普通会员发货', 'com.zfl.controller.app.shipmentsapp.DeliverController.userDeliver', '[Decliver(senAddress={\"provinceCityDist\":\"河南省 南阳市 宛城区 理工\",\"name\":\"张三\",\"phone\":\"13598645226\"}, recipients={}, goodInfo=dfg, senderType=1, modeOfDespatch=1, payType=1, remarks=dgdf, orderArea=1, stdmode=1)]', '192.168.1.111', '2019-09-30 11:18:47');
INSERT INTO `admin_log` VALUES (143, 'org.apache.catalina.connector.RequestFacade@30d55dae', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@30d55dae]', '192.168.1.111', '2019-09-30 11:20:44');
INSERT INTO `admin_log` VALUES (144, 'org.apache.catalina.connector.RequestFacade@30d55dae', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@30d55dae]', '192.168.1.111', '2019-09-30 11:21:04');
INSERT INTO `admin_log` VALUES (145, 'org.apache.catalina.connector.RequestFacade@30d55dae', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@30d55dae]', '192.168.1.111', '2019-09-30 11:21:06');
INSERT INTO `admin_log` VALUES (146, 'TbUserSendAddress(id=3, userId=1, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=null, isDefault=0, recipients=张三, contactNumber=13598654212)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=3, userId=1, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=null, isDefault=0, recipients=张三, contactNumber=13598654212), 1]', '192.168.1.111', '2019-09-30 11:21:13');
INSERT INTO `admin_log` VALUES (147, 'org.apache.catalina.connector.RequestFacade@30d55dae', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@30d55dae]', '192.168.1.111', '2019-09-30 11:21:13');
INSERT INTO `admin_log` VALUES (148, 'org.apache.catalina.connector.RequestFacade@30d55dae', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@30d55dae]', '192.168.1.111', '2019-09-30 11:21:16');
INSERT INTO `admin_log` VALUES (149, 'org.apache.catalina.connector.RequestFacade@30d55dae', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@30d55dae]', '192.168.1.111', '2019-09-30 11:21:18');
INSERT INTO `admin_log` VALUES (150, 'org.apache.catalina.connector.RequestFacade@30d55dae', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@30d55dae]', '192.168.1.111', '2019-09-30 11:21:19');
INSERT INTO `admin_log` VALUES (151, 'org.apache.catalina.connector.RequestFacade@30d55dae', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@30d55dae]', '192.168.1.111', '2019-09-30 11:21:21');
INSERT INTO `admin_log` VALUES (152, 'org.apache.catalina.connector.RequestFacade@30d55dae', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@30d55dae]', '192.168.1.111', '2019-09-30 11:21:22');
INSERT INTO `admin_log` VALUES (153, 'org.apache.catalina.connector.RequestFacade@30d55dae', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@30d55dae]', '192.168.1.111', '2019-09-30 11:21:24');
INSERT INTO `admin_log` VALUES (154, 'org.apache.catalina.connector.RequestFacade@30d55dae', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@30d55dae]', '192.168.1.111', '2019-09-30 11:21:25');
INSERT INTO `admin_log` VALUES (155, 'org.apache.catalina.connector.RequestFacade@30d55dae', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@30d55dae]', '192.168.1.111', '2019-09-30 11:21:27');
INSERT INTO `admin_log` VALUES (156, 'org.apache.catalina.connector.RequestFacade@30d55dae', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@30d55dae]', '192.168.1.111', '2019-09-30 11:21:28');
INSERT INTO `admin_log` VALUES (157, 'org.apache.catalina.connector.RequestFacade@30d55dae', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@30d55dae]', '192.168.1.111', '2019-09-30 11:21:40');
INSERT INTO `admin_log` VALUES (158, 'org.apache.catalina.connector.RequestFacade@30d55dae', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@30d55dae]', '192.168.1.111', '2019-09-30 11:21:41');
INSERT INTO `admin_log` VALUES (159, 'org.apache.catalina.connector.RequestFacade@30d55dae', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@30d55dae]', '192.168.1.111', '2019-09-30 11:21:43');
INSERT INTO `admin_log` VALUES (160, 'org.apache.catalina.connector.RequestFacade@30d55dae', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@30d55dae]', '192.168.1.111', '2019-09-30 11:21:44');
INSERT INTO `admin_log` VALUES (161, 'org.apache.catalina.connector.RequestFacade@30d55dae', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@30d55dae]', '192.168.1.111', '2019-09-30 11:21:45');
INSERT INTO `admin_log` VALUES (162, 'org.apache.catalina.connector.RequestFacade@30d55dae', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@30d55dae]', '192.168.1.111', '2019-09-30 11:21:46');
INSERT INTO `admin_log` VALUES (163, 'Decliver(senAddress={\"provinceCityDist\":\"河南省 南阳市 宛城区 理工\",\"name\":\"张三\",\"phone\":\"13598645226\"}, recipients={\"provinceCityDist\":\"河南省 南阳市 卧龙区 车站路与卧龙路交叉口蓝钻星座516\",\"name\":\"张三\",\"phone\":\"13598654212\"}, goodInfo=更好就买哪个好, senderType=1, modeOfDespatch=1, payType=1, remarks=非共和国, orderArea=1, stdmode=4)', '普通会员发货', 'com.zfl.controller.app.shipmentsapp.DeliverController.userDeliver', '[Decliver(senAddress={\"provinceCityDist\":\"河南省 南阳市 宛城区 理工\",\"name\":\"张三\",\"phone\":\"13598645226\"}, recipients={\"provinceCityDist\":\"河南省 南阳市 卧龙区 车站路与卧龙路交叉口蓝钻星座516\",\"name\":\"张三\",\"phone\":\"13598654212\"}, goodInfo=更好就买哪个好, senderType=1, modeOfDespatch=1, payType=1, remarks=非共和国, orderArea=1, stdmode=4)]', '192.168.1.111', '2019-09-30 11:22:13');
INSERT INTO `admin_log` VALUES (164, 'UserRegisterVo(account=王五, password=123456, area=1, inviteCode=, verifyCode=ye3q)', '用户注册', 'com.zfl.controller.app.shipmentsapp.LoginController.register', '[UserRegisterVo(account=王五, password=123456, area=1, inviteCode=, verifyCode=ye3q), org.apache.catalina.connector.RequestFacade@96c7f36]', '192.168.1.112', '2019-09-30 11:22:45');
INSERT INTO `admin_log` VALUES (165, 'ReceivingAppUserLogin(account=王五, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=王五, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@3aef8e7e]', '192.168.1.112', '2019-09-30 11:23:03');
INSERT INTO `admin_log` VALUES (166, 'org.apache.catalina.connector.RequestFacade@5401e66c', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@5401e66c]', '192.168.1.112', '2019-09-30 11:26:20');
INSERT INTO `admin_log` VALUES (167, 'org.apache.catalina.connector.RequestFacade@3b8b7a17', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3b8b7a17]', '192.168.1.112', '2019-09-30 11:26:20');
INSERT INTO `admin_log` VALUES (168, 'org.apache.catalina.connector.RequestFacade@268909a6', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@268909a6]', '192.168.1.112', '2019-09-30 11:26:20');
INSERT INTO `admin_log` VALUES (169, 'org.apache.catalina.connector.RequestFacade@a873605', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@a873605]', '192.168.1.112', '2019-09-30 11:26:20');
INSERT INTO `admin_log` VALUES (170, 'ReceivingAppUserLogin(account=王五, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=王五, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@1aa17a5c]', '192.168.1.112', '2019-09-30 11:27:42');
INSERT INTO `admin_log` VALUES (171, 'org.apache.catalina.connector.RequestFacade@a873605', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@a873605]', '192.168.1.112', '2019-09-30 11:31:25');
INSERT INTO `admin_log` VALUES (172, 'org.apache.catalina.connector.RequestFacade@a873605', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@a873605]', '192.168.1.112', '2019-09-30 11:31:30');
INSERT INTO `admin_log` VALUES (173, 'org.apache.catalina.connector.RequestFacade@a873605', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@a873605]', '192.168.1.112', '2019-09-30 11:31:33');
INSERT INTO `admin_log` VALUES (174, 'org.apache.catalina.connector.RequestFacade@a873605', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@a873605]', '192.168.1.112', '2019-09-30 11:31:35');
INSERT INTO `admin_log` VALUES (175, 'org.apache.catalina.connector.RequestFacade@a873605', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@a873605]', '192.168.1.112', '2019-09-30 11:31:37');
INSERT INTO `admin_log` VALUES (176, 'org.apache.catalina.connector.RequestFacade@a873605', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@a873605]', '192.168.1.112', '2019-09-30 11:31:40');
INSERT INTO `admin_log` VALUES (177, 'org.apache.catalina.connector.RequestFacade@268909a6', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@268909a6]', '192.168.1.112', '2019-09-30 11:31:55');
INSERT INTO `admin_log` VALUES (178, 'ReceivingAppUserLogin(account=测试账号01, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=测试账号01, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@592aef04]', '192.168.1.111', '2019-09-30 11:36:54');
INSERT INTO `admin_log` VALUES (179, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@592aef04]', '192.168.1.111', '2019-09-30 11:37:11');
INSERT INTO `admin_log` VALUES (180, 'org.apache.catalina.connector.RequestFacade@1376d9e7', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@1376d9e7]', '192.168.1.112', '2019-09-30 11:38:36');
INSERT INTO `admin_log` VALUES (181, 'org.apache.catalina.connector.RequestFacade@70ca67b6', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@70ca67b6]', '192.168.1.112', '2019-09-30 11:40:42');
INSERT INTO `admin_log` VALUES (182, 'org.apache.catalina.connector.RequestFacade@70ca67b6', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@70ca67b6]', '192.168.1.112', '2019-09-30 11:41:07');
INSERT INTO `admin_log` VALUES (183, 'TbUserSendAddress(id=4, userId=2, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=稍等230号, isDefault=1, recipients=王五, contactNumber=13782152078)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=4, userId=2, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=稍等230号, isDefault=1, recipients=王五, contactNumber=13782152078), 0]', '192.168.1.112', '2019-09-30 11:42:56');
INSERT INTO `admin_log` VALUES (184, 'TbUserSendAddress(id=5, userId=2, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=稍等230号, isDefault=1, recipients=王五, contactNumber=13782152078)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=5, userId=2, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=稍等230号, isDefault=1, recipients=王五, contactNumber=13782152078), 0]', '192.168.1.112', '2019-09-30 11:42:56');
INSERT INTO `admin_log` VALUES (185, 'TbUserSendAddress(id=7, userId=2, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=稍等230号, isDefault=1, recipients=王五, contactNumber=13782152078)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=7, userId=2, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=稍等230号, isDefault=1, recipients=王五, contactNumber=13782152078), 0]', '192.168.1.112', '2019-09-30 11:42:56');
INSERT INTO `admin_log` VALUES (186, 'TbUserSendAddress(id=6, userId=2, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=稍等230号, isDefault=1, recipients=王五, contactNumber=13782152078)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=6, userId=2, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=稍等230号, isDefault=1, recipients=王五, contactNumber=13782152078), 0]', '192.168.1.112', '2019-09-30 11:42:56');
INSERT INTO `admin_log` VALUES (187, 'TbUserSendAddress(id=8, userId=2, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=稍等230号, isDefault=1, recipients=王五, contactNumber=13782152078)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=8, userId=2, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=稍等230号, isDefault=1, recipients=王五, contactNumber=13782152078), 0]', '192.168.1.112', '2019-09-30 11:42:56');
INSERT INTO `admin_log` VALUES (188, 'TbUserSendAddress(id=9, userId=2, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=稍等230号, isDefault=1, recipients=王五, contactNumber=13782152078)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=9, userId=2, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=稍等230号, isDefault=1, recipients=王五, contactNumber=13782152078), 0]', '192.168.1.112', '2019-09-30 11:42:56');
INSERT INTO `admin_log` VALUES (189, 'TbUserSendAddress(id=10, userId=2, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=稍等230号, isDefault=1, recipients=王五, contactNumber=13782152078)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=10, userId=2, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=稍等230号, isDefault=1, recipients=王五, contactNumber=13782152078), 0]', '192.168.1.112', '2019-09-30 11:42:56');
INSERT INTO `admin_log` VALUES (190, 'TbUserSendAddress(id=11, userId=2, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=稍等230号, isDefault=1, recipients=王五, contactNumber=13782152078)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=11, userId=2, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=稍等230号, isDefault=1, recipients=王五, contactNumber=13782152078), 0]', '192.168.1.112', '2019-09-30 11:42:56');
INSERT INTO `admin_log` VALUES (191, 'TbUserSendAddress(id=12, userId=2, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=稍等230号, isDefault=1, recipients=王五, contactNumber=13782152078)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=12, userId=2, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=稍等230号, isDefault=1, recipients=王五, contactNumber=13782152078), 0]', '192.168.1.112', '2019-09-30 11:42:56');
INSERT INTO `admin_log` VALUES (192, 'TbUserSendAddress(id=13, userId=2, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=稍等230号, isDefault=1, recipients=王五, contactNumber=13782152078)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=13, userId=2, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=稍等230号, isDefault=1, recipients=王五, contactNumber=13782152078), 0]', '192.168.1.112', '2019-09-30 11:42:56');
INSERT INTO `admin_log` VALUES (193, 'TbUserSendAddress(id=14, userId=2, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=稍等230号, isDefault=1, recipients=王五, contactNumber=13782152078)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=14, userId=2, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=稍等230号, isDefault=1, recipients=王五, contactNumber=13782152078), 0]', '192.168.1.112', '2019-09-30 11:42:56');
INSERT INTO `admin_log` VALUES (194, 'TbUserSendAddress(id=15, userId=2, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=稍等230号, isDefault=1, recipients=王五, contactNumber=13782152078)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=15, userId=2, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=稍等230号, isDefault=1, recipients=王五, contactNumber=13782152078), 0]', '192.168.1.112', '2019-09-30 11:42:56');
INSERT INTO `admin_log` VALUES (195, 'org.apache.catalina.connector.RequestFacade@393803a4', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@393803a4]', '192.168.1.112', '2019-09-30 11:42:56');
INSERT INTO `admin_log` VALUES (196, 'TbUserSendAddress(id=16, userId=2, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=稍等230号, isDefault=1, recipients=王五, contactNumber=13782152078)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=16, userId=2, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=稍等230号, isDefault=1, recipients=王五, contactNumber=13782152078), 0]', '192.168.1.112', '2019-09-30 11:42:56');
INSERT INTO `admin_log` VALUES (197, 'TbUserSendAddress(id=17, userId=2, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=稍等230号, isDefault=1, recipients=王五, contactNumber=13782152078)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=17, userId=2, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=稍等230号, isDefault=1, recipients=王五, contactNumber=13782152078), 0]', '192.168.1.112', '2019-09-30 11:42:56');
INSERT INTO `admin_log` VALUES (198, 'TbUserSendAddress(id=19, userId=2, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=稍等230号, isDefault=1, recipients=王五, contactNumber=13782152078)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=19, userId=2, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=稍等230号, isDefault=1, recipients=王五, contactNumber=13782152078), 0]', '192.168.1.112', '2019-09-30 11:42:56');
INSERT INTO `admin_log` VALUES (199, 'TbUserSendAddress(id=18, userId=2, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=稍等230号, isDefault=1, recipients=王五, contactNumber=13782152078)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=18, userId=2, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=稍等230号, isDefault=1, recipients=王五, contactNumber=13782152078), 0]', '192.168.1.112', '2019-09-30 11:42:56');
INSERT INTO `admin_log` VALUES (200, 'TbUserSendAddress(id=20, userId=2, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=稍等230号, isDefault=1, recipients=王五, contactNumber=13782152078)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=20, userId=2, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=稍等230号, isDefault=1, recipients=王五, contactNumber=13782152078), 0]', '192.168.1.112', '2019-09-30 11:42:56');
INSERT INTO `admin_log` VALUES (201, 'TbUserSendAddress(id=5, userId=2, provinceCode=null, cityCode=null, district=null, detailedAddress=null, isDefault=null, recipients=null, contactNumber=null)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=5, userId=2, provinceCode=null, cityCode=null, district=null, detailedAddress=null, isDefault=null, recipients=null, contactNumber=null), 2]', '192.168.1.112', '2019-09-30 11:43:08');
INSERT INTO `admin_log` VALUES (202, 'org.apache.catalina.connector.RequestFacade@64383d9f', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@64383d9f]', '192.168.1.112', '2019-09-30 11:43:08');
INSERT INTO `admin_log` VALUES (203, 'TbUserSendAddress(id=8, userId=2, provinceCode=null, cityCode=null, district=null, detailedAddress=null, isDefault=null, recipients=null, contactNumber=null)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=8, userId=2, provinceCode=null, cityCode=null, district=null, detailedAddress=null, isDefault=null, recipients=null, contactNumber=null), 2]', '192.168.1.112', '2019-09-30 11:43:17');
INSERT INTO `admin_log` VALUES (204, 'org.apache.catalina.connector.RequestFacade@64383d9f', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@64383d9f]', '192.168.1.112', '2019-09-30 11:43:17');
INSERT INTO `admin_log` VALUES (205, 'TbUserSendAddress(id=6, userId=2, provinceCode=null, cityCode=null, district=null, detailedAddress=null, isDefault=null, recipients=null, contactNumber=null)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=6, userId=2, provinceCode=null, cityCode=null, district=null, detailedAddress=null, isDefault=null, recipients=null, contactNumber=null), 2]', '192.168.1.112', '2019-09-30 11:43:21');
INSERT INTO `admin_log` VALUES (206, 'org.apache.catalina.connector.RequestFacade@64383d9f', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@64383d9f]', '192.168.1.112', '2019-09-30 11:43:21');
INSERT INTO `admin_log` VALUES (207, 'TbUserSendAddress(id=7, userId=2, provinceCode=null, cityCode=null, district=null, detailedAddress=null, isDefault=null, recipients=null, contactNumber=null)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=7, userId=2, provinceCode=null, cityCode=null, district=null, detailedAddress=null, isDefault=null, recipients=null, contactNumber=null), 2]', '192.168.1.112', '2019-09-30 11:43:26');
INSERT INTO `admin_log` VALUES (208, 'org.apache.catalina.connector.RequestFacade@64383d9f', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@64383d9f]', '192.168.1.112', '2019-09-30 11:43:26');
INSERT INTO `admin_log` VALUES (209, 'TbUserSendAddress(id=4, userId=2, provinceCode=null, cityCode=null, district=null, detailedAddress=null, isDefault=null, recipients=null, contactNumber=null)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=4, userId=2, provinceCode=null, cityCode=null, district=null, detailedAddress=null, isDefault=null, recipients=null, contactNumber=null), 2]', '192.168.1.112', '2019-09-30 11:44:48');
INSERT INTO `admin_log` VALUES (210, 'org.apache.catalina.connector.RequestFacade@10d72db8', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@10d72db8]', '192.168.1.112', '2019-09-30 11:44:48');
INSERT INTO `admin_log` VALUES (211, 'org.apache.catalina.connector.RequestFacade@19b9cca3', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@19b9cca3]', '192.168.1.112', '2019-09-30 11:44:48');
INSERT INTO `admin_log` VALUES (212, 'org.apache.catalina.connector.RequestFacade@7dfece60', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@7dfece60]', '192.168.1.112', '2019-09-30 11:44:48');
INSERT INTO `admin_log` VALUES (213, 'org.apache.catalina.connector.RequestFacade@35868cd3', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@35868cd3]', '192.168.1.112', '2019-09-30 11:44:48');
INSERT INTO `admin_log` VALUES (214, 'org.apache.catalina.connector.RequestFacade@7dfece60', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@7dfece60]', '192.168.1.112', '2019-09-30 11:44:48');
INSERT INTO `admin_log` VALUES (215, 'org.apache.catalina.connector.RequestFacade@7dfece60', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@7dfece60]', '192.168.1.112', '2019-09-30 11:44:50');
INSERT INTO `admin_log` VALUES (216, 'org.apache.catalina.connector.RequestFacade@7dfece60', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@7dfece60]', '192.168.1.112', '2019-09-30 11:44:55');
INSERT INTO `admin_log` VALUES (217, 'org.apache.catalina.connector.RequestFacade@7dfece60', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@7dfece60]', '192.168.1.112', '2019-09-30 11:45:00');
INSERT INTO `admin_log` VALUES (218, 'org.apache.catalina.connector.RequestFacade@7463da20', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@7463da20]', '192.168.1.112', '2019-09-30 11:45:07');
INSERT INTO `admin_log` VALUES (219, 'org.apache.catalina.connector.RequestFacade@379f0668', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@379f0668]', '192.168.1.112', '2019-09-30 11:45:07');
INSERT INTO `admin_log` VALUES (220, 'TbUserSendAddress(id=21, userId=2, provinceCode=河南省, cityCode=南阳市, district=宛城区, detailedAddress=v修自行车203, isDefault=1, recipients=王五, contactNumber=13782152078)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=21, userId=2, provinceCode=河南省, cityCode=南阳市, district=宛城区, detailedAddress=v修自行车203, isDefault=1, recipients=王五, contactNumber=13782152078), 0]', '192.168.1.112', '2019-09-30 11:45:42');
INSERT INTO `admin_log` VALUES (221, 'org.apache.catalina.connector.RequestFacade@7dfece60', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@7dfece60]', '192.168.1.112', '2019-09-30 11:45:42');
INSERT INTO `admin_log` VALUES (222, 'org.apache.catalina.connector.RequestFacade@7dfece60', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@7dfece60]', '192.168.1.112', '2019-09-30 11:45:45');
INSERT INTO `admin_log` VALUES (223, 'org.apache.catalina.connector.RequestFacade@7dfece60', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@7dfece60]', '192.168.1.112', '2019-09-30 11:45:50');
INSERT INTO `admin_log` VALUES (224, 'org.apache.catalina.connector.RequestFacade@7dfece60', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@7dfece60]', '192.168.1.112', '2019-09-30 11:45:52');
INSERT INTO `admin_log` VALUES (225, 'org.apache.catalina.connector.RequestFacade@7dfece60', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@7dfece60]', '192.168.1.112', '2019-09-30 11:45:56');
INSERT INTO `admin_log` VALUES (226, 'org.apache.catalina.connector.RequestFacade@7dfece60', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@7dfece60]', '192.168.1.112', '2019-09-30 11:46:00');
INSERT INTO `admin_log` VALUES (227, 'org.apache.catalina.connector.RequestFacade@7dfece60', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@7dfece60]', '192.168.1.112', '2019-09-30 11:46:03');
INSERT INTO `admin_log` VALUES (228, 'org.apache.catalina.connector.RequestFacade@7dfece60', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@7dfece60]', '192.168.1.112', '2019-09-30 11:46:06');
INSERT INTO `admin_log` VALUES (229, 'Decliver(senAddress={\"provinceCityDist\":\"河南省 南阳市 宛城区 v修自行车203\",\"name\":\"王五\",\"phone\":\"13782152078\"}, recipients={}, goodInfo=文件, senderType=1, modeOfDespatch=1, payType=1, remarks=, orderArea=1, stdmode=0)', '普通会员发货', 'com.zfl.controller.app.shipmentsapp.DeliverController.userDeliver', '[Decliver(senAddress={\"provinceCityDist\":\"河南省 南阳市 宛城区 v修自行车203\",\"name\":\"王五\",\"phone\":\"13782152078\"}, recipients={}, goodInfo=文件, senderType=1, modeOfDespatch=1, payType=1, remarks=, orderArea=1, stdmode=0)]', '192.168.1.112', '2019-09-30 11:48:19');
INSERT INTO `admin_log` VALUES (230, 'org.apache.catalina.connector.RequestFacade@21c670f4', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@21c670f4]', '192.168.1.112', '2019-09-30 11:48:54');
INSERT INTO `admin_log` VALUES (231, 'org.apache.catalina.connector.RequestFacade@21c670f4', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@21c670f4]', '192.168.1.112', '2019-09-30 11:48:56');
INSERT INTO `admin_log` VALUES (232, 'org.apache.catalina.connector.RequestFacade@7f4f3be', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@7f4f3be]', '192.168.1.112', '2019-09-30 11:49:02');
INSERT INTO `admin_log` VALUES (233, 'org.apache.catalina.connector.RequestFacade@1041f23e', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@1041f23e]', '192.168.1.55', '2019-09-30 11:59:25');
INSERT INTO `admin_log` VALUES (234, 'org.apache.catalina.connector.RequestFacade@7d16535f', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@7d16535f]', '192.168.1.55', '2019-09-30 11:59:58');
INSERT INTO `admin_log` VALUES (235, 'org.apache.catalina.connector.RequestFacade@7d16535f', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@7d16535f]', '192.168.1.55', '2019-09-30 12:00:01');
INSERT INTO `admin_log` VALUES (236, 'UserRegisterVo(account=20190930, password=123456, area=1, inviteCode=, verifyCode=q2ht)', '用户注册', 'com.zfl.controller.app.shipmentsapp.LoginController.register', '[UserRegisterVo(account=20190930, password=123456, area=1, inviteCode=, verifyCode=q2ht), org.apache.catalina.connector.RequestFacade@1041f23e]', '192.168.1.55', '2019-09-30 12:00:47');
INSERT INTO `admin_log` VALUES (237, 'ReceivingAppUserLogin(account=20190930, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=20190930, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@266b41f9]', '192.168.1.55', '2019-09-30 12:00:57');
INSERT INTO `admin_log` VALUES (238, 'org.apache.catalina.connector.RequestFacade@1041f23e', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@1041f23e]', '192.168.1.55', '2019-09-30 12:01:00');
INSERT INTO `admin_log` VALUES (239, 'org.apache.catalina.connector.RequestFacade@1041f23e', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@1041f23e]', '192.168.1.55', '2019-09-30 12:01:03');
INSERT INTO `admin_log` VALUES (240, 'org.apache.catalina.connector.RequestFacade@1041f23e', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@1041f23e]', '192.168.1.55', '2019-09-30 12:01:09');
INSERT INTO `admin_log` VALUES (241, 'org.apache.catalina.connector.RequestFacade@1041f23e', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@1041f23e]', '192.168.1.55', '2019-09-30 12:01:11');
INSERT INTO `admin_log` VALUES (242, 'org.apache.catalina.connector.RequestFacade@1041f23e', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@1041f23e]', '192.168.1.55', '2019-09-30 12:01:11');
INSERT INTO `admin_log` VALUES (243, 'org.apache.catalina.connector.RequestFacade@737e942a', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@737e942a]', '192.168.1.111', '2019-09-30 12:02:32');
INSERT INTO `admin_log` VALUES (244, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@4b60a5cc]', '192.168.1.111', '2019-09-30 12:02:32');
INSERT INTO `admin_log` VALUES (245, 'ReceivingAppUserLogin(account=20190930, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=20190930, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@773896ae]', '192.168.1.77', '2019-09-30 12:02:32');
INSERT INTO `admin_log` VALUES (246, 'org.apache.catalina.connector.RequestFacade@2912aad6', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2912aad6]', '192.168.1.111', '2019-09-30 12:02:32');
INSERT INTO `admin_log` VALUES (247, 'org.apache.catalina.connector.RequestFacade@25cffdf2', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@25cffdf2]', '192.168.1.111', '2019-09-30 12:02:32');
INSERT INTO `admin_log` VALUES (248, 'ReceivingAppUserLogin(account=20190930, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=20190930, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@42069c14]', '192.168.1.55', '2019-09-30 12:02:32');
INSERT INTO `admin_log` VALUES (249, 'org.apache.catalina.connector.RequestFacade@50066ac9', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@50066ac9]', '192.168.1.111', '2019-09-30 12:02:34');
INSERT INTO `admin_log` VALUES (250, 'org.apache.catalina.connector.RequestFacade@50066ac9', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@50066ac9]', '192.168.1.111', '2019-09-30 12:02:37');
INSERT INTO `admin_log` VALUES (251, 'org.apache.catalina.connector.RequestFacade@50066ac9', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@50066ac9]', '192.168.1.111', '2019-09-30 12:02:38');
INSERT INTO `admin_log` VALUES (252, 'org.apache.catalina.connector.RequestFacade@50066ac9', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@50066ac9]', '192.168.1.111', '2019-09-30 12:02:40');
INSERT INTO `admin_log` VALUES (253, 'org.apache.catalina.connector.RequestFacade@50066ac9', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@50066ac9]', '192.168.1.111', '2019-09-30 12:02:41');
INSERT INTO `admin_log` VALUES (254, 'Decliver(senAddress={\"provinceCityDist\":\"河南省 南阳市 宛城区 理工\",\"name\":\"张三\",\"phone\":\"13598645226\"}, recipients={\"provinceCityDist\":\"河南省 南阳市 卧龙区 车站路与卧龙路交叉口蓝钻星座516\",\"name\":\"张三\",\"phone\":\"13598654212\"}, goodInfo=投入和, senderType=2, modeOfDespatch=1, payType=1, remarks=股份计划, orderArea=1, stdmode=4)', '普通会员发货', 'com.zfl.controller.app.shipmentsapp.DeliverController.userDeliver', '[Decliver(senAddress={\"provinceCityDist\":\"河南省 南阳市 宛城区 理工\",\"name\":\"张三\",\"phone\":\"13598645226\"}, recipients={\"provinceCityDist\":\"河南省 南阳市 卧龙区 车站路与卧龙路交叉口蓝钻星座516\",\"name\":\"张三\",\"phone\":\"13598654212\"}, goodInfo=投入和, senderType=2, modeOfDespatch=1, payType=1, remarks=股份计划, orderArea=1, stdmode=4)]', '192.168.1.111', '2019-09-30 12:03:07');
INSERT INTO `admin_log` VALUES (255, 'org.apache.catalina.connector.RequestFacade@3a1924f3', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3a1924f3]', '192.168.1.55', '2019-09-30 13:48:04');
INSERT INTO `admin_log` VALUES (256, 'org.apache.catalina.connector.RequestFacade@4393c381', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@4393c381]', '192.168.1.55', '2019-09-30 13:48:04');
INSERT INTO `admin_log` VALUES (257, 'org.apache.catalina.connector.RequestFacade@310a751a', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@310a751a]', '192.168.1.55', '2019-09-30 13:48:04');
INSERT INTO `admin_log` VALUES (258, 'org.apache.catalina.connector.RequestFacade@4db9d64e', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@4db9d64e]', '192.168.1.55', '2019-09-30 13:48:04');
INSERT INTO `admin_log` VALUES (259, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@532ec58a]', '192.168.1.111', '2019-09-30 13:48:04');
INSERT INTO `admin_log` VALUES (260, 'org.apache.catalina.connector.RequestFacade@408e05bf', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@408e05bf]', '192.168.1.55', '2019-09-30 13:48:12');
INSERT INTO `admin_log` VALUES (261, 'org.apache.catalina.connector.RequestFacade@408e05bf', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@408e05bf]', '192.168.1.111', '2019-09-30 13:48:14');
INSERT INTO `admin_log` VALUES (262, 'org.apache.catalina.connector.RequestFacade@408e05bf', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@408e05bf]', '192.168.1.111', '2019-09-30 13:48:18');
INSERT INTO `admin_log` VALUES (263, 'org.apache.catalina.connector.RequestFacade@310a751a', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@310a751a]', '192.168.1.111', '2019-09-30 13:48:19');
INSERT INTO `admin_log` VALUES (264, 'org.apache.catalina.connector.RequestFacade@310a751a', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@310a751a]', '192.168.1.55', '2019-09-30 13:48:19');
INSERT INTO `admin_log` VALUES (265, 'org.apache.catalina.connector.RequestFacade@310a751a', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@310a751a]', '192.168.1.111', '2019-09-30 13:48:20');
INSERT INTO `admin_log` VALUES (266, 'org.apache.catalina.connector.RequestFacade@310a751a', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@310a751a]', '192.168.1.55', '2019-09-30 13:48:21');
INSERT INTO `admin_log` VALUES (267, 'org.apache.catalina.connector.RequestFacade@4393c381', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@4393c381]', '192.168.1.111', '2019-09-30 13:48:22');
INSERT INTO `admin_log` VALUES (268, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@532ec58a]', '192.168.1.55', '2019-09-30 13:48:40');
INSERT INTO `admin_log` VALUES (269, 'org.apache.catalina.connector.RequestFacade@408e05bf', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@408e05bf]', '192.168.1.55', '2019-09-30 13:48:44');
INSERT INTO `admin_log` VALUES (270, 'Decliver(senAddress={\"provinceCityDist\":\"河南省 南阳市 宛城区 理工\",\"name\":\"张三\",\"phone\":\"13598645226\"}, recipients={\"provinceCityDist\":\"河南省 南阳市 卧龙区 车站路与卧龙路交叉口蓝钻星座516\",\"name\":\"张三\",\"phone\":\"13598654212\"}, goodInfo=卫衣, senderType=1, modeOfDespatch=1, payType=1, remarks=冻伤护肤膏, orderArea=1, stdmode=2)', '普通会员发货', 'com.zfl.controller.app.shipmentsapp.DeliverController.userDeliver', '[Decliver(senAddress={\"provinceCityDist\":\"河南省 南阳市 宛城区 理工\",\"name\":\"张三\",\"phone\":\"13598645226\"}, recipients={\"provinceCityDist\":\"河南省 南阳市 卧龙区 车站路与卧龙路交叉口蓝钻星座516\",\"name\":\"张三\",\"phone\":\"13598654212\"}, goodInfo=卫衣, senderType=1, modeOfDespatch=1, payType=1, remarks=冻伤护肤膏, orderArea=1, stdmode=2)]', '192.168.1.111', '2019-09-30 13:48:56');
INSERT INTO `admin_log` VALUES (271, 'org.apache.catalina.connector.RequestFacade@408e05bf', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@408e05bf]', '192.168.1.55', '2019-09-30 13:49:08');
INSERT INTO `admin_log` VALUES (272, 'TbUserSendAddress(id=22, userId=3, provinceCode=河南省, cityCode=南阳市, district=宛城区, detailedAddress=河南师范, isDefault=1, recipients=张三, contactNumber=13598654210)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=22, userId=3, provinceCode=河南省, cityCode=南阳市, district=宛城区, detailedAddress=河南师范, isDefault=1, recipients=张三, contactNumber=13598654210), 0]', '192.168.1.55', '2019-09-30 13:50:23');
INSERT INTO `admin_log` VALUES (273, 'org.apache.catalina.connector.RequestFacade@4393c381', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@4393c381]', '192.168.1.55', '2019-09-30 13:51:08');
INSERT INTO `admin_log` VALUES (274, 'org.apache.catalina.connector.RequestFacade@4db9d64e', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@4db9d64e]', '192.168.1.55', '2019-09-30 13:51:08');
INSERT INTO `admin_log` VALUES (275, 'org.apache.catalina.connector.RequestFacade@3a1924f3', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3a1924f3]', '192.168.1.55', '2019-09-30 13:51:08');
INSERT INTO `admin_log` VALUES (276, 'org.apache.catalina.connector.RequestFacade@2bc83e81', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2bc83e81]', '192.168.1.111', '2019-09-30 13:54:22');
INSERT INTO `admin_log` VALUES (277, 'org.apache.catalina.connector.RequestFacade@55c17223', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@55c17223]', '192.168.1.111', '2019-09-30 13:56:22');
INSERT INTO `admin_log` VALUES (278, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@2ef5f12e]', '192.168.1.111', '2019-09-30 13:56:22');
INSERT INTO `admin_log` VALUES (279, 'org.apache.catalina.connector.RequestFacade@1bfc4693', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@1bfc4693]', '192.168.1.111', '2019-09-30 13:56:30');
INSERT INTO `admin_log` VALUES (280, 'Decliver(senAddress={\"provinceCityDist\":\"河南省 南阳市 宛城区 理工\",\"name\":\"张三\",\"phone\":\"13598645226\"}, recipients={\"provinceCityDist\":\"河南省 南阳市 卧龙区 车站路与卧龙路交叉口蓝钻星座516\",\"name\":\"张三\",\"phone\":\"13598654212\"}, goodInfo=牙膏, senderType=1, modeOfDespatch=1, payType=1, remarks=健齿美白, orderArea=1, stdmode=4)', '普通会员发货', 'com.zfl.controller.app.shipmentsapp.DeliverController.userDeliver', '[Decliver(senAddress={\"provinceCityDist\":\"河南省 南阳市 宛城区 理工\",\"name\":\"张三\",\"phone\":\"13598645226\"}, recipients={\"provinceCityDist\":\"河南省 南阳市 卧龙区 车站路与卧龙路交叉口蓝钻星座516\",\"name\":\"张三\",\"phone\":\"13598654212\"}, goodInfo=牙膏, senderType=1, modeOfDespatch=1, payType=1, remarks=健齿美白, orderArea=1, stdmode=4)]', '192.168.1.111', '2019-09-30 13:57:15');
INSERT INTO `admin_log` VALUES (281, 'org.apache.catalina.connector.RequestFacade@c8f1014', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@c8f1014]', '192.168.1.55', '2019-09-30 14:01:33');
INSERT INTO `admin_log` VALUES (282, 'org.apache.catalina.connector.RequestFacade@19587767', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@19587767]', '192.168.1.55', '2019-09-30 14:01:33');
INSERT INTO `admin_log` VALUES (283, 'org.apache.catalina.connector.RequestFacade@6d1dd040', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@6d1dd040]', '192.168.1.55', '2019-09-30 14:01:33');
INSERT INTO `admin_log` VALUES (284, 'org.apache.catalina.connector.RequestFacade@7d7b9a3b', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@7d7b9a3b]', '192.168.1.55', '2019-09-30 14:01:33');
INSERT INTO `admin_log` VALUES (285, 'org.apache.catalina.connector.RequestFacade@19587767', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@19587767]', '192.168.1.111', '2019-09-30 14:01:41');
INSERT INTO `admin_log` VALUES (286, 'Decliver(senAddress={\"provinceCityDist\":\"河南省 南阳市 卧龙区 南阳师范\",\"name\":\"张三\",\"phone\":\"13598654210\"}, recipients={\"provinceCityDist\":\"河南省 南阳市 卧龙区 车站路与卧龙路交叉口蓝钻星座516\",\"name\":\"张三\",\"phone\":\"13598654212\"}, goodInfo=牛奶, senderType=1, modeOfDespatch=1, payType=1, remarks=啥的佛, orderArea=1, stdmode=3)', '普通会员发货', 'com.zfl.controller.app.shipmentsapp.DeliverController.userDeliver', '[Decliver(senAddress={\"provinceCityDist\":\"河南省 南阳市 卧龙区 南阳师范\",\"name\":\"张三\",\"phone\":\"13598654210\"}, recipients={\"provinceCityDist\":\"河南省 南阳市 卧龙区 车站路与卧龙路交叉口蓝钻星座516\",\"name\":\"张三\",\"phone\":\"13598654212\"}, goodInfo=牛奶, senderType=1, modeOfDespatch=1, payType=1, remarks=啥的佛, orderArea=1, stdmode=3)]', '192.168.1.111', '2019-09-30 14:02:15');
INSERT INTO `admin_log` VALUES (287, 'org.apache.catalina.connector.RequestFacade@19587767', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@19587767]', '192.168.1.55', '2019-09-30 14:02:19');
INSERT INTO `admin_log` VALUES (288, 'org.apache.catalina.connector.RequestFacade@19587767', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@19587767]', '192.168.1.55', '2019-09-30 14:02:21');
INSERT INTO `admin_log` VALUES (289, 'org.apache.catalina.connector.RequestFacade@6d1dd040', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@6d1dd040]', '192.168.1.55', '2019-09-30 14:02:22');
INSERT INTO `admin_log` VALUES (290, 'org.apache.catalina.connector.RequestFacade@6d1dd040', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@6d1dd040]', '192.168.1.55', '2019-09-30 14:02:23');
INSERT INTO `admin_log` VALUES (291, 'org.apache.catalina.connector.RequestFacade@6d1dd040', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@6d1dd040]', '192.168.1.55', '2019-09-30 14:02:32');
INSERT INTO `admin_log` VALUES (292, 'org.apache.catalina.connector.RequestFacade@5ea56aea', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@5ea56aea]', '192.168.1.55', '2019-09-30 14:02:33');
INSERT INTO `admin_log` VALUES (293, 'org.apache.catalina.connector.RequestFacade@6d1dd040', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@6d1dd040]', '192.168.1.55', '2019-09-30 14:10:52');
INSERT INTO `admin_log` VALUES (294, 'org.apache.catalina.connector.RequestFacade@c8f1014', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@c8f1014]', '192.168.1.55', '2019-09-30 14:10:52');
INSERT INTO `admin_log` VALUES (295, 'org.apache.catalina.connector.RequestFacade@74541c6b', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@74541c6b]', '192.168.1.111', '2019-09-30 14:12:29');
INSERT INTO `admin_log` VALUES (296, 'org.apache.catalina.connector.RequestFacade@76735a9b', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@76735a9b]', '192.168.1.111', '2019-09-30 14:12:29');
INSERT INTO `admin_log` VALUES (297, 'org.apache.catalina.connector.RequestFacade@ae71071', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@ae71071]', '192.168.1.111', '2019-09-30 14:12:29');
INSERT INTO `admin_log` VALUES (298, 'org.apache.catalina.connector.RequestFacade@7b5a8ec7', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@7b5a8ec7]', '192.168.1.55', '2019-09-30 14:15:36');
INSERT INTO `admin_log` VALUES (299, 'org.apache.catalina.connector.RequestFacade@40207cb3', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@40207cb3]', '192.168.1.55', '2019-09-30 14:15:36');
INSERT INTO `admin_log` VALUES (300, 'org.apache.catalina.connector.RequestFacade@4f10d9cc', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@4f10d9cc]', '192.168.1.55', '2019-09-30 14:17:09');
INSERT INTO `admin_log` VALUES (301, 'org.apache.catalina.connector.RequestFacade@f523e6b', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@f523e6b]', '192.168.1.55', '2019-09-30 14:18:49');
INSERT INTO `admin_log` VALUES (302, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@201759af]', '192.168.1.111', '2019-09-30 14:18:49');
INSERT INTO `admin_log` VALUES (303, 'org.apache.catalina.connector.RequestFacade@58a64823', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@58a64823]', '192.168.1.55', '2019-09-30 14:33:40');
INSERT INTO `admin_log` VALUES (304, 'org.apache.catalina.connector.RequestFacade@3d926546', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3d926546]', '192.168.1.55', '2019-09-30 14:33:40');
INSERT INTO `admin_log` VALUES (305, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@3236178b]', '192.168.1.111', '2019-09-30 14:33:49');
INSERT INTO `admin_log` VALUES (306, 'org.apache.catalina.connector.RequestFacade@2d345b4a', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2d345b4a]', '192.168.1.111', '2019-09-30 14:33:52');
INSERT INTO `admin_log` VALUES (307, 'org.apache.catalina.connector.RequestFacade@2d345b4a', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2d345b4a]', '192.168.1.111', '2019-09-30 14:33:54');
INSERT INTO `admin_log` VALUES (308, 'org.apache.catalina.connector.RequestFacade@2d345b4a', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2d345b4a]', '192.168.1.111', '2019-09-30 14:33:56');
INSERT INTO `admin_log` VALUES (309, 'Decliver(senAddress={\"provinceCityDist\":\"河南省 南阳市 宛城区 理工\",\"name\":\"张三\",\"phone\":\"13598645226\"}, recipients={\"provinceCityDist\":\"河南省 南阳市 卧龙区 车站路与卧龙路交叉口蓝钻星座516\",\"name\":\"张三\",\"phone\":\"13598654212\"}, goodInfo=牙膏, senderType=1, modeOfDespatch=1, payType=1, remarks=啥驾考宝典, orderArea=1, stdmode=4)', '普通会员发货', 'com.zfl.controller.app.shipmentsapp.DeliverController.userDeliver', '[Decliver(senAddress={\"provinceCityDist\":\"河南省 南阳市 宛城区 理工\",\"name\":\"张三\",\"phone\":\"13598645226\"}, recipients={\"provinceCityDist\":\"河南省 南阳市 卧龙区 车站路与卧龙路交叉口蓝钻星座516\",\"name\":\"张三\",\"phone\":\"13598654212\"}, goodInfo=牙膏, senderType=1, modeOfDespatch=1, payType=1, remarks=啥驾考宝典, orderArea=1, stdmode=4)]', '192.168.1.111', '2019-09-30 14:34:14');
INSERT INTO `admin_log` VALUES (310, 'org.apache.catalina.connector.RequestFacade@2bb53e1', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2bb53e1]', '192.168.1.111', '2019-09-30 14:38:33');
INSERT INTO `admin_log` VALUES (311, 'org.apache.catalina.connector.RequestFacade@36bf7053', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@36bf7053]', '192.168.1.111', '2019-09-30 14:38:33');
INSERT INTO `admin_log` VALUES (312, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@1fd9a5da]', '192.168.1.55', '2019-09-30 14:45:30');
INSERT INTO `admin_log` VALUES (313, 'org.apache.catalina.connector.RequestFacade@6fe0e1fb', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@6fe0e1fb]', '192.168.1.55', '2019-09-30 14:48:18');
INSERT INTO `admin_log` VALUES (314, 'org.apache.catalina.connector.RequestFacade@6fe0e1fb', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@6fe0e1fb]', '192.168.1.55', '2019-09-30 14:48:30');
INSERT INTO `admin_log` VALUES (315, 'org.apache.catalina.connector.RequestFacade@6fe0e1fb', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@6fe0e1fb]', '192.168.1.55', '2019-09-30 14:48:33');
INSERT INTO `admin_log` VALUES (316, 'Decliver(senAddress={\"provinceCityDist\":\"河南省 南阳市 宛城区 理工\",\"name\":\"张三\",\"phone\":\"13598645226\"}, recipients={\"provinceCityDist\":\"河南省 南阳市 卧龙区 车站路与卧龙路交叉口蓝钻星座516\",\"name\":\"张三\",\"phone\":\"13598654212\"}, goodInfo=手机, senderType=1, modeOfDespatch=1, payType=1, remarks=加急, orderArea=1, stdmode=1)', '普通会员发货', 'com.zfl.controller.app.shipmentsapp.DeliverController.userDeliver', '[Decliver(senAddress={\"provinceCityDist\":\"河南省 南阳市 宛城区 理工\",\"name\":\"张三\",\"phone\":\"13598645226\"}, recipients={\"provinceCityDist\":\"河南省 南阳市 卧龙区 车站路与卧龙路交叉口蓝钻星座516\",\"name\":\"张三\",\"phone\":\"13598654212\"}, goodInfo=手机, senderType=1, modeOfDespatch=1, payType=1, remarks=加急, orderArea=1, stdmode=1)]', '192.168.1.55', '2019-09-30 14:49:22');
INSERT INTO `admin_log` VALUES (317, 'org.apache.catalina.connector.RequestFacade@73f21c31', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@73f21c31]', '192.168.1.55', '2019-09-30 14:52:30');
INSERT INTO `admin_log` VALUES (318, 'ReceivingAppUserLogin(account=17633638280, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=17633638280, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@9b4e27b]', '192.168.1.155', '2019-09-30 15:07:21');
INSERT INTO `admin_log` VALUES (319, 'ReceivingAppUserLogin(account=17633638280, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=17633638280, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@9b4e27b]', '192.168.1.155', '2019-09-30 15:07:26');
INSERT INTO `admin_log` VALUES (320, 'UserRegisterVo(account=木子李, password=123456, area=1, inviteCode=, verifyCode=5xqx)', '用户注册', 'com.zfl.controller.app.shipmentsapp.LoginController.register', '[UserRegisterVo(account=木子李, password=123456, area=1, inviteCode=, verifyCode=5xqx), org.apache.catalina.connector.RequestFacade@7d39c603]', '192.168.1.155', '2019-09-30 15:08:06');
INSERT INTO `admin_log` VALUES (321, 'ReceivingAppUserLogin(account=木子李, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=木子李, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@1a5dfd3f]', '192.168.1.155', '2019-09-30 15:08:17');
INSERT INTO `admin_log` VALUES (322, 'org.apache.catalina.connector.RequestFacade@ed2c246', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@ed2c246]', '192.168.1.155', '2019-09-30 15:10:54');
INSERT INTO `admin_log` VALUES (323, 'org.apache.catalina.connector.RequestFacade@ed2c246', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@ed2c246]', '192.168.1.155', '2019-09-30 15:10:56');
INSERT INTO `admin_log` VALUES (324, 'TbUserSendAddress(id=23, userId=4, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=蓝钻星座515, isDefault=1, recipients=木子李, contactNumber=17633638280)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=23, userId=4, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=蓝钻星座515, isDefault=1, recipients=木子李, contactNumber=17633638280), 0]', '192.168.1.155', '2019-09-30 15:11:32');
INSERT INTO `admin_log` VALUES (325, 'org.apache.catalina.connector.RequestFacade@ed2c246', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@ed2c246]', '192.168.1.155', '2019-09-30 15:11:32');
INSERT INTO `admin_log` VALUES (326, 'ReceivingAppUserLogin(account=木子李, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=木子李, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@2e6d04d8]', '192.168.1.155', '2019-09-30 15:11:53');
INSERT INTO `admin_log` VALUES (327, 'org.apache.catalina.connector.RequestFacade@ed2c246', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@ed2c246]', '192.168.1.155', '2019-09-30 15:11:56');
INSERT INTO `admin_log` VALUES (328, 'org.apache.catalina.connector.RequestFacade@ed2c246', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@ed2c246]', '192.168.1.155', '2019-09-30 15:11:58');
INSERT INTO `admin_log` VALUES (329, 'TbUserSendAddress(id=24, userId=4, provinceCode=北京市, cityCode=市辖区, district=石景山区, detailedAddress=东门值班室代收, isDefault=1, recipients=木子, contactNumber=15220309071)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=24, userId=4, provinceCode=北京市, cityCode=市辖区, district=石景山区, detailedAddress=东门值班室代收, isDefault=1, recipients=木子, contactNumber=15220309071), 0]', '192.168.1.155', '2019-09-30 15:12:25');
INSERT INTO `admin_log` VALUES (330, 'org.apache.catalina.connector.RequestFacade@ed2c246', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@ed2c246]', '192.168.1.155', '2019-09-30 15:12:25');
INSERT INTO `admin_log` VALUES (331, 'TbUserSendAddress(id=24, userId=4, provinceCode=北京市, cityCode=市辖区, district=石景山区, detailedAddress=null, isDefault=1, recipients=木子, contactNumber=15220309071)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=24, userId=4, provinceCode=北京市, cityCode=市辖区, district=石景山区, detailedAddress=null, isDefault=1, recipients=木子, contactNumber=15220309071), 1]', '192.168.1.155', '2019-09-30 15:12:38');
INSERT INTO `admin_log` VALUES (332, 'org.apache.catalina.connector.RequestFacade@ed2c246', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@ed2c246]', '192.168.1.155', '2019-09-30 15:12:38');
INSERT INTO `admin_log` VALUES (333, 'org.apache.catalina.connector.RequestFacade@143d4753', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@143d4753]', '192.168.1.155', '2019-09-30 15:13:41');
INSERT INTO `admin_log` VALUES (334, 'org.apache.catalina.connector.RequestFacade@45880c89', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@45880c89]', '192.168.1.155', '2019-09-30 15:13:41');
INSERT INTO `admin_log` VALUES (335, 'org.apache.catalina.connector.RequestFacade@5070860a', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@5070860a]', '192.168.1.155', '2019-09-30 15:13:41');
INSERT INTO `admin_log` VALUES (336, 'org.apache.catalina.connector.RequestFacade@68113f87', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@68113f87]', '192.168.1.155', '2019-09-30 15:13:41');
INSERT INTO `admin_log` VALUES (337, 'org.apache.catalina.connector.RequestFacade@cbee1ec', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@cbee1ec]', '192.168.1.155', '2019-09-30 15:13:41');
INSERT INTO `admin_log` VALUES (338, 'org.apache.catalina.connector.RequestFacade@34a44e26', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@34a44e26]', '192.168.1.155', '2019-09-30 15:13:41');
INSERT INTO `admin_log` VALUES (339, 'org.apache.catalina.connector.RequestFacade@143d4753', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@143d4753]', '192.168.1.155', '2019-09-30 15:13:41');
INSERT INTO `admin_log` VALUES (340, 'org.apache.catalina.connector.RequestFacade@5070860a', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@5070860a]', '192.168.1.155', '2019-09-30 15:13:41');
INSERT INTO `admin_log` VALUES (341, 'org.apache.catalina.connector.RequestFacade@5070860a', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@5070860a]', '192.168.1.155', '2019-09-30 15:13:41');
INSERT INTO `admin_log` VALUES (342, 'TbUserSendAddress(id=25, userId=4, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=蓝钻星座, isDefault=1, recipients=木子李, contactNumber=17633638280)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=25, userId=4, provinceCode=河南省, cityCode=南阳市, district=卧龙区, detailedAddress=蓝钻星座, isDefault=1, recipients=木子李, contactNumber=17633638280), 0]', '192.168.1.155', '2019-09-30 15:13:59');
INSERT INTO `admin_log` VALUES (343, 'org.apache.catalina.connector.RequestFacade@5070860a', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@5070860a]', '192.168.1.155', '2019-09-30 15:14:00');
INSERT INTO `admin_log` VALUES (344, 'TbUserSendAddress(id=25, userId=4, provinceCode=null, cityCode=null, district=null, detailedAddress=null, isDefault=null, recipients=null, contactNumber=null)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=25, userId=4, provinceCode=null, cityCode=null, district=null, detailedAddress=null, isDefault=null, recipients=null, contactNumber=null), 2]', '192.168.1.155', '2019-09-30 15:14:52');
INSERT INTO `admin_log` VALUES (345, 'org.apache.catalina.connector.RequestFacade@ec18f4a', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@ec18f4a]', '192.168.1.155', '2019-09-30 15:14:52');
INSERT INTO `admin_log` VALUES (346, 'TbUserSendAddress(id=25, userId=4, provinceCode=null, cityCode=null, district=null, detailedAddress=null, isDefault=, recipients=null, contactNumber=null)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=25, userId=4, provinceCode=null, cityCode=null, district=null, detailedAddress=null, isDefault=, recipients=null, contactNumber=null), 1]', '192.168.1.155', '2019-09-30 15:14:52');
INSERT INTO `admin_log` VALUES (347, 'org.apache.catalina.connector.RequestFacade@56bc4944', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@56bc4944]', '192.168.1.155', '2019-09-30 15:14:52');
INSERT INTO `admin_log` VALUES (348, 'org.apache.catalina.connector.RequestFacade@4092cc75', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@4092cc75]', '192.168.1.155', '2019-09-30 15:14:52');
INSERT INTO `admin_log` VALUES (349, 'org.apache.catalina.connector.RequestFacade@74729927', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@74729927]', '192.168.1.155', '2019-09-30 15:14:52');
INSERT INTO `admin_log` VALUES (350, 'org.apache.catalina.connector.RequestFacade@365455c4', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@365455c4]', '192.168.1.155', '2019-09-30 15:14:52');
INSERT INTO `admin_log` VALUES (351, 'org.apache.catalina.connector.RequestFacade@6451b316', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@6451b316]', '192.168.1.155', '2019-09-30 15:14:52');
INSERT INTO `admin_log` VALUES (352, 'org.apache.catalina.connector.RequestFacade@40cb2466', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@40cb2466]', '192.168.1.155', '2019-09-30 15:14:52');
INSERT INTO `admin_log` VALUES (353, 'TbUserSendAddress(id=25, userId=4, provinceCode=null, cityCode=null, district=null, detailedAddress=null, isDefault=, recipients=null, contactNumber=null)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=25, userId=4, provinceCode=null, cityCode=null, district=null, detailedAddress=null, isDefault=, recipients=null, contactNumber=null), 1]', '192.168.1.155', '2019-09-30 15:14:52');
INSERT INTO `admin_log` VALUES (354, 'org.apache.catalina.connector.RequestFacade@5049bf18', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@5049bf18]', '192.168.1.155', '2019-09-30 15:14:52');
INSERT INTO `admin_log` VALUES (355, 'org.apache.catalina.connector.RequestFacade@2df0c15', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2df0c15]', '192.168.1.155', '2019-09-30 15:14:54');
INSERT INTO `admin_log` VALUES (356, 'org.apache.catalina.connector.RequestFacade@2df0c15', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2df0c15]', '192.168.1.155', '2019-09-30 15:14:55');
INSERT INTO `admin_log` VALUES (357, 'org.apache.catalina.connector.RequestFacade@2df0c15', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2df0c15]', '192.168.1.155', '2019-09-30 15:14:57');
INSERT INTO `admin_log` VALUES (358, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '快递员用户登录', 'com.zfl.controller.app.shipmentsapp.LoginController.courierLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@46ff88fe]', '192.168.1.55', '2019-09-30 15:59:35');
INSERT INTO `admin_log` VALUES (359, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@286af589]', '192.168.1.55', '2019-09-30 15:59:50');
INSERT INTO `admin_log` VALUES (360, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@286af589]', '192.168.1.114', '2019-09-30 16:00:39');
INSERT INTO `admin_log` VALUES (361, 'org.apache.catalina.connector.RequestFacade@10edc62c', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@10edc62c]', '192.168.1.55', '2019-09-30 16:02:05');
INSERT INTO `admin_log` VALUES (362, 'org.apache.catalina.connector.RequestFacade@10edc62c', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@10edc62c]', '192.168.1.55', '2019-09-30 16:03:31');
INSERT INTO `admin_log` VALUES (363, 'org.apache.catalina.connector.RequestFacade@48764c11', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@48764c11]', '192.168.1.55', '2019-09-30 16:04:09');
INSERT INTO `admin_log` VALUES (364, 'org.apache.catalina.connector.RequestFacade@10edc62c', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@10edc62c]', '192.168.1.55', '2019-09-30 16:04:30');
INSERT INTO `admin_log` VALUES (365, 'org.apache.catalina.connector.RequestFacade@10edc62c', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@10edc62c]', '192.168.1.55', '2019-09-30 16:04:31');
INSERT INTO `admin_log` VALUES (366, 'org.apache.catalina.connector.RequestFacade@48764c11', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@48764c11]', '192.168.1.55', '2019-09-30 16:04:32');
INSERT INTO `admin_log` VALUES (367, 'org.apache.catalina.connector.RequestFacade@48764c11', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@48764c11]', '192.168.1.55', '2019-09-30 16:04:32');
INSERT INTO `admin_log` VALUES (368, 'org.apache.catalina.connector.RequestFacade@48764c11', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@48764c11]', '192.168.1.55', '2019-09-30 16:05:24');
INSERT INTO `admin_log` VALUES (369, 'org.apache.catalina.connector.RequestFacade@1d6693b4', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@1d6693b4]', '192.168.1.55', '2019-09-30 16:05:27');
INSERT INTO `admin_log` VALUES (370, 'org.apache.catalina.connector.RequestFacade@1d6693b4', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@1d6693b4]', '192.168.1.55', '2019-09-30 16:05:31');
INSERT INTO `admin_log` VALUES (371, 'org.apache.catalina.connector.RequestFacade@1d6693b4', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@1d6693b4]', '192.168.1.55', '2019-09-30 16:05:32');
INSERT INTO `admin_log` VALUES (372, 'org.apache.catalina.connector.RequestFacade@1d6693b4', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@1d6693b4]', '192.168.1.55', '2019-09-30 16:05:49');
INSERT INTO `admin_log` VALUES (373, 'Decliver(senAddress={\"provinceCityDist\":\"河南省 南阳市 宛城区 理工\",\"name\":\"张三\",\"phone\":\"13598645226\"}, recipients={\"provinceCityDist\":\"河南省 南阳市 卧龙区 车站路与卧龙路交叉口蓝钻星座516\",\"name\":\"张三\",\"phone\":\"13598654212\"}, goodInfo=手机, senderType=1, modeOfDespatch=1, payType=1, remarks=撒大声地, orderArea=1, stdmode=1)', '普通会员发货', 'com.zfl.controller.app.shipmentsapp.DeliverController.userDeliver', '[Decliver(senAddress={\"provinceCityDist\":\"河南省 南阳市 宛城区 理工\",\"name\":\"张三\",\"phone\":\"13598645226\"}, recipients={\"provinceCityDist\":\"河南省 南阳市 卧龙区 车站路与卧龙路交叉口蓝钻星座516\",\"name\":\"张三\",\"phone\":\"13598654212\"}, goodInfo=手机, senderType=1, modeOfDespatch=1, payType=1, remarks=撒大声地, orderArea=1, stdmode=1)]', '192.168.1.55', '2019-09-30 16:06:22');
INSERT INTO `admin_log` VALUES (374, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@6aa71c62]', '192.168.1.55', '2019-09-30 16:07:19');
INSERT INTO `admin_log` VALUES (375, 'org.apache.catalina.connector.RequestFacade@3492a943', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3492a943]', '192.168.1.55', '2019-09-30 16:07:19');
INSERT INTO `admin_log` VALUES (376, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@50c4215d]', '192.168.1.77', '2019-09-30 16:10:09');
INSERT INTO `admin_log` VALUES (377, 'org.apache.catalina.connector.RequestFacade@de90bf8', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@de90bf8]', '192.168.1.77', '2019-09-30 16:12:25');
INSERT INTO `admin_log` VALUES (378, 'org.apache.catalina.connector.RequestFacade@2bd9d594', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2bd9d594]', '192.168.1.77', '2019-09-30 16:15:15');
INSERT INTO `admin_log` VALUES (379, 'org.apache.catalina.connector.RequestFacade@df89538', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@df89538]', '192.168.1.77', '2019-09-30 16:15:15');
INSERT INTO `admin_log` VALUES (380, 'org.apache.catalina.connector.RequestFacade@3986ee82', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3986ee82]', '192.168.1.77', '2019-09-30 16:15:15');
INSERT INTO `admin_log` VALUES (381, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@36d46780]', '192.168.1.77', '2019-09-30 16:27:32');
INSERT INTO `admin_log` VALUES (382, 'org.apache.catalina.connector.RequestFacade@152f7b06', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@152f7b06]', '192.168.1.77', '2019-09-30 16:27:35');
INSERT INTO `admin_log` VALUES (383, 'org.apache.catalina.connector.RequestFacade@27ae0c27', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@27ae0c27]', '192.168.1.77', '2019-09-30 16:34:01');
INSERT INTO `admin_log` VALUES (384, 'ReceivingAppUserLogin(account=木子李, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=木子李, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@61ef6e02]', '192.168.1.155', '2019-09-30 16:37:18');
INSERT INTO `admin_log` VALUES (385, 'org.apache.catalina.connector.RequestFacade@71033289', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@71033289]', '192.168.1.155', '2019-09-30 16:52:05');
INSERT INTO `admin_log` VALUES (386, 'UserRegisterVo(account=13298367498, password=111111, area=1, inviteCode=, verifyCode=hx3h)', '用户注册', 'com.zfl.controller.app.shipmentsapp.LoginController.register', '[UserRegisterVo(account=13298367498, password=111111, area=1, inviteCode=, verifyCode=hx3h), org.apache.catalina.connector.RequestFacade@334bc906]', '192.168.1.105', '2019-09-30 16:52:50');
INSERT INTO `admin_log` VALUES (387, 'ReceivingAppUserLogin(account=13298367498, password=111111, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=13298367498, password=111111, verifyCode=null), org.apache.catalina.connector.ResponseFacade@29d7f4bf]', '192.168.1.105', '2019-09-30 16:53:02');
INSERT INTO `admin_log` VALUES (388, 'org.apache.catalina.connector.RequestFacade@346d8ebc', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@346d8ebc]', '192.168.1.155', '2019-09-30 16:57:54');
INSERT INTO `admin_log` VALUES (389, 'org.apache.catalina.connector.RequestFacade@3e8cc513', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3e8cc513]', '192.168.1.155', '2019-09-30 16:57:54');
INSERT INTO `admin_log` VALUES (390, 'org.apache.catalina.connector.RequestFacade@3af4dda3', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3af4dda3]', '192.168.1.105', '2019-09-30 16:57:54');
INSERT INTO `admin_log` VALUES (391, 'org.apache.catalina.connector.RequestFacade@3e8cc513', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3e8cc513]', '192.168.1.155', '2019-09-30 16:57:54');
INSERT INTO `admin_log` VALUES (392, 'org.apache.catalina.connector.RequestFacade@3e8cc513', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3e8cc513]', '192.168.1.155', '2019-09-30 16:57:55');
INSERT INTO `admin_log` VALUES (393, 'org.apache.catalina.connector.RequestFacade@3af4dda3', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3af4dda3]', '192.168.1.155', '2019-09-30 16:57:56');
INSERT INTO `admin_log` VALUES (394, 'org.apache.catalina.connector.RequestFacade@3af4dda3', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3af4dda3]', '192.168.1.155', '2019-09-30 16:57:58');
INSERT INTO `admin_log` VALUES (395, 'org.apache.catalina.connector.RequestFacade@3af4dda3', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3af4dda3]', '192.168.1.155', '2019-09-30 16:58:04');
INSERT INTO `admin_log` VALUES (396, 'org.apache.catalina.connector.RequestFacade@3af4dda3', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3af4dda3]', '192.168.1.155', '2019-09-30 16:58:07');
INSERT INTO `admin_log` VALUES (397, 'org.apache.catalina.connector.RequestFacade@3af4dda3', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3af4dda3]', '192.168.1.155', '2019-09-30 16:58:09');
INSERT INTO `admin_log` VALUES (398, 'org.apache.catalina.connector.RequestFacade@346d8ebc', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@346d8ebc]', '192.168.1.155', '2019-09-30 16:58:10');
INSERT INTO `admin_log` VALUES (399, 'org.apache.catalina.connector.RequestFacade@346d8ebc', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@346d8ebc]', '192.168.1.155', '2019-09-30 16:58:11');
INSERT INTO `admin_log` VALUES (400, 'org.apache.catalina.connector.RequestFacade@346d8ebc', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@346d8ebc]', '192.168.1.155', '2019-09-30 16:58:12');
INSERT INTO `admin_log` VALUES (401, 'org.apache.catalina.connector.RequestFacade@346d8ebc', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@346d8ebc]', '192.168.1.155', '2019-09-30 16:58:16');
INSERT INTO `admin_log` VALUES (402, 'org.apache.catalina.connector.RequestFacade@3e8cc513', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3e8cc513]', '192.168.1.155', '2019-09-30 17:00:17');
INSERT INTO `admin_log` VALUES (403, 'org.apache.catalina.connector.RequestFacade@346d8ebc', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@346d8ebc]', '192.168.1.155', '2019-09-30 17:00:27');
INSERT INTO `admin_log` VALUES (404, 'UserRegisterVo(account=13262006650, password=123456, area=1, inviteCode=, verifyCode=76rm)', '用户注册', 'com.zfl.controller.app.shipmentsapp.LoginController.register', '[UserRegisterVo(account=13262006650, password=123456, area=1, inviteCode=, verifyCode=76rm), org.apache.catalina.connector.RequestFacade@3e8cc513]', '192.168.1.165', '2019-09-30 17:01:36');
INSERT INTO `admin_log` VALUES (405, 'UserRegisterVo(account=13262006650, password=123456, area=1, inviteCode=, verifyCode=76rm)', '用户注册', 'com.zfl.controller.app.shipmentsapp.LoginController.register', '[UserRegisterVo(account=13262006650, password=123456, area=1, inviteCode=, verifyCode=76rm), org.apache.catalina.connector.RequestFacade@3e8cc513]', '192.168.1.165', '2019-09-30 17:01:45');
INSERT INTO `admin_log` VALUES (406, 'UserRegisterVo(account=13262006650, password=123456, area=1, inviteCode=, verifyCode=76rm)', '用户注册', 'com.zfl.controller.app.shipmentsapp.LoginController.register', '[UserRegisterVo(account=13262006650, password=123456, area=1, inviteCode=, verifyCode=76rm), org.apache.catalina.connector.RequestFacade@3e8cc513]', '192.168.1.165', '2019-09-30 17:01:46');
INSERT INTO `admin_log` VALUES (407, 'UserRegisterVo(account=13262006650, password=123456, area=1, inviteCode=, verifyCode=76rm)', '用户注册', 'com.zfl.controller.app.shipmentsapp.LoginController.register', '[UserRegisterVo(account=13262006650, password=123456, area=1, inviteCode=, verifyCode=76rm), org.apache.catalina.connector.RequestFacade@3e8cc513]', '192.168.1.165', '2019-09-30 17:01:47');
INSERT INTO `admin_log` VALUES (408, 'UserRegisterVo(account=13262006650, password=123456, area=1, inviteCode=, verifyCode=76rm)', '用户注册', 'com.zfl.controller.app.shipmentsapp.LoginController.register', '[UserRegisterVo(account=13262006650, password=123456, area=1, inviteCode=, verifyCode=76rm), org.apache.catalina.connector.RequestFacade@3e8cc513]', '192.168.1.165', '2019-09-30 17:01:47');
INSERT INTO `admin_log` VALUES (409, 'ReceivingAppUserLogin(account=13298367498, password=111111, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=13298367498, password=111111, verifyCode=null), org.apache.catalina.connector.ResponseFacade@4b707467]', '192.168.1.105', '2019-09-30 17:02:02');
INSERT INTO `admin_log` VALUES (410, 'ReceivingAppUserLogin(account=13262006650, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=13262006650, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@4b707467]', '192.168.1.165', '2019-09-30 17:02:10');
INSERT INTO `admin_log` VALUES (411, 'org.apache.catalina.connector.RequestFacade@3e8cc513', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3e8cc513]', '192.168.1.105', '2019-09-30 17:02:16');
INSERT INTO `admin_log` VALUES (412, 'org.apache.catalina.connector.RequestFacade@346d8ebc', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@346d8ebc]', '192.168.1.105', '2019-09-30 17:02:19');
INSERT INTO `admin_log` VALUES (413, 'org.apache.catalina.connector.RequestFacade@346d8ebc', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@346d8ebc]', '192.168.1.105', '2019-09-30 17:02:34');
INSERT INTO `admin_log` VALUES (414, 'org.apache.catalina.connector.RequestFacade@61b13b1f', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@61b13b1f]', '192.168.1.155', '2019-09-30 17:07:57');
INSERT INTO `admin_log` VALUES (415, 'org.apache.catalina.connector.RequestFacade@61b13b1f', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@61b13b1f]', '192.168.1.155', '2019-09-30 17:07:59');
INSERT INTO `admin_log` VALUES (416, 'org.apache.catalina.connector.RequestFacade@61b13b1f', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@61b13b1f]', '192.168.1.155', '2019-09-30 17:08:00');
INSERT INTO `admin_log` VALUES (417, 'org.apache.catalina.connector.RequestFacade@61b13b1f', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@61b13b1f]', '192.168.1.155', '2019-09-30 17:08:01');
INSERT INTO `admin_log` VALUES (418, 'org.apache.catalina.connector.RequestFacade@61b13b1f', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@61b13b1f]', '192.168.1.155', '2019-09-30 17:08:01');
INSERT INTO `admin_log` VALUES (419, 'org.apache.catalina.connector.RequestFacade@61b13b1f', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@61b13b1f]', '192.168.1.155', '2019-09-30 17:08:02');
INSERT INTO `admin_log` VALUES (420, 'org.apache.catalina.connector.RequestFacade@61b13b1f', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@61b13b1f]', '192.168.1.155', '2019-09-30 17:08:04');
INSERT INTO `admin_log` VALUES (421, 'org.apache.catalina.connector.RequestFacade@61b13b1f', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@61b13b1f]', '192.168.1.155', '2019-09-30 17:08:04');
INSERT INTO `admin_log` VALUES (422, 'org.apache.catalina.connector.RequestFacade@61b13b1f', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@61b13b1f]', '192.168.1.155', '2019-09-30 17:08:06');
INSERT INTO `admin_log` VALUES (423, 'org.apache.catalina.connector.RequestFacade@61b13b1f', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@61b13b1f]', '192.168.1.155', '2019-09-30 17:08:07');
INSERT INTO `admin_log` VALUES (424, 'org.apache.catalina.connector.RequestFacade@61b13b1f', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@61b13b1f]', '192.168.1.155', '2019-09-30 17:08:08');
INSERT INTO `admin_log` VALUES (425, 'org.apache.catalina.connector.RequestFacade@61b13b1f', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@61b13b1f]', '192.168.1.155', '2019-09-30 17:08:09');
INSERT INTO `admin_log` VALUES (426, 'org.apache.catalina.connector.RequestFacade@61b13b1f', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@61b13b1f]', '192.168.1.155', '2019-09-30 17:08:10');
INSERT INTO `admin_log` VALUES (427, 'org.apache.catalina.connector.RequestFacade@6cb30012', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@6cb30012]', '192.168.1.155', '2019-09-30 17:08:10');
INSERT INTO `admin_log` VALUES (428, 'org.apache.catalina.connector.RequestFacade@6cb30012', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@6cb30012]', '192.168.1.155', '2019-09-30 17:08:11');
INSERT INTO `admin_log` VALUES (429, 'org.apache.catalina.connector.RequestFacade@3e8cc513', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3e8cc513]', '192.168.1.155', '2019-09-30 17:08:13');
INSERT INTO `admin_log` VALUES (430, 'org.apache.catalina.connector.RequestFacade@6cb30012', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@6cb30012]', '192.168.1.155', '2019-09-30 17:08:14');
INSERT INTO `admin_log` VALUES (431, 'org.apache.catalina.connector.RequestFacade@6cb30012', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@6cb30012]', '192.168.1.155', '2019-09-30 17:08:15');
INSERT INTO `admin_log` VALUES (432, 'org.apache.catalina.connector.RequestFacade@61b13b1f', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@61b13b1f]', '192.168.1.155', '2019-09-30 17:08:16');
INSERT INTO `admin_log` VALUES (433, 'org.apache.catalina.connector.RequestFacade@61b13b1f', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@61b13b1f]', '192.168.1.155', '2019-09-30 17:08:17');
INSERT INTO `admin_log` VALUES (434, 'org.apache.catalina.connector.RequestFacade@4025f94e', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@4025f94e]', '192.168.1.155', '2019-09-30 17:12:00');
INSERT INTO `admin_log` VALUES (435, 'org.apache.catalina.connector.RequestFacade@66f20559', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@66f20559]', '192.168.1.155', '2019-09-30 17:12:00');
INSERT INTO `admin_log` VALUES (436, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@612a55df]', '192.168.1.55', '2019-09-30 17:12:00');
INSERT INTO `admin_log` VALUES (437, 'org.apache.catalina.connector.RequestFacade@4025f94e', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@4025f94e]', '192.168.1.55', '2019-09-30 17:12:16');
INSERT INTO `admin_log` VALUES (438, 'ReceivingAppUserLogin(account=木子李, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=木子李, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@612a55df]', '192.168.1.155', '2019-09-30 17:12:16');
INSERT INTO `admin_log` VALUES (439, 'org.apache.catalina.connector.RequestFacade@7d5fda3f', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@7d5fda3f]', '192.168.1.55', '2019-09-30 17:12:18');
INSERT INTO `admin_log` VALUES (440, 'UserRegisterVo(account=果果, password=123456, area=1, inviteCode=, verifyCode=a5sp)', '用户注册', 'com.zfl.controller.app.shipmentsapp.LoginController.register', '[UserRegisterVo(account=果果, password=123456, area=1, inviteCode=, verifyCode=a5sp), org.apache.catalina.connector.RequestFacade@7d5fda3f]', '192.168.1.63', '2019-09-30 17:12:18');
INSERT INTO `admin_log` VALUES (441, 'UserRegisterVo(account=果果, password=123456, area=1, inviteCode=, verifyCode=a5sp)', '用户注册', 'com.zfl.controller.app.shipmentsapp.LoginController.register', '[UserRegisterVo(account=果果, password=123456, area=1, inviteCode=, verifyCode=a5sp), org.apache.catalina.connector.RequestFacade@7d5fda3f]', '192.168.1.63', '2019-09-30 17:12:23');
INSERT INTO `admin_log` VALUES (442, 'org.apache.catalina.connector.RequestFacade@66f20559', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@66f20559]', '192.168.1.55', '2019-09-30 17:12:37');
INSERT INTO `admin_log` VALUES (443, 'UserRegisterVo(account=果果, password=123456, area=1, inviteCode=, verifyCode=a5sp)', '用户注册', 'com.zfl.controller.app.shipmentsapp.LoginController.register', '[UserRegisterVo(account=果果, password=123456, area=1, inviteCode=, verifyCode=a5sp), org.apache.catalina.connector.RequestFacade@4025f94e]', '192.168.1.63', '2019-09-30 17:12:56');
INSERT INTO `admin_log` VALUES (444, 'UserRegisterVo(account=13262006650, password=123456, area=1, inviteCode=LVYU2G, verifyCode=6jkmc)', '用户注册', 'com.zfl.controller.app.shipmentsapp.LoginController.register', '[UserRegisterVo(account=13262006650, password=123456, area=1, inviteCode=LVYU2G, verifyCode=6jkmc), org.apache.catalina.connector.RequestFacade@4025f94e]', '192.168.1.165', '2019-09-30 17:12:57');
INSERT INTO `admin_log` VALUES (445, 'UserRegisterVo(account=13262006650, password=123456, area=1, inviteCode=LVYU2G, verifyCode=jkmc)', '用户注册', 'com.zfl.controller.app.shipmentsapp.LoginController.register', '[UserRegisterVo(account=13262006650, password=123456, area=1, inviteCode=LVYU2G, verifyCode=jkmc), org.apache.catalina.connector.RequestFacade@66f20559]', '192.168.1.165', '2019-09-30 17:13:16');
INSERT INTO `admin_log` VALUES (446, 'UserRegisterVo(account=13262006650, password=123456, area=1, inviteCode=LVYU2G, verifyCode=jkmc)', '用户注册', 'com.zfl.controller.app.shipmentsapp.LoginController.register', '[UserRegisterVo(account=13262006650, password=123456, area=1, inviteCode=LVYU2G, verifyCode=jkmc), org.apache.catalina.connector.RequestFacade@4025f94e]', '192.168.1.165', '2019-09-30 17:13:16');
INSERT INTO `admin_log` VALUES (447, 'UserRegisterVo(account=果果, password=123456, area=1, inviteCode=, verifyCode=a5sp)', '用户注册', 'com.zfl.controller.app.shipmentsapp.LoginController.register', '[UserRegisterVo(account=果果, password=123456, area=1, inviteCode=, verifyCode=a5sp), org.apache.catalina.connector.RequestFacade@4025f94e]', '192.168.1.63', '2019-09-30 17:13:27');
INSERT INTO `admin_log` VALUES (448, 'ReceivingAppUserLogin(account=13262006650, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=13262006650, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@2cf6a286]', '192.168.1.165', '2019-09-30 17:13:30');
INSERT INTO `admin_log` VALUES (449, 'UserRegisterVo(account=果果, password=123456, area=1, inviteCode=, verifyCode=a5sp)', '用户注册', 'com.zfl.controller.app.shipmentsapp.LoginController.register', '[UserRegisterVo(account=果果, password=123456, area=1, inviteCode=, verifyCode=a5sp), org.apache.catalina.connector.RequestFacade@4025f94e]', '192.168.1.63', '2019-09-30 17:14:13');
INSERT INTO `admin_log` VALUES (450, 'UserRegisterVo(account=果果, password=123456, area=1, inviteCode=, verifyCode=a5sp)', '用户注册', 'com.zfl.controller.app.shipmentsapp.LoginController.register', '[UserRegisterVo(account=果果, password=123456, area=1, inviteCode=, verifyCode=a5sp), org.apache.catalina.connector.RequestFacade@4025f94e]', '192.168.1.63', '2019-09-30 17:14:15');
INSERT INTO `admin_log` VALUES (451, 'UserRegisterVo(account=果果, password=123456, area=1, inviteCode=, verifyCode=a5sp)', '用户注册', 'com.zfl.controller.app.shipmentsapp.LoginController.register', '[UserRegisterVo(account=果果, password=123456, area=1, inviteCode=, verifyCode=a5sp), org.apache.catalina.connector.RequestFacade@4025f94e]', '192.168.1.63', '2019-09-30 17:14:17');
INSERT INTO `admin_log` VALUES (452, 'UserRegisterVo(account=果果, password=123456, area=1, inviteCode=, verifyCode=a5sp)', '用户注册', 'com.zfl.controller.app.shipmentsapp.LoginController.register', '[UserRegisterVo(account=果果, password=123456, area=1, inviteCode=, verifyCode=a5sp), org.apache.catalina.connector.RequestFacade@4025f94e]', '192.168.1.63', '2019-09-30 17:14:19');
INSERT INTO `admin_log` VALUES (453, 'UserRegisterVo(account=果果, password=123456, area=1, inviteCode=, verifyCode=a5sp)', '用户注册', 'com.zfl.controller.app.shipmentsapp.LoginController.register', '[UserRegisterVo(account=果果, password=123456, area=1, inviteCode=, verifyCode=a5sp), org.apache.catalina.connector.RequestFacade@4025f94e]', '192.168.1.63', '2019-09-30 17:14:21');
INSERT INTO `admin_log` VALUES (454, 'UserRegisterVo(account=果果, password=123456, area=1, inviteCode=, verifyCode=a5sp)', '用户注册', 'com.zfl.controller.app.shipmentsapp.LoginController.register', '[UserRegisterVo(account=果果, password=123456, area=1, inviteCode=, verifyCode=a5sp), org.apache.catalina.connector.RequestFacade@4025f94e]', '192.168.1.63', '2019-09-30 17:14:22');
INSERT INTO `admin_log` VALUES (455, 'UserRegisterVo(account=果果, password=123456, area=1, inviteCode=, verifyCode=ynye)', '用户注册', 'com.zfl.controller.app.shipmentsapp.LoginController.register', '[UserRegisterVo(account=果果, password=123456, area=1, inviteCode=, verifyCode=ynye), org.apache.catalina.connector.RequestFacade@4025f94e]', '192.168.1.63', '2019-09-30 17:15:03');
INSERT INTO `admin_log` VALUES (456, 'UserRegisterVo(account=果果, password=123456, area=1, inviteCode=, verifyCode=ynye)', '用户注册', 'com.zfl.controller.app.shipmentsapp.LoginController.register', '[UserRegisterVo(account=果果, password=123456, area=1, inviteCode=, verifyCode=ynye), org.apache.catalina.connector.RequestFacade@4025f94e]', '192.168.1.63', '2019-09-30 17:15:16');
INSERT INTO `admin_log` VALUES (457, 'UserRegisterVo(account=木子, password=123456, area=1, inviteCode=, verifyCode=ynye)', '用户注册', 'com.zfl.controller.app.shipmentsapp.LoginController.register', '[UserRegisterVo(account=木子, password=123456, area=1, inviteCode=, verifyCode=ynye), org.apache.catalina.connector.RequestFacade@4025f94e]', '192.168.1.63', '2019-09-30 17:15:25');
INSERT INTO `admin_log` VALUES (458, 'ReceivingAppUserLogin(account=木子, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=木子, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@2cf6a286]', '192.168.1.63', '2019-09-30 17:15:33');
INSERT INTO `admin_log` VALUES (459, 'ReceivingAppUserLogin(account=13262006650, password=124456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=13262006650, password=124456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@2cf6a286]', '192.168.1.165', '2019-09-30 17:15:53');
INSERT INTO `admin_log` VALUES (460, 'ReceivingAppUserLogin(account=果果, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=果果, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@2cf6a286]', '192.168.1.63', '2019-09-30 17:15:55');
INSERT INTO `admin_log` VALUES (461, 'UserRegisterVo(account=智付联, password=123456, area=1, inviteCode=LVYU2G, verifyCode=tsfs)', '用户注册', 'com.zfl.controller.app.shipmentsapp.LoginController.register', '[UserRegisterVo(account=智付联, password=123456, area=1, inviteCode=LVYU2G, verifyCode=tsfs), org.apache.catalina.connector.RequestFacade@4025f94e]', '192.168.1.105', '2019-09-30 17:16:00');
INSERT INTO `admin_log` VALUES (462, 'ReceivingAppUserLogin(account=智付联, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=智付联, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@2cf6a286]', '192.168.1.105', '2019-09-30 17:16:11');
INSERT INTO `admin_log` VALUES (463, 'ReceivingAppUserLogin(account=13262006650, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=13262006650, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@2cf6a286]', '192.168.1.165', '2019-09-30 17:16:13');
INSERT INTO `admin_log` VALUES (464, 'org.apache.catalina.connector.RequestFacade@4025f94e', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@4025f94e]', '192.168.1.165', '2019-09-30 17:16:16');
INSERT INTO `admin_log` VALUES (465, 'org.apache.catalina.connector.RequestFacade@66f20559', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@66f20559]', '192.168.1.165', '2019-09-30 17:16:18');
INSERT INTO `admin_log` VALUES (466, 'org.apache.catalina.connector.RequestFacade@66f20559', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@66f20559]', '192.168.1.165', '2019-09-30 17:16:33');
INSERT INTO `admin_log` VALUES (467, 'org.apache.catalina.connector.RequestFacade@29b8c212', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@29b8c212]', '192.168.1.165', '2019-09-30 17:17:40');
INSERT INTO `admin_log` VALUES (468, 'org.apache.catalina.connector.RequestFacade@79474429', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@79474429]', '192.168.1.165', '2019-09-30 17:17:40');
INSERT INTO `admin_log` VALUES (469, 'org.apache.catalina.connector.RequestFacade@2d08a301', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2d08a301]', '192.168.1.105', '2019-09-30 17:17:40');
INSERT INTO `admin_log` VALUES (470, 'org.apache.catalina.connector.RequestFacade@decb31', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@decb31]', '192.168.1.105', '2019-09-30 17:17:40');
INSERT INTO `admin_log` VALUES (471, 'org.apache.catalina.connector.RequestFacade@29b8c212', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@29b8c212]', '192.168.1.155', '2019-09-30 17:17:48');
INSERT INTO `admin_log` VALUES (472, 'org.apache.catalina.connector.RequestFacade@29b8c212', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@29b8c212]', '192.168.1.155', '2019-09-30 17:17:50');
INSERT INTO `admin_log` VALUES (473, 'org.apache.catalina.connector.RequestFacade@29b8c212', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@29b8c212]', '192.168.1.155', '2019-09-30 17:17:51');
INSERT INTO `admin_log` VALUES (474, 'org.apache.catalina.connector.RequestFacade@29b8c212', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@29b8c212]', '192.168.1.165', '2019-09-30 17:18:13');
INSERT INTO `admin_log` VALUES (475, 'org.apache.catalina.connector.RequestFacade@4089def8', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@4089def8]', '192.168.1.155', '2019-09-30 17:20:28');
INSERT INTO `admin_log` VALUES (476, 'org.apache.catalina.connector.RequestFacade@314a7be4', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@314a7be4]', '192.168.1.155', '2019-09-30 17:20:28');
INSERT INTO `admin_log` VALUES (477, 'org.apache.catalina.connector.RequestFacade@3f8c639c', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3f8c639c]', '192.168.1.155', '2019-09-30 17:20:31');
INSERT INTO `admin_log` VALUES (478, 'org.apache.catalina.connector.RequestFacade@3f8c639c', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3f8c639c]', '192.168.1.165', '2019-09-30 17:20:34');
INSERT INTO `admin_log` VALUES (479, 'Decliver(senAddress={\"provinceCityDist\":\"河南省 南阳市 卧龙区 蓝钻星座515\",\"name\":\"木子李\",\"phone\":\"17633638280\"}, recipients={\"provinceCityDist\":\"北京市 市辖区 石景山区 东门值班室代收\",\"name\":\"木子\",\"phone\":\"15220309071\"}, goodInfo=日用, senderType=2, modeOfDespatch=1, payType=1, remarks=100, orderArea=1, stdmode=4)', '普通会员发货', 'com.zfl.controller.app.shipmentsapp.DeliverController.userDeliver', '[Decliver(senAddress={\"provinceCityDist\":\"河南省 南阳市 卧龙区 蓝钻星座515\",\"name\":\"木子李\",\"phone\":\"17633638280\"}, recipients={\"provinceCityDist\":\"北京市 市辖区 石景山区 东门值班室代收\",\"name\":\"木子\",\"phone\":\"15220309071\"}, goodInfo=日用, senderType=2, modeOfDespatch=1, payType=1, remarks=100, orderArea=1, stdmode=4)]', '192.168.1.155', '2019-09-30 17:21:26');
INSERT INTO `admin_log` VALUES (480, 'ReceivingAppUserLogin(account=果果, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=果果, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@1bd84051]', '192.168.1.111', '2019-09-30 17:21:29');
INSERT INTO `admin_log` VALUES (481, 'org.apache.catalina.connector.RequestFacade@3f8c639c', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3f8c639c]', '192.168.1.111', '2019-09-30 17:21:38');
INSERT INTO `admin_log` VALUES (482, 'org.apache.catalina.connector.RequestFacade@3f8c639c', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3f8c639c]', '192.168.1.111', '2019-09-30 17:23:46');
INSERT INTO `admin_log` VALUES (483, 'org.apache.catalina.connector.RequestFacade@617d0bca', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@617d0bca]', '192.168.1.165', '2019-09-30 17:23:46');
INSERT INTO `admin_log` VALUES (484, 'org.apache.catalina.connector.RequestFacade@930d2d5', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@930d2d5]', '192.168.1.111', '2019-09-30 17:23:46');
INSERT INTO `admin_log` VALUES (485, 'org.apache.catalina.connector.RequestFacade@3ab98272', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3ab98272]', '192.168.1.165', '2019-09-30 17:23:54');
INSERT INTO `admin_log` VALUES (486, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@5174935e]', '192.168.1.55', '2019-09-30 17:24:05');
INSERT INTO `admin_log` VALUES (487, 'org.apache.catalina.connector.RequestFacade@314a7be4', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@314a7be4]', '192.168.1.55', '2019-09-30 17:24:34');
INSERT INTO `admin_log` VALUES (488, 'org.apache.catalina.connector.RequestFacade@6a56c2a3', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@6a56c2a3]', '192.168.1.165', '2019-09-30 17:25:35');
INSERT INTO `admin_log` VALUES (489, 'org.apache.catalina.connector.RequestFacade@74a72ad', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@74a72ad]', '192.168.1.165', '2019-09-30 17:25:35');
INSERT INTO `admin_log` VALUES (490, 'org.apache.catalina.connector.RequestFacade@72f7222c', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@72f7222c]', '192.168.1.55', '2019-09-30 17:25:35');
INSERT INTO `admin_log` VALUES (491, 'org.apache.catalina.connector.RequestFacade@7136687c', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@7136687c]', '192.168.1.165', '2019-09-30 17:25:35');
INSERT INTO `admin_log` VALUES (492, 'org.apache.catalina.connector.RequestFacade@2b57265d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2b57265d]', '192.168.1.165', '2019-09-30 17:25:38');
INSERT INTO `admin_log` VALUES (493, 'org.apache.catalina.connector.RequestFacade@2b57265d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2b57265d]', '192.168.1.55', '2019-09-30 17:25:55');
INSERT INTO `admin_log` VALUES (494, 'org.apache.catalina.connector.RequestFacade@2b57265d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2b57265d]', '192.168.1.165', '2019-09-30 17:25:55');
INSERT INTO `admin_log` VALUES (495, 'org.apache.catalina.connector.RequestFacade@2b57265d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2b57265d]', '192.168.1.55', '2019-09-30 17:26:00');
INSERT INTO `admin_log` VALUES (496, 'org.apache.catalina.connector.RequestFacade@2b57265d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2b57265d]', '192.168.1.55', '2019-09-30 17:26:07');
INSERT INTO `admin_log` VALUES (497, 'org.apache.catalina.connector.RequestFacade@2b57265d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2b57265d]', '192.168.1.165', '2019-09-30 17:26:23');
INSERT INTO `admin_log` VALUES (498, 'org.apache.catalina.connector.RequestFacade@2b57265d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2b57265d]', '192.168.1.55', '2019-09-30 17:26:39');
INSERT INTO `admin_log` VALUES (499, 'org.apache.catalina.connector.RequestFacade@2b57265d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2b57265d]', '192.168.1.165', '2019-09-30 17:26:39');
INSERT INTO `admin_log` VALUES (500, 'org.apache.catalina.connector.RequestFacade@2b57265d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2b57265d]', '192.168.1.55', '2019-09-30 17:26:42');
INSERT INTO `admin_log` VALUES (501, 'org.apache.catalina.connector.RequestFacade@2b57265d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2b57265d]', '192.168.1.55', '2019-09-30 17:27:08');
INSERT INTO `admin_log` VALUES (502, 'org.apache.catalina.connector.RequestFacade@2b57265d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2b57265d]', '192.168.1.165', '2019-09-30 17:27:08');
INSERT INTO `admin_log` VALUES (503, 'org.apache.catalina.connector.RequestFacade@2b57265d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2b57265d]', '192.168.1.165', '2019-09-30 17:27:43');
INSERT INTO `admin_log` VALUES (504, 'org.apache.catalina.connector.RequestFacade@2b57265d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2b57265d]', '192.168.1.55', '2019-09-30 17:27:54');
INSERT INTO `admin_log` VALUES (505, 'org.apache.catalina.connector.RequestFacade@2b57265d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2b57265d]', '192.168.1.165', '2019-09-30 17:27:54');
INSERT INTO `admin_log` VALUES (506, 'org.apache.catalina.connector.RequestFacade@2b57265d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2b57265d]', '192.168.1.55', '2019-09-30 17:28:05');
INSERT INTO `admin_log` VALUES (507, 'org.apache.catalina.connector.RequestFacade@2b57265d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2b57265d]', '192.168.1.55', '2019-09-30 17:28:28');
INSERT INTO `admin_log` VALUES (508, 'org.apache.catalina.connector.RequestFacade@2b57265d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2b57265d]', '192.168.1.111', '2019-09-30 17:28:38');
INSERT INTO `admin_log` VALUES (509, 'TbUserSendAddress(id=25, userId=21, provinceCode=北京市, cityCode=市辖区, district=朝阳区, detailedAddress=回家看看今年, isDefault=1, recipients=虎子, contactNumber=13262006650)', '添加、编辑、删除用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.addAddress', '[TbUserSendAddress(id=25, userId=21, provinceCode=北京市, cityCode=市辖区, district=朝阳区, detailedAddress=回家看看今年, isDefault=1, recipients=虎子, contactNumber=13262006650), 0]', '192.168.1.165', '2019-09-30 17:28:56');
INSERT INTO `admin_log` VALUES (510, 'org.apache.catalina.connector.RequestFacade@2b57265d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2b57265d]', '192.168.1.165', '2019-09-30 17:28:56');
INSERT INTO `admin_log` VALUES (511, 'org.apache.catalina.connector.RequestFacade@2b57265d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2b57265d]', '192.168.1.165', '2019-09-30 17:29:00');
INSERT INTO `admin_log` VALUES (512, 'org.apache.catalina.connector.RequestFacade@2b57265d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2b57265d]', '192.168.1.165', '2019-09-30 17:29:12');
INSERT INTO `admin_log` VALUES (513, 'org.apache.catalina.connector.RequestFacade@70a045ea', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@70a045ea]', '192.168.1.165', '2019-09-30 17:29:13');
INSERT INTO `admin_log` VALUES (514, 'Decliver(senAddress={\"provinceCityDist\":\"北京市 市辖区 朝阳区 回家看看今年\",\"name\":\"虎子\",\"phone\":\"13262006650\"}, recipients={\"provinceCityDist\":\"北京市 市辖区 朝阳区 回家看看今年\",\"name\":\"虎子\",\"phone\":\"13262006650\"}, goodInfo=好纠结哈哈, senderType=1, modeOfDespatch=1, payType=1, remarks=, orderArea=1, stdmode=1)', '普通会员发货', 'com.zfl.controller.app.shipmentsapp.DeliverController.userDeliver', '[Decliver(senAddress={\"provinceCityDist\":\"北京市 市辖区 朝阳区 回家看看今年\",\"name\":\"虎子\",\"phone\":\"13262006650\"}, recipients={\"provinceCityDist\":\"北京市 市辖区 朝阳区 回家看看今年\",\"name\":\"虎子\",\"phone\":\"13262006650\"}, goodInfo=好纠结哈哈, senderType=1, modeOfDespatch=1, payType=1, remarks=, orderArea=1, stdmode=1)]', '192.168.1.165', '2019-09-30 17:29:38');
INSERT INTO `admin_log` VALUES (515, 'org.apache.catalina.connector.RequestFacade@2b57265d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2b57265d]', '192.168.1.55', '2019-09-30 17:29:50');
INSERT INTO `admin_log` VALUES (516, 'org.apache.catalina.connector.RequestFacade@2b57265d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2b57265d]', '192.168.1.55', '2019-09-30 17:29:52');
INSERT INTO `admin_log` VALUES (517, 'org.apache.catalina.connector.RequestFacade@2b57265d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2b57265d]', '192.168.1.55', '2019-09-30 17:29:53');
INSERT INTO `admin_log` VALUES (518, 'org.apache.catalina.connector.RequestFacade@2b57265d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2b57265d]', '192.168.1.55', '2019-09-30 17:29:54');
INSERT INTO `admin_log` VALUES (519, 'org.apache.catalina.connector.RequestFacade@2b57265d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2b57265d]', '192.168.1.165', '2019-09-30 17:31:37');
INSERT INTO `admin_log` VALUES (520, 'org.apache.catalina.connector.RequestFacade@2b57265d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2b57265d]', '192.168.1.165', '2019-09-30 17:31:38');
INSERT INTO `admin_log` VALUES (521, 'org.apache.catalina.connector.RequestFacade@72f7222c', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@72f7222c]', '192.168.1.165', '2019-09-30 17:31:43');
INSERT INTO `admin_log` VALUES (522, 'org.apache.catalina.connector.RequestFacade@70a045ea', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@70a045ea]', '192.168.1.165', '2019-09-30 17:31:51');
INSERT INTO `admin_log` VALUES (523, 'org.apache.catalina.connector.RequestFacade@72f7222c', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@72f7222c]', '192.168.1.55', '2019-09-30 17:31:58');
INSERT INTO `admin_log` VALUES (524, 'org.apache.catalina.connector.RequestFacade@72f7222c', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@72f7222c]', '192.168.1.165', '2019-09-30 17:32:15');
INSERT INTO `admin_log` VALUES (525, 'org.apache.catalina.connector.RequestFacade@72f7222c', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@72f7222c]', '192.168.1.155', '2019-09-30 17:32:48');
INSERT INTO `admin_log` VALUES (526, 'org.apache.catalina.connector.RequestFacade@72f7222c', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@72f7222c]', '192.168.1.165', '2019-09-30 17:32:52');
INSERT INTO `admin_log` VALUES (527, 'org.apache.catalina.connector.RequestFacade@72f7222c', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@72f7222c]', '192.168.1.165', '2019-09-30 17:32:54');
INSERT INTO `admin_log` VALUES (528, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@30cea9e0]', '192.168.1.55', '2019-09-30 17:33:07');
INSERT INTO `admin_log` VALUES (529, 'org.apache.catalina.connector.RequestFacade@2b57265d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2b57265d]', '192.168.1.165', '2019-09-30 17:33:12');
INSERT INTO `admin_log` VALUES (530, 'org.apache.catalina.connector.RequestFacade@2b57265d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2b57265d]', '192.168.1.165', '2019-09-30 17:33:53');
INSERT INTO `admin_log` VALUES (531, 'org.apache.catalina.connector.RequestFacade@2b57265d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2b57265d]', '192.168.1.165', '2019-09-30 17:33:54');
INSERT INTO `admin_log` VALUES (532, 'org.apache.catalina.connector.RequestFacade@2b57265d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2b57265d]', '192.168.1.165', '2019-09-30 17:35:49');
INSERT INTO `admin_log` VALUES (533, 'org.apache.catalina.connector.RequestFacade@70a045ea', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@70a045ea]', '192.168.1.165', '2019-09-30 17:36:50');
INSERT INTO `admin_log` VALUES (534, 'org.apache.catalina.connector.RequestFacade@2b57265d', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2b57265d]', '192.168.1.165', '2019-09-30 17:36:56');
INSERT INTO `admin_log` VALUES (535, 'org.apache.catalina.connector.RequestFacade@70a045ea', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@70a045ea]', '192.168.1.165', '2019-09-30 17:37:11');
INSERT INTO `admin_log` VALUES (536, 'org.apache.catalina.connector.RequestFacade@369dede6', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@369dede6]', '192.168.1.165', '2019-09-30 17:40:21');
INSERT INTO `admin_log` VALUES (537, 'org.apache.catalina.connector.RequestFacade@27367711', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@27367711]', '192.168.1.55', '2019-09-30 17:40:21');
INSERT INTO `admin_log` VALUES (538, 'org.apache.catalina.connector.RequestFacade@53e1dcc2', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@53e1dcc2]', '192.168.1.165', '2019-09-30 17:40:21');
INSERT INTO `admin_log` VALUES (539, 'org.apache.catalina.connector.RequestFacade@52f106ce', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@52f106ce]', '192.168.1.165', '2019-09-30 17:40:21');
INSERT INTO `admin_log` VALUES (540, 'org.apache.catalina.connector.RequestFacade@8fa947e', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@8fa947e]', '192.168.1.165', '2019-09-30 17:40:21');
INSERT INTO `admin_log` VALUES (541, 'org.apache.catalina.connector.RequestFacade@137af03e', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@137af03e]', '192.168.1.55', '2019-09-30 17:40:21');
INSERT INTO `admin_log` VALUES (542, 'org.apache.catalina.connector.RequestFacade@2dbbab84', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2dbbab84]', '192.168.1.165', '2019-09-30 17:40:21');
INSERT INTO `admin_log` VALUES (543, 'org.apache.catalina.connector.RequestFacade@27367711', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@27367711]', '192.168.1.55', '2019-09-30 17:40:21');
INSERT INTO `admin_log` VALUES (544, 'org.apache.catalina.connector.RequestFacade@21a1df94', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@21a1df94]', '192.168.1.165', '2019-09-30 17:40:21');
INSERT INTO `admin_log` VALUES (545, 'org.apache.catalina.connector.RequestFacade@493b94e0', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@493b94e0]', '192.168.1.165', '2019-09-30 17:40:21');
INSERT INTO `admin_log` VALUES (546, 'org.apache.catalina.connector.RequestFacade@137af03e', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@137af03e]', '192.168.1.55', '2019-09-30 17:40:21');
INSERT INTO `admin_log` VALUES (547, 'org.apache.catalina.connector.RequestFacade@8fa947e', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@8fa947e]', '192.168.1.165', '2019-09-30 17:42:08');
INSERT INTO `admin_log` VALUES (548, 'org.apache.catalina.connector.RequestFacade@8fa947e', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@8fa947e]', '192.168.1.165', '2019-09-30 17:42:09');
INSERT INTO `admin_log` VALUES (549, 'org.apache.catalina.connector.RequestFacade@3fc080a1', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3fc080a1]', '192.168.1.165', '2019-09-30 17:42:10');
INSERT INTO `admin_log` VALUES (550, 'org.apache.catalina.connector.RequestFacade@3fc080a1', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3fc080a1]', '192.168.1.165', '2019-09-30 17:42:10');
INSERT INTO `admin_log` VALUES (551, 'org.apache.catalina.connector.RequestFacade@43b6a693', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@43b6a693]', '192.168.1.165', '2019-09-30 17:44:52');
INSERT INTO `admin_log` VALUES (552, 'org.apache.catalina.connector.RequestFacade@43b6a693', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@43b6a693]', '192.168.1.165', '2019-09-30 17:44:53');
INSERT INTO `admin_log` VALUES (553, 'org.apache.catalina.connector.RequestFacade@8fa947e', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@8fa947e]', '192.168.1.55', '2019-09-30 17:45:58');
INSERT INTO `admin_log` VALUES (554, 'org.apache.catalina.connector.RequestFacade@43b6a693', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@43b6a693]', '192.168.1.165', '2019-09-30 17:47:01');
INSERT INTO `admin_log` VALUES (555, 'org.apache.catalina.connector.RequestFacade@3fc080a1', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3fc080a1]', '192.168.1.165', '2019-09-30 17:47:13');
INSERT INTO `admin_log` VALUES (556, 'org.apache.catalina.connector.RequestFacade@3fc080a1', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3fc080a1]', '192.168.1.165', '2019-09-30 17:49:05');
INSERT INTO `admin_log` VALUES (557, 'org.apache.catalina.connector.RequestFacade@3fc080a1', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3fc080a1]', '192.168.1.165', '2019-09-30 17:49:14');
INSERT INTO `admin_log` VALUES (558, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@4d0f6df0]', '192.168.1.105', '2019-09-30 17:52:55');
INSERT INTO `admin_log` VALUES (559, 'org.apache.catalina.connector.RequestFacade@43b6a693', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@43b6a693]', '192.168.1.105', '2019-09-30 17:53:07');
INSERT INTO `admin_log` VALUES (560, 'org.apache.catalina.connector.RequestFacade@43b6a693', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@43b6a693]', '192.168.1.105', '2019-09-30 17:53:15');
INSERT INTO `admin_log` VALUES (561, 'org.apache.catalina.connector.RequestFacade@43b6a693', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@43b6a693]', '192.168.1.105', '2019-09-30 17:53:18');
INSERT INTO `admin_log` VALUES (562, 'org.apache.catalina.connector.RequestFacade@3fc080a1', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3fc080a1]', '192.168.1.105', '2019-09-30 17:53:19');
INSERT INTO `admin_log` VALUES (563, 'org.apache.catalina.connector.RequestFacade@43b6a693', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@43b6a693]', '192.168.1.105', '2019-09-30 17:53:20');
INSERT INTO `admin_log` VALUES (564, 'org.apache.catalina.connector.RequestFacade@3fc080a1', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3fc080a1]', '192.168.1.105', '2019-09-30 17:53:21');
INSERT INTO `admin_log` VALUES (565, 'org.apache.catalina.connector.RequestFacade@3fc080a1', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3fc080a1]', '192.168.1.105', '2019-09-30 17:53:22');
INSERT INTO `admin_log` VALUES (566, 'org.apache.catalina.connector.RequestFacade@3fc080a1', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3fc080a1]', '192.168.1.105', '2019-09-30 17:53:23');
INSERT INTO `admin_log` VALUES (567, 'org.apache.catalina.connector.RequestFacade@3fc080a1', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3fc080a1]', '192.168.1.105', '2019-09-30 17:53:24');
INSERT INTO `admin_log` VALUES (568, 'org.apache.catalina.connector.RequestFacade@3fc080a1', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3fc080a1]', '192.168.1.105', '2019-09-30 17:53:33');
INSERT INTO `admin_log` VALUES (569, 'org.apache.catalina.connector.RequestFacade@3fc080a1', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3fc080a1]', '192.168.1.105', '2019-09-30 17:53:37');
INSERT INTO `admin_log` VALUES (570, 'org.apache.catalina.connector.RequestFacade@3fc080a1', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3fc080a1]', '192.168.1.105', '2019-09-30 17:53:45');
INSERT INTO `admin_log` VALUES (571, 'org.apache.catalina.connector.RequestFacade@3fc080a1', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3fc080a1]', '192.168.1.105', '2019-09-30 17:53:45');
INSERT INTO `admin_log` VALUES (572, 'org.apache.catalina.connector.RequestFacade@3fc080a1', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3fc080a1]', '192.168.1.105', '2019-09-30 17:54:06');
INSERT INTO `admin_log` VALUES (573, 'org.apache.catalina.connector.RequestFacade@3fc080a1', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3fc080a1]', '192.168.1.105', '2019-09-30 17:54:07');
INSERT INTO `admin_log` VALUES (574, 'org.apache.catalina.connector.RequestFacade@3fc080a1', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3fc080a1]', '192.168.1.105', '2019-09-30 17:54:28');
INSERT INTO `admin_log` VALUES (575, 'org.apache.catalina.connector.RequestFacade@3fc080a1', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3fc080a1]', '192.168.1.105', '2019-09-30 17:54:31');
INSERT INTO `admin_log` VALUES (576, 'org.apache.catalina.connector.RequestFacade@3fc080a1', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3fc080a1]', '192.168.1.105', '2019-09-30 17:57:22');
INSERT INTO `admin_log` VALUES (577, 'org.apache.catalina.connector.RequestFacade@43b6a693', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@43b6a693]', '192.168.1.105', '2019-09-30 17:57:26');
INSERT INTO `admin_log` VALUES (578, 'org.apache.catalina.connector.RequestFacade@43b6a693', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@43b6a693]', '192.168.1.105', '2019-09-30 17:57:38');
INSERT INTO `admin_log` VALUES (579, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@4d0f6df0]', '192.168.1.106', '2019-09-30 17:58:49');
INSERT INTO `admin_log` VALUES (580, 'org.apache.catalina.connector.RequestFacade@43b6a693', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@43b6a693]', '192.168.1.106', '2019-09-30 17:59:04');
INSERT INTO `admin_log` VALUES (581, 'org.apache.catalina.connector.RequestFacade@8fa947e', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@8fa947e]', '192.168.1.106', '2019-09-30 17:59:11');
INSERT INTO `admin_log` VALUES (582, 'org.apache.catalina.connector.RequestFacade@8fa947e', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@8fa947e]', '192.168.1.106', '2019-09-30 17:59:15');
INSERT INTO `admin_log` VALUES (583, 'org.apache.catalina.connector.RequestFacade@8fa947e', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@8fa947e]', '192.168.1.105', '2019-09-30 17:59:20');
INSERT INTO `admin_log` VALUES (584, 'org.apache.catalina.connector.RequestFacade@8fa947e', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@8fa947e]', '192.168.1.106', '2019-09-30 17:59:20');
INSERT INTO `admin_log` VALUES (585, 'org.apache.catalina.connector.RequestFacade@8fa947e', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@8fa947e]', '192.168.1.105', '2019-09-30 17:59:22');
INSERT INTO `admin_log` VALUES (586, 'org.apache.catalina.connector.RequestFacade@43b6a693', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@43b6a693]', '192.168.1.106', '2019-09-30 17:59:24');
INSERT INTO `admin_log` VALUES (587, 'org.apache.catalina.connector.RequestFacade@43b6a693', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@43b6a693]', '192.168.1.106', '2019-09-30 17:59:26');
INSERT INTO `admin_log` VALUES (588, 'org.apache.catalina.connector.RequestFacade@3fc080a1', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3fc080a1]', '192.168.1.106', '2019-09-30 17:59:27');
INSERT INTO `admin_log` VALUES (589, 'org.apache.catalina.connector.RequestFacade@3fc080a1', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3fc080a1]', '192.168.1.106', '2019-09-30 17:59:28');
INSERT INTO `admin_log` VALUES (590, 'org.apache.catalina.connector.RequestFacade@3fc080a1', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3fc080a1]', '192.168.1.105', '2019-09-30 17:59:59');
INSERT INTO `admin_log` VALUES (591, 'org.apache.catalina.connector.RequestFacade@3fc080a1', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3fc080a1]', '192.168.1.105', '2019-09-30 18:00:11');
INSERT INTO `admin_log` VALUES (592, 'org.apache.catalina.connector.RequestFacade@3fc080a1', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3fc080a1]', '192.168.1.105', '2019-09-30 18:00:13');
INSERT INTO `admin_log` VALUES (593, 'org.apache.catalina.connector.RequestFacade@3fc080a1', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3fc080a1]', '192.168.1.106', '2019-09-30 18:00:30');
INSERT INTO `admin_log` VALUES (594, 'org.apache.catalina.connector.RequestFacade@3fc080a1', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3fc080a1]', '192.168.1.105', '2019-09-30 18:00:33');
INSERT INTO `admin_log` VALUES (595, 'org.apache.catalina.connector.RequestFacade@3fc080a1', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@3fc080a1]', '192.168.1.106', '2019-09-30 18:00:46');
INSERT INTO `admin_log` VALUES (596, 'ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=zhangsan, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@7518ee11]', '192.168.1.111', '2019-10-04 08:48:51');
INSERT INTO `admin_log` VALUES (597, 'ReceivingAppUserLogin(account=13262006650, password=123456, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=13262006650, password=123456, verifyCode=null), org.apache.catalina.connector.ResponseFacade@31068fa3]', '192.168.1.166', '2019-10-04 08:57:08');
INSERT INTO `admin_log` VALUES (598, 'org.apache.catalina.connector.RequestFacade@ab7f2b2', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@ab7f2b2]', '192.168.1.166', '2019-10-04 08:58:10');
INSERT INTO `admin_log` VALUES (599, 'org.apache.catalina.connector.RequestFacade@ab7f2b2', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@ab7f2b2]', '192.168.1.166', '2019-10-04 08:58:12');
INSERT INTO `admin_log` VALUES (600, 'org.apache.catalina.connector.RequestFacade@ab7f2b2', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@ab7f2b2]', '192.168.1.166', '2019-10-04 08:58:12');
INSERT INTO `admin_log` VALUES (601, 'org.apache.catalina.connector.RequestFacade@ab7f2b2', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@ab7f2b2]', '192.168.1.166', '2019-10-04 08:58:13');
INSERT INTO `admin_log` VALUES (602, 'org.apache.catalina.connector.RequestFacade@ab7f2b2', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@ab7f2b2]', '192.168.1.166', '2019-10-04 08:58:13');
INSERT INTO `admin_log` VALUES (603, 'Decliver(senAddress={\"provinceCityDist\":\"北京市 市辖区 朝阳区 回家看看今年\",\"name\":\"虎子\",\"phone\":\"13262006650\"}, recipients={\"provinceCityDist\":\"北京市 市辖区 朝阳区 回家看看今年\",\"name\":\"虎子\",\"phone\":\"13262006650\"}, goodInfo=dfas, senderType=1, modeOfDespatch=1, payType=1, remarks=sefasf, orderArea=1, stdmode=1)', '普通会员发货', 'com.zfl.controller.app.shipmentsapp.DeliverController.userDeliver', '[Decliver(senAddress={\"provinceCityDist\":\"北京市 市辖区 朝阳区 回家看看今年\",\"name\":\"虎子\",\"phone\":\"13262006650\"}, recipients={\"provinceCityDist\":\"北京市 市辖区 朝阳区 回家看看今年\",\"name\":\"虎子\",\"phone\":\"13262006650\"}, goodInfo=dfas, senderType=1, modeOfDespatch=1, payType=1, remarks=sefasf, orderArea=1, stdmode=1)]', '192.168.1.166', '2019-10-04 08:58:26');
INSERT INTO `admin_log` VALUES (604, 'org.apache.catalina.connector.RequestFacade@ab7f2b2', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@ab7f2b2]', '192.168.1.166', '2019-10-04 08:58:40');
INSERT INTO `admin_log` VALUES (605, 'org.apache.catalina.connector.RequestFacade@2351f343', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@2351f343]', '192.168.1.166', '2019-10-04 08:58:50');
INSERT INTO `admin_log` VALUES (606, 'org.apache.catalina.connector.RequestFacade@6b893e70', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@6b893e70]', '192.168.1.166', '2019-10-04 08:58:51');
INSERT INTO `admin_log` VALUES (607, 'org.apache.catalina.connector.RequestFacade@6b893e70', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@6b893e70]', '192.168.1.166', '2019-10-04 08:58:52');
INSERT INTO `admin_log` VALUES (608, 'org.apache.catalina.connector.RequestFacade@6b893e70', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@6b893e70]', '192.168.1.166', '2019-10-04 08:58:53');
INSERT INTO `admin_log` VALUES (609, 'org.apache.catalina.connector.RequestFacade@6b893e70', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@6b893e70]', '192.168.1.166', '2019-10-04 08:58:55');
INSERT INTO `admin_log` VALUES (610, 'org.apache.catalina.connector.RequestFacade@6b893e70', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@6b893e70]', '192.168.1.166', '2019-10-04 08:58:55');
INSERT INTO `admin_log` VALUES (611, 'org.apache.catalina.connector.RequestFacade@6b893e70', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@6b893e70]', '192.168.1.166', '2019-10-04 08:58:56');
INSERT INTO `admin_log` VALUES (612, 'org.apache.catalina.connector.RequestFacade@6b893e70', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@6b893e70]', '192.168.1.166', '2019-10-04 08:58:59');
INSERT INTO `admin_log` VALUES (613, 'org.apache.catalina.connector.RequestFacade@6b893e70', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@6b893e70]', '192.168.1.166', '2019-10-04 08:58:59');
INSERT INTO `admin_log` VALUES (614, 'org.apache.catalina.connector.RequestFacade@6b893e70', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@6b893e70]', '192.168.1.166', '2019-10-04 08:59:33');
INSERT INTO `admin_log` VALUES (615, 'org.apache.catalina.connector.RequestFacade@db27226', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@db27226]', '192.168.1.166', '2019-10-04 09:00:00');
INSERT INTO `admin_log` VALUES (616, 'ReceivingAppUserLogin(account=admin, password=admin, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=admin, password=admin, verifyCode=null), org.apache.catalina.connector.ResponseFacade@16b60197]', '192.168.1.55', '2019-10-04 09:01:13');
INSERT INTO `admin_log` VALUES (617, 'UserRegisterVo(account=admin, password=admin, area=1, inviteCode=, verifyCode=4st6)', '用户注册', 'com.zfl.controller.app.shipmentsapp.LoginController.register', '[UserRegisterVo(account=admin, password=admin, area=1, inviteCode=, verifyCode=4st6), org.apache.catalina.connector.RequestFacade@1ac13354]', '192.168.1.55', '2019-10-04 09:02:24');
INSERT INTO `admin_log` VALUES (618, 'ReceivingAppUserLogin(account=admin, password=admin, verifyCode=null)', '用户登陆', 'com.zfl.controller.app.shipmentsapp.LoginController.receivingLogin', '[ReceivingAppUserLogin(account=admin, password=admin, verifyCode=null), org.apache.catalina.connector.ResponseFacade@16b60197]', '192.168.1.55', '2019-10-04 09:02:31');
INSERT INTO `admin_log` VALUES (619, 'org.apache.catalina.connector.RequestFacade@1ac13354', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@1ac13354]', '192.168.1.55', '2019-10-04 09:02:35');
INSERT INTO `admin_log` VALUES (620, 'org.apache.catalina.connector.RequestFacade@1ac13354', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@1ac13354]', '192.168.1.55', '2019-10-04 09:03:02');
INSERT INTO `admin_log` VALUES (621, 'org.apache.catalina.connector.RequestFacade@1ac13354', '查询用户地址', 'com.zfl.controller.app.shipmentsapp.SuerSendAddressController.getAddressList', '[org.apache.catalina.connector.RequestFacade@1ac13354]', '192.168.1.55', '2019-10-04 09:03:05');

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态   1开启   0关闭',
  `soft_delete` int(11) NULL DEFAULT NULL COMMENT '是否软删除  0：删  1：不删',
  `update_person` int(11) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `delete_person` int(11) NULL DEFAULT NULL COMMENT '删除人',
  `delete_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '删除时间',
  `create_person` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `user_vip` int(255) NOT NULL DEFAULT 1 COMMENT '用户vip',
  `user_salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码盐值',
  `user_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户区域',
  `user_invite_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邀请码',
  `user_type` int(255) NOT NULL COMMENT '用户类型   1 代理    0普通会员',
  `remaining_sum` double(10, 2) NULL DEFAULT NULL COMMENT '用户余额（积分余额）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES (1, 'zhangsan', '7d92a6e6a32d4beede1507316c6e9645', '可爱的狐狸', 1, NULL, NULL, '2019-09-30 09:28:24', NULL, '2019-09-30 09:28:24', NULL, '2019-09-30 09:28:24', 4, 'c1fb7fbd97544875a0b0585c2b11618a', '1', 'YDL2WS', 0, 0.00);
INSERT INTO `admin_user` VALUES (2, '王五', '0bc00e2f09de8e19554c7f6764b730b4', NULL, 1, NULL, NULL, '2019-09-30 11:21:02', NULL, '2019-09-30 11:21:02', NULL, '2019-09-30 11:21:02', 1, 'd463d13aa4c24b708543b74df5583669', '1', 'A5DVFS', 0, 0.00);
INSERT INTO `admin_user` VALUES (3, '20190930', '0efbbd5a9eff849a6940b48d66e05ece', NULL, 1, NULL, NULL, '2019-09-30 11:59:04', NULL, '2019-09-30 11:59:04', NULL, '2019-09-30 11:59:04', 1, 'f01fb42fcc7c495684a854eb845d08c4', '1', '63JU85', 0, 0.00);
INSERT INTO `admin_user` VALUES (4, '木子李', 'd50fb29d126f1f5edb6421c67746e76c', NULL, 1, NULL, NULL, '2019-09-30 15:06:23', NULL, '2019-09-30 15:06:23', NULL, '2019-09-30 15:06:23', 1, '358b4a6b78fb4c6fa035c3fe60b419ca', '1', 'LVYU2G', 0, 0.00);
INSERT INTO `admin_user` VALUES (5, '邢婉豫', '233381065da998114fe81af84258b8bb', NULL, 1, NULL, NULL, '2019-09-30 15:13:09', NULL, '2019-09-30 15:13:09', NULL, '2019-09-30 15:13:09', 1, '1176cd6758734197bc1e65e57324fd9a', '1', '7X4CR8', 0, 0.00);
INSERT INTO `admin_user` VALUES (11, '13298367498', '081b14b98befaec033d5f4b5cccbb82d', NULL, 1, NULL, NULL, '2019-09-30 16:51:13', NULL, '2019-09-30 16:51:13', NULL, '2019-09-30 16:51:13', 1, '6c811cbf6995443b9ba304d9a619943b', '1', '1T4FKV', 0, 0.00);
INSERT INTO `admin_user` VALUES (12, '果果', '44354d928d3e7c74367c39a058901222', NULL, 1, NULL, NULL, '2019-09-30 17:03:14', NULL, '2019-09-30 17:03:14', NULL, '2019-09-30 17:03:14', 1, '530fa5f6444b46009a881b5ec8c4003d', '1', 'PGMIE5', 0, 0.00);
INSERT INTO `admin_user` VALUES (20, '13578624868', '3cc6fe765ec2323a6d1349f1212f1e41', NULL, 1, NULL, NULL, '2019-09-30 17:04:27', NULL, '2019-09-30 17:04:27', NULL, '2019-09-30 17:04:27', 1, 'd992890770d4426da3b866a48e0589b4', '1', 'W9MJXH', 0, 0.00);
INSERT INTO `admin_user` VALUES (21, '13262006650', 'a6d10b9593504637f4f3bd2d6dbfebc0', '以后哈哈哈', 1, NULL, NULL, '2019-09-30 17:11:31', NULL, '2019-09-30 17:11:31', NULL, '2019-09-30 17:11:31', 1, '0b02fd6605874249b2f75fe4656c0922', '1', '3KBM61', 0, 0.00);
INSERT INTO `admin_user` VALUES (22, '木子', '0cb7fcf3bfedcfffa867a3f4de91db50', NULL, 1, NULL, NULL, '2019-09-30 17:13:47', NULL, '2019-09-30 17:13:47', NULL, '2019-09-30 17:13:47', 1, '787f167653e4480a94df7a89aaa2e509', '1', '0WL3T0', 0, 0.00);
INSERT INTO `admin_user` VALUES (23, '智付联', 'a9cdf6c6dafca1e104eff66e68bb4f3c', NULL, 1, NULL, NULL, '2019-09-30 17:14:23', NULL, '2019-09-30 17:14:23', NULL, '2019-09-30 17:14:23', 1, 'ed799822ffb14cc98aba84ca9ae98414', '1', '1Y1JAB', 0, 0.00);
INSERT INTO `admin_user` VALUES (24, 'admin', '358eaecfaa2b958fb6e47648d8785d34', NULL, 1, NULL, NULL, '2019-10-04 09:00:45', NULL, '2019-10-04 09:00:45', NULL, '2019-10-04 09:00:45', 1, '77fd513fc66246c397330c20d3c4f49f', '1', 'OLA6QT', 0, 0.00);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `parent_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父菜单',
  `level` bigint(2) NULL DEFAULT NULL COMMENT '菜单层级',
  `parent_ids` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父菜单联集',
  `sort` smallint(6) NULL DEFAULT NULL COMMENT '排序',
  `href` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接地址',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打开方式',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `bg_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示背景色',
  `is_show` tinyint(2) NULL DEFAULT NULL COMMENT '是否显示',
  `permission` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` tinyint(2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('00dd56e45ee4412080863863f42f9ecf', 'vip用户列表', '6689c17e720648bf8b2062290328d591', 2, '6689c17e720648bf8b2062290328d591,00dd56e45ee4412080863863f42f9ecf,', 1, '/admin/vipUser/list', NULL, NULL, '', 1, 'sys:vipUser:list', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-02 12:01:31', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-02 12:37:55', NULL, 0);
INSERT INTO `sys_menu` VALUES ('17e4ebe9bfd74ae6ac99cf267bb306aa', '查询', 'e34d36b8148b4d1c85f6c4d1aecac505', 3, 'a0a2a76318354fa9b2fa1d259ee1055e,e34d36b8148b4d1c85f6c4d1aecac505,17e4ebe9bfd74ae6ac99cf267bb306aa,', 1, '', NULL, NULL, '', 0, 'sys:order:list', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-08-30 20:53:41', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-08-31 10:46:56', NULL, 0);
INSERT INTO `sys_menu` VALUES ('18c023c8c2794d8883a2c95e5ec1f72e', '积分商城', NULL, 1, '18c023c8c2794d8883a2c95e5ec1f72e,', 98, '', NULL, '', '', 1, '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-15 09:04:44', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-15 09:07:27', NULL, 0);
INSERT INTO `sys_menu` VALUES ('19ef34a440d246efb9eb19e87487f2f9', '明细', 'a4256ff366364368aa39f9860119e5ad', 3, '31993e6c7f204b409378defd96e446bf,a4256ff366364368aa39f9860119e5ad,19ef34a440d246efb9eb19e87487f2f9,', 1, '', NULL, NULL, '', 1, '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-03 17:25:24', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-03 18:08:02', NULL, 1);
INSERT INTO `sys_menu` VALUES ('1b4e2fd5751249ccb330d8cceb219508', '区域删除111', NULL, 1, '1b4e2fd5751249ccb330d8cceb219508,', 12, '', NULL, '', '', 1, '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 09:59:16', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 10:01:05', NULL, 1);
INSERT INTO `sys_menu` VALUES ('27651657a7254fa287a596f961cfe069', '快递公司', NULL, 1, '27651657a7254fa287a596f961cfe069,', 93, '', NULL, '', '', 1, '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 15:51:25', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 18:00:06', NULL, 0);
INSERT INTO `sys_menu` VALUES ('31993e6c7f204b409378defd96e446bf', '资金管理', NULL, 1, '31993e6c7f204b409378defd96e446bf,', 97, '', NULL, '', '#2b231a', 1, '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-07-19 15:48:42', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 17:59:11', NULL, 0);
INSERT INTO `sys_menu` VALUES ('325bd5250df14f159198423fe15ac532', '区域管理', NULL, 1, '325bd5250df14f159198423fe15ac532,', 91, '', NULL, '', '', 1, '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-08-31 08:58:06', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 18:00:19', NULL, 0);
INSERT INTO `sys_menu` VALUES ('39ca777249ff4eb494b54598e94d94f0', 'vip添加', 'ff4b21092c0546819aad28cc29d422a1', 3, 'da3774e605e84df8b477347a4a2b6e7f,ff4b21092c0546819aad28cc29d422a1,39ca777249ff4eb494b54598e94d94f0,', 1, 'admin/vip/add', NULL, NULL, '', 0, 'sys:vip:add', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-02 14:15:58', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-02 14:15:58', NULL, 0);
INSERT INTO `sys_menu` VALUES ('3b54e2a2-9adb-11e8-aebe-1368d4ec24eb', '用户管理', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb', 2, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,', 9, '/admin/system/user/list', NULL, '', '#47e69c', 1, 'sys:user:list', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-01-16 11:31:18', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-01-20 05:59:20', NULL, 0);
INSERT INTO `sys_menu` VALUES ('3b58e01e-9adb-11e8-aebe-1368d4ec24eb', '角色管理', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb', 2, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b58e01e-9adb-11e8-aebe-1368d4ec24eb,', 10, '/admin/system/role/list', NULL, '', '#c23ab9', 1, 'sys:role:list', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-01-16 11:32:33', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-01-20 05:58:58', NULL, 0);
INSERT INTO `sys_menu` VALUES ('3b5cb607-9adb-11e8-aebe-1368d4ec24eb', '权限管理', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb', 2, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b5cb607-9adb-11e8-aebe-1368d4ec24eb,', 20, '/admin/system/menu/list', NULL, '', '#d4573b', 1, 'sys:menu:list', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-01-16 11:33:19', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:49:28', NULL, 0);
INSERT INTO `sys_menu` VALUES ('3e0b86a3-9adc-11e8-aebe-1368d4ec24eb', '新增用户', '3b54e2a2-9adb-11e8-aebe-1368d4ec24eb', 3, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,3e0b86a3-9adc-11e8-aebe-1368d4ec24eb,', 0, '', NULL, NULL, NULL, 0, 'sys:user:add', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 10:10:32', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 10:10:32', NULL, 0);
INSERT INTO `sys_menu` VALUES ('3e2fa8b6-9adc-11e8-aebe-1368d4ec24eb', '编辑用户', '3b54e2a2-9adb-11e8-aebe-1368d4ec24eb', 3, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,3e2fa8b6-9adc-11e8-aebe-1368d4ec24eb,', 10, '', NULL, NULL, NULL, 0, 'sys:user:edit', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 10:11:49', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 10:11:49', NULL, 0);
INSERT INTO `sys_menu` VALUES ('3e36cf2f-9adc-11e8-aebe-1368d4ec24eb', '删除用户', '3b54e2a2-9adb-11e8-aebe-1368d4ec24eb', 3, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,3e36cf2f-9adc-11e8-aebe-1368d4ec24eb,', 20, '', NULL, NULL, NULL, 0, 'sys:user:delete', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 10:12:43', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 10:12:43', NULL, 0);
INSERT INTO `sys_menu` VALUES ('54a9d7544cbe4ddc8a61ba294f7f1d5e', '快递公司列表', '27651657a7254fa287a596f961cfe069', 2, '27651657a7254fa287a596f961cfe069,54a9d7544cbe4ddc8a61ba294f7f1d5e,', 1, '/admin/tracking/list', NULL, NULL, '', 1, '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 15:54:41', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 15:54:41', NULL, 0);
INSERT INTO `sys_menu` VALUES ('58c8f92258494612b7946a3f5c9036a9', 'vip修改', 'ff4b21092c0546819aad28cc29d422a1', 3, 'da3774e605e84df8b477347a4a2b6e7f,ff4b21092c0546819aad28cc29d422a1,58c8f92258494612b7946a3f5c9036a9,', 3, 'admin/vip/update', NULL, NULL, '', 0, 'sys:vip:update', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-03 15:17:22', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-03 15:17:55', NULL, 0);
INSERT INTO `sys_menu` VALUES ('5b67806a894c41368d01d0cd8075cfb5', '区域添加', 'ea23a724760e41cb86ba8459de53c8b7', 3, '325bd5250df14f159198423fe15ac532,ea23a724760e41cb86ba8459de53c8b7,5b67806a894c41368d01d0cd8075cfb5,', 2, '/admin/area/add', NULL, NULL, '', 0, 'sys:area:add', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-03 16:21:36', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-03 16:21:36', NULL, 0);
INSERT INTO `sys_menu` VALUES ('667c49d20c8047698fb5452fbf45623f', '支付类型管理', '6ddd1fd1e7964ac38f2edaa3eceda114', 2, '6ddd1fd1e7964ac38f2edaa3eceda114,667c49d20c8047698fb5452fbf45623f,', 1, '/admin/pay/payType', NULL, NULL, '', 1, '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 09:52:28', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 09:53:51', NULL, 0);
INSERT INTO `sys_menu` VALUES ('6689c17e720648bf8b2062290328d591', 'vip用户管理', NULL, 1, '6689c17e720648bf8b2062290328d591,', 98, '', NULL, '', '', 1, '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-02 12:01:10', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 17:58:45', NULL, 0);
INSERT INTO `sys_menu` VALUES ('6b5fa403626e41a1847c5dd09832151f', '认证管理', NULL, 1, '6b5fa403626e41a1847c5dd09832151f,', 34, '/authenticationApply/inlet', NULL, '', '', 1, '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-23 16:10:32', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-29 16:58:40', NULL, 0);
INSERT INTO `sys_menu` VALUES ('6d785d957026421e9f593e21559e6020', '区域修改', 'ea23a724760e41cb86ba8459de53c8b7', 3, '325bd5250df14f159198423fe15ac532,ea23a724760e41cb86ba8459de53c8b7,6d785d957026421e9f593e21559e6020,', 3, '/admin/area/edit', NULL, NULL, '', 0, 'sys:area:edit', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-03 16:24:38', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-03 16:24:38', NULL, 0);
INSERT INTO `sys_menu` VALUES ('6ddd1fd1e7964ac38f2edaa3eceda114', '支付管理', NULL, 1, '6ddd1fd1e7964ac38f2edaa3eceda114,', 21, '/admin/area/add', NULL, NULL, '', 1, '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 09:50:27', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 09:58:51', NULL, 1);
INSERT INTO `sys_menu` VALUES ('6fccfc3bce3f4b49a6117532e99ca964', '编辑', '9c12577d730c46ba9a3ff5173c40a77e', 3, 'e560219753ca4e28a2e6cee0a67fb64c,9c12577d730c46ba9a3ff5173c40a77e,6fccfc3bce3f4b49a6117532e99ca964,', 1, 'admin/offer/edit', NULL, NULL, '', 0, 'sys:offer:edit', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 08:39:15', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 08:39:15', NULL, 0);
INSERT INTO `sys_menu` VALUES ('7bc13ebfa65c44bdaf77a6d0a71e060d', '输入快递单号', 'e34d36b8148b4d1c85f6c4d1aecac505', 3, 'a0a2a76318354fa9b2fa1d259ee1055e,e34d36b8148b4d1c85f6c4d1aecac505,7bc13ebfa65c44bdaf77a6d0a71e060d,', 2, '', NULL, NULL, '', 0, 'sys:order:edit', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-08-31 17:44:38', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-08-31 17:44:45', NULL, 0);
INSERT INTO `sys_menu` VALUES ('7d1020ee-9ad9-11e8-aebe-1368d4ec24eb', '系统管理', NULL, 1, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,', 99, '', NULL, '', '', 1, '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-01-16 11:29:46', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 17:58:04', NULL, 0);
INSERT INTO `sys_menu` VALUES ('81fd336391674615946d37257d217f2b', '提现审核', 'f58f14103a3449fa9a5dd030076f60ca', 2, 'f58f14103a3449fa9a5dd030076f60ca,81fd336391674615946d37257d217f2b,', 2, 'admin/draw/drawList', NULL, NULL, '', 0, 'sys:draw:updateDraw', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 11:11:12', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 11:14:42', NULL, 0);
INSERT INTO `sys_menu` VALUES ('84a62b9203b54cf98ffc87358053c8a9', '锁定vip用户', '00dd56e45ee4412080863863f42f9ecf', 3, '6689c17e720648bf8b2062290328d591,00dd56e45ee4412080863863f42f9ecf,84a62b9203b54cf98ffc87358053c8a9,', 1, '', NULL, NULL, '', 0, 'sys:vipUser:lock', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-02 13:16:19', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-02 13:16:19', NULL, 0);
INSERT INTO `sys_menu` VALUES ('8a05a3f32af84399b80745600a125a70', '商品管理', '18c023c8c2794d8883a2c95e5ec1f72e', 2, '18c023c8c2794d8883a2c95e5ec1f72e,8a05a3f32af84399b80745600a125a70,', 2, '/admin/goods/list', NULL, NULL, '', 1, '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-15 09:05:47', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-15 09:37:26', NULL, 0);
INSERT INTO `sys_menu` VALUES ('8f641e0c0a884efd85ec760d16fb16c0', '支付管理', NULL, 1, '8f641e0c0a884efd85ec760d16fb16c0,', 95, '', NULL, '', '', 1, '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 10:01:12', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 17:59:36', NULL, 0);
INSERT INTO `sys_menu` VALUES ('8f9a8da067d74148b0e59019f55bb4ad', '现在就提现', 'd31a725aa702436a8b582bfcb464bb15', 4, 'f58f14103a3449fa9a5dd030076f60ca,ccb6ccb7d7114a8f8adcb557c39cac7b,d31a725aa702436a8b582bfcb464bb15,8f9a8da067d74148b0e59019f55bb4ad,', 1, '', NULL, NULL, '', 1, 'xz', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-02 10:24:50', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-02 10:27:25', NULL, 1);
INSERT INTO `sys_menu` VALUES ('96fd6a5a-9adb-11e8-aebe-1368d4ec24eb', '新增权限', '3b5cb607-9adb-11e8-aebe-1368d4ec24eb', 3, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b5cb607-9adb-11e8-aebe-1368d4ec24eb,96fd6a5a-9adb-11e8-aebe-1368d4ec24eb,', 0, '', NULL, NULL, NULL, 0, 'sys:menu:add', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:49:15', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:49:38', NULL, 0);
INSERT INTO `sys_menu` VALUES ('9703ccf2-9adb-11e8-aebe-1368d4ec24eb', '编辑权限', '3b5cb607-9adb-11e8-aebe-1368d4ec24eb', 3, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b5cb607-9adb-11e8-aebe-1368d4ec24eb,9703ccf2-9adb-11e8-aebe-1368d4ec24eb,', 10, '', NULL, NULL, NULL, 0, 'sys:menu:edit', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:50:16', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:50:25', NULL, 0);
INSERT INTO `sys_menu` VALUES ('9707cf58-9adb-11e8-aebe-1368d4ec24eb', '删除权限', '3b5cb607-9adb-11e8-aebe-1368d4ec24eb', 3, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b5cb607-9adb-11e8-aebe-1368d4ec24eb,9707cf58-9adb-11e8-aebe-1368d4ec24eb,', 20, '', NULL, NULL, NULL, 0, 'sys:menu:delete', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:51:53', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:53:42', NULL, 0);
INSERT INTO `sys_menu` VALUES ('9c12577d730c46ba9a3ff5173c40a77e', '各快递价格报表', 'e560219753ca4e28a2e6cee0a67fb64c', 2, 'e560219753ca4e28a2e6cee0a67fb64c,9c12577d730c46ba9a3ff5173c40a77e,', 1, 'admin/offer/list', NULL, NULL, '', 1, 'sys:offer:list', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 08:30:53', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 08:30:53', NULL, 0);
INSERT INTO `sys_menu` VALUES ('a0a2a76318354fa9b2fa1d259ee1055e', '订单管理', NULL, 1, 'a0a2a76318354fa9b2fa1d259ee1055e,', 96, '', NULL, '', '', 1, '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-07-19 18:53:16', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 17:59:27', NULL, 0);
INSERT INTO `sys_menu` VALUES ('a249959873614aee9383a48f9e6b7541', '代理申请2', NULL, 1, 'a249959873614aee9383a48f9e6b7541,', 40, '/admin/agency/inlet', NULL, '', '', 1, '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-17 16:07:47', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-29 16:58:13', NULL, 0);
INSERT INTO `sys_menu` VALUES ('a4256ff366364368aa39f9860119e5ad', '收益统计', '31993e6c7f204b409378defd96e446bf', 2, '31993e6c7f204b409378defd96e446bf,a4256ff366364368aa39f9860119e5ad,', 3, '/admin/vipEarningStatistics/inlet', NULL, NULL, '', 1, 'admin:vipEarningStatistics:inlet', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-02 15:11:56', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 16:29:30', NULL, 0);
INSERT INTO `sys_menu` VALUES ('b031b04031cf4d2aae42b0f9013b5016', 'vip删除', 'ff4b21092c0546819aad28cc29d422a1', 3, 'da3774e605e84df8b477347a4a2b6e7f,ff4b21092c0546819aad28cc29d422a1,b031b04031cf4d2aae42b0f9013b5016,', 2, 'admin/vip/dele', NULL, NULL, '', 0, 'sys:vip:dele', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-02 14:16:31', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-02 14:16:31', NULL, 0);
INSERT INTO `sys_menu` VALUES ('b97240f4d5114bef9866735a06429c26', '添加', '9c12577d730c46ba9a3ff5173c40a77e', 3, 'e560219753ca4e28a2e6cee0a67fb64c,9c12577d730c46ba9a3ff5173c40a77e,b97240f4d5114bef9866735a06429c26,', 3, 'admin/offer/add', NULL, NULL, '', 0, 'sys:offer:add', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 09:37:47', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 09:37:47', NULL, 0);
INSERT INTO `sys_menu` VALUES ('bd06787c174f46ef8aea6b9add45c757', '代理收益统计', '31993e6c7f204b409378defd96e446bf', 2, '31993e6c7f204b409378defd96e446bf,bd06787c174f46ef8aea6b9add45c757,', 4, '', NULL, NULL, '', 1, '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-02 15:12:20', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 16:11:28', NULL, 1);
INSERT INTO `sys_menu` VALUES ('c65547afd45944f9839d9bbeaf4769fb', '接口设置', NULL, 1, 'c65547afd45944f9839d9bbeaf4769fb,', 16, '/admin/system/menu/api', NULL, '', '', 1, '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-07-19 16:17:10', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-08-31 09:00:47', NULL, 1);
INSERT INTO `sys_menu` VALUES ('c6f0575fe4774a37a13e1e237489b79b', '快递员收件单价', 'e560219753ca4e28a2e6cee0a67fb64c', 2, 'e560219753ca4e28a2e6cee0a67fb64c,c6f0575fe4774a37a13e1e237489b79b,', 2, '/admin/courier/list', NULL, NULL, '', 1, 'sys:courier:list', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-27 11:20:44', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-27 11:20:44', NULL, 0);
INSERT INTO `sys_menu` VALUES ('c8303c0008094b5ab22df0f7f7d41b21', '支付类型', '8f641e0c0a884efd85ec760d16fb16c0', 2, '8f641e0c0a884efd85ec760d16fb16c0,c8303c0008094b5ab22df0f7f7d41b21,', 1, '/admin/pay/payType', NULL, NULL, '', 1, '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 10:05:01', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 10:05:01', NULL, 0);
INSERT INTO `sys_menu` VALUES ('ccb6ccb7d7114a8f8adcb557c39cac7b', '提现列表', 'f58f14103a3449fa9a5dd030076f60ca', 2, 'f58f14103a3449fa9a5dd030076f60ca,ccb6ccb7d7114a8f8adcb557c39cac7b,', 1, '/admin/draw/drawList', NULL, '', '#99938d', 1, 'sys:draw:list', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-07-19 15:40:24', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-25 14:38:06', NULL, 0);
INSERT INTO `sys_menu` VALUES ('d30d736d04e54858ace9bdb6e800c749', '马上就提现', '8f9a8da067d74148b0e59019f55bb4ad', 5, 'f58f14103a3449fa9a5dd030076f60ca,ccb6ccb7d7114a8f8adcb557c39cac7b,d31a725aa702436a8b582bfcb464bb15,8f9a8da067d74148b0e59019f55bb4ad,d30d736d04e54858ace9bdb6e800c749,', 1, '', NULL, NULL, '', 1, 'mashang', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-02 10:25:26', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-02 10:27:16', NULL, 1);
INSERT INTO `sys_menu` VALUES ('d31a725aa702436a8b582bfcb464bb15', '支付宝提现', 'ccb6ccb7d7114a8f8adcb557c39cac7b', 3, 'f58f14103a3449fa9a5dd030076f60ca,ccb6ccb7d7114a8f8adcb557c39cac7b,d31a725aa702436a8b582bfcb464bb15,', 1, '', NULL, NULL, '', 1, 'zfb', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-02 10:23:48', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-02 10:27:31', NULL, 1);
INSERT INTO `sys_menu` VALUES ('d702891cadf74858b55239767a81e220', '商品订单', '18c023c8c2794d8883a2c95e5ec1f72e', 2, '18c023c8c2794d8883a2c95e5ec1f72e,d702891cadf74858b55239767a81e220,', 1, '/admin/mall/orderManage/inlet', NULL, NULL, '', 1, '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-15 09:06:47', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-15 11:47:06', NULL, 0);
INSERT INTO `sys_menu` VALUES ('d71436ac28974a84aef35560af037fc1', '收益统计', '31993e6c7f204b409378defd96e446bf', 2, '31993e6c7f204b409378defd96e446bf,d71436ac28974a84aef35560af037fc1,', 2, '/admin/system/menu/Income', NULL, '', '', 1, '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-07-19 18:46:57', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 15:53:34', NULL, 1);
INSERT INTO `sys_menu` VALUES ('d8bd1d5ece3f4d42b07c3c02b2712f11', '番茄', '6b5fa403626e41a1847c5dd09832151f', 2, '6b5fa403626e41a1847c5dd09832151f,d8bd1d5ece3f4d42b07c3c02b2712f11,', 1, 'adew', NULL, '', '', 1, 'w', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-29 16:51:18', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-29 16:51:18', NULL, 0);
INSERT INTO `sys_menu` VALUES ('da3774e605e84df8b477347a4a2b6e7f', 'vip等级管理', NULL, 1, 'da3774e605e84df8b477347a4a2b6e7f,', 94, '', NULL, '', '', 1, '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-02 14:14:53', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 17:59:57', NULL, 0);
INSERT INTO `sys_menu` VALUES ('e0cdbc3177c8436091db2e0d64ff4560', 'vip快递报价', '6689c17e720648bf8b2062290328d591', 2, '6689c17e720648bf8b2062290328d591,e0cdbc3177c8436091db2e0d64ff4560,', 2, '/admin/vipUser/inlet', NULL, NULL, '', 1, '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-26 10:45:11', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-26 13:58:45', NULL, 0);
INSERT INTO `sys_menu` VALUES ('e34d36b8148b4d1c85f6c4d1aecac505', '订单列表', 'a0a2a76318354fa9b2fa1d259ee1055e', 2, 'a0a2a76318354fa9b2fa1d259ee1055e,e34d36b8148b4d1c85f6c4d1aecac505,', 1, 'admin/order/list', NULL, '', '', 1, '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-07-19 18:54:25', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-08-31 17:44:01', NULL, 0);
INSERT INTO `sys_menu` VALUES ('e560219753ca4e28a2e6cee0a67fb64c', '快递报价', NULL, 1, 'e560219753ca4e28a2e6cee0a67fb64c,', 92, '', NULL, '', '', 1, '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 08:28:46', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 18:00:12', NULL, 0);
INSERT INTO `sys_menu` VALUES ('ea23a724760e41cb86ba8459de53c8b7', '区域列表', '325bd5250df14f159198423fe15ac532', 2, '325bd5250df14f159198423fe15ac532,ea23a724760e41cb86ba8459de53c8b7,', 1, '/admin/system/area/list', NULL, NULL, '', 1, 'sys:area:list', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-08-31 08:59:01', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-08-31 08:59:01', NULL, 0);
INSERT INTO `sys_menu` VALUES ('ed63866b30cf46bfb6797a1d31ae930c', '锁定用户', '3b54e2a2-9adb-11e8-aebe-1368d4ec24eb', 3, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b54e2a2-9adb-11e8-aebe-1368d4ec24eb,ed63866b30cf46bfb6797a1d31ae930c,', 21, '', NULL, NULL, '', 0, 'sys:user:lock', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-08-21 17:44:05', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-08-21 17:44:05', NULL, 0);
INSERT INTO `sys_menu` VALUES ('f58f14103a3449fa9a5dd030076f60ca', '其他', NULL, 1, 'f58f14103a3449fa9a5dd030076f60ca,', 90, '', NULL, '', '', 1, '', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-07-19 15:35:06', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 18:00:24', NULL, 0);
INSERT INTO `sys_menu` VALUES ('f6c15d0dd3bb43c3bd073b5884349ab9', '删除', '9c12577d730c46ba9a3ff5173c40a77e', 3, 'e560219753ca4e28a2e6cee0a67fb64c,9c12577d730c46ba9a3ff5173c40a77e,f6c15d0dd3bb43c3bd073b5884349ab9,', 2, 'admin/offer/dele', NULL, NULL, '', 0, 'sys:offer:dele', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 08:56:57', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-04 08:56:57', NULL, 0);
INSERT INTO `sys_menu` VALUES ('faef71c25c404f1ebd2195bb2a1728f0', '区域删除', 'ea23a724760e41cb86ba8459de53c8b7', 3, '325bd5250df14f159198423fe15ac532,ea23a724760e41cb86ba8459de53c8b7,faef71c25c404f1ebd2195bb2a1728f0,', 1, '/admin/area/delete', NULL, NULL, '', 0, 'sys:area:delete', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-03 16:15:45', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-03 16:18:28', NULL, 0);
INSERT INTO `sys_menu` VALUES ('fcccf15715724285868f7919ab280c2e', '删除普通用户', '00dd56e45ee4412080863863f42f9ecf', 3, '6689c17e720648bf8b2062290328d591,00dd56e45ee4412080863863f42f9ecf,fcccf15715724285868f7919ab280c2e,', 2, '', NULL, NULL, '', 0, 'sys:vipUser:delete', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-05 08:43:05', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-05 08:43:05', NULL, 0);
INSERT INTO `sys_menu` VALUES ('ff4b21092c0546819aad28cc29d422a1', '等级列表', 'da3774e605e84df8b477347a4a2b6e7f', 2, 'da3774e605e84df8b477347a4a2b6e7f,ff4b21092c0546819aad28cc29d422a1,', 1, 'admin/vip/list', NULL, NULL, '', 1, 'sys:vip:list', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-02 14:15:29', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-02 14:15:29', NULL, 0);
INSERT INTO `sys_menu` VALUES ('ff619e04-9adb-11e8-aebe-1368d4ec24eb', '新增角色', '3b58e01e-9adb-11e8-aebe-1368d4ec24eb', 3, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b58e01e-9adb-11e8-aebe-1368d4ec24eb,ff619e04-9adb-11e8-aebe-1368d4ec24eb,', 0, '', NULL, NULL, NULL, 0, 'sys:role:add', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:58:11', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:58:11', NULL, 0);
INSERT INTO `sys_menu` VALUES ('ff9477c9-9adb-11e8-aebe-1368d4ec24eb', '编辑权限', '3b58e01e-9adb-11e8-aebe-1368d4ec24eb', 3, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b58e01e-9adb-11e8-aebe-1368d4ec24eb,ff9477c9-9adb-11e8-aebe-1368d4ec24eb,', 10, '', NULL, NULL, NULL, 0, 'sys:role:edit', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:59:01', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:59:01', NULL, 0);
INSERT INTO `sys_menu` VALUES ('ff9ad846-9adb-11e8-aebe-1368d4ec24eb', '删除角色', '3b58e01e-9adb-11e8-aebe-1368d4ec24eb', 3, '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb,3b58e01e-9adb-11e8-aebe-1368d4ec24eb,ff9ad846-9adb-11e8-aebe-1368d4ec24eb,', 20, '', NULL, NULL, NULL, 0, 'sys:role:delete', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:59:56', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2018-02-08 09:59:56', NULL, 0);

-- ----------------------------
-- Table structure for sys_rescource
-- ----------------------------
DROP TABLE IF EXISTS `sys_rescource`;
CREATE TABLE `sys_rescource`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源',
  `web_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源网络地址',
  `hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件标识',
  `file_size` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件大小',
  `file_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `original_net_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统资源' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_rescource
-- ----------------------------
INSERT INTO `sys_rescource` VALUES ('014feafaa5fa4530a3c3313da6cf427c', '6d63fda5-8e1a-41dc-be2e-ef48d7723e17.png', 'local', '/static/upload/6d63fda5-8e1a-41dc-be2e-ef48d7723e17.png', 'FrGSrkg7Kxe2LggeKTkM_Smdxej3', '10kb', 'image/png', NULL, '2019-09-17 10:22:56', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-17 10:22:56', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', NULL, 0);
INSERT INTO `sys_rescource` VALUES ('4ef78fd0aeb8437b8214cb3b34ce6ee7', '98209303-86fb-4d44-9d94-9e6431c71238.jpg', 'local', '/static/upload/98209303-86fb-4d44-9d94-9e6431c71238.jpg', 'FgQIT_-XfwlFQdTl5FnS6sMU8-mN', '187kb', 'image/jpeg', NULL, '2019-09-29 16:40:00', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-29 16:40:00', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', NULL, 0);
INSERT INTO `sys_rescource` VALUES ('9fbaed1a1d744f33aea1415d6fe436a8', '77e8c857-3893-48de-b577-b84b0bebe2e5.jpg', 'local', '/static/upload/77e8c857-3893-48de-b577-b84b0bebe2e5.jpg', 'Fin5yZRz2cIAqEPdWBQBKYcahAmI', '121kb', 'image/jpeg', NULL, '2019-09-16 16:44:47', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-16 16:44:47', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', NULL, 0);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `create_date` datetime(0) NULL DEFAULT NULL,
  `create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` tinyint(2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('3fa65ee7a49549089469bb1057bd9edc', '至尊会员', '2019-09-29 16:59:44', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-29 16:59:44', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '至尊会员', 0);
INSERT INTO `sys_role` VALUES ('4fa232d0ef4647eea390bc10fbe316d8', '供码商', '2019-07-19 15:31:41', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-08-30 20:34:35', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '供码商', 1);
INSERT INTO `sys_role` VALUES ('70689483-9ad7-11e8-aebe-1368d4ec24eb', '前台用户', '2017-11-02 14:19:07', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-07-19 15:31:47', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '', 1);
INSERT INTO `sys_role` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '系统管理员', '2017-11-29 19:36:37', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-27 11:20:57', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '', 0);
INSERT INTO `sys_role` VALUES ('7344810c1d3f43ed8e1fc60ea3fe480f', '超级管理员', '2019-09-02 10:22:14', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-02 14:16:50', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '拥有所有配置', 1);
INSERT INTO `sys_role` VALUES ('9c95c2bcf303423c92933a233b000f28', '代收代付', '2019-08-30 20:31:00', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-08-30 20:34:52', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', 'kkkj', 1);
INSERT INTO `sys_role` VALUES ('b050e158cdc1476383528bc5cdd8630c', '超级会员', '2019-09-29 16:59:10', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-29 16:59:10', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '超级会员', 0);
INSERT INTO `sys_role` VALUES ('b3426cf805b4415292c939f337505d39', '代理', '2019-07-19 15:32:03', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-08-30 20:34:49', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '代理', 1);
INSERT INTO `sys_role` VALUES ('c1ce8ff37afa4209b4fb9cc8d08c4161', '总平台', '2019-07-19 15:37:39', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-08-30 20:34:47', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '总平台', 1);
INSERT INTO `sys_role` VALUES ('e0fb948a4f724f60b7ba357d51324e01', '普通会员', '2019-08-31 08:56:15', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-02 14:16:53', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '', 1);
INSERT INTO `sys_role` VALUES ('eef6e734aa68403984c153b3cc4f891f', '代收付商户', '2019-07-19 15:27:31', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-08-30 20:34:44', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '代收付商户', 1);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `menu_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('3fa65ee7a49549089469bb1057bd9edc', '3b5cb607-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('3fa65ee7a49549089469bb1057bd9edc', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '00dd56e45ee4412080863863f42f9ecf');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '17e4ebe9bfd74ae6ac99cf267bb306aa');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '18c023c8c2794d8883a2c95e5ec1f72e');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '27651657a7254fa287a596f961cfe069');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '31993e6c7f204b409378defd96e446bf');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '325bd5250df14f159198423fe15ac532');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '39ca777249ff4eb494b54598e94d94f0');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '3b54e2a2-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '3b58e01e-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '3b5cb607-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '3e0b86a3-9adc-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '3e2fa8b6-9adc-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '3e36cf2f-9adc-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '54a9d7544cbe4ddc8a61ba294f7f1d5e');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '58c8f92258494612b7946a3f5c9036a9');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '5b67806a894c41368d01d0cd8075cfb5');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '6689c17e720648bf8b2062290328d591');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '6b5fa403626e41a1847c5dd09832151f');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '6d785d957026421e9f593e21559e6020');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '6fccfc3bce3f4b49a6117532e99ca964');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '7bc13ebfa65c44bdaf77a6d0a71e060d');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '81fd336391674615946d37257d217f2b');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '84a62b9203b54cf98ffc87358053c8a9');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '8a05a3f32af84399b80745600a125a70');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '8f641e0c0a884efd85ec760d16fb16c0');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '96fd6a5a-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '9703ccf2-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '9707cf58-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', '9c12577d730c46ba9a3ff5173c40a77e');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'a0a2a76318354fa9b2fa1d259ee1055e');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'a249959873614aee9383a48f9e6b7541');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'a4256ff366364368aa39f9860119e5ad');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'b031b04031cf4d2aae42b0f9013b5016');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'b97240f4d5114bef9866735a06429c26');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'c6f0575fe4774a37a13e1e237489b79b');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'c8303c0008094b5ab22df0f7f7d41b21');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'ccb6ccb7d7114a8f8adcb557c39cac7b');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'd702891cadf74858b55239767a81e220');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'da3774e605e84df8b477347a4a2b6e7f');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'e0cdbc3177c8436091db2e0d64ff4560');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'e34d36b8148b4d1c85f6c4d1aecac505');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'e560219753ca4e28a2e6cee0a67fb64c');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'ea23a724760e41cb86ba8459de53c8b7');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'ed63866b30cf46bfb6797a1d31ae930c');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'f58f14103a3449fa9a5dd030076f60ca');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'f6c15d0dd3bb43c3bd073b5884349ab9');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'faef71c25c404f1ebd2195bb2a1728f0');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'fcccf15715724285868f7919ab280c2e');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'ff4b21092c0546819aad28cc29d422a1');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'ff619e04-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'ff9477c9-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('706e0195-9ad7-11e8-aebe-1368d4ec24eb', 'ff9ad846-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('b050e158cdc1476383528bc5cdd8630c', '18c023c8c2794d8883a2c95e5ec1f72e');
INSERT INTO `sys_role_menu` VALUES ('b050e158cdc1476383528bc5cdd8630c', '3b5cb607-9adb-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_role_menu` VALUES ('b050e158cdc1476383528bc5cdd8630c', '7d1020ee-9ad9-11e8-aebe-1368d4ec24eb');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `login_name` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录名',
  `nick_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `icon` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'shiro加密盐',
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `locked` tinyint(2) NULL DEFAULT NULL COMMENT '是否锁定',
  `create_date` datetime(0) NULL DEFAULT NULL,
  `create_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` tinyint(4) NOT NULL,
  `is_admin` tinyint(2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('18b8b543-9ad7-11e8-aebe-1368d4ec24eb', 'java', '我是管理员', '/static/upload/77e8c857-3893-48de-b577-b84b0bebe2e5.jpg', '9c5feb7aba88c7c87bc047c7cec7c6e3b63e1894', '08c5900125b80cd2', '13776055179', 'b@qq.com', 0, '2017-11-27 22:19:39', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '2019-09-18 16:26:55', '18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '', 0, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('18b8b543-9ad7-11e8-aebe-1368d4ec24eb', '706e0195-9ad7-11e8-aebe-1368d4ec24eb');
INSERT INTO `sys_user_role` VALUES ('3fb9c59036c64f088422b20f7021f8c7', '706e0195-9ad7-11e8-aebe-1368d4ec24eb');

-- ----------------------------
-- Table structure for tb_agency_apply
-- ----------------------------
DROP TABLE IF EXISTS `tb_agency_apply`;
CREATE TABLE `tb_agency_apply`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户Id',
  `area_id` int(11) NOT NULL COMMENT '区域Id',
  `card_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `tel_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `apply_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请理由',
  `is_pass` int(11) NULL DEFAULT NULL COMMENT '是否通过',
  `audit_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核理由',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '申请时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `audit_status` int(11) NULL DEFAULT NULL COMMENT '审核状态 0为，待审核，1为 已审核',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_area
-- ----------------------------
DROP TABLE IF EXISTS `tb_area`;
CREATE TABLE `tb_area`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `area_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域名称',
  `area_divide_person` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域划分人',
  `add_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '区域表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_area
-- ----------------------------
INSERT INTO `tb_area` VALUES (1, '北京', '我是管理员', '2019-09-29 17:03:00');

-- ----------------------------
-- Table structure for tb_courier_unit
-- ----------------------------
DROP TABLE IF EXISTS `tb_courier_unit`;
CREATE TABLE `tb_courier_unit`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(255) NULL DEFAULT NULL COMMENT '用户id',
  `unit` double(255, 2) NULL DEFAULT NULL COMMENT '快递员收件单价',
  `user_agency_id` int(255) NULL DEFAULT NULL COMMENT '快递员所属代理',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_draw
-- ----------------------------
DROP TABLE IF EXISTS `tb_draw`;
CREATE TABLE `tb_draw`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `draw_price` double(10, 2) NOT NULL COMMENT '提现金额',
  `draw_user_id` int(11) NOT NULL COMMENT '提现用户id   关联字段',
  `draw_service_charge` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '提现手续费',
  `draw_statu` int(11) NOT NULL COMMENT '提现状态 0待审核   1已通过  2已驳回',
  `draw_pass_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提现通过的人',
  `draw_add_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '提现申请时间',
  `draw_update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '提现更新时间',
  `draw_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提现描述',
  `draw_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提现到账账户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '提现表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_earnings_rule
-- ----------------------------
DROP TABLE IF EXISTS `tb_earnings_rule`;
CREATE TABLE `tb_earnings_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `price_scope_least` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '价格范围_最小值',
  `price_scope_max` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '价格范围_最大值',
  `tracking_paymet_earnings` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '总平台收益',
  `add_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '总平台收益规则' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_fund_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_fund_info`;
CREATE TABLE `tb_fund_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `fund_type` int(255) NOT NULL COMMENT '0支出   1收入',
  `money` double(10, 2) NOT NULL COMMENT '金额',
  `add_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  `odd_id` int(255) NULL DEFAULT NULL COMMENT '订单id',
  `money_purpose` int(11) NOT NULL COMMENT '金额 用途 0是我的 1 是推荐 2是代理',
  `purpose_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '金额用途明细、说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '交易金额表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_goods
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods`;
CREATE TABLE `tb_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品Id',
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goods_price` double(10, 2) NULL DEFAULT NULL COMMENT '商品价格',
  `goods_stockpile` int(11) NULL DEFAULT NULL COMMENT '商品数量（库存）',
  `goods_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品详细信息',
  `is_putaway` int(11) NULL DEFAULT NULL COMMENT '是否上架，0为下架，1为上架',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `goods_images` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `goods_integral_price` double(10, 2) NULL DEFAULT NULL COMMENT '商品兑换所需积分',
  `goods_money_price` double(10, 2) NULL DEFAULT NULL COMMENT '商品兑换所需现金（扣除积分后所需要的现金）',
  `goods_staging_period` int(11) NULL DEFAULT NULL COMMENT '分期期限,6为6个月，12为12个月，24为24个月',
  `min_convertibility` double(11, 2) NULL DEFAULT NULL COMMENT '兑换所需最小积分',
  `is_advance` int(11) NULL DEFAULT NULL COMMENT '是否可预支积分，0为 是，1为 否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_goods
-- ----------------------------
INSERT INTO `tb_goods` VALUES (12, 'sdf', 43.00, 4334, NULL, 0, '2019-09-29 16:45:56', '2019-09-29 16:44:18', '/static/imagefiles/e76f6113-1ae3-4f9f-85c9-8a2ae0a3cc44.png', 43.00, 43.00, 6, 38.00, NULL);
INSERT INTO `tb_goods` VALUES (13, '智能扫地机', 1200.00, 12, NULL, 1, '2019-09-29 16:48:21', '2019-09-29 16:46:43', '/static/imagefiles/8bcea507-f301-4d7c-bbcd-2852a3f9a063.jpg', 3000.00, 1200.00, 6, 1.00, NULL);
INSERT INTO `tb_goods` VALUES (14, '喵喵', 111.00, 123, NULL, 1, '2019-09-29 16:49:17', '2019-09-29 17:13:27', '/static/imagefiles/744dfc38-b7f4-43a1-bce1-cddf5e16ff30.jpg', 11.00, 1.00, 12, 10.00, NULL);
INSERT INTO `tb_goods` VALUES (15, 'fds', 12.00, 32, 'DGVI', 1, '2019-09-29 16:51:59', '2019-09-29 17:21:50', '/static/imagefiles/a7d1c025-79bf-4fc3-b172-f7dcabe593e7.png', 23.00, 12.00, 6, 21.00, NULL);

-- ----------------------------
-- Table structure for tb_mode_despatch
-- ----------------------------
DROP TABLE IF EXISTS `tb_mode_despatch`;
CREATE TABLE `tb_mode_despatch`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `mode_of_despatch` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发货方式',
  `add_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '发货方式表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_mode_despatch
-- ----------------------------
INSERT INTO `tb_mode_despatch` VALUES (1, '立即取件', '2019-08-27 11:05:21', '2019-08-27 11:05:21');
INSERT INTO `tb_mode_despatch` VALUES (2, '预约取件', '2019-08-27 11:05:28', '2019-08-27 11:05:28');
INSERT INTO `tb_mode_despatch` VALUES (3, '指定地点', '2019-08-27 11:05:47', '2019-09-16 12:00:21');

-- ----------------------------
-- Table structure for tb_odd_num
-- ----------------------------
DROP TABLE IF EXISTS `tb_odd_num`;
CREATE TABLE `tb_odd_num`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` int(11) NOT NULL COMMENT '订单用户',
  `addresser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发件人信息',
  `recipients` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收件人信息',
  `good_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品信息',
  `mode_of_despatch` int(11) NOT NULL COMMENT '发货方式   关联字段',
  `order_state` int(11) NOT NULL COMMENT '订单状态  0待支付   1待出单   2已出单  3待取件   4已取件  5待发货  6已发货  7已签收  8已完成  -1过期',
  `add_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间  支付时间',
  `out_odd_num_time` timestamp(0) NULL DEFAULT NULL COMMENT '出单时间',
  `pick_up_time` timestamp(0) NULL DEFAULT NULL COMMENT '取件时间',
  `delivery_time` timestamp(0) NULL DEFAULT NULL COMMENT '发货时间',
  `accomplish_time` timestamp(0) NULL DEFAULT NULL COMMENT '完成时间',
  `pick_up_person` int(11) NULL DEFAULT NULL COMMENT '取件人  快递员  代理',
  `out_odd_num_person` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出单人',
  `pay_type` int(11) NULL DEFAULT NULL COMMENT '支付方式   关联字段',
  `sys_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统单号',
  `tracking_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递单号',
  `tracking_company` int(11) NULL DEFAULT NULL COMMENT '快递公司  关联字段',
  `pay_price` double(10, 2) NULL DEFAULT NULL COMMENT '支付金额',
  `order_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单所在区域   关联字段',
  `tripartite_order_num` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方支付平台订单号',
  `sender_type` int(11) NULL DEFAULT NULL COMMENT '寄件方式   关联字段',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `courier_cost` double(10, 2) NULL DEFAULT NULL COMMENT '快递成本',
  `stdmode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物品类型',
  `is_cancel` int(11) NULL DEFAULT NULL COMMENT '是否取消订单，1为 是，0为 否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收单  订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_odd_num
-- ----------------------------
INSERT INTO `tb_odd_num` VALUES (1, 1, '{\"provinceCityDist\":\"河南省 南阳市 宛城区 理工\",\"name\":\"张三\",\"phone\":\"13598645226\"}', '{\"provinceCityDist\":\"河南省 南阳市 卧龙区 车站路与卧龙路交叉口蓝钻星座516\",\"name\":\"张三\",\"phone\":\"13598654212\"}', '打扫房间kgVB的接口', 1, 0, '2019-09-30 09:59:17', NULL, NULL, NULL, NULL, 1, NULL, 1, 'fc77', NULL, NULL, 0.01, '1', '<form name=\"punchout_form\" method=\"post\" action=\"https://openapi.alipay.com/gateway.do?charset=UTF-8&method=alipay.trade.wap.pay&sign=FUo5tmF4sdzF0Fd9tOzz90iugQ0MX6Or0lQFVkwW86BFyGZDNc4xtWZ8CEH3AXxDKo6DHfD%2BcFVV4QPSH8EJbDd5HnatK5NScc69nA%2Bir6%2BOwHIi0wlAhg6rEzrrgedNFE3hhgJchZ3Q6YB9S5P8dmRcR1RQSJHoVxfxKDOrX0Z0JpAxYwumZ9FhriadXH9lY1DxhXk5Fu5RKM6tuQJoyDWBvDgJ6ALiV06kJFOrQ9ppkDFd5bevfJ4T3Ujux5%2F7BYavDb%2Fprjmukn4Qw%2BNXjANh%2BXw5OnXqxaz3qgKSy04aWAsPqKVB60ZisEK8UUHDa5dQFbplu7zhU61MJ0WNIw%3D%3D&return_url=http%3A%2F%2F192.168.1.111%3A8080%2Fpay%2Fnotify&notify_url=http%3A%2F%2F2f699h0867.wicp.vip%3A80%2Fpay%2Fcallback&version=1.0&app_id=2019071965938004&sign_type=RSA2&timestamp=2019-09-30+10%3A00%3A59&alipay_sdk=alipay-sdk-java-3.1.0&format=json\">\n<input type=\"hidden\" name=\"biz_content\" value=\"{&quot;body&quot;:&quot;打扫房间kgVB的接口&quot;,&quot;out_trade_no&quot;:&quot;fc77&quot;,&quot;product_code&quot;:&quot;QUICK_WAP_WAY&quot;,&quot;subject&quot;:&quot;打扫房间kgVB的接口&quot;,&quot;timeout_express&quot;:&quot;2m&quot;,&quot;total_amount&quot;:&quot;0.01&quot;}\">\n<input type=\"submit\" value=\"立即支付\" style=\"display:none\" >\n</form>\n<script>document.forms[0].submit();</script>', 1, '电饭锅百分比', 0.00, '1', 0);
INSERT INTO `tb_odd_num` VALUES (3, 1, '{\"provinceCityDist\":\"河南省 南阳市 宛城区 理工\",\"name\":\"张三\",\"phone\":\"13598645226\"}', '{\"provinceCityDist\":\"河南省 南阳市 卧龙区 车站路与卧龙路交叉口蓝钻星座516\",\"name\":\"张三\",\"phone\":\"13598654212\"}', '更好就买哪个好', 1, 1, '2019-09-30 11:20:30', NULL, NULL, NULL, NULL, 1, NULL, 1, 'd11a', NULL, NULL, 0.01, '1', '2019093022001455490559062142', 1, '非共和国', 0.00, '4', 0);
INSERT INTO `tb_odd_num` VALUES (5, 1, '{\"provinceCityDist\":\"河南省 南阳市 宛城区 理工\",\"name\":\"张三\",\"phone\":\"13598645226\"}', '{\"provinceCityDist\":\"河南省 南阳市 卧龙区 车站路与卧龙路交叉口蓝钻星座516\",\"name\":\"张三\",\"phone\":\"13598654212\"}', '投入和', 1, 0, '2019-09-30 12:01:24', NULL, NULL, NULL, NULL, 1, NULL, 1, '37ed', NULL, NULL, 0.01, '1', '<form name=\"punchout_form\" method=\"post\" action=\"https://openapi.alipay.com/gateway.do?charset=UTF-8&method=alipay.trade.wap.pay&sign=VbhsA6%2BusufpMz6Q0ZG4lVj6TtMQXItujdkg9arutU9c3sobsDBChFzGpzqOrJvh%2BFl2WTTindOxe6SLUxerIc%2FOFoMI4EzSc4riImEJaNCxGTc7F8g9ad1rx6%2F1PPQyTxN%2BZiwcqRa5vbqaAFJuxnUhBxnOTv5TWgyMYEhzX5pBuWyjb0IxQlbQOyYvaiHqAOnCqlMhzU1zTab4jKC%2ByJHQTOI2cZx0JpYE5THrYf0xX7RjOagntRz5ezPxXVTUnd70wF8McvPfR%2BIDn9FU0eDvBkVuqCcOqXjfxWbOA8md%2BvG1USsZIEtBUQRH2ydJqzD%2FTLCxGJ2vaR4MJo8Wiw%3D%3D&return_url=http%3A%2F%2F192.168.1.111%3A8080%2Fpay%2Fnotify&notify_url=http%3A%2F%2F2f699h0867.wicp.vip%3A80%2Fpay%2Fcallback&version=1.0&app_id=2019071965938004&sign_type=RSA2&timestamp=2019-09-30+12%3A03%3A06&alipay_sdk=alipay-sdk-java-3.1.0&format=json\">\n<input type=\"hidden\" name=\"biz_content\" value=\"{&quot;body&quot;:&quot;投入和&quot;,&quot;out_trade_no&quot;:&quot;37ed&quot;,&quot;product_code&quot;:&quot;QUICK_WAP_WAY&quot;,&quot;subject&quot;:&quot;投入和&quot;,&quot;timeout_express&quot;:&quot;2m&quot;,&quot;total_amount&quot;:&quot;0.01&quot;}\">\n<input type=\"submit\" value=\"立即支付\" style=\"display:none\" >\n</form>\n<script>document.forms[0].submit();</script>', 2, '股份计划', 0.00, '4', 0);
INSERT INTO `tb_odd_num` VALUES (6, 1, '{\"provinceCityDist\":\"河南省 南阳市 宛城区 理工\",\"name\":\"张三\",\"phone\":\"13598645226\"}', '{\"provinceCityDist\":\"河南省 南阳市 卧龙区 车站路与卧龙路交叉口蓝钻星座516\",\"name\":\"张三\",\"phone\":\"13598654212\"}', '卫衣', 1, 1, '2019-09-30 13:47:14', NULL, NULL, NULL, NULL, 1, NULL, 1, '304c', NULL, NULL, 0.01, '1', '2019093022001455490560977320', 1, '冻伤护肤膏', 0.00, '2', 0);
INSERT INTO `tb_odd_num` VALUES (7, 1, '{\"provinceCityDist\":\"河南省 南阳市 宛城区 理工\",\"name\":\"张三\",\"phone\":\"13598645226\"}', '{\"provinceCityDist\":\"河南省 南阳市 卧龙区 车站路与卧龙路交叉口蓝钻星座516\",\"name\":\"张三\",\"phone\":\"13598654212\"}', '牙膏', 1, 1, '2019-09-30 13:55:32', NULL, NULL, NULL, NULL, 1, NULL, 1, 'e344', NULL, NULL, 0.01, '1', '2019093022001455490560650463', 1, '健齿美白', 0.00, '4', 0);
INSERT INTO `tb_odd_num` VALUES (8, 1, '{\"provinceCityDist\":\"河南省 南阳市 卧龙区 南阳师范\",\"name\":\"张三\",\"phone\":\"13598654210\"}', '{\"provinceCityDist\":\"河南省 南阳市 卧龙区 车站路与卧龙路交叉口蓝钻星座516\",\"name\":\"张三\",\"phone\":\"13598654212\"}', '牛奶', 1, 1, '2019-09-30 14:00:32', NULL, NULL, NULL, NULL, 1, NULL, 1, '5b51', NULL, NULL, 0.01, '1', '2019093022001455490559067235', 1, '啥的佛', 0.00, '3', 0);
INSERT INTO `tb_odd_num` VALUES (9, 1, '{\"provinceCityDist\":\"河南省 南阳市 宛城区 理工\",\"name\":\"张三\",\"phone\":\"13598645226\"}', '{\"provinceCityDist\":\"河南省 南阳市 卧龙区 车站路与卧龙路交叉口蓝钻星座516\",\"name\":\"张三\",\"phone\":\"13598654212\"}', '牙膏', 1, 1, '2019-09-30 14:32:31', NULL, NULL, NULL, NULL, 1, NULL, 1, 'ba65', NULL, NULL, 0.01, '1', '2019093022001455490559736063', 1, '啥驾考宝典', 0.00, '4', 0);
INSERT INTO `tb_odd_num` VALUES (10, 1, '{\"provinceCityDist\":\"河南省 南阳市 宛城区 理工\",\"name\":\"张三\",\"phone\":\"13598645226\"}', '{\"provinceCityDist\":\"河南省 南阳市 卧龙区 车站路与卧龙路交叉口蓝钻星座516\",\"name\":\"张三\",\"phone\":\"13598654212\"}', '手机', 1, 1, '2019-09-30 14:47:39', NULL, NULL, NULL, NULL, 1, NULL, 1, '342b', NULL, NULL, 0.01, '1', '2019093022001471620541165856', 1, '加急', 0.00, '1', 0);
INSERT INTO `tb_odd_num` VALUES (11, 1, '{\"provinceCityDist\":\"河南省 南阳市 宛城区 理工\",\"name\":\"张三\",\"phone\":\"13598645226\"}', '{\"provinceCityDist\":\"河南省 南阳市 卧龙区 车站路与卧龙路交叉口蓝钻星座516\",\"name\":\"张三\",\"phone\":\"13598654212\"}', '手机', 1, 0, '2019-09-30 16:04:44', NULL, NULL, NULL, NULL, 1, NULL, 1, '15eb', NULL, NULL, 0.01, '1', '<form name=\"punchout_form\" method=\"post\" action=\"https://openapi.alipay.com/gateway.do?charset=UTF-8&method=alipay.trade.wap.pay&sign=FCCfipKjaxAgu7w4tgCyTmBApv6rmrleFEMash76lOHY2f6uvDolW9ojwMehNPY7fLhm9I9HYYN99a0z8TpJSGxYfSHutCG4oytZgB9VYKGkmfqamITBBZ0RHUfJnF%2FHVjWdByNewG0gsnEn2BqWxSMLr%2B0canQhq9nvuGjT10SXXDTgVW8t7vkN79lQjP98adaIgM%2B0oX6HUbK0DZjN2N4MnJCm5CMHK%2FbG9Hp4xtfA6Bhv1nmIdyRDW4sXPj20ROHVDsd5kG2jN6AFuGTox0QxQP1sp1pnsSzXSaof8Bdz9pPgePZ0eqKSWZpRuiiJRvasBUwkXLPBshF5s7lwAA%3D%3D&return_url=http%3A%2F%2F192.168.1.111%3A8080%2Fpay%2Fnotify&notify_url=http%3A%2F%2F2f699h0867.wicp.vip%3A80%2Fpay%2Fcallback&version=1.0&app_id=2019071965938004&sign_type=RSA2&timestamp=2019-09-30+16%3A06%3A21&alipay_sdk=alipay-sdk-java-3.1.0&format=json\">\n<input type=\"hidden\" name=\"biz_content\" value=\"{&quot;body&quot;:&quot;手机&quot;,&quot;out_trade_no&quot;:&quot;15eb&quot;,&quot;product_code&quot;:&quot;QUICK_WAP_WAY&quot;,&quot;subject&quot;:&quot;手机&quot;,&quot;timeout_express&quot;:&quot;2m&quot;,&quot;total_amount&quot;:&quot;0.01&quot;}\">\n<input type=\"submit\" value=\"立即支付\" style=\"display:none\" >\n</form>\n<script>document.forms[0].submit();</script>', 1, '撒大声地', 0.00, '1', 0);
INSERT INTO `tb_odd_num` VALUES (12, 4, '{\"provinceCityDist\":\"河南省 南阳市 卧龙区 蓝钻星座515\",\"name\":\"木子李\",\"phone\":\"17633638280\"}', '{\"provinceCityDist\":\"北京市 市辖区 石景山区 东门值班室代收\",\"name\":\"木子\",\"phone\":\"15220309071\"}', '日用', 1, 0, '2019-09-30 17:19:49', NULL, NULL, NULL, NULL, 1, NULL, 1, '1688', NULL, NULL, 0.01, '1', '<form name=\"punchout_form\" method=\"post\" action=\"https://openapi.alipay.com/gateway.do?charset=UTF-8&method=alipay.trade.wap.pay&sign=FlDYp5svs%2FtCnnXnn4R5byetz5TYZPOzdIja%2BRQbe5XrmR78fqj0xGe0HkvlbqoPFxvs71AnQQWNa3AMpdRj4D2M4LzmCvQ%2B%2Bx%2FLHtLLXS0NYl1IgxezBswssdhsSPnCXwoJ%2BoFVoMaR%2B5gEtajzvwfHP%2BQMhf57MGGVQa5f6Bdedj0uukWl%2FazCIDCfOzYlqCky4GluLq8NvC1o9opO6zgOsMoJO0Upb0O1%2BRpz1bNBzbbj5fNJNqvcu%2BjifrAemrRuafdr8%2B5z0fJSGQLRB16HKPM%2BNvDd4651uzymR16nkFbSK6oDObdtwFhS208D9%2BRx280qLT43HueOEHBvrQ%3D%3D&return_url=http%3A%2F%2F192.168.1.111%3A8080%2Fpay%2Fnotify&notify_url=http%3A%2F%2F2f699h0867.wicp.vip%3A80%2Fpay%2Fcallback&version=1.0&app_id=2019071965938004&sign_type=RSA2&timestamp=2019-09-30+17%3A21%3A26&alipay_sdk=alipay-sdk-java-3.1.0&format=json\">\n<input type=\"hidden\" name=\"biz_content\" value=\"{&quot;body&quot;:&quot;日用&quot;,&quot;out_trade_no&quot;:&quot;1688&quot;,&quot;product_code&quot;:&quot;QUICK_WAP_WAY&quot;,&quot;subject&quot;:&quot;日用&quot;,&quot;timeout_express&quot;:&quot;2m&quot;,&quot;total_amount&quot;:&quot;0.01&quot;}\">\n<input type=\"submit\" value=\"立即支付\" style=\"display:none\" >\n</form>\n<script>document.forms[0].submit();</script>', 2, '100', 0.00, '4', 0);
INSERT INTO `tb_odd_num` VALUES (13, 21, '{\"provinceCityDist\":\"北京市 市辖区 朝阳区 回家看看今年\",\"name\":\"虎子\",\"phone\":\"13262006650\"}', '{\"provinceCityDist\":\"北京市 市辖区 朝阳区 回家看看今年\",\"name\":\"虎子\",\"phone\":\"13262006650\"}', '好纠结哈哈', 1, 0, '2019-09-30 17:28:01', NULL, NULL, NULL, NULL, 1, NULL, 1, 'd46e', NULL, NULL, 0.01, '1', '<form name=\"punchout_form\" method=\"post\" action=\"https://openapi.alipay.com/gateway.do?charset=UTF-8&method=alipay.trade.wap.pay&sign=bOdFOE0qBaocN83uG3CjLj1DW72ZnUOCswq6gGRD1AcXKd5sidFQcAf95dapbJuURxRD8Oa66oYmuABiOOwzPuPGtlLC5qqCYOH1Ak8WwDYapAsuzD9YBM62vs4l%2FnHwoqhHL5wwwBZbhfdkz4ESASVpRCOdnq1CYykbpBtEiKpFXJJoTXrU35%2FobzI%2BHKNFlJaEg1jzqxjoAdSa%2F5%2Bm1eXWD081PTSFkPnd%2FLiZZgdc6DfZRTF6z4nOnhAX1cVrJYQcbEaAzvmA3gqiNpfxxBGdsXXnl41JGPmNuSr5ocrcQmCF85tlFkE%2BggC%2FpaQ4oxE69r1EBCKpgLj60cKvzg%3D%3D&return_url=http%3A%2F%2F192.168.1.111%3A8080%2Fpay%2Fnotify&notify_url=http%3A%2F%2F2f699h0867.wicp.vip%3A80%2Fpay%2Fcallback&version=1.0&app_id=2019071965938004&sign_type=RSA2&timestamp=2019-09-30+17%3A29%3A38&alipay_sdk=alipay-sdk-java-3.1.0&format=json\">\n<input type=\"hidden\" name=\"biz_content\" value=\"{&quot;body&quot;:&quot;好纠结哈哈&quot;,&quot;out_trade_no&quot;:&quot;d46e&quot;,&quot;product_code&quot;:&quot;QUICK_WAP_WAY&quot;,&quot;subject&quot;:&quot;好纠结哈哈&quot;,&quot;timeout_express&quot;:&quot;2m&quot;,&quot;total_amount&quot;:&quot;0.01&quot;}\">\n<input type=\"submit\" value=\"立即支付\" style=\"display:none\" >\n</form>\n<script>document.forms[0].submit();</script>', 1, '', 0.00, '1', 0);
INSERT INTO `tb_odd_num` VALUES (14, 21, '{\"provinceCityDist\":\"北京市 市辖区 朝阳区 回家看看今年\",\"name\":\"虎子\",\"phone\":\"13262006650\"}', '{\"provinceCityDist\":\"北京市 市辖区 朝阳区 回家看看今年\",\"name\":\"虎子\",\"phone\":\"13262006650\"}', 'dfas', 1, 0, '2019-10-04 08:56:47', NULL, NULL, NULL, NULL, 1, NULL, 1, '1dd3', NULL, NULL, 0.01, '1', '<form name=\"punchout_form\" method=\"post\" action=\"https://openapi.alipay.com/gateway.do?charset=UTF-8&method=alipay.trade.wap.pay&sign=E53f3KE9LK42YUjT8hUrib14EmPPEs66M%2FmOvby40BkIlo4yih1E94N4JwTqvUvTaAwBIIgNJpM%2BU22kpZk1jB4rQVz1ROBgk3NTaIHKw6HRZewNYB4UpcuhoTELCL2Z%2FzM0RVhq%2BOLaXFqfNAVwksPmWgFr36q5jmvhQ4ze1R%2FaHVuUm117tMBn6S%2B%2B5kxOnWP4XUnBBG73ZbrPqCOPP9BqdjLI02BOjoK%2F9EZZjNxfwJnY7GOzWVlSDpCagyxpbfZ8zMgsxHyZmv5Bp4gMhy4f5RXP5w9e1fP1hmLePjRf78PQy0xzbykYRfK1PbkCXjNB7u18%2F3huT3FdcBkWUA%3D%3D&return_url=http%3A%2F%2F192.168.1.111%3A8080%2Fpay%2Fnotify&notify_url=http%3A%2F%2F2f699h0867.wicp.vip%3A80%2Fpay%2Fcallback&version=1.0&app_id=2019071965938004&sign_type=RSA2&timestamp=2019-10-04+08%3A58%3A25&alipay_sdk=alipay-sdk-java-3.1.0&format=json\">\n<input type=\"hidden\" name=\"biz_content\" value=\"{&quot;body&quot;:&quot;dfas&quot;,&quot;out_trade_no&quot;:&quot;1dd3&quot;,&quot;product_code&quot;:&quot;QUICK_WAP_WAY&quot;,&quot;subject&quot;:&quot;dfas&quot;,&quot;timeout_express&quot;:&quot;2m&quot;,&quot;total_amount&quot;:&quot;0.01&quot;}\">\n<input type=\"submit\" value=\"立即支付\" style=\"display:none\" >\n</form>\n<script>document.forms[0].submit();</script>', 1, 'sefasf', 0.00, '1', 0);

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单Id',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品Id',
  `goods_num` int(11) NULL DEFAULT NULL COMMENT '商品数量',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户Id',
  `order_time` datetime(0) NULL DEFAULT NULL COMMENT '下单时间',
  `goods_price_total` double(10, 2) NULL DEFAULT NULL COMMENT '商品金额',
  `goods_integral_total` double(10, 2) NULL DEFAULT NULL COMMENT '商品积分',
  `pay_amount` double(10, 2) NULL DEFAULT NULL COMMENT '实际支付金额',
  `pay_integral` double(10, 2) NULL DEFAULT NULL COMMENT '实际支付积分',
  `order_status` int(11) NULL DEFAULT NULL COMMENT '支付状态，0为 未支付，1为 已支付，2为 兑换中，3为 已完成',
  `pay_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `user_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户电话',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_pay_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_pay_type`;
CREATE TABLE `tb_pay_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付  code',
  `pay_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付方式',
  `pay_add_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '支付方式添加时间',
  `pay_update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `pay_setting` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付方式配置',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付方式与支付设置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_pay_type
-- ----------------------------
INSERT INTO `tb_pay_type` VALUES (1, 'sdfsd', '支付宝', '2019-09-09 14:43:59', '2019-09-29 16:52:13', 'ssdc');
INSERT INTO `tb_pay_type` VALUES (9, 'wxpay', '微信', NULL, '2019-09-28 18:34:03', 'sdsdzx');

-- ----------------------------
-- Table structure for tb_province_city_district
-- ----------------------------
DROP TABLE IF EXISTS `tb_province_city_district`;
CREATE TABLE `tb_province_city_district`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '地区代码',
  `pid` int(11) NULL DEFAULT NULL COMMENT '当前地区的上一级地区代码',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 220702 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '省市县数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_province_city_district
-- ----------------------------
INSERT INTO `tb_province_city_district` VALUES (11, 0, '北京');
INSERT INTO `tb_province_city_district` VALUES (12, 0, '天津');
INSERT INTO `tb_province_city_district` VALUES (13, 0, '河北');
INSERT INTO `tb_province_city_district` VALUES (14, 0, '山西');
INSERT INTO `tb_province_city_district` VALUES (15, 0, '内蒙古');
INSERT INTO `tb_province_city_district` VALUES (21, 0, '辽宁');
INSERT INTO `tb_province_city_district` VALUES (22, 0, '吉林');
INSERT INTO `tb_province_city_district` VALUES (23, 0, '黑龙江');
INSERT INTO `tb_province_city_district` VALUES (31, 0, '上海');
INSERT INTO `tb_province_city_district` VALUES (32, 0, '江苏');
INSERT INTO `tb_province_city_district` VALUES (33, 0, '浙江');
INSERT INTO `tb_province_city_district` VALUES (34, 0, '安徽');
INSERT INTO `tb_province_city_district` VALUES (35, 0, '福建');
INSERT INTO `tb_province_city_district` VALUES (36, 0, '江西');
INSERT INTO `tb_province_city_district` VALUES (37, 0, '山东');
INSERT INTO `tb_province_city_district` VALUES (41, 0, '河南');
INSERT INTO `tb_province_city_district` VALUES (42, 0, '湖北');
INSERT INTO `tb_province_city_district` VALUES (43, 0, '湖南');
INSERT INTO `tb_province_city_district` VALUES (44, 0, '广东');
INSERT INTO `tb_province_city_district` VALUES (45, 0, '广西');
INSERT INTO `tb_province_city_district` VALUES (46, 0, '海南');
INSERT INTO `tb_province_city_district` VALUES (50, 0, '重庆');
INSERT INTO `tb_province_city_district` VALUES (51, 0, '四川');
INSERT INTO `tb_province_city_district` VALUES (52, 0, '贵州');
INSERT INTO `tb_province_city_district` VALUES (53, 0, '云南');
INSERT INTO `tb_province_city_district` VALUES (54, 0, '西藏');
INSERT INTO `tb_province_city_district` VALUES (61, 0, '陕西');
INSERT INTO `tb_province_city_district` VALUES (62, 0, '甘肃');
INSERT INTO `tb_province_city_district` VALUES (63, 0, '青海');
INSERT INTO `tb_province_city_district` VALUES (64, 0, '宁夏');
INSERT INTO `tb_province_city_district` VALUES (65, 0, '新疆');
INSERT INTO `tb_province_city_district` VALUES (71, 0, '台湾');
INSERT INTO `tb_province_city_district` VALUES (81, 0, '香港');
INSERT INTO `tb_province_city_district` VALUES (91, 0, '澳门');
INSERT INTO `tb_province_city_district` VALUES (1101, 11, '北京市辖');
INSERT INTO `tb_province_city_district` VALUES (1102, 11, '北京县辖');
INSERT INTO `tb_province_city_district` VALUES (1201, 12, '天津市辖');
INSERT INTO `tb_province_city_district` VALUES (1202, 12, '天津县辖');
INSERT INTO `tb_province_city_district` VALUES (1301, 13, '石家庄');
INSERT INTO `tb_province_city_district` VALUES (1302, 13, '唐山');
INSERT INTO `tb_province_city_district` VALUES (1303, 13, '秦皇岛');
INSERT INTO `tb_province_city_district` VALUES (1304, 13, '邯郸');
INSERT INTO `tb_province_city_district` VALUES (1305, 13, '邢台');
INSERT INTO `tb_province_city_district` VALUES (1306, 13, '保定');
INSERT INTO `tb_province_city_district` VALUES (1307, 13, '张家口');
INSERT INTO `tb_province_city_district` VALUES (1308, 13, '承德');
INSERT INTO `tb_province_city_district` VALUES (1309, 13, '沧州');
INSERT INTO `tb_province_city_district` VALUES (1310, 13, '廊坊');
INSERT INTO `tb_province_city_district` VALUES (1311, 13, '衡水');
INSERT INTO `tb_province_city_district` VALUES (1401, 14, '太原');
INSERT INTO `tb_province_city_district` VALUES (1402, 14, '大同');
INSERT INTO `tb_province_city_district` VALUES (1403, 14, '阳泉');
INSERT INTO `tb_province_city_district` VALUES (1404, 14, '长治');
INSERT INTO `tb_province_city_district` VALUES (1405, 14, '晋城');
INSERT INTO `tb_province_city_district` VALUES (1406, 14, '朔州');
INSERT INTO `tb_province_city_district` VALUES (1407, 14, '晋中');
INSERT INTO `tb_province_city_district` VALUES (1408, 14, '运城');
INSERT INTO `tb_province_city_district` VALUES (1409, 14, '忻州');
INSERT INTO `tb_province_city_district` VALUES (1410, 14, '临汾');
INSERT INTO `tb_province_city_district` VALUES (1423, 14, '吕梁地区');
INSERT INTO `tb_province_city_district` VALUES (1501, 15, '呼和浩特');
INSERT INTO `tb_province_city_district` VALUES (1502, 15, '包头');
INSERT INTO `tb_province_city_district` VALUES (1503, 15, '乌海');
INSERT INTO `tb_province_city_district` VALUES (1504, 15, '赤峰');
INSERT INTO `tb_province_city_district` VALUES (1505, 15, '通辽');
INSERT INTO `tb_province_city_district` VALUES (1521, 15, '呼伦贝尔盟');
INSERT INTO `tb_province_city_district` VALUES (1522, 15, '兴安盟');
INSERT INTO `tb_province_city_district` VALUES (1525, 15, '锡林郭勒盟');
INSERT INTO `tb_province_city_district` VALUES (1526, 15, '乌兰察布盟');
INSERT INTO `tb_province_city_district` VALUES (1527, 15, '伊克昭盟');
INSERT INTO `tb_province_city_district` VALUES (1528, 15, '巴彦淖尔盟');
INSERT INTO `tb_province_city_district` VALUES (1529, 15, '阿拉善盟');
INSERT INTO `tb_province_city_district` VALUES (2101, 21, '沈阳');
INSERT INTO `tb_province_city_district` VALUES (2102, 21, '大连');
INSERT INTO `tb_province_city_district` VALUES (2103, 21, '鞍山');
INSERT INTO `tb_province_city_district` VALUES (2104, 21, '抚顺');
INSERT INTO `tb_province_city_district` VALUES (2105, 21, '本溪');
INSERT INTO `tb_province_city_district` VALUES (2106, 21, '丹东');
INSERT INTO `tb_province_city_district` VALUES (2107, 21, '锦州');
INSERT INTO `tb_province_city_district` VALUES (2108, 21, '营口');
INSERT INTO `tb_province_city_district` VALUES (2109, 21, '阜新');
INSERT INTO `tb_province_city_district` VALUES (2110, 21, '辽阳');
INSERT INTO `tb_province_city_district` VALUES (2111, 21, '盘锦');
INSERT INTO `tb_province_city_district` VALUES (2112, 21, '铁岭');
INSERT INTO `tb_province_city_district` VALUES (2113, 21, '朝阳');
INSERT INTO `tb_province_city_district` VALUES (2114, 21, '葫芦岛');
INSERT INTO `tb_province_city_district` VALUES (2201, 22, '长春');
INSERT INTO `tb_province_city_district` VALUES (2202, 22, '吉林');
INSERT INTO `tb_province_city_district` VALUES (2203, 22, '四平');
INSERT INTO `tb_province_city_district` VALUES (2204, 22, '辽源');
INSERT INTO `tb_province_city_district` VALUES (2205, 22, '通化');
INSERT INTO `tb_province_city_district` VALUES (2206, 22, '白山');
INSERT INTO `tb_province_city_district` VALUES (2207, 22, '松原');
INSERT INTO `tb_province_city_district` VALUES (2208, 22, '白城');
INSERT INTO `tb_province_city_district` VALUES (2224, 22, '延边朝鲜族自治州');
INSERT INTO `tb_province_city_district` VALUES (2301, 23, '哈尔滨');
INSERT INTO `tb_province_city_district` VALUES (2302, 23, '齐齐哈尔');
INSERT INTO `tb_province_city_district` VALUES (2303, 23, '鸡西');
INSERT INTO `tb_province_city_district` VALUES (2304, 23, '鹤岗');
INSERT INTO `tb_province_city_district` VALUES (2305, 23, '双鸭山');
INSERT INTO `tb_province_city_district` VALUES (2306, 23, '大庆');
INSERT INTO `tb_province_city_district` VALUES (2307, 23, '伊春');
INSERT INTO `tb_province_city_district` VALUES (2308, 23, '佳木斯');
INSERT INTO `tb_province_city_district` VALUES (2309, 23, '七台河');
INSERT INTO `tb_province_city_district` VALUES (2310, 23, '牡丹江');
INSERT INTO `tb_province_city_district` VALUES (2311, 23, '黑河');
INSERT INTO `tb_province_city_district` VALUES (2312, 23, '绥化');
INSERT INTO `tb_province_city_district` VALUES (2327, 23, '大兴安岭地区');
INSERT INTO `tb_province_city_district` VALUES (3101, 31, '上海市辖');
INSERT INTO `tb_province_city_district` VALUES (3102, 31, '上海县辖');
INSERT INTO `tb_province_city_district` VALUES (3201, 32, '南京');
INSERT INTO `tb_province_city_district` VALUES (3202, 32, '无锡');
INSERT INTO `tb_province_city_district` VALUES (3203, 32, '徐州');
INSERT INTO `tb_province_city_district` VALUES (3204, 32, '常州');
INSERT INTO `tb_province_city_district` VALUES (3205, 32, '苏州');
INSERT INTO `tb_province_city_district` VALUES (3206, 32, '南通');
INSERT INTO `tb_province_city_district` VALUES (3207, 32, '连云港');
INSERT INTO `tb_province_city_district` VALUES (3208, 32, '淮安');
INSERT INTO `tb_province_city_district` VALUES (3209, 32, '盐城');
INSERT INTO `tb_province_city_district` VALUES (3210, 32, '扬州');
INSERT INTO `tb_province_city_district` VALUES (3211, 32, '镇江');
INSERT INTO `tb_province_city_district` VALUES (3212, 32, '泰州');
INSERT INTO `tb_province_city_district` VALUES (3213, 32, '宿迁');
INSERT INTO `tb_province_city_district` VALUES (3301, 33, '杭州');
INSERT INTO `tb_province_city_district` VALUES (3302, 33, '宁波');
INSERT INTO `tb_province_city_district` VALUES (3303, 33, '温州');
INSERT INTO `tb_province_city_district` VALUES (3304, 33, '嘉兴');
INSERT INTO `tb_province_city_district` VALUES (3305, 33, '湖州');
INSERT INTO `tb_province_city_district` VALUES (3306, 33, '绍兴');
INSERT INTO `tb_province_city_district` VALUES (3307, 33, '金华');
INSERT INTO `tb_province_city_district` VALUES (3308, 33, '衢州');
INSERT INTO `tb_province_city_district` VALUES (3309, 33, '舟山');
INSERT INTO `tb_province_city_district` VALUES (3310, 33, '台州');
INSERT INTO `tb_province_city_district` VALUES (3311, 33, '丽水');
INSERT INTO `tb_province_city_district` VALUES (3401, 34, '合肥');
INSERT INTO `tb_province_city_district` VALUES (3402, 34, '芜湖');
INSERT INTO `tb_province_city_district` VALUES (3403, 34, '蚌埠');
INSERT INTO `tb_province_city_district` VALUES (3404, 34, '淮南');
INSERT INTO `tb_province_city_district` VALUES (3405, 34, '马鞍山');
INSERT INTO `tb_province_city_district` VALUES (3406, 34, '淮北');
INSERT INTO `tb_province_city_district` VALUES (3407, 34, '铜陵');
INSERT INTO `tb_province_city_district` VALUES (3408, 34, '安庆');
INSERT INTO `tb_province_city_district` VALUES (3410, 34, '黄山');
INSERT INTO `tb_province_city_district` VALUES (3411, 34, '滁州');
INSERT INTO `tb_province_city_district` VALUES (3412, 34, '阜阳');
INSERT INTO `tb_province_city_district` VALUES (3413, 34, '宿州');
INSERT INTO `tb_province_city_district` VALUES (3414, 34, '巢湖');
INSERT INTO `tb_province_city_district` VALUES (3415, 34, '六安');
INSERT INTO `tb_province_city_district` VALUES (3416, 34, '亳州');
INSERT INTO `tb_province_city_district` VALUES (3417, 34, '池州');
INSERT INTO `tb_province_city_district` VALUES (3418, 34, '宣城');
INSERT INTO `tb_province_city_district` VALUES (3501, 35, '福州');
INSERT INTO `tb_province_city_district` VALUES (3502, 35, '厦门');
INSERT INTO `tb_province_city_district` VALUES (3503, 35, '莆田');
INSERT INTO `tb_province_city_district` VALUES (3504, 35, '三明');
INSERT INTO `tb_province_city_district` VALUES (3505, 35, '泉州');
INSERT INTO `tb_province_city_district` VALUES (3506, 35, '漳州');
INSERT INTO `tb_province_city_district` VALUES (3507, 35, '南平');
INSERT INTO `tb_province_city_district` VALUES (3508, 35, '龙岩');
INSERT INTO `tb_province_city_district` VALUES (3509, 35, '宁德');
INSERT INTO `tb_province_city_district` VALUES (3601, 36, '南昌');
INSERT INTO `tb_province_city_district` VALUES (3602, 36, '景德镇');
INSERT INTO `tb_province_city_district` VALUES (3603, 36, '萍乡');
INSERT INTO `tb_province_city_district` VALUES (3604, 36, '九江');
INSERT INTO `tb_province_city_district` VALUES (3605, 36, '新余');
INSERT INTO `tb_province_city_district` VALUES (3606, 36, '鹰潭');
INSERT INTO `tb_province_city_district` VALUES (3607, 36, '赣州');
INSERT INTO `tb_province_city_district` VALUES (3608, 36, '吉安');
INSERT INTO `tb_province_city_district` VALUES (3609, 36, '宜春');
INSERT INTO `tb_province_city_district` VALUES (3610, 36, '抚州');
INSERT INTO `tb_province_city_district` VALUES (3611, 36, '上饶');
INSERT INTO `tb_province_city_district` VALUES (3701, 37, '济南');
INSERT INTO `tb_province_city_district` VALUES (3702, 37, '青岛');
INSERT INTO `tb_province_city_district` VALUES (3703, 37, '淄博');
INSERT INTO `tb_province_city_district` VALUES (3704, 37, '枣庄');
INSERT INTO `tb_province_city_district` VALUES (3705, 37, '东营');
INSERT INTO `tb_province_city_district` VALUES (3706, 37, '烟台');
INSERT INTO `tb_province_city_district` VALUES (3707, 37, '潍坊');
INSERT INTO `tb_province_city_district` VALUES (3708, 37, '济宁');
INSERT INTO `tb_province_city_district` VALUES (3709, 37, '泰安');
INSERT INTO `tb_province_city_district` VALUES (3710, 37, '威海');
INSERT INTO `tb_province_city_district` VALUES (3711, 37, '日照');
INSERT INTO `tb_province_city_district` VALUES (3712, 37, '莱芜');
INSERT INTO `tb_province_city_district` VALUES (3713, 37, '临沂');
INSERT INTO `tb_province_city_district` VALUES (3714, 37, '德州');
INSERT INTO `tb_province_city_district` VALUES (3715, 37, '聊城');
INSERT INTO `tb_province_city_district` VALUES (3716, 37, '滨州');
INSERT INTO `tb_province_city_district` VALUES (3717, 37, '菏泽');
INSERT INTO `tb_province_city_district` VALUES (4101, 41, '郑州');
INSERT INTO `tb_province_city_district` VALUES (4102, 41, '开封');
INSERT INTO `tb_province_city_district` VALUES (4103, 41, '洛阳');
INSERT INTO `tb_province_city_district` VALUES (4104, 41, '平顶山');
INSERT INTO `tb_province_city_district` VALUES (4105, 41, '安阳');
INSERT INTO `tb_province_city_district` VALUES (4106, 41, '鹤壁');
INSERT INTO `tb_province_city_district` VALUES (4107, 41, '新乡');
INSERT INTO `tb_province_city_district` VALUES (4108, 41, '焦作');
INSERT INTO `tb_province_city_district` VALUES (4109, 41, '濮阳');
INSERT INTO `tb_province_city_district` VALUES (4110, 41, '许昌');
INSERT INTO `tb_province_city_district` VALUES (4111, 41, '漯河');
INSERT INTO `tb_province_city_district` VALUES (4112, 41, '三门峡');
INSERT INTO `tb_province_city_district` VALUES (4113, 41, '南阳');
INSERT INTO `tb_province_city_district` VALUES (4114, 41, '商丘');
INSERT INTO `tb_province_city_district` VALUES (4115, 41, '信阳');
INSERT INTO `tb_province_city_district` VALUES (4116, 41, '周口');
INSERT INTO `tb_province_city_district` VALUES (4117, 41, '驻马店');
INSERT INTO `tb_province_city_district` VALUES (4201, 42, '武汉');
INSERT INTO `tb_province_city_district` VALUES (4202, 42, '黄石');
INSERT INTO `tb_province_city_district` VALUES (4203, 42, '十堰');
INSERT INTO `tb_province_city_district` VALUES (4205, 42, '宜昌');
INSERT INTO `tb_province_city_district` VALUES (4206, 42, '襄樊');
INSERT INTO `tb_province_city_district` VALUES (4207, 42, '鄂州');
INSERT INTO `tb_province_city_district` VALUES (4208, 42, '荆门');
INSERT INTO `tb_province_city_district` VALUES (4209, 42, '孝感');
INSERT INTO `tb_province_city_district` VALUES (4210, 42, '荆州');
INSERT INTO `tb_province_city_district` VALUES (4211, 42, '黄冈');
INSERT INTO `tb_province_city_district` VALUES (4212, 42, '咸宁');
INSERT INTO `tb_province_city_district` VALUES (4213, 42, '随州');
INSERT INTO `tb_province_city_district` VALUES (4228, 42, '恩施土家族苗族自治州');
INSERT INTO `tb_province_city_district` VALUES (4290, 42, '省直辖行政单位');
INSERT INTO `tb_province_city_district` VALUES (4301, 43, '长沙');
INSERT INTO `tb_province_city_district` VALUES (4302, 43, '株洲');
INSERT INTO `tb_province_city_district` VALUES (4303, 43, '湘潭');
INSERT INTO `tb_province_city_district` VALUES (4304, 43, '衡阳');
INSERT INTO `tb_province_city_district` VALUES (4305, 43, '邵阳');
INSERT INTO `tb_province_city_district` VALUES (4306, 43, '岳阳');
INSERT INTO `tb_province_city_district` VALUES (4307, 43, '常德');
INSERT INTO `tb_province_city_district` VALUES (4308, 43, '张家界');
INSERT INTO `tb_province_city_district` VALUES (4309, 43, '益阳');
INSERT INTO `tb_province_city_district` VALUES (4310, 43, '郴州');
INSERT INTO `tb_province_city_district` VALUES (4311, 43, '永州');
INSERT INTO `tb_province_city_district` VALUES (4312, 43, '怀化');
INSERT INTO `tb_province_city_district` VALUES (4313, 43, '娄底');
INSERT INTO `tb_province_city_district` VALUES (4331, 43, '湘西土家族苗族自治州');
INSERT INTO `tb_province_city_district` VALUES (4401, 44, '广州');
INSERT INTO `tb_province_city_district` VALUES (4402, 44, '韶关');
INSERT INTO `tb_province_city_district` VALUES (4403, 44, '深圳');
INSERT INTO `tb_province_city_district` VALUES (4404, 44, '珠海');
INSERT INTO `tb_province_city_district` VALUES (4405, 44, '汕头');
INSERT INTO `tb_province_city_district` VALUES (4406, 44, '佛山');
INSERT INTO `tb_province_city_district` VALUES (4407, 44, '江门');
INSERT INTO `tb_province_city_district` VALUES (4408, 44, '湛江');
INSERT INTO `tb_province_city_district` VALUES (4409, 44, '茂名');
INSERT INTO `tb_province_city_district` VALUES (4412, 44, '肇庆');
INSERT INTO `tb_province_city_district` VALUES (4413, 44, '惠州');
INSERT INTO `tb_province_city_district` VALUES (4414, 44, '梅州');
INSERT INTO `tb_province_city_district` VALUES (4415, 44, '汕尾');
INSERT INTO `tb_province_city_district` VALUES (4416, 44, '河源');
INSERT INTO `tb_province_city_district` VALUES (4417, 44, '阳江');
INSERT INTO `tb_province_city_district` VALUES (4418, 44, '清远');
INSERT INTO `tb_province_city_district` VALUES (4419, 44, '东莞');
INSERT INTO `tb_province_city_district` VALUES (4420, 44, '中山');
INSERT INTO `tb_province_city_district` VALUES (4451, 44, '潮州');
INSERT INTO `tb_province_city_district` VALUES (4452, 44, '揭阳');
INSERT INTO `tb_province_city_district` VALUES (4453, 44, '云浮');
INSERT INTO `tb_province_city_district` VALUES (4501, 45, '南宁');
INSERT INTO `tb_province_city_district` VALUES (4502, 45, '柳州');
INSERT INTO `tb_province_city_district` VALUES (4503, 45, '桂林');
INSERT INTO `tb_province_city_district` VALUES (4504, 45, '梧州');
INSERT INTO `tb_province_city_district` VALUES (4505, 45, '北海');
INSERT INTO `tb_province_city_district` VALUES (4506, 45, '防城港');
INSERT INTO `tb_province_city_district` VALUES (4507, 45, '钦州');
INSERT INTO `tb_province_city_district` VALUES (4508, 45, '贵港');
INSERT INTO `tb_province_city_district` VALUES (4509, 45, '玉林');
INSERT INTO `tb_province_city_district` VALUES (4521, 45, '南宁地区');
INSERT INTO `tb_province_city_district` VALUES (4522, 45, '柳州地区');
INSERT INTO `tb_province_city_district` VALUES (4524, 45, '贺州地区');
INSERT INTO `tb_province_city_district` VALUES (4526, 45, '百色地区');
INSERT INTO `tb_province_city_district` VALUES (4527, 45, '河池地区');
INSERT INTO `tb_province_city_district` VALUES (4601, 46, '海南');
INSERT INTO `tb_province_city_district` VALUES (4602, 46, '海口');
INSERT INTO `tb_province_city_district` VALUES (4603, 46, '三亚');
INSERT INTO `tb_province_city_district` VALUES (5001, 50, '重庆市辖');
INSERT INTO `tb_province_city_district` VALUES (5002, 50, '重庆县辖');
INSERT INTO `tb_province_city_district` VALUES (5003, 50, '重庆县级');
INSERT INTO `tb_province_city_district` VALUES (5101, 51, '成都');
INSERT INTO `tb_province_city_district` VALUES (5103, 51, '自贡');
INSERT INTO `tb_province_city_district` VALUES (5104, 51, '攀枝花');
INSERT INTO `tb_province_city_district` VALUES (5105, 51, '泸州');
INSERT INTO `tb_province_city_district` VALUES (5106, 51, '德阳');
INSERT INTO `tb_province_city_district` VALUES (5107, 51, '绵阳');
INSERT INTO `tb_province_city_district` VALUES (5108, 51, '广元');
INSERT INTO `tb_province_city_district` VALUES (5109, 51, '遂宁');
INSERT INTO `tb_province_city_district` VALUES (5110, 51, '内江');
INSERT INTO `tb_province_city_district` VALUES (5111, 51, '乐山');
INSERT INTO `tb_province_city_district` VALUES (5113, 51, '南充');
INSERT INTO `tb_province_city_district` VALUES (5114, 51, '眉山');
INSERT INTO `tb_province_city_district` VALUES (5115, 51, '宜宾');
INSERT INTO `tb_province_city_district` VALUES (5116, 51, '广安');
INSERT INTO `tb_province_city_district` VALUES (5117, 51, '达州');
INSERT INTO `tb_province_city_district` VALUES (5118, 51, '雅安');
INSERT INTO `tb_province_city_district` VALUES (5119, 51, '巴中');
INSERT INTO `tb_province_city_district` VALUES (5120, 51, '资阳');
INSERT INTO `tb_province_city_district` VALUES (5132, 51, '阿坝藏族羌族自治州');
INSERT INTO `tb_province_city_district` VALUES (5133, 51, '甘孜藏族自治州');
INSERT INTO `tb_province_city_district` VALUES (5134, 51, '凉山彝族自治州');
INSERT INTO `tb_province_city_district` VALUES (5201, 52, '贵阳');
INSERT INTO `tb_province_city_district` VALUES (5202, 52, '六盘水');
INSERT INTO `tb_province_city_district` VALUES (5203, 52, '遵义');
INSERT INTO `tb_province_city_district` VALUES (5204, 52, '安顺');
INSERT INTO `tb_province_city_district` VALUES (5222, 52, '铜仁地区');
INSERT INTO `tb_province_city_district` VALUES (5223, 52, '黔西南布依族苗族自治');
INSERT INTO `tb_province_city_district` VALUES (5224, 52, '毕节地区');
INSERT INTO `tb_province_city_district` VALUES (5226, 52, '黔东南苗族侗族自治州');
INSERT INTO `tb_province_city_district` VALUES (5227, 52, '黔南布依族苗族自治州');
INSERT INTO `tb_province_city_district` VALUES (5301, 53, '昆明');
INSERT INTO `tb_province_city_district` VALUES (5303, 53, '曲靖');
INSERT INTO `tb_province_city_district` VALUES (5304, 53, '玉溪');
INSERT INTO `tb_province_city_district` VALUES (5305, 53, '保山');
INSERT INTO `tb_province_city_district` VALUES (5321, 53, '昭通地区');
INSERT INTO `tb_province_city_district` VALUES (5323, 53, '楚雄彝族自治州');
INSERT INTO `tb_province_city_district` VALUES (5325, 53, '红河哈尼族彝族自治州');
INSERT INTO `tb_province_city_district` VALUES (5326, 53, '文山壮族苗族自治州');
INSERT INTO `tb_province_city_district` VALUES (5327, 53, '思茅地区');
INSERT INTO `tb_province_city_district` VALUES (5328, 53, '西双版纳傣族自治州');
INSERT INTO `tb_province_city_district` VALUES (5329, 53, '大理白族自治州');
INSERT INTO `tb_province_city_district` VALUES (5331, 53, '德宏傣族景颇族自治州');
INSERT INTO `tb_province_city_district` VALUES (5332, 53, '丽江地区');
INSERT INTO `tb_province_city_district` VALUES (5333, 53, '怒江傈僳族自治州');
INSERT INTO `tb_province_city_district` VALUES (5334, 53, '迪庆藏族自治州');
INSERT INTO `tb_province_city_district` VALUES (5335, 53, '临沧地区');
INSERT INTO `tb_province_city_district` VALUES (5401, 54, '拉萨');
INSERT INTO `tb_province_city_district` VALUES (5421, 54, '昌都地区');
INSERT INTO `tb_province_city_district` VALUES (5422, 54, '山南地区');
INSERT INTO `tb_province_city_district` VALUES (5423, 54, '日喀则地区');
INSERT INTO `tb_province_city_district` VALUES (5424, 54, '那曲地区');
INSERT INTO `tb_province_city_district` VALUES (5425, 54, '阿里地区');
INSERT INTO `tb_province_city_district` VALUES (5426, 54, '林芝地区');
INSERT INTO `tb_province_city_district` VALUES (6101, 61, '西安');
INSERT INTO `tb_province_city_district` VALUES (6102, 61, '铜川');
INSERT INTO `tb_province_city_district` VALUES (6103, 61, '宝鸡');
INSERT INTO `tb_province_city_district` VALUES (6104, 61, '咸阳');
INSERT INTO `tb_province_city_district` VALUES (6105, 61, '渭南');
INSERT INTO `tb_province_city_district` VALUES (6106, 61, '延安');
INSERT INTO `tb_province_city_district` VALUES (6107, 61, '汉中');
INSERT INTO `tb_province_city_district` VALUES (6108, 61, '榆林');
INSERT INTO `tb_province_city_district` VALUES (6109, 61, '安康');
INSERT INTO `tb_province_city_district` VALUES (6125, 61, '商洛地区');
INSERT INTO `tb_province_city_district` VALUES (6201, 62, '兰州');
INSERT INTO `tb_province_city_district` VALUES (6202, 62, '嘉峪关');
INSERT INTO `tb_province_city_district` VALUES (6203, 62, '金昌');
INSERT INTO `tb_province_city_district` VALUES (6204, 62, '白银');
INSERT INTO `tb_province_city_district` VALUES (6205, 62, '天水');
INSERT INTO `tb_province_city_district` VALUES (6221, 62, '酒泉地区');
INSERT INTO `tb_province_city_district` VALUES (6222, 62, '张掖地区');
INSERT INTO `tb_province_city_district` VALUES (6223, 62, '武威地区');
INSERT INTO `tb_province_city_district` VALUES (6224, 62, '定西地区');
INSERT INTO `tb_province_city_district` VALUES (6226, 62, '陇南地区');
INSERT INTO `tb_province_city_district` VALUES (6227, 62, '平凉地区');
INSERT INTO `tb_province_city_district` VALUES (6228, 62, '庆阳地区');
INSERT INTO `tb_province_city_district` VALUES (6229, 62, '临夏回族自治州');
INSERT INTO `tb_province_city_district` VALUES (6230, 62, '甘南藏族自治州');
INSERT INTO `tb_province_city_district` VALUES (6301, 63, '西宁');
INSERT INTO `tb_province_city_district` VALUES (6321, 63, '海东地区');
INSERT INTO `tb_province_city_district` VALUES (6322, 63, '海北藏族自治州');
INSERT INTO `tb_province_city_district` VALUES (6323, 63, '黄南藏族自治州');
INSERT INTO `tb_province_city_district` VALUES (6325, 63, '海南藏族自治州');
INSERT INTO `tb_province_city_district` VALUES (6326, 63, '果洛藏族自治州');
INSERT INTO `tb_province_city_district` VALUES (6327, 63, '玉树藏族自治州');
INSERT INTO `tb_province_city_district` VALUES (6328, 63, '海西蒙古族藏族自治州');
INSERT INTO `tb_province_city_district` VALUES (6401, 64, '银川');
INSERT INTO `tb_province_city_district` VALUES (6402, 64, '石嘴山');
INSERT INTO `tb_province_city_district` VALUES (6403, 64, '吴忠');
INSERT INTO `tb_province_city_district` VALUES (6422, 64, '固原地区');
INSERT INTO `tb_province_city_district` VALUES (6501, 65, '乌鲁木齐');
INSERT INTO `tb_province_city_district` VALUES (6502, 65, '克拉玛依');
INSERT INTO `tb_province_city_district` VALUES (6521, 65, '吐鲁番地区');
INSERT INTO `tb_province_city_district` VALUES (6522, 65, '哈密地区');
INSERT INTO `tb_province_city_district` VALUES (6523, 65, '昌吉回族自治州');
INSERT INTO `tb_province_city_district` VALUES (6527, 65, '博尔塔拉蒙古自治州');
INSERT INTO `tb_province_city_district` VALUES (6528, 65, '巴音郭楞蒙古自治州');
INSERT INTO `tb_province_city_district` VALUES (6529, 65, '阿克苏地区');
INSERT INTO `tb_province_city_district` VALUES (6530, 65, '克孜勒苏柯尔克孜自治');
INSERT INTO `tb_province_city_district` VALUES (6531, 65, '喀什地区');
INSERT INTO `tb_province_city_district` VALUES (6532, 65, '和田地区');
INSERT INTO `tb_province_city_district` VALUES (6540, 65, '伊犁哈萨克自治州');
INSERT INTO `tb_province_city_district` VALUES (6541, 65, '伊犁地区');
INSERT INTO `tb_province_city_district` VALUES (6542, 65, '塔城地区');
INSERT INTO `tb_province_city_district` VALUES (6543, 65, '阿勒泰地区');
INSERT INTO `tb_province_city_district` VALUES (6590, 65, '省直辖行政单位');
INSERT INTO `tb_province_city_district` VALUES (7101, 71, '台湾市辖');
INSERT INTO `tb_province_city_district` VALUES (8101, 81, '香港特区');
INSERT INTO `tb_province_city_district` VALUES (9101, 91, '澳门特区');
INSERT INTO `tb_province_city_district` VALUES (110101, 1101, '东城区');
INSERT INTO `tb_province_city_district` VALUES (110102, 1101, '西城区');
INSERT INTO `tb_province_city_district` VALUES (110103, 1101, '崇文区');
INSERT INTO `tb_province_city_district` VALUES (110104, 1101, '宣武区');
INSERT INTO `tb_province_city_district` VALUES (110105, 1101, '朝阳区');
INSERT INTO `tb_province_city_district` VALUES (110106, 1101, '丰台区');
INSERT INTO `tb_province_city_district` VALUES (110107, 1101, '石景山区');
INSERT INTO `tb_province_city_district` VALUES (110108, 1101, '海淀区');
INSERT INTO `tb_province_city_district` VALUES (110109, 1101, '门头沟区');
INSERT INTO `tb_province_city_district` VALUES (110111, 1101, '房山区');
INSERT INTO `tb_province_city_district` VALUES (110112, 1101, '通州区');
INSERT INTO `tb_province_city_district` VALUES (110113, 1101, '顺义区');
INSERT INTO `tb_province_city_district` VALUES (110114, 1101, '昌平区');
INSERT INTO `tb_province_city_district` VALUES (110224, 1102, '大兴县');
INSERT INTO `tb_province_city_district` VALUES (110226, 1102, '平谷县');
INSERT INTO `tb_province_city_district` VALUES (110227, 1102, '怀柔县');
INSERT INTO `tb_province_city_district` VALUES (110228, 1102, '密云县');
INSERT INTO `tb_province_city_district` VALUES (110229, 1102, '延庆县');
INSERT INTO `tb_province_city_district` VALUES (120101, 1201, '和平区');
INSERT INTO `tb_province_city_district` VALUES (120102, 1201, '河东区');
INSERT INTO `tb_province_city_district` VALUES (120103, 1201, '河西区');
INSERT INTO `tb_province_city_district` VALUES (120104, 1201, '南开区');
INSERT INTO `tb_province_city_district` VALUES (120105, 1201, '河北区');
INSERT INTO `tb_province_city_district` VALUES (120106, 1201, '红桥区');
INSERT INTO `tb_province_city_district` VALUES (120107, 1201, '塘沽区');
INSERT INTO `tb_province_city_district` VALUES (120108, 1201, '汉沽区');
INSERT INTO `tb_province_city_district` VALUES (120109, 1201, '大港区');
INSERT INTO `tb_province_city_district` VALUES (120110, 1201, '东丽区');
INSERT INTO `tb_province_city_district` VALUES (120111, 1201, '西青区');
INSERT INTO `tb_province_city_district` VALUES (120112, 1201, '津南区');
INSERT INTO `tb_province_city_district` VALUES (120113, 1201, '北辰区');
INSERT INTO `tb_province_city_district` VALUES (120114, 1201, '武清区');
INSERT INTO `tb_province_city_district` VALUES (120221, 1202, '宁河县');
INSERT INTO `tb_province_city_district` VALUES (120223, 1202, '静海县');
INSERT INTO `tb_province_city_district` VALUES (120224, 1202, '宝坻县');
INSERT INTO `tb_province_city_district` VALUES (120225, 1202, '蓟  县');
INSERT INTO `tb_province_city_district` VALUES (130101, 1301, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (130102, 1301, '长安区');
INSERT INTO `tb_province_city_district` VALUES (130103, 1301, '桥东区');
INSERT INTO `tb_province_city_district` VALUES (130104, 1301, '桥西区');
INSERT INTO `tb_province_city_district` VALUES (130105, 1301, '新华区');
INSERT INTO `tb_province_city_district` VALUES (130106, 1301, '郊  区');
INSERT INTO `tb_province_city_district` VALUES (130107, 1301, '井陉矿区');
INSERT INTO `tb_province_city_district` VALUES (130121, 1301, '井陉县');
INSERT INTO `tb_province_city_district` VALUES (130123, 1301, '正定县');
INSERT INTO `tb_province_city_district` VALUES (130124, 1301, '栾城县');
INSERT INTO `tb_province_city_district` VALUES (130125, 1301, '行唐县');
INSERT INTO `tb_province_city_district` VALUES (130126, 1301, '灵寿县');
INSERT INTO `tb_province_city_district` VALUES (130127, 1301, '高邑县');
INSERT INTO `tb_province_city_district` VALUES (130128, 1301, '深泽县');
INSERT INTO `tb_province_city_district` VALUES (130129, 1301, '赞皇县');
INSERT INTO `tb_province_city_district` VALUES (130130, 1301, '无极县');
INSERT INTO `tb_province_city_district` VALUES (130131, 1301, '平山县');
INSERT INTO `tb_province_city_district` VALUES (130132, 1301, '元氏县');
INSERT INTO `tb_province_city_district` VALUES (130133, 1301, '赵  县');
INSERT INTO `tb_province_city_district` VALUES (130181, 1301, '辛集市');
INSERT INTO `tb_province_city_district` VALUES (130182, 1301, '藁城市');
INSERT INTO `tb_province_city_district` VALUES (130183, 1301, '晋州市');
INSERT INTO `tb_province_city_district` VALUES (130184, 1301, '新乐市');
INSERT INTO `tb_province_city_district` VALUES (130185, 1301, '鹿泉市');
INSERT INTO `tb_province_city_district` VALUES (130201, 1302, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (130202, 1302, '路南区');
INSERT INTO `tb_province_city_district` VALUES (130203, 1302, '路北区');
INSERT INTO `tb_province_city_district` VALUES (130204, 1302, '古冶区');
INSERT INTO `tb_province_city_district` VALUES (130205, 1302, '开平区');
INSERT INTO `tb_province_city_district` VALUES (130206, 1302, '新  区');
INSERT INTO `tb_province_city_district` VALUES (130221, 1302, '丰润县');
INSERT INTO `tb_province_city_district` VALUES (130223, 1302, '滦  县');
INSERT INTO `tb_province_city_district` VALUES (130224, 1302, '滦南县');
INSERT INTO `tb_province_city_district` VALUES (130225, 1302, '乐亭县');
INSERT INTO `tb_province_city_district` VALUES (130227, 1302, '迁西县');
INSERT INTO `tb_province_city_district` VALUES (130229, 1302, '玉田县');
INSERT INTO `tb_province_city_district` VALUES (130230, 1302, '唐海县');
INSERT INTO `tb_province_city_district` VALUES (130281, 1302, '遵化市');
INSERT INTO `tb_province_city_district` VALUES (130282, 1302, '丰南市');
INSERT INTO `tb_province_city_district` VALUES (130283, 1302, '迁安市');
INSERT INTO `tb_province_city_district` VALUES (130301, 1303, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (130302, 1303, '海港区');
INSERT INTO `tb_province_city_district` VALUES (130303, 1303, '山海关区');
INSERT INTO `tb_province_city_district` VALUES (130304, 1303, '北戴河区');
INSERT INTO `tb_province_city_district` VALUES (130321, 1303, '青龙满族自治县');
INSERT INTO `tb_province_city_district` VALUES (130322, 1303, '昌黎县');
INSERT INTO `tb_province_city_district` VALUES (130323, 1303, '抚宁县');
INSERT INTO `tb_province_city_district` VALUES (130324, 1303, '卢龙县');
INSERT INTO `tb_province_city_district` VALUES (130401, 1304, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (130402, 1304, '邯山区');
INSERT INTO `tb_province_city_district` VALUES (130403, 1304, '丛台区');
INSERT INTO `tb_province_city_district` VALUES (130404, 1304, '复兴区');
INSERT INTO `tb_province_city_district` VALUES (130406, 1304, '峰峰矿区');
INSERT INTO `tb_province_city_district` VALUES (130421, 1304, '邯郸县');
INSERT INTO `tb_province_city_district` VALUES (130423, 1304, '临漳县');
INSERT INTO `tb_province_city_district` VALUES (130424, 1304, '成安县');
INSERT INTO `tb_province_city_district` VALUES (130425, 1304, '大名县');
INSERT INTO `tb_province_city_district` VALUES (130426, 1304, '涉  县');
INSERT INTO `tb_province_city_district` VALUES (130427, 1304, '磁  县');
INSERT INTO `tb_province_city_district` VALUES (130428, 1304, '肥乡县');
INSERT INTO `tb_province_city_district` VALUES (130429, 1304, '永年县');
INSERT INTO `tb_province_city_district` VALUES (130430, 1304, '邱  县');
INSERT INTO `tb_province_city_district` VALUES (130431, 1304, '鸡泽县');
INSERT INTO `tb_province_city_district` VALUES (130432, 1304, '广平县');
INSERT INTO `tb_province_city_district` VALUES (130433, 1304, '馆陶县');
INSERT INTO `tb_province_city_district` VALUES (130434, 1304, '魏  县');
INSERT INTO `tb_province_city_district` VALUES (130435, 1304, '曲周县');
INSERT INTO `tb_province_city_district` VALUES (130481, 1304, '武安市');
INSERT INTO `tb_province_city_district` VALUES (130501, 1305, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (130502, 1305, '桥东区');
INSERT INTO `tb_province_city_district` VALUES (130503, 1305, '桥西区');
INSERT INTO `tb_province_city_district` VALUES (130521, 1305, '邢台县');
INSERT INTO `tb_province_city_district` VALUES (130522, 1305, '临城县');
INSERT INTO `tb_province_city_district` VALUES (130523, 1305, '内丘县');
INSERT INTO `tb_province_city_district` VALUES (130524, 1305, '柏乡县');
INSERT INTO `tb_province_city_district` VALUES (130525, 1305, '隆尧县');
INSERT INTO `tb_province_city_district` VALUES (130526, 1305, '任  县');
INSERT INTO `tb_province_city_district` VALUES (130527, 1305, '南和县');
INSERT INTO `tb_province_city_district` VALUES (130528, 1305, '宁晋县');
INSERT INTO `tb_province_city_district` VALUES (130529, 1305, '巨鹿县');
INSERT INTO `tb_province_city_district` VALUES (130530, 1305, '新河县');
INSERT INTO `tb_province_city_district` VALUES (130531, 1305, '广宗县');
INSERT INTO `tb_province_city_district` VALUES (130532, 1305, '平乡县');
INSERT INTO `tb_province_city_district` VALUES (130533, 1305, '威  县');
INSERT INTO `tb_province_city_district` VALUES (130534, 1305, '清河县');
INSERT INTO `tb_province_city_district` VALUES (130535, 1305, '临西县');
INSERT INTO `tb_province_city_district` VALUES (130581, 1305, '南宫市');
INSERT INTO `tb_province_city_district` VALUES (130582, 1305, '沙河市');
INSERT INTO `tb_province_city_district` VALUES (130601, 1306, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (130602, 1306, '新市区');
INSERT INTO `tb_province_city_district` VALUES (130603, 1306, '北市区');
INSERT INTO `tb_province_city_district` VALUES (130604, 1306, '南市区');
INSERT INTO `tb_province_city_district` VALUES (130621, 1306, '满城县');
INSERT INTO `tb_province_city_district` VALUES (130622, 1306, '清苑县');
INSERT INTO `tb_province_city_district` VALUES (130623, 1306, '涞水县');
INSERT INTO `tb_province_city_district` VALUES (130624, 1306, '阜平县');
INSERT INTO `tb_province_city_district` VALUES (130625, 1306, '徐水县');
INSERT INTO `tb_province_city_district` VALUES (130626, 1306, '定兴县');
INSERT INTO `tb_province_city_district` VALUES (130627, 1306, '唐  县');
INSERT INTO `tb_province_city_district` VALUES (130628, 1306, '高阳县');
INSERT INTO `tb_province_city_district` VALUES (130629, 1306, '容城县');
INSERT INTO `tb_province_city_district` VALUES (130630, 1306, '涞源县');
INSERT INTO `tb_province_city_district` VALUES (130631, 1306, '望都县');
INSERT INTO `tb_province_city_district` VALUES (130632, 1306, '安新县');
INSERT INTO `tb_province_city_district` VALUES (130633, 1306, '易  县');
INSERT INTO `tb_province_city_district` VALUES (130634, 1306, '曲阳县');
INSERT INTO `tb_province_city_district` VALUES (130635, 1306, '蠡  县');
INSERT INTO `tb_province_city_district` VALUES (130636, 1306, '顺平县');
INSERT INTO `tb_province_city_district` VALUES (130637, 1306, '博野县');
INSERT INTO `tb_province_city_district` VALUES (130638, 1306, '雄  县');
INSERT INTO `tb_province_city_district` VALUES (130681, 1306, '涿州市');
INSERT INTO `tb_province_city_district` VALUES (130682, 1306, '定州市');
INSERT INTO `tb_province_city_district` VALUES (130683, 1306, '安国市');
INSERT INTO `tb_province_city_district` VALUES (130684, 1306, '高碑店市');
INSERT INTO `tb_province_city_district` VALUES (130701, 1307, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (130702, 1307, '桥东区');
INSERT INTO `tb_province_city_district` VALUES (130703, 1307, '桥西区');
INSERT INTO `tb_province_city_district` VALUES (130705, 1307, '宣化区');
INSERT INTO `tb_province_city_district` VALUES (130706, 1307, '下花园区');
INSERT INTO `tb_province_city_district` VALUES (130721, 1307, '宣化县');
INSERT INTO `tb_province_city_district` VALUES (130722, 1307, '张北县');
INSERT INTO `tb_province_city_district` VALUES (130723, 1307, '康保县');
INSERT INTO `tb_province_city_district` VALUES (130724, 1307, '沽源县');
INSERT INTO `tb_province_city_district` VALUES (130725, 1307, '尚义县');
INSERT INTO `tb_province_city_district` VALUES (130726, 1307, '蔚  县');
INSERT INTO `tb_province_city_district` VALUES (130727, 1307, '阳原县');
INSERT INTO `tb_province_city_district` VALUES (130728, 1307, '怀安县');
INSERT INTO `tb_province_city_district` VALUES (130729, 1307, '万全县');
INSERT INTO `tb_province_city_district` VALUES (130730, 1307, '怀来县');
INSERT INTO `tb_province_city_district` VALUES (130731, 1307, '涿鹿县');
INSERT INTO `tb_province_city_district` VALUES (130732, 1307, '赤城县');
INSERT INTO `tb_province_city_district` VALUES (130733, 1307, '崇礼县');
INSERT INTO `tb_province_city_district` VALUES (130801, 1308, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (130802, 1308, '双桥区');
INSERT INTO `tb_province_city_district` VALUES (130803, 1308, '双滦区');
INSERT INTO `tb_province_city_district` VALUES (130804, 1308, '鹰手营子矿区');
INSERT INTO `tb_province_city_district` VALUES (130821, 1308, '承德县');
INSERT INTO `tb_province_city_district` VALUES (130822, 1308, '兴隆县');
INSERT INTO `tb_province_city_district` VALUES (130823, 1308, '平泉县');
INSERT INTO `tb_province_city_district` VALUES (130824, 1308, '滦平县');
INSERT INTO `tb_province_city_district` VALUES (130825, 1308, '隆化县');
INSERT INTO `tb_province_city_district` VALUES (130826, 1308, '丰宁满族自治县');
INSERT INTO `tb_province_city_district` VALUES (130827, 1308, '宽城满族自治县');
INSERT INTO `tb_province_city_district` VALUES (130828, 1308, '围场满族蒙古族自治县');
INSERT INTO `tb_province_city_district` VALUES (130901, 1309, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (130902, 1309, '新华区');
INSERT INTO `tb_province_city_district` VALUES (130903, 1309, '运河区');
INSERT INTO `tb_province_city_district` VALUES (130921, 1309, '沧  县');
INSERT INTO `tb_province_city_district` VALUES (130922, 1309, '青  县');
INSERT INTO `tb_province_city_district` VALUES (130923, 1309, '东光县');
INSERT INTO `tb_province_city_district` VALUES (130924, 1309, '海兴县');
INSERT INTO `tb_province_city_district` VALUES (130925, 1309, '盐山县');
INSERT INTO `tb_province_city_district` VALUES (130926, 1309, '肃宁县');
INSERT INTO `tb_province_city_district` VALUES (130927, 1309, '南皮县');
INSERT INTO `tb_province_city_district` VALUES (130928, 1309, '吴桥县');
INSERT INTO `tb_province_city_district` VALUES (130929, 1309, '献  县');
INSERT INTO `tb_province_city_district` VALUES (130930, 1309, '孟村回族自治县');
INSERT INTO `tb_province_city_district` VALUES (130981, 1309, '泊头市');
INSERT INTO `tb_province_city_district` VALUES (130982, 1309, '任丘市');
INSERT INTO `tb_province_city_district` VALUES (130983, 1309, '黄骅市');
INSERT INTO `tb_province_city_district` VALUES (130984, 1309, '河间市');
INSERT INTO `tb_province_city_district` VALUES (131001, 1310, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (131002, 1310, '安次区');
INSERT INTO `tb_province_city_district` VALUES (131003, 1310, '廊坊市广阳区');
INSERT INTO `tb_province_city_district` VALUES (131022, 1310, '固安县');
INSERT INTO `tb_province_city_district` VALUES (131023, 1310, '永清县');
INSERT INTO `tb_province_city_district` VALUES (131024, 1310, '香河县');
INSERT INTO `tb_province_city_district` VALUES (131025, 1310, '大城县');
INSERT INTO `tb_province_city_district` VALUES (131026, 1310, '文安县');
INSERT INTO `tb_province_city_district` VALUES (131028, 1310, '大厂回族自治县');
INSERT INTO `tb_province_city_district` VALUES (131081, 1310, '霸州市');
INSERT INTO `tb_province_city_district` VALUES (131082, 1310, '三河市');
INSERT INTO `tb_province_city_district` VALUES (131101, 1311, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (131102, 1311, '桃城区');
INSERT INTO `tb_province_city_district` VALUES (131121, 1311, '枣强县');
INSERT INTO `tb_province_city_district` VALUES (131122, 1311, '武邑县');
INSERT INTO `tb_province_city_district` VALUES (131123, 1311, '武强县');
INSERT INTO `tb_province_city_district` VALUES (131124, 1311, '饶阳县');
INSERT INTO `tb_province_city_district` VALUES (131125, 1311, '安平县');
INSERT INTO `tb_province_city_district` VALUES (131126, 1311, '故城县');
INSERT INTO `tb_province_city_district` VALUES (131127, 1311, '景  县');
INSERT INTO `tb_province_city_district` VALUES (131128, 1311, '阜城县');
INSERT INTO `tb_province_city_district` VALUES (131181, 1311, '冀州市');
INSERT INTO `tb_province_city_district` VALUES (131182, 1311, '深州市');
INSERT INTO `tb_province_city_district` VALUES (140101, 1401, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (140105, 1401, '小店区');
INSERT INTO `tb_province_city_district` VALUES (140106, 1401, '迎泽区');
INSERT INTO `tb_province_city_district` VALUES (140107, 1401, '杏花岭区');
INSERT INTO `tb_province_city_district` VALUES (140108, 1401, '尖草坪区');
INSERT INTO `tb_province_city_district` VALUES (140109, 1401, '万柏林区');
INSERT INTO `tb_province_city_district` VALUES (140110, 1401, '晋源区');
INSERT INTO `tb_province_city_district` VALUES (140121, 1401, '清徐县');
INSERT INTO `tb_province_city_district` VALUES (140122, 1401, '阳曲县');
INSERT INTO `tb_province_city_district` VALUES (140123, 1401, '娄烦县');
INSERT INTO `tb_province_city_district` VALUES (140181, 1401, '古交市');
INSERT INTO `tb_province_city_district` VALUES (140201, 1402, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (140202, 1402, '城  区');
INSERT INTO `tb_province_city_district` VALUES (140203, 1402, '矿  区');
INSERT INTO `tb_province_city_district` VALUES (140211, 1402, '南郊区');
INSERT INTO `tb_province_city_district` VALUES (140212, 1402, '新荣区');
INSERT INTO `tb_province_city_district` VALUES (140221, 1402, '阳高县');
INSERT INTO `tb_province_city_district` VALUES (140222, 1402, '天镇县');
INSERT INTO `tb_province_city_district` VALUES (140223, 1402, '广灵县');
INSERT INTO `tb_province_city_district` VALUES (140224, 1402, '灵丘县');
INSERT INTO `tb_province_city_district` VALUES (140225, 1402, '浑源县');
INSERT INTO `tb_province_city_district` VALUES (140226, 1402, '左云县');
INSERT INTO `tb_province_city_district` VALUES (140227, 1402, '大同县');
INSERT INTO `tb_province_city_district` VALUES (140301, 1403, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (140302, 1403, '城  区');
INSERT INTO `tb_province_city_district` VALUES (140303, 1403, '矿  区');
INSERT INTO `tb_province_city_district` VALUES (140311, 1403, '郊  区');
INSERT INTO `tb_province_city_district` VALUES (140321, 1403, '平定县');
INSERT INTO `tb_province_city_district` VALUES (140322, 1403, '盂  县');
INSERT INTO `tb_province_city_district` VALUES (140401, 1404, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (140402, 1404, '城  区');
INSERT INTO `tb_province_city_district` VALUES (140411, 1404, '郊  区');
INSERT INTO `tb_province_city_district` VALUES (140421, 1404, '长治县');
INSERT INTO `tb_province_city_district` VALUES (140423, 1404, '襄垣县');
INSERT INTO `tb_province_city_district` VALUES (140424, 1404, '屯留县');
INSERT INTO `tb_province_city_district` VALUES (140425, 1404, '平顺县');
INSERT INTO `tb_province_city_district` VALUES (140426, 1404, '黎城县');
INSERT INTO `tb_province_city_district` VALUES (140427, 1404, '壶关县');
INSERT INTO `tb_province_city_district` VALUES (140428, 1404, '长子县');
INSERT INTO `tb_province_city_district` VALUES (140429, 1404, '武乡县');
INSERT INTO `tb_province_city_district` VALUES (140430, 1404, '沁  县');
INSERT INTO `tb_province_city_district` VALUES (140431, 1404, '沁源县');
INSERT INTO `tb_province_city_district` VALUES (140481, 1404, '潞城市');
INSERT INTO `tb_province_city_district` VALUES (140501, 1405, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (140502, 1405, '城  区');
INSERT INTO `tb_province_city_district` VALUES (140521, 1405, '沁水县');
INSERT INTO `tb_province_city_district` VALUES (140522, 1405, '阳城县');
INSERT INTO `tb_province_city_district` VALUES (140524, 1405, '陵川县');
INSERT INTO `tb_province_city_district` VALUES (140525, 1405, '泽州县');
INSERT INTO `tb_province_city_district` VALUES (140581, 1405, '高平市');
INSERT INTO `tb_province_city_district` VALUES (140601, 1406, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (140602, 1406, '朔城区');
INSERT INTO `tb_province_city_district` VALUES (140603, 1406, '平鲁区');
INSERT INTO `tb_province_city_district` VALUES (140621, 1406, '山阴县');
INSERT INTO `tb_province_city_district` VALUES (140622, 1406, '应  县');
INSERT INTO `tb_province_city_district` VALUES (140623, 1406, '右玉县');
INSERT INTO `tb_province_city_district` VALUES (140624, 1406, '怀仁县');
INSERT INTO `tb_province_city_district` VALUES (140701, 1407, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (140702, 1407, '榆次区');
INSERT INTO `tb_province_city_district` VALUES (140721, 1407, '榆社县');
INSERT INTO `tb_province_city_district` VALUES (140722, 1407, '左权县');
INSERT INTO `tb_province_city_district` VALUES (140723, 1407, '和顺县');
INSERT INTO `tb_province_city_district` VALUES (140724, 1407, '昔阳县');
INSERT INTO `tb_province_city_district` VALUES (140725, 1407, '寿阳县');
INSERT INTO `tb_province_city_district` VALUES (140726, 1407, '太谷县');
INSERT INTO `tb_province_city_district` VALUES (140727, 1407, '祁  县');
INSERT INTO `tb_province_city_district` VALUES (140728, 1407, '平遥县');
INSERT INTO `tb_province_city_district` VALUES (140729, 1407, '灵石县');
INSERT INTO `tb_province_city_district` VALUES (140781, 1407, '介休市');
INSERT INTO `tb_province_city_district` VALUES (140801, 1408, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (140802, 1408, '盐湖区');
INSERT INTO `tb_province_city_district` VALUES (140821, 1408, '临猗县');
INSERT INTO `tb_province_city_district` VALUES (140822, 1408, '万荣县');
INSERT INTO `tb_province_city_district` VALUES (140823, 1408, '闻喜县');
INSERT INTO `tb_province_city_district` VALUES (140824, 1408, '稷山县');
INSERT INTO `tb_province_city_district` VALUES (140825, 1408, '新绛县');
INSERT INTO `tb_province_city_district` VALUES (140826, 1408, '绛  县');
INSERT INTO `tb_province_city_district` VALUES (140827, 1408, '垣曲县');
INSERT INTO `tb_province_city_district` VALUES (140828, 1408, '夏  县');
INSERT INTO `tb_province_city_district` VALUES (140829, 1408, '平陆县');
INSERT INTO `tb_province_city_district` VALUES (140830, 1408, '芮城县');
INSERT INTO `tb_province_city_district` VALUES (140881, 1408, '永济市');
INSERT INTO `tb_province_city_district` VALUES (140882, 1408, '河津市');
INSERT INTO `tb_province_city_district` VALUES (140901, 1409, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (140902, 1409, '忻府区');
INSERT INTO `tb_province_city_district` VALUES (140921, 1409, '定襄县');
INSERT INTO `tb_province_city_district` VALUES (140922, 1409, '五台县');
INSERT INTO `tb_province_city_district` VALUES (140923, 1409, '代  县');
INSERT INTO `tb_province_city_district` VALUES (140924, 1409, '繁峙县');
INSERT INTO `tb_province_city_district` VALUES (140925, 1409, '宁武县');
INSERT INTO `tb_province_city_district` VALUES (140926, 1409, '静乐县');
INSERT INTO `tb_province_city_district` VALUES (140927, 1409, '神池县');
INSERT INTO `tb_province_city_district` VALUES (140928, 1409, '五寨县');
INSERT INTO `tb_province_city_district` VALUES (140929, 1409, '岢岚县');
INSERT INTO `tb_province_city_district` VALUES (140930, 1409, '河曲县');
INSERT INTO `tb_province_city_district` VALUES (140931, 1409, '保德县');
INSERT INTO `tb_province_city_district` VALUES (140932, 1409, '偏关县');
INSERT INTO `tb_province_city_district` VALUES (140981, 1409, '原平市');
INSERT INTO `tb_province_city_district` VALUES (141001, 1410, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (141002, 1410, '尧都区');
INSERT INTO `tb_province_city_district` VALUES (141021, 1410, '曲沃县');
INSERT INTO `tb_province_city_district` VALUES (141022, 1410, '翼城县');
INSERT INTO `tb_province_city_district` VALUES (141023, 1410, '襄汾县');
INSERT INTO `tb_province_city_district` VALUES (141024, 1410, '洪洞县');
INSERT INTO `tb_province_city_district` VALUES (141025, 1410, '古  县');
INSERT INTO `tb_province_city_district` VALUES (141026, 1410, '安泽县');
INSERT INTO `tb_province_city_district` VALUES (141027, 1410, '浮山县');
INSERT INTO `tb_province_city_district` VALUES (141028, 1410, '吉  县');
INSERT INTO `tb_province_city_district` VALUES (141029, 1410, '乡宁县');
INSERT INTO `tb_province_city_district` VALUES (141030, 1410, '大宁县');
INSERT INTO `tb_province_city_district` VALUES (141031, 1410, '隰  县');
INSERT INTO `tb_province_city_district` VALUES (141032, 1410, '永和县');
INSERT INTO `tb_province_city_district` VALUES (141033, 1410, '蒲  县');
INSERT INTO `tb_province_city_district` VALUES (141034, 1410, '汾西县');
INSERT INTO `tb_province_city_district` VALUES (141081, 1410, '侯马市');
INSERT INTO `tb_province_city_district` VALUES (141082, 1410, '霍州市');
INSERT INTO `tb_province_city_district` VALUES (142301, 1423, '孝义市');
INSERT INTO `tb_province_city_district` VALUES (142302, 1423, '离石市');
INSERT INTO `tb_province_city_district` VALUES (142303, 1423, '汾阳市');
INSERT INTO `tb_province_city_district` VALUES (142322, 1423, '文水县');
INSERT INTO `tb_province_city_district` VALUES (142323, 1423, '交城县');
INSERT INTO `tb_province_city_district` VALUES (142325, 1423, '兴  县');
INSERT INTO `tb_province_city_district` VALUES (142326, 1423, '临  县');
INSERT INTO `tb_province_city_district` VALUES (142327, 1423, '柳林县');
INSERT INTO `tb_province_city_district` VALUES (142328, 1423, '石楼县');
INSERT INTO `tb_province_city_district` VALUES (142329, 1423, '岚  县');
INSERT INTO `tb_province_city_district` VALUES (142330, 1423, '方山县');
INSERT INTO `tb_province_city_district` VALUES (142332, 1423, '中阳县');
INSERT INTO `tb_province_city_district` VALUES (142333, 1423, '交口县');
INSERT INTO `tb_province_city_district` VALUES (150101, 1501, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (150102, 1501, '新城区');
INSERT INTO `tb_province_city_district` VALUES (150103, 1501, '回民区');
INSERT INTO `tb_province_city_district` VALUES (150104, 1501, '玉泉区');
INSERT INTO `tb_province_city_district` VALUES (150105, 1501, '赛罕区');
INSERT INTO `tb_province_city_district` VALUES (150121, 1501, '土默特左旗');
INSERT INTO `tb_province_city_district` VALUES (150122, 1501, '托克托县');
INSERT INTO `tb_province_city_district` VALUES (150123, 1501, '和林格尔县');
INSERT INTO `tb_province_city_district` VALUES (150124, 1501, '清水河县');
INSERT INTO `tb_province_city_district` VALUES (150125, 1501, '武川县');
INSERT INTO `tb_province_city_district` VALUES (150201, 1502, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (150202, 1502, '东河区');
INSERT INTO `tb_province_city_district` VALUES (150203, 1502, '昆都伦区');
INSERT INTO `tb_province_city_district` VALUES (150204, 1502, '青山区');
INSERT INTO `tb_province_city_district` VALUES (150205, 1502, '石拐区');
INSERT INTO `tb_province_city_district` VALUES (150206, 1502, '白云矿区');
INSERT INTO `tb_province_city_district` VALUES (150207, 1502, '九原区');
INSERT INTO `tb_province_city_district` VALUES (150221, 1502, '土默特右旗');
INSERT INTO `tb_province_city_district` VALUES (150222, 1502, '固阳县');
INSERT INTO `tb_province_city_district` VALUES (150223, 1502, '达尔罕茂明安联合旗');
INSERT INTO `tb_province_city_district` VALUES (150301, 1503, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (150302, 1503, '海勃湾区');
INSERT INTO `tb_province_city_district` VALUES (150303, 1503, '海南区');
INSERT INTO `tb_province_city_district` VALUES (150304, 1503, '乌达区');
INSERT INTO `tb_province_city_district` VALUES (150401, 1504, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (150402, 1504, '红山区');
INSERT INTO `tb_province_city_district` VALUES (150403, 1504, '元宝山区');
INSERT INTO `tb_province_city_district` VALUES (150404, 1504, '松山区');
INSERT INTO `tb_province_city_district` VALUES (150421, 1504, '阿鲁科尔沁旗');
INSERT INTO `tb_province_city_district` VALUES (150422, 1504, '巴林左旗');
INSERT INTO `tb_province_city_district` VALUES (150423, 1504, '巴林右旗');
INSERT INTO `tb_province_city_district` VALUES (150424, 1504, '林西县');
INSERT INTO `tb_province_city_district` VALUES (150425, 1504, '克什克腾旗');
INSERT INTO `tb_province_city_district` VALUES (150426, 1504, '翁牛特旗');
INSERT INTO `tb_province_city_district` VALUES (150428, 1504, '喀喇沁旗');
INSERT INTO `tb_province_city_district` VALUES (150429, 1504, '宁城县');
INSERT INTO `tb_province_city_district` VALUES (150430, 1504, '敖汉旗');
INSERT INTO `tb_province_city_district` VALUES (150501, 1505, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (150502, 1505, '科尔沁区');
INSERT INTO `tb_province_city_district` VALUES (150521, 1505, '科尔沁左翼中旗');
INSERT INTO `tb_province_city_district` VALUES (150522, 1505, '科尔沁左翼后旗');
INSERT INTO `tb_province_city_district` VALUES (150523, 1505, '开鲁县');
INSERT INTO `tb_province_city_district` VALUES (150524, 1505, '库伦旗');
INSERT INTO `tb_province_city_district` VALUES (150525, 1505, '奈曼旗');
INSERT INTO `tb_province_city_district` VALUES (150526, 1505, '扎鲁特旗');
INSERT INTO `tb_province_city_district` VALUES (150581, 1505, '霍林郭勒市');
INSERT INTO `tb_province_city_district` VALUES (152101, 1521, '海拉尔市');
INSERT INTO `tb_province_city_district` VALUES (152102, 1521, '满洲里市');
INSERT INTO `tb_province_city_district` VALUES (152103, 1521, '扎兰屯市');
INSERT INTO `tb_province_city_district` VALUES (152104, 1521, '牙克石市');
INSERT INTO `tb_province_city_district` VALUES (152105, 1521, '根河市');
INSERT INTO `tb_province_city_district` VALUES (152106, 1521, '额尔古纳市');
INSERT INTO `tb_province_city_district` VALUES (152122, 1521, '阿荣旗');
INSERT INTO `tb_province_city_district` VALUES (152123, 1521, '莫力达瓦达斡尔族自治');
INSERT INTO `tb_province_city_district` VALUES (152127, 1521, '鄂伦春自治旗');
INSERT INTO `tb_province_city_district` VALUES (152128, 1521, '鄂温克族自治旗');
INSERT INTO `tb_province_city_district` VALUES (152129, 1521, '新巴尔虎右旗');
INSERT INTO `tb_province_city_district` VALUES (152130, 1521, '新巴尔虎左旗');
INSERT INTO `tb_province_city_district` VALUES (152131, 1521, '陈巴尔虎旗');
INSERT INTO `tb_province_city_district` VALUES (152201, 1522, '乌兰浩特市');
INSERT INTO `tb_province_city_district` VALUES (152202, 1522, '阿尔山市');
INSERT INTO `tb_province_city_district` VALUES (152221, 1522, '科尔沁右翼前旗');
INSERT INTO `tb_province_city_district` VALUES (152222, 1522, '科尔沁右翼中旗');
INSERT INTO `tb_province_city_district` VALUES (152223, 1522, '扎赉特旗');
INSERT INTO `tb_province_city_district` VALUES (152224, 1522, '突泉县');
INSERT INTO `tb_province_city_district` VALUES (152501, 1525, '二连浩特市');
INSERT INTO `tb_province_city_district` VALUES (152502, 1525, '锡林浩特市');
INSERT INTO `tb_province_city_district` VALUES (152522, 1525, '阿巴嘎旗');
INSERT INTO `tb_province_city_district` VALUES (152523, 1525, '苏尼特左旗');
INSERT INTO `tb_province_city_district` VALUES (152524, 1525, '苏尼特右旗');
INSERT INTO `tb_province_city_district` VALUES (152525, 1525, '东乌珠穆沁旗');
INSERT INTO `tb_province_city_district` VALUES (152526, 1525, '西乌珠穆沁旗');
INSERT INTO `tb_province_city_district` VALUES (152527, 1525, '太仆寺旗');
INSERT INTO `tb_province_city_district` VALUES (152528, 1525, '镶黄旗');
INSERT INTO `tb_province_city_district` VALUES (152529, 1525, '正镶白旗');
INSERT INTO `tb_province_city_district` VALUES (152530, 1525, '正蓝旗');
INSERT INTO `tb_province_city_district` VALUES (152531, 1525, '多伦县');
INSERT INTO `tb_province_city_district` VALUES (152601, 1526, '集宁市');
INSERT INTO `tb_province_city_district` VALUES (152602, 1526, '丰镇市');
INSERT INTO `tb_province_city_district` VALUES (152624, 1526, '卓资县');
INSERT INTO `tb_province_city_district` VALUES (152625, 1526, '化德县');
INSERT INTO `tb_province_city_district` VALUES (152626, 1526, '商都县');
INSERT INTO `tb_province_city_district` VALUES (152627, 1526, '兴和县');
INSERT INTO `tb_province_city_district` VALUES (152629, 1526, '凉城县');
INSERT INTO `tb_province_city_district` VALUES (152630, 1526, '察哈尔右翼前旗');
INSERT INTO `tb_province_city_district` VALUES (152631, 1526, '察哈尔右翼中旗');
INSERT INTO `tb_province_city_district` VALUES (152632, 1526, '察哈尔右翼后旗');
INSERT INTO `tb_province_city_district` VALUES (152634, 1526, '四子王旗');
INSERT INTO `tb_province_city_district` VALUES (152701, 1527, '东胜市');
INSERT INTO `tb_province_city_district` VALUES (152722, 1527, '达拉特旗');
INSERT INTO `tb_province_city_district` VALUES (152723, 1527, '准格尔旗');
INSERT INTO `tb_province_city_district` VALUES (152724, 1527, '鄂托克前旗');
INSERT INTO `tb_province_city_district` VALUES (152725, 1527, '鄂托克旗');
INSERT INTO `tb_province_city_district` VALUES (152726, 1527, '杭锦旗');
INSERT INTO `tb_province_city_district` VALUES (152727, 1527, '乌审旗');
INSERT INTO `tb_province_city_district` VALUES (152728, 1527, '伊金霍洛旗');
INSERT INTO `tb_province_city_district` VALUES (152801, 1528, '临河市');
INSERT INTO `tb_province_city_district` VALUES (152822, 1528, '五原县');
INSERT INTO `tb_province_city_district` VALUES (152823, 1528, '磴口县');
INSERT INTO `tb_province_city_district` VALUES (152824, 1528, '乌拉特前旗');
INSERT INTO `tb_province_city_district` VALUES (152825, 1528, '乌拉特中旗');
INSERT INTO `tb_province_city_district` VALUES (152826, 1528, '乌拉特后旗');
INSERT INTO `tb_province_city_district` VALUES (152827, 1528, '杭锦后旗');
INSERT INTO `tb_province_city_district` VALUES (152921, 1529, '阿拉善左旗');
INSERT INTO `tb_province_city_district` VALUES (152922, 1529, '阿拉善右旗');
INSERT INTO `tb_province_city_district` VALUES (152923, 1529, '额济纳旗');
INSERT INTO `tb_province_city_district` VALUES (210101, 2101, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (210102, 2101, '和平区');
INSERT INTO `tb_province_city_district` VALUES (210103, 2101, '沈河区');
INSERT INTO `tb_province_city_district` VALUES (210104, 2101, '大东区');
INSERT INTO `tb_province_city_district` VALUES (210105, 2101, '皇姑区');
INSERT INTO `tb_province_city_district` VALUES (210106, 2101, '铁西区');
INSERT INTO `tb_province_city_district` VALUES (210111, 2101, '苏家屯区');
INSERT INTO `tb_province_city_district` VALUES (210112, 2101, '东陵区');
INSERT INTO `tb_province_city_district` VALUES (210113, 2101, '新城子区');
INSERT INTO `tb_province_city_district` VALUES (210114, 2101, '于洪区');
INSERT INTO `tb_province_city_district` VALUES (210122, 2101, '辽中县');
INSERT INTO `tb_province_city_district` VALUES (210123, 2101, '康平县');
INSERT INTO `tb_province_city_district` VALUES (210124, 2101, '法库县');
INSERT INTO `tb_province_city_district` VALUES (210181, 2101, '新民市');
INSERT INTO `tb_province_city_district` VALUES (210201, 2102, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (210202, 2102, '中山区');
INSERT INTO `tb_province_city_district` VALUES (210203, 2102, '西岗区');
INSERT INTO `tb_province_city_district` VALUES (210204, 2102, '沙河口区');
INSERT INTO `tb_province_city_district` VALUES (210211, 2102, '甘井子区');
INSERT INTO `tb_province_city_district` VALUES (210212, 2102, '旅顺口区');
INSERT INTO `tb_province_city_district` VALUES (210213, 2102, '金州区');
INSERT INTO `tb_province_city_district` VALUES (210224, 2102, '长海县');
INSERT INTO `tb_province_city_district` VALUES (210281, 2102, '瓦房店市');
INSERT INTO `tb_province_city_district` VALUES (210282, 2102, '普兰店市');
INSERT INTO `tb_province_city_district` VALUES (210283, 2102, '庄河市');
INSERT INTO `tb_province_city_district` VALUES (210301, 2103, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (210302, 2103, '铁东区');
INSERT INTO `tb_province_city_district` VALUES (210303, 2103, '铁西区');
INSERT INTO `tb_province_city_district` VALUES (210304, 2103, '立山区');
INSERT INTO `tb_province_city_district` VALUES (210311, 2103, '千山区');
INSERT INTO `tb_province_city_district` VALUES (210321, 2103, '台安县');
INSERT INTO `tb_province_city_district` VALUES (210323, 2103, '岫岩满族自治县');
INSERT INTO `tb_province_city_district` VALUES (210381, 2103, '海城市');
INSERT INTO `tb_province_city_district` VALUES (210401, 2104, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (210402, 2104, '新抚区');
INSERT INTO `tb_province_city_district` VALUES (210403, 2104, '东洲区');
INSERT INTO `tb_province_city_district` VALUES (210404, 2104, '望花区');
INSERT INTO `tb_province_city_district` VALUES (210411, 2104, '顺城区');
INSERT INTO `tb_province_city_district` VALUES (210421, 2104, '抚顺县');
INSERT INTO `tb_province_city_district` VALUES (210422, 2104, '新宾满族自治县');
INSERT INTO `tb_province_city_district` VALUES (210423, 2104, '清原满族自治县');
INSERT INTO `tb_province_city_district` VALUES (210501, 2105, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (210502, 2105, '平山区');
INSERT INTO `tb_province_city_district` VALUES (210503, 2105, '溪湖区');
INSERT INTO `tb_province_city_district` VALUES (210504, 2105, '明山区');
INSERT INTO `tb_province_city_district` VALUES (210505, 2105, '南芬区');
INSERT INTO `tb_province_city_district` VALUES (210521, 2105, '本溪满族自治县');
INSERT INTO `tb_province_city_district` VALUES (210522, 2105, '桓仁满族自治县');
INSERT INTO `tb_province_city_district` VALUES (210601, 2106, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (210602, 2106, '元宝区');
INSERT INTO `tb_province_city_district` VALUES (210603, 2106, '振兴区');
INSERT INTO `tb_province_city_district` VALUES (210604, 2106, '振安区');
INSERT INTO `tb_province_city_district` VALUES (210624, 2106, '宽甸满族自治县');
INSERT INTO `tb_province_city_district` VALUES (210681, 2106, '东港市');
INSERT INTO `tb_province_city_district` VALUES (210682, 2106, '凤城市');
INSERT INTO `tb_province_city_district` VALUES (210701, 2107, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (210702, 2107, '古塔区');
INSERT INTO `tb_province_city_district` VALUES (210703, 2107, '凌河区');
INSERT INTO `tb_province_city_district` VALUES (210711, 2107, '太和区');
INSERT INTO `tb_province_city_district` VALUES (210726, 2107, '黑山县');
INSERT INTO `tb_province_city_district` VALUES (210727, 2107, '义  县');
INSERT INTO `tb_province_city_district` VALUES (210781, 2107, '凌海市');
INSERT INTO `tb_province_city_district` VALUES (210782, 2107, '北宁市');
INSERT INTO `tb_province_city_district` VALUES (210801, 2108, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (210802, 2108, '站前区');
INSERT INTO `tb_province_city_district` VALUES (210803, 2108, '西市区');
INSERT INTO `tb_province_city_district` VALUES (210804, 2108, '鲅鱼圈区');
INSERT INTO `tb_province_city_district` VALUES (210811, 2108, '老边区');
INSERT INTO `tb_province_city_district` VALUES (210881, 2108, '盖州市');
INSERT INTO `tb_province_city_district` VALUES (210882, 2108, '大石桥市');
INSERT INTO `tb_province_city_district` VALUES (210901, 2109, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (210902, 2109, '海州区');
INSERT INTO `tb_province_city_district` VALUES (210903, 2109, '新邱区');
INSERT INTO `tb_province_city_district` VALUES (210904, 2109, '太平区');
INSERT INTO `tb_province_city_district` VALUES (210905, 2109, '清河门区');
INSERT INTO `tb_province_city_district` VALUES (210911, 2109, '细河区');
INSERT INTO `tb_province_city_district` VALUES (210921, 2109, '阜新蒙古族自治县');
INSERT INTO `tb_province_city_district` VALUES (210922, 2109, '彰武县');
INSERT INTO `tb_province_city_district` VALUES (211001, 2110, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (211002, 2110, '白塔区');
INSERT INTO `tb_province_city_district` VALUES (211003, 2110, '文圣区');
INSERT INTO `tb_province_city_district` VALUES (211004, 2110, '宏伟区');
INSERT INTO `tb_province_city_district` VALUES (211005, 2110, '弓长岭区');
INSERT INTO `tb_province_city_district` VALUES (211011, 2110, '太子河区');
INSERT INTO `tb_province_city_district` VALUES (211021, 2110, '辽阳县');
INSERT INTO `tb_province_city_district` VALUES (211081, 2110, '灯塔市');
INSERT INTO `tb_province_city_district` VALUES (211101, 2111, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (211102, 2111, '双台子区');
INSERT INTO `tb_province_city_district` VALUES (211103, 2111, '兴隆台区');
INSERT INTO `tb_province_city_district` VALUES (211121, 2111, '大洼县');
INSERT INTO `tb_province_city_district` VALUES (211122, 2111, '盘山县');
INSERT INTO `tb_province_city_district` VALUES (211201, 2112, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (211202, 2112, '银州区');
INSERT INTO `tb_province_city_district` VALUES (211204, 2112, '清河区');
INSERT INTO `tb_province_city_district` VALUES (211221, 2112, '铁岭县');
INSERT INTO `tb_province_city_district` VALUES (211223, 2112, '西丰县');
INSERT INTO `tb_province_city_district` VALUES (211224, 2112, '昌图县');
INSERT INTO `tb_province_city_district` VALUES (211281, 2112, '铁法市');
INSERT INTO `tb_province_city_district` VALUES (211282, 2112, '开原市');
INSERT INTO `tb_province_city_district` VALUES (211301, 2113, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (211302, 2113, '双塔区');
INSERT INTO `tb_province_city_district` VALUES (211303, 2113, '龙城区');
INSERT INTO `tb_province_city_district` VALUES (211321, 2113, '朝阳县');
INSERT INTO `tb_province_city_district` VALUES (211322, 2113, '建平县');
INSERT INTO `tb_province_city_district` VALUES (211324, 2113, '喀喇沁左翼蒙古族自治');
INSERT INTO `tb_province_city_district` VALUES (211381, 2113, '北票市');
INSERT INTO `tb_province_city_district` VALUES (211382, 2113, '凌源市');
INSERT INTO `tb_province_city_district` VALUES (211401, 2114, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (211402, 2114, '连山区');
INSERT INTO `tb_province_city_district` VALUES (211403, 2114, '龙港区');
INSERT INTO `tb_province_city_district` VALUES (211404, 2114, '南票区');
INSERT INTO `tb_province_city_district` VALUES (211421, 2114, '绥中县');
INSERT INTO `tb_province_city_district` VALUES (211422, 2114, '建昌县');
INSERT INTO `tb_province_city_district` VALUES (211481, 2114, '兴城市');
INSERT INTO `tb_province_city_district` VALUES (220101, 2201, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (220102, 2201, '南关区');
INSERT INTO `tb_province_city_district` VALUES (220103, 2201, '宽城区');
INSERT INTO `tb_province_city_district` VALUES (220104, 2201, '朝阳区');
INSERT INTO `tb_province_city_district` VALUES (220105, 2201, '二道区');
INSERT INTO `tb_province_city_district` VALUES (220106, 2201, '绿园区');
INSERT INTO `tb_province_city_district` VALUES (220112, 2201, '双阳区');
INSERT INTO `tb_province_city_district` VALUES (220122, 2201, '农安县');
INSERT INTO `tb_province_city_district` VALUES (220181, 2201, '九台市');
INSERT INTO `tb_province_city_district` VALUES (220182, 2201, '榆树市');
INSERT INTO `tb_province_city_district` VALUES (220183, 2201, '德惠市');
INSERT INTO `tb_province_city_district` VALUES (220201, 2202, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (220202, 2202, '昌邑区');
INSERT INTO `tb_province_city_district` VALUES (220203, 2202, '龙潭区');
INSERT INTO `tb_province_city_district` VALUES (220204, 2202, '船营区');
INSERT INTO `tb_province_city_district` VALUES (220211, 2202, '丰满区');
INSERT INTO `tb_province_city_district` VALUES (220221, 2202, '永吉县');
INSERT INTO `tb_province_city_district` VALUES (220281, 2202, '蛟河市');
INSERT INTO `tb_province_city_district` VALUES (220282, 2202, '桦甸市');
INSERT INTO `tb_province_city_district` VALUES (220283, 2202, '舒兰市');
INSERT INTO `tb_province_city_district` VALUES (220284, 2202, '磐石市');
INSERT INTO `tb_province_city_district` VALUES (220301, 2203, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (220302, 2203, '铁西区');
INSERT INTO `tb_province_city_district` VALUES (220303, 2203, '铁东区');
INSERT INTO `tb_province_city_district` VALUES (220322, 2203, '梨树县');
INSERT INTO `tb_province_city_district` VALUES (220323, 2203, '伊通满族自治县');
INSERT INTO `tb_province_city_district` VALUES (220381, 2203, '公主岭市');
INSERT INTO `tb_province_city_district` VALUES (220382, 2203, '双辽市');
INSERT INTO `tb_province_city_district` VALUES (220401, 2204, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (220402, 2204, '龙山区');
INSERT INTO `tb_province_city_district` VALUES (220403, 2204, '西安区');
INSERT INTO `tb_province_city_district` VALUES (220421, 2204, '东丰县');
INSERT INTO `tb_province_city_district` VALUES (220422, 2204, '东辽县');
INSERT INTO `tb_province_city_district` VALUES (220501, 2205, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (220502, 2205, '东昌区');
INSERT INTO `tb_province_city_district` VALUES (220503, 2205, '二道江区');
INSERT INTO `tb_province_city_district` VALUES (220521, 2205, '通化县');
INSERT INTO `tb_province_city_district` VALUES (220523, 2205, '辉南县');
INSERT INTO `tb_province_city_district` VALUES (220524, 2205, '柳河县');
INSERT INTO `tb_province_city_district` VALUES (220581, 2205, '梅河口市');
INSERT INTO `tb_province_city_district` VALUES (220582, 2205, '集安市');
INSERT INTO `tb_province_city_district` VALUES (220601, 2206, '市辖区');
INSERT INTO `tb_province_city_district` VALUES (220602, 2206, '八道江区');
INSERT INTO `tb_province_city_district` VALUES (220621, 2206, '抚松县');
INSERT INTO `tb_province_city_district` VALUES (220622, 2206, '靖宇县');
INSERT INTO `tb_province_city_district` VALUES (220623, 2206, '长白朝鲜族自治县');
INSERT INTO `tb_province_city_district` VALUES (220625, 2206, '江源县');
INSERT INTO `tb_province_city_district` VALUES (220681, 2206, '临江市');
INSERT INTO `tb_province_city_district` VALUES (220701, 2207, '市辖区');

-- ----------------------------
-- Table structure for tb_recommend
-- ----------------------------
DROP TABLE IF EXISTS `tb_recommend`;
CREATE TABLE `tb_recommend`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `recommend` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推荐人',
  `recommended` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被推荐人',
  `recommend_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '推荐时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '推荐表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_recommend
-- ----------------------------
INSERT INTO `tb_recommend` VALUES (1, '4', '21', '2019-09-30 17:11:31');
INSERT INTO `tb_recommend` VALUES (2, '4', '23', '2019-09-30 17:14:23');

-- ----------------------------
-- Table structure for tb_sender
-- ----------------------------
DROP TABLE IF EXISTS `tb_sender`;
CREATE TABLE `tb_sender`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `sender_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '寄件方式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '寄件方式' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_sender
-- ----------------------------
INSERT INTO `tb_sender` VALUES (1, '普通发件');
INSERT INTO `tb_sender` VALUES (2, '退换货');

-- ----------------------------
-- Table structure for tb_stdmode
-- ----------------------------
DROP TABLE IF EXISTS `tb_stdmode`;
CREATE TABLE `tb_stdmode`  (
  `id` int(11) NOT NULL COMMENT 'Id（主键）',
  `stdmode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物品类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_stdmode
-- ----------------------------
INSERT INTO `tb_stdmode` VALUES (1, '文件票据');
INSERT INTO `tb_stdmode` VALUES (2, '电子产品');
INSERT INTO `tb_stdmode` VALUES (3, '衣物');
INSERT INTO `tb_stdmode` VALUES (4, '食品');
INSERT INTO `tb_stdmode` VALUES (5, '日用品');
INSERT INTO `tb_stdmode` VALUES (6, '其他');

-- ----------------------------
-- Table structure for tb_sys_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_sys_config`;
CREATE TABLE `tb_sys_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `config_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置编码',
  `config_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置内容',
  `config_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置注解',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_sys_config
-- ----------------------------
INSERT INTO `tb_sys_config` VALUES (1, 'draw_charge', '0.01', '提现手续费', NULL, NULL);

-- ----------------------------
-- Table structure for tb_terrace_eranings_statistics
-- ----------------------------
DROP TABLE IF EXISTS `tb_terrace_eranings_statistics`;
CREATE TABLE `tb_terrace_eranings_statistics`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `today` date NULL DEFAULT NULL COMMENT '日期',
  `eranings` double(11, 2) NULL DEFAULT NULL COMMENT '收益',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_today_price
-- ----------------------------
DROP TABLE IF EXISTS `tb_today_price`;
CREATE TABLE `tb_today_price`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tracking` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '快递公司',
  `area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域',
  `today_price` double(10, 2) NOT NULL COMMENT '今日报价',
  `today` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '今日',
  `add_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加',
  `today_user_price` double(10, 2) NULL DEFAULT NULL COMMENT '今日向用户报价',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '今天该快递该区域当前快递价格表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_today_price
-- ----------------------------
INSERT INTO `tb_today_price` VALUES (1, '1', '1', 5.00, '2019-09-29', '2019-09-29 17:03:29', 12.00);

-- ----------------------------
-- Table structure for tb_track_number_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_track_number_info`;
CREATE TABLE `tb_track_number_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `tracking_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `tracking_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '快递公司',
  `tracking_price` double(10, 2) NOT NULL,
  `tracking_info` varchar(6000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '快递详细信息   从百度上抓取',
  `add_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '快递详细信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_tracking
-- ----------------------------
DROP TABLE IF EXISTS `tb_tracking`;
CREATE TABLE `tb_tracking`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `tracking_company_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '快递公司',
  `add_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `tracking_state` int(11) NOT NULL COMMENT '快递状态 0关闭   1启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '快递公司表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_tracking
-- ----------------------------
INSERT INTO `tb_tracking` VALUES (1, '圆通', '2019-09-29 17:02:24', '2019-09-29 17:02:24', 1);

-- ----------------------------
-- Table structure for tb_user_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_info`;
CREATE TABLE `tb_user_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` int(11) NOT NULL COMMENT '用户编号',
  `user_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户照片地址',
  `user_info_add_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '用户明细添加时间',
  `user_info_update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '用户明细更新时间',
  `user_info_json` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户明细   json字符串',
  `user_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户地址',
  `user_tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `user_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户所在区域',
  `card_num_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户认证，身份证照片',
  `is_certification` int(11) NULL DEFAULT 1 COMMENT '是否认证 0为 是，1为 否，2为 请求认证，3为 认证失败',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user_info
-- ----------------------------
INSERT INTO `tb_user_info` VALUES (1, 1, NULL, '2019-09-30 10:08:12', '2019-09-30 10:08:12', NULL, '卧龙路', '13598654210', '河南省 南阳市 宛城区', NULL, 1);
INSERT INTO `tb_user_info` VALUES (2, 21, NULL, '2019-09-30 17:30:55', '2019-09-30 17:30:55', NULL, '呵呵呵呵呵呵', '虎子', '', NULL, 1);

-- ----------------------------
-- Table structure for tb_user_infos
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_infos`;
CREATE TABLE `tb_user_infos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `login_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录用户  唯一',
  `user_invite_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户邀请码',
  `user_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户所在区域   关联字段',
  `user_vip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户vip等级',
  `add_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_user_send_address
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_send_address`;
CREATE TABLE `tb_user_send_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` int(11) NOT NULL COMMENT '用户编号',
  `province_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省，编码',
  `city_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市，编码',
  `district` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区、乡镇县，编码',
  `detailed_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `is_default` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否是默认 0为否，1为是',
  `recipients` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人，姓名',
  `contact_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人，联系电话',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户地址薄' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user_send_address
-- ----------------------------
INSERT INTO `tb_user_send_address` VALUES (1, 1, '河南省', '南阳市', '卧龙区', '南阳师范', '0', '张三', '13598654210');
INSERT INTO `tb_user_send_address` VALUES (2, 1, '河南省', '南阳市', '宛城区', '理工', '1', '张三', '13598645226');
INSERT INTO `tb_user_send_address` VALUES (3, 1, '河南省', '南阳市', '卧龙区', '车站路与卧龙路交叉口蓝钻星座516', '0', '张三', '13598654212');
INSERT INTO `tb_user_send_address` VALUES (21, 2, '河南省', '南阳市', '宛城区', 'v修自行车203', '1', '王五', '13782152078');
INSERT INTO `tb_user_send_address` VALUES (22, 3, '河南省', '南阳市', '宛城区', '河南师范', '1', '张三', '13598654210');
INSERT INTO `tb_user_send_address` VALUES (23, 4, '河南省', '南阳市', '卧龙区', '蓝钻星座515', '0', '木子李', '17633638280');
INSERT INTO `tb_user_send_address` VALUES (24, 4, '北京市', '市辖区', '石景山区', '东门值班室代收', '0', '木子', '15220309071');
INSERT INTO `tb_user_send_address` VALUES (25, 21, '北京市', '市辖区', '朝阳区', '回家看看今年', '1', '虎子', '13262006650');

-- ----------------------------
-- Table structure for tb_user_single
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_single`;
CREATE TABLE `tb_user_single`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` int(11) NOT NULL COMMENT '用户编号   关联字段',
  `single_amount` double(11, 2) NOT NULL COMMENT '该用户单笔支付金额',
  `add_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户每笔支付金额表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user_single
-- ----------------------------
INSERT INTO `tb_user_single` VALUES (1, 1, 9.00, '2019-09-30 09:30:06', '2019-09-30 09:28:24');
INSERT INTO `tb_user_single` VALUES (2, 2, 9.00, '2019-09-30 11:22:45', '2019-09-30 11:21:02');
INSERT INTO `tb_user_single` VALUES (3, 3, 9.00, '2019-09-30 12:00:47', '2019-09-30 11:59:04');
INSERT INTO `tb_user_single` VALUES (4, 4, 9.00, '2019-09-30 15:08:06', '2019-09-30 15:06:23');
INSERT INTO `tb_user_single` VALUES (5, 11, 9.00, '2019-09-30 16:52:50', '2019-09-30 16:51:13');
INSERT INTO `tb_user_single` VALUES (6, 21, 9.00, '2019-09-30 17:13:16', '2019-09-30 17:11:39');
INSERT INTO `tb_user_single` VALUES (7, 22, 9.00, '2019-09-30 17:15:25', '2019-09-30 17:13:47');
INSERT INTO `tb_user_single` VALUES (8, 23, 9.00, '2019-09-30 17:16:00', '2019-09-30 17:14:23');
INSERT INTO `tb_user_single` VALUES (9, 24, 9.00, '2019-10-04 09:02:24', '2019-10-04 09:00:45');

-- ----------------------------
-- Table structure for tb_vip
-- ----------------------------
DROP TABLE IF EXISTS `tb_vip`;
CREATE TABLE `tb_vip`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `vip_rank` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员等级',
  `vip_condition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '满足会员条件',
  `add_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `vip_percentage` double(255, 2) NOT NULL COMMENT 'vip收益百分比',
  `promotion_earnings` double(255, 2) NOT NULL COMMENT 'vip推广收益百分比',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'vip 明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_vip
-- ----------------------------
INSERT INTO `tb_vip` VALUES (1, '青铜会员', '0', '2019-08-27 11:36:01', '2019-09-21 11:38:52', 0.10, 0.01);
INSERT INTO `tb_vip` VALUES (2, '白金会员', '20', '2019-08-27 11:36:13', '2019-09-29 16:51:31', 0.40, 0.02);
INSERT INTO `tb_vip` VALUES (4, '代理', '51', '2019-08-27 14:55:39', '2019-09-06 16:56:53', 0.50, 0.05);

SET FOREIGN_KEY_CHECKS = 1;
