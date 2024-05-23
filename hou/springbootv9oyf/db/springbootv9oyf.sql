/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80012 (8.0.12)
 Source Host           : localhost:3306
 Source Schema         : springbootv9oyf

 Target Server Type    : MySQL
 Target Server Version : 80012 (8.0.12)
 File Encoding         : 65001

 Date: 19/10/2023 21:31:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置文件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES (1, 'picture1', 'upload/1697688026131.png');
INSERT INTO `config` VALUES (2, 'picture2', 'upload/1697687995757.png');
INSERT INTO `config` VALUES (3, 'picture3', 'upload/1697687981357.png');

-- ----------------------------
-- Table structure for discussjiudianxinxi
-- ----------------------------
DROP TABLE IF EXISTS `discussjiudianxinxi`;
CREATE TABLE `discussjiudianxinxi`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `avatarurl` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '头像',
  `nickname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `reply` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回复内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1697689354306 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '酒店信息评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of discussjiudianxinxi
-- ----------------------------
INSERT INTO `discussjiudianxinxi` VALUES (1697689354305, '2023-10-19 12:22:34', 71, 11, 'upload/yonghu_touxiang1.jpg', '用户账号1', '6', NULL);

-- ----------------------------
-- Table structure for discusslvyouxianlu
-- ----------------------------
DROP TABLE IF EXISTS `discusslvyouxianlu`;
CREATE TABLE `discusslvyouxianlu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `avatarurl` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '头像',
  `nickname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `reply` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回复内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '旅游线路评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of discusslvyouxianlu
-- ----------------------------

-- ----------------------------
-- Table structure for discussremenjingdian
-- ----------------------------
DROP TABLE IF EXISTS `discussremenjingdian`;
CREATE TABLE `discussremenjingdian`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `avatarurl` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '头像',
  `nickname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `reply` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回复内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1697689318912 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '热门景点评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of discussremenjingdian
-- ----------------------------
INSERT INTO `discussremenjingdian` VALUES (1697689318911, '2023-10-19 12:21:58', 21, 11, 'upload/yonghu_touxiang1.jpg', '用户账号1', '666', NULL);

-- ----------------------------
-- Table structure for forum
-- ----------------------------
DROP TABLE IF EXISTS `forum`;
CREATE TABLE `forum`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '帖子标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '帖子内容',
  `parentid` bigint(20) NULL DEFAULT NULL COMMENT '父节点id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `avatarurl` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '头像',
  `isdone` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1697689389777 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '交流论坛' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum
-- ----------------------------
INSERT INTO `forum` VALUES (111, '2023-10-07 11:59:20', '帖子标题1', '帖子内容1', 0, 1, '用户名1', 'upload/forum_avatarurl1.jpg,upload/forum_avatarurl2.jpg,upload/forum_avatarurl3.jpg', '开放');
INSERT INTO `forum` VALUES (112, '2023-10-07 11:59:20', '帖子标题2', '帖子内容2', 0, 2, '用户名2', 'upload/forum_avatarurl2.jpg,upload/forum_avatarurl3.jpg,upload/forum_avatarurl4.jpg', '开放');
INSERT INTO `forum` VALUES (113, '2023-10-07 11:59:20', '帖子标题3', '帖子内容3', 0, 3, '用户名3', 'upload/forum_avatarurl3.jpg,upload/forum_avatarurl4.jpg,upload/forum_avatarurl5.jpg', '开放');
INSERT INTO `forum` VALUES (114, '2023-10-07 11:59:20', '帖子标题4', '帖子内容4', 0, 4, '用户名4', 'upload/forum_avatarurl4.jpg,upload/forum_avatarurl5.jpg,upload/forum_avatarurl6.jpg', '开放');
INSERT INTO `forum` VALUES (115, '2023-10-07 11:59:20', '帖子标题5', '帖子内容5', 0, 5, '用户名5', 'upload/forum_avatarurl5.jpg,upload/forum_avatarurl6.jpg,upload/forum_avatarurl7.jpg', '开放');
INSERT INTO `forum` VALUES (116, '2023-10-07 11:59:20', '帖子标题6', '帖子内容6', 0, 6, '用户名6', 'upload/forum_avatarurl6.jpg,upload/forum_avatarurl7.jpg,upload/forum_avatarurl8.jpg', '开放');
INSERT INTO `forum` VALUES (117, '2023-10-07 11:59:20', '帖子标题7', '帖子内容7', 0, 7, '用户名7', 'upload/forum_avatarurl7.jpg,upload/forum_avatarurl8.jpg,upload/forum_avatarurl9.jpg', '开放');
INSERT INTO `forum` VALUES (118, '2023-10-07 11:59:20', '帖子标题8', '帖子内容8', 0, 8, '用户名8', 'upload/forum_avatarurl8.jpg,upload/forum_avatarurl9.jpg,upload/forum_avatarurl10.jpg', '开放');

