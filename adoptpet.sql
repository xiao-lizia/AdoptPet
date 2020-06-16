/*
 Navicat Premium Data Transfer

 Source Server         : localhostMysql
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : adoptpet

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 21/05/2020 13:38:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adoptpet
-- ----------------------------
DROP TABLE IF EXISTS `adoptpet`;
CREATE TABLE `adoptpet`  (
  `aId` int(11) NOT NULL AUTO_INCREMENT COMMENT '领养id',
  `pId` int(11) NULL DEFAULT NULL COMMENT '宠物id',
  `uId` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `aType` int(11) NULL DEFAULT NULL COMMENT '申请状态',
  `applyTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '申请时间',
  `checkTime` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '审核时间',
  PRIMARY KEY (`aId`) USING BTREE,
  INDEX `uId`(`uId`) USING BTREE,
  CONSTRAINT `adoptpet_ibfk_1` FOREIGN KEY (`uId`) REFERENCES `user` (`uId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adoptpet
-- ----------------------------
INSERT INTO `adoptpet` VALUES (1, 6, 2, 2, '2020-02-06 16:14:38', '2020-04-27 22:11:05');
INSERT INTO `adoptpet` VALUES (2, 9, 3, 1, '2020-02-19 12:14:49', '2020-03-29 23:16:41');
INSERT INTO `adoptpet` VALUES (3, 8, 6, 1, '2020-02-29 08:19:36', '0000-00-00 00:00:00');
INSERT INTO `adoptpet` VALUES (4, 9, 2, 1, '2020-03-01 17:10:24', '0000-00-00 00:00:00');
INSERT INTO `adoptpet` VALUES (5, 2, 8, 1, '2020-03-18 03:19:59', '2020-03-28 23:16:38');
INSERT INTO `adoptpet` VALUES (6, 8, 10, 1, '2020-03-20 02:58:25', '2020-03-12 23:17:09');
INSERT INTO `adoptpet` VALUES (7, 6, 10, 3, '2020-03-20 03:09:01', '2020-04-27 22:11:05');
INSERT INTO `adoptpet` VALUES (8, 1, 11, 1, '2020-03-30 23:32:10', '0000-00-00 00:00:00');
INSERT INTO `adoptpet` VALUES (9, 17, 15, 1, '2020-04-02 15:09:57', '0000-00-00 00:00:00');
INSERT INTO `adoptpet` VALUES (10, 1, 3, 1, '2020-05-13 19:14:36', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for leavingmessage
-- ----------------------------
DROP TABLE IF EXISTS `leavingmessage`;
CREATE TABLE `leavingmessage`  (
  `lmId` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言id',
  `uId` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `lmContent` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '留言内容',
  `lmTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '留言时间',
  PRIMARY KEY (`lmId`) USING BTREE,
  INDEX `uId`(`uId`) USING BTREE,
  CONSTRAINT `leavingmessage_ibfk_1` FOREIGN KEY (`uId`) REFERENCES `user` (`uId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of leavingmessage
-- ----------------------------
INSERT INTO `leavingmessage` VALUES (1, 2, '网站很方便，非常好用！', '2020-02-11 20:16:28');
INSERT INTO `leavingmessage` VALUES (2, 3, '我在这领养到了我现在非常喜欢的狗狗，真的太感谢有这个平台！', '2020-02-14 15:18:58');
INSERT INTO `leavingmessage` VALUES (3, 4, '界面有点丑，建议改进改进', '2020-02-20 18:15:00');
INSERT INTO `leavingmessage` VALUES (4, 5, '功能还不够多，加油多改进', '2020-03-24 11:22:56');
INSERT INTO `leavingmessage` VALUES (5, 6, '审核制度不够完善！', '2020-03-26 18:24:51');
INSERT INTO `leavingmessage` VALUES (6, 6, '真的喜欢这个网站啊！', '2020-03-28 23:13:07');
INSERT INTO `leavingmessage` VALUES (7, 8, '网站很方便，非常好用！', '2020-03-05 20:18:58');
INSERT INTO `leavingmessage` VALUES (8, 3, '很好', '2020-04-29 14:32:56');
INSERT INTO `leavingmessage` VALUES (9, 2, '系统还行，就是没有定位，希望改进', '2020-04-29 14:57:37');

-- ----------------------------
-- Table structure for pet
-- ----------------------------
DROP TABLE IF EXISTS `pet`;
CREATE TABLE `pet`  (
  `pId` int(11) NOT NULL AUTO_INCREMENT COMMENT '宠物id',
  `uId` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `pType` int(11) NULL DEFAULT NULL COMMENT '宠物状态',
  `pSex` int(11) NULL DEFAULT NULL COMMENT '性别',
  `pPic` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `pAge` float NULL DEFAULT NULL COMMENT '年龄',
  `pKid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别',
  `pName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '宠物名',
  `pDesc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `applyTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '申请时间',
  `checkTime` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '审核时间',
  PRIMARY KEY (`pId`) USING BTREE,
  INDEX `uId`(`uId`) USING BTREE,
  CONSTRAINT `pet_ibfk_1` FOREIGN KEY (`uId`) REFERENCES `user` (`uId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pet
-- ----------------------------
INSERT INTO `pet` VALUES (1, 2, 2, 1, '/AdoptPet/photo/upload/huahua.jpg', 2, '猫', '花花', '花花是一只非常可爱的猫咪，它很乖巧，听话，也从不干坏事；现在实在没办法了，我只能把它送养了，求好好对待。', '2020-01-01 15:57:10', '2020-01-02 02:12:01');
INSERT INTO `pet` VALUES (2, 3, 2, 0, '/AdoptPet/photo/upload/doufu.jpg', 3.5, '布偶猫', '豆腐', '豆腐是一只非常可爱的猫咪，它很乖巧，听话，也从不干坏事', '2020-01-15 16:02:54', '2020-01-17 09:12:10');
INSERT INTO `pet` VALUES (3, 5, 2, 1, '/AdoptPet/photo/upload/fanfan.jpg', 3.5, '狗', '饭饭', '饭饭虽然不是什么品种狗，但是，饭饭很可爱，也很听话；现在因为我出了点事，没办法再照顾它了，求好心人收养', '2020-01-18 09:04:40', '2020-01-19 14:12:38');
INSERT INTO `pet` VALUES (4, 4, 2, 0, '/AdoptPet/photo/upload/mimi.jpg', 2.5, '橘猫', '咪咪', '咪咪虽然不是什么品种猫，但是，咪咪很可爱，也很听话，求好心人收养', '2020-02-01 11:44:34', '2020-02-02 16:12:52');
INSERT INTO `pet` VALUES (5, 7, 2, 1, '/AdoptPet/photo/upload/pangju.jpg', 2.5, '橘猫', 'pangju', '胖橘虽然不是什么品种猫，但是，胖橘很可爱，虽然有时候会有一点点凶，但是那是因为它害怕才会这样，求好心人收养', '2020-02-12 11:05:09', '2020-02-13 16:13:03');
INSERT INTO `pet` VALUES (6, 6, 4, 1, '/AdoptPet/photo/upload/xiaoqi.jpg', 1.5, '小狗', '小气', '小气体型娇小，适合想要养小型犬的，求好心人收养', '2020-02-15 09:07:33', '2020-02-16 13:13:27');
INSERT INTO `pet` VALUES (7, 1, 2, 0, '/AdoptPet/photo/upload/jiao.jpg', 2.5, '狗', '蛟', '蛟它不是品种狗，希望像样品种狗的就不要申请领养了，我怕你会失望，不会好好待它，求好心人收养', '2020-02-18 16:09:34', '2020-02-19 12:08:37');
INSERT INTO `pet` VALUES (8, 8, 2, 0, '/AdoptPet/photo/upload/zhuzhu.jpg', 5, '小狗', '猪猪', '猪猪它超级可爱，我很不想把它送出去，我也想和它继续生活，但是我现在做不到了，求好心人收养，希望好心人能好好待它', '2020-02-22 19:14:23', '2020-02-24 13:53:33');
INSERT INTO `pet` VALUES (9, 10, 2, 1, '/AdoptPet/photo/upload/tudou.jpg', 2, '梨花猫', '土豆', '土豆很可爱，虽然有时候会有一点点凶，但是它知道分寸，求好心人收养', '2020-02-29 16:15:35', '2020-02-28 09:01:15');
INSERT INTO `pet` VALUES (10, 2, 2, 0, '/AdoptPet/photo/upload/xiaopang.jpg', 4, '英短蓝猫', '小胖', '小胖是一只英短，它很聪明，但是我现在没办法养了，只能送出去了，求好心人收养', '2020-03-01 18:17:36', '2020-03-02 22:00:30');
INSERT INTO `pet` VALUES (11, 12, 1, 1, '/AdoptPet/photo/upload/20200325070910p=0.jpg', 2.5, '猫', 'pipi', 'pipi虽然有点调皮，但是很可爱，急寻收养', '2020-03-02 11:18:19', '0000-00-00 00:00:00');
INSERT INTO `pet` VALUES (13, 1, 2, 1, '/AdoptPet/photo/upload/0.jpg', 2, '狗', '特辑', '特特很可爱，急寻收养者', '2020-03-02 11:20:22', '2020-03-02 11:20:22');
INSERT INTO `pet` VALUES (14, 1, 2, 1, '/AdoptPet/photo/upload/20200324052950大声道a.jpg', 4, '狗', '莉莉', '莉莉是一只小型犬，急寻收养', '2020-03-03 05:29:51', '2020-03-03 05:29:51');
INSERT INTO `pet` VALUES (15, 9, 1, 1, '/AdoptPet/photo/upload/20200328043930gp=0.jpg', 5, '狗狗', 'xiaojie', 'xiaojie is  very beautiful，也非常可爱', '2020-03-03 05:39:30', '0000-00-00 00:00:00');
INSERT INTO `pet` VALUES (16, 1, 2, 1, '/AdoptPet/photo/upload/u=320.jpg', 2, '小黄狗', 'petLike', '贼可爱，就是没办法了才把他送人', '2020-03-04 08:42:31', '2020-03-04 08:42:31');
INSERT INTO `pet` VALUES (17, 1, 2, 0, '/AdoptPet/photo/upload/20200328050143u42.jpg', 1, '小橘猫', '果果', '果果还很小，需要好好照顾，不是真心想养猫的勿扰', '2020-03-04 10:01:44', '2020-03-04 10:01:44');
INSERT INTO `pet` VALUES (18, 13, 1, 0, '/AdoptPet/photo/upload/202003280520524.jpg', 1, '中华田园猫', '克鲁', '克鲁已经学会了自己上厕所，平常也不会吵闹，是一只很宅家的可爱小猫咪', '2020-03-05 05:20:53', '0000-00-00 00:00:00');
INSERT INTO `pet` VALUES (19, 11, 1, 0, '/AdoptPet/photo/upload/20200330233426hashiqi111.jpg', 1, '哈士奇', '包子', '二哈', '2020-03-30 23:34:26', '0000-00-00 00:00:00');
INSERT INTO `pet` VALUES (20, 14, 1, 0, '/AdoptPet/photo/upload/20200502211809u42.jpg', 3.2, '猫', '小小', '小小超级可爱de', '2020-04-01 13:26:58', '0000-00-00 00:00:00');
INSERT INTO `pet` VALUES (21, 1, 2, 1, '/AdoptPet/photo/upload/20200502212004fbc .jpg', 2.1, '猫', 'qiqi', 'qiqi很可爱', '2020-05-02 21:20:04', '2020-05-02 21:20:04');
INSERT INTO `pet` VALUES (22, 3, 1, 0, '/AdoptPet/photo/upload/20200513192330fbc .jpg', 1, '猫', 'kuku', 'kuku以前是流浪猫，它真的生活太苦。但是kuku很可爱', '2020-05-13 19:23:30', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for searcher
-- ----------------------------
DROP TABLE IF EXISTS `searcher`;
CREATE TABLE `searcher`  (
  `sId` int(11) NOT NULL AUTO_INCREMENT COMMENT '帖子Id',
  `uId` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `sTitle` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '帖子标题',
  `sDesc` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '帖子描述',
  `sType` int(11) NULL DEFAULT NULL COMMENT '帖子类别',
  `sPic` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `sTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '发帖时间',
  PRIMARY KEY (`sId`) USING BTREE,
  INDEX `uId`(`uId`) USING BTREE,
  CONSTRAINT `searcher_ibfk_1` FOREIGN KEY (`uId`) REFERENCES `user` (`uId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of searcher
-- ----------------------------
INSERT INTO `searcher` VALUES (1, 2, '寻找漳州市芗城区宠物狗，1岁半', '1岁半，2020-1-13日在漳州芗城区走丢，是一只金毛，捡到狗的请联系138xxxxxx，重金酬谢', 1, '/AdoptPet/photo/upload/sdsjinmao.jpg', '2020-01-13 16:42:10');
INSERT INTO `searcher` VALUES (2, 4, '本人在漳州芗城区捡到一只德牧，主人看到请联系我', '2020-1-13日在漳州芗城区捡到，是一只德牧，狗的主人请联系138xxxxxx', 0, '/AdoptPet/photo/upload/demuajj20.jpg', '2020-01-13 22:43:41');
INSERT INTO `searcher` VALUES (3, 7, '重金寻找泰迪大蜜棕色', '狗狗是小型犬，名字叫连连，在1-25日在福州万达商城附近走丢，捡到狗的请联系138xxxxxx，重金酬谢', 1, '/AdoptPet/photo/upload/taidi23js.jpg', '2020-01-25 18:09:43');
INSERT INTO `searcher` VALUES (4, 8, '寻福州大学城白色小狗一只，急', '狗狗全身白，只有在耳朵上有一点点的黑色，1岁半，1-26日在福州大学城走丢走丢，重金酬谢，联系：1323243222', 1, '/AdoptPet/photo/upload/xiaobaigou212e2.jpg', '2020-02-01 12:42:50');
INSERT INTO `searcher` VALUES (5, 6, '本人在福州鼓楼区捡到一只哈士奇，先帮助小狗回家', '福州鼓楼区附近捡到，狗狗主人可以联系138xxxxxx', 0, '/AdoptPet/photo/upload/hashiqi111.jpg', '2020-02-29 07:07:53');
INSERT INTO `searcher` VALUES (6, 9, '在福州万达商城附近丢失一只狸花猫，有看到的麻烦联系我一下，非常感谢', '本人在福州万达商城附近丢失了一只狸花猫，看到猫的麻烦联系:142xxxxxx，重金酬谢', 1, '/AdoptPet/photo/upload/132lihua.jpg', '2020-02-01 17:05:09');
INSERT INTO `searcher` VALUES (7, 11, '急寻福州鼓楼区一只大胖橘', '2-14日我在福州鼓楼区丢失一只大胖橘，他是自己跑出去的，有剪耳。捡到的麻烦联系11432554444，重金酬谢', 1, '/AdoptPet/photo/upload/j22umao.jpg', '2020-02-14 16:29:22');
INSERT INTO `searcher` VALUES (8, 2, '急寻宠物猫，蓝猫', '毛毛是一只成年猫，大约1岁半，左耳朵有剪耳，3月1日下午在福州万达商城附近走丢，急寻，麻烦有遇到的好心人联系我一下，联系方式1111111111。', 1, '/AdoptPet/photo/upload/20200316153829sdad.jpg', '2020-03-02 15:38:29');
INSERT INTO `searcher` VALUES (9, 5, '在福州闽江学院附近捡到一只柯基，请认识的人和我联系', '在闽江学院附近捡到，熟悉这只狗的人和我联系一下，联系方式  ：qq  132432454', 0, '/AdoptPet/photo/upload/53453fdfg.jpg', '2020-03-10 15:42:28');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uId` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `uAccount` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `uPwd` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `uIdentify` int(11) NULL DEFAULT NULL COMMENT '身份类别',
  `uName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `uQuestion` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密保问题',
  `uAnswer` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密保答案',
  `uPic` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像图片',
  `uPhone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `uAddress` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `uSex` int(11) NULL DEFAULT 0 COMMENT '性别',
  `uTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '注册时间',
  PRIMARY KEY (`uId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '5f728f7ca32a9ce2f52d2686603e303c', 1, '王继杰', 'haoleia', 'julei', '/AdoptPet/photo/head/default.jpg', '15555555555', NULL, 1, '2020-05-05 21:01:10');
INSERT INTO `user` VALUES (2, 'llt', '278e1e80750ae937987183e0e5c98490', 0, '王测试', '我叫什么', '王测试', '/AdoptPet/photo/head/20200427155032fbc .jpg', '12311333', NULL, 1, '2020-05-16 12:56:23');
INSERT INTO `user` VALUES (3, 'zhenyiting', '9bc4c1ec082f16f945d225522ba81553', 0, '甄怡婷', '是真是假', '甄', '/AdoptPet/photo/head/default.jpg', '123121333', 'fujian', 0, '2020-05-13 19:14:26');
INSERT INTO `user` VALUES (4, 'xjos', '817cbc1ed9f0ef3375ebb142aee4131a', 0, 'xjos', '我是？', '假的', '/AdoptPet/photo/head/20200325071517博雅十三张.jpg', '12393464', NULL, 0, '2020-01-09 17:24:32');
INSERT INTO `user` VALUES (5, '钱叶丽', '35b4540051358423986460ed9a1d5eb8', 0, '钱叶丽', NULL, NULL, '/AdoptPet/photo/head/default.jpg', '135435263', NULL, 1, '2020-01-17 12:40:27');
INSERT INTO `user` VALUES (6, '温继涵', '7762e51a5d14e54d9eb64ea84b35dad2', 0, '温继涵', NULL, NULL, '/AdoptPet/photo/head/20200324104857fbc .jpg', '173654756', NULL, 1, '2020-02-05 22:12:49');
INSERT INTO `user` VALUES (7, '辛伟丽', '75c831f79052bf30ef9dd78b8e257b9f', 0, '辛伟丽', NULL, NULL, '/AdoptPet/photo/head/default.jpg', '1432424', NULL, 0, '2020-02-08 18:27:57');
INSERT INTO `user` VALUES (8, 'job', '708e0f1a63f523fa7d171c48c39df08c', 0, 'job', NULL, NULL, '/AdoptPet/photo/head/default.jpg', NULL, NULL, 1, '2020-02-17 23:12:49');
INSERT INTO `user` VALUES (9, 'jack', '708e0f1a63f523fa7d171c48c39df08c', 0, '文琪', 'woshi?', '是我', '/AdoptPet/photo/head/default.jpg', NULL, NULL, 1, '2020-02-18 08:22:24');
INSERT INTO `user` VALUES (10, 'pen', 'dd0b8d16186ee67d9cc83a6d1482d069', 0, '毕畅', NULL, NULL, '/AdoptPet/photo/head/default.jpg', NULL, NULL, 1, '2020-05-01 00:06:02');
INSERT INTO `user` VALUES (11, 'jixiyi', 'ef3e130c37d619c2c95029decbbf5354', 0, '季喜义', NULL, NULL, '/AdoptPet/photo/head/default.jpg', NULL, NULL, 0, '2020-02-23 22:55:15');
INSERT INTO `user` VALUES (12, 'shenyibi', 'f8f34ea1878504a7632d587f911eb575', 0, NULL, NULL, NULL, '/AdoptPet/photo/head/default.jpg', NULL, NULL, 0, '2020-02-28 05:46:08');
INSERT INTO `user` VALUES (13, 'qiyiguo', '35b4540051358423986460ed9a1d5eb8', 0, NULL, NULL, NULL, '/AdoptPet/photo/head/default.jpg', NULL, NULL, 0, '2020-02-29 18:51:23');
INSERT INTO `user` VALUES (14, 'xiaoanji', '75c831f79052bf30ef9dd78b8e257b9f', 0, NULL, NULL, NULL, '/AdoptPet/photo/head/default.jpg', NULL, NULL, 0, '2020-03-19 20:51:53');
INSERT INTO `user` VALUES (15, 'dexiji', 'dbe1dcc8e5a26d7883f40b6b63081b33', 0, '德西急', NULL, NULL, '/AdoptPet/photo/head/default.jpg', '133383', '福建', 0, '2020-05-05 21:03:15');

SET FOREIGN_KEY_CHECKS = 1;