-- ----------------------------
-- Table structure for jipiaoxinxi
-- ----------------------------
DROP TABLE IF EXISTS `jipiaoxinxi`;
CREATE TABLE `jipiaoxinxi`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `hangbanbianhao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '航班编号',
  `hangkonggongsi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '航空公司',
  `tupian` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片',
  `chufadi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出发地',
  `mudedi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目的地',
  `feixingfangshi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '飞行方式',
  `chufashijian` datetime NULL DEFAULT NULL COMMENT '出发时间',
  `feixingshizhang` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '飞行时长',
  `chengjididian` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '乘机地点',
  `piaojia` int(11) NULL DEFAULT NULL COMMENT '票价',
  `shuliang` int(11) NULL DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `hangbanbianhao`(`hangbanbianhao` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '机票信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jipiaoxinxi
-- ----------------------------
INSERT INTO `jipiaoxinxi` VALUES (91, '2023-10-07 11:59:20', '航班编号1', '航空公司1', 'upload/jipiaoxinxi_tupian1.jpg,upload/jipiaoxinxi_tupian2.jpg,upload/jipiaoxinxi_tupian3.jpg', '出发地1', '目的地1', '直达', '2023-10-07 11:59:20', '飞行时长1', '乘机地点1', 1, 0);
INSERT INTO `jipiaoxinxi` VALUES (92, '2023-10-07 11:59:20', '航班编号2', '航空公司2', 'upload/jipiaoxinxi_tupian2.jpg,upload/jipiaoxinxi_tupian3.jpg,upload/jipiaoxinxi_tupian4.jpg', '出发地2', '目的地2', '直达', '2023-10-07 11:59:20', '飞行时长2', '乘机地点2', 2, 2);
INSERT INTO `jipiaoxinxi` VALUES (93, '2023-10-07 11:59:20', '航班编号3', '航空公司3', 'upload/jipiaoxinxi_tupian3.jpg,upload/jipiaoxinxi_tupian4.jpg,upload/jipiaoxinxi_tupian5.jpg', '出发地3', '目的地3', '直达', '2023-10-07 11:59:20', '飞行时长3', '乘机地点3', 3, 3);
INSERT INTO `jipiaoxinxi` VALUES (94, '2023-10-07 11:59:20', '航班编号4', '航空公司4', 'upload/jipiaoxinxi_tupian4.jpg,upload/jipiaoxinxi_tupian5.jpg,upload/jipiaoxinxi_tupian6.jpg', '出发地4', '目的地4', '直达', '2023-10-07 11:59:20', '飞行时长4', '乘机地点4', 4, 4);
INSERT INTO `jipiaoxinxi` VALUES (95, '2023-10-07 11:59:20', '航班编号5', '航空公司5', 'upload/jipiaoxinxi_tupian5.jpg,upload/jipiaoxinxi_tupian6.jpg,upload/jipiaoxinxi_tupian7.jpg', '出发地5', '目的地5', '直达', '2023-10-07 11:59:20', '飞行时长5', '乘机地点5', 5, 5);
INSERT INTO `jipiaoxinxi` VALUES (96, '2023-10-07 11:59:20', '航班编号6', '航空公司6', 'upload/jipiaoxinxi_tupian6.jpg,upload/jipiaoxinxi_tupian7.jpg,upload/jipiaoxinxi_tupian8.jpg', '出发地6', '目的地6', '直达', '2023-10-07 11:59:20', '飞行时长6', '乘机地点6', 6, 6);
INSERT INTO `jipiaoxinxi` VALUES (97, '2023-10-07 11:59:20', '航班编号7', '航空公司7', 'upload/jipiaoxinxi_tupian7.jpg,upload/jipiaoxinxi_tupian8.jpg,upload/jipiaoxinxi_tupian9.jpg', '出发地7', '目的地7', '直达', '2023-10-07 11:59:20', '飞行时长7', '乘机地点7', 7, 7);
INSERT INTO `jipiaoxinxi` VALUES (98, '2023-10-07 11:59:20', '航班编号8', '航空公司8', 'upload/jipiaoxinxi_tupian8.jpg', '出发地8', '目的地8', '直达', '2023-10-07 11:59:20', '飞行时长8', '乘机地点8', 8, 8);

-- ----------------------------
-- Table structure for jipiaoyuding
-- ----------------------------
DROP TABLE IF EXISTS `jipiaoyuding`;
CREATE TABLE `jipiaoyuding`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `dingdanbianhao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `hangbanbianhao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '航班编号',
  `hangkonggongsi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '航空公司',
  `chufashijian` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出发时间',
  `piaojia` float NULL DEFAULT NULL COMMENT '票价',
  `shuliang` int(11) NOT NULL COMMENT '数量',
  `zongjiage` float NULL DEFAULT NULL COMMENT '总价格',
  `goupiaoriqi` date NULL DEFAULT NULL COMMENT '购票日期',
  `yonghuzhanghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `shenfenzheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `lianxifangshi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `ispay` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '未支付' COMMENT '是否支付',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `dingdanbianhao`(`dingdanbianhao` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1697689380939 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '机票预订' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jipiaoyuding
-- ----------------------------
INSERT INTO `jipiaoyuding` VALUES (101, '2023-10-07 11:59:20', '1111111111', '航班编号1', '航空公司1', '出发时间1', 1, 1, 1, '2023-10-07', '用户账号1', '用户姓名1', '440300199101010001', '13823888881', '未支付');
INSERT INTO `jipiaoyuding` VALUES (102, '2023-10-07 11:59:20', '2222222222', '航班编号2', '航空公司2', '出发时间2', 2, 2, 2, '2023-10-07', '用户账号2', '用户姓名2', '440300199202020002', '13823888882', '未支付');
INSERT INTO `jipiaoyuding` VALUES (103, '2023-10-07 11:59:20', '3333333333', '航班编号3', '航空公司3', '出发时间3', 3, 3, 3, '2023-10-07', '用户账号3', '用户姓名3', '440300199303030003', '13823888883', '未支付');
INSERT INTO `jipiaoyuding` VALUES (104, '2023-10-07 11:59:20', '4444444444', '航班编号4', '航空公司4', '出发时间4', 4, 4, 4, '2023-10-07', '用户账号4', '用户姓名4', '440300199404040004', '13823888884', '未支付');
INSERT INTO `jipiaoyuding` VALUES (105, '2023-10-07 11:59:20', '5555555555', '航班编号5', '航空公司5', '出发时间5', 5, 5, 5, '2023-10-07', '用户账号5', '用户姓名5', '440300199505050005', '13823888885', '未支付');
INSERT INTO `jipiaoyuding` VALUES (106, '2023-10-07 11:59:20', '6666666666', '航班编号6', '航空公司6', '出发时间6', 6, 6, 6, '2023-10-07', '用户账号6', '用户姓名6', '440300199606060006', '13823888886', '未支付');
INSERT INTO `jipiaoyuding` VALUES (107, '2023-10-07 11:59:20', '7777777777', '航班编号7', '航空公司7', '出发时间7', 7, 7, 7, '2023-10-07', '用户账号7', '用户姓名7', '440300199707070007', '13823888887', '未支付');
INSERT INTO `jipiaoyuding` VALUES (108, '2023-10-07 11:59:20', '8888888888', '航班编号8', '航空公司8', '出发时间8', 8, 8, 8, '2023-10-07', '用户账号8', '用户姓名8', '440300199808080008', '13823888888', '未支付');
INSERT INTO `jipiaoyuding` VALUES (1697689380938, '2023-10-19 12:23:00', '1697689377324', '航班编号1', '航空公司1', '2023-10-07 11:59:20', 1, 1, 1, '2023-10-19', '用户账号1', '用户姓名1', '440300199101010001', '13823888881', '已支付');

-- ----------------------------
-- Table structure for jiudianxinxi
-- ----------------------------
DROP TABLE IF EXISTS `jiudianxinxi`;
CREATE TABLE `jiudianxinxi`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jiudianmingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '酒店名称',
  `kefangtupian` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '客房图片',
  `jiudiandengji` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '酒店等级',
  `kefangleixing` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客房类型',
  `kefangjiage` float NULL DEFAULT NULL COMMENT '客房价格',
  `kefangshuliang` int(11) NULL DEFAULT NULL COMMENT '客房数量',
  `jiudianweizhi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '酒店位置',
  `jiudiansheshi` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '酒店设施',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1697516959235 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '酒店信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jiudianxinxi
-- ----------------------------
INSERT INTO `jiudianxinxi` VALUES (71, '2023-10-07 11:59:20', '酒店名称1', 'upload/jiudianxinxi_kefangtupian1.jpg,upload/jiudianxinxi_kefangtupian2.jpg,upload/jiudianxinxi_kefangtupian3.jpg', '三星', '客房类型1', 1, 1, '酒店位置1', '酒店设施1');
INSERT INTO `jiudianxinxi` VALUES (72, '2023-10-07 11:59:20', '酒店名称2', 'upload/jiudianxinxi_kefangtupian2.jpg,upload/jiudianxinxi_kefangtupian3.jpg,upload/jiudianxinxi_kefangtupian4.jpg', '三星', '客房类型2', 2, 2, '酒店位置2', '酒店设施2');
INSERT INTO `jiudianxinxi` VALUES (73, '2023-10-07 11:59:20', '酒店名称3', 'upload/jiudianxinxi_kefangtupian3.jpg,upload/jiudianxinxi_kefangtupian4.jpg,upload/jiudianxinxi_kefangtupian5.jpg', '三星', '客房类型3', 3, 3, '酒店位置3', '酒店设施3');
INSERT INTO `jiudianxinxi` VALUES (74, '2023-10-07 11:59:20', '酒店名称4', 'upload/jiudianxinxi_kefangtupian4.jpg,upload/jiudianxinxi_kefangtupian5.jpg,upload/jiudianxinxi_kefangtupian6.jpg', '三星', '客房类型4', 4, 4, '酒店位置4', '酒店设施4');
INSERT INTO `jiudianxinxi` VALUES (75, '2023-10-07 11:59:20', '酒店名称5', 'upload/jiudianxinxi_kefangtupian5.jpg,upload/jiudianxinxi_kefangtupian6.jpg,upload/jiudianxinxi_kefangtupian7.jpg', '三星', '客房类型5', 5, 5, '酒店位置5', '酒店设施5');
INSERT INTO `jiudianxinxi` VALUES (76, '2023-10-07 11:59:20', '酒店名称6', 'upload/jiudianxinxi_kefangtupian6.jpg,upload/jiudianxinxi_kefangtupian7.jpg,upload/jiudianxinxi_kefangtupian8.jpg', '三星', '客房类型6', 6, 6, '酒店位置6', '酒店设施6');
INSERT INTO `jiudianxinxi` VALUES (77, '2023-10-07 11:59:20', '酒店名称7', 'upload/jiudianxinxi_kefangtupian7.jpg,upload/jiudianxinxi_kefangtupian8.jpg,upload/jiudianxinxi_kefangtupian9.jpg', '三星', '客房类型7', 7, 7, '酒店位置7', '酒店设施7');
INSERT INTO `jiudianxinxi` VALUES (78, '2023-10-07 11:59:20', '酒店名称8', 'upload/jiudianxinxi_kefangtupian8.jpg,upload/jiudianxinxi_kefangtupian9.jpg,upload/jiudianxinxi_kefangtupian10.jpg', '三星', '客房类型8', 8, 8, '酒店位置8', '酒店设施8');

-- ----------------------------
-- Table structure for jiudianyuding
-- ----------------------------
DROP TABLE IF EXISTS `jiudianyuding`;
CREATE TABLE `jiudianyuding`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jiudianmingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '酒店名称',
  `jiudiandengji` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '酒店等级',
  `kefangjiage` float NULL DEFAULT NULL COMMENT '客房价格',
  `kefangshuliang` int(11) NOT NULL COMMENT '客房数量',
  `zongjine` float NULL DEFAULT NULL COMMENT '总金额',
  `yudingshijian` datetime NULL DEFAULT NULL COMMENT '预订时间',
  `yonghuzhanghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `shenfenzheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `lianxifangshi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `ispay` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '未支付' COMMENT '是否支付',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1697689365689 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '酒店预订' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jiudianyuding
-- ----------------------------
INSERT INTO `jiudianyuding` VALUES (81, '2023-10-07 11:59:20', '酒店名称1', '酒店等级1', 1, 1, 1, '2023-10-07 11:59:20', '用户账号1', '用户姓名1', '440300199101010001', '13823888881', '未支付');
INSERT INTO `jiudianyuding` VALUES (82, '2023-10-07 11:59:20', '酒店名称2', '酒店等级2', 2, 2, 2, '2023-10-07 11:59:20', '用户账号2', '用户姓名2', '440300199202020002', '13823888882', '未支付');
INSERT INTO `jiudianyuding` VALUES (83, '2023-10-07 11:59:20', '酒店名称3', '酒店等级3', 3, 3, 3, '2023-10-06 11:59:20', '用户账号3', '用户姓名3', '440300199303030003', '13823888883', '未支付');
INSERT INTO `jiudianyuding` VALUES (84, '2023-10-07 11:59:20', '酒店名称4', '酒店等级4', 4, 4, 4, '2023-10-06 11:59:20', '用户账号4', '用户姓名4', '440300199404040004', '13823888884', '未支付');
INSERT INTO `jiudianyuding` VALUES (85, '2023-10-07 11:59:20', '酒店名称5', '酒店等级5', 5, 5, 5, '2023-10-07 11:59:20', '用户账号5', '用户姓名5', '440300199505050005', '13823888885', '未支付');
INSERT INTO `jiudianyuding` VALUES (86, '2023-10-07 11:59:20', '酒店名称6', '酒店等级6', 6, 6, 6, '2023-10-05 11:59:20', '用户账号6', '用户姓名6', '440300199606060006', '13823888886', '未支付');
INSERT INTO `jiudianyuding` VALUES (87, '2023-10-07 11:59:20', '酒店名称7', '酒店等级7', 7, 7, 7, '2023-10-05 11:59:20', '用户账号7', '用户姓名7', '440300199707070007', '13823888887', '未支付');
INSERT INTO `jiudianyuding` VALUES (88, '2023-10-07 11:59:20', '酒店名称8', '酒店等级8', 8, 8, 8, '2023-10-07 11:59:20', '用户账号8', '用户姓名8', '440300199808080008', '13823888888', '未支付');
INSERT INTO `jiudianyuding` VALUES (1697689365688, '2023-10-19 12:22:45', '酒店名称1', '三星', 1, 0, 0, '2023-10-20 09:03:03', '用户账号1', '用户姓名1', '440300199101010001', '13823888881', '已支付');

-- ----------------------------
-- Table structure for kefangleixing
-- ----------------------------
DROP TABLE IF EXISTS `kefangleixing`;
CREATE TABLE `kefangleixing`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kefangleixing` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客房类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客房类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kefangleixing
-- ----------------------------
INSERT INTO `kefangleixing` VALUES (61, '2023-10-07 11:59:20', '客房类型1');
INSERT INTO `kefangleixing` VALUES (62, '2023-10-07 11:59:20', '客房类型2');
INSERT INTO `kefangleixing` VALUES (63, '2023-10-07 11:59:20', '客房类型3');
INSERT INTO `kefangleixing` VALUES (64, '2023-10-07 11:59:20', '客房类型4');
INSERT INTO `kefangleixing` VALUES (65, '2023-10-07 11:59:20', '客房类型5');
INSERT INTO `kefangleixing` VALUES (66, '2023-10-07 11:59:20', '客房类型6');
INSERT INTO `kefangleixing` VALUES (67, '2023-10-07 11:59:20', '客房类型7');
INSERT INTO `kefangleixing` VALUES (68, '2023-10-07 11:59:20', '客房类型8');

-- ----------------------------
-- Table structure for lvyouxianlu
-- ----------------------------
DROP TABLE IF EXISTS `lvyouxianlu`;
CREATE TABLE `lvyouxianlu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xianlumingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路名称',
  `xianlutupian` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '线路图片',
  `xianluleixing` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路类型',
  `jingdianmingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '景点名称',
  `dengji` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '等级',
  `jingdianweizhi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '景点位置',
  `qidian` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '起点',
  `tujingluduan` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '途径路段',
  `zhongdian` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '终点',
  `jiaotongfangshi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交通方式',
  `xianluxiangqing` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '线路详情',
  `clicktime` datetime NULL DEFAULT NULL COMMENT '最近点击时间',
  `clicknum` int(11) NULL DEFAULT 0 COMMENT '点击次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '旅游线路' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lvyouxianlu
-- ----------------------------
INSERT INTO `lvyouxianlu` VALUES (51, '2023-10-07 11:59:20', '线路名称1', 'upload/lvyouxianlu_xianlutupian1.jpg,upload/lvyouxianlu_xianlutupian2.jpg,upload/lvyouxianlu_xianlutupian3.jpg', '线路类型1', '景点名称1', '等级1', '景点位置1', '起点1', '途径路段1', '终点1', '交通方式1', '线路详情1', '2023-10-19 12:08:42', 3);
INSERT INTO `lvyouxianlu` VALUES (52, '2023-10-07 11:59:20', '线路名称2', 'upload/lvyouxianlu_xianlutupian2.jpg,upload/lvyouxianlu_xianlutupian3.jpg,upload/lvyouxianlu_xianlutupian4.jpg', '线路类型2', '景点名称2', '等级2', '景点位置2', '起点2', '途径路段2', '终点2', '交通方式2', '线路详情2', '2023-10-19 12:22:21', 3);
INSERT INTO `lvyouxianlu` VALUES (53, '2023-10-07 11:59:20', '线路名称3', 'upload/lvyouxianlu_xianlutupian3.jpg,upload/lvyouxianlu_xianlutupian4.jpg,upload/lvyouxianlu_xianlutupian5.jpg', '线路类型3', '景点名称3', '等级3', '景点位置3', '起点3', '途径路段3', '终点3', '交通方式3', '线路详情3', '2023-10-07 11:59:20', 3);
INSERT INTO `lvyouxianlu` VALUES (54, '2023-10-07 11:59:20', '线路名称4', 'upload/lvyouxianlu_xianlutupian4.jpg,upload/lvyouxianlu_xianlutupian5.jpg,upload/lvyouxianlu_xianlutupian6.jpg', '线路类型4', '景点名称4', '等级4', '景点位置4', '起点4', '途径路段4', '终点4', '交通方式4', '线路详情4', '2023-10-07 11:59:20', 4);
INSERT INTO `lvyouxianlu` VALUES (55, '2023-10-07 11:59:20', '线路名称5', 'upload/lvyouxianlu_xianlutupian5.jpg,upload/lvyouxianlu_xianlutupian6.jpg,upload/lvyouxianlu_xianlutupian7.jpg', '线路类型5', '景点名称5', '等级5', '景点位置5', '起点5', '途径路段5', '终点5', '交通方式5', '线路详情5', '2023-10-07 11:59:20', 5);
INSERT INTO `lvyouxianlu` VALUES (56, '2023-10-07 11:59:20', '线路名称6', 'upload/lvyouxianlu_xianlutupian6.jpg,upload/lvyouxianlu_xianlutupian7.jpg,upload/lvyouxianlu_xianlutupian8.jpg', '线路类型6', '景点名称6', '等级6', '景点位置6', '起点6', '途径路段6', '终点6', '交通方式6', '线路详情6', '2023-10-07 11:59:20', 6);
INSERT INTO `lvyouxianlu` VALUES (57, '2023-10-07 11:59:20', '线路名称7', 'upload/lvyouxianlu_xianlutupian7.jpg,upload/lvyouxianlu_xianlutupian8.jpg,upload/lvyouxianlu_xianlutupian9.jpg', '线路类型7', '景点名称7', '等级7', '景点位置7', '起点7', '途径路段7', '终点7', '交通方式7', '线路详情7', '2023-10-07 11:59:20', 7);
INSERT INTO `lvyouxianlu` VALUES (58, '2023-10-07 11:59:20', '线路名称8', 'upload/lvyouxianlu_xianlutupian8.jpg,upload/lvyouxianlu_xianlutupian9.jpg,upload/lvyouxianlu_xianlutupian10.jpg', '线路类型8', '景点名称8', '等级8', '景点位置8', '起点8', '途径路段8', '终点8', '交通方式8', '线路详情8', '2023-10-07 11:59:20', 8);

-- ----------------------------
-- Table structure for menpiaogoumai
-- ----------------------------
DROP TABLE IF EXISTS `menpiaogoumai`;
CREATE TABLE `menpiaogoumai`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `dingdanbianhao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `jingdianmingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '景点名称',
  `tupian` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片',
  `jingdianleixing` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '景点类型',
  `dengji` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '等级',
  `menpiaojiage` float NULL DEFAULT NULL COMMENT '门票价格',
  `shuliang` int(11) NOT NULL COMMENT '数量',
  `zongjine` float NULL DEFAULT NULL COMMENT '总金额',
  `goumairiqi` date NULL DEFAULT NULL COMMENT '购买日期',
  `yonghuzhanghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `ispay` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '未支付' COMMENT '是否支付',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `dingdanbianhao`(`dingdanbianhao` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1697689335148 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门票购买' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menpiaogoumai
-- ----------------------------
INSERT INTO `menpiaogoumai` VALUES (31, '2023-10-07 11:59:20', '1111111111', '景点名称1', 'upload/menpiaogoumai_tupian1.jpg,upload/menpiaogoumai_tupian2.jpg,upload/menpiaogoumai_tupian3.jpg', '景点类型1', '等级1', 1, 1, 1, '2023-10-07', '用户账号1', '用户姓名1', '未支付');
INSERT INTO `menpiaogoumai` VALUES (32, '2023-10-07 11:59:20', '2222222222', '景点名称2', 'upload/menpiaogoumai_tupian2.jpg,upload/menpiaogoumai_tupian3.jpg,upload/menpiaogoumai_tupian4.jpg', '景点类型2', '等级2', 2, 2, 2, '2023-10-07', '用户账号2', '用户姓名2', '未支付');
INSERT INTO `menpiaogoumai` VALUES (33, '2023-10-07 11:59:20', '3333333333', '景点名称3', 'upload/menpiaogoumai_tupian3.jpg,upload/menpiaogoumai_tupian4.jpg,upload/menpiaogoumai_tupian5.jpg', '景点类型3', '等级3', 3, 3, 3, '2023-10-14', '用户账号3', '用户姓名3', '未支付');
INSERT INTO `menpiaogoumai` VALUES (34, '2023-10-07 11:59:20', '4444444444', '景点名称4', 'upload/menpiaogoumai_tupian4.jpg,upload/menpiaogoumai_tupian5.jpg,upload/menpiaogoumai_tupian6.jpg', '景点类型4', '等级4', 4, 4, 4, '2023-10-15', '用户账号4', '用户姓名4', '未支付');
INSERT INTO `menpiaogoumai` VALUES (35, '2023-10-07 11:59:20', '5555555555', '景点名称5', 'upload/menpiaogoumai_tupian5.jpg,upload/menpiaogoumai_tupian6.jpg,upload/menpiaogoumai_tupian7.jpg', '景点类型5', '等级5', 5, 5, 5, '2023-10-07', '用户账号5', '用户姓名5', '未支付');
INSERT INTO `menpiaogoumai` VALUES (36, '2023-10-07 11:59:20', '6666666666', '景点名称6', 'upload/menpiaogoumai_tupian6.jpg,upload/menpiaogoumai_tupian7.jpg,upload/menpiaogoumai_tupian8.jpg', '景点类型6', '等级6', 6, 6, 6, '2023-10-16', '用户账号6', '用户姓名6', '未支付');
INSERT INTO `menpiaogoumai` VALUES (37, '2023-10-07 11:59:20', '7777777777', '景点名称7', 'upload/menpiaogoumai_tupian7.jpg,upload/menpiaogoumai_tupian8.jpg,upload/menpiaogoumai_tupian9.jpg', '景点类型7', '等级7', 7, 7, 7, '2023-10-16', '用户账号7', '用户姓名7', '未支付');
INSERT INTO `menpiaogoumai` VALUES (38, '2023-10-07 11:59:20', '8888888888', '景点名称8', 'upload/menpiaogoumai_tupian8.jpg,upload/menpiaogoumai_tupian9.jpg,upload/menpiaogoumai_tupian10.jpg', '景点类型8', '等级8', 8, 8, 8, '2023-10-07', '用户账号8', '用户姓名8', '未支付');
INSERT INTO `menpiaogoumai` VALUES (1697689335147, '2023-10-19 12:22:14', '1697689322350', '景点名称1', 'upload/remenjingdian_tupian1.jpg', '古镇园林', '一星', 1, 1, 1, '2023-10-19', '用户账号1', '用户姓名1', '已支付');

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '留言人id',
  `username` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `avatarurl` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '头像',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '留言内容',
  `cpicture` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '留言图片',
  `reply` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回复内容',
  `rpicture` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回复图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1697689414508 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '留言板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of messages
-- ----------------------------
INSERT INTO `messages` VALUES (141, '2023-10-07 11:59:20', 1, '用户名1', 'upload/messages_avatarurl1.jpg', '留言内容1', 'upload/messages_cpicture1.jpg', '回复内容1', 'upload/messages_rpicture1.jpg');
INSERT INTO `messages` VALUES (142, '2023-10-07 11:59:20', 2, '用户名2', 'upload/messages_avatarurl2.jpg', '留言内容2', 'upload/messages_cpicture2.jpg', '回复内容2', 'upload/messages_rpicture2.jpg');
INSERT INTO `messages` VALUES (143, '2023-10-07 11:59:20', 3, '用户名3', 'upload/messages_avatarurl3.jpg', '留言内容3', 'upload/messages_cpicture3.jpg', '回复内容3', 'upload/messages_rpicture3.jpg');
INSERT INTO `messages` VALUES (144, '2023-10-07 11:59:20', 4, '用户名4', 'upload/messages_avatarurl4.jpg', '留言内容4', 'upload/messages_cpicture4.jpg', '回复内容4', 'upload/messages_rpicture4.jpg');
INSERT INTO `messages` VALUES (145, '2023-10-07 11:59:20', 5, '用户名5', 'upload/messages_avatarurl5.jpg', '留言内容5', 'upload/messages_cpicture5.jpg', '回复内容5', 'upload/messages_rpicture5.jpg');
INSERT INTO `messages` VALUES (146, '2023-10-07 11:59:20', 6, '用户名6', 'upload/messages_avatarurl6.jpg', '留言内容6', 'upload/messages_cpicture6.jpg', '回复内容6', 'upload/messages_rpicture6.jpg');
INSERT INTO `messages` VALUES (147, '2023-10-07 11:59:20', 7, '用户名7', 'upload/messages_avatarurl7.jpg', '留言内容7', 'upload/messages_cpicture7.jpg', '回复内容7', 'upload/messages_rpicture7.jpg');
INSERT INTO `messages` VALUES (148, '2023-10-07 11:59:20', 8, '用户名8', 'upload/messages_avatarurl8.jpg', '留言内容8', 'upload/messages_cpicture8.jpg', '回复内容8', 'upload/messages_rpicture8.jpg');
INSERT INTO `messages` VALUES (1697689414507, '2023-10-19 12:23:33', 11, '用户账号1', 'upload/yonghu_touxiang1.jpg', '6666', 'upload/1697689409101.png', NULL, NULL);

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `introduction` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '简介',
  `picture` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 139 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '旅游资讯' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (131, '2023-10-07 11:59:20', '有梦想，就要努力去实现', '不管你想要怎样的生活，你都要去努力争取，不多尝试一些事情怎么知道自己适合什么、不适合什么呢?你说你喜欢读书，让我给你列书单，你还问我哪里有那么多时间看书;你说自己梦想的职业是广告文案，问我如何成为一个文案，应该具备哪些素质;你说你计划晨跑，但总是因为学习、工作辛苦或者身体不舒服第二天起不了床;你说你一直梦想一个人去长途旅行，但是没钱，父母觉得危险。', 'upload/news_picture1.jpg', '<p>不管你想要怎样的生活，你都要去努力争取，不多尝试一些事情怎么知道自己适合什么、不适合什么呢?</p><p>你说你喜欢读书，让我给你列书单，你还问我哪里有那么多时间看书;你说自己梦想的职业是广告文案，问我如何成为一个文案，应该具备哪些素质;你说你计划晨跑，但总是因为学习、工作辛苦或者身体不舒服第二天起不了床;你说你一直梦想一个人去长途旅行，但是没钱，父母觉得危险。其实，我已经厌倦了你这样说说而已的把戏，我觉得就算我告诉你如何去做，你也不会照做，因为你根本什么都不做。</p><p>真正有行动力的人不需要别人告诉他如何做，因为他已经在做了。就算碰到问题，他也会自己想办法，自己动手去解决或者主动寻求可以帮助他的人，而不是等着别人为自己解决问题。</p><p>首先要学习独立思考。花一点时间想一下自己喜欢什么，梦想是什么，不要别人说想环游世界，你就说你的梦想是环游世界。</p><p>很多人说现实束缚了自己，其实在这个世界上，我们一直都可以有很多选择，生活的决定权也—直都在自己手上，只是我们缺乏行动力而已。</p><p>如果你觉得安于现状是你想要的，那选择安于现状就会让你幸福和满足;如果你不甘平庸，选择一条改变、进取和奋斗的道路，在这个追求的过程中，你也一样会感到快乐。所谓的成功，即是按照自己想要的生活方式生活。最糟糕的状态，莫过于当你想要选择一条不甘平庸、改变、进取和奋斗的道路时，却以一种安于现状的方式生活，最后抱怨自己没有得到想要的人生。</p><p>因为喜欢，你不是在苦苦坚持，也因为喜欢，你愿意投入时间、精力，长久以往，获得成功就是自然而然的事情。</p>');
INSERT INTO `news` VALUES (132, '2023-10-07 11:59:20', '又是一年毕业季', '又是一年毕业季，感慨万千，还记的自己刚进学校那时候的情景，我拖着沉重的行李箱站在偌大的教学楼前面，感叹自己未来的日子即将在这个陌生的校园里度过，而如今斗转星移，浮光掠影，弹指之间，那些青葱岁月如同白驹过隙般悄然从指缝溜走。过去的种种在胸口交集纠结，像打翻的五味瓶，甜蜜，酸楚，苦涩，一并涌上心头。', 'upload/news_picture2.jpg', '<p>又是一年毕业季，感慨万千，还记的自己刚进学校那时候的情景，我拖着沉重的行李箱站在偌大的教学楼前面，感叹自己未来的日子即将在这个陌生的校园里度过，而如今斗转星移，浮光掠影，弹指之间，那些青葱岁月如同白驹过隙般悄然从指缝溜走。</p><p>过去的种种在胸口交集纠结，像打翻的五味瓶，甜蜜，酸楚，苦涩，一并涌上心头。一直都是晚会的忠实参与者，无论是台前还是幕后，忽然间，角色转变，那种感觉确实难以用语言表达。</p><p>	过去的三年，总是默默地期盼着这个好雨时节，因为这时候，会有灿烂的阳光，会有满目的百花争艳，会有香甜的冰激凌，这是个毕业的季节，当时不经世事的我们会殷切地期待学校那一大堆的活动，期待穿上绚丽的演出服或者礼仪服，站在大礼堂镁光灯下尽情挥洒我们的澎拜的激情。</p><p>百感交集，隔岸观火与身临其境的感觉竟是如此不同。从来没想过一场晚会送走的是我们自己的时候会是怎样的感情，毕业就真的意味着结束吗?倔强的我们不愿意承认，谢谢学弟学妹们慷慨的将这次的主题定为“我们在这里”。我知道，这可能是他们对我们这些过来人的尊敬和施舍。</p><p>没有为这场晚会排练、奔波，没有为班级、学生会、文学院出点力，还真有点不习惯，百般无奈中，用“工作忙”个万能的借口来搪塞自己，欺骗别人。其实自己心里明白，那只是在逃避，只是不愿面对繁华落幕后的萧条和落寞。大四了，大家各奔东西，想凑齐班上的人真的是难上加难，敏燕从越南回来，刚落地就匆匆回了学校，那么恋家的人也启程回来了，睿睿学姐也是从家赶来跟我们团圆。大家—如既往的寒暄、打趣、调侃对方，似乎一切又回到了当初的单纯美好。</p><p>看着舞台上活泼可爱的学弟学妹们，如同一群机灵的小精灵，清澈的眼神，稚嫩的肢体，轻快地步伐，用他们那热情洋溢的舞姿渲染着在场的每一个人，我知道，我不应该羡慕嫉妒他们，不应该顾自怜惜逝去的青春，不应该感叹夕阳无限好，曾经，我们也拥有过，曾经，我们也年轻过，曾经，我们也灿烂过。我深深地告诉自己，人生的每个阶段都是美的，年轻有年轻的活力，成熟也有成熟的魅力。多—份稳重、淡然、优雅，也是漫漫时光掠影遗留下的.珍贵赏赐。</p>');
INSERT INTO `news` VALUES (133, '2023-10-07 11:59:20', '挫折路上，坚持常在心间', '回头看看，你会不会发现，曾经的你在这里摔倒过;回头看看，你是否发现，一次次地重复着，却从没爬起过。而如今，让我们把视线转向前方，那一道道金色的弧线，是流星飞逝的痕迹，或是成功运行的轨道。今天的你，是否要扬帆起航，让幸福来敲门?清晨的太阳撒向大地，神奇的宇宙赋予它神奇的色彩，大自然沐浴着春光，世界因太阳的照射而精彩，林中百鸟啾啾，河水轻轻流淌，汇成清宁的山间小调。', 'upload/news_picture3.jpg', '<p>回头看看，你会不会发现，曾经的你在这里摔倒过;回头看看，你是否发现，一次次地重复着，却从没爬起过。而如今，让我们把视线转向前方，那一道道金色的弧线，是流星飞逝的痕迹，或是成功运行的轨道。今天的你，是否要扬帆起航，让幸福来敲门?</p><p>清晨的太阳撒向大地，神奇的宇宙赋予它神奇的色彩，大自然沐浴着春光，世界因太阳的照射而精彩，林中百鸟啾啾，河水轻轻流淌，汇成清宁的山间小调。</p><p>是的，面对道途上那无情的嘲讽，面对步伐中那重复的摔跤，面对激流与硬石之间猛烈的碰撞，我们必须选择那富于阴雨，却最终见到彩虹的荆棘路。也许，经历了那暴风雨的洗礼，我们便会变得自信，幸福也随之而来。</p><p>司马迁屡遭羞辱，却依然在狱中撰写《史记》，作为一名史学家，不因王权而极度赞赏，也不因卑微而极度批判，然而他在坚持自己操守的同时，却依然要受统治阶级的阻碍，他似乎无权选择自己的本职。但是，他不顾于此，只是在面对道途的阻隔之时，他依然选择了走下去的信念。终于一部开山巨作《史记》诞生，为后人留下一份馈赠，也许在他完成毕生的杰作之时，他微微地笑了，没有什么比梦想实现更快乐的了......</p><p>	或许正如“长风破浪会有时，直挂云帆济沧海”一般，欣欣然地走向看似深渊的崎岖路，而在一番耕耘之后，便会发现这里另有一番天地。也许这就是困难与快乐的交融。</p><p>也许在形形色色的社会中，我们常能看到一份坚持，一份自信，但这里却还有一类人。这类人在暴风雨来临之际，只会闪躲，从未懂得这也是一种历炼，这何尝不是一份快乐。在阴暗的角落里，总是独自在哭，带着伤愁，看不到一点希望。</p><p>我们不能堕落于此，而要像海燕那般，在苍茫的大海上，高傲地飞翔，任何事物都无法阻挡，任何事都是幸福快乐的。</p>');
INSERT INTO `news` VALUES (134, '2023-10-07 11:59:20', '挫折是另一个生命的开端', '当遇到挫折或失败，你是看见失败还是看见机会?挫折是我们每个人成长的必经之路，它不是你想有就有，想没有就没有的。有句名言说的好，如果你想一生摆脱苦难，你就得是神或者是死尸。这句话形象地说明了挫折是伴随着人生的，是谁都逃不掉的。', 'upload/news_picture4.jpg', '<p>当遇到挫折或失败，你是看见失败还是看见机会?</p><p>挫折是我们每个人成长的必经之路，它不是你想有就有，想没有就没有的。有句名言说的好，如果你想一生摆脱苦难，你就得是神或者是死尸。这句话形象地说明了挫折是伴随着人生的，是谁都逃不掉的。</p><p>人生在世，从古到今，不分天子平民，机遇虽有不同，但总不免有身陷困境或遭遇难题之处，这时候唯有通权达变，才能使人转危为安，甚至反败为胜。</p><p>大部分的人，一生当中，最痛苦的经验是失去所爱的人，其次是丢掉一份工作。其实，经得起考验的人，就算是被开除也不会惊慌，要学会面对。</p><p>	“塞翁失马，焉知非福。”人生的道路，并不是每一步都迈向成功，这就是追求的意义。我们还要认识到一点，挫折作为一种情绪状态和一种个人体验，各人的耐受性是大不相同的，有的人经历了一次次挫折，就能够坚忍不拔，百折不挠;有的人稍遇挫折便意志消沉，一蹶不振。所以，挫折感是一种主观感受，因为人的目的和需要不同，成功标准不同，所以同一种活动对于不同的人可能会造成不同的挫折感受。</p><p>凡事皆以平常心来看待，对于生命顺逆不要太执著。能够“破我执”是很高层的人生境界。</p><p>人事的艰难就是一种考验。就像—支剑要有磨刀来磨，剑才会利:一块璞玉要有粗石来磨，才会发出耀眼的光芒。我们能够做到的，只是如何减少、避免那些由于自身的原因所造成的挫折，而在遇到痛苦和挫折之后，则力求化解痛苦，争取幸福。我们要知道，痛苦和挫折是双重性的，它既是我们人生中难以完全避免的，也是我们在争取成功时，不可缺少的一种动力。因为我认为，推动我们奋斗的力量，不仅仅是对成功的渴望，还有为摆脱痛苦和挫折而进行的奋斗。</p>');
INSERT INTO `news` VALUES (135, '2023-10-07 11:59:20', '你要去相信，没有到不了的明天', '有梦想就去努力，因为在这一辈子里面，现在不去勇敢的努力，也许就再也没有机会了。你要去相信，一定要相信，没有到不了的明天。不要被命运打败，让自己变得更强大。不管你现在是一个人走在异乡的街道上始终没有找到一丝归属感，还是你在跟朋友们一起吃饭开心址笑着的时候闪过一丝落寞。', 'upload/news_picture5.jpg', '<p>有梦想就去努力，因为在这一辈子里面，现在不去勇敢的努力，也许就再也没有机会了。你要去相信，一定要相信，没有到不了的明天。不要被命运打败，让自己变得更强大。</p><p>不管你现在是一个人走在异乡的街道上始终没有找到一丝归属感，还是你在跟朋友们一起吃饭开心址笑着的时候闪过一丝落寞。</p><p>	不管你现在是在图书馆里背着怎么也看不进去的英语单词，还是你现在迷茫地看不清未来的方向不知道要往哪走。</p><p>不管你现在是在努力着去实现梦想却没能拉近与梦想的距离，还是你已经慢慢地找不到自己的梦想了。</p><p>你都要去相信，没有到不了的明天。</p><p>	有的时候你的梦想太大，别人说你的梦想根本不可能实现;有的时候你的梦想又太小，又有人说你胸无大志;有的时候你对死党说着将来要去环游世界的梦想，却换来他的不屑一顾，于是你再也不提自己的梦想;有的时候你突然说起将来要开个小店的愿望，却发现你讲述的那个人，并没有听到你在说什么。</p><p>不过又能怎么样呢，未来始终是自己的，梦想始终是自己的，没有人会来帮你实现它。</p><p>也许很多时候我们只是需要朋友的一句鼓励，一句安慰，却也得不到。但是相信我，世界上还有很多人，只是想要和你说说话。</p><p>因为我们都一样。一样的被人说成固执，一样的在追逐他们眼里根本不在意的东西。</p><p>所以，又有什么关系呢，别人始终不是你、不能懂你的心情，你又何必多去解释呢。这个世界会来阻止你，困难也会接踵而至，其实真正关键的只有自己，有没有那个倔强。</p><p>这个世界上没有不带伤的人，真正能治愈自己的，只有自己。</p>');
INSERT INTO `news` VALUES (136, '2023-10-07 11:59:20', '离开是一种痛苦，是一种勇气，但同样也是一个考验，是一个新的开端', '无穷无尽是离愁，天涯海角遍寻思。当离别在即之时，当面对着相濡以沫兄弟般的朋友时，当面对着经历了四年的磨合而形成的真挚友谊之时，我内心激动无语，说一声再见，道一声珍重都很难出口。回想自己四年大学的风风雨雨，回想我们曾经共同经历的岁月流年，我感谢大家的相扶相依，感谢朋友们的莫大支持与帮助。虽然舍不得，但离别的脚步却不因我们的挚情而停滞。', 'upload/news_picture6.jpg', '<p>无穷无尽是离愁，天涯海角遍寻思。当离别在即之时，当面对着相濡以沫兄弟般的朋友时，当面对着经历了四年的磨合而形成的真挚友谊之时，我内心激动无语，说一声再见，道一声珍重都很难出口。回想自己四年大学的风风雨雨，回想我们曾经共同经历的岁月流年，我感谢大家的相扶相依，感谢朋友们的莫大支持与帮助。虽然舍不得，但离别的脚步却不因我们的挚情而停滞。离别的确是一种痛苦，但同样也是我们走入社会，走向新环境、新领域的一个开端，希望大家在以后新的工作岗位上能够确定自己的新起点，坚持不懈，向着更新、更高的目标前进，因为人生最美好的东西永远都在最前方!</p><p>忆往昔峥嵘岁月，看今朝潮起潮落，望未来任重而道远。作为新时代的我们，就应在失败时，能拼搏奋起，去谱写人生的辉煌。在成功时，亦能居安思危，不沉湎于一时的荣耀、鲜花和掌声中，时时刻刻怀着一颗积极寻找自己新的奶酪的心，处变不惊、成败不渝，始终踏着自己坚实的步伐，从零开始，不断向前迈进，这样才能在这风起云涌、变幻莫测的社会大潮中成为真正的弄潮儿!</p>');
INSERT INTO `news` VALUES (137, '2023-10-07 11:59:20', 'Leave未必是一种痛苦', '无穷无尽是离愁，天涯海角遍寻思。当离别在即之时，当面对着相濡以沫兄弟般的朋友时，当面对着经历了四年的磨合而形成的真挚友谊之时，我内心激动无语，说一声再见，道一声珍重都很难出口。回想自己四年大学的风风雨雨，回想我们曾经共同经历的岁月流年，我感谢大家的相扶相依，感谢朋友们的莫大支持与帮助。虽然舍不得，但离别的脚步却不因我们的挚情而停滞。', 'upload/news_picture7.jpg', '<p>无穷无尽是离愁，天涯海角遍寻思。当离别在即之时，当面对着相濡以沫兄弟般的朋友时，当面对着经历了四年的磨合而形成的真挚友谊之时，我内心激动无语，说一声再见，道一声珍重都很难出口。回想自己四年大学的风风雨雨，回想我们曾经共同经历的岁月流年，我感谢大家的相扶相依，感谢朋友们的莫大支持与帮助。虽然舍不得，但离别的脚步却不因我们的挚情而停滞。离别的确是一种痛苦，但同样也是我们走入社会，走向新环境、新领域的一个开端，希望大家在以后新的工作岗位上能够确定自己的新起点，坚持不懈，向着更新、更高的目标前进，因为人生最美好的东西永远都在最前方!</p><p>忆往昔峥嵘岁月，看今朝潮起潮落，望未来任重而道远。作为新时代的我们，就应在失败时，能拼搏奋起，去谱写人生的辉煌。在成功时，亦能居安思危，不沉湎于一时的荣耀、鲜花和掌声中，时时刻刻怀着一颗积极寻找自己新的奶酪的心，处变不惊、成败不渝，始终踏着自己坚实的步伐，从零开始，不断向前迈进，这样才能在这风起云涌、变幻莫测的社会大潮中成为真正的弄潮儿!</p>');
INSERT INTO `news` VALUES (138, '2023-10-07 11:59:20', '坚持才会成功', '回头看看，你会不会发现，曾经的你在这里摔倒过;回头看看，你是否发现，一次次地重复着，却从没爬起过。而如今，让我们把视线转向前方，那一道道金色的弧线，是流星飞逝的痕迹，或是成功运行的轨道。今天的你，是否要扬帆起航，让幸福来敲门?清晨的太阳撒向大地，神奇的宇宙赋予它神奇的色彩，大自然沐浴着春光，世界因太阳的照射而精彩，林中百鸟啾啾，河水轻轻流淌，汇成清宁的山间小调。', 'upload/news_picture8.jpg', '<p>回头看看，你会不会发现，曾经的你在这里摔倒过;回头看看，你是否发现，一次次地重复着，却从没爬起过。而如今，让我们把视线转向前方，那一道道金色的弧线，是流星飞逝的痕迹，或是成功运行的轨道。今天的你，是否要扬帆起航，让幸福来敲门?</p><p>清晨的太阳撒向大地，神奇的宇宙赋予它神奇的色彩，大自然沐浴着春光，世界因太阳的照射而精彩，林中百鸟啾啾，河水轻轻流淌，汇成清宁的山间小调。</p><p>是的，面对道途上那无情的嘲讽，面对步伐中那重复的摔跤，面对激流与硬石之间猛烈的碰撞，我们必须选择那富于阴雨，却最终见到彩虹的荆棘路。也许，经历了那暴风雨的洗礼，我们便会变得自信，幸福也随之而来。</p><p>司马迁屡遭羞辱，却依然在狱中撰写《史记》，作为一名史学家，不因王权而极度赞赏，也不因卑微而极度批判，然而他在坚持自己操守的同时，却依然要受统治阶级的阻碍，他似乎无权选择自己的本职。但是，他不顾于此，只是在面对道途的阻隔之时，他依然选择了走下去的信念。终于一部开山巨作《史记》诞生，为后人留下一份馈赠，也许在他完成毕生的杰作之时，他微微地笑了，没有什么比梦想实现更快乐的了......</p><p>	或许正如“长风破浪会有时，直挂云帆济沧海”一般，欣欣然地走向看似深渊的崎岖路，而在一番耕耘之后，便会发现这里另有一番天地。也许这就是困难与快乐的交融。</p><p>也许在形形色色的社会中，我们常能看到一份坚持，一份自信，但这里却还有一类人。这类人在暴风雨来临之际，只会闪躲，从未懂得这也是一种历炼，这何尝不是一份快乐。在阴暗的角落里，总是独自在哭，带着伤愁，看不到一点希望。</p><p>我们不能堕落于此，而要像海燕那般，在苍茫的大海上，高傲地飞翔，任何事物都无法阻挡，任何事都是幸福快乐的。</p>');

-- ----------------------------
-- Table structure for remenjingdian
-- ----------------------------
DROP TABLE IF EXISTS `remenjingdian`;
CREATE TABLE `remenjingdian`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jingdianmingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '景点名称',
  `tupian` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片',
  `dengji` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '等级',
  `jingdianleixing` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '景点类型',
  `kaifangshijian` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开放时间',
  `menpiaojiage` float NOT NULL COMMENT '门票价格',
  `shuliang` int(11) NULL DEFAULT NULL COMMENT '数量',
  `jingdianweizhi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '景点位置',
  `goupiaoxuzhi` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '购票须知',
  `jingdianjieshao` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '景点介绍',
  `thumbsupnum` int(11) NULL DEFAULT 0 COMMENT '赞',
  `crazilynum` int(11) NULL DEFAULT 0 COMMENT '踩',
  `clicktime` datetime NULL DEFAULT NULL COMMENT '最近点击时间',
  `clicknum` int(11) NULL DEFAULT 0 COMMENT '点击次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '热门景点' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of remenjingdian
-- ----------------------------
INSERT INTO `remenjingdian` VALUES (21, '2023-10-07 11:59:20', '景点名称1', 'upload/remenjingdian_tupian1.jpg,upload/remenjingdian_tupian2.jpg,upload/remenjingdian_tupian3.jpg', '一星', '古镇园林', '开放时间1', 1, 0, '景点位置1', '购票须知1', '景点介绍1', 2, 1, '2023-10-19 12:23:59', 11);
INSERT INTO `remenjingdian` VALUES (22, '2023-10-07 11:59:20', '景点名称2', 'upload/remenjingdian_tupian2.jpg,upload/remenjingdian_tupian3.jpg,upload/remenjingdian_tupian4.jpg', '一星', '古镇园林', '开放时间2', 2, 2, '景点位置2', '购票须知2', '景点介绍2', 2, 2, '2023-10-07 11:59:20', 2);
INSERT INTO `remenjingdian` VALUES (23, '2023-10-07 11:59:20', '景点名称3', 'upload/remenjingdian_tupian3.jpg,upload/remenjingdian_tupian4.jpg,upload/remenjingdian_tupian5.jpg', '一星', '古镇园林', '开放时间3', 3, 3, '景点位置3', '购票须知3', '景点介绍3', 3, 3, '2023-10-07 11:59:20', 3);
INSERT INTO `remenjingdian` VALUES (24, '2023-10-07 11:59:20', '景点名称4', 'upload/remenjingdian_tupian4.jpg,upload/remenjingdian_tupian5.jpg,upload/remenjingdian_tupian6.jpg', '一星', '古镇园林', '开放时间4', 4, 4, '景点位置4', '购票须知4', '景点介绍4', 4, 4, '2023-10-19 12:01:03', 5);
INSERT INTO `remenjingdian` VALUES (25, '2023-10-07 11:59:20', '景点名称5', 'upload/remenjingdian_tupian5.jpg,upload/remenjingdian_tupian6.jpg,upload/remenjingdian_tupian7.jpg', '一星', '古镇园林', '开放时间5', 5, 5, '景点位置5', '购票须知5', '景点介绍5', 5, 5, '2023-10-16 18:54:03', 6);
INSERT INTO `remenjingdian` VALUES (26, '2023-10-07 11:59:20', '景点名称6', 'upload/remenjingdian_tupian6.jpg,upload/remenjingdian_tupian7.jpg,upload/remenjingdian_tupian8.jpg', '一星', '古镇园林', '开放时间6', 6, 6, '景点位置6', '购票须知6', '景点介绍6', 6, 6, '2023-10-07 11:59:20', 6);
INSERT INTO `remenjingdian` VALUES (27, '2023-10-07 11:59:20', '景点名称7', 'upload/remenjingdian_tupian7.jpg,upload/remenjingdian_tupian8.jpg,upload/remenjingdian_tupian9.jpg', '一星', '古镇园林', '开放时间7', 7, 7, '景点位置7', '购票须知7', '景点介绍7', 7, 7, '2023-10-16 22:59:45', 8);
INSERT INTO `remenjingdian` VALUES (28, '2023-10-07 11:59:20', '景点名称8', 'upload/remenjingdian_tupian8.jpg,upload/remenjingdian_tupian9.jpg,upload/remenjingdian_tupian10.jpg', '一星', '古镇园林', '开放时间8', 8, 8, '景点位置8', '购票须知8', '景点介绍8', 8, 8, '2023-10-19 12:01:14', 11);

-- ----------------------------
-- Table structure for storeup
-- ----------------------------
DROP TABLE IF EXISTS `storeup`;
CREATE TABLE `storeup`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `refid` bigint(20) NULL DEFAULT NULL COMMENT '商品id',
  `tablename` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `picture` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '类型(1:收藏,21:赞,22:踩,31:竞拍参与,41:关注)',
  `inteltype` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推荐类型',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1697689443391 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of storeup
-- ----------------------------
INSERT INTO `storeup` VALUES (1697689315503, '2023-10-19 12:21:54', 11, 21, 'remenjingdian', '景点名称1', 'upload/remenjingdian_tupian1.jpg', '21', NULL, NULL);
INSERT INTO `storeup` VALUES (1697689440418, '2023-10-19 12:23:59', 11, 21, 'remenjingdian', '景点名称1', 'upload/remenjingdian_tupian1.jpg', '1', NULL, NULL);
INSERT INTO `storeup` VALUES (1697689443390, '2023-10-19 12:24:02', 11, 71, 'jiudianxinxi', '酒店名称1', 'upload/jiudianxinxi_kefangtupian1.jpg', '1', NULL, NULL);

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `tablename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色',
  `token` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'token表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES (1, 1, 'admin', 'users', '管理员', 'fu2j98mi8wzmg45idjy5i3k48lktt24m', '2023-10-16 14:42:24', '2023-10-19 22:30:09');
INSERT INTO `token` VALUES (2, 11, '用户账号1', 'yonghu', '用户', 'wc067jrndiy9agpm4q0zgm69jksp28u4', '2023-10-16 14:43:09', '2023-10-19 13:29:43');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', 'admin', '管理员', '2023-10-07 11:59:20');

-- ----------------------------
-- Table structure for xianluleixing
-- ----------------------------
DROP TABLE IF EXISTS `xianluleixing`;
CREATE TABLE `xianluleixing`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xianluleixing` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '线路类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xianluleixing
-- ----------------------------
INSERT INTO `xianluleixing` VALUES (41, '2023-10-07 11:59:20', '线路类型1');
INSERT INTO `xianluleixing` VALUES (42, '2023-10-07 11:59:20', '线路类型2');
INSERT INTO `xianluleixing` VALUES (43, '2023-10-07 11:59:20', '线路类型3');
INSERT INTO `xianluleixing` VALUES (44, '2023-10-07 11:59:20', '线路类型4');
INSERT INTO `xianluleixing` VALUES (45, '2023-10-07 11:59:20', '线路类型5');
INSERT INTO `xianluleixing` VALUES (46, '2023-10-07 11:59:20', '线路类型6');
INSERT INTO `xianluleixing` VALUES (47, '2023-10-07 11:59:20', '线路类型7');
INSERT INTO `xianluleixing` VALUES (48, '2023-10-07 11:59:20', '线路类型8');

-- ----------------------------
-- Table structure for yonghu
-- ----------------------------
DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE `yonghu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `mima` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `yonghuxingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `touxiang` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '头像',
  `xingbie` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `shenfenzheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `lianxifangshi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `yonghuzhanghao`(`yonghuzhanghao` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yonghu
-- ----------------------------
INSERT INTO `yonghu` VALUES (11, '2023-10-07 11:59:20', '用户账号1', '123456', '用户姓名1', 'upload/yonghu_touxiang1.jpg', '男', '440300199101010001', '13823888881');
INSERT INTO `yonghu` VALUES (12, '2023-10-07 11:59:20', '用户账号2', '123456', '用户姓名2', 'upload/yonghu_touxiang2.jpg', '男', '440300199202020002', '13823888882');
INSERT INTO `yonghu` VALUES (13, '2023-10-07 11:59:20', '用户账号3', '123456', '用户姓名3', 'upload/yonghu_touxiang3.jpg', '男', '440300199303030003', '13823888883');
INSERT INTO `yonghu` VALUES (14, '2023-10-07 11:59:20', '用户账号4', '123456', '用户姓名4', 'upload/yonghu_touxiang4.jpg', '男', '440300199404040004', '13823888884');
INSERT INTO `yonghu` VALUES (15, '2023-10-07 11:59:20', '用户账号5', '123456', '用户姓名5', 'upload/yonghu_touxiang5.jpg', '男', '440300199505050005', '13823888885');
INSERT INTO `yonghu` VALUES (16, '2023-10-07 11:59:20', '用户账号6', '123456', '用户姓名6', 'upload/yonghu_touxiang6.jpg', '男', '440300199606060006', '13823888886');
INSERT INTO `yonghu` VALUES (17, '2023-10-07 11:59:20', '用户账号7', '123456', '用户姓名7', 'upload/yonghu_touxiang7.jpg', '男', '440300199707070007', '13823888887');
INSERT INTO `yonghu` VALUES (18, '2023-10-07 11:59:20', '用户账号8', '123456', '用户姓名8', 'upload/yonghu_touxiang8.jpg', '男', '440300199808080008', '13823888888');

SET FOREIGN_KEY_CHECKS = 1;
