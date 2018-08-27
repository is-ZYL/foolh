/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : fool_menu

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 27/08/2018 19:19:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cfp_shopping_trolley
-- ----------------------------
DROP TABLE IF EXISTS `cfp_shopping_trolley`;
CREATE TABLE `cfp_shopping_trolley`  (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `gwu_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `product_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品id',
  `pdt_num` int(30) NULL DEFAULT NULL COMMENT '商品数量',
  `created` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `updated` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `sopp_status` int(2) NULL DEFAULT NULL COMMENT '购物车商品状态：1.用户看见；2.用户不可见；',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for db_fhdb
-- ----------------------------
DROP TABLE IF EXISTS `db_fhdb`;
CREATE TABLE `db_fhdb`  (
  `FHDB_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `USERNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户',
  `BACKUP_TIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备份时间',
  `TABLENAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `SQLPATH` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '存储位置',
  `TYPE` int(1) NOT NULL COMMENT '类型',
  `DBSIZE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件大小',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FHDB_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for db_timingbackup
-- ----------------------------
DROP TABLE IF EXISTS `db_timingbackup`;
CREATE TABLE `db_timingbackup`  (
  `TIMINGBACKUP_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOBNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `CREATE_TIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `TABLENAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `STATUS` int(1) NOT NULL COMMENT '类型',
  `FHTIME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间规则',
  `TIMEEXPLAIN` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则说明',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TIMINGBACKUP_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of db_timingbackup
-- ----------------------------
INSERT INTO `db_timingbackup` VALUES ('311e06c34a5e4518a86d5d30799f9b55', 'sys_app_user_515762', '2016-04-11 17:04:55', 'sys_app_user', 2, '1/2 * * ? * *', '每个月的 每周 每天 每小时执行一次', '备份任务');
INSERT INTO `db_timingbackup` VALUES ('bc4a788bc2ec40bdb1b7730131c26d42', 'sys_app_user_359515', '2016-04-12 17:24:05', 'sys_app_user', 2, '1/3 * * ? * *', '每个月的 每周 每天 每小时执行一次', 'ssss');

-- ----------------------------
-- Table structure for oa_datajur
-- ----------------------------
DROP TABLE IF EXISTS `oa_datajur`;
CREATE TABLE `oa_datajur`  (
  `DATAJUR_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DEPARTMENT_IDS` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门ID组合',
  `STAFF_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工ID',
  `DEPARTMENT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`DATAJUR_ID`) USING BTREE,
  INDEX `FSTAFF`(`STAFF_ID`) USING BTREE,
  CONSTRAINT `FSTAFF` FOREIGN KEY (`STAFF_ID`) REFERENCES `oa_staff` (`STAFF_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_datajur
-- ----------------------------
INSERT INTO `oa_datajur` VALUES ('4d70e7aa68b04941a8187c2be871bf8f', '(\'cbbc84eddde947ba8af7d509e430eb70\',\'8f8b045470f342fdbc4c312ab881d62b\',\'83a25761c618457cae2fa1211bd8696d\',\'a0982dea52554225ab682cd4b421de47\',\'fh\')', '4d70e7aa68b04941a8187c2be871bf8f', '5cccdb7c432449d8b853c52880058140');
INSERT INTO `oa_datajur` VALUES ('9fd17463ffd7487ab90e683c76026655', '(\'cbbc84eddde947ba8af7d509e430eb70\',\'8f8b045470f342fdbc4c312ab881d62b\',\'83a25761c618457cae2fa1211bd8696d\',\'a0982dea52554225ab682cd4b421de47\',\'fh\')', '9fd17463ffd7487ab90e683c76026655', '5cccdb7c432449d8b853c52880058140');
INSERT INTO `oa_datajur` VALUES ('c9f05f925dfc485b9e352916612ab669', '(\'a0982dea52554225ab682cd4b421de47\',\'fh\')', 'c9f05f925dfc485b9e352916612ab669', '8f8b045470f342fdbc4c312ab881d62b');

-- ----------------------------
-- Table structure for oa_department
-- ----------------------------
DROP TABLE IF EXISTS `oa_department`;
CREATE TABLE `oa_department`  (
  `DEPARTMENT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `NAME_EN` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `PARENT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级ID',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `HEADMAN` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `TEL` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `FUNCTIONS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门职能',
  `ADDRESS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`DEPARTMENT_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_department
-- ----------------------------
INSERT INTO `oa_department` VALUES ('0956d8c279274fca92f4091f2a69a9ad', '销售会计', 'xiaokuai', '05896', 'd41af567914a409893d011aa53eda797', '', '', '', '', '');
INSERT INTO `oa_department` VALUES ('3e7227e11dc14b4d9e863dd1a1fcedf6', '成本会计', 'chengb', '03656', 'd41af567914a409893d011aa53eda797', '', '', '', '', '');
INSERT INTO `oa_department` VALUES ('43196481371d4edf9ebe3f1ef3346ca2', '萨芬的', 'asd', '322332', '0', '323232', '232', '3232323232', '232332', '323232');
INSERT INTO `oa_department` VALUES ('5cccdb7c432449d8b853c52880058140', 'B公司', 'b', '002', '0', '冶铁', '李四', '112', '冶铁', '河北');
INSERT INTO `oa_department` VALUES ('83a25761c618457cae2fa1211bd8696d', '销售B组', 'xiaob', '002365', 'cbbc84eddde947ba8af7d509e430eb70', '', '李四', '', '', '');
INSERT INTO `oa_department` VALUES ('8f8b045470f342fdbc4c312ab881d62b', '销售A组', 'xiaoA', '0326', 'cbbc84eddde947ba8af7d509e430eb70', '', '张三', '0201212', '', '');
INSERT INTO `oa_department` VALUES ('a0982dea52554225ab682cd4b421de47', '1队', 'yidui', '02563', '8f8b045470f342fdbc4c312ab881d62b', '', '小王', '12356989', '', '');
INSERT INTO `oa_department` VALUES ('a3907c8580bb4824b62744219faa49f9', 'sadf', 'asdfasdf', 'asdfas', '0', '32232332', 'asdfasdf', '322323', '32323', '232323');
INSERT INTO `oa_department` VALUES ('a6c6695217ba4a4dbfe9f7e9d2c06730', 'A公司', 'a', '001', '0', '挖煤', '张三', '110', '洼煤矿', '山西');
INSERT INTO `oa_department` VALUES ('cbbc84eddde947ba8af7d509e430eb70', '销售部', 'xiaoshoubu', '00201', '5cccdb7c432449d8b853c52880058140', '推销商品', '小明', '11236', '推销商品', '909办公室');
INSERT INTO `oa_department` VALUES ('d41af567914a409893d011aa53eda797', '财务部', 'caiwubu', '00101', 'a6c6695217ba4a4dbfe9f7e9d2c06730', '负责发工资', '王武', '11236', '管理财务', '308办公室');

-- ----------------------------
-- Table structure for oa_fhfile
-- ----------------------------
DROP TABLE IF EXISTS `oa_fhfile`;
CREATE TABLE `oa_fhfile`  (
  `FHFILE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `FILEPATH` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `CTIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传时间',
  `BZ` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `USERNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '长传者',
  `DEPARTMENT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门ID',
  `FILESIZE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件大小',
  PRIMARY KEY (`FHFILE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_fhfile
-- ----------------------------
INSERT INTO `oa_fhfile` VALUES ('315ca5f8a0b642d0a5e67bf80289469f', '3', '2017092409452826393.xlsx', '2017-09-24 21:45:28', '3', 'admin', '0', '0.0');
INSERT INTO `oa_fhfile` VALUES ('a72da452434a4856b771b58dc13348b6', '33', '2017092409431277394.xlsx', '2017-09-24 21:43:12', '23', 'admin', '0', '0.0');

-- ----------------------------
-- Table structure for oa_staff
-- ----------------------------
DROP TABLE IF EXISTS `oa_staff`;
CREATE TABLE `oa_staff`  (
  `STAFF_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `NAME_EN` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `DEPARTMENT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门',
  `FUNCTIONS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职责',
  `TEL` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `EMAIL` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `SEX` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `BIRTHDAY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出生日期',
  `NATION` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '民族',
  `JOBTYPE` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位类别',
  `JOBJOINTIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参加工作时间',
  `FADDRESS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '籍贯',
  `POLITICAL` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '政治面貌',
  `PJOINTIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入团时间',
  `SFID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `MARITAL` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '婚姻状况',
  `DJOINTIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '进本单位时间',
  `POST` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '现岗位',
  `POJOINTIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上岗时间',
  `EDUCATION` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历',
  `SCHOOL` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '毕业学校',
  `MAJOR` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业',
  `FTITLE` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职称',
  `CERTIFICATE` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业资格证',
  `CONTRACTLENGTH` int(2) NOT NULL COMMENT '劳动合同时长',
  `CSTARTTIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签订日期',
  `CENDTIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '终止日期',
  `ADDRESS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '现住址',
  `USER_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定账号ID',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`STAFF_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_staff
-- ----------------------------
INSERT INTO `oa_staff` VALUES ('4d70e7aa68b04941a8187c2be871bf8f', 'liwei', 'asdfas', '0002', '5cccdb7c432449d8b853c52880058140', 'asdfasdf', '15985255468', 'asdf', '男', '2017-08-17', '汉族', 'asdf', '2017-08-23', 'asdf', 'asdf ', '2017-08-01', '513022198510200756', '已婚', '2017-08-14', 'asdf', '2017-08-21', 'asdf', 'asdf', 'asdf', 'asdf', 'asdf', 3, '2017-08-30', '2017-08-21', 'asdf', '', 'asdfasdfasdf');
INSERT INTO `oa_staff` VALUES ('9fd17463ffd7487ab90e683c76026655', 'www', 'www', 'ww', '5cccdb7c432449d8b853c52880058140', 'ww', 'ww', 'www', '男', '2016-04-27', 'ww', 'ww', '2016-05-03', 'ww', 'ww', '2016-04-25', 'ww', '未婚', '2016-05-09', 'ww', '2016-05-17', 'w', 'w', 'w', 'w', 'www', 2, '2016-05-23', '2016-05-16', 'w', 'san', 'www');
INSERT INTO `oa_staff` VALUES ('c9f05f925dfc485b9e352916612ab669', 'fw', 'y', 'y', '8f8b045470f342fdbc4c312ab881d62b', 'y', 'y', 'y', '男', '2016-06-08', 'y', 'y', '2016-06-03', 'y', 'y', '2016-05-31', 'y', '已婚', '2016-06-07', 'y', '2016-06-08', 'y', 'y', 'y', 'y', 'y', 4, '2016-06-21', '2016-06-21', 'y', 'lisi', 'y');

-- ----------------------------
-- Table structure for sys_createcode
-- ----------------------------
DROP TABLE IF EXISTS `sys_createcode`;
CREATE TABLE `sys_createcode`  (
  `CREATECODE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PACKAGENAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `OBJECTNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类名',
  `TABLENAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `FIELDLIST` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性集',
  `CREATETIME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `TITLE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `FHTYPE` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CREATECODE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_createcode
-- ----------------------------
INSERT INTO `sys_createcode` VALUES ('002ea762e3e242a7a10ea5ca633701d8', 'system', 'Buttonrights', 'sys_,fh,BUTTONRIGHTS', 'NAME,fh,String,fh,名称,fh,是,fh,无,fh,255Q313596790', '2016-01-16 23:20:36', '按钮权限', 'single');
INSERT INTO `sys_createcode` VALUES ('043843a286f84549ad3fa71aac827f6f', 'system', 'FHlog', 'SYS_,fh,FHLOG', 'USERNAME,fh,String,fh,用户名,fh,是,fh,无,fh,100,fh,0Q313596790CZTIME,fh,Date,fh,操作时间,fh,否,fh,无,fh,32,fh,0Q313596790CONTENT,fh,String,fh,事件,fh,是,fh,无,fh,255,fh,0Q313596790', '2016-05-10 21:10:16', '操作日志记录', 'single');
INSERT INTO `sys_createcode` VALUES ('0ee023606efb45b9a3baaa072e502161', 'information', 'FtestMx', 'FH_,fh,FTESTMX', 'TITLE,fh,String,fh,标题,fh,是,fh,无,fh,255,fh,0Q313596790CHANGDU,fh,Integer,fh,长度,fh,是,fh,无,fh,11,fh,0Q313596790', '2016-04-21 01:52:11', '主表测试(明细)', 'sontable');
INSERT INTO `sys_createcode` VALUES ('1be959583e82473b82f6e62087bd0d38', 'information', 'Attached', 'TB_,fh,ATTACHED', 'NAME,fh,String,fh,NAME,fh,是,fh,无,fh,255,fh,0Q313596790FDESCRIBE,fh,String,fh,FDESCRIBE,fh,是,fh,无,fh,255,fh,0Q313596790PRICE,fh,Double,fh,PRICE,fh,是,fh,无,fh,11,fh,2Q313596790CTIME,fh,Date,fh,CTIME,fh,否,fh,无,fh,32,fh,0Q313596790', '2016-04-21 17:07:59', '主表测试', 'fathertable');
INSERT INTO `sys_createcode` VALUES ('3da8e8bd757c44148d89931a54d29c88', 'system', 'UserPhoto', 'SYS_,fh,USERPHOTO', 'USERNAME,fh,String,fh,用户名,fh,否,fh,无,fh,30,fh,0Q313596790PHOTO0,fh,String,fh,原图,fh,否,fh,无,fh,100,fh,0Q313596790PHOTO1,fh,String,fh,头像1,fh,否,fh,无,fh,100,fh,0Q313596790PHOTO2,fh,String,fh,头像2,fh,否,fh,无,fh,100,fh,0Q313596790PHOTO3,fh,String,fh,头像3,fh,否,fh,无,fh,100,fh,0Q313596790', '2016-06-05 17:54:25', '用户头像', 'single');
INSERT INTO `sys_createcode` VALUES ('4173a8c56a504dd6b6213d2b9cd3e91b', 'information', 'AttachedMx', 'TB_,fh,ATTACHEDMX', 'NAME,fh,String,fh,NAME,fh,是,fh,无,fh,255,fh,0Q313596790TITLE,fh,String,fh,TITLE,fh,是,fh,无,fh,255,fh,0Q313596790CTIME,fh,Date,fh,CTIME,fh,否,fh,无,fh,32,fh,0Q313596790PRICE,fh,Double,fh,PRICE,fh,是,fh,无,fh,11,fh,2Q313596790', '2016-04-21 17:09:40', '主表测试(明细)', 'sontable');
INSERT INTO `sys_createcode` VALUES ('41e07fb03763434daef41cd99d0406c3', 'system', 'LogInImg', 'SYS_,fh,LOGINIMG', 'NAME,fh,String,fh,文件名,fh,是,fh,无,fh,30,fh,0Q313596790FILEPATH,fh,String,fh,路径,fh,是,fh,无,fh,100,fh,0Q313596790TYPE,fh,Integer,fh,状态,fh,是,fh,无,fh,2,fh,0Q313596790FORDER,fh,Integer,fh,排序,fh,是,fh,无,fh,3,fh,0Q313596790', '2016-06-03 17:53:22', '登录页面背景图片', 'single');
INSERT INTO `sys_createcode` VALUES ('49d985e081ed44e6b34ba1b8c5466e39', 'fhdb', 'TimingBackUp', 'DB_,fh,TIMINGBACKUP', 'JOBNAME,fh,String,fh,任务名称,fh,否,fh,无,fh,50Q313596790CREATE_TIME,fh,Date,fh,创建时间,fh,否,fh,无,fh,32Q313596790TABLENAME,fh,String,fh,表名,fh,是,fh,无,fh,50Q313596790TYPE,fh,Integer,fh,类型,fh,否,fh,无,fh,1Q313596790FHTIME,fh,String,fh,时间规则,fh,是,fh,无,fh,30Q313596790TIMEEXPLAIN,fh,String,fh,规则说明,fh,是,fh,无,fh,100Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255Q313596790', '2016-04-09 11:53:38', '定时备份', 'single');
INSERT INTO `sys_createcode` VALUES ('4def60c58aa148b7998270978660ef30', 'fhoa', 'Fhfile', 'OA_,fh,FHFILE', 'NAME,fh,String,fh,文件名,fh,是,fh,无,fh,30,fh,0Q313596790FILEPATH,fh,String,fh,路径,fh,是,fh,无,fh,100,fh,0Q313596790CTIME,fh,Date,fh,上传时间,fh,否,fh,无,fh,32,fh,0Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,100,fh,0Q313596790USERNAME,fh,String,fh,长传者,fh,否,fh,无,fh,50,fh,0Q313596790DEPARTMENT_ID,fh,String,fh,部门ID,fh,否,fh,无,fh,100,fh,0Q313596790FILESIZE,fh,String,fh,文件大小,fh,否,fh,无,fh,10,fh,0Q313596790', '2016-05-27 20:52:01', '文件管理', 'single');
INSERT INTO `sys_createcode` VALUES ('6171984f03a34d9c94a3492ba819e4ff', 'pdt', 'Product', 'PRODUCT,fh,PRODUCT', 'PDT_ID,fh,Integer,fh,备注1,fh,是,fh,无,fh,33,fh,0Q313596790PDT_TITLE,fh,String,fh,备注2,fh,是,fh,无,fh,50,fh,0Q313596790PDT_SC_PRICE,fh,Integer,fh,备注3,fh,是,fh,无,fh,10,fh,0Q313596790PDT_MY_PRICE,fh,Integer,fh,备注4,fh,是,fh,无,fh,10,fh,0Q313596790PDT_MIN_IMG,fh,String,fh,备注5,fh,是,fh,无,fh,150,fh,0Q313596790PDT_MSG,fh,String,fh,备注6,fh,是,fh,无,fh,21845,fh,0Q313596790PDT_TYPE_ID,fh,Integer,fh,备注7,fh,是,fh,无,fh,22,fh,0Q313596790PDT_BANNER_ID,fh,Integer,fh,备注8,fh,是,fh,无,fh,22,fh,0Q313596790PDT_IMG_LIST,fh,String,fh,备注9,fh,是,fh,无,fh,21845,fh,0Q313596790PDT_CREATED,fh,Date,fh,备注10,fh,是,fh,无,fh,19,fh,0Q313596790PDT_UPDATED,fh,Date,fh,备注11,fh,是,fh,无,fh,19,fh,0Q313596790', '2017-07-31 21:21:36', '商品操作模块', 'single');
INSERT INTO `sys_createcode` VALUES ('6988981a2e5c4ad3988abf4c9a30ab68', 'banner', 'Banner', 'TB_BANNER,fh,BANNER', 'BANNER_NAME,fh,String,fh,品牌名称,fh,是,fh,无,fh,50,fh,0Q313596790BANNER_IMG,fh,String,fh,品牌图片,fh,是,fh,无,fh,150,fh,0Q313596790', '2017-07-31 19:17:28', '商品品牌', 'single');
INSERT INTO `sys_createcode` VALUES ('91af9fe509704fa68f6bca121359e3ec', 'fhoa', 'Staff', 'OA_,fh,STAFF', 'NAME,fh,String,fh,姓名,fh,是,fh,无,fh,50,fh,0Q313596790NAME_EN,fh,String,fh,英文,fh,是,fh,无,fh,50,fh,0Q313596790BIANMA,fh,String,fh,编码,fh,是,fh,无,fh,100,fh,0Q313596790DEPARTMENT_ID,fh,String,fh,部门,fh,是,fh,无,fh,100,fh,0Q313596790FUNCTIONS,fh,String,fh,职责,fh,是,fh,无,fh,255,fh,0Q313596790TEL,fh,String,fh,电话,fh,是,fh,无,fh,20,fh,0Q313596790EMAIL,fh,String,fh,邮箱,fh,是,fh,无,fh,50,fh,0Q313596790SEX,fh,String,fh,性别,fh,是,fh,无,fh,10,fh,0Q313596790BIRTHDAY,fh,Date,fh,出生日期,fh,是,fh,无,fh,32,fh,0Q313596790NATION,fh,String,fh,民族,fh,是,fh,无,fh,10,fh,0Q313596790JOBTYPE,fh,String,fh,岗位类别,fh,是,fh,无,fh,30,fh,0Q313596790JOBJOINTIME,fh,Date,fh,参加工作时间,fh,是,fh,无,fh,32,fh,0Q313596790FADDRESS,fh,String,fh,籍贯,fh,是,fh,无,fh,100,fh,0Q313596790POLITICAL,fh,String,fh,政治面貌,fh,是,fh,无,fh,30,fh,0Q313596790PJOINTIME,fh,Date,fh,入团时间,fh,是,fh,无,fh,32,fh,0Q313596790SFID,fh,String,fh,身份证号,fh,是,fh,无,fh,20,fh,0Q313596790MARITAL,fh,String,fh,婚姻状况,fh,是,fh,无,fh,10,fh,0Q313596790DJOINTIME,fh,Date,fh,进本单位时间,fh,是,fh,无,fh,32,fh,0Q313596790POST,fh,String,fh,现岗位,fh,是,fh,无,fh,30,fh,0Q313596790POJOINTIME,fh,Date,fh,上岗时间,fh,是,fh,无,fh,32,fh,0Q313596790EDUCATION,fh,String,fh,学历,fh,是,fh,无,fh,10,fh,0Q313596790SCHOOL,fh,String,fh,毕业学校,fh,是,fh,无,fh,30,fh,0Q313596790MAJOR,fh,String,fh,专业,fh,是,fh,无,fh,30,fh,0Q313596790FTITLE,fh,String,fh,职称,fh,是,fh,无,fh,30,fh,0Q313596790CERTIFICATE,fh,String,fh,职业资格证,fh,是,fh,无,fh,30,fh,0Q313596790CONTRACTLENGTH,fh,Integer,fh,劳动合同时长,fh,是,fh,无,fh,2,fh,0Q313596790CSTARTTIME,fh,Date,fh,签订日期,fh,是,fh,无,fh,32,fh,0Q313596790CENDTIME,fh,Date,fh,终止日期,fh,是,fh,无,fh,32,fh,0Q313596790ADDRESS,fh,String,fh,现住址,fh,是,fh,无,fh,100,fh,0Q313596790USER_ID,fh,String,fh,绑定账号ID,fh,否,fh,无,fh,100,fh,0Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255,fh,0Q313596790', '2016-04-23 20:44:31', '员工管理', 'single');
INSERT INTO `sys_createcode` VALUES ('aabd0f7054b14028b9d094586756dfa7', 'pdt', 'Product', ',fh,PRODUCT', 'PDT_ID,fh,Integer,fh,备注1,fh,是,fh,无,fh,33,fh,0Q313596790PDT_TITLE,fh,String,fh,备注2,fh,是,fh,无,fh,50,fh,0Q313596790PDT_SC_PRICE,fh,Integer,fh,备注3,fh,是,fh,无,fh,10,fh,0Q313596790PDT_MY_PRICE,fh,Integer,fh,备注4,fh,是,fh,无,fh,10,fh,0Q313596790PDT_MIN_IMG,fh,String,fh,备注5,fh,是,fh,无,fh,150,fh,0Q313596790PDT_MSG,fh,String,fh,备注6,fh,是,fh,无,fh,21845,fh,0Q313596790PDT_TYPE_ID,fh,Integer,fh,备注7,fh,是,fh,无,fh,22,fh,0Q313596790PDT_BANNER_ID,fh,Integer,fh,备注8,fh,是,fh,无,fh,22,fh,0Q313596790PDT_IMG_LIST,fh,String,fh,备注9,fh,是,fh,无,fh,21845,fh,0Q313596790PDT_CREATED,fh,Date,fh,备注10,fh,是,fh,无,fh,19,fh,0Q313596790PDT_UPDATED,fh,Date,fh,备注11,fh,是,fh,无,fh,19,fh,0Q313596790', '2017-07-31 19:48:13', '商品操作模块', 'fathertable');
INSERT INTO `sys_createcode` VALUES ('ae92803163ff44539e91711cfbe35411', 'fhoa', 'Datajur', 'OA_,fh,DATAJUR', 'DEPARTMENT_IDS,fh,String,fh,部门ID组合,fh,否,fh,无,fh,5000,fh,0Q313596790STAFF_ID,fh,String,fh,员工ID,fh,否,fh,无,fh,100,fh,0Q313596790DEPARTMENT_ID,fh,String,fh,部门ID,fh,是,fh,无,fh,100,fh,0Q313596790', '2016-04-27 03:49:39', '数据权限表', 'single');
INSERT INTO `sys_createcode` VALUES ('bf35ab8b2d064bf7928a04bba5e5a6dd', 'system', 'Fhsms', 'SYS_,fh,FHSMS', 'CONTENT,fh,String,fh,内容,fh,是,fh,无,fh,1000Q313596790TYPE,fh,String,fh,类型,fh,否,fh,无,fh,5Q313596790TO_USERNAME,fh,String,fh,收信人,fh,是,fh,无,fh,255Q313596790FROM_USERNAME,fh,String,fh,发信人,fh,是,fh,无,fh,255Q313596790SEND_TIME,fh,String,fh,发信时间,fh,是,fh,无,fh,100Q313596790STATUS,fh,String,fh,状态,fh,否,fh,无,fh,5Q313596790SANME_ID,fh,String,fh,共同ID,fh,是,fh,无,fh,100Q313596790', '2016-03-27 21:39:45', '站内信', 'single');
INSERT INTO `sys_createcode` VALUES ('c7586f931fd44c61beccd3248774c68c', 'system', 'Department', 'SYS_,fh,DEPARTMENT', 'NAME,fh,String,fh,名称,fh,是,fh,无,fh,30Q313596790NAME_EN,fh,String,fh,英文,fh,是,fh,无,fh,50Q313596790BIANMA,fh,String,fh,编码,fh,是,fh,无,fh,50Q313596790PARENT_ID,fh,String,fh,上级ID,fh,否,fh,无,fh,100Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255Q313596790HEADMAN,fh,String,fh,负责人,fh,是,fh,无,fh,30Q313596790TEL,fh,String,fh,电话,fh,是,fh,无,fh,50Q313596790FUNCTIONS,fh,String,fh,部门职能,fh,是,fh,无,fh,255Q313596790ADDRESS,fh,String,fh,地址,fh,是,fh,无,fh,255Q313596790', '2015-12-20 01:49:25', '组织机构', 'tree');
INSERT INTO `sys_createcode` VALUES ('c937e21208914e5b8fb1202c685bbf2f', 'fhdb', 'Fhdb', 'DB_,fh,FHDB', 'USERNAME,fh,String,fh,操作用户,fh,否,fh,无,fh,50Q313596790BACKUP_TIME,fh,Date,fh,备份时间,fh,否,fh,无,fh,32Q313596790TABLENAME,fh,String,fh,表名,fh,是,fh,无,fh,50Q313596790SQLPATH,fh,String,fh,存储位置,fh,否,fh,无,fh,300Q313596790TYPE,fh,Integer,fh,类型,fh,是,fh,无,fh,1Q313596790DBSIZE,fh,String,fh,文件大小,fh,否,fh,无,fh,10Q313596790BZ,fh,String,fh,备注,fh,否,fh,无,fh,255Q313596790', '2016-03-30 13:46:54', '数据库管理', 'single');
INSERT INTO `sys_createcode` VALUES ('dd143deaf19b4d089e110167fee1a939', 'product', 'Product', 'TB_PRODUCT,fh,PRODUCT', 'PDT_TITLE,fh,String,fh,商品名称,fh,是,fh,无,fh,100,fh,0Q313596790PDT_NO,fh,String,fh,商品编号,fh,是,fh,无,fh,100,fh,0Q313596790PDT_BRAND,fh,Integer,fh,商品品牌,fh,否,fh,1,fh,5,fh,0Q313596790PDT_MIN_IMG,fh,String,fh,商品小图,fh,是,fh,无,fh,150,fh,0Q313596790PDT_DETAIL,fh,String,fh,商品详情,fh,是,fh,无,fh,500,fh,0Q313596790PDT_SC_PRICE,fh,Integer,fh,商品市场价,fh,是,fh,无,fh,11,fh,0Q313596790PDT_MY_PRICE,fh,Integer,fh,我们的价格,fh,是,fh,无,fh,11,fh,0Q313596790PDT_TAG,fh,String,fh,商品标签,fh,是,fh,无,fh,50,fh,0Q313596790PDT_TYPE,fh,Integer,fh,商品类别,fh,否,fh,0,fh,5,fh,0Q313596790PDT_CREATED,fh,Date,fh,发布时间,fh,是,fh,无,fh,32,fh,0Q313596790PDT_UPDATED,fh,Date,fh,更新时间,fh,是,fh,无,fh,32,fh,0Q313596790', '2017-07-31 19:14:47', '商品管理', 'fathertable');
INSERT INTO `sys_createcode` VALUES ('fbc700144f94493ca07623066db0c802', 'type', 'TYPE', 'TB_TYPE,fh,TYPE', 'TYEP_NAME,fh,String,fh,类别名称,fh,是,fh,无,fh,50,fh,0Q313596790TYPE_PARENT_ID,fh,Integer,fh,商品父类id,fh,否,fh,0,fh,11,fh,0Q313596790TYPE_CHILD_ID,fh,Integer,fh,子类id,fh,是,fh,无,fh,5,fh,0Q313596790', '2017-07-31 19:13:24', '商品类别', 'tree');
INSERT INTO `sys_createcode` VALUES ('fe239f8742194481a5b56f90cad71520', 'system', 'Fhbutton', 'SYS_,fh,FHBUTTON', 'NAME,fh,String,fh,名称,fh,是,fh,无,fh,30Q313596790QX_NAME,fh,String,fh,权限标识,fh,是,fh,无,fh,50Q313596790BZ,fh,String,fh,备注,fh,是,fh,无,fh,255Q313596790', '2016-01-15 18:38:40', '按钮管理', 'single');
INSERT INTO `sys_createcode` VALUES ('ff6e6cdc87ba42579b033cf4925d4d70', 'dst', 'DataSource2', 'DS_,fh,DATASOURCE2', 'TITLE,fh,String,fh,标题,fh,是,fh,无,fh,100,fh,0Q313596790CONTENT,fh,String,fh,内容,fh,是,fh,无,fh,255,fh,0Q313596790', '2016-05-23 15:51:46', '第2数据源例子', 'single');

-- ----------------------------
-- Table structure for sys_dictionaries
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionaries`;
CREATE TABLE `sys_dictionaries`  (
  `DICTIONARIES_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `NAME_EN` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `ORDER_BY` int(11) NOT NULL COMMENT '排序',
  `PARENT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级ID',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `TBSNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排查表',
  PRIMARY KEY (`DICTIONARIES_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dictionaries
-- ----------------------------
INSERT INTO `sys_dictionaries` VALUES ('00ef925d227444859eef2057693722ae', '达州', 'dazhou', '0032504', 4, 'd3538add7125404aba4b0007ef9fde50', '达州市', '');
INSERT INTO `sys_dictionaries` VALUES ('010692054ac24eeebf5b8067f0f0521a', '安庆', 'anqing', '0030401', 1, '249999f296d14f95b8138a30bbb2c374', '安庆市', '');
INSERT INTO `sys_dictionaries` VALUES ('023473e9e6204583a110531036357514', '山西', 'shanxi', '00323', 23, '1', '山西省', '');
INSERT INTO `sys_dictionaries` VALUES ('02e5eb8f50bd4824ad97427e2b372d14', '绥化', 'suihua', '0031312', 12, 'b2d4133b5dbf4599ada940620d2ab250', '绥化市', '');
INSERT INTO `sys_dictionaries` VALUES ('035fe989f54742ac8b64b80b24213442', '来宾', 'laibin', '0030809', 9, 'c5f3d426c582410281f89f1451e1d854', '来宾市', '');
INSERT INTO `sys_dictionaries` VALUES ('055273fe79f94e09a64698dab8d30ea8', '揭阳', 'jieyang', '0030708', 8, '0dd1f40bcb9d46aeba015dc19645a5b9', '揭阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('05ab2921b64d4f5c935c35228cc49ecb', '大同', 'datong', '0032302', 2, '023473e9e6204583a110531036357514', '大同市', '');
INSERT INTO `sys_dictionaries` VALUES ('05ed855479d94b139c77ae82452bb39c', '涪陵区', 'fulingqu', '0033102', 2, '1c85fbd06cf840d093f3640aca1b6b2d', '涪陵区', '');
INSERT INTO `sys_dictionaries` VALUES ('076995f7d0034b32a94e0130d406d137', '湖州', 'huzhou', '0033002', 2, '6d846178376549ed878d11d109819f25', '湖州市', '');
INSERT INTO `sys_dictionaries` VALUES ('076a163af6814f93954a543bd3b2fa4d', '广州', 'guangzhou', '0030704', 4, '0dd1f40bcb9d46aeba015dc19645a5b9', '广州市', '');
INSERT INTO `sys_dictionaries` VALUES ('085ebd2776384eff842de8b61b781a7e', '潼南区', 'tongnanqu', '0033122', 22, '1c85fbd06cf840d093f3640aca1b6b2d', '潼南区', '');
INSERT INTO `sys_dictionaries` VALUES ('0953fe05e34642169c4cf24492b163b9', '湘西', 'xiangxi', '0031514', 14, 'c59f91630bef4289b71fcb2a48994582', '湘西市', '');
INSERT INTO `sys_dictionaries` VALUES ('098bf5e3603e44889a2c4bb25e350400', '阿坝', 'a\'ba', '0032501', 1, 'd3538add7125404aba4b0007ef9fde50', '阿坝市', '');
INSERT INTO `sys_dictionaries` VALUES ('0a2561ec256b4f46b4fa76c621256595', '鹤岗', 'hegang', '0031304', 4, 'b2d4133b5dbf4599ada940620d2ab250', '鹤岗市', '');
INSERT INTO `sys_dictionaries` VALUES ('0a65f2ef68d54b7c8772e1d916684c4a', '岳阳', 'yueyang', '0031506', 6, 'c59f91630bef4289b71fcb2a48994582', '岳阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('0a754e878c304b99bf5d34a82ca3705c', '吉林', 'jilin', '0031604', 4, '857be71b0d6d4a40a2c83476824206d1', '吉林市', '');
INSERT INTO `sys_dictionaries` VALUES ('0b08e52f2b264d0da66d37e718e32aba', '常德', 'changde', '0031507', 7, 'c59f91630bef4289b71fcb2a48994582', '常德市', '');
INSERT INTO `sys_dictionaries` VALUES ('0c908137935946ac885cb56e55ff4f5d', '北碚区', 'beibeiqu', '0033109', 9, '1c85fbd06cf840d093f3640aca1b6b2d', '北碚区', '');
INSERT INTO `sys_dictionaries` VALUES ('0dba32de24014bcab807fd0fc51953aa', '北海', 'beihai', '0030802', 2, 'c5f3d426c582410281f89f1451e1d854', '北海市', '');
INSERT INTO `sys_dictionaries` VALUES ('0dd1f40bcb9d46aeba015dc19645a5b9', '广东', 'guangdong', '00307', 7, '1', '广东省', '');
INSERT INTO `sys_dictionaries` VALUES ('0e18ab3edf5e43ee8737c156b0b50692', '吉安', 'ji\'an', '0031803', 3, 'cb3008cbd6ae4b5f8cebd2254ccb8603', '吉安市', '');
INSERT INTO `sys_dictionaries` VALUES ('0eb279a28a0d43c7a075d58c6cfc3e02', '长寿区', 'changshouqu', '0033115', 15, '1c85fbd06cf840d093f3640aca1b6b2d', '长寿区', '');
INSERT INTO `sys_dictionaries` VALUES ('0efda23d751b42cb9472ca4f80cdf6c5', '德州', 'dezhou', '0030303', 3, '10f46a521ea0471f8d71ee75ac3b5f3a', '德州市', '');
INSERT INTO `sys_dictionaries` VALUES ('0f975f2f51e245439b7d759f822a4a43', '嘉定区', 'jiadingqu', '0030210', 10, 'f1ea30ddef1340609c35c88fb2919bee', '嘉定区', '');
INSERT INTO `sys_dictionaries` VALUES ('1', '地区', 'diqu', '003', 3, '0', '地区', '');
INSERT INTO `sys_dictionaries` VALUES ('10a2b2b54bce432baf603c7fa4b45de0', '淮北', 'huaibei', '0030409', 9, '249999f296d14f95b8138a30bbb2c374', '淮北市', '');
INSERT INTO `sys_dictionaries` VALUES ('10c14cd82df9496bb86c5681ddfb92fb', '本溪', 'benxi', '0031902', 2, 'b3366626c66c4b61881f09e1722e8495', '本溪市', '');
INSERT INTO `sys_dictionaries` VALUES ('10f46a521ea0471f8d71ee75ac3b5f3a', '山东', 'shandong', '00303', 3, '1', '山东省', '');
INSERT INTO `sys_dictionaries` VALUES ('10f5278b19824877988e8baa5a1b58f4', '邯郸', 'handan', '0031104', 4, '75362368f22f4d60a810c2a45cced487', '邯郸市', '');
INSERT INTO `sys_dictionaries` VALUES ('11ab8df614c14451bb08a91fbe05162e', '防城港', 'fangchenggang', '0030804', 4, 'c5f3d426c582410281f89f1451e1d854', '防城港市', '');
INSERT INTO `sys_dictionaries` VALUES ('12a62a3e5bed44bba0412b7e6b733c93', '北京', 'beijing', '00301', 1, '1', '北京', '');
INSERT INTO `sys_dictionaries` VALUES ('13b4d440cdd043378c2bbd0b797bc7b7', '黄石', 'huangshi', '0031404', 4, '312b80775e104ba08c8244a042a658df', '黄石市', '');
INSERT INTO `sys_dictionaries` VALUES ('13e9e380abed4def837bea1671b92633', '大兴安岭', 'daxinganling', '0031302', 2, 'b2d4133b5dbf4599ada940620d2ab250', '大兴安岭市', '');
INSERT INTO `sys_dictionaries` VALUES ('14452abafbef4cadbb05a5a74a61eb6f', '广安', 'guang\'an', '0032507', 7, 'd3538add7125404aba4b0007ef9fde50', '广安市', '');
INSERT INTO `sys_dictionaries` VALUES ('158588bf48464dcca0e656968b8e09c0', '密云区', 'miyunqu', '0030115', 15, '12a62a3e5bed44bba0412b7e6b733c93', '密云区', '');
INSERT INTO `sys_dictionaries` VALUES ('159d49075827476490aee58956fb159c', '潜江', 'qianjiang', '0031406', 6, '312b80775e104ba08c8244a042a658df', '潜江市', '');
INSERT INTO `sys_dictionaries` VALUES ('15da226f465b4dac95c8333fd3d81747', '淮安', 'huaian', '0031702', 2, '577405ff648240959b3765c950598ab0', '淮安市', '');
INSERT INTO `sys_dictionaries` VALUES ('16535e38a2534f4781353e7570831ea1', '丽江', 'lijiang', '0032909', 9, '510607a1836e4079b3103e14ec5864ed', '丽江', '');
INSERT INTO `sys_dictionaries` VALUES ('165fd1c02d98439d8d7cc2e81def88d6', '陇南', 'longnan', '0030609', 9, '3283f1a77180495f9a0b192d0f9cdd35', '陇南市', '');
INSERT INTO `sys_dictionaries` VALUES ('16a1eb63489e4d28827fc16a90e2ed61', '贵港', 'guigang', '0030805', 5, 'c5f3d426c582410281f89f1451e1d854', '贵港市', '');
INSERT INTO `sys_dictionaries` VALUES ('1895a514cda74329817bce6a5fe918f4', '济源', 'jiyuan', '0031203', 3, '7336944efb4b40fcae9118fc9a970d2d', '济源市', '');
INSERT INTO `sys_dictionaries` VALUES ('1929f99821f2484fa33991233c1555e9', '大理', 'dali', '0032904', 4, '510607a1836e4079b3103e14ec5864ed', '大理', '');
INSERT INTO `sys_dictionaries` VALUES ('192a36eb3d234a909e339c06b9cf723a', '许昌', 'xuchang', '0031215', 15, '7336944efb4b40fcae9118fc9a970d2d', '许昌市', '');
INSERT INTO `sys_dictionaries` VALUES ('19cf8222eac9457280ebb40f14052590', '南岸区', 'nan\'anqu', '0033108', 8, '1c85fbd06cf840d093f3640aca1b6b2d', '南岸区', '');
INSERT INTO `sys_dictionaries` VALUES ('1a99e7e302ce4f24b4b5d5d4b20a75fe', '清远', 'qingyuan', '0030711', 11, '0dd1f40bcb9d46aeba015dc19645a5b9', '清远市', '');
INSERT INTO `sys_dictionaries` VALUES ('1ac809034f3d471592a5c74e19c7f1bc', '烟台', 'yantai', '0030315', 15, '10f46a521ea0471f8d71ee75ac3b5f3a', '烟台市', '');
INSERT INTO `sys_dictionaries` VALUES ('1b65dd2a2057489c9598c789b4114d24', '孝感', 'xiaogan', '0031415', 15, '312b80775e104ba08c8244a042a658df', '孝感市', '');
INSERT INTO `sys_dictionaries` VALUES ('1b79421601744059a4ef6b0ca9be32f9', '上学期', 'shangxueqi', '0010101', 1, '5b1905ef82bf48039a96cd5dd1d8da10', '上学期', '');
INSERT INTO `sys_dictionaries` VALUES ('1b8b44f0c4384a09987ab0c5d9ceedd2', '神农架林区', 'shennongjialinqu', '0031407', 7, '312b80775e104ba08c8244a042a658df', '神农架林区', '');
INSERT INTO `sys_dictionaries` VALUES ('1c4313525bdc4d4b9f7849dfb614cfb3', '柳州', 'liuzhou', '0030810', 10, 'c5f3d426c582410281f89f1451e1d854', '柳州市', '');
INSERT INTO `sys_dictionaries` VALUES ('1c85fbd06cf840d093f3640aca1b6b2d', '重庆', 'chongqing', '00331', 31, '1', '重庆', '');
INSERT INTO `sys_dictionaries` VALUES ('1cf92384c7ee46faa91acface462b32f', '沧州', 'cangzhou', '0031102', 2, '75362368f22f4d60a810c2a45cced487', '沧州市', '');
INSERT INTO `sys_dictionaries` VALUES ('1d0deff7da2745cc960cfa9ae07bdd13', '抚顺', 'fushun', '0031906', 6, 'b3366626c66c4b61881f09e1722e8495', '抚顺市', '');
INSERT INTO `sys_dictionaries` VALUES ('1d6d2d9af05849da9807d4cba0144695', '南通', 'nantong', '0031705', 5, '577405ff648240959b3765c950598ab0', '南通市', '');
INSERT INTO `sys_dictionaries` VALUES ('1e228d052ec24bb7ba64524f51689cef', '鄂尔多斯', 'eerduosi', '0032005', 5, 'c072c248c7ab47dda7bf24f5e577925c', '鄂尔多斯市', '');
INSERT INTO `sys_dictionaries` VALUES ('1e429ce404794a30aad09bc592d0f5ce', '荆门', 'jingmen', '0031405', 5, '312b80775e104ba08c8244a042a658df', '荆门市', '');
INSERT INTO `sys_dictionaries` VALUES ('1e89ca839dbf46a3bc8c02b7d55802c5', '长沙', 'changsha', '0031501', 1, 'c59f91630bef4289b71fcb2a48994582', '长沙市', '');
INSERT INTO `sys_dictionaries` VALUES ('2087851693514e3c9c98fd843fb5b32c', '河西区', 'hexiqu', '0032603', 3, '2c254799d3454f2cbc338ef5712548e9', '河西区', '');
INSERT INTO `sys_dictionaries` VALUES ('20a08ca32856488dad122529f901fb9b', '固原', 'guyuan', '0032101', 1, '5690b0534fe745e5ba0f504f0c260559', '固原市', '');
INSERT INTO `sys_dictionaries` VALUES ('20f6d6c3b3234c21b52755ab6b690ffe', '杭州', 'hangzhou', '0033001', 1, '6d846178376549ed878d11d109819f25', '杭州市', '');
INSERT INTO `sys_dictionaries` VALUES ('212dbe5474304ad8b5f6e6049a72da46', '包头', 'baotou', '0032003', 3, 'c072c248c7ab47dda7bf24f5e577925c', '包头市', '');
INSERT INTO `sys_dictionaries` VALUES ('217c993dce9544c89279e88bdd60e7a8', '黄冈', 'huanggang', '0031403', 3, '312b80775e104ba08c8244a042a658df', '黄冈市', '');
INSERT INTO `sys_dictionaries` VALUES ('22ef24142b0a4d6e9f05582e3c8790a9', '济南', 'jinan', '0030301', 1, '10f46a521ea0471f8d71ee75ac3b5f3a', '济南市', '');
INSERT INTO `sys_dictionaries` VALUES ('2303cab27d704a259d7b0c42a687f3db', '马鞍山', 'maanshan', '0030413', 13, '249999f296d14f95b8138a30bbb2c374', '马鞍山市', '');
INSERT INTO `sys_dictionaries` VALUES ('23aff8da2e6c4513be3155f372c45046', '石嘴山', 'shizuishan', '0032103', 3, '5690b0534fe745e5ba0f504f0c260559', '石嘴山市', '');
INSERT INTO `sys_dictionaries` VALUES ('23caa037fe8c4283b7a7fc42da4a45a9', '武威', 'wuwei', '0030613', 13, '3283f1a77180495f9a0b192d0f9cdd35', '武威市', '');
INSERT INTO `sys_dictionaries` VALUES ('23f71d660bb94d239dde6738b73d3905', '延边', 'yanbian', '0031609', 9, '857be71b0d6d4a40a2c83476824206d1', '延边市', '');
INSERT INTO `sys_dictionaries` VALUES ('24007511f8ec42da8c6555305afe56ce', '青岛', 'qindao', '0030310', 10, '10f46a521ea0471f8d71ee75ac3b5f3a', '青岛市', '');
INSERT INTO `sys_dictionaries` VALUES ('2431e2f471624fd9bf0f76b7049b1296', '驻马店', 'zhumadian', '0031218', 18, '7336944efb4b40fcae9118fc9a970d2d', '驻马店市', '');
INSERT INTO `sys_dictionaries` VALUES ('244ffa16c2cd4594af2dfed2f7257d24', '德阳', 'deyang', '0032505', 5, 'd3538add7125404aba4b0007ef9fde50', '德阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('2477f3e5e2c94c73844b060d9dc82316', '深圳', 'shenzhen', '0030715', 15, '0dd1f40bcb9d46aeba015dc19645a5b9', '深圳市', '');
INSERT INTO `sys_dictionaries` VALUES ('249999f296d14f95b8138a30bbb2c374', '安徽', 'anhui', '00304', 4, '1', '安徽省', '');
INSERT INTO `sys_dictionaries` VALUES ('25892ce9cba1429fb1b45d4aaeaf3bca', '石家庄', 'shijiazhuang', '0031108', 8, '75362368f22f4d60a810c2a45cced487', '石家庄市', '');
INSERT INTO `sys_dictionaries` VALUES ('2627d3e9f98a4cdfbe0f59a4c5d3772a', '白银', 'baiyin', '0030601', 1, '3283f1a77180495f9a0b192d0f9cdd35', '白银市', '');
INSERT INTO `sys_dictionaries` VALUES ('26a79d023ad7483194241cddf97f3689', '莱芜', 'laiwu', '0030307', 7, '10f46a521ea0471f8d71ee75ac3b5f3a', '莱芜市', '');
INSERT INTO `sys_dictionaries` VALUES ('26b093ae7635474d8da8162efe7e4035', '合川区', 'hechuanqu', '0033117', 17, '1c85fbd06cf840d093f3640aca1b6b2d', '合川区', '');
INSERT INTO `sys_dictionaries` VALUES ('26d4e79797d34b11b58eb12e5c0c55ae', '抚州', 'fuzhou', '0031801', 1, 'cb3008cbd6ae4b5f8cebd2254ccb8603', '抚州市', '');
INSERT INTO `sys_dictionaries` VALUES ('273f2c545056473abaf320327073b48b', '无锡', 'wuxi', '0031709', 9, '577405ff648240959b3765c950598ab0', '无锡市', '');
INSERT INTO `sys_dictionaries` VALUES ('27927fbc83154894b096221da15b326a', '保定', 'baoding', '0031101', 1, '75362368f22f4d60a810c2a45cced487', '保定市', '');
INSERT INTO `sys_dictionaries` VALUES ('287baf1c903444359971b0ce8d58dce2', '普洱', 'pu\'er', '0032912', 12, '510607a1836e4079b3103e14ec5864ed', '普洱', '');
INSERT INTO `sys_dictionaries` VALUES ('29a4dbca082b49078af67caf5fd28f4f', '漳州', 'zhangzhou', '0030509', 9, 'd4066f6f425a4894a77f49f539f2a34f', '漳州市', '');
INSERT INTO `sys_dictionaries` VALUES ('2a4c3b9f024743d19907b36ab4a43499', '宣城', 'xuancheng', '0030417', 17, '249999f296d14f95b8138a30bbb2c374', '宣城市', '');
INSERT INTO `sys_dictionaries` VALUES ('2a4f0cb0748645bab53b94b62412df04', '黔西南', 'qianxinan', '0030907', 7, '592f6fcf45a74524aa8ea853fc9761d5', '黔西南市', '');
INSERT INTO `sys_dictionaries` VALUES ('2ae081dd5d3c47b584fdaf24769e49e1', '玉溪', 'yuxi', '0032915', 15, '510607a1836e4079b3103e14ec5864ed', '玉溪', '');
INSERT INTO `sys_dictionaries` VALUES ('2ba8e6d0fd944983aa19b781c6b53477', '海南', 'hainan', '00310', 10, '1', '海南省', '');
INSERT INTO `sys_dictionaries` VALUES ('2bd0431e3566451297ecd194287a878a', '甘孜', 'ganzi', '0032506', 6, 'd3538add7125404aba4b0007ef9fde50', '甘孜', '');
INSERT INTO `sys_dictionaries` VALUES ('2c0da3154cc74d7990c597bed6ebf2d6', '大兴区', 'daxingqu', '0030112', 12, '12a62a3e5bed44bba0412b7e6b733c93', '大兴区', '');
INSERT INTO `sys_dictionaries` VALUES ('2c254799d3454f2cbc338ef5712548e9', '天津', 'tianjin', '00326', 26, '1', '天津', '');
INSERT INTO `sys_dictionaries` VALUES ('2d0e4687904b48738ac6bd6a42e7f32d', '忻州', 'xinzhou', '0032309', 9, '023473e9e6204583a110531036357514', '忻州市', '');
INSERT INTO `sys_dictionaries` VALUES ('2d0ff92556b544c19dbfc8b8b055e19a', '常州', 'changzhou', '0031701', 1, '577405ff648240959b3765c950598ab0', '常州市', '');
INSERT INTO `sys_dictionaries` VALUES ('2e3c279cf0a44115869049e4a6d9ed08', '西宁', 'xining', '0032207', 7, '5a80e3435c0e4dc09bafceeadb38e5f0', '西宁', '');
INSERT INTO `sys_dictionaries` VALUES ('2f097a8914de4b01a04bf61852435672', '阿勒泰', 'a\'letai', '0032802', 2, '2fabed91c6d94e698ed449165cd250ca', '阿勒泰', '');
INSERT INTO `sys_dictionaries` VALUES ('2f5e433682f24e20b600532062ff0bcb', '白山', 'baishan', '0031602', 2, '857be71b0d6d4a40a2c83476824206d1', '白山市', '');
INSERT INTO `sys_dictionaries` VALUES ('2f7f68eb9be845be90e74a0763de2c7f', '平谷区', 'pingguqu', '0030114', 14, '12a62a3e5bed44bba0412b7e6b733c93', '平谷区', '');
INSERT INTO `sys_dictionaries` VALUES ('2f8e7a55eaab4649b9abe43ade744e58', '大庆', 'daqing', '0031301', 1, 'b2d4133b5dbf4599ada940620d2ab250', '大庆市', '');
INSERT INTO `sys_dictionaries` VALUES ('2fabed91c6d94e698ed449165cd250ca', '新疆', 'xinjiang', '00328', 28, '1', '新疆', '');
INSERT INTO `sys_dictionaries` VALUES ('30d424f63bf44e8391683f371ed3552f', '秦皇岛', 'qinhuangdao', '0031107', 7, '75362368f22f4d60a810c2a45cced487', '秦皇岛市', '');
INSERT INTO `sys_dictionaries` VALUES ('312b80775e104ba08c8244a042a658df', '湖北', 'hubei', '00314', 14, '1', '湖北省', '');
INSERT INTO `sys_dictionaries` VALUES ('3186f859efa246f793401c475d3d0090', '阿里', 'a\'li', '0032701', 1, '3e846b08dbbe495e93bc93f8f202de79', '阿里', '');
INSERT INTO `sys_dictionaries` VALUES ('325e45e49c1849efb7fea2296f686210', '赣州', 'ganzhou', '0031802', 2, 'cb3008cbd6ae4b5f8cebd2254ccb8603', '赣州市', '');
INSERT INTO `sys_dictionaries` VALUES ('3283f1a77180495f9a0b192d0f9cdd35', '甘肃', 'gansu', '00306', 6, '1', '甘肃省', '');
INSERT INTO `sys_dictionaries` VALUES ('329838f633f340779483910f33387ccd', '通州区', 'tongzhouqu', '0030109', 9, '12a62a3e5bed44bba0412b7e6b733c93', '通州区', '');
INSERT INTO `sys_dictionaries` VALUES ('3326f321dfe54e5292e94a9f2a518723', '乌鲁木齐', 'wulumuqi', '0032812', 12, '2fabed91c6d94e698ed449165cd250ca', '乌鲁木齐', '');
INSERT INTO `sys_dictionaries` VALUES ('33fe30734ed84994bdd46ebe69aac088', '朝阳区', 'chaoyangqu', '0030103', 3, '12a62a3e5bed44bba0412b7e6b733c93', '朝阳区', '');
INSERT INTO `sys_dictionaries` VALUES ('34bc05269e304e2e99c9ded314a12321', '石景山区', 'shijingshanqu', '0030105', 5, '12a62a3e5bed44bba0412b7e6b733c93', '石景山区', '');
INSERT INTO `sys_dictionaries` VALUES ('34d6634b8baa47a3b1c0d0346d93873b', '和平区', 'hepingqu', '0032601', 1, '2c254799d3454f2cbc338ef5712548e9', '和平区', '');
INSERT INTO `sys_dictionaries` VALUES ('3521e41344aa42aaa1cd212482992055', '漯河', 'luohe', '0031207', 7, '7336944efb4b40fcae9118fc9a970d2d', '漯河市', '');
INSERT INTO `sys_dictionaries` VALUES ('38bc876c1cab4434af9d14be194463c8', '南充', 'nanchong', '0032514', 14, 'd3538add7125404aba4b0007ef9fde50', '南充市', '');
INSERT INTO `sys_dictionaries` VALUES ('39595ea4b765445dae9c26ae870b3a0f', '克州', 'kezhou', '0032809', 9, '2fabed91c6d94e698ed449165cd250ca', '克州', '');
INSERT INTO `sys_dictionaries` VALUES ('3a3b4ea7445a4aec80083e5957028990', '汕头', 'shantou', '0030712', 12, '0dd1f40bcb9d46aeba015dc19645a5b9', '汕头市', '');
INSERT INTO `sys_dictionaries` VALUES ('3a5d1b6e800541c683724672cae3e0f6', '泰安', 'taian', '0030312', 12, '10f46a521ea0471f8d71ee75ac3b5f3a', '泰安市', '');
INSERT INTO `sys_dictionaries` VALUES ('3ad7c52e9a7044a1a9ab00f29f8cef7c', '阿克苏', 'a\'kesu', '0032801', 1, '2fabed91c6d94e698ed449165cd250ca', '阿克苏', '');
INSERT INTO `sys_dictionaries` VALUES ('3ae7c64c40c147eeb3898883e20a7fe0', '山南', 'shannan', '0032707', 7, '3e846b08dbbe495e93bc93f8f202de79', '山南', '');
INSERT INTO `sys_dictionaries` VALUES ('3d2a8f11e6d345b5af2f8e5d8bb6bb7a', '鹰潭', 'yingtan', '0031811', 11, 'cb3008cbd6ae4b5f8cebd2254ccb8603', '鹰潭市', '');
INSERT INTO `sys_dictionaries` VALUES ('3dbed4444dfc4884ab57d769ceac9507', '松江区', 'songjiangqu', '0030213', 13, 'f1ea30ddef1340609c35c88fb2919bee', '松江区', '');
INSERT INTO `sys_dictionaries` VALUES ('3e846b08dbbe495e93bc93f8f202de79', '西藏', 'xizang', '00327', 27, '1', '西藏', '');
INSERT INTO `sys_dictionaries` VALUES ('3eed1c5fb2c9420dbe6e76fdb0f9c4cb', '眉山', 'meishan', '0032511', 11, 'd3538add7125404aba4b0007ef9fde50', '眉山市', '');
INSERT INTO `sys_dictionaries` VALUES ('3ef5fb1ad8e24696a9de78b987847238', '中学', 'zhongxue', '00102', 2, 'b602b0bc378a46629cc37dc037eb9684', '中学', '');
INSERT INTO `sys_dictionaries` VALUES ('3f7c5e8ba51849549f5e5dfee72566cc', '呼伦贝尔', 'hulunbeier', '0032007', 7, 'c072c248c7ab47dda7bf24f5e577925c', '呼伦贝尔市', '');
INSERT INTO `sys_dictionaries` VALUES ('3fb6c72b11124211a22d9f8f40715737', '辽阳', 'liaoyang', '0031910', 10, 'b3366626c66c4b61881f09e1722e8495', '辽阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('3fffacbb502d4647bd358ff00412f536', '长治', 'changzhi', '0032301', 1, '023473e9e6204583a110531036357514', '长治市', '');
INSERT INTO `sys_dictionaries` VALUES ('407fa7f152f4461582cfd6904b2c454a', '晋城', 'jincheng', '0032303', 3, '023473e9e6204583a110531036357514', '晋城市', '');
INSERT INTO `sys_dictionaries` VALUES ('415fe5fbf3054a3ea2ebdbe24ce4c49f', '永川区', 'yongchuanqu', '0033118', 18, '1c85fbd06cf840d093f3640aca1b6b2d', '永川区', '');
INSERT INTO `sys_dictionaries` VALUES ('417d25314a9e43c6b7b725db160db360', '延安', 'yan\'an', '0032409', 9, '534850c72ceb4a57b7dc269da63c330a', '延安市', '');
INSERT INTO `sys_dictionaries` VALUES ('4266f08d4bc24321bba7ea3a83a8ba95', '永州', 'yongzhou', '0031511', 11, 'c59f91630bef4289b71fcb2a48994582', '永州市', '');
INSERT INTO `sys_dictionaries` VALUES ('429dc62e0f6641b8b2ddced272d5d087', '遵义', 'zunyi', '0030909', 9, '592f6fcf45a74524aa8ea853fc9761d5', '遵义市', '');
INSERT INTO `sys_dictionaries` VALUES ('432c0a1be10143beba6de15ad8811b64', '安顺', 'anshun', '0030901', 1, '592f6fcf45a74524aa8ea853fc9761d5', '安顺市', '');
INSERT INTO `sys_dictionaries` VALUES ('44fee1b9a9e141f9bdf90053f4972d2e', '北辰区', 'beichenqu', '0032610', 10, '2c254799d3454f2cbc338ef5712548e9', '北辰区', '');
INSERT INTO `sys_dictionaries` VALUES ('458411aef2d34ccd99ab5976f0f1f030', '金华', 'jinhua', '0033004', 4, '6d846178376549ed878d11d109819f25', '金华市', '');
INSERT INTO `sys_dictionaries` VALUES ('45a5be4b22ec494c99b112a7c96bca47', '钦州', 'qinzhou', '0030812', 12, 'c5f3d426c582410281f89f1451e1d854', '钦州市', '');
INSERT INTO `sys_dictionaries` VALUES ('4795a00ae89441ce82bcabdf086e8316', '宝鸡', 'baoji', '0032402', 2, '534850c72ceb4a57b7dc269da63c330a', '宝鸡市', '');
INSERT INTO `sys_dictionaries` VALUES ('480875fd43a947119e24c2302eeead53', '伊春', 'yichun', '0031313', 13, 'b2d4133b5dbf4599ada940620d2ab250', '伊春市', '');
INSERT INTO `sys_dictionaries` VALUES ('4921e0e6f9d445cdb6a4b3da98ab3555', '林芝', 'linzhi', '0032704', 4, '3e846b08dbbe495e93bc93f8f202de79', '林芝', '');
INSERT INTO `sys_dictionaries` VALUES ('4972af008f074efd91ea8312587afb42', '牡丹江', 'mudanjiang', '0031308', 8, 'b2d4133b5dbf4599ada940620d2ab250', '牡丹江市', '');
INSERT INTO `sys_dictionaries` VALUES ('49b4639e83e441c581bfdefda3a9ac27', '宜春', 'yichun', '0031810', 10, 'cb3008cbd6ae4b5f8cebd2254ccb8603', '宜春市', '');
INSERT INTO `sys_dictionaries` VALUES ('4b41fbe4cdae414a91af371e3105ebe5', '景德镇', 'jingdezhen', '0031804', 4, 'cb3008cbd6ae4b5f8cebd2254ccb8603', '景德镇市', '');
INSERT INTO `sys_dictionaries` VALUES ('4b72f022312e4664ae7863b343239ff0', '淄博', 'zibo', '0030317', 17, '10f46a521ea0471f8d71ee75ac3b5f3a', '淄博市', '');
INSERT INTO `sys_dictionaries` VALUES ('4be3e0a560a2486eae928b44110e971e', '白城', 'baicheng', '0031601', 1, '857be71b0d6d4a40a2c83476824206d1', '白城市', '');
INSERT INTO `sys_dictionaries` VALUES ('4c5dbcb293bf40f8837c0acec1ad67eb', '佳木斯', 'jiamusi', '0031307', 7, 'b2d4133b5dbf4599ada940620d2ab250', '佳木斯市', '');
INSERT INTO `sys_dictionaries` VALUES ('4cee922697a64ec78de69210e8e40af1', '昌都', 'changdu', '0032702', 2, '3e846b08dbbe495e93bc93f8f202de79', '昌都', '');
INSERT INTO `sys_dictionaries` VALUES ('50b42656af3f4068984fa042e81d7d22', '威海', 'weihai', '0030313', 13, '10f46a521ea0471f8d71ee75ac3b5f3a', '威海市', '');
INSERT INTO `sys_dictionaries` VALUES ('510607a1836e4079b3103e14ec5864ed', '云南', 'yunnan', '00329', 29, '1', '云南省', '');
INSERT INTO `sys_dictionaries` VALUES ('512a316326984ed8aa32d7f610b7604f', '玉树', 'yushu', '0032208', 8, '5a80e3435c0e4dc09bafceeadb38e5f0', '玉树', '');
INSERT INTO `sys_dictionaries` VALUES ('51f23688604848809184ec828f89cfca', '嘉兴', 'jiaxing', '0033003', 3, '6d846178376549ed878d11d109819f25', '嘉兴市', '');
INSERT INTO `sys_dictionaries` VALUES ('5259c4093aa84f7c88a367685581fbc6', '门头沟区', 'mentougouqu', '0030107', 7, '12a62a3e5bed44bba0412b7e6b733c93', '门头沟区', '');
INSERT INTO `sys_dictionaries` VALUES ('52630830669149edba48a7bb9b06e297', '中卫', 'zhongwei', '0032106', 6, '5690b0534fe745e5ba0f504f0c260559', '中卫市', '');
INSERT INTO `sys_dictionaries` VALUES ('534850c72ceb4a57b7dc269da63c330a', '陕西', 'shanxi', '00324', 24, '1', '陕西省', '');
INSERT INTO `sys_dictionaries` VALUES ('537974fdf5f54b8f99452bb8a03cf37b', '厦门', 'xiamen', '0030508', 8, 'd4066f6f425a4894a77f49f539f2a34f', '厦门市', '');
INSERT INTO `sys_dictionaries` VALUES ('53ca3f5aede8420b835b38bbc542da81', '松源', 'songyuan', '0031607', 7, '857be71b0d6d4a40a2c83476824206d1', '松源市', '');
INSERT INTO `sys_dictionaries` VALUES ('558d920174014b4cb5a0c8f518b5819b', '东城区', 'dongchengqu', '0030101', 1, '12a62a3e5bed44bba0412b7e6b733c93', '东城区', '');
INSERT INTO `sys_dictionaries` VALUES ('56103b0e83a44d07a6025061fab4cebc', '运城', 'yuncheng', '0032311', 11, '023473e9e6204583a110531036357514', '运城市', '');
INSERT INTO `sys_dictionaries` VALUES ('5690b0534fe745e5ba0f504f0c260559', '宁夏', 'ningxia', '00321', 21, '1', '宁夏', '');
INSERT INTO `sys_dictionaries` VALUES ('576fa3bd7d294f61af1315e95f70d44c', '九龙坡区', 'jiulongpoqu', '0033107', 7, '1c85fbd06cf840d093f3640aca1b6b2d', '九龙坡区', '');
INSERT INTO `sys_dictionaries` VALUES ('577405ff648240959b3765c950598ab0', '江苏', 'jiangsu', '00317', 17, '1', '江苏省', '');
INSERT INTO `sys_dictionaries` VALUES ('58ed29aefce044339ecf067f514c43cb', '宁德', 'ningde', '0030504', 4, 'd4066f6f425a4894a77f49f539f2a34f', '宁德市', '');
INSERT INTO `sys_dictionaries` VALUES ('5908fbf750a347b8a6b82af7778bb866', '商洛', 'shangluo', '0032404', 4, '534850c72ceb4a57b7dc269da63c330a', '商洛市', '');
INSERT INTO `sys_dictionaries` VALUES ('592f6fcf45a74524aa8ea853fc9761d5', '贵州', 'guizhou', '00309', 9, '1', '贵州省', '');
INSERT INTO `sys_dictionaries` VALUES ('59dbb93b007d44a6ae97744ac14e642c', '龙岩', 'longyan', '0030502', 2, 'd4066f6f425a4894a77f49f539f2a34f', '龙岩市', '');
INSERT INTO `sys_dictionaries` VALUES ('5a80e3435c0e4dc09bafceeadb38e5f0', '青海', 'qinghai', '00322', 22, '1', '青海', '');
INSERT INTO `sys_dictionaries` VALUES ('5b1905ef82bf48039a96cd5dd1d8da10', '小学', 'xiaoxue', '00101', 1, 'b602b0bc378a46629cc37dc037eb9684', '小学', '');
INSERT INTO `sys_dictionaries` VALUES ('5b5747166f714882b5cdfbeb7856f965', '周口', 'zhoukou', '0031217', 17, '7336944efb4b40fcae9118fc9a970d2d', '周口市', '');
INSERT INTO `sys_dictionaries` VALUES ('5c91965168eb4deaab99266bbb4b64e1', '朝阳', 'chaoyang', '0031903', 3, 'b3366626c66c4b61881f09e1722e8495', '朝阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('5d2d367b0aee49449e65d0dd7601ee29', '巴中', 'bazhong', '0032502', 2, 'd3538add7125404aba4b0007ef9fde50', '巴中市', '');
INSERT INTO `sys_dictionaries` VALUES ('5ddde49610d4433eb157897d01ba6838', '东莞', 'dongguan', '0030702', 2, '0dd1f40bcb9d46aeba015dc19645a5b9', '东莞市', '');
INSERT INTO `sys_dictionaries` VALUES ('5e85d09db1054472bcca22d82da6ec5d', '乐山', 'leshan', '0032509', 9, 'd3538add7125404aba4b0007ef9fde50', '乐山市', '');
INSERT INTO `sys_dictionaries` VALUES ('60c96ec0debf4cc4bf5974c93d4f638c', '阳泉', 'yangquan', '0032310', 10, '023473e9e6204583a110531036357514', '阳泉市', '');
INSERT INTO `sys_dictionaries` VALUES ('61c3711334fe44b0806e717e6fb238b0', '滨海新区', 'binhaixinqu', '0032613', 13, '2c254799d3454f2cbc338ef5712548e9', '滨海新区', '');
INSERT INTO `sys_dictionaries` VALUES ('6214f40ad2704fb6af0ded59420ca958', '安康', 'ankang', '0032401', 1, '534850c72ceb4a57b7dc269da63c330a', '安康市', '');
INSERT INTO `sys_dictionaries` VALUES ('62ed6854726c4674ae2f5b676ddec7fb', '新乡', 'xinxiang', '0031213', 13, '7336944efb4b40fcae9118fc9a970d2d', '新乡市', '');
INSERT INTO `sys_dictionaries` VALUES ('6303e3eeffb441018044b039063e3f96', '丹东', 'dandong', '0031905', 5, 'b3366626c66c4b61881f09e1722e8495', '丹东市', '');
INSERT INTO `sys_dictionaries` VALUES ('644316de71f942f9a90eb1f810eca872', '怀柔区', 'huairouqu', '0030113', 13, '12a62a3e5bed44bba0412b7e6b733c93', '怀柔区', '');
INSERT INTO `sys_dictionaries` VALUES ('64a03236dd084d09ada9a1ca22b3815f', '长春', 'changchun', '0031603', 3, '857be71b0d6d4a40a2c83476824206d1', '长春市', '');
INSERT INTO `sys_dictionaries` VALUES ('65629a05de764a19b66b752726f5cdbd', '海淀区', 'haidianqu', '0030106', 6, '12a62a3e5bed44bba0412b7e6b733c93', '海淀区', '');
INSERT INTO `sys_dictionaries` VALUES ('6567a081f5d142779e17edbda3da9a04', '宁波', 'ningbo', '0033006', 6, '6d846178376549ed878d11d109819f25', '宁波市', '');
INSERT INTO `sys_dictionaries` VALUES ('6624ad3b318149f3a8ee5beef1b8b38f', '肇庆', 'zhaoqing', '0030719', 19, '0dd1f40bcb9d46aeba015dc19645a5b9', '肇庆市', '');
INSERT INTO `sys_dictionaries` VALUES ('66d9ddeebbea43f4b52cd33964c4c429', '语文', 'yuwen', '001010101', 1, '1b79421601744059a4ef6b0ca9be32f9', '语文', '');
INSERT INTO `sys_dictionaries` VALUES ('674ec37e9641450dadc9798df10c58bc', '静安区', 'jing\'anqu', '0030204', 4, 'f1ea30ddef1340609c35c88fb2919bee', '静安区', '');
INSERT INTO `sys_dictionaries` VALUES ('67cba9a4ca4c4c38ac3ba2c21dd191e6', '南昌', 'nanchang', '0031806', 6, 'cb3008cbd6ae4b5f8cebd2254ccb8603', '南昌市', '');
INSERT INTO `sys_dictionaries` VALUES ('68a8f7a8337141d3a092fadfd2457970', '鸡西', 'jixi', '0031306', 6, 'b2d4133b5dbf4599ada940620d2ab250', '鸡西市', '');
INSERT INTO `sys_dictionaries` VALUES ('6932b6b7b5124bef8385fb8e5b5c2568', '通化', 'tonghua', '0031608', 8, '857be71b0d6d4a40a2c83476824206d1', '通化市', '');
INSERT INTO `sys_dictionaries` VALUES ('694348f8e1c0444e8e0b2c2caf4de1a6', '榆林', 'yulin', '0032410', 10, '534850c72ceb4a57b7dc269da63c330a', '榆林市', '');
INSERT INTO `sys_dictionaries` VALUES ('697141b58ada46518bc8ec0cc3d64b31', '博州', 'bozhou', '032804', 4, '2fabed91c6d94e698ed449165cd250ca', '博州', '');
INSERT INTO `sys_dictionaries` VALUES ('6a2226c73bc745faa6973dd3af3e274a', '吐鲁番', 'tulufan', '0032811', 11, '2fabed91c6d94e698ed449165cd250ca', '吐鲁番', '');
INSERT INTO `sys_dictionaries` VALUES ('6b2b1d55b06b44cd8a487d327397b69b', '徐汇区', 'xuhuiqu', '0030202', 2, 'f1ea30ddef1340609c35c88fb2919bee', '徐汇区', '');
INSERT INTO `sys_dictionaries` VALUES ('6d1e9b9c9c334448878312d589eeaeac', '荣昌区', 'rongchangqu', '0033123', 23, '1c85fbd06cf840d093f3640aca1b6b2d', '荣昌区', '');
INSERT INTO `sys_dictionaries` VALUES ('6d846178376549ed878d11d109819f25', '浙江', 'zhejiang', '00330', 30, '1', '浙江省', '');
INSERT INTO `sys_dictionaries` VALUES ('6daab50a4a1048f993f348a66dcfa83d', '喀什', 'kashi', '0032807', 7, '2fabed91c6d94e698ed449165cd250ca', '喀什', '');
INSERT INTO `sys_dictionaries` VALUES ('6dc38f66c86a4f32ac9d585e668c110e', '怒江', 'nujiang', '0032911', 11, '510607a1836e4079b3103e14ec5864ed', '怒江', '');
INSERT INTO `sys_dictionaries` VALUES ('6e1f1c6d82704e5cadcd0bc8ef2ab79f', '昆明', 'kunming', '0032908', 8, '510607a1836e4079b3103e14ec5864ed', '昆明', '');
INSERT INTO `sys_dictionaries` VALUES ('6e639147d90943c38490cafe223985ce', '梅州', 'meizhou', '0030710', 10, '0dd1f40bcb9d46aeba015dc19645a5b9', '梅州市', '');
INSERT INTO `sys_dictionaries` VALUES ('6e67518f1da44dbaa8cf95920779f188', '汕尾', 'shanwei', '0030713', 13, '0dd1f40bcb9d46aeba015dc19645a5b9', '汕尾市', '');
INSERT INTO `sys_dictionaries` VALUES ('6eaa823330da42b6b5783e389707853c', '四平', 'siping', '0031606', 6, '857be71b0d6d4a40a2c83476824206d1', '四平市', '');
INSERT INTO `sys_dictionaries` VALUES ('6ecc40e527404bba89207cc158ef3994', '河源', 'heyuan', '0030705', 5, '0dd1f40bcb9d46aeba015dc19645a5b9', '河源市', '');
INSERT INTO `sys_dictionaries` VALUES ('6ee20f02066e43a29f10ca6dbd0b7c71', '普陀区', 'putuoqu', '0030205', 5, 'f1ea30ddef1340609c35c88fb2919bee', '普陀区', '');
INSERT INTO `sys_dictionaries` VALUES ('6f5749ab2b5d4cbea1655e9a5197096d', '湛江', 'zhanjiang', '0030718', 18, '0dd1f40bcb9d46aeba015dc19645a5b9', '湛江市', '');
INSERT INTO `sys_dictionaries` VALUES ('6f8c18c8b3a54bc287c1dfc5642be577', '三明', 'sanming', '0030507', 7, 'd4066f6f425a4894a77f49f539f2a34f', '三明市', '');
INSERT INTO `sys_dictionaries` VALUES ('6f9601270aca46519e7f8836e0d2446c', '广元', 'guangyuan', '0032508', 8, 'd3538add7125404aba4b0007ef9fde50', '广元市', '');
INSERT INTO `sys_dictionaries` VALUES ('6fd083505ab24086b234c032dab3c2a7', '海口', 'haikou', '0031001', 1, '2ba8e6d0fd944983aa19b781c6b53477', '海口市', '');
INSERT INTO `sys_dictionaries` VALUES ('70733399b60d4b058c255fa9fff2eee0', '莆田', 'putian', '0030505', 5, 'd4066f6f425a4894a77f49f539f2a34f', '莆田市', '');
INSERT INTO `sys_dictionaries` VALUES ('70c1525174a04767865d0e6b7ed01f5a', '七台河', 'qitaihe', '0031309', 9, 'b2d4133b5dbf4599ada940620d2ab250', '七台河市', '');
INSERT INTO `sys_dictionaries` VALUES ('70c41ec5cb9e4aec98bd2357702c4082', '江门', 'jiangmen', '0030707', 7, '0dd1f40bcb9d46aeba015dc19645a5b9', '江门市', '');
INSERT INTO `sys_dictionaries` VALUES ('71aba068cd5b4588a03be75e2e49f496', '鄂州', 'ezhou', '0031401', 1, '312b80775e104ba08c8244a042a658df', '鄂州市', '');
INSERT INTO `sys_dictionaries` VALUES ('7336944efb4b40fcae9118fc9a970d2d', '河南', 'henan', '00312', 12, '1', '河南省', '');
INSERT INTO `sys_dictionaries` VALUES ('748623f3282b4ca7ace0e73303327310', '巴南区', 'bananqu', '0033113', 13, '1c85fbd06cf840d093f3640aca1b6b2d', '巴南区', '');
INSERT INTO `sys_dictionaries` VALUES ('74d2aaddaf294355b01970d52e303a1a', '资阳', 'ziyang', '0032519', 19, 'd3538add7125404aba4b0007ef9fde50', '资阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('75362368f22f4d60a810c2a45cced487', '河北', 'hebei', '00311', 11, '1', '河北省', '');
INSERT INTO `sys_dictionaries` VALUES ('755e2d15540c49dbad6be564f694a4af', '曲靖', 'qujing', '0032913', 13, '510607a1836e4079b3103e14ec5864ed', '曲靖', '');
INSERT INTO `sys_dictionaries` VALUES ('75b889c8e86c4d518a1fb74b089ceae8', '攀枝花', 'panzhihua', '0032515', 15, 'd3538add7125404aba4b0007ef9fde50', '攀枝花市', '');
INSERT INTO `sys_dictionaries` VALUES ('75e0334ad60b41a1b42ae6724b06c874', '镇江', 'zhenjiang', '0031713', 13, '577405ff648240959b3765c950598ab0', '镇江市', '');
INSERT INTO `sys_dictionaries` VALUES ('762bc3b1443e4ea98ab051b4007c0238', '邢台', 'xingtai', '0031110', 10, '75362368f22f4d60a810c2a45cced487', '邢台市', '');
INSERT INTO `sys_dictionaries` VALUES ('76d023f160e448c8bcb78598bf246a44', '黔南', 'qiannan', '0030906', 6, '592f6fcf45a74524aa8ea853fc9761d5', '黔南市', '');
INSERT INTO `sys_dictionaries` VALUES ('773cb4f25b9d4ebcba2953570da776c9', '吴忠', 'wuzhong', '0032104', 4, '5690b0534fe745e5ba0f504f0c260559', '吴忠市', '');
INSERT INTO `sys_dictionaries` VALUES ('776b55acb6804296a00c9f97723633ba', '舟山', 'zhoushan', '0033011', 11, '6d846178376549ed878d11d109819f25', '舟山市', '');
INSERT INTO `sys_dictionaries` VALUES ('79b98f7f0c054fa0ab2a3a2cb75d1b87', '邵阳', 'shaoyang', '0031505', 5, 'c59f91630bef4289b71fcb2a48994582', '邵阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('7a8097646dc8419284201db66dd6eda1', '芜湖', 'wuhu', '0030416', 16, '249999f296d14f95b8138a30bbb2c374', '芜湖市', '');
INSERT INTO `sys_dictionaries` VALUES ('7ab1618b70354ee2ab49e8fd5cbca27f', '哈密', 'hami', '0032806', 6, '2fabed91c6d94e698ed449165cd250ca', '哈密', '');
INSERT INTO `sys_dictionaries` VALUES ('7bed9f7f137e4048bbfd0d564283312d', '日照', 'rizhao', '0030311', 11, '10f46a521ea0471f8d71ee75ac3b5f3a', '日照市', '');
INSERT INTO `sys_dictionaries` VALUES ('7c6addc8becd4e759479228f6dd38bb2', '通辽', 'tongliao', '0032008', 8, 'c072c248c7ab47dda7bf24f5e577925c', '通辽市', '');
INSERT INTO `sys_dictionaries` VALUES ('7f69cfd9e1ae4c92b4ddf13b9f78cb6c', '保山', 'baoshan', '0032902', 2, '510607a1836e4079b3103e14ec5864ed', '保山', '');
INSERT INTO `sys_dictionaries` VALUES ('802ef5c62bbb47e3a026e3c92989f53e', '临夏', 'linxia', '0030608', 8, '3283f1a77180495f9a0b192d0f9cdd35', '临夏市', '');
INSERT INTO `sys_dictionaries` VALUES ('8114568fa8a34c6e878ff13d5ba59006', '齐齐哈尔', 'qiqihaer', '0031310', 10, 'b2d4133b5dbf4599ada940620d2ab250', '齐齐哈尔市', '');
INSERT INTO `sys_dictionaries` VALUES ('8127fbeb13a44c3284dfa8e2326ce19a', '茂名', 'maoming', '0030709', 9, '0dd1f40bcb9d46aeba015dc19645a5b9', '茂名市', '');
INSERT INTO `sys_dictionaries` VALUES ('813ff1376c0445c6a64b9f00452c2427', '成都', 'chengdu', '0032503', 3, 'd3538add7125404aba4b0007ef9fde50', '成都市', '');
INSERT INTO `sys_dictionaries` VALUES ('81443e6b687349c6ae3231aff5e038ba', '铜陵', 'tongling', '0030415', 15, '249999f296d14f95b8138a30bbb2c374', '铜陵市', '');
INSERT INTO `sys_dictionaries` VALUES ('8170c3271bc840d78e92ed355851aa5e', '西城区', 'xichengqu', '0030102', 2, '12a62a3e5bed44bba0412b7e6b733c93', '西城区', '');
INSERT INTO `sys_dictionaries` VALUES ('8346ebddc2464a9bbb99f7b0794da39c', '韶关', 'shaoguan', '0030714', 14, '0dd1f40bcb9d46aeba015dc19645a5b9', '韶关市', '');
INSERT INTO `sys_dictionaries` VALUES ('8362c89358c748a5907b44de500a1333', '泰州', 'taizhou', '0031708', 8, '577405ff648240959b3765c950598ab0', '泰州市', '');
INSERT INTO `sys_dictionaries` VALUES ('83e9fbd9e7fa4d878575088df7798b5e', '泸州', 'luzhou', '0032510', 10, 'd3538add7125404aba4b0007ef9fde50', '泸州市', '');
INSERT INTO `sys_dictionaries` VALUES ('857be71b0d6d4a40a2c83476824206d1', '吉林', 'jilin', '00316', 16, '1', '吉林省', '');
INSERT INTO `sys_dictionaries` VALUES ('85b8accc31b34d70bce548a9d42767dd', '汉中', 'hanzhong', '0032403', 3, '534850c72ceb4a57b7dc269da63c330a', '汉中市', '');
INSERT INTO `sys_dictionaries` VALUES ('85c0cb3849bc4d79b9c2fa2b63b2c858', '福州', 'fuzhou', '0030501', 1, 'd4066f6f425a4894a77f49f539f2a34f', '福州市', '');
INSERT INTO `sys_dictionaries` VALUES ('85da31513d984f3e8a179b764efb3a22', '太原', 'taiyuan', '0032308', 8, '023473e9e6204583a110531036357514', '太原市', '');
INSERT INTO `sys_dictionaries` VALUES ('863205a0ac1d4c50b19bb79f602dbea7', '张家口', 'zhangjiakou', '0031111', 11, '75362368f22f4d60a810c2a45cced487', '张家口市', '');
INSERT INTO `sys_dictionaries` VALUES ('8636d6e9bdb34510bcb528159ca4f29d', '辽源', 'liaoyuan', '0031605', 5, '857be71b0d6d4a40a2c83476824206d1', '辽源市', '');
INSERT INTO `sys_dictionaries` VALUES ('866bf0b4a8cc41dfb5071f8edb271934', '佛山', 'foshan', '0030703', 3, '0dd1f40bcb9d46aeba015dc19645a5b9', '佛山市', '');
INSERT INTO `sys_dictionaries` VALUES ('86b85d3d8ddc4632946bdc4cdf642504', '虹口区', 'hongkouqu', '0030206', 6, 'f1ea30ddef1340609c35c88fb2919bee', '虹口区', '');
INSERT INTO `sys_dictionaries` VALUES ('871c4e3b4a044b2e8235d731835db559', '酒泉', 'jiuquan', '0030606', 6, '3283f1a77180495f9a0b192d0f9cdd35', '酒泉市', '');
INSERT INTO `sys_dictionaries` VALUES ('87563959aa914187a0b5af82f862a0f0', '金昌', 'jinchang', '0030605', 5, '3283f1a77180495f9a0b192d0f9cdd35', '金昌市', '');
INSERT INTO `sys_dictionaries` VALUES ('886a63c7def64cdfad1cfc0a2de8a1e0', '崇左', 'chongzuo', '0030803', 3, 'c5f3d426c582410281f89f1451e1d854', '崇左市', '');
INSERT INTO `sys_dictionaries` VALUES ('89341f9a48444d258609e87cf40604fa', '伊犁州直', 'yilizhouzhi', '0032813', 13, '2fabed91c6d94e698ed449165cd250ca', '伊犁州直', '');
INSERT INTO `sys_dictionaries` VALUES ('89461222215e40f7b8067c7b791a9c2c', '南平', 'nanping', '0030503', 3, 'd4066f6f425a4894a77f49f539f2a34f', '南平市', '');
INSERT INTO `sys_dictionaries` VALUES ('895262136b904f4888aa5af2f89dc967', '洛阳', 'luoyang', '0031206', 6, '7336944efb4b40fcae9118fc9a970d2d', '洛阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('896bce499bd740ffb9f745a4782a7886', '青浦区', 'qingpuqu', '0030214', 14, 'f1ea30ddef1340609c35c88fb2919bee', '青浦区', '');
INSERT INTO `sys_dictionaries` VALUES ('8a7265e11f0141ba808c0410b76d415b', '临沂', 'linyi', '0030309', 9, '10f46a521ea0471f8d71ee75ac3b5f3a', '临沂市', '');
INSERT INTO `sys_dictionaries` VALUES ('8a79e7d2af7244b0b543492374ec6549', '兴安盟', 'xinganmeng', '0032012', 12, 'c072c248c7ab47dda7bf24f5e577925c', '兴安盟', '');
INSERT INTO `sys_dictionaries` VALUES ('8abbfbb071f34df4b77e2828f53ef99b', '怀化', 'huaihua', '0031512', 12, 'c59f91630bef4289b71fcb2a48994582', '怀化市', '');
INSERT INTO `sys_dictionaries` VALUES ('8af40c23c6fe4ed8819dbe99f1f125f0', '奉贤区', 'fengxianqu', '0030215', 15, 'f1ea30ddef1340609c35c88fb2919bee', '奉贤区', '');
INSERT INTO `sys_dictionaries` VALUES ('8b336fb55c2346a2b5ec13f578c627ef', '苏州', 'suzhou', '0031706', 6, '577405ff648240959b3765c950598ab0', '苏州市', '');
INSERT INTO `sys_dictionaries` VALUES ('8b5512281c364e09a67d8e81a5bd7ce9', '南川区', 'nanchuanqu', '0033119', 19, '1c85fbd06cf840d093f3640aca1b6b2d', '南川区', '');
INSERT INTO `sys_dictionaries` VALUES ('8b95528d20c44f86adf1e64009ce317b', '贵阳', 'guiyang', '0030903', 3, '592f6fcf45a74524aa8ea853fc9761d5', '贵阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('8bfd173e34704a7f978c539f87a511a8', '宝山区', 'baoshanqu', '0030209', 9, 'f1ea30ddef1340609c35c88fb2919bee', '宝山区', '');
INSERT INTO `sys_dictionaries` VALUES ('8c64bc307e894223a429a4f50a0cd387', '唐山', 'tangshan', '0031109', 9, '75362368f22f4d60a810c2a45cced487', '唐山市', '');
INSERT INTO `sys_dictionaries` VALUES ('8d10532fba444c66bead45a6d9e13b6a', '延庆区', 'yanqingqu', '0030116', 16, '12a62a3e5bed44bba0412b7e6b733c93', '延庆区', '');
INSERT INTO `sys_dictionaries` VALUES ('8e35c978f8b248cb93863818be6be56b', '大足区', 'dazuqu', '0033111', 11, '1c85fbd06cf840d093f3640aca1b6b2d', '大足区', '');
INSERT INTO `sys_dictionaries` VALUES ('8f617ff8e61c49689cb26540a618a80c', '宁河区', 'ninghequ', '0032614', 14, '2c254799d3454f2cbc338ef5712548e9', '宁河区', '');
INSERT INTO `sys_dictionaries` VALUES ('8fa97a231db54e879ece49d566f0561d', '天门', 'tianmen', '0031410', 10, '312b80775e104ba08c8244a042a658df', '天门市', '');
INSERT INTO `sys_dictionaries` VALUES ('9068c4ec7d1a4de69339fb61654cb3d9', '温州', 'wenzhou', '0033010', 10, '6d846178376549ed878d11d109819f25', '温州市', '');
INSERT INTO `sys_dictionaries` VALUES ('921a9e3d2c434cca943aca4f3e5087b5', '渝中区', 'yuzhongqu', '0033103', 3, '1c85fbd06cf840d093f3640aca1b6b2d', '渝中区', '');
INSERT INTO `sys_dictionaries` VALUES ('923ca61a8fdb4357a5220763fdbd7c37', '台州', 'taizhou', '0033009', 9, '6d846178376549ed878d11d109819f25', '台州市', '');
INSERT INTO `sys_dictionaries` VALUES ('92800c5b33df4f15a689ceda6bd23f2b', '信阳', 'xinyang', '0031214', 14, '7336944efb4b40fcae9118fc9a970d2d', '信阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('9381ab9da4b64001b289252ee21d1157', '河东区', 'hedongqu', '0032602', 2, '2c254799d3454f2cbc338ef5712548e9', '河东区', '');
INSERT INTO `sys_dictionaries` VALUES ('95a7fd77484f4ef39e9ed4596556a93c', '海西', 'haixi', '0032205', 5, '5a80e3435c0e4dc09bafceeadb38e5f0', '海西', '');
INSERT INTO `sys_dictionaries` VALUES ('9795de38301642539aefda61adf595a4', '江津区', 'jiangjinqu', '0033116', 16, '1c85fbd06cf840d093f3640aca1b6b2d', '江津区', '');
INSERT INTO `sys_dictionaries` VALUES ('97c543ee46e84586998554f5f745fcc6', '杨浦区', 'yangpuqu', '0030207', 7, 'f1ea30ddef1340609c35c88fb2919bee', '杨浦区', '');
INSERT INTO `sys_dictionaries` VALUES ('983eaae633244ecea99d11a804b1c736', '万州区', 'wanzhouqu', '0033101', 1, '1c85fbd06cf840d093f3640aca1b6b2d', '万州区', '');
INSERT INTO `sys_dictionaries` VALUES ('9a7465597dda46c8bb4c5c98aabfb4b9', '阳江', 'yangjiang', '0030716', 16, '0dd1f40bcb9d46aeba015dc19645a5b9', '阳江市', '');
INSERT INTO `sys_dictionaries` VALUES ('9b483ad27bc14af2a47d8facdf8fafca', '嘉峪关', 'jiayuguan', '0030604', 4, '3283f1a77180495f9a0b192d0f9cdd35', '嘉峪关市', '');
INSERT INTO `sys_dictionaries` VALUES ('9bb5220b50dd4def87ffbf6444a28c58', '黄浦区', 'huangpuqu', '0030201', 1, 'f1ea30ddef1340609c35c88fb2919bee', '黄浦区', '');
INSERT INTO `sys_dictionaries` VALUES ('9c8a7d5f3423458eb9e6ef68f6185fca', '黄山', 'huangshan', '0030411', 11, '249999f296d14f95b8138a30bbb2c374', '黄山市', '');
INSERT INTO `sys_dictionaries` VALUES ('9d9700b28ae347bca4db9f592c78eb02', '百色', 'baise', '0030801', 1, 'c5f3d426c582410281f89f1451e1d854', '百色市', '');
INSERT INTO `sys_dictionaries` VALUES ('9e4d7c5d9d86458d8c8d8a644e7eec9a', '阿拉善盟', 'alashanmeng', '0032001', 1, 'c072c248c7ab47dda7bf24f5e577925c', '阿拉善盟', '');
INSERT INTO `sys_dictionaries` VALUES ('9e833df814a74d1690f8039782ddf914', '昭通', 'zhaotong', '0032916', 16, '510607a1836e4079b3103e14ec5864ed', '昭通', '');
INSERT INTO `sys_dictionaries` VALUES ('9e9d0ad23c9e45df9dd9c269c0e4fdfa', '昌平区', 'changpingqu', '0030111', 11, '12a62a3e5bed44bba0412b7e6b733c93', '昌平区', '');
INSERT INTO `sys_dictionaries` VALUES ('9fc24347a7ca4a34bdea408dad223348', '闵行区', 'minhangqu', '0030208', 8, 'f1ea30ddef1340609c35c88fb2919bee', '闵行区', '');
INSERT INTO `sys_dictionaries` VALUES ('a013e3db1b384beb843959c33f361203', '静海区', 'jinghaiqu', '0032615', 15, '2c254799d3454f2cbc338ef5712548e9', '静海区', '');
INSERT INTO `sys_dictionaries` VALUES ('a0d5b55e48c945faad1d7bb624de7de8', '九江', 'jiujiang', '0031805', 5, 'cb3008cbd6ae4b5f8cebd2254ccb8603', '九江市', '');
INSERT INTO `sys_dictionaries` VALUES ('a165da9b81b940fe9764fc7f5d41232d', '银川', 'yinchuan', '0032105', 5, '5690b0534fe745e5ba0f504f0c260559', '银川市', '');
INSERT INTO `sys_dictionaries` VALUES ('a268c4b698274f12a64ba48db568d057', '潮州', 'chaozhou', '0030701', 1, '0dd1f40bcb9d46aeba015dc19645a5b9', '潮州市', '');
INSERT INTO `sys_dictionaries` VALUES ('a34815cb348d4598a6fac4ece3baa0cd', '衡阳', 'hengyang', '0031504', 4, 'c59f91630bef4289b71fcb2a48994582', '衡阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('a39af97e7ad04ebfb530f49b05c7b146', '阜阳', 'fuyang', '0030407', 7, '249999f296d14f95b8138a30bbb2c374', '阜阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('a405680276e645188a122e8933f77a38', '乌兰察布', 'wulanchabu', '0032010', 10, 'c072c248c7ab47dda7bf24f5e577925c', '乌兰察布市', '');
INSERT INTO `sys_dictionaries` VALUES ('a46bb0749dac4627b9a7d465dc75aca5', '武汉', 'wuhan', '0031411', 11, '312b80775e104ba08c8244a042a658df', '武汉市', '');
INSERT INTO `sys_dictionaries` VALUES ('a4d4d8f678dd4dba958f466bbc581c5f', '菏泽', 'heze', '0030305', 5, '10f46a521ea0471f8d71ee75ac3b5f3a', '菏泽市', '');
INSERT INTO `sys_dictionaries` VALUES ('a6898561d8664f6dad7a32f63ab64e19', '铁岭', 'tieling', '0031913', 13, 'b3366626c66c4b61881f09e1722e8495', '铁岭市', '');
INSERT INTO `sys_dictionaries` VALUES ('a76ed518fb584442aaf1769fd2583677', '兰州', 'lanzhou', '0030607', 7, '3283f1a77180495f9a0b192d0f9cdd35', '兰州市', '');
INSERT INTO `sys_dictionaries` VALUES ('a7d500ab05844c45b839f4a30c1d7643', '宜昌', 'yichang', '0031416', 16, '312b80775e104ba08c8244a042a658df', '宜昌市', '');
INSERT INTO `sys_dictionaries` VALUES ('a9093795a013403e869a4308f17c7588', '海东', 'haidong', '0032203', 3, '5a80e3435c0e4dc09bafceeadb38e5f0', '海东', '');
INSERT INTO `sys_dictionaries` VALUES ('aa4b703a13dc4116bea578295efd9ea0', '赤峰', 'chifeng', '0032004', 4, 'c072c248c7ab47dda7bf24f5e577925c', '赤峰市', '');
INSERT INTO `sys_dictionaries` VALUES ('aab8d56a03de4bbc84d433bc24748730', '贺州', 'hezhou', '0030808', 8, 'c5f3d426c582410281f89f1451e1d854', '贺州市', '');
INSERT INTO `sys_dictionaries` VALUES ('ac1aa3c1b928467ebfa261cfaeb77be9', '葫芦岛', 'huludao', '0031908', 8, 'b3366626c66c4b61881f09e1722e8495', '葫芦岛市', '');
INSERT INTO `sys_dictionaries` VALUES ('ac23d537ccd64827ab44007c5503bd58', '安阳', 'anyang', '0031201', 1, '7336944efb4b40fcae9118fc9a970d2d', '安阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('acd9f9b8fb8a4e47bd1e5d4eea45809c', '滁州', 'chuzhou', '0030406', 6, '249999f296d14f95b8138a30bbb2c374', '滁州市', '');
INSERT INTO `sys_dictionaries` VALUES ('acf5c250d6614fb9920e442a3b178b86', '东营', 'dongying', '0030304', 4, '10f46a521ea0471f8d71ee75ac3b5f3a', '东营市', '');
INSERT INTO `sys_dictionaries` VALUES ('adfac2a66ce04767bdbabbd8c115cd5d', '黄南', 'huangnan', '0032206', 6, '5a80e3435c0e4dc09bafceeadb38e5f0', '黄南', '');
INSERT INTO `sys_dictionaries` VALUES ('ae2c4a00360442f29ce8b0c284525ded', '崇明县', 'chongmingxian', '0030216', 16, 'f1ea30ddef1340609c35c88fb2919bee', '崇明县', '');
INSERT INTO `sys_dictionaries` VALUES ('ae384d9313e448949c8ed9c565e5cade', '扬州', 'yangzhou', '0031712', 12, '577405ff648240959b3765c950598ab0', '扬州市', '');
INSERT INTO `sys_dictionaries` VALUES ('affc6a796b524efdb006bd1730003df7', '西青区', 'xiqingqu', '0032608', 8, '2c254799d3454f2cbc338ef5712548e9', '西青区', '');
INSERT INTO `sys_dictionaries` VALUES ('b0251d85679b40dca30ee83af80838bb', '拉萨', 'lasa', '0032703', 3, '3e846b08dbbe495e93bc93f8f202de79', '拉萨市', '');
INSERT INTO `sys_dictionaries` VALUES ('b041a523ae214f03969454aa8c180ced', '房山区', 'fangshanqu', '0030108', 8, '12a62a3e5bed44bba0412b7e6b733c93', '房山区', '');
INSERT INTO `sys_dictionaries` VALUES ('b08ccea3cf89458e97b346546221e4ae', '凉山', 'liangshan', '0032102', 2, '5690b0534fe745e5ba0f504f0c260559', '凉山市', '');
INSERT INTO `sys_dictionaries` VALUES ('b1d50a7eb21f44389733e17831fd121d', '盘锦', 'panjin', '0031911', 11, 'b3366626c66c4b61881f09e1722e8495', '盘锦市', '');
INSERT INTO `sys_dictionaries` VALUES ('b21a81793ca6459f97c246ccbd543c67', '张掖', 'zhangye', '0030614', 14, '3283f1a77180495f9a0b192d0f9cdd35', '张掖市', '');
INSERT INTO `sys_dictionaries` VALUES ('b2356bf7a1d546709ac296de1bf2a9eb', '连云港', 'lianyungang', '0031703', 3, '577405ff648240959b3765c950598ab0', '连云港市', '');
INSERT INTO `sys_dictionaries` VALUES ('b2409f9c928f4dd1bd224809f54a1225', '宝坻区', 'baodiqu', '0032612', 12, '2c254799d3454f2cbc338ef5712548e9', '宝坻区', '');
INSERT INTO `sys_dictionaries` VALUES ('b2d4133b5dbf4599ada940620d2ab250', '黑龙江', 'heilongjiang', '00313', 13, '1', '黑龙江省', '');
INSERT INTO `sys_dictionaries` VALUES ('b3221428d30249d8acbb40f0f38d7a5c', '南宁', 'nanning', '0030811', 11, 'c5f3d426c582410281f89f1451e1d854', '南宁市', '');
INSERT INTO `sys_dictionaries` VALUES ('b3366626c66c4b61881f09e1722e8495', '辽宁', 'liaoning', '00319', 19, '1', '辽宁省', '');
INSERT INTO `sys_dictionaries` VALUES ('b38f0725533a47cea5d0f5f520ad72c7', '沙坪坝区', 'shapingbaqu', '0033106', 6, '1c85fbd06cf840d093f3640aca1b6b2d', '沙坪坝区', '');
INSERT INTO `sys_dictionaries` VALUES ('b4736703fc064dbe8b8440c79991a1ed', '大连', 'dalian', '0031904', 4, 'b3366626c66c4b61881f09e1722e8495', '大连市', '');
INSERT INTO `sys_dictionaries` VALUES ('b5329030086d470fa8cf6b38aaafb320', '随州', 'suizhou', '0031409', 9, '312b80775e104ba08c8244a042a658df', '随州市', '');
INSERT INTO `sys_dictionaries` VALUES ('b602b0bc378a46629cc37dc037eb9684', '课程', 'kecheng', '001', 1, '0', '课程', '');
INSERT INTO `sys_dictionaries` VALUES ('b68e669c229945ae86e053d15c277a6a', '惠州', 'huizhou', '0030706', 6, '0dd1f40bcb9d46aeba015dc19645a5b9', '惠州市', '');
INSERT INTO `sys_dictionaries` VALUES ('b7785f96730e4a35820e08da1c200c4d', '璧山区', 'bishanqu', '0033120', 20, '1c85fbd06cf840d093f3640aca1b6b2d', '璧山区', '');
INSERT INTO `sys_dictionaries` VALUES ('b84acd830f3b4c65bd82c97cc925badf', '自贡', 'zigong', '0032520', 20, 'd3538add7125404aba4b0007ef9fde50', '自贡市', '');
INSERT INTO `sys_dictionaries` VALUES ('b8e203af46924284a9a8be9851a557a2', '南开区', 'nankaiqu', '0032604', 4, '2c254799d3454f2cbc338ef5712548e9', '南开区', '');
INSERT INTO `sys_dictionaries` VALUES ('b908e46ac1544cb6a26f1e1fb22f2a94', '宜宾', 'yibin', '0032518', 18, 'd3538add7125404aba4b0007ef9fde50', '宜宾市', '');
INSERT INTO `sys_dictionaries` VALUES ('b9c02b885a4a49719b1000110ed47df4', '毕节', 'bijie', '0030902', 2, '592f6fcf45a74524aa8ea853fc9761d5', '毕节市', '');
INSERT INTO `sys_dictionaries` VALUES ('b9c8e39d06c24e0c92c0be41a5c6d1e1', '红色', 'red', '00201', 1, 'ce174640544549f1b31c8f66e01c111b', '红色', '');
INSERT INTO `sys_dictionaries` VALUES ('ba821dcfd50d4f64af1cd3eecc5f54e0', '海北', 'haibei', '0032202', 2, '5a80e3435c0e4dc09bafceeadb38e5f0', '海北', '');
INSERT INTO `sys_dictionaries` VALUES ('bbf9ff3b0fa444f18d70f2a4a9e45609', '绵阳', 'mianyang', '0032512', 12, 'd3538add7125404aba4b0007ef9fde50', '绵阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('bc2ec49f78204ea29cd666e2dc6583a2', '临沧', 'lincang', '0032910', 10, '510607a1836e4079b3103e14ec5864ed', '临沧', '');
INSERT INTO `sys_dictionaries` VALUES ('bc97087ea25547a794cec553d03c1abc', '那曲', 'naqu', '0032705', 5, '3e846b08dbbe495e93bc93f8f202de79', '那曲', '');
INSERT INTO `sys_dictionaries` VALUES ('bd1efd2194724213b72efa91fe3d5ddc', '浦东新区', 'pudongxinqu', '0030211', 11, 'f1ea30ddef1340609c35c88fb2919bee', '浦东新区', '');
INSERT INTO `sys_dictionaries` VALUES ('bdb65b22a7c447dcadbc6328292e5aef', '中山', 'zhongshan', '0030720', 20, '0dd1f40bcb9d46aeba015dc19645a5b9', '中山市', '');
INSERT INTO `sys_dictionaries` VALUES ('bdce443b39ba4cef8c0c0b75bdc8e253', '沈阳', 'shenyang', '0031912', 12, 'b3366626c66c4b61881f09e1722e8495', '沈阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('be33f1cad2954520bbf033e4198890f7', '亳州', 'bozhou', '0030403', 3, '249999f296d14f95b8138a30bbb2c374', '亳州市', '');
INSERT INTO `sys_dictionaries` VALUES ('be359cbd02944e1da5997ae560831db1', '定西', 'dingxi', '0030602', 2, '3283f1a77180495f9a0b192d0f9cdd35', '定西市', '');
INSERT INTO `sys_dictionaries` VALUES ('beaf0090ebf94ad9af5dd78e372611fe', '咸阳', 'xianyang', '0032408', 8, '534850c72ceb4a57b7dc269da63c330a', '咸阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('bff8ba692e4c4d78a23309ec0ad745c7', '桂林', 'guilin', '0030806', 6, 'c5f3d426c582410281f89f1451e1d854', '桂林市', '');
INSERT INTO `sys_dictionaries` VALUES ('c0170db89f2e48fe99bfdcd857fe2016', '承德', 'chengde', '0031103', 3, '75362368f22f4d60a810c2a45cced487', '承德市', '');
INSERT INTO `sys_dictionaries` VALUES ('c072c248c7ab47dda7bf24f5e577925c', '内蒙古', 'neimenggu', '00320', 20, '1', '内蒙古', '');
INSERT INTO `sys_dictionaries` VALUES ('c0e55c6a60564359859d87d25c249ac4', '锦州', 'jinzhou', '0031909', 9, 'b3366626c66c4b61881f09e1722e8495', '锦州市', '');
INSERT INTO `sys_dictionaries` VALUES ('c1875ba50f6d4e61870be000be8ee78e', '东丽区', 'dongliqu', '0032607', 7, '2c254799d3454f2cbc338ef5712548e9', '东丽区', '');
INSERT INTO `sys_dictionaries` VALUES ('c22083b403ba4ea698ba4dfc7245a317', '平凉', 'pingliang', '0030610', 10, '3283f1a77180495f9a0b192d0f9cdd35', '平凉市', '');
INSERT INTO `sys_dictionaries` VALUES ('c256624d6caa49979ebc4dce35006945', '武清区', 'wuqingqu', '0032611', 11, '2c254799d3454f2cbc338ef5712548e9', '武清区', '');
INSERT INTO `sys_dictionaries` VALUES ('c2e0fca8943d41ba8ec5d013e9bc3f41', '日喀则', 'rikaze', '0032706', 6, '3e846b08dbbe495e93bc93f8f202de79', '日喀则', '');
INSERT INTO `sys_dictionaries` VALUES ('c3717fb4891148a0bef623dbd746e7e6', '开封', 'kaifeng', '0031205', 5, '7336944efb4b40fcae9118fc9a970d2d', '开封市', '');
INSERT INTO `sys_dictionaries` VALUES ('c4817fc49be444e491920112aa9a3e32', '淮南', 'huainan', '0030410', 10, '249999f296d14f95b8138a30bbb2c374', '淮南市', '');
INSERT INTO `sys_dictionaries` VALUES ('c59f91630bef4289b71fcb2a48994582', '湖南', 'hunan', '00315', 15, '1', '湖南省', '');
INSERT INTO `sys_dictionaries` VALUES ('c5f3d426c582410281f89f1451e1d854', '广西', 'guangxi', '00308', 8, '1', '广西省', '');
INSERT INTO `sys_dictionaries` VALUES ('c7852784049a473c917863c5bc84dd95', '甘南', 'gannan', '0030603', 3, '3283f1a77180495f9a0b192d0f9cdd35', '甘南市', '');
INSERT INTO `sys_dictionaries` VALUES ('c7a5ba87961742f3b242ee4d30a55921', '营口', 'yingkou', '0031914', 14, 'b3366626c66c4b61881f09e1722e8495', '营口市', '');
INSERT INTO `sys_dictionaries` VALUES ('c8342c1dcf584cbf92f20d90a62a34bf', '平顶山', 'pingdingshan', '0031209', 9, '7336944efb4b40fcae9118fc9a970d2d', '平顶山市', '');
INSERT INTO `sys_dictionaries` VALUES ('c8d4119e57f84e71815769f03935e471', '黔东南', 'qiandongnan', '0030905', 5, '592f6fcf45a74524aa8ea853fc9761d5', '黔东南市', '');
INSERT INTO `sys_dictionaries` VALUES ('c928e9192e2f4f5ca06c6599371ff83c', '六安', 'lu\'an', '0030412', 12, '249999f296d14f95b8138a30bbb2c374', '六安市', '');
INSERT INTO `sys_dictionaries` VALUES ('c9811aef284b4ae8b8bf7698e90d8b3b', '泉州', 'quanzhou', '0030506', 6, 'd4066f6f425a4894a77f49f539f2a34f', '泉州市', '');
INSERT INTO `sys_dictionaries` VALUES ('c9df1fd73d0642eea8b050738f6ed9fa', '聊城', 'liaocheng', '0030308', 8, '10f46a521ea0471f8d71ee75ac3b5f3a', '聊城市', '');
INSERT INTO `sys_dictionaries` VALUES ('ca2e3717bb734c4b9142f29e36a31989', '株洲', 'zhuzhou', '0031502', 2, 'c59f91630bef4289b71fcb2a48994582', '株洲市', '');
INSERT INTO `sys_dictionaries` VALUES ('cabe896dba3a4a21ba194f8839a3eb98', '大渡口区', 'dadukouqu', '0033104', 4, '1c85fbd06cf840d093f3640aca1b6b2d', '大渡口区', '');
INSERT INTO `sys_dictionaries` VALUES ('caeba09845bf4a29960a840d4f436f09', '上饶', 'shangrao', '0031808', 8, 'cb3008cbd6ae4b5f8cebd2254ccb8603', '上饶市', '');
INSERT INTO `sys_dictionaries` VALUES ('cb3008cbd6ae4b5f8cebd2254ccb8603', '江西', 'jiangxi', '00318', 18, '1', '江西省', '');
INSERT INTO `sys_dictionaries` VALUES ('cc2aaa3ed3904d66a2f79676b14a1b49', '黔江区', 'qianjiangqu', '0033114', 14, '1c85fbd06cf840d093f3640aca1b6b2d', '黔江区', '');
INSERT INTO `sys_dictionaries` VALUES ('cd66a360619847d2b17989643f03dc8f', '济宁', 'jining', '0030306', 6, '10f46a521ea0471f8d71ee75ac3b5f3a', '济宁市', '');
INSERT INTO `sys_dictionaries` VALUES ('cd87ffcb742744d18bbce6928922a5be', '衡州', 'hengzhou', '0033007', 7, '6d846178376549ed878d11d109819f25', '衡州市', '');
INSERT INTO `sys_dictionaries` VALUES ('cdc1df5961994a9d94751003edd0fc58', '宿州', 'suzhou', '0030414', 14, '249999f296d14f95b8138a30bbb2c374', '宿州市', '');
INSERT INTO `sys_dictionaries` VALUES ('cddd155314404710bd1ab3fa51d80cf2', '天水', 'tianshui', '0030612', 12, '3283f1a77180495f9a0b192d0f9cdd35', '天水市', '');
INSERT INTO `sys_dictionaries` VALUES ('ce0dcc5a66dd44b3b9a42aef4aa8b4ba', '蚌埠', 'bengbu', '0030402', 2, '249999f296d14f95b8138a30bbb2c374', '蚌埠市', '');
INSERT INTO `sys_dictionaries` VALUES ('ce174640544549f1b31c8f66e01c111b', '颜色', 'yanse', '002', 2, '0', '颜色', '');
INSERT INTO `sys_dictionaries` VALUES ('cf632a4f4de54b619ad5cb6835f35434', '玉林', 'yulin', '0030814', 14, 'c5f3d426c582410281f89f1451e1d854', '玉林市', '');
INSERT INTO `sys_dictionaries` VALUES ('cf7d29feb2c34cbfaf4e28896ca577e4', '巴彦淖尔', 'bayannaoer', '0032002', 2, 'c072c248c7ab47dda7bf24f5e577925c', '巴彦淖尔', '');
INSERT INTO `sys_dictionaries` VALUES ('cfb2df83812d4fabb10ba91e98be9467', '黑河', 'heihe', '0031305', 5, 'b2d4133b5dbf4599ada940620d2ab250', '黑河市', '');
INSERT INTO `sys_dictionaries` VALUES ('cfee5c9833664e0aba76267389e4adbd', '丰台区', 'fengtaiqu', '0030104', 4, '12a62a3e5bed44bba0412b7e6b733c93', '丰台区', '');
INSERT INTO `sys_dictionaries` VALUES ('d13b01a607e34fdfa16deb7292a0f299', '鹤壁', 'hebi', '0031202', 2, '7336944efb4b40fcae9118fc9a970d2d', '鹤壁市', '');
INSERT INTO `sys_dictionaries` VALUES ('d1646344b9cc45018c3a347f6dc6c77b', '红桥区', 'hongqiaoqu', '0032606', 6, '2c254799d3454f2cbc338ef5712548e9', '红桥区', '');
INSERT INTO `sys_dictionaries` VALUES ('d26fc248d49c4a71b2a003033adc88de', '娄底', 'loudi', '0031513', 13, 'c59f91630bef4289b71fcb2a48994582', '娄底市', '');
INSERT INTO `sys_dictionaries` VALUES ('d3538add7125404aba4b0007ef9fde50', '四川', 'sichuan', '00325', 25, '1', '四川省', '');
INSERT INTO `sys_dictionaries` VALUES ('d3c2d3b9184b4e3185ca6bdbe73c5cff', '襄樊', 'xiangfan', '0031414', 14, '312b80775e104ba08c8244a042a658df', '襄樊市', '');
INSERT INTO `sys_dictionaries` VALUES ('d3c76818757942fba8ebf8246fa257a9', '咸宁', 'xianning', '0031413', 13, '312b80775e104ba08c8244a042a658df', '咸宁市', '');
INSERT INTO `sys_dictionaries` VALUES ('d4066f6f425a4894a77f49f539f2a34f', '福建', 'fujian', '00305', 5, '1', '福建省', '');
INSERT INTO `sys_dictionaries` VALUES ('d4131ecb91d3435db1dbd770ac39221f', '鞍山', 'anshan', '0031901', 1, 'b3366626c66c4b61881f09e1722e8495', '鞍山市', '');
INSERT INTO `sys_dictionaries` VALUES ('d42e09432d10454caecf1d4335aca1da', '合肥', 'hefei', '0030408', 8, '249999f296d14f95b8138a30bbb2c374', '合肥市', '');
INSERT INTO `sys_dictionaries` VALUES ('d4f8ba23c3ef4fbaa00c8f8a7c047bf1', '商丘', 'shangqiu', '0031212', 12, '7336944efb4b40fcae9118fc9a970d2d', '商丘市', '');
INSERT INTO `sys_dictionaries` VALUES ('d5f5462779bc4976a3fbcbdeba45ed00', '丽水', 'lishui', '0033005', 5, '6d846178376549ed878d11d109819f25', '丽水市', '');
INSERT INTO `sys_dictionaries` VALUES ('d5f621c6fab44d1eab1bdafd9d08e042', '绍兴', 'shaoxing', '0033008', 8, '6d846178376549ed878d11d109819f25', '绍兴市', '');
INSERT INTO `sys_dictionaries` VALUES ('d7443dcd45704a27981810fc32b93390', '潍坊', 'weifang', '0030314', 14, '10f46a521ea0471f8d71ee75ac3b5f3a', '潍坊市', '');
INSERT INTO `sys_dictionaries` VALUES ('d7c388a2ed58414a9bd4dfbedf6858b3', '顺义区', 'shunyiqu', '0030110', 10, '12a62a3e5bed44bba0412b7e6b733c93', '顺义区', '');
INSERT INTO `sys_dictionaries` VALUES ('d7e006b55b96491282e9c2e672d35a34', '克拉玛依', 'kelamayi', '0032808', 8, '2fabed91c6d94e698ed449165cd250ca', '克拉玛依', '');
INSERT INTO `sys_dictionaries` VALUES ('d7e25a4040694008b4cb8aa322f77ad9', '张家界', 'zhangjiajie', '0031508', 8, 'c59f91630bef4289b71fcb2a48994582', '张家界市', '');
INSERT INTO `sys_dictionaries` VALUES ('d80455402bc44d2ca15e905913301fb2', '焦作', 'jiaozuo', '0031204', 4, '7336944efb4b40fcae9118fc9a970d2d', '焦作市', '');
INSERT INTO `sys_dictionaries` VALUES ('d90a14bfbfe44a3e8d60bda8f8f362a6', '铜仁', 'tongren', '0030908', 8, '592f6fcf45a74524aa8ea853fc9761d5', '铜仁市', '');
INSERT INTO `sys_dictionaries` VALUES ('da583c36f6754d498176755c93db8d7c', '遂宁', 'suining', '0032516', 16, 'd3538add7125404aba4b0007ef9fde50', '遂宁市', '');
INSERT INTO `sys_dictionaries` VALUES ('db3b9c7116bc49e3a65fa641dd82155d', '红河', 'honghe', '0032907', 7, '510607a1836e4079b3103e14ec5864ed', '红河', '');
INSERT INTO `sys_dictionaries` VALUES ('db6336fcf27f4c00b37513ff0e368ae6', '长宁区', 'changningqu', '0030203', 3, 'f1ea30ddef1340609c35c88fb2919bee', '长宁区', '');
INSERT INTO `sys_dictionaries` VALUES ('db77fd88654c4014a71d541171d2795b', '西安', 'xi\'an', '0032407', 7, '534850c72ceb4a57b7dc269da63c330a', '西安市', '');
INSERT INTO `sys_dictionaries` VALUES ('dc022922169446549dfac0de221d2a4d', '雅安', 'ya\'an', '0032517', 17, 'd3538add7125404aba4b0007ef9fde50', '雅安市', '');
INSERT INTO `sys_dictionaries` VALUES ('dc9b2098188f4b5c93aec5c9bbfb895d', '吕梁', 'lvliang', '0032306', 6, '023473e9e6204583a110531036357514', '吕梁市', '');
INSERT INTO `sys_dictionaries` VALUES ('dcbcde16e75643f9b8dd4b6293c87dd5', '滨州', 'binzhou', '0030302', 2, '10f46a521ea0471f8d71ee75ac3b5f3a', '滨州市', '');
INSERT INTO `sys_dictionaries` VALUES ('dcd0ca1cde8f420dbfecbac4cf1506ee', '巴州', 'bazhou', '0032803', 3, '2fabed91c6d94e698ed449165cd250ca', '巴州', '');
INSERT INTO `sys_dictionaries` VALUES ('dcd445ef42c9484bbd14bacd02bebf37', '郑州', 'zhengzhou', '0031216', 16, '7336944efb4b40fcae9118fc9a970d2d', '郑州市', '');
INSERT INTO `sys_dictionaries` VALUES ('dcf99d941ca44b30915e16a4048d5004', '益阳', 'yiyang', '0031509', 9, 'c59f91630bef4289b71fcb2a48994582', '益阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('dee1fa3295ec42219815769d00fabe70', '迪庆', 'diqing', '0032906', 6, '510607a1836e4079b3103e14ec5864ed', '迪庆', '');
INSERT INTO `sys_dictionaries` VALUES ('e06c4a42478b4853827911b8adac6def', '庆阳', 'qingyang', '0030611', 11, '3283f1a77180495f9a0b192d0f9cdd35', '庆阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('e1204d4286834046886f26ae6af0722a', '湘潭', 'xiangtan', '0031503', 3, 'c59f91630bef4289b71fcb2a48994582', '湘潭市', '');
INSERT INTO `sys_dictionaries` VALUES ('e15cb9bb072248628b7ec481b6337229', '六盘水', 'liupanshui', '0030904', 4, '592f6fcf45a74524aa8ea853fc9761d5', '六盘水市', '');
INSERT INTO `sys_dictionaries` VALUES ('e1bbd9b635e140ee8fcf0dc06743519b', '廊坊', 'langfang', '0031106', 6, '75362368f22f4d60a810c2a45cced487', '廊坊市', '');
INSERT INTO `sys_dictionaries` VALUES ('e384a07d11bf413eb83cd490939ca7a2', '綦江区', 'qijiangqu', '0033110', 10, '1c85fbd06cf840d093f3640aca1b6b2d', '綦江区', '');
INSERT INTO `sys_dictionaries` VALUES ('e3ca4d54f3354ba5b17e1f93415ceb1a', '云浮', 'yunfu', '0030717', 17, '0dd1f40bcb9d46aeba015dc19645a5b9', '云浮市', '');
INSERT INTO `sys_dictionaries` VALUES ('e4adf72e96ee4b7fa3528ee5ba4eb5cf', '梧州', 'wuzhou', '0030813', 13, 'c5f3d426c582410281f89f1451e1d854', '梧州市', '');
INSERT INTO `sys_dictionaries` VALUES ('e556d8e5e148406883e1a83d6595e406', '铜梁区', 'tongliangqu', '0033121', 21, '1c85fbd06cf840d093f3640aca1b6b2d', '铜梁区', '');
INSERT INTO `sys_dictionaries` VALUES ('e7200f8c6dce4ea193bf33f55d9fd192', '池州', 'chizhou', '0030405', 5, '249999f296d14f95b8138a30bbb2c374', '池州市', '');
INSERT INTO `sys_dictionaries` VALUES ('e7de6c7b752040b2bd3175641d83d128', '哈尔滨', 'haerbin', '0031303', 3, 'b2d4133b5dbf4599ada940620d2ab250', '哈尔滨市', '');
INSERT INTO `sys_dictionaries` VALUES ('e8311a6f0ab4495484fdf24902ee97cc', '新余', 'xinyu', '0031809', 9, 'cb3008cbd6ae4b5f8cebd2254ccb8603', '新余市', '');
INSERT INTO `sys_dictionaries` VALUES ('e9a653c9850c46bc9e2e1916de643a52', '楚雄', 'chuxiong', '0032903', 3, '510607a1836e4079b3103e14ec5864ed', '楚雄', '');
INSERT INTO `sys_dictionaries` VALUES ('ec0eed6293294d58aa56f6c381263288', '郴州', 'chenzhou', '0031510', 10, 'c59f91630bef4289b71fcb2a48994582', '郴州市', '');
INSERT INTO `sys_dictionaries` VALUES ('ec107e60189346adb2b5749d6f6fe074', '德宏', 'dehong', '0032905', 5, '510607a1836e4079b3103e14ec5864ed', '德宏', '');
INSERT INTO `sys_dictionaries` VALUES ('ec892838cf4944cc8b330216f02de1e6', '津南区', 'jinnanqu', '0032609', 9, '2c254799d3454f2cbc338ef5712548e9', '津南区', '');
INSERT INTO `sys_dictionaries` VALUES ('ec96c3771161459c99eb01124db7aa8a', '三门峡', 'sanmenxia', '0031211', 11, '7336944efb4b40fcae9118fc9a970d2d', '三门峡市', '');
INSERT INTO `sys_dictionaries` VALUES ('eca8a2f4e2534f77b7bccf263139d8c7', '内江', 'neijiang', '0032513', 13, 'd3538add7125404aba4b0007ef9fde50', '内江市', '');
INSERT INTO `sys_dictionaries` VALUES ('ecb8f08c1408495bb31842c221d3edb4', '渝北区', 'yubeiqu', '0033112', 12, '1c85fbd06cf840d093f3640aca1b6b2d', '渝北区', '');
INSERT INTO `sys_dictionaries` VALUES ('ed5391a7608b4a61a24d95f2384f2131', '阜新', 'fuxin', '0031907', 7, 'b3366626c66c4b61881f09e1722e8495', '阜新市', '');
INSERT INTO `sys_dictionaries` VALUES ('ed5b3d39695f496d88c37f56508d6447', '仙桃', 'xiantao', '0031412', 12, '312b80775e104ba08c8244a042a658df', '仙桃市', '');
INSERT INTO `sys_dictionaries` VALUES ('ed97335f8b3d42fabfd89993bc68475d', '海南', 'hainan', '0032204', 4, '5a80e3435c0e4dc09bafceeadb38e5f0', '海南', '');
INSERT INTO `sys_dictionaries` VALUES ('ede65c49ae624ef8900414298f79a438', '乌海', 'wuhai', '0032009', 9, 'c072c248c7ab47dda7bf24f5e577925c', '乌海市', '');
INSERT INTO `sys_dictionaries` VALUES ('f0570e2fe4644e32af5c5401e8c371ba', '盐城', 'yancheng', '0031711', 11, '577405ff648240959b3765c950598ab0', '盐城市', '');
INSERT INTO `sys_dictionaries` VALUES ('f0eb076930844fe18fdd8dcf5fc1f56e', '塔城', 'tacheng', '0032810', 10, '2fabed91c6d94e698ed449165cd250ca', '塔城', '');
INSERT INTO `sys_dictionaries` VALUES ('f16ddc177870477685297a6abb157637', '朔州', 'shuozhou', '0032307', 7, '023473e9e6204583a110531036357514', '朔州市', '');
INSERT INTO `sys_dictionaries` VALUES ('f1e2cdd9518c4ac2b5e1ea52985b9771', '果洛', 'guoluo', '0032201', 1, '5a80e3435c0e4dc09bafceeadb38e5f0', '果洛', '');
INSERT INTO `sys_dictionaries` VALUES ('f1ea30ddef1340609c35c88fb2919bee', '上海', 'shanghai', '00302', 2, '1', '上海', '');
INSERT INTO `sys_dictionaries` VALUES ('f260eee573dc48fca1572b228d280849', '版纳', 'banna', '0032901', 1, '510607a1836e4079b3103e14ec5864ed', '版纳', '');
INSERT INTO `sys_dictionaries` VALUES ('f389ad0eb7884c4d91d4f31312bc8771', '萍乡', 'pingxiang', '0031807', 7, 'cb3008cbd6ae4b5f8cebd2254ccb8603', '萍乡市', '');
INSERT INTO `sys_dictionaries` VALUES ('f416737f56924f7cb642a75f57b1530a', '渭南', 'weinan', '0032406', 6, '534850c72ceb4a57b7dc269da63c330a', '渭南市', '');
INSERT INTO `sys_dictionaries` VALUES ('f498d09200ba48df9d6e281776eba4f8', '徐州', 'xuzhou', '0031710', 10, '577405ff648240959b3765c950598ab0', '徐州市', '');
INSERT INTO `sys_dictionaries` VALUES ('f4bdd6b8f0704479a6d051f52d62d693', '河池', 'hechi', '0030807', 7, 'c5f3d426c582410281f89f1451e1d854', '河池市', '');
INSERT INTO `sys_dictionaries` VALUES ('f4f2434769b842afbbf1791018b69800', '河北区', 'hebeiqu', '0032605', 5, '2c254799d3454f2cbc338ef5712548e9', '河北区', '');
INSERT INTO `sys_dictionaries` VALUES ('f57d2b8d983f43d5a035a596b690445b', '金山区', 'jinshanqu', '0030212', 12, 'f1ea30ddef1340609c35c88fb2919bee', '金山区', '');
INSERT INTO `sys_dictionaries` VALUES ('f6337bdeefa44b0db9f35fe2fe7d6d6f', '十堰', 'shiyan', '0031408', 8, '312b80775e104ba08c8244a042a658df', '十堰市', '');
INSERT INTO `sys_dictionaries` VALUES ('f661c388a73d478699a2c1c5909b45f1', '三亚', 'sanya', '0031002', 2, '2ba8e6d0fd944983aa19b781c6b53477', '三亚市', '');
INSERT INTO `sys_dictionaries` VALUES ('f6ff36eb35414a5dacf7ccc0c479d2ea', '宿迁', 'suqian', '0031707', 7, '577405ff648240959b3765c950598ab0', '宿迁市', '');
INSERT INTO `sys_dictionaries` VALUES ('f775a440cb004c63b0b3d3429b58a1e6', '衡水', 'hengshui', '0031105', 5, '75362368f22f4d60a810c2a45cced487', '衡水市', '');
INSERT INTO `sys_dictionaries` VALUES ('f845a1c0a62b45bfbf358688eec3680d', '巢湖', 'chaohu', '0030404', 4, '249999f296d14f95b8138a30bbb2c374', '巢湖市', '');
INSERT INTO `sys_dictionaries` VALUES ('f9565fe7c0a348ba949131645d20e8fa', '恩施', 'enshi', '0031402', 2, '312b80775e104ba08c8244a042a658df', '恩施市', '');
INSERT INTO `sys_dictionaries` VALUES ('f970bd1da8f94bfa92206fa94d595cbb', '锡林郭勒盟', 'xilinguolemeng', '0032011', 11, 'c072c248c7ab47dda7bf24f5e577925c', '锡林郭勒盟', '');
INSERT INTO `sys_dictionaries` VALUES ('f9a9156f0e9e41438e823f93070248bd', '濮阳', 'puyang', '0031210', 10, '7336944efb4b40fcae9118fc9a970d2d', '濮阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('f9ceff59e02c4be3a4b20aa806c1ec0d', '呼和浩特', 'huhehaote', '0032006', 6, 'c072c248c7ab47dda7bf24f5e577925c', '呼和浩特市', '');
INSERT INTO `sys_dictionaries` VALUES ('fa2ff170919e406d9d5547ff09d14d0d', '双鸭山', 'shuangyashan', '0031311', 11, 'b2d4133b5dbf4599ada940620d2ab250', '双鸭山市', '');
INSERT INTO `sys_dictionaries` VALUES ('fa3446ef035546c09c1f27268b43b937', '南京', 'nanjing', '0031704', 4, '577405ff648240959b3765c950598ab0', '南京市', '');
INSERT INTO `sys_dictionaries` VALUES ('fc70429d9b8146e0ac31ce38410e2cb7', '南阳', 'nanyang', '0031208', 8, '7336944efb4b40fcae9118fc9a970d2d', '南阳市', '');
INSERT INTO `sys_dictionaries` VALUES ('fd06b72a41654fcfbfe2c3327ca4e9fc', '珠海', 'zhuhai', '0030721', 21, '0dd1f40bcb9d46aeba015dc19645a5b9', '珠海市', '');
INSERT INTO `sys_dictionaries` VALUES ('fd1d83119c414e56b3a35052c9d6dd0f', '文山', 'wenshan', '0032914', 14, '510607a1836e4079b3103e14ec5864ed', '文山', '');
INSERT INTO `sys_dictionaries` VALUES ('fd2a0cad70c643528587d1ccde4c5530', '铜川', 'tongchuan', '0032405', 5, '534850c72ceb4a57b7dc269da63c330a', '铜川市', '');
INSERT INTO `sys_dictionaries` VALUES ('fd79801a69ad4ec5857df82358c26368', '江北区', 'jiangbeiqu', '0033105', 5, '1c85fbd06cf840d093f3640aca1b6b2d', '江北区', '');
INSERT INTO `sys_dictionaries` VALUES ('ff880943e156482ea50d1ece4ff233a6', '昌吉州', 'changjizhou', '0032805', 5, '2fabed91c6d94e698ed449165cd250ca', '昌吉州', '');
INSERT INTO `sys_dictionaries` VALUES ('ffb2cc1e96fe485b94335589315ab38c', '临汾', 'linfen', '0032305', 5, '023473e9e6204583a110531036357514', '临汾市', '');
INSERT INTO `sys_dictionaries` VALUES ('ffd838f71da648319bfe4f176e0e209f', '晋中', 'jinzhong', '0032304', 4, '023473e9e6204583a110531036357514', '晋中市', '');
INSERT INTO `sys_dictionaries` VALUES ('ffeaa196501d4f35a486e42be17f2986', '枣庄', 'zaozhuang', '0030316', 16, '10f46a521ea0471f8d71ee75ac3b5f3a', '枣庄市', '');

-- ----------------------------
-- Table structure for sys_fhbutton
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhbutton`;
CREATE TABLE `sys_fhbutton`  (
  `FHBUTTON_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `QX_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FHBUTTON_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_fhbutton
-- ----------------------------
INSERT INTO `sys_fhbutton` VALUES ('3542adfbda73410c976e185ffe50ad06', '导出EXCEL', 'toExcel', '导出EXCEL');
INSERT INTO `sys_fhbutton` VALUES ('46992ea280ba4b72b29dedb0d4bc0106', '发邮件', 'email', '发送电子邮件');
INSERT INTO `sys_fhbutton` VALUES ('4c7f34b9eed54683957f356afcda24df', '组织机构数据权限', 'Datajur', '组织机构数据权限按钮');
INSERT INTO `sys_fhbutton` VALUES ('4efa162fce8340f0bd2dcd3b11d327ec', '导入EXCEL', 'FromExcel', '导入EXCEL到系统用户');
INSERT INTO `sys_fhbutton` VALUES ('cc51b694d5344d28a9aa13c84b7166cd', '发短信', 'sms', '发送短信');
INSERT INTO `sys_fhbutton` VALUES ('da7fd386de0b49ce809984f5919022b8', '站内信', 'FHSMS', '发送站内信');
INSERT INTO `sys_fhbutton` VALUES ('fc5e8767b4564f34a0d2ce2375fcc92e', '绑定用户', 'userBinding', '绑定用户');

-- ----------------------------
-- Table structure for sys_fhlog
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhlog`;
CREATE TABLE `sys_fhlog`  (
  `FHLOG_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `USERNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `CZTIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作时间',
  `CONTENT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件',
  PRIMARY KEY (`FHLOG_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_fhlog
-- ----------------------------
INSERT INTO `sys_fhlog` VALUES ('001d288c6f6349239d66dba64726c727', 'admin', '2017-11-21 18:56:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0027d18aaf014f95961e04876e6b8b85', 'admin', '2017-12-16 11:14:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('002e31b8f9ec4acaab238f49b5c5b7eb', 'admin', '2018-07-25 15:48:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('003641b73a294549ac6605f72c85b9ec', 'admin', '2018-01-05 09:31:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('003958704b15403a91492b795ba06d29', 'admin', '2018-08-22 09:20:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('00402f2e896a49ceb3c70a66a0e989c3', 'admin', '2018-08-23 17:31:01', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('00448f0374b546da8841156df3700b3c', 'admin', '2017-11-04 15:15:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('00691f0a19cf432dafdde2c42ff80be3', 'admin', '2018-07-13 16:44:32', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('008165790bdb4f3f82a9b25314b647d2', 'admin', '2018-08-02 16:08:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('009bdca5e7c042ada5d34dfb89c5243a', 'admin', '2018-07-13 16:42:24', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('00e479154a3c4c83ac0f90bc5bfb9a22', 'admin', '2018-07-13 16:41:50', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('00ef870971be43808d6d15ff5c1ad157', 'admin', '2017-12-15 11:02:49', '修改角色:中级代理');
INSERT INTO `sys_fhlog` VALUES ('0105dbbf42f34b638b2003bf51852ba6', 'admin', '2018-08-17 09:48:59', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('010a9a42c9334245bf5c7221488ba9ee', 'admin', '2017-08-03 11:31:00', '退出');
INSERT INTO `sys_fhlog` VALUES ('0121fbe3ec1945b6bd20a621b0c57213', 'admin', '2017-12-15 10:09:28', '修改菜单商家管理');
INSERT INTO `sys_fhlog` VALUES ('012ec9c82eca4a15bd2e32da6be10dc5', 'admin', '2017-12-13 16:38:09', '新增系统用户：15999999999');
INSERT INTO `sys_fhlog` VALUES ('01345f65791b475d8035cc23b5f9d5cd', 'admin', '2018-08-13 18:28:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('01457f1d7107422fba246af4a0bd821a', 'admin', '2018-07-13 16:42:53', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('014a3f12131f42f68e48726758b59ed3', 'admin', '2018-07-13 16:44:16', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('01618f6cde804e8d9d1f7f5a8262d557', 'admin', '2017-12-13 10:41:35', '新增系统用户：18733333333');
INSERT INTO `sys_fhlog` VALUES ('0163a6f7364940e4a468f21ebbaedee8', 'admin', '2017-11-22 15:06:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('016be0fe22754411bf8ad748167f987c', 'admin', '2018-08-13 18:24:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('016be8ae17224c13961a38c20fedcdeb', 'admin', '2017-07-31 20:20:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0174ee806f874dc2bef6f1a8c57e826c', 'admin', '2018-08-17 10:01:12', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('017d873240554250a9b17deba32d17c4', 'admin', '2017-11-08 14:35:30', '修改系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('0182ce9d47764e20bb92cfac01cdcbeb', 'admin', '2018-07-13 16:44:32', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0187a813791f45beac5a4600575414b7', 'admin', '2018-08-18 13:45:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('01ad4625c2fe465e82966c945ed8e209', 'admin', '2017-11-24 09:52:49', '退出');
INSERT INTO `sys_fhlog` VALUES ('01b206419cce4d87ae1ce66ceb73859f', 'admin', '2017-10-31 14:46:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('01b33cddc412435dbb06258aa348ab91', 'admin', '2017-11-08 19:57:31', '删除菜单ID52');
INSERT INTO `sys_fhlog` VALUES ('01c6087500c6475182ba7e6b902c5adf', 'admin', '2017-11-08 19:56:36', '删除菜单ID67');
INSERT INTO `sys_fhlog` VALUES ('01c64e8f7e8f4d1dbd09c35a909279cf', 'admin', '2018-08-22 18:44:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('01cb258243454a4582ada4f3b7d7bd95', 'admin', '2017-11-04 12:49:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('01e57cc59b9144faa1ad73fc4aa06fc4', 'admin', '2018-07-13 16:42:37', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('01ef977627644f5f9b41b3a9e7776cac', 'admin', '2018-08-23 16:11:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('01f15e99ca254cec8b3f7ff7df98b78c', 'admin', '2018-07-13 16:42:40', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('01fdf2410b9545efbf5567ae1910a8bd', 'admin', '2017-09-10 17:12:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('02002b7673dc40abacd7e9eb06eef290', 'admin', '2018-07-13 16:44:29', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('02278c8b2ae64f08838a7d749cf8695b', 'admin', '2018-08-10 17:48:19', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('022c95f0978542c5a65e5d4e260f7fdc', 'admin', '2018-08-14 15:47:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('02417fd2c24e4a3f9e3f2d63a2ffbcca', 'admin', '2017-11-06 17:35:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('024ec8e669cc4b77880123c2660cee02', 'admin', '2017-11-18 14:10:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('025102f2935048408250f47812c29194', 'admin', '2018-08-17 10:39:41', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0263e6895ca940af96ba5d68c168e0a0', 'admin', '2018-08-08 16:54:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('02681e0aaf4944ca94ba368be676c5cc', 'admin', '2018-07-27 10:20:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('026db8eb5ed240af8551b85c0debae3d', '18990673099', '2018-03-19 21:00:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('02a8f19caefa4ef3bda09c7ff01ef80d', 'admin', '2017-11-22 19:20:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('02b21c247b2546369f42103aa18d0522', 'admin', '2017-11-24 09:54:13', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('02c868e8a4064859b7044ec9e8ba38ea', 'admin', '2017-11-04 15:46:12', '批量删除user');
INSERT INTO `sys_fhlog` VALUES ('02d859142f3f4676964663e4c337ba63', 'admin', '2017-11-29 19:42:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('02e66c9bb8e04f60a43e75d54a1b8da9', 'admin', '2017-12-16 11:31:24', '删除系统用户：PageData [map={USER_ID=3523506e2a5745278ef157c0a0101920, tm=1513395084732}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@17459c6]');
INSERT INTO `sys_fhlog` VALUES ('02e6dbe99e1046aa9468d270934ee7a7', 'admin', '2018-08-17 10:39:41', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('02e98e99ed2a43198c11c50630dc39f3', 'admin', '2018-08-13 13:40:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('02fb88f2072240269666a90094474380', 'admin', '2017-11-22 14:56:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('030c6335f5d3451a898f5b97c9c03cb6', 'admin', '2018-03-15 11:36:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0351e03959434136a2c4f1a0ef193e6e', 'admin', '2018-01-12 10:32:31', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0357ad8f1ed74d3b83c8660a0d71ce20', 'admin', '2017-11-04 12:38:20', '修改积分提成:3');
INSERT INTO `sys_fhlog` VALUES ('036ff2abe4fa44e7bdb6a51211f659d5', 'admin', '2018-08-23 14:56:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('03789c31b20e439abe6dedbd7fde8575', 'admin', '2018-08-16 17:56:12', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('0378fdf538ac438c887149b808713cf3', '18990673099', '2018-04-10 14:25:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('03794b147f1f4d3d95b210fa0b055b59', 'admin', '2017-07-31 20:40:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('038278bfd311469cbf0e2600ac5dbbe7', 'admin', '2018-08-17 10:32:33', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('03903e6d49014b4c8700a4fe962388e9', 'admin', '2017-11-22 18:50:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('03951cb88f2f4fca86bd9a178802150f', 'admin', '2017-02-05 12:06:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('03986ad172524c738198c5b19d5587dd', 'admin', '2018-07-13 16:44:23', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('039aac7c623c4301bf70f55a51243883', 'admin', '2017-11-18 12:58:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('039b36380d324aff9b21ed34f1298a4d', 'admin', '2017-11-04 17:56:16', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('039c23bf152e4fe8a8532b91623a30da', 'admin', '2018-01-28 19:47:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('039d4220a80f4320a4a24173883e7671', 'admin', '2017-11-18 14:14:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('03c2463e66474f2da4e1aea152c6575a', 'admin', '2018-08-11 15:36:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('03de2e37f75a4d5290685bef0f93726d', 'admin', '2017-12-25 13:48:44', '删除菜单ID105');
INSERT INTO `sys_fhlog` VALUES ('03e723e89e9343488da382481fe937e4', 'admin', '2018-08-09 16:37:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('03f9f5e0a5ba4d29b603930775047ce6', 'admin', '2017-02-13 02:14:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('04012693b92346f2b9dff391e2a04f7f', 'admin', '2018-07-13 16:44:36', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('04012a9954fe47e18776887a267a7a76', 'admin', '2018-08-13 18:23:18', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('041a7d3bb1364046a9823bba82cce363', 'admin', '2018-02-05 16:29:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('042e208b4dc84af8a00c85377a72e7cb', 'admin', '2017-12-08 09:15:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('043153d7781b4706a8968941611c48d8', 'admin', '2018-03-13 21:28:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('044348d120c449e59e630452fa0d7b5e', 'admin', '2017-11-17 19:25:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('04438a50362843609ba3465ff2d2831f', 'admin', '2018-01-06 09:13:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('044a3a5983b04583a2cee32159a692c8', '18990673099', '2018-03-04 11:53:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0450e0e5682841668f57f7f60862fe1d', 'admin', '2018-08-15 17:43:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0451a785e53a4db18c133e042935404d', 'admin', '2018-08-10 17:14:25', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('047044837c9545acb4b31f630e5199be', 'admin', '2018-03-15 11:35:52', '退出');
INSERT INTO `sys_fhlog` VALUES ('0472d3395c98457ea3da171a7a9e4806', 'admin', '2017-11-04 12:05:17', '修改角色:注册用户');
INSERT INTO `sys_fhlog` VALUES ('047c6f2f96ff43079d60e84229f1f5a8', 'admin', '2017-12-05 09:43:50', '新增角色:工人3');
INSERT INTO `sys_fhlog` VALUES ('04908bf3c7f7467b99eb39bf1534556e', 'admin', '2018-07-13 16:41:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('049bb67ed3c64d58ad8438eb3f60b777', 'admin', '2017-12-14 17:23:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('049f11704b4f49b7ba9b1578104da14c', '18990673099', '2018-03-09 19:02:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('04b2c8bce8d542c99863d75ad9100bc5', 'admin', '2017-08-31 15:30:49', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('04b51282edc04b8baa528ca652f038a7', 'admin', '2018-08-17 09:45:59', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('04bdd43564a048ad8496fec2b08a7232', 'admin', '2018-08-16 18:04:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('04ce339f6bbd4f058bc9bafd1e675e9d', 'admin', '2017-03-16 01:04:04', '退出');
INSERT INTO `sys_fhlog` VALUES ('04ce4c57488b4f619cc2b577cccbeee7', 'admin', '2018-07-13 16:44:27', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('04d05ca22e974ab9b2fca36e7b9f6748', 'admin', '2018-08-17 09:48:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('051ae497603948edba0b3777b2bbe5b8', 'admin', '2018-08-23 17:29:54', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('0523d001d6794f4eb4c14aeede6c9d0f', 'admin', '2017-11-10 10:35:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0525b3a8014f4fbca004dbf619c75aeb', 'admin', '2017-11-17 10:10:35', '退出');
INSERT INTO `sys_fhlog` VALUES ('0548f1e1aae64b73821bc95873ac36d1', 'admin', '2017-11-04 12:30:52', '修改角色:注册用户');
INSERT INTO `sys_fhlog` VALUES ('056d7e7e7b79427d99213b6e2657c8c2', 'admin', '2017-07-31 21:48:14', '新增菜单待评论');
INSERT INTO `sys_fhlog` VALUES ('057da965d38d4ffebea84c2040bf1af7', 'admin', '2018-08-02 19:28:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('058c7f99a6ae4ac1b2729f2218a6e994', 'admin', '2018-08-17 09:58:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('05a103d165454433aa5b1bf7d871c648', 'admin', '2017-12-25 13:48:21', '删除菜单ID113');
INSERT INTO `sys_fhlog` VALUES ('05be361a8f8941efa9dc63bf31f60210', 'admin', '2018-07-28 09:21:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('05d582a5d9f54dc291c63b7664eb0c1f', 'admin', '2018-08-14 15:18:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('05d8ef25911c4736a0dcbba6fa15929e', 'admin', '2018-08-13 18:24:43', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('05db6cce7d524a8aa72f9bc6da92fda8', 'admin', '2017-03-16 01:03:30', '退出');
INSERT INTO `sys_fhlog` VALUES ('05dc610b119f4b82a78f34a94a9effcd', 'admin', '2018-08-16 18:06:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('05dd0900c0a84c0c9d2da85d1f46036b', 'admin', '2017-11-04 09:29:12', '删除角色ID为:5466347ac07044cb8d82990ec7f3a90e');
INSERT INTO `sys_fhlog` VALUES ('05de8d95811c4908bfbe021d740d2d25', 'admin', '2017-09-06 09:11:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('05e1b0eef6d644608e338e694f80737e', 'admin', '2017-12-04 16:18:50', '修改角色:客服');
INSERT INTO `sys_fhlog` VALUES ('05e6f057b2334467b64395d981f88e70', 'admin', '2018-07-13 16:43:27', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('05e88c48e4af43c3a5cfe2d6e5ef02d3', 'admin', '2017-11-08 14:09:07', '删除系统用户：PageData [map={USER_ID=9a92a7c0e5a74a1186afaf3c07016ae3, tm=1510121347102}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@885474]');
INSERT INTO `sys_fhlog` VALUES ('05f1cf14e022410a80ab069a4c417564', 'admin', '2018-08-23 10:09:50', '修改菜单进货单');
INSERT INTO `sys_fhlog` VALUES ('05fe81f297914ff38bacfb3546ad58b5', 'admin', '2017-11-17 10:39:35', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('05ff55e1288e47b999876f401c26d42d', 'admin', '2017-11-04 18:40:46', '删除系统用户：PageData [map={tm=1509792046046, USER_ID=abec5bf503064b1c9fb5bc98300e4d3f}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@40b55207]');
INSERT INTO `sys_fhlog` VALUES ('06121412b125494b949d2db0600e2cb4', 'admin', '2018-06-18 11:03:28', '删除菜单ID131');
INSERT INTO `sys_fhlog` VALUES ('06132ebe70604d8bbcf8642a8118a7e1', 'admin', '2018-07-13 16:42:44', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0613356c50f144cca17445a431b18e4c', 'admin', '2018-03-12 14:34:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('061dda2db1ff448094bc36f81708481a', 'admin', '2017-11-08 13:55:52', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('062967cd48d7463badebb13ebb0fc124', 'admin', '2018-08-23 10:09:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0629c831c4464bbca57504eb6866264a', 'admin', '2017-11-04 17:22:04', '修改金额提成:3');
INSERT INTO `sys_fhlog` VALUES ('062f11ad56ca4360a191f0dc8c0e0a28', 'admin', '2017-08-04 19:28:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0631a7832de64d72bc23967dd6b96841', 'admin', '2018-07-13 16:43:28', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('063bac12f465402ab2b0a858f3224756', '18990673099', '2018-02-10 12:00:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('065e7746572c41df9c91f5e69b420350', 'admin', '2017-11-17 18:24:31', '删除系统用户：PageData [map={USER_ID=ddaaae9ee33543679c072023567cb6b3, tm=1510914269018}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@1a095d5]');
INSERT INTO `sys_fhlog` VALUES ('065ed69e5d544301b70438f0f08d75a1', 'admin', '2018-08-17 10:37:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('066291af0e4a48b48dfac22dffcd0980', 'admin', '2018-07-13 16:43:40', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('06692a374a1249a5ab06a824f5ead68f', 'admin', '2017-12-16 13:32:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('067545bbb107467882e601b555362c69', 'admin', '2018-08-16 17:56:14', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('06787a43748e4858b03d7ff9aaf4aa00', 'admin', '2017-08-04 09:26:29', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('069249701f664e8b81134ed9e00a88e2', 'admin', '2018-07-13 16:44:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0693de19ea1d44f6b4a38f23692ed3b5', 'admin', '2018-08-24 18:35:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0694e65800eb4c0c84f0ecc4ee42724f', 'admin', '2017-11-04 12:00:35', '修改积分提成:4');
INSERT INTO `sys_fhlog` VALUES ('0697ec087a50497e948eee7d41d385d0', 'admin', '2018-07-13 16:42:20', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('06a83d29f7a14feb9d702faf01babd41', 'admin', '2017-11-07 21:47:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('06ac5fbe8afe4eb4a40eb00bfe61df17', 'admin', '2018-07-13 16:44:37', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('06c81e407e1d4409ab471afa4930be12', 'admin', '2017-11-07 20:37:21', '删除角色ID为:d449195cd8e7491080688c58e11452eb');
INSERT INTO `sys_fhlog` VALUES ('06fe63dd7c854628abd3025d9263ec66', 'admin', '2018-06-10 11:18:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('06fe668f35ee444dbee0847c4363c40d', 'admin', '2017-07-31 20:41:34', '退出');
INSERT INTO `sys_fhlog` VALUES ('070235f7bcd741ebb4b4489bc0565b3d', 'admin', '2018-08-23 17:33:06', '修改菜单建议');
INSERT INTO `sys_fhlog` VALUES ('07294bd3d9b5433081aa44ae77883b9f', 'admin', '2017-08-03 22:18:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0744be6d06ca4b758c144f34487fc748', 'admin', '2018-01-22 14:26:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0746a94e41094be191e6966ebdc6bfbc', 'admin', '2018-08-16 18:05:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('074757c66b334d6bbc8c0e95d52bc68f', 'admin', '2018-08-17 09:58:14', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('0749b49b57934c1dbfef460132c3855f', 'admin', '2018-08-23 17:33:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('076fdb14a38a41a2beb43f1012d46930', 'admin', '2017-12-11 13:17:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0777a60546e449e2a06149ee4f5969e0', 'admin', '2018-08-17 09:58:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0779107159604243b6bca4e2e47ad170', 'admin', '2018-08-25 15:34:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('078561566d4242da91f22f73d3854920', 'admin', '2018-07-13 16:42:59', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('07857275e8e44199b283009f156963df', 'admin', '2017-08-03 21:41:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('07861ec8e973496c9ee4d02098327cf2', 'admin', '2018-07-28 10:59:31', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0786ff849db549c1805d6734ef600900', 'admin', '2018-07-13 16:41:55', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('07927df2fdf6452a921734db7333294c', 'admin', '2017-11-13 18:15:53', '退出');
INSERT INTO `sys_fhlog` VALUES ('079a2547d69f4fabb40b181bc8145361', 'admin', '2018-08-17 09:40:42', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('079e9e5421f748bca8007a222efed6a8', '18990673099', '2018-03-07 14:34:28', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('07aae505b0114b4ca7b51be83516fda1', 'admin', '2017-11-17 10:36:53', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('07ad053f4b554addb9160924385cb907', 'admin', '2017-12-06 15:39:30', '删除菜单ID85');
INSERT INTO `sys_fhlog` VALUES ('07bec16e65ab40fe85ccfde67b968dd5', 'admin', '2018-07-13 16:43:06', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('07c6f64f481040e1863d7da194d968ee', '18990673099', '2018-03-20 19:28:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('07c77c64b88844b6bbf1f1364f2ad07a', 'admin', '2018-08-14 14:12:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('07d17d9233f149dabf578388b29cf612', 'admin', '2018-01-25 11:53:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('07d5173621b946c0ae96b13f90fce465', 'admin', '2018-08-13 18:24:43', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('07f6ef458bb44b409f366706012b2ff5', 'admin', '2018-08-15 16:50:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('080a236363ec488c9698b2e7bc676812', 'admin', '2018-08-15 18:23:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0815f0f5846c42c599f6bc392c0ad692', 'admin', '2017-08-07 22:10:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0819dba74c344973a47da5d55b4c527b', 'admin', '2017-12-12 14:10:27', '新增合作商家：null');
INSERT INTO `sys_fhlog` VALUES ('0820def518da4fe9b934daf32b85f01f', 'admin', '2018-08-17 09:40:56', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('082a41ca45be44528aaa78edc8f8486e', 'admin', '2018-08-16 18:04:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('08330eae724344c69bcf07e0a1cb2a0c', 'admin', '2017-11-16 19:02:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0877ecbe085c475d8b81e71338bb83a5', 'admin', '2017-09-01 10:45:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('089795afd52242cbb213f364d39076fc', 'admin', '2018-07-13 16:44:30', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('08bc867b0b904a5399ea20d3278bc9a1', 'admin', '2017-11-07 21:55:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('08cc45240ca44c8d9ef0b12b88209c8a', 'admin', '2018-08-15 10:32:45', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('08d1827f999942258350aeb9e373b3a6', 'admin', '2017-11-16 17:10:08', '删除菜单ID108');
INSERT INTO `sys_fhlog` VALUES ('08e2a452a6924bcb9436dcd3abfaa9b8', 'admin', '2018-08-11 15:20:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('091781c055b24e6481c41d6473163e30', 'admin', '2017-09-09 08:39:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('09289233f55e42abb2a5df0a26edd0e0', 'admin', '2018-08-16 18:02:36', '修改菜单建议');
INSERT INTO `sys_fhlog` VALUES ('092cbb61bc3f47e5bd68eb42b1e76d2c', 'admin', '2018-07-13 16:42:00', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('094688bd5b22432487a5efb36e571e16', 'admin', '2018-07-13 16:44:22', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0949afab438f465e9ca7aaed8eceead9', 'admin', '2018-08-23 10:09:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('094e472701754e35ad496449fb379ae3', 'admin', '2018-08-23 18:24:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('09555257338341c1a090a88474aba61a', 'admin', '2018-08-23 09:58:08', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('09660db150114e0194354233b174da31', 'admin', '2018-08-24 14:48:08', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('096cf16bd94542f396f0029656880a04', 'admin', '2017-11-08 13:55:37', '删除系统用户：PageData [map={USER_ID=b379dc7b3d794ed48ca994f9b882b840, tm=1510120537332}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@1168e4f]');
INSERT INTO `sys_fhlog` VALUES ('09868cb9f29e4fc5999a06231c4c50cb', 'admin', '2017-09-24 22:01:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('099102325396469ea2d3aba2534e1c99', 'admin', '2018-03-11 13:03:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('09b43243a53f4469a5b66c272d0b07a1', 'admin', '2018-08-14 09:22:08', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('09bc31dade984a73b5056150587cb17f', 'admin', '2018-02-07 16:45:56', '退出');
INSERT INTO `sys_fhlog` VALUES ('09eb4fc093b84dd580711a08d4967d04', 'admin', '2018-01-05 10:45:05', '修改菜单提现记录');
INSERT INTO `sys_fhlog` VALUES ('09f81a5b84114f57b3b2ae3e99275c90', 'admin', '2018-08-17 15:44:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0a055e4b6218452091bed97a6729641d', 'admin', '2017-12-06 09:56:24', '删除系统用户：PageData [map={USER_ID=e7c1ccb1eab74a3a86d02cff8e0d0892, tm=1512525384463}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@142c88b]');
INSERT INTO `sys_fhlog` VALUES ('0a0fc074ba434064852de2bf839d4f83', 'admin', '2018-07-13 16:44:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0a1229020e9443e8ba799d368c9395a0', 'admin', '2018-07-13 16:43:01', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0a17439f24b54ecdb56043730acded8f', 'admin', '2017-11-24 11:02:44', '修改菜单提现记录');
INSERT INTO `sys_fhlog` VALUES ('0a394cc867dc44a3bc5c82eac35fb794', 'admin', '2018-08-17 09:40:42', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0a4be7473ac24546aea72a85656ddd13', 'admin', '2017-12-12 14:12:09', '新增合作商家：null');
INSERT INTO `sys_fhlog` VALUES ('0a655861927349b186242bb37c4e2a04', 'admin', '2018-08-10 09:34:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0a738fc48088411e9f8bc8ea75890234', 'admin', '2018-07-13 16:42:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0a7b38b8ab8945a5bbcfe83966108777', 'admin', '2017-09-27 11:05:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0a7cbe0fa08a4651b229cd127fe8b2a9', 'admin', '2018-08-17 09:42:02', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('0a86ed7e6658490db07f9d1b79ac6146', 'admin', '2018-07-13 16:43:39', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0a90169fc3944f8fbeec08d5634e0de9', 'admin', '2018-08-01 17:09:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0a95f92ad10c4bd5b67f577ca69937f3', 'admin', '2018-07-13 15:45:27', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0a9c2dc66a1e44ebbb5421f065efa77d', 'admin', '2018-08-23 17:30:22', '退出');
INSERT INTO `sys_fhlog` VALUES ('0abbd9861c1c4a5bb7c89a3bd00a2904', 'admin', '2018-08-23 09:25:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0abcab946c9144d681b70a461f61bf00', 'admin', '2018-08-22 10:27:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0abf107fbfe44ceaaeb4ad1372e29e0c', 'admin', '2017-11-18 10:39:04', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('0ac1794fce864c6cae74b3ddae454d45', 'admin', '2017-11-27 16:09:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0ae0c1cab05e4f61b0e76ac87ad8af6e', 'admin', '2018-08-16 18:05:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0ae50709c5724de19122c8cc7f5ba821', 'admin', '2018-08-23 09:58:08', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0ae9ab6301b843fd999496cc750b0623', 'admin', '2018-06-18 11:04:36', '新增菜单菜品管理');
INSERT INTO `sys_fhlog` VALUES ('0aea3cfa7e884439a49f980da2091d9b', 'admin', '2017-11-04 14:51:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0b0b2e86d30745889a599c0e5af3bf67', 'admin', '2018-08-16 18:05:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0b25f16709114a30be6fd8c6397edbfe', 'admin', '2018-07-13 16:41:59', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0b286a4e07ea47d1904e5211c47cd1ff', 'admin', '2018-01-27 09:39:55', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('0b532e05c31a4eeb88008bc9b6dc5b54', 'admin', '2017-11-22 17:14:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0b6a4d63b8fc4e5a8aec6da86b33361b', 'admin', '2018-08-16 18:05:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0b706efd0d91438ebf3deb461a08d5ce', 'admin', '2018-07-13 16:42:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0b7470276c584c75ada0ba5030c15b1b', 'admin', '2018-08-10 17:13:36', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('0b8c4f7b288e4eb8bd9973a73fb9b398', 'admin', '2018-08-03 19:06:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0ba086ab052b4803aa21faadaded2c8d', 'admin', '2018-08-15 10:22:44', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('0baeaa538f3642059ab062daf9f5de53', 'admin', '2017-10-31 15:32:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0bafb3f5493b4761b0ea271537c08872', 'admin', '2018-08-16 17:56:13', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('0bbc74f46d434c82b854597ea9906883', 'admin', '2018-08-02 18:42:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0bc6efccd88e431384c0448afdd67c08', 'admin', '2018-06-21 09:01:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0bcbb89b0b7b4f608cce0f06933abc8a', 'admin', '2018-04-06 17:36:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0bfd9c7a629e4a348717224b91014833', 'admin', '2018-08-01 09:13:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0bffe5103a724e79826b13fc6d1e0fef', 'admin', '2017-12-11 11:16:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0c13f5f4899f4e5ba790132b4b013ec9', 'admin', '2018-07-13 16:42:34', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0c1d9ff4a0a14c4397a22de13f0123bc', 'admin', '2017-12-06 15:37:27', '修改角色菜单权限，角色ID为:69e11502ea7049da86aedf847e864268');
INSERT INTO `sys_fhlog` VALUES ('0c23f60e191c4ac8844c15af4867c611', 'admin', '2018-01-22 11:50:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0c2868edd78341b680e8d489b5b4afbb', 'admin', '2018-07-13 16:43:10', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0c2f5fd853264d50a5cd297be4e69c75', 'admin', '2018-08-01 17:27:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0c30edbe2f0d40068485ac82ef1c8ede', 'admin', '2018-08-17 10:06:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0c3c1a5c43a340418fdfd7b21dccc94d', 'admin', '2018-07-13 16:43:01', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0c42309526e14aa4972030ba1da373a5', 'admin', '2018-03-11 18:47:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0c4d44f95f8f4e50bcea159c3d0084bf', 'admin', '2018-07-13 16:41:59', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0c54127618c246d8a00fd4312da28eca', 'admin', '2018-08-17 10:39:42', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0c8563405f704051a6cbfbfafb180a29', 'admin', '2018-08-16 18:18:50', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0c8c680d444145989f1117035b2929c5', 'admin', '2018-08-13 18:23:18', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('0c91eaa063134baeaf8d29b23327cc6a', 'admin', '2017-07-29 21:29:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0ca395e5ceaa48a0b48b2fcff84c2436', 'admin', '2017-10-13 14:38:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0ca538a927ab48728c1a819ad9104940', 'admin', '2017-11-10 18:47:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0cbcb60254ac4412ada4a955c3c1d92e', 'admin', '2017-08-03 11:30:13', '退出');
INSERT INTO `sys_fhlog` VALUES ('0cc5dca467254f5cadc159f2000646e8', 'admin', '2017-07-31 14:05:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0cded347b3f946c3a81944d6c9ff77cb', 'admin', '2018-07-13 16:44:20', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0d01f41ae2094a179d9ddafd1563e6a3', 'admin', '2017-12-05 14:26:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0d0cb2c422ce48eebee3c3a61d2ce758', 'admin', '2018-08-17 10:38:45', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('0d15e0cc8b3b4d7f80f2334f9d2b15a2', 'admin', '2017-11-21 20:07:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0d33e4473f404736843697c0e5b01f95', 'admin', '2018-08-15 10:30:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0d36c4198a69459887f37963e13d146a', 'admin', '2017-11-09 15:04:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0d454015b469417097d3f9845af9f4ef', 'admin', '2017-11-08 16:49:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0d53de07a1ba46b58890e7d40f0bbeb8', 'admin', '2018-08-17 09:58:12', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('0d543c3c59c34a84bcc189494ab5f779', 'admin', '2018-08-10 17:15:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0d566246bb49414cbe12e594c0638a27', 'admin', '2018-08-17 09:42:03', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('0d596bfbb33d4abdbd61730787b35bde', 'admin', '2018-08-02 16:16:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0d5e3ed50a84415d9a6a44468c9b6ab4', 'admin', '2017-07-29 22:26:54', '修改菜单商城管理');
INSERT INTO `sys_fhlog` VALUES ('0d69014acda440d88f060ac0909a6149', 'admin', '2018-08-10 17:14:25', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0d6eb6fd41b0451293b4f8bd8a1dfb6d', 'admin', '2018-08-10 09:40:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0d6f3bd2f122449b9b41422b9f0b59a6', 'admin', '2018-07-25 16:32:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0d6fc8def4f34d77a89672d3446679a9', 'admin', '2017-08-21 09:22:07', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('0d78e0707eb640f48de8939f5f668f9d', 'admin', '2018-07-10 13:52:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0d8337c0e89943efac009f065264c423', 'admin', '2017-12-08 09:35:21', '删除按钮权限PageData [map={BUTTON_ID=46992ea280ba4b72b29dedb0d4bc0106, ROLE_ID=115b386ff04f4352b060dffcd2b5d1da, guid=1512696921786}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@156772a]');
INSERT INTO `sys_fhlog` VALUES ('0dc02511ea44438ea283057a0dbd146c', 'admin', '2018-08-16 18:00:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0dc7dd70a9c14c5398ec2e3dedd45efe', 'admin', '2018-02-01 14:19:06', '新增菜单线下红包');
INSERT INTO `sys_fhlog` VALUES ('0ddd4ef12be14b60ae292fc237e10790', 'admin', '2018-07-13 16:42:40', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0dec46f04fe240e4b07d3a05528eeadb', 'admin', '2018-07-13 16:42:01', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0dee03c7c7e440c8bdb1acb638d02bc1', 'admin', '2017-09-04 11:04:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0e0a84f6942040ac9bfbdd0394290021', 'admin', '2018-01-24 10:53:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0e2ee81837ae4415b8e5c8995891a1ab', 'admin', '2018-07-13 16:43:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0e307c4efed7402483b642b111133a82', 'admin', '2017-12-28 09:13:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0e39f0b630f648c185ddf0e5dd400239', 'admin', '2017-11-08 14:36:01', '修改系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('0e3aefdb85b1413091089f0ad56df28d', 'admin', '2017-09-04 14:55:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0e44ee0658044ebda120327793447829', 'admin', '2017-12-14 18:14:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0e49f043b32b48fa8340eb473535cc62', 'admin', '2018-08-17 09:59:59', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0e5ff71c1f544343bb981e91f5e6e3ff', 'admin', '2018-08-10 17:14:25', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0e6d64e2339b4dcab77cf8da207f5b8a', 'admin', '2018-07-27 13:05:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0e74a2d67ce144c4a12a560c02f93cc9', 'admin', '2018-08-16 18:04:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0e8024322d594e8c86b20ec6c7f890bc', 'admin', '2017-11-08 19:55:07', '修改菜单服务类别');
INSERT INTO `sys_fhlog` VALUES ('0e8b3ace60b6435a8ebffe77d1b06545', 'admin', '2017-08-06 21:02:18', '修改菜单所有订单');
INSERT INTO `sys_fhlog` VALUES ('0e982fdf26be443286f799732718aff5', 'admin', '2018-08-23 17:31:01', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('0ebbaec4f2a34780a5583bfbc7e9b0aa', 'admin', '2018-07-13 16:44:20', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0ebc9c903918420c93d7eb453c75301c', 'admin', '2018-04-06 22:23:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0ebf86ba79ed4860b3453ededfb29fb3', 'admin', '2018-08-21 10:15:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0ecd638ebecf4de18c91cad440ad5571', 'admin', '2018-08-02 16:17:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0ed042feadc24153951d4820bf822fb1', 'admin', '2018-08-08 15:52:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0ef68220fb454192a284a586196c12ba', 'admin', '2018-08-11 15:02:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0efa54ffe5bc48d9bf988e95ebab6fe7', 'admin', '2018-08-16 17:56:44', '退出');
INSERT INTO `sys_fhlog` VALUES ('0efecafe21804777b290e03da4d32256', 'admin', '2018-08-17 09:40:42', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0f029084ecb44cd6a76206da46eb553e', 'admin', '2018-08-16 17:57:02', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0f073b6cd43142279a3dbc04171b645b', '18990673099', '2018-03-23 19:28:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0f16a23ea9c24f6a9160224179e350be', 'admin', '2018-08-23 17:33:15', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0f29725470d946c583eb8a0f6385ef42', 'admin', '2017-11-24 09:33:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0f2d5ceb425c4780bcaaaeb690821a11', 'admin', '2018-08-17 10:39:42', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0f36e5665f654822a812489e24dc0872', 'admin', '2017-10-13 15:37:04', '修改系统用户：san');
INSERT INTO `sys_fhlog` VALUES ('0f56d1aceaca4b8a8e7d2118b5b37915', 'admin', '2017-08-13 10:48:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0f59c7a1b1d24f27b76262f29d910476', 'admin', '2018-08-16 18:04:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0f5acce1363944e4abbc5624fa53784a', 'admin', '2017-11-16 19:03:16', '修改菜单合作商家');
INSERT INTO `sys_fhlog` VALUES ('0f5f8dbc3a7f43d19bc34b90a2c8a3fc', 'admin', '2018-08-09 17:56:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0f7ad9447ce543acb81f92baf76137f7', 'admin', '2017-11-08 15:00:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0f7ce61efe26408694e3d09924f7cb2a', 'admin', '2018-08-10 17:10:59', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('0f81ca71b88143328400039270fec92a', 'admin', '2017-11-10 21:21:31', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0f842667858a45c18041b00e62be06e5', 'admin', '2017-08-03 11:37:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0f8f0f95ebd543d6b23ec75d972b9a79', 'admin', '2017-11-09 11:17:32', '修改菜单增加地址');
INSERT INTO `sys_fhlog` VALUES ('0f97013fb720436fb4c57aab132d7d38', 'admin', '2018-02-09 13:02:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0f9bb1911c4d46aa88c4b9320e893b0d', 'admin', '2018-08-17 10:06:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0fa84886e46a433da90a820b22099c87', 'admin', '2018-08-09 10:13:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0fbc4fe2a73a4082afec05328fbf363a', 'admin', '2016-12-05 14:40:53', '退出');
INSERT INTO `sys_fhlog` VALUES ('0fc65a6e6e4944748b08ecc399aa7d7d', 'admin', '2018-08-14 09:22:20', '退出');
INSERT INTO `sys_fhlog` VALUES ('0fc90adab40e40648b49573c19a7cb02', 'admin', '2018-08-16 18:05:04', '修改菜单建议列表');
INSERT INTO `sys_fhlog` VALUES ('0fd292889ef143228456ae810f8aefc5', 'admin', '2018-08-23 17:29:53', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('0fe0d43d125f4308a29e422c26a767ea', 'admin', '2018-08-15 17:50:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0fe622b769be4159b370d163b5464f14', 'admin', '2018-07-13 16:42:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('0ffd751bb6664847866fd35301e02860', 'admin', '2018-08-17 09:58:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1014f6613b6b489d9da5c28b3fef0131', 'admin', '2018-07-13 16:43:54', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1024484a338d414e8a09b2ada9cb6505', 'admin', '2017-12-06 09:25:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1031ca0c8a984c02ba9df7f632bfb5b1', 'admin', '2017-12-06 15:39:06', '删除菜单ID95');
INSERT INTO `sys_fhlog` VALUES ('103c76f6054b4535afff937e56c08438', 'admin', '2018-07-13 16:42:45', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1061bb83f728437caee36198a4d437c6', 'admin', '2017-09-23 21:29:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1062dbb80fd94ed6aa19ca7b62c0b2d3', 'admin', '2017-09-08 10:22:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('10688d4e9f3a41ac9b9cbf61f910b70f', 'admin', '2018-08-23 17:33:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1073b8a0710345ef9319076c04069e75', 'admin', '2017-11-10 17:04:59', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('10804bb3e667477db7f45d086960b4d7', 'admin', '2018-08-15 10:22:43', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('1081fb7dab8843c9a958fc990dbb00bd', 'admin', '2018-01-18 11:24:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('10b0442f82344431a7e73fd7c3cc7970', 'admin', '2017-08-24 15:27:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('10bfaa6130ac492b9076c1250e73b8e7', 'admin', '2018-01-18 11:11:44', '删除菜单ID123');
INSERT INTO `sys_fhlog` VALUES ('10c69332cd7148bf80f7fca4c8c6580b', 'admin', '2018-08-17 10:03:05', '删除菜单ID133');
INSERT INTO `sys_fhlog` VALUES ('10e6a4d4a60e4880bdde77bc22989b8f', 'admin', '2018-08-13 18:25:24', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('10eed5591cb541dbaf71ffe18fd2c375', 'admin', '2018-02-05 17:15:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('10f7e3de29324184b87bd8d0c13aa538', 'admin', '2018-08-10 17:14:25', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('110d201eef7249729d8cdef7b7927a03', 'admin', '2018-08-17 10:03:18', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('11107031a3914ae18fa194a6d5678ea8', 'admin', '2017-03-16 01:03:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('11472b3149e944d793c92704b57036b1', 'admin', '2018-08-16 18:18:48', '修改菜单建议');
INSERT INTO `sys_fhlog` VALUES ('1174e05b721d4782b107f22d33ee3b5b', 'admin', '2018-07-13 16:44:21', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1189bdcc975c4e94ab83542497e424a1', 'admin', '2017-11-10 18:01:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('11948994e98b47cca7e4b4aa5ac31837', 'admin', '2018-08-17 10:01:12', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('11b53d6ae6724b3bb1ae137dc82e6e99', 'admin', '2018-03-09 22:45:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('11b94b2e39c04342bb317372eac7904b', 'admin', '2018-08-18 14:12:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('11bbeea9366d4f49b0f147f878be6846', 'admin', '2017-08-01 18:57:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('11cd2c9be7374a3eb277b121b5a5269b', 'admin', '2017-11-22 14:24:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('11d8d744bb2844dea820c57a6020e71e', 'admin', '2018-06-21 20:21:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('11d91a6bccb54cab93b80c76eb9d23e2', 'admin', '2017-11-16 11:25:27', '新增菜单合作商家');
INSERT INTO `sys_fhlog` VALUES ('11d93ff20b1342a5b545a83b7dd9a174', 'admin', '2017-11-23 16:31:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('11db0a927456407d8b128e890ea0853b', 'admin', '2017-11-10 10:27:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('11eb4dd9732b4ca9982bba9d0aa73e1a', 'admin', '2017-11-08 18:43:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('11f03937edd9440e91c469c0622e2aa5', 'admin', '2018-08-13 18:28:40', '退出');
INSERT INTO `sys_fhlog` VALUES ('11f71f782cce45408b98dc57a4e12858', 'admin', '2017-12-02 15:25:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('11f745642efd4fc194081ee5f1d854ff', 'admin', '2017-11-22 12:34:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1205ace4565c42a5b242135777073ee3', 'admin', '2017-11-06 18:03:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('12087eacb73d41ed9011921bc00fcb9c', 'admin', '2018-07-27 13:49:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1211bc2fe3f6464584ef1f8efc430dbc', 'admin', '2018-07-12 17:34:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('121f1e04d686432eaf291486b67e5680', 'admin', '2017-11-07 16:19:14', '删除角色ID为:c676493578a7493eaab0704a1199ef3e');
INSERT INTO `sys_fhlog` VALUES ('122eac1688c9413ca1a3b3a4f39596e5', 'admin', '2018-08-13 13:33:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1255130ab0104140b24888382521c519', 'admin', '2018-08-17 10:39:53', '删除菜单ID152');
INSERT INTO `sys_fhlog` VALUES ('1261856d234e406eb63f8978852a50fd', 'san', '2016-06-06 03:09:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1261ccc147f24dab81d82fbfb5b921e5', 'admin', '2018-07-24 14:10:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1271494e9f9245ad95ea1b0ccc312561', 'admin', '2018-08-08 10:50:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1273f9cb764c4b4fb1150d0a29743d5a', 'admin', '2017-11-17 10:53:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1282263989ce4998aeb83496dbdc149b', 'admin', '2017-09-20 14:08:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1291825973de4a198c80102530403c40', 'admin', '2018-08-17 09:47:37', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('12a124a9dfcb41c1a135dec9d3faad46', 'admin', '2018-08-15 16:18:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('12ac9431ca3e4430968dd4304f865a5f', 'admin', '2018-07-28 09:56:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('12bf8fc21a2f4e42a8808a02aa1060d0', 'admin', '2018-08-23 10:17:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('12c4073c1efd4a838a9078e578079197', 'admin', '2017-07-31 20:17:30', '修改角色菜单权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('12c7761ff54944118c80d32cf89e78ae', 'admin', '2017-11-09 10:41:45', '新增菜单增加楼盘');
INSERT INTO `sys_fhlog` VALUES ('12c95e29cc5a49189da87284ce02a33f', 'admin', '2018-08-17 10:38:22', '退出');
INSERT INTO `sys_fhlog` VALUES ('12d6b6f9296747c3a8a14ac989b04f0c', 'admin', '2018-08-23 09:58:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('12d9f866387144aea5b660b3b6dbeaa6', 'admin', '2018-07-13 16:44:36', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('12e841c0cbcf49618fa4e865544a957e', 'admin', '2018-08-17 09:58:13', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('12f27432837744c5b73b34123c58d220', 'admin', '2017-12-08 09:35:04', '新增按钮权限pdPageData [map={BUTTON_ID=4efa162fce8340f0bd2dcd3b11d327ec, RB_ID=8728fb44a1c7469ea573b25c0a9d2282, ROLE_ID=68f8e4a39efe47c7bb869e9d15ab925d, guid=1512696904113}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@4b3fe3]');
INSERT INTO `sys_fhlog` VALUES ('12f482511aa64e95a3ddcecccc774d6b', 'admin', '2017-12-27 14:26:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('13136211c96b4097b82f1d2a45d19339', 'admin', '2018-07-13 16:44:20', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('13176f3a498a44f6953922e066003724', 'admin', '2018-08-24 15:52:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('132291e59d3544a1a82ee548a3367771', 'admin', '2018-08-15 14:51:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1330d65293fd49269652979fcf964db1', 'admin', '2018-01-22 11:50:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('134662d741304dea9005a1f39c661514', 'admin', '2018-07-12 16:03:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('135bf44492f344269ca81016344763cb', 'admin', '2017-12-04 16:26:55', '修改积分提成:1');
INSERT INTO `sys_fhlog` VALUES ('13b67a10271d405aa446f18cdbe4b9bd', 'admin', '2018-08-23 18:36:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('13d38121548f4c47a7b660621b4d6248', 'admin', '2018-01-18 11:13:56', '删除角色ID为:c292e855621d401ea4d32e7fcd164d36');
INSERT INTO `sys_fhlog` VALUES ('13dc1ac4a01b467e921f3ba97d9e959f', 'admin', '2018-08-17 09:58:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('13e49ec414a449ab9243fa990230a931', 'admin', '2018-07-13 16:44:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('13e877cd44dd4a84a66e8777ba3fa553', 'admin', '2018-08-16 18:36:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('13e8b0d1e48c43218be8a07da135545c', 'admin', '2017-08-26 21:25:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('13fc596f515748d3a839fb73bade71e8', 'admin', '2017-12-25 11:37:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('144ba8ea11984a36b330233fced6d2cf', 'admin', '2018-08-17 09:46:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('144de454bc014d4db59ff7e44e69de5e', 'admin', '2018-07-25 15:42:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('145142cb58b24d73866f16c31bcd4f9d', 'admin', '2017-12-28 14:25:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('146f2cb40ff34787bb117f12d4770c27', 'admin', '2018-08-27 14:02:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('14a4080e97bb4d289d8a4b94e807b90e', 'admin', '2017-12-14 18:16:40', '删除系统用户：PageData [map={USER_ID=d8595b51be554b3eb9822a4e0d786507, tm=1513246478461}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@1e455b2]');
INSERT INTO `sys_fhlog` VALUES ('14a972a7696940beafa7e8b19032bf2c', 'admin', '2017-09-28 10:07:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('14b5999a6b864b869a0433722c6e0a61', 'admin', '2016-11-02 01:12:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('14c386cfbff940fdab3ab61bf0d4bdd5', 'admin', '2017-07-31 21:24:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('14d4e61b84df41f794d407db3411f188', 'admin', '2018-07-26 18:41:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('14d6ddc19da94ef283c920bcac43b6ad', 'admin', '2018-08-13 18:24:44', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('14e9a3ceb6334d0a935c5a3a53c1ad21', 'admin', '2018-07-13 16:42:00', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('14ed82c47203432c91f7203bbdb1f939', 'admin', '2017-08-05 10:57:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1516d4c1f79c43d6af3b5c0482257624', 'admin', '2018-02-25 10:14:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('151a9391c1b44c319f98f968af8eeacd', 'admin', '2018-07-13 15:38:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('152e1f1c32a0416fa8f8cb7368ac2b6f', 'admin', '2017-03-29 01:22:48', '退出');
INSERT INTO `sys_fhlog` VALUES ('152e7b4907d84916b6c39a3c4d24e0d3', 'admin', '2018-07-13 16:41:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('154db0b3635041c1b85808214429bfea', 'admin', '2018-07-13 16:44:23', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('155ba809c5164d729573f33ea1b216c0', 'admin', '2017-08-30 16:54:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('15adeac60dd2441cbdf6d2390dcced24', 'admin', '2018-08-17 10:39:41', '修改菜单建议管理');
INSERT INTO `sys_fhlog` VALUES ('15d4438eac0f4aec82d041963c705b44', 'admin', '2018-08-27 18:46:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('15d46403c6e94508b4db97e25a8a5166', 'admin', '2018-08-16 18:05:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('15e499ea47a34e2bbbcc2cc09e6987be', 'admin', '2018-08-17 10:38:45', '新增菜单所发生的');
INSERT INTO `sys_fhlog` VALUES ('15fface14d264b96a045eb052288dd88', 'admin', '2018-08-16 18:46:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('161c9a11e19a47808ba390790e929c73', 'admin', '2018-07-13 16:42:17', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('162adf1a729b4604b503d8296015a157', 'admin', '2018-07-27 18:38:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('16379bd50f2342eb8bf2bb6120f8e76d', 'admin', '2018-01-18 11:12:02', '删除菜单ID126');
INSERT INTO `sys_fhlog` VALUES ('1655fb2fcf794677bdf0a52b5dd23fdd', 'admin', '2017-03-30 00:23:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('166bf8cac4f14a67a0476b3ed049037f', 'admin', '2017-11-22 15:37:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('166e54c27c7347269923c0c2e6ff2a0a', 'admin', '2017-11-06 14:36:23', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('1674b0c39e1845ff8f5f2d47b3695245', 'admin', '2018-04-19 19:31:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1679721cb47b4592a3967ec76d7ced3b', 'admin', '2017-10-30 10:23:12', '修改菜单品牌管理');
INSERT INTO `sys_fhlog` VALUES ('1680d19c152640d49c93660a377af96f', 'admin', '2018-07-14 11:27:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1681e043d05b4cdb9d0adfbfc0a9ac95', 'admin', '2018-08-02 19:19:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('16a2ec9179654cef965fe3dc5b8cc80e', 'admin', '2018-07-13 16:41:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('16aa55c058434432a8e1d92d5140f4b8', 'admin', '2018-01-22 10:58:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('16b47a9ee58c44f08d3579818ee1d5ef', 'admin', '2018-08-10 11:03:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('16c92d7106f3423a9d4792cbdb776f19', 'admin', '2017-11-17 10:10:22', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('16ce2dba97614653ad966dbadb04b44c', 'admin', '2017-11-22 18:58:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('16da461a905b4877a8657f4024fe6aa9', 'admin', '2018-08-15 10:26:35', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('16df9dc4c8b5483182516079765874f2', 'admin', '2018-01-18 11:12:12', '删除菜单ID70');
INSERT INTO `sys_fhlog` VALUES ('16edaadba8574bba997b6f8024ccbae2', 'admin', '2018-07-13 16:43:19', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('16edbe2400b3455c9f4dfdea2c11436c', 'admin', '2017-08-06 10:00:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('16f88bb5f00040aab7c984d56a6f8295', 'admin', '2018-08-10 17:48:18', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('16fdbccfbdb54ccea165611cd6c19bba', 'admin', '2017-11-18 10:41:37', '修改菜单查看服务');
INSERT INTO `sys_fhlog` VALUES ('170bf15e3ec24030b7294171f99e8c4b', 'admin', '2017-07-29 22:27:38', '新增菜单商品增加');
INSERT INTO `sys_fhlog` VALUES ('17517dda96f6428aa0d282441dd50bd9', 'admin', '2017-11-07 11:00:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('17718d3aae814393ae53c8d64dbe8df3', 'admin', '2017-12-08 09:35:08', '删除按钮权限PageData [map={BUTTON_ID=46992ea280ba4b72b29dedb0d4bc0106, ROLE_ID=de9de2f006e145a29d52dfadda295353, guid=1512696908282}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@9e815d]');
INSERT INTO `sys_fhlog` VALUES ('17d2b262d43047a9a7eb03112280ffa8', 'admin', '2017-11-07 17:40:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('17e090b3ffe744f9928bd563b059a96b', 'admin', '2017-07-31 20:18:27', '新增按钮权限pd{guid=1501503507472, BUTTON_ID=46992ea280ba4b72b29dedb0d4bc0106, RB_ID=688cabd874784d5892a040642fafe29a, ROLE_ID=3264c8e83d0248bb9e3ea6195b4c0216}');
INSERT INTO `sys_fhlog` VALUES ('17fe79a099794cceaaacc466dbc84b33', '18990673099', '2018-04-14 08:19:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('181d6ba088c8486085c2c77c5ed5f4db', 'admin', '2018-01-26 11:18:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1821ab88a7b245d5adfa1a87dedfe2d4', 'admin', '2017-11-08 19:55:25', '修改菜单服务管理');
INSERT INTO `sys_fhlog` VALUES ('1821c5de054a493596412813a7d93221', 'admin', '2018-07-13 16:44:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('18518ea80c4840e6b92296a0bb24f065', 'admin', '2018-07-13 16:43:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1853aa2a4b404918a18a36674331780a', 'admin', '2018-08-17 10:07:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('185c640f89b54c8bb61a7755200461b8', 'admin', '2017-11-27 10:48:18', '退出');
INSERT INTO `sys_fhlog` VALUES ('186032180899471f988ce5138e2411f1', 'admin', '2018-08-15 15:38:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1863109643054271a935997cd022c0c0', 'admin', '2018-08-15 10:26:34', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1863fa9e0e614ae793f7bf8ef939b8cc', '18990673099', '2018-03-10 11:34:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('18729fe7870c4808946728d6caf0ec8e', 'admin', '2018-08-17 10:40:39', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('18771aa33e9f469e8b57c85cfb4e0216', 'admin', '2018-07-13 16:42:17', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('187c14159b08438093ee2ac02a70fe2c', 'admin', '2017-09-06 09:37:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1888c1af65274cb2a01ba45f062939bd', 'admin', '2018-08-27 19:09:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('188ab6e8ab2641b9a4f0bcc419c7608a', 'admin', '2017-08-06 07:59:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('18b9b2c7c405446ebf9358b6e24fabdd', 'admin', '2017-11-08 19:56:27', '删除菜单ID18');
INSERT INTO `sys_fhlog` VALUES ('18c30ba111b741eaaf824096291036e9', 'admin', '2017-12-15 18:49:06', '修改系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('18c4c64d90104555a1f5c2e2e1970980', 'admin', '2017-10-15 09:54:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('18fa7234961042abacbf315deef23243', 'admin', '2017-08-04 09:26:25', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('1906d1ce0df24a18b64be2953aac0299', 'admin', '2017-08-01 10:52:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('191e83c1b94d42b19688e5c9a637eea9', 'admin', '2018-08-15 10:21:09', '退出');
INSERT INTO `sys_fhlog` VALUES ('194f079c358845b4a1ea7a2bd7797d71', 'admin', '2018-08-15 10:22:44', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('196b19289628403b93e7ab6648bad0da', 'admin', '2018-07-13 16:42:48', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1971ca1a7ba54180bc32c777e3d75c26', 'admin', '2017-11-13 18:08:47', '退出');
INSERT INTO `sys_fhlog` VALUES ('1972ac37ece2478c9393544503df4a12', 'admin', '2017-11-18 18:05:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('19741e7ac71a44b4bcb6d3348d739fff', 'admin', '2018-07-26 16:27:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('19764fee42c5437eb557744cedda2c48', 'admin', '2017-11-03 19:26:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('19789433a4aa462882e02eb9d06058f4', 'admin', '2018-08-09 17:31:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('198529110ebb4b27abc487c3961a88f5', 'admin', '2018-02-07 13:44:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('19a2764ebe814163bfd1a55507fd7d5e', 'admin', '2018-08-16 18:18:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('19aa60cb53aa4a11acb21936bf0e0cfc', 'admin', '2017-11-22 18:48:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('19cab211146c4db09dd7707317295f78', 'admin', '2017-11-06 14:19:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('19cf0530bfd14d2f91985167231ec74e', 'admin', '2018-08-17 09:42:17', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('19d6deb903674262a86111df0a8e19ed', 'admin', '2017-12-08 09:35:12', '删除按钮权限PageData [map={BUTTON_ID=da7fd386de0b49ce809984f5919022b8, ROLE_ID=de9de2f006e145a29d52dfadda295353, guid=1512696912098}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@1450fad]');
INSERT INTO `sys_fhlog` VALUES ('19e11d5a12fb484795d5e49141a57e5f', 'admin', '2018-07-10 11:41:34', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('19ed6896d8b84baa92e12760f0035a13', 'admin', '2018-08-22 15:34:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('19f4f31efae8487fa31e0893fb3014fa', 'admin', '2018-07-12 16:10:59', '退出');
INSERT INTO `sys_fhlog` VALUES ('19fe7a20995f4b0e885679b0d6473a95', 'admin', '2018-07-13 16:43:31', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1a00968d6a5f4759b452602bb18116c7', '18990673099', '2018-03-15 16:08:58', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('1a086b2f5d2945de9f0bd79046d37c9f', 'admin', '2017-11-23 15:25:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1a0e1c6539b448e390f9e1221132e876', 'admin', '2018-07-13 16:44:18', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1a221477e9ca4c1dbfa6375a1f55212a', 'admin', '2018-07-13 16:42:42', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1a46b4f9f3d042c78e4585a32a21e677', 'admin', '2017-11-10 17:35:07', '修改菜单服务类别');
INSERT INTO `sys_fhlog` VALUES ('1a471a284ac349d4a42635b181544b11', 'admin', '2017-08-03 21:59:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1a5859ec7aa944eea276d97d46577a64', 'admin', '2018-08-23 17:33:16', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1a6347c3f6b74e1a8a613fadcd602dd7', 'admin', '2017-11-04 12:30:52', '修改金额提成:3');
INSERT INTO `sys_fhlog` VALUES ('1a78304119794f8aa425a88625dd081a', 'admin', '2017-07-29 21:48:04', '删除按钮权限{guid=1501336084850, BUTTON_ID=3542adfbda73410c976e185ffe50ad06, ROLE_ID=3264c8e83d0248bb9e3ea6195b4c0216}');
INSERT INTO `sys_fhlog` VALUES ('1a79015ef7604e828c54c677763143a5', 'admin', '2018-07-27 15:44:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1aac8e0cac634f9c93d6cd7d5b1bc29d', 'admin', '2017-09-03 11:57:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1ac45e9d4c574bc1863bee81aef27b47', '18990673099', '2018-03-05 14:05:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1ad59764cb064e9686eea9f29bddcc03', 'admin', '2017-12-08 09:35:23', '删除按钮权限PageData [map={BUTTON_ID=cc51b694d5344d28a9aa13c84b7166cd, ROLE_ID=115b386ff04f4352b060dffcd2b5d1da, guid=1512696923283}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@85594d]');
INSERT INTO `sys_fhlog` VALUES ('1ad808f193624b33b525ed562cb6a6f9', 'admin', '2018-08-01 13:57:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1adeb575075d4999b514c4474fc7c85a', 'admin', '2018-07-13 16:42:41', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1afab77a878b418496b659231f929ea4', 'admin', '2017-10-24 17:46:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1afd4e0a91ef47869d76b1c99649814b', 'admin', '2018-08-17 09:45:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1b079ba06a364904821c0faf4356c8f4', 'admin', '2017-11-23 16:26:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1b10777fb0164204b83245e1b400b831', 'admin', '2018-08-16 17:57:52', '退出');
INSERT INTO `sys_fhlog` VALUES ('1b126cf7a0164e1baded657b3f684537', 'admin', '2017-11-18 14:19:17', '删除菜单ID113');
INSERT INTO `sys_fhlog` VALUES ('1b43f23dc4e54d5e97ea959d5049a7bb', 'admin', '2017-09-30 11:25:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1b5b825a1c4e40f2bccf37418d3ce809', 'admin', '2017-11-07 20:37:26', '删除角色ID为:8ac4c62fa76a4412b24dfde7da19b70c');
INSERT INTO `sys_fhlog` VALUES ('1b686d7b8e1d47149e70d5493d611afd', 'admin', '2018-07-13 16:44:03', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1b79234041994d17ab8750d9da5b7357', 'admin', '2017-08-31 15:20:20', '删除菜单ID80');
INSERT INTO `sys_fhlog` VALUES ('1b7a7fbdbd094c1d86744b0d0476d7d0', 'admin', '2018-07-13 15:38:32', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1b7fd337563f4396a8d880d3de6f5419', 'admin', '2018-08-15 10:22:55', '退出');
INSERT INTO `sys_fhlog` VALUES ('1b9a22c521424a798cb92684c33cb38a', 'admin', '2018-08-17 10:39:41', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1b9b00064cd84c828897f9eaeaa0b5d9', 'admin', '2017-11-21 18:56:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1bb4682f2709405ca2b8e7c8adf023e0', 'admin', '2018-07-13 16:42:26', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1bc5b3511eba457e8f5df7ed988d402a', 'admin', '2018-08-10 17:13:37', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('1bc6c512ae6a4b289efdc1525f937608', 'admin', '2017-11-24 17:11:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1bd46eb7ec4b40c58e4b997ce08ee442', 'admin', '2018-08-17 10:09:45', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('1bf9064c212147fc9fa8a121fb56cf1a', 'admin', '2018-08-18 17:43:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1c0383194a2e45cbb5eddabf34b9b651', 'admin', '2017-08-05 10:08:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1c1258a4b97246dbb93bfe6b94552e6f', 'admin', '2017-11-04 18:39:06', '删除系统用户：PageData [map={tm=1509791946590, USER_ID=b644e42540884f8da5af972b86a21851}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@1e177eb7]');
INSERT INTO `sys_fhlog` VALUES ('1c152adacf5c418fa83ac85a858cc74b', 'admin', '2018-07-28 15:49:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1c34a2d5878c4588a6d62edd0aea2cfa', 'admin', '2017-12-29 13:14:17', '修改代理介绍:<p>fasdfasfas</p>');
INSERT INTO `sys_fhlog` VALUES ('1c3a8c52d3c44d3babdbc99ebfe40697', 'admin', '2018-08-23 09:52:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1c532da82d2f4eb0b67a83a08ea0d44f', 'admin', '2018-08-13 17:11:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1c59b70dc1204d20be13d0c7297c1712', 'admin', '2017-11-08 14:09:42', '删除系统用户：PageData [map={USER_ID=9782a5f5c5d743c982c7e7076b50d40e, tm=1510121382302}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@4c5038]');
INSERT INTO `sys_fhlog` VALUES ('1c5b80b3cf0446b38700d9ef9b1373e8', 'admin', '2018-07-13 16:44:16', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1c65f1f27c3541dea947221444f05e05', 'admin', '2018-08-09 15:10:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1c6b37519477437f8f68a166c6e996ba', 'admin', '2018-08-08 16:03:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1c91535326d64da0b47299d22a694406', 'admin', '2017-12-14 18:19:36', '删除系统用户：PageData [map={USER_ID=9406913278984c83ba8e1ec7dc7f07d9, tm=1513246775938}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@11f7087]');
INSERT INTO `sys_fhlog` VALUES ('1c9b102bd8874917840febc0f346645a', 'admin', '2018-08-15 18:15:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1c9b33c890b34b57a98679ce4bc4bd3b', 'admin', '2018-08-10 17:13:36', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('1ca35b21d8fb48b599fe5b81f28323cb', 'admin', '2018-08-11 15:05:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1ca3d1fad0414407bdaf23d742afed48', 'admin', '2017-11-22 10:18:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1caff096daf6482c9cb02f387f6b5236', 'admin', '2017-11-23 14:52:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1cd3fdc9c5de464293dc48107bb0a11c', 'admin', '2017-12-25 10:25:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1cf60ca46b3549a2bea81700dba54957', 'admin', '2018-08-16 18:02:18', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1d1140d01a1a4f3c84d719c74ea0c325', 'admin', '2018-08-13 13:19:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1d2431265b294eaeaf406c8ae5b9165b', 'admin', '2018-08-10 17:16:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1d35972a3bdc4680a3b1b4702c81bb8d', 'admin', '2017-12-05 17:54:31', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1d55661c03ae46438b6ded4fcaf8a7e2', 'admin', '2018-07-13 16:43:09', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1d620f1f1bcf4072bfd110c3c9f82f45', 'admin', '2018-08-17 10:38:46', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('1d6d0998ddd8442d8295300fb54cf24c', 'admin', '2017-09-20 15:12:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1d720d084d9c4f758abdb200ef3d40a9', 'admin', '2018-07-28 15:49:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1d762cc1fdb24c73a56c81eeecd2e0b2', 'admin', '2018-01-18 11:12:16', '删除菜单ID69');
INSERT INTO `sys_fhlog` VALUES ('1d83a05e98514e0eb45ce11a2e1a5fa1', 'admin', '2018-08-18 18:12:50', '退出');
INSERT INTO `sys_fhlog` VALUES ('1d85c076ab5a475e95c30a27056eddc6', '18990673099', '2018-06-04 09:10:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1da30c3a19c04305ab46a453599e5c2a', 'admin', '2018-01-28 19:53:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1db7d99491c64d29b274029fad928967', 'admin', '2017-11-15 15:07:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1dc6fd104a4e489c9a7a573a96628236', 'admin', '2018-08-18 13:48:00', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('1dce30faa36e49abbc08317bc7a52395', 'admin', '2017-11-10 20:52:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1dcfac413335449ebec5653ceac3cb0e', 'admin', '2018-08-17 10:38:45', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('1dd86225695241b8964dd1202e8cfcf3', 'admin', '2017-11-30 09:36:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1df5a26f318c48bf83d4ed75e2bddd18', 'admin', '2018-01-26 13:18:55', '修改菜单公告');
INSERT INTO `sys_fhlog` VALUES ('1df8c986b7cd4a1f8af3f56f206447f7', 'admin', '2018-07-13 16:42:22', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1dfd91adfece4e9e942601482ddc09b9', 'admin', '2018-08-03 11:09:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1e00a3eb3b93469bb3c716c10f9bdfed', 'admin', '2018-08-14 15:21:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1e0f65005862410cb11848e9980eb9b0', 'admin', '2018-07-13 16:43:12', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1e12824dc5b34716b3fdd910c8f76c50', '15982183168', '2017-12-06 15:30:12', '退出');
INSERT INTO `sys_fhlog` VALUES ('1e17670754da4289a0345cefccfac732', 'admin', '2018-08-13 18:24:43', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1e1ec1911804462d84de681a0c63a7c7', 'admin', '2017-11-17 10:03:12', '退出');
INSERT INTO `sys_fhlog` VALUES ('1e2c0db2c03e4172a808fe1cf7bc6257', 'admin', '2017-12-08 09:35:09', '删除按钮权限PageData [map={BUTTON_ID=3542adfbda73410c976e185ffe50ad06, ROLE_ID=de9de2f006e145a29d52dfadda295353, guid=1512696908946}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@bdb980]');
INSERT INTO `sys_fhlog` VALUES ('1e664f76d9ca4bf987014e8c89540ff5', 'admin', '2017-11-23 11:38:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1e7cfef3dd6345cebe433f4fc77017d0', 'admin', '2018-08-17 09:48:22', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('1e92f8cea38045d4b114e8b97f05b548', 'admin', '2018-07-13 16:42:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1ea8028ded5b420394fcb620bfb65a80', 'admin', '2018-07-13 16:44:15', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1ea8307f9888424cb52f5724231e7ae8', 'admin', '2017-08-04 20:00:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1eaab6e8cc72455897fe5087d5e2877c', 'admin', '2018-07-27 10:53:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1ebe8a09e59342d4848ccf6113815687', 'admin', '2018-08-17 10:03:18', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('1ecbed9cb54b481fa9098b6d20742236', 'admin', '2018-08-14 14:36:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1ed2f90c2812429e8977d6164e8164d0', 'admin', '2018-08-18 16:56:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1edde90e0f7c499fb69443bbf8ca7a2f', 'admin', '2018-08-17 09:47:36', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1eeaa1d03d3b457d848fe7237616d4e6', 'admin', '2017-11-04 10:57:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1ef070a821fb481584746218c4d7d23d', 'admin', '2017-11-07 21:15:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1efb88da333f4701b4d2d04ea88dc1e2', 'admin', '2018-07-13 16:43:11', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1f08d71b9f5345bbb7bc176600808cfe', 'admin', '2018-07-13 16:44:11', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1f12b21d684d4e4ba79119b0290bb3c4', 'admin', '2018-07-13 16:44:36', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1f1facf754644c11ad02c26091a24aaa', 'admin', '2018-08-10 11:35:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1f29bc304bc94020bbd01690cc8ae6cb', 'admin', '2018-08-13 18:25:23', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1f2e0947a4a243d59f891d60126d989d', 'admin', '2018-08-22 10:22:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1f40a77d161e4a24bbd3b95627699c25', 'admin', '2018-04-19 20:42:26', '退出');
INSERT INTO `sys_fhlog` VALUES ('1f573bef08cc489a819e402e76b37525', 'admin', '2018-08-17 17:05:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1f58343790644a31a1d7006c07f4e43f', 'admin', '2017-12-08 09:34:12', '修改add_qx权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('1f5f78998b8949c182bd54aef829f907', 'admin', '2017-11-04 09:25:06', '新增角色:经理');
INSERT INTO `sys_fhlog` VALUES ('1f679a2d24394008bf0dd957ea2f1cc5', 'admin', '2018-07-13 16:44:10', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1f6bc38f90fb4cc584967ec41d694c6d', 'admin', '2017-11-23 12:37:31', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1f6e9bdb048744a89547fcaae42799ee', 'admin', '2018-07-13 16:43:24', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('1f776e68931f4cb6bd93531f49a20869', 'admin', '2017-12-07 19:36:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1fc9311f332c477ba41bef68edf2dc74', 'admin', '2017-11-24 18:28:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('200b14c1363e4a0997f0fe6344134b5e', 'admin', '2018-08-01 19:30:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('202017a2325e493aa5ffcbc94f8e05d6', 'admin', '2017-10-09 17:42:51', '修改角色:修护师傅');
INSERT INTO `sys_fhlog` VALUES ('20337e6815ba4a409b15d21289049502', 'admin', '2018-08-15 10:22:44', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('204bca14e5b248db9e2c2456724dc46a', 'admin', '2018-08-04 15:35:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('206a7c0222b64b63944c6a784626f9dd', 'admin', '2017-11-04 17:23:42', '修改金额提成:2');
INSERT INTO `sys_fhlog` VALUES ('20828a6d6ca24abca5e7e48428affc97', 'admin', '2018-08-17 09:40:42', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('2093b06de9ad45628b2984726cf49614', 'admin', '2018-03-07 17:01:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('20bef4c36db34fc98c932bc8a6838c1b', 'admin', '2018-08-10 09:51:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('20d817aabaf448d1a08f2b40560d7a6b', 'admin', '2018-08-04 16:29:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('20ec462f5d164eefa404b705315f9b56', 'admin', '2018-07-13 16:43:31', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('20f1e805176849fd83b044ac6b4a221b', 'admin', '2018-08-17 10:38:44', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('21064256452b47f1a2b609ffa3758145', 'admin', '2018-08-23 09:58:08', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('211887951f9345a6b8f6d5e457e25d4e', '15982183168', '2017-12-08 09:31:34', '退出');
INSERT INTO `sys_fhlog` VALUES ('2119877bb2c946e08326a1e4068c3399', 'admin', '2017-11-04 18:39:15', '删除系统用户：PageData [map={tm=1509791955559, USER_ID=a8b6eb8259224d02823b6a8644272006}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@4d43a0f6]');
INSERT INTO `sys_fhlog` VALUES ('212c7549c28944b8982776a52ed23b59', 'admin', '2018-02-07 16:44:08', '修改角色菜单权限，角色ID为:3');
INSERT INTO `sys_fhlog` VALUES ('213cf42a06db44e6a4bfad693d4f9e8c', 'admin', '2017-12-25 11:34:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('213d7331a80d41f3a50a0974edaa76b9', 'admin', '2018-08-27 09:11:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2141ca15f2794160a0851e4e994965d5', 'admin', '2018-07-13 16:42:39', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('21449eb495544ab49b80466d802e54d9', 'admin', '2017-12-28 14:09:54', '修改菜单产品订单');
INSERT INTO `sys_fhlog` VALUES ('214f88d3560f4eb3b0c9ee4f70370d01', 'admin', '2017-08-04 09:26:28', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('217cd6dd9f5944909b69091bc21d0f09', 'admin', '2017-11-08 19:57:38', '删除菜单ID7');
INSERT INTO `sys_fhlog` VALUES ('2190f387c83a423eab2bc7099fe7ef25', 'admin', '2018-01-09 13:39:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('219581d1f4574a6fa068be7661c20be6', 'admin', '2017-11-23 15:47:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('21a30e84078543659a5f6924d694ca93', '18990673099', '2018-05-27 12:33:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('21ad8143354e48b688fa4bde9be260c4', 'admin', '2018-08-09 17:48:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('21e8a5937fa14a2c84e39a1fef5e81c7', 'admin', '2018-07-13 15:45:26', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('21ef5fcbc217419ba4809563c3157813', 'admin', '2018-01-26 13:17:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('222ab19322b344b3b88ed416ea0b7601', 'admin', '2018-08-17 10:39:41', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('2244b0ea1efb46faa773854826f5c62c', 'admin', '2017-12-12 18:36:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('224d4a6a22b442b69bb41d3d491ec10c', 'admin', '2017-11-01 14:33:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2261131e064341578cb4c3003436c056', 'admin', '2018-08-17 09:58:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('226f60dd71b649aa873550b093b51a8b', 'admin', '2018-08-16 18:04:37', '退出');
INSERT INTO `sys_fhlog` VALUES ('22781460f4b54a4a9bcf7b3609f29fa0', 'admin', '2018-01-08 17:35:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2279d144ed3c45cbb4f1d1ccc52acc47', 'admin', '2018-08-23 09:58:07', '修改菜单进货单列表');
INSERT INTO `sys_fhlog` VALUES ('228b204b572a477a8ad3428bd303385f', 'admin', '2017-11-08 13:57:27', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('22b5cc4ae6b04441ae902de783045f65', 'admin', '2017-09-02 09:05:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('22b63afe9fa3476280ab2b63837eedf8', 'admin', '2018-08-02 16:45:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('22ca558548c0437bb0559d8470269444', 'admin', '2018-08-11 15:31:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('22cc47ce3e304b2e8cb747aee8bbefab', 'admin', '2017-09-06 15:58:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('22d2417658d84d6aa3e0b220c3480fa1', 'admin', '2017-11-23 10:30:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('22d79b7eb20542f58799ced9a82b8e2a', 'admin', '2017-11-04 17:22:15', '修改积分提成:5');
INSERT INTO `sys_fhlog` VALUES ('22eb22ea998148d0acd35ff326509bda', 'admin', '2018-08-10 17:11:00', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('22f54d3d3ac54a4789d9094ee6bf642f', 'admin', '2018-07-13 15:45:27', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('22f807c913ed45619c19c021140b70c0', 'admin', '2017-10-31 17:32:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('22fa98719c98409d96a107bb02b41a19', 'admin', '2017-11-06 20:15:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('230cbc28d635476788461fd85d42533f', 'admin', '2018-08-21 18:37:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('231844075c6f4551a972e4aa49ead8e3', 'admin', '2018-08-13 18:23:19', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('231a5992f6d04b56870a3dff53496048', 'admin', '2018-08-15 10:22:43', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('2330b1ed11714909ba00746dc9db018b', 'admin', '2017-07-31 21:20:41', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('2363e3bde6d64574a6c21207ca47811a', 'admin', '2018-08-21 16:51:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('23688631a51b4e9f812a8825ef4e73fc', 'admin', '2017-08-09 11:42:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2371f60cd3ce4de28a4b598e6ac6e146', 'admin', '2018-07-13 16:41:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('238982ae22014c819047c97d62967a0e', 'admin', '2018-08-24 14:50:27', '退出');
INSERT INTO `sys_fhlog` VALUES ('23a1db27564c4a4ca2aeb10204b9a3e0', 'admin', '2018-08-17 09:48:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('23a74d11bd974dc790a9899c31af8432', 'admin', '2018-03-05 17:22:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('23fae4fe2f374a64996600e1fa34e231', 'admin', '2017-11-23 14:33:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('240b14e6b7834efcbbc36158ba53ccd5', 'admin', '2017-08-23 07:48:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('240b4d1412594188bb64e8cb10f61153', 'admin', '2018-08-17 09:47:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('241197cddb454e00b363a85285b74692', 'admin', '2017-08-09 10:16:22', '新增菜单洗护订单');
INSERT INTO `sys_fhlog` VALUES ('241979fbd1c94be6a5a8669a15b2a67e', 'admin', '2018-08-17 09:40:42', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('24259fe3f9024420857dcb27441f6f30', 'admin', '2018-08-15 10:22:44', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('24283cba27cc4b2f9ba5311db3f2e8e7', 'admin', '2018-02-07 16:45:11', '修改cha_qx权限，角色ID为:3');
INSERT INTO `sys_fhlog` VALUES ('24424e552d3940a3a4b8c63acb8e3537', 'admin', '2018-08-17 10:09:46', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('244e0367486846b5a3af69169a83bb65', 'admin', '2018-08-10 09:30:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2453ad2d13064ea789e0d556202b7627', 'admin', '2018-08-13 18:25:23', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('24558f8051de4e96819d89f59fe1ab4c', 'admin', '2017-12-09 13:12:02', '删除系统用户：PageData [map={USER_ID=69a8805832814c78b61563b6e787bd40, tm=1512796322124}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@16bd669]');
INSERT INTO `sys_fhlog` VALUES ('2456d4eeae8547ab9c7eb4453f080d09', 'admin', '2018-08-17 15:59:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('245a58c9d02d45e08f47c4dbba25c746', 'admin', '2017-12-11 18:16:11', '退出');
INSERT INTO `sys_fhlog` VALUES ('245a8e05385a4bb2939ceffec4363a17', 'admin', '2018-08-15 16:13:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('246eb97ace2a44ba8edc2ceed75179bf', 'admin', '2018-08-17 10:01:12', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('24774507be594e4ea01102e6b84b7ce7', '18990673099', '2018-04-14 13:36:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('24a7a3880df749b4b38ac8f7efd93abd', 'admin', '2017-09-25 09:19:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('24a8f4a0f85a4238bbd11d3e2dbcaf44', 'admin', '2018-08-13 18:25:23', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('24bfa157d5e344ed947c682f444f51f5', 'admin', '2018-01-22 13:24:58', '删除系统用户：PageData [map={USER_ID=10d8e0440c6c43108f71e4bb937f9013, tm=1516598698575}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@1e446ac]');
INSERT INTO `sys_fhlog` VALUES ('24c40557163a46d588c0592429ef1c37', 'admin', '2018-08-16 17:56:13', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('24d10e2885bc4c66b9f1657cb8740d30', 'admin', '2018-08-16 18:02:37', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('24dc5530fc234beabac1a29f7b6c9ec4', 'admin', '2018-03-13 22:21:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('24f603bedc604e4887c42c86e69440d3', 'admin', '2018-08-23 17:30:59', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('25055cfe5f544601b7537bfc81d85eac', 'admin', '2018-08-08 16:51:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('250ed8b498144e85a76d4efbc954b6b3', 'admin', '2018-08-01 16:19:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2512e2f680874e438abc1d8387e4a7f2', 'admin', '2017-12-11 18:16:07', '修改菜单充值记录');
INSERT INTO `sys_fhlog` VALUES ('2512eaa39f2c4234a32f96e07a97e460', 'admin', '2018-07-13 16:43:09', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('25187c91e2fa4da090bcba7e392d6f75', 'admin', '2018-08-17 10:09:46', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('251b4c54685147d1b4bee4f9627ce67d', 'admin', '2018-08-17 10:32:33', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('253938b2dd994d24a4fa36b4d450fedd', 'admin', '2017-03-29 01:35:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('254050efebbd4b5a8895cbb1efe2f3fa', 'admin', '2017-12-15 11:02:58', '修改金额提成:1');
INSERT INTO `sys_fhlog` VALUES ('2554adb68c4d49289d36f9060e265384', 'admin', '2018-08-13 18:24:43', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('2576e942ccb04bb7ae666991a0720426', 'admin', '2018-08-16 17:59:21', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('2586aabf40a34051a05cb4aad796193f', 'admin', '2018-08-16 17:38:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('258c2e3c74cf4bb38b41562d0c14888e', 'admin', '2018-08-10 10:43:59', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('258d770102864faabec658676e3824f4', 'admin', '2018-02-07 14:19:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('259aa8495859441594805e6d2b240e7b', 'admin', '2018-08-17 09:45:59', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('25a1bd87c89948d59676aaaf16663b28', 'admin', '2018-06-18 11:03:40', '删除菜单ID130');
INSERT INTO `sys_fhlog` VALUES ('25a1f08486a94f308b8f2f6dfb43437e', 'admin', '2017-11-09 10:43:03', '退出');
INSERT INTO `sys_fhlog` VALUES ('25b16571dcc34fae85112fc3da5b194c', 'admin', '2017-11-04 16:46:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('25bc6c33a6754549a083f3b694869929', 'admin', '2017-09-25 20:19:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('25bff3b2696e4188bfc965a19a9abe68', 'admin', '2018-08-16 17:59:22', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('25c0b648ac4d4f62b4df7db7e707d945', 'admin', '2018-08-23 17:33:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('25e3747b45a042529758647fa4f3878b', 'admin', '2018-08-13 17:43:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('25e72b54105b4a9091dbded19c04df39', 'admin', '2018-01-14 13:22:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('25ef7bf3219d45828ffb97462b97e48a', 'admin', '2018-08-17 09:38:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('25fcdb6e3c9b4f1f922db878c3e713de', 'admin', '2018-07-13 16:44:26', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('2600e71c201a40ff90451bd17137168e', 'admin', '2018-06-01 10:55:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('260847acd56f4ad09cfe80b4797da3c0', 'admin', '2018-01-26 14:00:26', '退出');
INSERT INTO `sys_fhlog` VALUES ('26348b4805184437bca21e035ee66919', 'admin', '2018-08-23 17:33:15', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('266828c0c4714178bf2d4bb72d8e87d5', 'admin', '2018-08-10 17:31:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2684368bf52f46fabe581e20c45281c4', 'admin', '2017-11-20 17:56:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('268b700b464244508c1781de86e75e54', 'admin', '2018-07-13 16:42:29', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('26a154922d3547d5b71b9e041da89078', 'admin', '2018-08-16 18:19:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('26a829e98d60446f8f996a5a01eaf670', 'admin', '2018-08-17 10:38:44', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('26af78722e174ba3a60a6399b44d23bd', 'admin', '2017-11-06 18:29:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('26dc61ead5244e34b8e92d8491f4f163', 'admin', '2018-08-16 18:01:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('26e7d537a79741df892026253d80d9d6', 'admin', '2018-07-13 16:42:24', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('26f49e2b53894ec99d7b6bd82a3650cd', 'admin', '2018-08-06 09:48:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('27001f6ac18c41f6bd6d4694e8e7e6d7', 'admin', '2017-11-03 17:02:52', '删除角色ID为:ffe3019c18304b41b4251b8c6ba9e28a');
INSERT INTO `sys_fhlog` VALUES ('27083ffa3b2b484fa77a8834e811b31d', 'admin', '2018-08-08 16:51:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('272c1ec0e52744c2877e3a230b2e1458', 'admin', '2018-08-16 17:56:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('27646a05e19c4b8bac774bbd7ebd340b', 'admin', '2018-07-13 16:42:17', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('276a7e5948d24bd88cc76973fc25564e', 'admin', '2017-09-21 11:28:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2776c052627c4ea0832dcdeecec786dd', 'admin', '2017-12-14 17:40:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('277798c88817424296cd08c60712d827', 'admin', '2018-07-13 16:43:20', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('2788b24014cc462b9adf0af125f64ca7', 'admin', '2018-08-16 18:02:18', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('2790c3c230014fdb8dee3ebcedbeb311', 'admin', '2018-08-10 17:48:19', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('279595ed66aa439e961b006ac763e032', 'admin', '2017-12-28 11:11:20', '新增菜单微信用户');
INSERT INTO `sys_fhlog` VALUES ('27a142aec2e046c9aa86ac1e65c5f214', 'admin', '2018-01-18 11:40:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('27a8dcd0a0dd4a9aaaeab3cd7e639939', 'admin', '2018-07-12 14:45:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('27aa89e159d543c0a7ad8b678360731e', '18754621234', '2017-11-13 15:43:32', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('27aa8c6c3cf24b59aef798feec9085f1', 'admin', '2017-11-04 17:24:42', '修改积分提成:2');
INSERT INTO `sys_fhlog` VALUES ('27b3dd9976064086ac90493c2a5250fc', 'admin', '2018-08-17 09:45:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('27ba73517df449798a8a97dc95b6c47f', 'admin', '2018-07-28 11:15:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('27d0b3511f0849df807fbe135abbe104', 'admin', '2018-01-06 13:24:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('27e8843768934d34b53eb26bb1c51e15', 'admin', '2018-08-21 18:54:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('27edc6d0dd5641708e890ac9a9a72f2d', 'admin', '2018-08-13 13:23:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('27fc027d66a648c4b30df5be9c868f65', 'admin', '2018-08-17 18:25:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('280bd32588574c098ae65e83edaa83f9', 'admin', '2018-08-09 18:18:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('281332e4766d425f8aba08b3fb8ea293', 'admin', '2018-08-10 17:47:10', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('281497afc01c4caf8b355369393662c5', 'admin', '2017-09-08 13:10:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('28169cb2b6ab46288a9aa3d05ec1b409', 'admin', '2018-07-13 16:44:18', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('2821c6ef0ba74711885a8673d99a70a6', 'admin', '2016-12-05 14:04:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2838e0cde985441c847c982a3f248967', 'admin', '2017-07-31 18:54:19', '修改菜单商城管理');
INSERT INTO `sys_fhlog` VALUES ('283c399df9a64b998fb5a63ddf6bc8ea', 'admin', '2017-08-29 18:12:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2848431464084be0bbd989e566d634ba', 'admin', '2018-08-18 18:44:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('284bb212ae90482e91cdc93afb86dc73', 'admin', '2017-11-10 18:33:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2850c8e25ef147d882c3d4a408f042a7', 'admin', '2017-08-04 10:59:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('28816dce592a42308e020949586d1f1d', 'admin', '2017-09-20 15:00:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2887e864800a45ba91483f4fedf0f9b9', 'admin', '2018-08-17 09:42:17', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('28a25673295644ad90df3329f4d7f020', 'admin', '2017-08-03 11:30:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('28a2a950afe145a285c33cf85792f20d', 'admin', '2018-08-23 17:29:54', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('28a6e529e97f4888b331c89118e4aa49', 'admin', '2017-12-25 11:38:07', '退出');
INSERT INTO `sys_fhlog` VALUES ('28b7be0505dc448c8006745f4860949a', 'admin', '2018-08-13 18:23:19', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('28c361ed89a849d38b7805c95f3f4334', 'admin', '2018-08-16 18:04:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('28e8913118fd4548ac6799b098e1f359', 'admin', '2018-07-13 16:42:50', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('28edbfe29bc74d0b8cb51520b3a0ddb5', 'admin', '2018-02-06 09:35:31', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('28f69d63fb874657b67ccf8760365c86', 'admin', '2017-11-21 19:02:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('28fade5a4e944569bc67d2fddbdfc966', 'admin', '2017-11-13 15:45:15', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('28fcbf80e326448491da6ff735a7646d', 'admin', '2018-07-13 16:44:34', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('28fdc69ab74544e2899c153dc360cd57', 'admin', '2017-12-27 14:19:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2909fac74cb04e298006d63b93a9726e', 'admin', '2018-08-17 19:04:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('291734762e1c4458b67e60d39054d131', 'admin', '2017-11-04 17:22:39', '修改角色:维修师');
INSERT INTO `sys_fhlog` VALUES ('291fae0db20b424db7aa71be830b4376', 'admin', '2017-08-29 13:53:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('292b8bdab0e941bd81b5a524ef952f60', 'admin', '2018-08-02 11:11:31', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2931747424584a92bfaeb1a4c7db0d9a', 'admin', '2017-11-20 09:30:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('293888c3e3f041569de4ef7052152831', '18990673099', '2018-04-23 00:53:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('29605cf2179046e2943641b9aeb80730', 'admin', '2018-03-16 11:37:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2967482e0f0d40dd8e276f3a37b68702', 'admin', '2017-12-04 17:49:05', '批量删除user');
INSERT INTO `sys_fhlog` VALUES ('297c8c4db0e14d8ab0a91bec02723a18', 'admin', '2017-11-18 10:39:38', '退出');
INSERT INTO `sys_fhlog` VALUES ('29a77063af384e4bb1b42c26d02b3223', 'admin', '2018-08-09 18:08:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('29b7040b12e04efcbe025919f124937a', 'admin', '2018-07-10 14:23:50', '删除按钮权限PageData [map={BUTTON_ID=46992ea280ba4b72b29dedb0d4bc0106, ROLE_ID=de9de2f006e145a29d52dfadda295353, guid=1531203830508}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@6a0c60f]');
INSERT INTO `sys_fhlog` VALUES ('29b987c333bf43aca5556b6d5838c8b8', 'admin', '2017-11-07 21:52:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('29bd3fbea5a54624b561f3880d80286b', 'admin', '2018-08-24 14:48:08', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('29bff8727d504f6aacb3caf08ec23ac9', 'admin', '2017-11-09 10:53:09', '退出');
INSERT INTO `sys_fhlog` VALUES ('29d67ed2a2ea4d97abd2bcefbb8ec860', 'admin', '2018-08-23 17:31:00', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('29ed060bcd874f5bbb6dd424d9fa5b79', 'admin', '2017-09-26 08:58:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('29f097e9522f46fbb014feedf3318a56', 'admin', '2017-03-14 23:44:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2a130e6c33ea4ae4a98d8112530be566', 'admin', '2018-08-23 17:33:18', '退出');
INSERT INTO `sys_fhlog` VALUES ('2a1a94423ea541a79146332b4f207c4c', 'admin', '2018-02-07 16:41:43', '退出');
INSERT INTO `sys_fhlog` VALUES ('2a4c06b9cc504c7ea1ef743e53f49f81', 'admin', '2017-11-18 14:57:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2a63adc4dfa1487a9dc9d5af09be8f93', 'admin', '2018-07-28 14:44:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2a6d2ca4d27e441b9236b2528d94cd86', 'admin', '2017-11-21 09:23:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2a7147144f804cd780c4f135d8999572', 'admin', '2018-01-28 14:42:41', '删除系统用户：PageData [map={USER_ID=d5641273d26d46d4a3440f6c49a363b2, tm=1517121761713}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@1fafa46]');
INSERT INTO `sys_fhlog` VALUES ('2abfc8e719eb42419d1b37c14ea40939', 'admin', '2018-07-13 16:44:24', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('2ad4d8f0158c4dfb9dce59f0e5056ab0', 'admin', '2018-03-09 22:36:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2ad5307c7674428c8068ade123c5daca', 'admin', '2017-08-07 20:14:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2aef6aa4ffdd42f78a4456cab36c5430', 'admin', '2018-08-17 10:38:44', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('2b48806aa6d441858edefbd8a98ec6e0', 'admin', '2017-11-23 11:33:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2b5aa032c81944d698377de646fe7ca1', 'admin', '2018-08-17 09:58:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('2b5c0f9b15e546cdadd7ba9ca1ab13a1', 'admin', '2018-07-13 15:45:27', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('2b6680ac8fd444e3beb20af1cc522809', 'admin', '2018-08-11 14:26:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2b680face94640989f646e8face61d32', 'admin', '2018-08-17 09:42:17', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('2b87172527324cc6a2a09572479d2c1b', 'admin', '2018-03-15 17:04:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2b8b608d866240d8a8b77eaa3bab2197', 'admin', '2018-07-13 13:33:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2b97d4f996464d028d75cbdf9e969b9c', 'admin', '2018-07-13 16:41:56', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('2b9b0fb6d1cf46c7acdade4d0017db94', 'admin', '2018-08-07 17:22:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2b9cb7bf2d174ed793727df5e102f415', 'admin', '2018-08-23 17:31:00', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('2bb97d6530ef4584a35fb758f0cfe3af', 'admin', '2017-11-04 17:22:15', '修改金额提成:4');
INSERT INTO `sys_fhlog` VALUES ('2bc9efc8729f467b95505c85b0345e72', 'admin', '2017-12-16 11:38:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2bd897861eea4a3eb7bcdf903d587854', 'admin', '2018-08-23 09:58:08', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('2bdcfc50d6744d02aee5c2088a073eb1', 'admin', '2018-08-16 14:26:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2bea38bd4e42400786d520c93aedb503', '18990673099', '2018-03-22 08:24:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2c22dba86ea44563a2be55190582536a', 'admin', '2018-07-13 16:44:09', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('2c593923b6c64d4aa9b8581eadee5ce2', 'admin', '2018-08-13 17:40:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2ca2404a10134d72b4f5b20daac32b97', 'admin', '2018-08-13 17:03:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2ccc3c1d9b6b40f2ba8a10497d65f200', 'admin', '2017-12-29 13:14:17', '修改代理条件:null');
INSERT INTO `sys_fhlog` VALUES ('2cdaaa4799044a3f98e4a338202d7565', 'admin', '2018-08-17 09:48:22', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('2cdc32f2afee4372a8d54eb51d416f97', 'admin', '2017-09-04 09:14:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2cdd02ca326943beb19e39ff66fd34c2', 'admin', '2017-11-18 10:38:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2ce659fb5ae04decbf00a2eb4569b02b', 'admin', '2017-12-04 13:01:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2d000022bbdf48fa95850131d753e448', 'admin', '2018-08-17 10:32:32', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('2d8115c16eab4749b2787fbe6ca8c776', 'admin', '2018-08-16 18:05:28', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('2d953e9dc05347e7ae885537a2600587', 'admin', '2018-08-17 09:45:59', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('2da35295bdb0491e9c97f4680b94410f', 'admin', '2017-07-31 20:20:03', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('2da8a29c63dc4faab4058c59fdfbf3aa', 'admin', '2018-07-13 16:43:36', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('2db71ef2a8a449eeb2e2f1c5754a11c6', 'admin', '2017-09-24 20:46:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2dbcecbb835145348c17568ccb4fc54d', 'admin', '2018-08-21 16:25:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2dc3d25798cb4dc988672d18745965b9', 'admin', '2017-08-30 09:58:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2dccd19ac78a4e89aecf425fc50124f3', 'admin', '2017-08-29 19:25:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2ddbbe448d6d4e7b927471ba160e42ae', 'admin', '2017-09-20 13:07:50', '修改角色:分店店主');
INSERT INTO `sys_fhlog` VALUES ('2de932e0c7d04c6d8a2a7af2d819bdfc', 'admin', '2018-08-16 18:18:48', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('2e014ff537124cb38343eab96c3906cb', 'admin', '2017-09-28 16:39:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2e13c137ca4440a0b41d1c9e6e115bc3', 'admin', '2018-07-13 16:44:34', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('2e1b4f2d495b473f9ef58352ffecbdbf', 'admin', '2017-12-25 13:48:39', '删除菜单ID106');
INSERT INTO `sys_fhlog` VALUES ('2e1fa8f933764aa6af2a41bc41b69943', 'admin', '2017-11-16 17:02:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2e4d0c02a7904f2fac85df73b032a716', 'admin', '2018-08-17 10:34:14', '退出');
INSERT INTO `sys_fhlog` VALUES ('2e76a763b4a34ae8aa75c466f7afd040', 'admin', '2018-08-17 10:40:38', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('2e8ed79765f04170912394644084850f', 'admin', '2018-01-18 11:14:07', '删除角色ID为:8b70a7e67f2841e7aaba8a4d92e5ff6f');
INSERT INTO `sys_fhlog` VALUES ('2e940597c58f427fa17ecedf3391df7a', 'admin', '2018-08-15 14:04:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2e946630f6454a968f7f3236d232c465', 'admin', '2018-08-11 14:32:59', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2e9e42176f9640458a4db3b31d18cfc1', 'admin', '2017-09-29 12:15:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2eb087ddd7104ccc854ea765412a4f2e', 'admin', '2017-12-13 09:15:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2ec1c42a52894aa9b590ba4807747f65', 'admin', '2018-07-13 16:42:24', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('2ecc1dbb25634459a555900046e639f5', 'admin', '2017-11-07 11:47:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2edbadabcbd041579655ec073859d83b', 'admin', '2018-07-13 16:41:53', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('2edff73cde3e48faacb9ad3c4a8096d6', 'admin', '2017-12-14 17:35:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2ee04ce7fb0a4930902791dd14b13bbd', '18990673099', '2018-04-17 17:52:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2ee731202e1941cc846d8e11837e21af', 'admin', '2018-01-25 10:55:12', '退出');
INSERT INTO `sys_fhlog` VALUES ('2eed7778b9f14d67a33ca09f87313323', 'admin', '2017-09-09 18:45:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2efe83368e654942b891ccf821d23150', 'admin', '2018-08-18 17:23:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2f0ea0bdcf5a4e4eb3745bf7fdb2f963', 'admin', '2017-11-04 13:08:34', '新增菜单合作伙伴');
INSERT INTO `sys_fhlog` VALUES ('2f14b0fa0cfa4084912f60efd4a19a39', 'admin', '2018-08-17 09:40:43', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('2f19bfbd6e834ed5968c08e8149976f4', 'admin', '2018-02-01 13:53:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2f2ca953ead1463987dacd8e077c33a9', 'admin', '2017-11-21 15:22:10', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('2f3f7cf21798405285b683f6eb06fbf3', '18990673099', '2018-03-16 13:26:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2f412cdc9a694746b1a8ca8d2bba8788', 'admin', '2017-11-22 14:35:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2f42c6faba6444fbaae9f846f836651d', 'admin', '2018-07-10 14:23:50', '新增按钮权限pdPageData [map={BUTTON_ID=46992ea280ba4b72b29dedb0d4bc0106, RB_ID=eae24012c935475fab9e40c27d0110bd, ROLE_ID=de9de2f006e145a29d52dfadda295353, guid=1531203830337}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@39ebef2]');
INSERT INTO `sys_fhlog` VALUES ('2f66f84e63a540a08391d7c5c3324d41', 'admin', '2017-12-05 10:26:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2f6fe6e5383e4bf0b8471114c235eddd', 'admin', '2018-03-13 14:05:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2f777e0debe14ce09ef63ee7ba1a60e4', 'admin', '2017-11-25 09:53:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2f8be52b76274a76b61d61b273414da3', 'admin', '2017-11-04 12:49:35', '修改金额提成:3');
INSERT INTO `sys_fhlog` VALUES ('2f8f0bf997d64656b6403a3368eb79a7', 'admin', '2018-08-17 09:40:43', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('2f99d63e0d8e4f34b7061358f43de31c', 'admin', '2017-11-08 12:03:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2f9ed70576674370a81de6ac881f1d58', 'admin', '2017-10-09 09:52:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2fa8fb030e684d3e8a44e83539433749', 'admin', '2017-11-11 10:07:18', '退出');
INSERT INTO `sys_fhlog` VALUES ('2fa97158f9fd4602b3b4362ede14cc6a', 'admin', '2017-09-27 09:18:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2fcec0f14c4d41249bc43180d7dbc683', 'admin', '2017-11-23 15:47:10', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('3019487795f647feb60902197735f4ca', 'admin', '2018-08-17 10:40:38', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('301f9b87f8d84e9daff7f25adb93a707', 'admin', '2018-08-17 09:48:24', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('30261ad083244f828b45f2b8e4253cfa', 'admin', '2017-11-10 19:00:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('30386ae05283460aa66ea7c64d7d9e88', 'admin', '2018-03-15 18:05:39', '退出');
INSERT INTO `sys_fhlog` VALUES ('3042d58ec9084a00877b0088e1203b31', 'admin', '2018-02-07 16:45:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('30636d4f74884e179f7554b61d4eca6e', 'admin', '2017-08-09 10:17:20', '退出');
INSERT INTO `sys_fhlog` VALUES ('30715885e1a14ca680cb2372cfb12d03', 'admin', '2017-11-07 20:32:01', '修改系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('30800e5dd6734db38a2fce98e865380a', 'admin', '2017-12-16 11:08:06', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('3090b620e4e84351bd4f17555f1e18f4', 'admin', '2017-08-17 11:48:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('309c8149d5784c6a827804e6644b213d', 'admin', '2017-11-22 14:05:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('30ad8f5d1af44984903f2d4db4ddff0e', 'admin', '2018-07-13 15:11:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('30af0c1337e44e8aaa0e6a9c46a84f76', 'admin', '2018-08-10 17:14:53', '退出');
INSERT INTO `sys_fhlog` VALUES ('30b2a0cc407643e48721493adb554ffe', 'admin', '2018-07-13 16:43:46', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('30b2a46e0fcd48bb9f8b4d2e0621e83d', 'admin', '2017-11-17 19:27:51', '新增合作商家：null');
INSERT INTO `sys_fhlog` VALUES ('30b49f0d68e149b2b10206e27b3f33a3', 'admin', '2017-12-28 14:10:25', '退出');
INSERT INTO `sys_fhlog` VALUES ('30bb4222cd3e406ba17b4e0698b271a2', 'admin', '2017-11-07 10:38:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('30d2c760b4234c68b9fd242042fa3c64', 'admin', '2017-07-31 21:29:15', '修改菜单商品增加');
INSERT INTO `sys_fhlog` VALUES ('30d8aa641f734465a1834cf846d6ad9a', 'admin', '2017-11-17 17:42:16', '新增合作商家：null');
INSERT INTO `sys_fhlog` VALUES ('31031ddf90db410a84a7876034c87259', 'admin', '2017-09-20 13:20:18', '修改角色:铂金卡会员');
INSERT INTO `sys_fhlog` VALUES ('31040dc26770410780e2af3d458ba09f', 'admin', '2018-01-25 17:55:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3104f86ddc1847ae84d872828cb96dda', 'admin', '2018-07-13 16:42:23', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('310da5c25cf94352a41a7a96b36da0ad', 'admin', '2018-07-13 16:42:02', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('312be24767da4ace969b21cb5b6a3b95', 'admin', '2018-08-17 10:09:47', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('313462657c624069922b16b536ff6ccb', 'admin', '2018-08-21 19:03:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('316b6651ab0e4e4198459b32b52c6725', 'admin', '2018-08-16 18:02:17', '修改菜单建议列表');
INSERT INTO `sys_fhlog` VALUES ('3196dd0382ad405b881201b7739f91a0', 'admin', '2018-08-16 17:57:03', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('319c64948a514cc6adc0572164ecc15b', 'admin', '2018-01-22 11:37:29', '修改菜单红包记录');
INSERT INTO `sys_fhlog` VALUES ('31ac669d7d314f719d0b86e23095efdf', 'admin', '2017-11-15 17:37:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('31c80d284b0844fead95431f63e427e2', 'admin', '2017-11-07 18:35:07', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('31cefe710b6c4753b4b24902307e02f7', 'admin', '2017-09-05 13:15:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('31d2c24258dc4f6d8c07fd5bf4f83089', 'admin', '2017-08-09 10:17:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('31d46d39286347d583bbf2aaf6b3ad2d', '18990673099', '2018-03-18 12:32:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('31dc05b077c349928cfc93157791c328', 'admin', '2018-08-17 09:40:00', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('31de9c30f13843acb473488be6452369', 'admin', '2018-07-13 16:42:36', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('321362cb5c9149f2b6362a95a2c9219c', 'admin', '2018-08-10 17:10:59', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('322786e36d9146eeaec38ec7e08a61fc', 'admin', '2018-08-10 17:14:24', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3243c393cc4448b3b1ba3c4973afa3c5', 'admin', '2018-08-06 10:57:01', '退出');
INSERT INTO `sys_fhlog` VALUES ('3248295631e741c89447f0f17c2d871c', 'admin', '2018-07-13 16:43:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('324adb38085e4035b5031c0c458737d7', 'admin', '2017-07-31 21:48:22', '修改菜单待发货');
INSERT INTO `sys_fhlog` VALUES ('324f0cc6caee420f8bcbce91a22d3767', 'admin', '2018-08-17 17:16:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3260e46162e342a88a148c7c54c3cd1e', 'admin', '2018-07-13 16:42:47', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3274c737a5384c3ea1bc6b9dbeff7572', 'admin', '2018-01-18 11:12:00', '删除菜单ID127');
INSERT INTO `sys_fhlog` VALUES ('327a1c11d7aa48f8a84721dfe03c14c3', 'admin', '2017-12-08 09:35:24', '删除按钮权限PageData [map={BUTTON_ID=da7fd386de0b49ce809984f5919022b8, ROLE_ID=115b386ff04f4352b060dffcd2b5d1da, guid=1512696924067}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@c2790d]');
INSERT INTO `sys_fhlog` VALUES ('327d954dc2b745de85c738709dd29364', 'admin', '2017-11-10 17:39:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('32948a746f1e4f7aa0f09c624359dc7e', 'admin', '2018-08-18 16:22:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('329fdb82a8be41a493c4307fbe247127', 'admin', '2017-09-08 12:33:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('32a62447573a4fff9682c82fa3a528c7', 'admin', '2017-12-08 09:35:24', '删除按钮权限PageData [map={BUTTON_ID=fc5e8767b4564f34a0d2ce2375fcc92e, ROLE_ID=115b386ff04f4352b060dffcd2b5d1da, guid=1512696924747}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@112945]');
INSERT INTO `sys_fhlog` VALUES ('32a913bfe9204e29980e319ee7230d9e', 'admin', '2018-08-17 10:38:44', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('32abf1778a7f43a3bc03b66e82d84b36', 'admin', '2018-08-18 14:57:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('32ac3b31a9fc48f0beca481b76ef10b2', 'admin', '2018-08-15 15:31:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('32b0cf978280426b97ec66b284a82663', 'admin', '2018-07-13 16:44:18', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('32bac3f8173e4e4694c5a5b5d8757328', 'admin', '2018-07-28 15:49:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('32c6d1697c5241c89d0da3763f634ee8', 'admin', '2018-07-13 16:44:16', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('32cd93db650449db910219f62b5a963e', 'admin', '2017-12-28 15:00:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('32d38dd6907548b5b62ff10e2a7d2689', 'admin', '2018-07-13 16:43:03', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('32e90c5467d44064a4fd6207c007ee5a', 'admin', '2018-07-13 16:42:21', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('32f1f5b873fc4e67854204e000732ad2', 'admin', '2017-09-20 13:09:58', '修改角色:四星级店长');
INSERT INTO `sys_fhlog` VALUES ('331d06b9698745c0be4d4d6e3c12490d', '18990673099', '2018-03-16 10:07:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('332a46a5bc6743fe8c4421072fed6ef1', 'admin', '2018-08-01 14:16:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('332c55c6807744cf89f24dd52813ddc2', 'admin', '2018-07-13 16:43:43', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('334c4aade3db4c3da14f9b2a9a227ae5', 'admin', '2017-11-15 17:10:20', '新增角色:负责人');
INSERT INTO `sys_fhlog` VALUES ('335fb81385f141dbaccb241db40d237e', 'admin', '2018-07-13 16:43:18', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('33658533aedf4c2abe1aa419a311b8d7', 'admin', '2018-03-07 17:02:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3366352275494925a2fe9dfb63ba95a4', 'admin', '2017-11-04 17:23:20', '修改积分提成:3');
INSERT INTO `sys_fhlog` VALUES ('339e57ad36d641cbadc57793c607e798', 'admin', '2017-12-12 13:19:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('33adb66a978c4790b2943f94be3b61ef', 'admin', '2018-08-17 09:40:55', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('33af40ec0b104a26bc3beb2e314a3f76', 'admin', '2018-07-13 15:45:26', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('33c34f7d0e8a44448bc03893f31c7203', 'admin', '2017-11-09 15:54:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('33ca04457bb64fdcb300bca4c0b8da4b', 'admin', '2017-03-29 01:22:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('33cd15b9433a46ff980ade33ced608ae', 'admin', '2018-08-17 09:48:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('33ddde9305de4e599e38e8a9c13e29c2', 'admin', '2017-11-02 16:24:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('33e7b025b8bb4663ae4adf48dd635f21', 'admin', '2018-02-05 13:23:51', '修改菜单群申请');
INSERT INTO `sys_fhlog` VALUES ('340c188b690d45289225b9c2ffccd5cd', 'admin', '2018-08-16 17:57:02', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('341a1fc7871040e8b53bd081479e39cf', 'admin', '2017-08-07 21:44:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('341dd4f9c42d4655951983f8d4e04403', 'admin', '2017-11-23 15:38:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3436f4ec8da440839d2a92c2e981edec', 'admin', '2018-07-13 15:31:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3453c96281e54790a9c5dc5ff59fddaa', 'admin', '2017-10-07 09:31:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3455c0132d3b4bc78666513daf6bb088', 'admin', '2018-01-25 10:47:39', '修改菜单广告');
INSERT INTO `sys_fhlog` VALUES ('3469ad46041b44f39e95609b9106042f', 'admin', '2018-03-20 21:46:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('347a95931c454577860d08c7d3b5bfee', 'admin', '2018-08-21 18:54:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('348a633d82154f0eabe67f8ce799521b', 'admin', '2017-07-29 21:48:11', '新增按钮权限pd{guid=1501336091122, BUTTON_ID=cc51b694d5344d28a9aa13c84b7166cd, RB_ID=6158a1e6be544884a02f686895e5a54f, ROLE_ID=115b386ff04f4352b060dffcd2b5d1da}');
INSERT INTO `sys_fhlog` VALUES ('34b248a5f2d14f9ca92ff971fd8852d2', 'admin', '2017-08-21 09:19:26', '新增菜单跨界平台');
INSERT INTO `sys_fhlog` VALUES ('34c0ec7640d1488ba3343994a0529c06', 'admin', '2018-08-17 09:58:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('34c892a84eee4cf39e1a0f5624052c4f', 'admin', '2018-04-14 15:49:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('34fad8190a614c6c8952ba828c733647', 'admin', '2017-01-20 10:42:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('350946e3894b4d84a55f1b54af60c8d4', 'admin', '2017-11-22 17:50:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('350c6c60d14d468a8fb5ecc5039765db', 'admin', '2017-08-04 09:26:27', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('35103b916aa5485fb34ac10138a889bd', 'admin', '2017-11-23 20:20:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('352323bdad7b471aa0190a19202f8351', 'admin', '2018-08-23 17:30:59', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('3529a4a4b2b64a56b456ae88f64b1604', 'admin', '2018-07-13 16:44:18', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('352fd255a2f844c7b6072df669f33af2', 'admin', '2018-08-10 17:14:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('353a7a6325d640eb96d96228790514fb', '18990673099', '2018-03-05 18:54:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('354272ff5d2d4154a7cf57daa78cda9c', 'admin', '2017-08-03 22:49:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('354d7a0b64d2475ba8d38a2e9fae8fad', 'admin', '2018-08-10 17:13:36', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('3564669bb43b4a78bce55d33a14d4047', 'admin', '2017-11-08 09:27:47', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('356c14cd033c4a93babcf6ef0196495e', 'admin', '2018-08-17 09:40:01', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('357805eb5ce541909001dcbe352d083e', '18990673099', '2018-06-01 10:52:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3578f0b9871e4927b27f7d112b87456c', 'admin', '2017-12-25 13:48:24', '删除菜单ID114');
INSERT INTO `sys_fhlog` VALUES ('3579990e3f21487fa982f93b6032ef37', 'admin', '2018-08-17 09:48:24', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('357a117610fa45a78aa9ce0eaf9204da', 'admin', '2018-07-13 16:42:19', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('357f9d735f4749c5a121e017a5880895', 'admin', '2018-07-13 16:42:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3587ee87765f41c98929e151bc2f3e89', 'admin', '2017-11-08 09:20:57', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('35930369d4f84eb5824e001049d65983', 'admin', '2018-07-13 16:43:30', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('359e4bc72a964bf984190f7f7018c67f', 'admin', '2018-07-12 15:41:05', '删除按钮权限PageData [map={BUTTON_ID=46992ea280ba4b72b29dedb0d4bc0106, ROLE_ID=de9de2f006e145a29d52dfadda295353, guid=1531381265005}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@1864312]');
INSERT INTO `sys_fhlog` VALUES ('35aee7c6728a4aa19d0c0ade0baf512f', 'admin', '2018-06-18 11:08:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('35cea5021fe44a019bda68918df81f00', 'admin', '2017-08-18 07:02:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('35f2296ae075444280c045ee0c14c62b', 'admin', '2018-08-21 18:26:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('35fc3023a756400e9be83f4bf22aa745', 'admin', '2018-08-16 18:04:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('36000d384eeb446296a1ddcd5d3de83a', 'admin', '2018-08-23 11:41:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3610f53948894ffcbed462938d5cbadb', 'admin', '2017-07-31 19:55:36', '新增菜单NI HAO ASDF');
INSERT INTO `sys_fhlog` VALUES ('3611431a083845f3a8485f55944b557d', 'admin', '2018-08-23 17:33:06', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('361a15bf60ff4d51b9f74c9167d4f90a', 'admin', '2018-07-13 16:41:54', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('362780c50acc4a3fabf1cab80700f03e', 'admin', '2018-08-17 09:48:23', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('363015aa13974d69ae83daccc8abf688', 'admin', '2017-11-04 12:38:40', '修改金额提成:4');
INSERT INTO `sys_fhlog` VALUES ('363d84ec56324939ad372746c95fcb02', 'admin', '2018-08-10 17:53:25', '退出');
INSERT INTO `sys_fhlog` VALUES ('36476217f3ad4559b7ad43f0dcbef903', 'admin', '2018-08-11 15:00:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('364cfa793e06421f9d01b16807ee48b8', 'admin', '2018-08-17 10:04:03', '退出');
INSERT INTO `sys_fhlog` VALUES ('36654df486c245598c1ac57be4ac1a2d', 'admin', '2018-03-15 17:29:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('366aa5d40249466facdb6ed6461b8ab3', 'admin', '2017-09-04 11:03:48', '退出');
INSERT INTO `sys_fhlog` VALUES ('36724db88ffc4d4bb4fa2176a9b6a1bc', 'admin', '2018-08-17 13:24:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('36b3ce18022a4e3093fd14e55fc16e7e', 'admin', '2018-08-01 11:51:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('36c9b44c71dd497a89859c0f40ac344d', 'admin', '2018-08-13 11:25:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('36cb5ebe7e004c7cb80bd1f956a526a6', 'admin', '2018-08-18 16:47:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('36e0fa5165644108b6341fc6cb69b638', 'admin', '2018-08-16 18:20:17', '退出');
INSERT INTO `sys_fhlog` VALUES ('36fef4c299cd48fbab695d594f8850a8', 'admin', '2018-07-13 16:42:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('37133b3c0fc24824aeed886b04f86eaa', 'admin', '2018-08-17 10:38:42', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('3724e4d9cebc4fd69a3ffc6bdf6b5f10', 'admin', '2017-12-16 13:31:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3725ef6db1b440eb8e25ca054175b819', 'admin', '2017-11-07 20:37:28', '删除角色ID为:856849f422774ad390a4e564054d8cc8');
INSERT INTO `sys_fhlog` VALUES ('3739658dd0de4c7ca1c22459452d1784', 'admin', '2017-11-10 16:47:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('373ff97a7d9445d9af7dc8fcc529f9b5', 'admin', '2017-11-23 21:03:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('37423e75cc0944dd9644fcac3164e5eb', 'admin', '2017-08-09 18:33:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('374338f04e8e4b42a29afbe3c3cd3f7c', 'admin', '2017-11-15 19:30:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('374452191a154a98b0509308c79fc60c', 'admin', '2018-01-26 16:55:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('374962d952a84e6d8fc46794dbdb43bc', 'admin', '2017-10-31 11:37:54', '修改菜单颜色管理');
INSERT INTO `sys_fhlog` VALUES ('3758ccad5dbb48b2b2af6acc32c7a256', 'admin', '2017-11-04 16:37:39', '删除系统用户：PageData [map={tm=1509784659822, USER_ID=fb9f8e5b9a5b460a914c3915dc16294e}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@7c936e0f]');
INSERT INTO `sys_fhlog` VALUES ('3770f2cb02984da98b41b02b8450b95f', 'admin', '2018-08-15 16:21:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('377b7b298bdb4a879974addbf1aa4750', 'admin', '2017-11-04 16:29:55', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('37a4af7063664bf188fd839c7fd6a063', 'admin', '2017-11-23 19:35:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('37a97c875bd94e73b86a7ba266568f23', 'admin', '2018-08-16 18:04:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('37b771ca7c5b4106b80123423dfc73d8', 'admin', '2017-12-08 10:03:20', '退出');
INSERT INTO `sys_fhlog` VALUES ('37d839b0aeaa4673838032fa57f7b0fb', 'admin', '2018-08-07 17:49:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('37e3b14336e54c60aaf04db7e219cafe', 'admin', '2018-07-13 16:44:31', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('37e4a2bc1d894f49a3f83e0b328870b8', 'admin', '2018-07-13 16:43:34', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('37eb5bd74ce64e978bafc4690bd97e5f', 'admin', '2018-08-14 09:22:09', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('37f3d4ead4c3422eb4db5a015c06cac7', 'admin', '2018-07-13 15:38:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('37fd2e64b46c4d80bb44ee9077b8e29d', 'admin', '2018-08-13 18:25:24', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('37feff770450425fb1c8941be511545e', 'admin', '2018-08-17 10:06:50', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('38005899c78545d9992d7492cfde6a62', 'admin', '2018-07-13 16:44:02', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('381e2d5d8e304edbbf069a41a5082605', 'admin', '2018-01-08 14:23:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('381f3f27c1fc4a3d8b74d020d98721b7', 'qq728971035fhadmin', '2017-08-04 09:22:15', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('382dde5748674543964c647eddd051c5', 'admin', '2017-11-22 18:45:31', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('38349c8cb5094897a3c6009ba5a85ec6', 'admin', '2017-11-04 13:08:51', '退出');
INSERT INTO `sys_fhlog` VALUES ('3839a2b729c1441f98bfa3d7d19a4183', 'admin', '2018-08-17 10:03:18', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('3840c92db79148a699b82bcb349c43a6', 'admin', '2017-12-11 11:29:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3860393a14e14032b018f3d64bf76f00', '15982183168', '2017-12-08 09:30:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('387ef233bcd34deb92dcc39f1ea34ca4', 'admin', '2018-08-14 14:16:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3883a98a5a6e4374b7af3dc2dc281b3c', 'admin', '2018-08-21 17:25:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('388a2a19fc604c4db4bd23247ea3a7dc', 'admin', '2018-08-23 09:58:08', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('38d5461751e24571a2efb9fd5585a8b9', 'admin', '2018-01-26 11:46:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('38de43e1d0fb42068a1f694e934bb351', 'admin', '2018-08-16 15:37:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('38e512c8ef1b493f9a89c4365a68b2da', 'admin', '2018-08-17 09:40:00', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('38ed12564e29442db87e6a6e87c5ab60', 'admin', '2018-07-13 16:44:37', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('38fcaef8c3304ff3983ac69967e0f486', 'admin', '2018-07-13 16:44:08', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('38fe0d49d5b949fda777df249947b714', 'admin', '2017-11-25 09:58:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('390e0b273cb94542adddf297c162afde', 'admin', '2018-07-13 16:43:02', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('39150fe7decd4a758aa40819bd451508', 'admin', '2017-11-07 19:59:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('39195850aa814cce9b8552bfe0b8a422', 'admin', '2018-08-16 18:18:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('392dfcfd9ef04db980bfe554157d107b', 'admin', '2018-07-13 15:38:32', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('392f3412a07049efbb0b8f4ac303ec5e', 'admin', '2018-08-13 18:24:44', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('393e85641d5f4ec3b853887022246551', 'admin', '2018-08-16 18:05:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('393e97e7487e4ede95088fa4461a429d', 'admin', '2017-08-14 13:18:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('393f77c11482433b950f162494a8f848', 'admin', '2017-12-05 09:43:39', '新增角色:工人2');
INSERT INTO `sys_fhlog` VALUES ('394197a209854d288debdf51238f9b72', 'admin', '2017-11-04 13:58:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3949edc4e091452fb7e2fc904ecc5902', 'admin', '2018-01-18 11:11:31', '删除菜单ID120');
INSERT INTO `sys_fhlog` VALUES ('3951143c4e7e4c13aadcd22af3231578', 'admin', '2018-07-13 16:44:06', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3958d34413e0452fb4d428ef05844c9f', 'admin', '2018-08-16 16:52:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('39a04d661fc74cf99a16fb42d11f1688', 'admin', '2017-08-26 21:17:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('39d62dec1e024c93bb7226d9b4a92402', 'admin', '2018-08-17 09:48:23', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('39d6cd9b8b9f412ea5bfbb97ab0aebac', 'admin', '2018-03-15 16:08:28', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('3a1ad726626e473b9acaed2a027ae8fd', 'admin', '2018-08-10 17:14:25', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3a241e90901a451d88148dbcc8a4cf1a', 'admin', '2018-08-16 17:56:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3a2a3d9fb001455787c05d75bdf7535e', 'admin', '2018-08-13 18:23:17', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('3a2d165663c44f348f1aace5ae18a732', 'admin', '2017-12-29 09:19:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3a2d98005f014e3b93b2475cad7cf6fc', 'admin', '2017-11-04 13:12:47', '新增角色:维修');
INSERT INTO `sys_fhlog` VALUES ('3a62957f1bad448cba2059db170ad5f0', 'admin', '2018-08-17 09:42:18', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3a65e2c3d020413da0dae9cf92bfed7b', 'admin', '2018-08-10 16:41:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3a660258781544f79dec0dfd474fa198', 'admin', '2017-12-06 20:26:18', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('3a67943f9b02459d8f55963cd1029366', 'admin', '2017-11-04 12:44:48', '修改积分提成:5');
INSERT INTO `sys_fhlog` VALUES ('3a69801c8bbe474d80c3d82516c3eb07', 'admin', '2018-07-13 16:42:30', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3a7b284665da4e888d85eb1680f8c8ea', 'admin', '2018-08-17 15:22:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3a7b4657c6d3484b8dc43778c7d03943', 'admin', '2017-08-04 10:08:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3a90f00fb9514a808225a1ee560dd02e', 'admin', '2018-08-17 09:42:02', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('3ac51420bb3442969c6e2885bd5759b9', 'admin', '2017-11-22 10:41:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3adb55ce4f9d4feca9c0067da26bb27e', 'admin', '2017-11-08 11:19:59', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('3adee8de6ce044838c689dd40e1def24', 'admin', '2017-10-30 11:03:11', '修改菜单品牌管理');
INSERT INTO `sys_fhlog` VALUES ('3ae7013d34504e08b5332e95fc768e16', 'admin', '2018-07-13 16:43:40', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3aee66582ed54279a0552d20e39a7ea1', 'admin', '2018-08-08 16:03:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3aff040e7057447f884814111ddd40a3', 'admin', '2018-08-16 18:04:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3b032b58f9c64d60ba92ffe212087a9c', 'admin', '2018-08-13 18:23:17', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('3b140ca66cbc49fd9e47bf28e5692ce9', 'admin', '2018-08-17 09:42:17', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3b1a96065cd04b739fd6ae0631762a60', 'admin', '2018-08-22 11:33:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3b1c01e0607a45a5b2bdf0a1a0688382', 'admin', '2018-08-17 10:39:42', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3b2842acc40a47b4a169ed0dc24a2e5c', 'root', '2018-07-10 10:58:57', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('3b4bbc38abee45b2b325267fe8039a52', 'admin', '2017-12-08 12:01:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3b4cf66d78054b878b7bdb6e738f3255', 'admin', '2018-08-17 09:39:59', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('3b533675e6754066a62da783a74b22fa', 'admin', '2018-08-17 10:38:45', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('3b576c65c3674ec486f7403cd75c012d', 'admin', '2018-07-13 16:43:08', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3b620c15a23c48ce94c46f4e73e54748', 'admin', '2017-11-06 21:05:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3b67e4e225894fddb0a2ad1747786289', 'admin', '2018-08-17 10:06:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3b76d9b099954b75b515a912057c2308', 'admin', '2018-08-13 18:24:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3b76fbf438394506a873b2953a56343c', 'admin', '2018-08-16 17:57:03', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3b7bb5ec9e014426bead606b1ad771ad', 'admin', '2018-08-18 15:29:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3bc3801f24d84b84a73cddf801004610', 'admin', '2017-11-21 18:37:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3bd3bd2c32474fa6969623ec9bc0ca54', 'admin', '2017-11-27 10:49:56', '删除菜单ID115');
INSERT INTO `sys_fhlog` VALUES ('3bd3d37d37f64cf0977202da3b439853', 'admin', '2017-11-25 10:10:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3bd50ef4e74f42538f9fb99fcc44492c', 'admin', '2018-07-13 16:42:47', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3bf4163a153644c3852c3b1ab8bf4239', 'admin', '2017-09-10 20:36:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3bf94ed150d349fda28b9fdcd5dbfd64', 'admin', '2018-05-03 21:21:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3c00bbe98ea04256a780e6718b8cbd2d', 'admin', '2017-11-24 18:04:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3c36a8003b48495a89409f1d56a8e319', 'admin', '2018-08-23 17:33:15', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3c5a8b43f9944d82b19782727a76756a', 'admin', '2018-08-08 16:33:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3c5fdee35ad4433ab7e058379dd11500', 'admin', '2017-12-14 19:07:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3c60992aa9d740f8b282bb3c7c9ca980', 'admin', '2017-11-17 09:56:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3c8c376be35d415793d2124c80d78684', 'admin', '2017-11-01 16:12:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3ca0efef2466471581db0f5978179693', 'admin', '2018-08-17 10:37:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3caa382a0ee5496f8f2a472d2a671b37', 'admin', '2017-11-23 18:54:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3cb188d82b0842488c0a0cab6e9a3d86', 'admin', '2017-11-22 15:02:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3cb9c226ffbb4735926ff3b57b9ace32', 'admin', '2018-08-16 18:05:28', '修改菜单建议列表');
INSERT INTO `sys_fhlog` VALUES ('3cbcf5b448af42499939e4185e3f74b8', 'admin', '2017-11-23 15:50:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3cc8987bee1040868e31ff5e722cda18', 'admin', '2017-12-06 15:27:13', '退出');
INSERT INTO `sys_fhlog` VALUES ('3ccf785788534061a3e8d8873dc52ee7', 'admin', '2017-11-23 09:34:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3cd267fe209449db8a3f0db1fcee4ae9', 'admin', '2017-11-17 10:10:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3ce3bb6edb9b44e7a88d2032d663b383', 'admin', '2018-08-10 19:38:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3cf0c2caf39949eda578075c9888af0e', 'admin', '2018-06-18 11:26:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3cfe7627c9b44ee1adadabbbaa0c4bd9', 'admin', '2017-11-13 15:45:19', '退出');
INSERT INTO `sys_fhlog` VALUES ('3d0097e20c9547f38d7c20d41b4b9472', 'admin', '2018-07-13 15:38:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3d042971d22f48e98d67319c29318bb7', 'admin', '2017-08-04 22:21:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3d0e3d8c8790447c90445e659589ad6c', 'admin', '2017-11-09 19:15:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3d106242610144cc8c81f1d72609fd5b', 'admin', '2017-08-31 16:21:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3d13bc1aba4f4cab87f82705ac1eb0ee', 'admin', '2017-12-06 15:39:13', '删除菜单ID88');
INSERT INTO `sys_fhlog` VALUES ('3d252ea0876748ba90032f61e16ccafc', 'admin', '2017-11-27 10:49:51', '删除菜单ID116');
INSERT INTO `sys_fhlog` VALUES ('3d2681d1cbb4462ebd2fe3840fae9a35', 'admin', '2017-11-04 12:05:17', '修改金额提成:3');
INSERT INTO `sys_fhlog` VALUES ('3d2a81f383894e10a76fd7691ea0e26e', 'admin', '2018-08-10 17:14:25', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3d2dc4522a1c42b38eea80553ab161e7', 'admin', '2018-08-10 17:47:09', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('3d451f1d3a9d41bfb35880b07af9d6fe', 'admin', '2018-07-13 16:44:29', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3d4d1afc8ccc4dceba7e027f52b6cd4d', 'admin', '2017-09-20 13:10:05', '修改角色:三星级店长');
INSERT INTO `sys_fhlog` VALUES ('3d4d5408a0c94e3ebd5e70057fc940fb', 'admin', '2017-11-23 20:36:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3d5539712da34604bad1d7d7c22566fa', 'admin', '2018-07-13 16:41:55', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3d5aaafaf5a74543b1d1b371646b9f02', 'admin', '2018-08-17 10:32:32', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('3d5e6835f2974073b92f6e1c4ab348e6', 'admin', '2018-07-13 16:42:08', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3d67a1af908543a0804793f463a47dae', 'admin', '2018-07-11 10:52:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3d6c5568d01f453b80d849f83b202fd0', 'admin', '2018-08-09 16:29:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3d75d539e57b40758ab6d14a88bbc37c', 'admin', '2017-12-12 10:57:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3d777a24319d4dc2bdaea4dd69a3a2b5', 'admin', '2018-08-17 09:39:59', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('3d9f688b4ff841f49f77eff7612d12ec', 'admin', '2017-11-22 11:40:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3da6f686557f4e7688e035b20c265ae5', 'admin', '2017-02-13 00:31:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3dcbdb5e9c604dfda4d321b1e5c00e73', '18990673099', '2018-03-06 09:45:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3dda11fd46b14d3d8b5ce15c8824d75f', 'admin', '2018-08-21 17:29:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3dddd734590a465f873f55c517a879da', 'admin', '2018-08-16 17:59:20', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('3ddef0cc572c4c95b8d7f3feb630ff36', 'admin', '2018-08-23 09:58:08', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3df4894bbf5742668a2c25c0cb6519f0', 'admin', '2017-03-16 01:03:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3df88d5978734ff6bd5a220b715b65e7', 'admin', '2017-08-08 20:09:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3df90e9a9c1b4503bd6481078a37d007', 'admin', '2017-08-09 10:22:27', '修改菜单洗护管理');
INSERT INTO `sys_fhlog` VALUES ('3dfac1faf21849bd8eecb14bc115b91a', 'admin', '2018-08-17 09:42:01', '新增菜单建议管理');
INSERT INTO `sys_fhlog` VALUES ('3e02fb8ba2784e7b8d396c61f1017e69', 'admin', '2018-08-17 09:58:32', '修改菜单建议列表');
INSERT INTO `sys_fhlog` VALUES ('3e139025920d419fbec9d94bf09f1210', 'admin', '2018-08-16 18:05:29', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3e15c89570bf4306a0fe8c82cdf297b0', 'admin', '2017-11-08 12:38:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3e19c377b38f405b8851b0798932ffbe', 'admin', '2017-12-05 09:42:28', '修改积分提成:2');
INSERT INTO `sys_fhlog` VALUES ('3e21011d9df34bf393a9c71fa88c7f7a', 'admin', '2017-08-09 10:53:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3e302382ba704d81ba6b3265c5fc2b8a', 'admin', '2017-11-07 17:22:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3e3325905b4a4415b2036d09f343bdbb', 'admin', '2017-12-15 11:02:33', '修改积分提成:1');
INSERT INTO `sys_fhlog` VALUES ('3e67a6a9d0284851b3aea4368531de03', 'admin', '2018-07-13 16:43:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3e68c8c366de4865925aec3d9f9a3f01', 'admin', '2018-01-31 09:40:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3e6ada98f5e44fada1e8b5e303edfb0c', 'admin', '2018-08-27 10:40:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3e6d414900334331a6f3a87c9981b7d9', '18990673099', '2018-03-07 16:58:38', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('3e89afc3b4de448dae2540ba0abf0a17', '18990673099', '2018-06-01 11:19:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3ea030f3f9a04f6dacee1a9e47105a51', 'admin', '2017-12-14 17:53:52', '删除系统用户：PageData [map={USER_ID=e598aa8575234b0183619954ed4d5958, tm=1513245232692}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@7bb526]');
INSERT INTO `sys_fhlog` VALUES ('3ea2dd4afcdd46f0aa7ecb61ce9f0816', 'admin', '2017-09-09 18:46:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3ea9385065144730b867bf7e4af5ac47', 'admin', '2018-08-17 10:01:11', '修改菜单一级菜单');
INSERT INTO `sys_fhlog` VALUES ('3eb563339f2a4731bfc387675fdba6c7', 'admin', '2018-07-13 16:44:35', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3ee255eb28bf4843a7580051f67e25a9', 'admin', '2018-07-10 14:23:49', '删除按钮权限PageData [map={BUTTON_ID=46992ea280ba4b72b29dedb0d4bc0106, ROLE_ID=3, guid=1531203828832}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@3cced7c3]');
INSERT INTO `sys_fhlog` VALUES ('3ee4fb396cee4b3384d3ce9ec9a8e0f2', '18990673099', '2018-06-04 12:01:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3ef5148f4b9a4a26b959cdf66e53e76b', 'admin', '2017-12-04 17:42:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3f026261cd444fbc822a2f0960a7d1be', 'admin', '2018-08-10 17:47:10', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('3f04e3264b6f4dd0be20f5359fe75c0e', 'admin', '2017-08-10 11:35:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3f1deb55711f4a8280be591d64715d9a', 'admin', '2018-07-13 16:41:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3f1df0d792a342ba90c3b960a0bbd2ac', 'admin', '2018-08-24 14:48:09', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('3f3b049562f648ff9f9b7016af08ae81', 'admin', '2018-08-17 10:01:12', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3f436872910e421ca590f1f4c82c0c0f', 'admin', '2018-01-23 10:08:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3f48f536f2d746ebb7e8811b41259214', 'admin', '2017-11-04 13:09:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3f58975f2d5744828e7d49735ce2e59e', 'admin', '2018-08-17 10:09:47', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('3f7808f07feb4f56be4b1391b5a84031', 'admin', '2018-08-17 09:42:17', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3f93169496aa4394ad91578c1936a7e4', 'admin', '2018-08-02 19:06:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3fa235701fdf4f3685eb0b44ec39c825', 'admin', '2017-11-27 15:45:18', '修改菜单招聘信息');
INSERT INTO `sys_fhlog` VALUES ('3fa6c072258f4a4c92970166452ee52c', 'admin', '2018-07-13 16:43:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3fab42116f414198852fc9846b7fb01f', 'admin', '2017-09-02 22:02:27', '退出');
INSERT INTO `sys_fhlog` VALUES ('3fad21ebb7aa4ab7afc3e132d108bff8', 'admin', '2017-09-30 12:46:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3fb56915b6034f29bb5b26111b21d464', '18990673099', '2018-03-19 04:35:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3fbbde08f48446e78bb45f62f9053533', 'admin', '2018-08-17 09:48:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3ff149d7bf3f45a7869eab61f6e1ff11', 'admin', '2018-02-05 16:38:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3ffe806f6f2c48d48bc124cd0e754e8e', 'admin', '2017-10-26 17:51:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('40008562f54f4f6cbae2df7f83ee35b6', 'admin', '2017-11-27 13:25:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('400223ecf2bb4dd7a99d98f865883754', 'admin', '2018-07-13 16:42:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('400f6faf7db8494c9a58bda70ffbfede', 'admin', '2017-12-11 13:30:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4029991889da4b5e81aff98d6531be0e', 'admin', '2017-11-18 15:50:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('402c31e8b50a45e88ab61fc8e15c61d1', 'admin', '2017-08-01 16:38:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4056cdda79264d069ed16fa1e08acdf2', 'admin', '2017-11-07 20:25:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('405c9534a29d433287daea3769a57b58', 'admin', '2018-07-13 16:43:11', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('40658a645b904b7294fe3b847133adb0', 'admin', '2018-08-21 18:32:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4065e1774b114e33b4089e41c4afaf66', 'admin', '2018-08-17 10:32:33', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('4067ec164a754733a81013e617e7fdbb', 'admin', '2018-08-14 09:22:10', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('406e82ed989046a191d75589df071e2b', 'admin', '2017-11-11 09:50:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('407477c4b48444fca35db61298d94ea4', 'admin', '2018-08-23 10:09:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4083d8bc97894a4f96690bc5b1da4e52', 'admin', '2017-07-31 21:28:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('40878f67f769489bb7b698aa8e09f523', 'admin', '2018-08-16 18:05:29', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('40b08cdbd4af4215ad70641d00221d73', 'admin', '2018-08-13 18:25:23', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('40d59832f7234f208c909a15a4f7c224', 'admin', '2017-12-16 13:28:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('40ea189c07f048f9b7ca8cd57579407c', 'admin', '2018-03-09 22:27:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('40eb3aaedaf44d8ab838e4d9857e53de', 'admin', '2017-12-12 10:42:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('40f084cabfc44a239401e75b37251399', 'admin', '2017-12-16 11:09:06', '删除菜单ID91');
INSERT INTO `sys_fhlog` VALUES ('40f26c18d41446a7bc0f0831250ad2d2', 'admin', '2018-07-13 16:42:06', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4100e1e6e297442c82ef57ea06d6404d', 'admin', '2018-08-21 14:46:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('410f5ca163694e0ca755257c736e41fb', 'admin', '2017-11-17 10:26:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4111a5b3921e4f69bca29c6dba9bef46', 'admin', '2018-01-23 09:39:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('412a7f3f0dcb4938857957ed4b7e79b4', 'admin', '2017-11-08 19:57:15', '删除菜单ID66');
INSERT INTO `sys_fhlog` VALUES ('412ee38cadf043bcb7af03331641b455', 'admin', '2018-08-13 18:24:44', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4136cfa5824d4355b16e6e81db12bb8c', 'admin', '2017-10-26 11:09:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('414187d3872d45adb8b3864267eed126', 'admin', '2017-11-07 19:32:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('41867c16b46a498b8541052fd6d0ab96', 'admin', '2017-12-06 09:27:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('419c9a2799224b78b92ff32aa22aebfc', 'admin', '2018-01-26 18:14:15', '退出');
INSERT INTO `sys_fhlog` VALUES ('41be5a9220c1422f86bbffab7170e008', 'admin', '2017-03-29 03:14:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('41c3ab1894b443b7833f5a9dd76cb3ab', 'admin', '2018-08-13 13:05:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('41d42d339e8f4472ac49708fd115dc02', 'admin', '2017-09-20 13:21:29', '修改角色:钻石卡会员');
INSERT INTO `sys_fhlog` VALUES ('41df7d277419420aa05ed53f738de482', 'admin', '2018-07-13 16:43:24', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('41e2b8a575c44d1bbf5a3cedaef10333', 'admin', '2017-11-17 10:21:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('41e65e58ed2a42389f0310b7130f1851', 'admin', '2018-08-17 10:32:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('41e992b32d254d52b3c118c47b09ea01', 'admin', '2018-08-17 10:38:20', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('4207ff0885514fa9883451391d5e3b84', 'admin', '2017-11-17 17:08:59', '新增合作商家：null');
INSERT INTO `sys_fhlog` VALUES ('421962c30ab549498273b5d6cc8b2aa8', 'admin', '2018-02-07 16:45:01', '修改del_qx权限，角色ID为:3');
INSERT INTO `sys_fhlog` VALUES ('4225f2ab1b61472b8c03b99399074b79', 'admin', '2018-08-17 09:58:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4227000a3c7e4f85935dca6807e823b1', 'admin', '2018-01-18 11:12:04', '删除菜单ID125');
INSERT INTO `sys_fhlog` VALUES ('422efd4de6fa4b4c8295875cc2c5bd54', 'admin', '2018-08-16 13:46:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4237555d3e6c44f2a679338ff2532eb1', 'admin', '2018-07-13 16:41:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4260a71ec83b429083b0318a3e737c15', 'admin', '2017-11-18 14:31:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4274e70723d54510aaef528e0f99fd3f', 'admin', '2018-08-09 18:16:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4295d36ef52e46828616c2f234ca51ce', 'admin', '2018-08-09 16:40:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('42a4b52fdca4483dbdd51e735d6fd6e1', 'admin', '2018-07-13 17:05:31', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('42b221d78d5f4991aca14a67c2cf6315', 'admin', '2017-08-09 08:50:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('42ea1e8738f144dc96a9126c4f166113', '18990673099', '2018-03-04 21:40:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('42ed259e85ec41188ee236f689e1c31b', 'admin', '2017-12-11 18:05:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('42f6f2bce82e40f1b7eedcdd3dd19189', 'admin', '2018-08-23 10:09:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('430a90ace7da4ef2bd9aeb83a406e9e4', 'admin', '2017-08-02 19:00:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('431159a46b2442bbbc67e6c50dfc883a', 'admin', '2017-09-01 10:11:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4334659e730a4fd9898562daf6067d39', '18990673099', '2018-03-22 08:16:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('433b40989fcc4b8993fa64c7b07a18e6', 'admin', '2018-07-13 16:43:36', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('43483af3fb144391bd1121cb78150beb', 'admin', '2017-11-22 14:13:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4350b52374a74c58b49153eaf5ca0cb2', 'admin', '2017-03-16 01:02:09', '退出');
INSERT INTO `sys_fhlog` VALUES ('435765d187c44f0aa89e50b7d12fa388', 'admin', '2018-08-10 17:48:19', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('43660ad4dd2c401da174b3a8d96e4381', 'admin', '2018-08-10 18:40:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('43812b5af39f4301a07eb44640925007', 'admin', '2018-08-16 18:02:36', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4386aaf05a5441a9a08bd695d8da158d', 'admin', '2017-12-08 09:33:01', '退出');
INSERT INTO `sys_fhlog` VALUES ('439c17c95f274d6f9ac74fa02258338d', 'admin', '2018-07-13 16:42:32', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('439d86b284184eaa9edac92907912ebb', 'admin', '2017-12-11 15:16:31', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('43a8cfb9c8244b708b5367d703fcde9c', 'admin', '2017-09-05 19:13:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('43ac85cd29e14b7dbddcbb9fd15a60d8', 'admin', '2018-07-13 16:44:08', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('43ae60072ee244598ca584e59b25815a', 'admin', '2017-12-09 11:34:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('43ce7ccc5f9642748cf9c385d424651d', 'admin', '2017-10-09 17:50:16', '新增菜单财务管理');
INSERT INTO `sys_fhlog` VALUES ('43d1a03bcba946708427fa5d970e9d0e', 'admin', '2017-10-26 10:54:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('43d1d90e5a9141548a2a4f30fc6d42e8', 'admin', '2018-07-13 16:42:39', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('43d2033658c141638c810d494dd9bb24', 'admin', '2018-07-13 16:44:28', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('43dd2b92239f4e3eae2e1024d380f2cd', 'admin', '2018-03-27 16:40:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('43f54d9aec4240db8480904f1885374b', 'admin', '2018-08-16 18:06:41', '退出');
INSERT INTO `sys_fhlog` VALUES ('4406ff07d5f24e6988357b13d3c77b33', 'admin', '2017-11-09 10:43:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('44170e43ea3245ab892fca3f1cbf262f', 'admin', '2018-08-23 10:09:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('441eaf2fd79045439812df37e4d6d695', 'admin', '2018-06-01 10:53:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('44244a44aeae4c70915e794abb670f05', 'admin', '2018-07-13 16:42:41', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('442edfae018c4ac1b2895e720860f520', 'admin', '2018-08-16 17:56:13', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('4431d74731234fb282c224c91e274828', 'admin', '2018-07-26 14:31:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4433dfcaef3a45c6b246b8e2192c2566', 'admin', '2018-07-13 16:42:23', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4434a613d6e34bb1a2643ed3c99c7bf7', 'admin', '2018-08-23 17:29:52', '新增菜单帮助管理');
INSERT INTO `sys_fhlog` VALUES ('443f3218e0a740549830bcf7bc4dcddd', 'admin', '2018-07-13 16:43:42', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4440a4a1b9ab423eb7254445cb6be8b5', 'admin', '2017-12-08 09:35:02', '删除按钮权限PageData [map={BUTTON_ID=3542adfbda73410c976e185ffe50ad06, ROLE_ID=68f8e4a39efe47c7bb869e9d15ab925d, guid=1512696902810}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@6087b9]');
INSERT INTO `sys_fhlog` VALUES ('444d331c16b5431fb5b5dbf871a64b70', 'admin', '2017-11-27 10:50:27', '新增菜单查看招聘信息');
INSERT INTO `sys_fhlog` VALUES ('444ed31cc4d34eed8d34127b2b192fb0', 'admin', '2017-08-03 22:11:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('445020325840476c995d33bc7039597b', 'admin', '2018-07-13 16:42:53', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('44590228d80e4d4fbc728f2a6a391227', 'admin', '2017-12-12 13:23:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('44593569852d47019e347e3c23c1a830', 'admin', '2017-12-15 11:02:58', '修改角色:高级代理');
INSERT INTO `sys_fhlog` VALUES ('445ccc5a7ec94d70b38203f82197be6f', 'admin', '2018-08-15 16:30:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('445ec5582f2b4da29bee594eae12d0f8', 'admin', '2018-07-13 16:43:04', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4463fcd08de046d6bb16e365aa8c0ebf', 'admin', '2018-08-10 17:14:24', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('447244b695ea48c6ace17df232aa492f', 'admin', '2018-08-15 16:51:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('447e4e7cc36e40bd88f8c1f628feebef', 'admin', '2017-08-17 11:41:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('44814e6b5c2a4642bab496bff99d9427', 'admin', '2018-08-14 09:22:08', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('4490be9ed87a4e20926cfb5319af3285', 'admin', '2017-12-08 09:35:07', '删除按钮权限PageData [map={BUTTON_ID=4efa162fce8340f0bd2dcd3b11d327ec, ROLE_ID=68f8e4a39efe47c7bb869e9d15ab925d, guid=1512696907059}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@1639d9b]');
INSERT INTO `sys_fhlog` VALUES ('4494efd51d6948178b50634c6829a6c6', 'admin', '2018-07-13 16:43:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4499624d391741f2851ebd8ea0b17da5', 'admin', '2017-11-08 19:54:58', '修改菜单服务管理');
INSERT INTO `sys_fhlog` VALUES ('44a455f2ad7f47bb960ace0ac12aa8d9', 'admin', '2018-08-10 15:11:51', '退出');
INSERT INTO `sys_fhlog` VALUES ('44abf4e3283b4688b1acd38ca4cf7452', 'admin', '2018-08-02 19:24:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('44c332296ebd43f7ae505bd2e149951d', 'admin', '2018-01-29 16:31:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('44d4aa49818741e18d80113ffc8bf0ec', 'admin', '2018-07-13 16:42:16', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('44dffe313e7e4fdfb0aa68bf4332d261', 'admin', '2018-08-11 10:51:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('44e54eb34d9546839eb516ad70868924', 'admin', '2018-08-10 10:51:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('44e7aaad10a44b6fb8c380fbf206c254', 'admin', '2017-08-21 09:18:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('44fdbc6fb3e84723b1c55ef135157831', 'admin', '2017-11-23 14:54:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('450982ecef6e432384718782685e72c5', 'admin', '2018-07-13 16:43:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('450a4c5907e64da4afc1a592d44603b9', 'admin', '2018-08-15 10:22:45', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('4513167eb2714d1f90aff72565a30228', 'admin', '2017-08-30 16:16:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('451b27574aeb4583bebd01cf2ce57ba6', 'admin', '2017-10-31 14:39:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4535cb2576d0436cae6f0ba6b7327363', 'admin', '2018-08-23 17:33:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('45610f2bd6a0401d9ac6aba0e3234413', 'admin', '2018-07-13 16:41:55', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('45674e34dac24693a9ab2b85e4739557', 'admin', '2018-08-17 10:03:17', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('456c541f0688486982fa44d5312ff8f2', 'admin', '2018-07-12 16:00:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('457617ffa46f43ac8146c0f9cbc74293', 'admin', '2017-11-08 16:50:11', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('4578bdf3d55648d7979eae39c7dff8d9', 'admin', '2017-03-16 01:01:25', '退出');
INSERT INTO `sys_fhlog` VALUES ('457d179429a04260907cc6636b26d1b8', 'admin', '2018-07-13 16:41:53', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('457d8e0e609f4e6ca1670738b7236a90', 'admin', '2018-08-11 13:55:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('457fc13ccb9b473d932b27b64e5cc91f', 'admin', '2018-01-26 14:00:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('45a676ff27bb451e8f35307f93b858d6', 'admin', '2017-11-21 18:48:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('45b4bcfa11704e43be4bcd5409f63438', 'admin', '2017-12-06 15:39:24', '删除菜单ID97');
INSERT INTO `sys_fhlog` VALUES ('45b6e3b333b940dea7a83d29937a3402', 'admin', '2017-10-26 11:03:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('45b794c668834e95bf70d2574c70dc90', 'admin', '2017-11-23 14:49:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('45c377de6277470f981c03bafc126e2b', 'admin', '2017-12-07 19:03:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('45e4ddf209c548778820cfbf343075b5', 'admin', '2018-01-29 16:00:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('45edc4c31fec4ffc90541d996e5607ea', 'admin', '2017-11-09 17:32:13', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('45fca71ab1b040b68384db1f5d5f7312', 'admin', '2018-07-13 16:42:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('460783a25a214cad9a01f4b6b1ad96cb', 'admin', '2017-08-31 11:12:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4610c77d47e54dda898895d26ab0cf0d', 'admin', '2017-08-09 10:16:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4638b285efc84e48b39a5499a503bef5', 'admin', '2018-08-15 10:32:44', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('4640b7cc45604db697e517d4ef9ec606', 'admin', '2018-08-17 10:07:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('464a33f102854d4aa8a2e8e6c00e5b2c', 'admin', '2017-11-23 18:36:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4652de0184fc40c18ec89160109348ec', 'admin', '2018-08-03 10:52:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('46589c5b00fb49819b8bfe6b3fa9b74b', 'admin', '2017-11-11 09:53:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4661a57bd262472d968d63a8305409cf', 'admin', '2018-08-15 10:22:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('466fd02c03dc411fb56e2cba44a961be', 'admin', '2018-08-09 18:01:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('466fe6b28f1346858c39d79410eac04a', 'admin', '2018-08-09 18:46:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('46873aac014045eead8cd43fa438eff2', 'admin', '2018-08-17 09:47:37', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4691da84650240e3a0808a9ea57aa910', 'admin', '2018-08-16 18:19:12', '退出');
INSERT INTO `sys_fhlog` VALUES ('469669fe744c43f5becdc343d875c243', 'admin', '2018-08-17 09:58:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('46b446ea18234ee3ad67a322c68e9a10', 'admin', '2017-08-03 10:12:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('46c205b6f84c4d478698c0b7a31bb18f', 'admin', '2018-08-18 18:55:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('46cc1803a5f54766a4dbf8ecf8bd8e28', 'admin', '2018-01-18 11:13:52', '删除角色ID为:cfbbb597067f4643baebd90aff6ae966');
INSERT INTO `sys_fhlog` VALUES ('46d76ed9b8c749cebe84a8e252c4ed20', 'admin', '2018-08-16 18:02:18', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('46dadd18aad849f1be6257b4ef307f74', 'admin', '2017-07-31 21:49:38', '新增菜单销量管理');
INSERT INTO `sys_fhlog` VALUES ('46f5e35bd0a343ce9eccb8179b778516', 'admin', '2018-08-16 18:02:17', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('47204c81233c43ffbb161ecd767aa300', 'admin', '2018-08-15 10:26:34', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('473ded63b3c4477ebf9314ece6570c7b', 'admin', '2017-08-31 11:48:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('473f2c08601743fab04de6ca7c7215c7', 'admin', '2018-08-16 18:05:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('474f9e048e64437da9c95f3c30effbd3', 'admin', '2018-08-14 14:18:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('475ed68dd36e4084bc5e836933814bb4', 'admin', '2018-08-21 14:16:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('476816eca73c418db6c44d0ffb425f72', 'qq728971035fhadmin', '2017-08-04 09:22:07', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('476d2c64cda64f1a97244c58bf8967d4', 'admin', '2018-08-15 10:21:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('477864efb20f468794b481ac2f8ab5b4', 'admin', '2018-01-30 15:19:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('47793c339082424bb7a7a1627b73410d', 'admin', '2018-08-17 10:38:47', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('4780ccce3796448cbfd4de199ff2e20c', 'admin', '2018-08-17 10:06:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4794099887cb4d1490a8ed97f55c095b', 'admin', '2018-08-23 17:29:54', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('479b0cdc9ba341399dd387db4127ca6f', 'admin', '2018-08-15 10:22:45', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('479c1dcd29324227917376fdf64d1ffc', 'admin', '2018-08-07 18:15:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('47aad2123a254193ac59a7e7dd07c5f3', 'admin', '2018-08-16 18:02:37', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('47aec9d72a384ec59c2cab8ef615c5ba', 'admin', '2018-08-22 14:02:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('47c0bf15d72a4b9da1b5e6420593468f', 'admin', '2017-12-18 14:31:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('47cbffcf0e7342a4968c6c9fad92cf51', 'admin', '2018-08-17 09:43:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('47de3a2628f8472281cb9faba60e8912', 'admin', '2017-08-28 12:28:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('47ef2e5909764b669d51e15378918ad3', 'admin', '2017-11-01 16:40:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('47f500eaf58e42e5bc9152be3e6efa3e', 'admin', '2018-08-17 09:40:56', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('47f509dc5ba043519130774cc251f366', 'admin', '2018-08-16 17:57:02', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4800d420f88c477093d6ce3e91154c92', 'admin', '2017-07-29 21:48:10', '新增按钮权限pd{guid=1501336090682, BUTTON_ID=4efa162fce8340f0bd2dcd3b11d327ec, RB_ID=6263576767a9454ea21a75d18bb57b7e, ROLE_ID=115b386ff04f4352b060dffcd2b5d1da}');
INSERT INTO `sys_fhlog` VALUES ('4801818fc06949c09642a14ebe3942cd', 'admin', '2018-08-17 10:06:50', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4852ac6111a1455385ebbe2c60d94507', 'admin', '2017-10-26 09:54:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('48735902d5814d67bda90bfef03573ef', 'admin', '2017-08-30 16:42:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('48c4e1ab8d7e471ba4199d5060d12528', '18990673099', '2018-03-11 09:08:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('48e216363da34132bddd9b1189351399', 'admin', '2017-11-04 17:22:04', '修改积分提成:5');
INSERT INTO `sys_fhlog` VALUES ('48e42e7dbb144e5caf77911c0b0b0e8e', 'admin', '2017-08-29 11:13:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('48e47719c27a4b0b8a7a349e9cc6f2b9', 'admin', '2018-07-13 16:44:10', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('48eebf6b417346f2a9e1d609f47cc459', 'admin', '2017-12-04 17:47:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('48f2a029a8fb4eeeb7bd64ce35c3376f', 'admin', '2017-12-16 13:24:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('492431f4bfb44e318a8f431b4baf5af3', 'admin', '2018-08-17 09:40:42', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('49248d2fa61a4d7591afd265da86821d', 'admin', '2018-07-13 16:44:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('492881e980fc4a83a85d212a6ce94f28', 'admin', '2018-08-02 12:09:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('492bdac18c91426ebecf645ed3ee2412', 'admin', '2017-09-02 21:58:48', '新增菜单添加洗护');
INSERT INTO `sys_fhlog` VALUES ('4933e02a44b8498587dfe11bdc037c50', 'admin', '2018-07-30 09:15:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('493455fb530249d9a2eca9a55ca486da', 'admin', '2017-11-18 13:51:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('494245a9d5954721b5956d3a9fb75eea', 'admin', '2018-03-03 09:53:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4949c35f451c4233b43eeb317d6cdb07', 'admin', '2017-11-27 15:47:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('49609ae29c714510b0866afd98c73c3c', 'admin', '2017-12-08 09:34:57', '删除按钮权限PageData [map={BUTTON_ID=fc5e8767b4564f34a0d2ce2375fcc92e, ROLE_ID=3, guid=1512696897843}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@1bce91e]');
INSERT INTO `sys_fhlog` VALUES ('49702d9453d94e18913d05e96684cc2d', 'admin', '2018-01-05 10:45:08', '退出');
INSERT INTO `sys_fhlog` VALUES ('49740cb9e04f482884759f360cc24324', 'admin', '2018-03-09 22:40:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4978117b358a40a5b32b12007af1d7ae', 'admin', '2018-08-09 15:39:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('49a87b1b4fa44fff9a309913097f8e12', 'admin', '2018-08-10 17:13:38', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('49b2fd6f10364963a79c50ef86f5c309', 'admin', '2018-08-15 10:22:43', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('49b3278456e343ac83709b294a22258b', 'admin', '2018-03-19 17:52:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('49b372f7f0e04bd49b9744630911183f', 'admin', '2018-08-17 09:48:23', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('49b4d29161a745d9b7ed83cd62951228', 'admin', '2018-08-16 18:18:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('49c9c30e39454661879cf0f7644f1409', 'admin', '2018-01-29 16:38:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('49d02e259f4144ffbabbaedf50206827', 'admin', '2018-08-23 17:31:00', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('49ed6c2855184e3e80cd4d33044ae179', 'admin', '2018-08-16 18:05:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('49f1e580a32d49d1a9f5e2edcdf76cbd', 'admin', '2018-08-11 15:42:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('49f47aef387748f4be881c484c24f80b', 'admin', '2018-08-23 17:30:59', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('4a023ebc45e9413ca70f5d2cdaee169a', 'admin', '2018-07-13 16:44:00', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4a791a92bb8d4c75b0cc71c3da26bf57', 'admin', '2018-08-04 16:30:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4a7b466d1b0a4f8ba066784288246e45', 'admin', '2018-08-16 18:05:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4a8474fdc29048b5992f46cd284716e7', 'admin', '2018-07-13 16:42:55', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4a91bcc3e7a046e6b21c84aec5b92293', 'admin', '2017-11-09 13:07:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4a9244754ee9407da2061cb9b7ca4d03', 'admin', '2017-12-08 09:34:48', '删除按钮权限PageData [map={BUTTON_ID=46992ea280ba4b72b29dedb0d4bc0106, ROLE_ID=3264c8e83d0248bb9e3ea6195b4c0216, guid=1512696888164}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@e05017]');
INSERT INTO `sys_fhlog` VALUES ('4a9edf5899f045c28ea0217d6445a53e', 'admin', '2017-12-09 13:11:55', '删除系统用户：PageData [map={USER_ID=291d21a154014b0a9ca57cb6c3f938b0, tm=1512796314892}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@1ea6ed2]');
INSERT INTO `sys_fhlog` VALUES ('4a9fc288c7104ce3a80f89498e79b173', 'admin', '2017-11-18 14:28:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4aada545b37e48379d0c49161736abc6', 'admin', '2017-03-31 22:12:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4ab0158de6e24f389eb5e3a1a4d436f1', 'admin', '2017-12-04 16:26:55', '修改角色:客服');
INSERT INTO `sys_fhlog` VALUES ('4ac05ae492aa4b6784d11939f8b7480b', 'admin', '2017-11-04 16:38:54', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('4ad3321649f24a9a87c32ad6aaa50977', 'admin', '2017-09-30 11:22:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4ad453cee9d04cccb36ce4cbbc8698a3', 'admin', '2018-07-13 16:43:37', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4ad497bddef4495093f06c9138a7c419', 'admin', '2018-08-10 10:01:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4ae2ac1f74c4405a8f0dd354a5fdb3f8', 'admin', '2018-03-07 14:35:31', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('4afb4e588bb646829176a6c22efd6c52', 'admin', '2017-08-05 21:17:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4b01532fd2fb4a5c9327c7e66126ae56', 'admin', '2017-11-08 14:06:55', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('4b0426358caa465cb8c57cc66222d5c0', 'admin', '2018-08-17 10:06:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4b1c4cdca138460d865d57967c860eaf', 'admin', '2017-12-11 11:17:25', '退出');
INSERT INTO `sys_fhlog` VALUES ('4b345de9ebbf4308b80ede2dd94bd84b', 'admin', '2018-06-01 10:55:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4b41dd73b21a4a7c983d694e4555a19c', 'admin', '2018-08-15 18:36:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4b625593b822466ebcb1a048656755c5', 'admin', '2018-08-22 14:10:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4b9e18a9073a4cd485d426bfda3abb4a', 'admin', '2017-12-09 17:08:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4baaaa68b3b447408584e887dbafdd7e', 'admin', '2017-08-21 09:22:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4bb6d7e23b92491cabe24103c23e189d', 'admin', '2018-08-10 17:47:09', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('4bc271106b734117b27cac985168aa3c', 'admin', '2018-07-13 16:44:25', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4bca2f9b18274542879de6c030806354', 'admin', '2018-07-13 16:42:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4bce986c64b340aab4a615315a4afa9c', 'admin', '2017-08-06 09:24:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4be3dc2abc394730910791df82fa8c32', 'admin', '2018-07-13 16:44:36', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4bed3307c1874a9bbf2eaceb596e9a41', 'admin', '2018-07-12 13:09:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4bf065157db0400a85e7888f34a6cb70', 'admin', '2017-09-02 21:58:58', '修改菜单添加洗护');
INSERT INTO `sys_fhlog` VALUES ('4bfb289536fa44379cf3ba3b3f444f08', 'admin', '2017-11-04 09:28:11', '删除角色ID为:7d75da49956f45cf9826bc23c5e96cde');
INSERT INTO `sys_fhlog` VALUES ('4c08a2010dd4490d8f981e473abdd053', 'admin', '2018-08-24 14:48:10', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('4c2442c02ebe4000acdff21299b72d2b', 'admin', '2017-07-31 20:20:14', '退出');
INSERT INTO `sys_fhlog` VALUES ('4c254210c185487db16d53049a1ad74f', 'admin', '2018-08-17 09:42:17', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4c3007cf0c3d43cd9244989d02895dac', 'admin', '2017-11-23 18:59:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4c4911f7cb1e4e36b7310399a9daca52', 'admin', '2017-11-04 15:45:50', '批量删除user');
INSERT INTO `sys_fhlog` VALUES ('4c608b8e4e5b4ee0ba912f8b66a1e3c1', 'admin', '2018-08-23 17:31:10', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('4c660019abb4424191753e80ee3c0f0a', 'admin', '2017-11-04 12:44:48', '修改角色:注册用户');
INSERT INTO `sys_fhlog` VALUES ('4c6e3a9176154033840ace11563763e1', 'admin', '2018-01-28 19:43:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4c8ace575d20474da33dd161b148f116', 'admin', '2017-11-21 20:05:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4c9c375f2f224b55811ee6fc30ea6f38', 'admin', '2018-08-17 10:40:38', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('4ca463dc1517414a94663e1ff6d69230', 'admin', '2018-07-13 16:44:29', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4cc4713428ec4724a4c8a3a7502266cc', 'admin', '2018-07-24 13:15:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4cd43fb62c7d4995b5f2a6a04a389940', 'admin', '2018-08-17 10:40:39', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('4cd687f767eb483eb07ae9941a71e147', 'admin', '2017-11-23 18:34:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4cf341af351e4a278a5e44352f3d226d', 'admin', '2018-08-16 18:02:17', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4cf504d0c89043bfa3e6d5b6c13c8aa7', 'admin', '2018-08-10 17:11:00', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('4d0349230148485c881cf07ea2561e7a', 'admin', '2018-08-16 18:19:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4d0bb10ded6a4b06887ba75dc81e522e', 'admin', '2018-08-10 17:47:07', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('4d1053d6e3674150902ee07a77628bba', 'admin', '2018-07-13 16:44:16', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4d1c982981654fa6ae7b6ded5bc22066', 'admin', '2018-07-13 15:45:27', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4d2759bcae2e49269d39e0a26ca12316', 'admin', '2017-11-09 14:59:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4d2f61402ea34529bdecf510d79aa61e', 'admin', '2018-08-01 09:57:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4d3ab6158e4d48bdadab933020f647ef', 'admin', '2018-03-15 17:39:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4d4d2f46c05d4fa4a8981954e552007b', 'admin', '2018-08-02 16:15:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4d5b608387664665b1ddd70f01aa1c59', 'admin', '2018-08-10 17:13:37', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('4d5d8e1c5875498e974b29d9bdd477ce', 'admin', '2017-09-30 12:14:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4d6cddf3c6e34813ba6df9bb60d0cf82', 'admin', '2018-03-16 11:39:41', '退出');
INSERT INTO `sys_fhlog` VALUES ('4d8477f8420c4eea8001572e24a18bb2', 'admin', '2018-08-07 17:02:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4d85c3f0ed1d421a8b24cecced72935d', 'admin', '2018-07-13 16:43:12', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4d8e8ca255464decb5e03b40c624581d', 'admin', '2018-08-17 10:38:44', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('4dad7217690746d2901caaa278267166', 'admin', '2017-11-08 09:19:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4db217a2ce79409ca388af23468cd4c2', 'admin', '2017-11-15 22:14:28', '新增菜单服务管理');
INSERT INTO `sys_fhlog` VALUES ('4dcd78d73eb9415e81ceb69a3bc00ac6', 'admin', '2018-03-15 16:09:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4e00a467e9144773ae0aa9afb328b24e', 'admin', '2017-09-20 13:10:14', '修改角色:四星级店长');
INSERT INTO `sys_fhlog` VALUES ('4e02d18de3344171b29c5e99234bbe1d', 'admin', '2018-08-17 10:03:18', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('4e0dd71e4db7465b9bdeb31b13f6f4a2', 'admin', '2018-08-02 10:05:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4e0dfcd2f0dc4dc38926eec766f3d496', 'admin', '2018-08-17 09:42:17', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4e1fa73f5f4645fcb039266a86d5037b', 'admin', '2018-02-05 13:24:40', '新增菜单查看记录');
INSERT INTO `sys_fhlog` VALUES ('4e230c9c58fc4d6f83858cde8afab67d', 'admin', '2017-11-17 19:32:29', '修改系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('4e34a52544d44f6ca421cfc55fad2d35', 'admin', '2018-08-13 18:25:23', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4e797ee325fc470e8a57d599d26f26b9', 'admin', '2018-08-10 17:10:59', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('4e7bfba1b83c47b6b9bdb6eed97d9f14', 'admin', '2017-08-08 10:58:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4ea80564901e4be2bcd75914f47de546', 'admin', '2018-08-24 14:48:10', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('4eae6304327149f3864f37307812757c', 'admin', '2018-07-13 16:44:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4eb4433bd9774d76a49dd42bb5718b0c', 'admin', '2018-07-13 16:44:20', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4ebf0834f5d44fa98abaf011b9fc39ad', 'admin', '2017-07-29 21:48:05', '新增按钮权限pd{guid=1501336085446, BUTTON_ID=3542adfbda73410c976e185ffe50ad06, RB_ID=ccf26c60c91d490ba7d337b9a416d2fa, ROLE_ID=3264c8e83d0248bb9e3ea6195b4c0216}');
INSERT INTO `sys_fhlog` VALUES ('4ec580731fc84b3d8f9546a27a240d63', 'admin', '2018-08-16 18:05:13', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4ec9dfdd2dff4ebc983dd63ec10f1ad5', 'admin', '2017-09-11 09:23:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4eddd92e87b24a148a02b2a9107816b3', 'admin', '2018-08-10 17:13:35', '新增菜单订单列表');
INSERT INTO `sys_fhlog` VALUES ('4ee04419ce8d4ebfaab3ea991639dd72', 'admin', '2017-10-31 10:42:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4ee5f03a7b464ce4be82c9c049c67621', 'admin', '2017-12-08 09:34:55', '删除按钮权限PageData [map={BUTTON_ID=da7fd386de0b49ce809984f5919022b8, ROLE_ID=3264c8e83d0248bb9e3ea6195b4c0216, guid=1512696895349}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@132029c]');
INSERT INTO `sys_fhlog` VALUES ('4eeee83e9cda4a70830db8fb59d24fd4', 'admin', '2018-07-26 11:51:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4ef77c23bc03461c94c2767a201441b3', 'admin', '2018-08-08 16:50:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4f110efd14214708a6257d8267d54c1b', 'admin', '2017-12-29 13:13:54', '修改代理条件:null');
INSERT INTO `sys_fhlog` VALUES ('4f1d4831cb34473c9701a91aabb65226', 'admin', '2018-08-17 10:40:39', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('4f239fbce605410ba2c9037580f1c640', 'admin', '2018-08-10 17:10:58', '新增菜单订单管理');
INSERT INTO `sys_fhlog` VALUES ('4f2da6f49d9849689ffc6d0fc66257ac', 'admin', '2017-12-06 11:20:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4f2f82d6a1e44f9d89e326433513cade', 'admin', '2018-01-22 10:26:26', '修改菜单红包管理');
INSERT INTO `sys_fhlog` VALUES ('4f2fbf08ac4b4e88ad0b89fc5e2a5ec1', 'ADMIN', '2017-07-31 18:52:33', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('4f3601caeaae4588bf81079a0329a3b9', 'admin', '2017-11-18 14:05:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4f654e3ee4d0482da60781bad40cc2c6', 'admin', '2018-07-13 16:42:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4f7fb22f5c9a4a1db4868c8d15b6507b', 'admin', '2017-11-04 14:06:58', '修改菜单合作伙伴');
INSERT INTO `sys_fhlog` VALUES ('4f8fe6cced204e00a0b4bb7757070656', 'admin', '2018-08-02 17:02:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4f95531e602a4331a177224b4c4d7492', 'admin', '2018-07-13 16:43:37', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4f9f2220d856462d9163633270f476c0', 'admin', '2018-07-13 15:45:27', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4fb7b40ad7024b748eecd69bc74e0b45', 'admin', '2018-08-17 09:48:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4fe56ccb1c714358be010e5ef6445628', 'admin', '2017-11-23 14:15:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4fe5a34d4484452fa3c5454cf88016c9', 'admin', '2018-08-18 19:07:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4febe9816be84813b701e36ea4c042a2', 'admin', '2018-07-13 16:43:44', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4ffbd001575947e786f5a3e8173cedba', 'admin', '2017-11-07 18:17:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('501e08f142684038ad2a3f2eaa01ebd1', 'admin', '2018-08-17 10:33:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('504e325df790492881ad2aeb1d659af9', 'admin', '2017-08-30 13:49:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('50560db9815a49cc928f9c81815fa795', 'admin', '2017-09-04 14:45:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('50601df3f8494b0ba8e2def202f08bf0', 'admin', '2018-07-13 16:43:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('506b0278e7fe462aa225fe7cb269bfd5', 'admin', '2018-08-11 10:18:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('50765c34e0c9441092df79bc8ede4cc7', 'admin', '2018-07-13 16:43:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('507f607db1744fa4af58d981306b3d6b', 'admin', '2018-08-17 10:40:39', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('5082e856324a44e69abc182625727d15', 'admin', '2018-07-13 16:43:56', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('50928386a2b94e568dc0ed61e6b278c2', 'admin', '2018-07-13 16:44:18', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5095de9022464b15b592ce32d9281abb', 'admin', '2018-01-23 09:39:18', '退出');
INSERT INTO `sys_fhlog` VALUES ('509c0b0564e54713a155f6ecb0432f29', 'admin', '2017-11-27 17:11:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('509d6b14ffbc47e0b949ca88d6ee3cc3', 'admin', '2017-03-15 15:38:59', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('50a0df92f7244bc7a321facc72264500', 'admin', '2018-08-09 18:38:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('50a5bba580fc4c6bb6a5cc1a6ec5831d', 'admin', '2018-07-13 16:42:18', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('50a6d14df2ed43e28677a18c84a5fa4a', 'admin', '2017-12-28 11:12:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('50c7641f7d054401bfde8fc49876f931', 'admin', '2017-11-24 09:52:45', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('50d6dcdb2dcf47159aed2875b1581800', 'admin', '2017-12-14 19:12:29', '修改菜单商家管理');
INSERT INTO `sys_fhlog` VALUES ('50e186aad946486e89935e5f8d034f5c', 'admin', '2018-07-13 16:42:35', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('50e879f1ff5140c8b4c6c9a2172f1d89', 'admin', '2018-08-21 18:01:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('51029fa642fc4932840459c9056763ca', 'admin', '2018-08-24 14:48:10', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('5113925a0b054ac4b0e023f3e065e12c', 'admin', '2018-01-16 17:11:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5113efd6bbb54a3bac3fd842294fab71', '18990673099', '2018-04-15 07:25:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5114d0c00cf84f1fae74048886384e7c', 'admin', '2018-08-17 10:09:51', '退出');
INSERT INTO `sys_fhlog` VALUES ('511603e9d2a849b5a60a414ce8781ad8', 'admin', '2018-08-17 10:01:12', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('51186b0cbe824fa3a79239d272bccfbd', 'admin', '2017-11-30 09:42:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5127573cd306463e871b250410df2054', 'admin', '2018-08-24 14:48:08', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('513e914032514551b77599609fdba05b', 'admin', '2017-11-04 18:59:08', '删除系统用户：PageData [map={tm=1509793148742, USER_ID=c7999c569a03476ba07619caf0855666}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@77e72d84]');
INSERT INTO `sys_fhlog` VALUES ('5148ca85f00849d0af67372a497639a4', 'admin', '2017-11-04 09:30:20', '新增角色:营业员');
INSERT INTO `sys_fhlog` VALUES ('5165df3b80ab47b2befed3e869f7b558', 'admin', '2018-08-21 14:04:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('51745c6ac20f443a937902249e3d0771', 'admin', '2017-11-11 10:07:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5174704817754357b6c97429383ed55b', 'admin', '2017-11-24 09:23:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('517baa88181b4d478a8550f3444953bf', 'admin', '2018-08-15 17:21:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('51958ba9603a4b36b68418f47620381d', 'admin', '2018-08-13 18:25:24', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('51983ac50cfb40c18e01b4115a412a0e', 'admin', '2017-12-27 14:26:57', '新增系统用户：15184486180');
INSERT INTO `sys_fhlog` VALUES ('51a0fce581744bab96d2c35c1aece632', 'admin', '2018-07-13 16:42:43', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('51a3d0a38e1e40389e6762eedd500905', 'admin', '2017-10-09 17:20:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('51a40fcdd1374fa8abfe3db48b475f4e', 'admin', '2018-08-17 10:38:44', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('51a88d1bbe424a15a4ae64059307590b', 'admin', '2017-09-23 21:02:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('51ad5b0efb3d4c47810807455def6423', 'admin', '2018-08-01 15:43:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('51b6a9c796d744dfaf7cceb36317fe99', 'admin', '2017-09-24 21:42:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('51b964b89c164693bf46b93908f19e9b', 'admin', '2017-11-23 20:12:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('51c4781766424c2587be7ab92c0d0a0d', 'admin', '2018-08-13 17:00:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('51c9b4b3ddf9445ca4b699c508defeac', 'admin', '2017-12-16 11:31:47', '删除角色ID为:cad4a1f281de45d9894881f99618e30a');
INSERT INTO `sys_fhlog` VALUES ('51cf383270924c8081db23b5687bb141', 'admin', '2018-08-17 10:11:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('51daee8098b94f84a1a367eb7cd9a590', 'admin', '2018-08-17 10:34:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('51dd8886a6fd410ab049180d6158c80c', 'admin', '2017-08-02 19:47:02', '修改菜单商品管理');
INSERT INTO `sys_fhlog` VALUES ('51e532b73fca41d29d45eb0b86324163', 'admin', '2018-08-23 17:33:15', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('51f21b6b73f145d09d0e87af70de3650', 'admin', '2018-08-17 10:37:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('51fa9f7ac5e745c0beadb6a864e2ab13', 'admin', '2018-08-17 09:58:14', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('520c97cf3aca44419b3e65e3c37d2ec0', 'admin', '2018-08-23 17:33:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('521c11afdd9b497daf848b36ef195a22', 'admin', '2018-08-23 17:33:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('521d588b4d93482bad12285eca1ef33c', 'admin', '2018-08-16 18:18:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('524a90ce35f24a459fe46640fd1d65a6', 'admin', '2017-11-27 09:29:17', '删除系统用户：PageData [map={USER_ID=bac2d4122a644e7faed0297e0ce4ef47, tm=1511746157565}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@19e09f2]');
INSERT INTO `sys_fhlog` VALUES ('524de83e60914f1997f88a038f9e91ec', 'admin', '2018-07-13 16:41:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('52633c84151a497abb159ce5c9060a89', 'admin', '2018-08-17 09:58:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5266d194f1f04ffc9057f7929b6d6180', 'admin', '2017-09-20 12:24:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('52696c83e50a43a59463110dbf200f16', 'admin', '2017-11-17 18:31:47', '删除系统用户：PageData [map={USER_ID=ebe198efd7bd478294c31363d04af204, tm=1510914704687}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@989f45]');
INSERT INTO `sys_fhlog` VALUES ('52911ddc77f94030865c700170a58897', 'admin', '2018-08-22 10:35:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('52aad6f2b23f47ae960095713aaa215e', 'admin', '2018-08-17 09:42:02', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('52bb7eef91324750b309f620ca847fe8', 'admin', '2018-07-27 10:10:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('52beee0d9102422cbdea836963db0ccf', 'admin', '2018-08-16 15:25:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('52c88a4919d64a3fa4bebc738b411cb6', 'admin', '2017-11-03 17:03:14', '新增角色:张三');
INSERT INTO `sys_fhlog` VALUES ('52d5dbd426514f469186a49d0f0ec70f', 'admin', '2018-08-16 18:05:15', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('52f408d8760b4f2bba82bbe09a37760d', 'admin', '2018-08-17 10:41:15', '退出');
INSERT INTO `sys_fhlog` VALUES ('52fe6d77c0f2405b97a706a5bebabf0b', 'admin', '2018-08-08 16:42:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('530ce38b6f1c4f80a15c59439dc2a3aa', 'admin', '2018-07-13 16:42:04', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('531727bc619a40e1a1254b2d37ea5cdb', 'admin', '2017-11-07 14:36:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('53226be8ef9b474dbeea4d0bd6dcdaea', 'admin', '2018-07-13 16:44:30', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5326c226066148b3a8a713eb3669dfd9', 'admin', '2018-07-13 16:43:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('532ed4b5ed3d434fa812a96de557854d', 'admin', '2017-11-27 13:58:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5333d21fcd2644888b9ca96146b5d7cf', 'admin', '2017-10-31 10:40:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('535413e0e3934f28abf7814257cb62f9', 'admin', '2018-08-23 09:59:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('53552e49e549433694189afdc7ee59de', 'admin', '2018-07-28 10:43:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5369d6bad1444e6e910772efde33d3df', 'admin', '2018-08-17 10:38:46', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('536dc781fed64109a005d865dd5e6ff2', 'admin', '2017-10-30 10:19:39', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('537abf3a3af14181b9cda0760bab42f3', 'admin', '2018-07-13 16:44:18', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('538511b327db4ef9b18ecccaea64e4b2', 'admin', '2017-03-30 00:56:42', '退出');
INSERT INTO `sys_fhlog` VALUES ('53ad6cf05064464591b94502aad72b95', 'admin', '2017-12-11 11:17:21', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('53c2367496b3439587022e482c05de7c', 'admin', '2018-08-15 10:26:35', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('53c757930f8c4a8db5de12f454efb667', 'admin', '2018-08-10 17:48:44', '退出');
INSERT INTO `sys_fhlog` VALUES ('53c85cc1936b47cd8cfb5314eed2e627', 'admin', '2018-08-10 17:48:17', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('53c89108a8fd4639b5f182685661fe03', 'admin', '2018-08-16 18:05:28', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('53dadf665b5c474d8c4b15cb77fddda6', 'admin', '2018-08-13 18:24:06', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('53dcb2f78b5a49f3952f5ec2e67b64f4', 'admin', '2018-08-23 17:31:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('53e07c6f4e024b74b29c4faae0518649', 'admin', '2018-07-27 12:03:31', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('53e1bd7f7c844cfc8c2734fcdfc6c5ef', 'admin', '2018-08-17 09:40:56', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('540f08ea3c2348b0aa3674f406ee9bb7', 'admin', '2017-12-08 09:31:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('54185bc9ef51470da928b6ea5141cbb7', 'admin', '2017-12-08 09:35:05', '删除按钮权限PageData [map={BUTTON_ID=da7fd386de0b49ce809984f5919022b8, ROLE_ID=68f8e4a39efe47c7bb869e9d15ab925d, guid=1512696904978}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@832cf6]');
INSERT INTO `sys_fhlog` VALUES ('541c480ba8c241cd9c66ba706d1ae745', 'admin', '2018-08-17 10:32:34', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('5424abb5aba54e65a183c867d18319fa', 'admin', '2018-07-13 16:41:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('54316571b4a14a188e13beeddd99c202', 'admin', '2018-07-13 16:43:10', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('545bf1255fee4ec2abdb00101d7db5d8', 'admin', '2017-11-09 10:43:49', '修改菜单地址管理');
INSERT INTO `sys_fhlog` VALUES ('545f3be08a45424e8bc569b5a221e3ce', '15982183168', '2017-12-08 09:28:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5466f0454f0e436a96e24928539a0203', 'admin', '2018-08-16 18:05:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('548a2711a9354285b8a37be3af63c48d', 'admin', '2018-08-01 14:31:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('549251b001db436d8ef32d8d24700699', 'admin', '2018-08-15 19:22:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('54a8c1ee172d4470b806a90be80d6e8b', 'admin', '2018-08-17 09:45:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('54b968b0a155443b89ba887aa6e8663d', 'admin', '2017-12-15 14:18:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('54be390a1dff401197d05d01cf5cf39f', 'admin', '2018-08-17 09:47:36', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('54c23472cc14496d9722282a16fd5257', 'admin', '2018-08-22 11:18:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('54c804fbf23946989ddd4a2464226a37', 'admin', '2017-08-07 20:35:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('54c84c5e5f574a86a5a2f45d7da0ee37', 'admin', '2018-01-15 15:27:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('54cf709f222b41399b566911d37887f5', 'admin', '2018-08-17 09:39:58', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('54ff55a9ea3a42529c5f85dd972e4b24', 'admin', '2018-08-15 15:26:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('55143185e3a24132aeee518246dd136d', 'admin', '2018-08-09 14:27:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('551a000a55d34484bb99b2cc19515ab5', 'admin', '2018-07-13 16:44:12', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5545eab656544cfc9d7d122b40c7ff24', 'admin', '2017-12-15 15:53:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5559d3fa1c9847de8fbc05acc7479943', 'admin', '2018-07-13 16:42:11', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('555bb26143664a64be0142b69fb0019f', 'admin', '2018-01-26 09:07:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5563430ae8c64fa6b03c8dffd5824378', 'admin', '2018-08-17 09:42:02', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('5569cde0fca8401aa32150f0bf19041c', 'admin', '2018-08-17 10:06:50', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('556c6b1abdc646ac92830c9fd71900e0', 'admin', '2016-10-18 04:08:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('55962e022fc140f3990e1159d1f7b2bf', 'admin', '2018-08-17 10:04:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('559c385db281423c8baeae6e4fe2d93e', 'admin', '2018-08-17 09:40:00', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('55a49a0a50aa4e7eb51f7ce3dc8043ab', 'admin', '2018-08-16 18:00:46', '退出');
INSERT INTO `sys_fhlog` VALUES ('55a84fa79cd64911b0731a0d9a91d7be', 'admin', '2018-08-17 09:45:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('55af49ccb6a14aba8fbf113c432c0797', 'admin', '2017-11-24 11:02:53', '退出');
INSERT INTO `sys_fhlog` VALUES ('55bc8c8c3e6646a0b6b932e3000a5947', 'admin', '2017-11-08 11:17:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('55c4bb06803741a4891339ac4da37d61', 'admin', '2018-07-24 17:07:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('55c937aeed2a4253b9855124e825f9bd', 'admin', '2018-08-17 09:40:56', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('55d1496f166e4837bf7f81c5afddace6', 'admin', '2018-03-04 21:40:08', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('55d3db314bc345ce9a86fcfef0d3e51e', 'admin', '2018-08-13 18:24:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('55d7810b2a824f4d8a5dd361461b5238', 'admin', '2017-10-30 10:23:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('55e28baaf40342cbb14c12e0df0c7914', 'admin', '2018-08-02 12:54:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('55eca581f9854e8998b35cc5a58d6ed1', 'admin', '2018-08-22 18:34:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('55f31e90a3e44b9e81e2636029670b61', 'admin', '2017-03-16 01:01:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('55fcd2cf3ae44fbeb501cf3adce6449c', 'admin', '2017-11-08 11:29:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('560ee0497dee42c184cb4de2654d2b10', 'admin', '2018-08-23 10:10:25', '退出');
INSERT INTO `sys_fhlog` VALUES ('5618e67b31e74db2896da9cd69ee5b60', 'admin', '2018-07-13 16:42:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('563c9e97d8d44caca0e61d1b1083574b', 'admin', '2018-07-13 16:43:23', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('56634d4264ff4846a26a7ef8cdc961f8', 'admin', '2017-01-20 09:49:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('566aaf37e3f34cccb13882ddcb66b04f', 'admin', '2018-08-11 16:26:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5681a70a0d154c99b68111d772e917cd', 'admin', '2018-07-13 16:43:02', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('568f90c1a99d4a6aa708b8fd3318d0ca', 'admin', '2018-01-22 10:26:53', '新增菜单问题列表');
INSERT INTO `sys_fhlog` VALUES ('56ac5a9227df44fc90e86de8291bda2a', 'admin', '2018-07-13 16:43:15', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('56b499baa6cc4a0b95bd28fcacba920a', 'admin', '2017-12-05 09:41:04', '新增角色:木工');
INSERT INTO `sys_fhlog` VALUES ('56ba71bc447b4f579678bc69bca3d618', 'admin', '2018-08-16 18:05:29', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('56bd1dbd8a70461da58b748f0287dcf7', 'admin', '2018-08-17 10:38:46', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('56cf15e0a1334dffab2f6268eb48f5f1', 'admin', '2017-08-06 11:07:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('56ddba495df74a85adc1983e3a232a9b', 'admin', '2018-08-15 10:22:45', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('56eec6d942924ee5a36682b82a240695', '18990673099', '2018-03-09 08:51:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('57199f0b66c94c999025b0dc076cb311', 'admin', '2018-07-13 16:44:19', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('571f2f39c0284cfba8387579a9f8fd16', 'admin', '2017-11-04 13:08:48', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('574055596b714794aad2982dafedcb6b', 'admin', '2018-08-16 18:18:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('57484e178e8b47eea56631279db19b68', 'admin', '2018-08-17 09:48:23', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('5752dcf5b9bf4e28956b8e8dd8fb277b', 'admin', '2016-10-18 03:31:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('575eb1612c294972801be701b35d3326', 'admin', '2018-08-17 09:42:17', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5760bf27f4004ab9a8524d629efea870', 'admin', '2017-10-30 09:29:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5761a4c94e8448768f22645981cc51bc', 'admin', '2018-08-16 17:56:12', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('576ccfb01ac94866adbda80d6553fcba', 'admin', '2017-11-09 18:59:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('578de8a9b6e842cd91471e095aeb003c', 'admin', '2018-01-25 10:47:59', '修改菜单广告记录');
INSERT INTO `sys_fhlog` VALUES ('578df6b450704a6b9992297e5a8e1fe1', 'admin', '2018-08-18 18:10:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('57997505dd034f75a35ae95a24066c3b', 'admin', '2018-08-17 09:42:03', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('57aeccc279984248b2d0d154909b1ab2', 'admin', '2018-07-13 16:44:06', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('57b6433309f14e01a66f3fa1fce1a68a', 'admin', '2018-08-10 17:10:59', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('57b9a64da90f46a0a00935c39ab1fb3a', 'admin', '2017-09-05 22:01:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('57bfaccd00b341d683893717d49b6a0d', 'admin', '2018-08-17 10:37:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('57c9ac0d783546ccaa8ac1088290899d', 'admin', '2018-01-05 15:33:47', '修改菜单语言分类');
INSERT INTO `sys_fhlog` VALUES ('57cdf1457f064cb88b8df1cd4599593c', 'admin', '2018-07-13 16:42:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('580ef9372e074652a331a9d7849c2ef8', 'admin', '2017-11-08 16:49:32', '退出');
INSERT INTO `sys_fhlog` VALUES ('581f3c48cc24428dacb3b4b3eab9fa20', 'admin', '2018-01-18 11:22:21', '删除角色ID为:115b386ff04f4352b060dffcd2b5d1da');
INSERT INTO `sys_fhlog` VALUES ('5832f272c8a24e0abbb94c9ff1f6097b', 'qq728971035fhadmin', '2017-08-04 09:22:17', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('583a42ec760c4ebfb32f57877604c8b1', 'admin', '2018-08-17 09:42:17', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5840e2060796426f8feee5993bcf995c', 'admin', '2018-08-02 16:16:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('586059ed0fc34912b78615c5cdd995d9', 'admin', '2017-12-07 20:51:54', '新增合作商家：null');
INSERT INTO `sys_fhlog` VALUES ('5868ce92708b4693b7628f45a36c42f2', 'admin', '2018-08-13 17:30:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('586a72e705664cc0a9db431353f80abc', 'admin', '2018-07-13 16:44:26', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('588fdf36458048a28ef1375d361cb9a2', 'admin', '2017-12-07 20:39:21', '删除系统用户：PageData [map={USER_ID=cd41abcadb224a7c90b7befead961af4, tm=1512650318314}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@1a89174]');
INSERT INTO `sys_fhlog` VALUES ('589d0d9d5937419684f1af7a330cde97', 'admin', '2018-07-16 10:47:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('589dfd9090534ad4b964757ab5cffaae', 'admin', '2018-08-17 09:47:36', '修改菜单建议');
INSERT INTO `sys_fhlog` VALUES ('58a4958845a040c39f362c054e5e9486', 'admin', '2018-07-13 16:42:27', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('58b8c4342a17430d97f23581bcac75fb', 'admin', '2018-08-16 18:05:29', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('58d17982dc9d4038a5f9db6bcfd49769', 'admin', '2018-08-17 09:40:42', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('58e26cf250af4fbfa03cf58145d6bcf1', 'admin', '2018-08-10 17:13:36', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('59027eec3a6e47208e18350640f42f69', 'admin', '2017-09-25 14:45:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('590aa12364854d5ba8a1c9f40dc9cf8d', 'admin', '2018-08-16 17:59:22', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('59118f735ad8422ea8e2786a53c9f9e9', 'admin', '2018-08-17 09:58:12', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('591a7dc4f87e47e99be50b20a27eff2e', 'admin', '2018-01-08 09:15:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('591b8a3622ed4bdaa5972ea05f5db419', 'admin', '2018-08-16 18:19:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5923ec32ff074f41ba4bfc2753b49662', 'admin', '2017-08-24 15:36:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('59282b25f24a43ce83a728d2b148dada', 'admin', '2018-08-10 17:47:08', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('592b6590516a48cb82d09ade08867299', 'admin', '2018-07-13 16:44:26', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('59406b2d1beb480bb26fb3fa38eb2ec2', 'admin', '2018-08-24 14:48:09', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('594a98354b654c07b56714aab3849d5b', 'admin', '2018-07-13 16:42:46', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('595cedc677ad4f08bf02517f3db45aa0', 'admin', '2018-08-17 09:58:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('596a604b1dae414cb8dc064fc72174ae', 'admin', '2017-12-25 13:49:08', '退出');
INSERT INTO `sys_fhlog` VALUES ('5974cc3826bd453ca2bf63a35a5c4303', 'admin', '2016-12-05 15:59:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5981d41b2b2348798962fe3d32af802f', 'admin', '2017-08-06 10:11:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5982911493be47769a91de572fcd2f1e', 'admin', '2017-10-31 10:41:51', '新增菜单颜色管理');
INSERT INTO `sys_fhlog` VALUES ('5985e9d28fa64023a47d84689c803248', 'admin', '2017-08-29 17:15:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('598a28232e0d44fe897f4b7f2764d9c8', 'admin', '2018-08-13 18:24:44', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('598d0fe003dc401680758a0e0089abe0', 'admin', '2017-11-27 13:09:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5991c2e147eb48bfa2c03e32839263d6', 'admin', '2017-12-08 09:30:39', '退出');
INSERT INTO `sys_fhlog` VALUES ('59969cfe90d74ecd86756c921425d3a1', 'admin', '2018-07-13 16:42:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('59a195ca9f2d47e9b8ecdf4a8afded0e', 'admin', '2018-08-17 10:38:43', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('59af411b1a3e49cd9889ca562e5c39cc', '18990673099', '2018-02-10 12:52:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('59b0898b929543b4a10a453d68a644c7', 'admin', '2018-08-15 10:32:44', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('59c25c1064c54073af66ba9433721dfd', 'admin', '2018-08-10 17:23:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('59c52e64c0cb4df7b675d5910e5b9397', 'admin', '2018-01-27 17:39:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('59c7c396191041288babff9a28e11469', 'admin', '2017-09-10 20:50:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('59ddb0d13580462e850da4543e79fccf', 'admin', '2018-08-25 11:39:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('59e2c4d8b6a54d2183486665f46d3458', 'admin', '2017-02-13 01:21:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('59ecd8bc1a6546bdb2ee1a157c8dbc98', 'admin', '2018-07-28 09:51:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5a0684f157ff4220b63f764dfe8296d4', 'admin', '2017-09-02 21:59:53', '退出');
INSERT INTO `sys_fhlog` VALUES ('5a0a3c74b22845de90ec93983a143909', 'admin', '2018-07-10 14:23:48', '新增按钮权限pdPageData [map={BUTTON_ID=46992ea280ba4b72b29dedb0d4bc0106, RB_ID=7708a17ec18847a5979531a9d4e660c1, ROLE_ID=3, guid=1531203828014}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@51df150f]');
INSERT INTO `sys_fhlog` VALUES ('5a2df39edd974f53b599572a58e56308', 'admin', '2018-02-05 09:27:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5a49753ff0bf4358a57158a158c12b7a', 'admin', '2018-01-22 10:42:12', '修改菜单系统工具');
INSERT INTO `sys_fhlog` VALUES ('5a4ca93e1c5c406eab57117d44ccdf53', 'admin', '2018-07-13 16:42:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5a70589c154f4ecfa950ed30114236c8', 'admin', '2018-01-18 11:22:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5a735245ac4648b78261a6743601819f', 'admin', '2018-08-14 09:22:09', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('5a7728c55222446c936c2141e3cae01d', 'admin', '2017-09-02 16:29:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5a77adc3ec8e49d3a7fc32098be4eeef', 'admin', '2018-07-13 10:57:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5a7ff152d97e451fad907df84fc42075', 'admin', '2018-08-08 16:31:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5a8b98e050074f2c867a18f2272a1737', 'admin', '2018-08-09 18:40:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5a92f86842f7485a920600219c03eeeb', 'admin', '2017-11-07 12:28:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5aa84c6586324fbf968bdab8fd86d2cb', 'admin', '2017-10-30 15:01:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5ab7ee6c9f7d4d8e97e5799f1d6818c6', 'admin', '2017-11-27 17:34:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5ac5ece14a0540d7b286a21817cc5e09', 'admin', '2018-08-16 18:19:39', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5ad1ec752aaa4d0c81f2716f8502daa7', 'admin', '2017-07-31 21:50:45', '退出');
INSERT INTO `sys_fhlog` VALUES ('5ad4b76a21b6491c81384166e865d64f', 'admin', '2018-08-22 09:45:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5adfde27582642f589ad6975bdc8529e', 'admin', '2018-08-17 17:21:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5ae2334e9e6046008916ae0580dee876', 'admin', '2018-08-17 10:01:11', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5aeb93e064d14d159a018b92c6123689', 'admin', '2018-08-17 10:37:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5afd99a12abb4dab9c14cf412cb62f7c', 'admin', '2017-08-03 11:35:50', '修改菜单商品类别');
INSERT INTO `sys_fhlog` VALUES ('5b19cc1aa4a247ca88fdb7488c5635af', 'admin', '2018-08-02 13:17:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5b3eb3f4a5314fcda99990e768861c9f', 'admin', '2018-07-13 16:42:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5b56a26c030442d99152348a5980cb0f', 'admin', '2017-08-10 11:37:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5b618e4ae6b8443bbf7f48e8c540640c', 'admin', '2018-08-17 10:09:46', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('5b8405a37662460baf973dc4232994cb', 'admin', '2018-07-13 16:43:53', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5b905902f6f5489894827cdfe04b24cb', 'admin', '2018-07-28 15:49:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5b933fd778624d9eb743a021edbb2b7f', '123', '2017-11-02 15:00:18', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('5b94a802acea4a7a9bc20fb6a8d7bca9', 'admin', '2018-03-05 19:31:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5bbcc7cba3ec45a3a890095e316058b2', 'admin', '2018-01-18 11:13:59', '删除角色ID为:2c40e3c532fc4e6299762a8010474814');
INSERT INTO `sys_fhlog` VALUES ('5bd1d212a11147d6afc36b040465fe61', 'admin', '2018-03-15 09:35:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5bd271155acc47b0ba972f3374972ef1', 'admin', '2018-08-26 10:54:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5bde8391bee749469c4f6ec9f6ede1fb', 'admin', '2018-08-23 17:31:00', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('5bf8355938df491a9ba698ea347c55a8', 'admin', '2018-08-23 13:55:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5bfa7d916f7a4dcdb0529ff6115e9969', 'admin', '2018-08-13 18:01:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5c0b83a3e8a44e6291dd62cc744fd41a', 'admin', '2018-08-23 17:33:15', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5c1a603047f54e08b56023f83595072c', 'admin', '2017-08-03 20:39:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5c33d734c6e04fda8f7b3f7cd86d7a95', 'admin', '2018-07-13 16:43:26', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5c3cdfcaae004050836caeb911b21557', 'admin', '2018-07-13 16:42:30', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5c3f3993820c4a3d969e89f8bdb34523', 'admin', '2017-12-08 09:34:59', '删除按钮权限PageData [map={BUTTON_ID=4efa162fce8340f0bd2dcd3b11d327ec, ROLE_ID=3, guid=1512696899554}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@45efa9]');
INSERT INTO `sys_fhlog` VALUES ('5c4212ee2e364271a5d262b02ee62841', 'admin', '2018-08-16 18:02:37', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5c4c9406fbd7413c8e6a70efd05dd4fe', 'admin', '2018-08-17 09:48:23', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('5c4ceb0a357d4c9ca42ec5441bfb4cf3', 'admin', '2018-07-13 16:41:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5c60051197b243deb900cbf7d02ff450', 'admin', '2017-08-09 10:13:33', '删除菜单ID79');
INSERT INTO `sys_fhlog` VALUES ('5c613f10029346c9a12ea7ed50d83547', '18990673099', '2018-03-24 15:26:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5c9c24636149412cb695c63b4d923d14', 'admin', '2017-11-04 14:00:28', '修改菜单合作伙伴');
INSERT INTO `sys_fhlog` VALUES ('5ca2eabde2eb4960a96a82500edd9739', 'admin', '2018-08-08 14:57:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5cbe1df63b544e44b98e5a112eb79003', 'admin', '2017-10-15 09:55:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5cc0057fa8084efe9a91a829bab7722e', 'admin', '2017-10-31 10:08:49', '新增菜单尺码管理');
INSERT INTO `sys_fhlog` VALUES ('5cd21c96f19547548d3e1d026b435563', 'admin', '2017-12-14 17:43:58', '删除菜单ID110');
INSERT INTO `sys_fhlog` VALUES ('5cde038c583e4adbaf20d411ee8adea2', 'admin', '2018-08-10 10:33:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5cdfad6b02e74747afddb10e6392fcdf', 'admin', '2017-12-08 09:29:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5ce93b34bd0348e297668dcf99e2e8a7', 'admin', '2018-07-10 11:40:16', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('5ceb1500db3f4cb7864798eb103c62f6', 'admin', '2017-11-23 10:03:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5ceb3d4136014136b26e7f638f43c27b', 'admin', '2018-08-17 10:09:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5cf2f8b586404cf18ec64152858c03d0', 'admin', '2017-11-08 18:49:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5cfa7853ece3433d8756a1800a7a8ec7', 'admin', '2018-08-13 18:25:24', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5d046392f14541b4b6a2aa3ff85f2e2e', 'admin', '2018-08-17 09:47:36', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5d1215e243be463883c661928318ce35', '18990673099', '2018-03-31 12:25:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5d252e0799b444088e725c7add1b31de', 'admin', '2017-11-27 15:44:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5d29da2316e5430d89c82d4c127ead51', 'admin', '2017-11-04 15:46:01', '批量删除user');
INSERT INTO `sys_fhlog` VALUES ('5d29fcbdf99947a8b160098f6fae4d9a', 'admin', '2017-03-16 01:00:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5d2b30d104af435183a6da494e57cd73', 'admin', '2018-08-15 10:32:43', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('5d4b2f35bc8e45d09058e7914d0414ca', 'admin', '2018-08-02 17:06:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5d5ad25fdbdc4dd1a6e4f0c51e8cb6cc', 'admin', '2017-12-11 16:25:02', '修改系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('5d7c9822027249c08a15501f37bb3c5a', 'admin', '2018-07-13 16:42:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5d849f58d274466ea56e2fd358e92ce9', 'admin', '2017-11-23 15:55:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5d872617d312464aafa3f9b2f14812b9', 'admin', '2018-08-18 17:14:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5d90f552f3114bae98155181cfedfd0a', 'admin', '2018-08-13 18:29:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5db0e35e64654c2891ec86514e2fbe7f', 'san', '2016-06-06 02:28:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5dc9328e661245bca3da8b74f3c9ae06', 'admin', '2018-08-16 18:02:37', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5dd415c2159f45619d281e1dbd64a0bd', 'admin', '2018-08-11 10:10:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5de3e2df14844863815f191b5e0a90c2', 'admin', '2017-11-15 21:48:57', '修改菜单产品管理');
INSERT INTO `sys_fhlog` VALUES ('5e1de6ea29da4a8a970f7dfa052fd979', 'admin', '2017-11-27 17:25:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5e2df18715a5466fb69774896af049b9', 'admin', '2018-07-26 09:38:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5e30573a955f4544a3a4ad403a1ebb8c', 'admin', '2018-08-16 11:02:44', '删除菜单ID129');
INSERT INTO `sys_fhlog` VALUES ('5e5ddf3ed5d94eaa8fc125c4a6bceabe', 'admin', '2017-12-04 10:45:47', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('5e611f37db3e485d839837998938b221', 'admin', '2018-08-23 10:09:50', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5e6e3e6fab184cababb259f4daf3f76b', '18990673099', '2018-03-06 18:40:49', '修改系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('5e761a77cbdd4e2ca166df0778650ae7', 'admin', '2018-07-13 15:38:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5e78268e01214697b53098f5e5d70794', 'admin', '2018-08-10 17:48:18', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('5e790e00797b497c8b51250196bc8a33', 'admin', '2017-12-08 09:35:14', '删除按钮权限PageData [map={BUTTON_ID=fc5e8767b4564f34a0d2ce2375fcc92e, ROLE_ID=de9de2f006e145a29d52dfadda295353, guid=1512696914930}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@1fc04e7]');
INSERT INTO `sys_fhlog` VALUES ('5e7d42ba68104b7099f16a31cb4ea171', 'admin', '2018-07-13 16:44:30', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5e82c8b6c8ce4340acd7911653530d5b', 'admin', '2017-11-04 15:46:56', '批量删除user');
INSERT INTO `sys_fhlog` VALUES ('5e849f9f5caa46e8b6e7a0a89f30808b', 'admin', '2018-08-01 15:57:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5e8f90bcbc924aedb9c8601617fef26d', 'admin', '2017-08-10 10:36:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5ea353062f6449eda2ea7f6356a7cbc5', 'admin', '2018-04-11 18:51:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5eaf7617488f48a2a41fb79484ead4c5', 'admin', '2018-01-02 09:27:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5ebe3e3f6d87421a94d7ed33fca85177', 'admin', '2018-07-13 16:42:01', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5ec091356a354234a236f6895dfcbd54', 'admin', '2017-11-17 19:18:41', '删除系统用户：PageData [map={USER_ID=69177258a06e4927b4639ab1684c3320, tm=1510917521266}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@a0a0d4]');
INSERT INTO `sys_fhlog` VALUES ('5ec6b35a3f2b45f5b2eafe6d65d645a9', 'admin', '2018-08-16 18:05:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5edca65d174a45fc8092f2b9b87c159c', 'admin', '2018-08-10 17:48:17', '新增菜单订单列表');
INSERT INTO `sys_fhlog` VALUES ('5f28a762229441e6b78a9c45b0dff23f', 'admin', '2018-08-17 10:39:42', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5f2ae4ee340447a0b81b47221ff97ac3', 'admin', '2017-12-07 20:36:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5f2b70596c344aa9bd7d6556e8e1d80f', 'admin', '2018-08-02 10:48:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5f30f217501b4e79a00a945e789c46e7', 'admin', '2018-08-10 16:42:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5f57ea37c9264660b3f74692eece8bc8', 'admin', '2018-08-23 17:31:00', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('5f5f03c979c046749bbdc081f851a21d', 'admin', '2017-07-31 19:39:09', '修改菜单商品增加');
INSERT INTO `sys_fhlog` VALUES ('5f868c02777548b5b80db63a16680719', 'admin', '2017-12-06 17:46:40', '新增系统用户：13610101010');
INSERT INTO `sys_fhlog` VALUES ('5f8d56f462d64bcf8953ee65ea6a8524', 'admin', '2018-08-17 10:32:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5f9ac00f966d49bb955d811462f71ffe', 'admin', '2017-08-29 09:55:33', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('5f9d9f9e77b04d83a3a11ae32a697da6', 'admin', '2018-08-15 10:32:44', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('5f9e772bcdb04eda8ba785b17f245a4c', 'admin', '2017-11-08 19:57:34', '删除菜单ID51');
INSERT INTO `sys_fhlog` VALUES ('5fa41d81ea66457c9253c0a7a16a760a', 'admin', '2017-12-09 18:41:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5faecaca953c4ee6b24fa2676d7e7593', 'admin', '2017-08-02 19:47:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5fb7b5b6c8904d12a8d9aaf21525cd51', 'admin', '2017-12-06 15:34:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5fbdec13b8534fafa01f5fe1c758f1b5', 'admin', '2018-08-15 10:26:34', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5fe28793e14e41bb93177837bafe6072', 'admin', '2017-10-08 15:07:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5fe7a482df774997a446bba8d0e64dee', 'admin', '2017-11-07 20:37:30', '删除角色ID为:15c5ad2822964806b55f7012af8b7071');
INSERT INTO `sys_fhlog` VALUES ('5ffeeb469c934184aaebd16a58e9cac6', 'admin', '2017-11-07 19:35:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6005b3f928c5440e9f3ce5dc0d361d56', 'admin', '2018-08-07 17:41:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('60175072c4c447e2aa565caf8236bff1', 'admin', '2018-08-17 10:33:08', '退出');
INSERT INTO `sys_fhlog` VALUES ('602569d151a44aa4ad81d8f94f9e7eac', 'admin', '2018-08-16 11:33:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('602ca4bbeae543b4a8c31f3f25210692', 'admin', '2018-08-16 18:05:04', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6049e653688f49a68ad435ea685bef9b', 'admin', '2017-11-07 20:32:50', '修改系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('605b02c5398b4ce8b1746860a4601237', 'admin', '2017-12-16 11:08:58', '删除菜单ID93');
INSERT INTO `sys_fhlog` VALUES ('6075b6a0e3c34da1997957dba40322fd', 'admin', '2018-08-17 10:33:05', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('6086c788e5dc47bb87a6af6f03976e08', 'admin', '2017-12-06 15:06:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('609b8c5d0a4b42d193f610387d5226a9', 'admin', '2018-06-18 11:03:57', '删除菜单ID128');
INSERT INTO `sys_fhlog` VALUES ('60b0d3fb3fc04cd8af1314ce2da160a9', 'admin', '2018-07-13 16:42:04', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('60b9c32767d8494f8484d3506f2f5c42', 'admin', '2018-08-17 10:09:45', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('60bd94e52e2d438392b28f52410e0402', 'admin', '2017-12-16 11:09:12', '退出');
INSERT INTO `sys_fhlog` VALUES ('60c019f6ebfd4482b2a3405a5aad22e5', 'admin', '2017-12-08 09:34:53', '新增按钮权限pdPageData [map={BUTTON_ID=da7fd386de0b49ce809984f5919022b8, RB_ID=cc9f822281c04f54a38d9edc2718929a, ROLE_ID=3264c8e83d0248bb9e3ea6195b4c0216, guid=1512696893421}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@cf172b]');
INSERT INTO `sys_fhlog` VALUES ('60ca48c8837544ba9ca343ad9083597a', 'admin', '2017-11-13 18:15:39', '修改菜单增加地址');
INSERT INTO `sys_fhlog` VALUES ('60d253fbdbc34dd5bec932b19ab65da5', 'admin', '2018-07-13 16:44:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('60dada94e3ae47508041a8c8d54be3f6', 'admin', '2018-08-17 09:47:37', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('60e6c0dcd525418ebc8e0697c2560fee', 'admin', '2017-12-04 16:18:57', '修改金额提成:1');
INSERT INTO `sys_fhlog` VALUES ('60f53dd85e9c4b78af1fee06e410ac3c', 'admin', '2017-08-29 16:49:06', '修改菜单平台管理');
INSERT INTO `sys_fhlog` VALUES ('60f964bcfe1b46e9b60845cd1da7f404', 'admin', '2017-11-29 14:36:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6107a4642d0d41db8009f3dd94cc5d40', 'admin', '2018-08-17 09:46:15', '退出');
INSERT INTO `sys_fhlog` VALUES ('610d023a2a2345649b54472abca2c574', 'admin', '2017-07-31 21:50:42', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('611745843bbf47768bd02302feb52e4f', 'admin', '2017-12-09 15:06:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('61282e93879542acaf8d1409c79e018c', 'admin', '2018-08-16 18:05:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('61364f7783054116b45fc50b177f971b', 'admin', '2017-11-16 19:03:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6157bea577e648c2adb81e78d8359ac4', 'admin', '2018-08-16 18:02:18', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('616a8179d8304f9e87b34055484cefaf', 'admin', '2018-02-05 21:55:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('616a8b8c5fab45718f7003b005880485', 'admin', '2017-11-08 14:25:42', '修改系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('617f15e52fff4f43946cf9d393f23c36', 'admin', '2018-08-21 09:35:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6183c640e8fe44069aa370712b9ed064', 'admin', '2017-11-09 10:40:53', '新增菜单地址管理');
INSERT INTO `sys_fhlog` VALUES ('618404dc23064417a7ed0122f731c883', 'admin', '2018-03-27 10:19:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('61911d3dfddc442695f893203e4d31b9', 'admin', '2018-01-22 10:25:28', '删除系统用户：PageData [map={USER_ID=151aeac5570e4059b06329b65095f6a6, tm=1516587928787}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@165893c]');
INSERT INTO `sys_fhlog` VALUES ('6195e0bee56442a0b36cf2b3a03c32cf', 'admin', '2017-11-15 21:51:26', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('61b4b40a245742c1a804554d0492e7dd', 'admin', '2018-08-10 15:13:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('61bcfe4b058a4593b4641d1548a932f0', 'admin', '2018-01-05 15:31:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('61c800bbb99f4432b71b1d267edc3d4c', 'admin', '2018-07-13 15:38:32', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('61d19d039b624492bdfcddd4407ad5f8', 'admin', '2018-07-13 16:43:25', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('61e4fc0306774d87978635e3d38eb5c4', 'admin', '2018-01-02 09:27:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('61f1e4d9ff334789bde7f580551db2f5', 'admin', '2017-11-07 16:23:38', '删除系统用户：PageData [map={USER_ID=e128d0b8807b4a128d6390c44a6accef, tm=1510043017947}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@1e991a5]');
INSERT INTO `sys_fhlog` VALUES ('62098acb864c48b1b440fbc045114b80', 'admin', '2017-08-09 16:34:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('620c05b472374409ba1ed1b8610173a1', 'admin', '2017-12-15 10:09:33', '修改菜单商家管理');
INSERT INTO `sys_fhlog` VALUES ('620dc8655c36483ebab0a687e924c3da', 'admin', '2018-08-23 14:28:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('620e3b66fbda4671ad1fc24f431cacb3', 'admin', '2018-07-13 16:43:45', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('620f2f8445024760a36657d6b2d4c078', 'admin', '2017-11-08 14:09:54', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('620f66755a2c4ff69040287611020ed2', 'admin', '2017-12-12 09:13:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('621426ee5d8442f2bae14bfb3401c41c', 'admin', '2018-08-15 16:43:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('621f0c72f75f4879951c2689c5eb4bc0', 'admin', '2018-01-28 19:43:41', '退出');
INSERT INTO `sys_fhlog` VALUES ('6223d5b0b25c404798b0d58b1da7fce9', 'admin', '2018-08-16 17:56:14', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('622db6e852ae4a778fbceab5be580e45', 'admin', '2018-08-13 18:24:44', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('62457fdc7c354b6e98accf2db33a4730', 'admin', '2018-08-16 10:03:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('624732b97b96440683cc9ab15d6fc837', 'admin', '2018-08-23 17:31:01', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('6261714724de4cc1a660e5ad26bcb91e', 'admin', '2017-12-14 09:30:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('62727597f5334a4db90a6a34f19e20cb', 'admin', '2018-08-10 17:14:24', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('62843fa7640a4543b4d5b2da182775de', 'admin', '2017-11-27 10:48:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('629840a384b0486cbd292dacfc3ceefc', 'admin', '2018-08-02 16:40:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('62ad153532ca4c6f9f96c7e7efab0870', 'admin', '2018-08-13 18:23:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('62c10cfa0dea406d9d122d3610cae5d5', 'admin', '2018-01-29 19:00:45', '退出');
INSERT INTO `sys_fhlog` VALUES ('62cd71e9f49945d090844099359922a2', 'admin', '2017-12-11 18:06:45', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('62e30b7fb5374e7e8ab5eb11afb3273c', 'admin', '2017-11-17 18:22:39', '删除系统用户：PageData [map={USER_ID=8671ca2ebeba46a18451590b1a8581ae, tm=1510914154996}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@3a206d]');
INSERT INTO `sys_fhlog` VALUES ('63032914d3a7424eb3534127f2a98345', 'admin', '2018-08-23 14:01:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('630716f4a17444999e56b72d3c9f6a20', 'admin', '2017-11-20 14:16:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('630c6d1f38ca4eeb97503d16f38b0eae', 'admin', '2018-08-17 10:39:41', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('631eb735630842f79944c6ef54f7d813', 'admin', '2017-12-04 16:18:57', '修改积分提成:1');
INSERT INTO `sys_fhlog` VALUES ('632a803c1dfa4134b99b801a4cd98a80', 'admin', '2017-11-04 18:59:02', '删除系统用户：PageData [map={tm=1509793142510, USER_ID=bc64c20d84d04939987ec30b221d0aef}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@648e1a4b]');
INSERT INTO `sys_fhlog` VALUES ('6354395900e8404aab9abf2675d2888e', 'admin', '2017-08-21 09:21:54', '新增菜单平台管理');
INSERT INTO `sys_fhlog` VALUES ('6365a5a08eaa481680d518ca26df235e', 'admin', '2017-09-07 17:01:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('636b7e1dc9cd4813908cfc44108d4339', 'admin', '2018-08-18 16:05:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('637c2bedd15c47c1803093bad4393498', 'admin', '2018-08-22 15:43:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('63832225d04a41c5a125a9b25fddfdbe', 'admin', '2018-08-02 13:55:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6388654b18a0404a8782a290b6cf5f65', 'admin', '2018-08-09 10:39:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('63887cd8a4c1467496231619444ac42d', 'admin', '2017-08-09 20:20:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('63995ba603074dcd8d22b4230f103694', 'admin', '2018-07-13 16:42:03', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('639a01a37b35421e806d427de6cfa7de', 'admin', '2018-07-13 16:43:16', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('63aa246716dc44c8a62b59cda67afe97', 'admin', '2018-08-23 10:09:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('63abf8ed48b54fa8994f2e17a9948c7c', 'admin', '2018-07-13 15:38:32', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('63b5428be9694a4b85b283246247112c', 'admin', '2018-08-16 17:57:02', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('63bdec1c800344f49f637aecd6a97dad', 'admin', '2018-07-13 16:41:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('63c670e4a323471a9795d938ed894a27', 'admin', '2017-10-31 14:45:54', '修改菜单尺码管理');
INSERT INTO `sys_fhlog` VALUES ('63d3cf4dbe8d4f469949765647a54b61', '18990673099', '2018-04-06 14:50:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('63e3e35c8cbf4c6d831954a39524b253', 'admin', '2018-02-06 10:40:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('64321bea03234cabae9526d5ed9312dc', 'admin', '2017-08-09 10:14:48', '新增菜单洗护管理');
INSERT INTO `sys_fhlog` VALUES ('6432e89b91a64b7eb39a1a42e1866463', 'admin', '2018-08-16 17:57:03', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('643c81190e614447966967e04c398471', 'admin', '2018-08-17 09:42:17', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6455a576817d4f8ebd96aa3ec13233c1', 'admin', '2017-11-08 13:23:04', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('64613181e6824c239232c3f8f2843486', 'admin', '2018-01-26 15:40:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('64618a93165d4af184e1f3facada2ad5', 'admin', '2018-07-13 16:43:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('646346cf682d4aecb1569059872b1d49', 'admin', '2018-08-17 10:38:46', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('6466209d30444624af98d72527c548d4', 'admin', '2017-11-03 16:22:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6491d16add8b41b8b8856c1e1248dca1', 'admin', '2017-08-09 10:14:22', '修改菜单评论管理');
INSERT INTO `sys_fhlog` VALUES ('649673980dab4db0b916d579b0439bff', 'admin', '2018-07-13 15:45:26', '修改菜单店铺管理');
INSERT INTO `sys_fhlog` VALUES ('64b10dce99ad4be09c23b50c4fdf27bb', 'admin', '2018-01-29 19:00:30', '新增菜单活动记录');
INSERT INTO `sys_fhlog` VALUES ('64b3e5ec44674b86a627d05afc94209b', 'admin', '2018-08-26 14:36:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('64b4bd724b76427dbbca0ab712dc0eba', 'admin', '2018-08-15 15:53:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('64ba33792ce8419bb725ac91502f9108', 'admin', '2018-08-17 09:48:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('64ddaf748058406193132803efd7c449', 'admin', '2018-06-18 11:03:24', '删除菜单ID132');
INSERT INTO `sys_fhlog` VALUES ('6510039f1bef40b6bdbfc6519e6c0be9', 'admin', '2018-01-25 13:00:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6511a9a0652a4074a4295a003ba04a19', 'admin', '2017-11-18 10:40:26', '删除菜单ID109');
INSERT INTO `sys_fhlog` VALUES ('6521d534bd95469dae9cfbe44a1921c1', 'admin', '2018-08-18 18:48:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6530e0b8266a4a79b93e69b501708ab5', 'admin', '2017-11-08 11:19:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6534cd4a8c5245e980b97321d5bf758f', 'admin', '2017-11-09 17:26:16', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('653a64ada40e41d69c47a3cf0b56df5f', 'admin', '2018-08-10 17:47:45', '退出');
INSERT INTO `sys_fhlog` VALUES ('65432d119cea40c384d70b2239ccfcb1', 'admin', '2018-07-13 16:44:27', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6559582baf8e44cab8ab6a1ce94e8b7c', 'admin', '2017-12-11 16:24:49', '修改系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('6565c4ceb70a44c0bd939b8f00e6336c', 'admin', '2017-11-20 15:34:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('658ca98b0b2d4895a592c12c3aa1c895', 'admin', '2018-08-17 10:40:38', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('658e9110a1824026ba9ca7c53a6a819f', 'admin', '2018-01-26 11:41:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('65b53bbd787f43e5866dd77410b65155', 'admin', '2017-08-09 10:22:31', '退出');
INSERT INTO `sys_fhlog` VALUES ('65b7a867d6d2497484651c8f1c7aab2a', 'admin', '2018-08-16 18:04:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('65bab76d0690472da7a6ef0cc4cbc59a', 'admin', '2017-11-17 19:00:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('65bdd069ea38430ba9c7aa98e3659e78', 'admin', '2017-11-07 16:41:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('65c1604582d24ee1a4c7fd5a0e39033b', 'admin', '2017-11-22 16:34:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('65e154f3b836444a866df40affd7ca2b', 'admin', '2018-07-25 16:10:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('65e4c649ac5442b28229d0f6fdf3a740', 'admin', '2018-08-23 17:33:08', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('65e947ce807a431f83927210d1c3c2b6', 'admin', '2018-07-13 16:42:17', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6630d76a30044dc894ad88c3ace871b4', 'admin', '2018-08-24 14:48:09', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('663f0d5ee9ae4a95886292671eb45b28', 'admin', '2018-08-16 10:22:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('666159aa34e041e9b26015c6a0bd02ae', 'admin', '2017-03-30 00:30:57', '删除系统用户：{tm=1490805057831, USER_ID=456a34455b1241ebb7c373e4a245694c}');
INSERT INTO `sys_fhlog` VALUES ('667b828e7b14490b8761277dc28ffa96', 'admin', '2018-08-17 10:01:11', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('668166033d0249a7bb095594c32f8d22', '18990673099', '2018-03-11 09:31:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6683f6faecd3461c880b12c8c3cf1231', 'admin', '2017-08-31 15:27:16', '新增菜单店铺列表');
INSERT INTO `sys_fhlog` VALUES ('669275de50684e9f8595e890e213a760', 'admin', '2017-11-18 10:41:42', '退出');
INSERT INTO `sys_fhlog` VALUES ('669f9f8386904301b7473e82ce34fd5f', 'admin', '2018-01-18 11:22:19', '删除角色ID为:1b67fc82ce89457a8347ae53e43a347e');
INSERT INTO `sys_fhlog` VALUES ('66a6afbca076453cb5fe52ae6be0503d', 'admin', '2018-08-21 16:15:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('66aba47ec3ee44619a2d4d00bd2fa717', 'admin', '2017-12-08 09:33:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('66c58e2bb5f747239df9f7a2e3381fb6', 'admin', '2017-12-04 09:16:24', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('66c6ba8b8afc4c70b7dcafd5a82ed521', 'admin', '2018-08-17 09:45:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('66ec0c656cc84297b7fa652030541287', 'admin', '2017-12-11 16:25:26', '修改系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('66f65feb35424a17aed77d1487b89eb3', 'admin', '2017-07-31 20:42:28', '修改角色菜单权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('66fc1f5690a443d08845159ce50b2973', 'admin', '2017-08-31 15:20:22', '删除菜单ID81');
INSERT INTO `sys_fhlog` VALUES ('670e532a2121408ba96f554f7bbc9a06', 'admin', '2018-07-13 16:44:04', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('671717c940e04b249abc5c33c4fc7be9', 'admin', '2018-08-17 10:37:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('673251aec86045e696ad59b7f49eb2eb', 'admin', '2017-11-04 16:47:25', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('6739780731164548baeb175439182600', 'admin', '2018-08-17 09:47:37', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('67474f150a5d44e590428c6c9d9302d8', '18990673099', '2018-03-07 14:35:04', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('674bd3734cea446c80629a1f30033bc7', 'admin', '2018-07-13 16:41:53', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('675001c62d5445b2a14b400e719b61f9', 'admin', '2017-08-01 14:53:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6759aa2172244bfabe6633e0f3f484de', 'admin', '2018-07-13 16:42:36', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('676b2b0fb1a34393a5966ca88af61f6f', 'admin', '2018-02-01 18:00:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('67719eaa7cbc47629fce73c7528d2a87', 'admin', '2017-11-04 16:58:06', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('6771bc449f9a433181b6bca4f9bcc727', 'admin', '2017-11-04 18:43:59', '删除系统用户：PageData [map={tm=1509792239783, USER_ID=bbf4b13d3ef849b1831e202bf2c6fb2f}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@50dde926]');
INSERT INTO `sys_fhlog` VALUES ('677795c47dba45b7b0d482d649fa1790', 'admin', '2018-08-13 18:24:13', '退出');
INSERT INTO `sys_fhlog` VALUES ('677a949fcd3249a59293d58e287bbdd7', 'admin', '2017-09-02 09:12:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('677dfce5675346928942f295804c778d', 'admin', '2017-09-08 12:34:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6780064c6cec4cf6988d99e0efaf5570', 'admin', '2018-07-13 16:42:24', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('67aa51c69ce74111ad455bec8bbd3f56', '18990673099', '2018-03-07 08:33:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('67b3bc2c45134d5094a8504a3684fa28', 'admin', '2018-08-17 09:58:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('67b40f932d90441aac82adf518657853', 'admin', '2018-08-18 15:39:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('67c21113d30f45f8821e68a9bd36c3f0', 'admin', '2018-08-10 10:47:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('67c53b8f37034e4e93b3d2e03107e5d4', 'admin', '2018-01-30 09:38:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('67d55fca811c4987b2be9de43efa2af0', 'admin', '2018-03-21 11:15:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('67fa37fda1dc40e7a5ddd9f569bc28f4', 'admin', '2018-01-18 11:12:28', '退出');
INSERT INTO `sys_fhlog` VALUES ('680d69587413494db28d9cad07375a71', 'admin', '2018-07-28 15:49:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('68105d49d1ea4e269698532863f93dc8', 'admin', '2017-09-08 11:43:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('68153db3007246758d60ff69c249cd53', 'admin', '2018-08-16 18:18:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6819dcc2dcd6447a96185a3097d82365', 'admin', '2017-11-08 15:48:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('68217118346c42c7961eeb8c651c9259', 'admin', '2017-09-25 10:57:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('682a2d06f4c6468fb6475fa6d8ec7cef', 'admin', '2018-08-17 10:07:32', '退出');
INSERT INTO `sys_fhlog` VALUES ('682c6748276943f283f31f3285d365fa', 'admin', '2018-06-18 11:03:14', '删除菜单ID127');
INSERT INTO `sys_fhlog` VALUES ('68386c72f9a34eeabaeffcc9267abfa0', 'admin', '2018-08-23 17:33:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('683e3d5e9fa94570a515d2f4f3fa87cc', 'admin', '2018-07-13 16:44:29', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6848146045994852a6a1c59e01d7866e', 'admin', '2018-08-21 16:59:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('68523ab2dbdc403384bf71d1bda49095', 'admin', '2017-08-29 13:26:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('68569aa99f47467591c1e0fc10b7eee3', 'admin', '2018-07-13 16:44:19', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6857434f13b04153bd530693257a1e7f', 'admin', '2017-07-29 21:48:09', '新增按钮权限pd{guid=1501336089063, BUTTON_ID=3542adfbda73410c976e185ffe50ad06, RB_ID=d896ab6350394c6b895a19cb0e4466e2, ROLE_ID=115b386ff04f4352b060dffcd2b5d1da}');
INSERT INTO `sys_fhlog` VALUES ('6859e91abe1e47b0b66cb8e6a0122024', 'admin', '2018-02-09 13:10:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('685e923d211644f7a6e9595402a108b1', 'admin', '2018-07-13 16:43:56', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('686473f63dc746828defbad52ddae13e', 'admin', '2018-08-16 18:05:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6879a6c6c9754420aa920ce1e21780c3', 'admin', '2017-11-09 10:37:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6882e53024524b359de97236a688ba82', 'admin', '2018-03-03 20:21:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('68a6d630bb944dd6a12c54c0b7713c5d', 'admin', '2018-06-18 11:03:51', '删除菜单ID98');
INSERT INTO `sys_fhlog` VALUES ('68c184bb3f264a5da5aa542553f8988b', 'admin', '2018-07-13 16:41:56', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('68c20e3e67824434b7c3668ad4ad6193', 'admin', '2017-11-04 09:29:07', '修改角色:客服人员');
INSERT INTO `sys_fhlog` VALUES ('68dc9f6aa9c846aaac74c77d6bf1f7ae', 'admin', '2016-12-05 14:48:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('68dd5747c2cb44c69249b3600ed2600f', 'admin', '2018-08-23 17:30:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('68fc0b6eeb424d7b960c5a1706dbc134', 'admin', '2017-11-10 10:19:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6901f0615b444887b6f2d3784e5cbdd6', 'admin', '2018-08-16 18:19:37', '修改菜单建议');
INSERT INTO `sys_fhlog` VALUES ('69056c9427f94a39a3f52b2c3f126df3', 'admin', '2018-08-16 18:19:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('690b43a179c843a5bd4a6db4d50e973d', 'admin', '2018-08-23 09:58:08', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('69132c94262e4460aa79d5c8339db26f', 'admin', '2018-06-23 06:53:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('691e6e7e97b643d3824363e0ba92d38e', 'admin', '2017-07-29 22:24:42', '新增菜单商城管理');
INSERT INTO `sys_fhlog` VALUES ('69269dc7d0f64a67b4ddb6735d592703', 'admin', '2018-08-15 10:32:44', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('692f2bfbfe0d4c43a61c8414fb7ea70f', 'admin', '2018-08-13 18:24:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('694781e166894ce6910000cd1dacc58a', 'admin', '2018-08-15 10:32:44', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('69487c8ad80146d6b612a3631db86834', 'admin', '2018-08-14 15:41:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('695bd410eb4745308ed55c68cedfc49a', 'admin', '2018-07-13 16:42:26', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('69781a55172f4cc291382cccd4a863a8', 'admin', '2018-08-07 17:29:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('697e07b2d53b4b0fa7396e935472fc42', 'admin', '2018-07-13 16:41:53', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('698155ec2a2e4f84ace29ea0edd2638c', 'admin', '2017-12-07 20:40:06', '新增合作商家：null');
INSERT INTO `sys_fhlog` VALUES ('69904c20411449109b4cc89b81bc2687', 'admin', '2018-01-16 18:41:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6999f446963c447e8152225dd4a0751f', 'admin', '2017-10-30 16:15:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('69a3df8e0edd4568aeaf0175404dae3d', 'admin', '2018-08-16 17:19:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('69a957f11afc410e8c8603e139f0f222', 'admin', '2017-09-23 21:22:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('69ab9fd480c5484a92e4afff4104769d', 'admin', '2017-11-08 11:56:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('69b27e78cc0a47a4bb8499f527f988df', 'admin', '2018-01-28 14:11:59', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('69b65e97fa5e4cc294497e8f94257c5f', 'admin', '2018-08-16 18:19:39', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('69c6fce5d89045a795d834c3198a38eb', 'admin', '2017-08-09 11:55:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('69c88ef69ba94f7aba5a59bd88e7fcc3', 'admin', '2018-03-05 18:41:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('69d909b43aa14cd1bbb50fe31db7d575', 'admin', '2018-03-09 22:14:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('69db14fd1d5e47238dc6217ac9fcb5b6', 'admin', '2017-11-10 10:49:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('69e0970167f546c59d4d806897514482', 'admin', '2018-08-01 10:53:02', '退出');
INSERT INTO `sys_fhlog` VALUES ('6a12602d8e424f6fa3075a20fa1e3b6c', 'admin', '2018-07-13 16:42:01', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6a2e47576bf2455f813d9fb0e326429b', 'admin', '2018-07-28 12:11:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6a5be7bac15c42f2bf90cf9df70705c3', 'admin', '2017-11-30 11:20:54', '修改金额提成:1');
INSERT INTO `sys_fhlog` VALUES ('6a88470a55604bdd84656c22220bf895', 'admin', '2017-10-30 15:43:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6a8a00db02384cff85f9957dc9268beb', 'admin', '2017-12-25 13:48:18', '删除菜单ID112');
INSERT INTO `sys_fhlog` VALUES ('6a96acc057a248d0bebee41c1d0f2680', 'admin', '2018-08-17 19:09:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6a9cd99c066445699f9ff5f4eeded077', 'admin', '2018-08-03 11:19:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6aaacaa1a525466487dccac57dcf0ed0', 'admin', '2018-07-13 16:44:15', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6aad6af4b7204026a96468dbe11b3f14', 'admin', '2018-08-15 10:26:34', '修改菜单新增店铺');
INSERT INTO `sys_fhlog` VALUES ('6aae46bc40084a8690fe9f7117a595df', 'admin', '2017-09-06 10:51:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6aba9c75c64c4e92b0d5c38ce50de008', 'admin', '2017-12-29 11:21:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6ae63ce735884608800eb9e3259d5547', 'admin', '2018-07-13 16:44:00', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6ae7061c52834cf28d9eb94293376845', 'admin', '2018-08-10 17:48:19', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('6aed9d42788540588b3d6e8f5202c49d', 'admin', '2018-07-13 16:44:25', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6af915bab0cf46e3bd28d35c7ca29341', 'admin', '2017-11-07 20:37:33', '删除角色ID为:46294b31a71c4600801724a6eb06bb26');
INSERT INTO `sys_fhlog` VALUES ('6af9de44683e4ab683e0448874729115', 'admin', '2018-07-13 16:43:21', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6b2ccef3d483421cac2094ee9a48ce04', 'admin', '2017-12-16 11:32:01', '删除角色ID为:68f8e4a39efe47c7bb869e9d15ab925d');
INSERT INTO `sys_fhlog` VALUES ('6b305a9d2c1d4518ac6d7c8bcb3388ba', 'admin', '2017-11-04 17:45:53', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('6b3513754c034c39be7b53f07be7f1dc', 'admin', '2018-01-25 11:48:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6b4a780d82f542fea460deb85148117f', 'admin', '2018-08-16 17:56:13', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('6b544a5605504ecebd94d4ff9e0d1e2e', 'admin', '2018-08-13 18:24:06', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6b738151d8674994a361e56bc4a8e204', 'admin', '2018-07-13 16:42:59', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6b76ca96d11342b2b36ed89c2976f531', 'admin', '2017-12-05 09:29:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6b7af46815e94336a3a8396fe5940683', 'admin', '2018-07-13 16:39:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6b8887471ca34b4a9a99a62f44d758c2', 'admin', '2017-11-23 15:29:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6baddcf4fb034a4fa982db9d3f0f6b7f', 'admin', '2017-08-01 11:21:55', '修改菜单富文本编辑');
INSERT INTO `sys_fhlog` VALUES ('6bb8c861c8a1421883246485d35cac9e', 'admin', '2017-08-29 16:42:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6bceda611f1345f7bd5cd53224185d21', 'admin', '2017-11-23 10:38:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6be18c3f571941ce8ada0e3ab5a5aede', 'admin', '2018-08-13 13:37:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6be4af0ef8264289be603ccdc1cb486d', 'admin', '2017-09-24 20:36:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6bfae34844c647f1b67ef82a52d0e363', 'admin', '2018-07-28 11:06:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6bfbf44fdd274806ab352495ab54c8df', 'admin', '2018-08-17 09:40:56', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6c2e5114f546427bb1106ff7b9cfc310', 'admin', '2018-07-13 16:43:13', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6c32655a22184dca9e178650a3246c14', 'admin', '2017-12-07 19:30:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6c3c0e7f048b46fdb58063dc7c230fae', 'admin', '2017-10-09 17:42:06', '新增角色:操作员');
INSERT INTO `sys_fhlog` VALUES ('6c3f9cc1f02d47399727121c09fc97c1', 'admin', '2018-08-17 10:39:42', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6c468c020dac40c89069edb5e427f406', 'admin', '2018-07-13 16:43:54', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6c4e2a18283e47cf998a423fb1ab84c8', 'admin', '2018-07-13 16:42:09', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6c513a9211834db29cbe275fb007a70f', 'admin', '2017-11-06 21:00:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6c59eada47914d88b05bb5623d579d83', 'admin', '2017-11-23 10:50:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6c627ef319fb488ab5b7a39e22c7526f', 'admin', '2018-07-13 16:43:55', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6c6578b91825483d8041a87b9644bfe9', 'admin', '2017-11-08 13:39:43', '删除系统用户：PageData [map={USER_ID=9a89f6cd9b654b71b39c6f8c6a54d6df, tm=1510119583035}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@f0b7a0]');
INSERT INTO `sys_fhlog` VALUES ('6c674ae1eabe49979daef821be150040', 'admin', '2017-11-07 21:40:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6c70a75c959f4a3d9f693341a573563c', 'admin', '2017-10-12 17:06:12', '新增角色:超级VIP');
INSERT INTO `sys_fhlog` VALUES ('6c83bc68e963479f994d7965e86ea27b', 'admin', '2018-07-13 16:44:02', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6c87cdb184cb435990dab208253e6ab8', 'admin', '2018-08-16 18:02:18', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6ca1ff137b7b4c0fb72ce636c7583989', 'admin', '2017-11-24 17:43:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6ca7a05106744baba01209dbb9d3e901', 'admin', '2018-08-10 17:11:00', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('6cbd08a78a72412db8be884cecf04e7b', 'admin', '2018-07-13 15:45:26', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6ccb4518b48a4f0b8caf2b006f88bbda', 'admin', '2018-07-13 16:43:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6cd7a7ef245649df8a14212a0ab1bdbb', 'admin', '2018-08-21 18:54:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6cdcda732224467bb89882724b207374', 'admin', '2017-11-04 13:07:51', '新增菜单合作伙伴（权限）');
INSERT INTO `sys_fhlog` VALUES ('6cddad4eee4e44cb9fe23029da664a17', 'admin', '2018-08-10 17:13:36', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('6cdfcbec6cf74011845ee87d51dc487f', 'admin', '2018-07-13 16:43:37', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6ce6f00090b54115a85a11ee70b42772', 'admin', '2018-08-21 16:57:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6cf96c3790c0466daef69f94c6b4e742', 'admin', '2018-07-13 16:44:31', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6d1a120c4dfa4c40abc331650f19ddb3', 'admin', '2017-08-29 16:49:15', '退出');
INSERT INTO `sys_fhlog` VALUES ('6d2f136c56314a8396bccc484037d995', 'admin', '2018-08-16 18:19:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6d4424d1f8684e2db44fdfdca7c334bf', 'admin', '2018-08-16 18:05:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6d45b9abd5de44179aa584c4233e6558', 'admin', '2018-08-23 17:33:15', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6d6c4d27cc384f7782c50c29a0a3d592', 'admin', '2018-08-16 11:24:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6d84132e2310498faa35a64ca707b81a', 'admin', '2018-08-13 18:24:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6d8c36eeb17e4d50b1ee7e44f283ef2e', 'admin', '2018-07-13 16:42:35', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6d8e5ee7345e4aa6929261d047542482', 'admin', '2018-07-28 10:31:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6d90554ae7a24f919be2f91750c551fd', 'admin', '2018-07-26 19:50:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6d92f19544ee43fd9c0bf6eb16d788dc', 'admin', '2017-09-24 20:41:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6d9cf3379f754635a31ef296083062e0', 'admin', '2018-08-17 10:02:55', '删除菜单ID153');
INSERT INTO `sys_fhlog` VALUES ('6db078983fe047a58de156705efdcdc3', 'admin', '2018-08-09 13:56:31', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6db0f186a14c4c50aa04c86206e352f7', 'admin', '2018-06-01 12:26:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6dccd1ae4fa4426b9a8879e9d00a72ff', 'admin', '2018-08-10 17:48:19', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('6dd73668fa9342be84ea3b546e6b714f', 'admin', '2017-11-04 12:01:14', '修改金额提成:3');
INSERT INTO `sys_fhlog` VALUES ('6df596c266744d55930dec4b82cf4771', 'admin', '2018-08-18 18:29:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6e008836cb554d839365f31064b03de5', 'admin', '2017-10-30 13:02:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6e03dbdc7db6491fa33096641cddbc4c', 'admin', '2018-07-13 16:43:55', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6e06514a5bb04915b7ae6b6be0ad304e', 'admin', '2017-12-15 18:39:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6e092c9c1cf84e1bb83b6765d897c79a', 'admin', '2018-08-13 18:25:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6e1db09c1d8141a1a28e6b413bacbcfd', 'admin', '2017-10-30 13:30:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6e4209301d174f98a72e9a155ccc32a8', 'admin', '2018-08-22 10:46:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6e53151f01fe42d3b6db13b82002fca5', 'admin', '2018-08-10 17:47:09', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('6e5582933ba34fe584d4e135c1895335', 'admin', '2018-08-10 17:13:37', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('6e6a38f5c7ad4d5fa1e2e3e4552b8d24', 'admin', '2017-10-15 21:16:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6e7503d01ef5433d8489c018f60a9e52', 'admin', '2018-08-16 18:05:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6e77a442cde24fd99fc4d9bd1a67c383', 'admin', '2018-07-13 15:38:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6e88a2d9bec04cbb944d9d54d1757755', 'admin', '2018-08-17 09:40:56', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6e88a6a2acbc4161bdc1a1642960a3fc', 'admin', '2017-08-06 21:16:55', '退出');
INSERT INTO `sys_fhlog` VALUES ('6e937fdc8c9d4bfcab5b7714f6b521e1', 'admin', '2017-07-31 20:18:32', '新增按钮权限pd{guid=1501503512647, BUTTON_ID=da7fd386de0b49ce809984f5919022b8, RB_ID=3c1ff7c6a05c430ab8779c50f83f5478, ROLE_ID=3264c8e83d0248bb9e3ea6195b4c0216}');
INSERT INTO `sys_fhlog` VALUES ('6eb08b9f8b4b4fafa7dae8536d1293eb', 'admin', '2018-08-17 09:48:59', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6eb092a73074481d8db6675d5ccd2ab0', 'admin', '2018-08-01 13:49:59', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6ec379ba56f444b0a6ebce14ec808e22', 'admin', '2017-11-08 19:57:23', '删除菜单ID63');
INSERT INTO `sys_fhlog` VALUES ('6eccae15ff33417f9550d006fc6ebf6d', 'admin', '2018-08-17 09:58:14', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('6edb5893e06b48d6b2701ad6bd8e53e4', 'admin', '2017-12-08 09:35:06', '删除按钮权限PageData [map={BUTTON_ID=da7fd386de0b49ce809984f5919022b8, ROLE_ID=68f8e4a39efe47c7bb869e9d15ab925d, guid=1512696906347}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@3f9344]');
INSERT INTO `sys_fhlog` VALUES ('6ee2c5cf9e1942a9b9a179f77857f61b', 'admin', '2017-11-16 19:03:20', '退出');
INSERT INTO `sys_fhlog` VALUES ('6f08edf530e440ff9e62aed4164acc97', 'admin', '2018-08-21 18:16:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6f1cd16fa1904abbb2b4eb1d6c79ba8b', 'admin', '2018-08-10 19:39:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6f270785c98b4434beeca33d0ef53917', 'admin', '2018-08-15 10:22:43', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('6f3730288ee5497e990b9b90b7082eb9', 'admin', '2018-08-13 18:23:18', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('6f641e0632924040869e41d346e4ed9b', 'admin', '2018-08-23 17:33:15', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6f72085f1ede4fe89c71d93d0cca84a9', 'admin', '2018-08-21 16:19:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6f7e7a3d627e46b6b81e0b5eea2006d7', 'admin', '2018-07-13 16:43:04', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6f84c9b285dc4718a6d6d0814a5ca12f', 'admin', '2018-06-21 09:02:03', '新增按钮权限pdPageData [map={guid=1529542923741, BUTTON_ID=da7fd386de0b49ce809984f5919022b8, RB_ID=eeea7f1c01d7416d861a8df953e44e7f, ROLE_ID=3264c8e83d0248bb9e3ea6195b4c0216}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@77cc7256]');
INSERT INTO `sys_fhlog` VALUES ('6f944fb755b5463695cd6a19dd8ecc41', 'admin', '2017-09-20 13:39:03', '新增角色:店主');
INSERT INTO `sys_fhlog` VALUES ('6f97a43863b94a609649a30520f8b61d', 'admin', '2017-11-13 15:43:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6f9a0f96159a40019b643a7f090b837b', 'admin', '2017-07-31 21:40:39', '退出');
INSERT INTO `sys_fhlog` VALUES ('6fbfbb6b157546b985240c51b479fe65', 'admin', '2018-02-05 15:32:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6fc51d565fcf4e43ab735ecf180a2280', 'admin', '2018-08-17 10:09:46', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('6fc799f8d7a34d659dd44f3e645e7f31', 'admin', '2017-03-16 01:04:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6fcb1dccbebd40c99408830567e41f0c', 'admin', '2018-08-17 09:40:56', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6fceaa8d8cf14634ad03dd76d8475c7a', 'admin', '2017-11-24 09:52:11', '新增菜单提现记录');
INSERT INTO `sys_fhlog` VALUES ('6fdc64df6ce04b708ee40a10156a6748', 'admin', '2018-07-13 16:42:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6ff04bc593ef446a80a2d38da0c4800b', 'admin', '2018-07-13 16:42:18', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6ff078b225d5494fbefaea534f457646', 'admin', '2018-08-24 18:38:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6ff3a96d03464c2c968b8d54cb5719f3', 'admin', '2018-08-16 18:02:18', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('70008197da754d9881e4ead136f1dc83', 'admin', '2017-08-17 13:52:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7006f5de6a4b433f95ea9c8251be6fa0', 'admin', '2018-08-16 17:56:12', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('7031e3bbd3244a06b61c0060c7e83f8e', 'admin', '2017-12-06 15:37:52', '修改角色菜单权限，角色ID为:68f8e4a39efe47c7bb869e9d15ab925d');
INSERT INTO `sys_fhlog` VALUES ('703a3454507d4e75a7b0da54c8345f17', 'admin', '2017-08-05 22:55:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('703d42f2c6ab405589c412482b28011b', 'admin', '2017-12-11 15:08:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('70494d0aeee947888ca1da921b8fecb4', 'admin', '2017-11-01 17:59:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7049c1ac47af4d66a06a953c59169868', 'admin', '2018-08-10 17:47:08', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('705e4ffe9c6b4cb48b4461de94a535eb', 'admin', '2016-10-28 19:34:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('706b3a9ee22d436ebafabc8a04fc68aa', 'admin', '2018-08-17 19:01:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7083b68475a54c189e67ec8d39e97194', 'admin', '2018-08-09 12:23:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7084741f219842019debc5e55eda24de', 'admin', '2017-09-20 13:09:10', '修改角色:三星级店长');
INSERT INTO `sys_fhlog` VALUES ('708b15d4cef54659b79edc15b9171d72', 'admin', '2018-08-17 09:58:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('708eb6b6e82b4c0b9628ffe9f53f5fe6', 'admin', '2017-09-25 08:51:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('709d62458c5e451b98236ec5d87b2533', 'admin', '2018-08-17 09:42:16', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('70d596e7e6fe4b349aaf78e28057c3c4', 'admin', '2018-08-16 18:19:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('70e9734e6faf49ce9910e7d3168644b4', 'admin', '2018-07-13 16:43:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('71095f4d4a5942d1bbbcd339421c23f8', 'admin', '2017-03-16 01:01:39', '退出');
INSERT INTO `sys_fhlog` VALUES ('710aaa1d04d54a1b992bd84f80d2d76c', 'admin', '2018-07-13 16:43:27', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('71173107b84448d184f987e712244ff7', 'admin', '2018-07-13 16:43:02', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('71200a93095e4e1795149abe70251d1d', 'admin', '2017-11-15 19:22:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('714da0e08aec43ff95dce1709bf307c3', 'admin', '2017-11-15 17:11:03', '修改角色:合作伙伴');
INSERT INTO `sys_fhlog` VALUES ('714de5bf47874d81970ce9ba5579c830', 'admin', '2018-08-09 18:53:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7152af44d3d049e6821a93f23b793f70', 'admin', '2017-08-01 11:19:05', '退出');
INSERT INTO `sys_fhlog` VALUES ('7163cae22fee435f90d47150b66f2798', 'admin', '2017-11-07 11:06:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('717038d6d49f44fdb5fcd787f2547db9', 'admin', '2018-08-16 17:56:13', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('7171d57b3c8a42e59a2acc76558ea558', 'admin', '2018-08-15 10:32:43', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('71736255b9754b59bc25bbbf0abaab18', 'admin', '2018-08-17 10:01:12', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7191f3be5ba14abdb51b99068b4a00a0', 'admin', '2018-08-17 09:58:13', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('719863634cdf44229ae51e42a586c28d', 'admin', '2017-08-17 13:55:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('719b02a6b7a9487db9a0fbc5c69bf207', 'admin', '2018-08-22 15:09:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('71bb3a855bd14e39a8c844f70cfd30dc', 'admin', '2018-08-24 14:48:08', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('71bc2dd8a34d44269b69446e6d0c6839', 'admin', '2018-08-16 18:19:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('71c72a03ee854f788334a5337f2423f8', 'admin', '2018-08-16 18:02:36', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('71d119a5b846436e9557c0283f211241', 'admin', '2017-08-31 15:30:52', '退出');
INSERT INTO `sys_fhlog` VALUES ('71eb31ce67e745429fa5c0c5a639fef3', 'admin', '2017-08-06 21:39:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('71fd4be536f4481e95e5cce7c8ce5dfd', 'admin', '2018-08-17 09:42:03', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('72014e2986544d8cb98d986cb4691b1e', 'admin', '2018-08-17 10:38:44', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('720bf0662adc44c6ac205e9d78a4796f', 'admin', '2018-08-13 18:23:19', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('720d5083e99946a39f88ac6c2a7e3967', 'admin', '2018-08-16 18:05:28', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('72263e268efd4efdb8e211e0487b3fab', 'admin', '2018-08-08 16:51:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('722f8a3f076b40e097af38fb15723fe2', 'admin', '2017-10-30 11:02:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('72725da0a3e644a7a30c65cf790cb900', 'admin', '2018-08-16 18:05:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7278d84531684d1e9a8c6d73265dab64', 'admin', '2018-08-23 17:29:53', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('728778f48306407780eec11fa5a3346a', 'admin', '2017-11-10 17:35:19', '退出');
INSERT INTO `sys_fhlog` VALUES ('728c684d1b8147308e76e4f90eca022d', 'admin', '2018-08-17 10:01:12', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7293cf81112a49f0928d35e8c759993c', 'admin', '2017-12-16 11:31:55', '删除角色ID为:3b2d3a2b212e4da39a221465bcb28c8b');
INSERT INTO `sys_fhlog` VALUES ('72a09db9639d41c3bb4fcf5ee93d2a8e', 'admin', '2017-09-06 09:37:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('72a820a0868b4ac483e9ccd670bf8bb2', 'admin', '2017-12-11 16:24:28', '修改系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('72ad327c8c2440b09ade0aa73f0d697b', 'admin', '2017-11-06 20:23:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('72c9e6bfe2b94f45a3c7a3dc8872804f', 'admin', '2018-08-17 10:39:41', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('72ccb2c350664699a6357d14c58a2179', 'admin', '2017-12-12 14:26:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('72d430eff247418eae081c4eeae0e769', 'admin', '2018-08-17 09:42:03', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('72dd864c2bfd4912b04d84b73c485658', 'admin', '2018-08-17 10:01:12', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('72ded6214aa54aeb978cd054f73b6851', 'admin', '2018-08-16 09:24:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('72ef8122779e45298ac8db8429fb7500', 'admin', '2017-12-06 15:37:04', '修改角色菜单权限，角色ID为:de9de2f006e145a29d52dfadda295353');
INSERT INTO `sys_fhlog` VALUES ('72fe2308db4a40c994aabfb493053a07', '15982183168', '2017-12-08 09:33:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('72fefb9919f24a07bc2fa5e67b69dcb2', 'admin', '2018-07-13 15:38:32', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('72ff4666d9e24ac1894381950bc340eb', 'admin', '2018-01-18 11:10:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('72ffbebdaf3e45bb9f7783e40e6b82d0', 'admin', '2018-08-04 09:22:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('73266beb74e84692bc50556745f2b393', 'admin', '2018-08-10 17:14:24', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('73280e17e1d8407fb334517cd224e281', 'admin', '2017-12-29 13:09:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('732dbfee10a8468db38390f90b5c4721', 'admin', '2018-07-13 16:44:31', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('732e570492df4e42adc67c9d28a7ef40', 'admin', '2018-03-15 16:52:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('73405ebdbbcb48d3a38739f1a8f92d1a', 'admin', '2018-07-13 16:44:26', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7340b7eb028a475fba6455099660ae6e', 'admin', '2018-03-15 16:52:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('73440b71ad7e4d249866659221bda360', 'admin', '2018-08-16 18:04:57', '修改菜单建议');
INSERT INTO `sys_fhlog` VALUES ('734467470bdd4d5496801893c5cd60c6', 'admin', '2018-01-06 11:47:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('734dac9c4b484104aae0ffbe279da195', 'admin', '2018-08-23 09:58:08', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7354e0d6d3a74309937952254a550bfa', 'admin', '2018-08-23 17:33:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('73638a2b6bbc450c9dfeb66bcd500061', 'admin', '2018-08-17 10:39:42', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('738151d2971f4e06a82ffb4f9e058676', 'admin', '2018-08-16 18:19:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7386305ce5814327bb8a8744291cc7b5', 'admin', '2018-07-13 16:42:16', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('73864b279daa4f5c9111eade99bcdb11', 'admin', '2017-11-23 09:35:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7387bc1c2d6f4894a5153f93f4cfa896', 'admin', '2017-11-13 18:15:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('739212dd9d3a4ccd9ceca43a09d24dbc', 'admin', '2018-01-18 11:11:28', '删除菜单ID121');
INSERT INTO `sys_fhlog` VALUES ('73ad14a690d0497297e1641c7a9743b5', 'admin', '2017-08-05 12:02:08', '新增角色:sadfasdf');
INSERT INTO `sys_fhlog` VALUES ('73be1c8086cf4cedb33197e239d97525', 'admin', '2018-08-13 18:24:08', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('73c6705c0c174e1696c9e3e120ceed4c', 'admin', '2017-12-04 19:31:33', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('73caa34869664d17acda9631d5c32e30', 'admin', '2018-08-16 17:59:22', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('73df42bdf79e4483a70d1b4281202132', 'admin', '2017-03-30 01:17:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7405798c27f649569d95d47df9e864f7', 'admin', '2018-08-10 17:34:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('74067c5300234395959e396d42e52804', 'admin', '2018-03-05 19:46:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('740d7455d17445efb9612af99f13dfcc', 'admin', '2018-08-22 11:48:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('741bf980d3874d6e832a0958a9dd6c37', 'admin', '2017-11-03 17:04:34', '修改角色菜单权限，角色ID为:115b386ff04f4352b060dffcd2b5d1da');
INSERT INTO `sys_fhlog` VALUES ('742c23ccc1f3423481b2e59335878b72', 'admin', '2018-08-16 17:59:21', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('742e8cf353d1473c872766f5ff1311c1', 'admin', '2017-11-09 10:53:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('743346ca47904f22b627f5db11f9e518', 'admin', '2017-11-10 14:54:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7433f7318f364049a14d702ce43315d6', 'admin', '2018-08-13 18:25:23', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('743b51b178314ac0955abf2c7209db11', 'admin', '2018-08-16 17:41:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('744d2507cda842e887d22db31831c187', 'admin', '2018-08-17 10:39:55', '删除菜单ID135');
INSERT INTO `sys_fhlog` VALUES ('747797ea632840a4bb3afabfb687f0d2', 'admin', '2017-12-07 20:32:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7487ea69495447fdae71bda0ab8b3dd9', 'admin', '2018-07-13 16:44:20', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('748b053722034c988417ae0745d37d39', 'admin', '2017-11-06 20:27:15', '删除系统用户：PageData [map={USER_ID=90482a088f304a93b6f92c4d1e730c44, tm=1509971235575}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@8edc6b]');
INSERT INTO `sys_fhlog` VALUES ('7493df3c0ff94f0580aa51002acde669', 'admin', '2017-11-04 12:44:48', '修改金额提成:4');
INSERT INTO `sys_fhlog` VALUES ('74a15cc10cc64023926123cc827811e4', 'admin', '2018-08-17 09:48:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('74ac5789bb3d4b5196f2e7151c8e9d15', 'admin', '2017-08-07 22:39:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('74b3504bfe644ae0b43aca0410851f11', '18990673099', '2018-03-07 14:34:50', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('74b3c57eae794206b4cd4c43c1aa0dd1', 'admin', '2017-08-02 18:40:31', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('74b5587f189f471ab05e4a2e73a825bd', 'admin', '2018-08-13 18:24:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('74b901547f57478f8e4b679a8c6ef718', 'admin', '2018-07-13 16:41:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('74c4e6c6b1124893b5ef5a966fe3892a', 'admin', '2018-08-17 09:48:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('74cbee909f7345a4b170e9f7865a9b5b', 'admin', '2018-08-16 18:05:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('74ce747509144253898fb7cd9e4d77f9', 'admin', '2018-08-02 18:59:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('74d1f90998aa49cdb1ba2956b82aaecd', 'admin', '2018-08-23 10:09:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('74d56a82882f498a8da85c2481fd7326', 'admin', '2017-08-04 10:23:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('74dd8a85df6640d4adbf9441792e8c33', 'admin', '2017-12-15 10:10:35', '退出');
INSERT INTO `sys_fhlog` VALUES ('74df83de4c634e0585edbb135d173d0b', 'admin', '2018-08-17 15:48:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('74eecb6e661a48c48426e034bda10114', 'admin', '2018-08-17 16:09:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('74ef47dd69d1432792104ebbf1c14682', 'admin', '2017-12-05 09:42:28', '修改金额提成:1');
INSERT INTO `sys_fhlog` VALUES ('74f1d59371bb4156adf3cf3c89f4e50e', 'admin', '2018-01-29 18:59:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('74f4cb25bf2741d9a7680bf1ec162eec', 'admin', '2017-07-29 21:56:28', '新增角色:土豪组');
INSERT INTO `sys_fhlog` VALUES ('750e1762371744de9f3391cb3eb68421', 'admin', '2017-09-20 13:20:31', '修改角色:砖石卡');
INSERT INTO `sys_fhlog` VALUES ('751b8f13471a4610b333bcc21761666f', 'admin', '2017-11-15 17:08:50', '修改积分提成:0');
INSERT INTO `sys_fhlog` VALUES ('75201c0fab4e4df3b72a06321d64d806', 'admin', '2018-08-10 17:47:10', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('753e6dff973a4191b51a0eaaacb412d2', 'admin', '2018-07-28 10:05:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('756495b99268434c84a7d9a4f27a063e', 'admin', '2017-08-30 14:06:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('756fd35eb46545a4aad4c6b5a7725f7a', 'admin', '2017-11-27 20:02:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7572fb07526d4d43a1cb9cac22c59063', 'admin', '2018-03-06 11:06:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('75774f3ca3724c74b4d298954b341118', 'admin', '2017-10-28 01:58:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('75978e28f1024534a2f643c2f187aab6', 'admin', '2017-09-02 16:35:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('75a983cafd33455e9a1d1b2d3e7a87bb', 'admin', '2018-08-15 10:26:35', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('75ab5516bd294e7abc77fdf4ace2e9fe', 'admin', '2017-07-31 21:37:16', '修改菜单商品列表');
INSERT INTO `sys_fhlog` VALUES ('75c67b0da6f74c2286704c8e448c4307', 'admin', '2017-08-09 12:01:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('75cc6e536c2a4f2c8103ff4bb85c7e71', 'admin', '2018-07-13 16:42:32', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('75f2784c155e4347abfdfdeea56a897e', 'admin', '2018-08-18 17:32:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('75f7255d12d8429eb92503f224fff557', 'admin', '2018-08-17 10:06:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('76010ad6b5fe41e39926aa5df2a28128', 'admin', '2018-08-17 10:09:46', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('76116c6941ff4d67a7c1e95729a0c62d', 'admin', '2018-08-01 16:38:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7612a6a11abb411db899a9aec71c609f', 'admin', '2017-12-11 11:17:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('761bbe0a47c64903846359fcedf640ef', '18990673099', '2018-04-25 10:37:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('76448d99347e4bda821c0824c47dd532', 'admin', '2017-08-08 20:46:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('766043b12f2149af9b2489447d9b29a9', 'admin', '2018-01-26 13:19:00', '退出');
INSERT INTO `sys_fhlog` VALUES ('766221b839594e569e2d8686edc3ef60', 'admin', '2018-07-31 17:17:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('76758d42f83c47319906ae0bc3174956', 'admin', '2017-08-31 15:26:05', '新增菜单店铺管理');
INSERT INTO `sys_fhlog` VALUES ('767cd173ef6542198651ad3470e9beab', 'admin', '2018-07-28 19:28:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7680461b470543b9a5062baa969d25a4', 'admin', '2017-12-16 11:31:43', '删除角色ID为:ce4c50d7af9541db9385c4026ab5bcda');
INSERT INTO `sys_fhlog` VALUES ('7684a5eae277431eb445f13d648d9b20', '18990673099', '2018-03-15 09:39:24', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('76882193793b4dadae341ea9d5e100ca', 'admin', '2017-08-02 19:47:21', '退出');
INSERT INTO `sys_fhlog` VALUES ('7696eb8dbc08492a98a277983f110c1b', 'admin', '2018-03-01 10:37:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('76a4b6ec15c346679880b7af82aa62d4', 'admin', '2018-07-13 16:43:48', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('76a59cd8a5734f48a65794867af90ccb', 'admin', '2017-11-27 20:02:59', '退出');
INSERT INTO `sys_fhlog` VALUES ('76aba5d052c54a70acd989ca60302e6c', '18990673099', '2018-03-05 21:15:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('76b8cf69361945f19a99bc3e7dfb6dd9', 'admin', '2017-11-09 10:57:07', '删除菜单ID107');
INSERT INTO `sys_fhlog` VALUES ('76b9df9fe7c54ee4b6cc9c77b702582a', 'admin', '2017-12-08 09:35:00', '删除按钮权限PageData [map={BUTTON_ID=3542adfbda73410c976e185ffe50ad06, ROLE_ID=3, guid=1512696900818}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@fd0024]');
INSERT INTO `sys_fhlog` VALUES ('76d5563aaa1542be998e89c1f17ac99c', 'admin', '2018-07-10 11:48:10', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('76dcbed8db644e4996e5e368df686ead', 'admin', '2018-01-31 16:14:45', '退出');
INSERT INTO `sys_fhlog` VALUES ('76e867bcee0c4722aa4d3d2e9d8a67fb', 'admin', '2018-08-25 18:20:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7733b8f007d14dd28cfe56ecba4b244b', 'admin', '2018-08-23 17:31:01', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('77353b8a4e90481497a4724a45ae55fe', 'admin', '2018-08-13 18:24:43', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('773f1073955547899581dd0f70e1535e', 'admin', '2017-08-01 18:15:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('774097ef9b29448d9d2f204e43653e7f', 'admin', '2018-08-10 10:42:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7750b5e0f49f42649aa265d6896cbf35', 'admin', '2018-08-23 10:09:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('776356e82e334a7baf06d8e857a9b534', 'admin', '2017-08-04 09:27:15', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('7790e904c9cd451988167384a583956d', 'admin', '2017-12-12 18:37:33', '新增系统用户：15966666666');
INSERT INTO `sys_fhlog` VALUES ('7798140853224d2ea315272209b12f74', 'admin', '2018-08-17 10:37:37', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('77a2558569ab4c62a25bf570cd0c8560', 'admin', '2017-11-27 16:27:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('77acc59c745244dab2f34ccbd524377a', 'admin', '2018-08-14 09:22:09', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('77c24c2bce8d47fd8ee552c798aa97f1', 'admin', '2018-08-23 17:33:16', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('77c4aefefa034bc0b78a50917df17485', 'admin', '2018-07-13 16:42:35', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('77c54f195e2a4cefbbb34a706a63015a', 'admin', '2018-08-10 17:47:09', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('77ce8d0a8e7e4a12ad07a5e06da8c144', 'admin', '2018-08-15 16:25:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('77d06b63f5054a4cba4c60a54dd97284', 'admin', '2018-08-17 10:06:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('77e7e834f9864b27a5a491270a4473cb', 'admin', '2018-08-16 18:05:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('77f23d08d6fe4fd887df01757b00ea32', 'admin', '2018-08-10 17:13:37', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('77f52e269fb842a8b196583a7231c8dc', 'admin', '2018-08-21 15:55:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('77fc1b26beb5473481aad654664f1b28', 'admin', '2018-08-13 18:25:23', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('781975c4dcc6485da59aac4fe121f7be', 'admin', '2018-08-16 18:05:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7828a40b8a824f4e83fd94376c334b0e', 'admin', '2017-11-27 18:01:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('782e017da841468f87d7a38747ca5664', 'admin', '2018-07-13 16:44:17', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7859d30cdaa54d0493b2071a04c37ba0', 'admin', '2017-11-04 12:52:07', '修改角色:注册用户');
INSERT INTO `sys_fhlog` VALUES ('785d78b9afd842e2aacdfcd886132dd1', 'admin', '2018-08-16 18:18:50', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('785f30cdf5ac4965822517bd5d48d3c9', 'admin', '2018-01-06 11:05:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7862a9694fce4c61b175236df2ad32ba', 'admin', '2017-11-24 16:49:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('788c7a39691f4ba383ece040f5408984', 'admin', '2017-07-31 20:42:04', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('78a09d1d93944fc5904a52a62ab3b510', 'admin', '2018-06-18 11:07:17', '新增菜单店铺管理');
INSERT INTO `sys_fhlog` VALUES ('78d58e1dcf46476b879ebf98a6ed55f9', 'admin', '2018-07-13 16:43:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('78db289e0a184f47a07f65ccdccba9b1', 'admin', '2018-08-10 18:36:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('78df34c0aa6d49f7b0b49373868d5919', 'admin', '2018-08-17 10:03:19', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('78e638b00f134f709b8a61e7468d57b2', 'admin', '2018-08-13 18:24:44', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('78e8b458b6d54ba494ca69c3b68af161', 'admin', '2018-07-13 16:44:30', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('78f9559e2de64c98b85908399e941cd3', 'admin', '2017-11-04 09:26:42', '新增角色:维修师傅');
INSERT INTO `sys_fhlog` VALUES ('78fa2d8bc0eb4d6ab125c5eba09767c2', 'admin', '2017-07-29 21:59:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('78fb8033d4d4462a810739a452e66484', 'admin', '2018-07-13 16:42:44', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7909bb8b97724903b17dc7527fdcae2c', 'admin', '2018-07-13 16:42:50', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7912849098d7452e8f4430450f929be2', 'admin', '2017-07-31 21:50:16', '删除菜单ID72');
INSERT INTO `sys_fhlog` VALUES ('79150410ec4e4d0b9196667db300e747', 'admin', '2018-08-27 18:56:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('792025f6111f413082fd790713dfc87c', 'admin', '2018-07-27 09:48:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('79204892bc2b4d23b1095dc2afd3f62a', 'admin', '2017-12-08 09:35:02', '删除按钮权限PageData [map={BUTTON_ID=46992ea280ba4b72b29dedb0d4bc0106, ROLE_ID=68f8e4a39efe47c7bb869e9d15ab925d, guid=1512696902090}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@d39e29]');
INSERT INTO `sys_fhlog` VALUES ('7923acec0ffa4f9884f2986ffeb5a5b3', 'admin', '2017-11-09 16:18:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('792b2843b24e4f9181c014732ec47369', 'admin', '2018-07-13 16:43:21', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('792b2a83c8d84a24b9e8fd6a054d0093', 'admin', '2018-08-21 10:59:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('793094e4ee8b4dff82a12077ec62c6b6', 'admin', '2017-11-22 17:17:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7932bad5831646d993045bd357ea88e7', '18990673099', '2018-03-04 10:50:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7934a0a364df400f8f5ea61c5e8a2727', 'admin', '2018-08-16 18:02:36', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7936347bc67f49c8be06a80df93eb55b', 'admin', '2018-08-23 17:29:53', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('7936d7fbfdb0495b8478bcdbeefcb400', 'admin', '2017-09-09 09:40:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('79780f199486455883c0bde28d4da533', 'admin', '2017-11-04 09:27:55', '删除角色ID为:0ccfe6dcc5bf4c62b113dcf8d15fe151');
INSERT INTO `sys_fhlog` VALUES ('79957d3d2f7d4746a59a3f2c169c5f2a', 'admin', '2017-12-08 09:34:54', '删除按钮权限PageData [map={BUTTON_ID=fc5e8767b4564f34a0d2ce2375fcc92e, ROLE_ID=3264c8e83d0248bb9e3ea6195b4c0216, guid=1512696894107}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@1f715d]');
INSERT INTO `sys_fhlog` VALUES ('79a77b90f7ce4f0988219dc933143510', 'admin', '2018-08-10 17:48:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('79b9fd91a5114fd0b81c6c12ee595b81', 'admin', '2017-12-11 14:15:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('79c474e508574e6980660a3f2634f896', 'admin', '2018-07-13 16:42:29', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('79c9f677f3c34553bccaf88dfd48ea7c', 'admin', '2018-08-16 18:02:37', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('79d221049afe4ab6942bcc233f583939', 'admin', '2017-09-08 12:12:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('79d2cf90c87843059b47b60bd658039c', 'admin', '2018-03-07 16:57:35', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('79d39d73bdde46b6860b697f92161a88', 'admin', '2018-08-13 17:07:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('79e530f55b43474e8044be3a9734602f', 'admin', '2017-11-04 09:27:58', '删除角色ID为:8daec538a864450f8f2d55d4989f5d8d');
INSERT INTO `sys_fhlog` VALUES ('79e66e28858c4e71a0bd1a58455a289e', 'admin', '2017-11-18 14:50:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('79ec8e88cbf743e4be7bd9dfdeda1710', 'admin', '2017-10-31 16:18:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7a06671becfc4d61bb99577dbf9f1fef', 'admin', '2018-01-08 17:00:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7a0a1e9e95cb4a15bbc59b80ec0a1297', 'admin', '2018-08-10 10:56:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7a0f9d0dfc1d4df59dcee8a68e281077', 'admin', '2018-08-22 18:46:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7a1b1b8cc3714ced9ac5ae040ee512b2', 'admin', '2018-07-13 16:42:13', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7a2351a2400b46c7805cbb28377f0154', 'admin', '2018-05-19 17:25:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7a41c510de504babb0ec1753234b2159', 'admin', '2018-07-13 17:05:31', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7a43225017d5417dbca2f3511a466ddc', 'admin', '2017-11-21 15:22:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7a4e0600095d4bceaea17cfac99387fe', 'admin', '2017-11-03 19:31:23', '修改角色菜单权限，角色ID为:b031a1c95de24553931c5fe59e6e880d');
INSERT INTO `sys_fhlog` VALUES ('7a5cc2246f5c4ca3a20a65111ed0b4c5', 'admin', '2018-08-21 09:16:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7a65249b92824264add8d4f2c7c1f90d', 'admin', '2018-08-17 09:48:23', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('7a7720c828ce401e8b56bd5adb870e7a', 'admin', '2018-03-15 18:08:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7a9531009adb4a5b80a8b07b6218b648', 'admin', '2017-08-17 10:36:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7a9aed08ffcc4703bca62a686975cfea', 'admin', '2018-08-27 13:16:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7a9c7064419a41729402740dbe010735', 'admin', '2018-07-13 16:41:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7aa0902b08b94e0c9145c238e36465c7', 'admin', '2018-02-07 16:44:23', '修改add_qx权限，角色ID为:3');
INSERT INTO `sys_fhlog` VALUES ('7aa3b71fc67342e69bc893101fbd3f9b', 'admin', '2018-08-17 10:38:46', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('7aa979f2ab0246c9842a818b114b17d9', 'admin', '2018-08-10 10:17:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7aab7f54ac9b419abc5cd1fe162153b2', 'admin', '2018-08-01 16:02:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7abfc19453bf4290836608cdd388856e', 'admin', '2018-07-13 11:23:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7ad099412b94455bbe01a01b88abb4f0', 'admin', '2018-07-13 16:42:18', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7ad2e85c66394688a07fc2b5e3ee8b5c', 'admin', '2017-11-04 12:00:35', '修改角色:分店店主');
INSERT INTO `sys_fhlog` VALUES ('7adda1460982449daafe9a42426090b5', 'admin', '2018-08-17 10:32:31', '新增菜单建议管理');
INSERT INTO `sys_fhlog` VALUES ('7aff2d4e21134b4eb609d26f921bcc8c', 'admin', '2017-08-06 09:41:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7b02056a6fc849028948145a45c7fb5e', 'admin', '2018-01-29 18:08:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7b0e591488c74e0d80060e2fd0c55a69', 'admin', '2017-11-01 18:59:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7b1348c11b724685bf89923c78d593f8', 'admin', '2017-09-29 20:33:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7b29744e86c14c18bab6820a7ec8dbdb', 'admin', '2018-07-13 16:44:24', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7b2a8a04898b472caa9e6d5d2f60a43b', 'admin', '2018-07-27 10:33:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7b4351bf14154df2a11856819911c58d', 'admin', '2017-10-31 13:53:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7b8a15fecdac46a1b1d95b8c4b35e999', 'admin', '2017-12-16 11:31:58', '删除角色ID为:3ed5007dc9064933b09cf253b76625de');
INSERT INTO `sys_fhlog` VALUES ('7b9cc0b5fd7847edb158edf3739cc5b4', 'admin', '2018-08-21 18:29:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7b9e1d3a8d2c4b4bab45b58152c5aed8', 'admin', '2018-08-17 10:44:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7ba4fd79b82b472faf50816d552186f1', 'admin', '2017-12-04 17:39:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7bbf912ba1354ed79fae4becdceeedba', 'admin', '2018-08-16 17:56:12', '新增菜单建议');
INSERT INTO `sys_fhlog` VALUES ('7bc900bf94514797a6ad03890c234bac', 'admin', '2018-08-13 18:24:44', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7bc9a78eeee54f3cb896eaff0d197ef3', 'admin', '2018-08-02 19:14:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7bcbe2e9cdbe4ddfb6716d2b6e07422d', 'admin', '2018-07-13 16:43:55', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7bf1bb04610a4e43a2c900f61a95f329', 'admin', '2018-08-17 10:37:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7bf5824402c0404c9e1a7afea8db05f4', 'admin', '2017-08-09 21:32:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7bfda877feb045b3acf314d9f8763e3c', 'admin', '2018-07-13 16:43:50', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7c07224229af419fb066358f6db06c76', 'admin', '2017-11-27 11:39:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7c17cf9ca75249749304ec1dcaacd18d', 'admin', '2018-07-13 16:42:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7c1bf1f281184dccb6a1e37330ea5888', 'admin', '2018-08-17 10:08:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7c5ca9ed8435415ca9850571e0ef45bd', 'admin', '2018-08-13 18:24:06', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7c89a412771d4d1eb60b89f2c6a37bb8', 'admin', '2018-08-17 09:58:46', '退出');
INSERT INTO `sys_fhlog` VALUES ('7c9d15863e8148409cdeb6642c8f65c3', 'admin', '2018-08-07 17:11:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7ca97ff8fb1d4eb2a707dc56bc7949c8', 'admin', '2017-10-31 10:41:16', '修改菜单尺码/颜色');
INSERT INTO `sys_fhlog` VALUES ('7caf2e8677c2427c844f6fd40e77eb54', 'admin', '2017-11-17 18:31:55', '删除系统用户：PageData [map={USER_ID=9e8f2627ee064900bc948779cf06a211, tm=1510914713367}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@1c4f24d]');
INSERT INTO `sys_fhlog` VALUES ('7cb1f42522f94762a0db77946ae97672', 'admin', '2017-10-16 16:08:45', '修改角色菜单权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('7cb907c12e1e4db1b7f61db3a4c8c9fd', 'admin', '2018-07-12 15:41:03', '新增按钮权限pdPageData [map={BUTTON_ID=46992ea280ba4b72b29dedb0d4bc0106, RB_ID=4dbd93d481f246ab8b825bff7fa5cd4c, ROLE_ID=de9de2f006e145a29d52dfadda295353, guid=1531381263434}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@6ed54541]');
INSERT INTO `sys_fhlog` VALUES ('7cbc29b0e1334850837873b239fd063e', 'admin', '2018-08-21 17:21:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7cbf92465f5345e0af8da5ea9cdf3865', 'admin', '2018-07-13 16:44:32', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7ccb635c885444dab0d138937f82450e', 'admin', '2018-08-11 14:19:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7cd24593249644ce804ba1610ee60b65', 'admin', '2017-11-10 17:08:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7cd39015f7f24fd19ea8a15e0d32ebc8', 'admin', '2018-08-13 18:25:23', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7cdf9449bb334060bd924d6cf027cbb4', 'admin', '2017-12-29 14:14:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7ce482f40c414ab4b2777500307996e4', 'admin', '2018-07-13 16:42:17', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7cfab999a5f84f408b964200451b6571', 'admin', '2018-02-05 20:34:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7d21a66386424a17896605acacb6fa19', 'admin', '2018-07-13 16:43:13', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7d27fa78a03b446fb7e8af25e72c11e8', 'admin', '2018-08-18 19:58:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7d359993c7b8403d89e664dbfabac377', 'admin', '2018-07-27 10:44:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7d4ce8ff779143b3bd142adb2ba80548', 'admin', '2018-01-26 16:13:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7d4d7eba24dd48188d9cb6a7d82c87e6', 'admin', '2017-11-17 13:03:31', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7d577bd224824f32a090314014c2059b', 'admin', '2017-03-16 01:03:55', '退出');
INSERT INTO `sys_fhlog` VALUES ('7d74d5ff4f9a4e6ea0d9894c39750bd7', 'admin', '2018-07-13 16:43:45', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7d7aec5e9b614181a9329ccf0bba68a5', 'admin', '2017-09-04 16:33:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7d8a0d74346743a6a1b5dd0607922083', 'admin', '2017-11-04 09:31:03', '修改角色:管理员');
INSERT INTO `sys_fhlog` VALUES ('7d8e1105db9245249240f92186d5092a', 'admin', '2018-08-17 09:45:58', '修改菜单建议');
INSERT INTO `sys_fhlog` VALUES ('7da7d9ba6212498e9a1b50f46041875e', 'admin', '2018-08-13 18:25:23', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7db83670a4394970b9b959aa705c83d3', 'admin', '2018-07-24 14:10:36', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('7db897ba3ec44f30ac31d06cc03d72c7', 'admin', '2017-11-04 17:22:15', '修改角色:客服经理');
INSERT INTO `sys_fhlog` VALUES ('7db9a611993a45e98ce5f07a1f22c384', 'admin', '2018-08-16 19:07:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7dbf6bd2abf74f8d8bec25f7b739b5ef', 'admin', '2018-08-02 10:26:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7dc92613892b49fbae26223bd1528c37', 'admin', '2018-08-23 15:20:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7dce5278daaa498c97f4bbd48083d663', 'admin', '2018-08-10 17:13:36', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('7dd184c95c0c4693b93ca59f59b4fb2a', 'admin', '2017-11-08 19:57:18', '删除菜单ID65');
INSERT INTO `sys_fhlog` VALUES ('7de4aa41bfac4d0a81b46039353b93f4', 'admin', '2018-01-05 14:16:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7de88f278de346e3875bce4c5d714af6', 'admin', '2018-07-13 16:44:03', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7e0d8de1d540459e94ce4b8f68f560d4', 'admin', '2018-01-05 15:33:29', '新增菜单语言分类');
INSERT INTO `sys_fhlog` VALUES ('7e174f95eeb64111aae6bc48d8c7480b', 'admin', '2017-11-16 17:09:55', '修改菜单合作商家');
INSERT INTO `sys_fhlog` VALUES ('7e1861cacdbd46f1989e2909a0569793', 'admin', '2018-08-17 09:47:37', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7e3dbd007dd84fa59493805afe1cf1c7', 'admin', '2017-11-07 16:14:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7e517210d69d4b58a6aa97018aeb2133', 'admin', '2017-08-14 10:20:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7e60b3f22e6545b9b6ce8662d6998e4d', 'admin', '2018-08-17 10:40:38', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('7e797de34b8e410892f7a6fd751bc9f1', '18990673099', '2018-03-05 18:11:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7e7d0be936f84bf7b5c78101e1dbb901', 'admin', '2018-08-02 12:53:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7e915d7c4e0d411fb59019eb5c0436d1', 'admin', '2017-11-11 09:40:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7e98162d62b340df870c2135f0035588', 'admin', '2018-08-13 18:24:43', '修改菜单店铺类别');
INSERT INTO `sys_fhlog` VALUES ('7e9aa6882ecf447195556ed19dcc921b', 'admin', '2017-08-03 19:35:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7ebcd49d999d4626ad67d62b2c28ae4e', 'admin', '2018-08-16 18:04:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7ece758f45824e05b8a68f30cdaedccd', 'admin', '2018-08-16 18:05:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7ed95a4c585f491287144440a0e58578', 'admin', '2017-09-07 15:05:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7eea0a01d3b7429cbf652c0eb682ea16', 'admin', '2018-08-13 18:34:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7ef169c91e9040d1b275db7eb1b1c5fe', 'admin', '2017-12-02 17:08:18', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('7f0e6be7a0144bf6a903aaa20fe966aa', 'admin', '2018-08-14 09:22:09', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('7f2b82252f3d411b9e4d428667ad6600', 'admin', '2018-08-17 09:45:37', '退出');
INSERT INTO `sys_fhlog` VALUES ('7f2c2957711d436f899bc40ad2a417b1', '18990673099', '2018-06-01 10:52:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7f2cae1fa0c940c98d681338c4454490', 'admin', '2017-12-05 17:54:24', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('7f424ec1c04341f885ac5b28fd67017e', 'admin', '2018-08-16 17:59:20', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('7f481f5a4a3347d0a64c1a20a71a6eee', 'admin', '2017-03-29 02:28:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7fc544fcf6e248fd9183736dd9c8dc4e', 'admin', '2017-11-27 11:16:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7fc69b06f54843cf915ab9b4422c965f', 'admin', '2017-12-15 10:09:47', '修改菜单商家管理');
INSERT INTO `sys_fhlog` VALUES ('7fcb25b38def403e8a6a997340708956', 'admin', '2018-03-27 15:25:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7fd365e22920419f892f31a4b797658c', 'admin', '2018-02-07 16:27:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7fda970a1bdf4465bcb1f7ae6a6a05c6', 'admin', '2018-08-16 17:57:03', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7fe28b82b95a4ddfb5b6e324f8d1077c', 'admin', '2018-07-14 16:19:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7fe3d48804844e29996bff3b13fa028f', 'admin', '2018-08-10 17:13:37', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('7fee1c0e3c5046a99ec5ce83b7f72fc6', 'admin', '2018-08-16 17:59:22', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('7ffe98e9d4cd4da1a7abacebdc72ac93', 'admin', '2017-11-07 14:14:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('800163dcd62141ef8ad7b726d370600b', 'admin', '2018-08-16 17:57:03', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('80379251bf134dc392f84da6f0433137', 'admin', '2018-07-27 18:49:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('80399c14340142bfb27dc3ec87b1f0ae', 'admin', '2018-08-17 09:48:04', '退出');
INSERT INTO `sys_fhlog` VALUES ('804025be32c14894a07f504858f52560', 'admin', '2018-08-16 18:04:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8048be08210945e0b08c69733cd123d4', 'admin', '2018-06-18 11:07:58', '新增菜单店铺类别');
INSERT INTO `sys_fhlog` VALUES ('804a77ffbd66473c8e78d9c93703c31e', 'admin', '2017-07-29 21:48:12', '新增按钮权限pd{guid=1501336092327, BUTTON_ID=fc5e8767b4564f34a0d2ce2375fcc92e, RB_ID=ec5795e725aa4ed4bd4bcad3c9e78704, ROLE_ID=115b386ff04f4352b060dffcd2b5d1da}');
INSERT INTO `sys_fhlog` VALUES ('804dc7b0c6724f1692d3d983778a2063', 'admin', '2017-09-10 18:11:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('805a1f3a11ab4991bb38f1527becfaeb', 'admin', '2018-07-13 16:43:03', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('806e15e74e364bf8badac3297354e9db', '18990673099', '2018-03-15 09:39:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8077dbf7606a4fe5b230513cac4a29d0', 'admin', '2016-11-02 01:13:48', '新增菜单公众号管理');
INSERT INTO `sys_fhlog` VALUES ('808392fd6eb7433c8711d850890025a8', 'admin', '2017-12-25 13:48:27', '删除菜单ID122');
INSERT INTO `sys_fhlog` VALUES ('808f6094583c432a8464ce4ac2061014', 'admin', '2017-09-20 13:09:49', '修改角色:五星级店长');
INSERT INTO `sys_fhlog` VALUES ('809642b36c64498bad0fe717535257e8', 'admin', '2018-07-13 16:44:35', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8099f53447104c4d84607e2a1c86e128', 'admin', '2018-08-23 17:33:15', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('80a752e503344aa98d1b2ca098d6659d', 'admin', '2017-08-29 23:14:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('80b1eb4068794463a2dae0d4211be329', 'admin', '2018-08-21 16:12:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('80b68b8d6ed244b699f273cdb79010f4', 'admin', '2018-08-16 18:02:37', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('80bb80e9eca34409af71d37c203031d8', 'admin', '2018-08-23 17:29:54', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('80c54eb829ce42ee9273eb66ec41cff8', 'admin', '2018-08-13 18:24:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('80f9bbc3d4014ec99261a2fbcee30782', 'admin', '2017-11-27 20:20:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('80fb64795b4b45dd8c9c9363bbfd65de', 'admin', '2017-11-21 18:40:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8109f4cc54af4db4ba4ea4e27a0f78c7', 'admin', '2017-07-31 19:38:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8112f4fad0f143a883fedd22b36809df', 'admin', '2018-08-14 11:25:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('811635f37d02402780a88d9bbcf3c9bc', 'admin', '2018-08-01 15:52:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8139ef4d242d4b77af77ae9255bb333a', 'admin', '2018-08-16 18:18:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('813a5ae8e68f49a8b7294269ce0f8daa', 'admin', '2017-11-04 09:28:00', '删除角色ID为:c0463dd64c9f485aa78dce92fa4e2673');
INSERT INTO `sys_fhlog` VALUES ('814182c6612e41b0a39b05e59a07d534', 'admin', '2018-03-02 21:14:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('814199e1befb4020b0c0e5ffc1dd602a', 'admin', '2017-09-23 17:37:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('815b81c317a54582b21fc40225da90b7', '18990673099', '2018-02-07 16:46:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('81649a5ab17a4a4db786477d45de0b18', 'admin', '2017-07-31 21:47:30', '新增菜单待发货订单');
INSERT INTO `sys_fhlog` VALUES ('81889e6652884b18b1102ad4c7afe529', 'admin', '2018-08-13 18:25:23', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('81a6e8684ece439387c70c3c3cead0e2', 'admin', '2017-09-30 14:35:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('81be4431100c4547bd1e89b2aea61fbb', 'admin', '2018-08-15 18:17:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('81c23d63d5744257be6d67b374fad1cf', 'admin', '2018-08-15 14:44:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('81da6e4e8823482ca704907235db1136', 'admin', '2018-08-10 17:48:18', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('81e0f33d1d2a40b4936b2c7ade41ad02', 'admin', '2017-11-15 17:15:22', '批量删除user');
INSERT INTO `sys_fhlog` VALUES ('81e220f022274790be4d5e14d0e3c480', 'admin', '2017-11-27 10:50:41', '修改菜单招聘信息');
INSERT INTO `sys_fhlog` VALUES ('81f329291f72453482160208f7d85aea', 'admin', '2018-07-13 16:44:31', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8213cb6684d3475fb38eda34b209b925', 'admin', '2018-08-14 10:14:59', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8216f6c8a6f74dc489b38fa000188fbc', 'admin', '2018-08-17 09:42:03', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('821b2d0aa4534a7ab3c14bd387645714', 'admin', '2017-10-08 17:15:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('822c82199b814222a696cf8d9b67d932', 'admin', '2018-07-13 16:44:16', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('823055317a5e46ba964fccf7df7658c6', 'admin', '2017-11-10 14:19:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('823b9919cea945cab48d0eb64259cc20', 'admin', '2018-08-16 11:28:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('82593382d2c84962807745be7f7dba7b', 'admin', '2018-08-07 18:43:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('829a56939a144327a1f02b16b4a2e902', 'admin', '2018-08-11 14:35:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('829e5159d48d4ae2917be91f217bdc91', 'admin', '2017-11-08 14:00:16', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('829ef44151b3483ba5499907e4fd380d', 'admin', '2018-08-17 09:58:14', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('82a5513c8fbc41f5bf4574d612eb7a62', 'admin', '2018-08-15 10:27:18', '退出');
INSERT INTO `sys_fhlog` VALUES ('82b39656591e4abdb964cf8af3480a37', 'admin', '2018-07-13 16:44:21', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('82b5acbcaa60408d913699b20a1256b0', 'admin', '2017-08-05 09:48:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('82e3f25f727d44c9a04537585a70b9ce', 'admin', '2018-07-13 16:43:35', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('82eea4aba843408eb1a9cc33f69abb49', 'admin', '2017-11-21 20:01:47', '修改菜单预约管理');
INSERT INTO `sys_fhlog` VALUES ('830311e126d04c21b85b0e9147fdb99f', '15982183168', '2017-12-08 09:29:29', '退出');
INSERT INTO `sys_fhlog` VALUES ('830f7f9a634c40cd9f41cc6f0341d12c', 'admin', '2018-07-13 16:42:30', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('831d36e794ea4cb7a5acc772683acfab', 'admin', '2018-08-17 10:41:12', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('83261d4231fb46fabef70e3957062ece', 'admin', '2018-07-13 16:42:31', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('832b9d1a530941f3896c0a73a72a4aaa', 'admin', '2016-11-02 01:14:13', '退出');
INSERT INTO `sys_fhlog` VALUES ('8332471ec14d4c59a98d13bf071d25f6', 'admin', '2017-11-22 11:33:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8339632ff05b42fabe2e3e7d3b987372', 'admin', '2018-07-13 15:45:26', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8348ab7c12ca41d2abe21f584ff4ca5a', 'admin', '2018-08-16 18:19:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('83580cba3a614654b82bafc3014b2b8e', 'admin', '2018-08-13 12:37:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('83640ec439f342719a286f6d40c4973e', 'admin', '2017-10-30 13:26:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8365422acc794a2ca445009f5f4b29d7', 'admin', '2018-08-17 10:03:17', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('836825f1fd2a4f98b46ef97df669ffbb', 'admin', '2017-08-09 10:15:34', '新增菜单洗护项目');
INSERT INTO `sys_fhlog` VALUES ('836aa7baf56d4839a3ad3b0a3d997934', 'admin', '2017-08-30 14:18:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('837103bb69fe43b78d4e0e98ed49d471', 'admin', '2018-08-13 18:25:23', '修改菜单店铺列表');
INSERT INTO `sys_fhlog` VALUES ('8375ff71ce5a41baa5ef64fce1a743be', 'admin', '2018-01-18 11:12:09', '删除菜单ID74');
INSERT INTO `sys_fhlog` VALUES ('838fa357fe154255a918961f78488189', 'admin', '2018-08-17 09:47:36', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('83967fa55b874c3397296fd23d1c759a', '18990673099', '2018-03-05 20:16:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('83a012aff664496b8a852d5395f19fcb', 'admin', '2017-12-06 15:47:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('83a55116bdcc4d32a14aa0c19639a9f7', 'admin', '2018-08-17 10:01:12', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('83b6319098ac4161b32cbbab0b0c68c1', 'admin', '2018-08-17 10:04:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('83bb0b025d914dacaea3a702749cf4e5', 'admin', '2018-08-17 09:58:12', '新增菜单建议列表');
INSERT INTO `sys_fhlog` VALUES ('83d9576676be4e268269d2efb1b48172', 'admin', '2018-01-06 10:26:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('83e5dfb58c4345bc902f00af21b8ca96', 'admin', '2017-09-09 18:49:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('83f8873c9ecb443d8d635d23a72bdf75', 'admin', '2017-11-10 13:59:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('84074acfd5d14b5a97484d5001b03293', 'admin', '2018-07-13 16:42:34', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8416f73a6918418bbc60d3ef29eea69e', 'admin', '2018-08-17 09:40:01', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('8419de040d5142fead756a58ce9e1e4f', 'admin', '2018-01-22 10:26:36', '修改菜单红包记录');
INSERT INTO `sys_fhlog` VALUES ('841cb8527d044fd7a5d8991c7a0ee693', 'admin', '2018-08-14 09:22:10', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('8422903626e241dab1c44ef64fbc87b7', 'admin', '2018-08-17 09:58:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('842ff936cd274e5680032b52686d4655', 'admin', '2017-12-11 16:23:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('845a09757ea44f5489dcb3e509cf3d26', 'admin', '2018-08-15 10:32:44', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('8460be2b4f0641f8b71a2b555ef4feeb', 'admin', '2018-07-13 16:42:06', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('84696a9dcf7d4e0293e947d36a4f9e5d', 'admin', '2017-09-20 13:07:25', '修改角色:店主');
INSERT INTO `sys_fhlog` VALUES ('84782b817c2f4ae0bc82b54bd17efd86', 'admin', '2018-08-13 18:25:23', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('847a458d9e454d88ba6fc161ef1221ab', 'admin', '2017-09-05 19:13:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('847a58baa56e411fa6994af4b16b48ca', 'admin', '2018-08-16 18:04:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8497f071351c4c55bffa07887b8580d3', 'admin', '2017-11-04 09:29:29', '修改角色:维修师傅');
INSERT INTO `sys_fhlog` VALUES ('849bc70d4cdc42259fb651f01cb9aa01', 'admin', '2017-12-08 09:34:51', '删除按钮权限PageData [map={BUTTON_ID=cc51b694d5344d28a9aa13c84b7166cd, ROLE_ID=3264c8e83d0248bb9e3ea6195b4c0216, guid=1512696891411}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@89f8ae]');
INSERT INTO `sys_fhlog` VALUES ('849bd46235cd4a578320db311787aadc', 'admin', '2018-08-18 17:41:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('84a5e008f3354e5d879d9758d0ad9afe', 'admin', '2017-11-04 15:54:47', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('84aa21865597425497237b9a70c42907', 'admin', '2017-12-06 20:20:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('84ad151770a448068adc816adab31665', 'admin', '2018-08-23 17:29:53', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('84b7a20c244a4ce1bb4e74035347b80b', 'admin', '2017-10-10 14:31:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('84c25b7adf604ab48fcc833e3fd78f22', 'admin', '2018-01-26 17:53:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('84ccaa98edc74a70956e6daaa73af611', 'admin', '2018-08-02 19:02:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('84d03beef97c4e19a2c904bfbfc28add', 'admin', '2018-08-16 18:05:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('84d8dcca1f0148ae9ec8afcd60eb5962', 'admin', '2018-07-26 17:06:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('84dee7d894bb49d78c8b90dec5d3e830', 'admin', '2017-11-24 16:55:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('84eeb9862ccc43adb779df87b03d4053', 'admin', '2018-01-25 10:47:13', '新增菜单街圈管理');
INSERT INTO `sys_fhlog` VALUES ('850c0db2acc441b58d7aa996d189c69a', 'admin', '2018-08-17 10:03:18', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('8510be78f5f14531b0c8c1d15393518f', 'admin', '2017-11-20 14:29:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('851fed1bbe914171851b55652ab9cfad', 'admin', '2017-08-09 18:33:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8528165cbbf24ab980a3260de4d2bb95', 'admin', '2017-11-17 16:48:11', '删除系统用户：PageData [map={USER_ID=d7b871e52f97496f89079bb7659fdfd7, tm=1510908491147}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@14b2ea7]');
INSERT INTO `sys_fhlog` VALUES ('852a8f7b0e3247a3ba8d41edb72a9d28', 'admin', '2016-06-06 02:28:38', '退出');
INSERT INTO `sys_fhlog` VALUES ('852aa17ef8ca439c93c69edf81fc28be', 'admin', '2018-08-22 10:39:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('854591e766f340738da6e97c6a7b0618', 'admin', '2018-08-10 15:53:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('85523c22d6ff4201bceb8bec79d6d29b', 'admin', '2018-07-13 16:44:16', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8577d1958ef840b180b8c3843030705b', 'admin', '2018-08-17 09:40:56', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('857ac51eb008440fb00c8c5c63313c67', 'admin', '2018-08-23 13:45:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('85804e12bf34403db11795b0addcfbb3', 'admin', '2018-07-13 16:43:09', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('85919802425b4f709220c202de1b4f3a', 'admin', '2018-06-18 11:03:44', '删除菜单ID125');
INSERT INTO `sys_fhlog` VALUES ('859563d853424bdfac3fe3df43aad125', 'admin', '2017-11-18 16:01:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('859624e6b1074d68a54d39bc03b97daa', 'admin', '2018-08-24 14:50:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('85984809424a42f29da8d4b567994fb6', 'admin', '2018-07-13 16:42:17', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('85c26ac19709412e91969a9b69c52b03', 'admin', '2018-08-17 09:58:14', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('85ccafe1c25741bfbb7c32bd96a0dc04', 'admin', '2018-08-17 09:42:03', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('85fd47f212364a5bb4e70da2deabb21b', 'admin', '2017-10-31 16:48:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('860437e13d1a4c648977521672774eb5', 'admin', '2018-07-13 16:43:32', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8604e139e86e4977880e969a00ab0e5b', 'admin', '2018-07-13 16:42:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8615fc2a41724f8aab2456b1b21b4773', 'admin', '2018-07-12 10:35:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('86160237fa284472b73a3dc403a806cb', 'admin', '2018-08-11 10:03:59', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('86381a22fcb94d52acf836da704aee6d', 'admin', '2018-07-13 16:41:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('863ee7c13ca240688992e38bd4880aee', 'admin', '2018-08-17 10:39:42', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('86575660c26d44a08d24b698909284c6', 'admin', '2018-07-12 17:18:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('867753e6a7724bd7a57f5e0bf2d0e40e', 'admin', '2018-07-13 16:42:16', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8684e4c9f0c6455aa820421f4dedfb12', 'admin', '2017-11-09 15:00:44', '修改菜单增加地址');
INSERT INTO `sys_fhlog` VALUES ('86994c9969774f708c9957f6fb6cc71b', 'admin', '2018-08-15 10:27:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('869a72cc6b194110bb22ffebd1feb45b', 'admin', '2017-11-10 20:11:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('86a48b617fa24f058708c8b4c9d33875', 'admin', '2018-08-23 17:33:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('86afaab602004ad4923c32adfc200ef1', 'admin', '2018-01-22 10:42:30', '修改菜单日志管理');
INSERT INTO `sys_fhlog` VALUES ('86b64c0c0f954d2ba01b18adc015a680', 'admin', '2018-07-28 15:22:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('86b71e833b4a4d6bab1ab90200b4cd8d', 'admin', '2017-11-06 20:17:15', '修改菜单合作伙伴');
INSERT INTO `sys_fhlog` VALUES ('86c1a14e539b467d8d3654c939788eb8', 'admin', '2018-08-17 09:40:00', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('86c68d84d6704cefb034e7f8ccf5da47', 'admin', '2018-08-08 14:13:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('86ec9529c0b74b589b711fcb6c8089ef', 'admin', '2017-11-09 11:48:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('86ffe74e6cb9492ab037f9b4dcfcb7c1', 'admin', '2017-11-10 17:34:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8702542c85d74faca5176ff4e2da3755', 'admin', '2017-12-12 14:11:33', '新增合作商家：null');
INSERT INTO `sys_fhlog` VALUES ('87086200a9624d46892945f161bcefff', 'admin', '2018-08-22 11:44:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('871087edd43f4e599bd5e60472a6e3df', 'admin', '2018-08-06 16:04:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('872f7c91aeca4ea9969c5def23acca02', 'admin', '2018-08-23 10:09:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8741cfc17adc495d94bcddf9e2adf50e', 'admin', '2018-07-13 16:41:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('87456d0f09754533a44974412dfd0a1f', 'admin', '2018-08-08 14:14:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('874ad7b7ef4447cfbf367a96b1ca21ae', 'admin', '2017-08-18 09:41:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('874be8c12c42459db7dfe1e631c02927', 'admin', '2017-10-05 13:37:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('87631ff808b94f169a015857bab16faa', 'admin', '2017-12-08 09:28:20', '退出');
INSERT INTO `sys_fhlog` VALUES ('876367f90f064f60ad25e30f2ea8c349', 'admin', '2017-08-31 15:20:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('877843ed642d4914a7c42721eecbe2b9', 'admin', '2018-08-25 10:21:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('877ba8803ba8481795950b57b1449cda', 'admin', '2018-01-25 18:03:17', '退出');
INSERT INTO `sys_fhlog` VALUES ('878a0f82910b46db87738991fc05dd43', 'admin', '2018-07-13 16:42:42', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('878efe51c4a6415185a0b2ea265d7852', 'admin', '2018-08-23 17:33:14', '修改菜单帮助');
INSERT INTO `sys_fhlog` VALUES ('87a2b3ef3a624991a55204c25719056d', 'admin', '2017-12-06 20:23:44', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('87c7f863a2e64c98a314d7f3c584f3ac', 'admin', '2016-06-06 02:27:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('87cba708f2954abd9cb7929590a674eb', 'admin', '2017-11-21 20:10:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('87d20072fcf84607812149c8dae330ba', 'admin', '2018-08-16 18:05:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('87da3023f7914376a81b96c3a8b4d49e', 'admin', '2018-08-17 10:38:43', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('87f1e80215f0406f937deba88d648add', 'admin', '2018-02-07 16:44:44', '修改edit_qx权限，角色ID为:3');
INSERT INTO `sys_fhlog` VALUES ('87fd2a2021004309b7f79b1b39c1f6b5', 'admin', '2018-07-13 16:43:00', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('880ff9ec40104606b842ee62c853c5bc', 'admin', '2018-07-13 16:44:18', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8827d27267494720a322a439e53b93f4', 'admin', '2017-11-08 19:56:57', '删除菜单ID90');
INSERT INTO `sys_fhlog` VALUES ('8830ca879f1f4c2a817f7e3695c76156', '18990673099', '2018-03-10 22:15:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8834426030a44017973f6ff8d15a9656', 'admin', '2018-08-16 17:59:22', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('885a00fa41174c4e99b2be08af2de1c4', 'admin', '2018-08-16 17:59:21', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('885ee7c2b43d42028602c024310cf42e', 'admin', '2018-08-22 15:00:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('88634cc920454939a356d64d5a1a1143', 'admin', '2018-08-16 18:05:29', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('88881f311ada4339b0de7b9a2233c2b8', 'admin', '2018-06-08 15:39:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('889507bfacf1499d81176a47d1c48c0c', 'admin', '2017-12-15 10:10:14', '修改菜单系统管理');
INSERT INTO `sys_fhlog` VALUES ('8899f9c2954d49a986f6ec4859a32bf4', 'admin', '2018-08-11 12:03:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('88a50da38a0a45ae8ac8c68c7cd3c894', 'admin', '2018-07-13 16:43:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('88a5cb0903ed4be79dca8b74854fdf44', 'admin', '2018-07-13 16:42:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('88b2e8e3773c4523af4df4ad2a5e03a0', 'admin', '2017-12-08 09:35:10', '删除按钮权限PageData [map={BUTTON_ID=4efa162fce8340f0bd2dcd3b11d327ec, ROLE_ID=de9de2f006e145a29d52dfadda295353, guid=1512696910178}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@163ad8c]');
INSERT INTO `sys_fhlog` VALUES ('88e4332e0d074032ae9e5d3248d038f4', 'admin', '2018-07-25 16:23:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('88ea1225a0ce41d185e5bd6221afe2b4', 'admin', '2018-07-13 16:42:24', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('88ef053a56954b519e54e8308e05d8b2', 'admin', '2018-08-09 14:20:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('88ef5e997d844eb9a1be93f8b3e69e1d', 'admin', '2018-08-17 10:32:05', '退出');
INSERT INTO `sys_fhlog` VALUES ('8914c98cab714180b529a8d02bf3da02', 'admin', '2018-08-10 10:59:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('894015c86f304a6e920433e3f666933e', 'admin', '2018-08-04 14:54:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('89636c1569f148bc8b275030c477f03e', 'admin', '2017-10-10 15:22:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('89693d64948941ae8e0dc77b1a9c5ab2', 'admin', '2017-10-26 10:49:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8973e19e06424f3dbf024fd09a044083', 'admin', '2018-08-10 16:56:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('898de5d6410f42679176837e6eff1346', 'admin', '2018-07-13 16:44:35', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('89b064b1839046f89d4c8c1433c9bdcf', 'qq728971035fhadmin', '2017-08-04 09:22:03', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('89bbfd8c886a488c9e1f01113be528bb', 'admin', '2017-09-02 21:59:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('89bd1213dba545daa9edf27f6300ab24', '18990673099', '2018-03-27 20:22:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('89c5a2a1cd544ae2a47095d0f1c5e5a5', 'admin', '2018-07-13 16:42:23', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('89e69087ddfa42ca994c3a75da645039', 'admin', '2018-08-17 09:48:59', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('89ec9660d737456095d44802789c00d4', 'admin', '2017-12-16 11:31:27', '删除系统用户：PageData [map={USER_ID=3362853df6384ae398e6ed4b7b455109, tm=1513395087732}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@7edfb1]');
INSERT INTO `sys_fhlog` VALUES ('89f22bcf889646fa87d7000d2702ca68', 'admin', '2017-11-04 09:27:01', '新增角色:下单人员');
INSERT INTO `sys_fhlog` VALUES ('89f72d69d0a34eff980c128f0d5309ca', 'admin', '2018-08-17 10:37:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8a08591d79174a1684091296c90cc6a7', 'admin', '2018-08-17 09:45:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8a0aceb2997c4e358533ecd8ee51ca96', 'admin', '2018-07-31 17:03:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8a0e684f786f4882a42f8f2971ad52b8', 'admin', '2017-08-03 11:34:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8a15c5f3679844598ebf65cb5e4963c9', 'admin', '2018-08-16 18:05:29', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8a1a00e2c2f945a3951c2346b740e628', '18990673099', '2018-03-02 07:17:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8a1be958031146c6b234c536284f4d8e', 'admin', '2017-11-15 17:11:03', '修改金额提成:0');
INSERT INTO `sys_fhlog` VALUES ('8a246754269544fa8ff22fc73726aa63', 'admin', '2018-01-13 16:43:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8a27979b7534421b9336ea93e84317dd', 'admin', '2018-08-17 10:03:18', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('8a2a5f07719b46998cea6821bcec5395', 'admin', '2018-08-11 15:14:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8a30acffd07c4b08a33cff5085353471', 'admin', '2018-08-17 17:30:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8a31eab3334d491384e00cd346d3de05', 'admin', '2017-10-31 11:36:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8a34c16e16634c429bc1165bdf80f0b4', 'admin', '2017-11-28 14:57:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8a49562f4a314decaca35fd0205f8307', 'admin', '2017-09-02 15:55:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8a58a1db338d402299333c3542b20055', 'admin', '2017-08-09 10:17:18', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('8a5a2cfc50cf4bb9aa731f372bbf3ec5', 'admin', '2017-10-12 09:38:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8a5d52f5d4494f8abce800df67b331ae', 'admin', '2017-08-26 21:33:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8a5f1d09f31c4314bc5274b532602570', 'admin', '2018-07-13 16:44:32', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8a81988aa29a42aeb277fdbab4519aeb', 'admin', '2018-07-13 16:41:50', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8a8b35faa2164babaf71adf2ade5acd0', 'admin', '2017-11-22 14:28:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8a92b010d8164d8784a9cfd6e00fe997', 'admin', '2018-01-31 10:33:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8ab62381e023401aaa3811fdbf87353a', 'admin', '2018-08-10 17:48:18', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('8ab950e23f6c41b3814aa9443013feee', 'admin', '2017-11-27 13:08:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8ada5031761944a0a04c0a9ed78df0d7', 'admin', '2018-07-13 16:44:15', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8ae1b2faeb1c44dab276b0a36ec5171f', 'admin', '2017-12-14 17:43:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8ae64131736a49f5810c4931117f187e', 'admin', '2018-08-17 10:01:12', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8ae898eb4c7f4722b9eaa148760f9d0a', 'admin', '2018-07-13 16:44:26', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8ae8ae901ca542e0af25ff60ca637df4', 'admin', '2017-09-04 16:34:36', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('8aea6a1503b5401da6943ec045ef01a1', 'admin', '2018-08-17 09:39:59', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('8b093af179894e9f8853a5a96f819308', 'admin', '2017-11-29 13:04:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8b09791a9f2743fdaec862c06a5194d0', 'admin', '2017-12-08 09:35:11', '删除按钮权限PageData [map={BUTTON_ID=cc51b694d5344d28a9aa13c84b7166cd, ROLE_ID=de9de2f006e145a29d52dfadda295353, guid=1512696911050}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@1afb97c]');
INSERT INTO `sys_fhlog` VALUES ('8b116cf906fa4b549415e61a33230aea', 'admin', '2018-08-23 17:33:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8b23187929cb418286b9b77935bde93b', 'admin', '2018-08-17 09:48:23', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('8b3441cd3f0d475fa732c118a5a807c1', '18990673099', '2018-03-17 10:31:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8b44a3a0a7214b09b714c338d91ad572', 'admin', '2018-06-18 11:05:14', '新增菜单菜品列表');
INSERT INTO `sys_fhlog` VALUES ('8b541c4ee7664ff9ab76be984b0c13ed', 'admin', '2018-08-10 17:48:18', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('8b57e1a1e7744407bd38b1841e767c16', '18990673099', '2018-03-10 10:47:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8b598eba05204190a546a746f1b5097a', 'admin', '2018-08-16 18:04:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8b5f90a9a325471dba3ba7f239033e54', 'admin', '2017-12-06 09:55:09', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('8b6591803775414b9118b8680fe21fa6', 'admin', '2018-03-05 16:19:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8b65ecac7c954e47a684f1acf4d601b4', 'admin', '2017-07-31 20:40:56', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('8b805f54b8804c7ea3dc27593c80686f', 'admin', '2017-12-09 15:08:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8b82864983c4471389506f69ee1e9fbb', 'admin', '2018-08-23 10:09:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8b838226748d4ed58551301018df4c2f', 'admin', '2018-07-13 16:43:28', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8b9aa1de67974ad29d2a6d123d7e647c', 'admin', '2018-01-05 15:34:39', '退出');
INSERT INTO `sys_fhlog` VALUES ('8ba70f31ed8f4df4863a3610b346bb30', 'admin', '2017-12-02 16:20:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8ba729909b814f6fa12a7e54cfeaaed9', 'admin', '2018-08-17 09:58:14', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('8bafa25f84eb426abb1e680280625722', 'admin', '2018-08-15 10:25:45', '退出');
INSERT INTO `sys_fhlog` VALUES ('8bb0fc656a134926927346e752e59547', 'admin', '2018-05-24 13:29:40', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('8bb53efe411b4b8a9d7ed4ec618e1698', 'admin', '2018-01-29 11:17:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8bbbd63279b841a48819256a36c2cc30', 'admin', '2018-01-17 13:45:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8bc5167dff0b466c8f83c647d40f7db9', 'admin', '2018-08-14 09:22:10', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('8bccf0d054af49d3b6479757ece6ec70', '18990673099', '2018-03-11 12:10:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8bcd3495fb234622a7da78ed621d38fc', 'admin', '2017-08-03 16:29:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8bd825628d44433d8409eaeee9f19b19', 'admin', '2018-08-17 10:06:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8bd922e80e504285b597d3f35f57d507', 'admin', '2017-11-22 18:42:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8bdf81ea00514f8fb75aeb6be431bdea', 'admin', '2017-09-14 10:14:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8bff9095fce84b11811c2f1e80eb257b', 'admin', '2018-08-17 17:11:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8c1dc5b1c03646c5aefd1e3a7dcd8fd3', 'admin', '2017-12-08 09:35:05', '新增按钮权限pdPageData [map={BUTTON_ID=da7fd386de0b49ce809984f5919022b8, RB_ID=b1431c2f5db646639087b6ed86a20a76, ROLE_ID=68f8e4a39efe47c7bb869e9d15ab925d, guid=1512696905292}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@f2b4f5]');
INSERT INTO `sys_fhlog` VALUES ('8c1de42e43e043e2a9f461f37bda41a8', 'admin', '2018-08-15 10:26:35', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8c25dca874d94d16962e01dc2ea90a28', 'admin', '2017-11-17 17:41:55', '新增合作商家：null');
INSERT INTO `sys_fhlog` VALUES ('8c2c6f0ee6ad4938a65c3bcbf7f1f7e9', 'admin', '2017-11-24 09:48:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8c3028f3623f4394ab8647f65bde2ae6', 'admin', '2017-12-09 14:40:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8c3f865d215340efb84f882df153309e', 'admin', '2018-07-13 16:44:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8c4b1c5753174aec9a9fdb22f1d1622d', '18990673099', '2018-03-18 19:35:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8c5293e905634a7f9b904c1ac9e50fc6', 'admin', '2017-09-02 21:58:32', '修改菜单添加洗护');
INSERT INTO `sys_fhlog` VALUES ('8c622aa893dd416880bbc89280444500', 'admin', '2017-03-29 00:16:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8c816010c2954a9ab324fb83257f8d54', 'admin', '2018-02-05 09:43:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8c858e4ad5be4dbca1747a97f7a186ff', 'admin', '2018-07-27 10:26:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8c88aed063bc42f8887a3fd47b4a129b', 'admin', '2018-08-17 10:09:45', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('8ca34df58cda46ea85717422c339ce7d', 'admin', '2018-08-25 10:41:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8ca9eddb99c74a2e9edc954bbfaa2091', 'admin', '2018-07-13 16:42:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8cbde35730b94183a5792f4eb022df24', 'admin', '2018-08-17 09:42:02', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('8cbf2e1b11f64df88a18d2ceb4e9abeb', '18990673099', '2018-04-01 13:31:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8cc0506876e7453eb07fea073a97da96', 'admin', '2017-12-28 14:10:22', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('8cc79b288e4b4e7bb98c4c015b3bc474', 'admin', '2018-07-13 16:43:22', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8cded372a656405f869d22f16fd231bb', 'admin', '2017-08-31 15:30:15', '新增菜单添加洗护');
INSERT INTO `sys_fhlog` VALUES ('8ce79213069c4ddaa0955c8cde6444af', 'admin', '2017-11-21 14:12:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8d0d7ba727354490bfc2b8b886ecaf9a', '18990673099', '2018-02-28 16:43:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8d15c881da034ae3bbed5468250bf315', 'admin', '2018-08-10 14:32:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8d228c21d84443b881bed31b5c1352a8', 'admin', '2017-11-17 17:47:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8d2d9eef333e48a4bf9ab321410beaff', 'admin', '2018-01-22 10:25:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8d49bc2a92f6452188ebb3baa9a8f058', 'admin', '2018-08-17 09:40:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8d5e2b39e0a44c68b84ac390045c985f', 'admin', '2018-08-17 10:39:42', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8d68029567df4f8c8db2005d06026245', 'admin', '2017-07-29 22:14:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8d7b29da94a64190b6e61d77fa1db89b', 'admin', '2018-08-17 09:48:57', '修改菜单建议管理');
INSERT INTO `sys_fhlog` VALUES ('8d7ee7155f844e3ea883b8906e32baee', 'admin', '2017-11-04 09:28:05', '删除角色ID为:c4a5a4d2901a4d499334055bdad7b4d5');
INSERT INTO `sys_fhlog` VALUES ('8d95a3f57de045379d2b888186d6ab16', 'admin', '2018-08-17 10:38:45', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('8da3ebb5e05b4cbaabd8e0fd5a0dda5c', 'admin', '2017-12-16 11:32:07', '删除角色ID为:9abe1068d5bb4595b024d92c64e8e834');
INSERT INTO `sys_fhlog` VALUES ('8dbafd373e0443648b56316bcd58a79d', 'admin', '2018-07-13 16:41:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8dd78caea58149b39837aef4cb8025e5', 'admin', '2017-11-09 15:34:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8de2e9171eac4cd7b6a4801e7b7d08c2', 'admin', '2017-11-09 15:00:48', '退出');
INSERT INTO `sys_fhlog` VALUES ('8df5ae95143a46fbb68a62e911115a67', 'admin', '2017-08-05 09:39:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8df98636274945d9b4bbaca955706e11', 'admin', '2017-11-04 12:01:14', '修改角色:客服');
INSERT INTO `sys_fhlog` VALUES ('8e002767c5b048da86a7dabf0a2d0092', 'admin', '2018-08-10 17:42:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8e11424bd78e47aeb21a4fd24cb47314', 'admin', '2017-12-16 13:18:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8e115d365d86434c8ecd1d52ff3a739e', 'admin', '2018-02-01 13:43:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8e1a17914ab34221aab880fc6e2073df', 'admin', '2018-08-17 09:58:13', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('8e2b5e8e734d4395a02f0788d3675b83', 'admin', '2017-12-28 14:29:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8e51f7d528f2476ea6cb4f481cbc1af4', 'admin', '2017-08-04 09:27:06', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('8e531501ed2944b6a121e1e35658354c', 'admin', '2018-08-17 09:40:55', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8e631651a4ac4404986e4deb5d1d1952', 'admin', '2017-12-15 10:10:06', '修改菜单数据库管理');
INSERT INTO `sys_fhlog` VALUES ('8e673fb36fab4d968e1de0ab932d8f9b', 'admin', '2017-11-08 11:12:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8e88cf5a380f43d884847dd18dabfc9f', 'admin', '2018-07-13 16:42:30', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8e88e04c01f8402a88a9944c5c747205', 'admin', '2018-07-13 16:42:48', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8e8b1c9f2cb94645be154c46cc2ceef9', 'admin', '2018-08-23 09:58:09', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8e8b1f137e0540b4beccde917bfcb0a9', 'admin', '2018-08-15 10:32:43', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('8e9bdaadfa4945f9b33e94f21860084c', 'admin', '2017-11-24 09:44:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8ea9675480294f84af3d5acd21dd0316', 'admin', '2018-07-31 19:13:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8eb609d8eade4a658a59f363654f5a00', 'admin', '2018-08-13 18:23:36', '退出');
INSERT INTO `sys_fhlog` VALUES ('8ebccffca6da458aab918b4bf3aa3689', 'admin', '2017-07-29 21:48:09', '新增按钮权限pd{guid=1501336089605, BUTTON_ID=46992ea280ba4b72b29dedb0d4bc0106, RB_ID=cda7a2dd3cc54772895720b949db2141, ROLE_ID=115b386ff04f4352b060dffcd2b5d1da}');
INSERT INTO `sys_fhlog` VALUES ('8ebec7ac2b0c48dabac6cbc3670c88c6', 'admin', '2018-08-17 10:37:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8ecaa7b63cdb41ddb1252ff3b8cb9f7a', 'admin', '2017-07-31 21:46:36', '新增菜单订单管理');
INSERT INTO `sys_fhlog` VALUES ('8ecfe9565c764efb82931fdd75da7e41', 'admin', '2018-08-23 17:29:52', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('8ed982f828e44a4e81d610acff757c7c', 'admin', '2018-07-13 16:42:17', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8ede6cd4d6be4d4abb37ed00c34d5916', 'admin', '2017-12-11 18:07:01', '修改角色菜单权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('8ee852c59db744c8ba1f2e2bc3a80127', 'admin', '2018-07-13 16:42:48', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8efccd78d26d417e973d8eb387ae4ceb', 'admin', '2018-08-15 10:32:14', '退出');
INSERT INTO `sys_fhlog` VALUES ('8efdf6c94b384f509116ea9661b46cb4', 'admin', '2018-08-15 10:32:43', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('8f036258494b45b790d475be32c12386', 'admin', '2018-07-13 16:42:42', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8f05176966b64d00a30854332da2e190', 'admin', '2018-07-13 16:42:02', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8f14300c64ee423299de5613bc986735', 'admin', '2017-08-02 21:51:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8f1f8be8a80d46afaafae96aed1e84f0', 'admin', '2018-08-17 09:58:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8f23faba583f4840987ba32af3502daf', 'admin', '2018-08-10 15:18:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8f303a3ca16546f08afa1af83986c2ae', 'admin', '2018-08-23 17:33:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8f3e5e0ecb5844d0940b14e723149260', 'admin', '2017-12-08 09:35:22', '删除按钮权限PageData [map={BUTTON_ID=4efa162fce8340f0bd2dcd3b11d327ec, ROLE_ID=115b386ff04f4352b060dffcd2b5d1da, guid=1512696922618}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@8330ce]');
INSERT INTO `sys_fhlog` VALUES ('8f555a4dfdec4162b68d011712329bcc', 'admin', '2018-08-17 09:42:03', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('8f6bcf0432364587a8b9f558e47dfa62', '18990673099', '2018-05-04 10:26:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8f7c015d1c8f4fb5991f8f11a703794d', 'admin', '2018-06-18 11:03:42', '删除菜单ID129');
INSERT INTO `sys_fhlog` VALUES ('8f8fc5c968774c00b3f50000dd41d014', 'admin', '2017-10-15 12:13:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8fa2049c016449f8bfc19a8648d33813', 'admin', '2017-10-09 18:11:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8faf9bb9500b4cd7ad8e4341645fd82f', 'admin', '2017-09-04 16:34:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8fb10326f07e469297df42ea9857beef', 'admin', '2018-01-22 13:11:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8fb11538c3a340dd88624a613ad7bcc9', 'admin', '2018-07-13 16:43:53', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8fb368d0ac514f3587eaff7943fc64f5', 'admin', '2018-07-13 16:42:35', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8fb3c3a3b3214884a0337dd9547e3645', 'admin', '2018-08-06 10:57:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8fb88226523f49218e15b70b6ca6e1ea', 'admin', '2017-12-16 11:09:01', '删除菜单ID92');
INSERT INTO `sys_fhlog` VALUES ('8fbabfe303684a05b726ea0b9948e54e', 'admin', '2017-11-27 10:49:17', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('8fbac096a0f6464781df9b9b4158e2d3', 'admin', '2017-12-08 09:34:35', '修改edit_qx权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('8fcadbb30acd45e596cef9c61dc20c66', 'admin', '2018-08-10 15:11:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8fcdd946ea234405b5ebe0b8fcb25962', 'admin', '2017-12-14 19:12:22', '修改菜单商家管理1');
INSERT INTO `sys_fhlog` VALUES ('8fcfa22de205400cb2cc9e0860a80c9a', '18990673099', '2018-03-04 11:56:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8fd308cb27ae4deea4467c03c9a850d2', 'admin', '2017-08-03 11:09:09', '新增菜单商品类别');
INSERT INTO `sys_fhlog` VALUES ('8fe6aafccf264e5ca1c60c76e48f669c', 'admin', '2017-10-31 16:52:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8feacb5a247f4f7b992ca02784c881ae', 'admin', '2018-08-21 11:03:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8ff1f8a17d184c7ebf8ce3056a023bfc', 'admin', '2017-08-09 15:28:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('900f9e0c56a34a40839a797dc2835466', 'admin', '2018-07-13 16:43:17', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('90130ee19c654e33a4fb284d88a36869', 'admin', '2018-08-13 12:28:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9018aa2902c044b8b8aac31ec83bfce8', 'admin', '2018-07-13 16:42:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('901a8b9109ae49f5a0e749e85f09a40f', 'admin', '2017-11-30 11:22:21', '退出');
INSERT INTO `sys_fhlog` VALUES ('9032b88751c94789942bb2f2c540a8c9', 'admin', '2018-01-30 11:32:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9045a2fe9037459bb1c4b6b00b219539', 'admin', '2018-08-17 09:47:37', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('905cadd055b847cb9dce295861a1dbf2', 'san', '2016-06-06 02:29:18', '修改角色菜单权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('906c4497aa9c44b0bb8d51f664aa08a8', 'admin', '2018-08-23 17:29:54', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('906f8d9b62c74743b1daa695c7b65b11', 'admin', '2018-08-23 09:58:08', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('90723bc93c29420b88f1cfe47d96c2cc', 'admin', '2018-08-10 17:14:25', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('90861bbd5b1d4904bb5ae0d750fb363b', 'admin', '2018-08-15 10:32:42', '新增菜单新增店铺');
INSERT INTO `sys_fhlog` VALUES ('9093b13e653c451e8552e79b28eed7ca', 'admin', '2018-08-23 17:31:00', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('90a8ee5781454074b74c5b57aa8c426a', 'admin', '2018-07-13 16:43:10', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('90acc208c3db4d98ae606fb6e677a8fd', '18990673099', '2018-03-26 10:13:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('90bb1cf768c84f7697cbffa30b8283ad', 'admin', '2018-07-28 18:59:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('90c957cd7ccb4485b90308b8a94e3d19', 'admin', '2017-12-05 09:35:32', '新增角色:设计师');
INSERT INTO `sys_fhlog` VALUES ('90ca14b67f624230b3cf90b724b50467', 'admin', '2017-12-29 15:09:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9102bb0ab8e2481eaf0618bcd8e5f34b', 'admin', '2018-03-02 19:41:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9105bae1e14a484cbdd3eec6708a7a33', 'admin', '2017-12-15 11:02:33', '修改金额提成:1');
INSERT INTO `sys_fhlog` VALUES ('9108c67a6fc64498905f6a3616329909', 'admin', '2017-11-07 11:43:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9127f9efa2864c45a31c01dec4f84233', 'admin', '2017-11-27 10:47:42', '新增菜单查看商家');
INSERT INTO `sys_fhlog` VALUES ('912b823281d646c891bf53a078b5a799', 'admin', '2017-09-03 15:58:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('912e6c3382fc40368973f4deeaa4f5e0', 'admin', '2018-07-13 16:43:04', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('91524fd8c56143459652c2200f33bab1', 'admin', '2018-08-03 12:05:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('916b4a8443434ae6a800087f8629e111', 'admin', '2018-08-02 12:05:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('916c1eff88c746aa9a19dfebd27c034d', 'admin', '2018-06-11 13:16:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('916e436245ea4a6b930089cf274b2f8d', 'admin', '2017-11-03 17:03:03', '新增角色:员工');
INSERT INTO `sys_fhlog` VALUES ('918b794cb5db4cee8a7e31ce371121bf', 'admin', '2018-01-02 09:28:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('91bd369ea72f44729ae3dbf414a63b06', 'admin', '2018-06-21 21:26:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('91c35d0e95f748ee8fdbb7cd4bc471a9', 'admin', '2017-11-08 14:42:59', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('91ce86e4d6454b38b226dfd92d6cc7ac', 'admin', '2018-07-13 16:43:43', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('91d0edbd808c45e4959f1ec153eaa6f2', 'admin', '2018-08-17 10:03:19', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('91d14081c12b43218e21b4ec09084abe', 'admin', '2017-11-15 17:15:31', '删除角色ID为:b031a1c95de24553931c5fe59e6e880d');
INSERT INTO `sys_fhlog` VALUES ('91d45df86a3841b4a66f61da34e031c5', 'admin', '2017-03-16 01:00:05', '退出');
INSERT INTO `sys_fhlog` VALUES ('91d832aa65e8434397620a5ceba8cad7', 'admin', '2017-08-18 07:10:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('91dc5d35a5fb49718e9ba61caf7bb46c', 'admin', '2018-08-17 10:09:47', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('91e5702537244665ab9a274e434f02d9', 'admin', '2017-07-31 20:19:00', '修改角色菜单权限，角色ID为:68f8e4a39efe47c7bb869e9d15ab925d');
INSERT INTO `sys_fhlog` VALUES ('91e63679c23645f2a59b9fdfc1f377e1', 'admin', '2018-08-16 17:59:20', '新增菜单建议列表');
INSERT INTO `sys_fhlog` VALUES ('91e71e037fc041bcb78ec9495e76c867', 'admin', '2018-02-05 11:53:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('91ea3f310840466b882c2784bd8c05d4', '18990673099', '2018-03-06 13:02:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('91f8834a2af4446d8098998c0fb281e8', 'admin', '2017-03-16 01:01:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('921234c28680403098fb9c18a1fbcae3', 'admin', '2018-07-13 16:42:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('922773f50a0948188e3e8b729648159b', 'admin', '2017-03-16 00:46:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('923754fe23c64e22b71cf8a3bb9efd68', 'admin', '2018-01-28 19:43:36', '修改菜单红包领取');
INSERT INTO `sys_fhlog` VALUES ('923ed8f33667469194b34f3654a25849', 'admin', '2018-01-25 11:49:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9243198511bc406d90b3ef65d7b6abad', 'admin', '2017-11-23 16:55:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('924b8cc068114f5986185db29e67b616', 'admin', '2018-08-18 17:51:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('924e3124a01b4a01a35cc01bdeec2752', 'admin', '2017-11-11 09:18:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('92662efa8286443088a3c728b9bf0aaa', 'admin', '2017-09-08 11:27:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9274222b05ea42a99c40c470b90ae0f9', '18990673099', '2018-03-15 08:53:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('92775bf2716d436c89477b4ea0637cd6', 'admin', '2018-07-11 10:42:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('92856c872cfb45d9ba4385b5a4208d46', 'admin', '2018-01-25 11:49:33', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('9292cc06784b430283268368978bd0e8', 'admin', '2017-11-03 17:02:03', '新增角色:提成');
INSERT INTO `sys_fhlog` VALUES ('92a82361dde348a4aa8cb7f5c1ce7819', 'admin', '2017-07-31 21:20:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('92aa0842c02b416db73b86c8efe2f681', 'admin', '2018-08-14 09:22:07', '新增菜单订单管理');
INSERT INTO `sys_fhlog` VALUES ('92b9968c40a54778a8791f17f3debc7f', 'admin', '2017-11-24 09:52:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('92c0939b9edc4df5a82ff2c631c0e97d', 'admin', '2018-08-10 17:14:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('92c0cb9ec20f4be2908a3575e732831e', 'admin', '2018-07-13 16:42:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('92c575995af94015985d83e7984e7eab', 'admin', '2017-09-01 17:04:55', '修改系统用户：admin');
INSERT INTO `sys_fhlog` VALUES ('92c6bfa4f7d340e6b0765fcadff44fde', 'admin', '2017-09-20 13:39:55', '新增角色:分店店主');
INSERT INTO `sys_fhlog` VALUES ('92cac6d035b24c7eae2b19c775c1a3e8', 'admin', '2017-11-23 12:35:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('92e5ad43ea1c48a9a2f671cdbc14541d', 'admin', '2018-08-23 17:33:16', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('92e672f57f464cc6a37419d5b752f227', 'admin', '2018-08-15 10:22:44', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('9301fad9cbcd4f73aa6f29c5cf929b5c', 'admin', '2018-08-02 16:16:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('93075ba3e77e4de09848b609a81b10ce', 'admin', '2017-12-08 09:34:25', '修改del_qx权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('930b191f6eda442d8b7e78245e930b31', 'admin', '2018-08-16 18:19:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('931c88446805476db067e0704e6d9aae', 'admin', '2018-08-25 11:03:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9322010141cb439c9fc58312ed814dac', 'admin', '2017-11-15 17:08:50', '修改金额提成:0');
INSERT INTO `sys_fhlog` VALUES ('932b0a78187f40758f66428c2c44d943', 'admin', '2017-11-07 11:34:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('933458a8f4264962874ccdaa3acbc02a', 'admin', '2018-07-25 17:09:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('93649d78532c4453b6b1bcd97ced3d21', 'admin', '2018-07-13 16:42:29', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('93691360e5b1444ca19d09dbcc90bbc7', 'admin', '2018-08-16 17:56:28', '退出');
INSERT INTO `sys_fhlog` VALUES ('93790e425eca42299a0aa8042aab21ca', 'admin', '2018-01-27 09:39:29', '新增菜单活动记录');
INSERT INTO `sys_fhlog` VALUES ('9379be629d704d039bab1ce0bb947743', 'admin', '2017-10-31 10:41:39', '新增菜单尺码管理');
INSERT INTO `sys_fhlog` VALUES ('937b282a03e94496abb240b3e2e3031a', 'admin', '2018-08-23 17:33:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('937f494f770947dcacc64e8538dd8e30', 'admin', '2018-08-23 17:29:52', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('938c570553fe40808de54732afff2331', 'admin', '2017-11-04 12:00:35', '修改金额提成:3');
INSERT INTO `sys_fhlog` VALUES ('939a13eb9b4041879681fe60da92cdf0', 'admin', '2018-07-28 09:46:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('93c64346fa154c0683105fbb6369e4c1', 'admin', '2018-07-12 17:06:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('93cdb190a1564a1a92ce55fd2926e570', 'admin', '2018-01-22 14:18:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('93d5a421ce154c2a97613de72afaeb03', 'admin', '2018-08-13 18:23:18', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('93db7a9632044704bb8a35456646b832', 'admin', '2017-11-07 10:43:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('93dbeac0108b405ca0da12f4d275e341', 'admin', '2018-07-13 16:42:39', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('94086e004bf64686a7fbe4c61ad4fb1b', '18990673099', '2018-03-21 16:04:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('940c2fe54f684471a6c4c451660deb70', 'admin', '2018-08-10 17:14:25', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('94188d7c07b645ae9e4642e3e4c09903', 'admin', '2018-08-23 14:22:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('941f788f05f24ce4a271072be6a2ef98', 'admin', '2017-11-23 16:28:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('941ff5edd8734339970411f6ae4928fa', 'admin', '2018-08-17 10:40:39', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('942105f5ed5141fbaa9035a57029f65d', 'admin', '2018-07-13 15:38:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('94250b48383d4155b262bff43c91eb2d', 'admin', '2018-08-13 18:23:16', '新增菜单订单管理');
INSERT INTO `sys_fhlog` VALUES ('942da552fe4f4177a585628803f03935', 'admin', '2018-07-13 16:42:46', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('94390b73f73d4d90bd411e40203e67b3', 'admin', '2018-01-31 14:38:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('94411d31d17f4248a2d47b2733058a49', '18990673099', '2018-03-16 23:03:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9450c339f0b34969a9164a305745f6ac', 'admin', '2018-02-05 13:29:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('94711d8c54b14346b8a1f5135eae1ed2', 'admin', '2018-08-17 10:37:46', '退出');
INSERT INTO `sys_fhlog` VALUES ('947ce9a7774d4f3098423a4976b84529', 'admin', '2018-01-31 14:08:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9486a6cf467a46ef99976ce49d366c88', 'admin', '2017-12-16 11:31:22', '删除系统用户：PageData [map={USER_ID=43c0464ce6754179aae9597c4c8232e5, tm=1513395081948}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@14587d7]');
INSERT INTO `sys_fhlog` VALUES ('949e5f539220490c877986fc511089e1', 'admin', '2017-12-14 17:44:02', '删除菜单ID104');
INSERT INTO `sys_fhlog` VALUES ('94a30384094b404797ac800f60db3a71', 'admin', '2018-07-13 16:43:18', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('94ac71ac7b374975b24745b537a10bcc', 'admin', '2018-08-21 18:54:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('94b1fdafad274663a244d2604fffc359', 'admin', '2018-08-17 10:03:17', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('94bd0b4cee4541cdbaf4be523872de45', 'admin', '2017-12-01 09:36:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('94c59fd7e18b4502805bcac04e5e99e6', 'admin', '2017-11-04 11:37:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('94d2665b92194a8ba0d1c7bf9886b141', 'admin', '2017-07-31 21:40:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('94ecd867b7d84202a061684af3a7b1a9', 'admin', '2018-08-17 09:38:20', '删除菜单ID134');
INSERT INTO `sys_fhlog` VALUES ('94ed1a3f398841849e50e04e8d4ecb3c', 'admin', '2018-07-13 16:43:46', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('94f79e9f2b5d43b89a30b9ef5994bba5', 'admin', '2018-08-17 10:12:23', '退出');
INSERT INTO `sys_fhlog` VALUES ('94f8e2f0a8ed4de4aef531d6d210f96a', '18990673099', '2018-03-22 08:23:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('94fc03a497514b5981b2b17677837660', 'admin', '2017-08-31 15:27:44', '新增菜单添加连锁店');
INSERT INTO `sys_fhlog` VALUES ('950a1253aea14f9c9ee15126359c69d8', 'admin', '2018-08-16 18:19:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('950f40da1c1e48b9a640725a64b080f9', 'admin', '2018-07-13 16:42:26', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9511c7e0f7bb4d468c1d0c9c97d0dfc4', 'admin', '2018-07-13 16:42:18', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('95123cc8e49e432891fe6269f5be964f', 'admin', '2018-07-13 16:42:00', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('952471ec2dc14f68b35b39e974f06961', 'admin', '2017-07-31 20:06:54', '新增菜单ASDFASDFASDF');
INSERT INTO `sys_fhlog` VALUES ('953107367ab146f991ba2b6d9f1e501c', 'admin', '2017-09-04 16:34:42', '退出');
INSERT INTO `sys_fhlog` VALUES ('9539dc95b4b0497f84609d058fd8a40a', 'admin', '2018-03-20 22:51:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('954351b5ba944c4fa6a5b478fd89dbd7', 'admin', '2017-10-26 09:48:31', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9549cc3e4e5d429b8bd9c0d497260334', 'admin', '2017-11-07 16:44:52', '删除系统用户：PageData [map={USER_ID=d94b75532cf845a4beeacdb838f8008c, tm=1510044292826}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@1c96d63]');
INSERT INTO `sys_fhlog` VALUES ('9564b483e3ca442bb42f8d9249b401b0', 'admin', '2017-12-25 13:47:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('957377e1e43a4902a68ec83301d7e7da', 'admin', '2017-11-07 09:50:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('959d3987c1864281b8b5827c3c97a062', 'admin', '2018-01-18 11:13:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('95b957743b2d414fb28aa96c96ba96ff', 'admin', '2018-08-10 17:11:00', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('95bd147f5ee2421bb782c125cc12b68c', 'admin', '2018-06-18 11:08:44', '退出');
INSERT INTO `sys_fhlog` VALUES ('95d03ffacc3a48358bd7696570f1850e', 'admin', '2018-08-23 15:00:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('95d93519caa64e5b81edd5f40a48726e', 'admin', '2018-08-02 16:56:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('95d9f2bab05f4b6696b65773ef621820', 'admin', '2017-11-29 09:30:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('95fab853d399493694fb3cb8cf91ce11', 'admin', '2018-08-23 17:33:15', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('95fe9ed63f02482baeb7b9596d094a92', 'admin', '2018-08-17 09:48:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9610291eac674a518a407553603609e2', 'admin', '2018-08-24 14:48:08', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('961969abd9f54fe49fb4bf1f6356c8f7', 'admin', '2018-08-17 09:47:37', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('963c1a601bd44a6489978ab4d79d0da3', 'admin', '2018-08-15 10:26:35', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9641ba2847a2418ba96439b6e6028c22', 'admin', '2018-08-16 18:05:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('96422783063345b3891b97b91115dc76', 'admin', '2018-08-16 18:05:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('965e6003725e42e99c56301cc8bd11fd', 'admin', '2017-11-24 19:41:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('966e9f1a639841e7a8128824d61b98b1', 'admin', '2017-08-03 19:44:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('967d5b22ec8e492d8c28a6da1519c1dd', 'admin', '2017-11-20 17:57:31', '新增菜单订单管理');
INSERT INTO `sys_fhlog` VALUES ('9680bb5b57a74caaaa16dd782f9c4b81', 'admin', '2018-08-17 09:42:16', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('968307d86cac4b289da7463f37a65ca1', 'admin', '2018-08-16 18:02:36', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9688146f506d4ec4a879874c970d25f0', 'admin', '2018-08-15 10:26:35', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('968c8f92a50946e181e3d5530513304a', 'admin', '2017-07-29 21:48:02', '删除按钮权限{guid=1501336082861, BUTTON_ID=3542adfbda73410c976e185ffe50ad06, ROLE_ID=3}');
INSERT INTO `sys_fhlog` VALUES ('96a0e298d5ec4556b5a5d15cb802f1ca', 'admin', '2018-08-14 11:34:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('96afae3b40304ba98e29da68725e2688', 'admin', '2018-08-16 18:19:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('96bd61de91ee459fb449a584635f4c1e', 'admin', '2017-11-03 17:04:54', '删除按钮权限PageData [map={guid=1509699894550, BUTTON_ID=4c7f34b9eed54683957f356afcda24df, ROLE_ID=1b67fc82ce89457a8347ae53e43a347e}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@21ddc391]');
INSERT INTO `sys_fhlog` VALUES ('96be56fafa5f4d869acf13676bb621ac', 'admin', '2018-08-23 17:29:54', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('96bff67b641346bcaad1fc1e086c6722', 'admin', '2018-08-10 17:47:10', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('96d1f7aa76cf450f8bef91e12086d586', 'admin', '2017-12-06 15:36:05', '修改角色菜单权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('96d2daf04d914f4aaac12ef521465eee', 'admin', '2017-08-06 10:07:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('96d56d5d193a4c7785f7463dc93b2b23', 'admin', '2018-08-10 11:22:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('96effff8c8624f0ea683bf74b747cdb6', 'admin', '2018-07-26 19:15:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('96f573c25d9141dab356bf408d07b855', 'admin', '2017-12-08 09:34:49', '删除按钮权限PageData [map={BUTTON_ID=4c7f34b9eed54683957f356afcda24df, ROLE_ID=3264c8e83d0248bb9e3ea6195b4c0216, guid=1512696888971}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@e0200f]');
INSERT INTO `sys_fhlog` VALUES ('96f820df01c5447794c60c3e93d970ff', 'admin', '2018-08-13 13:47:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('96ff7fc69a05442eb10ef8e750e35cba', 'admin', '2018-07-13 16:43:41', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9709f82adb2345bbaf50a8c28a80e38b', 'admin', '2017-11-29 11:13:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('970b2d9a7235407b990fd7082fcc9ae7', 'admin', '2017-11-04 12:04:48', '修改角色:注册用户');
INSERT INTO `sys_fhlog` VALUES ('971515f3a5f145bca346a5e5585c8446', 'admin', '2017-11-18 13:52:12', '退出');
INSERT INTO `sys_fhlog` VALUES ('972d9d9b09444589b818483f5d43a213', 'admin', '2018-07-13 16:43:41', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9734590b9e7040149af0f840d6446a1e', 'admin', '2018-08-18 13:56:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('973c2641220a49898484dc83032138db', 'admin', '2018-07-13 16:43:22', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('974168b33a1049f38f6fd97c53f09aa4', 'admin', '2017-11-15 11:27:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9761b7cda341408a9f7b698c7d31f8f3', 'admin', '2017-11-18 10:36:06', '修改菜单服务管理');
INSERT INTO `sys_fhlog` VALUES ('97730bdf989c4b99b1db87b782cde36f', 'admin', '2017-09-23 18:49:31', '新增菜单导入资料');
INSERT INTO `sys_fhlog` VALUES ('977baeabdf53415397f771f0569e1928', 'admin', '2018-08-16 18:02:37', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('978a17ec2e264294be17ab55a190a175', 'admin', '2017-03-16 01:02:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('979d776c5a6e4814adf310ae79f5b59f', 'admin', '2017-11-04 13:47:24', '修改菜单合作伙伴');
INSERT INTO `sys_fhlog` VALUES ('97a5193744a64e2caf7d25b068773cac', 'admin', '2017-08-02 21:45:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('97a8763092174888bc67e6370af549f5', 'admin', '2018-08-15 16:14:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('97c3b2953c2440f69fc1a127120b71b1', 'admin', '2018-03-01 08:45:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('97c73ddaa28c48b2bd67f72266dabf2b', 'admin', '2018-08-16 18:05:28', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('97d49db04bab4f9bafc676cba8328656', 'admin', '2017-11-07 18:28:29', '删除系统用户：PageData [map={USER_ID=d043d6db585648b7a5c9bcf58d0e8a3d, tm=1510050509086}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@1971c24]');
INSERT INTO `sys_fhlog` VALUES ('97e5b8062f424a5589cdb0bf82ffb484', 'admin', '2017-11-07 17:28:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('97e6dec4c85f446c9b2907b1c274bce5', 'admin', '2017-11-04 12:05:17', '修改积分提成:3');
INSERT INTO `sys_fhlog` VALUES ('981bff2729564b4eaa0994d3202bbd03', 'admin', '2017-11-08 19:56:43', '删除菜单ID15');
INSERT INTO `sys_fhlog` VALUES ('9822709834c546f8a011d1b1a59eda58', 'admin', '2017-11-24 09:38:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('982769f7a2d84cb8af30b49161266698', 'admin', '2017-10-09 17:43:15', '修改角色:前台接件师');
INSERT INTO `sys_fhlog` VALUES ('982ea6ee176247cfbe8edf8ced700d32', 'admin', '2018-08-17 09:45:59', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('983ed3ce3067499aabfcdd2e4519d122', 'admin', '2017-07-31 21:50:24', '删除菜单ID71');
INSERT INTO `sys_fhlog` VALUES ('9864fd5c5a774a8a959021c435b242ea', 'admin', '2018-08-13 18:30:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('988b6d6fa612448093bd8c5115392a2b', 'admin', '2017-11-23 16:37:59', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9899c597aaa34cfc8c2eac0c9eb82a00', 'admin', '2018-07-13 16:44:04', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('989f6c41f0ac457d92159934aa13e58f', 'admin', '2017-08-03 11:30:51', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('98aff39e05844b75a4ce29145ffe4839', 'admin', '2017-12-08 09:35:00', '删除按钮权限PageData [map={BUTTON_ID=46992ea280ba4b72b29dedb0d4bc0106, ROLE_ID=3, guid=1512696900249}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@16ce693]');
INSERT INTO `sys_fhlog` VALUES ('98bce7f9e08a43939cc1c76097200e4a', 'admin', '2017-08-29 17:56:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('98cef5b454b0472e96c2cb3c4e688c49', 'admin', '2018-08-17 10:06:50', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('98dd677f246948c08c2fec4ef44e54af', 'admin', '2018-03-15 17:35:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('98eb55c775cb466c9e8c999276f729b0', 'admin', '2017-12-06 12:47:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('98f2ab1dd0fd41cb8d178965ace23368', 'admin', '2018-08-17 09:40:56', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('98f9ef571f5144a18c12cf74a89d3def', 'admin', '2018-08-17 09:45:59', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9901da717f804427b5cb13a421a61e4d', 'admin', '2018-04-17 12:58:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('99084af457454cefa5a38410b081a02e', 'admin', '2018-07-13 16:42:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('99094af4de7f40ee9995f8c095896e27', 'admin', '2017-08-03 22:29:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9917b20feb83453fb52b9f2e8877da3c', 'admin', '2017-12-14 09:24:31', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('991a21b3d31d4ed8860b91d0ae9b2675', 'admin', '2018-08-23 17:33:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('991e02ddec274655bd7b4ccc97a191f2', 'admin', '2017-08-29 15:45:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9931459d543a41bd9fcca90e8903ecef', 'admin', '2018-01-05 09:41:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('993951dcc32b497791b4690d747331ff', 'admin', '2017-12-11 13:32:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('996298d5136249ceb942c5b25fb78498', 'admin', '2018-08-17 09:43:49', '退出');
INSERT INTO `sys_fhlog` VALUES ('99667e7dfcf94ae8a9acf37e385f4b08', 'admin', '2018-08-10 14:29:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('99864eadba444979ad1bab33549d8381', 'admin', '2018-01-29 19:00:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9987c399a1d346ce8026e52443687dc6', 'admin', '2018-08-17 09:40:43', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9988d2dc06f6497ba89a827a2711f007', 'admin', '2018-07-24 17:35:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9990a703413f4b498955a47f88c1744a', 'admin', '2018-08-09 17:13:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('99c40088c29f41f18b645b60c605e45b', 'admin', '2018-08-01 17:13:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('99c5d6538be74c48beab1c076ea6c86f', 'admin', '2018-08-17 09:48:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('99ca0cd1c2a24d4daf22d489d50c801d', 'admin', '2017-11-07 18:38:42', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('99d612658efb4ecaa178631b4a2827fd', 'admin', '2018-08-16 17:56:14', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('99f7b15502544de697228d836920ab57', 'admin', '2017-09-02 09:10:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('99fff12ca60f40dfae6c3fb9ec3aab2b', 'admin', '2017-11-17 10:14:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9a134cf16b7f4169b824cc847def31ed', 'admin', '2017-10-30 13:09:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9a35b43ec62c42fcaaf4db6d9a8a6ee5', 'admin', '2017-12-05 09:35:15', '删除角色ID为:78e52a2a2bb54f4c8d27237f22a7e851');
INSERT INTO `sys_fhlog` VALUES ('9a552ecb4bfd438aab35732461ea319b', 'admin', '2018-08-24 14:48:09', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('9a63a4bd14c744e29f38712b0380de65', 'admin', '2017-07-31 18:54:04', '修改菜单商城管理');
INSERT INTO `sys_fhlog` VALUES ('9a65363fec174f6986b0bb8a4a5d69ac', 'admin', '2018-08-16 18:05:28', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9a6daf533fd1447781cf524398dfc173', 'admin', '2018-08-23 10:09:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9a89f18fa73d431fac65359b6b07a618', 'admin', '2018-08-13 18:24:44', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9a98386a1d924e11be9687a6d36bd678', 'admin', '2017-08-04 10:55:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9a9af6db6b514b328e5ebbcac9915907', 'admin', '2018-08-10 17:13:36', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('9a9da6cbeaf54455ad742bd2d45bb517', 'admin', '2017-11-04 09:29:44', '修改角色:维修师');
INSERT INTO `sys_fhlog` VALUES ('9aa67c5eb2444886a1970b7b9e0f60e9', '18990673099', '2018-03-14 18:01:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9aca1e22551f47bdb3db160fa07f9cd7', 'admin', '2018-08-17 10:37:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9ad6abeebc764b8994b986e491a8bdc5', 'admin', '2018-08-17 09:59:53', '退出');
INSERT INTO `sys_fhlog` VALUES ('9ad8fc26d0fe422c84d906e3d6eaad71', 'admin', '2018-08-17 10:03:18', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('9aeab9c0ec4c4dfcad4c5e30a5f3452d', 'admin', '2018-07-13 16:42:36', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9aed4dfd821b42cd94535d79e6088aac', 'admin', '2018-08-13 18:24:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9b058e5c4ef7420bb8ca271a01e355ed', 'admin', '2018-03-05 19:26:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9b1ef83c04cb4985950fca6d8f828ef1', 'admin', '2018-08-17 10:32:02', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('9b24d8f0726d4eb180ea253bb8997754', 'admin', '2018-08-13 18:32:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9b2f31b8d155457fa1c8dd20409009f7', 'admin', '2017-10-13 15:36:47', '新增角色:修理组');
INSERT INTO `sys_fhlog` VALUES ('9b30e01fa2674596833e4bb78a590bfe', 'admin', '2018-08-17 09:45:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9b352e2c584f43fab0030f4763f9f7b0', 'admin', '2018-08-27 14:17:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9b47e596171b484784845ff41e46ac8a', 'admin', '2017-09-02 21:55:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9b6b6d7d79324e88bd5ea6e4fd676978', 'admin', '2017-09-02 11:12:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9b7f275a8772447aaad7ca6199872337', 'admin', '2018-08-13 18:26:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9b81dc3054e449eaa1b51d4122ba116f', 'admin', '2018-08-16 18:05:15', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9b83efedd9c745a984b86c898dc4c5f1', 'admin', '2017-08-10 10:46:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9b87f7011ae44a50ae9b2337e11857fc', 'admin', '2018-08-17 10:06:50', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9b9ede3fefda446eb3c406f7d227dde8', 'admin', '2017-08-04 09:43:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9bc16b47b246416d90fd406d194dee20', 'admin', '2018-08-13 17:48:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9bc211a42faa4e7ba4df5826c056f472', 'admin', '2017-11-02 13:53:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9bc60ddaabb64b30b5b545099d3dd817', 'admin', '2018-08-22 11:54:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9bcb0b2c706642bc8e65d965f767ebe6', 'admin', '2018-07-13 15:45:26', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9bd9ddacc66140aab6f1a9abeb11c127', 'admin', '2017-11-22 14:33:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9bddc0b7b10e439e8c58ed1183d68ddc', 'admin', '2017-02-13 01:05:01', '修改菜单性能监控');
INSERT INTO `sys_fhlog` VALUES ('9be63795bca64ef0bc9dcb3c6164f08f', 'admin', '2018-08-08 16:50:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9bf1432e35334fa1be7d1db268f73dd4', 'admin', '2018-08-25 11:09:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9bf17a7e1a634ed0b9d2ec437d87c0bd', 'admin', '2018-08-15 10:33:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9bffb3f879ad46769e97f147cf26c20e', 'admin', '2017-11-03 20:37:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9c20f48caadf4bd3a5374590757cfad9', 'admin', '2018-08-10 10:44:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9c2190738f3043da931fba870757545e', 'admin', '2018-04-13 12:46:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9c2fcbc987564794bd03a53659e95135', 'admin', '2018-08-18 13:48:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9c644423359b41088cc19d0125f340fb', 'admin', '2018-08-16 17:57:03', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9c8db85156524e39b80137bf517d0513', 'admin', '2018-03-15 18:01:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9c90d3416fc74649aaa16c026704b864', 'admin', '2018-08-17 10:06:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9c92731b8f674b768d4347a937a3127e', 'admin', '2018-08-15 10:27:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9caa7ecce13e42de8ea13df4390f85cb', 'admin', '2018-07-26 13:54:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9cb6a35fad6f42709f8a76c07d28cbf0', 'admin', '2017-07-31 21:47:11', '新增菜单所有订单');
INSERT INTO `sys_fhlog` VALUES ('9cd3c7c7daad4b50be038e21e876e90f', 'admin', '2018-07-13 16:43:55', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9cdae2578b644ccfa4dbf1829e13af7b', 'admin', '2018-08-13 18:23:19', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('9ce92e1fa40f46f18198262f2049ac50', 'admin', '2018-07-13 16:43:46', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9d2cc81b53034e1394f6c5857f3e4c36', 'admin', '2018-01-26 13:59:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9d35f78a0ba14e1482d1cf266b6896de', 'admin', '2018-08-17 10:40:38', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('9d440e0128e44544b69e151e069dcece', 'admin', '2018-07-13 16:43:06', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9d63b247dd36490ab343471840eaad30', 'admin', '2018-08-17 10:03:18', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('9d7b8a262ddf42869e9489d163c4ecbc', 'admin', '2017-08-21 09:22:20', '退出');
INSERT INTO `sys_fhlog` VALUES ('9d804a65f65e4e2bb1cb4cecff343d39', 'admin', '2018-08-13 18:24:06', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9d8af7e36f884d59b3cbb2bb9a8f735c', 'admin', '2018-07-13 16:44:32', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9d91c5bc4492444bbb5e93cd19528e67', 'admin', '2018-07-13 16:42:28', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9d9b073ddc244974bccafddee736cf7f', 'admin', '2017-03-30 02:13:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9da068a90e974e54b1ab3d72cc450468', 'admin', '2018-03-15 11:27:42', '退出');
INSERT INTO `sys_fhlog` VALUES ('9da06d7145ba4ea881b02de07d9c6cfa', 'admin', '2017-11-27 11:06:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9daba48184274f23b208dfe698081aa3', 'admin', '2018-08-16 17:59:21', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('9dc64620e48c41a285804a83ccac66f8', 'admin', '2018-08-17 16:55:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9ddb687b90634bdc8112dc8948e1ed89', 'admin', '2018-08-16 17:57:03', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9dfc3eaa23554bd9875d7e512c1b3a45', 'admin', '2018-08-17 09:47:09', '退出');
INSERT INTO `sys_fhlog` VALUES ('9dfd9fa66b2a43e7960473d06d6bb23d', 'admin', '2018-08-15 10:26:34', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9e017e13e4fe4b6fa26cccac8f7939e5', 'admin', '2017-11-04 12:04:48', '修改积分提成:3');
INSERT INTO `sys_fhlog` VALUES ('9e0235d9e0464db886c72020ed1c40c0', 'admin', '2017-11-17 17:44:58', '新增合作商家：null');
INSERT INTO `sys_fhlog` VALUES ('9e0963088f8748c0be05bf03a7fe9b71', 'admin', '2018-07-13 16:43:32', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9e13ddb6a4ed43bb84fe34e0ac082c4a', 'admin', '2018-07-13 16:44:22', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9e1691f7a3c945d7b5c9ed5772adeee6', 'admin', '2018-06-18 11:08:19', '新增菜单店铺列表');
INSERT INTO `sys_fhlog` VALUES ('9e2afff42d324b2882eac95482986b86', 'admin', '2018-08-16 18:05:28', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9e427c60240749c4a88bbd5111d068d5', 'admin', '2018-07-28 14:26:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9e4d549e445c40f6bf0243145d6a3b16', 'admin', '2018-08-06 10:18:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9e4fbfad792b4c1db4aad0f26782705d', 'admin', '2017-11-04 17:53:02', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('9e644396c89a48b1bc6a430a178a3701', 'admin', '2017-12-06 15:37:17', '修改角色菜单权限，角色ID为:ce4c50d7af9541db9385c4026ab5bcda');
INSERT INTO `sys_fhlog` VALUES ('9e6ae2c3000d461fb977f9897dc7c2d3', 'admin', '2018-07-13 16:43:25', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9e81e2d5a6fb46da945e905c242b0786', 'admin', '2018-08-17 09:40:42', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9ea6e2154ce0438b8e55c4f6394b6d9f', 'admin', '2017-11-18 13:52:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9ebe059bde0340fba1ff3bf493893915', 'admin', '2017-07-31 20:18:30', '新增按钮权限pd{guid=1501503510500, BUTTON_ID=4c7f34b9eed54683957f356afcda24df, RB_ID=9426618c2c7748819e81d8458905494e, ROLE_ID=3264c8e83d0248bb9e3ea6195b4c0216}');
INSERT INTO `sys_fhlog` VALUES ('9edaee98824e479a9b1928b58ac0f7ce', 'admin', '2018-08-17 09:58:14', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('9ee01aae7331467dbe269abbf539a7f5', 'admin', '2017-11-24 18:17:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9eea297f6bee480b8c3585c301c270e1', 'admin', '2017-09-23 11:14:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9ef67ad6193b445685b2be4c3c0f8294', 'admin', '2018-07-13 16:43:42', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9efc4f73c68b442991ce7a07e1211c32', 'admin', '2018-08-16 18:05:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9f0ea3c4a5234dcd8393edf00fbedca0', 'admin', '2018-07-13 16:43:48', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9f2548e37c13423da75e4f897c40cdd3', 'admin', '2018-08-17 10:03:19', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('9f338ba967014e9fad5092c9cf943759', 'admin', '2018-07-13 16:42:28', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9f4323a98c624f95b0304e2945f6031a', 'admin', '2018-08-17 09:48:22', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('9f53f157cc304667b1c442f71c43b142', 'admin', '2017-09-01 10:02:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9f5947d097b4472c93d4af602eaf3b7a', 'admin', '2018-01-26 17:44:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9f5f7e0e6cf548848b66150a7bc81f55', 'admin', '2018-01-23 09:38:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9f6a7adadcb841f19c431883767cb8e3', 'admin', '2017-08-30 14:23:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9f6bc1ca4fd94a8ebe7e97e6f76270ef', 'admin', '2018-08-13 18:24:43', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9f7644c00dc843db9b7c71e0ce8c899a', 'admin', '2017-09-20 16:52:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9f768fab684d44b185ff10645a19339d', 'admin', '2017-11-30 11:27:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9f7be597a17d4eb2a79a0883c4a80471', 'admin', '2018-07-13 16:43:45', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9f7c5ca649704ab1bba9cda472ac5d8c', 'admin', '2018-08-21 18:21:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9f89f0ab15704cc98206b10bad6dbd75', 'admin', '2017-11-04 17:23:42', '修改角色:其他');
INSERT INTO `sys_fhlog` VALUES ('9fa95ae90459476b94ac544dd23c8cd4', 'admin', '2017-08-29 16:04:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9fb76d22f96541cfb4ddc0df422154c2', 'admin', '2018-08-17 09:42:17', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9fdbfecec93c4a4fbe6c50d24a826e5e', 'admin', '2017-11-15 17:09:51', '新增角色:营业员');
INSERT INTO `sys_fhlog` VALUES ('9fe6a6e944474cd19d7e12e486001a2c', 'admin', '2018-04-12 17:04:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9fe868abd8e343a0889027ca54065b1c', 'admin', '2017-07-31 21:48:04', '新增菜单待收货');
INSERT INTO `sys_fhlog` VALUES ('9ff5ce5d76804e0b8b58bc1da421385b', 'admin', '2017-11-18 13:53:53', '修改菜单查看服务');
INSERT INTO `sys_fhlog` VALUES ('a009f7b36b5744dc807d5aa8bafb7ecb', 'admin', '2018-08-17 09:58:34', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a02a34fe95014558a2cbd336b366ff2c', 'admin', '2017-08-01 11:18:57', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('a04d174a4972446fb1ca5f9347a79a6b', 'admin', '2018-08-15 10:28:46', '退出');
INSERT INTO `sys_fhlog` VALUES ('a04e8fb93060490f8dc44c8fb8d03396', 'admin', '2018-08-11 11:08:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a050655d842441f28ffb03bb61a8d9d1', 'admin', '2017-03-30 00:30:50', '删除系统用户：{tm=1490805050674, USER_ID=e4a6c22ca4244d18ab969367677f5d5a}');
INSERT INTO `sys_fhlog` VALUES ('a0509d7d84664dfcbcb36a728305fc2b', 'admin', '2017-10-06 15:49:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a059483081c64cb094cea8abd7b1861a', 'admin', '2018-08-17 09:45:59', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a061d99cc6744e08b4610bf6ad30c2cd', 'admin', '2018-08-17 10:38:44', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('a081a4a9c3e647dd894623092c3b4492', 'admin', '2017-11-07 20:31:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a095063672364295bef1925e545afa3e', 'admin', '2018-08-15 10:28:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a09d71bf8e3e48e59be3bcb6cfc5cf89', 'admin', '2017-10-27 01:10:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a0a1c58f6a684b37958401bb59114d20', '18990673099', '2018-05-10 19:59:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a0aa78967a80483a922fce631fed7177', 'admin', '2017-09-02 21:59:49', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('a0ba5d5e563a4bbe9f16f3d1a6447776', 'admin', '2018-03-15 11:36:31', '退出');
INSERT INTO `sys_fhlog` VALUES ('a0ca6e9a2cd54183a9d627c546d8d57d', 'admin', '2018-08-22 18:06:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a0f0a6c60aa04580a3d97873813701e3', 'admin', '2017-11-24 11:03:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a10ed65dd428452281d73b0062bb36c4', 'admin', '2018-08-18 16:12:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a13d344a577949f7bd42fa4f2e5974af', 'admin', '2018-07-13 16:41:49', '修改菜单店铺管理');
INSERT INTO `sys_fhlog` VALUES ('a13ee1e770a447a49f770bee752e1a29', 'admin', '2018-02-25 10:15:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a15aaadb68c8416493a3b8d2ded4c2fe', 'admin', '2018-08-15 15:55:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a172e2d2fddd4c879079701e1b58ce57', 'admin', '2018-08-10 17:14:25', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a1745bed0e4a4fc88c2b04d00ee41bdf', 'admin', '2018-08-16 17:56:12', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('a19588981ea0441f95f968f413af17a0', 'admin', '2017-08-03 21:55:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a1c241741d494f6da39a87ed95bf7c9e', 'admin', '2018-07-26 11:23:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a1c68c1588284e8eb564ee39b6fa243b', 'admin', '2017-07-29 21:48:04', '新增按钮权限pd{guid=1501336083985, BUTTON_ID=3542adfbda73410c976e185ffe50ad06, RB_ID=95b2be867b194470a28bb025d8901750, ROLE_ID=3}');
INSERT INTO `sys_fhlog` VALUES ('a1d2f0adfcec44d19e486a9b267f6514', 'admin', '2018-08-09 15:25:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a1dee8e6256040de95fd64b11d8ca5a2', 'admin', '2018-08-09 16:11:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a1e87cb2c58a48fe92dbd917a43c27e4', '18990673099', '2018-04-13 12:41:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a1ecc12705f5421ea5c4aed273d35a91', 'admin', '2017-11-30 20:11:59', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a1f835acd81b44faa45ce1b45395c12c', 'admin', '2018-01-26 15:33:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a226d09da8204fb0bccea587d4cbd630', 'admin', '2018-07-25 18:59:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a24ac695f0af43a5a6f48862b28e30e3', 'admin', '2018-07-24 13:09:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a25106443577464abefcdf3dbcc5bea3', 'admin', '2018-07-13 16:43:30', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a25c26f782584d28b25f670961f19e0c', 'admin', '2018-08-07 17:10:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a26c23c02e1d42d1bc400f3420b22f41', 'admin', '2017-12-02 18:10:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a2a847c39c4f4029924aedb886398a2f', 'admin', '2018-08-16 17:43:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a2a8a3ceb88149789c142f1f7f188da5', 'admin', '2018-08-21 16:17:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a2afc21be2d64350b65dc10e43676eaa', 'admin', '2018-01-29 19:00:43', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('a2b5b24531e047788c66c2cf31fb02cb', 'admin', '2018-08-22 17:53:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a2ba1646909c45f7b1e9f88f10888d8a', 'admin', '2018-07-10 14:23:50', '删除按钮权限PageData [map={BUTTON_ID=46992ea280ba4b72b29dedb0d4bc0106, ROLE_ID=3264c8e83d0248bb9e3ea6195b4c0216, guid=1531203829960}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@3150318d]');
INSERT INTO `sys_fhlog` VALUES ('a2eee4b0c99043468eccead6a97ab022', 'admin', '2018-06-21 08:22:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a2f67ed045274efdb0b67c0d2d0ad12a', 'admin', '2018-08-16 18:02:36', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a32b3a35bf014915988e6352ec8b7165', '18990673099', '2018-03-15 15:29:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a33a06197888450db498f96f32466120', 'admin', '2017-11-17 19:18:38', '删除系统用户：PageData [map={USER_ID=46fc3e7ed35a482b9e20f89e701ea967, tm=1510917518178}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@8ad00]');
INSERT INTO `sys_fhlog` VALUES ('a346541e55034c73bfdba8c81cb5149d', 'admin', '2018-08-02 16:15:52', '退出');
INSERT INTO `sys_fhlog` VALUES ('a368dee394e34988b530074d767513ed', 'admin', '2018-08-15 17:59:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a370adb11e97420eb7a0eccfb9a2e7ba', 'admin', '2017-11-04 16:32:41', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('a3778294c4ef4962a2dfd2ceb3193ed8', 'admin', '2018-07-13 15:45:26', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a37bad6811804033aa113bdcd5624036', 'admin', '2017-08-01 11:18:24', '新增菜单utils');
INSERT INTO `sys_fhlog` VALUES ('a3883bf90b9f4888a687298b1275f9f5', 'admin', '2017-12-29 13:11:17', '修改代理介绍:<p>afsdasfdasfss</p>');
INSERT INTO `sys_fhlog` VALUES ('a38ee37e57a94f1f9e28084505a833e5', 'admin', '2018-08-23 10:09:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a3b3a037d1fd4255bcfbed56d9d4e7d3', 'admin', '2017-12-28 11:12:34', '退出');
INSERT INTO `sys_fhlog` VALUES ('a3c0e1c9fbf344958901aabd1a5e1eec', 'admin', '2018-01-04 17:23:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a3d27a37195c43368c84a9d84b3adba4', 'admin', '2018-08-22 14:55:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a3df341fb4504761ad6b0eae807ae11d', 'admin', '2018-07-13 16:41:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a3f16ec153f447e7a42512d652721fd2', 'admin', '2018-02-05 15:22:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a3fe5ca9492e4b6da12ada928babbe7b', 'admin', '2018-01-30 12:56:45', '退出');
INSERT INTO `sys_fhlog` VALUES ('a414655a020148b4a49f20d191e4be0f', 'admin', '2018-01-25 10:45:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a417fd5a72d8412aac26e23127868e65', 'admin', '2017-11-08 19:52:58', '修改菜单尺码/颜色');
INSERT INTO `sys_fhlog` VALUES ('a4201013be6a4a55b64d5cc5626290bc', 'admin', '2017-11-08 13:40:08', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('a4364d87800345a3b563c70b9ba30680', 'admin', '2018-07-13 16:44:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a437cae407584318a80530fae4fddef3', 'admin', '2017-09-02 09:16:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a44f3a0907104a3a88999752de585af1', 'admin', '2018-08-10 17:14:43', '退出');
INSERT INTO `sys_fhlog` VALUES ('a45d65dced58463db1a1d0a47a317a59', 'admin', '2018-08-21 18:54:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a46af4d602254ba6bb66fe575a9b22e5', 'admin', '2018-07-13 16:43:00', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a47674df1f27427baaa9f58606b9d24f', 'admin', '2018-08-11 11:43:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a4812e8c5b7b4dfcb91b00f5ff099e0f', 'admin', '2018-08-25 15:31:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a483c07e105340ecbe20e21bbf701bfe', 'admin', '2018-08-17 09:40:00', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('a4b25ba24e704dddb5a44851df5d8ee5', 'admin', '2018-08-16 17:56:12', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('a4d6508e10654688bfad7dbc852eca14', 'admin', '2018-01-02 10:23:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a4dc8b1617a246d6b7088f1357e7ed12', 'admin', '2018-07-13 16:44:34', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a4ef7efd862548c8b3b17c884f17bc4e', 'admin', '2017-08-17 10:33:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a4f84d5b9bf94f14a21d7d267409e1e7', 'admin', '2018-08-02 13:25:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a5041033cba54415a766a1671a26000b', '18990673099', '2018-05-01 06:47:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a50bbb205b834e428d54ab5ec958abd1', 'admin', '2018-08-17 10:40:38', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('a5100ec39d8c4ec088791ad9c05f2831', 'admin', '2017-08-09 14:50:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a51db5772fde407c88c8e21d9df6f3ca', 'admin', '2017-08-17 10:21:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a521c88226394368a4c1dbf0ab814a73', 'admin', '2018-08-23 17:33:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a52e48bec4a640ad935a5a83e81912b8', 'admin', '2017-08-09 10:15:58', '新增菜单洗护类别');
INSERT INTO `sys_fhlog` VALUES ('a538c05fcf9e4737abf32f9c000c061e', 'admin', '2017-12-09 18:05:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a548fc6e1c744ca3ad9d9a6fe6c25ed6', 'admin', '2018-07-13 16:42:56', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a55c9b5efa424c62bd9d66ad7aed2035', 'admin', '2018-07-13 16:41:50', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a55de4c59b65481ba013768b0bd94b9d', 'admin', '2018-07-13 15:38:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a564c2511773495e8137bd54f69f8f90', 'admin', '2018-08-02 18:55:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a57617be3dc84e6a8fa7a9fe37432b73', 'admin', '2018-08-16 18:18:50', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a5783cdd540a4a53b6a8533d5c8a98a3', 'admin', '2018-07-13 16:41:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a578d2b27cf541158307fd5b48741bb7', 'admin', '2018-03-05 16:16:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a5ae8dcb8d654037abaa97a381f187c6', 'admin', '2017-12-11 18:06:26', '新增菜单充值记录');
INSERT INTO `sys_fhlog` VALUES ('a5b3d9863ffe475185e39d9f3e016645', 'admin', '2018-08-17 16:50:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a5bb7f43d902466e8d9768810ed4088b', 'admin', '2017-08-17 10:25:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a5c469ea8b8e45fe93112f89e3a250f1', 'admin', '2017-12-08 10:02:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a5e99f1e164b4c9d85e5398e5724faa3', 'admin', '2017-10-30 10:19:26', '新增菜单品牌管理');
INSERT INTO `sys_fhlog` VALUES ('a6455c3aa1c9400897b430d12fbe2f15', 'admin', '2017-08-09 10:13:40', '删除菜单ID76');
INSERT INTO `sys_fhlog` VALUES ('a645edcdd0e54401a7fe70a70e71d741', 'admin', '2017-11-15 17:10:08', '新增角色:店长');
INSERT INTO `sys_fhlog` VALUES ('a650618289034449b4da77870842d96d', 'admin', '2018-03-15 17:59:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a65c3e67e85841cc83cb722140bfe3b7', '15982183168', '2017-12-06 15:28:43', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('a661bdf07fbf43ba87cafb709cf492c3', 'admin', '2018-07-12 12:13:26', '新增系统用户：12121212121');
INSERT INTO `sys_fhlog` VALUES ('a68f0faf72f84c85a3456699d7eea405', 'admin', '2018-08-21 19:08:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a6dba7faa8424ebda7348e61731c9b47', 'admin', '2017-12-06 15:37:42', '修改角色菜单权限，角色ID为:b2c45990d5744b539ca596824d687e88');
INSERT INTO `sys_fhlog` VALUES ('a6dbc96e91cc4814a96327faec8c222c', 'admin', '2017-11-15 21:49:28', '修改菜单产品类别');
INSERT INTO `sys_fhlog` VALUES ('a6e1097cd073472f8baea0dca74de76c', 'admin', '2018-08-16 18:02:17', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a6f81f6c19114f8291625159dc1456c1', 'admin', '2018-08-03 09:16:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a717a301b8e1422ca11ca088a8e1246b', 'admin', '2017-11-04 12:38:40', '修改积分提成:5');
INSERT INTO `sys_fhlog` VALUES ('a71bd9797d9841598e06dbe4775b2f53', 'admin', '2018-07-13 16:43:59', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a72cff82222d49a192a85cefdd623a9c', 'admin', '2018-08-17 09:47:37', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a7410e6319c94850bba21678b44c0853', 'admin', '2017-11-10 10:08:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a7492b4ea98b49c9a2bde3d2bd24f2c6', 'admin', '2018-08-14 11:16:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a771ccd3e9a34df4b98852eb16b36c9e', 'admin', '2017-11-04 11:54:13', '修改角色:五星级店长');
INSERT INTO `sys_fhlog` VALUES ('a775c799e8ff49a4b909241fa36a1824', 'admin', '2017-11-17 19:27:10', '修改系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('a779c288168f4175aa834505711679a8', 'admin', '2018-08-23 09:58:08', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a77e815cab6944e4a564f73640a41270', 'admin', '2017-09-07 16:19:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a7808c01769444c1ad5de6d3f550d897', 'admin', '2018-07-13 16:42:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a7a29159469443ce907a30fafe51c778', 'admin', '2018-08-24 14:48:08', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('a7af71acc9434cc7a2c9174a00ebb61f', 'admin', '2018-08-13 18:24:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a7bf8bd1ab864e54b25afa12a83cc541', 'admin', '2018-08-22 14:16:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a7c56a056f8541728ba0dda23ea5143e', 'admin', '2018-07-25 16:43:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a7ca40481f5f47478e054c2c4f67b654', 'admin', '2018-01-18 11:11:39', '删除菜单ID118');
INSERT INTO `sys_fhlog` VALUES ('a7e224d86d8c4018b1bdc368d9481267', 'admin', '2017-12-02 18:10:41', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('a7e66ef0ed644c4f844c69f25a0308bf', 'admin', '2017-11-04 09:27:16', '新增角色:清洗人员');
INSERT INTO `sys_fhlog` VALUES ('a7e6eb98167d4af88a69fdb17ab25040', 'admin', '2017-09-02 22:02:24', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('a7f76eb84cd84865887db84da5208ba2', 'admin', '2018-07-27 13:11:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a7f92733477b45a78bd74f6881996022', 'admin', '2017-10-07 15:59:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a807ff7696dc437b978b2798d687ee26', 'admin', '2018-08-10 17:15:20', '退出');
INSERT INTO `sys_fhlog` VALUES ('a809efc342054e64a1129db268a96c50', 'admin', '2018-08-10 17:47:08', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('a84ff4e14ca742448b145de32b5ba430', 'admin', '2017-08-29 09:55:18', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('a85b337190df4cc485fd59b0a9e6d0ab', 'admin', '2017-09-10 16:54:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a8608ab8ed504c3db0b6060c2a7402bd', 'admin', '2017-12-08 09:34:58', '删除按钮权限PageData [map={BUTTON_ID=cc51b694d5344d28a9aa13c84b7166cd, ROLE_ID=3, guid=1512696898683}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@803566]');
INSERT INTO `sys_fhlog` VALUES ('a86a0e7734ba4ae49492de9ce51745cb', 'admin', '2017-10-31 10:42:06', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('a86e343b31294f76b94ae9a32b0ed269', 'admin', '2018-07-27 13:29:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a87713997301448d87c407735d3422eb', 'admin', '2018-08-23 17:31:01', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('a87b6000b5084361ab2dc2b3a5d624b2', 'admin', '2018-08-13 18:25:27', '退出');
INSERT INTO `sys_fhlog` VALUES ('a8909a59ea4b42c2be7f68c02c37bc9d', 'admin', '2017-09-08 11:44:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a89580918be545b982a0d16b0bdbd74e', 'admin', '2017-07-29 21:48:11', '新增按钮权限pd{guid=1501336091902, BUTTON_ID=da7fd386de0b49ce809984f5919022b8, RB_ID=88ecac6c60f541f596fd331a9993b0e4, ROLE_ID=115b386ff04f4352b060dffcd2b5d1da}');
INSERT INTO `sys_fhlog` VALUES ('a897c61fc15d4af8ba136fbdb73453e0', 'admin', '2018-08-16 18:02:37', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a8ba93bbb5df4d0e9e243432d2a583d2', 'admin', '2018-08-15 10:32:43', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('a8f64b7d00404619be0dd6bde6ae9b01', 'admin', '2017-11-18 10:35:55', '新增菜单服务管理');
INSERT INTO `sys_fhlog` VALUES ('a8fca362423646609533534c4ef42935', 'admin', '2018-08-15 18:18:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a8fe5bef60064b79959a329b80d75d96', 'admin', '2017-09-20 13:20:04', '修改角色:银卡会员');
INSERT INTO `sys_fhlog` VALUES ('a9252e1306ba4f428669845cc18b9622', 'admin', '2018-07-13 16:44:06', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a92984ac9805427f8a1bcd341fa61339', 'admin', '2018-08-17 10:38:45', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('a9382a09852543a7838159691f434ece', 'admin', '2018-08-17 10:32:32', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('a9405fa5c39e43d9aa617dc8cadc7f3c', 'admin', '2018-08-10 17:13:35', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('a956a2e286cc43e2b31478d06da62fa7', 'admin', '2018-08-23 17:33:15', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a95c777806df4783b1a55b8d630e224e', 'admin', '2018-08-17 10:03:19', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('a95f86ac9184420b91b9da5077b23c06', 'admin', '2017-08-03 11:31:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a9731d71fadb41ba8700ba310c80868f', 'admin', '2017-11-27 13:09:04', '修改菜单查看商家');
INSERT INTO `sys_fhlog` VALUES ('a97cee074e4b4037be71a36ba746fe4c', 'admin', '2018-07-26 16:53:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a99162c50db041788b7484eec8243222', 'admin', '2017-11-02 17:29:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a9950962da644c68bae0740a0ee9f60e', 'admin', '2017-09-02 21:59:38', '修改菜单店面添加');
INSERT INTO `sys_fhlog` VALUES ('a9c101534ca04edfacbbd43779c71ce3', 'admin', '2018-08-16 18:02:36', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('a9c795cec4834c81b6c5fa2751a04f98', 'admin', '2017-11-07 20:37:24', '删除角色ID为:c21cecf84048434b93383182b1d98cba');
INSERT INTO `sys_fhlog` VALUES ('a9cbfb326cda41f09105f06279d40513', 'admin', '2017-11-11 10:52:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a9ceb62851a14b4f9fafccdaedf26650', 'admin', '2018-01-13 14:37:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a9d4b736a83148dd93335cabbb475f3f', 'admin', '2017-08-23 20:53:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a9ed5ac7300e494cb9dcddc6274e976d', 'admin', '2017-11-17 09:57:41', '修改菜单合作商家');
INSERT INTO `sys_fhlog` VALUES ('a9ee66c7437e4a3d916b54a731576cb6', 'admin', '2018-08-24 14:48:09', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('a9fa91cf026947dbaaa3288dba4ea0fe', 'admin', '2018-08-14 11:23:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a9fdec55cc894e668bec382f18fa4e32', 'admin', '2018-07-13 16:41:55', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('aa02682ada7248a5904bee749377a531', 'admin', '2017-11-09 15:15:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('aa0995e29d7b479e91cf95085a3ef57d', 'qq728971035fhadmin', '2017-08-04 09:22:53', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('aa0b4004248646558b12f22a6ef34f6b', 'admin', '2017-09-29 17:36:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('aa2367fce00f40c1ac32fdd1e5f2ae99', 'admin', '2018-08-16 18:02:18', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('aa247d6b6a4d45b0b944cdc5bedf6cef', 'admin', '2018-07-13 10:43:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('aa24e03170284d9f8a30e350b9ae94ce', 'admin', '2018-08-15 10:26:35', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('aa2ce1eb97474b829467a6133a317219', 'admin', '2018-06-08 15:14:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('aa2e8d69b75145b08a0caf6a64540b43', 'admin', '2018-08-17 10:40:06', '删除菜单ID133');
INSERT INTO `sys_fhlog` VALUES ('aa4eeb0f98a742549b6751acb8c3f347', 'admin', '2018-07-13 16:42:53', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('aa5339eb9f9740e99bf841777c1afdd2', 'admin', '2018-01-31 16:14:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('aa74b45f088f4ae98b467b529d531a3e', 'admin', '2017-11-06 20:44:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('aa85960a7cb849d19bbf13be190083a4', 'admin', '2018-07-13 16:43:03', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('aa85e09079c54ab4ba27e11d391ebd00', 'admin', '2017-09-04 16:34:29', '新增菜单洗护测试');
INSERT INTO `sys_fhlog` VALUES ('aa8cbad6d6b24ef5ae4384d8ec59857a', 'admin', '2017-08-09 09:33:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('aa8e6bf4400d48cbb796ca55476ef543', 'admin', '2018-07-13 16:43:22', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('aa9844453d004fa79bc837b88a34ec3c', 'admin', '2018-08-23 09:58:08', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('aaa10f0a8d66469aab9973123ce4310e', 'admin', '2018-01-22 10:42:35', '修改菜单在线管理');
INSERT INTO `sys_fhlog` VALUES ('aaab34040a334b859c0f481085f47855', 'admin', '2018-07-28 09:18:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('aab5f0344aad4f6d85be512836046f83', 'admin', '2018-08-17 10:39:05', '退出');
INSERT INTO `sys_fhlog` VALUES ('aabd9f7228d64effa3c60256d152d627', 'admin', '2018-08-16 18:18:48', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('aad253de1c064fbaa0b7b781e303bb46', 'admin', '2017-08-14 13:16:57', '退出');
INSERT INTO `sys_fhlog` VALUES ('aadc7cd7f8fe41009a31b4519f2092f3', 'admin', '2018-07-13 16:42:12', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('aae4eb56af4944478fc69df79e4bd86b', 'admin', '2017-11-07 09:43:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ab10ebbaedeb4c95a9e7e4e0e51c54de', 'admin', '2017-11-04 12:38:40', '修改角色:注册用户');
INSERT INTO `sys_fhlog` VALUES ('ab182acd7f13487c964c47e0d0fd1665', 'admin', '2018-07-13 16:43:35', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ab1a1bac4e49420d80e9fce10cf93c3d', 'admin', '2018-08-02 19:08:59', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ab2508229c76441187d008be8a00301e', 'admin', '2018-08-10 09:21:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ab2aad5b6eb742de8a5b3e9ee1229654', 'admin', '2018-08-10 17:13:38', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ab3528be44f544b68167682255c95127', 'admin', '2017-10-03 13:00:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ab352c90b13741b6b533a877a65162df', 'admin', '2017-11-04 15:26:01', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('ab4c9d8077584d38a3348ecc7d61ff1d', 'admin', '2017-11-17 10:36:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ab736eaa77224401a3c44261f264acbb', 'admin', '2017-11-08 16:49:30', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('ab76ffe462c4410ea562b93286931de6', 'admin', '2017-09-20 13:11:07', '新增角色:店员');
INSERT INTO `sys_fhlog` VALUES ('ab9fc4b710964797b7ebf4c458e24c2c', 'admin', '2018-07-13 16:41:50', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('abb44f53e90e444e916cf92169b0aea7', 'admin', '2018-08-17 09:45:59', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('abd344515cf845ad99732b146cc33b79', 'admin', '2018-08-17 10:38:47', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('abe25e9fd9664523a5fba1e17f9770ea', 'admin', '2017-11-25 09:36:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('abe9b972e52c41c1b42af4578357a486', '15982183168', '2017-12-06 15:29:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('abeb2eed51a844d5a61f60f28856742a', 'admin', '2018-08-06 11:05:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('abf1d9a2d55f41968031e8873a981491', 'admin', '2018-08-23 16:26:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('abfe4b3d72124af48469708ab8288d5b', 'admin', '2018-08-25 18:24:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ac12178ec46e464fb511bab8754e1f37', 'admin', '2016-10-18 03:27:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ac39b4869bae4b998eb065f061e00e18', 'admin', '2018-07-13 16:43:00', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ac4441da051547b3a64f1f0f46bc10b7', 'admin', '2018-08-16 18:48:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ac4f62afec264508b8f859126e4303da', 'admin', '2017-11-23 17:23:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ac75243425fb4382927ec8ba4c7221c4', 'admin', '2017-08-09 16:23:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('aca963dd95b541fa90349fc771982891', 'admin', '2018-08-17 10:37:39', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('acb7913fb0eb462b87b921d2541af117', 'admin', '2018-08-23 11:50:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('acbef9ceba674175890406b01f8bf2c9', 'admin', '2018-07-13 16:42:30', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('acc4a77a946246838a26a0945a323212', 'admin', '2017-12-08 09:34:57', '删除按钮权限PageData [map={BUTTON_ID=da7fd386de0b49ce809984f5919022b8, ROLE_ID=3, guid=1512696897115}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@6610cb]');
INSERT INTO `sys_fhlog` VALUES ('accacc7c600a4c87885a2411ff55dc1a', 'admin', '2017-11-22 15:48:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('accf7dc23182442eb89253d45e8ad665', 'admin', '2018-07-13 16:43:29', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('acdccb568cc7442e939b1e5c58d45631', 'admin', '2018-08-14 09:22:09', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ace665dc1a8b439bba47e2eca37fea24', 'admin', '2018-08-16 18:05:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('acea859c69a643df9115a0ebfc311ed7', 'admin', '2018-08-16 18:04:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('acf0dddf3a2b4a33951f77ee9abb3e03', 'admin', '2018-08-23 17:29:53', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('acf1a74a827f4ebdb06f76e0c9ffa35f', 'admin', '2017-11-08 16:50:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('acfd00ffe5994649bc8a783d9611993d', 'admin', '2018-08-17 09:40:56', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ad16fe2628804a30a7521ae263d9349c', 'admin', '2018-08-21 18:54:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ad2975e5ae5149f9898fda4a25fda1b8', 'admin', '2018-08-08 14:11:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ad36472ffdc64b82889d005522ae6aa2', 'admin', '2018-08-02 11:46:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ad39bccc5755416abde3215b14d5ef7f', 'admin', '2018-08-17 09:42:17', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ad401b3a1222429eb3d647e9c8bcc8c1', 'admin', '2017-07-31 20:43:24', '退出');
INSERT INTO `sys_fhlog` VALUES ('ad4d68090959481aac7729d1110d8c83', 'admin', '2018-08-10 11:04:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ad57e59c3f65404f8585215d2ba7f592', 'admin', '2018-08-04 14:51:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ad61bc60da4249fe92b2a5756c68c2af', 'admin', '2018-08-17 09:40:56', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ad7ab3aae89e4dfda3ab4db2d9842bac', 'admin', '2018-08-13 18:27:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ad837af6f5854dd8bc5cffe32e64b77f', 'admin', '2017-11-07 09:16:59', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ad9187b93351457eb60eec3201596bfd', 'admin', '2018-08-17 10:39:03', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('ad92094b9bef4f06bc3827a7c99d141f', 'admin', '2017-11-04 16:43:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('adaa869135fe4f8a89609926fc994ffc', 'admin', '2018-08-15 10:22:43', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('adc93afb9fc545c48024dc3e0f167d8b', 'admin', '2018-07-13 16:42:45', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('adec54e759234e05ba5af4bfb818e5f3', '18990673099', '2018-02-07 16:41:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('adedde5040934dfabb3c637d021b61f8', 'admin', '2017-11-04 17:22:04', '修改角色:经理');
INSERT INTO `sys_fhlog` VALUES ('adf349eaebe0442a8bd1cfeb7f98d4d4', 'admin', '2017-07-31 20:21:04', '修改角色菜单权限，角色ID为:68f8e4a39efe47c7bb869e9d15ab925d');
INSERT INTO `sys_fhlog` VALUES ('adf866933fed45748d77e7886d6537cc', 'admin', '2018-08-17 10:32:33', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ae145b38eff4452c96182898d797e082', 'admin', '2018-01-26 17:32:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ae197533e25a4b3ea7669fbc376caa35', 'admin', '2018-07-24 15:02:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ae273f67807745729a09ed6dee9c5e09', 'admin', '2018-01-09 10:23:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ae2fba4e134a413a98672b9663d1c38f', 'admin', '2018-01-18 11:11:53', '删除菜单ID42');
INSERT INTO `sys_fhlog` VALUES ('ae3a24c1abbd4a83b6f878513a193fc8', 'admin', '2018-08-17 09:45:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ae447b52db0b4482b08996ad3dc7edbc', 'admin', '2018-08-17 10:32:32', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ae56745d1fa346c2ab7dab73a83e1b46', 'admin', '2018-08-17 10:32:44', '退出');
INSERT INTO `sys_fhlog` VALUES ('ae6021c6f77c4a59a5ef6a9548f57d5c', 'admin', '2018-08-17 09:42:03', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ae62eac307a840e0928df996e07eb199', 'admin', '2017-08-08 08:56:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ae67ea1a68f8409586777bf94a100eb7', 'admin', '2018-07-13 16:44:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ae75f30a09494c4786620ab729c29db5', 'admin', '2017-11-07 20:32:35', '修改系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('ae7b9f891ba04521ac05d5e62abf086a', 'admin', '2018-08-17 09:58:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ae83be662a19490a8dc62b38ef417c06', 'admin', '2018-08-17 10:40:39', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ae9f483c47464fe19cd76b246c30d588', 'admin', '2018-03-15 18:06:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('aebedb141e8248869c68eab65a57b433', 'admin', '2018-08-17 09:45:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('aebef2b3f28e4265b31528904f554c06', 'admin', '2018-08-17 09:48:23', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('aed593b3907641c5980838bd6ce8b31d', 'admin', '2018-08-14 09:09:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('aed98e57f0c64853ba2a5b3f43d69647', 'admin', '2018-08-13 18:24:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('aedb4a254fd94f129e44695b5232f373', 'admin', '2017-11-04 09:25:20', '新增角色:客服');
INSERT INTO `sys_fhlog` VALUES ('aee3b46fe1854fd6933bda5cae9199e1', 'admin', '2017-07-31 19:54:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('aee429e6b3e3473c982dfef6d8a306c7', '18990673099', '2018-03-05 19:00:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('aee6ac42799c499db1a86bab4e068c9f', 'admin', '2017-12-25 13:48:31', '删除菜单ID111');
INSERT INTO `sys_fhlog` VALUES ('aef17cfdb8f4483fbe3a831eac08b047', 'admin', '2017-10-31 11:38:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('aef24c9a3fa94c948619cb4992cf54a7', 'admin', '2018-07-13 16:42:40', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('aefe3e2e1ff94c188b7764ad3b2e9537', '18990673099', '2018-04-13 12:36:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('af1b288ec5014a31902f40019a99468b', 'admin', '2018-08-16 18:18:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('af2246ccfd794b4898c4daa80e0fa39c', 'admin', '2018-08-27 18:37:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('af239c572f0240aabbfed43cea3add4f', 'admin', '2017-08-09 20:11:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('af33005c278d421883f52d388f3132eb', 'admin', '2018-08-01 15:01:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('af421a7727454472aa0efdf8da6f1366', 'admin', '2018-08-23 17:30:14', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('af4aee65e0f14c869db350c4bd4c1bf7', 'admin', '2016-06-06 00:15:44', '退出');
INSERT INTO `sys_fhlog` VALUES ('af54befaf2d0459cb90116a0d5f5b518', 'admin', '2018-08-18 19:28:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('af652cda73df443dbbcc4f0eac4831b9', 'admin', '2018-07-13 16:43:23', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('af6d038bbc3645bfbffc8385fbaaefbb', 'admin', '2018-07-13 16:43:15', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('af6e07574f6741e392278218d30774e2', 'admin', '2018-07-13 16:43:18', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('af6f8b291fb3497ea57e157d29bcb3bd', 'admin', '2017-11-23 20:40:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('af709f224f94417790ff0d4da2687656', 'admin', '2017-10-30 16:44:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('af77c874aa084e8d80174fca5315907a', 'admin', '2017-11-23 14:20:31', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('af78687d0bba4274aefd81aa1b61ee68', 'admin', '2018-07-13 16:42:02', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('af806ec8885047a4966cab7ddcdbd0c3', 'admin', '2017-11-27 18:37:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('af92b094446b4a268d523332799f481c', 'admin', '2018-07-13 16:42:22', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('af9bade16a1c4d21b6137e6476fbf909', 'admin', '2017-07-31 21:24:11', '退出');
INSERT INTO `sys_fhlog` VALUES ('afb06f73596b417a9822709bf4be3e76', 'admin', '2018-08-21 16:32:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('afc13ef95e9a431eaf96737b6dadff37', 'admin', '2018-08-14 15:28:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('afc337388d7245a7bd163f20c1d018fe', 'admin', '2018-08-15 10:26:35', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('afc77455f6ca4fa2a5e7a7c23283d8a7', 'admin', '2018-01-26 11:18:17', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('afc92257946b4c31a01147f7a4df97e7', 'admin', '2017-08-18 08:04:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('afd3d051af844ad6b0df3fd8ea62dafd', 'admin', '2017-12-29 15:50:59', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('afd68fac98684f26b68caace09e69916', 'admin', '2018-07-13 16:42:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('afe0c78d217e4526a8f340e395ca0511', 'admin', '2018-08-16 18:05:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('afed58487bc8401b93005d487b96eeca', 'admin', '2018-08-17 10:37:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('aff4f90ae72947cd8e89046465d716d8', 'admin', '2018-03-01 09:11:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b00b55b8a82043e0a0436efd7e684509', 'admin', '2018-08-17 10:03:17', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('b02241fbb76a4708a2aceed380f9638a', 'admin', '2017-11-17 17:47:58', '修改系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('b044f6bd92ca48c185e9a3e59e51d757', 'admin', '2018-08-16 18:04:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b063f6d82f13462bac43aff12c9b9143', 'admin', '2018-07-13 16:44:00', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b08b23ada75c47bfbc45336323b6834f', 'admin', '2018-08-16 17:59:22', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('b09795afbc044cc498021b76cc933bfc', 'admin', '2017-12-04 16:18:50', '修改金额提成:1');
INSERT INTO `sys_fhlog` VALUES ('b09adb11e940427f9104b9756d090d3d', 'admin', '2017-11-02 09:27:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b0a38585a1b14f169f59751cb3eba230', 'admin', '2018-08-13 18:23:18', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('b0b563c792c04d3c9372be07ac5e16f4', 'admin', '2018-08-17 10:32:42', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('b0c2ed0da18b4c89b89f10dbcab8f303', 'admin', '2018-08-23 09:58:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b0c38f58538c47ddbda9582553839912', 'admin', '2018-08-10 17:10:59', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('b0c453a3ab2346f5bd846aa162cf7578', 'admin', '2017-11-29 16:20:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b0d5528b2d6d4fb9967d85da1ae1b4d9', 'admin', '2017-11-30 11:34:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b0ea60ef5a52432ba6dbc15a113ff756', 'admin', '2017-09-30 10:11:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b0fb9b4e6ab54561a6dc36eda69ff197', 'admin', '2018-07-10 11:41:43', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('b0ff25b1231f43ee8dc6fc8bb0836e91', 'admin', '2018-01-23 17:51:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b10b3651a4d2461ba924a2b5699cbe9c', 'admin', '2018-08-13 17:04:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b129685e104547c195a70a07b3d670ae', 'admin', '2018-08-17 09:48:23', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('b131082cd3cc4e619a4b3ca63ea04e96', 'admin', '2018-08-23 17:33:16', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b13ce2d2cc814e7b8063bf7a6fafc375', 'admin', '2017-07-31 21:50:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b14ab4e8ba4f45cc8cd0a498e4c83d58', 'admin', '2018-08-17 09:58:13', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('b14d23846b9b40acbfc54227f55a3c0c', 'admin', '2017-11-04 17:22:39', '修改积分提成:6');
INSERT INTO `sys_fhlog` VALUES ('b150a27c1da342ec8d48504b6d45fb36', 'admin', '2017-11-04 09:21:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b158379dfa1e424b8c60bd85d7265edf', 'admin', '2018-08-09 16:20:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b15972eda0514d458880f304b6ee7ab2', 'admin', '2018-08-17 09:37:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b16700d1bbba4cdea9cc45f3534c31a5', 'admin', '2018-08-15 10:32:43', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('b16bbc55f66840488a68cd433c693df9', 'admin', '2018-08-17 17:08:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b17e8f6e84534852a1e768dead639f4e', 'admin', '2017-11-03 17:04:53', '新增按钮权限pdPageData [map={guid=1509699893324, BUTTON_ID=4c7f34b9eed54683957f356afcda24df, RB_ID=21e57d28eef24721abc12cf7815a4f38, ROLE_ID=1b67fc82ce89457a8347ae53e43a347e}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@5e3e8d40]');
INSERT INTO `sys_fhlog` VALUES ('b17f1b7e1d2b4c488acd634e61bcdfd7', 'admin', '2018-08-16 18:04:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b180c77387ef4cb9a73b243a8dbc696c', 'admin', '2017-08-06 20:33:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b18fbe7f5ef1402385c52b5b34a7796c', 'admin', '2017-12-06 15:39:10', '删除菜单ID94');
INSERT INTO `sys_fhlog` VALUES ('b1aacd3bc8834c42b8896ff0b6f62e29', 'admin', '2018-08-04 15:37:31', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b1b4f70d8886497491d6a76bcbf56504', 'admin', '2017-12-02 14:12:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b1d978aa8e804259bf2b9ff8c91dd738', 'admin', '2018-03-15 18:08:36', '退出');
INSERT INTO `sys_fhlog` VALUES ('b1dfc62272c4408791a4f3a210d7ed4d', 'admin', '2017-11-25 10:09:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b1f25e3e2bc1466a95e1d2bbf07d448b', 'admin', '2017-12-07 20:30:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b1fd12033fa74725a084a5c93c403dcc', 'admin', '2018-08-17 10:39:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b20ef4c90277467d944f17f0173bbce1', 'admin', '2018-07-13 16:44:37', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b21620a4aecf4f2793fe221babddb4c7', 'admin', '2017-11-18 13:12:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b2255dede611402fbf0cfed2a42346d4', 'admin', '2018-08-23 17:30:59', '新增菜单帮助列表');
INSERT INTO `sys_fhlog` VALUES ('b22a305fccc349fbaa54e8f7ab64a2a8', 'admin', '2017-11-06 20:25:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b23127fe59964bbfb3c7d380c9591fbd', 'admin', '2018-07-13 16:43:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b23cb38779e5428eb9dfa6d327fd2145', 'admin', '2017-09-23 17:50:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b24fc12d210c48fb8021bf09140bfac5', 'admin', '2018-08-17 09:48:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b252d160803a44d18ae9925d0a2f4dd3', 'admin', '2018-08-17 10:39:41', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b2546899ff64444abf22cca679ab1fb7', 'admin', '2018-08-17 10:40:38', '新增菜单建议列表');
INSERT INTO `sys_fhlog` VALUES ('b254d39f17544040b8314220dd41fe2a', 'admin', '2017-11-10 17:35:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b256ea3879f74e0bb09f062d4b92802e', 'admin', '2017-11-08 13:04:31', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('b25eb6230668427f9646ceb557315fc3', 'admin', '2017-11-08 19:56:24', '删除菜单ID17');
INSERT INTO `sys_fhlog` VALUES ('b28068087f674e66b9151591fae5700b', 'admin', '2017-09-23 16:33:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b2867c7ef07e421ea88a20f8203e9fea', 'admin', '2018-07-13 16:43:20', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b2959ef189554756b1d69e966c3ea006', 'admin', '2018-08-09 16:31:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b29bd1979c9d4f7399f16e0f35842da8', 'admin', '2017-10-15 22:09:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b2a0fa9ba5f64656b301a0213de7874b', 'admin', '2018-08-23 17:31:01', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('b2a125051dcb4744aac8bb016a25a831', 'admin', '2018-06-21 08:53:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b2ba0c2c298448ebbeb9b21f44471658', 'admin', '2018-07-13 16:42:30', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b2bb9b4cc13d439583f76b97bf5ce87f', 'admin', '2018-08-02 16:42:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b2cf1dff18b54db98010f0212a9de779', 'admin', '2018-08-15 10:22:43', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('b2f1574fbb9b45e7917d4ef97b44d136', 'admin', '2018-02-01 15:06:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b306b08e58e740f1a5604aa3ac1d4629', 'admin', '2018-08-10 17:47:08', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('b30c91a7f74f4620addb52ec493945a1', 'admin', '2017-09-02 22:02:06', '修改菜单洗护类别');
INSERT INTO `sys_fhlog` VALUES ('b33268e7ed714a12961b903504885b1c', 'admin', '2018-08-21 09:52:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b332f07c548244258a7da0e53c1112cd', 'admin', '2017-11-18 14:37:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b333b4e1227e45dbab9472b20a873ded', 'admin', '2018-08-10 17:47:07', '新增菜单订单管理');
INSERT INTO `sys_fhlog` VALUES ('b33f2fa3a25643bfa9875e032a416df9', 'admin', '2018-07-13 16:43:30', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b35c328355994897901165f69deeddc9', 'admin', '2018-08-17 09:40:56', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b35cd128707045708a55f98d337c1c82', 'admin', '2018-01-09 09:22:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b37a163411d6427590c4960a0115f6f9', 'admin', '2017-09-10 17:49:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b388a54eb98b47b6b1d21e66b8f44628', 'admin', '2018-08-17 10:39:42', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b38e30fdc8ec45fb9a1e7b9a5b0cf320', 'admin', '2018-08-15 10:22:44', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('b3973646ffcf42e4b2c5ecbc6c04489f', 'admin', '2017-11-23 19:21:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b3a6e58e3bf34c04995fc1adbef7aa2a', 'admin', '2018-07-13 16:44:02', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b3b27012408f40129a06b226a45e8edc', 'admin', '2017-11-09 17:25:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b3c65c7209454c3ebab48f8dd053f71e', 'admin', '2017-11-04 16:27:26', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('b3cf151494f84d38a07f629fd6e56933', 'admin', '2018-08-17 10:32:32', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('b3da63b8a2c34bd484a9b3e81e33cdf7', 'admin', '2018-02-01 16:07:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b3dd57dff0aa49e58e16dea675924c52', 'admin', '2018-08-11 10:50:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b3e0ff75a98940ecb158d937d40df30d', 'admin', '2018-08-17 09:47:37', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b3e1ab87ddda492890430f3de8ecea6d', 'admin', '2017-11-10 14:10:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b3f5ae8b4a4146b89b82180fda8302af', 'admin', '2018-08-16 17:59:22', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('b3f84e2c12ba44d1a80495f7b0241b33', 'admin', '2018-07-25 17:31:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b41d3f1d7d8a44eda3e3be900151561a', 'admin', '2018-02-05 13:27:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b43f7fe4eb8042a79da68c06f6fbebf3', 'admin', '2018-07-13 16:44:15', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b446ccc47e0b4040853901b65d10b179', 'admin', '2017-11-10 17:49:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b45de9c2f35b4ff999fd0eb1848d6760', 'admin', '2018-08-15 10:22:43', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('b478915a33ce4939bcca0549646edee7', 'admin', '2017-09-08 18:19:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b48fd9e8dd1641919c448a2406c19f70', 'admin', '2018-06-10 12:43:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b4b9203e2bda4ff9891be2f0edbf22fc', 'admin', '2018-08-16 18:18:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b4ca0c0029ec46a5921c72783cfc1b8e', 'admin', '2018-08-13 13:43:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b4cb1cbe193f4b3f97b026eb5f0475a6', 'admin', '2017-11-01 11:15:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b4f724098ffc48858011a2926205e86e', 'admin', '2017-11-08 10:08:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b53538d4e7244784adaf3aa51cbc07f5', 'admin', '2018-08-17 10:07:05', '退出');
INSERT INTO `sys_fhlog` VALUES ('b53770a89f6348e9839d73905b440a47', 'admin', '2017-12-16 11:32:09', '删除角色ID为:b2c45990d5744b539ca596824d687e88');
INSERT INTO `sys_fhlog` VALUES ('b54e80c005cd4681a3504cf4d380feb6', 'admin', '2018-08-23 10:09:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b57f2bdad74a478f936665c31bb61b03', 'admin', '2018-08-17 10:12:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b583ffc96f284263bf04057f8323580a', 'admin', '2018-08-17 10:32:33', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('b58bff1a7e9f4751b5a8f8316ad35915', 'admin', '2017-11-18 13:52:04', '修改菜单查看服务');
INSERT INTO `sys_fhlog` VALUES ('b5a768a00d4c4bb08eab64fdbaea2ba4', 'admin', '2018-08-23 17:29:53', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('b5b08b4feb5441b8b37dcbb11b926eef', 'admin', '2018-08-17 09:39:59', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('b5b1375370a545799c0aad8f1e2d5d60', 'admin', '2018-08-21 18:59:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b5b774873e704496939d7dd3b48dbc27', 'admin', '2018-07-13 16:41:54', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b5ca8be5d76c4013891563fa88f10676', 'admin', '2018-08-22 16:26:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b5d75ff1341d4473b8646ca0ca29fbb7', 'admin', '2018-08-17 09:38:25', '删除菜单ID133');
INSERT INTO `sys_fhlog` VALUES ('b5e11cee622849a4bbe6eb82142409b0', 'admin', '2017-12-06 20:25:30', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('b5f6cfbdf8244e6f8dbe609efd4b922a', 'admin', '2018-08-24 14:48:09', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('b6083e62c598416ca6f2efbd83bed9ab', 'admin', '2017-12-08 09:34:53', '删除按钮权限PageData [map={BUTTON_ID=da7fd386de0b49ce809984f5919022b8, ROLE_ID=3264c8e83d0248bb9e3ea6195b4c0216, guid=1512696893138}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@1a463c6]');
INSERT INTO `sys_fhlog` VALUES ('b62322cfed0b465884b5fcdf4a69711a', 'admin', '2018-07-13 16:44:12', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b6237a47c79946f7934abc460f09b86e', 'admin', '2017-11-07 09:56:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b62b7b381c6142c596bf5cd89d03526c', 'admin', '2018-08-16 18:05:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b6329479c2b64b738b0c2a92b574078e', 'admin', '2018-08-17 09:58:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b636f3832efd4422a50bc18bdac898b0', 'admin', '2018-08-17 10:41:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b63774b77ae447259cae44c5d49e4973', 'admin', '2018-08-21 17:38:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b6611a63372840b89b7b2ea56ffd984c', 'admin', '2018-08-15 10:26:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b663e1ea6d5a4ef7910853848e86331c', 'admin', '2017-08-09 10:13:37', '删除菜单ID77');
INSERT INTO `sys_fhlog` VALUES ('b66753a2036b49c9bf90887ae3f2eab5', 'admin', '2018-01-22 18:13:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b672c59b8ad14a47a4b73b1115809af0', 'admin', '2017-11-27 17:54:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b68c090340cd406785bc43fd50385cd9', 'admin', '2017-03-16 01:03:47', '退出');
INSERT INTO `sys_fhlog` VALUES ('b68f580e6b4c48bcb5196dffb86a9990', 'admin', '2017-12-14 17:35:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b6924b790b474fed86267c804ea8e16f', 'admin', '2018-06-01 10:55:44', '退出');
INSERT INTO `sys_fhlog` VALUES ('b69d310992a341d5b331d9852baa0bf1', 'admin', '2018-08-14 09:22:08', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('b69e5cb0f04449668abfffcf7c23a3d2', 'admin', '2017-11-04 09:24:40', '删除角色ID为:323bd09f92094a07a9791f92003de8cd');
INSERT INTO `sys_fhlog` VALUES ('b69fca37a36c4dc796f7630a66bfac5b', 'admin', '2018-01-23 09:38:42', '修改菜单问题列表');
INSERT INTO `sys_fhlog` VALUES ('b6b2851c883047539d3be11b11bebd24', 'admin', '2018-08-23 09:58:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b6b6b642d524425f94817dc84110b1dd', 'admin', '2018-08-23 09:58:08', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b6caf4d3355b4e41af593aee61008173', 'admin', '2018-03-13 20:20:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b6d73e4efd3e4277ae41448bb6556c7d', 'admin', '2018-08-17 10:03:17', '新增菜单建议列表');
INSERT INTO `sys_fhlog` VALUES ('b6eccb6084b849e78f38b8c007aa3194', 'admin', '2018-07-13 16:43:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b728f83153cb4fd0ad57e7087e2a8210', 'admin', '2018-08-08 17:59:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b73bcb1ce21b4f8a9b6f73eb0cd11293', 'admin', '2018-08-16 17:59:21', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('b75e077decad43d8b9e942fafa018f83', 'admin', '2018-08-16 18:02:17', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b75eba96f99c4a5ab93a4aed1bf9212c', 'admin', '2017-11-17 10:03:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b78cf8b5b1b5472d94fbdc3d52981678', 'admin', '2017-09-05 12:15:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b79918681eed40c8974fd5050cd50b80', 'admin', '2017-12-06 10:13:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b79e236ebdd246938daa71c3b6fdce9f', 'admin', '2018-07-13 16:44:34', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b7a896b3872b44768fb0084945d3b5a5', 'admin', '2018-01-29 19:37:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b7e292c31de6485d901f4e7ae18df5b9', 'admin', '2017-11-29 18:32:31', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b7e36ae05f664efcb542b83234162162', 'admin', '2018-08-26 21:14:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b800597768224bc0b581e66d62f14de2', 'admin', '2018-08-16 18:05:29', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b8143e3f4a044cf39b05984fc9b04b13', 'admin', '2018-08-17 10:03:18', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('b827daeedca947f5aafa834d99c6cf14', 'admin', '2017-11-18 14:56:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b8402722a05e4dc18cdf2b8ba9b6fc08', 'admin', '2017-11-17 10:27:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b846e51d05024e3781cb97fcb493a2ab', 'admin', '2018-08-17 10:06:49', '修改菜单建议列表');
INSERT INTO `sys_fhlog` VALUES ('b8488b6110ee4572bdf5d167e56aed91', 'admin', '2018-07-13 15:38:32', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b84a7b2daf3f457fb34b131260cf27b6', 'admin', '2018-08-17 10:38:45', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('b853ea83c83147e7828ca613c85e878f', 'admin', '2017-11-10 18:04:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b85a3b4b246a4800a7a7a9ea65f1b4c8', 'admin', '2018-08-22 18:26:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b85ae74c95744685aefcf2bef0414036', 'admin', '2018-08-26 11:39:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b85b48f475494dfcb2e3ca12842d5623', 'admin', '2018-08-10 17:48:18', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('b85fa31b96594974b171c7aa1017c15e', 'admin', '2017-11-04 15:41:13', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('b867553a7be34f09ab4562f3720256a2', 'admin', '2018-08-17 13:27:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b88b2263b2eb4a199d916ad79eae71ef', 'admin', '2017-09-04 09:29:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b88f2d4a0018411a97d445b83ef19772', 'admin', '2017-11-04 16:44:37', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('b8970478dfe64e12b47b5964b269fecf', 'admin', '2018-07-13 16:42:09', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b8c55bcbcd1a4acb8f70564e960100e9', 'admin', '2018-08-13 18:24:44', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b8e106e1e42144e68e6e690700bf7ce8', 'admin', '2018-08-17 09:40:43', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b8e10c1e799e4fe7b3752f831c60a60d', 'admin', '2017-11-04 17:23:20', '修改金额提成:2');
INSERT INTO `sys_fhlog` VALUES ('b8f4323e118849508d0f2b21297c5100', 'admin', '2017-11-17 19:17:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b8fdae4b562d48e8ae450c263879f681', 'admin', '2018-08-15 17:18:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b9268458107443da9805c1767180b18a', 'admin', '2017-11-06 14:36:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b9280b5cf99d456f8c935eb291f148da', 'admin', '2017-08-06 21:17:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b92dfeaaf7ae48f6a0ad53ac215f2be2', 'admin', '2018-07-13 16:42:03', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b94abe2a866c470a93817a426aecf859', 'admin', '2017-10-11 14:13:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b95079b7c16b4fbaaafaabc74db2b09c', 'admin', '2018-08-10 17:11:00', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('b959dc9ac6014543bd9dd4c637ccd5e7', 'admin', '2018-08-17 10:01:21', '退出');
INSERT INTO `sys_fhlog` VALUES ('b98aa6873e2442f6821e50bc3a6f3568', 'admin', '2017-11-18 10:38:22', '退出');
INSERT INTO `sys_fhlog` VALUES ('b9a74e865dfb41e0b9bc25d87b1b31f9', 'admin', '2018-01-09 14:12:01', '删除菜单ID73');
INSERT INTO `sys_fhlog` VALUES ('b9ada6fd47324473894594f060ff4f49', 'admin', '2018-08-16 17:59:20', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('b9adb5b6f2e74b41810ed75fb5a1eaaa', 'admin', '2018-05-24 14:13:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b9d83d15795c4f76b824542757a22187', 'admin', '2017-11-27 18:33:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b9ee460c45864a359b7129f44bed6254', 'admin', '2018-08-04 16:31:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b9f30e5a294046c6abca0c6ea7b45c6c', 'admin', '2017-11-18 14:57:15', '退出');
INSERT INTO `sys_fhlog` VALUES ('ba033a5668ea4ac49d8bfb6a4b84d304', 'admin', '2018-07-31 09:14:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ba07c382464b4115b9b55fbd361564d3', 'admin', '2017-11-04 15:16:57', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('ba1e4f7064f541098d758cbdc43ddeab', 'admin', '2017-11-04 17:23:42', '修改积分提成:3');
INSERT INTO `sys_fhlog` VALUES ('ba28eaf35bdd4fdeb231b4c1952f7dda', 'admin', '2018-08-13 18:25:24', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ba334cc9b9ec430183995e1018243fc1', 'admin', '2018-08-17 10:38:47', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ba4c23911e604788a5fd6480e8e07b33', 'admin', '2017-07-31 21:46:08', '修改菜单商品管理');
INSERT INTO `sys_fhlog` VALUES ('ba4df907010c4c2685d5525965065dc0', 'admin', '2018-08-10 14:35:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ba535a6419774316b5e93b0ebb8894f3', 'admin', '2017-11-23 18:06:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ba57591065a44347bc5fd2d47353eba8', 'admin', '2018-08-13 18:24:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ba8c94a4f52f4dd0a257d58f029f2f9b', 'qq728971035fhadmin', '2017-08-04 09:41:45', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('ba8e4a544c204de2b78e68fc75b60450', 'admin', '2018-01-22 10:41:59', '修改菜单一级菜单');
INSERT INTO `sys_fhlog` VALUES ('ba9ab078b35d423f92cef0bbd1af3e70', 'admin', '2018-08-15 10:33:28', '退出');
INSERT INTO `sys_fhlog` VALUES ('bac0b45591c24ae5a059aa274cfdc8ed', 'admin', '2018-08-10 17:14:24', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('bac42e2e4433444e8faefd45b206d8c4', 'admin', '2018-08-17 10:01:12', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('bac6e98204d242ce9b30a2dca8b0898c', 'admin', '2017-03-16 01:00:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('badc31c6ef774a1eb2ae183aea949912', 'admin', '2018-08-10 17:14:24', '修改菜单订单列表');
INSERT INTO `sys_fhlog` VALUES ('badca8dbbe144bd6952076ec71edd592', 'admin', '2017-09-25 10:25:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bae8b6703e1a4fc3aecc5651a0bf07c6', 'admin', '2018-08-10 17:14:25', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('baf3071deeaa46dea459e22e8102bb6d', 'admin', '2018-07-13 16:41:54', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('bb2a53ead8314c4cb1b04d2775560356', 'admin', '2018-08-02 11:51:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bb346de82b054b5388651cfad07ede33', 'admin', '2018-08-22 17:34:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bb5830483be244fdb14a89b2f9d030e3', 'admin', '2017-08-04 09:38:31', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('bb6ca9bc0b87420d8d27123224ab0099', 'admin', '2017-08-04 09:29:49', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('bb7130fe53724a759d84eb2fabffb388', 'admin', '2018-07-13 15:38:32', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('bb7edf933fa7449ea11576279423517c', 'admin', '2018-07-28 19:16:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bb87290eaa5f4e158c6ad8b9f6c4d878', 'admin', '2018-08-16 18:05:29', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('bb958b4430a44fecb203ca65d3fa6eca', 'admin', '2017-11-16 17:10:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bb96a7dccc514f72a85dc0266d1ae6a9', 'admin', '2018-07-13 16:42:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('bb9b548fbe0b4955ae2665fd15b4ed3f', 'admin', '2018-08-18 19:17:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bba7f27ed9314f8da3c125265430b137', 'admin', '2018-08-13 18:23:19', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('bbaa69634d23435d91cea567d765b1c0', 'admin', '2017-07-31 20:43:19', '新增系统用户：liwei');
INSERT INTO `sys_fhlog` VALUES ('bbb84874cc7f4896bec9e8363d99f01a', 'admin', '2018-07-13 10:36:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bbd1a72df0004c7db57fcc296f2b39d2', 'admin', '2018-08-02 09:50:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bbd2e40d54bb44c49a03ad3b78584888', 'admin', '2018-08-04 16:31:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bbda782a9f004db781eeb5d3b256ee0f', 'admin', '2018-07-13 16:42:36', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('bbf20b28770c4567906028264d8dcdef', 'admin', '2018-07-13 16:43:54', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('bc068743bd634820927bf4fd1b681855', 'admin', '2018-08-01 14:45:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bc0916ef9c274e8ca9aca7ef1c627b14', 'liwei', '2017-07-31 20:43:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bc19a930869a4bcf8d0c9770ef32dfd3', 'admin', '2018-08-17 09:45:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('bc1cabef1a154c57bc143645c07268bc', 'admin', '2017-11-15 17:11:03', '修改积分提成:0');
INSERT INTO `sys_fhlog` VALUES ('bc28b71191a644f0a673d502449d18ed', 'admin', '2018-08-08 14:14:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bc3210ca3fdb4f87a5f8bb77ac36beba', '18990673099', '2018-03-19 04:13:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bc385abcd1c7435e8210767ee576d105', 'admin', '2018-07-13 16:41:50', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('bc38f40f6529417fa61a6f3103722ded', 'admin', '2017-11-09 14:56:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bc46cd9683d74959b7baac72f8047ab7', 'admin', '2017-11-08 12:11:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bc49b4830bd34de9aab49063ccf981a5', 'admin', '2018-07-26 10:45:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bc64da9e211447f796147a972a6b194f', 'admin', '2018-08-10 17:13:37', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('bc6f9ee9e7f74a809db953b69c0ca499', 'admin', '2018-07-13 16:43:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('bc75ce2182f14d05ab2ec9fa3b1163e7', 'admin', '2017-12-04 17:13:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bc7c2004c197492fad7b3a9a05d80b30', 'admin', '2017-11-04 12:30:52', '修改积分提成:3');
INSERT INTO `sys_fhlog` VALUES ('bc80e3af4dc04bb6835408b59a73881b', 'admin', '2017-11-18 15:20:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bc8666bf6109485ca77840161246c446', 'admin', '2018-08-17 09:40:42', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('bca0858f0ee04508b06d694946821ef9', 'admin', '2018-01-06 10:23:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bca576be5b9042838d8dffac6581f00a', 'admin', '2018-07-13 16:42:25', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('bca7475b60c74559b1a4630b533f6d5f', 'admin', '2017-10-15 09:56:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bcad7b2dc54a48668146bf603b15262d', 'admin', '2018-08-14 11:21:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bce3e7e27eb14995acf6fd3d5c9e4220', 'admin', '2018-08-16 18:05:28', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('bce68662d5594f2797411411e4b72b22', 'admin', '2017-08-01 18:02:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bceb9bd9bcb141a388bc04c11e2c6bfb', 'admin', '2018-08-16 17:59:21', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('bced082d169243edbaf0bf50133d9228', 'admin', '2017-12-14 17:55:07', '删除系统用户：PageData [map={USER_ID=7abe16f290e6435f885ad59081efe335, tm=1513245307244}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@15598f2]');
INSERT INTO `sys_fhlog` VALUES ('bced3f21cb8848b59a4a92bf5a8bb459', '15982183168', '2017-12-08 09:33:33', '退出');
INSERT INTO `sys_fhlog` VALUES ('bceff0af62a742feaf6bbbbbb091ebd9', 'admin', '2017-11-20 18:06:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bcf53abade3448c28b36a4480330ed8e', 'admin', '2017-11-21 15:21:53', '新增菜单预约管理');
INSERT INTO `sys_fhlog` VALUES ('bd02c84b842242f793fcff9a398b88cb', 'admin', '2018-01-26 14:00:20', '修改菜单广告记录');
INSERT INTO `sys_fhlog` VALUES ('bd0932c30996408eadec7491006df326', 'admin', '2017-11-23 14:58:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bd26bba3bc9547268319e4e80e5f4e11', 'admin', '2017-11-18 09:31:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bd3da180694d40a997c146ce7f45ee11', 'admin', '2017-12-08 09:35:13', '新增按钮权限pdPageData [map={BUTTON_ID=fc5e8767b4564f34a0d2ce2375fcc92e, RB_ID=7be5c0e728b54310a9cf63e05e77e271, ROLE_ID=de9de2f006e145a29d52dfadda295353, guid=1512696913377}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@7f8d68]');
INSERT INTO `sys_fhlog` VALUES ('bd40972fca164ef2bff0d77d7483f1b4', 'admin', '2018-08-10 17:35:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bd509895e7a34b1fbed19150095b73c5', 'admin', '2018-08-15 10:22:45', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('bd54af446464462a9bb116e5d5b4ecf8', 'admin', '2018-07-13 16:42:31', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('bd71d87533524f93b76576bcdcb9418c', 'admin', '2017-11-17 14:11:31', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bd80377c08ec4055b1c1501bfc871d52', 'admin', '2018-08-17 10:40:39', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('bd8b48ba156d45c7abee833d8e4a1d48', 'admin', '2018-08-17 09:48:22', '新增菜单建议管理');
INSERT INTO `sys_fhlog` VALUES ('bda800af0abd4cc892a7409454e48895', 'admin', '2018-08-24 14:48:08', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('bda98992bbab4f719d0a8dee99bed8cb', 'admin', '2017-11-08 16:36:52', '批量删除user');
INSERT INTO `sys_fhlog` VALUES ('bdcd3996a70c4079bfb5604091a8cfb9', 'admin', '2017-12-12 11:18:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bde0d951b07c43cd92c3543244cf062d', 'admin', '2018-08-17 10:06:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('be4905b945ff41e3b7cb091710b03d39', 'admin', '2018-07-13 15:45:26', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('be5e4a2672be4dc786aa92f41ff1d374', 'admin', '2017-08-24 15:28:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('be7a22ac85d14e54b97492941b68d01b', 'admin', '2017-09-10 18:09:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('be7b7d1ff15a46d7a40f29a935cd1437', 'admin', '2018-08-14 09:22:08', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('be7d7f510b194da0b0e38d69730ec6b7', 'admin', '2017-11-17 17:07:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('be85f453e7934f029d21eec5eb0973d3', 'admin', '2018-07-13 16:42:04', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('be8b2b7f16b54ce99f308805aa7284a6', 'admin', '2017-08-04 09:31:17', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('be960b3b9a5540ec86cfcbcaa6d908fb', 'admin', '2017-09-20 13:10:24', '新增角色:三星级店长');
INSERT INTO `sys_fhlog` VALUES ('be990651a26b42be88ef7cdd075b283e', 'admin', '2018-08-11 12:02:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('be9fa4c697c9423a9db37f97e22fde45', 'admin', '2018-08-13 18:24:06', '修改菜单店铺管理');
INSERT INTO `sys_fhlog` VALUES ('bec9def00a1e40b99d47f2d3f2d2f1d6', 'admin', '2018-08-16 18:18:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('bee56c35f7034843964bea573914c951', 'admin', '2018-08-16 17:56:12', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('befe0a3e0a04461b86f5c806f8f53875', '18990673099', '2018-04-10 14:28:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bf09769dfaa040e98b03750d33959eaf', 'admin', '2018-08-17 09:40:42', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('bf115d2529f7487696c46a398f027d04', 'admin', '2018-08-17 09:42:17', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('bf15efacc8bb4fdbb2746c9eb98a8740', 'admin', '2018-08-10 17:48:17', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('bf36f1baecde4b0ea8df64c6a9f38e04', 'admin', '2017-12-11 15:06:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bf48903ae2e843cbac8fe6fb4cadfddd', 'admin', '2018-08-23 17:30:59', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('bf4c73ad31e347029bab670864d2687b', 'admin', '2017-11-27 09:28:17', '删除系统用户：PageData [map={USER_ID=ccde14b268bf4aada81ee01e59953044, tm=1511746097421}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@1b3fde5]');
INSERT INTO `sys_fhlog` VALUES ('bf58d47f862446e2b5473eb4471b8b52', 'admin', '2017-12-28 18:51:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bf60346ac3b449f28804d720055529a8', 'admin', '2017-12-12 18:14:58', '新增角色:审核');
INSERT INTO `sys_fhlog` VALUES ('bf7f0a6a40634a7a918ee0c77438882e', 'admin', '2017-08-01 16:46:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bf8be7752b074e6e9603fd3ad75d850e', 'admin', '2018-08-16 18:19:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('bf98c9c2617f456e84175f3577dde007', 'admin', '2018-08-17 10:09:47', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('bf9e48680adb4faa846c5dc328b1268c', 'admin', '2018-07-13 16:43:27', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('bfaa93a0e8224821a1dfceffe0356de5', 'admin', '2017-02-13 01:05:49', '新增菜单快递查询');
INSERT INTO `sys_fhlog` VALUES ('bfb2eb425fc34579953c101a92b73fd7', 'admin', '2018-02-07 16:45:23', '退出');
INSERT INTO `sys_fhlog` VALUES ('bfbd0528feef4228bb0566fc65acb95b', 'admin', '2018-07-13 16:42:32', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('bfbdea5e261747dd9034391eb4c7596e', 'admin', '2017-12-28 14:14:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bfccffe83bc1482aaafa3239e63064de', 'admin', '2018-08-17 09:47:37', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('bfe98b0d135c4a5fa701d8ba40caa63c', 'admin', '2018-08-22 14:41:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bff263aa30644e9fbcb81364ef9444ac', 'admin', '2018-08-23 17:33:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c001f003ed834de893dad04abb138742', 'admin', '2017-11-08 19:57:04', '删除菜单ID89');
INSERT INTO `sys_fhlog` VALUES ('c00358edff6f4a3384e4e05094df7efe', 'admin', '2017-10-30 12:10:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c006b834196948de93e22b2b6b07a31b', 'admin', '2018-03-05 15:58:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c00bf1bfaae544d68cbb0bf56f2fd84a', 'admin', '2018-08-16 18:43:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c0371103552545fe81a12ba24990a16d', 'admin', '2018-07-13 16:44:26', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c037c8345d5447bd824bda7503191f0e', 'admin', '2018-07-28 15:49:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c047f0ed7f144b0eb9cc2f8cc6234582', 'admin', '2018-08-09 15:37:31', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c04b7a636b724bf68ad54c7b93bace4f', 'admin', '2018-01-26 15:57:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c05de5e144f0437e8fdf3e239a263b11', 'admin', '2018-08-17 09:48:23', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('c0787907440e4a8fa3cfc54b27f79ac7', 'admin', '2017-08-04 11:05:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c07b4a9e2cc843acaa16e0a611dc9275', 'admin', '2018-08-16 18:16:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c0896881435649d69496ecf6c8612b2e', 'admin', '2018-07-14 10:28:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c08d2da5e5794d2a928a743c82194d64', 'admin', '2018-08-16 18:19:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c0a7238d28ea45429e32d6589e9c9ff1', 'admin', '2018-07-13 16:43:44', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c0af1229357845d39e1071c249c1d1b2', 'admin', '2018-08-13 18:24:43', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c0b553310dd54428ac2a2987bfce8493', 'admin', '2018-08-16 17:56:14', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('c0bc237d83f04751afcdfc640ff86fcc', 'admin', '2018-08-11 09:58:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c0dc872bf2f44f51993e25112f3ea80c', 'admin', '2017-11-27 11:10:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c0e13a5e9cfe4d4db5dac68661212976', 'admin', '2017-11-06 18:25:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c108710594634461815bcf7d49ebe270', 'admin', '2018-08-23 09:58:08', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c119b3f2230f4d9fa8a1871dc832e5fb', 'admin', '2017-08-04 09:35:07', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('c11c832ba08649609b4df6033a9fcb09', 'admin', '2018-01-30 10:50:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c11fdb6d96704959bd971620e5c16016', 'admin', '2018-08-16 18:05:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c121657682844f75be23123ec59870bf', 'admin', '2018-01-29 20:03:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c122e2e5ba6f45d681d714124efa81e1', 'admin', '2018-08-17 10:40:39', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('c1387ba53197470eb2fcf9e5640cab00', 'admin', '2017-12-09 13:12:11', '删除系统用户：PageData [map={USER_ID=280417faf62348ad82de85fa82206c85, tm=1512796331147}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@1adc7f9]');
INSERT INTO `sys_fhlog` VALUES ('c141ff06560f4742b5d36a977c3d73d2', 'admin', '2017-11-04 17:22:39', '修改金额提成:5');
INSERT INTO `sys_fhlog` VALUES ('c1444c5408444040bd782ce14aeeb206', 'admin', '2017-11-17 17:38:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c14804c61b8d470d8728c93ac710dd77', 'admin', '2017-11-18 14:24:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c1534adf5ff24a40b0b27b68fd7804f5', 'admin', '2018-08-10 16:24:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c15bd532a52f43a7ba6f888bec0f474a', 'admin', '2018-08-17 10:32:32', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('c1665eeb48f847219454445c464f906d', 'admin', '2017-11-07 17:20:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c169977c9b114f35858f7f04e891e967', 'admin', '2018-08-17 10:32:33', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('c16d19c9416046a29ced510329b9a330', 'admin', '2018-08-27 17:48:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c1786adbf14f43f6b7b08fee0aebcc8e', 'admin', '2018-08-13 18:23:18', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('c186faf297974208ba6f308b87afaede', 'admin', '2018-08-10 17:47:09', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('c18900afdecb45709b6daab95c6bb946', 'admin', '2017-10-26 18:17:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c19040b5cf1544528842d88c070203b7', 'admin', '2018-01-18 11:14:56', '删除菜单ID103');
INSERT INTO `sys_fhlog` VALUES ('c19b0c052fba40fab564638e732983ca', 'admin', '2017-11-27 10:51:48', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('c1d4a693162e40f5af5d62c1ec7a4b82', 'admin', '2018-08-16 17:56:13', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('c1d8f659d4034f0abd0eb64531be5953', 'admin', '2018-07-12 16:02:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c1e9e88a2e3448c898dfe2d58331592b', 'admin', '2018-08-16 18:05:13', '修改菜单建议列表');
INSERT INTO `sys_fhlog` VALUES ('c1f2407975a4437f9dafd7263c8d5ca0', 'admin', '2017-11-01 16:17:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c1f3682cf6314020aca91dbf44aba020', 'admin', '2017-11-27 17:57:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c2111719a9ce42d391320661f2a63dfb', 'admin', '2018-08-17 09:42:02', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('c236ab0ea7f549848bbc4fc59ecd2d9a', 'admin', '2017-08-05 11:27:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c23f96e006414768810aa7b5db5e8510', 'admin', '2018-01-06 10:21:24', '新增菜单一级类别');
INSERT INTO `sys_fhlog` VALUES ('c24f88af7638476e84481e65ffb3b7d3', 'san', '2016-06-06 02:29:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c26ec124a82a4f248b1379147e903e20', 'admin', '2017-11-08 19:54:32', '删除菜单ID101');
INSERT INTO `sys_fhlog` VALUES ('c2763c8e5b3a496eafae7a268a57d772', 'admin', '2018-08-15 16:34:31', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c297c9f034c5485c98b79d61cc4c646f', 'admin', '2018-08-08 14:09:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c2981c32147b468ca8a24957fc2a965b', 'admin', '2018-08-27 10:43:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c2abf3ba0b04465297e102f8c97df733', 'admin', '2017-11-27 17:20:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c2ae891008544b4ba47c31b50d9a7b72', 'admin', '2018-08-15 17:38:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c2bdd335c0114be8b35176009926e6d9', 'admin', '2018-01-05 15:39:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c2d34a0a35fd44dfb55d798491a52219', 'admin', '2018-08-10 17:47:09', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('c2db4d7bfdea46f48783066dd9489b34', 'admin', '2017-07-31 18:52:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c2df673101d34c75986262399bb3cc78', 'admin', '2018-08-13 18:23:18', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('c2e4775562ee43a283fecaefb6ffc148', 'admin', '2018-08-17 09:58:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c2eb499b300a4f1f9acf0a3552169615', 'qq728971035fhadmin', '2017-08-04 09:39:27', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('c2ed4a83f1374a129febf60e6fad72aa', 'admin', '2017-09-23 18:49:52', '删除菜单ID98');
INSERT INTO `sys_fhlog` VALUES ('c308cfa5cbea41e0bc0825174aa8b1f9', '18990673099', '2018-03-01 12:15:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c33dd313bf614e6ea7ea683a61f3bfdf', 'admin', '2017-11-07 11:40:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c34c4a182402445c8ad8369af54ec7d4', 'admin', '2018-08-18 18:12:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c359d0404bcc48e2b89ea834548aca16', 'admin', '2018-02-06 10:30:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c35f97ca3d0e4b408961f8e7e7815d8b', 'admin', '2018-08-18 17:38:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c37171393dd04bbeaf88e52b6f665630', 'admin', '2018-07-13 16:44:17', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c374b71050ca4d09912029e8c5be1844', 'admin', '2018-07-13 16:42:45', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c37d117c136f4e2ab0367b1e7ece2980', 'admin', '2017-08-31 15:31:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c383b8e9cca0477fbfad8e9e6184e735', 'admin', '2017-11-23 19:25:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c38e0e32caf54de2b9a684d05e3875c3', 'admin', '2018-08-17 09:39:58', '新增菜单建议');
INSERT INTO `sys_fhlog` VALUES ('c39e47f9df744413a8966ded4fd4adac', 'admin', '2018-08-17 10:03:18', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('c3a01cc991fe44939aef21ec1be79d96', 'admin', '2018-08-16 18:02:18', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c3ecb8ab4c6f4eb486ec83872c4ee427', 'admin', '2017-03-16 01:03:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c3ee948818b446e0981a84c97825cc3c', 'admin', '2017-12-02 09:52:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c3f0e5d93216434b8aa45e0d36191ee3', 'admin', '2018-01-26 11:43:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c3f7e37594e94a3ca31c6f79b890fcad', 'admin', '2018-08-16 18:02:17', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c3fa42f08be84730aecc4650225461ad', 'admin', '2017-12-29 13:14:08', '修改代理介绍:<p>sdfas</p>');
INSERT INTO `sys_fhlog` VALUES ('c408627605164282a4e477074b9db4a4', 'admin', '2017-11-04 12:52:07', '修改积分提成:5');
INSERT INTO `sys_fhlog` VALUES ('c419338ab9be4954948720a5a9ffe140', 'admin', '2018-07-13 16:44:32', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c44b17be9ca94d0a84e7c61b3659f0ef', 'admin', '2018-08-22 18:39:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c462975ead4f4d82ba212684d37a77b5', 'admin', '2018-08-10 17:11:00', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('c4669c3acec54b33980952ccc33fc01a', 'admin', '2018-07-13 16:44:17', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c4695d6fb91a4cc2b79836bb4a5fe0e8', 'admin', '2017-11-07 13:43:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c493ace1abf34267b301c98bbe2b4379', 'admin', '2017-08-05 22:09:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c4a406723504443e9648398adb938aa4', 'admin', '2018-08-16 18:05:28', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c4c125d7c3244de2b121358c94b3f2f3', 'admin', '2017-12-16 11:08:13', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('c4c183a0ca5346648b0fbc4329f42c49', 'admin', '2017-09-08 12:20:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c4c7ffe3c97947c58fb848acde13405d', 'admin', '2018-07-13 16:43:47', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c4e9e0ebec964573a6055a25194d392d', 'admin', '2018-07-13 16:44:01', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c4f0738a18694623ba30af18499f06cc', 'admin', '2018-08-17 09:39:59', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('c4f7e5df98094ed3a530236cf026aa56', 'admin', '2017-08-09 10:14:02', '修改菜单订单管理');
INSERT INTO `sys_fhlog` VALUES ('c51d5e22fd0d43458f245b0ca1a5f964', 'admin', '2017-11-17 13:19:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c51fb267e5334b9f8bf616f95d179ca7', 'admin', '2017-11-04 12:38:20', '修改角色:注册用户');
INSERT INTO `sys_fhlog` VALUES ('c53ccb8c87494342a2315b7ec5c676b3', 'admin', '2017-12-15 11:02:58', '修改积分提成:1');
INSERT INTO `sys_fhlog` VALUES ('c558005e6fb141d888911bd3ab789c57', 'admin', '2017-11-17 10:08:58', '退出');
INSERT INTO `sys_fhlog` VALUES ('c56ea3a4fff14a1d8d091b8defc5094f', 'admin', '2018-07-13 16:43:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c598b9c0e4584b748e4c8cafa7c42282', 'admin', '2018-08-02 11:03:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c5a2e8c01cb74766977bbde0e4156256', 'admin', '2018-08-14 09:22:09', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('c5be28b3b5174d049fcde693e5098bb5', 'admin', '2018-07-27 09:14:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c5becf0b36294774a35b187aea12d8c2', 'admin', '2018-06-22 21:42:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c5d9c0cbbed8416e93f6480187b02631', 'admin', '2018-08-17 10:38:45', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('c5e35d8d20404646b858dc25fc696578', 'admin', '2018-01-18 11:14:10', '删除角色ID为:80ac61d78da84e808ae7a19e8157a20e');
INSERT INTO `sys_fhlog` VALUES ('c5f218e4f97b417c98106cbcaff0d7e4', 'admin', '2018-07-13 16:42:22', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c5f6100a48e849868b4c091c8a3cad2b', 'admin', '2018-03-15 18:01:39', '退出');
INSERT INTO `sys_fhlog` VALUES ('c5fc7a9a95d14faab1372c81f040a757', 'admin', '2018-08-17 09:48:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c60a456b3be54b1eb73f8dce7f54f354', 'admin', '2018-08-10 17:48:18', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('c60cb9a8178c46d9b6ed16924cd0524a', 'admin', '2018-08-17 09:39:59', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('c616805ab6e247d3b27734b4a31c68ad', 'admin', '2018-08-17 09:48:24', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('c6196f3d89ee4cea88bc9a7046fa2b93', 'admin', '2018-08-16 18:02:18', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c61ea91e29754aa18641f731f94d7bc8', 'admin', '2017-12-15 11:02:49', '修改金额提成:1');
INSERT INTO `sys_fhlog` VALUES ('c6297ca2e4cb4827988276633aa8969c', 'admin', '2018-08-10 17:10:59', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('c629f38ee3bc498aa3146567dfd726b1', 'admin', '2017-11-04 17:40:59', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('c62a6b95be6f44d383ed3b9e90fb4150', 'admin', '2017-10-31 09:33:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c6391b994e814285ae531fd24e6bb75c', 'admin', '2018-08-17 10:32:33', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('c64134e3fb2945a78da632463ee3c84d', 'admin', '2018-07-13 16:41:56', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c645aa7da790460da88e80c88dd23010', 'admin', '2018-06-18 11:03:20', '删除菜单ID126');
INSERT INTO `sys_fhlog` VALUES ('c662116ca8fa4df3859bec6f773024c9', 'admin', '2018-08-10 19:30:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c668cbe4f7c94656becf91e85ad732e1', 'admin', '2018-08-10 17:13:35', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('c6790596969e49af99db936161f25e0a', 'admin', '2017-11-07 21:07:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c6803f1a404341a58cbe67ab434da58b', 'admin', '2018-08-17 10:34:10', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('c697e022e805467ca6635b9f95db2a56', 'admin', '2017-08-09 10:22:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c699962ee1014ebeb00edf2cbebec26b', 'admin', '2018-08-21 15:10:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c69e5b9ec00a44fcb38326d3d8d13397', 'admin', '2017-10-15 11:53:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c69faf54087a466283d8b9b7cdd5e0f3', 'admin', '2017-12-11 16:23:53', '修改系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('c6b27f0d3bb6445c8e4a04dd6df85617', 'admin', '2018-08-16 18:04:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c6c4b8d93b7e499b82c90e8539ed8a63', 'admin', '2017-11-04 17:55:49', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('c6c4f22f30894e09aff19e4671d566f8', 'admin', '2017-11-08 19:57:21', '删除菜单ID50');
INSERT INTO `sys_fhlog` VALUES ('c6d524d5d90d4d1e85f82564fc0f0491', 'admin', '2018-01-28 19:55:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c6d977d1794e4834a95dac6b1a0d5ed0', 'admin', '2018-07-30 14:15:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c6dd5b6873a14e01a37b5077ff8390c2', 'admin', '2018-07-13 16:44:37', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c6e31e54f2e84025a910474d094c5cdc', 'admin', '2018-08-18 16:02:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c6f6b5bd7fc743ab9a4f1cf166f5d5c4', 'admin', '2017-08-18 07:13:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c6fbf4a7448f4e8fb2c7853062b7dc6f', 'admin', '2018-08-16 18:02:17', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c714d74b17404cb68a9106470490e353', 'admin', '2018-08-13 18:25:23', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c726222c9ce24eb88ec7044047bd6404', 'admin', '2017-11-08 19:57:56', '删除菜单ID6');
INSERT INTO `sys_fhlog` VALUES ('c7293408a8c4419c8018e9614322e190', 'admin', '2017-08-09 12:30:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c73ab99dc9b6434683366c86e74528f0', 'admin', '2018-08-17 10:04:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c73d924b88db41a684d6525f2778ddce', 'admin', '2018-03-07 14:36:44', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('c747c20e6c79481aacd958a4759ac075', 'admin', '2018-07-13 16:43:32', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c7489ece9dc44dafb5f09c17b771d63b', 'admin', '2018-07-13 16:44:00', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c74b3fb1122e48d483d9b551570ab54b', 'admin', '2018-07-13 16:42:48', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c75908c35f1445bb919f165ffdea335c', 'admin', '2017-11-11 10:04:48', '删除菜单ID99');
INSERT INTO `sys_fhlog` VALUES ('c75beaa676d14fcab149266741ea1eb8', 'admin', '2018-08-10 11:57:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c7602bb5d0b04bf5a9d62ef731c5a1c4', 'admin', '2018-08-09 09:22:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c7742c525d1443ffa9a8972863579681', 'admin', '2018-01-31 16:14:41', '修改菜单公告');
INSERT INTO `sys_fhlog` VALUES ('c78205567699476abaefd89c58e99d1a', 'qq313596790fhadmin', '2017-08-04 09:27:58', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('c7c0cbf7dbe54cb799ceb9671764eeae', 'admin', '2018-07-13 16:42:43', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c7caae9b1887419ab0d56a590978d5f4', 'admin', '2018-08-16 18:02:37', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c7d5731b73414d7bae153188ac3cc8a3', 'admin', '2018-01-22 10:42:05', '修改菜单OA办公');
INSERT INTO `sys_fhlog` VALUES ('c7e8860268624d8e9e74a8040c19ce82', 'admin', '2017-12-15 11:01:48', '删除角色ID为:b53bd295f19a4a2fabceb40586e120f0');
INSERT INTO `sys_fhlog` VALUES ('c808fa2fb09c4c7b812d2325b0e1ae00', 'admin', '2018-08-16 18:02:18', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c819622b082c4a4f954ccd7f5db0c817', '18754621234', '2017-11-04 17:17:47', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('c81d8d8d1e09458a998e986af59c41a6', 'admin', '2018-08-14 09:22:10', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('c827aec39d384c379c1353d5ca2ed680', 'admin', '2017-09-07 09:31:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c835bf77df0b41ca833ceab6067fd09c', 'admin', '2018-07-13 16:42:39', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c8513c9332c44212a4b9506470fb6df2', 'admin', '2018-08-16 17:45:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c8563c3172fa44c5bd39e5d5fef9e51e', 'admin', '2018-08-13 15:33:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c8585655b09349c385f03cd4be9efe10', 'admin', '2017-11-18 10:39:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c85d45409abf46b3a9a9906823370356', 'admin', '2017-11-17 16:48:18', '删除系统用户：PageData [map={USER_ID=c2b4b0f5337840fea9e2a3e9627d4681, tm=1510908498827}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@1965a6c]');
INSERT INTO `sys_fhlog` VALUES ('c868daa41a9a48deb9446f97e6f08fa1', 'admin', '2017-11-29 14:52:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c86add3ab7fc48e5bd96bb60dc9cd1df', 'admin', '2017-11-04 15:05:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c86d2d8368024bea94826772f901594e', 'admin', '2018-08-13 18:24:44', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c87f6ad0bd524b6eae5255509d7ee5bc', 'admin', '2017-11-08 13:54:38', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('c886f3955eac4f07aa79e58d9c528982', 'admin', '2018-08-23 09:58:08', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c8bbe0eaa2324c51bd0ec151887ea027', 'admin', '2017-11-04 17:18:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c8cb97ad7e434ff1948fa2ed66185c3e', 'admin', '2018-08-16 18:05:29', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c8ebd506b35e4aea92bd97e0dc51de66', 'admin', '2018-08-17 10:09:45', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('c8f6d0bf7e5f46dc8e92eadfc1ec839f', 'admin', '2018-08-08 16:28:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c902c6a8e6e74ba789707f0ba445cecf', 'admin', '2018-07-13 16:44:09', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c905c987925242d29039c76a8a102b6f', 'admin', '2018-08-15 10:22:45', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('c932c07ad2d0433f9b775262b70ab8d7', 'admin', '2017-10-31 15:16:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c9340ce506414dc6975f96dec175bf92', 'admin', '2017-08-28 10:27:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c946d50e3d6348d58ac512799eb2dbb7', 'admin', '2017-11-07 21:21:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c969fa36043d44f7afe80f0e712781ea', 'admin', '2017-11-08 19:56:30', '删除菜单ID16');
INSERT INTO `sys_fhlog` VALUES ('c96a17968f13491c8635f84c9baf2526', 'admin', '2017-11-21 20:08:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c96b34bd2ea6451b94116f260b52ed61', 'admin', '2018-08-13 18:24:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c971229cea604740b488c9e39e14cf2a', 'admin', '2018-01-28 19:42:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c9806bf0a5a448b68311a50ab00513a1', 'admin', '2018-07-13 16:42:37', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c98150b85df84ab89b8e1b928bc2649d', 'admin', '2018-07-13 16:42:08', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c986006608394a61b9d9aa7fc9e588b1', 'admin', '2017-11-21 15:22:27', '退出');
INSERT INTO `sys_fhlog` VALUES ('c9bf02e161a14a85ab181fb9bf0e2ab8', 'admin', '2018-08-02 13:10:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c9cc5667a82f4f838a391219aa5fd0e7', 'admin', '2018-08-10 17:47:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c9d74390f5b74fcab87ec5baebb99900', 'admin', '2018-08-24 14:48:10', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('c9d744da1c7c431ab824d14578c17360', 'admin', '2017-12-15 15:17:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c9faf1f29ad0436aab3b0cbfbd065b2f', 'admin', '2018-08-17 10:38:42', '新增菜单所发生的');
INSERT INTO `sys_fhlog` VALUES ('ca00a89ddc064264a6347cc617e0ea98', 'admin', '2018-08-02 11:53:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ca045d1ba68f4772b8a531058deba72e', 'admin', '2017-12-11 12:35:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ca158e4a4d2e43898cfb999a3f4be293', 'admin', '2017-08-13 11:15:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ca1f9c504cac4e39b3d4d954c687f1bf', 'admin', '2017-08-09 10:13:51', '删除菜单ID75');
INSERT INTO `sys_fhlog` VALUES ('ca2c161339a847a7a5dfa0faa0e0af30', 'admin', '2018-08-17 09:48:22', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ca2c18a4d20c477c9ab55f1dbdd1b36f', 'admin', '2018-08-17 09:42:02', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ca34f43ba558475b89caea83f205b524', 'admin', '2017-09-20 13:07:11', '删除角色ID为:34f9234fa5914bfea5cc8c632f72ca04');
INSERT INTO `sys_fhlog` VALUES ('ca3d15a5a4db4d8eb05532885a67e20d', 'admin', '2017-10-15 09:35:31', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ca4620670cfc41ae821e3836d0be4bbc', 'admin', '2018-08-04 15:03:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ca4628280cf24f8893d2fb090ed7111b', 'admin', '2017-11-04 18:43:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ca554217cf2a4d4988afb36b94dcca48', 'admin', '2018-07-13 16:42:20', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ca605e12280547ab92c6272154dbd1ba', 'admin', '2017-12-08 09:30:35', '修改角色菜单权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('ca60d10689334a578d02b20a80670928', 'admin', '2018-08-17 10:32:32', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ca62821b77f44c30a2da83d28ce9e6d4', 'admin', '2018-07-13 16:43:50', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ca65f52a8f044685a6c8f9197e2b7336', 'admin', '2018-08-23 17:29:54', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ca75520c23a941e49a7a3fd9b55f0ef8', 'admin', '2017-12-15 10:09:51', '修改菜单服务管理');
INSERT INTO `sys_fhlog` VALUES ('ca7da821d4e144ca8c1d7831d74ca5c2', 'admin', '2017-11-04 17:45:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ca836d2f573343098329ace00e1a2abc', 'admin', '2018-07-13 16:42:47', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ca8a434e8bcb432c8611047de116a163', 'admin', '2018-08-17 10:40:38', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ca9549299aae4c65bc2161700f135fa9', '18990673099', '2018-06-01 10:52:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('caad44e107014c0a9bde6494d3538257', 'admin', '2018-07-27 14:31:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cac7748748f14c1ba2d1e2787e9c45a8', 'admin', '2017-11-23 15:00:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cad7b83596374873842dbd1b975d2b0f', 'admin', '2017-10-07 15:11:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cae1dd2b978c4aad83b088618743def3', 'admin', '2018-08-16 18:05:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('caf7f0f5742f48b69693c80aa4a916f4', 'admin', '2018-08-10 17:48:18', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('cb0ae591676141f9b05cb799d5e7b7c9', 'admin', '2018-07-13 16:43:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('cb1e54396b0548baad821a90ffcd55e7', 'admin', '2018-08-17 09:48:22', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('cb1e8197e95d4cc99562fed3fdc6ce04', 'admin', '2018-07-13 16:43:39', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('cb2b76884616429da88ab8255dcc7168', 'admin', '2018-07-13 16:43:09', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('cb2fc63f9e554a60b0fe0350119189ad', '18990673099', '2018-03-15 15:37:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cb36c78e32f8493aa4ec1c11ec108cb1', 'admin', '2017-11-22 16:02:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cb48c1304bf54fe18d06178f02bc4c61', 'admin', '2018-07-13 16:43:01', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('cb5cc6a0b58f4f6093c06196573d6c0a', '18990673099', '2018-04-07 17:59:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cb5f4c1f16df4b5a89d380d6675ed92b', 'admin', '2017-12-04 16:18:57', '修改角色:客服');
INSERT INTO `sys_fhlog` VALUES ('cb647d54d3a7499abb182204a2094004', 'admin', '2017-10-05 08:30:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cb683cea73334e33aca283b8d7efd97b', 'admin', '2018-08-17 09:40:42', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('cb7fef45d87d40cb8a70ebbf65c72d55', 'admin', '2017-11-04 17:49:57', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('cb9c1f7b94f54f32b4c4cbc2d802f2ac', 'admin', '2018-01-26 15:28:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cba144f5737544ffba4876b50eaeafb6', 'admin', '2018-08-13 18:25:24', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('cba3c677608c486fbef2245b82e2143d', 'admin', '2017-11-15 19:30:13', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('cbab2e5f8d024363aa34fb5027faa972', 'admin', '2018-08-02 10:38:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cbb5ac38d3634c4086f11f63ff8674d6', 'admin', '2017-11-17 16:46:03', '新增合作商家：null');
INSERT INTO `sys_fhlog` VALUES ('cbba5d424a074795a4f140b3d0a4360f', 'admin', '2017-11-29 19:51:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cbc3a31021a44dcc81aa6e013e1b43c4', 'admin', '2018-08-16 18:02:18', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('cbcb18f21c2e4866873fa38e92b6256c', 'admin', '2018-08-23 17:33:15', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('cbed756c53af4ef6b13f5b6b40302ac3', 'admin', '2017-08-04 09:26:29', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('cbf8563ab88a4570848acd979187fbd4', 'admin', '2018-07-13 15:38:32', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('cc10958d395247478a36024b275ebcbd', 'admin', '2018-01-22 14:35:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cc1231f152bf4030a93d4cdaa2345e3c', 'admin', '2017-10-09 12:41:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cc16e0aa7a46414492a164823dc6ab4e', 'admin', '2018-08-15 10:32:45', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('cc37f11571884b78ab06bf7434abc254', 'admin', '2018-08-13 18:23:17', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('cc47badbd976415e9e5bd09c48b4dbd8', 'admin', '2018-08-17 10:01:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cc4aa7bcc6674b5cad93ce7f64f2552a', 'admin', '2018-08-03 10:23:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cc4cd7aee1964cdeae6d274550ed94ce', 'admin', '2017-11-04 12:04:48', '修改金额提成:3');
INSERT INTO `sys_fhlog` VALUES ('cc501d3b298e415395db6b37158bacb8', 'admin', '2018-07-13 16:44:21', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('cc55f72fa03c46a3a6cad2bdc6e5d684', 'admin', '2018-01-18 11:11:35', '删除菜单ID119');
INSERT INTO `sys_fhlog` VALUES ('cc71c700ae5e4cf7a95fe602ab4f9882', 'admin', '2018-07-13 16:43:53', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('cc7f9e222c2d4d0892bb9de7a07123ba', 'admin', '2017-11-22 15:46:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cc86df456c334ca6aa7613adebc8e2cf', 'admin', '2018-01-25 11:49:35', '退出');
INSERT INTO `sys_fhlog` VALUES ('cc8797354e5140cdb10f56862a727355', 'admin', '2018-08-15 15:35:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ccbb320a5b444b738a40e476a1395ae7', 'admin', '2017-12-04 17:22:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ccde08176b2e4801a78c1e6c7a9e22b8', 'admin', '2018-08-14 09:22:08', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ccff3ef8351c405fa952e2bb050a05f5', 'admin', '2017-11-20 18:36:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cd00ee80801c401db5b49d7e969a9835', 'admin', '2018-01-26 15:54:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cd0e3861742a41ecbfe9e04c3fc32bdb', 'admin', '2018-08-10 17:47:08', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('cd13cc3c0c63497387d0784c28d839b9', 'admin', '2018-03-04 21:40:17', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('cd180d8d934a4e269c94c82df4bbbf48', 'admin', '2018-08-13 17:23:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cd25ebb1891e4597990d5ad19d5aecde', 'admin', '2018-08-17 10:40:39', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('cd3383e15363435d99b919fc6de5c289', 'admin', '2017-09-20 13:20:48', '修改角色:钻石卡');
INSERT INTO `sys_fhlog` VALUES ('cd4649d75b67462c895fc301e407696b', 'admin', '2018-08-02 12:54:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cd4719ca2f85497ea6a215c3cc845920', 'admin', '2017-09-07 14:52:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cd4c59147e624df48228e245fbe3ba99', 'admin', '2018-07-28 10:51:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cd50c5dfd7a5436fb37e589d88a85c23', 'admin', '2018-07-13 16:42:16', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('cd57b41a3a814f788abe5b12075c01d7', 'admin', '2017-02-13 01:05:56', '修改菜单快递查询');
INSERT INTO `sys_fhlog` VALUES ('cd5a639d14964295a7abe4edcd1e5f06', 'admin', '2018-07-13 16:42:27', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('cd6c5a6054c844b585d1a92d93b05f01', 'admin', '2017-01-12 00:59:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cd72b1561e644d149903bd01e2c8b5ba', 'admin', '2017-12-14 17:50:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cd9060e25cb1484c847c4cd85ee02e5b', 'admin', '2017-08-21 11:12:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cd9088f902304d72b1ec87602c263faf', 'admin', '2017-08-17 15:00:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cd950af3eb394fa29d9068ddf8ce738e', 'admin', '2017-11-22 11:37:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cd98b57fa4be4840b93350ea0ca655c5', 'admin', '2018-07-13 16:42:31', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('cdb8c79969754778b11195dc8472fd5d', 'admin', '2017-11-30 11:20:54', '修改积分提成:2');
INSERT INTO `sys_fhlog` VALUES ('cdc4dc1c82e34d02bc1690c4867f2620', 'admin', '2018-08-16 18:05:04', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('cdd37ede7c3741f0ab970b8b63992021', 'admin', '2017-10-31 17:48:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cde61e5722b34dc199bbfa69ecff6ec9', 'admin', '2018-08-23 17:33:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('cdebb6de4b9143a28a48d74a627c81fb', 'admin', '2018-07-13 15:38:32', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('cdf2a4d61dec4b1fa1ec6122aa6d03a2', 'admin', '2018-07-13 16:44:06', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ce13db83031741d489633103447d4d25', 'admin', '2017-11-04 16:00:36', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('ce6ee51f008d4065b0f1585dc7c5d8d3', 'admin', '2017-12-04 17:36:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ce7f8feb1898404792aa85944f143bdd', 'admin', '2018-08-17 10:01:12', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('cea001673cc844f58535ce44c657af91', 'admin', '2017-12-02 18:18:42', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('cea4f777007543f9bb712ea83881a2f1', 'admin', '2018-07-13 16:43:50', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('cea560b595434ba493dceff915c7ba53', 'admin', '2018-08-23 17:29:52', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ceb5901772f54f5eb9727dadc82f0702', 'admin', '2018-08-17 09:40:55', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('cebcc6da9ac1457bb8e97606a24b27e7', 'admin', '2017-11-08 11:30:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ceca069138144d6eaf5c86caaa541c43', 'admin', '2017-11-16 11:22:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cecd17673898475498ee0aa57351777c', 'admin', '2018-01-09 14:05:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cecfd9df31e54a2390a1d41e66e29c16', 'admin', '2018-02-05 10:40:04', '退出');
INSERT INTO `sys_fhlog` VALUES ('ced04575c2524bc89b29fdc1a95b629d', 'admin', '2017-12-13 09:15:42', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('ced5dc1c11f4444ca83a48302a3df87f', 'admin', '2018-08-10 17:47:10', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('cee35d4947304eda90d5f04bf5ce66cb', 'admin', '2018-08-13 18:23:17', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('cee59771408444f2b4998c8bc458f26c', 'admin', '2017-03-16 01:01:56', '退出');
INSERT INTO `sys_fhlog` VALUES ('cee631dfa9d1455083a74ebc2d468bd4', 'admin', '2017-11-17 19:43:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cee666f982f2494cbcfc2ded8f220445', 'admin', '2018-01-30 11:50:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ceffb46361624542b0f3e132a840f70d', 'admin', '2017-11-08 19:56:33', '删除菜单ID19');
INSERT INTO `sys_fhlog` VALUES ('cf03da03e7d44e1d9aeae100ff01e586', 'admin', '2018-07-13 16:42:00', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('cf071329a7d34608883047e99ca00ebc', 'admin', '2017-08-29 16:49:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cf2657bb869c4ea3bbc2f13a326eec04', 'admin', '2017-11-13 17:52:55', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('cf3007474931424aa42314f8a3a16e2f', 'admin', '2018-08-15 10:26:35', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('cf515c7c19f349caabf41531b13eaa02', 'admin', '2017-08-06 10:21:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cf52dcc59ea94dcbab23eb08194f90f9', 'admin', '2017-08-01 19:30:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cf5de12d902e4430818d853c02f62758', 'admin', '2017-12-04 16:18:50', '修改积分提成:1');
INSERT INTO `sys_fhlog` VALUES ('cf60aaab67f842c6a819c38de195ac80', 'admin', '2018-07-13 16:44:18', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('cf85e90a5ccf4584a336a4dab27e0952', 'admin', '2018-07-13 16:44:15', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('cf9505a2bc2043d9bda48f4732fd20f9', 'admin', '2018-08-10 17:13:37', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('cfaee04c2ca94148986644c84c6e7373', 'admin', '2018-04-19 20:42:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cfafa29cad654a34ae69b31c32bf84da', 'admin', '2017-11-15 13:38:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cfb426ba37e44516983256e7450ac35f', 'admin', '2017-12-15 11:02:03', '修改积分提成:1');
INSERT INTO `sys_fhlog` VALUES ('cfb8e4e3b6a94220bcc89762a0668d64', 'admin', '2017-11-13 18:15:01', '退出');
INSERT INTO `sys_fhlog` VALUES ('cfbbea5b55ee4b0d911647dad5de178e', 'admin', '2018-03-05 19:35:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cfc5794e51084ae09965f6adc4c30d1e', 'admin', '2017-11-09 10:57:04', '修改菜单增加地址');
INSERT INTO `sys_fhlog` VALUES ('cfd2fdbd80424d73b58ba36408ef6041', 'admin', '2018-08-15 18:46:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cfd39f1be05f453a925f15cae93f261f', 'admin', '2018-08-16 18:02:36', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('cff0d42ae58a4028a4dfe74ac337366c', 'admin', '2018-01-22 11:37:31', '退出');
INSERT INTO `sys_fhlog` VALUES ('cffccd0130984a19a7afd4b18feac3b5', 'admin', '2017-08-31 11:52:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d02c22667d3c468884eda6dcd9341e0e', 'admin', '2017-07-31 20:17:39', '修改角色菜单权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('d04bbd1473ad460aaf8389331981f047', 'admin', '2018-07-13 16:43:15', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d05a193832f14ea0b308ad505d0f87ee', 'admin', '2018-08-23 13:49:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d05cd7503a0b468db6cdcbc6e2dd51c9', 'admin', '2018-07-24 18:01:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d065445b1f84450e8c3d61a25613040e', 'admin', '2017-11-20 14:17:41', '删除角色ID为:9be21a8acf89482fafac82c539b46d09');
INSERT INTO `sys_fhlog` VALUES ('d0750f71c23c4abcab60f8bb17d43611', 'admin', '2017-12-05 14:30:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d0764aaf94fb4982ad851065e192656b', 'admin', '2017-08-09 10:16:28', '退出');
INSERT INTO `sys_fhlog` VALUES ('d081f39e6de54d7b8fbf5a5a9a7232b4', 'admin', '2018-08-24 14:48:08', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('d0973f1e15b94e6783e5cadd6d92c197', 'admin', '2017-11-18 14:57:12', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('d0afc4154fac42c3a91f91867d0174dd', 'admin', '2018-07-13 16:43:47', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d0c03fc783074419a362e6a9bf31f5c5', 'admin', '2017-09-23 18:25:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d0cff59c0eb74b49aaeef680921cac41', 'admin', '2018-08-10 17:14:25', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d0f413e124fc40c28faa930bd1a3cf9a', 'admin', '2017-11-16 19:02:39', '修改菜单合作商家');
INSERT INTO `sys_fhlog` VALUES ('d1034f6a1b364da2a703bcdcec9135d0', 'admin', '2018-07-26 12:13:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d104d8261ddd44b28a27c5462041d2b4', 'admin', '2018-08-17 10:40:38', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('d108cbb00edd49e78c8abe1f3bef2f6e', 'admin', '2017-10-31 10:09:01', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('d10d4c2e468d4bfc994b93dca0394cf7', 'admin', '2018-08-16 18:19:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d115113247b94e3da0e3e5c29317690a', 'admin', '2018-08-17 09:47:36', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d119a6a9b2a64868ab0139d02f0364ae', 'admin', '2017-08-06 20:36:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d119c5eec3724f4c96dd185057b39fd8', 'admin', '2018-08-14 09:22:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d14fcf3c18c944ff83a42829a97e054c', 'admin', '2018-08-10 17:47:08', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('d1539d9ba4c041d9af4616416e0489be', 'admin', '2017-12-27 15:13:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d181b4680cd04ea9b902bd96b87d412f', 'admin', '2017-11-09 14:47:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d19310a122114ce8b3b75e407e971f2e', 'admin', '2017-07-31 20:17:59', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('d19aff6f976747559dddebf94fe201c1', 'admin', '2016-11-02 01:14:11', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('d1bc50794bbb48a293a759ad62bd9e29', 'admin', '2017-12-16 11:32:04', '删除角色ID为:69e11502ea7049da86aedf847e864268');
INSERT INTO `sys_fhlog` VALUES ('d1bd3a80a3bd423cb1b43af654fa2a4e', 'admin', '2018-07-13 16:41:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d1c27a864a074ebe99b324ced8539c58', 'admin', '2018-08-17 10:38:46', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('d1c7d650a16d46c5a1ae68efe055b341', 'admin', '2017-12-28 11:10:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d1d3af18cece4b0f8d7489e679b3acd9', 'admin', '2018-07-13 16:43:11', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d1d5f84cfff547a9a575b3bdecfc1875', 'admin', '2017-11-23 14:44:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d1d6694f1fb548a3ae02bd6dc4441330', 'admin', '2017-12-04 09:14:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d1ddffb9bbd14d2890e51b461570a5da', 'admin', '2018-08-17 10:06:50', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d1de940a7c4147bc8691c038defd62fa', 'admin', '2017-03-29 01:22:34', '退出');
INSERT INTO `sys_fhlog` VALUES ('d1e3674310fa42c0b871d86bfa639ce6', 'admin', '2017-11-15 17:09:36', '新增角色:商家');
INSERT INTO `sys_fhlog` VALUES ('d20cbba457164d7f968053ef1eebb21c', 'admin', '2018-07-24 18:04:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d216b789d21a4646a4f87cc19fa3fecc', 'admin', '2018-08-16 18:02:37', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d21c54bff59b471ea1a9668a7236c3c7', 'admin', '2018-08-10 12:03:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d226041080764c79807305aba5af6fb8', 'admin', '2018-08-17 09:42:17', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d232b0f7ab684da9b19c4213dfeac065', 'admin', '2018-06-01 13:34:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d238b50b3dc64f369f7a890f66ef04b5', 'admin', '2017-11-04 12:38:20', '修改金额提成:3');
INSERT INTO `sys_fhlog` VALUES ('d24c674aee5b48dba2a99f5ed9ffd8a9', 'admin', '2017-11-28 18:00:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d2879db546b0456ca6fc2fe7e76bafa3', 'admin', '2017-12-16 10:55:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d28953e47ff14ce18b396b58bd982037', 'admin', '2017-07-31 21:23:51', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('d2adba67b0ed4bf98c1528eadbf12c4b', 'admin', '2018-08-21 10:44:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d2bc9f7b55be4898921f513dceff2a96', 'admin', '2018-07-28 15:49:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d2c24c5c5b50483da38685cea4c2835e', 'admin', '2018-08-16 18:19:39', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d2c64fa467584ad5acddf88e5f58ed9e', 'admin', '2017-11-11 10:59:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d2c8f4dcbefe4840b4ea5af707954ea7', 'admin', '2018-07-13 16:43:09', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d2d3318bec5b4393a5348878a11a0d4d', 'admin', '2017-08-06 10:56:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d2dc0076f300492aa8bf5e4fa1a23336', 'admin', '2018-07-14 11:21:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d2ef1499f9df4507a233c1199ec0f562', 'admin', '2018-08-16 18:05:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d2f58c1f52824fa8baef959c5357c0ad', 'admin', '2018-02-25 10:25:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d2fc406ec99c43c4a4420dd5784a51f0', 'admin', '2018-08-10 17:10:58', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('d30c993dd85b47b586e32d848f0bde6e', 'admin', '2017-12-09 13:06:13', '删除系统用户：PageData [map={USER_ID=bb4f2ed37b3c47f09ae336e7fa517e62, tm=1512795973079}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@1cb9c49]');
INSERT INTO `sys_fhlog` VALUES ('d33a3a9065c148e5a0f516baf12ea29c', 'admin', '2018-08-14 09:22:09', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('d34e7777fbc34c6899f6b64aff0e4fbc', 'admin', '2018-06-18 11:02:59', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d36a696c5e2b49eb89f82c1d0aec2d36', 'admin', '2017-12-29 15:57:39', '修改菜单充值记录');
INSERT INTO `sys_fhlog` VALUES ('d3766c785c674c67958e98e2a2d59a94', 'admin', '2018-08-23 17:33:06', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d3817dc588d6458083e70183654ce512', 'admin', '2017-12-06 15:36:40', '修改角色菜单权限，角色ID为:3b2d3a2b212e4da39a221465bcb28c8b');
INSERT INTO `sys_fhlog` VALUES ('d39061d0f30241d5b7376a10b3a7df35', 'admin', '2017-12-08 09:34:50', '删除按钮权限PageData [map={BUTTON_ID=4efa162fce8340f0bd2dcd3b11d327ec, ROLE_ID=3264c8e83d0248bb9e3ea6195b4c0216, guid=1512696890771}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@3a165e]');
INSERT INTO `sys_fhlog` VALUES ('d394b008b1ae4f7e96a1baf70e4e49e3', 'admin', '2018-08-17 10:32:34', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('d396a6aaed384a08abc1092a3c200ea3', 'admin', '2018-08-08 14:32:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d3b128405fc74e6c87c2c4cd7b121d50', 'admin', '2017-10-30 15:47:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d3e791043c1640f097673971d796efd4', 'admin', '2018-07-10 14:23:49', '新增按钮权限pdPageData [map={BUTTON_ID=46992ea280ba4b72b29dedb0d4bc0106, RB_ID=9d1db2b5c7644745be9ebb0785533a86, ROLE_ID=3264c8e83d0248bb9e3ea6195b4c0216, guid=1531203829552}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@1763b540]');
INSERT INTO `sys_fhlog` VALUES ('d3f2a13981284497a3a6a9a1cb57707f', 'admin', '2017-11-04 18:07:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d3fa4b14fd114239be4b2129207963cc', 'admin', '2018-08-15 16:39:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d3fc59865bd8450cbc41e9a1ba8717ee', 'admin', '2018-07-13 15:45:27', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d41c6ca30047473da03e3a30735178ad', '18990673099', '2018-04-18 14:56:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d41f998d70a7402cb9467df62ea436ad', 'admin', '2017-03-29 02:45:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d42de9533b6f4bb487d9c931b3944fc3', 'admin', '2017-09-01 10:27:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d432a52c553840fbb058193bca2e3a82', 'admin', '2018-03-03 15:23:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d45d27cf90cd4610b4a4856003c1541d', 'admin', '2017-11-06 20:25:26', '修改菜单系统用户');
INSERT INTO `sys_fhlog` VALUES ('d462bd2f345d4644a5577dd3f2fbd6e0', 'admin', '2018-08-17 10:38:43', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('d470f6178ba84ac5a4797c5e09c39940', 'admin', '2017-07-31 20:18:52', '修改角色菜单权限，角色ID为:de9de2f006e145a29d52dfadda295353');
INSERT INTO `sys_fhlog` VALUES ('d47bb27c1c7449bf94b899333e1bbc48', 'admin', '2018-08-16 17:59:22', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('d48021128ba24d7c81dff9b4069b2df0', 'admin', '2018-08-15 16:09:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d482d5d26f314cffa4ecf38d8b546bed', 'admin', '2017-11-27 17:16:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d48564988ba54a67bc25a7f0a38f6a62', 'admin', '2018-08-17 09:42:03', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('d486f43b80d44993bbf1929596b7e0fe', 'admin', '2017-09-21 10:10:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d49067eeed3b45e6b35fe7e02366f90b', 'admin', '2018-08-01 10:53:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d4962d6a7a304d0bad5d9d8d2bc49c7b', 'admin', '2018-08-17 09:58:13', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('d4b47aa04e124aee90b68bf475ce018e', 'admin', '2017-11-07 16:51:29', '删除系统用户：PageData [map={USER_ID=fdfeb5fc087547a39d4f295cc8cfecf7, tm=1510044689743}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@15e0387]');
INSERT INTO `sys_fhlog` VALUES ('d4bcd2ba1cde4102a6d6331d29f2e58b', 'admin', '2018-08-23 17:33:15', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d4bf25a077274fddb96e8e931de2b7d7', 'admin', '2017-11-24 09:53:52', '新增菜单提现记录');
INSERT INTO `sys_fhlog` VALUES ('d4cd214d215b4a5097bb0df60184a30c', 'admin', '2018-08-16 18:02:37', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d4d78f18b9c5471b91253ad87cb2b75a', 'admin', '2018-08-17 09:58:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d4d9f8e3ddcd42f18d27670f0810866a', 'admin', '2018-07-13 16:43:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d4e0e48685fc484fb3fc626a85f3d407', 'admin', '2017-08-03 11:37:23', '退出');
INSERT INTO `sys_fhlog` VALUES ('d4fdbd2c00224049a3662a2155c5fd42', 'admin', '2017-09-11 09:22:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d5079116e5434a9882d9a4e455623280', 'admin', '2018-07-13 10:51:59', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d50c1a2a60f44f53aec59caf532e8678', 'admin', '2018-07-13 16:42:56', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d52409efe3c94abab40cea1b1bcb5a7f', 'admin', '2017-08-29 19:17:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d52ad8d045864a69b13ca868896042a5', 'admin', '2018-08-18 13:48:09', '退出');
INSERT INTO `sys_fhlog` VALUES ('d537f98e7945489a892d36a26aabe5a3', 'admin', '2018-08-16 17:59:21', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('d53e252e81854ee4bd9f3256813aa9be', 'admin', '2018-08-16 17:57:02', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d551e29286d64c98bf2a700cbd22e2e0', 'admin', '2018-07-13 15:45:26', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d558ae93daf1452a91879c9b5ef017a5', 'admin', '2017-12-06 15:39:18', '删除菜单ID86');
INSERT INTO `sys_fhlog` VALUES ('d56a11209fad47aeb231872295f0d5c4', 'admin', '2018-03-15 17:42:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d57b7d396fe641d98fd650ed3ea9b674', 'admin', '2017-11-06 20:25:30', '退出');
INSERT INTO `sys_fhlog` VALUES ('d57de34593984c829aa0cbddec7b1fb8', 'admin', '2018-08-13 16:08:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d57fc0833f03493b9b7ea45669b62841', 'admin', '2018-03-27 15:24:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d58953b3d0d04fe5aadeb5370444995e', 'admin', '2017-12-02 15:35:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d58ae010467f4e63a56c06a6126b27e1', 'admin', '2018-08-17 09:40:56', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d58d6dc8ae914ff88bd54362fd41f9f6', 'admin', '2017-11-29 20:18:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d594f4463bd44e40a1c2fbb194d4040d', 'admin', '2018-07-13 16:44:24', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d598140761d64034a1f4a0d56b38410f', 'admin', '2018-08-17 10:09:46', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('d5988087096f491fbafee45316dd2d7a', 'admin', '2017-09-20 13:20:10', '修改角色:金卡会员');
INSERT INTO `sys_fhlog` VALUES ('d5b294f8725d42ba85cd0fd3a0bf9989', 'admin', '2018-01-06 11:19:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d5d7a1afa4814c358e2f5e6d9bab1d29', 'admin', '2018-08-15 10:26:35', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d5e85a63fa3a4a38b7f2943a777d92b4', 'admin', '2018-08-15 10:32:44', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('d601040230494b95a1ecc5a2f1f89330', 'admin', '2018-07-11 11:45:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d603f7c7b3ae4fb6ae61a1f4585f74b6', 'admin', '2018-07-13 16:43:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d60ff60882664bffa591f71caedf7b3f', 'admin', '2018-08-17 10:09:45', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('d610191b01234d7d9f6e5ea425726902', 'admin', '2018-01-27 09:37:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d61b1281bc204b4dbbd405943596b892', 'admin', '2018-08-10 15:20:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d61f876bb8574936a38b80cdf2c1ac85', 'admin', '2018-08-17 09:45:59', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d622e966457e4ab6b873c340591e085c', 'admin', '2017-12-14 18:20:13', '修改系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('d62fd602e03a4a20a8b49e2fb8f04838', 'admin', '2018-08-08 10:36:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d635cdbdfb9646d191ce7aae3dcdae20', 'admin', '2017-12-09 15:16:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d63700e215a74141b19e20e5e1fd8a4f', 'admin', '2018-01-06 13:02:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d66a5e3bd16447168206858f027d9fc1', 'admin', '2017-11-21 15:21:40', '修改菜单订单管理');
INSERT INTO `sys_fhlog` VALUES ('d679a18a510f4ea299e23e2d0689fd2c', 'admin', '2018-08-13 18:24:06', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d679cd4e48ba4999bea51d00208f73e8', 'admin', '2017-11-10 17:54:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d696d74e14cc4704aba6f6c0b324cd6b', 'admin', '2018-08-23 14:16:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d6a533bd6fec4270924c269a87fedd62', 'admin', '2018-01-27 09:39:16', '修改菜单广告活动');
INSERT INTO `sys_fhlog` VALUES ('d6a918973d1640bc97752c522900a8c0', 'admin', '2018-07-13 16:42:06', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d6affafa357143ba902f66c7a0d51626', 'admin', '2017-09-01 16:28:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d6cddb4afbc34c1d9c9f76ca1ef34e43', 'admin', '2017-12-06 13:26:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d6d0e448e51d42758e6c06d63c84e6d6', 'admin', '2017-12-08 12:02:17', '新增系统用户：18722222222');
INSERT INTO `sys_fhlog` VALUES ('d6d15d8edc22491795f6628d59e90b5c', 'admin', '2017-11-27 10:48:11', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('d6dc3ce84ccb4e2ca13af15c0d50381c', 'admin', '2017-10-30 11:39:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d6dde8eeb9eb46ada43fb6953390ebfb', 'admin', '2017-12-14 18:22:30', '新增系统用户：18785858445');
INSERT INTO `sys_fhlog` VALUES ('d6fc04d69827496583d07966c694e207', 'admin', '2018-07-13 16:41:59', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d7003895296c440c97b37f90a1556956', 'admin', '2017-11-07 11:26:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d702dbd6c5ce410882c8296cb66b6642', 'admin', '2018-08-15 10:29:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d70f5aeccb1e4d769cf4e99d9e8990cf', 'admin', '2017-08-29 09:55:20', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('d722dcf14f5a4749992221ecb41cab6e', 'admin', '2018-08-23 10:09:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d72412db04514a7a81bd8c6d1f3d45f3', 'admin', '2017-12-15 10:10:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d726427b8595468d99e68d754b6691b2', 'admin', '2018-08-11 09:29:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d7290c0eb12748ea8a040b1feb072352', 'admin', '2018-07-13 16:43:48', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d72d3ed241bb447589023919f73679bd', 'admin', '2017-12-29 13:13:54', '修改代理介绍:<p>afsdasfdasfss</p>');
INSERT INTO `sys_fhlog` VALUES ('d730e4430f9d4a09b91bb94458809e46', 'admin', '2018-07-13 16:42:55', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d73dc8ffdc06447fa493c432f8f30c0a', 'admin', '2018-08-17 10:38:45', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('d749139d65de4c56b951819d23fa6c4b', 'admin', '2017-09-08 11:15:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d7540d1ef37e45399eb621a39567868a', 'admin', '2018-08-18 19:49:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d75fd57f17d04dc78758c98c78dc2bb0', 'admin', '2017-09-05 11:24:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d765465dbc1d4bcda062c676fe2e8975', 'admin', '2017-08-10 09:24:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d76b97d5f5db422b98fc15d7b88c5ace', 'admin', '2018-08-16 17:56:14', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('d76c6db30d62423dabd67ddbd361d311', 'admin', '2018-08-14 09:22:10', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('d76e31af8d3f4420b16a54efa05fefab', 'admin', '2017-11-23 15:14:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d7741eded33c4650991462ae7140447a', 'admin', '2018-08-16 17:57:02', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d778094fcc334982a52256c7bb27d4df', 'admin', '2018-08-02 11:33:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d77ab816262c4f84bb86e46a79a8d640', 'admin', '2018-01-25 11:49:20', '新增菜单查看街圈');
INSERT INTO `sys_fhlog` VALUES ('d77efda79eb74c2f8b3f15a51fe01411', 'admin', '2018-01-06 10:21:29', '退出');
INSERT INTO `sys_fhlog` VALUES ('d78c577317c3468582888272f1692390', 'admin', '2017-11-04 12:49:35', '修改角色:注册用户');
INSERT INTO `sys_fhlog` VALUES ('d79e2022018c48ec91e1ecef9bc16c2c', 'admin', '2017-12-08 09:34:47', '删除按钮权限PageData [map={BUTTON_ID=3542adfbda73410c976e185ffe50ad06, ROLE_ID=3264c8e83d0248bb9e3ea6195b4c0216, guid=1512696887180}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@ac866f]');
INSERT INTO `sys_fhlog` VALUES ('d7b8d2d349514a3fbef96cd0dee4c6bc', 'admin', '2018-08-13 18:24:43', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d7c75e3e43da48439e7cdbac7f5f0c81', 'admin', '2018-08-13 18:26:22', '退出');
INSERT INTO `sys_fhlog` VALUES ('d7d6200728324ac1b096a8b527a8f52c', 'admin', '2018-08-10 17:11:00', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('d7ebb11149e64ceaa83c19c0ed3412b4', 'admin', '2018-08-01 18:08:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d8065d8d2cd44d3f8b0840056913b66f', 'admin', '2018-08-23 17:29:53', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('d80a39a09c9f4b9281837c0b796371e1', 'admin', '2018-07-26 18:51:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d80b65c200c4451889f30bacb3354ade', 'admin', '2017-11-28 09:38:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d812b99830764c5098ca5525116fb7a4', 'admin', '2018-01-26 16:23:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d81ab3025eb84a169eeb8df54c24b6f1', 'admin', '2018-07-13 15:45:27', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d83e13cfc58c4370a5f4a4541f0a0db5', 'admin', '2017-11-13 18:08:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d84360c8a8c7415a996424b34d0b3ae6', 'admin', '2017-11-17 10:09:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d847a4ceb4094d79abadbdd8655c1b3f', 'admin', '2018-08-17 09:48:24', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('d85f32eb7f6c444b86cc74ae1f9ab3bd', 'admin', '2018-08-16 18:05:28', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d862d9809b794f2fa4184a7215c91b55', 'admin', '2018-08-24 14:49:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d86a9d7fc92847c4b19457cfb357730d', 'admin', '2018-08-17 09:58:13', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('d86f31884ca44f5f8e7d284cc2754e2d', 'admin', '2018-08-17 10:37:37', '修改菜单建议管理');
INSERT INTO `sys_fhlog` VALUES ('d87be9698dd148ba8e9fe3629f2eed60', 'admin', '2017-11-10 20:33:59', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d88cf43b980448abb5a54a7a5794b7b4', 'admin', '2018-08-02 10:33:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d8a2fb2d32bf43c1aeb091750bfe86be', 'admin', '2018-07-13 15:38:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d8b12fb49b484fdeb8da2cd1c5c5ca07', 'admin', '2017-11-10 10:40:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d8b98f82f90c4b5da977448375ee6018', 'admin', '2017-08-09 11:47:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d8b9d1ab14974892af7b319cf56f5b21', 'admin', '2018-08-13 18:23:17', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('d8bb38fee5054f1cb737c48eabb364be', '18990673099', '2018-03-17 09:04:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d8bb648362134a68ac171b3f8021d039', 'admin', '2017-08-03 22:42:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d8c3430ed04248d0bb96daf63c900d7a', 'admin', '2018-01-05 10:45:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d8cbd056a6e346618b0c19f5fd53cfca', 'admin', '2018-08-17 10:09:45', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('d8cd49ed2e244e56b8a43a0b6f9cf153', 'admin', '2018-01-22 14:51:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d8cd8400f15b4b91a777fc96222f3ccb', 'admin', '2017-12-28 13:07:42', '新增菜单产品订单');
INSERT INTO `sys_fhlog` VALUES ('d8d9d6b59e4c4783adf836240387783d', 'admin', '2017-11-21 18:51:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d8de4c1430d747999125c39e6972a49e', 'admin', '2018-07-13 16:42:29', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d8f12cd4eb0546f885c2692a83576643', 'admin', '2018-08-13 18:24:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d90c4792a2ee4ac6ac2e2bc53be6755d', 'admin', '2017-11-16 17:10:18', '退出');
INSERT INTO `sys_fhlog` VALUES ('d90da3325cf5418ebde3fb0b3355021e', 'admin', '2017-11-04 09:30:37', '修改角色:下单人员');
INSERT INTO `sys_fhlog` VALUES ('d916c8c47818448a9ad21b94fdd3c840', 'admin', '2017-11-15 17:37:02', '退出');
INSERT INTO `sys_fhlog` VALUES ('d919dc6fe7274fd58377624419528243', 'admin', '2017-12-15 10:09:41', '修改菜单商家管理');
INSERT INTO `sys_fhlog` VALUES ('d91d35fd2cd04cb9bd80494d3bcc26bc', 'admin', '2018-08-21 13:52:38', '退出');
INSERT INTO `sys_fhlog` VALUES ('d92076df33be490487ea971aee67ab9b', 'admin', '2017-12-08 10:41:53', '删除系统用户：PageData [map={USER_ID=710cc9187e514014bdf2adb937e57a64, tm=1512700772429}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@3ab31f]');
INSERT INTO `sys_fhlog` VALUES ('d92277bdd8f5406e99c05068b4f1f48e', 'admin', '2018-08-17 10:37:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d92952e1f87546cd8b7b7c03f37c5775', 'admin', '2018-08-01 16:06:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d93fc82772d24b159f2b5b55a8098bf1', 'admin', '2017-10-16 21:38:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d9a436ec8b36492eb68e51ff7c5c1cf9', 'admin', '2018-07-13 16:44:21', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d9b186c9c4704ca8978d377ed6125f9f', 'admin', '2017-08-03 17:42:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d9c5e8639c95408299d01282f4991659', 'admin', '2018-08-17 09:40:43', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d9d4664552f248458c7a792bf3f2f0b4', 'admin', '2018-01-29 17:53:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d9dd947811744dfcb4b492d0cd9a8253', 'admin', '2018-07-13 16:42:10', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d9e6f32489ce4268a8b3e2e52bfa878b', 'admin', '2018-08-17 10:38:45', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('d9f244d9766d493eb3b417a158ca4aa6', 'admin', '2018-08-17 10:39:42', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('da04ae44471f4868a5b8f4219c5ed34b', 'admin', '2018-08-07 17:24:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('da1dfbffe21247e0aa6d91240e19d35f', 'admin', '2017-11-27 20:03:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('da2812f85b17444084e7ae5ee7e2d158', 'admin', '2017-10-26 09:54:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('da2ec3bd781f49d9ae5b5436c7a44a3d', 'admin', '2018-08-16 17:57:02', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('da3610e775d8447aa6353a3a463ef989', 'admin', '2018-07-13 16:43:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('da3847bad2cb407a9d60cce9b581a600', 'admin', '2018-08-22 14:50:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('da3da3c948d349869513f435b3d72b39', 'admin', '2018-08-17 10:39:41', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('da401c55691c42a6ba9a55d022726d58', 'admin', '2017-11-04 09:42:12', '删除系统用户：PageData [map={tm=1509759732679, USER_ID=896496bf0906410d8495110e1b14f69e}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@2a67e968]');
INSERT INTO `sys_fhlog` VALUES ('da49a2c4d60d4d2db8dcf992dcc9c35f', 'admin', '2018-07-13 16:42:25', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('da4f7211be5f4223b2c6c83a4aa43b18', 'admin', '2018-08-24 14:49:14', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('da69043fa16e43ef801209e3a61b148d', 'admin', '2017-10-31 14:46:18', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('da6fbb5910eb49eb8bfaa5f432a94e2a', 'admin', '2018-01-26 18:13:39', '退出');
INSERT INTO `sys_fhlog` VALUES ('da87a71bef99410aab93a03b325eceef', 'admin', '2018-08-10 17:47:09', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('da8c4011e7684867a8163f1ff0750dca', '18990673099', '2018-03-05 21:15:03', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('daa063d372b445cd88f7baf2a5ad9036', 'admin', '2018-08-17 09:40:00', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('daa109bd38c84825a362debc186a899c', 'admin', '2017-12-16 11:08:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('dabb61d42fa441b0be2dd8d1212c1c3d', 'admin', '2018-08-17 09:40:01', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('dabc7d411046485a983e44f59cc47387', 'admin', '2018-02-25 10:40:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('dabe21d6bfd64bb4a06181706cb3ffb0', 'admin', '2017-12-14 16:43:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('dace4b4113354f6392e568574c7e7f20', 'admin', '2018-02-05 15:29:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('dad3d4b5b6434e3198d94c17b6527fbd', 'admin', '2017-12-13 13:35:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('dad4c1b1fb904705824da755465f2fc5', 'admin', '2017-08-09 18:15:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('dae8cdd58cc0415ea3e1107719eb5a95', 'admin', '2018-08-23 10:09:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('daeb4c7ad7664c4ab11b2764c5297b31', 'admin', '2018-08-23 10:09:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('db1cce0640b6411e9568dea62173971c', 'admin', '2018-08-17 10:37:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('db2d293080cf44b38cc00b333dc50cc2', 'admin', '2018-08-11 19:17:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('db311e427e1a4b2a80b3a4c1c42c40c0', 'admin', '2018-07-13 16:43:43', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('db3a2415b7d4401294601757729b358a', 'admin', '2017-11-04 16:57:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('db403630fae845fd824cd368dd2ab509', 'admin', '2017-12-06 15:39:15', '删除菜单ID87');
INSERT INTO `sys_fhlog` VALUES ('db671b5305314e5e8803f02e229c6594', 'admin', '2017-11-18 12:52:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('db6903df1d514958a96476cf1c87c463', 'admin', '2018-07-13 16:42:10', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('db81a14eb7aa46c1bf4775f5f305c7d3', 'admin', '2018-01-22 10:25:25', '删除系统用户：PageData [map={USER_ID=d0a262e26c01477ba4a64f61ee3119ee, tm=1516587925899}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@15e80bd]');
INSERT INTO `sys_fhlog` VALUES ('dba7edced31f401d9ffe08205355781e', 'admin', '2018-08-17 10:38:43', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('dbb0e6f12ef54ddb96ce32d30d6d38dd', 'admin', '2018-08-23 17:29:53', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('dbbf36e00f8147b3a42a5252352b69b6', 'admin', '2017-12-28 15:05:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('dbc46b0c0a63405cb89e0e2010f36366', 'admin', '2017-11-27 09:28:51', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('dbc77e3aaa1f40029c8e7e10d30ba64f', 'admin', '2018-08-23 17:31:01', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('dbc7dfbdd9c24472ab34d0688951e457', 'admin', '2018-08-11 11:52:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('dbcf5dbf7d244cc8ad39e9d4822879ee', 'admin', '2017-08-02 19:45:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('dbed1cba4442425caf9a3bccbc6997eb', 'admin', '2018-08-15 10:22:42', '新增菜单新增店铺');
INSERT INTO `sys_fhlog` VALUES ('dbf0d20cb45a40d1b15b55d6fc72a848', 'admin', '2017-07-31 21:47:43', '新增菜单待付款');
INSERT INTO `sys_fhlog` VALUES ('dc0b5ac8c6274009b46790fb4c744b4c', 'admin', '2017-12-08 09:35:21', '删除按钮权限PageData [map={BUTTON_ID=3542adfbda73410c976e185ffe50ad06, ROLE_ID=115b386ff04f4352b060dffcd2b5d1da, guid=1512696921030}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@1888117]');
INSERT INTO `sys_fhlog` VALUES ('dc2348759ce049f59487e6ab18a40d57', 'admin', '2017-11-15 17:08:50', '修改角色:商家');
INSERT INTO `sys_fhlog` VALUES ('dc379ae856d64c969fc59b03bba1301a', 'admin', '2018-08-17 10:01:11', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('dc42b8314db8441d839edd8e65eef085', 'admin', '2018-08-17 10:06:50', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('dc4bb412047b40f3b06babcc296819ec', 'admin', '2018-07-13 16:43:54', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('dc52855e7c0246a3a94673c41ab9f2d4', 'admin', '2018-08-17 09:45:59', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('dc6072323df2457392fa043b7ba57c9b', 'admin', '2018-08-22 11:10:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('dc67423730324f588483c46560b2f210', 'admin', '2017-12-12 13:59:59', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('dc8a6787e69e4876bc27e4d330d43f57', 'admin', '2017-11-30 11:20:54', '修改角色:定制师');
INSERT INTO `sys_fhlog` VALUES ('dc9fb765ab1f463a9b12718813b70e92', 'admin', '2018-03-15 11:33:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('dcc10f60fb904545b1c380fffd28543f', 'admin', '2018-08-16 18:18:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('dce299178941465c8403ed7a6471803f', 'admin', '2017-08-01 11:25:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('dce7998df8704ce790489d81959a4e74', 'admin', '2017-12-06 15:39:02', '删除菜单ID96');
INSERT INTO `sys_fhlog` VALUES ('dcf9fd1c29a84cf2afca992cf322913b', 'admin', '2018-08-13 19:00:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('dd01f6f800d647609d92dce693523f64', 'admin', '2017-11-10 15:46:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('dd09c5cc87bf416db49c83a716876b2c', 'anmin', '2017-08-24 15:27:28', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('dd0e9a9e526849c1b7dac7c1017d3396', 'admin', '2018-07-13 15:38:32', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('dd1a3c1d2b614ab2accaa6f9c2015c6e', 'admin', '2017-11-04 15:40:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('dd1b1e5a7a2d404bb8b7f7cd081c24df', 'admin', '2018-08-17 09:58:13', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('dd1b2e759d5d4b4096c1613e90763871', 'admin', '2017-08-01 11:18:48', '新增菜单富文本编辑');
INSERT INTO `sys_fhlog` VALUES ('dd1d7cc61fcd4af18592aab67e147ba3', 'admin', '2017-12-16 11:31:13', '删除系统用户：PageData [map={USER_ID=3bd6d382b479453fb78d70b5b992043c, tm=1513395073285}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@c5b236]');
INSERT INTO `sys_fhlog` VALUES ('dd3f8742aa314f1f9d851eb6030c8d78', 'admin', '2017-11-04 12:01:14', '修改积分提成:3');
INSERT INTO `sys_fhlog` VALUES ('dd4155e70f7e4f4b9d30646191ab4faf', 'admin', '2018-08-10 14:15:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('dd6d975c4b414f51b52182cc13e6027b', 'admin', '2017-11-09 15:00:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('dd79d67e0d734ed5913ad42237ea0136', 'admin', '2017-12-15 11:02:03', '修改金额提成:1');
INSERT INTO `sys_fhlog` VALUES ('dd991fa535b64ce0ba544bbbdb231165', 'admin', '2018-07-13 15:38:31', '修改菜单店铺类别');
INSERT INTO `sys_fhlog` VALUES ('dda1efb12791413f9b211f2294a1c0cb', 'admin', '2018-08-16 17:57:03', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('dda2896a46b941ddb76f5ea7d4934572', 'admin', '2017-11-17 16:45:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ddb9a06833804c3994dfd58e32c3adc9', 'admin', '2018-06-18 11:21:59', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ddc57dc2476b4408a2271eecfed60bd2', 'admin', '2017-08-01 11:19:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ddd2a50f610944cc88343fadeaf90fcb', 'admin', '2018-08-15 16:41:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ddd545083f614bdf99ef3ebc84fbb0d4', 'admin', '2018-07-25 17:41:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ddd7effafaac48ed8365f8b6e19e7e3c', 'admin', '2018-07-13 16:42:53', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ddeef70e5edb4e75a53f255e651223c1', 'admin', '2018-07-13 16:42:59', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ddf4da09f94c424cb2e9fae65668efe5', 'admin', '2017-11-08 09:48:52', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('ddfbb78017694382b48ca33c08e1d662', 'admin', '2018-07-13 16:44:09', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('de008f1c73f843548101d5aa03641962', 'admin', '2018-08-16 18:19:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('de12944517f04bfb8c5e706084f47243', 'admin', '2017-07-31 20:18:31', '新增按钮权限pd{guid=1501503511784, BUTTON_ID=cc51b694d5344d28a9aa13c84b7166cd, RB_ID=37f8c472b6534e6f9cd0d69a4e117f35, ROLE_ID=3264c8e83d0248bb9e3ea6195b4c0216}');
INSERT INTO `sys_fhlog` VALUES ('de2e13a59c714756904d70de64ec54b1', 'admin', '2018-08-17 10:06:50', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('de2efc4484d44ff9b664d24ff524cbe3', 'admin', '2017-09-08 18:19:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('de347df1fe364e7db0de7dac08d642de', 'admin', '2017-11-07 17:02:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('de625802dbdc4a1e9c3c1e97a7a4742c', '18990673099', '2018-03-01 09:56:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('de64b286737049579f0d5e3f3e552742', 'admin', '2018-08-17 10:09:46', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('de69f1b02b6b4ebcbe6ca12261984cc2', 'admin', '2018-08-15 16:46:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('de9574d8f8104069b0394d0fde06a282', 'admin', '2017-10-13 15:36:56', '修改系统用户：liwei');
INSERT INTO `sys_fhlog` VALUES ('de96a6d27be9412cbb2015a8dfde7387', 'admin', '2017-11-06 20:23:09', '退出');
INSERT INTO `sys_fhlog` VALUES ('dea50154660e4e60ab987814d63ac82a', 'admin', '2017-12-11 16:25:12', '修改系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('dea6f2593ec84245a965bc7e3a6c1ea4', 'admin', '2018-07-13 16:41:56', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('dea72d62d28a4dd9ad261aeced1b41f0', 'admin', '2018-08-14 18:24:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('deb7fdcc01424575bf1f2c8efff1660e', 'admin', '2018-08-07 09:22:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('dec9fca251fb4e12a3f7aa7dd264b46c', 'admin', '2018-01-23 09:39:16', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('deca44a6863f41a8abe28c89ad843308', 'admin', '2018-08-10 17:13:37', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ded6d2e2367d485dbc698719369899b1', 'admin', '2017-08-09 10:13:44', '删除菜单ID78');
INSERT INTO `sys_fhlog` VALUES ('dedc843813924af78da048718eb3a74d', 'admin', '2017-11-27 14:06:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('dedd7fa391b6445792b90bcdb534ef0c', 'admin', '2017-12-02 17:09:27', '删除系统用户：PageData [map={USER_ID=6668c48292ec41968b07366f3fe2cb1a, tm=1512205767431}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@f4152d]');
INSERT INTO `sys_fhlog` VALUES ('dee5f4fea19e4249ab6d3b62d6f5120b', 'admin', '2017-11-27 09:16:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('def1cc6e7f5d4ee5bc30756745ade35c', 'admin', '2018-08-17 10:09:46', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('def2e59febe34abebb177b3828b62b29', 'admin', '2018-07-13 16:42:12', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('df14adc1a561461ab9832739758f701e', 'admin', '2017-09-02 09:22:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('df2b7f460dd84d0d922503da07539dd9', 'admin', '2018-08-17 09:48:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('df2b80b3171046398f1a863995ea8535', 'admin', '2017-12-06 15:36:54', '修改角色菜单权限，角色ID为:3ed5007dc9064933b09cf253b76625de');
INSERT INTO `sys_fhlog` VALUES ('df3e05f77c224d169bf0b3636f8a58d2', 'admin', '2017-11-06 15:30:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('df707ac3baa54915b7cca55c08a8a214', 'admin', '2018-08-13 15:25:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('df7bbbb9bdd4414c8d6f662f3eedd6cd', 'admin', '2018-08-17 10:32:33', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('dfae8374a76e409a80f52e6359bef10d', 'admin', '2017-11-24 09:51:54', '新增菜单财务管理');
INSERT INTO `sys_fhlog` VALUES ('dfb0f841e08049bab1bf77a95a979c27', 'admin', '2017-11-06 20:39:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('dfb18f06ec8644a89e63123b0581c24f', 'admin', '2018-07-13 16:44:27', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('dfbfca41169e4a4eb9041efc13417d1f', 'admin', '2017-11-23 10:32:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('dfc3282418784b3b8db7d0e6efb2e5dd', 'admin', '2018-03-15 17:53:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('dfc381358e43495088a6adad586af1f2', 'admin', '2018-07-13 16:42:08', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('dfd1da3a0b174f36ac059f29558ba516', 'admin', '2018-08-16 18:05:29', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('dfe845452d0e480ba67f17ee7a7f537d', 'admin', '2018-08-17 10:03:17', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('dffa23b33a9048fab4660e8234be804b', 'admin', '2018-07-13 15:27:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e028876639ab47358abdb890470d3a67', 'admin', '2017-11-22 16:53:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e03a13ea8b334c02b591187a3c0710a3', 'admin', '2018-07-13 16:43:26', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e042d92595584468924cd48f5d9b74ed', 'admin', '2018-01-18 11:12:06', '删除菜单ID84');
INSERT INTO `sys_fhlog` VALUES ('e05ca27becb14e36a24f8618a5922601', 'admin', '2017-11-15 17:15:17', '批量删除user');
INSERT INTO `sys_fhlog` VALUES ('e05d57b1c567408abbdda5674ca5bc45', 'admin', '2018-03-15 16:52:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e06d5ebd4208468686601d85f2f65991', 'admin', '2018-01-06 10:29:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e072b3bdb0ed42bc8249cb55e9d383d6', 'admin', '2018-08-01 17:19:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e075efd2b53843bfa24cb85c3ae05d88', 'admin', '2018-08-17 13:54:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e09a6c68402048cfb6fc016ed971c4c1', 'admin', '2018-07-13 16:44:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e0a54fa6a4444adaa10912f49b8f81c3', 'admin', '2018-08-16 18:18:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e0b22578834c4271942a2cffb9c9f76e', 'admin', '2018-07-13 16:42:23', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e0d5bc4a99484643b1cee49bed2530d3', 'admin', '2018-07-13 16:43:15', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e0d922067ccf467c86d73cd899ed7f06', 'admin', '2018-08-18 19:46:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e101d9b13cfa40e09e4b38a87884c5a2', 'admin', '2018-07-13 16:43:34', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e11260d37dec4dfdb3fca6e6f0151c8c', 'admin', '2018-08-10 15:07:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e114ea3f7ce149db8e98877120d7f0e1', 'admin', '2017-03-29 01:23:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e1154b89ffaa4cf2becf55028e9f3b63', 'admin', '2017-12-04 16:26:55', '修改金额提成:2');
INSERT INTO `sys_fhlog` VALUES ('e115aa207a2a473cbf153979cfa78b11', 'admin', '2017-11-23 18:43:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e12c04386f3d4fff9e7479d157384517', 'admin', '2017-11-24 17:51:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e132735b16294dcaa32699dc13cb2682', 'admin', '2017-11-23 15:36:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e153a630c6a848089c902b163f74fca7', 'admin', '2017-11-08 09:20:08', '修改系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('e16d3186ee044449beecf260d49326e5', 'admin', '2017-08-29 09:28:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e16df960e35b4679898c48b521202fec', 'admin', '2018-08-15 10:32:45', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('e17ab5b9d42e436591cf68a58ffbb222', 'admin', '2018-01-26 11:18:20', '退出');
INSERT INTO `sys_fhlog` VALUES ('e17ddc9763dc4233b47176304ea5c871', 'admin', '2018-08-17 09:40:42', '修改菜单建议');
INSERT INTO `sys_fhlog` VALUES ('e1857d9a2c93482db121d85d30001f8b', 'admin', '2017-11-04 17:53:28', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('e18d5c454652418c8aee0ef9c7a0b3c9', 'admin', '2017-11-04 09:28:03', '删除角色ID为:c34883b79219493da62a1e8dc2a6dd92');
INSERT INTO `sys_fhlog` VALUES ('e19752cfee894513aeffaeca0756d237', '18990673099', '2018-03-07 16:58:19', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('e19ef2e4ad3b42c8b9e754a99c31e260', 'admin', '2016-10-28 19:53:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e1b66313c9b144d1b0a2056e93b9ea36', 'admin', '2018-02-07 16:43:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e1c2bad7388e4f50a84cc5216e475e5a', 'admin', '2018-08-11 15:20:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e1d9e6dc58b541ffa279e25c95778ccf', 'admin', '2018-07-13 16:43:42', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e1f738d20ee94e6da03fd2b6fa8332e0', 'admin', '2018-08-16 18:20:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e1fbb3a4499b40039082940c9de697a0', 'admin', '2018-07-13 16:42:15', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e208180941a042cf9199474415fff893', 'admin', '2018-08-13 19:40:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e217ee9915cb442aa82815c16e18a301', 'admin', '2017-11-18 10:41:19', '新增菜单查看服务');
INSERT INTO `sys_fhlog` VALUES ('e23a16a5d1314dbfb060aec768276e36', 'admin', '2018-08-17 10:09:45', '新增菜单建议列表');
INSERT INTO `sys_fhlog` VALUES ('e25c021f322f43f980581277198d9354', 'admin', '2017-12-16 11:31:18', '删除系统用户：PageData [map={USER_ID=563eed91619c41c7be769ef97fc30d5b, tm=1513395078924}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@7aa072]');
INSERT INTO `sys_fhlog` VALUES ('e2793784f36a45429556423d66baff3c', 'admin', '2018-08-17 09:48:59', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e27b00c6e77d4ae5b8aecb2d591640de', 'admin', '2017-09-30 10:20:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e2895ce3e181479ebe7908602600e490', 'admin', '2017-12-15 11:02:49', '修改积分提成:1');
INSERT INTO `sys_fhlog` VALUES ('e28dbba4df354814ae1593e1b4dbc046', 'admin', '2017-09-02 21:59:17', '新增菜单洗护类别');
INSERT INTO `sys_fhlog` VALUES ('e2b34035048a4a83843f19dc93846e41', 'admin', '2018-08-16 11:03:00', '退出');
INSERT INTO `sys_fhlog` VALUES ('e2baad954e304057b91fe1fcfbcf2984', 'admin', '2017-11-08 15:48:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e2d0124ac1b1487a9c441f714959ef33', 'admin', '2018-08-18 19:37:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e2f0c81d01e446049b95e211c2efda4d', 'admin', '2017-11-27 10:47:23', '新增菜单商家管理');
INSERT INTO `sys_fhlog` VALUES ('e312bff0433f4d968a4c6b8669ad58e6', 'admin', '2017-11-04 17:24:42', '修改金额提成:2');
INSERT INTO `sys_fhlog` VALUES ('e3291464975f4147bbb928c2a21d9fb5', 'admin', '2018-08-17 09:45:59', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e334b7a90ec84d0ba91e53ddf2db88fc', 'admin', '2018-07-13 16:43:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e348ba84132f4a438a06da48f241cfe7', 'admin', '2018-08-17 10:38:44', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('e36fcc493cc646b6b1b64a9080453a1b', 'admin', '2018-08-17 19:04:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e3921ca673914ebdbc6d673945fc4665', 'admin', '2017-11-23 10:51:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e3b1b2cf68d44b10a8094cb7cf6fcd68', 'admin', '2017-02-05 09:40:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e3e2a740eab14dcf81e9dfa21fb098c2', 'admin', '2018-08-23 09:58:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e3ea79e75b73455d908a006a675bf04d', 'admin', '2018-08-10 16:27:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e3f045717ebe46d4af9bdb7f930e2bf7', 'admin', '2018-08-11 10:21:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e42b3401b3fd49e6a5fcf6531d3b2db2', 'admin', '2018-07-13 16:44:01', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e42dc3a1332346f4a6b1fedac1ab21ae', '18990673099', '2018-04-24 09:22:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e42ee511cbdc4edca136326f311e4063', 'admin', '2018-01-09 14:14:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e42fd5a502c04b7daea0f6a502dba016', 'admin', '2018-07-13 15:45:26', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e456603260cd4ab8a4dda19bf01a2c14', 'admin', '2017-12-16 11:09:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e45a8597bc3a44ecb302a034ba390526', 'admin', '2017-10-16 16:07:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e45dbc4722e645e69575d734882c9b6b', 'admin', '2018-08-16 18:02:18', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e46fa98bd21b47a490de164cbdd29475', 'admin', '2018-07-13 16:43:48', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e473f92469874437bd4c07347d4e6090', 'admin', '2017-11-27 11:40:34', '修改菜单查看商家');
INSERT INTO `sys_fhlog` VALUES ('e47fe546794a4210bf49fa180d47e847', 'admin', '2017-09-08 12:33:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e4de80fd1b0142529b96997bb9972456', 'admin', '2018-07-13 16:42:39', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e4e59114363e4c49ad997ef38031e70d', 'admin', '2018-08-17 09:48:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e4ea6fb9e81b44f4a9a185e6e30b362f', 'admin', '2017-11-22 16:24:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e4ebf99abd4b4572895d68dbd809cad8', 'admin', '2017-11-07 16:18:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e4ee363c68254a0298729a3eb1540b61', 'admin', '2018-07-13 16:42:23', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e4ee81b90415484faa2f0bb516d1e4bd', 'admin', '2017-11-18 14:18:58', '新增菜单fdas');
INSERT INTO `sys_fhlog` VALUES ('e4f40930f91e4e93ab6e5f4e3161af9b', 'admin', '2017-11-10 16:13:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e5019972f68346e8a2e08a3be50a9918', 'admin', '2018-08-16 17:59:20', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('e51730acf4774228837de5b044c51355', 'admin', '2018-08-17 10:09:45', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('e52967edae8147d09125a53a115e9a69', 'admin', '2018-08-17 10:01:12', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e52e7ae14de3403fbd0460a59c316933', 'admin', '2018-08-10 17:11:00', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('e54c2e5c028548b9904f2cd673c99301', 'admin', '2017-11-07 09:25:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e557e832d5cb4375a388ea348b0c0e5c', 'admin', '2017-10-07 16:06:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e562ed7aeeda4e5f9331a610015ebca5', 'admin', '2017-08-10 20:20:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e573e4ce4bf549ba9e6e3199582b3aa2', 'admin', '2018-08-21 17:41:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e584c9b5fa6c4b168f2af18fa15380b9', 'admin', '2018-08-15 17:36:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e591862429d64083bde1a0b963b4cf1b', 'admin', '2017-08-07 20:04:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e59c33db90b44f299e17f9f56cf85a10', 'admin', '2017-08-04 10:51:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e5a7193bf5474e59a40693d38baed71b', 'admin', '2018-08-16 18:19:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e5b6fa7408564bfcba6cadd77931bfee', 'admin', '2018-08-17 10:01:12', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e5baaf4ad66e4f66a22536f29661138e', 'admin', '2018-08-01 11:28:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e5cdfef4f8f344a08a35d5abdeaf7548', 'admin', '2017-10-09 17:39:41', '新增角色:接件员');
INSERT INTO `sys_fhlog` VALUES ('e5d046da5b514b6aae8f5badea48f3d9', 'admin', '2018-08-23 14:05:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e62337f67b994783a0c64d25fbe51be8', '18990673099', '2018-02-07 16:42:10', '退出');
INSERT INTO `sys_fhlog` VALUES ('e64e79c7eecd43768a8e01786ba4c278', 'admin', '2018-07-13 16:42:28', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e66cf3ad4df2418ab84171405bc91107', 'admin', '2018-08-08 09:35:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e68f55bc440542bea8c1a22d41afaa6c', '18990673099', '2018-03-15 19:30:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e69673107eb64b06afffca27eee9b0aa', 'admin', '2018-08-18 13:53:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e6a3c6362cb84b66a30c09142de8924a', 'admin', '2017-11-22 15:41:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e6e5d2ca03224e60b1d2ab8dc12c1f1f', 'admin', '2017-11-07 12:25:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e6e863080277444182fd58672d2a2f36', 'admin', '2017-11-22 09:53:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e6ff3a211a624f6abf27206484b6378d', 'admin', '2018-02-07 16:41:36', '新增系统用户：18990673099');
INSERT INTO `sys_fhlog` VALUES ('e70af1ee00ea43f89ebfb87a57cb28ad', 'admin', '2017-11-09 10:41:27', '新增菜单增加街道');
INSERT INTO `sys_fhlog` VALUES ('e70ee2ddb92f4a09ba7a5265cadb2f16', 'admin', '2017-11-22 14:41:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e7280b01a0c344ee82ba2a46da91457e', '18990673099', '2018-03-26 09:09:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e72f2859a839486490d7c05c65b16da9', 'admin', '2018-08-17 09:42:02', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('e770df39cf944d3daf25866cca9274a7', 'admin', '2018-08-17 09:48:37', '退出');
INSERT INTO `sys_fhlog` VALUES ('e78b873d157f414aa3e511ea8303d317', 'admin', '2018-07-13 16:42:11', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e7b27713f067463cabf3d3017f0e0b9b', 'admin', '2018-08-13 12:49:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e7b41ff021c947d5921b0df7bdb4bf87', 'admin', '2018-08-21 16:46:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e7be99a192ed48d7bdfb743c980edf8c', 'admin', '2018-08-16 17:57:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e7bf3ac392954e509e4c0341f4869a95', 'san', '2016-06-06 02:29:19', '退出');
INSERT INTO `sys_fhlog` VALUES ('e7cdef53f5a8490cbd79194883a64ac6', 'admin', '2018-01-26 11:18:04', '新增菜单提现记录');
INSERT INTO `sys_fhlog` VALUES ('e7d4599db34249339791b226e3a1b297', 'admin', '2017-03-16 01:03:40', '退出');
INSERT INTO `sys_fhlog` VALUES ('e800f4cf68ea41e9b74214b00c9e0293', 'admin', '2018-08-10 17:48:17', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('e809a8a047e743f7b1038ee80a403733', 'admin', '2017-07-31 21:49:06', '新增菜单评论管理');
INSERT INTO `sys_fhlog` VALUES ('e814a526729a44cf8643e37fa131510a', 'admin', '2018-07-25 14:36:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e81bd866cb964bf4a370073146f2e94c', 'admin', '2018-08-17 09:42:16', '修改菜单建议管理');
INSERT INTO `sys_fhlog` VALUES ('e81dd317d2b2478d8b7393d3e0793806', 'admin', '2018-08-17 09:42:16', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e8264112b80c48448b41dc3f7f5181a6', 'admin', '2017-12-06 20:22:29', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('e83f97ff5000451aa438b8ed1546cb93', 'admin', '2018-08-04 16:32:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e84a0d242f184c54ac773e02794b8e01', 'admin', '2017-12-06 15:50:05', '新增系统用户：13610101010');
INSERT INTO `sys_fhlog` VALUES ('e84f377601b94147aa05a542e8faedc4', 'admin', '2018-07-13 16:42:24', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e84fa2a24e65459b815967fd2c23a16c', 'admin', '2018-08-02 11:27:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e8531d06ac1346629219bbce00383870', 'admin', '2018-08-21 10:59:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e87140ca9aa249a1b446e08e02504899', 'admin', '2018-08-10 17:14:24', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e879461332984a4d857e3347f98be391', 'admin', '2018-08-22 14:25:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e87d09c5093f4ff1bf3a0c2ddafe77d4', 'admin', '2017-08-09 17:48:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e87ff532d4964da6a4ab4df0fda93d15', 'admin', '2018-08-24 14:48:07', '新增菜单配送列表');
INSERT INTO `sys_fhlog` VALUES ('e89da96b8f47419dbdcd9c4c65a7011c', 'admin', '2018-08-10 17:48:19', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('e8bd53bfc5234be7b31cea5bed910e41', 'admin', '2017-11-07 16:21:56', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('e8c260470c4042cba303ee70e24c0e7e', '18990673099', '2018-03-11 08:35:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e8c9092c2b364870b3dd0831ac0ab2b1', 'admin', '2017-11-17 17:49:50', '修改系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('e8cecb1d046248d58a5724b25ca0dbd4', 'admin', '2017-12-11 18:18:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e8d089ce57e54d308440600dddb74e68', 'admin', '2018-08-11 14:00:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e8d159bc24cf4b84896c4762a84608a3', 'admin', '2018-08-10 17:14:25', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e8f7c9e4b521461ea0522ca861e3608f', 'admin', '2018-08-27 19:16:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e902389110c947cb867defcd7bff14a2', 'admin', '2018-08-17 09:40:27', '退出');
INSERT INTO `sys_fhlog` VALUES ('e9073c11d2c642dea42c1093ddc56f8f', 'admin', '2017-08-02 22:41:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e90eadaea82c45279f33b4d487b6103e', 'admin', '2018-08-13 18:25:23', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e9161bf7e2814ac99d814b4c9494f5ca', 'admin', '2018-01-08 10:07:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e91cf08f40724a4791117918ee48e6aa', 'admin', '2018-08-17 09:40:42', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e92dc8de9f9f4b139c0683c96e974f60', 'admin', '2017-11-01 09:28:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e94a0c571b364b269ac270e83d57c23b', 'admin', '2018-07-13 16:43:03', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e94b2600edc64d7daeb3f13044e6195e', 'admin', '2017-11-08 13:09:21', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('e95b53916c1f4ac7ac1bc157f50b63a2', 'admin', '2018-08-16 16:43:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e9626bb621134dd5b8f8e6401029a8dc', 'admin', '2017-11-04 17:55:27', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('e96692dd2c2c4a02b30cd4aa970358dc', '18990673099', '2018-03-20 07:19:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e9884802f4df4077827f5472d36f624d', 'admin', '2018-08-15 10:25:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e998c152bc044538be1816b25efdfc25', 'admin', '2018-02-05 15:56:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e9e0519df27444c5a4a52f7b168cdbf3', 'admin', '2018-08-13 18:25:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e9ee81fc3fd54896b6906b441ae733c5', 'admin', '2018-08-15 10:22:43', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('e9f2fcd0fb0a48429aefea5398ef8f99', 'admin', '2018-07-13 16:43:05', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e9fc6d80de8c4bd79298051d2ad6bce8', 'admin', '2017-10-23 16:27:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ea023e6101024fea94e185990636ea58', 'admin', '2018-08-15 10:32:45', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ea04042cd62a4deca9f4438e3e07df7d', 'admin', '2017-11-29 15:43:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ea0e235d2c164cc981bf09a4a4cf0a6e', '18990673099', '2018-03-04 09:58:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ea2079fcfe704009ab49f130c00d3b94', 'admin', '2017-12-29 15:58:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ea2637933b4f4d94bedfc7e7f1f1a787', 'admin', '2018-07-24 18:01:31', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ea30525c62ba485497dbb26e41a69a7a', 'admin', '2018-08-16 18:05:13', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ea3cb532bd0a43cba51fa534efa55800', 'admin', '2017-07-31 19:56:03', '新增菜单ASDF');
INSERT INTO `sys_fhlog` VALUES ('ea3dc3d463174bfa9ad945a248474afe', 'admin', '2018-08-13 18:24:43', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ea4a31f7eae94cecb8bcf9db7eae8915', 'admin', '2017-11-23 16:34:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ea4f0a99bb6a4c978e9aa61e00b71a26', 'admin', '2018-08-09 14:11:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ea73ff0493e3443980edad7f3b334361', 'admin', '2018-07-13 16:42:19', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ea760646c92141789a4085c108f32a4f', 'admin', '2017-11-07 20:31:50', '修改系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('ea93fb16e0174ef0a5a1678d39c1e915', 'admin', '2018-08-10 17:11:00', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('eaa34e60eaa749ffacc05fe9b1472a89', 'admin', '2017-12-07 20:38:41', '新增合作商家：null');
INSERT INTO `sys_fhlog` VALUES ('eaa5fb6966bb44ac9f1da00248b92eb4', 'admin', '2018-01-26 18:13:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ead7d7841d2d483eb278237b748f444c', 'admin', '2018-08-17 10:37:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ead8157c6bfd4505a1f9b9ede41e64e0', '18990673099', '2018-03-12 08:11:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('eaf2db7d6135410c808c99250a12e2e0', 'admin', '2017-08-01 18:55:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('eb0b49d045224b81a3bf70517af97b51', 'admin', '2018-07-13 16:43:46', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('eb11d577860e4d19a625a111e05f2913', 'admin', '2018-07-13 16:43:10', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('eb2aae12bbe645adb34507bd657c74be', 'admin', '2018-08-15 10:26:35', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('eb2b01f008f346eaa4e7704a9d3bb39d', 'admin', '2018-08-17 09:47:36', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('eb448d4ba6f247a89e445ccfdc44af24', 'admin', '2018-07-24 17:25:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('eb600d0afb3d4a6c96296baffdeab74c', 'admin', '2018-08-17 09:58:13', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('eb6ab61ad56a4e5c935c676b5c008a15', 'admin', '2018-08-17 09:40:55', '修改菜单建议');
INSERT INTO `sys_fhlog` VALUES ('eb86fb8b0c954985b4d53f0284b42f82', 'admin', '2018-07-13 16:42:24', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('eb8928fb1886432c8adf6ca265a6b3e8', 'admin', '2018-07-13 16:42:13', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('eb927a4fcbf04d55939dc9bff22719a5', 'admin', '2017-12-08 09:35:03', '删除按钮权限PageData [map={BUTTON_ID=4efa162fce8340f0bd2dcd3b11d327ec, ROLE_ID=68f8e4a39efe47c7bb869e9d15ab925d, guid=1512696903834}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@8e5603]');
INSERT INTO `sys_fhlog` VALUES ('eb994ce9f85b4934a1b8525312935ac2', 'admin', '2018-08-17 10:40:39', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('eb9bc43d93c14f6f8758803b88bd2d72', 'admin', '2018-07-13 16:44:11', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ebbc56ffaba448f099e022727c7f3dc0', 'admin', '2017-08-07 08:51:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ebbd4659d8054bbd8711ef8d19ff78f4', 'admin', '2018-08-17 09:40:56', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ebcbf89c68d44f94a7a3bff9520fbbad', 'admin', '2018-03-15 11:26:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ebed6db00edf4da1a04c803cfb9031af', 'admin', '2018-01-05 15:34:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ebefca245f2e4bb58e283652e175eb90', 'admin', '2017-08-31 15:38:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ebf7e5273fc049fd82c98113ba78d24b', 'admin', '2017-03-30 00:30:53', '删除系统用户：{tm=1490805053670, USER_ID=065202edd0cc44188e9c59c07b4742e1}');
INSERT INTO `sys_fhlog` VALUES ('ec02f6dc390f46b4ab93084a0a53581a', 'admin', '2017-08-03 21:27:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ec03d787cdae493aaeb7c4cbb2142fbe', 'admin', '2017-11-08 14:09:03', '删除系统用户：PageData [map={USER_ID=9afbbad109634e2485f29acc7ac3d87b, tm=1510121343446}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@598827]');
INSERT INTO `sys_fhlog` VALUES ('ec04937a80204013985922a83993f542', 'admin', '2017-12-28 11:11:47', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('ec0577ee53bc4915b49a885e3ce97303', 'admin', '2018-07-13 16:44:03', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ec111e0de36741228442e8c20ae0a6f9', 'admin', '2017-08-01 11:22:18', '退出');
INSERT INTO `sys_fhlog` VALUES ('ec21e25edf71410fb5901b7481035739', 'admin', '2016-11-20 02:40:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ec2661ae780744f9be88d474434d3555', 'admin', '2018-08-23 09:58:08', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ec3c6232f30a41be94b88899db34b4a9', 'admin', '2018-08-24 09:11:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ec3fe358b7df49c29e2cdfbd5f01249f', 'admin', '2017-11-09 11:17:50', '退出');
INSERT INTO `sys_fhlog` VALUES ('ec482355ca2e4b2685fc30f0c46e4eda', 'admin', '2018-08-14 09:22:08', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ec4b990979f8425a808e2a9a4fc63ef8', 'admin', '2018-07-13 16:43:40', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ec5550808e0d4e1a89cfd357116026ab', 'admin', '2018-08-15 16:32:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ec5ed4fb3469494897961e2023fa0824', 'admin', '2018-08-27 18:46:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ec676e10c607445b936a9cab7237b748', 'admin', '2018-08-17 09:48:59', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ec8cc9206e364e37ab055605e83ef6ac', 'admin', '2017-11-08 16:50:13', '退出');
INSERT INTO `sys_fhlog` VALUES ('ec94315cf139437e9c6d08715ebbe8b4', 'admin', '2017-11-20 15:34:55', '退出');
INSERT INTO `sys_fhlog` VALUES ('eca59d9b24594e8482f5873363a64aa3', 'admin', '2018-08-17 09:40:00', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ecaacc2cedbc444698838da6ba647ce4', 'admin', '2018-08-16 10:42:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ecad6ac633d542848a6603619aa72576', 'admin', '2018-08-18 14:05:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ecc0c57e613f4bad96a03bd72af9c42e', 'admin', '2018-06-01 11:18:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ecd1824e54854adebd39dd74937d8bb6', 'admin', '2017-11-30 11:34:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ece38a5486c24079be9445dc47c9eac9', 'admin', '2017-09-01 16:33:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ecf12269a8ff4c8c829e145fa3d39abd', 'admin', '2018-08-15 18:27:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ecff54c0bdad4ac6854c520e91788e19', 'admin', '2018-08-07 17:04:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ed1bc40d58b542d9b915599b22bdb926', 'admin', '2017-11-11 09:45:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ed21b36c98444e98a0d57d0377ee2abe', 'admin', '2018-07-13 16:42:20', '修改菜单店铺管理');
INSERT INTO `sys_fhlog` VALUES ('ed2bb4b8da6248a98f1aaffba10c68aa', 'admin', '2017-11-04 13:38:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ed331239bce14263a84cf4c74c9fec40', 'admin', '2018-08-17 09:42:18', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ed52200a7eaf46fbba8a26704974230c', 'admin', '2018-08-16 18:04:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ed52802eed724d679d93328dbed015eb', 'admin', '2018-08-10 17:14:24', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ed57517a38d74b3dacaf9f1f042ea177', 'admin', '2018-08-01 13:41:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ed5dee3a071f4036b7fcc5797df9a08a', 'admin', '2017-12-06 09:06:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ed692fa35cb7413597e4d47f021126b6', 'admin', '2018-08-17 15:50:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ed6a40b0b6c0418a9d731b6a31b5eb7c', 'admin', '2017-11-04 17:23:20', '修改角色:清洗师');
INSERT INTO `sys_fhlog` VALUES ('ed6bde8e2cd14b699dac4c7862613f49', 'admin', '2018-03-14 10:34:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ed88f32d9fb54be3b96f70b1b423c008', 'admin', '2018-08-23 10:10:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ed9a0cb15ff84f69a5652a399e7ded97', 'admin', '2017-11-17 17:39:10', '新增合作商家：null');
INSERT INTO `sys_fhlog` VALUES ('eda5c38126b7411d98ee1f94f83d95d8', 'admin', '2018-04-05 08:23:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('edb3415f9f1b4e10aab861154a000fff', 'admin', '2018-07-13 16:41:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('edbd509470f342f98bda5a7ab05f0d96', 'admin', '2018-08-21 13:55:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('edcc25de29d44fa7ace0d0be9aca2d7d', 'admin', '2017-08-02 21:57:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('edd7d05c4c0347ffab20432fbbd1ded9', 'admin', '2018-08-08 14:09:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('edebdf7e15d848348a13ed7757cc1f5c', 'admin', '2018-01-02 09:25:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ee0170b80df54a94a9b6ba51176c7f63', 'admin', '2018-08-18 14:26:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ee10bd7308a94e1cb57ceff325441476', 'admin', '2018-08-21 16:08:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ee17c057ffb648f593499e715894f40b', 'admin', '2018-08-16 11:03:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ee29c0eae05448ccb1d6dc7677ab8f90', 'admin', '2018-08-10 17:10:59', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ee4148693e3e4a1485edf414dac743c5', 'admin', '2018-08-15 10:32:43', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ee5cd1d42b0a400583f18442857746f1', 'admin', '2018-07-24 16:32:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ee846e9b0fc9407dafa307dadd66bfbf', 'admin', '2018-08-17 09:47:36', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ee8c2acc31c44c81ac92bcbffff3e06a', 'admin', '2018-08-17 10:37:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('eea155b1b3584d43875e148e7de8af65', 'admin', '2017-11-27 09:29:10', '修改系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('eea822a9e69543028cf264715d044b59', 'admin', '2018-08-16 18:27:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('eebd6df5a2bc403ca5c787c9a828f8ee', 'admin', '2017-11-10 19:15:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('eec13ca5b77c46458f5d24d666adc738', 'admin', '2017-10-07 21:21:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('eecb2d054aeb41648b6a2ffbc6f1223c', 'admin', '2017-11-21 18:38:31', '修改菜单订单管理');
INSERT INTO `sys_fhlog` VALUES ('eecd231475d445d881f7655248031d96', 'admin', '2018-08-10 17:48:19', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('eed21b03720a4be19bfca037c526e852', 'admin', '2017-12-29 13:14:08', '修改代理条件:null');
INSERT INTO `sys_fhlog` VALUES ('eeef7e81f6fd4efb8c5a134bf76147e1', 'admin', '2018-07-13 16:44:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('eeffe2a53cdc4a38badbc0a1902252f8', 'admin', '2018-08-17 10:06:50', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ef06dea18aca45779a17acea2e0984d7', 'admin', '2018-08-23 17:33:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ef0bbe17e8b34579afd6abe47f212fa3', 'admin', '2018-01-22 12:52:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ef0eac12f0dd48e9a63c9505ca633e23', '18990673099', '2018-04-26 17:47:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ef1433c7f12a4a2d87fdb0299b467549', 'admin', '2018-08-10 17:11:00', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ef1b6ae5eb8d49b2b22f31dedcd73d2b', 'admin', '2017-12-08 09:35:12', '删除按钮权限PageData [map={BUTTON_ID=fc5e8767b4564f34a0d2ce2375fcc92e, ROLE_ID=de9de2f006e145a29d52dfadda295353, guid=1512696912906}, request=org.apache.shiro.web.servlet.ShiroHttpServletRequest@1805ecf]');
INSERT INTO `sys_fhlog` VALUES ('ef2618ea19804f26a6d8b2875eaa4a8e', 'admin', '2018-07-13 09:32:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ef349abbb6f346d1b9b9abc86f390666', 'admin', '2017-10-24 16:30:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ef610892ae6447c592ee4bda6f2251f8', 'admin', '2018-07-13 15:45:27', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ef625fbb131a4818beb215a302da9606', 'admin', '2018-08-17 12:09:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ef648a6bb98b413f8026d0c08dd9107f', 'admin', '2017-12-14 17:36:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ef6515b9347b46fd9bb56ba8cccdb517', 'admin', '2018-07-13 16:44:01', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ef677ce4540a43dbac88559d75516e52', 'admin', '2018-08-17 10:38:47', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ef6f8bc9bcbd45e984fcc441a54fe2a7', 'admin', '2018-07-13 16:42:18', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ef739433bc1d4843bb6a5ea1e608c21a', 'admin', '2018-07-13 16:43:45', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ef815f4f081e4058aca92613e550c5d7', 'admin', '2018-08-23 17:31:15', '退出');
INSERT INTO `sys_fhlog` VALUES ('ef9328d6550740b383f02f353bbf764d', 'admin', '2018-07-13 16:42:19', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('efa15b49caad48758be001b50becca0c', 'admin', '2017-10-28 14:13:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('efa324d1c7b74741b13945717eb81b32', 'admin', '2018-08-23 18:14:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('efcc2cef18124a73895d52537488950b', 'admin', '2018-07-13 16:41:50', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('efcdb2a0d6cb4df698f1bacc97d5037c', 'admin', '2018-08-16 18:10:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('efe1471990d54bdf88e953e621a9bdbc', 'admin', '2018-08-16 17:56:14', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('efeab276fdd94cf2b7a74a744720b3d2', 'admin', '2018-08-16 17:57:02', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('eff121e2bdd64d51817901deb5a6c518', 'admin', '2017-11-17 10:46:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f000d2350f43409d8c1b9fd038b1e133', 'admin', '2018-07-13 16:41:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f0070ec561b24a71a8d5ebdc1ec7c5ee', 'admin', '2017-07-31 20:41:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f010888a97314abd8e0a080c8bb32260', 'admin', '2017-11-10 18:56:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f0339c4a179e4ac6b869e0c0f0a277ed', 'admin', '2017-11-13 17:53:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f047f6db0c99421a875ae5fd5111c218', 'admin', '2017-11-13 15:45:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f0827bb0dadf450e999e0b984bd74b3a', 'admin', '2018-08-17 10:32:32', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('f0911b3e2654451a8527f73ab60abcd1', 'admin', '2018-07-11 10:13:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f0a3f2108b1143b7bf9fca8da9697a44', 'admin', '2018-07-13 16:42:35', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f0adeefb766f470e9873cee0e2a2c148', 'admin', '2018-08-23 17:33:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f0b3fa378d1e4054af31d5f982929f1c', 'admin', '2018-07-13 16:43:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f0b504ecffaa4b78a3cb17aba8f4d66f', 'admin', '2018-01-26 13:18:47', '修改菜单公告');
INSERT INTO `sys_fhlog` VALUES ('f0b8ac0dc4bb445a9e383552b04f4253', 'admin', '2018-08-15 10:26:34', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f0bef6637d21454991bcf0eaee14e6ef', 'admin', '2018-08-13 13:19:27', '退出');
INSERT INTO `sys_fhlog` VALUES ('f0c5192dc9814006994a7711c1823284', 'admin', '2018-02-01 14:15:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f0c5d8fc014845178d15df2610ebb8f9', 'admin', '2017-12-07 20:27:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f0c5e861f8ce47ecb001e866873e611a', 'admin', '2018-07-13 16:43:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f0c700e2ee894346a5722741f72370ce', 'admin', '2018-01-18 11:14:01', '删除角色ID为:5c1f1598b90e45f7880e095e9812eea5');
INSERT INTO `sys_fhlog` VALUES ('f0d928f0eec64d3abeaf496e4767d50e', 'admin', '2018-08-17 10:37:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f0e997b330184a408a8f663b214c5b1e', 'admin', '2018-08-17 09:47:37', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f0ecdc6d75d4407aa8a250200d6e759b', 'admin', '2018-08-17 10:39:41', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f0ee45f84b8945b2be838d08de843c3a', 'admin', '2018-07-10 14:39:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f0fa60cae4914210a117bfb3330cba3e', 'admin', '2017-09-08 13:16:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f0fae086607a42a58412da93f15ca8b0', 'admin', '2018-01-26 17:00:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f1414f81311545c9a86720c96e3efbcb', 'admin', '2017-12-07 09:59:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f141cdd1dbea414981b1847a3c737ac7', 'admin', '2018-08-24 14:49:17', '退出');
INSERT INTO `sys_fhlog` VALUES ('f149d7591a0a4c9ab374d74e4d356379', 'admin', '2017-08-30 16:38:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f1792c0cd1bf436d958fa7de91647ba2', 'admin', '2018-08-21 16:23:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f17bf67f927f47ddb9a60cf0d35ea541', 'admin', '2018-07-13 16:43:20', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f18547af14584d169e4ed222c3c90b8c', 'admin', '2018-01-26 11:37:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f18b954121f141c6b1106aab720936af', 'admin', '2017-12-06 15:39:41', '退出');
INSERT INTO `sys_fhlog` VALUES ('f1a5d849c4a74c63b763e3cc3182e9e1', 'admin', '2017-09-21 14:09:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f1a9263ec0da4215af1350596516c71d', 'admin', '2017-12-02 15:12:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f1b133d526ae4bbd9be42a4fde879181', 'admin', '2018-07-12 16:29:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f1d57c7a18194d4eae02682b42ee0af7', 'admin', '2017-12-08 09:32:41', '修改cha_qx权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('f1db13b02f5b4ec78da9dac5addd2ede', 'admin', '2018-08-01 16:59:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f1dde728412b457b823d8ee7e45b4f99', 'admin', '2017-11-23 18:32:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f1ec7645797f4e0a894486ceccf1d4a2', 'admin', '2017-11-27 13:55:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f20730c27533412a834aafc7f25be41c', 'admin', '2017-09-30 12:13:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f208f774c1d24620b0166d44c4c97776', 'admin', '2018-08-22 17:50:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f20f0a389cf44c6280cd599eba16e55a', 'admin', '2018-08-23 10:09:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f2155931343146b694fb9ba79e4acaae', 'admin', '2018-08-17 10:38:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f21e9281750f4ea2ab003bacb0e5bb41', 'admin', '2018-08-17 10:37:38', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f23ee265c07b48b3be035cd228776384', 'admin', '2017-12-29 15:57:41', '退出');
INSERT INTO `sys_fhlog` VALUES ('f2569cae218246f0b640fbc2e2691a43', 'admin', '2018-08-16 17:57:03', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f2688afeedc44737b781e6904140249a', 'admin', '2017-03-16 01:03:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f26e19dc7c8f4b66b122ffc8cdb9ba55', 'admin', '2018-08-10 17:53:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f27e32a1e5fa448e8a6e504efddf8112', 'admin', '2018-07-31 18:39:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f28b116ea0934548bc4484fae251c620', 'admin', '2017-11-24 19:28:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f2931b765a9647ef8bb017d1ac4367e5', 'admin', '2018-03-18 16:57:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f299658295b440d79f585fc38498e21f', 'admin', '2017-11-27 17:06:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f29f565cac3c48e5b88508bc3c8a2fc7', 'admin', '2017-11-13 18:16:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f2a1dbeb0ca240369dc712d71c5fc09f', 'admin', '2017-11-20 18:30:18', '退出');
INSERT INTO `sys_fhlog` VALUES ('f2aa8c29fccd44ddad5974c4dfcfb492', 'admin', '2018-08-15 10:32:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f2b2db6831cc49bca0f2aa52e9bd2a97', 'admin', '2017-11-09 15:29:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f2c358f449d747f09fb7610043fd47ba', 'admin', '2018-08-13 18:29:59', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f2c52ed4aee048dab494a3469c39d187', 'admin', '2017-11-04 09:31:27', '修改角色:合作伙伴');
INSERT INTO `sys_fhlog` VALUES ('f2d950636246404f84e044259db32d36', 'admin', '2016-11-02 01:14:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f2e1077b32bb48b69989b6bc5d1a80db', 'admin', '2018-07-13 16:43:04', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f304d5c1291a44468a60894f89c4a2b0', 'admin', '2018-08-17 10:38:44', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('f326b5cef66840e1a8bd9e01ebf535da', 'admin', '2018-08-17 10:01:12', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f32fd29862ff4e5a97c924959dc771ca', 'admin', '2018-01-22 10:42:43', '修改菜单按钮管理');
INSERT INTO `sys_fhlog` VALUES ('f34c60cef00e4388b9e8de05fd14d61d', 'admin', '2018-07-13 16:43:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f3604b47d7e441ad9e15dc210852367a', 'admin', '2017-11-25 09:23:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f360b96c792a42dcbb6e2967a19362a1', 'admin', '2017-11-04 17:24:42', '修改角色:下单人员');
INSERT INTO `sys_fhlog` VALUES ('f364498f61294cbf9844f139c6f825ec', 'admin', '2018-08-17 10:01:11', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f36bf9a523f84e5bbebc0a4a407afbad', 'admin', '2018-07-13 16:43:56', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f372d5766dcc4a779b0e28289c3c153f', 'admin', '2017-12-28 14:27:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f385d354aa2945b1b20e53c8355c2ea7', 'admin', '2018-08-17 09:48:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f39176852dbe4fcf8e20760eb0023ef7', 'admin', '2018-06-18 11:05:38', '新增菜单新增菜品');
INSERT INTO `sys_fhlog` VALUES ('f3986874e550415baf2aedc83c232656', 'admin', '2017-10-15 21:27:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f3ee39cefde04e19856ad81d77b5914c', 'admin', '2017-11-23 20:55:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f3f8f8b54b514dc58c7a1a218d60da88', 'admin', '2018-08-17 09:40:43', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f40040f3e5b948d386a31cb8650065ba', 'admin', '2017-12-15 11:02:33', '修改角色:免费代理');
INSERT INTO `sys_fhlog` VALUES ('f40f32418a304f0d9d207078170769dc', 'admin', '2018-01-06 13:28:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f41d8584a63d4bd8b141a892d615f530', 'admin', '2018-07-13 15:38:32', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f42309d6f7ec4152896a230f449cda13', 'admin', '2018-08-10 17:10:59', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('f435b3da2bb54610a8cb8c5fadfcb578', 'admin', '2018-08-21 13:52:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f44379f2ce964a66aeced6fe753644d3', 'admin', '2018-08-23 17:31:00', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('f449a481b6414a7ab3ad9af0c1e829f7', 'admin', '2017-11-18 17:48:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f4652bbcc84b4a418fa1d2e72b26ae6b', 'admin', '2018-08-15 10:26:35', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f4a2620a8c4441c89e34ef761bbe37d9', 'admin', '2017-12-29 13:11:17', '修改代理条件:null');
INSERT INTO `sys_fhlog` VALUES ('f4bc4a7bce65412794b3a4c4c7a96beb', 'admin', '2018-07-13 16:44:19', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f4c2d0a896514b278ae28b1de12f9416', 'admin', '2018-07-13 16:42:15', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f4d5e1f4cfb0467eaf6f31d33dcdaaeb', 'admin', '2018-01-16 18:29:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f4dc4046062541c88115c3c232fb1b3e', 'admin', '2018-08-02 11:48:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f4e7e591f38343db999a07278fb28c51', 'admin', '2018-08-23 17:33:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f4f519bd9b794c989d41ed1442ff3296', 'admin', '2017-11-09 10:42:39', '新增菜单查看所有地址');
INSERT INTO `sys_fhlog` VALUES ('f50374fab2924d3780391784373668c6', 'admin', '2018-07-13 16:44:13', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f50db50e40d54a5daa8ced50a7f2dfca', 'admin', '2018-08-17 10:06:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f51ebf99d87749c28976667ee987f9f9', 'admin', '2018-08-18 14:01:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f52be166f11b4da393149b543d1b3808', 'admin', '2018-08-17 09:40:00', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('f538dde327dc4e1b892b2cc14ccf8bd0', 'admin', '2018-07-13 16:43:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f5407dc4aa8742d0891563c84f56a936', 'admin', '2017-12-28 20:00:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f54e038f1aa4467297e8f6bede6723d7', 'admin', '2018-07-13 16:43:13', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f5602ccd31b6496cb0e4a14580355803', 'admin', '2017-11-15 21:49:16', '修改菜单产品列表');
INSERT INTO `sys_fhlog` VALUES ('f561cea1cafc4d748ed5170a0bacea82', 'admin', '2018-08-24 14:48:09', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('f591af905a614e098565c8d0f5ac81f3', 'admin', '2018-08-08 16:52:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f5932b8f7a0841faa9e571d9c21e482b', 'admin', '2018-08-16 18:02:37', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f59ab6fcd4904218affe919d0f410be8', 'admin', '2018-07-13 16:41:54', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f5af4cef3bb5490abd0c235f33bbb51c', 'admin', '2017-09-20 13:15:17', '修改角色菜单权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('f5bdab01a168434eaf620add0355e6b3', 'admin', '2018-07-13 16:43:33', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f5c9ef871e2340eebe4564c51409d027', 'admin', '2018-08-16 18:04:57', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f5de4a0f41f44dc6bd064f7f0084814e', 'admin', '2017-03-29 01:22:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f5ed9b8b85c5434b9be2070cc5bf482b', 'admin', '2017-11-22 11:13:59', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f5f18869ea8e4cdf937670c8f5bc1afa', 'admin', '2018-08-16 18:02:17', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f62021e632b941eeb1598ef1e09e1a0c', 'admin', '2017-11-07 21:29:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f625ccf2ee2a47438f43540f80cfd2b6', 'admin', '2017-11-23 09:32:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f648e7bc6a8348d6ba4d12caf22f7c38', 'admin', '2018-08-15 15:29:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f64c82cdf9fe42dc8471dc91a32f8986', 'admin', '2017-09-02 22:02:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f64e290032924e37a171483e02c99737', 'admin', '2018-07-13 16:44:15', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f666301ed1c943a5932f3defadac68ef', 'admin', '2017-09-20 13:10:35', '新增角色:二星级店长');
INSERT INTO `sys_fhlog` VALUES ('f6784e87ed484860840d92481a77ce5b', 'admin', '2018-08-17 09:47:36', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f682ba54ac6a4a779dbbcb82434088ea', 'admin', '2018-08-13 18:23:18', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('f68b336c83b34b69beb5f9fdd27cf971', '18990673099', '2018-03-01 09:32:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f6a42ecea0064abab013beeceaf3cd5a', 'admin', '2018-01-10 13:14:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f6b2e78fca3346c2b5b8b0e8aad5bf88', 'admin', '2018-08-13 18:23:16', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('f6be636200a146809786720366ffdaa1', 'admin', '2018-08-25 10:53:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f6ec366b11be4448828c4a79943d4ccc', 'admin', '2017-11-08 19:54:29', '删除菜单ID102');
INSERT INTO `sys_fhlog` VALUES ('f6ec94aa7d724bd3a95aa332c18f8632', 'admin', '2018-08-16 17:31:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f6f4423d135f4c899bfa6dce3d8ea42b', 'admin', '2018-07-26 09:32:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f714104c90b34c4e8f8efc150249df31', 'admin', '2018-08-16 18:05:14', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f72fdd20e5ac45d8a3229b62f0d56140', 'admin', '2017-08-30 13:25:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f734b128d72c40ae99383bd49265828c', 'admin', '2017-11-01 15:04:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f73c1939ad54457f8e8977c0dff3abc6', 'admin', '2018-08-18 15:26:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f7509ea02fc74edcbb2d4b423a30918b', 'admin', '2018-08-23 17:29:54', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('f752322c11754e0b9a3a3ad8a1f3dbdb', 'admin', '2018-08-21 16:29:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f75b77bc004c4fe5848be9c79a256d50', 'admin', '2018-07-13 16:43:28', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f75beabe0c9843868bc0537db1c84fe1', 'admin', '2018-07-13 16:43:24', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f75f805974504fb8b591c9ab34b7c55a', 'admin', '2018-03-09 22:31:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f781d70740494856ad1c9a4a1aff222f', 'admin', '2017-11-07 16:43:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f78f168b557749c4827571debdc5f6e6', 'admin', '2018-07-27 11:31:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f79356f448ea4857b3b4054b422e0557', '18990673099', '2018-03-15 15:29:38', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('f79a5970cb8e423db4951eb4c8de8cc1', 'admin', '2018-07-13 16:42:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f7aa330ecbc849e6a547a2e03d65bb89', 'admin', '2017-09-20 13:10:50', '新增角色:一星级店长');
INSERT INTO `sys_fhlog` VALUES ('f7b444d234bd4b01ad7c2764583625b0', 'admin', '2018-08-16 17:57:03', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f7e75ddd8d764850a9bf5bd362590ecf', 'admin', '2018-08-17 09:58:13', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('f7f23290de8e4d92b3792d3def6c26bd', 'admin', '2017-12-29 11:07:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f7f5546fc23942729904d353f8db0ff9', 'admin', '2017-03-16 01:01:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f7ff3e394f2c48e89295172ef090d266', 'admin', '2017-08-18 07:16:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f80643f7f3ed484ba1960e06226895cf', 'admin', '2018-02-01 14:13:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f81ec9f57d244229ae3846953037314e', 'admin', '2018-08-17 09:40:43', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f82af84314da45cab90de3ead97437ee', 'admin', '2018-08-02 11:54:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f849fd5f92b44a368b1545f8c7c9b198', 'admin', '2018-07-13 15:45:26', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f8769bb73a1d4104bc060ed6039dbd34', 'admin', '2017-11-27 20:02:56', '修改菜单查看简历');
INSERT INTO `sys_fhlog` VALUES ('f88437e532aa4eaea6792924ae382729', 'admin', '2017-03-16 01:00:54', '退出');
INSERT INTO `sys_fhlog` VALUES ('f893e3b539e240cd85d7292aef368bd0', 'admin', '2018-08-16 18:18:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f8958029689241b39e91de286672ae32', '18990673099', '2018-03-06 18:37:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f897e81951784e2198cbb8f4b5da0529', 'admin', '2018-05-24 13:29:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f89a59b879b14fd0bb5dbb38bada095a', 'admin', '2017-11-17 10:08:52', '修改菜单合作商家');
INSERT INTO `sys_fhlog` VALUES ('f89c5cd2650f44838ae9cc7fe4332b56', 'admin', '2017-11-09 11:18:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f8a94edc0787407dab76cedaf4fbd116', 'admin', '2018-08-15 15:46:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f8ad70266fbc476797f464a5bd5cd8e0', 'admin', '2018-08-17 10:37:37', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f8b9c85c428545ba883d22fa1c4baba4', 'admin', '2017-08-07 07:37:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f8ba06a754ce4035a851f0bc07b5b27e', 'admin', '2017-12-11 11:17:08', '新增菜单服务地址');
INSERT INTO `sys_fhlog` VALUES ('f8bf6e0230a840d293f4a19defc46436', 'admin', '2017-12-05 09:42:28', '修改角色:绷工');
INSERT INTO `sys_fhlog` VALUES ('f8bf72dc58694541b9e3c9021f75110b', 'admin', '2017-11-07 09:19:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f8c1e59edd2a4abfa26e1bd4190169f1', 'admin', '2018-07-13 16:43:36', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f8da12cde2bc48a389938b903087171d', 'admin', '2017-10-15 09:18:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f8f41ce66c644e608e555b6f6c98bc55', 'admin', '2018-07-13 16:42:54', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f8f4b966379240d694d3854e03014541', 'admin', '2018-01-22 14:39:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f8feb1cc012e4c78b382bb97f123a3af', 'admin', '2018-08-15 10:26:35', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f90bdd22f1c448569d5087b037d13475', 'admin', '2018-08-02 16:11:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f92f499d9b584078a5c5dec7058b356e', 'admin', '2018-07-13 16:44:28', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f932037a7ff64137ae422271e00b51da', 'admin', '2017-09-09 09:39:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f94031bf51e1490aa090c0daec5d93e4', 'admin', '2017-09-21 14:09:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f94744ea2da5410ba7857c36f9dd08ad', 'admin', '2018-07-13 16:44:36', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f955a9e1880f47db8c8d2fe71f37ce97', 'admin', '2017-11-13 18:08:42', '修改菜单增加地址');
INSERT INTO `sys_fhlog` VALUES ('f955bc37fd9d4d3ca32ba28da279d451', 'admin', '2018-01-08 17:31:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f9578fe389164ddc8d93a012f2bf0d6f', 'admin', '2017-09-06 17:53:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f95fe5e1ea58475d8f652e200e181c71', 'admin', '2018-07-13 16:42:11', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f9763ad352b341d295b536dd53b075ca', 'admin', '2018-08-15 10:26:34', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f984b9c409fc43e49ba01e7d9ffd790b', 'admin', '2018-08-16 18:18:49', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f99897b1a3fb449b94b23ca7c7c00241', 'admin', '2017-11-04 12:51:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f99e2cefd3e8401db69d911796008434', 'admin', '2018-07-13 16:44:29', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f9a2b19560be4ce99e7741e6c1628fe9', 'admin', '2018-08-17 10:38:46', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('f9b01118ce34467099956c955e6f55c0', 'admin', '2018-08-10 18:35:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f9b70c778a964dc8a272b9bbe89ccfad', 'admin', '2017-12-15 09:58:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f9e46cd88a824103b09954f6a14106dc', 'admin', '2017-11-10 16:23:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fa0b0dd462f94fd48a6bd7da821d5f10', 'admin', '2018-08-13 18:24:06', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('fa1bcd476ea84c75a64f4e2992b5e4f9', 'admin', '2017-11-22 18:54:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fa1ce64e6d59436c9b22d4334cf87a7a', 'admin', '2018-07-13 16:43:16', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('fa22078936a64adbb341f40594e67d75', 'admin', '2018-07-13 16:42:02', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('fa31b02d66cb47cfaf159df5728179bd', 'admin', '2018-08-02 16:38:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fa3d1acee5fe4118a0b2c4753482c055', 'admin', '2018-08-15 10:32:44', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('fa462664bb3948a881cded45f23ebcf4', 'admin', '2017-08-02 19:32:29', '修改菜单商品管理');
INSERT INTO `sys_fhlog` VALUES ('fa4be53152a448f891201da5ca23fab8', 'admin', '2018-08-23 09:58:08', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('fa50be8f2bbf48c794d95cd3aeabeb80', 'admin', '2018-07-13 16:43:29', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('fa54160fef394986a7d14e0c8068cd2c', 'admin', '2018-08-02 10:13:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fa5ef50ee3a44327a6e085a821308a4e', 'admin', '2018-08-23 09:58:17', '退出');
INSERT INTO `sys_fhlog` VALUES ('fa6abc0d94774b959d5a96e01a8700b9', 'admin', '2018-08-17 09:42:02', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('fa7835e8945b4a0e9843c3d057a5baa0', 'admin', '2018-01-29 11:34:59', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fa84e91aedb142cbaad944dce1dcdc82', 'admin', '2018-08-21 17:07:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fab0af4df4f94e3d9a0f9e9866c462e0', '18990673099', '2018-03-17 08:46:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fab0d07ad3be4464a6b90d935e84dab5', 'admin', '2017-08-31 15:20:33', '退出');
INSERT INTO `sys_fhlog` VALUES ('fab7fa2b45714c7d9fb133f27043e3bb', 'admin', '2017-11-10 15:17:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fadf73e3bb3042a6862219d0ea7998c0', 'admin', '2018-03-15 16:52:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fae4d1a1e45c4287a6cfd4e005e78cff', 'admin', '2018-06-18 11:03:47', '删除菜单ID117');
INSERT INTO `sys_fhlog` VALUES ('faf5a15cceff4296b733adab36d32808', 'admin', '2018-08-13 18:42:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fb03515b12804cec8d9b21b131a45907', 'admin', '2018-03-09 10:03:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fb0b15547b58462ebf257b3c049bf353', 'admin', '2018-08-23 17:31:01', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('fb0b7ea6d3c443ba969aeef65ddcb9a8', 'admin', '2018-01-09 13:10:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fb0e6264bbc9452cb32e19dfe00412a9', 'admin', '2017-11-27 10:51:01', '新增菜单查看简历');
INSERT INTO `sys_fhlog` VALUES ('fb1ae572f9a345cd881d119dc7aeb2d8', 'admin', '2017-12-06 15:17:01', '批量删除user');
INSERT INTO `sys_fhlog` VALUES ('fb2bdc8737fc4721861dc78a4f2a2049', 'admin', '2017-12-12 14:08:36', '批量删除user');
INSERT INTO `sys_fhlog` VALUES ('fb2c66e660da4e3bb93894675611f6c9', 'admin', '2017-10-30 11:03:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fb49992dd47741ec80e8d430d3506c99', 'admin', '2018-01-26 11:16:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fb4a0eddce30418d8164cd945c6af627', 'admin', '2018-08-16 17:56:13', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('fb67dd0ed64745ba9ae6dd466e8ef4af', 'admin', '2017-11-04 12:49:35', '修改积分提成:5');
INSERT INTO `sys_fhlog` VALUES ('fb7186becb6c43b3915668608f7ff07b', 'admin', '2018-08-09 12:23:51', '导出用户信息到EXCEL');
INSERT INTO `sys_fhlog` VALUES ('fb7ec677b3b647fb85182294be9e4b66', 'admin', '2018-08-17 09:40:55', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('fb86c567f540464dbbe7bf8ab777b242', 'admin', '2018-08-23 17:33:06', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('fb88f848c2714c3b8931a3161d1db6a0', 'admin', '2018-08-17 09:39:59', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('fb930be3177e454989bf4b683bdc8a6a', 'admin', '2018-07-10 11:42:59', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('fba902b05f3d4ef8bd6da93913eaf71b', 'admin', '2017-08-01 11:22:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fbb01f7a9748439b8d0a1729522ef321', 'admin', '2017-11-04 12:52:07', '修改金额提成:3');
INSERT INTO `sys_fhlog` VALUES ('fbce9e48344e4786a63929283fb031e5', 'admin', '2018-07-13 15:45:26', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('fbd0727add334bc5b93eb67f6a90b0c7', 'admin', '2017-11-07 11:37:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fbd37c86f7f74482bd81d701e7b7392d', 'admin', '2017-11-04 17:18:28', '新增系统用户：null');
INSERT INTO `sys_fhlog` VALUES ('fbe7c3c84d404d2fa66921134430fc5c', 'admin', '2018-08-23 10:09:52', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('fbf345fc7da64f8e9b882c6b7d2795b7', 'admin', '2018-08-22 16:01:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fbfaafa03fca4de688e796797b34638e', 'admin', '2018-08-02 09:42:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fc008e5982374c6e994cf80de4f3ccbc', 'admin', '2018-07-14 11:21:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fc0ed3430a9a4809b698b93053ae8f51', 'admin', '2018-01-25 10:55:07', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('fc1e051a57534f448e546a2e92100759', 'admin', '2017-12-15 11:02:03', '修改角色:普通代理');
INSERT INTO `sys_fhlog` VALUES ('fc210676b9b342769d20c3ac475eb44e', 'admin', '2018-07-27 13:16:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fc295b558aff4d6799904405b2f310fe', 'admin', '2018-08-15 09:08:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fc2de7e338eb458c8b74e8a94c27dd88', 'admin', '2018-08-17 09:40:55', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('fc30f98197c94245981e60f187e64910', 'admin', '2018-08-17 09:42:01', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('fc48a967439e41d9b2069950afa12c01', 'admin', '2018-07-13 16:42:43', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('fc4dba8e4cfe49978ee56080728962e7', 'admin', '2018-08-13 09:15:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fc64b806766e4e5583121accf23eee09', 'admin', '2018-07-13 16:41:54', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('fc6d67fc7ee74b76bb817f8dbb6d1b08', 'admin', '2018-08-18 17:06:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fc70ece54cfb40a398ce7421e4752fe6', 'admin', '2018-03-15 18:32:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fc72fd25744b4bc1b2d488b886e9f6f9', 'admin', '2018-07-13 16:42:53', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('fc79d26c8afa412c98b7a82de51ea235', 'admin', '2018-07-13 16:43:56', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('fc7de1d9ebb948e2bf1ca65a8ee5cbe5', 'admin', '2018-08-14 09:22:09', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('fc7ee01de98b40af86fc53128d527c18', 'admin', '2018-07-13 16:44:36', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('fcb1f86ecbf64d21b282189d534122fd', 'admin', '2017-11-09 10:53:05', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('fcdb7865768e48228f9844c3ec50ec7b', 'admin', '2018-08-17 09:58:13', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('fceab60a760f4a1ca3c6b5c50df892fe', 'admin', '2017-03-30 00:55:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fcef6224d8b54d1db98aeb555a4fc9e7', 'admin', '2018-03-09 22:10:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fcf19464a90c4fd39c32042f35656526', 'admin', '2018-08-17 10:32:32', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('fcfe85b6606448ce8905f118307e394e', 'admin', '2018-07-13 16:43:31', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('fd0b99d76d9d40bc8146621a0a806194', 'admin', '2017-09-08 10:15:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fd35697ace0846ba96235cb4f9cd4dc2', 'admin', '2017-11-15 13:29:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fd40def198d5459aa3e0a27c3debeb70', 'admin', '2018-05-31 16:50:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fd472052798e408c882490f409976aad', 'admin', '2017-11-04 14:08:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fd62427817364fd6a566f968309eddbb', 'admin', '2018-08-21 15:00:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fd7097b0ad84477abffb8ec293017cff', 'admin', '2017-08-04 09:26:23', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('fd8154239aa9429db4640cfe613fc917', 'admin', '2018-08-16 18:04:58', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('fd89822b2e904846bdaa14d1fe74a13f', 'admin', '2017-11-07 17:15:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fdc49b52699946b288a31a905d70f3f9', 'admin', '2018-07-26 12:00:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fde32634e9394b939df04dcf6e0338b1', 'admin', '2018-08-01 16:29:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fdf2d16d816147aa89a335370b662c11', 'admin', '2018-07-27 15:57:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fe0ef37280624206986e8782bb57f539', 'admin', '2018-07-13 16:43:08', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('fe18e092f63f4bebbe8f7ee9a8bfac12', 'admin', '2018-07-13 16:43:42', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('fe2c5de5283c46199d22b1a7ea8bfe1c', 'admin', '2018-08-17 09:48:59', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('fe53124626ce4227940c4a8104496f1b', 'admin', '2017-11-09 13:12:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fe5ee09b2ac34d6fa436db96feceb22c', 'admin', '2018-07-13 16:42:02', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('fe65d5a7848d42eeb601fb27036e3cec', 'admin', '2018-08-18 18:02:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fe711259847445c79708e404a9efdcf7', 'admin', '2018-08-06 17:37:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fe7f203241da483890c4482ff3f9cd5e', 'admin', '2018-07-13 16:43:51', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('fe8b14ff40a54f7ca01150b6dac81508', 'admin', '2018-08-17 17:41:31', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fe982b6cdb874fd1b8e381ae793237a5', '18990673099', '2018-03-15 16:08:48', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('fea868bd8435492f94c69762cab9aafe', 'admin', '2018-07-13 13:45:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fec30e9ba197494d9efc156a5852a6b7', 'admin', '2018-08-16 17:57:02', '修改菜单建议');
INSERT INTO `sys_fhlog` VALUES ('fed40c0cad644411876b37c38c0d2519', 'admin', '2018-07-27 18:55:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fed8fa9fb4f6495d825703aedde6a73c', 'admin', '2017-11-07 12:34:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fefe259b2f2640efa85af9d272673323', 'admin', '2017-11-08 19:54:38', '删除菜单ID100');
INSERT INTO `sys_fhlog` VALUES ('ff113636f47c47e48a328bc619cbd013', 'admin', '2017-08-30 16:45:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ff3e706ac93c43a58163fd4872765cca', 'admin', '2017-11-23 16:00:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ff405044e4e741769647baaf7d71c95e', 'admin', '2018-08-10 17:48:19', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ff491c31cfaa4644b89f48cfd960b17a', 'admin', '2018-01-22 10:42:38', '修改菜单数据字典');
INSERT INTO `sys_fhlog` VALUES ('ff4d79e63dfd4c4abce90db6d14f0aaf', 'admin', '2017-08-03 22:39:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ff58c3cfc0be4863bdf13adf6e055152', 'admin', '2017-12-16 11:11:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ff641691f6d446f3a192ef27accb7f14', 'admin', '2018-08-16 17:57:02', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('ff66838253c94d8aacb030526fc025a0', 'admin', '2018-07-28 10:17:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ff9cbd1fdee6494f95a8318ce0b2ea51', 'admin', '2017-11-24 11:02:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ff9eb6dd87d34add8bda3faa41581106', 'admin', '2017-10-30 11:01:54', '修改菜单品牌管理');
INSERT INTO `sys_fhlog` VALUES ('ffc69c789c834b81b101d3e7f431ff24', 'admin', '2017-02-13 01:06:44', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('ffcdbd18dd0c4befa4d3d3025e1cb9b0', 'admin', '2018-08-01 14:22:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ffeecdbd216b461da22422ac907b6e36', 'admin', '2017-12-29 11:28:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fff17bea3f724300af557260fb7f3ea9', 'admin', '2018-08-17 09:38:39', '退出');
INSERT INTO `sys_fhlog` VALUES ('fff25e7630e844ac934a582628bf4487', 'admin', '2018-07-13 16:42:32', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('fff56766f1f64a24a52b7b08b96685bd', 'admin', '2017-11-04 09:29:38', '修改角色:清洗师');

-- ----------------------------
-- Table structure for sys_fhsms
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhsms`;
CREATE TABLE `sys_fhsms`  (
  `FHSMS_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CONTENT` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `TYPE` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `TO_USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收信人',
  `FROM_USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发信人',
  `SEND_TIME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发信时间',
  `STATUS` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `SANME_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`FHSMS_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_fhsms
-- ----------------------------
INSERT INTO `sys_fhsms` VALUES ('05879f5868824f35932ee9f2062adc03', '你好', '2', 'admin', 'san', '2016-01-25 14:05:31', '1', 'b311e893228f42d5a05dbe16917fd16f');
INSERT INTO `sys_fhsms` VALUES ('2635dd035c6f4bb5a091abdd784bd899', '你好', '2', 'san', 'admin', '2016-01-25 14:05:02', '1', '1b7637306683460f89174c2b025862b5');
INSERT INTO `sys_fhsms` VALUES ('52378ccd4e2d4fe08994d1652af87c68', '你好', '1', 'admin', 'san', '2016-01-25 16:26:44', '1', '920b20dafdfb4c09b560884eb277c51d');
INSERT INTO `sys_fhsms` VALUES ('77ed13f9c49a4c4bb460c41b8580dd36', 'gggg', '2', 'admin', 'san', '2016-01-24 21:22:43', '2', 'dd9ee339576e48c5b046b94fa1901d00');
INSERT INTO `sys_fhsms` VALUES ('98a6869f942042a1a037d9d9f01cb50f', '你好', '1', 'admin', 'san', '2016-01-25 14:05:02', '1', '1b7637306683460f89174c2b025862b5');
INSERT INTO `sys_fhsms` VALUES ('9e00295529014b6e8a27019cbccb3da1', '柔柔弱弱', '1', 'admin', 'san', '2016-01-24 21:22:57', '1', 'a29603d613ea4e54b5678033c1bf70a6');
INSERT INTO `sys_fhsms` VALUES ('d3aedeb430f640359bff86cd657a8f59', '你好', '1', 'admin', 'san', '2016-01-24 21:22:12', '1', 'f022fbdce3d845aba927edb698beb90b');
INSERT INTO `sys_fhsms` VALUES ('e5376b1bd54b489cb7f2203632bd74ec', '管理员好', '2', 'admin', 'san', '2016-01-25 14:06:13', '2', 'b347b2034faf43c79b54be4627f3bd2b');
INSERT INTO `sys_fhsms` VALUES ('e613ac0fcc454f32895a70b747bf4fb5', '你也好', '2', 'admin', 'san', '2016-01-25 16:27:54', '2', 'ce8dc3b15afb40f28090f8b8e13f078d');
INSERT INTO `sys_fhsms` VALUES ('f25e00cfafe741a3a05e3839b66dc7aa', '你好', '2', 'san', 'admin', '2016-01-25 16:26:44', '1', '920b20dafdfb4c09b560884eb277c51d');

-- ----------------------------
-- Table structure for sys_loginimg
-- ----------------------------
DROP TABLE IF EXISTS `sys_loginimg`;
CREATE TABLE `sys_loginimg`  (
  `LOGINIMG_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `FILEPATH` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `TYPE` int(2) NOT NULL COMMENT '状态',
  `FORDER` int(3) NOT NULL COMMENT '排序',
  PRIMARY KEY (`LOGINIMG_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `MENU_ID` int(11) NOT NULL,
  `MENU_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MENU_URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PARENT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MENU_ORDER` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MENU_ICON` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MENU_TYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MENU_STATE` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', '#', '0', '1', 'menu-icon fa fa-desktop blue', '1', 1);
INSERT INTO `sys_menu` VALUES (2, '权限管理', '#', '1', '1', 'menu-icon fa fa-lock black', '1', 1);
INSERT INTO `sys_menu` VALUES (3, '日志管理', 'fhlog/list.do', '1', '6', 'menu-icon fa fa-book blue', '1', 0);
INSERT INTO `sys_menu` VALUES (4, '文件管理', 'fhfile/list.do', '59', '3', 'menu-icon fa fa-folder-open purple', '1', 1);
INSERT INTO `sys_menu` VALUES (8, '性能监控', 'druid/index.html', '9', '9', 'menu-icon fa fa-tachometer red', '1', 1);
INSERT INTO `sys_menu` VALUES (9, '系统工具', '#', '0', '3', 'menu-icon fa fa-cog black', '2', 0);
INSERT INTO `sys_menu` VALUES (10, '接口测试', 'tool/interfaceTest.do', '9', '2', 'menu-icon fa fa-exchange green', '1', 1);
INSERT INTO `sys_menu` VALUES (11, '发送邮件', 'tool/goSendEmail.do', '9', '3', 'menu-icon fa fa-envelope-o green', '1', 1);
INSERT INTO `sys_menu` VALUES (12, '置二维码', 'tool/goTwoDimensionCode.do', '9', '4', 'menu-icon fa fa-barcode green', '1', 1);
INSERT INTO `sys_menu` VALUES (14, '地图工具', 'tool/map.do', '9', '6', 'menu-icon fa fa-globe black', '1', 1);
INSERT INTO `sys_menu` VALUES (20, '在线管理', 'onlinemanager/list.do', '1', '5', 'menu-icon fa fa-laptop green', '1', 0);
INSERT INTO `sys_menu` VALUES (21, '打印测试', 'tool/printTest.do', '9', '7', 'menu-icon fa fa-hdd-o grey', '1', 1);
INSERT INTO `sys_menu` VALUES (22, '一级菜单', '#', '0', '10', 'menu-icon fa fa-fire orange', '2', 1);
INSERT INTO `sys_menu` VALUES (23, '二级菜单', '#', '22', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (24, '三级菜单', '#', '23', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (30, '四级菜单', '#', '24', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (31, '五级菜单1', '#', '30', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (32, '五级菜单2', '#', '30', '2', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (33, '六级菜单', '#', '31', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (34, '六级菜单2', 'login_default.do', '31', '2', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (35, '四级菜单2', 'login_default.do', '24', '2', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (36, '角色(基础权限)', 'role.do', '2', '1', 'menu-icon fa fa-key orange', '1', 1);
INSERT INTO `sys_menu` VALUES (37, '按钮权限', 'buttonrights/list.do', '2', '2', 'menu-icon fa fa-key green', '1', 1);
INSERT INTO `sys_menu` VALUES (38, '菜单管理', 'menu/listAllMenu.do', '1', '3', 'menu-icon fa fa-folder-open-o brown', '1', 1);
INSERT INTO `sys_menu` VALUES (39, '按钮管理', 'fhbutton/list.do', '1', '2', 'menu-icon fa fa-download orange', '1', 0);
INSERT INTO `sys_menu` VALUES (40, '用户管理', '#', '0', '2', 'menu-icon fa fa-users blue', '2', 1);
INSERT INTO `sys_menu` VALUES (41, '系统用户', 'user/listUsers.do?type=0', '40', '1', 'menu-icon fa fa-users green', '1', 1);
INSERT INTO `sys_menu` VALUES (43, '数据字典', 'dictionaries/listAllDict.do?DICTIONARIES_ID=0', '1', '4', 'menu-icon fa fa-book purple', '1', 0);
INSERT INTO `sys_menu` VALUES (44, '代码生成器', '#', '9', '0', 'menu-icon fa fa-cogs brown', '1', 1);
INSERT INTO `sys_menu` VALUES (45, '七级菜单1', '#', '33', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (46, '七级菜单2', '#', '33', '2', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (47, '八级菜单', 'login_default.do', '45', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (48, '图表报表', ' tool/fusionchartsdemo.do', '9', '5', 'menu-icon fa fa-bar-chart-o black', '1', 1);
INSERT INTO `sys_menu` VALUES (53, '表单构建器', 'tool/goFormbuilder.do', '9', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (54, '数据库管理', '#', '0', '9', 'menu-icon fa fa-hdd-o blue', '2', 0);
INSERT INTO `sys_menu` VALUES (55, '数据库备份', 'brdb/listAllTable.do', '54', '1', 'menu-icon fa fa-cloud-upload blue', '1', 1);
INSERT INTO `sys_menu` VALUES (56, '数据库还原', 'brdb/list.do', '54', '3', 'menu-icon fa fa-cloud-download blue', '1', 1);
INSERT INTO `sys_menu` VALUES (57, '备份定时器', 'timingbackup/list.do', '54', '2', 'menu-icon fa fa-tachometer blue', '1', 1);
INSERT INTO `sys_menu` VALUES (58, 'SQL编辑器', 'sqledit/view.do', '54', '4', 'menu-icon fa fa-pencil-square-o blue', '1', 1);
INSERT INTO `sys_menu` VALUES (59, 'OA办公', '#', '0', '6', 'menu-icon fa fa-laptop pink', '2', 0);
INSERT INTO `sys_menu` VALUES (60, '组织机构', 'department/listAllDepartment.do?DEPARTMENT_ID=0', '59', '1', 'menu-icon fa fa-users green', '1', 1);
INSERT INTO `sys_menu` VALUES (61, '反向生成', 'recreateCode/list.do', '44', '2', 'menu-icon fa fa-cogs blue', '1', 1);
INSERT INTO `sys_menu` VALUES (62, '正向生成', 'createCode/list.do', '44', '1', 'menu-icon fa fa-cogs green', '1', 1);
INSERT INTO `sys_menu` VALUES (64, '员工管理', 'staff/list.do', '59', '2', 'menu-icon fa fa-users blue', '1', 1);
INSERT INTO `sys_menu` VALUES (68, '快递查询', 'tool/queryExpress.do', '9', '8', 'menu-icon fa fa-fighter-jet green', '1', 1);
INSERT INTO `sys_menu` VALUES (82, 'utils', '#', '9', '10', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (83, '富文本编辑', 'tool/uediter.do', '82', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (124, '微信用户', 'hweixinuser/listUsers.do', '40', '3', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (125, '菜品管理', '#', '0', '4', 'menu-icon fa fa-leaf black', '2', 1);
INSERT INTO `sys_menu` VALUES (126, '菜品列表', 'page/fool/list', '125', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (127, '新增菜品', 'page/fool/add', '125', '2', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (128, '店铺管理', '#', '0', '11', 'menu-icon fa fa-leaf black', '2', 1);
INSERT INTO `sys_menu` VALUES (130, '店铺列表', 'page/shop/list', '128', '2', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (131, '进货单', 'page/order/orderList', '128', '4', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (132, '新增店铺', 'page/shop/add', '128', '3', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (134, '建议', '#', '0', '12', 'menu-icon fa fa-leaf black', '2', 1);
INSERT INTO `sys_menu` VALUES (135, '建议列表', 'page/jianyi/list', '134', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (136, '帮助', '#', '0', '13', 'menu-icon fa fa-leaf black', '2', 1);
INSERT INTO `sys_menu` VALUES (156, '帮助列表', 'page/help/list', '136', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (176, '配送列表', 'page/send/list', '128', '5', 'menu-icon fa fa-leaf black', '1', 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `ROLE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ROLE_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RIGHTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PARENT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ADD_QX` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEL_QX` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EDIT_QX` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CHA_QX` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mdeduct` int(11) NULL DEFAULT NULL COMMENT '金额提成',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `role_condition` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '条件',
  `role_money` int(11) NULL DEFAULT NULL COMMENT '成为代理需要金额',
  PRIMARY KEY (`ROLE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '系统管理组', '95781062648133020532569352954077916079885154186690590', '0', '1', '1', '1', '1', NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_role` VALUES ('2', '会员组', '', '0', '0', '0', '0', '1', NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_role` VALUES ('2a49ab085c6242d081f643aae225e950', '合作伙伴', '', '7fc49b6754db4bc088ab71d854134a9d', '0', '0', '0', '0', 0, NULL, NULL, '', NULL);
INSERT INTO `sys_role` VALUES ('3', '经理', '10867934247353857941402696864234229202958', '1', '10867934247353857941402696854407342981120', '10867934247353857941402696864234229202958', '10867934247353857941402696864234229202958', '10867934247353857941402696864234229202958', 3, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role` VALUES ('3264c8e83d0248bb9e3ea6195b4c0216', '客服经理', '15824843367272298637044122675470925834', '1', '', '', '', '5189822738826356205258653305401245696', 4, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role` VALUES ('de9de2f006e145a29d52dfadda295353', '客服', '', '1', '0', '0', '0', '0', 2, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_fhbutton
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_fhbutton`;
CREATE TABLE `sys_role_fhbutton`  (
  `RB_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ROLE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BUTTON_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`RB_ID`) USING BTREE,
  INDEX `角色表外键`(`ROLE_ID`) USING BTREE,
  INDEX `fbutton`(`BUTTON_ID`) USING BTREE,
  CONSTRAINT `fbutton` FOREIGN KEY (`BUTTON_ID`) REFERENCES `sys_fhbutton` (`FHBUTTON_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `frole` FOREIGN KEY (`ROLE_ID`) REFERENCES `sys_role` (`ROLE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_fhbutton
-- ----------------------------
INSERT INTO `sys_role_fhbutton` VALUES ('eeea7f1c01d7416d861a8df953e44e7f', '3264c8e83d0248bb9e3ea6195b4c0216', 'da7fd386de0b49ce809984f5919022b8');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `USER_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RIGHTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ROLE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LAST_LOGIN` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATUS` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SKIN` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EMAIL` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NUMBER` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PHONE` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CARD` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `MOENY` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区分员工还是合作伙伴0-员工，1-合作伙伴,2-合作商家',
  `registdate` datetime(0) NULL DEFAULT NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`USER_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'de41b7fb99201d8334c23c014db35ecd92df81bc', '李伟', '1133671055321055258374707980945218933803269864762743594642571294', '1', '2018-08-27 19:16:41', '0', 'admin', 'default', 'QQ313596790@main.com', '001', '18788888888', '62222222222222', '22', '男', NULL, '0', '2017-11-01 17:32:08', NULL);
INSERT INTO `sys_user` VALUES ('10182dddc9fa4d7a85c58018d19e8bca', NULL, 'f182a22b8a28b2b79b4215d6f6eb46e7c8d7d755', '1', '', '3', '', '0', '1', 'default', NULL, NULL, '18565421235', '1', '0', '女', NULL, '0', '2017-11-07 17:33:08', NULL);
INSERT INTO `sys_user` VALUES ('820636812ff149409091bccfa285ad25', '12121212121', '47144811987b9812e5ac95c6e4debcd5ee3e1716', '1', '', '3', '', '0', '1', 'default', NULL, NULL, '12121212121', '1', '0', '1', NULL, '0', '2018-07-12 12:13:26', '2018-07-12 12:13:26');
INSERT INTO `sys_user` VALUES ('b929155bff1c4894bcde808a0f7a5ce9', '18990673099', 'fb47ab58a7777b5d7a49728096340b086c350801', '陈勇', '', '3', '2018-06-04 12:01:32', '0', '', 'default', NULL, NULL, '18990673099', '', '0', '男', NULL, '0', '2018-02-07 16:41:36', '2018-02-07 16:41:36');

-- ----------------------------
-- Table structure for sys_userphoto
-- ----------------------------
DROP TABLE IF EXISTS `sys_userphoto`;
CREATE TABLE `sys_userphoto`  (
  `USERPHOTO_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `USERNAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `PHOTO0` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原图',
  `PHOTO1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像1',
  `PHOTO2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像2',
  `PHOTO3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像3',
  PRIMARY KEY (`USERPHOTO_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_userphoto
-- ----------------------------
INSERT INTO `sys_userphoto` VALUES ('7ca8fa2a950d4700b0579bbf8f32f2ea', 'admin', '', 'uploadFiles/uploadUserPhoto/jsp_avatar1_20170908153306351wr4zn8mz.jpg', 'uploadFiles/uploadUserPhoto/jsp_avatar2_20170908153306351wr4zn8mz.jpg', 'uploadFiles/uploadUserPhoto/jsp_avatar3_20170908153306351wr4zn8mz.jpg');

-- ----------------------------
-- Table structure for tb_fool_and_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_fool_and_user`;
CREATE TABLE `tb_fool_and_user`  (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `fool_id` bigint(50) NOT NULL COMMENT '菜品id',
  `user_id` varchar(180) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '允许查看的用户id，0 为所有人可见',
  `updated` datetime(0) NULL DEFAULT NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_fool_help
-- ----------------------------
DROP TABLE IF EXISTS `tb_fool_help`;
CREATE TABLE `tb_fool_help`  (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `help_add_user_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '添加店铺的用户id',
  `updated` datetime(0) NULL DEFAULT NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  `help_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `help_msg` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详情',
  `help_status` int(2) UNSIGNED NULL DEFAULT 0 COMMENT '帮助状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_fool_help
-- ----------------------------
INSERT INTO `tb_fool_help` VALUES (2, '1', '2018-08-26 11:38:22', '2018-08-22 18:49:07', '测试', '阿达撒大大说了的看见爱上立法会脑复哈UI粉红色粉红色开放男水电费iOS大家佛ISO覅和山东if哈搜的', 1);

-- ----------------------------
-- Table structure for tb_fool_jianyi
-- ----------------------------
DROP TABLE IF EXISTS `tb_fool_jianyi`;
CREATE TABLE `tb_fool_jianyi`  (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `prop_add_user_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '添加店铺的用户id',
  `updated` datetime(0) NULL DEFAULT NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  `prop_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `prop_msg` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详情',
  `prop_is_check` int(2) NOT NULL DEFAULT 0 COMMENT '是否审核，0：未审核，1.审核, 审核通过后可以给与奖励',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_fool_jianyi
-- ----------------------------
INSERT INTO `tb_fool_jianyi` VALUES (1, '1', '2018-08-26 10:54:44', '2018-08-23 12:04:07', '菜品建议', '真的很棒棒', 0);
INSERT INTO `tb_fool_jianyi` VALUES (2, '1', '2018-08-26 10:54:41', '2018-08-23 14:23:22', '阿大声道', '撒的撒的撒的撒多撒多撒多撒所大奥所多', 1);

-- ----------------------------
-- Table structure for tb_fool_library_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_fool_library_menu`;
CREATE TABLE `tb_fool_library_menu`  (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `fool_title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜品标题',
  `fool_img_title` varchar(180) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '菜品小图',
  `fool_make_time` int(5) NOT NULL DEFAULT 0 COMMENT '制作时间',
  `fool_price` int(10) NOT NULL DEFAULT 0 COMMENT '菜品价格',
  `fool_is_shop` int(2) NOT NULL DEFAULT 0 COMMENT '菜品是否有用户，1.公共大家都可以看，2.私有菜品',
  `updated` datetime(0) NULL DEFAULT NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  `fool_add_user_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜品上传的用户id',
  `fool_shop_id` bigint(50) NULL DEFAULT NULL COMMENT '菜品店铺id',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `fool_msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜品备注',
  `fool_type` int(10) NOT NULL DEFAULT 0 COMMENT '菜品类型，如凉菜，热菜，炖菜......',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 82 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_fool_library_menu
-- ----------------------------
INSERT INTO `tb_fool_library_menu` VALUES (59, '娃儿发广告', '', 3, 4, 1, '2018-08-13 15:52:22', '2018-08-10 10:06:12', '1', 0, NULL, '测试菜品备', 0);
INSERT INTO `tb_fool_library_menu` VALUES (60, '爱的方式更好房间人数', '', 3, 3, 1, '2018-08-10 10:06:20', '2018-08-10 10:06:20', '1', NULL, NULL, NULL, 0);
INSERT INTO `tb_fool_library_menu` VALUES (61, '艾弗森的感受', '', 2, 2, 1, '2018-08-10 10:06:28', '2018-08-10 10:06:28', '1', NULL, NULL, NULL, 0);
INSERT INTO `tb_fool_library_menu` VALUES (62, '地方的撒旦', '', 4, 3, 2, '2018-08-10 10:06:36', '2018-08-10 10:06:36', '1', 2, NULL, NULL, 0);
INSERT INTO `tb_fool_library_menu` VALUES (63, 'hjk', '', 1, 1, 1, '2018-08-10 10:18:38', '2018-08-10 10:18:38', '1', NULL, NULL, NULL, 0);
INSERT INTO `tb_fool_library_menu` VALUES (64, 'efgh', '', 1, 1, 1, '2018-08-10 10:18:46', '2018-08-10 10:18:46', '1', NULL, NULL, NULL, 0);
INSERT INTO `tb_fool_library_menu` VALUES (65, 'esrdtfg', '', 1, 1, 1, '2018-08-10 10:18:51', '2018-08-10 10:18:51', '1', NULL, NULL, NULL, 0);
INSERT INTO `tb_fool_library_menu` VALUES (66, '顶顶顶顶阿道夫', '', 2, 1, 1, '2018-08-10 11:59:45', '2018-08-10 11:59:45', '1', NULL, NULL, NULL, 0);
INSERT INTO `tb_fool_library_menu` VALUES (67, '顶顶顶顶大萨达爱的色放', '', 4, 4, 1, '2018-08-10 12:15:38', '2018-08-10 12:15:38', '1', NULL, NULL, NULL, 0);
INSERT INTO `tb_fool_library_menu` VALUES (68, '测试', '', 3, 4, 1, '2018-08-10 13:33:02', '2018-08-10 13:33:02', '1', NULL, NULL, NULL, 0);
INSERT INTO `tb_fool_library_menu` VALUES (69, '擦擦擦', '', 3, 4, 1, '2018-08-10 13:33:49', '2018-08-10 13:33:49', '1', NULL, NULL, NULL, 0);
INSERT INTO `tb_fool_library_menu` VALUES (71, '吊袜带', 'uploadFiles/uploadUserPhoto/jsp_avatar2_2018081013525552669m8kiyq.jpg', 2, 4, 2, '2018-08-10 13:52:58', '2018-08-10 13:52:58', '1', 2, NULL, NULL, 0);
INSERT INTO `tb_fool_library_menu` VALUES (72, '顶顶顶顶大声道撒', 'uploadFiles/uploadUserPhoto/jsp_avatar2_20180810193404516droft11u.jpg', 3, 4, 2, '2018-08-10 19:34:08', '2018-08-10 19:34:08', '1', 2, '李伟', NULL, 0);
INSERT INTO `tb_fool_library_menu` VALUES (73, '大大得得得', 'uploadFiles/uploadUserPhoto/jsp_avatar2_20180811115457658zoqs7iun.jpg', 1, 1, 2, '2018-08-13 15:05:31', '2018-08-11 11:55:02', '1', 2, '李伟', '测试菜品备注', 0);
INSERT INTO `tb_fool_library_menu` VALUES (74, '顶顶顶顶得得得', 'uploadFiles/uploadUserPhoto/jsp_avatar2_20180814091641183mrr1o3yd.jpg', 3, 4, 2, '2018-08-14 09:19:18', '2018-08-14 09:19:18', '1', 1, '李伟', '测试', 0);
INSERT INTO `tb_fool_library_menu` VALUES (75, '娃儿发广告得得得', 'uploadFiles/uploadUserPhoto/jsp_avatar2_20180814092107484hcxybfhl.jpg', 1, 4, 1, '2018-08-14 09:21:11', '2018-08-14 09:21:11', '1', NULL, '李伟', '测试', 0);
INSERT INTO `tb_fool_library_menu` VALUES (76, '娃儿发广告订单', 'uploadFiles/uploadUserPhoto/jsp_avatar2_20180814101533957oy1rh2k8.jpg', 4, 4, 1, '2018-08-14 10:15:38', '2018-08-14 10:15:38', '1', NULL, '李伟', '测试', 0);
INSERT INTO `tb_fool_library_menu` VALUES (77, '娃儿发广告订单萨达', 'uploadFiles/uploadUserPhoto/jsp_avatar2_20180814102343255hllfusqz.jpg', 4, 1, 2, '2018-08-14 10:23:52', '2018-08-14 10:23:52', '1', 3, '李伟', '测试', 0);
INSERT INTO `tb_fool_library_menu` VALUES (79, '娃儿发广告大萨达', 'uploadFiles/uploadUserPhoto/jsp_avatar2_20180814183439627jasd12i8.jpg', 4, 4, 2, '2018-08-14 18:34:58', '2018-08-14 18:34:58', '1', 3, '李伟', '测试', 0);
INSERT INTO `tb_fool_library_menu` VALUES (80, '娃儿发广告得得得达瓦大', 'uploadFiles/uploadUserPhoto/jsp_avatar2_201808141840111119zke0ott.jpg', 3, 211, 2, '2018-08-14 18:40:31', '2018-08-14 18:40:31', '1', 2, '李伟', '从挖的撒', 0);
INSERT INTO `tb_fool_library_menu` VALUES (81, '顶顶顶顶大萨达', 'uploadFiles/uploadUserPhoto/jsp_avatar2_201808141840111119zke0ott.jpg', 3, 1, 2, '2018-08-14 18:43:23', '2018-08-14 18:43:23', '1', 2, '李伟', '测试菜品备注顶顶顶顶', 0);

-- ----------------------------
-- Table structure for tb_fool_library_prepare
-- ----------------------------
DROP TABLE IF EXISTS `tb_fool_library_prepare`;
CREATE TABLE `tb_fool_library_prepare`  (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `fool_id` bigint(50) NOT NULL COMMENT '菜品id',
  `prep_add_user_id` varchar(180) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '添加人id',
  `updated` datetime(0) NULL DEFAULT NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  `prep_time` datetime(0) NOT NULL COMMENT '准备的时间，可以明天，后天等（准备的菜品使用时间）',
  `prep_num` int(10) NOT NULL DEFAULT 0 COMMENT '准备份数',
  `prep_msg` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '准备的说明',
  `status` int(2) NOT NULL DEFAULT 0 COMMENT '状态 0 未配送 1已配送',
  `fool_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shop_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `prep_add_user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shop_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_fool_library_prepare
-- ----------------------------
INSERT INTO `tb_fool_library_prepare` VALUES (1, 81, '1', '2018-08-26 11:37:29', '2018-08-24 18:39:38', '2018-08-26 18:39:47', 12, '阿尔斯通人的一天发一个', 1, '顶顶顶顶大萨达', '店铺测试', '李伟', 2);

-- ----------------------------
-- Table structure for tb_fool_library_prepare_create
-- ----------------------------
DROP TABLE IF EXISTS `tb_fool_library_prepare_create`;
CREATE TABLE `tb_fool_library_prepare_create`  (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `fool_id` bigint(50) NOT NULL COMMENT '菜品id',
  `updated` datetime(0) NULL DEFAULT NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  `create_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成的菜品配料名称',
  `create_weight` int(10) NOT NULL DEFAULT 0 COMMENT '生成的菜品配料重量',
  `create_type` int(2) NULL DEFAULT NULL COMMENT '生成的配料属于：0：其它，1.水产，2.蔬菜，3.海鲜，4.干杂',
  `create_shop_id` bigint(50) NULL DEFAULT NULL COMMENT '属于哪个饭店生成的',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_fool_library_seasoning
-- ----------------------------
DROP TABLE IF EXISTS `tb_fool_library_seasoning`;
CREATE TABLE `tb_fool_library_seasoning`  (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `fool_id` bigint(50) NOT NULL COMMENT '菜品id',
  `seas_add_user_id` varchar(180) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '添加人id',
  `updated` datetime(0) NULL DEFAULT NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  `seas_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主料名称',
  `seas_weiget_kg` int(10) NOT NULL DEFAULT 0 COMMENT '重量 kg',
  `seas_weiget_catty` int(10) NOT NULL DEFAULT 0 COMMENT '主料重量：斤',
  `seas_msg` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '主料备注：例如莲藕需要脆藕',
  `seas_give_shop_user_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '主料配送商家的用户id号',
  `seas_select` int(2) NULL DEFAULT 0 COMMENT '配料表：0：主料，1.配料，2.调料，3.其它搭配的',
  `seas_give_shop_user_phone` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `fool_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_fool_library_seasoning
-- ----------------------------
INSERT INTO `tb_fool_library_seasoning` VALUES (24, 66, '3', '2018-08-10 11:59:45', '2018-08-10 11:59:45', '测试', 4, 8, '', '0', 0, NULL, '');
INSERT INTO `tb_fool_library_seasoning` VALUES (25, 66, '3', '2018-08-10 11:59:45', '2018-08-10 11:59:45', '萨达萨达撒多', 1, 2, '吊袜带', '0', 1, NULL, '');
INSERT INTO `tb_fool_library_seasoning` VALUES (26, 69, '3', '2018-08-10 13:33:49', '2018-08-10 13:33:49', '大所得到的', 3, 6, '', '0', 0, NULL, '');
INSERT INTO `tb_fool_library_seasoning` VALUES (27, 70, '3', '2018-08-10 13:47:59', '2018-08-10 13:47:59', '大所得到的', 2, 4, '', '0', 0, NULL, '');
INSERT INTO `tb_fool_library_seasoning` VALUES (28, 71, '3', '2018-08-10 13:52:59', '2018-08-10 13:52:59', '的', 2, 4, '', '0', 0, NULL, '');
INSERT INTO `tb_fool_library_seasoning` VALUES (29, 72, '3', '2018-08-10 19:34:08', '2018-08-10 19:34:08', '啛啛喳喳', 4, 8, '顶顶顶顶', '0', 0, NULL, '顶顶顶顶大声道撒');
INSERT INTO `tb_fool_library_seasoning` VALUES (31, 53, '1', '2018-08-13 13:43:57', '2018-08-13 13:43:57', '擦擦擦', 5, 10, '顶顶顶顶', '0', 0, NULL, '瓦大大');
INSERT INTO `tb_fool_library_seasoning` VALUES (32, 54, '1', '2018-08-13 13:46:10', '2018-08-13 13:46:10', '擦擦擦', 5, 10, '顶顶顶顶', '0', 0, NULL, '达瓦大大');
INSERT INTO `tb_fool_library_seasoning` VALUES (35, 50, '1', '2018-08-13 15:58:02', '2018-08-13 15:58:02', '擦擦擦', 4, 8, '顶顶顶顶', '0', 0, NULL, '顶顶顶顶');
INSERT INTO `tb_fool_library_seasoning` VALUES (36, 74, '3', '2018-08-14 09:19:18', '2018-08-14 09:19:18', '测试', 3, 6, '顶顶顶顶', '0', 0, NULL, '顶顶顶顶得得得');
INSERT INTO `tb_fool_library_seasoning` VALUES (37, 75, '3', '2018-08-14 09:21:11', '2018-08-14 09:21:11', '测试', 3, 6, '顶顶顶顶', '0', 0, NULL, '娃儿发广告得得得');
INSERT INTO `tb_fool_library_seasoning` VALUES (39, 76, '3', '2018-08-14 10:15:38', '2018-08-14 10:15:38', '擦擦擦', 4, 8, '顶顶顶顶', '0', 0, NULL, '娃儿发广告订单');
INSERT INTO `tb_fool_library_seasoning` VALUES (40, 77, '3', '2018-08-14 10:23:52', '2018-08-14 10:23:52', '订单', 3, 6, '顶顶顶顶', '0', 0, NULL, '娃儿发广告订单萨达');
INSERT INTO `tb_fool_library_seasoning` VALUES (41, 77, '3', '2018-08-14 10:23:52', '2018-08-14 10:23:52', '大所得到的', 3, 6, '顶顶顶顶', '0', 0, NULL, '娃儿发广告订单萨达');
INSERT INTO `tb_fool_library_seasoning` VALUES (42, 78, '3', '2018-08-14 11:19:13', '2018-08-14 11:19:13', '擦擦擦', 3, 6, '顶顶顶顶', '0', 0, NULL, '打算');
INSERT INTO `tb_fool_library_seasoning` VALUES (43, 78, '3', '2018-08-14 11:19:13', '2018-08-14 11:19:13', '擦擦擦得得得', 3, 6, '顶顶顶顶', '0', 0, NULL, '打算');
INSERT INTO `tb_fool_library_seasoning` VALUES (44, 79, '3', '2018-08-14 18:34:59', '2018-08-14 18:34:59', '擦擦擦', 3, 6, '顶顶顶顶', '0', 0, NULL, '娃儿发广告大萨达');
INSERT INTO `tb_fool_library_seasoning` VALUES (45, 79, '3', '2018-08-14 18:34:59', '2018-08-14 18:34:59', '擦擦擦订单', 4, 8, '顶顶顶顶', '0', 0, NULL, '娃儿发广告大萨达');
INSERT INTO `tb_fool_library_seasoning` VALUES (46, 80, '3', '2018-08-14 18:40:31', '2018-08-14 18:40:31', '萨达', 2, 4, '顶顶顶顶', '0', 0, NULL, '娃儿发广告得得得达瓦大');
INSERT INTO `tb_fool_library_seasoning` VALUES (48, 81, '3', '2018-08-14 18:43:23', '2018-08-14 18:43:23', '大所得到的', 3, 6, '顶顶顶顶', '0', 0, NULL, '顶顶顶顶大萨达');
INSERT INTO `tb_fool_library_seasoning` VALUES (49, 62, '1', '2018-08-15 09:33:25', '2018-08-15 09:33:25', '测试', 2, 4, '顶顶顶顶', '0', 0, NULL, '地方的撒旦');
INSERT INTO `tb_fool_library_seasoning` VALUES (50, 61, '1', '2018-08-25 11:21:59', '2018-08-25 11:21:59', '测试', 12, 24, '啊发生过的护肤法萨芬', '0', 0, NULL, '艾弗森的感受');
INSERT INTO `tb_fool_library_seasoning` VALUES (51, 60, '1', '2018-08-25 11:32:00', '2018-08-25 11:32:00', '重新写', 1, 2, '爱上规范地方', '0', 0, NULL, '爱的方式更好房间人数');
INSERT INTO `tb_fool_library_seasoning` VALUES (52, 64, '1', '2018-08-25 11:32:20', '2018-08-25 11:32:20', '萨达', 12, 24, '发给谁发个', '0', 0, NULL, 'efgh');

-- ----------------------------
-- Table structure for tb_fool_log_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_fool_log_user`;
CREATE TABLE `tb_fool_log_user`  (
  `id` bigint(100) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `updated` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `log_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件',
  `created` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_fool_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_fool_menu`;
CREATE TABLE `tb_fool_menu`  (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `fool_title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜品标题',
  `fool_img_title` varchar(180) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '菜品小图',
  `fool_make_time` int(5) NOT NULL DEFAULT 0 COMMENT '制作时间',
  `fool_price` int(10) NOT NULL DEFAULT 0 COMMENT '菜品价格',
  `fool_is_shop` int(2) NOT NULL DEFAULT 1 COMMENT '菜品是否有用户，1.公共大家都可以看，2.私有菜品',
  `updated` datetime(0) NULL DEFAULT NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  `fool_add_user_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fool_shop_id` bigint(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_fool_prepare
-- ----------------------------
DROP TABLE IF EXISTS `tb_fool_prepare`;
CREATE TABLE `tb_fool_prepare`  (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `fool_id` bigint(50) NOT NULL COMMENT '菜品id',
  `prep_add_user_id` varchar(180) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '添加人id',
  `updated` datetime(0) NULL DEFAULT NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  `prep_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '准备的时间，可以明天，后天等（准备的菜品使用时间）',
  `prep_num` int(10) NOT NULL DEFAULT 0 COMMENT '准备份数',
  `prep_msg` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '准备的说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_fool_prepare_create
-- ----------------------------
DROP TABLE IF EXISTS `tb_fool_prepare_create`;
CREATE TABLE `tb_fool_prepare_create`  (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `fool_id` bigint(50) NOT NULL COMMENT '菜品id',
  `updatad` datetime(0) NULL DEFAULT NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  `create_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成的菜品配料名称',
  `create_weight` int(10) NOT NULL DEFAULT 0 COMMENT '生成的菜品配料重量',
  `create_type` int(2) NULL DEFAULT NULL COMMENT '生成的配料属于：0：其它，1.水产，2.蔬菜，3.海鲜，4.干杂',
  `create_shop_id` bigint(50) NULL DEFAULT NULL COMMENT '属于哪个饭店生成的',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_fool_seasoning
-- ----------------------------
DROP TABLE IF EXISTS `tb_fool_seasoning`;
CREATE TABLE `tb_fool_seasoning`  (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `fool_id` bigint(50) NOT NULL COMMENT '菜品id',
  `seas_add_user_id` varchar(180) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '添加人id',
  `updatad` datetime(0) NULL DEFAULT NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  `seas_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主料名称',
  `seas_weiget_kg` int(10) NOT NULL DEFAULT 0 COMMENT '重量 kg',
  `seas_weiget_catty` int(10) NOT NULL DEFAULT 0 COMMENT '主料重量：斤',
  `seas_msg` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '主料备注：例如莲藕需要脆藕',
  `seas_give_shop_user_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '主料配送商家的用户id号',
  `seas_select` int(2) NULL DEFAULT 0 COMMENT '配料表：0：主料，1.配料，2.调料，3.其它搭配的',
  `seas_give_shop_user_phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_fool_shop
-- ----------------------------
DROP TABLE IF EXISTS `tb_fool_shop`;
CREATE TABLE `tb_fool_shop`  (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `shop_add_user_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '添加店铺的用户id',
  `updated` datetime(0) NULL DEFAULT NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  `shop_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名称',
  `shop_msg` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '店铺详情介绍',
  `shop_type` int(2) NOT NULL DEFAULT 0 COMMENT '0:饭店，1. 蔬菜配送，2.调料干杂，3. 水产，4.海鲜，5.其它',
  `shop_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺地址',
  `shop_boss_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺老板',
  `shop_phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺电话',
  `song_shuichan_shop_id` bigint(50) NULL DEFAULT 0 COMMENT '饭店绑定的水产店id，默认为0，没有',
  `song_shucai_shop_id` bigint(50) NULL DEFAULT 0 COMMENT '饭店绑定的蔬菜店id，默认为0，没有',
  `song_ganza_shop_id` bigint(50) NULL DEFAULT 0 COMMENT '饭店绑定的干杂店id，默认为0，没有',
  `song_haixian_shop_id` bigint(50) NULL DEFAULT 0 COMMENT '饭店绑定的海鲜店id，默认为0，没有',
  `song_qita_shop_id` bigint(50) NULL DEFAULT 0 COMMENT '饭店绑定的其它店id，默认为0，没有',
  `song_shop_id_list` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '配送店绑定的店铺id，格式：3，4,5,6，7  逗号分隔',
  `shop_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺执照',
  `shop_status` int(1) NOT NULL DEFAULT 0 COMMENT '店铺状态 0未审核 1已审核',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_fool_shop
-- ----------------------------
INSERT INTO `tb_fool_shop` VALUES (2, '0', '2018-08-23 18:42:13', '2018-07-31 17:59:05', '店铺测试', '店铺测试', 2, '2', '2', '2', 0, 0, 0, NULL, NULL, '12', NULL, 0);
INSERT INTO `tb_fool_shop` VALUES (3, '0', '2018-08-26 10:54:57', '2018-08-14 09:41:35', '测试', '测试的萨达的', 1, '12', '21', '11111111', 0, 0, 0, NULL, NULL, '', NULL, 0);
INSERT INTO `tb_fool_shop` VALUES (5, '1', '2018-08-23 16:02:08', '2018-08-15 14:59:48', '测试3', '爱是梵蒂冈', 3, '安师大撒多', '的撒大大撒', '13265343333', 0, 0, 0, 0, 0, '', NULL, 0);
INSERT INTO `tb_fool_shop` VALUES (6, '1', '2018-08-23 16:02:10', '2018-08-16 17:45:27', '测试', '测试', 1, '测试', '李志远', '12345678900', 0, 0, 0, 0, 0, '', 'uploadFiles/uploadUserPhoto/jsp_avatar2_2018081617452533526ekxykh.jpg', 0);
INSERT INTO `tb_fool_shop` VALUES (7, '1', '2018-08-25 10:22:07', '2018-08-17 14:02:04', '测试', '的撒大大', 1, '测试', '从挖的撒', '12132312132', 0, 0, 0, 0, 0, '11', 'uploadFiles/uploadUserPhoto/jsp_avatar2_201808171401334649xyco4mr.jpg', 1);
INSERT INTO `tb_fool_shop` VALUES (8, '1', '2018-08-23 15:43:00', '2018-08-17 14:02:20', '大萨达', '撒大大大', 2, '撒大大', '大大大', '12312312312', 0, 0, 0, 0, 0, '', 'uploadFiles/uploadUserPhoto/jsp_avatar2_201808171401334649xyco4mr.jpg', 1);
INSERT INTO `tb_fool_shop` VALUES (9, '1', '2018-08-23 15:44:21', '2018-08-17 14:02:39', '打到我大大无大', '31321312132', 4, '13213', '12313', '21321321', 0, 0, 0, 0, 0, '', 'uploadFiles/uploadUserPhoto/jsp_avatar2_201808171401334649xyco4mr.jpg', 1);
INSERT INTO `tb_fool_shop` VALUES (10, '1', '2018-08-24 11:40:37', '2018-08-17 14:03:04', '的瓦大大玩的', '撒的撒的撒的撒多', 3, '瓦大大玩的', '萨达大萨达', '132132132132', 0, 0, 0, 0, 0, '', 'uploadFiles/uploadUserPhoto/jsp_avatar2_201808171401334649xyco4mr.jpg', 0);
INSERT INTO `tb_fool_shop` VALUES (11, '1', '2018-08-25 10:22:07', '2018-08-17 14:04:11', '的撒大大', '大萨达', 6, '大萨达', '的萨达萨达所', '12312312312', 0, 0, 0, 0, 0, '7', 'uploadFiles/uploadUserPhoto/jsp_avatar2_201808171401334649xyco4mr.jpg', 1);
INSERT INTO `tb_fool_shop` VALUES (12, '1', '2018-08-23 18:42:10', '2018-08-18 17:52:40', '瓦大大', '撒旦法规和健康环境和规范的撒是', 1, '瓦大大', '撒大大', '1414141414', 0, 0, 0, 0, 0, '2', 'uploadFiles/uploadUserPhoto/jsp_avatar2_201808181752331302f4t1qzo.jpg', 0);
INSERT INTO `tb_fool_shop` VALUES (13, '1', '2018-08-24 16:01:55', '2018-08-24 16:01:55', '的第三代', '达瓦大大大大大达瓦达瓦达瓦多', 1, '大萨达', '大萨达', '1412121212121212', 0, 0, 0, 0, 0, '0', 'uploadFiles/uploadUserPhoto/jsp_avatar2_201808241601497803uzssbog.jpg', 0);

-- ----------------------------
-- Table structure for tb_fool_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_fool_type`;
CREATE TABLE `tb_fool_type`  (
  `id` int(255) NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜品类型',
  `status` int(255) NOT NULL COMMENT '状态',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_fool_type
-- ----------------------------
INSERT INTO `tb_fool_type` VALUES (1, '炒菜', 0, NULL, NULL);
INSERT INTO `tb_fool_type` VALUES (2, '凉菜', 0, NULL, NULL);
INSERT INTO `tb_fool_type` VALUES (3, '炖菜', 0, NULL, NULL);

-- ----------------------------
-- Table structure for tb_weixin_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_weixin_user`;
CREATE TABLE `tb_weixin_user`  (
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `open_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'openId',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  `head_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像路径',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `sex` int(11) NULL DEFAULT NULL COMMENT '性别：1-男，2-女',
  `is_check` int(11) NULL DEFAULT 1 COMMENT '审核1-通过，0-不通过',
  `birth` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生日',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `invite` int(11) NULL DEFAULT NULL COMMENT '邀请的人数',
  `invite_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邀请人id',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_weixin_user
-- ----------------------------
INSERT INTO `tb_weixin_user` VALUES ('006d379f16834d01a00d42a39022516b', 'oAvgj0T5nN-jM96UI-De0JPgAZxM', NULL, '2018-04-23 06:39:23', '2018-04-23 06:39:23', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('00ac53676ce84e47ab3a53dfe8260031', 'oAvgj0cWE4-pXZkcDKiLYQTA-nhk', 'A藏珠阁高级珠宝私人订制', '2018-04-05 18:46:25', '2018-04-05 18:46:28', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq1JiaI32hEusib7XpSibO1DZicnDEfznc9wYbSOBpk9khCjMgWPxcwxIGqaRnLpjdEHDdibPKIVV4YT8A/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('00d08b1205c04d07a02b7445781878cf', 'oAvgj0Q5VAdaIuCiuoouMgpvdxmc', NULL, '2018-05-31 20:29:27', '2018-05-31 20:29:27', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('00e6839daeec4f50abfd2dc48176bccf', 'oAvgj0YGpqIuWq7iHXNe-dUkG8Ow', 'rdgztest_BCMIUS', '2018-04-07 09:12:25', '2018-04-07 09:15:55', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('019f3d6b62384021b3bae0e6c3775225', 'oAvgj0Ub1XH62ui-T-D5JU9vmayU', NULL, '2018-05-09 18:57:12', '2018-05-09 18:57:12', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('01b9f5a2e74741068932475e6928d816', 'oAvgj0ZAEQWx3d9P6-bv_aNEFTB4', NULL, '2018-04-04 09:41:29', '2018-04-04 09:41:29', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('01bf4eb601da4184b97a2a492fca3dcf', 'oAvgj0QE8e_a-Wesv3VbH7rsWEFI', '皓', '2018-04-23 00:42:18', '2018-04-23 08:51:20', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKlzHD7jU2Iqic2YE6r9W2GtFibiaJadlibsBOwvHjDUxlyLVqeHJIYv7iaiboLl42dbfzRhQbo0QqPicJgg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('01c4e8c101db4e03865b436f353a4ffd', 'oAvgj0Xp-dfX-kNpARPQf6IsA4uM', '涂鸦路上', '2018-04-16 11:42:24', '2018-04-17 16:46:25', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epVIYEfibfiboxcQBT0Z32k7rAOjcl4oX7rfDJNWJ2nrlAqpTycsia1kHnjFiby8cUlgMYsCfWUlNofdA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('0219c8d0b0024f59921ec65b10e6815b', 'oAvgj0bnKNjEZJPI30NZpljV-tOE', '小小梅', '2018-04-14 13:23:49', '2018-04-14 14:02:13', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJjGypw65XYqUy7NyickS6XfUA2DicfK9OyUq8Drgtpba79g8DyV4Z4uwlQbZFugib2ztmibUBSWhwqgA/0', '17713416292', 2, 1, '1992-10-28', '吴小梅', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('021c1f7806b542fa900bfa51249ad4e5', 'oAvgj0bSdbFsnCsVTO9OTQb80SJ4', '「有赞」谢宇', '2018-04-03 11:30:01', '2018-04-03 11:32:40', 'https://wx.qlogo.cn/mmopen/vi_32/eHDDJv28eCDtZkSbMWysusEib8VzN4K6unLLQCdXYdOaR9RUH6MSJ7nmMoo7j03C5f0wbe40ktQgABvMt6qcdNQ/0', '18090191168', 1, 1, '1993-03-19', '谢宇', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('02c6c12a8d3e43f49ad0f3323b074b10', 'oAvgj0Z8O0ukpaTEioN-fDCr32vQ', 'app开发', '2018-02-28 16:37:45', '2018-02-28 16:39:54', 'https://wx.qlogo.cn/mmopen/vi_32/1v3W8CLehLxOmMic0vDkWyIDjZwD9sZ4rI2vG0SoEr3CicPnUtCMbNcaIk9woRL8bg7SvAs9rOs44E7lsWpWjyOQ/0', '17311342479', 1, 1, '2017-09-01', '哈哈哈', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('03394e3c21594a5cab4becfa79164262', 'oAvgj0eT8Ph5ovgNa3AX-Qr6C7lI', '路人', '2018-03-27 16:40:12', '2018-03-27 16:41:05', 'https://wx.qlogo.cn/mmopen/vi_32/ia9w3tFtngQKMcOhMqStzj136bVBdUaTB1VOfxpf76ficibWLiak4l4zguwZ6kyIguqiabebMhhv67vyuJshdzIhRKw/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('0497137793c047bc8f82874cb4c5c6a5', 'oAvgj0bqvzrS5K1_UtpCfZGYyT_c', NULL, '2018-03-17 14:53:21', '2018-03-17 14:53:21', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('04c996e665894b82bb5c4a7f7e07ed6e', 'oAvgj0ft_KqzWt28Bzn6i-Jc-pbw', 'A~美的*贺展展', '2018-04-23 14:12:45', '2018-04-23 14:12:46', 'https://wx.qlogo.cn/mmopen/vi_32/YIOcayx4iaOL8dZfsooh7koPw5ASj5szvJYS8sgkIbcegRUiala2OI6ziaKp2Q2040n4icbyeTG5O87wxoNoMrJFuQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('0570dccab24f48d6996181abc78d88ec', 'oAvgj0bAfK4Zbp-5oSt53q8xRReQ', '红遇天横', '2018-04-30 14:31:55', '2018-04-30 15:57:12', 'https://wx.qlogo.cn/mmopen/vi_32/72M4Btn4p1Mka2lsE8TwrQnZphDY3uO8LiaYuOicZYOf9l4aL0fx1LtvEgojCr4tIwRMwjJk7pMicn3w6NJwI6DKA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('059509f0659643d3bb0d449f4e276768', 'oAvgj0aheDZkd_8dGdsiGkVKJnXc', 'Poppy', '2018-04-14 13:23:53', '2018-04-14 13:32:55', 'https://wx.qlogo.cn/mmopen/vi_32/qIUFUHPUSxkXJSh9djhJN5KiasUBWtiauoYiamFnjxHj0fyXnqRh2fEqAyp7Ae8ygLXr2j9nuicVymo1vxtumUXKiag/0', '18180949537', 2, 1, '1997-10-11', '刘明秋', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('05b2fef6dd8f40a9883e1ffe36fcefca', 'oAvgj0X9ihWb5ktLja9EgH-g7d4Y', '韩冰洋 中医康养', '2018-05-29 10:51:22', '2018-05-29 10:51:49', 'https://wx.qlogo.cn/mmopen/vi_32/7SDnQMVicBNqv4jo2outibbUibUhUBY77uicCXYuHwGa883YpraLpD3cCnZfiboQqp7iaOsG7lF0lMtMR09soPVKPN2w/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('0613bb50a8d94fc28e32c1210ae81257', 'oAvgj0Yzxdv_SZr5J09XFKVdLobM', '吴法金', '2018-04-10 21:29:59', '2018-04-12 19:03:38', 'https://wx.qlogo.cn/mmopen/vi_32/CvVKibVAkSmrDKuazlPY3UiazrTTa33OB8jGC3xOZIBD3G6XsZhjwQMXJT6bwlcRCp0vgUuKkf0JZ4Q93ibdbTOKg/0', '18086842028', 1, 1, '1987-09-01', '吴艳军', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('0613d6efa17b480ab65e2dad7d0b57e6', 'oAvgj0Z821ANpoB-jLwQp4Z9Bgwo', NULL, '2018-06-01 17:31:47', '2018-06-01 17:31:48', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('063b1b2ae9d94642957668b14a1adb75', 'oAvgj0aTqidxqZiq439UcgSFlQkU', '萍萍 18781493130  0833-6171371', '2018-03-07 09:45:08', '2018-03-31 13:32:05', 'https://wx.qlogo.cn/mmopen/vi_32/PWSGRwGjXCkibzy9tbI4JSHOLIKKPDIrIVxfFduj1MlU6GhrfHCibcv7Ua7GUYW835qvjgjia4W4HicfBakZAIhfnw/0', '18781493130', 2, 1, '1995-09-30', '萍萍', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('06cfad31695c499499114a5774ee1a4c', 'oAvgj0ZJNI7kQ-T5ykrtfoV7tsYQ', '恩泰家具', '2018-03-17 16:56:03', '2018-03-17 16:58:07', 'https://wx.qlogo.cn/mmopen/vi_32/aeLuIDof1yk5Q1bIwDCtQQlNAUkj8RlfuBN5KCicGmzAgg50PTFh6WFLYHGEWia1fXlXoAcWQsTOpvMsOsNl7GYQ/0', '18908219171', 1, 1, '2014-06-01', '吕安安', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('06e99f1c0f6c4dd9b642d95ac47eb2aa', 'oAvgj0YwdtdkPje_Koc4hRVDafSk', 'A淡定', '2018-04-23 02:06:55', '2018-04-23 07:06:46', 'https://wx.qlogo.cn/mmopen/vi_32/sm5IXHKibVUDeBh70iczoCwEiaeCfEGGuzVAPsu8gTwicxGsf9IRBYsA35LJuzqY4xJ3108boCibOwLqsiczUr7LSZAQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('07788ef808894b01b5110ca9ec17030f', 'oAvgj0VoNTTj8xkzAELlr7gszM4E', '叶子', '2018-04-14 13:23:55', '2018-04-14 20:39:38', 'https://wx.qlogo.cn/mmopen/vi_32/4iaZyaMeWtXYAHUCM5wXHfkrNeiayG21d5CuibVA9EvEtVQCAfoh6wbu5rI8evJZOsobQBFdMjFMx4NS3etmD0Ebg/0', '13541255347', 2, 1, '1997-10-25', '勾叶', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('07e0a42d3beb42e1b581429884d67bf8', 'oAvgj0VCPjco5nuyJe9476iAvl9c', '淡伤丶乀', '2018-04-21 19:12:56', '2018-04-21 19:12:57', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epbHd4g8hjYQxWxxsPVG4sfBoYhRNYzamAuNHICdVtf1hibaq4JQn4ZXlhmo0E9uebD27YrTz56klg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('081e0fb7db8d454ab92eef583da89d3d', 'oAvgj0XmojvewYZmaQyxaSh80AN0', '菩提树', '2018-03-19 15:23:30', '2018-03-19 15:23:36', 'https://wx.qlogo.cn/mmopen/vi_32/XwtLNH83BWaTibLVjNoQz8QoWfRlbPic0l6hJP2dOiczh1yM4nw6emRDubv97Zs4ApBYR6cJWTr7icteJL4erU1iafQ/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('088c83f8cef349448267e098f637d1d9', 'oAvgj0W9lalwJwj8mD-Raqd2whDQ', '汉子', '2018-03-10 17:29:02', '2018-03-17 16:40:14', 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEJ2R1UWCqheCpgKSbvwlS0Jx4jMppAlEMibXEPNibkmT8Dibnw99KEk096IAwtDtQXoxytSsqaNUDrhg/0', '13981927696', 1, 1, '1994-12-23', '唐熠豪', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('08912ed7bd804032ad1dee7170b07ed4', 'oAvgj0bel09ipsdknYHYZRAkaq3Y', NULL, '2018-06-04 17:39:19', '2018-06-04 17:39:19', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('0986f8d6e59244aabad87e5bb5385eaf', 'oAvgj0aZ5iCeH6GLsW61uPXoW2gs', '晴天', '2018-04-14 14:54:59', '2018-04-15 14:09:23', 'https://wx.qlogo.cn/mmopen/vi_32/jt6zPrwgMgRIMO74FVCHosy9qAInUia2iaMHicOA3mJ3GennGkN8abajp6blqB7mmGGnoWS4AaecSkR0D5Ds2M7vw/0', '15881365905', 1, 1, '1994-07-03', '陶伟', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('09a64a71df314c85ba5c30995e380c7b', 'oAvgj0UkiM0Ygti6MRtIck2K3Mjw', NULL, '2018-06-01 18:12:37', '2018-06-01 18:12:38', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('09f213c8a25d41c29283becc912d14fc', 'oAvgj0dAsM5lM85494fhE2O1PbRQ', NULL, '2018-06-01 17:17:54', '2018-06-01 17:17:56', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('09f2bab8a9b94db0a01f5cd57b5be465', 'oAvgj0Qu38ywxSAsRza1Lyq1xz68', '土豆', '2018-03-17 11:36:22', '2018-04-22 15:25:17', 'https://wx.qlogo.cn/mmopen/vi_32/bmLc7cPQDH3XRCuZoLic7CFy4gMibE9k5ZlX2RCTHTqIxJJRQzMS0A66lp1xcV23urQDCMZQ1rllrFFtInj1FS7A/0', '15982833847', 2, 1, '1987-07-21', '曹陈', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('0a4c82bfff30402c8171fbcd441e35e5', 'oAvgj0eN31WsPwE52pGyvj6HNtV0', '应利平  阿弥陀佛', '2018-03-18 20:00:00', '2018-03-18 20:13:56', 'https://wx.qlogo.cn/mmopen/vi_32/wr3qiaXYeAaLHyPBArO8ThuLexNTzsRx4iat0icyFQmKbDLvBL6JzyepuwHBMrAcgerqFiaHKSpPfpz09shdahv9UQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('0a5a7037991c4f65afd3114534b31ce4', 'oAvgj0QFEbCREMQYPIWk9jntgsVU', '淡素昔日情', '2018-04-14 13:55:00', '2018-04-14 13:56:47', 'https://wx.qlogo.cn/mmopen/vi_32/n8ib0rPE0iasraSjF9tJoqLrxZ34vaNrA5qn7licJuf1fgZoK3TnxhsNzpFxvrZxFic4Jlxyk4elMzaJxfx2FSSkSw/0', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('0a7316a40e7d43fe8b9bbbc1412d8e97', 'oAvgj0TM10OWTttPhQ2Lv5QILA-4', '绥中网', '2018-04-04 09:11:21', '2018-04-04 09:12:03', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIfNQ9ehlmtqGh89jtJibtB0fEUtKDaAkZuV8VQyibH3cqxmYxpPGg3vpm2wDRrUrGMiaM8U5LDs0tVQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('0ac9d9b116814f46bed9493c53404c47', 'oAvgj0fB1z4oMg_gcxyzfcAOhxwU', NULL, '2018-06-01 17:22:48', '2018-06-01 17:22:49', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('0b49bcfd7a334bceb407d29091b3e10c', 'oAvgj0X8kPvf6Anml0NoK11ZTXFg', '苦咖啡', '2018-03-04 09:50:45', '2018-03-30 21:01:27', 'https://wx.qlogo.cn/mmopen/vi_32/zY9pLQG5mAiasPPyWYFP06GoRwQiblTaLd08rO4DdmNBhmjFu8gaHibpvc4eJRgZXGNSW2RnjR0uqiaeyf6YpV0MpA/0', '17738064588', 2, 1, '1994-04-01', '苦咖啡', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('0b6258126af24f03ab7b6cc992437d65', 'oAvgj0XJj7O1-kyIi4rxSzV7ynYY', '任我行', '2018-03-17 11:03:03', '2018-04-01 20:05:15', 'https://wx.qlogo.cn/mmopen/vi_32/LD6rSmrSZ4ZseUCpuQKAoHU0icZ6NCfeJluYb7AnYiaCc4LpRsriaJjAj4SPllt4u9BODek4Fs3TRvMqNMIFkKic7w/0', '13688180790', 2, 1, '1987-03-14', '任我行', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('0b82b26985c2421d8b875b2553b34c5d', 'oAvgj0UGU6Mfy3emiaQpVlPm72AQ', '王正超', '2018-03-10 17:06:46', '2018-03-10 17:21:55', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJLfPGDScmpoz306xibUB9LfqFZColWndVeaaSVEboXs3wVEG88uBSyaulazlR7pop6MxMFwjGia7pg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('0ba92327bd0644abaeb0254fc0a94d52', 'oAvgj0WA0KZNKMnjRcFfaUm9S9s8', '未来智慧城市', '2018-04-23 06:45:02', '2018-04-23 06:45:03', 'https://wx.qlogo.cn/mmopen/vi_32/KPjG0WtYgGXXoQbCkO10g6BzTVURfraq1KDUpwh25TtDNdgicDvYCa3ZHaed1icwWKyBSkhQ5mnB167sdkRibQFJQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('0bd895557091472997650f199e984de8', 'oAvgj0VWsvjDiSjEFA_TMZH0PYUw', NULL, '2018-06-01 19:46:46', '2018-06-01 19:47:30', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('0c5e7fc9d7bd4feda060ff7205227020', 'oAvgj0SsBnlvEY2z7m4v8SixXAYE', '龙腾虎跃', '2018-03-06 15:24:39', '2018-03-07 09:11:52', 'https://wx.qlogo.cn/mmopen/vi_32/RW5U7gTMic3ANc73ib1E66ZSFpVC5V4rTgJDUPb66cskPpJ9EwY4FeX0fPocCticBqZJuzsKicJExCPXEc6uxa6Licw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('0cd80acd29e64572b8c2c96f9b793e24', 'oAvgj0YG1ePaySuFAHg1Po7IrlHM', NULL, '2018-04-29 16:09:57', '2018-04-29 16:09:57', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('0cdc851180d54bccb34254a62e204403', 'oAvgj0ejDdqGlNqWUqgV_ZH86gJg', '天府软件辉哥', '2018-04-10 12:55:25', '2018-04-10 12:55:26', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJd2cyZKN5UlDn2Dh2d5vfGKg77fUlBrEhb9saktNt6icd8ujRdOmzUHicsaiaH5TDQ2XSHrGiaY7nEGA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('0d1c2eaed3db407dad6c45d433048a7a', 'oAvgj0Vp3kncxCiI3Ks1OT_LEKOw', '吴秀英', '2018-04-14 12:13:50', '2018-04-14 12:13:51', 'https://wx.qlogo.cn/mmopen/vi_32/VHujEJQglWxm1HvMib0emEoSdgeibumarMlCvK9xE5BQO1M8w0aeB8v9eYxxswgvmZ1qBpXz44UA4UGe5tibDHZUg/0', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('0d2c8cd95ae5459ab4d12507cd588f81', 'oAvgj0XCvCF2zTIrlUhU06g5IoME', 'rdgztest_ZMYJMI', '2018-04-22 19:23:51', '2018-04-22 19:24:07', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('0dc556e4e90142d6848d3fedb49df766', 'oAvgj0fkX66_zoGIH9znVWLAOlVw', '鑫联盟随行付pos', '2018-04-22 21:42:00', '2018-05-01 10:32:21', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKia6gyn3ib5ia5C3Gk3MpfWSO4kBLU3gDzLKA8Dia7BNdQbkyAibibRX7PJTNWFnEsIxFXjAQILGhMWncQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('0dc7ef6c43b34deebfbd71498b25a98b', 'oAvgj0a1nqlyfJZ_Ua2j0honF4tQ', '恒信永利  贷款 135 5029 0669', '2018-03-25 17:13:59', '2018-05-02 10:40:16', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eola14nCkjDaeWy9Esy2cWCSVruhKRwMsQ6QF6LSLBllybbFGdL0Z9xNqic5rWlxo49sciaPgA3VPSA/0', '13550290669', 1, 1, '1981-09-01', '刘文', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('0e4422b1785b4b8ab4a85b8be1547259', 'oAvgj0WRMMQ_-Ub8O1CHuOd4oTi8', '龙梅', '2018-03-14 10:29:12', '2018-03-14 10:40:21', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK0DgLsDPcgV3A6pp3wcNfOrA9mfF20sQVvqo1o39qPeGiaZp7TicGZeOqykg07ialZa62UjO72ECrew/0', '13618020536', 2, 1, '1976-09-08', '龙梅', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('0e84ea4ccc014d90b3143a1a4f23cc6c', 'oAvgj0Sta5u5y3jGNxn54ysGvhFs', '夜雨', '2018-05-11 18:51:52', '2018-05-30 22:13:21', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqics3d5abb8ibwtsSQEsgf8Y9grMusPgtfceCSia7jxuBBUiaecL6ZmzVjLCv2ngMhl52cricTy8T7ndA/132', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('0f631f25a6344e109afbfaa8abdbfa18', 'oAvgj0Ta9T_JpUCbmzsW51NjPSDk', 'MaybeTTT丶', '2018-03-13 19:41:47', '2018-03-13 19:41:49', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIs7DKArdW1oyia2PXuRwafvApkvZ10JGyjV7Dem67XenZFlHVXDBq4ia0p2unak3bm8mnQWUzGicaTQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('0f6c5b0a65a746f2b10a0c53dc14b9d1', 'oAvgj0eBCe3ZR1w1RNRxxQgvoKTI', '陈淑蓉', '2018-04-26 17:22:19', '2018-04-26 17:26:06', 'https://wx.qlogo.cn/mmopen/vi_32/icQUAujyG3h0CgzgzDm8zRoIeOIjLVic9yvsxrfIvvicxe91szYibPsRctUVyiaC0ICFTY4SQGbn9FlVvNR5UDpiceqg/0', NULL, 2, 1, NULL, NULL, 4, NULL);
INSERT INTO `tb_weixin_user` VALUES ('0fbcc1d5c6584c7697c33f902e9a957a', 'oAvgj0f--X1xCubHZabHwpmqPP3E', '熊敬', '2018-04-23 01:39:09', '2018-04-23 01:39:10', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIlUrRFKoyFnDazT20ah0fHyl4da2gp6cvlC0cB7g8G94JArzkkVRKLhvVd7ZlCwDMzyJiaa6GuQxw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('0ff504f142b14ce9a9751611008d6812', 'oAvgj0U76knvINRigMj3Z9p98JXE', 'CERO.', '2018-04-15 17:42:59', '2018-04-15 17:43:01', 'https://wx.qlogo.cn/mmopen/vi_32/JFmRxGaUJlWBaQ8mXyMdUicrwpkJCKMXcst3GQl7fFwsOrZgEJnIEWOUhI1hVyBP2lmemjCO07sm2Isk4QEdK2A/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('0ff98ed5c6774d89a1a76e319d34da4b', 'oAvgj0bSGI-_8wz12SI7jisM814g', '゛這名字決定不起了ヽ', '2018-04-10 14:02:20', '2018-04-13 10:29:53', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJbuxpls8cAmrYbdHttlaHmMIiaRC5qRKA0gaWL3qP02ibJ4jeBFbk3SeUIKsicrTTjkYWeLmB9qwCrg/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('102829e1529b43c4ae6ffba7c4bac28b', 'oAvgj0RnAEGVSqh7TGDx4lPEp-qU', 'rdgztest_ZDYLYM', '2018-03-11 13:27:14', '2018-03-11 13:27:30', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('104c88d9ca6045c5b81b1d8cbf98f8fc', 'oAvgj0YdJOpKPLSFlitQlgIX1jQ8', 'rdgztest_GUUMZK', '2018-03-05 22:20:29', '2018-03-05 22:20:55', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('10eba363ec6f48d1872e291ef6199874', 'oAvgj0csKwB5Gv0HuwtNlidfXUPs', '柏平华', '2018-03-17 10:50:17', '2018-03-17 10:50:29', 'https://wx.qlogo.cn/mmopen/vi_32/ElUv32icHibibnuqiaXa0GJqAJVyy7eBYja0hHmtuT9XE5nibvwTN7O7nGF6y7Kickic1J0j8uOXCUZqdPfKQEk3qibgCA/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('11001d8ccbe04108b856401a16bd12be', 'oAvgj0ToCH2SOq0TAmbYywy41DdI', '致尚传媒', '2018-04-22 22:15:01', '2018-04-24 21:41:32', 'https://wx.qlogo.cn/mmopen/vi_32/vOZcibej70AEicAyiaTsAfUwgicH5nF4oHVpyFBGG3d05aojwRcJ97wWVjO8tfe1Fd84DhZKWiaGCQMTvYmU9UPnsqg/0', NULL, 1, 1, NULL, NULL, 2, NULL);
INSERT INTO `tb_weixin_user` VALUES ('11c8f0108cbd4935bec57777d76c6970', 'oAvgj0dMvVAKFWo2jzFcWP_BD3vg', NULL, '2018-06-02 15:31:37', '2018-06-02 15:31:39', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('11f5d5e419ed4cb18b6c15e5e94de1b8', 'oAvgj0b-6KsbOtzdNxvXDuCBgpwc', NULL, '2018-06-01 20:16:54', '2018-06-01 20:18:13', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('12035304bdbc44d2a608e343eebc1e27', 'oAvgj0at4OWkU4mWMnQ17aRr1D8s', '任强|社群运营|共享茶室', '2018-03-02 15:33:42', '2018-03-06 15:59:57', 'https://wx.qlogo.cn/mmopen/vi_32/rLlDicqBx1WNARAsojwFT35lmjw6HeSicLZ0womFwanyCQkXpWsoWPxU7BLbmwslriaAcicBwEgUUswlqB7DV5haCQ/0', NULL, 1, 1, NULL, NULL, 1, NULL);
INSERT INTO `tb_weixin_user` VALUES ('1217a566b6374c2e92a889025293e45a', 'oAvgj0ddMGnNYe8i9juNOFelO7AE', '花谢花开', '2018-02-28 16:49:13', '2018-05-07 14:41:01', 'https://wx.qlogo.cn/mmopen/vi_32/KDoncvPHKnE1KKKFicarZgCLWiauY0A5t2cyqAbd7FuvmREJ1ialjmBICrxwEgXOmicg3wiapNibtNQUnCQQWShW135Q/132', '13990831073', 1, 1, '2010-09-01', '徐', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('121e234bedd44aa0af04501a9b723bb8', 'oAvgj0Z13JyLf7pssYpM3GMUmElA', NULL, '2018-06-01 19:54:05', '2018-06-01 19:54:06', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('127e5cf9430d4dcb9583534f6b2af236', 'oAvgj0fnI1nWCoh7wAug2lTFwvXQ', 'vivi', '2018-03-17 12:09:03', '2018-03-17 14:25:07', 'https://wx.qlogo.cn/mmopen/vi_32/Dzibd3HNcDu5XQdk9OOmNn3Lrs4iaQe5l5x88YLHy48QXsaHAJBTXic45qny8VxERAwiaL9wsDovLkmmu4x57ImsXg/0', '17308043295', 2, 1, '1990-02-19', '黄维', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('12b5d7120c994110b9beb901436e5c90', 'oAvgj0f2WysOVwjwxFoJguDGRF58', NULL, '2018-04-20 11:15:48', '2018-04-20 11:15:48', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('138709cd03a3415ebf42d0b36f0164a3', 'oAvgj0RyeUY3Zs6p7m4y83OBzZ7E', NULL, '2018-06-02 15:19:37', '2018-06-02 15:19:39', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('13be0166595a4a06853671615d0ddff5', 'oAvgj0SFAoPfWHqooXWGVPpHfk4Q', '金桥', '2018-03-20 18:37:23', '2018-05-03 00:41:19', 'https://wx.qlogo.cn/mmopen/vi_32/aeCJlOUAyLV3AdT6wf2b3UZxqyZtzA39zd0ZhHbeIKyp9iaLVEMomjMLxDjyMAbW74LCxHI9leRkWlSs9iaQ2kEQ/0', '13302969973', 1, 1, '1983-09-01', '李生', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('1494626b14bb4246aa2471f9cb7a1fff', 'oAvgj0YnFsTEl1IzdF0tPNWqJ-Yw', '路行半路莫回头', '2018-04-14 20:39:49', '2018-04-14 20:39:51', 'https://wx.qlogo.cn/mmopen/vi_32/gFsre4I5gooFvPAUNAHL5PibJVAn7zdycyx5AdicXJscEGyIOFwxz1oEXL9cE1ONuOPyqibvjpBfYenZobur1L0ag/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('14ab52508ea7442d82cc5404941cc7a8', 'oAvgj0YW4sYGdHnuC_Jg6mxr4iNQ', '旁白', '2018-04-21 14:34:57', '2018-04-21 14:34:59', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqiaoc7JfO036tnCoUOhrVWyxnjd79JDVmwz06VYgiafyzVwMRQFSwthjYUQiaPaXz2NLiaqoz0gIJ9Dw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('1510f59310ed420f8a114ce8438f3e01', 'oAvgj0T_BtTgQqJKI0LqZvTvf0ts', NULL, '2018-04-25 17:08:13', '2018-04-25 17:08:13', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('158c061365fc4d9d84a9cc510d7d03de', 'oAvgj0SackpMKdLpyFZFFhTnUKl4', 'rdgztest_DYZQWZ', '2018-03-11 13:27:28', '2018-03-11 13:28:09', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('15ce03378e9d42378ed583f1eb9edd71', 'oAvgj0cSXzKsr384xyYZtKHmE0XQ', '趙雯倩QIAN', '2018-03-17 13:02:55', '2018-03-17 13:05:48', 'https://wx.qlogo.cn/mmopen/vi_32/67wok3rPEdKcMJFgrdl9ZpapjJHrm9XiaXHNURGmvxmicPmIdsYrFDB7tYvptBIV5auEEiavrcicZNRokXq3WRrTCg/0', '18281035201', 2, 1, '1999-12-04', '赵文倩', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('15e004aa14af426faff2266f1e053281', 'oAvgj0RSqPGDbcQt09slS8mB88W0', '谢小枫♎', '2018-05-11 14:18:25', '2018-05-11 14:18:27', 'https://wx.qlogo.cn/mmopen/vi_32/4W6IkGficIQicNQsOlhUY9HSGT1hhPRicyq5lNicc2KGJpqbibF06ufYMorEPibKFTGZKvC31AxrLF1taLAv0tObaN0Q/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('15fc46f3cd47454f85f096206a2e54d2', 'oAvgj0Uc4kqWbpLtM3x2Roe87n-s', '测食鸡', '2018-04-03 19:40:37', '2018-06-04 20:26:34', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK0DgLsDPcgV8ASnOtLuxcT8tibkKpTIibCtGq66zRBokKof9bDwxG7nPtYwB5KmfUQciaEbE6pNMEXw/132', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('161afb0cc3a9428c807b5abe63b510bd', 'oAvgj0SuhMc5pGWhWlHCQGddymHA', '小程序 | Zola', '2018-04-25 21:49:10', '2018-04-25 21:49:11', 'https://wx.qlogo.cn/mmopen/vi_32/ibicjibxHvO5wHm15C0WBtysgZfU3M2BmtI7tQuUL1WeJAnMfBlbPOHDLPSGw87pSPiaJN1bYI5x3cK1fFzwYXBCug/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('1633e175c8f24e4fa313866bd801f73d', 'oAvgj0ZRYcjghYH-FDk51v0b2mLM', '上善若水', '2018-03-04 13:50:43', '2018-03-23 15:36:17', 'https://wx.qlogo.cn/mmopen/vi_32/ZrXe4GaBZiaBOhib6bicv9MLZwCV10TF6al6JeNeD4nWYHpACDj6mTwcpr9q7EFYgC3C6Mv8UVRiaxS7DIj8bMLE3A/0', '18144345819', 1, 1, '1984-01-24', '杨勇', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('1709aa22727c46959b1488662200dcc6', 'oAvgj0bC5vUVnmJQGbIL7bg2jmWY', NULL, '2018-06-01 18:43:15', '2018-06-01 18:43:16', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('172be1828b054ee9ad3fa3253978bc70', 'oAvgj0QmuyIYhQX2FWhTm0AKWFAE', '芳芳', '2018-05-17 14:07:54', '2018-05-17 14:07:55', 'https://wx.qlogo.cn/mmopen/vi_32/FfJyWun7NSGfqN84q3TdXR1DSniawyDUDx5coEZE9YA1bc8uRpVsDpx3Oic0jj7n0JpKdkFZiagKuc6XdiaHlOfW7w/132', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('175daf649d064fa099ac9aefacb9c7bd', 'oAvgj0fyeU3qeEiawO8pYh2Nc5nQ', NULL, '2018-04-24 17:06:38', '2018-04-24 17:06:38', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('17d86d38d01e4996ada0a5cf2ebc15c0', 'oAvgj0Uv1sQTQTsMDd5O89zkwtOc', NULL, '2018-04-23 21:07:08', '2018-04-23 21:07:08', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('17e1aa61ad704a508f6ba2b215929af2', 'oAvgj0RPCVy2RkDG1mZqnMWsG8S4', '汪正影业商务BD 灿灿', '2018-03-23 14:40:05', '2018-03-23 14:41:35', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLydatGaozQ5fnNOr8g67hLIIgUuhplYpFMrMGMqPJIAL1sl1oVQfHDPpInuZXVqibLiciacsiaw3L2fA/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('17f3717343094b68991f6b6790588952', 'oAvgj0cL1KaIp1DJ4B5BARksI0XM', '老头', '2018-06-01 07:03:35', '2018-06-01 07:03:42', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLOemNWDXXEkbfs3dc628zGp7SVFacC2o1EtgeX2P5axpoG54G3zwGTOeU74qCqQ2a7ox6N3o5Cjw/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('1804fc0a2354465a850198a62b682f10', 'oAvgj0V5eImuwttX9KLctB3c7t9U', '我想要两颗西柚', '2018-03-05 20:12:10', '2018-04-14 14:11:22', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLicEOk3D36qnuXRMTuiaqNlAXRzPrn9UOib18Hrl6Ne78sRgtwTRc5l1woaKj7gmnEZ69TibHIs8BcRQ/0', '15808235606', 2, 1, '1997-11-02', '王宁', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('181c2ad7961b4ac8a3786d3e2007a489', 'oAvgj0eN8saK8BtDXyPBFU5M9DXY', '不知道', '2018-03-01 18:14:53', '2018-06-04 10:30:26', 'https://wx.qlogo.cn/mmopen/vi_32/0UyDfZDGAACBV9dk2R6hheh1ZVb43PABCtWe7CE0jcZIw8v41ElFibyj4U2bJo3Qaqb8DfukZXEguvT8L9oMv8Q/132', '18380430778', 2, 1, '2017-09-01', '我', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('187639efc2d5401f96bf3d79cdbd96c8', 'oAvgj0cfcjSsOYNCLWVpDzVafE-I', NULL, '2018-03-22 10:53:22', '2018-03-22 10:53:22', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('18a43f2098564a56bb9ae9227aed1967', 'oAvgj0R3LwbsesRwcSJpv5OyRiTI', '好奇的然哥。', '2018-03-14 16:19:46', '2018-03-14 16:19:47', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erSpfIDAJzj6zSyApu5gukbDv2TEfRD1tNaDZBY3HQUIcibicAICxwnSnXXiajfySbJCpyDZ300Uentg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('18ed8ecf1ed747b7a95d1761499556a2', 'oAvgj0criTAZs-WFrMc3aROAhN7A', NULL, '2018-06-02 13:26:18', '2018-06-02 13:26:20', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('19a63cd03a394c6ab0948d1c811e9364', 'oAvgj0c8DjFFbn1WjjPZsbcOi4S4', '小鱼儿', '2018-03-17 16:05:10', '2018-03-17 16:05:14', 'https://wx.qlogo.cn/mmopen/vi_32/VJ3Tibd9jBTiaRbytdQLgueyzZoCcyZIeMyCHO4tejApVLibBicOW73JddlFCJU66FPoh8KNSz2PuOAmiafM9scmOEQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('19b71379d9ce472596a9d2b2b2b9a640', 'oAvgj0SQ5L5uWu9K-AZCmH45XhPM', '咖啡不懂糖的忧伤', '2018-06-01 13:30:55', '2018-06-01 13:30:59', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKhblo9Lmz0tZUPoyNNfTzf3cmKicqZrdiaP6LW77PJsGh3xbcwqQKE812ibgLdtvicDky0s33NxzhgDg/132', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('1ac61c32f3fa4a40bacbe1cd823f272b', 'oAvgj0Q_lHk4OEiRW8REfohyJfKw', 'freedom', '2018-03-17 16:40:27', '2018-03-17 16:40:32', 'https://wx.qlogo.cn/mmopen/vi_32/ztvvibxXM6m1MlTG40pSibpRj7KSib9GQg1m70iaWBoiaYWHJia5rwQNbicgKicF1siazCNeeT6SQ5YicbCQvQd1f0mrl5cg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('1bcb6c401e6d41f9ae2b78c97049a4e1', 'oAvgj0UACqNzNY4IvRHAx6ZghePo', '吴老师', '2018-03-06 09:35:49', '2018-04-14 12:35:58', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL1gcDfvOEUZPHicfzMBic41GNFAJ6MqZGyV05dfsUjwnMzqs8ET4Au1oXZqCnSzq5icdNjciatrc5zNA/0', '15528055329', 2, 1, '1998-04-17', '吴国园', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('1bcc4ca4d4bb462ebc914098c99cfb79', 'oAvgj0T-zmRaY9B9RDpISdDAPxQ8', 'A~渐行渐远', '2018-04-23 11:55:52', '2018-04-23 11:55:55', 'https://wx.qlogo.cn/mmopen/vi_32/Oufg2ib1EJfahM0UexibgS37iaTgHcNxuAxLmvo2hTC0J6x3h9ocYuQk8jdV0Z3Jl58ygaTqqDNGQuSMgD5TUorAw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('1bfa41fc421c4802a2cc4fa813941320', 'oAvgj0fHCUVcVjo1gxxQJhocKc4Y', NULL, '2018-06-01 19:49:19', '2018-06-01 19:50:34', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('1c2f52fbf3b2494b816525a505285a44', 'oAvgj0W7lkxxLO40QxFgZ1aWq2YQ', 'rdgztest_XSBCHO', '2018-04-12 11:49:57', '2018-04-12 11:50:19', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('1c3ecd43208240e384d2b7fb5139ccb3', 'oAvgj0b2FLUvGhoyQSupQo1NHWOk', NULL, '2018-03-24 16:01:04', '2018-05-16 12:53:54', NULL, '18111224250', NULL, 1, '1996-09-01', '伍', 2, NULL);
INSERT INTO `tb_weixin_user` VALUES ('1c4cf8c08db14fe3a899a51f4ddea6cb', 'oAvgj0euOl4vJHGk3A8TsM7454oo', 'rdgztest_CXQJBR', '2018-03-19 20:46:55', '2018-03-19 20:47:15', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('1d1fc6e0a4154f4da854e38f4518c9ac', 'oAvgj0f_BxqSvHurXrjwVv-feJIo', 'Coma', '2018-05-15 17:54:45', '2018-05-15 18:42:28', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLnogicUOAGTfDyN7c7BldyI7hibm1cg1l9GdIkBk3p9gw4jvJOHiapDHmMlTY5GMjgvPGVsoQJnP91g/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('1d55dc0e2f1140228325bcf6bb56879a', 'oAvgj0f-7JsKhp7jkhRdoW75sypM', NULL, '2018-03-16 17:46:01', '2018-03-16 17:46:01', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('1d8e77e92922462896b07fda8dae0f6f', 'oAvgj0VJ5F73QAncqpXsOG0oL9JI', '杨琪瑶', '2018-03-13 16:42:03', '2018-03-13 16:42:16', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erek376GnHnJFDUXiaicPF6IUbicBXYicDB1fcStdELqqoLWSc4GS7zOZgPjn7nKrFGX45TnKY9ricxc8g/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('1e596a68a0a5446d902573bb52335c68', 'oAvgj0a4mCjlei1EI6r3OrD-JM0o', '平凡', '2018-03-04 10:42:03', '2018-04-21 15:38:22', 'https://wx.qlogo.cn/mmopen/vi_32/svWic5IQShdoYf5BEm7rGiaBdxogy1vfPkicKibF3raGWTG2RYGdpiaJicSl7iaGla2IqibbWkUM5wH6DI2lH2xOWpnonA/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('1e6a2c5213a94eec8732a00bf00e9f99', 'oAvgj0Tn6niPstOfI9pfXoTNYDZ0', '♥          印记', '2018-03-17 11:58:11', '2018-03-17 12:00:09', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKFpdhqV58va118zdLpnXI58ic3oo0L9vNvIoMaamTibut2dcKzCgOyP2ickiaypBvPCdNhb4LaA8lolg/0', '18502813801', 2, 1, '1990-05-11', '西西', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('1e734f061fee498c991826801e80b39a', 'oAvgj0drwHpjF0gPKIMuXNWJ0vGA', '熙熙', '2018-03-06 09:40:25', '2018-03-06 09:40:28', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eo8nic8ZbTNwicphnvf7pqPFcgePXd0BSLAeLXnL2lIV9mURaxKZqAczDHHx4hW36vFb9ibLVbBj0Y3A/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('1ea42708c61d4c03b0bca0f3214aa0ca', 'oAvgj0W8JGriUjxP_AK3zoN5_gpo', '黄轩', '2018-03-09 17:51:44', '2018-03-13 18:03:57', 'https://wx.qlogo.cn/mmopen/vi_32/0fZ4w7fib73HSeI9oENGqyEN8F4HDxicGJPicnRibkV0ztaNC17qCQt97634lLj7fbJeJktXzMpjBoQAY8jf15ja1A/0', '18280053955', 1, 1, '1988-03-01', '黄轩', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('1f8e35c121a946af9d488cfef55bf763', 'oAvgj0fkTYkHqCnG3_N3RepoBn_g', '姣姣', '2018-03-17 16:18:42', '2018-03-17 16:20:04', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLjEVe7iaT3sAIp8vS3kvficGrLIkUicxzS65QADYZReSHzE9JejODS1Ftx8qMCniaHGoI5epTibZ4JJhQ/0', '18010618981', 2, 1, '2016-09-18', '刘峻熙', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('1fd6af2657d14521bcef0841dc09ad33', 'oAvgj0Z7EW5a_FVq2wJFqhr_OEKo', NULL, '2018-05-08 11:18:57', '2018-05-08 11:18:57', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('202296d964f04d518e4b4a0822df8668', 'oAvgj0RL2pkD_Rp4KaeVXC_ULhOA', NULL, '2018-04-28 07:16:03', '2018-04-28 07:16:03', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('205a89d244474b129e5db28c2fd04363', 'oAvgj0ah3DgFepKWZARRe75g4i5I', '洪仔', '2018-03-17 11:36:02', '2018-03-17 11:36:08', 'https://wx.qlogo.cn/mmopen/vi_32/s2vYsic9d8n6DQ82v87Qiaj9al9ibZtU6cmud9HbsOxUI7cTZdEHIAsvKUHJibj6h2L2OlY0M0wQ36GMEBu8OZo0XQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('20d5ee674e2d4df498348b9587d26129', 'oAvgj0U-3fJTr7-INJ8jCarRM3pQ', '席汉章', '2018-05-02 19:44:17', '2018-05-02 19:44:18', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKqGia622ria1arBiarVziaTwkrD1wPFmuBC9nBnCwsqzB5CMczAQVv4Ha8Um3kvhqyibcwVUW60p2ZpWA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('21305322ac5348e0b1eb41485e382087', 'oAvgj0dwb6OQ6KNQ7-QCnnvYBTnc', NULL, '2018-03-21 15:25:17', '2018-03-21 15:25:17', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('215620b7d834450b8f59cc7ff9a3b0f3', 'oAvgj0R2qd-hn9BADGbBex5pL8dw', '朱鹏辉peyer', '2018-03-31 10:04:30', '2018-04-14 10:41:18', 'https://wx.qlogo.cn/mmopen/vi_32/jTO0uBUHJUK4RyGXXj1Ax8hgy0CZGP5v5qpKCABpr801AtUwFTBq9RL152UUjaTM68EzPANsMCyicC7p1SjxGrQ/0', '18628317939', 1, 1, '1992-03-06', '朱鹏辉', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('2164f29068b3430297aeb21eb4b50c1d', 'oAvgj0UlCDhJHAMZv64zY2u1bgq4', NULL, '2018-05-02 21:10:53', '2018-05-02 21:10:53', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('2211fc34ddbd4cd4af7e3b8a6c4dc452', 'oAvgj0RhMkBA9q5Dbk9N9hFhUTu8', '大兵', '2018-04-21 18:24:20', '2018-04-21 18:24:24', 'https://wx.qlogo.cn/mmopen/vi_32/WP4Ge8ABcIMj7jQWNYQYjtOIU5nu8ic0LTiaMXr2ibiaDrtlYtZpR1ZW7WAY7XGaHIVibbqQGiadpSz67GrXFAic9yrmw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('22eea51c12864798bcfc42b20d9d19e1', 'oAvgj0aiJXLPPS18uxDzedq8FLHU', '李江文 成都第二地推公司', '2018-04-22 22:15:57', '2018-05-10 15:25:00', 'https://wx.qlogo.cn/mmopen/vi_32/49Hezib2FDNuVIPNA6PoPanNWVd6m1veQK04Pt0yGiabbsLRmW3GAJnYicjxzVGAiaicE0QqNwEEg4LzxOoa3zOHj6w/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('2399e791bbe64e0994e346c70ca15bde', 'oAvgj0W3cJ3U-VEvnDbgMYD6gaAY', '杨奕锋', '2018-04-10 11:10:19', '2018-04-13 17:09:20', 'https://wx.qlogo.cn/mmopen/vi_32/q6ibkmyA17vWBB1k1r642iaCeEBNn3ZDm14gSbLyv6kA3up1bG6VlDaKicibzZGqkOopksxStkkLzA4ZxGCIWNskKA/0', '18502830515', 1, 1, '1979-04-19', '杨', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('2416bb28a98546c386db3f3784c55fd6', 'oAvgj0Qbi2O6PWbQdCLF8rCzFX2s', 'rdgztest_OKCKNZ', '2018-03-15 18:06:12', '2018-03-15 18:06:25', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('24e32caeb47d429c94231f85c2ba7248', 'oAvgj0bPaHd6ojcSxYZ_1JmoAOVI', 'rdgztest_GLNOCT', '2018-04-07 09:13:28', '2018-04-07 09:13:58', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('2564cb9eb5b94b2e89a703e608d753f8', 'ocJ4i0adBSA-1l8YHEN83vmbF6fs', '我是来测试', '2018-06-10 11:53:35', '2018-06-10 11:53:36', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('257d71b5de094df883e4d0906d1cbb25', 'oAvgj0eDw4eMiASdNFTzYNTRZy20', '人生赢家', '2018-04-22 21:28:13', '2018-04-29 11:06:22', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoDMe6CPian9OtkZbm2XDopicJl7SZNRvmDMfjYvfy7oHosNU8ibUqrNQ3oUqINyyefZkVmKXxnLZrjQ/0', NULL, 1, 1, NULL, NULL, 11, NULL);
INSERT INTO `tb_weixin_user` VALUES ('25ae035e7f99405282de132d480ac462', 'oAvgj0QgGI5Dvc0wHLnTM8zJbtks', '小胖子。', '2018-03-11 08:35:20', '2018-03-11 08:49:18', 'https://wx.qlogo.cn/mmopen/vi_32/wr3qiaXYeAaLHyPBArO8ThhxZTVacAFBsfibzPo10kjcUMpQibeZ4oUvhnPibzH1JNiaVUjfv6lJicQic0qkxsicSHhCCg/0', '18113430306', 1, 1, '1990-05-09', '张文', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('25f38fd36af047de9ebef7471385aa03', 'oAvgj0SEV-hnukqayX2gRRpaowsA', '中国梦', '2018-04-21 10:58:08', '2018-05-24 21:28:59', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJdy5mkNzMYkcDciaqltqKTibiaIGj6yhNoglNWUytLl4Ls4eRWCSoRkA6PfbrgGBEctCgZ2l89NpicHA/132', NULL, 1, 1, NULL, NULL, 20, NULL);
INSERT INTO `tb_weixin_user` VALUES ('263d24971b294531a59fafdd3bfea216', 'oAvgj0ZLJTPfTh7RkG3hyYl9Ogd4', '知识改变命运', '2018-04-22 21:58:56', '2018-04-22 21:59:00', 'https://wx.qlogo.cn/mmopen/vi_32/H0GqDP7ibHo5ic9gN9MYhiaicP51diaA99koIw5BB6S1BgChmR5I6rhV4NjdWhNibx1U7BYl1ZFHoquLYdOAnESMjViag/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('264ac2d6f21a4a15bc1e1062a252add1', 'oAvgj0UFoyTPW72I_2wLcJv3ZQoo', '成都国际商贸城_-蒋海栋', '2018-03-02 21:36:31', '2018-05-16 11:25:07', 'https://wx.qlogo.cn/mmopen/vi_32/FoSG1zobp4Um9ARzS9gvDiavSqNwH7rSntA1HSp6khVHOF1NsIfjtjn9Fdv03DRVV9Nx5NENOppEqjhzuicZcJWw/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('264bddf065504321b46426d33c3a098e', 'oAvgj0dJsZPfmXFUfR_sooIEjNxI', 'AAAAA装饰', '2018-03-31 11:10:18', '2018-04-04 00:12:48', 'https://wx.qlogo.cn/mmopen/vi_32/uA0aia6vVfY4ddxbziabrECh6VMEPA2ZibVUnBS0TdV5VcmLxQxrSzzjGGbkeNeEEuNuAse7gzuHB8pekKG3wyfzg/0', '15608030968', 1, 1, '1983-09-01', '余波全', 1, NULL);
INSERT INTO `tb_weixin_user` VALUES ('264cd64dde5342868825c24112beee48', 'oAvgj0U8RwqCOEPeu2NLsvCcTnoU', '多情_必_自毙', '2018-04-21 15:19:54', '2018-04-21 15:19:59', 'https://wx.qlogo.cn/mmopen/vi_32/CqJNYqa7vRn08ydWmeYmXicOicwk8ic597QibJfavz0Il22JLsfdwXCqibGgaqYAuoZOeEibQ3jyOwpLxjpLG3FEia7iaw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('26501b58ed0240c6ba579318d8b8df62', 'oAvgj0easaQib910IAEHUg4Posh4', '陈旧的思念', '2018-05-06 11:33:01', '2018-05-07 10:37:10', 'https://wx.qlogo.cn/mmopen/vi_32/ocJcaib8ysuCShDrW9Ia27K27MiaDQYA5ztDSrToW34D1qaZuwiaqMkTGQ4Ke1vYQJKPXXUsjiaMdbVdfd4acYOm7A/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('26957203895a4ec3acbb8b0b023836ba', 'oAvgj0Xt2fUGG0nkofvIXX5r_3tU', '小歪', '2018-03-18 00:07:17', '2018-03-18 00:07:18', 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEJDdcvFialYKZTcCribb1cGia9GUIoYehgicKhPdK9pIrlicELYMjnyt3Eg7YKVmMhMBpjyy51hhp3eWUQ/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('26c8bf5d75df4dea87b3332bc11e60d4', 'oAvgj0d1hwRl5JJ4rwSLdCnzNN9E', '推吧科技～15549052818   李', '2018-04-01 21:35:48', '2018-04-22 23:52:28', 'https://wx.qlogo.cn/mmopen/vi_32/ibcn09FiaT8kGicOk4b8BBL4iaFzCJJt4EV62OGQQDibvRCC43NKgQ8Te4VMtxNjWfm2eGsSHhMbKiaic4nbOBLibiaRlbw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('26cf9df6a11043fd85874220b98d932d', 'oAvgj0WEpdhBy0XNAU5U8C9YYoN0', '郑平', '2018-03-08 13:04:17', '2018-03-08 13:04:23', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('2744f3d4b80d4fd19983a2730ed4273b', 'oAvgj0RvBKoMxIFL2KCh_NeEWYoM', '华誉口腔 敖媛媛', '2018-03-12 14:58:29', '2018-03-12 14:59:16', 'https://wx.qlogo.cn/mmopen/vi_32/BfwsrYQVhMT1tRGmLk9wSbzGKpAHRlXaPibaicyJ9zPu4PLiaWo13fGGBzAW0bjbO6ZwoeKiaiaTkniaeaWlwbKUCYRA/0', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('27858d517a0a41c98779928b54aca9d3', 'oAvgj0SuHv4DX43E5rr_p_-1v_Hc', '江南', '2018-04-23 21:23:11', '2018-04-25 14:31:59', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJVdnBrdorYRYQQqBBjJI36CE1ibmOjmnGZHftickZfVnA6bdkNBaqgHu50Ee8af7ADS1vFbGiaB4YEQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('2825160b87024a68b53d07d929fc33e4', 'oAvgj0Tkkc9yvN9LG8x-LAui89vQ', '我们网络', '2018-03-19 15:35:59', '2018-03-19 15:36:03', 'https://wx.qlogo.cn/mmopen/vi_32/Hib7FgzD8htoed4BrbIVsdSQOUJsDgfa7w5QrUY7QekToIV0LSR65ywiaFUmicRvvNA2EqOuA0pdCiag6H2guib9oTg/0', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('285167543f6e473da553588ebeca3a37', 'oAvgj0YyCGnmUZZmQbp-C7wPMHmE', '赚客计划¥¥¥老司机', '2018-04-18 16:17:24', '2018-04-20 10:07:14', 'https://wx.qlogo.cn/mmopen/vi_32/sdwKsX34TcNHbKUt35T8eGdeYsgl6bicQdqT6Wfy4RJetwTAO23eRwA1ib7bW0ibhPHbvLp6rYsJ5x9SVRibDrqnKg/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('286a9cf787f54432a25110864872f887', 'oAvgj0W3XKq14WMvJBC7bD_Sk6cA', '仙人掌', '2018-03-07 09:40:00', '2018-03-21 21:33:02', 'https://wx.qlogo.cn/mmopen/vi_32/LNia7t4vxyvxibTqH5pOTnul7LlCZJHJejYictgYoebzrB4fibqXL8iaJYtEzPbic5OoSyBmCniawWwwfOnsqDicBl6gicw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('286c2dae16b942a686f72e98760ae696', 'oAvgj0fN3Kh02kd4xUa7n7flx_6U', '水滴电子田鹏飞', '2018-04-22 20:21:42', '2018-04-22 20:21:45', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKqGia622ria1atGSDH1gtictr83jsm2qlISxpgXeLNPwlvNaaTYicGM75BWrgDZ1oOqrTcibucEVoACgg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('28f2ba0f0b384144a25d968b5f4eed70', 'oAvgj0Qe3X3sO5ZPILCynNoVJhd0', NULL, '2018-04-14 13:23:55', '2018-04-14 13:28:16', NULL, '15108388205', NULL, 1, '1995-10-20', '刘佳', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('2900f5a33db44db0bed30d850d3aa14b', 'oAvgj0dM5V5tbu51he7Eko3HNDz0', NULL, '2018-06-01 18:10:20', '2018-06-01 18:10:21', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('290a9630b07347cbb218f70843c97586', 'oAvgj0bPtRxSNL7r0xMimdweFDRw', '简则易从', '2018-05-02 19:23:32', '2018-05-02 19:24:09', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLxuwsaMvCHN9U0ydnkCDpKEufbCe3gKS7kcgEhay9uibicgIykkrCNkZnAcNLSv1IPDVJyvJ3WmnXQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('29b90c281aa449b1b6a635ea15686bc9', 'oAvgj0eq2omRAbpPonc8mGw26xJ0', NULL, '2018-03-19 10:03:22', '2018-03-19 10:03:22', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('29bdbcf4138a488ab9dfe406951d0bec', 'oAvgj0dvlcnWgRPYQ0xjHv6K3JI0', NULL, '2018-06-01 19:52:59', '2018-06-01 19:53:00', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('2a329d7571fc42e5bb3c579d8ece1f3b', 'oAvgj0ZkROXZBFpVRLzIoOVJ6u-Y', 'A_众赚金融--雷神', '2018-04-21 11:44:09', '2018-04-22 20:19:30', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erdBsbTVU5lY6pGwwX6M4gTicr20yHzOLxiaiaS4FwvXZQbJ1YN0en9Ng8yQ4wbjhhMpR4wP3AMep3sQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('2a3a9751f085409b8f7cfdc38c5da1ee', 'oAvgj0YdtDXEcvcmv4epNoS0dEPQ', 'cody', '2018-05-20 10:53:47', '2018-05-20 10:55:35', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIRbmNWgLribeVH6WLuHmwO7W1BmT86H7Eu6ia7ubJ3WsoLlHiaPkIlgWiaCtdWMTSxPcsBmr0WMMlkQw/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('2a3ea4047d7d404ab3de9a90f818a3f4', 'oAvgj0TM3qug2x69guKQJ7XZQwwg', '风雨兼程', '2018-03-06 16:04:23', '2018-03-06 16:05:27', 'https://wx.qlogo.cn/mmopen/vi_32/TLMOqEw7c98SQFE8tVAswvJYJ3AuIia1O7uBFw2XicQ56cOLSlic2HbqLqSQPKag8NrelZg1woCwjAu9M0W9Nvf1w/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('2b9c3832cbfa490c87282afd58f499c1', 'oAvgj0S-3qKLY7fVs0_Mx7ZNsqwU', '小丽', '2018-04-14 16:33:04', '2018-04-16 23:37:37', 'https://wx.qlogo.cn/mmopen/vi_32/LpYDycID2DqttqDq9FLpWTD9TNGCJUPmIDvFDb7nYOJ6unIRN3mpQaPg08ZWiacbI7gn1g53Zyo69ByibKRZxtCQ/0', '13679662243', 2, 1, '1987-10-12', '彭小丽', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('2c25c7b224464e4bb048fa6f48e11244', 'oAvgj0WZWAU0obc7ZCAiRZEH9m2o', NULL, '2018-03-19 18:00:12', '2018-03-19 18:00:12', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('2c90a8bdbd2e47c99df963b34f1f164f', 'oAvgj0cTU-PFbaKI_0-XaVP2AOg0', 'A-你的价值我的存在', '2018-04-10 12:54:39', '2018-04-10 12:54:41', 'https://wx.qlogo.cn/mmopen/vi_32/uZGibakBHA9d05KhhG3ukT6sx1CsibnFSHCiaZ4HaSQWJtMGfSHcC2TV82gC9saUiaQlDm2x8E3JtYBK6USIbdTmpg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('2cd53c478e1d4f5fa1c8d77a30ec5a6c', 'oAvgj0WrRR3xNYHx5kg8OTv9cbJ8', 'DODUI®', '2018-04-10 12:47:02', '2018-04-10 12:47:03', 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaELiaEZEfQQLavdpmZU95a6E7ps24rhliasUibiaYzPkicFGpeJfHBx6oMcHiaTWqYd6Fe2LsiaXNic2CIGl5g/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('2ce4164dec6f4eca852d97a26079bf2f', 'oAvgj0ZQXCua0QJK7YF8zaWyBXTM', 'rdgztest_RLMXAJ', '2018-02-09 13:05:51', '2018-02-09 13:06:05', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('2cecdaa4bebc4675be116fdf393a1155', 'oAvgj0XQ7ZEIQlWY9j40ftJGRwCQ', '清水那嫣', '2018-03-17 13:02:59', '2018-04-06 22:28:48', 'https://wx.qlogo.cn/mmopen/vi_32/a0rE2dOibJyaD4cVWkaWSIhLnd27pP4bw2dcLSicNGhyAaXexKYHZXIVNuUhp3yPiamugdZ9tlDsCfGkm2toP7r3Q/0', '13568850981', 2, 1, '1999-08-14', '清水那嫣', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('2cf48b5a3ce84d7ab4f9acdae4de760d', 'oAvgj0X4nL79NaOOsn4QlIRDa4oU', '古娜', '2018-06-01 21:17:33', '2018-06-01 21:17:40', 'https://wx.qlogo.cn/mmopen/vi_32/dMsIQycJjQXA9TJmKPJdQemqVbT5dF87Qs7vyowBLZddxzePb9GGiayz5gGIOkRjF2ZXH4j3zpLKOuJ5mddceNA/132', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('2db1b748506c436b9a1bdea9c6947dd6', 'oAvgj0SOOaB_jXMWkh4sZzCu4XzE', '张文光', '2018-03-13 17:09:38', '2018-03-23 20:47:06', 'https://wx.qlogo.cn/mmopen/vi_32/ZjS8iaWplN1ulicib56icMfOLV0FqbduRepT07ibcGKRHuXDZbH29N5ib9gz5oLEibO6bMcfia2BHrX03YKQCAgzichjDuQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('2e31e5bb1d1c411e8d4d23f2df7b219c', 'oAvgj0erxUsXTT5HwtFxprue_xAE', '成都翡翠会馆-张总', '2018-03-21 15:19:56', '2018-03-21 15:25:17', 'https://wx.qlogo.cn/mmopen/vi_32/P5JHibDsE0hEicO8Lzxyicdyz7JzpYMILt2opebtYyicWvXvPfFeKaZt8DgemSbO6zVmENSek9KDOGxspuOlkUeoyA/0', NULL, 1, 1, NULL, NULL, 1, NULL);
INSERT INTO `tb_weixin_user` VALUES ('2e91d67090de4404a5b5fa3ab2d9fe0c', 'oAvgj0V_c7j54WICrr74-obO_Fes', 'whjtufo', '2018-04-17 21:19:04', '2018-04-19 09:37:27', 'https://wx.qlogo.cn/mmopen/vi_32/jthiawFLYCOVDOT18anvkaW8EJ7gBGw3Y44A0QFIlYGXjVTX3qveA7RzA1hSajhRus2JPuYT63uq6QCfQ38vhkg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('2f292b54d4ef4771946b5692c5f58a2f', 'oAvgj0XXlXJOZi4VZJFoOdAXGwhE', 'A0拓达网络（微城小程序招商）', '2018-04-22 13:25:45', '2018-04-22 13:25:46', 'https://wx.qlogo.cn/mmopen/vi_32/3xB6zWuiaG2yh289BTqDaiaiaic2Yv2R5RErAy75aAic021srMolsb1YMvHCHcePUYicKlvrNdmvTWduxLEOEX7RibJdA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('2f4879b74a67428ba454ab2267a45113', 'ocJ4i0XGa8DEodIs-3EwFl4OKdcE', '天高云淡陈勇', '2018-06-08 11:42:35', '2018-06-10 18:37:58', 'https://wx.qlogo.cn/mmopen/vi_32/LMRTwCcpuFD0bLh0PxHHhS1b2Dhlw5ZTZvoUEcf6l33sbJoGFeyuUGHEWoPFicbxKbNFY9zMARtmWF3ygwf2fEA/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('2f65d2c54580492f8d22de084be291f5', 'oAvgj0SwFwXyRCYr0DQ6_4J888rg', '陈楠～XS能量饮料全国招商', '2018-03-13 12:45:40', '2018-03-13 12:47:19', 'https://wx.qlogo.cn/mmopen/vi_32/yfHo6FRhTxP8vCxD6NHRZZ9LbTCjwib9u13ubJibRDVkZj9X0UMmPPFSjO6sPnUGZ0H8HDcEmK4QegdhS9F3Tm5w/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('2fe46c8980794874aa799d9f19f7e3a2', 'oAvgj0Tgj9pDeUfffj5pvrVRiMU8', '米浩(达人店诚招合伙人)', '2018-04-27 16:35:41', '2018-05-18 14:04:15', 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEIdfsLjnFF6GC4NQdNpEibP4PJNzFKM9yd98zWB2bUwR8C3Vk9ibQ5euBFibRUKpO4T6lkZ9GCOSZiarQ/132', NULL, 1, 1, NULL, NULL, 1, NULL);
INSERT INTO `tb_weixin_user` VALUES ('300ca1418c0d4689bea79000c232ef4a', 'oAvgj0Tsys-21DqogbG4HUUtiVzo', '(维辛)市场部经理.杨波', '2018-03-22 11:18:22', '2018-04-15 10:39:14', 'https://wx.qlogo.cn/mmopen/vi_32/HMQoQAZ1IibXQD9P9bwicc6K6nkTeorHVsBe9YVd4GOBTQwiabV2rm2rs4m5ib70Vhk9x3LPfIHdZewCvuXiaaE64Xw/0', '15328180044', 1, 1, '1982-05-12', '杨波', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('309d2bc8d34f4fddbc7c2e183e04c85e', 'oAvgj0ZldV9Kde0l_mGEuoPKeN4g', '邢克明-充充', '2018-04-26 15:58:09', '2018-04-26 15:58:13', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epTJysoUqHnBpVSTOlgNdzJYysNLYLFhSLXrqthXNA8Cd9HZVPc8QeeWESlImtSQnO2ImSptTia2kA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('30ae6230c913401ea6ede9eb59cf2abc', 'oAvgj0Tal_PSuhRNkGoAm9J5dfpg', NULL, '2018-06-01 20:00:45', '2018-06-01 20:01:07', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('31020e46284644cda77228a9f59ab62e', 'oAvgj0SWwDCacvWioCFLMSVoxfls', '肖枫', '2018-03-09 17:33:26', '2018-03-09 17:33:30', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKzOaMIpbTBu80pibRhexVsXGtBN1J5xqerYB06IJJZpMEVr9sicI4qhkrzeThXich9UezUbqiaLJhq0g/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('314941e831a74bae9a60ba3ab4dc662e', 'oAvgj0SSpgYzVKe4C1DR185tl5mo', NULL, '2018-04-23 07:03:16', '2018-04-23 07:03:16', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('31b0b921014945a98d871b8c36ac1fa3', 'oAvgj0b4OKIUDvbotvTayWu2ntrM', '果然美水果店', '2018-03-07 10:52:12', '2018-03-07 10:52:16', 'https://wx.qlogo.cn/mmopen/vi_32/kLVtja1FHsTq5TPW5Ed3UHe4OicT9wD1qNwuca6Z7tDGkqr37v5mnt5IfWOtyvEEm6GYA4RD3WINTibsa9zM05TA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('31c402efa73841c6b11f52bd33dbb7e7', 'oAvgj0VNKuFI0WpQjOcW9nJ9vlLA', '在路上', '2018-04-22 22:21:03', '2018-04-22 22:36:00', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIUuV7icNosZxj4jWycDIOygguMBGicElGdDo5GHAWaVAznU4BiazjPVbmLPU1hEbgKYpSG2W2Ij6X7A/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('31daa714d63741a49f16cdb6f0673d36', 'oAvgj0fUXeCLn6c1jCxoccmq8lyY', NULL, '2018-06-02 16:08:00', '2018-06-02 16:08:02', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('31f0b1a80673445f81cb289bcf133c01', 'oAvgj0VkKkhMTppRSv2Ham8xkCkk', '左耳的碎钻', '2018-03-18 01:31:10', '2018-04-04 00:59:07', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoBzx7Drn9ibbxhGw4DNLaZucmDTAkfZrUicZYfUlG580oD4lMSpHTDCeA3BDpz1iag9BxPIsNPticazg/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('320fcf539363485a9707aac8a4f1deaf', 'oAvgj0eLNXlwcvB8tKWpvNa2x0iQ', '桐信商贸', '2018-04-23 11:23:08', '2018-04-23 14:22:21', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epqPg9TfITYoj7x7ALJCL6wUSx8ibwqpPvwuguY9OSSUxfNoytgYE55Vwe32l5XP5nbQksBLs9ibaXA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('321d9398f2314ad98358110bedf36e0b', 'oAvgj0cFyPvcb0lRMfpJFem5Ilos', '吉翔', '2018-03-12 11:49:07', '2018-03-12 11:49:08', 'https://wx.qlogo.cn/mmopen/vi_32/kY0SHaPHHGlD6qYG51YU8D7tuHkLxHEn10HRnKXqNup7TLNGpDg26qh1bnKiaAzZOeM8FusCC05yIMOzdoXZZgw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('32e573102ac54f12a614cbe49b28b0b9', 'oAvgj0V8dO7YrAGHftqmzkw9-ptM', '绿丘', '2018-03-17 11:43:04', '2018-03-17 11:43:08', 'https://wx.qlogo.cn/mmopen/vi_32/AukX6bJQtNKKX2k7j5HKXru4PNF8icaWYDBR8Xq3GwpBoFalEib0fGzOGhVkvOicXY89rNf05mXhiav2Ik3qwAVu6A/0', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('335b4473d73e4450bc5faa0ee0a73818', 'oAvgj0WKAGB6pMAW2cUrxu06R8qM', 'StarSky', '2018-02-28 23:15:11', '2018-05-17 13:04:59', 'https://wx.qlogo.cn/mmopen/vi_32/FEiawvASINwjMMVfVzpKiccibqGJOEUcW8AiblAqtzibDwBQtz0cCRyLaGgeRymvlDj6RACrtIKIWdZjZfDfAzN5q7A/132', '17311342479', 1, 1, '2000-09-01', '哈哈', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('33839f7f0c9c43159e87a11c2d8be20e', 'oAvgj0eBfN_NZ98lQBpWp6YPcaW4', '小雪', '2018-03-17 11:38:37', '2018-04-25 19:01:35', 'https://wx.qlogo.cn/mmopen/vi_32/rnv8IxC5jl8Gb6dmLVa54TKA6KyibHJ5goeiaCot5r0yJ2ErUnyHic6ax3QuKg7ZVZ1fcu4m91FDAeCGdib6RDXl9A/0', '17628182555', 2, 1, '1989-12-18', '黄梅', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('33ac840f2417444c93a7ece3364709ab', 'oAvgj0W4OcOtgz-q5X2xUNBrLgtw', '华誉口腔 赵晓丽', '2018-03-17 15:59:45', '2018-03-17 15:59:57', 'https://wx.qlogo.cn/mmopen/vi_32/B9ic8WG1tvFkEpF6wMCMuxnbyoNxeyQnh27ZjfArzQSAwE6zibP5q7Km6NWPuvhdveQictYnOdF3apQCIsxW2iaHFw/0', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('33d3e4ad03da41e0932ecb8429e2d743', 'oAvgj0Z9NgKAvr8m4wx1qAoOIDwk', NULL, '2018-04-27 21:01:23', '2018-04-27 21:01:23', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('344b2b31e9974f6ba0f73c434afb2603', 'oAvgj0WKwg2gbgIVMSF4gCGV89n8', '微天使-FA-CXO', '2018-05-01 20:58:23', '2018-05-01 20:58:25', 'https://wx.qlogo.cn/mmopen/vi_32/TXSWM0IwssMvT5Dp1tLTjAAawOE4NuYT4icxiaP8BOS9YN1HmWN88icgZesBqoj2GJK7B1Kk1TTBFSv2OtufcOQQw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('34596ebd69da40a693f6c22326a99c0a', 'oAvgj0fA03qt3GT9xxv3Z8xPdIAk', 'A*小程序开发制作13785108868', '2018-04-23 12:52:51', '2018-04-24 08:18:20', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJocSnc4LnYYIYcxThR7cbj0gUaJEYiazVOdXHfPNOibsSDK6icE3DOrdftb7DzGyrAE6sOXblqmcyug/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('34821c32f6dc405ab45394bf0c0ce3da', 'oAvgj0ULkxddifY5S7y2psxA9dvc', NULL, '2018-06-02 14:43:14', '2018-06-02 14:43:16', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('34a3e9292a464b69801685d531ccc87d', 'oAvgj0RVGKZdqx_i815rxsXxPv0Y', '艾汝印+支付宝+淘宝优惠券推广', '2018-04-22 20:19:34', '2018-04-26 08:11:57', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTITsZtezs3uRFjNVgtyTicwMGSOibJYyYDPNaFmBib2mwZVL0OQuGHFKEOueJ4ows3rnxlmLYxKJibUAw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('355f4c65ec6e4cb9aca8be1abe7b0d29', 'oAvgj0ciZl9mbUyq4wbxcpwAHMq0', '叶子（罗凤莲）', '2018-03-12 11:59:15', '2018-03-15 16:40:28', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ2Yh76VNBxBTuLjsos0zsVnwtXSO0kiaVZKdvaiaOFyrc7eJZiaibGSmI2KDQjVXJMWZdTEfPmewwb0A/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('3577c26ed39540e3bc64de2b143da048', 'oAvgj0SXyuMAB_2kcB2JhSaHbNxU', '阿扬', '2018-04-21 11:34:34', '2018-05-11 12:40:35', 'https://wx.qlogo.cn/mmopen/vi_32/ernzoWjczicwENzW0Anf9WQe9wiaQnwQnicSNiaibcMsflhCaiaKuib5FYK8xR7ghrpYHow0Y3UZY0uQSFKq0545Uy3Kw/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('3617bb895c0940b099b92388a1568306', 'oAvgj0Ru1k3N-AG4m9jOtlpkmGTg', '艾琳 传承CEO', '2018-03-24 11:11:20', '2018-03-24 11:11:22', 'https://wx.qlogo.cn/mmopen/vi_32/jwGOeRZ97OExueT0EZU9KSs9AULpZPAajK3ne8I4s1DCXGWu77MubeiazDWAxdYKqExRoVe4s3uibELzut89xOZA/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('36399eb49c5a4edcb4221a33d217b516', 'oAvgj0Qcgy1ixPd-u4uHuMYzB24Q', NULL, '2018-04-21 15:31:15', '2018-04-21 15:32:52', NULL, '18081348710', NULL, 1, '1988-07-22', '尧思琴', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('36cd258f53dc4d248586d79fc80da41f', 'oAvgj0bCIL8FydqlWBq08AWh2fRk', '伯爵', '2018-04-22 22:10:19', '2018-04-22 22:12:34', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83ep9WSmy8WAKzxBbtto2jia5GUiay3hYodMzWib8ic2OblJ7AZN2icJBr1SxzDNjh40hgiaCWMhLCGkudREw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('3737c7a9e05a42b5bd7b29ee1c7944b2', 'oAvgj0bTnd7Xz1CfYon7iVXnOKUo', NULL, '2018-06-01 17:47:40', '2018-06-01 17:47:42', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('37877840aad4445eaa9d54e6ab83ff0c', 'oAvgj0Qx81IIiMDZyQaZpROLJQWs', NULL, '2018-06-01 19:14:06', '2018-06-01 19:14:07', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('37940b27460e46f5bdcffc37917439c1', 'oAvgj0c4GvcjvgkOWOjoR1ekPbPg', '杨勇大茶网联合创始人', '2018-03-22 08:31:57', '2018-03-22 08:35:21', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIV2ia1uJTNnw0OpyDcMnKsxFzbKap8VNwyn4OpuiaCRmIoLMHQQGwIhJfq6HzYDp6SLYBT0F9s7aTQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('379b82479e544fefa398d05eba14eefd', 'oAvgj0UhM1h0LwVhh7BDqNa_trzo', NULL, '2018-03-17 11:04:35', '2018-03-17 11:04:35', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('37a95b95acd04e10bc321ecf243eb420', 'oAvgj0QrXnZxP1NxwMpYO6Xz4KAg', '石富强@若泓科技集团CEO', '2018-04-07 17:56:44', '2018-04-08 07:22:17', 'https://wx.qlogo.cn/mmopen/vi_32/sfMKiaHzSHkJ1aQqHhfdicSjlE8cnGibYHcybeLnKqicicQrA7MG6cTiaEVwPEicVc5EdWXdwgY8RdghM23T49KfJiclQw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('37d32d25f4af4e108ec4b333d5d5c0f0', 'oAvgj0VpfW4xza1o1Ofx7wfViRI4', '邹明洪', '2018-05-21 13:50:48', '2018-05-30 21:39:56', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIL34rMu8CX0rwibZGH0W1o38cb8NLxZVdWO7X62sNZot1lx76hlTqp1Ifn6DZia0r0XGfwicLTtD96w/132', '17729838507', 1, 1, '1983-03-02', '邹明洪', 1, NULL);
INSERT INTO `tb_weixin_user` VALUES ('388ed78932e5431b8f97b83038d1516f', 'oAvgj0RuVywmH8qS9w9kumg5yd8g', NULL, '2018-04-22 21:38:47', '2018-04-22 21:38:47', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('3995301be6c04910b56619f1f9d536c7', 'oAvgj0RTTr5LiJ5B_FeeCU_qrJ4c', NULL, '2018-06-01 17:27:09', '2018-06-01 17:27:12', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('39e70ad63d2b4eb09243d27934de8fae', 'oAvgj0S42vj9uuFJ1Qbbqo8VZ7eM', NULL, '2018-05-26 22:20:38', '2018-05-26 22:20:38', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('3a3e6b77a51f4f75857c01eebadd496d', 'oAvgj0V4IZTyNc7RyP4o-3JMx_40', '奋斗！陈政兵', '2018-03-09 14:16:46', '2018-04-24 17:05:58', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKQzDNiaumex1RlDLgru0tunYPVaLCibxjcIK0xnjEXeHibad2klR1S6ouOlgdoO1g4PGEoDA3EeHjGw/0', '18908079711', 1, 1, '1986-10-19', '陈政兵', 1, NULL);
INSERT INTO `tb_weixin_user` VALUES ('3a832b8fed604336b99214d1b75def75', 'oAvgj0bY76fYgRUgoETdLp6UbgTw', '黑金', '2018-04-23 13:03:47', '2018-04-23 13:03:51', 'https://wx.qlogo.cn/mmopen/vi_32/WPUvoSHNrXdOrZ6Emzyx1haLc0H0H77j30zcjwPib52z3PvkZASwHLuZlXDc4iakqIo0RJLxLSf52Ruz0ibzYWzHQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('3abda406dfed4e8d85deb159bcc289d3', 'oAvgj0Yn6o9H9VY0o0m42kY1u7d4', 'Neil', '2018-04-23 09:31:23', '2018-04-28 19:21:48', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIicUcshfoJoCTZAxqmbk4PKg5AVbM3RctRic5xfNxvGR652ysicKibG7BEdz9XVXR4eJPDKJNWibvHw8A/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('3b0a896ea06e419582bb7e98ef6ff339', 'oAvgj0fu3uXA9hoStxZV6iPyQOm8', '幸福', '2018-03-17 10:53:23', '2018-03-21 21:01:01', 'https://wx.qlogo.cn/mmopen/vi_32/pB8Sg3CavsQk2k8OYqQeq8GEggWqGAn66vrw2AI90Pxf3vu4ttH9ZIAXUt8pRkZgG7u3fSJwiaiaryZ13LgoBbhw/0', '18280097956', 0, 1, '1970-07-16', '张晓群:', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('3b97fb3f69bf4034ba9fc1463cc1c262', 'oAvgj0ZfQk6vEHC2z73vv1jsZhS8', 'rdgztest_LTGTWD', '2018-04-22 12:07:33', '2018-04-22 12:07:48', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('3bd7927881f048d5849d8f009335e5dd', 'oAvgj0ekyK8y9opp9tOmimmMebOM', '少东', '2018-03-10 10:34:52', '2018-03-10 10:53:45', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqs0fqxSRfs1iawjMqjfYRHT1aKicYBZRBRmzNB8b6RFjLX8xV8RFBG9YyraLZd3f6LUzOFqnhAGZBw/0', '13088356900', 1, 1, '1980-05-02', '邓少东', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('3c1d7d321df2444e8aa14feb67650e50', 'oAvgj0cbVCeaUwgFLogiDmBiMrbY', 'yellow', '2018-03-17 16:20:07', '2018-03-17 16:20:10', 'https://wx.qlogo.cn/mmopen/vi_32/rh2vpwiage7ia3IibfUlZKQibG10PkDS9DHk900x1gdCtBiaibHga8MLFGrYc59I6bBDoceA7qo7PyvnGw05dHNapPlw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('3c5acdf2879e4f8e90741c9656ebba90', 'oAvgj0X-2yIo1kpTxtqC_t9yH6gE', NULL, '2018-04-23 09:02:53', '2018-04-23 09:02:53', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('3c5ee74a190b4df1ab0bf96b98dccfb3', 'oAvgj0b6i8blQ1AgrkdPL4b_1yTA', '曹大树-52', '2018-03-08 13:12:02', '2018-03-08 13:12:04', 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEIzzyjuDxe7A75wp7BFsLjC8bFHxqSQLJqLvGZ7aibpiceV5pnBH3tDuZQ1jYgX8PZ9If038J6RlVQw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('3c728e52aadb490b8c37025d513a7fb2', 'oAvgj0SSBmmRu7JpdcUdtTd7ZNgc', NULL, '2018-04-22 22:14:59', '2018-04-22 22:14:59', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('3ca69502d5a7469aac1636c83f7156d1', 'oAvgj0Vz4QGw9l2mrxLUjo0YD_zs', '山山', '2018-04-22 22:23:10', '2018-05-01 18:58:16', 'https://wx.qlogo.cn/mmopen/vi_32/BgHpE3jibeScKXKYvZU8kgvxiaMZeh6PVwb5UWZ8wibpg4c6860xicVibbiaicialrJBtrFiaeibkeq3PEzWmraCVgatBOWg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('3da017cab6c6431faadfbf79f2364d19', 'oAvgj0UatdFFKrbrvSwpx2P2TpmI', '伟-小程序开发', '2018-05-07 16:46:48', '2018-05-19 14:11:00', 'https://wx.qlogo.cn/mmopen/vi_32/Qps8eiaZjuicGDJfWF6gfPkcThRS9y4211N7AMhiccRg87NlaDKNR9HQYmwLWz7aDAKOfNPpjyut50vcLq07sNEhA/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('3df279afe7154d7186f49c93b23302a3', 'oAvgj0VAdqxDDX4zpbO4v0K6bbIE', '1', '2018-04-22 21:18:07', '2018-04-22 21:18:08', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI6LmXrR2qRaYWOcZNdvOicfuoa0XiaiaBPMXq0mh2ibicHFXn2HR6l5OdsvH8zLXC6T1rXwEQeibyRs42g/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('3eac12b3506b4b65bbedcb79c80594f0', 'oAvgj0S4S3TpIky8m-Vb4_uy8oOw', '欣然', '2018-03-17 11:39:43', '2018-03-17 11:43:43', 'https://wx.qlogo.cn/mmopen/vi_32/j4wNEWk3P3ZxlyhUGkyDI0w62DKRh2jI7icTwziaTgp9lUEf3ZsoSXbn6UfXjibyb4hO179ABrd4fhbxic3CS1KbNg/0', '13739454770', 2, 1, '1988-11-12', '颜胜容', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('3ecd86039f86405a90ff89ad2744f24f', 'oAvgj0RVXYojCSAC1iYrSxDJrBJ0', '南嘉木。', '2018-04-14 13:24:30', '2018-04-14 18:05:21', 'https://wx.qlogo.cn/mmopen/vi_32/8MYMIAyRyAWoJZJ0Or1NITA0BibW4DS5G8Iy1GuuOakhg1uT5KVzpPR4gVCP1rWhiabzwUN6picjFmzZLFvYy1IkA/0', '17760477801', 2, 1, '1997-06-29', '袁敬', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('3f110ebc20f24699a1da1c8e7ce7f070', 'oAvgj0WDjS0fDOAV7Ke2ls5z-hd4', NULL, '2018-06-02 15:07:29', '2018-06-02 15:07:30', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('40339d9e743648e68fe6b0a302516db4', 'oAvgj0TDvb8xbrPTJhMemDETiBcs', '陈梦琳 | 蜀山·精一天使', '2018-03-05 10:40:18', '2018-03-07 10:57:39', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eo3O5bnsmeO7AgvR0ZCZksZZa8qhfsgVLLw0ich4N0IkibTeXKATka12NhpCC8KrDEYv5oTbeq5dPQg/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('40fcae33e9134deda466dd863494cc2e', 'oAvgj0SB6RQ075alezFeegzLFdnI', '独家记忆', '2018-03-19 20:58:16', '2018-04-04 00:24:22', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKvkLF6FIjLA9RMDXVhYd5vZbGrPCpicJwMic7TPAKribXu7lzJn698nlD2Q9ScPKKk7EJAnVCobtNqg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('414ebde627684b12aeff873489ce393e', 'oAvgj0ajV101gPXagF8gQCDi5eQw', '风猫', '2018-03-29 20:09:55', '2018-05-16 08:18:31', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIrVkpD3ck8XRJR7MxZ96LicG9Tq84iaKU7hgSVsNqiaEaeWN7cOJyRs5TScOiblyzL3BDicOmeibyeVdaQ/132', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('41d09e8757cb471d803cc3b15a21496a', 'oAvgj0YoBjNHuvTtHUO_9Sr8LpZQ', '白月光', '2018-04-15 21:22:06', '2018-04-26 00:38:07', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eofD96opK97Rd53yUQH7jPtbbxVfnribZecr6N3PlrZtiaPaqy3z3Rm3Ivg3wcwmgbqAnjShsZfqicBw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('421650442cfe49ed821feb35d32367f6', 'oAvgj0Q9C2M8VZIP9f5Am874NdHk', '趣纷新媒体', '2018-05-10 16:33:05', '2018-05-10 16:33:35', 'https://wx.qlogo.cn/mmopen/vi_32/pic1ibj7XibmJrCHer8TfE4iacI8WiaRibJvuSM2zkicOFXE5sNwL2LdX2RCDX6micrPqdibuOSPMMnarlND1ahCp77iadhA/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('43070f4433984e05a8b7ac20e59749ca', 'oAvgj0dX67MctIh9h9nkRUGgFvKc', NULL, '2018-03-17 16:40:25', '2018-03-17 16:40:25', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('432c2fb2a7914f4bae39d860110c7b38', 'oAvgj0WbJ5MJkryDYQ-eFYtleGZw', '你看着办', '2018-03-18 01:32:30', '2018-04-26 21:12:36', 'https://wx.qlogo.cn/mmopen/vi_32/a0rE2dOibJyaD4cVWkaWSInibbZMCZPibbMqLcly3Yf7zJSBUI7QuEpUWwlmGqR1lyOyCXUY7YgJtJBZrKPNicmTUA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('433ada832bbf42778f1fe138b6c9061d', 'oAvgj0epTMyXv_Ed2GJhgUTvZciE', '醉酒', '2018-04-22 22:28:46', '2018-04-22 22:28:48', 'https://wx.qlogo.cn/mmopen/vi_32/7N6wyk6x2GhxXInBibnBxmEibCicmwmdlqAqibsiaE02iaS1l6XdibC8rPYPSiamDuwCB3ibwdvKayESte4rSlolA02gZPA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('438280a6e1a545568ea18dd5272bb510', 'oAvgj0SEmpf8kxL67imb9Mr4r63A', NULL, '2018-06-01 20:02:22', '2018-06-01 20:02:24', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('4525b63295cf4fc89af4259377352340', 'oAvgj0cmyEOZtKJmoySfpQ-PluOw', NULL, '2018-04-14 13:23:54', '2018-04-14 13:26:08', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('4530565fd65b4bacb15dc00b5ff50974', 'oAvgj0TxZZRkOBWUWbp3r9pelo5Q', 'rdgztest_RIUOKJ', '2018-02-11 20:01:24', '2018-02-11 20:01:54', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('456cb1e6e1894d799eb4166a5e0ef6f0', 'oAvgj0ShIKOEsitaLzObFjS539L8', '杨子航|软件开发', '2018-05-23 17:01:12', '2018-05-23 17:01:40', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIqNPpdgyHLcFcPGsPia8VARtBOYHjwT8QE4OTJ3EROS7ZEZlQt8FDeVj2aPkQmoLXlSicB1eIhLlug/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('45d0fd2484eb48c3a9f30a96f52ea3c7', 'oAvgj0cbNnutOJ4oP1dEivql2kcg', '马亮', '2018-03-17 16:47:41', '2018-03-20 13:07:28', 'https://wx.qlogo.cn/mmopen/vi_32/d7LXLkX4lP368ShEfapI9Pqra3vonVKbXCtk6wCOvfFibkoaichajapdEFKkulZ7ulX2GRib2nfu4BsOVMcYnhHgw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('463c2373e6dd4aabbe51a45acdac7f65', 'oAvgj0QNATmcYiJT5oLb83SVH5j8', NULL, '2018-06-02 15:48:09', '2018-06-02 15:48:10', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('4642dc0852c8494a8e6334872941ca14', 'oAvgj0RAuvVqFYXquMtHQ7CH3FCY', '，，，', '2018-03-10 19:38:27', '2018-03-10 19:38:35', 'https://wx.qlogo.cn/mmopen/vi_32/oW1icR7PkS078XQ2Bz9DKSqEUJtusicQic79QUAaLSND52XcvuVyYdnianDLzkuKd7g96mrXG8oAEwgAjIEAxpiaHkg/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('464313f799f542c0ab632e476622c3b9', 'oAvgj0SlBsVOLEFMEdBfyqJqUtyY', 'Zz', '2018-02-25 11:49:54', '2018-06-04 21:29:02', 'https://wx.qlogo.cn/mmopen/vi_32/o3p4mv7DfNoFbk72SZia0tVBCDCXe1f6j1FvEUaJVicqzWuRSTLpg69qeAQvBqFpjqGKvcRLAmJxIicc4LAmI2OMQ/132', '15184486180', 1, 1, '2017-09-01', '张何平', 1, NULL);
INSERT INTO `tb_weixin_user` VALUES ('464435dd407f4561847213c0bd9e3092', 'oAvgj0UmbTxs4xSifp8DN5YLcxUs', NULL, '2018-06-01 17:25:48', '2018-06-01 17:25:59', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('466726f42ca04cd09d38c3a7cb79664f', 'oAvgj0UnroA-PVui5wVyRqERBeEc', '有梦为马，随处可栖', '2018-04-22 22:01:36', '2018-04-22 23:30:22', 'https://wx.qlogo.cn/mmopen/vi_32/7icYslR11jBZXicmdHMzwTNoNibIa7dVbeZQ9oPnF9HGkia2bfpTPkHDQODBeZayLIoeicbZwEAUOnu5vOJGRpNlL8A/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('472c3caa17ab4309a8591d5ce6263524', 'oAvgj0fICWtHHexr0wVig1EpAbns', '邓如斌(咏洁洗衣液)', '2018-04-09 20:43:50', '2018-04-10 17:57:03', 'https://wx.qlogo.cn/mmopen/vi_32/q5bEiaAeUgBB6Xg7AH5YSV768VkwOj53vfYN8AAJRloUXIvA4xiaLCohEwl6f9RcGJ2UNGrJuhoEfrFL8ENZlCVg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('47498a74faa2424b9a4f1c881f97de7f', 'oAvgj0YlZ3raEDvROEupA195WRjI', '白鑫13766524678', '2018-04-23 08:32:32', '2018-04-23 08:32:33', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIHVJWerjRqtYU4puV7OSG14QuLMUxvS6k9UdcsPyXnlDqAohSMRic1BErYcZw2s1oolm9iaiaEib4meA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('47a873ec52ce4ef7a1efe3a110670cfc', 'oAvgj0Vk6PT6heXsGvGSIgxxmWXI', '浩灿', '2018-04-22 11:53:30', '2018-05-03 21:09:37', 'https://wx.qlogo.cn/mmopen/vi_32/NpC4KLpNOrJQ31BJziblA83FCYibiaa0Cf3NcVyAdVujYwzDkIfHQbeJWoxLiaQia2SCRG4ULgQaIkj8CTVcqdTvfXQ/0', '13880992840', 1, 1, '1984-09-13', '范昊', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('4839dfee72b4427196deae8276e1184c', 'oAvgj0a2qHr3G5cduynZnz3Y05bM', NULL, '2018-03-22 08:28:36', '2018-03-22 08:28:36', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('485a787da28541a49a0f6cd5b407b356', 'oAvgj0XC22p9dSZo0ovnhe3uukg8', '如果哆啦A梦学会七十二变', '2018-03-05 21:28:34', '2018-04-14 14:58:30', 'https://wx.qlogo.cn/mmopen/vi_32/dNFNfyIGNFkylC738WCCEwGgBrfHM0mT26TCKRhMTyf32Xvzh1kauIPmExJMYR9hC9eQ0PAdshsUcGK3Rrfrkg/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('485fb4e0d2f04cf2a007f6d79aa7840a', 'oAvgj0UxO9PxzHoCPzN1nGWnuW3U', '珊', '2018-04-14 14:15:00', '2018-04-18 07:51:13', 'https://wx.qlogo.cn/mmopen/vi_32/ffuhpBJWUsBLFlx77A6qbuyS3u2Wzx8iatdN5qNfT369vI4Y648LXY64WYYxlicJJDgyExeoxM0cusBzP4ibo5NMQ/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('48aaad99f68447a2bb1bed62459e3806', 'oAvgj0ewtZI6_ZINudMgRBW9MfaI', '苏晓亮｜三味天下邻里团', '2018-04-19 15:42:41', '2018-04-24 13:12:10', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIqNNJJc9yicL3oFlfo70Cia2CYMGRDibmVW7zAufVKRuIAUJyia0ZO4mP78A3A6P6QN8wF34Le6HQBvw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('48f07ddc985e4b75aac8fe1bf5746b24', 'oAvgj0Rwzy3AQPQc0P2MrL5bi8lw', '麟钧', '2018-03-06 15:26:29', '2018-03-08 16:51:38', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIv0SpUmy3PuibT9C42pQibjmQ4JZiaVwb16MmIbGmj1QNjdicwkub9Qq2Yx1Wwf2vxic796YLITUFF7UQ/0', '15881026587', 1, 1, '1987-01-14', '曾麟钧', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('49229f10fb174138a86c9d594159d07b', 'oAvgj0YFEWE4THJZO6LC-nxbkvuE', NULL, '2018-06-01 17:14:22', '2018-06-01 17:14:24', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('4937ee32599f4dfab0f6972466f67320', 'oAvgj0QDlRdv0G0kWui3phUZGP7k', '五行缺福$取名：张添福', '2018-03-26 11:08:20', '2018-03-26 11:11:06', 'https://wx.qlogo.cn/mmopen/vi_32/KmhxLY0mogabkGCKbdibP7DJ8NfVxmwz7O1WyH1JeQTJNV37uQLEqI4vh9ylKt3Dmgmuwb9jmfuiaCLicll6Yebfw/0', '13882007681', 1, 1, '1993-10-29', '张翔', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('49434c09b0f8425ea711c4e09fe210fa', 'oAvgj0aSs4IrNKda7qJEuOSiejCQ', 'hihihihi', '2018-05-16 14:46:39', '2018-05-16 14:46:41', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIkMt27C2AF1sPSn2qbA7mWeATribmhgicrJmltiapEXHXTSURm9rb95jXpAXIibzsxAqWfibdjnicMibv7g/132', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('4957c5f6058e4873bfcf9d0bcb66671e', 'oAvgj0WiNsHJUkQc1T7PGkmYG-NY', '曾蓉', '2018-03-17 13:06:10', '2018-03-17 13:06:16', 'https://wx.qlogo.cn/mmopen/vi_32/ULHCcr3hhV62LJ7n3XE3zBxTEGgCXokcXQKDlZiauZYG0XkQBKR22O81Ygs4keNMicRyvWrepU7V2fkx6B7694TQ/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('49d5e989d46440ae8dd5976300eed1cb', 'oAvgj0YIx0cE23uXprNne5-PDpZE', '丽丽', '2018-04-22 22:29:21', '2018-04-22 22:29:23', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLtQ9iaVtLyE9EiaTEzqNQNuicJ2T5E3Fn5WialSy1iczkP9HIzA3HuTcSLMI2YYBoHKeoHFlCj6LEaiaUg/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('49e04a5d6b464bf2b531b9f97e88481b', 'oAvgj0X04pnWgtOhy4bNDEX4GbCY', '无', '2018-04-23 06:30:27', '2018-04-23 06:30:30', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL06DePazHRUicMFENT7ibA98YdbGtGLOgh1ohlTmgWXdzY8vDvR4P2JalericMR7IMwED9w5Q1aRkQA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('4a4f901997774f9d923d76b8210e1be7', 'oAvgj0UGQ7lijEPc_R6G_kNBZ9XY', '宸宇', '2018-04-21 10:50:11', '2018-04-21 10:50:22', 'https://wx.qlogo.cn/mmopen/vi_32/sIkhsZCcqkaJAUHF8S5dZ9geMLtwZ2cVGiceg19P2MCbl8Og3jOaPoQ1ic46aHGGia9CQzdh16C4fJF3AiaGzvPd0w/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('4a583131af6d476e85b69c17858f7804', 'oAvgj0S5jiJdF6pQBQnqjfEAyHxc', 'well-being', '2018-03-15 20:19:41', '2018-04-15 19:09:35', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK9FODy9sBaXg5gxANY8JaicibeZytDTU2MYyS15Wa9JQ0Vt7T2uEYsZLLCjKydVEc2Kgo5S1YOiaa7w/0', '13880893685', 2, 1, '1980-08-14', '田莉', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('4a5d17be9d594e4d8db00af6a5da87f9', 'oAvgj0dqoFDOKQUz8UW5e93qhyVQ', NULL, '2018-04-11 08:54:04', '2018-04-11 08:54:04', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('4a6ea97a5eb84af9990d8cc23f1083d0', 'oAvgj0fE3cgtcbezOmmvDS7h7Peo', 'The丶Crystal', '2018-03-17 11:39:34', '2018-03-17 16:23:59', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJKkThulMFj6H7icu1MOkVAPzGCcnCShb0dHJH2icdCzbk02rTib4toiaOyFiaDL75KOEVicGzHRc2SCAKA/0', '13971391816', 2, 1, '1990-05-03', '秦凡', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('4a879966381a4b449600b9ac48c44476', 'oAvgj0aZo1C6gzvSKzCQ5sH6cRe0', '想？！', '2018-03-17 13:03:21', '2018-03-18 11:02:12', 'https://wx.qlogo.cn/mmopen/vi_32/9lXZIKuz8crygaBzh0bjZz9pC3CofvibZeibwfhg2qBb5j5K6ibjjjFWibwWrkWN0DVVx6JYaleMse7Pjc2NWZLjuw/0', '18281603320', 1, 1, '1996-02-27', '张家明', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('4a936c3ecb774c428033f633762056b2', 'oAvgj0W89wKidQ-HE-sD3W-Vbmz8', '雲。', '2018-05-14 15:18:08', '2018-05-14 15:18:15', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIbGacLqibnBtFUdus5MNjNNiboCFLdwvicTibUyAPMkLc9AQzQHsgJibkaTYuAUHPTEf535cib1J9qyAVw/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('4ab5ffc60c22414cb8b231dfdff4b148', 'oAvgj0QOaPmn_NjRVdAaNAENmRb8', '执着守望', '2018-05-09 15:51:24', '2018-05-09 15:51:50', 'https://wx.qlogo.cn/mmopen/vi_32/7g6icshVrInJ6aSP1jLXp3uR4PG1GjMCg9w5bUP11E0DXYUNS5ePf0H3hOYzdoIs2LnxMIZrXqHoszEXETH5ibkA/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('4b15d4dbb20248f3a120b9e605764dc5', 'oAvgj0X3vCW43O1uuyN-dW8TFkoY', '青柳', '2018-04-22 22:29:14', '2018-04-22 22:30:45', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKVkoe7Viae4lgnbFMYAJOt33tZ2uwWMgXGZ5t3kia2icSammic0pNH5S8BMNXIQh2y8KPnmic2ZPxUiaKg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('4b54f49e1c2143c8a81645f699147e39', 'oAvgj0VrES_yjSoxk9wnp_MprRNU', '旅友', '2018-03-27 16:43:07', '2018-03-27 16:43:24', 'https://wx.qlogo.cn/mmopen/vi_32/qIUFUHPUSxkXJSh9djhJN8mSc7WgQibHoKruGxGKM6YfZPiaMq0BHJLQhyIdSURebGclYIicLRk8EZQC60MZCkHMw/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('4b6578bf82f2499aaaad07c37bfc935d', 'oAvgj0alEAM-Fzgr-umlnFgP-cJc', '刘国龙', '2018-03-02 10:45:21', '2018-04-21 15:57:00', 'https://wx.qlogo.cn/mmopen/vi_32/CesYANaaKic4aGibRz8gW8dwo1ONKrAvbmAdfpauZ8UctLerkYaC70AzW5003UtGYVacpX8n4d0jib93UibEZyRZSQ/0', '13198555551', 1, 1, '1976-07-03', '刘国龙', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('4bc0c1b92e614892b34cc7b054e29146', 'oAvgj0b3E3-EikDG1okwF7-ivsGo', '梁群', '2018-06-01 17:59:03', '2018-06-02 12:46:46', 'https://wx.qlogo.cn/mmopen/vi_32/vbpqlc83AmQNMvrtZL3nkDJO32d0BoMDkVpMHNMIjo19GkzwOeSjiaH4ZNxysN7nvicgucXOgy8s35JYYTMdVP4w/132', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('4c241736eda546b58a1c243ed68fd1b6', 'oAvgj0VwrBJUrqfgbVLyragvhAPc', '罗筱惠', '2018-05-14 11:57:59', '2018-05-14 11:58:02', 'https://wx.qlogo.cn/mmopen/vi_32/T1jFPud82LqzontJqeZjyRD1xgCicEOgPibDqs9fdTgPvGeIFTUbMH3u0WTNTQhgBy3FMeZoopJAm4dT5Y5OPIqw/132', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('4c362f5967b242ca96b11bba5b096b18', 'oAvgj0fjisce2vggJUMVR-vILPjo', 'rdgztest_RSMVWX', '2018-04-13 15:56:03', '2018-04-13 15:56:24', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('4c754eb0c80d4f5187c3e1835337e2bf', 'oAvgj0YsRF5WyI1S5UiUlxhiSWcU', '知足常乐', '2018-03-19 08:39:59', '2018-04-02 17:56:48', 'https://wx.qlogo.cn/mmopen/vi_32/C2YkHZ7jBgWySPZIbDMfHAy59bKxKcblKTCzCHUFvfyZic4qgr6eB7X2ic9tJnXHXDHp2ayhCIk4cEIxFwLFtwIQ/0', NULL, 1, 1, NULL, NULL, 1, NULL);
INSERT INTO `tb_weixin_user` VALUES ('4cf4c456877d4d68a7750dea2d6a32da', 'oAvgj0cASwYzhRvlwN44JRw5DEV0', '小乳鸽', '2018-04-26 19:32:27', '2018-04-26 19:32:35', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIkMt27C2AF1p0ZNnOsEwCgJ33626c8Fz9mEFRVFyiad13SGDz7AegPYsregZXHpib8keBDibV6IoxiaQ/0', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('4d448e4c176b4a46a34bd42877a9ce91', 'oAvgj0RDhmQNPvinhir22BHM1kuA', '希望的田野', '2018-04-22 22:38:04', '2018-04-22 23:31:04', 'https://wx.qlogo.cn/mmopen/vi_32/N2tP8qsKAny0fJhQqNZI8RBnVhbdNvcWIICBT1gQh4XNbxhfkzOmVSicPM9ia8wNC3PHHmNLTEqa34acxnD9eUVw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('4d765e861c814e26b983dd5948689b2b', 'oAvgj0WOZeLZTB0pFHG4zzPkVzco', NULL, '2018-06-02 14:17:48', '2018-06-02 14:17:51', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('4d80c848c92d479ab1b05c9f24021509', 'oAvgj0SQ03Or-wX_OI28x1mpgERc', '活得快乐就好', '2018-03-05 20:03:21', '2018-03-06 12:50:16', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKlcP4H5IJmEgEibibeC9dKrPiceebicZ5r5MubyOq3YGOOYgzSiat8zkrSQpLTzxg2yrBiaWdj3icslV6bQ/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('4dd30e177e4341b3864c742782e6020e', 'oAvgj0Vm2wz22smKRErxpxhRsiBQ', NULL, '2018-06-01 19:56:45', '2018-06-01 19:56:46', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('4e5b8645dc934a97847d0ba48e03ea5d', 'oAvgj0aA8qHAuXZ2swxcnsuULIIc', NULL, '2018-03-18 00:16:52', '2018-03-18 00:16:52', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('4f169cbbc6664d61bc25b82e334f5295', 'oAvgj0U-TTj8sOyTUpnadl86OcYo', '安然。', '2018-03-12 16:25:42', '2018-03-12 16:27:06', 'https://wx.qlogo.cn/mmopen/vi_32/IFz6YE4DGKuuP0e51OpqmetlAyZstrqDK3JYdQPwQY2Eiah4sDvYAoGGMT3RkVzmeJGluWdFsGg6a9NibUfTKg5Q/0', '15828240728', 2, 1, '1995-08-16', '贾秋琳', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('4f2bf9c467bb4c7cb533a3b2d42ec60f', 'oAvgj0ZL4Zp6uKYPa6wdYZ3zyoaQ', NULL, '2018-04-22 22:50:45', '2018-04-22 22:50:45', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('4f32708830a041088a458c2fdf822eb6', 'oAvgj0TaCLqWMH3vk51E32_UHzUs', '饶龚丽', '2018-03-13 16:37:12', '2018-03-20 14:28:53', 'https://wx.qlogo.cn/mmopen/vi_32/FzJbZY30krADfh8QzIk0roQXzp6DicAZJibueT8yAN0vzHg8upD5UlIA1tHW8pWN15t1I5icFRRIKdfkwjsKSmWhw/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('50732649309444bb9c39ade980813234', 'oAvgj0TMJinL8u89zMmbvJgi2BZ4', NULL, '2018-06-01 17:08:52', '2018-06-01 17:08:53', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('5087ac941cce4f1abf110f1638049996', 'oAvgj0RF2mOJ47vKX5b6htUrM0fg', '丰国', '2018-05-22 21:51:59', '2018-06-02 13:44:20', 'https://wx.qlogo.cn/mmopen/vi_32/zoWMv6BPalF2dc0nz9QdOBOg166Mruq2OdrGGagSStm9RicM8ewu6kXLiaBNUmhhoCppuvUkC3yKP92BuDj1BMcA/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('509b5a7320614557845a00ad7d5d1334', 'oAvgj0QZoqAUuopvTzT3G8Gi8h88', 'A王凡', '2018-03-10 14:45:45', '2018-03-14 18:03:16', 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaELJq21ZTZdafrtrzvTd9wSzuzNGZ5JbiaEts8QyZiakLQ4wdIXW9DA6ib1Tb19jYjtR2iatZBq9s2bZnQ/0', '15555557992', 1, 1, '2017-09-01', '王凡', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('5242d1e8043d4c909f0c49257988bc15', 'oAvgj0Umtb0mS5QmhWwLEvCL2eHY', '云姐', '2018-06-01 19:52:41', '2018-06-01 20:54:45', 'https://wx.qlogo.cn/mmopen/vi_32/0ec39nOXqtr8j6nxyMRNsbk7tfZBHe5djAYDLS5LYRiaeUBtx1FjnyrUEqhCYyQPe4qQ3BicAaoNtQMHfLYPj82A/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('52678846c335451faa06321d7984e2f2', 'oAvgj0RPIuQwjgRGuB7TilYAy4Nk', '天道酬勤', '2018-04-22 20:26:33', '2018-05-10 10:58:04', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL2FKAN01j3U2CxpasvpDpibCVPcPvqp9a4suv0rNvW7riagTLs5DCeLBf4rRHD3biazdXGeddquLenA/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('52c5601104a64a9f9f0181713413eee2', 'oAvgj0TBen7KlQMr5IrGo2NVB4e0', '黄玉振', '2018-05-19 10:55:26', '2018-05-19 10:55:30', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epPU6RSBhdOdia38ecTmJ2K1k5jMaib3KAVQQYHx8PUhOj6gee5EQfrDynQEzKAoDnv3C0x8f98tqrA/132', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('52e25ea28a394abba59b96e107d1aabe', 'oAvgj0fk3_W5lvbe3VYpI1EUGV04', NULL, '2018-06-01 18:06:05', '2018-06-01 18:06:06', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('5314734fdbbf484e83e389916f671744', 'oAvgj0aK0qdEGd66KcJNr5H4VvkM', NULL, '2018-05-21 12:15:42', '2018-05-21 12:15:42', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('53c929a0a7ec4038bd242940616411a2', 'oAvgj0UQXABYdAkaDHSNnLeih-mE', '欣欣奶奶', '2018-03-17 11:38:33', '2018-03-17 11:38:44', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoq3thmgshEcHhF1y92uRFOP5Bodibzj0RSsBpDLcDLZOjDsibRYt6PQwEydia5fh1d8IicdS7B9K5c8Q/0', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('53fe820f6def4377b7a2d3a6e6e3535e', 'oAvgj0fyYbFUkGYF1gfCEg2Xf0rw', NULL, '2018-03-18 08:10:04', '2018-03-18 08:10:04', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('54638f4a54684c7a828fa89c1d55062f', 'oAvgj0c02sWOq2dvQ5qwJUmlnNUg', '阿甘·优策营销', '2018-03-12 18:52:27', '2018-03-20 17:24:07', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJG9pst9e2qJvw7Cg4ngvOKtwZ5icghrcKltmg8vJMQor3s02JlOk1rP7d7vDicdC4nXuQtKFF4hl9w/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('5495a03cbcc74b648ec3113de8e2153c', 'oAvgj0Tege0Z25E9_ArTIHGKNljM', 'rdgztest_ZFHVAL', '2018-03-15 02:25:33', '2018-03-15 02:25:49', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('5497fa0a62354642878c8baba9940c37', 'oAvgj0ZTI5ZqePPH9HsPvTwP8-q8', '以心换心', '2018-03-17 10:50:10', '2018-04-18 19:25:48', 'https://wx.qlogo.cn/mmopen/vi_32/OWAficqlGia7IkpavxkvCODiadv8EUpmg40F9RzicE7FubE0Cd2Zq9aXbLk7fWPnibWQYZJRBs0LRzibzwT2zCibFbd1w/0', '18108225646', 0, 1, '1990-06-14', '李茜', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('549b9560b47242ad834eda7602775432', 'oAvgj0ZjAbQVN0y4xnzuvY-dZL04', 'huangmingfang', '2018-05-15 00:04:42', '2018-05-15 00:04:45', 'https://wx.qlogo.cn/mmopen/vi_32/LUIkwvYClGnrxibqxA0o7osfptBXYos2tWJjOPGgaupKllnopia3NibG6pFYJyJicR962oJsKxeP7QLK6pnuYbWFibQ/132', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('5539609e661d4680bfd8050509a7c032', 'oAvgj0dzNSJlkN52Bi-8XZa77NSE', NULL, '2018-03-17 13:15:30', '2018-03-17 13:15:30', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('5742e5c14b9e4c25854d52940bcb85b1', 'oAvgj0VsWetxxr7poSvs-dus7YCU', 'rdgztest_QHMZQS', '2018-04-13 17:16:11', '2018-04-14 08:23:31', '', NULL, 0, 2, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('57616ee0e8b9430ba86a05a6ac108716', 'oAvgj0Zhb7dV3xGef7GtQAV7JtoY', '冉冉冉冉冉冉冉冉', '2018-05-11 14:00:49', '2018-05-11 14:00:50', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eow7vbTHIzdD2ZW9JZusrZ7Ahhopoiah5IDWsjrXPIVQvxQtMG4THOiceOQrd7n5Am5pibicJYYibC7ecw/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('57e396ded58f451e879843f3a255aefa', 'oAvgj0XbTEugjxZu-PLl0p5sQRng', '鳕鱼', '2018-04-14 13:23:52', '2018-04-14 13:26:53', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ64qwqnoYmSMtNQRKJYagiaibDFLlgvQMbibRkHVPnapI1ky3QnorGZ50h14knd6SThCMC6b5A2PUicA/0', '18200398263', 2, 1, '1994-04-02', '赵雪宇', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('58856ecf3479464da74e5d9db5def396', 'oAvgj0Za1u1jvPfX9D3IDV4ANtwA', '成都亲子游览年票许明', '2018-03-16 22:37:10', '2018-03-23 20:47:20', 'https://wx.qlogo.cn/mmopen/vi_32/72M4Btn4p1Mka2lsE8TwrdBwYcruH7sj3lvyiaSeNM4w9pfo391KTyBoKWaz3TqYabDibFYkFaWonrHiafd7rdNibg/0', NULL, 2, 1, NULL, NULL, 47, NULL);
INSERT INTO `tb_weixin_user` VALUES ('589085b7244d43b6b8592238dbbc4efb', 'oAvgj0RcdyjSwvbon23iTV-_-E2s', NULL, '2018-04-22 23:26:19', '2018-04-22 23:26:19', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('591da5af77564e12a84a05df99b3fef3', 'oAvgj0fXZz3T85Sa62GRa0icNKRs', '646947544。', '2018-03-17 13:03:15', '2018-03-17 13:04:51', 'https://wx.qlogo.cn/mmopen/vi_32/XJTlGosqnLz3GF5cZXxrOdEKYmDBiclqRzLl39gCTOef2TmjjpExOHiclehCJ2uIQQe6Ou00prMkPSBfk0rJicv2g/0', '18380459058', 2, 1, '1993-06-15', '郑世兰', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('596045655037400981fd7ef494373dd8', 'oAvgj0fYQLkFPmoGxqInXV2n-7FA', '云中影', '2018-05-05 10:29:03', '2018-05-05 10:29:04', 'https://wx.qlogo.cn/mmopen/vi_32/E1H0dtJ9mJnO0Zbpiaaf2kakYFQs1YKx4xiay8122N4SBichAr0nPqVOcSgvgU7ICywQuEBYZicU8eCOAAlbB6KRjA/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('5983a54789ca4a58946cbb257ac3cf55', 'oAvgj0U1xmmPZXrQ-YF_gQKaBKao', '老魏', '2018-04-23 09:02:41', '2018-04-23 09:02:44', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83ermcibfQBYDbibv5IhsphxnuvaG3BtxicqFoF8c65hLe664HAPwftX4icDCM7I7sK9pFz8RVjPBfYxjOg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('59eb1dc132484516882988569da2b044', 'oAvgj0RJ4PEQ9LKmgAYAzsNsQzLY', '如风', '2018-04-18 09:28:57', '2018-04-18 09:28:58', 'https://wx.qlogo.cn/mmopen/vi_32/mcwuUzkL4A4iaauzlbmjbmoobLeL7gA5xzYD2JMgiaMga0uUYibf2gCJAFu2HllaTKTJTV0geDRffHU27t5IiczObQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('5a2d17c94aef4a9d82aa859d768369d9', 'oAvgj0Q87SIPJtyiAsnKZJcKpVr0', NULL, '2018-06-02 15:48:18', '2018-06-02 15:48:19', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('5a84fe9e5ae147b28c42901bb6d2bc87', 'oAvgj0cVsmKCYvLEoiGm-OwM08v4', '旗山健康工作室余勇智', '2018-04-14 13:23:55', '2018-04-14 13:34:34', 'https://wx.qlogo.cn/mmopen/vi_32/Jzj3lcr36UkV0ibK9hjAdrZswTBpcTOBYAs24YPJCsadociajZ4iaR7K8yGlrek2bThIOw8bVofibh45W9Da2xz3FQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('5a858ca5817e43a6b528df4aa9167a99', 'oAvgj0b6Qlbck6PZoplhI0fcAa54', NULL, '2018-06-01 20:01:15', '2018-06-01 20:01:35', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('5ac66973e0fa4bd3895f9203b12b4308', 'oAvgj0WMSyy2RdIS8YVwQaSGVeAU', '刘锡振', '2018-04-23 09:31:22', '2018-04-23 09:33:55', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKibqX2nPhYJDXaXyKDuPO1hdbMUyp8BJShqOsuvbucQC7DNLEsNDxbMlzvdM5PZeScSoLrkkwAtHg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('5af665c449634f958fda2652bdf70b4f', 'oAvgj0RmQRsA2iyUf7q2gmI0xjB4', NULL, '2018-03-17 12:17:50', '2018-03-17 12:17:50', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('5b25d4ba255d465d9aa2d259a83c69f7', 'oAvgj0ZHLeqHYvMzuonLEQCuFJJA', NULL, '2018-05-17 21:17:26', '2018-05-17 21:17:26', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('5b9cc812f0ee4a35b48706a2f6ea43e1', 'oAvgj0fHw9CyCFE0Wm8aK3HlNZYM', 'rdgztest_BVILHU', '2018-03-07 14:48:53', '2018-04-12 09:13:55', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('5bec9c025fbc4148976c1a41f1549b81', 'oAvgj0Q6Ni1-qTbOuwzoJWARJVK8', '魂', '2018-03-05 19:43:08', '2018-04-21 12:45:14', 'https://wx.qlogo.cn/mmopen/vi_32/HxU1iczfOMx1d3x7CFiaXLZX4sugwaicpy0h25xpuxBiaQoeFGVa9gmXWbsVN1Wrz2FS21hMGOhiaeFP0nGXZBzya2Q/0', '13699086994', 1, 1, '1992-05-17', '罗凤雏', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('5c178cadb2ae4a8a9dffab08e7adf957', 'oAvgj0WjfoNrY6jLL5BJQRUrPBvk', NULL, '2018-03-06 20:28:23', '2018-03-06 20:28:23', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('5c661389785943849b1860b25e864030', 'oAvgj0QWceei6RbEcUXmJfCzgV24', NULL, '2018-03-08 13:11:44', '2018-03-08 13:11:44', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('5c8934edb5674791964098dcf46a9b44', 'oAvgj0VkYbYw-KBtHq_O6uAMBJBI', '王倩', '2018-03-17 11:42:26', '2018-03-17 11:51:40', 'https://wx.qlogo.cn/mmopen/vi_32/bLsicA8iacAFYQJeJoFhSfXp88TDgV59ld9wkpxufMTC1uFCKmK59y6lEsxdpOLrayHIBnyoJib5VNdWHAmE6Gpcw/0', '13398197555', 0, 1, '1990-02-15', '王倩', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('5cc40b9c00ad4184a1290c5248f3048d', 'oAvgj0ZOkrlGzWCp-KRnZ7KeAaaU', '归隐居士', '2018-05-10 19:57:59', '2018-05-10 20:03:53', 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEIsWWN9JFia1kHHibhdsf8lAoDpcf5kwdVarPQicLUl8xD0mkB5VMVwSZpibDSf40oBibxcRmFE8fvt8Ig/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('5d2715eb5c4a4491bdded288959a1ba7', 'oAvgj0R8tvP5m96lzkKLRoya8Bso', '高振华', '2018-04-23 10:05:27', '2018-04-27 21:45:58', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epPGVickwMaJjdFvVIGBM7D1B9iaqheZmNSx29chUJBZ6p66iaEZyCWlfBprkwBMiawVU3yvwOFkwMkFA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('5d6dfae71321429ea0fda4e3607e6a4a', 'oAvgj0RDDyKJB-BNG2XWklrKhuJ4', '调皮小胖子', '2018-04-14 13:48:05', '2018-04-23 17:23:02', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJJctd6BYic16YFRwJEmibMNURuKIKA2BjFxvU4CTUcFTh0dmKxvgRhBooqSGnmIKUcWat1P2yXmLGA/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('5e2be661ad56459a8cba6b7a81d6764b', 'oAvgj0YXM4_UFfWBWTn7G2FrA0J4', 'My king', '2018-04-14 15:32:41', '2018-04-15 15:37:39', 'https://wx.qlogo.cn/mmopen/vi_32/08I6Anic0biaibdDfanzmD1IjPc2m9dGQnxC811kc5jict65LLpT9LnAr2qzncGAzWbfv3oe0cO41e9Q2CvgUrGOkg/0', '18016196421', 1, 1, '1999-09-01', '周大林', 1, NULL);
INSERT INTO `tb_weixin_user` VALUES ('5e4bd28ab712455aacef1eb0d68458fd', 'oAvgj0cqSCW8xnhhOuUOhC4dn3to', NULL, '2018-06-01 18:33:29', '2018-06-01 18:33:46', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('5f1f24ca1c7443ce83ecc266a6777508', 'oAvgj0ZLGuPKSuFyaFrxsVHSPOrE', NULL, '2018-06-01 18:08:18', '2018-06-01 18:08:20', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('5fe091b0075b497ea8d710f27d3b7ef4', 'oAvgj0XFNaA_hOIVi_xakru8bSmU', '你的名字，我的心事', '2018-03-11 08:52:20', '2018-03-12 09:07:03', 'https://wx.qlogo.cn/mmopen/vi_32/53tPBGnrKAucLicq22jSDZU6nhe6I7XDOibGsVuDjhMzic2mocOnkrOj2rXk6cib9w1JKmngowtJ2M6CZbSB1LA7iaA/0', '18398601503', 2, 1, '1993-09-26', '樊韵婕', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('604d6d263a144986a5cf84befdf62791', 'oAvgj0XfUptvJEr_ivCqAr3HESiY', NULL, '2018-05-18 11:37:35', '2018-05-18 11:37:35', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('60f9f6475ef74c89bff0af0c5a294e9d', 'oAvgj0cHrwcsH1KZ0QWfasdQLyTs', NULL, '2018-03-17 12:02:22', '2018-03-17 12:02:22', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('613f92e4ed6e451bb00a2d361e751bc7', 'oAvgj0U0oysgHLbgeRrHBwpRMsmE', '墨夜。', '2018-03-07 09:54:33', '2018-04-15 07:51:31', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erSjHibuh4T5SNpEuJ47zJnoLjN9z7O9VPMfXCF6dvGR3tNQh5zRB3iblCZXOxndunok0CDhQmBabpQ/0', '15520813162', 1, 1, '1996-09-22', '吴宏强', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('6143dfe6d7c448ac90b7b05791b59830', 'oAvgj0f5T_2YYKBJoAr6rFWyKI6g', '阿陶', '2018-04-21 17:30:12', '2018-04-21 17:30:13', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKuLYSa88sXr0GgrEUy94lauvHwljyHHhaQb7icjgNibDxGzmTs6TnO0daPkMib6tOfBE0Wsycy5eREg/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('61b8773454464f2c966dbcc46d1f45d8', 'oAvgj0XGEdozd-ssQL0RV_xUB-B8', NULL, '2018-03-05 20:58:08', '2018-03-05 20:58:08', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('61df8b0925164d3c8ab6e2c33c7bcf4d', 'oAvgj0ecKYlEknygqEITiOCmVEOo', '云才亮', '2018-04-22 22:58:58', '2018-04-22 22:59:06', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL6EicLXHeU06fLqTCeZTp1picWAAaickl60NHMn4ItSKWlDZEVocFZ0hP23vDUxvffVtzNnUMjD2IkQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('6204fa1811d74fa993e1fceb8bd8e602', 'oAvgj0TIQUXlYlrNRrUcSx3OFFcw', '晴 & O蕲客艾灸', '2018-03-15 19:29:14', '2018-04-17 16:45:31', 'https://wx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLAeGYj6yOUIBoKeMTic348Oh5MwHVgorhwSibbC6bIJ2S1z0D7U1jjGfaA8de4CBgGria7tzVLuAZDjw/0', '18030500808', 2, 1, '1982-09-01', '刘', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('6213225a083a421291690c3255a1c12c', 'oAvgj0TKRipH4W1lPDOQmRoXViuQ', NULL, '2018-04-14 18:45:32', '2018-04-14 18:45:32', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('6271d10e235341feac2e64abe151bed9', 'oAvgj0ZHuc-lcb7mK5TRd6xOEb0A', '白开水', '2018-02-28 16:32:22', '2018-06-04 16:43:54', 'https://wx.qlogo.cn/mmopen/vi_32/ffuhpBJWUsBLFlx77A6qbuOzGibiaRArokhJTAyk3wE6euZTUiaYzDN2UVyNTMhdfjuZod3hyuYehVGFNpOXAqFMg/132', '13708135289', 2, 1, '1982-08-23', '白开水', 88, NULL);
INSERT INTO `tb_weixin_user` VALUES ('62cd837700a54474b10978921f796e38', 'oAvgj0aS6XUdea_TeBQnAUXsP8D8', NULL, '2018-05-20 05:08:21', '2018-05-20 05:08:21', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('6300e9d53f5a44909f90ede5596c1aae', 'oAvgj0ZT98UfAa_BWRnRR1YPKxbU', 'Chanson', '2018-04-23 08:12:15', '2018-04-23 08:43:31', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTITDZ7CMk2ibZjreag9RyG2zibmj1ak7sJLJZjuX2ZfSPd0stpmjYuevic91jld1yjsZiaMsCAjfMk9Cw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('63cc982f532e44ecba23ba122aa81661', 'oAvgj0ad1NfcAETAUeHsniYpoCKA', '刘世中，杰克', '2018-04-14 13:24:00', '2018-04-14 13:55:00', 'https://wx.qlogo.cn/mmopen/vi_32/SwicN4N3srYYiaOHKesiauVjl9ic0VJcE27ibKDVmLI9O4Ir2ibTAvS9yRkYhh8uCnIFL8kEIaHicpK4pEOfcq89wtJhg/0', '15982265561', 1, 1, '1981-10-17', '刘世中', 1, NULL);
INSERT INTO `tb_weixin_user` VALUES ('63dc8e2a349544a780de20241a44d6dc', 'oAvgj0X1RcjEvBCv4-Gh_4c8xojU', '景杠杠爱革命', '2018-03-10 17:28:54', '2018-03-17 16:39:57', 'https://wx.qlogo.cn/mmopen/vi_32/lSy4TLD6CqKS550CHTicNfpU3VKK0IicTBNdmX3ib2CSISmVXL6ce1ryjaLViajicS0AGe3LuNWwxH37r2e3E9QB6Vg/0', '15680860665', 1, 1, '1992-08-19', '景岗山', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('643a79efd1a441d0bb09ce044ab573e5', 'oAvgj0YoyqusKF7r0brhsktf7tqA', 'Z.Y.L', '2018-03-17 16:46:37', '2018-03-17 16:46:52', 'https://wx.qlogo.cn/mmopen/vi_32/sLUMXUlk0l3K8csdqfV7J3huDYRZof3mAUoSyBsr6HiaicpxpzlA0VC9ibo7S9EEr5MwXVxLyjIo9BwictD4RFAZwg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('64bfa0ee8ca64b9dbdba13ed0341426a', 'oAvgj0REddsi7kgsi5fIeMvLu_kY', 'A收钱吧*口碑【点佰趣】POS机', '2018-04-22 21:15:40', '2018-04-23 11:31:56', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTITsZtezs3uRGZUIVsJj5oAOFflarFGic8y5GtpOiaY5eAxnibOW6qCbk98phSeNzN3dgic6jBxtNeXIw/0', NULL, 1, 1, NULL, NULL, 1, NULL);
INSERT INTO `tb_weixin_user` VALUES ('65156973cc0742ce876a341489d89b53', 'oAvgj0eFq8k1g-rSUEKd88JYovkM', '我爱丑喵喵', '2018-03-17 14:24:29', '2018-03-17 14:25:33', 'https://wx.qlogo.cn/mmopen/vi_32/LdpT6xRUkIDCD4ReIxGSskNTkrNIx4Xovk4QWFKzR157yV7tF8sQrRpP8oTF3ibqEMJaEBI2Bh8nkOiciaBsoRLfQ/0', '13551026667', 2, 1, '1981-12-02', '张', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('66029c1175774c08a6f9cdee76994854', 'oAvgj0aDsRJVqD7em3Xwj5WBMI3M', 'TSlan', '2018-04-14 13:23:53', '2018-04-15 17:53:38', 'https://wx.qlogo.cn/mmopen/vi_32/WGIGuEBUkSSuDTBZTom3S5tSiaQbpTLac9n4iaxSg67icU4LWiajHXBEZL79cqUN7HBZY2WlEUN1ac2pjwDxUevdMQ/0', '13458505616', 0, 1, '2017-02-06', '王岚', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('666eec182081432ea94d2b32627f6e1e', 'oAvgj0UkF-lW8tEW3j5AGehxjsuk', '刘中秋', '2018-04-22 22:57:59', '2018-04-25 11:17:16', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83ep1J5W23GsduaJl2Q4qySpOicu2WiaR9g1cgcksNL4x5a6CFj6hvWVkAeQQaJCYqX3Cft9icn9hSRFag/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('66750278b4424ad59198235a4eb367be', 'oAvgj0cQ8vIZEd25CMcObCHev79o', '吴法松', '2018-03-10 11:15:31', '2018-03-10 11:15:32', 'https://wx.qlogo.cn/mmopen/vi_32/vM2NmFZQYmZH7QNOB05ZVueMqWJYnNibJtu7GFcYibkcceXs2roKXYl74MytRxQBlgHlc2X65NSoPBLIDX2ZUaUA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('667aac49493840a2957084e1def1617e', 'oAvgj0c4wKrc-k_6FxjVu0RP35-k', 'AAAO百纳文化传媒一小廖', '2018-03-10 22:10:55', '2018-03-10 22:15:43', 'https://wx.qlogo.cn/mmopen/vi_32/oA8yhGYuVMDIJ2EdFhpBvHLaZGZJibtLVjpoXkyuqMknJICPut5TbKaOdkeEiaJYMgtjzPMUNsTpAYlLnUFTvx0A/0', '15196491996', 1, 1, '1992-08-07', '廖邦宣', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('66cb05b322944071a1b8da96fbb8dc7b', 'oAvgj0YXHRWxyMaDCM9lgNRDPMG4', '红花', '2018-04-22 22:40:27', '2018-04-22 22:40:31', 'https://wx.qlogo.cn/mmopen/vi_32/0ec39nOXqtr8j6nxyMRNsS3xAGiaAE9rQaEib1q1hDRYSafMhq9IE1n3AvaWibiaNAphyOSp1EcYua1XSricviasPl1A/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('67710279e33844e98a789ea83c53cad8', 'oAvgj0YAEThQiUuvpkjwUGuYlPVo', '言忠信', '2018-03-06 18:17:32', '2018-04-21 11:04:23', 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEL31NibrjS1OGoAbarhSUNPXel3icULeQibaLZyIxrbOu9hfDGhn6ADOttX5xFJA81ic1HbdNUdgQCmJg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('67bb302b4bdb4eb3936241628021dfef', 'oAvgj0bLpi8dxsnOCJ_CUjBBds28', '加一个', '2018-04-07 22:52:45', '2018-04-07 23:30:04', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqpNRVGendpVn2NchbIm6yQNBibGDvNIrxD5La0hDHrfZu7YS30uJuS4F1e9sJkiaMdgXibbAiaXCgxIA/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('67fa92f7ab6447b4a6f42ac6196de2f3', 'oAvgj0VXARQHmLp-82utRiFoBHLo', '披星戴月', '2018-04-22 22:38:54', '2018-04-22 22:38:57', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLZ7zP1b5v2ZN3OeKroSvVajVAddzicXulKaHtETqdsBibsWdwfYp1pVhqy7sdsoErqeorSfomicpf8w/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('6837cf52b76e40978bc2c1b2b0d0329f', 'oAvgj0Vdosa02-QLNEYx6u0nFvyY', '星辰战神', '2018-04-14 16:22:03', '2018-04-22 13:44:45', 'https://wx.qlogo.cn/mmopen/vi_32/UsoUwsaPTITprr1ynkMDkgowVWPQY27cmictaia2aibic1kNLmboKdhzzHlffSO81o6vqnPia5NEj7hyKHJ6TSrYPDw/0', '18728033103', 1, 1, '1987-05-12', '黎万斌', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('683ae4d0137c41d2a018067f1aec983d', 'oAvgj0YHJbGLrXnbPpOdR_YJtqQc', '人生如茶', '2018-04-25 07:06:54', '2018-04-25 07:06:58', 'https://wx.qlogo.cn/mmopen/vi_32/jIicUvJ8eO9eoTQp1Byg0z60XA5bbxiaYMwprvGa5WicNTSvkrUOw1n023FnTw4jbLBFmUWc4m6fRNENZ0emegPHg/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('684ad4cc44b9499fb28fc190bc675810', 'oAvgj0RgzPkdX_nzbMCKQ2Q08FBc', 'rianbow', '2018-04-14 13:24:28', '2018-04-15 15:52:36', 'https://wx.qlogo.cn/mmopen/vi_32/A6EQv1uQvyg4aw7G3DhpcRw8AVgQAR3IBRDMZ7sUNw0C8e65nUHiajMX0MibTG2upicujrmicAcYAzjnrDWVf6DwXQ/0', '13228192289', 2, 1, '1999-07-28', '肖雪', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('68957e9a45034e6a93d220a2c46a0ca3', 'oAvgj0Sl3-j_bpWfmJYvpQ_yDpvg', '贾蕙荣', '2018-04-23 12:11:58', '2018-04-23 12:11:59', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKIHJQLKID94OpKFmouajiaibIBWCImetic5ia0ib1OSoXKSl5juSKktduWPzMhRo0j1Ctdvdof6sNoO6w/0', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('68cf38bf96c44d37a1209d1474cae035', 'ocJ4i0Q43LYUcPuswvS4fY_VQT5Y', NULL, '2018-06-11 08:32:25', '2018-06-11 08:32:25', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('68d5c74e4f114ca6bb2d03f688be77e2', 'oAvgj0Y7V_aw7_tJKvLIX7zCh3Bs', '飞的梦想', '2018-03-17 13:05:37', '2018-03-17 13:09:08', 'https://wx.qlogo.cn/mmopen/vi_32/thD3rmFW6NvLZqNP7N6k0A0icCz4ILMrJqhjP3DSqlHVV7fjpBu18DaAa2NiaTOUlUOc9Ze0pZ1KwalyLv6WIzPQ/0', '18782011720', 2, 1, '1983-09-13', '赵琼', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('68d9c9ceec5244b6a7e8515e96fb7f33', 'oAvgj0SFCEuco66uDFYnFwM1_rdU', '汴-千业联盟', '2018-04-23 10:36:22', '2018-04-23 10:36:23', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq0b5umqjrubLC8O8270xRZw1EIIdwGT5uMEspq1pQBymOkdXqtp6KExJNZibS1ibg9gGub3WXS1bJg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('68df6ca0a2f642c09ea7a9d051037f58', 'oAvgj0epS9aj4URZR2yziMMEsiuk', '末', '2018-04-14 13:23:56', '2018-04-17 16:49:24', 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEJiacFRgJ3icUXxJCz9TcMD0lM3LSFBC7tZbUj6qJNCNFaLudQoJK1TZ3QgwpZ92PbLArATsmLOUUfQ/0', '13518201922', 2, 1, '1987-10-24', '朱立', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('6927ab5803cb405c83aedc1b15ab9551', 'oAvgj0UHDg8LeYPVXrHieGAm2xLI', 'sui\'feng^_^', '2018-04-22 21:21:36', '2018-05-19 16:59:38', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKnmKIhvg8UmW5xVZtz4YmLSIjNNwEJicicnGWl4695ugmyg8QlnwUwPWXEJdA8CgkUuHAgVMibBaiafw/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('692d66a4735442b4818e33e2fe87ab4b', 'oAvgj0bHp_rGuvrsw0bsiXLUUK-s', '温暖。', '2018-04-23 09:31:19', '2018-04-23 09:31:21', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJBHLqk9ofIibwHRX2fQx3lMMEDYp22A56FvCDkv5hrSOKHbFAVpMftxwhzgAK9BrUeRYf9iaRy5iaGw/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('6934cfe177924101ba6a270faa72314f', 'oAvgj0V_pMHTEq_0mVN-QCkBgzUs', '龚文道  跨界资源整合平台创始人', '2018-05-19 17:51:19', '2018-05-22 19:47:12', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJUlbw1Mf1vphHbWHhmdhQbYG0Rkon9tIVV8zJFyayVHpP3vcZFWic6PsLMoYQiaqGFhLVKafOlZj9Q/132', NULL, 1, 1, NULL, NULL, 1, NULL);
INSERT INTO `tb_weixin_user` VALUES ('694fb8932feb4d578a1ae009e7d439c1', 'oAvgj0WUlwZo0NQGbiadsIuzmkJ8', '周海超18503352005', '2018-03-08 13:48:40', '2018-03-08 13:48:42', 'https://wx.qlogo.cn/mmopen/vi_32/6YFsLJeHBZkhrFbhNhK6ToJick5lENzlc8u1dx3iaT89AU9xmtRtLGwD1PoMecjssjlo8xbAEdEfOnFLxoGCXoiaA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('699c72dcef894583aeda0c42d95fe9c5', 'oAvgj0RWNxr1UZFwtaaMbjUSimV0', NULL, '2018-03-17 12:12:57', '2018-03-17 12:15:44', NULL, '13281122338', NULL, 1, '1960-01-06', '陈玉莲', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('6aa30c99af204a1388ce10ddab6cffe1', 'oAvgj0d6iaJm1F7BaOohcRnDB2aQ', 'A陈', '2018-06-02 16:29:27', '2018-06-02 22:20:36', 'https://wx.qlogo.cn/mmopen/vi_32/mcwuUzkL4A4iaauzlbmjbmm12OMQ7zahtOq2sJgRbx67EiaPEI3uZWpZ9gl8vDia7o8CwicKsM8ibzfDBaEc7rYQ9gw/132', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('6ae881e2a2c142fba45b6f4aa985a520', 'oAvgj0TbXivdk6vw3XJVXJznUDGc', '折戟陈沙', '2018-02-09 13:02:49', '2018-05-25 18:48:21', 'https://wx.qlogo.cn/mmopen/vi_32/he3nEGmBQMeK5mnhRvubUiaCogPrEQbYYiav8hqSY9iavPvZx83C5ZBF7Keqew0gGnCsOcXN3AyuiaJnWoqTqbibhMw/132', '13982038694', 1, 1, '1993-12-25', '陈列', 2, NULL);
INSERT INTO `tb_weixin_user` VALUES ('6bc636c2135748d9a880047a747923b4', 'oAvgj0Y31pQX1uwQimpXEfAtWlDM', '꧁༒༺爷༻༒꧂', '2018-04-23 09:25:59', '2018-04-23 16:34:27', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqLTXnYwC2A4DBejECv93Sic5ibeKZLHcIyY6qyUgCI4jDIU8TI9icTaicylHBSbuKwxS3F2DJkTvPHicw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('6cc5cf269d934292ad1a5975b1a6ff98', 'oAvgj0Wsg08wSGl1a2kMlPCoi7ek', 'rdgztest_MBZUEF', '2018-03-11 13:27:21', '2018-03-11 13:27:41', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('6cc653189d66492ca906e44a16cc075d', 'oAvgj0TzNSNc3V72RWpdvSmPL6Zw', 'Simmons', '2018-04-22 21:16:10', '2018-04-22 21:16:11', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epuiaWk7vPIPicjkgW6O9F9BcsbpzEc0o7iciariadpZiaLPYfYPP8FAJp3PfRtLNwZxTnkD2QGN2PtLnIg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('6cc68a503a57491fbe0850525af264e7', 'oAvgj0Zru0Mqm_Greh-l-8PmoRVo', '谢志忠', '2018-04-22 21:58:20', '2018-04-22 22:18:51', 'https://wx.qlogo.cn/mmopen/vi_32/WyBFlUaDAQ2sNWSRCuw71viaicYLThichZgJyyAGlKoGpV5khcJscaNTsCbLicmo0ZOzxTIZv1Ls3IsLxVALccu6Sw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('6cd6dcfddce24e9da51d32777df55eac', 'oAvgj0T80MCG8XSKGAZnFhuahLY8', '忆青桑&', '2018-04-02 11:37:50', '2018-04-02 13:01:43', 'https://wx.qlogo.cn/mmopen/vi_32/RW5U7gTMic3ANc73ib1E66ZS32NU4KgCGhfgnIq4sBHYGf4klrUgJibLVtMotnnoFVTg81iahSlzqNIorLV276poIQ/0', '13458511501', 1, 1, '1981-09-09', '李军', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('6d8e39a5c0b643bc9f1ca40b500613e3', 'oAvgj0cHDdg3kvKVn97d41wumdvc', 'Lucy', '2018-03-17 11:36:34', '2018-03-18 21:42:14', 'https://wx.qlogo.cn/mmopen/vi_32/EDN7Y1XDQib0ntDVGYWSXaEzoAicsSMmRE0FgicdaUXT4iceEBbYHCRxKhrOfLVNsjiacCPMHz7jcMXc4rB7VjibbIeQ/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('6db52328e6e847ca9c7701410acf8bdc', 'oAvgj0Wo5L4mRMvZW8QsCPeOJr7k', NULL, '2018-05-10 17:47:31', '2018-05-10 17:47:31', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('6e41408c0841409fbeea4df62cbc3b84', 'oAvgj0cuN0ItH2Ad_UxAs75BvTV0', 'mei～不胜收', '2018-03-17 11:35:24', '2018-03-17 11:36:54', 'https://wx.qlogo.cn/mmopen/vi_32/2UvqCHBBrspocxUwXGxfIHoc43QOQxicBYTy5Qwfziahibqv5FPU12cjq56GrLZj9n5Fib3ZViaxEsuA04vuD8U0rSg/0', '15108295358', 2, 1, '1982-01-23', '王平梅', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('6e7bc8ba6050445a9b0b5fe566ee8643', 'oAvgj0eWMQNcQPvoq9tqurUpCfLs', NULL, '2018-06-01 17:47:25', '2018-06-01 17:47:27', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('6eee15eb1c9c4f79b21001c12242be74', 'oAvgj0afEdTxM9o9npdFN1AUVies', 'Cy-代', '2018-05-10 07:47:49', '2018-05-11 19:50:41', 'https://wx.qlogo.cn/mmopen/vi_32/67wok3rPEdKcMJFgrdl9ZrrClzRl17QyU7A9cZVqVjjdcfsDnh9ElYCZAfZD6vzIetCk3IEudRf3AyNl3dhzUQ/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('6f1d83cd025a400a8c34c945d8726937', 'oAvgj0dE5FV-2FlKhNc393msjQqI', '____Royal丶梦萦', '2018-03-17 12:02:49', '2018-03-17 12:04:20', 'https://wx.qlogo.cn/mmopen/vi_32/mGkblm7Ffz4o0prJKnqysk9XJGpWzXtFPa6ekxibF0YBzLPeeMjkffiayuA37ibwyaYYALoiceVxqd98wy6OE77lAg/0', '15228638272', 2, 1, '2000-02-03', '文平', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('701fcad95491446f9fc512b61fd07b22', 'oAvgj0QMefe54nRKlhh0tGm_ybho', 'AA李孟香', '2018-03-09 17:50:20', '2018-05-17 17:01:15', 'https://wx.qlogo.cn/mmopen/vi_32/LnQTdrKVuADV81pdR4ZPxRbrazm6YI0IGd18ib2licE3j1LxCFuGIEQPoIEncPVxOPGwHXw828gp3TicicgeUNlTkw/132', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('704aaa2dd7c943a6b3a18724bc59290b', 'oAvgj0YtV0mWaldE2rG41OAp6tFM', NULL, '2018-06-01 17:25:46', '2018-06-01 17:25:48', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('70d7f4a0ec6c4c3aa60978552ee24205', 'oAvgj0XL3QZG3FE77KCpG8Mrryu8', NULL, '2018-03-08 09:23:14', '2018-03-08 09:23:14', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('710de21aaa794cb784349f671f115f1d', 'oAvgj0eeH6onRwE_v42Dp5Lr_eDE', NULL, '2018-04-14 14:24:42', '2018-04-14 14:24:42', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('71293847b7864410954ae0fde7c82630', 'oAvgj0Q2KLJ62EoUKKQePaWBLtrs', '成都桂花15378190053', '2018-03-18 20:00:49', '2018-03-18 20:42:05', 'https://wx.qlogo.cn/mmopen/vi_32/fhcBH7NoWfkZLqOialArYNK2K2e1NibuAsV3UflzK7QoaibzPJliboePe0xpUYojY27GbU2iaKPYpLlp1EW5SzynibWA/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('72af0dbe2936448c8306945578fdad45', 'oAvgj0SJthycq4yd9b8HpIUZIZ0c', NULL, '2018-04-22 22:19:31', '2018-04-22 22:19:31', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('72d7dcbb686d4512a546daf87dc25b82', 'oAvgj0ZD2_GVmtoX-S6BwpR3HGBc', NULL, '2018-06-01 18:02:23', '2018-06-01 18:02:23', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('7317b1a280bd40e7b369eb9a7c8dc9da', 'oAvgj0TKo814TJD5GTJcQJSUTFPo', '乐妈', '2018-03-15 20:40:15', '2018-05-14 19:54:40', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ39zo3hW6IEdicmLJUP5ickibcJlcicLa573wVewLFy8xtnKX24QLK9wYLjI60sN2S3kYjw1MCtbXP4g/132', '18123287026', 0, 1, '2000-09-01', '赵云', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('732c987c9c464d659e3a5dc7373b2290', 'oAvgj0TFDd833AYfdAcdoTxqK37w', NULL, '2018-04-16 11:17:47', '2018-04-16 11:20:50', NULL, '18384717446', NULL, 1, '1996-03-16', '孙家宁', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('733467b147a94d97b22915d455152b7a', 'oAvgj0Rzvhq2QNhgEtDx5_YUbWX4', '正在挥霍的青春', '2018-04-22 21:29:09', '2018-04-22 21:29:58', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIQnTZdv5Y1x9Rz0BrNNhmN0kONkpdicv4qmYdYOWtawT0DeKBNJNVzDPPjLuQ4vMef15m6Ie8cArA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('73773dad1a844e3e8292842db1530b49', 'oAvgj0Yy1ZSRcLEA07vWnWd1DCVU', '赤焰蜀', '2018-04-21 18:39:03', '2018-04-21 18:39:20', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqiaBk0XJoZ6c5iavrtNXa9xllMdZGpLLqjxY0lvtSMszCskHn6icZMdaHeIfM1fs3zeayCqQWb396OA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('738bffc507b247389bd2bd123865565d', 'oAvgj0ZJtk7D1WaWjDounCc81Ivk', '成都 泽浩文化 地铁传媒 李博宇', '2018-04-25 16:44:59', '2018-05-29 10:07:47', 'https://wx.qlogo.cn/mmopen/vi_32/nPuvC8OLwkqaFpG6lz3b34CAo1sO9DVkz6xEaW2XpeIDicQUdBGXowTibJ5EIhzQJicAp3fz7W88EjomKOnfbFB3w/132', '18981953658', 1, 1, '1996-05-22', '李博宇', 1, NULL);
INSERT INTO `tb_weixin_user` VALUES ('739c9f2dc1b9439dac57d70df8eda18a', 'oAvgj0ch4SJbEXiJIX6lVBhUHYJU', '猪跑啦广告公司', '2018-05-10 11:52:59', '2018-05-11 12:17:02', 'https://wx.qlogo.cn/mmopen/vi_32/S1mEBFtKr2RmfaEU3pG1xJTN88nBbBogo1OAJzcpvCTvbRictskXfCb2Q3jCMzLaVlRUJ2JyOg3zp9bE6MbZzxA/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('73b148eca7c346ab8413e77103a22257', 'oAvgj0VlV19i-LSXVEnGA4UnisBg', '天天奶奶', '2018-03-17 10:59:22', '2018-03-17 11:43:06', 'https://wx.qlogo.cn/mmopen/vi_32/hWFVF7RSvYS2E6wcltx9A1SZwCE30l3fYjfpGS5hn3og6hH9gibrAvDTqtVfSia1n7pudqtctugicMC0xtogRFibaA/0', '15928408156', 0, 1, '1955-04-19', '周秀枝', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('73ccd386a1004538a01a55ad1a47d815', 'oAvgj0U5V1Aq003PHWlgwrA1VR80', '金樽对月', '2018-04-04 10:08:10', '2018-04-04 10:08:17', 'https://wx.qlogo.cn/mmopen/vi_32/8m1L3YXwEKWkFEUtZpWNlNntP7Qth4gz5ziaWib6a6W8tH0I7HmzcqSHZepCoI6LqWm4QYZnEVI5gYwjr25fUMUQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('74215d16b23c4356b31e077b22a4c602', 'oAvgj0Xd45APnAaCQQq9HbDj_o24', '大脑动力朱老师', '2018-03-06 19:25:20', '2018-03-06 19:25:23', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epnSfvicmI26fuRhic7QP7NoSwasalMz8wgsuT0kpsYBytbXfeX98d7OloGpGe3xaq1HhIc7ogJ3LDQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('742ce267e93f455dab024da43b6b4e81', 'oAvgj0aGvLrqK1ZE7hpYeKZfMhn8', '风清扬', '2018-03-15 20:46:39', '2018-04-14 13:31:37', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epWQibS0pX36LCRzN9rANqs0LHAbQvccKuLxQ0SLkHxpxbL08mQv6CBEjD7g41uWWnjNOMxY3zGo1g/0', '18081170455', 1, 1, '1978-01-01', '裴昌均', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('749cdbdec0924d7bb7633e6fc9022b7f', 'oAvgj0ZQXH7F7A5wOUBHvZD_x5yU', '蒋磊（共享服务平台）', '2018-04-22 20:37:08', '2018-04-22 20:37:09', 'https://wx.qlogo.cn/mmopen/vi_32/B9ic8WG1tvFkEpF6wMCMuxnEkAhZLBo5EKQzKxXmcteaQoJEwhYVoIzbzbb5l9re4x0f6XcTVuAEksTOHAxibkwA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('74f6565986e745598c5e3f43cee3f23b', 'oAvgj0ey7rzOUbKMAfD1WLj9_Ktk', 'rdgztest_BSBBMG', '2018-02-25 15:59:27', '2018-02-25 15:59:51', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('7504508363744e77aad965c53cb9f5db', 'oAvgj0YNm1sPbWn4s58VwPSSXx7s', '陪伴是最长情的告白', '2018-03-06 09:58:44', '2018-03-06 10:01:22', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJXE3Zz0U5edWUnIqSBeOHeayGL836BfgVzicNZiahNVibfhtv0LoagaosFrsy92aia14Uj5hGhDrRa2Q/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('7530a23bb54e4f11926e5cc7268eecf9', 'oAvgj0a4KXf2hakA2dZ6HqemKVso', NULL, '2018-06-01 18:00:57', '2018-06-01 18:00:59', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('760d18c3640544b5a14cb3f951a015e3', 'oAvgj0Sp1Ysk9dcNxep5muJyOH8Y', '卩  萑㏄', '2018-04-22 21:12:24', '2018-05-11 12:54:24', 'https://wx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLARwyicxKgiamlZFegseHTOibFbicnyBPDzaHEQ7I1ZgibxIRwQ4ED3INWucreKjEzcSReLny7GNbibHXJQ/132', NULL, 1, 1, NULL, NULL, 1, NULL);
INSERT INTO `tb_weixin_user` VALUES ('762b8a0e390c4ac2b123054415406bd5', 'oAvgj0YVekRld8m9mKaZG2FhiRSY', '雪儿', '2018-04-14 13:35:25', '2018-04-14 16:26:47', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eo3XwG4jjhPoNHTLT8vibASnqyT9ej9r6OV5c1miawDSMZsVWkcvDzFkjdn4AKLOib1O2cVGEmNfy9yw/0', '13228192289', 2, 1, '2017-09-01', '陈晓', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('76788fd4aeb44e5a82b51f99344f7b8f', 'oAvgj0boYNUpVmT-DaKkmGCY60C4', NULL, '2018-03-17 13:48:43', '2018-03-17 13:48:43', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('76ed9d6147be40d19c508b1e74596581', 'oAvgj0fvP9YtpQhNG6FFH7umxsAA', '阿宝', '2018-04-10 14:31:18', '2018-04-10 14:31:20', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKV5rK9hs2yAwjkWOMk5yxnmAd6ZkbSYuMpGm0mnwictQ8AUNk0DpdYhQrt15M0D5QAc4bMMpibMwFQ/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('776a211727174bd79b088b43c149914e', 'oAvgj0f3S8mevSl1tXx2SpXkLf_s', '深流', '2018-03-29 11:03:53', '2018-03-29 11:03:57', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIzns0JFo06VnJiaWkBu48sDZELM5Xy6MPzuTaoY1FzyWTCljuquKQb9ECOTLJsldn790osBBybUXQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('77f89640ee1849df944cddd3fd1525c5', 'oAvgj0UpD0oNQ2trrIAP9X2ljdeM', '兴业银行高端信用卡', '2018-03-31 11:07:15', '2018-04-30 13:45:36', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq92aiaVHbjmtURWdQOEVGRJB7uoFSFWekj7bXmbCD08WPKibSbmumj1vrBN8bkXN8CSVzOyuz220GA/0', '18602820069', 1, 1, '1985-03-03', '邓玉强', 1, NULL);
INSERT INTO `tb_weixin_user` VALUES ('7866e7ce07124993949abc61ba6bca99', 'oAvgj0TnDOMrZRRdaNpYXrqkwb-4', NULL, '2018-06-01 20:36:47', '2018-06-01 20:37:17', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('7890d7e11b014aa686f76ac84e9f6d18', 'oAvgj0d47ObfWa-pYN0PnMpyR18U', 'HAPPY', '2018-04-23 09:13:32', '2018-04-23 09:13:33', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL6bKWuDa4sbm3w7IX0Za4lBuTVy9PMvl93SfiaN8ltx5eE0kIQ4SykcicOYltpj98k4zIQDwhhtzng/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('78930ff824124103868a77f4c244db14', 'oAvgj0Zzu-TtVuTXXjNO4lQ_p0Bw', '馨儿', '2018-03-17 11:45:30', '2018-03-20 08:18:51', 'https://wx.qlogo.cn/mmopen/vi_32/5QBbZXNWod6VEahRDK07vmjCaj9MQW30DDmGicWPylZibEjl8IAf1dW6GQTjUnia9icoibF45iaee4105UEPXhDCWPgQ/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('79276b826a2d4916a2ff347695abbc41', 'oAvgj0SlcNPg2i9vqaRAHQTk4tfA', '向露', '2018-05-11 12:37:24', '2018-05-11 12:37:25', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJItU5puniaXCEibHgj2yo9kmibuVaib2j8wfZ1RSJX5ZTc2FrINpZl9Ct5icia3v1aYb78oy2Osia4tZjibg/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('795aa853526843ac8b3f9572f6d519ae', 'oAvgj0fUIjxCFgXFptmvLZfs0tms', '杰', '2018-05-11 22:41:06', '2018-05-11 22:41:08', 'https://wx.qlogo.cn/mmopen/vi_32/0L3Y5XFIPSK9O4OxlGOR5ed4639VQiccicCIQb5yjEfL41OialA1B82TES4VD5kgwNuDv24SezuE25fIQESLicxvhg/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('798e38eaf11d445f91ed0beb1e6e252c', 'oAvgj0Y-8CmYktGOHxzph4xMUHmc', NULL, '2018-04-21 14:44:54', '2018-04-21 14:44:54', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('7a1a53a2478d4852bf20fbd7e01065a1', 'oAvgj0YgXi8SF-XK2UTkXPZYSDM0', '洋芋不开花', '2018-03-19 13:53:25', '2018-03-19 13:53:55', 'https://wx.qlogo.cn/mmopen/vi_32/rLlDicqBx1WNARAsojwFT39TD3CQkHicsojWEjqSTkwJ8jfXzwcrNcymYr0ErYvjZicViaagt38HwVN70CHeKuzLSg/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('7ab8de914a3141b0a4a877d1222cac1f', 'oAvgj0cEBffazxlEqPcMubtvX7Xk', '亲密', '2018-04-03 15:24:26', '2018-04-03 15:24:27', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJRFRX8kNzNem4pfadv07zwNpicDAGSvBtOd4BEIXKEKNnYGBTYFnXZciaaymRHGtBclEk7L7es8hdg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('7b0116e7b02f48df89cd5a8eb6b0b80c', 'oAvgj0eaJbwvhF_Kk8CGQrwSpmOs', '悠闲', '2018-03-06 18:50:02', '2018-04-14 12:30:13', 'https://wx.qlogo.cn/mmopen/vi_32/TUp3tyJ5cCl2tYMEZvicHPcMdVtOVw5EmBa5l9h43Ik7UiaEPcU4bGV4laDmTvaggYytCAM5eA7MrgmS8AIctdvQ/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('7b70ce5762604859ada4f1dc2846a422', 'oAvgj0dGU3VUolw4x9Q7vKNkICOg', '死亡之翼', '2018-05-01 11:41:41', '2018-05-01 11:41:42', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJFESoGySFrzj165rQkMgr5VyQ23fFuggPUk4xibRuHDIM45y9tBJicjyXEBqvuraqw5wqX8xXVV25Q/0', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('7be7b0efde964635a832f8699e1f4c69', 'oAvgj0UT7qdF5Jp0sYC2pbRKnGX8', 'angel', '2018-05-12 17:30:43', '2018-05-12 17:30:48', 'https://wx.qlogo.cn/mmopen/vi_32/0hehGAIdGayWcRckMAyfA2AWwqgaCC3GqncicBiagnhzzKuWMVjic5jkpBWP3U8icIfUStYvEQ0ibMzcGQEKrOOicrSA/132', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('7bebe51e351949d0a27a45ed58b38b59', 'oAvgj0dZC3zRENnTzPFC5f4EWEds', '。。。。。', '2018-03-10 17:06:26', '2018-03-10 17:22:06', 'https://wx.qlogo.cn/mmopen/vi_32/kgxNV55wZwpmGzCwfZJ8AzMhSoA9UzZPlrCVwC9wfjmVI8vXwKS0GtOsDD2pY1Vibmmx7IDrjQP5ibAIXYTCO9icg/0', '17628643916', 1, 1, '1997-05-03', '周华', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('7bfbbf0c3d7c4c27bd5f7f0a6cb65336', 'oAvgj0TNt-u3c-NNfOqqJQxe-w5A', '品众地推-丁武光', '2018-04-23 15:29:20', '2018-04-23 20:52:28', 'https://wx.qlogo.cn/mmopen/vi_32/4KGDYpurPJrgslvGg7CQcVjZuxH56Kpp5rVOn65whEvhsvrZ0KjJRsQCsjiaYNm1ZoM43OM0fTRVbgczfCQ1NqQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('7c03fa09ccfc4d42ab7a4e945afebf35', 'oAvgj0ayi6NvKMdCP2UbtwibhIZ4', '紫枫', '2018-04-25 12:58:50', '2018-04-25 12:58:53', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLb0TlPgVqWKSNhTqxscjfS8TiaBdsFMITK5vCM5l7uaia4PVRFMhVTdtWiaToYGWVVtm3EneCkpLxnA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('7c23f050b90948d7b5899bfe9b0824db', 'oAvgj0T6aaWZMUz23cOjqBwDT2TA', '星辉', '2018-04-23 08:02:43', '2018-04-23 08:02:48', 'https://wx.qlogo.cn/mmopen/vi_32/LnQTdrKVuADV81pdR4ZPxT9CEUpQWq8NgZQkicibO8Ib1CnVvqtgcyWfiaIH8zp20253GpiayS6I4NGATicwah3Iq8A/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('7cebdcb507bf4661b584ba73cc88bfee', 'oAvgj0agV7MBJ8hd4ay0JDrW8EEM', '王欢17330651225', '2018-04-22 23:25:36', '2018-04-22 23:25:37', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLzfLK71ialh1jev38puhnoibZiaP3SVvQxyKL7Lew8y5Xib9V2vAjhWEZrN7rqtkKJERnMPqRASxV0Hg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('7d155d8b391c48dbbefeb370c575bf00', 'oAvgj0T729oezLixaG6shqGTmp54', '简单点', '2018-03-17 14:40:47', '2018-03-17 14:40:48', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLeuDHwhiccOxzOYQgicoYFX84mj3ReBGbO5ib8FrkOCtS1qkZRDSCXmV1JcWqsMjNrNQibMWtoaAuRBw/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('7d4677313cdc444a80c884ce20cecabc', 'oAvgj0SN6W35zaaoWa611BUonYrQ', '袁野', '2018-03-15 10:46:40', '2018-03-17 23:23:09', 'https://wx.qlogo.cn/mmopen/vi_32/AkTpylLVPjAq4dBe4anHia4AkRoZSohEbich1ZHIykZY69kAznoiaNlGibNTFzbugNaJqUS8Eu0WZWjVajL1vEnsIQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('7da7602e89fe4561aa488574bc453887', 'oAvgj0TZ21lLxT5lFZhsAt_Xr71Q', '777', '2018-04-22 22:52:52', '2018-04-22 22:52:53', 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaELYJB1vbM1nacOk1P4ALqwFlzBIcibnadsjNkHVib8uOSsh39l6ylGvfwiaM4TzqAbeTjrqX3k053CUw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('7db8803e89de410384a5a153029a4c8e', 'oAvgj0RzlO9DNhinYyGNyD2goa9I', NULL, '2018-05-09 18:56:43', '2018-05-09 18:56:43', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('7e49c3ae82e44b118057a679214871e3', 'oAvgj0dAh5Nmp-kN7mGUjnkpIQf0', '曲波', '2018-03-06 19:56:59', '2018-03-20 09:59:50', 'https://wx.qlogo.cn/mmopen/vi_32/VDojqvc7WsJNAhtQYCzGXoCT1HsLib2ZfmToSqdTwSr28W5tONskwgAK2ANOnczwvC0SicEvledAJSgKDpwLOr0Q/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('7e819d4bff95410a880ff63500f5802c', 'oAvgj0ZHkPnLCttuEDyaVxuPuGEE', NULL, '2018-06-02 14:43:04', '2018-06-02 14:43:05', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('7ebe25648cad4be99409da731d29f529', 'oAvgj0Uep65_Q2yy_a3WVxkg5b24', '支付宝口碑阿川', '2018-04-22 22:55:45', '2018-04-22 22:55:49', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIG5iaXgHOYUMXSWk1aphcWk4qibFrw07oPjT23og16pLkZfQZ1Maqnk1gFfJBIIMuHdl1lcjOcHYRg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('7f9fa91eeb1048ffbed0f28fc62e1592', 'oAvgj0eLm5rFS5xI2Zz1MVoKtBOQ', '艳子姐', '2018-03-17 12:25:45', '2018-03-17 12:29:40', 'https://wx.qlogo.cn/mmopen/vi_32/aheseRdzK67yYnkKAnyPRR4tnuA0UJV1K0HOl1B5alxeJWCOsDAFW8g39UCKYZDibE5U8nbEfSG1kuJ9tw66WyA/0', '18628979158', 2, 1, '1970-02-21', '谭艳', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('7fc5b59257bf4b87baaee85efe949dcf', 'oAvgj0fZFdvfTLzfppJsRf0MZcLE', '一生做好一件事', '2018-05-11 11:32:50', '2018-05-11 11:32:55', 'https://wx.qlogo.cn/mmopen/vi_32/Dykr41icx4H9KGRodiaicE8ZQZrSDBmCIKAaImvJE2zShbvbicslqAFK137BulGngibJenFTf9Oric6vVA5nCqAzja7w/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('7fc8160bb07240949fed21b06091fc87', 'oAvgj0ddxVjapJndmCHjMutuOZGU', '伴路兄弟；伴路朋友', '2018-04-14 11:46:47', '2018-04-14 13:26:08', 'https://wx.qlogo.cn/mmopen/vi_32/eHDDJv28eCDtZkSbMWysuqZiaUjDAALceKl1lCr2V89vmeHYdDJwzbpfLqIqyzNKmoykjl1BhGgfzPdnib4UISfQ/0', '13550357181', 0, 1, '1997-07-23', '曹伟', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('7fff3746b57e4137bb086f0f53e8735e', 'oAvgj0W-TjHSglJibBi7_5B8Non4', '陌影浅忆', '2018-04-23 09:40:49', '2018-04-23 09:40:51', 'https://wx.qlogo.cn/mmopen/vi_32/eQ5UViaPGMC5eXe2o17YZYAicN7UNawrl3l5Hke8EMZICOZ2w8Bfd1faABPibjhCPZziarlEJcp5kpx2eJu3at4CGQ/0', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('80697500a6c541f987199cb1e33c3393', 'oAvgj0YzIzUHhFOurv6hiG2y1g_w', NULL, '2018-05-30 21:57:45', '2018-05-30 21:57:45', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('8073b93dbfbc4235be6c1a047814d80c', 'oAvgj0XPlaIA5o6ONNX0_CnmrwCY', NULL, '2018-04-22 22:28:55', '2018-04-22 22:28:55', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('80c60f1f0f5b4ad9bf6ed6c64b79f11d', 'oAvgj0X316Z2sfjr_MZdXFD3pqms', '起名废', '2018-03-05 20:06:13', '2018-03-05 20:06:20', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKAfvF1yoI2FQuBEGoJicOV6QBcgfdHl4w2XZqpRaAia2ZsAeVibv3cuiawLly1pXQqwic4Dqd2GYibd7xg/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('813cdad02eb6423fb37586eddf6da30f', 'oAvgj0QzyVDT8uy8mLbru-jjzuEs', NULL, '2018-04-22 21:43:06', '2018-04-22 21:43:06', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('8148bff4ecfe4042b00d1856a6fd34a9', 'oAvgj0fEgDFn5AP8Ccok_bha02Pk', NULL, '2018-03-17 13:03:29', '2018-03-17 13:03:29', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('817d39f5836340efbcc2f0bd1ae45746', 'oAvgj0WL33jYZmoxL9N7c9t32dsQ', NULL, '2018-05-23 17:24:40', '2018-05-23 17:24:40', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('81a1e09186174e82bfd379946d1f0c97', 'oAvgj0Y_cHG2R6hmCi9y9y-PcYgk', '互联网的追求者', '2018-04-23 14:51:22', '2018-04-23 14:51:25', 'https://wx.qlogo.cn/mmopen/vi_32/yyQtCcbwOahWvaEJYBia0n82bG4gFpC2QmuT0aclWvbvpiazCCGJ1ljC3705GnIUjY1fPk9cjlSAfEN2Nf3tbPUA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('81e1f9ff115f4f7db4a0e4be9a0d961b', 'oAvgj0WthrG9NRDeVwU0xgxrFAHs', NULL, '2018-05-14 19:40:20', '2018-05-14 19:40:20', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('821c8a68f4224bc19733f9b58ebee92b', 'oAvgj0Z_KASFXTvis0UHaJCHwcW8', '丹妮', '2018-03-17 16:13:12', '2018-03-17 16:14:53', '', '17308036003', 0, 1, '1988-09-01', '吕丹妮', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('82f9399be247455eae1b9119d02e9ea2', 'oAvgj0fM-rBImNGQE1GpP7pYLsG4', '定义真理จุ๊บ', '2018-04-22 03:30:49', '2018-04-22 03:30:51', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoqAXh5X9TJwFf7f1ZaLmXr7fs6s1QIHheicRRDdGTypfeia52VAob5kqXAY6nMmib8QvvPp1ZLtAUicQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('8363a43f6abf4e38ab1e2386661c34f5', 'oAvgj0XjHUWKkATrX1_UuZK0hSIY', NULL, '2018-04-14 13:23:59', '2018-04-16 10:38:15', NULL, '13980913889', NULL, 1, '1976-07-16', '王欣', 1, NULL);
INSERT INTO `tb_weixin_user` VALUES ('83aa11585ad9465a83104217e0fcddad', 'oAvgj0RRntUwqe9N2OONqLD_oDKw', NULL, '2018-04-22 21:14:04', '2018-04-23 08:02:43', NULL, NULL, NULL, 1, NULL, NULL, 3, NULL);
INSERT INTO `tb_weixin_user` VALUES ('84691ffff1524df9baff87d2f5964160', 'oAvgj0UUvhB5h4A7dcEV6imCzPlk', '兔兔', '2018-05-08 17:35:12', '2018-05-08 17:35:17', 'https://wx.qlogo.cn/mmopen/vi_32/ia2wByrCEpia3E2l6dgicnwqdAIRLbjvuI8nVvAhkAx2urTHZRmCPDDfy80qsGibK7tLCRJSljAzsRcdLELUhjT8dA/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('84977b48d0864f2792bd0ff3c570a452', 'oAvgj0V34GsbfnoORU0pXQuTHr-M', NULL, '2018-03-28 10:55:44', '2018-03-28 10:55:44', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('84b77ca999374ebbbf5520c13db3fb6f', 'oAvgj0XfRY9gLnVME917qXycMDe4', '彭惜徐', '2018-03-27 16:01:32', '2018-03-27 16:02:20', 'https://wx.qlogo.cn/mmopen/vi_32/c1GgMGPvQgqlmEf1icIJGSt5RDicETOlPTtjg6f9sA7c4HcCZPZcticXwL9hiaFZ1T7CIiaKzhicDnvIwSjvSXGSTcrQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('84ebefac825b4d0fa9f3c4df8693af28', 'oAvgj0WfTYbVGIjdJCo_HOasCG8A', NULL, '2018-04-22 22:29:46', '2018-04-22 22:29:46', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('855f6fb8a7c54905b8f8744ece2b4287', 'oAvgj0SLazwqaDDObq0bv9Z9AALo', '不疯的疯子', '2018-05-10 19:19:32', '2018-05-11 12:20:34', 'https://wx.qlogo.cn/mmopen/vi_32/xkIVV6vXJDelkxQmNcAI0mFffGlETVBmG9icicGQibVxeKvj2UyGChd7N7IJZ2icwsnPgEUodehSbJHI1x98k1T4Sg/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('857ad67d81eb45729c7ee6fae8376df0', 'oAvgj0XFsZ0Yww0suskId9zVbO5s', 'QQ和RR', '2018-03-20 22:11:21', '2018-03-20 22:11:23', 'https://wx.qlogo.cn/mmopen/vi_32/ybONbOCb9TYcASyHGYDgjICyYKoXxDibWVtosgMfULYqFEGWng2qxjywfric5guWIoHzNSXp1BQ9jz6IyY88ibZ5A/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('858d774889f94eee80179b73586ca488', 'oAvgj0UMhPKCjh0lDYFye67aI40k', '夏至ゝ冻伤', '2018-03-06 13:12:41', '2018-03-06 13:12:45', 'https://wx.qlogo.cn/mmopen/vi_32/oW1icR7PkS078XQ2Bz9DKSgMgic48WX4RDnJqlnDHEFiaM7MqkHC4eWnYlrml3FjBCTa5QNLt9O22eHccIxkiamtrg/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('85c5b1e8764742a28fb933a1c3737e88', 'oAvgj0WC12IQo7qOqMXrrkIW_uWY', 'rdgztest_BOROXV', '2018-04-13 17:15:35', '2018-04-13 17:15:50', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('85ecd3bc7d7c48c59be014c392267119', 'oAvgj0SLlFTzJDCiydPlo602A3f8', 'rdgztest_OJFLDI', '2018-03-11 13:27:26', '2018-03-11 13:27:47', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('865c0b63547244e6bb4864350225111a', 'oAvgj0RNHE7y8VGP3ejFGMclQuMU', NULL, '2018-03-31 17:58:46', '2018-03-31 17:58:46', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('86da1370cc0f4fc38a94954bbb385de9', 'oAvgj0YgAazAlY9dT2X5XSjqao0Q', '罗辉', '2018-04-21 12:34:17', '2018-04-22 20:25:55', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLiaibvicQdq1UzXaRbNicFcaPCyD2eCP7ONupFK9euoP6vowMFs4lXy7GoTxFZrI4LqpyAUpsEoicDt9Q/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('86e3d7293ed7494c860b5cdfe3c1b617', 'oAvgj0WR7dtnKzvlqFyFrTqHCzdA', 'A-云程序@全国招代理', '2018-05-28 16:23:06', '2018-05-28 16:23:07', 'https://wx.qlogo.cn/mmopen/vi_32/ULHCcr3hhV62LJ7n3XE3zJPRKbS70oQJ44Iz7iaAG4edsRuZhUFtTT26ezoicgCLaUGEvFObX5QQzm8IHkwdamVQ/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('87454f9ba045489d89d291f0424c5002', 'oAvgj0TRMhqLrV4uqQzjreQv3Q_U', '头上有犄角', '2018-02-28 18:16:44', '2018-03-20 09:20:18', 'https://wx.qlogo.cn/mmopen/vi_32/2eC1bLSGUUq8KYqwSePwKFuQyEqeibUnC3PtpfjcjSHkarGRkSuNsBIlWOX9O573CIFSEg4GjjVQQjRKHHlgk2g/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('8801ec8a4db447c1b7aeebf688655639', 'oAvgj0dopfz7zJqhmsXE8S9x8lEM', '旭日东升', '2018-05-16 17:12:34', '2018-06-04 11:59:33', 'https://wx.qlogo.cn/mmopen/vi_32/53O0aX5fZd9FGZGu3hEVMoiczTje1iaHCBJwBjPUCjjmoOGUReYvficTcPyUbYuQDTnygI93aV9V7pqVyiayChZIGQ/132', '13980940499', 1, 1, '1918-09-01', '史旭明', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('89b750fa153c4745afcdfd049a2d54e2', 'oAvgj0Sbr1t4Fq3McsJA3ci1g6fw', '庆祝发财', '2018-03-08 09:12:26', '2018-03-08 09:12:28', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKjEia568VUw3hEPJ3kyCK8RZyv5YuL5T0qu8fQnG1wCTIjYO77Bib0sqwjPu1CTBQ3Y8QDOkiaLDUJA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('89bb1528a8434556902d56e2f7b3c605', 'oAvgj0WNh9FAPe_occGAnOrLMT8A', '不忘初心', '2018-04-23 11:31:56', '2018-04-23 11:32:00', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83ep4q21a3EBwaoP99HJayyibl9JvAESsTCF6MuXnCZEzhM0zySKGMiajfbficqIxHaibgQnw1xEF1BRgYQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('8a3bd24cd82a4ef39fb6f5985536fdbd', 'oAvgj0fd4-1qYTm50JtrCZfO4VO8', '王老师  成都市儿童教育联盟', '2018-05-26 15:18:18', '2018-05-26 18:01:32', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ7roibmpSnVlEkIWUqy8tLlBMFbRgLSkURQWgZYsicbib9qFORSaUNt4iaVbib6CfHSjZ2ZtvzsY76kRw/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('8a7e9289b95a447785191b8c8a5a6ec8', 'oAvgj0WqK0wkNnPdT61TQRqOAyOc', '张麻秆', '2018-03-17 12:02:03', '2018-03-20 09:46:17', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqSyRWoZhhsGXfeiaZNToqTYMOAjDgxBoX5RcJTsBicXUgib2USIfnuhnjvtibwsmx4vln9Giaib25mpRfw/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('8ab1b53777a5444b83e42a641f36a1e6', 'oAvgj0R3zoIkTBnnIsLd69yysBV4', '谢先华~宇飞来.酷聊13408240928', '2018-03-02 20:32:22', '2018-05-17 23:13:33', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eo4E3MA11VcKIPAyibgZw5ODS5nM9AzzN9ZfZS0QzYbsL24KCvFLrWHtf3I0ibdFWz3B4kf3HPtvTAA/132', NULL, 1, 1, NULL, NULL, 1, NULL);
INSERT INTO `tb_weixin_user` VALUES ('8acc0138d534443dbb56f1234901f46d', 'oAvgj0V71F6afKuNVRFNdQX8SXiM', '平常心', '2018-03-04 09:54:53', '2018-03-06 12:47:16', 'https://wx.qlogo.cn/mmopen/vi_32/xPZWicJxFicaaAbr5Ug8pcE47GqPedaRXFibWhDglLCFWmib4Utq8omCibpIOuWoALyfVl8FeSNl0Qbt5fJoGt6YxiaQ/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('8ae44928566c4413b684fa3d6d0f5bf1', 'oAvgj0UlkqRzawLkIA2Lb1jKOs78', '夜空中最亮的星', '2018-03-18 12:19:45', '2018-03-18 12:23:45', 'https://wx.qlogo.cn/mmopen/vi_32/fntgAMNLiaqU1Pm8ovWIXW6b2v8iaTQklvEbxvpzm5zEAFvaU7oIzibrfJBibqbCWKP4rs5BIq7hYfSHRHmrmHghfQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('8b1c5f5c76a74557b9e47979403d110d', 'oAvgj0UU-oA4kPvMRe2hkHZq8gUg', '支付宝收钱码城市服务商', '2018-04-22 22:11:31', '2018-04-22 22:11:35', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIbGacLqibnBtErVsiaEWUtyb5MtUZ365jowXd7gPcA9TmvGRxDMVTQJ3tIRdA1PYUx3Db0XVd1xjlA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('8bbd6029f833434189046ed33c2c58c9', 'oAvgj0XD8uDDbptJNbiGLjqqly94', NULL, '2018-06-02 14:20:27', '2018-06-02 14:20:28', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('8bf095f3d3e24fe5be46e113080ba1f6', 'oAvgj0ZeOsYhuvktaKHjGOWWiz38', NULL, '2018-05-24 06:27:26', '2018-05-24 06:27:26', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('8c42a48113884109b6cea48bececc5d7', 'oAvgj0Xt8j8Yd7wVtO5OQoIP5vKw', '长沙谢海平', '2018-03-06 15:19:33', '2018-03-06 15:24:47', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJXdDCA89R06UM5tX8gekqHVpNuljTO0WmMShAP42V7U3hPureGzBdp7nYicngcJIIQxQm8x6xSRKg/0', NULL, 1, 1, NULL, NULL, 1, NULL);
INSERT INTO `tb_weixin_user` VALUES ('8c926100237d42b88aab754cb2202f66', 'oAvgj0aOfxtID0c9hqPVeAwwgQ18', '贺先生', '2018-04-22 21:47:07', '2018-05-01 11:40:30', 'https://wx.qlogo.cn/mmopen/vi_32/9o5bjRgVDbQ9Iyt7RzABicmyb1CDZjcA137tNIibjTvUcvSSjlKTyUdhUx5lB7Jotfj5Gk5nicQ9d2mVFkJdOQMoA/0', NULL, 1, 1, NULL, NULL, 5, NULL);
INSERT INTO `tb_weixin_user` VALUES ('8d9562531946429cb3c22ac3c210390c', 'oAvgj0VWG3FHOypDSBt8EywksUJw', NULL, '2018-03-12 11:21:13', '2018-03-12 11:21:13', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('8dc3fb20de8b4269a14d6d655c041144', 'oAvgj0WyXFvXDk3tCvOb_r2U3v24', '游离者', '2018-03-17 11:38:18', '2018-03-17 11:45:17', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epJLvfaOzGicJapSf6NMWGCrVCNyL8vk1VkteZPudzk39lZhzWA82ibeH12caB2yicGKCLrYAz172dsg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('8def2dcf85c44235b4611072083d43d3', 'oAvgj0cxAM61ebLA2cxZPMIKbYdw', '小金鱼儿', '2018-03-17 13:10:42', '2018-03-17 13:13:24', 'https://wx.qlogo.cn/mmopen/vi_32/4fBHbntTIXrNFES21FOC1lrvgjFYdOT0lX1pL0J1tP4ianTYZua5CUj4uJfW0odiceEFKAdvyLgbCsIP9tueLxRQ/0', '18040315856', 2, 1, '1993-12-01', '李女士', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('8e4bdd8e4eb643dbba54cc687c297339', 'oAvgj0Rf-Xxrrfa89018UfQ5fz-0', '青山', '2018-03-07 10:10:17', '2018-03-07 10:11:46', 'https://wx.qlogo.cn/mmopen/vi_32/kWSOpA453UGYeMqhKQwXjo8HH7xcZtrcrhpyGPRnFfuzRoABhKlnYmczQNiaibzCW4wfcoV6FQR1OXldL1He21Tg/0', '13981888758', 1, 1, '1986-09-01', '青山', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('8ec4179c97da4d66921f648c30d2b622', 'oAvgj0V_k_xaw1s290Dvdvmjck_s', '胡秀才', '2018-05-18 20:10:39', '2018-05-18 20:10:41', 'https://wx.qlogo.cn/mmopen/vi_32/xPZWicJxFicaaAbr5Ug8pcEibaewjyCL5BfcBGyj2HffHicXN7R7o9BK8OdjLWsalC8ibVWG0fAPvaNSNXWEYH69z9A/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('8ecda9339a0a41248a003b82ba89f720', 'oAvgj0Vc4gXPojJLFv2qgkUEtRPA', '小徐₁₈₅₄₇₈₀₉₅₂₀', '2018-04-21 17:48:53', '2018-04-21 17:48:57', 'https://wx.qlogo.cn/mmopen/vi_32/RumFzH7fbGrzv1PSaoicffOSia9licibrt5FMqHVibW61f48olyzj5rjOv3dKciaVbFWEvpRvpojCC6o6iaXEPAjK3e2Q/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('8ee11ebce9c34d24b8c6ebcb42348385', 'oAvgj0UZ1iNiakI0n8j_l3Aw7P04', 'rdgztest_YZNLEH', '2018-03-11 19:11:14', '2018-03-11 19:11:35', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('900aaaf24fba43d1add078508c8231d1', 'oAvgj0VkZnumJ2UcqzNeKk24jQYw', 'Michael', '2018-04-14 13:24:02', '2018-04-14 15:05:30', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erLFHv0pFbY64L24Or9pyjl6aqic4fRT03C0oiasJd27R0mJ8BKMIYgkj10ZJV91C6NDNjUxQWcMSBg/0', '13632875380', 1, 1, '2017-09-01', 'Michael', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('90295ad92d6c4f919fc5b3df10ec3a9c', 'oAvgj0WkmHIKH3LZH1Z1moFjfBkE', '峨眉山', '2018-03-18 23:03:59', '2018-03-18 23:04:01', 'https://wx.qlogo.cn/mmopen/vi_32/Ee3rJFn8tPwt0vZhjFUGmZt7ibv9MRkrWSconXibRgu0F5FoS0ZEVE8LxlpR2dfmSkLq4wZccgzL9cjxibcvQhITQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('90c5ecf5f40f42a8ac3df148eecf20f5', 'oAvgj0QPtrcu3ZX3xtDAnyOXQVGA', '静静', '2018-04-15 18:19:01', '2018-04-15 18:19:03', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqSyRWoZhhsGdUrly7QYtH6ej9nPz8swQiaJhYNLUcBjft6ZpLNDZVrqXF3MJFLoktwXRckIxFSbWQ/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('90c68d2cc5314844ab7077f5189d46b2', 'oAvgj0VNd-COA4aHABBscsY16hhQ', '天高云淡陈勇', '2018-02-28 16:32:35', '2018-06-04 19:35:57', 'https://wx.qlogo.cn/mmopen/vi_32/yyQtCcbwOahWvaEJYBia0nwdDUQuSNrtxe8S9VAWrdrjctDYccaMOBA3dzFwca5r3uxmrjMxSLZDAARl0EDPukA/132', '18990673099', 1, 1, '1970-12-28', '陈勇', 184, NULL);
INSERT INTO `tb_weixin_user` VALUES ('911221065ece48ccae03d04485882965', 'oAvgj0VjTxB11U-5N7xC5JFQkMMw', NULL, '2018-06-01 19:59:10', '2018-06-01 19:59:12', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('91d115eab4b646bf9c1c771db7cacb0c', 'oAvgj0Th4PWzP9GX1U5KprMA7s3o', '李牧之', '2018-03-06 15:59:57', '2018-03-06 16:02:05', 'https://wx.qlogo.cn/mmopen/vi_32/CCMqKBZEjcIBInzibpFhib0knCaxRrdvcsSty3mCZ2QO1ia7oAgH4n1QgIuRxC7RtAVdVZLickTH9xW93ruYicqAf0w/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('92045d66747d44acb4f6307e36fe6e47', 'oAvgj0Xa50GIegU0YWlAHbo6MssU', 'CDTV2纪录者_冯明进', '2018-03-08 11:49:52', '2018-04-22 11:56:42', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIicgnIM9dnl9qViblyJeLMPBgOJcKh05J3NkTYLr1MxrUib7Wl6Vep4GmttaWZ6TgyyHbZhA7HhqU4w/0', NULL, 1, 1, NULL, NULL, 2, NULL);
INSERT INTO `tb_weixin_user` VALUES ('920af72963e343398fdf01022914b13b', 'oAvgj0etaV8EuGXU546fWrQ1zNoU', 'rdgztest_BWOCRG', '2018-03-11 13:27:17', '2018-03-11 13:27:31', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('924dfb367f4f4f90b0641c5f9fa5af2a', 'oAvgj0aAfKFMs08JpwPcocak5tCg', 'Grace', '2018-03-17 12:13:03', '2018-03-17 12:24:33', 'https://wx.qlogo.cn/mmopen/vi_32/rLlDicqBx1WNARAsojwFT320bpQLibgNr99ttCnlzzBWU8sVNDrH6pe6XSiat1h8icsU7VMLkGdG7zh3j01lGGZ19g/0', '18080015373', 2, 1, '1990-12-25', '刘述华', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('92e282ff6f5f4f199474748ea4f3cc54', 'oAvgj0YYE3VRn_3QLRZ80QBW2TEw', '岳友军(宇飞来·酷聊)', '2018-04-30 16:38:31', '2018-05-27 07:45:36', 'https://wx.qlogo.cn/mmopen/vi_32/4HiaHHeHoricnsvd9ibPrDgBZBRpTVYVeiafJ5xkEwHtniaPt9zygic48t8oBKGUDHxeHE9pmHfvA5UaMqbcVibfKyKvQ/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('9301dd21d81a4d64aceeab27977a1fd0', 'oAvgj0fxvamuoUzVO3CL3tta-7Co', NULL, '2018-04-22 12:09:11', '2018-04-22 12:09:11', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('93131f1a7a104093bddf11bf07979b23', 'oAvgj0et9MowHSiVUFzIB4K9IUwY', '琦', '2018-06-01 18:00:16', '2018-06-02 14:42:59', 'https://wx.qlogo.cn/mmopen/vi_32/BOwuS7jXgUic7eDeZXcwZiabT9rZrHRbPJdUf560FqhsoGibhSpQlOnhicuLLHj5SCfrUHhB6727aiaibHE63O0KIzIw/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('93a3d0d43b7b4328bb0a577b894eb987', 'oAvgj0QR2xFJ1-Egvy4UKrP6xS_8', '成都游览年票', '2018-03-17 11:08:44', '2018-03-18 01:32:30', 'https://wx.qlogo.cn/mmopen/vi_32/sC9fhbaicrvIZMX41Pl75ibR1aV9g4ltmHQe6qpk16oicbibeDIqZORvCK9GwIeIuegxsYEyvysSaF9jUkOCsNa0Zw/0', '15244870387', 1, 1, '1994-12-11', '彭紫阳', 2, NULL);
INSERT INTO `tb_weixin_user` VALUES ('93c6a937bddd489fa5a0115a34a262aa', 'oAvgj0UmuLBqLpsob94iUgARLQP0', NULL, '2018-03-15 10:47:48', '2018-03-15 10:47:48', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('9410e64472864d9097a5190f9338e35d', 'oAvgj0c2X5LWgR6iic_v5RetChAM', NULL, '2018-03-11 09:01:54', '2018-03-11 09:01:54', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('9483521b8ec54df9875d193cf9d9b5bf', 'oAvgj0a-HrFPIEJK56GSRJ16EhnQ', 'John', '2018-03-08 11:18:59', '2018-04-21 13:01:19', 'https://wx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLDAibtKEUOULfHy3WoDCdfZnOMb3JY12Q5udDaWILpxBlFH2llhDt3IJmNVP4QdyVlJUG5llicsQlibw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('957c10cd945a43d183300656cdcbb616', 'oAvgj0dRXB7cZA017LQtUu3Mp-bY', '凌在岚', '2018-04-14 13:29:00', '2018-04-14 15:14:49', 'https://wx.qlogo.cn/mmopen/vi_32/jhykFn9z1VpODnoAPv128HtaSziapejrQPZQSib5NgQYjhXLGsqYXR5uE1Ee7sYWdS3ZM8Nic5IHU4qjn1oKTCbxg/0', '18000517656', 1, 1, '1964-10-22', '凌', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('95ae5a2fac074010908b2683e1de4d75', 'oAvgj0Ww-AwvhMTfmW9O05joXHSI', '流星花园', '2018-03-09 10:57:09', '2018-03-09 11:42:40', 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaELicnG6Ze8zHfZ3Q5DjwBhOPPT6SnrYGicicMNjbRXyUtFGrMy0HNxbIoqDoMh8iaG811b3bnKKKlz3KQ/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('95c4ceeba46741bab2d261cd70f67b95', 'oAvgj0cKTb91Agf6ja98vQPk7sbo', 'ToNg', '2018-04-22 21:58:14', '2018-04-27 16:20:36', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJjGypw65XYqeha6S0AfXZj7NkCcPIwI4y6RaASbUEmUuN9HnWlslKWRPZUr6dnHxibDx7icPNX3mibg/0', NULL, 1, 1, NULL, NULL, 3, NULL);
INSERT INTO `tb_weixin_user` VALUES ('95f7d6eb736f4602984944f2b3c20a3c', 'oAvgj0c1AW6PR4wEbQshvooJwvhg', 'selinanini', '2018-06-01 20:03:17', '2018-06-03 18:04:52', 'https://wx.qlogo.cn/mmopen/vi_32/pZ5p3RndmwocibshaUrCrZIuNia5xAEWXUicInrNYPtE30zibJvoBRdLmcn6iaOr5t6wM4DYYxnh2wUQMibMpHBINn8A/132', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('963d280ec8b049a685271c81856e7672', 'oAvgj0R7SjDdHcPp_wbWFRbgmmbU', '清音梵唱', '2018-03-27 15:00:49', '2018-03-27 19:40:30', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoZU29OgA5ssjwibDopNJOgAUe8ZtVibq4ibx0GOnKRmwBmyaUwKUZ49AZ470KKnkJC414tMcbvb5tQg/0', '18080666176', 2, 1, '1981-10-26', '郑奕', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('96d616fe071847d4b2c471825d0096cc', 'oAvgj0RZJGPuI2Eb64fi3SvU4Vsc', '脉动', '2018-04-22 22:00:45', '2018-04-23 08:25:24', 'https://wx.qlogo.cn/mmopen/vi_32/QNfFu3UkKog1ctCtnibicNrFS9efHZLwfG6PMiasRsklkGg8dISWu6kRrdjXnIgNklNOkmGruEybZTVFfqQrMjlWg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('96ff3d90c15d484daa5f878df6f2b344', 'oAvgj0ejDWXqmzl9ghAENezERrFQ', NULL, '2018-04-14 13:30:54', '2018-04-14 13:30:54', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('9777d33e836e4259becd8c3ab37daf85', 'oAvgj0UyINxQqV84q-ErRaDnQL5E', NULL, '2018-04-23 08:13:41', '2018-04-23 08:13:41', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('977aac29029845c2b33bd36e847bb288', 'oAvgj0dVcX6vAKN8Cm6MC-yXtt1Q', NULL, '2018-03-23 14:33:41', '2018-03-23 14:33:41', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('97de63491da44a55ad2c06e376b31fe2', 'oAvgj0b-0tPd_UJSNMDp94p81WBs', '螢窗夜話', '2018-04-23 13:23:05', '2018-04-23 13:23:07', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKPLASKTsrc7V3mlJLoy71uhgzGdoXDvPNhd9T5KVXj4zwQSWWeRNl7ficpbxicDlGSicLROnnBswbEQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('98b0d4228a614288a815d75471621b92', 'oAvgj0QCiK_raaV2PTGQmq5xuyYY', '站在岸边的鱼～', '2018-04-21 14:39:56', '2018-04-21 14:41:15', 'https://wx.qlogo.cn/mmopen/vi_32/ficVp5oVcY6PeD69YQNdzZuNzwyAHoHRGOs40NY5x1R82QicFGstjWFg8wJdhB80JNMdqDsEsvJNCvTmfRITDYKg/0', '13308237884', 2, 1, '1990-09-01', '杨玲玲', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('992d5181aef9468baa9132149235744d', 'oAvgj0UlwdYzoez0SH0Gjj844qWc', NULL, '2018-04-22 21:14:02', '2018-04-22 21:14:02', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('993294fa208644c0969e2a96eed0c414', 'oAvgj0XtGNyEtjot_Ud027FZuarQ', 'Stalwart', '2018-04-25 15:58:55', '2018-04-25 15:58:58', 'https://wx.qlogo.cn/mmopen/vi_32/Qps8eiaZjuicGDJfWF6gfPkR0Y9SZpyiae4dOGC8cjVlrqA6kp8JibLlNBQcAic5LsuLM7eSClbRqw470z2L0csW0nw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('9aab9621c41a4fbaadbe80b64077743a', 'oAvgj0dkaex-_5OelzxzHNa2oDb4', NULL, '2018-06-02 14:19:47', '2018-06-02 14:19:48', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('9aaf783c0e0d495192cbef6d8a2706ac', 'oAvgj0WC07ihJEsYCQDtKEiac2qw', '邓春燕 ', '2018-03-18 12:22:24', '2018-03-18 12:24:11', 'https://wx.qlogo.cn/mmopen/vi_32/cxrW0ia85sxVSWWL6nyW7SJU7IwSic1kjjQdVjSpSdw890gETql6g1yOkSMcdsTibpqCGel0W7nQ2nsGVOLhkOQ9Q/0', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('9ab6a270adb14a65ac8efb5eb7c97278', 'oAvgj0WExSGSpVhn-azpMHmuTPcU', '谢联峻 Alex', '2018-04-26 17:25:05', '2018-04-27 21:43:05', 'https://wx.qlogo.cn/mmopen/vi_32/NlPQkib81Xm7RaWPzxX3LvopwMRd73NldTkrbnFhJiccsUmsIzpUaI55dPboerIVzGz5d6OgPVHpsoib7kIA36dTw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('9aed195904d4482da45d1f2a7551c9f2', 'oAvgj0QCBr0Ppipq47FhhSbQ3q6k', 'Joker', '2018-04-27 13:45:16', '2018-04-27 13:45:17', 'https://wx.qlogo.cn/mmopen/vi_32/w9ibFg0SIxOdhTIQaic2vl48EkVpNgD0ZXN6suDwenF1WZLWNIW3NA895o1iclEPIAfdcdNXKYOl0WqdfrJDrrtQQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('9b5a2843fc4a48a594bad087fb77abc2', 'oAvgj0bqohtOFajwajhuzkex_mpY', NULL, '2018-06-01 17:30:18', '2018-06-01 17:30:20', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('9b68fb17bf264f96b30c382c83a8756e', 'oAvgj0T18R6Z_iHfQb9FSFyconQ0', '吕权林', '2018-04-23 20:42:33', '2018-04-23 20:42:36', 'https://wx.qlogo.cn/mmopen/vi_32/Qps8eiaZjuicGDJfWF6gfPkZkeTe2xkr2GRXgB3HibQJW0TRS2HTW14HkQtDpWiadNSqX7zndFib4dwfCRHhy2cdfRg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('9b98b4aa47134437af029f227d27bbed', 'oAvgj0ZrnnAoxsaPIGEri5v7fQ08', 'xx.眉间轻顾九月寒จุ๊บ', '2018-05-07 16:50:24', '2018-05-07 16:50:27', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ4FKUrxtUVXZ5wia3O13UxEBMQWWD3D7WURLRTqNVoIibgJ6Fqh1BFjEgRj7cDa85ibXiaj6IALgibt7A/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('9baf8734d8bf4e489ae18b42b4a6ad48', 'oAvgj0TcmEVvx3LNb6mWHwE1xO3w', '姗姗', '2018-03-17 16:16:45', '2018-03-17 16:18:03', 'https://wx.qlogo.cn/mmopen/vi_32/edxicEe7orbAlcPQF7VRPnbF3syNugCBjEubgpGVAgiaBBLxEMLNGc5NcnvZGmqOxyPHhHlayeDYxD533OtogGuQ/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('9bc8a2519a154cd39104467b566d90eb', 'oAvgj0fmd3HlZ2feMua5QXhGucyU', NULL, '2018-03-17 11:39:36', '2018-03-17 12:02:21', NULL, '15908317868', NULL, 1, '1996-02-15', '唐凤', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('9c211ecf2e9242cf9a1869f19f0d5e1f', 'oAvgj0b3vHVd0FPYsgidsSkm-04E', NULL, '2018-06-02 14:44:14', '2018-06-02 14:44:15', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('9c8e16383fc346aaa6371a527c561ce7', 'oAvgj0UnsHrCl1qJyoiZYTOXI2NU', 'rdgztest_VHDNEL', '2018-04-17 11:20:35', '2018-04-17 11:21:23', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('9ca0fcf8915e453b9f7d51deac3b819f', 'oAvgj0V80Mn5kiJ2u1jkvFUQhpCQ', '邪', '2018-02-28 17:07:35', '2018-04-13 10:14:24', 'https://wx.qlogo.cn/mmopen/vi_32/aUYQ9yOlKZmFVOibexC6JdpXEc8u1cYFoASv5sHvVMZ07nNrmzvMzYybNJIic3Z41EzbL0XuP7roibuyiaEPqzyycw/0', '13063862986', 1, 1, '1995-07-28', '13063862986', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('9d2f8afa737b4e1ea06d0b2ad029430c', 'oAvgj0RVPtwKYO9uUOCS3fb22Mgw', '传播-推广', '2018-04-22 21:09:59', '2018-04-22 21:16:46', 'https://wx.qlogo.cn/mmopen/vi_32/KibG56Bh3ysVApxksnPxMlXODwKcgnOLtvFR0r1DhugFlK9xZKoRia7U0UKBIgXmmzqiaoUne75ofCy9KjxprwLLQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('9e0132e0560d4be58c1d00a5361c9908', 'oAvgj0daZIJiDXKoW_xnKIt3T7Po', '汽柴油周15066028650', '2018-04-22 19:03:49', '2018-05-03 13:19:07', 'https://wx.qlogo.cn/mmopen/vi_32/TUMtkaIMdbHQI7P4SibsG5aLReWMc2JtF6YDOW14gNG0gZibbUV3OwYhkunJ936G3USBxZEQ4LvQsuCr8L8Fbbdw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('9f28438280a44361a4b0cd72f0e60135', 'oAvgj0T9TLhzd1Xp23CqqdLMUBeU', NULL, '2018-06-02 14:18:40', '2018-06-02 14:18:42', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('9f7c1c0a4b3549afbe6152d031a83d67', 'oAvgj0Ztvc1AqbLCcnHOwa1l2W5g', NULL, '2018-06-01 19:44:50', '2018-06-01 19:44:52', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('9f9de30b6fd244828bb996ae1b1b0a98', 'oAvgj0b4KuI0TAUSy-uNXj1k5lro', 'Yong(号已满请加InciteData_ZY)', '2018-03-05 16:35:25', '2018-03-10 21:56:22', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKVkoe7Viae4ljcI8iazADbNlwAEUesziaFs73sUTgzibsN6pxFxIGZ6qhdvhISPYBiaRZr8jplAL5rZYQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('9fedd79dbf2d4069863cf234ac9706b6', 'oAvgj0SVi7J64WwiFQITp873ooG4', NULL, '2018-06-02 15:15:39', '2018-06-02 15:16:15', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('9ff59d024c594c159619d5644edba645', 'oAvgj0e8ovlvGyLIs_f9LauZbhQ8', 'summer', '2018-06-01 18:15:10', '2018-06-02 14:22:24', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJJQYnrTXgWgnfTpicFxYwXeGfaTmibO20O0xEHFzU6LDDJSalglsia1QrWYZ59ia1w4rDFnprTzsicqVQ/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('a0e69320c25f4c8082385a8a57991980', 'oAvgj0ZRBeusltKJKyDyaK7um6WA', '燕紫', '2018-03-07 10:36:15', '2018-04-13 13:48:58', 'https://wx.qlogo.cn/mmopen/vi_32/8MYMIAyRyAWoJZJ0Or1NIVxvMRiaScxeuJhcr5Nu3JeJGtym0ou333iarJRO1Fg8qruclXmGcWIdPIUKSoOyKViaA/0', '15082244056', 2, 1, '1976-04-11', '金燕', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('a10946ae01df459eadc558d9fcb17768', 'oAvgj0V5z3gtKG1HcWkLB0q-XHtM', NULL, '2018-06-02 14:18:15', '2018-06-02 14:18:16', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('a10e3e23b61f4698a17187c082ce79e8', 'oAvgj0XALuwgfKF7eJ0lTXPO9lg4', 'Seven', '2018-04-23 08:06:45', '2018-04-23 08:06:47', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ7mAt63VrbLVAEaLYyoxNjJ0ib6mX76eQtLdibNcK7iazpEo1h6UMzG3lfoTXneP701KdSRg2RL0ic8A/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('a11a7903a122493492c129518697019f', 'oAvgj0bSkBp5ZDhHQOgcrRSsQ0SQ', NULL, '2018-06-01 17:14:54', '2018-06-01 17:20:22', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('a135580784c244a4944c4ce90a26cff2', 'oAvgj0a_orbG3zvdKLVYkjesl6QQ', '北冥', '2018-04-23 11:51:35', '2018-04-23 11:51:44', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL03jMSeNOuwFicGY0zXpM6NnkanvicUG2KKCOODStZ3gX3laiaMLU5kunTnUCHClpEuBdgiblLonAXWA/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('a1d4d4005e3b426f9e03d760dd9e9a35', 'oAvgj0bcDPvzStK5lniPv2RkX_N0', '成运强，推广渠道经理', '2018-04-22 21:15:53', '2018-04-22 21:15:54', 'https://wx.qlogo.cn/mmopen/vi_32/z3REBgicjSKCHJX9Fb5mfjXmwKvpPnW2ia9FKhmWotefTy77C9GCycdUANzzmia25USpQXOrrjTARHIL3zFhECgtw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('a255b20023a746079198e7a328a2322c', 'oAvgj0fMTSt94980iA_pBE_uKTLo', '一直在行走的猫', '2018-03-08 09:23:47', '2018-03-08 09:23:48', 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEJTv7IH4iajdF13maCrFiaaIdakEbkuS2uYicau2l8qLtVRtt41Zbj9dGxK22fNzGfvMLWJYojYLpdjA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('a2eacc35163c4f28ae0058f7dc35243a', 'oAvgj0ZtotLb449oDUtwPdYPJT6I', 'LB', '2018-03-07 16:57:58', '2018-03-07 16:58:43', 'https://wx.qlogo.cn/mmopen/vi_32/WP8FMAbu1W1szxEX37O14bZtW5vP3ydgjedc4bAiaKAlUu5M7UwzkqW2vXVibWpW3BNbwzwjyQKnXBqXlwgftJzA/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('a30cd73f5d134fccaa215c4ed2c45ac0', 'oAvgj0UEiDdTQFIg8GR-dx0cTM74', '鸿雁（Yan）十八颗美牙守护天使', '2018-04-26 17:25:32', '2018-05-18 06:32:28', 'https://wx.qlogo.cn/mmopen/vi_32/80ic71CY15WicMXLkAaKmIicJ2dWIia8UpgdDCsHnSHs1upMqwdxAmM6MHQDdX7fVoWicxXrn4XNKyQORRGtNwicWibGA/132', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('a325aa7bc1bc4f2c9c6eabfc03594d8b', 'oAvgj0eoxmL7IhdsTfrt2CVWqtzE', '胡蓉', '2018-03-17 13:06:12', '2018-03-17 18:58:35', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK8QF4GiaHY0CI5DNRbNXaAib4rSeAC9QAYHtLYpFNOMVHzUrKFTiaIibnoibicRmIdMiafKR0eOc3klTB6A/0', '13438473237', 2, 1, '1981-06-05', '胡', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('a3657f73e0844a448042252fe140f107', 'oAvgj0V0WqWCfLu3wBEi1Qh3GEDE', NULL, '2018-06-01 20:08:47', '2018-06-01 20:08:48', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('a38e9c5f0253423e9f98e7a111dd09a8', 'oAvgj0byYHLevku46_wDVl3gJnLw', '阳子', '2018-03-12 11:59:04', '2018-03-12 11:59:06', 'https://wx.qlogo.cn/mmopen/vi_32/4ia1K0FXqS2N0GsibFwnnYwz98iaYcEAwY5s1h5iatKvPhd9DjfjwvbUZgl48g2b8gLochZEBefM97PRe0gyRsjcng/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('a3e7c5da585b458394976f88a38d1ea9', 'oAvgj0afWtDAewKiKjnqQ0Cn2v9Q', '百度邓小元大数据线下精准营销推广', '2018-02-28 16:33:33', '2018-02-28 17:11:18', 'https://wx.qlogo.cn/mmopen/vi_32/GWkOdEHQicAE2PDyrv2BkFgVqlDDFdw5dRfBxOeMCpkzH0HhFFtsH32icGv9loBBRSCIeFhMTv8yYF15ALZ1RQXA/0', '13880598704', 1, 1, '1990-03-20', '邓小元', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('a428ec3f849f45b1b924a8e8a11769cc', 'oAvgj0Vb2hmfianIWkU9LRwstAv0', '尚哈哈，', '2018-03-06 09:36:29', '2018-03-06 09:36:31', 'https://wx.qlogo.cn/mmopen/vi_32/HkngmFtnCVpnOzP5DPMSjUZOW1Z3tqsHMxZKupVlm7n76OYN3Eyj5JtiaMMuazNHMxib66dmpauwEnj9BWIBJicQg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('a45edbd579b34f2185dacefbf97afc43', 'oAvgj0RHKaMk-KJn9vhI2hnabeVY', NULL, '2018-06-01 20:12:31', '2018-06-01 20:12:32', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('a49d62d3ec444f15a1aefa8305fcb911', 'oAvgj0X0O7PSxEg7EJU9oJtKx8RI', 'Chris', '2018-03-07 10:37:18', '2018-03-07 10:45:43', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLnesOMuEJgqLueHmmkWznLWwgGRKRCjSJLtlwXwEYq8pYYwhsS148Ywm9OEyhf1LzXouePicL4TWw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('a49f7c63acea415b8bedb8821e36943a', 'oAvgj0SQnA4h0bdazyaCf4XVwEtg', NULL, '2018-06-01 17:43:48', '2018-06-01 17:43:49', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('a666342e62824c00bf7e33aa7983e746', 'oAvgj0doQXQF9hPyDAYyIAGDnFmY', '心梦无痕', '2018-03-17 13:01:32', '2018-03-17 13:01:33', 'https://wx.qlogo.cn/mmopen/vi_32/Khl1iajaAB3TJWmgE2AMicXh2JR0tckC9vDxQKiakPV6rN9dEHVtBeEqvCclOHeM3ulPOPQ2NsLIfXic6thXHdWuoQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('a7146c08937f43ab900319db69b39bfe', 'oAvgj0Q_QQlkEwmY05hOX-7Vd4Wc', '唐亮', '2018-03-09 14:21:53', '2018-03-09 14:21:55', 'https://wx.qlogo.cn/mmopen/vi_32/7icobCA5aE7B05xbYjVswFJNm5wkkZ0yN2UlHIosRibPVibHMSscatrsclMW0MbeK74ib8SFyBNkJC49ObNogx7tvw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('a72274f8107f48ba93fe341ccb926fcb', 'oAvgj0ZmUloMLm3NIQnhqrw4zwUw', '静思清怡', '2018-03-15 19:33:32', '2018-03-31 16:14:41', 'https://wx.qlogo.cn/mmopen/vi_32/oQknVLicbHPF6icrZtSn4DR6Mc396N4FWEHbdGLZteYG7541ISlpmg2Bs3BiakhTOp3nDILO3beWrtn9eaTaNZ2mw/0', '13398188873', 2, 1, '1976-11-16', '郑崇凤', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('a7a468146bb9419ab9e45682f4864c52', 'oAvgj0S1q_dbEwjKFpCuzkwYCXOg', '众享亿家商城', '2018-04-23 05:41:46', '2018-04-23 05:41:48', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL3PfQEBVDzd8lxafR6ibqweRMcama10wDSM6ptc1ayic6Vwwqn9DibhjZ0k0jSkziaYaoabwibonYKN8A/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('aaad4519734743e997f43988960ea67d', 'oAvgj0Y4zvN-qbe4s5p2PVtxe_bY', 'dxsupport.cfg', '2018-03-30 16:30:34', '2018-04-10 10:18:39', 'https://wx.qlogo.cn/mmopen/vi_32/L6SG55UJpKTgWOibWkoFH8kEjxtMLicvib8ic05XOSByB8NJ2nDxx8EG0tPbaYjCQyebqQiavib3frye5L4JuqafxfqA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('aaf6f2f5e6224a24b5e3b6ddec9d273f', 'oAvgj0bmnhCmDYdf1sBjsfWHfVCY', NULL, '2018-06-01 20:39:50', '2018-06-01 20:39:52', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('ac11cbc2129a418c8b5a04d5346e8cac', 'oAvgj0UWlbX0b_XNFOZIaChshD-Q', NULL, '2018-06-02 15:19:04', '2018-06-02 15:19:05', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('ac3bd855d11e44078b89ba5fddc53073', 'oAvgj0fEcHAHVOLStw0WV4cg9Cx4', '陈阿土', '2018-04-22 21:38:46', '2018-04-22 23:15:27', 'https://wx.qlogo.cn/mmopen/vi_32/NJIWsZ7hUPwoxnkCzt79gLtfzeCfy84Fq5aicPbZxU9xrKKAFarmiaDawn5ySbtzeMKI5VBvRG0gaaSn59ZqIh3A/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('ac532df7fcbb426b94cced6965403d3a', 'oAvgj0ZfPYGU9GnLmvXRBHsMx6Bk', ' 橙心橙意（付呗）', '2018-04-22 22:15:57', '2018-04-22 22:16:00', 'https://wx.qlogo.cn/mmopen/vi_32/iaAO8FKnYTicDcicobbw11lAaN8vqmJ2afuGBQULQIuum6sWzw7SbHKSibFYIE68XSJUPzWzUkFG1jsLWEeYy87dcg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('acce5642052c4caa8033f7c1bb46235e', 'oAvgj0aKBwN8dtQ4YCxUUbXU19Zw', '你的模样', '2018-04-23 09:55:52', '2018-04-23 09:55:55', 'https://wx.qlogo.cn/mmopen/vi_32/OwZuBRbVUkzf4zn3kuHnmfNYgzJaqNDV7KuYHPOmlqSTDiblqV9Xqfu891HkSjEPM3ME9ibsAwX4zsPsZF7PPK7Q/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('acd4a6e10427427b90b669845ea8a7e5', 'oAvgj0R1uMPcIcTEcV-aQwuauH9E', '修行自悟', '2018-03-02 17:46:58', '2018-04-14 10:26:23', 'https://wx.qlogo.cn/mmopen/vi_32/0ec39nOXqtr8j6nxyMRNsdIacgj58ibIdtEMibtRd0rlAu4124s4EmXibUJ7BP3Gic8IzsS4upOsQibdIMDqQX7AZag/0', '13348862793', 1, 1, '1969-04-01', '郑海波', 9, NULL);
INSERT INTO `tb_weixin_user` VALUES ('ad4b556d34b2414d811e39bbc8811266', 'oAvgj0bZ3kX0JIA4SESFdF_6fEOo', NULL, '2018-06-01 17:49:41', '2018-06-01 17:49:43', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('adf60c723e584fea80939abe0770ea07', 'oAvgj0UyU3qdVered9V6aB3Z1NkE', NULL, '2018-06-02 14:07:29', '2018-06-02 14:07:30', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('ae159df31fd041208543d78907c9fea2', 'oAvgj0W4XpBb3Ag0KQj-hh-DZaso', '米乐', '2018-05-24 13:41:27', '2018-05-24 13:41:28', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI0vAkncIW7iaiansTVj6mbJPUv2S4WUYaiaUliazSduPRrEkp2RwCnH33cUPJHANqAoVKzguedkPiau5g/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('ae16420cab724cb1828835e32f218144', 'oAvgj0SIDgQBQyXxczX1RIJLz2F8', NULL, '2018-06-01 17:47:14', '2018-06-01 17:47:15', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('ae63bbec09784999872736b2ad58c693', 'oAvgj0Zoj9KVwz2ODGBya5JCDKTw', NULL, '2018-06-01 18:34:52', '2018-06-01 18:34:54', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('af29810083fc4ba3b5b1de5e9ed9ff4e', 'oAvgj0b-ohI2nxluL2KrxMceKqj8', '～高颜', '2018-05-21 23:06:12', '2018-05-25 11:29:13', 'https://wx.qlogo.cn/mmopen/vi_32/RuquAM7T8hQTvIIfmJ8yxHHCPlvbiaNSN04icEH92f3nBGG2DyWKufd18lCHBNiapUzkow9DFBzD6XC2X8696WibLg/132', '18190939153', 2, 1, '1983-01-25', '高颜', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('af2ed99f013e46089ca49ad9226c7a71', 'oAvgj0SRcjz0oTIVKAyESf-YHCuI', 'fate、方', '2018-03-02 19:26:59', '2018-06-04 09:44:57', 'https://wx.qlogo.cn/mmopen/vi_32/zVjUVOoBG1eic7ErZ4DJ9S7heLg4xyocSNiafmIRxSqxLqlWco7v35q7yZmYtn6OrCyKSuX2YPIkELCh8Rm6lVVg/132', '15902856567', 1, 1, '1988-06-12', '方勇', 3, NULL);
INSERT INTO `tb_weixin_user` VALUES ('af5830ef3b06419184bc44a7d6312e68', 'oAvgj0TQrxquQERhNW7jXDEey4qE', '王琳颖&旅划算', '2018-03-08 16:30:58', '2018-03-08 16:31:09', 'https://wx.qlogo.cn/mmopen/vi_32/L6SG55UJpKQ5dicLUqonxAtcRhlq3o0NibKTN74PFovs8GaKul8FOI9icE4nr45Gyu1qKMSZL72IvjbiaJ8BZib1BDg/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('afda19dbfef84262b9acf176e849eb98', 'oAvgj0XqykqPvY9Ujlay9VWx3RsY', ':-Omen不亿樣', '2018-04-22 21:27:59', '2018-04-22 21:28:02', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqmx3B5glIUf0ncY6hDTRZkqghNo0AgwicBL7Y7kylKrbW69Aw9IVfmy5TGGBoGHXqNEjmk74m0GlQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('aff089568abd4ad09aabec2ba82016cb', 'oAvgj0cRV51nEgds45wuZXXgkCcw', 'A.［飞联房产］、林琪', '2018-03-06 16:24:36', '2018-03-06 16:39:43', 'https://wx.qlogo.cn/mmopen/vi_32/kB4swUuCyM8fia85XygHQYSiaqejGgKl2Nsl8TEfwmJFS9v7jsd4meHLXf0aRiaNTROI7KbjnGzON69ZVHsShYNlA/0', '18383316617', 1, 1, '1988-08-20', '林琪', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('aff922738efc4305b145a29f515e4c52', 'oAvgj0eeQHcj2FWbrVt8qeabGeYE', '奋斗', '2018-04-22 21:52:02', '2018-04-23 09:59:45', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIkMt27C2AF1p1SMJEgXE7t061iaIeOyicYYVZzEW4Uysw4TEN26XwoYD5uFwOfqjMkia0sbWtRDYhxg/0', NULL, 1, 1, NULL, NULL, 1, NULL);
INSERT INTO `tb_weixin_user` VALUES ('b100df58c14240419d3dca5231681172', 'oAvgj0UngYZI9WIZ8CPoxaNSjj1c', NULL, '2018-06-01 17:59:31', '2018-06-01 17:59:32', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('b1481a3cb6874c3092ef9f80b1c9b616', 'oAvgj0cWYRuO7HVarcMf13kq7-4U', '小明同学', '2018-03-07 15:37:43', '2018-03-07 15:37:49', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKzCNgrqqibVZPm5j7w83bhALFB9nXIeAfcgEphFOFRjVX7yarnOKVJGOS2QU2BhZcw1Tu8ia7tcthA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('b14a4ccc461043f58597728dcaa63529', 'oAvgj0RZZJdO8SPh1OIy4SaPshYE', '云程序', '2018-05-28 16:26:28', '2018-05-28 16:26:30', 'https://wx.qlogo.cn/mmopen/vi_32/OYWRhBkhAicd0UlOiaXL62urdMersKST0CCs5BAZsDwB8bPdibc7BVSGsng8jd9r3gCIaU0c7iboaKTNTvzy0hibWWw/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('b1f6107b05b845a3b446e7ad3db69d80', 'oAvgj0YcV43gAEwZlLzzRnt62Tag', '快乐', '2018-03-17 11:20:40', '2018-03-30 14:22:25', 'https://wx.qlogo.cn/mmopen/vi_32/zMiaibfRJOavFiasmz0wJ07slGIEkHlBPNhp9ic0I4LDCO7YQeyf6TXuAXcnrUsPcQtKh9aNm4fV8M9Rkf1TnkpfKQ/0', '13980049020', 1, 1, '1978-06-05', '杨超', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('b1fbd3aeb80a4b868cc9389f54d3ee49', 'oAvgj0Vf8ht1stYub3R2v4YZ91Gk', '庞先生℡¹', '2018-04-23 09:13:49', '2018-04-23 09:13:56', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKic1HtFiaAFz8AA7MznelUoh0Szb0zlWWUibfShbibSnTQwIoOibKoEC0lO90PNXibiahjcedbWLZ7apZcw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('b22b2b63101344ce9eeaaa678c4ea168', 'oAvgj0RPY6FjvOIuHtPOVRCYMGpM', NULL, '2018-05-21 12:29:31', '2018-05-21 12:29:31', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('b24430baf8324e969bbc6dbeab423a51', 'oAvgj0areEFDQrqZQ-vfqTHy4Ho4', '念燚', '2018-03-17 11:34:55', '2018-03-23 12:39:37', 'https://wx.qlogo.cn/mmopen/vi_32/noweiauMbxKoD1erspdDgsqJ9F7x2WPKCxtC3W9tk0u8NJPAXZrpicoVibOkibz2ThiavUnbduiaCbI0L7KN1eBaDPqg/0', '13568848795', 0, 1, '2011-07-17', '徐秋玲', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('b268adc966fd46d1b99a2aacb6c2984c', 'oAvgj0UHT6rAuKNzohnt9SiUTA6o', '李炎阳', '2018-04-26 17:24:35', '2018-04-26 17:24:37', 'https://wx.qlogo.cn/mmopen/vi_32/9IrGmDj5ZRBpI5lQnqZ10O6l9HuYLMXEWVllbhiaKibzntWsMSwq0H9dYHUPywice1Fibicor0eGqZOr7QXrKOFFvyA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('b2a6322bb1ab419eb6c4fa0771b88490', 'oAvgj0bYeRciYDMYBJKi7EGf1CFg', 'A.Dykimy丶', '2018-03-18 20:43:57', '2018-04-11 18:58:30', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKsA6Oys3lpHhDuYmGbY3iaDuLALUjS5UabqveGvjAKtAGI1H41GcTKLnAibUHLdiaRN1rWQTbD3tctw/0', '15283334200', 1, 1, '1994-08-25', '胡朝洋', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('b2dd6d978c6c4f1fa7ce20f290c109c5', 'oAvgj0YFu1q37XcIFtKwCfq8ePtE', '多瑙河～君', '2018-03-12 12:02:10', '2018-03-12 12:15:54', 'https://wx.qlogo.cn/mmopen/vi_32/ULHCcr3hhV62LJ7n3XE3zJ27MT7nn3LSXv8iaT5ic4uLxGdRocRV3v1AJTyicQGTV2G4dZUibiaNsjhm9zfnsRq2HXg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('b31e3ff7459a44658a40ce16249de354', 'oAvgj0f5AO-TGyAwk94DzHeqrdLw', '寂寞的小海豚', '2018-04-22 22:29:43', '2018-04-25 21:00:37', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKno9zrxxwStKicCHXZiaQJGUvuMoP0V0NtfovicZ9ypj6MLryk7S8WhCkJEqeJyRt19TayX8fuY5FfA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('b387612bab3a4b43bcb2b52a320fbdb8', 'oAvgj0dO9vTsyV9-ksNfzrOFokpM', '种子哥', '2018-04-22 11:56:42', '2018-04-22 12:05:32', 'https://wx.qlogo.cn/mmopen/vi_32/VHujEJQglWxm1HvMib0emErpwXTDJNwSavAr7XIvzm8X2ecTcsMYNOn3mYEDWYvDchCic4hiah7ric0b0476GkW4LA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('b38a9a2e065c468eb21b75bd02ec321b', 'oAvgj0TR_aNPH-J9NrOxYABkLq3I', NULL, '2018-03-29 15:02:59', '2018-03-29 15:02:59', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('b4673fe33be64d7485ceced257d9ed93', 'oAvgj0XwPJWcpMwS5cHMIbdf58Jo', '章译文（中国低碳家居产业联盟）', '2018-03-06 19:05:10', '2018-03-08 10:44:01', 'https://wx.qlogo.cn/mmopen/vi_32/8MYMIAyRyAWoJZJ0Or1NIf1LTichNbib2gH31kibNJ2hbLWHIuOoEqqcyvkCf29PzdQAwZCJUCTyfGg97LGmMURAA/0', '18628215533', 1, 1, '1978-11-01', '章于峰', 1, NULL);
INSERT INTO `tb_weixin_user` VALUES ('b51c94c5dde94e3d8360f2f3ca583619', 'oAvgj0aoCioyRqoT8L9De7hC0EiM', '无卡支付~0.38秒到（中国银联）', '2018-04-22 20:42:04', '2018-04-22 20:42:07', 'https://wx.qlogo.cn/mmopen/vi_32/oW1icR7PkS078XQ2Bz9DKSlhjgHv5AnOKN0HlD516jRNzd7cFzXmgpJxIYGsvMf3qgN4aAR7vYFosqtM6vK2jibg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('b530d81e937e4eb498eb42eda04c0a12', 'oAvgj0anGCsfgIEMU4DlBrAcymtU', '津楚科技周文龙15587098076', '2018-04-22 22:38:32', '2018-04-22 22:38:36', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqgz6MR2O86xl1LaLnG53Ya8w1LzGSuZ1hC8uiazUpUrIC5J9zf0BzQrukymdnwiaOk3JFzc262jXzA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('b536d42202944449ac7410bf29d0a498', 'oAvgj0ZXQrH911rapNoDLhApMRJI', '免费送优惠卷代理邀请码8NMMKOL', '2018-05-08 16:22:22', '2018-05-10 00:13:12', 'https://wx.qlogo.cn/mmopen/vi_32/pHPfugzib71IKjZVwC8RJibH8LelfLyR2Lk33KEg2WmEk3TVyaibCqT5pUsXGUm9LmvVjHv0ndtSv9UTz02v9KFicg/132', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('b5dff3ede27941bfaba0d8593eef6aec', 'oAvgj0WfdpQ04CyC7mdwF9greSgg', '追', '2018-03-06 16:31:24', '2018-05-21 10:56:01', 'https://wx.qlogo.cn/mmopen/vi_32/vbpqlc83AmQNMvrtZL3nkHN9zImic4KxzjmtBAmP1dhagcfQFSv0ftJCbSFZZ8xCwfqCpNSbsibiagmk0XI54kEwA/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('b61c4ae883af40daa49a2f466c87ce60', 'oAvgj0d7eJMFfiycKOI6bfsJQsE8', '赵纪芳', '2018-04-10 13:25:47', '2018-04-10 13:25:50', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erUZSmFYpL8THqdIxYhr1V6JImz0Pb17Go6unMGu8QqItx4hgBQnEtcSxXM1MdcNa5AuibicYc1wiaAA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('b67864a7cc544290b67ceb8dd4dcc85e', 'oAvgj0TYTcR2ydMlpSD2EL9gbZu4', '哈(ಡωಡ)雷', '2018-05-12 00:00:11', '2018-05-12 00:00:12', 'https://wx.qlogo.cn/mmopen/vi_32/4ySfOtK16bmKiaL6sNjmmBIJiby67xWjibCZCVed2RRR9RDZXoibh5gpiaJfs0Fn0HoJpcDVBmhUcmlwRlxRC42l6pg/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('b6b137ef8e294390ba544ef4d4eaf07f', 'oAvgj0bWIkvwDI8fL8GEYpgHeCH0', ' 辉歌', '2018-04-15 20:38:42', '2018-04-15 20:38:44', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIkMt27C2AF1nXOWydQJHCb9bHdFmKWT2oojoRxCpOBnNaEudFLPJ4mOKdM0yYDDwBIygcZINiaR7w/0', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('b6bb182b5b45471fafffff77e439f881', 'oAvgj0dYD8mYlu4ww5FO6ZqXcibI', '成渝亲子年票许明', '2018-03-17 11:10:43', '2018-03-23 20:48:26', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoC45wLkgveSzwmj3e7FSMuqWDZicE8cHX6pGKGboZL2VZia61ibnhfN8hu6tRdhjFoPeXOUQxTGSx1A/0', '18511585991', 1, 1, '2017-09-01', '许明', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('b6c9deabb96e42879b062cbe2a9ab06d', 'oAvgj0dg5tSuzzbOZau-yPQBMfYg', '7', '2018-03-17 13:13:16', '2018-03-17 13:36:39', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ0D2ToYKj4sdAhWXW5rmyGsONGsywx0d8SB9UblXKmL0wpeehhxo0xh51CiaOQPnnzC5XH84sLICQ/0', '18985450183', 1, 1, '1995-07-03', '王天华', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('b716497a6dfc4f8dbffdb943a04411ef', 'oAvgj0dLlmeMg_Shg5Jwa9lCioZs', '俊', '2018-03-11 16:35:42', '2018-03-23 14:40:41', 'https://wx.qlogo.cn/mmopen/vi_32/XAxTcGFpib3qDxtvcx1iaU7rVU3EghdUKoic4zdqkw5w61nI3jibtZeGlBxs46jJRMyVlN4PiaMTO2rXJpBbN46poXg/0', '18111555616', 1, 1, '1984-09-01', '杨俊', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('b78081a382624226b613eb7e13a29937', 'oAvgj0SmlYwxue_mDueyRePMdwaQ', 'Felix', '2018-04-23 10:27:24', '2018-04-23 10:27:27', 'https://wx.qlogo.cn/mmopen/vi_32/Cy2Q6LjNamPWRgrAoFsTuPRGygSETT2Tb6wszL05nY7YibMco7vtCOhibUNxv131A6ScMt1knFVjAGiaG2yybUgqg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('b79fbe222410440ea2f423144399f6eb', 'oAvgj0d1BXu9T5B3NDQtMN8ecNA4', '我们不做时代的旁观者', '2018-04-22 21:28:23', '2018-04-23 14:12:45', 'https://wx.qlogo.cn/mmopen/vi_32/IVQqh7okSxHJ5j2ndqCiajl4zVPqdjTEtic0cibX0yrsc9yVdkhQLgjmcibCOvftibSlj3GtodJCyn1ibxH3ng0fb5Kw/0', NULL, 1, 1, NULL, NULL, 5, NULL);
INSERT INTO `tb_weixin_user` VALUES ('b830cd3074834623aa0f05b7c3fca8b0', 'oAvgj0c44AUQ20wzTqSemqXijU70', NULL, '2018-06-01 17:47:18', '2018-06-01 17:47:20', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('b85b6d1e8abf48b581089c140e63aaed', 'oAvgj0YWO-mIPC1xWf5iH5L94qmc', NULL, '2018-06-02 14:44:02', '2018-06-02 14:44:04', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('b8b8a452cb764448aac2d0e8cc2ba6e0', 'oAvgj0bJ8Wu03VTkRUhUTlgOj9ZY', NULL, '2018-05-28 17:10:22', '2018-05-28 17:10:22', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('b94ba133f37d406c8386f4913d6bd28d', 'oAvgj0WvRq11KtfJxBw-uga3irmM', '刘粒莎@投融资服务', '2018-03-20 14:57:35', '2018-04-26 20:54:08', 'https://wx.qlogo.cn/mmopen/vi_32/cVbvwXsnoykDJGWf48O4IRkmwB22DyB0fR2naP8N0tbOu8ug1KswSgicD2QA9h3WvbKp4uHLNW3WVUyMyIbc1ibQ/0', '15882363823', 2, 1, '1986-08-31', '刘粒莎', 1, NULL);
INSERT INTO `tb_weixin_user` VALUES ('b94e922eeaba456abbcc8a8bfe0d4f26', 'oAvgj0ecQEKrp8DK8HeNXsGF60Pc', '任春华', '2018-03-08 14:29:51', '2018-03-11 16:20:25', 'https://wx.qlogo.cn/mmopen/vi_32/8MYMIAyRyAWoJZJ0Or1NIR7SzrARDKpc3h0OHI0JkuL42xUVA3iaYkySDL1GuM4fcCvgAF6GomDgFR1R4KaKXaQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('b9ce0e493f024dc98f0ccdb8f9c464c4', 'oAvgj0WdDOrtUY1I-UPmSk8SPlgQ', '付学英', '2018-06-01 20:24:32', '2018-06-01 20:25:17', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKkkZBpiaOo4dJv0DSjLFiaMaXTq0ujQb3CGNJN8UvWXzbh53Ay1CrficrZicmkRKnwmtZjuIEt1PwUQQ/132', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('b9e4811cb42540f2b69e137cff86413a', 'oAvgj0Sf8HlDsgKjTbkG9530dgnM', '冷麟轶', '2018-03-01 18:09:40', '2018-03-02 09:07:09', 'https://thirdwx.qlogo.cn/mmopen/vi_32/iaIl4CXRp0rQXqxNp2rfoN5xk07jZmvl6Eh4Mt4Tp84KDqsYCRfntGszwoXJ9VMlgEJCOv4g1Fs1kZqicfVJ1l4g/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('b9e7100dae3e4d2f8926b99ef2745fac', 'oAvgj0XZKelGXitGNSV071btYcD0', '大丰丰', '2018-03-17 11:36:46', '2018-03-17 11:36:48', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJGk0uwa2GL6bUuUiadEFcAj7Af1ia1tjhqh1QXSvgoPvtC0p6WaEaNibAMv2PN2EH0RyL7aESo1wCrg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('ba19b335186241349f191fd4d9f25474', 'oAvgj0YZOamfGlqFb8crqMtXhKdc', 'HU', '2018-04-01 21:43:21', '2018-06-05 06:16:46', 'https://wx.qlogo.cn/mmopen/vi_32/mtudhOyuBmbyWic5HxBicvTKzkATQNU8YjQKOXfq2wzV7CY8PDWoIicqicojPCaJDaGnhb2rQz5YobzqRH9jfvKQSw/132', '13622399511', 1, 1, '2008-09-01', '胡锐', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('ba6002a6ffe240048cf1e81f46fc3b6e', 'oAvgj0W0fcgGV_Ic2_O1ZNhi9RII', '强壮', '2018-03-17 13:06:21', '2018-03-17 13:07:42', '', '18040373982', 0, 1, '2016-09-01', '张', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('bb0a27a775864dfca4097e4e92bb774c', 'oAvgj0XdnYJ4ruEsFOr9e7KfNRpA', '互联网就是吊', '2018-03-27 15:04:12', '2018-05-20 10:54:18', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq8ib2fIywoDFKJFGHPuT9GdDDerVXaZjtwttQj4DRaI4o7DvKQaUURA1JqYV2XjuPGG0lnNw36Ekg/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('bb2c4d5533394793a35f674cd0c460b0', 'oAvgj0X2OeN8XIcNZ_YE7HmYjEVQ', NULL, '2018-03-12 14:58:55', '2018-03-12 14:58:55', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('bb90940d71fb4c3db0478cef40a51050', 'oAvgj0eGErjptIxWVr9GeDGvpkjM', NULL, '2018-03-18 21:28:48', '2018-03-18 21:28:48', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('bbc1522827af4f079039cf3df68787dc', 'oAvgj0VMyNbzvkeq_Z-ZjNXxlcpc', '海燕负离子眼镜总代', '2018-04-23 10:29:35', '2018-04-23 10:29:39', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkIicaUBBoyGm5MGoS7rTQZUDD7SUpBcwdMlRNXUXkXYXQ4HqdAGOicyb3rL0eX4r8FEdmC9NHLziaA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('bc0d1885b893479aa4e0301059255594', 'oAvgj0Y5Fiszg0zjLJDSvf6oyGk8', 'kouin', '2018-04-03 17:30:37', '2018-04-03 17:30:39', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTISUXPUh9YrHklJZkSumnIMKzLxe9iaB1ibtA4ThW2B4OH5yoxGIo3v6lcTMtNb0EqLRds6OomhWyMQ/0', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('bc1d3fa7a87c461095d97eba56d0b45f', 'oAvgj0Sae0lKwwzKiOun4l5hqpcg', NULL, '2018-06-01 18:55:57', '2018-06-01 18:55:59', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('bc74c52ad07d46adadb03ec43403a378', 'oAvgj0baDDeaMQLpSWtwZzda0NKo', '王艳芬', '2018-05-11 12:17:24', '2018-05-11 12:19:39', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL2FKAN01j3U768ILtGiaSOnV5vr8zn1Yl2xojVLzfgBa1VqYd1R2llia2TurNqQoOYdXX7UjGtXnYg/132', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('bcb48b0822854d97be5bac3488290f1d', 'oAvgj0ZJT51qLHOil49tnFndV1Zg', NULL, '2018-06-02 14:18:34', '2018-06-02 14:18:36', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('bd3442a444b742ba850284117e331ae8', 'oAvgj0aeBp--E1nY35lBw0CKb6Qs', NULL, '2018-04-05 08:11:41', '2018-04-05 08:11:41', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('bd36160a23924d11a4099615e8638fbf', 'oAvgj0Ww_00P5bVrCOHrV5PEGhlY', NULL, '2018-06-01 19:12:56', '2018-06-01 19:12:58', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('bdeda062f77a41c7aed281e1a2b9e7c0', 'ocJ4i0ZhczEEOXxmOmUkNhJDmhjw', '庸人修心路', '2018-06-08 09:31:44', '2018-06-11 09:29:45', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIKOQPxT4FB8icXmmtrD4PnDDWfw47y9tXTMoYhnLyr3PNpU4iavT4uzGXl1dZncsPlHNA7YQxEmjbA/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('bdfa25253f9b49d79191f609a4161b00', 'oAvgj0eE5BtrvVnkK0cunppp9G_c', '周郑波18784588198逍遥！！！', '2018-04-02 14:01:30', '2018-04-02 14:01:32', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJVU7mbDMr9dexibpFnBER7icysazJZ06s2QBQAjux6WqRzYGrAdwpGcibLVZiaCZRSqZtCpeQgnzwyQg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('be5f679d31e345ab8200b5d5792672af', 'oAvgj0WYGKOD4hQsQiLB239NkuBk', 'a', '2018-04-22 22:30:06', '2018-05-12 16:30:45', 'https://wx.qlogo.cn/mmopen/vi_32/Jo8Tnb8mcrKjIxsTdBob2ksVcgWpooboog4b0JvZ7LKJ47kyZiaTeK10u5IRhSmvf7ThGzRlMeMnmGUfAw1Hgbg/132', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('be6c2a7c0e824bacaac8477308ce1035', 'oAvgj0RQzFKFNFwn5jyvwjU5vhT0', '茶楼联盟之共享茶楼', '2018-04-12 13:50:32', '2018-04-12 14:18:43', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epOhY2tKMfGKvLNibpbEFRkZbRfFFvkW3JVPu49OFIsO8jrE4wUIOpSlgFfeibQ2SOeJDwcc8tSLfow/0', '15756316229', 0, 1, '1979-09-06', '吴先生', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('bfdafee164724cc681342c7a5b8e41ed', 'oAvgj0dNOv41_brk2hVDJ7NXz7PE', NULL, '2018-03-17 21:47:52', '2018-03-17 21:47:52', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c052b471f3c64742a1c9b6c35d8c7f63', 'oAvgj0WrNp60Vn8UwNSsTBbxxFXY', '大财', '2018-03-29 15:20:39', '2018-03-29 15:20:45', 'https://wx.qlogo.cn/mmopen/vi_32/kO5PchrIbbKQaRHCaaz4cUKhyeud5kd9TKoEhhpHfmema39Rh8V0DicVseDtQ2RLkwjJ1GYc9pagSIXVe3lDvbA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c0636302e162400f8823ccbd01dc9d49', 'oAvgj0SBdX0SI9UfLWHpnxcwSJVw', 'QN', '2018-03-11 08:59:19', '2018-03-11 08:59:21', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKUOC0ftZuklD808tUrWlD6oE0oym48qrh6mthBiceRurWOIvJVdt7jLXqA92Ief0MXL4sYZYMFjIA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c06478ea5e3c40c89ce47c3d04fdb9a4', 'oAvgj0VNt_gY04sPrXwp6-P7Rkkw', '彭冲', '2018-04-28 15:32:16', '2018-04-28 15:36:43', 'https://wx.qlogo.cn/mmopen/vi_32/4KGDYpurPJpHJIw4AnBVCajDlG06sccR8qibBLgspibIr45H8vribxLwibHHiax7jFicLeZxeblunMwib8Tsswl61qMXA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c0710bf77d4240d889ed648f4333c9d1', 'oAvgj0eFuLeAKfNlHxDG1VKSvnoY', 'A0、12', '2018-03-06 16:54:04', '2018-03-06 16:54:07', 'https://wx.qlogo.cn/mmopen/vi_32/9tibC16F1UhNxaTvJIQyhRUznSYA2gtrL4GuSccGyibibZ8nTDAqrL8OIdZYtAGBkKCuerfiadnwGcmCFDwCKyjJGA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c0ae1df6a5c14090ad4d76464c5c8f76', 'oAvgj0Ttx0Tm2tE7zuYU6AndlYUw', '支付宝收钱码城市服务商', '2018-04-22 21:14:29', '2018-04-25 15:58:55', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkDr90EFeibu9micJSsfg0IOC8ekpq0773DfCgpPzAKaj1NxxJapNuP9Ob4IBnKU0Iob3XEmlflFkw/0', NULL, 1, 1, NULL, NULL, 16, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c145933633aa484e90474915ab311a81', 'oAvgj0Y_dWZf79PP2spEPIegUpvw', NULL, '2018-06-01 19:48:59', '2018-06-01 19:49:00', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c175fd1d767c4bc9abe28009d138d8c8', 'oAvgj0ZJB9ymrBmmXb1rqP7OwpF4', '悬崖上的草', '2018-03-17 13:09:34', '2018-03-17 13:11:17', 'https://wx.qlogo.cn/mmopen/vi_32/WGIGuEBUkSSuDTBZTom3SwexY9wicjvOF0NWsMHps4ElGbibzrEgicUEu0pmggNictlXdzzJjSicwlDHVMdtR3Golew/0', '13880594393', 2, 1, '2017-09-01', '周周', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c17bf7f4029a45a8a511606dc4957be5', 'oAvgj0Ruo1vCz9YcRcjTr66FvtnI', 'feifei', '2018-03-17 19:20:29', '2018-03-17 19:20:33', 'https://wx.qlogo.cn/mmopen/vi_32/ibg4J6FLBzKSEMC1uSDtvLBG1E6Nia327aSZq7T7kicQW7GBAVFqaYqEW8hDWAYuXEw9KJ14xUWdkos3lkdbA8R8g/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c188065ce4d44f3b93bbadf755fc79b4', 'oAvgj0aNlWpcctf-hurVjk_cpaTU', '夏', '2018-04-18 17:18:15', '2018-06-05 09:34:55', 'https://wx.qlogo.cn/mmopen/vi_32/YYnYXpdNS8Xf8T2ad5p1KMLHKhppxkhaXDVj8k6zaMXro6YvykADOAS1ibLtP9LDiad9eQibmnsR72eLlJglEHDyA/132', '18280081278', 1, 1, '2000-07-28', '杨哥', 1, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c19d48169c824741b022a4801ab23f26', 'oAvgj0ZEiknGp2ZtQD2mUaoLkJkA', NULL, '2018-04-14 13:34:18', '2018-04-14 13:34:18', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c1dc0a8be17d4fdd8d8e31b23e73e8f6', 'oAvgj0ZL2rRWNPSNCFGcxOewSfE4', '金彭太阳能路灯控制器', '2018-04-19 15:46:14', '2018-04-19 15:46:15', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJRFRX8kNzNemckjnJZHiaVwpH7BYBbzqXYBKrleMs27MbeO2ldBnphQic3ZQY36eDkpx0dnREaeyeA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c210ebfc66e3462d9cd7f2c6e6448134', 'oAvgj0QHcxn0D7O6YnOpI1UK0G6A', '布丁麻麻', '2018-03-17 13:10:40', '2018-03-17 13:14:10', 'https://wx.qlogo.cn/mmopen/vi_32/dCqFXC3Zf28Rkvyw12C3XiatzmUf64JMLEoSssiayjuS8mwH1NLbicYdibjI1K3SzFccRePUVyBHC4VDBp8gZ6YxnQ/0', '17358656517', 2, 1, '1990-04-02', '周女士', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c2339ea5f664471b9d74687f5352f2da', 'oAvgj0TmoH16rpxezF6ME_bzHHlM', 'Amaya-莫名糖', '2018-04-04 09:29:47', '2018-04-04 09:29:49', 'https://wx.qlogo.cn/mmopen/vi_32/0Y6B7blxO6f86OT14090JbzKbXs1iciagL7SRwoZwHvXH63mWv4WB0sWfJW6mgQVkSz2iajUU1RpXibibpiaUTcHN0vw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c267828db7494cd69a65118344358b38', 'oAvgj0TDGY8LdZ4tJVBEaXBKDfMY', '抠脚大汉', '2018-04-18 17:48:59', '2018-04-18 17:49:04', 'https://wx.qlogo.cn/mmopen/vi_32/Ca5RGK71LibRR4nztNcQyC8zN1vs7tH1vLgbhtTtIwHQzWyvXKdAduumJFEXZibJQEJCLaiabtjlDJzR8s08OHiarA/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c2ce46155aed4f2cbd25ce0b61934e50', 'oAvgj0a7EPs8wJMaClKF5Zw6YoTA', NULL, '2018-04-04 09:10:22', '2018-04-04 09:10:22', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c321d093156f4109902c5403ae24ab71', 'oAvgj0UlYAT6oYeC5ift42SlYw30', 'AA追风者AA', '2018-04-21 12:33:55', '2018-04-22 15:30:55', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erAib9REOiajL3ib9iaQVCkgZciaz7aHicuHUbJfSHoCdJ4ShtuocWwys5hyr72HWHA6CuCrNHLboQanuNg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c33195ee7237434b950d6b410e1b0b16', 'oAvgj0YdKi0KmMgZCbCaEMtsAa6c', NULL, '2018-04-14 18:04:04', '2018-04-14 18:04:04', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c3db3f3ba8a24bfa971ae9afb53c8042', 'oAvgj0Tvu7-IuDoYKxsuxGZCUzvo', '岁月无痕', '2018-03-06 13:33:15', '2018-03-18 18:09:13', 'https://wx.qlogo.cn/mmopen/vi_32/J2loTTJYhe2C8drGr1fZrdjsB5QX0kALdmW8uKHKH9olBu4ib4XWiccQbYoL9jZYD7IqicEuwjibib6xQkJWveUyQ7Q/0', '13880172586', 2, 1, '1970-11-26', '岁月无痕', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c3e5ef453f6b4b5eaba38a85275ce877', 'oAvgj0Rs8FiNZLVY9lszxuKvgYjw', NULL, '2018-04-21 14:47:17', '2018-04-21 14:47:17', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c44492f40e5946c18e03d9ee638405ec', 'oAvgj0VXzlb3YPF4RW_Y9QSAZKec', '徐凤年', '2018-05-03 21:12:26', '2018-05-03 21:16:28', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIlShPdVFbIacxusn7YwUcq2v9zFaggVkqK8piaG6NoNH25vf0wV1rEuqwx4fM0ag2JQic1sF7NspNg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c4fe8dfef4f14b97958995af51de5444', 'oAvgj0S3xsKFgzXg9w8UoQH59aKI', '娶个名字真难', '2018-03-27 15:29:52', '2018-03-27 15:29:54', 'https://wx.qlogo.cn/mmopen/vi_32/pxEyGhvFibSD3bYicfPUIicMYEEtPXIzqVb1xpBItR71C5yN8Mzibhk6GC3QltWvB9KKAicsfuZ19egjbzzhjjVaLFA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c59c652f27de49ae9483f5b3bfe62068', 'oAvgj0RSocFX9IkoMOmmNqVmPT-8', '清莲', '2018-03-17 10:48:59', '2018-04-24 08:28:58', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJRgMw7FHDF5KQct4ppYZiaQeW1wEsH5ycH0XVFtleOAGjEibNy8aDicsRpKBHkQSnU0WibSmOEJ1SCJA/0', '18200382940', 2, 1, '1993-08-02', '文媛', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c5a0598ab3c24ec88789bef310472767', 'oAvgj0flpdJlqp1FjLKgqkZmP4AY', NULL, '2018-04-14 16:44:02', '2018-04-14 16:44:02', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c5bdbc25a6b94c87b858e7f0a7fd3b31', 'oAvgj0SRHVVHFIODGWRPZkJpUbg0', '沉默的羔羊', '2018-04-23 08:46:33', '2018-04-23 08:47:08', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL03jMSeNOuwGyHN6exT4RqnUicBZ9WXcuaib4Bia7ZUUILBCWyO2pHiaDHBXVib4SzaicWrqlJPvDzE6Lw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c5c2199c0d5b43dba0338bef19466583', 'oAvgj0am2ledHxsyxRrfB1AXuoBo', '金杯饮酒乾坤大，玉狗送宝事业心', '2018-04-15 15:37:39', '2018-04-16 15:39:48', 'https://wx.qlogo.cn/mmopen/vi_32/scqYuwYM7IM9ibUhVTrJul1Gb4BZZJoae8icBsia5h6jlqbdmhsZzUeMlic1mJRvVloImlIYiaF3URcTeNjOTyIoBRA/0', '15756378964', 1, 1, '1986-07-15', '李春林', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c6474135170b4c6a91a35e3e143f3548', 'oAvgj0XJIkpJkqOtW9DbLTmfNfZ4', '李秀嶺', '2018-03-08 13:03:22', '2018-03-08 13:03:27', 'https://wx.qlogo.cn/mmopen/vi_32/s5XqniaEBh14CS43TIDRRfYvxWwJwzSm2jONQdibyia9oJgDVVu7Lxg5B3aic5R6KciaMYhrtTz72ia1jdsWkxuZCeMg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c66a4fd4ee194265a215f9720113dbbb', 'oAvgj0UhrWmL5XtbK_1e0qWBLQPw', '人生如戏', '2018-03-25 07:33:13', '2018-04-14 11:37:56', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ9ZpzHoEsFt19bAxJoNODcjOC73zCDlTdQh21t6rXEXh5w9Yh4WVh3dFIYxjicgJx5iaibTM3OgEZUA/0', '18990650071', 2, 1, '1983-02-06', '左姐', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c69844f5fdce4fa4895f96b049dc1cbf', 'oAvgj0dB-3coaL6_MEDrAiTU6Ad8', '熊开元@浪漫鼠.芭菲迪加盟总部', '2018-05-26 15:18:34', '2018-05-28 16:26:36', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqUWVRxTgvfodcLN8rtJBvd2xfDuebsUA1m3FDt2MtYmC4DNqHVGO2EWbX95qe8kUibyvrpmuDYiaOg/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c698bf21a44d4fa085cd2d4df8f0991d', 'oAvgj0Ql8s8q3RPmYBRv0PwCXLTg', '多多', '2018-05-12 15:25:27', '2018-05-12 15:27:57', 'https://wx.qlogo.cn/mmopen/vi_32/H0GqDP7ibHo5ic9gN9MYhiaicOSP0Qy9H5RG6steoA5ia8xMoHYft5V4tdN2PKq87IDneow7bN7TkSmtVTM2KoQhxjQ/132', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c6d28183b2ce4db9913c1eebc5c6e7ec', 'oAvgj0QFsWlHmknDYbebcte3dOtQ', '邱萌飞', '2018-04-21 10:34:07', '2018-04-21 10:34:09', 'https://wx.qlogo.cn/mmopen/vi_32/E1H0dtJ9mJnO0Zbpiaaf2kfenicjU9gWSmRgbqsThpmJZ62tf0Rpiaaa75DcUSbJxxCSgBicLiaOjWBU6vASdqRuKWw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c722e949fdc3491b984c45b619d15423', 'oAvgj0TflkJAYmym8vTI9avkryEY', '阳', '2018-04-14 13:23:56', '2018-04-14 20:39:22', 'https://wx.qlogo.cn/mmopen/vi_32/Kibs3hypdISaBGicXEmrOY5Gt4PQXq9jocWflzSPs5iblLXWIeKcWkgp9fGsVf4LTWRK5Lgico1qicficiavEyaGIEPkQ/0', '13548126013', 2, 1, '1992-06-09', '朝阳', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c7cfb3658fce4aefba6ef4d1ac1c0e97', 'oAvgj0bwKKpx3r1rMuA8_4edSePQ', '香独秀', '2018-03-30 20:46:25', '2018-03-30 20:47:57', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKfibDbO6zE7qOeecoSicazZAmCiaIqg03ibR3TJRr4k0DLb4Ggjbibf68EeoPzdvtz3IsLEwVMp3gofVA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c7de0bf775434e52b4b7c9aca0520de0', 'oAvgj0cL7IqeioBwDg-qYxrK9AL8', NULL, '2018-03-08 12:01:07', '2018-03-08 12:01:07', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c8198df21775457597040e38f6a64f3b', 'oAvgj0cWODi-xWYc2Nz0Ax9_sYnQ', NULL, '2018-04-14 13:23:56', '2018-04-14 13:23:56', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c866aade60c64bf48f942842961fa696', 'oAvgj0S7wDk8GPDICJ-d6t_JGvJ0', '梦想家小沈', '2018-04-23 23:58:40', '2018-04-23 23:58:44', 'https://wx.qlogo.cn/mmopen/vi_32/z8OxLvWfEUvOXDIknibJcgX27LvoNFBqag9r195sg7WUnpyufDLQiblj06nxJRu17FR9UJGoodiap365Of9DbGUog/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c87aaf71869444cc85ec11660c627034', 'oAvgj0ZfmmD2ZGDDhmGeBBp-2X7g', NULL, '2018-04-05 01:32:25', '2018-04-05 01:32:25', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c94730944e4647f1b1537cf41170e253', 'oAvgj0UJPqzHvjjaNXIMX9qRdaMU', '古鲨之贝', '2018-04-22 22:48:08', '2018-04-22 22:48:10', 'https://wx.qlogo.cn/mmopen/vi_32/HHPWm2UZdIt8xQeOEKOc9Os1icU47xct3JaD3gARof5k1loweJkKWm1d0GN7BQCNDz13H09EYnUWq4kSppWzCGA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c954fdd641024990b8ae094d3e406870', 'oAvgj0fwuCMPfM8y94zp5N7UgEDk', 'rdgztest_NHGUFH', '2018-03-18 18:03:47', '2018-03-18 18:04:07', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('c971d0b2d37c4ec49900a6631c987974', 'oAvgj0fgFnOSj3T0gQvVOjuPSKxo', 'txm', '2018-03-16 14:58:18', '2018-04-24 11:13:49', 'https://wx.qlogo.cn/mmopen/vi_32/NZKTtjMm3ZUMRurrruA41kEJD27LCv63QhR5fQza5icz28B63jukVPB04yazF3q6QsfQB611iauyI7ObJ4ibZYnLA/0', '18583268976', 2, 1, '1988-08-05', '糖糖', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('ca7fd9e8bd034b898a9b390c423cdf44', 'oAvgj0RYBE2aAMbiRGntiuD0Lg4I', NULL, '2018-06-02 15:18:48', '2018-06-02 15:18:50', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('cab8fe19b5ed412ab5b5d3bad8ff7126', 'oAvgj0aIbmUYQe6Shhey6FeQRP-M', NULL, '2018-06-02 15:16:33', '2018-06-02 15:16:34', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('cb32e2c6bc394240ac0cc43dcf211486', 'oAvgj0R6vHja1fDW0c62krlCV6fM', '卷丹花音', '2018-03-17 11:36:38', '2018-03-17 11:36:42', 'https://wx.qlogo.cn/mmopen/vi_32/jT5VSRhs069jcJyxLCmjHmB4bheDST7hI2a2KIJKIEtrM5Us7EickKQQgSqRkxKicV1kftlgebJHP4Z3HicRaNJLw/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('cb6567b165bd4b838fe110e60f1e3b9e', 'oAvgj0ZpiyN9XT_K5OjtNhRtvu4U', 'rdgztest_CVRJUJ', '2018-03-11 13:27:12', '2018-03-11 13:27:35', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('cd30182862c64d90a6e31c169c9a89f8', 'oAvgj0R-6nuI5sudr1pYZXIIEnIs', NULL, '2018-03-17 16:40:55', '2018-03-17 16:40:55', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('cd40248bbd8a419bb9963575db3749e5', 'oAvgj0adgShfOKeY45NiLeOr2-2E', 'rdgztest_YVJJMI', '2018-04-06 18:36:26', '2018-04-06 18:36:42', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('ce07a62277db467f90abf49c9456a31d', 'oAvgj0Vx42Kyw6XHCoPpAE4btK88', NULL, '2018-03-07 13:19:27', '2018-03-07 13:19:27', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('ce467160fa474d37a56a3fb6eb075167', 'oAvgj0WoTVgLfeCKmdlTQ5z_O0M0', '钟华', '2018-03-12 08:51:30', '2018-03-12 08:51:32', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eollFvftKwb1TsN6CGMNxMDKojXnqy1qz6dGNRFITATnpNdMDLRhRpHkae98CMWn3x5OZHBLVicibHA/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('cec3777cf2504353a28661f3eac7aa61', 'oAvgj0dlEMaZXNiZwjxKDEWikacM', NULL, '2018-03-17 10:48:47', '2018-03-17 10:48:47', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('cf757bfb8cb040ee82a8a8755de51293', 'oAvgj0RqQjVLsKhWqWnLYxegOc90', 'rdgztest_KEIMBG', '2018-03-11 13:27:26', '2018-03-11 13:27:45', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('cfa1a2d82ff143f68106189ed8dd734b', 'oAvgj0ZpvJmtiFuBjpF171dsdFOU', 'rdgztest_KWLYXC', '2018-03-04 22:33:51', '2018-03-04 22:34:13', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('cfa81fdabe7848c291b558867f0793a5', 'oAvgj0c1GwoL1b1litTq4VAkXf9k', '姜澜²⁰¹⁸', '2018-03-06 15:17:44', '2018-03-06 15:17:48', 'https://wx.qlogo.cn/mmopen/vi_32/XAxTcGFpib3qRY2ZOgwfvBZLa6zgJKnS8DajvfNAo1DwR28aia4YKHOq7zictucVQPKbMULLhkAbISujIPmX7qldA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('cfdcc05873134b1fb72db024150d050d', 'oAvgj0UTkoyZMoyX1PZVNLQAumu4', '念旧', '2018-06-03 11:10:15', '2018-06-18 11:27:04', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIkMt27C2AF1m7icOxBEnIdlpYuMDutdtUm2LPrBAn6jnl2b6IVVeJvouJxyibYyne8nKhicMuXfGerA/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('d038725ada2642e2ad50e481ddb67ec8', 'oAvgj0Rbs8_RUljtLL_eQZodYHP8', 'rdgztest_HBMDRI', '2018-05-01 09:19:19', '2018-05-01 09:19:34', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('d0bcdb64ad73433382307b5ef4790464', 'oAvgj0eDSYIU3GQSeoirszTDdPMA', NULL, '2018-06-01 19:54:03', '2018-06-01 19:54:05', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('d1576fd1818b4a2594895ee9ad1e1aa6', 'oAvgj0ad1q-A6dRIUXVzhQLGoS5c', '哥本传说~风一样的男子', '2018-04-30 16:00:39', '2018-04-30 16:00:40', 'https://wx.qlogo.cn/mmopen/vi_32/lcib9AaFmzOcxLMIfsILyzo1iarler7icm7icGczPs8RIphj70Ds73P3sw1prIX7WM71RJAonyic9rhJcx1wxaMj5kA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('d1b91a72186b42f397f4600762900b5d', 'oAvgj0e9qS3p52rCmgAMpfEabgWs', NULL, '2018-06-01 19:53:27', '2018-06-01 19:53:29', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('d1bb55b0154b4cbe8f6e3a61c1c29cf3', 'oAvgj0e0yEm9ecEwXzfw3QLWV64g', '蚂蚁', '2018-04-14 10:16:54', '2018-04-14 10:16:56', 'https://wx.qlogo.cn/mmopen/vi_32/8vuiatnzbeVcoLWMqxmnzMZSp6kExuBr1g2WFzyicVESQQtICvHB5Ffich5rzSRgrDUE8zU6ly59ia1LicEu3NUic6Nw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('d1e51e93dcea458ea7f84526c7feeea1', 'oAvgj0WN6VjlLw-nqDh7cE5JMgUc', '开V开', '2018-04-10 12:52:53', '2018-04-10 13:04:19', 'https://wx.qlogo.cn/mmopen/vi_32/Pnun52EklwGibVKticAo7pOQ0RoujD4pGGJxcDibUUy2HpPIOf3m7HWzGiaKomU8nO5c2UtHD9IFHzbSPI3y1JsSog/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('d27329759de442008431ba6c6806bb61', 'oAvgj0RbsqstA0UHFuv9YPLjFbqU', '古戒丶', '2018-03-17 16:49:37', '2018-03-19 09:07:23', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJTMcUWtEjw2DWjqOVAu2RXIZoco4LNGaNo3L2dfUBYyTZEXrz9wsLDOuNZlpYezFHSznxWmtxrEQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('d3a238e1a0ad4f5286060fd3851f025b', 'oAvgj0SZZ9VKBpaEfGtejSReRh7U', '老幺', '2018-03-09 14:20:20', '2018-03-09 14:20:39', 'https://wx.qlogo.cn/mmopen/vi_32/Fb6bY8E1tgRNzmibRlaIViaiaBdswSwF5Ef47VQHqJBmqFib04Jdf11vZngQiagMP7Kriajyvvb9yIW7F8vZEKXDzzaw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('d41fb989ad214952b8f1d46722505843', 'oAvgj0bzBD52S9u6knbUW6gUkIfM', 'SO   GO  AHEAD', '2018-04-22 21:31:20', '2018-04-22 21:31:25', 'https://wx.qlogo.cn/mmopen/vi_32/9ibEpF2L8OAmwEYQ8yYClee2ouVYsWe5JzOufNXyicvjUT4UM30Vf2DiaicVNNOxNgKd1LWck2wAP8aB8IQb7OfMpQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('d45f4d98ebbc4c3faa6154ea1f60cb42', 'oAvgj0SdyAHgx_B4m19pUhfl301w', '气冲冲', '2018-03-17 12:21:13', '2018-03-17 12:21:15', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKx5japH2HBD1OQ2SCBgEeTR1aFtensrsXEMzW28ia6EgNQWC6KzibxBlc6y9r0WEwXWNRn5EOQv1sA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('d5ad63189e4e4f3b9cfad88631b9a014', 'oAvgj0e2iIvLl0oiGjZhE18KeSaQ', '拓本科技|季泽乾  pos销售服务商', '2018-04-23 15:24:20', '2018-04-23 15:24:22', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erVnqVtvuEFAoNcGyTyicM7vmL4fI51XY4tnp9Dq0Y4oick6yBKvgdzPWLsHIOfPkI5MbRiaPPrHFsXA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('d6235a41f64b4857a041bd466b3de57f', 'oAvgj0dFB24dTt9tb50GgXpOV_0M', NULL, '2018-03-17 12:09:07', '2018-03-17 12:09:07', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('d64ac2b29ef942ddbe1e62021309fc82', 'oAvgj0QpyCjowsjD-CcbCV10oUos', NULL, '2018-04-28 10:36:18', '2018-04-28 10:36:18', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('d68f9140f83442fcb60d94fc41491f7f', 'oAvgj0X1sORYMYJ4PYNzdDKAtWfg', '何春玲（13551889179）', '2018-04-21 10:33:00', '2018-04-21 10:33:02', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKa1HicxzMu0aqTvU4UY5d6QqsHqzSo4AK5ZDRmBa8U0KchFBOjnJ8dPFhfOZ4BKhKo6cBqqoLYpWg/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('d781e355195544f1aa3641bda917c80f', 'oAvgj0fLgC39yxrf9loz6ojPSGGY', 'Duerwa', '2018-03-17 21:50:49', '2018-03-17 21:50:52', 'https://wx.qlogo.cn/mmopen/vi_32/tpfyXErZVIBDlfjCyJjTdL7MIrrDkt1OWJmBmPLInicdSibJlPBRvTEIXptibtpxbiciaYx829bGwQmibcEib31vSVKSA/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('d834f4f9f980474cb61cb33b744a18c6', 'oAvgj0Vlyv8nkaAy_RbCT37HKMms', 'TangYiXin', '2018-03-07 10:10:02', '2018-04-21 14:47:10', 'https://wx.qlogo.cn/mmopen/vi_32/oktuho8B2Pa5iaTpEyjGZyt1EWnRibouzj8fSC5b3qn6jicibibP2rBxoIY5daujPHCcBSwNpiboXpgiak40dKEdh6ibDg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('d874ba84495747d68d0d394a7d3e80a4', 'oAvgj0bUQU5i0hJo-1P--kxQrEow', 'JInVVang.', '2018-04-23 12:17:29', '2018-04-23 12:17:31', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83er5Z4Hk40PsuCFNecVLSP6OO5BMIia1Crwiawn6bibH8R2azKmGJqB19E0IcXayvNDSTAz8ap3MvnbPA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('d87ef6a0301a49328a9d645899fea41d', 'oAvgj0WmnH0o9pMY4rK9FnJinfr4', '戴宗 | OTO营销策划', '2018-04-23 07:06:26', '2018-04-23 07:06:27', 'https://wx.qlogo.cn/mmopen/vi_32/lXhjd2Sc9hjPkjjdAibYacMWMhcqrNOUGUgpEDLmygwZMVcvUyIlF94atNpV6Lv9lo9sxPAJyVnwZSic1GHp5WEA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('d8a7e7acba22435a9397519bcd1ad9de', 'oAvgj0YYJznsm1xmEeqV8aIXIgM8', '繁华`落幕℡', '2018-04-15 12:32:51', '2018-04-15 12:33:02', 'https://wx.qlogo.cn/mmopen/vi_32/IjAbYBUJ4hqZth6YR3pRZwzbIbUs9GHPVvAM0DcicIILL8LDkVIOcMBogxggZDz8VjgKqBBMYPPy5QRXNBv7ryg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('d8a8ea18b61842888f79ceb1feb765f5', 'oAvgj0SLBWeWBEJ8eiCi0jUpGldw', '秀姐', '2018-03-09 10:25:03', '2018-03-09 12:15:11', 'https://wx.qlogo.cn/mmopen/vi_32/2gEXFYzXOvFRgUgqpGPpLfDTou3YibaiaDu2q9kl8LLtVKWLyoSZ1WeagOm5GUn9s7btGrBIcbTF9LIOTQD7CC5g/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('d90e8997d474475f8a4c5e4e0019daa1', 'oAvgj0bw3yiPMr5P1rAM3XkIbSGg', NULL, '2018-03-18 20:23:39', '2018-03-18 20:23:39', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('d91cca63ea724e91be9af0851cc6cff6', 'oAvgj0XFNKYo9iGtW57tf7vIA6tQ', NULL, '2018-04-23 08:31:50', '2018-04-23 08:31:50', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('d9406ddd038d44ddbaa99488b918d556', 'oAvgj0bhZXL28KE2ogebQ6iAc_KU', '无疆行者', '2018-04-22 21:11:02', '2018-04-23 09:29:25', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erJn4LbXeOvibpmRTPmXJRkdKUoyIopSwtIOZiaQQ3jkxIJGWqXvfnTThcwWm7nicuotVjBBhlr2SOMg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('d9503539afb94f66b235a5bc4a4ab5da', 'oAvgj0eS80mLMsrbpFURTqtarcUc', '谌洪艳', '2018-03-17 13:26:47', '2018-05-02 21:08:09', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIE8sAN3syt6r7zG4UXuvXia3wMtdo8Kbke3McsQvGiahmAHhrBQzsHwmC3ibSZVoOy8BicBiclEY1lQBw/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('d95cad56c3ad4a5da24973a983696790', 'oAvgj0bqFeoGLi_bB_mytuG0Znk4', '猴子织毛衣。', '2018-04-15 18:39:17', '2018-04-15 18:39:21', 'https://wx.qlogo.cn/mmopen/vi_32/ViaShwWOib4icZ0flJGJu8t8ENRN9J3Qass17r9k38bicF0y6EZvj81WffZggPtybrhbCS9uo6tZOSqicPq1lHGT6LA/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('d99e5dcb1c16448185aa3aedef49217a', 'oAvgj0X5t-gJysqzFweCY4VyWwzA', 'rdgztest_KUGFIU', '2018-03-14 01:01:38', '2018-03-14 01:01:59', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('d9b5cf8046a542c9865efe559c8f03bf', 'oAvgj0Ze8spfPziKTcBCWLfxZzLU', '成都伊博视光售后服务中心', '2018-05-17 14:27:03', '2018-05-17 14:56:19', 'https://wx.qlogo.cn/mmopen/vi_32/IKOujEfjX6QtFleeM2Nqkeib9FVSqibK1Rg2TBpRpVdbEZGiaY9ia0aWqdejySyba5OCnJcLavswJV2d6cN4D9yNeA/132', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('d9f59df121d3464c8428f253e9b3ac5f', 'oAvgj0YFVaMScDTnLyoEYnBCV5dw', '黑包谷', '2018-03-02 21:09:19', '2018-03-02 21:12:00', 'https://wx.qlogo.cn/mmopen/vi_32/0RGkDtxbfhaHVFgH0VNDXaibbmibLowOSpEgYojMBFuVUzXXO8kuFJ4nCvEKh7xtqRIGyLYvI4nM0qNlyXZc4Xsg/0', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('da52b432a0c04d6d95d703661f28c28a', 'oAvgj0V5pW-wMELoZTobl76tyFHE', '十月伤', '2018-03-16 22:55:50', '2018-03-17 22:31:46', 'https://wx.qlogo.cn/mmopen/vi_32/9GVIJRURjja2SrLun1Z9b5o8MIKGW2cWGc5ZHGiaJ0I2iaiaGIiaicxCvibGMAvQHzao4Ot7kAuvvWJ54lGI3GYylibicg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('da836ecb31684ed7afb3694ed105e2cc', 'oAvgj0Rdgoxlbm5pAFCiYxeGdK38', '雪雪', '2018-03-10 17:06:16', '2018-03-10 17:06:21', 'https://wx.qlogo.cn/mmopen/vi_32/m7Roasm18Xye4VpJxlcEoibEG4BfxyQq4wyTF65gCqa2aKickuL7B4F6fNoT6iaQAhUHpia0B8juOh0arMQ3I6aTxQ/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('dab90ebf84dd43529f23f391d9e9bc94', 'oAvgj0aPxRHfZdXbtfltivkFMvdE', '小短腿儿', '2018-03-10 16:54:16', '2018-03-12 21:23:32', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKhZjDgUpia0IZxic6YIib2ibxktT6B9pgibMuibQL6FiaU3a7GITI6PJvh1Yq28b33HCEjPMYspUFJianbDw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('dadcb28bd8904540a6a41d1251367a62', 'oAvgj0UGM9MZCAG7t5vxQzLEnBZI', '范1', '2018-03-17 13:10:39', '2018-03-17 13:12:01', 'https://wx.qlogo.cn/mmopen/vi_32/unItUsNiaiaC7TLPIdAlHI0mSbbia8QrHz0ibCcJxCOH2rlDNWbm99WCxGAicy7rNo1zcciaSTuEovDibvb8jauUEiaxzg/0', '13880702514', 2, 1, '2017-09-01', '范女士', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('db259761a2f646fc9018154d7af52cd0', 'oAvgj0UGzPsKkSn8q7pzfcFlrxz8', '织悠', '2018-03-06 15:16:22', '2018-03-06 15:17:42', 'https://wx.qlogo.cn/mmopen/vi_32/k5Gh1AM2fH1bGFZyQic4HCpn3koFnJVpUiacVTA6d9GMGkzqofWy54dqcsBGgMCrRibP79ZKZrkX86Mo01XplRUhQ/0', '18782600270', 2, 1, '1997-08-26', '文海燕', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('db47a34912854528ae82ef42be5d9e71', 'oAvgj0aSIX-dVTBELFuLljj0JFOs', '朱坤', '2018-04-10 17:36:14', '2018-04-10 17:36:15', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJBkaicNiaQtXPvGaq1s6ykcicnB5gzhNbroyx4lEASHTtzTOlbicmQsib4ibKnic6wdRouZ8fhmBsfMSsPg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('dba6d03ae44e4dca9df93ffe6420efde', 'oAvgj0UN_dESkD3ng0ybRexu1__k', NULL, '2018-04-21 15:28:23', '2018-04-21 15:28:23', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('dbdad1d365b04c7e9bc790c0d36c2689', 'oAvgj0VKCJYaS3EObFa0Er_NIX94', '彭建容(意大利威尔帝酒庄)', '2018-04-26 17:26:06', '2018-04-26 17:26:11', 'https://wx.qlogo.cn/mmopen/vi_32/b3XCB1kvXvt2oTzZ3miciaj9VbYh1RK74Noic8AyKpbeXXVibI58pce2LDvnHbdoandibbqzs0XgFkZs76GcDsf7u4Q/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('dc124b05d87e4922985501cc0b07f029', 'oAvgj0VTRdX14u5dF_rjOARloL5o', NULL, '2018-05-22 21:26:58', '2018-05-22 21:26:58', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('dc255caf935e4ecd9d38a63e91a70dbd', 'oAvgj0S0hIeJ0KF6gkIGosELtKeY', NULL, '2018-03-17 17:47:56', '2018-03-17 17:47:56', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('dcda508d239d4ef08fd225da95979e7a', 'oAvgj0TaFXjHPqBvru78c8Mdon_Q', NULL, '2018-04-26 20:56:22', '2018-04-26 20:56:22', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('dce13fd5e0384df9bdc9cf06bd5ee0c5', 'oAvgj0bnfUr8gSQbGRCuYqQCOujg', '狼图腾', '2018-04-15 13:22:53', '2018-04-15 13:22:55', 'https://wx.qlogo.cn/mmopen/vi_32/HKwyGDvUCTWqq3iaoFSDf91BozQx9v2QWawK66Ndm4VtMwT52iadQM5ZxsOibJ3NibNKQflPhZhicfnlkADyZM4n4Yw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('dd1c578b81b041f096fef5f688c12633', 'oAvgj0aF_y6lEztjWYy0o8diP50w', 'A@何群（平安）', '2018-03-17 12:17:09', '2018-03-17 12:18:48', 'https://wx.qlogo.cn/mmopen/vi_32/UibicFiaarSImTlZIu9Qnrpad304vcrJRCmxIELZHRA4oAqJLAzLjSU9bo4BSRFQJnxVCk4Qtt3oxruaaHj6ibgQWQ/0', '13541104030', 2, 1, '1985-08-17', '何群', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('dd44a263fe564662ae2c817e07d77568', 'oAvgj0dwkeZeCiSuIm218aLFH_uw', NULL, '2018-06-01 17:07:42', '2018-06-01 17:07:44', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('dd52dbac9437446cb916cc82a62b8deb', 'oAvgj0dwfWoG0JdwntwaiQ4JStEY', '专业商户推广海平', '2018-03-06 15:21:05', '2018-05-03 22:01:28', 'https://wx.qlogo.cn/mmopen/vi_32/xgO5r9UGGtkXhKjKpJicMKlpnZF8T7eEsUV9WgzHqQcUTZ943I1QibVXticH2oib1h9Qm3b0dViacYt12XCUicZnVV5w/132', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('dd56c16d4b474de58ba6a8b5043755a8', 'oAvgj0RUeX9dX5spEWdgZA7xCCDY', '吴发勇', '2018-04-08 10:38:15', '2018-04-08 10:54:43', 'https://wx.qlogo.cn/mmopen/vi_32/tF8VyTmXc199txkt8OfKpn78zvhoCz0SJu7MrMtvNO9F2jKC2SEM4Za0oiahibMbkxhENmw7y5fuoJ7elEPHtl1g/0', '18108088291', 1, 1, '1982-04-21', '吴发勇', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('dd59fcd826cf45c99b7e191187adbe1c', 'oAvgj0Y9PWhcu2R2XOX1uqNU2QUM', 'rdgztest_NCSFOJ', '2018-03-10 23:43:46', '2018-03-10 23:44:05', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('ddb5ab9130fc41ed9e9d081fbd83fcd2', 'oAvgj0Y2gOAkTR_U3NEBO4y_AvYM', NULL, '2018-03-19 15:15:37', '2018-03-19 15:15:37', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('deaa4eb4ba1b441897d7a7dc79ba6647', 'oAvgj0SBm9wN_OkluA35Lix7Qcmk', '糖果儿', '2018-04-22 22:23:52', '2018-04-23 17:41:22', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIlUrRFKoyFnJPiahI62RhU6q8hO84eV5G0GZvQ6HA6pggd2bVKMnHyeibtL5G8iaibqlrRjCKKmAGYmQ/0', NULL, 2, 1, NULL, NULL, 6, NULL);
INSERT INTO `tb_weixin_user` VALUES ('debfb55321214ef7877361c6258029a3', 'oAvgj0b5pT6NPFaX83cmttZoceZs', 'A、呆', '2018-04-21 14:38:47', '2018-04-21 14:38:51', 'https://wx.qlogo.cn/mmopen/vi_32/ictKQcEMPwe8ELMibQgtKE3cLsaQ7qBRCXeVA5cFSpaFBocZdlQNNiauegeT57Q1kYbAXfhcjcqPpXh0ZyrFwdYdA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('df18079cc5fe47f685466bced25bf61b', 'oAvgj0YAx-EKxyspV0_6VWU4uWK0', NULL, '2018-03-30 20:45:38', '2018-03-30 20:45:38', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('df2c6f11ed6c42c796e812537bfed009', 'oAvgj0d2NAt5exXEnLNIa78hXV6o', '席学刚℡₁₅₃₁₅₇₅₁₀₀₁', '2018-04-22 20:39:44', '2018-04-23 12:52:51', 'https://wx.qlogo.cn/mmopen/vi_32/t5wldofoKKiax5OhjfydZX9kCQMnY6tgwBdh8UYVUWoeLaKxjMEGhlKhQpCPP0WqkeU1xib21LfDDL19BYkw1zSw/0', NULL, 1, 1, NULL, NULL, 13, NULL);
INSERT INTO `tb_weixin_user` VALUES ('df49b3f572d14385880728e4c13b2b88', 'oAvgj0Qk74ZGHT5myBUy2ZqGLA5A', '翡翠爱上旅行(瑞丽总店)', '2018-05-26 12:48:54', '2018-05-26 12:48:59', 'https://wx.qlogo.cn/mmopen/vi_32/4RvZuKvYeQo6StQaWn5tpibnEjlOrhQ6KUuHtt5nrS1TtHhmL7ic71uByoJmCHf7v7uc5iagtBMtesGmpRkezdm9w/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('df9ffe8b4f9047db8b0a2a37bdc985b1', 'oAvgj0YXwTuwFGr_fa3C9LANjoBs', '月如清风', '2018-03-26 11:19:34', '2018-06-04 08:05:51', 'https://wx.qlogo.cn/mmopen/vi_32/VHujEJQglWxm1HvMib0emEpkocUOYrMY0ua5Cznc4mak3NicCZVXhIvtS8tkAldH3xqCVfhRKKIcCMKibgPUrwabg/132', '18000555152', 2, 1, '2012-09-01', '伍欣', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('e0b4412536904de2b8658b1eeebfdea9', 'oAvgj0Th6z1hw5GPMnBSaI8D6XHI', '茶界小学生', '2018-03-10 14:35:18', '2018-03-10 14:35:23', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKlzHD7jU2Iqic821sOnAwmHTEj0hDwYKoCNHyTUzHekciaMd3NXg39lKA0LNMvNdsWpicTnfD6x65uw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('e0b87032fedc4127bbbb1851e22a596e', 'oAvgj0aOgvT6RiiKJtENjCYUTGRE', '潘英柯', '2018-04-22 21:44:29', '2018-04-22 21:44:35', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKwiayIYUicHUXNpeTnrXgiaHJTBxVfvcqiaxuUmaESEzI4d7CWgVG7LCXSicO80GyBbuGSPL1teQIhSzw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('e0e578b9d582434e9f92072b8af7a0b6', 'oAvgj0T_GIy3KTrZwY2RelNgcFMU', '谢国庆13999606121', '2018-03-16 15:13:08', '2018-04-01 20:05:50', 'https://wx.qlogo.cn/mmopen/vi_32/qIUFUHPUSxkXJSh9djhJN6sjCgks11Ocibt54icmYaqH8fSianczw8iauicZ9rgHaKOKFibjyK33Ux6nZIeJwiafB7s1g/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('e1494730149e42bab3e27df2fdee47db', 'oAvgj0UVTdjIEo7ZArolGlXO3Glc', NULL, '2018-03-19 16:44:02', '2018-03-19 16:44:02', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('e21059cf05254754989a837bfced2245', 'oAvgj0VTFls85mPgO29ZgZxi5s6g', '康', '2018-04-16 16:44:52', '2018-05-05 13:44:13', 'https://wx.qlogo.cn/mmopen/vi_32/UibicFiaarSImTlZIu9QnrpacmkRNlhmStnpDtwaFkP53x1Bqko9WYfQMJJ75uAoq0icedrcYIDyMVva5wLThcKC3Q/132', '13808178913', 1, 1, '1966-07-02', '肖康', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('e22d599403c94933a8650750967935e6', 'oAvgj0Xp2F0ATnMY5E5tJBngE7Pw', NULL, '2018-04-25 20:46:34', '2018-04-25 20:46:34', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('e276c5e5e78343c1b0500643e1f7fb73', 'oAvgj0aF5LD4qbmqW02lpesWSyp4', 'Mike Tang', '2018-03-08 13:01:36', '2018-03-29 19:51:13', 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEJ9xhCu3lJGw03lUEAkG3TRtYyDDeoibfI5iaqSUzTbPI073a9KPGzlRuYSt4D1K4rnqRMg2SLZbA2Q/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('e27c2eb02a1640d4aa78f3cceb01494d', 'oAvgj0T5KT-CWHc4OUG0tG3NtiLo', NULL, '2018-06-01 17:32:59', '2018-06-01 17:33:01', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('e313a905b02d458a9943eae01387a85d', 'oAvgj0SGZF9dTvaKz2AHZj3uPQGU', 'Y.Chen', '2018-05-07 16:50:04', '2018-05-17 14:07:29', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoib1oyJvyiboGqPHxgiaorqEGEm3M6238nPafFAPAwPiaGX0EdM55VAGcTTZ5kpPNsAUgun1A0FibzyKA/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('e31544ee229345829990eccd92901d8b', 'oAvgj0aOIrlh1APjmJ6jFpkwOjmo', '成都赢信创始人-张总', '2018-03-21 15:48:21', '2018-03-21 15:48:22', 'https://wx.qlogo.cn/mmopen/vi_32/mRjWGfrtiaLCR0V5OVqcJrF9pITXwMdybEAWc6cXvNCcVWZnUib5r3WQPABhzksdAovwdPEHbwXlXLnfMePoia68Q/132', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('e3661dc62027430c832f5583d3589507', 'oAvgj0RyOoUnL05ogtlHi7SKofzc', '茫', '2018-04-26 10:36:17', '2018-05-16 12:56:00', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epzxJGVzGfNYx4PSymHh52kIazM8wFticIx3wE1fRkp1du4d48ibjXL7WDXURHUtRaRzRxc9vTl3Mvw/132', '18780134200', 1, 1, '1993-10-05', '魏芯', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('e470caf7324f4811b84639e7dafe69aa', 'oAvgj0fbPASc1dd0soIwTtznQOF4', NULL, '2018-06-01 19:25:32', '2018-06-01 19:25:33', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('e491cb794b51412caa9801405bcd7b79', 'oAvgj0SMM88fUFlq8Zpw3gz4qCfI', '简约', '2018-04-10 22:09:04', '2018-04-14 16:30:05', 'https://wx.qlogo.cn/mmopen/vi_32/SAibn3GOmnYBaTIaUqLQicku5hjfyiaQbcvEvd0gicNpR8hCTiaDpGn79Blc1HYyaYWKia7ETEicG9qkvcdcvdcVFetibw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('e580802859404cdebf9f31e944c30a97', 'oAvgj0Vu-0Aw5PGS5x8GCc-1h_qA', '唐书楷', '2018-03-10 17:06:01', '2018-03-17 17:32:40', 'https://wx.qlogo.cn/mmopen/vi_32/AkTpylLVPjAq4dBe4anHia1sPDIl3nWHGxSApX6TL2UPZYOv15xITIx29orrPFv1iaaWst5RT1Hbh55ibGJvHVpNA/0', '15984410233', 1, 1, '1996-12-12', '唐书楷', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('e624315a6bec41bf802dd97b9092a143', 'oAvgj0YgFPGM0PKgENNkIRr2bD_c', NULL, '2018-03-28 01:54:57', '2018-03-28 01:54:57', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('e63e7252ebb448cba1133115021ad992', 'oAvgj0aAqZ-jYfgIPeootD25HB4Y', '', '2018-03-06 12:39:07', '2018-03-06 12:40:13', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIMf7ibdDHL4T7eZcVY8h8DHW72ApeXZoyiaxqX9QUaveFj9BVNMf8mJl9YFOSxOMHft5UibKVLmfIcw/0', '17311371530', 2, 1, '1996-05-20', '童诗敏', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('e649189a04ba4afb8c873454e70777fb', 'oAvgj0dlsGiI3st9dVosbZUOn9QM', '胖嘟嘟', '2018-03-17 12:15:59', '2018-03-17 12:22:25', 'https://wx.qlogo.cn/mmopen/vi_32/UibicFiaarSImTlZIu9QnrpaS286icBpkCiahWiaUCZoJFmiclOfHLYu1josiciaCJpk7H7qQ6r2GuB4lIYL45qLedev9vA/0', '13527462428', 2, 1, '1985-05-16', '刘丹', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('e68cdc26f3a84fa2801ef34289f65dd8', 'oAvgj0fZoK6iDEK35Wvq_hpkQTBA', NULL, '2018-05-23 16:58:10', '2018-05-23 16:58:10', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('e6b357ac96e94b91b3d05dbdd6018087', 'oAvgj0XjrddrFYRGkRnhNBL9IORs', '一大口气泡', '2018-04-14 13:23:53', '2018-04-16 18:00:29', 'https://wx.qlogo.cn/mmopen/vi_32/iakCcW403iceR8aufuQ3k6YRUf6l3Da6IpCkx1qV77amw7oYXVlRGRpD2nUibNK248ibTdxKa7I9Y3Gvov9hQg8dTQ/0', '18683250553', 0, 1, '1994-04-15', '李婷婷', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('e6dbec064dc243989731d2ed67321e06', 'oAvgj0d77RQHGDQJzUt0ktPBi94c', '蟲', '2018-03-04 13:10:16', '2018-05-21 15:07:19', 'https://wx.qlogo.cn/mmopen/vi_32/jpQvHAlv6jmfibACIbnibwrY27S957S2icjLlusxicTABSRpe3Cn7TicTTE1XhNsAzvBVETFiaJdtM79SwOeJnstMsUQ/132', '18081301684', 2, 1, '1974-09-07', '张成林', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('e7017c09dd4346ed97f463dde41024ef', 'oAvgj0f1nNamGFuzaTJXxcDHYCmc', '99% 1%', '2018-04-22 21:53:43', '2018-04-22 21:53:45', 'https://wx.qlogo.cn/mmopen/vi_32/EhUYeXSFutyv7FnaB8jZUvMWdaO2c6vtTiaGl2G9iaBgQI2QVRCZhIzByBjxg31965xXMM7rVJiaCppHpjOibnQynA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('e7732dd298a342a8b2871254e53f5b9d', 'oAvgj0Sey9y0i7TTX3OpsVqlDsIA', NULL, '2018-06-01 20:36:45', '2018-06-01 20:36:46', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('e7cba8ce0d52499596bb2e2200e8db82', 'oAvgj0RwI_ELU40xxccpsoeP07lg', '郑建琼（凤之彩藏茶）18981614333', '2018-03-10 19:56:21', '2018-05-10 17:21:29', 'https://wx.qlogo.cn/mmopen/vi_32/TEAynM0HUOrueZDnbwnsYpREPMo2WibKA8JpJab8Ywib57XpqrCTBCTibOWy0K1jer74QzOibBgnN5edS0EYnodFyg/132', '18981614333', 1, 1, '1966-11-20', '郑建琼', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('e7f1be92f1e241008bcc8a83ef9549c1', 'oAvgj0Vx4GH7F4QawX06ilS1A1SM', 'Ave', '2018-03-07 16:34:17', '2018-03-07 16:34:18', 'https://wx.qlogo.cn/mmopen/vi_32/TUp3tyJ5cCl2tYMEZvicHPT8CibZ4DSGNTPab7JBictaUjNMWIDLE5BnekZOvFWibTjQfBlsnac8iboDDcOwjGq5QibQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('e81e4402134e4d309bba0593a4a22656', 'oAvgj0RSCUJiea-NVI410D-SXuH4', NULL, '2018-06-01 18:16:09', '2018-06-01 18:16:11', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('e87d6e456e6e49c8889f7fe1646e3623', 'oAvgj0eS-XPyi9WaeSo5FabbEqEY', 'rdgztest_FSGEKU', '2018-04-05 15:04:01', '2018-04-05 15:04:17', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('e87e15d2148a48588f0ae284b21dba70', 'oAvgj0bE-QT7bNc74hCLNFvNrz-I', '陈富平', '2018-03-01 18:21:45', '2018-05-09 13:34:57', 'https://wx.qlogo.cn/mmopen/vi_32/1dJPUianIdnxKXgRATIdz8LlfibGA0J55x3lIXXrN5eT0TLbIBKVfiayuk5VqFTXkjicHCSp2gVIHLy9AsYrwnEppw/132', '15082407542', 1, 1, '2017-09-01', 'yyy', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('e889cfb3b3d24695a683fb63547f3949', 'oAvgj0ZEnkg-MZybRjCqlnimMWEQ', 'Young', '2018-06-01 18:00:55', '2018-06-03 17:32:02', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKwhaJU3uV5rQWQ5nx4GXUafnKIfkmfaJn9Hz46yg4VCbmiaicCHMlCvtNIbOvXut8bBCZicks13ViceA/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('e91cd5f82bf7498b83573b30c5c6a8d0', 'oAvgj0QcCb4QLFVit2O086MW2Qyk', '唐人街·ge ge^_^', '2018-05-21 17:11:21', '2018-05-21 17:11:23', 'https://wx.qlogo.cn/mmopen/vi_32/ns0DMPJeHnrLrOvcDdQmLV3IVA4UAGanltUUZZo8EdkjLeS1Iqic8clVN3YyRhaKic6cIDSHWqlC1Gd6NicKI7FZw/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('e993065f1ef942319a290a5653d8a9b4', 'oAvgj0ZXZtPHXUjGBVSEgJWGxBlg', '强哥', '2018-04-02 07:30:55', '2018-04-06 15:27:53', 'https://wx.qlogo.cn/mmopen/vi_32/mYswn9DzRMv9y6c5zHkAtdAsYmkTDNUgNEciamH1R9OkL0h1IXznBtlNVric7JSvzhnVib0NibWr4MGj5BU9a59mOQ/0', '18602820069', 1, 1, '1985-03-03', '邓玉强', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('e99e52de277e4dcabe92a3ef4708024f', 'oAvgj0YEi1JXqU28ovI9cAF3p-w8', '������������', '2018-05-28 16:36:45', '2018-05-31 14:09:43', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoxVLOD5FlbB1ibia4KZmJyDqxfkelGSS1n3mq7NBmhATQcfKbibYVqXQvo8pKlicePD6n3eibqTzicNb9w/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('e9c3781fa3714a68a59e435bcbacf9e1', 'oAvgj0dRd6cN8-Dgs5YZdpHu9tQE', 'rdgztest_JSWHLJ', '2018-03-02 06:24:15', '2018-03-02 06:24:32', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('e9f42f9c6ee34163b41abc5d052d69af', 'oAvgj0abgjuPU2IufZ3MRsjFN25w', '还是我', '2018-04-07 22:51:26', '2018-04-08 00:25:02', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eow7vbTHIzdD5b3tGeMTyiaEM5NKClIaPI1dibDDPlUkHFe8aiaMpYImgeuStzOibqYQGhxx5Y0LFPCwQ/0', '13603308096', 2, 1, '1987-11-13', '梁少杰', 1, NULL);
INSERT INTO `tb_weixin_user` VALUES ('eab032240ec84602a5fd7db92b015297', 'oAvgj0Tkm90243gWnDmJpsa91boA', '王彬', '2018-03-17 11:36:33', '2018-03-17 11:38:29', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJWFdKjyLOXtAhpeqoiahBeAV2FbxQpCbyDZJbwGbuwIiaMRrQ9EsZoCibqb4VhC3zC8WbSsMdCoZriaw/0', '13552140038', 1, 1, '1981-10-05', '王彬', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('eac64f0c542d459193f3da75af7e6bfb', 'oAvgj0TyKOdUISxR7Vq4ijDZJMPE', '王明华', '2018-05-11 09:40:07', '2018-05-11 09:40:08', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLTJYM0I0G5nhbl8DlKwRLaDYSgWLozgboYxmjJXEPdZX7afeG6iaDnRhnUicdMUBrr3AJibhFfs3Qyw/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('eb0027e99fb347c383dce5b882d30764', 'oAvgj0cmrDw1iHtoE4luhT7LR2JE', '花呗分期', '2018-04-22 21:44:38', '2018-04-22 21:44:40', 'https://wx.qlogo.cn/mmopen/vi_32/f53hskHdlDmlaxnFDJ2yvPyphsbPoIJ9cP3gorgF8zptNO4Uicb2qSBsTaGvGnRT9f3JbUIEjgOzyJV34X0y78Q/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('eb0a4750920a4100b15b5117ace28388', 'oAvgj0a8nN2O78qui7fqOt39qi_E', '顺其自然小吴', '2018-03-06 09:45:04', '2018-03-06 09:46:10', 'https://wx.qlogo.cn/mmopen/vi_32/rW1VmftBogHMtoCl3ibje1vHQtAJaErOwAE1zherdjOoG4MBd1Hmr8IicwhML8f6Z1urSQRSc6ZP2qia4nqPGibTbQ/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('eb1a12ad1a054ab8b7ecf9a0a7a300ff', 'oAvgj0fpFRLtNPdUwLAQrMfTqOpU', '张超', '2018-03-05 10:46:20', '2018-03-05 10:46:34', 'https://wx.qlogo.cn/mmopen/vi_32/Hu02whNTWiap7VwEDqzOzfZh8SO4cQicMIV7ofichgTibhXnWibtnWxbcUcNgcMj0KpjsnfJC5gl097vh9tFREz2FFA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('eb4a96d1218b4741971a0b3aba15f2a4', 'oAvgj0cMrbRtsbHjyCAj6t_9AaPU', '超人推广服务中心', '2018-04-21 12:23:50', '2018-04-21 12:23:57', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erS4lgdZIjlJuGaJicT2dn5H7Dshic1HzjYzPTJkKo6lXUOcI2VW86ObChM8cfAJNFELFvsiad15fDYw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('ebc15ef4696f452199acbc35bcef1c96', 'oAvgj0QCjnhWfW8ph7hnjnmZaink', NULL, '2018-05-30 06:12:55', '2018-05-30 06:12:55', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('ec0c091715b945a7b9495c7ac7df16bd', 'oAvgj0X_Zl9OiekW0KQMe14yT0LI', '绿丘张老师', '2018-03-12 14:39:15', '2018-03-12 14:41:45', 'https://wx.qlogo.cn/mmopen/vi_32/s6UQtwLHUc0FmMnIt0VIXVrejUzOeLF9VC9nL3j4jEV6uPsWj8K4xeZLKseuVhDuiad5ibpkkczJSxCQYSbFJkOg/0', '13980813514', 2, 1, '1986-08-01', '张平安', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('ec38a748536d40dbb9d57be0308f0098', 'oAvgj0YvTdV8vJEl1bRpZEGKq0cQ', NULL, '2018-06-02 15:46:40', '2018-06-02 15:46:41', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('ec4f0bbe6ad64674a429cfd231e831e5', 'oAvgj0cm0t8SsbBrZhKZ9p3ihoeY', '今日头条@金龙鱼', '2018-02-28 16:34:12', '2018-03-02 20:55:19', 'https://wx.qlogo.cn/mmopen/vi_32/tlnRaKic6pfsNibYDticHTuIzE5ERR5xusI4oqd9IV6v82I5bicspnXZ3RgVBWfkVdBXkHHiajhzJ3d7XhRSlMkzTEA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('ec9f1517d31e48a8b0b359cfe5dc75e5', 'oAvgj0RQm9bWfZIvJXaAj4W-8LkM', NULL, '2018-03-06 20:50:30', '2018-03-06 20:50:30', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('ecc7afbbae6b4eaa80780c889ef20a9b', 'oAvgj0T_HRjnAcE8icj3B5UBtdFU', NULL, '2018-06-01 18:00:24', '2018-06-01 18:00:26', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('ecf57704cd91445cb18d38df02fca274', 'oAvgj0RJdUdKn_8spVfLFxnZMa4g', NULL, '2018-06-01 20:15:46', '2018-06-01 20:15:48', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('ed0358159fab41818d2ba58c8a44e34b', 'oAvgj0RtNxWbYBiUQ26bzw6LOiE8', NULL, '2018-03-30 14:16:46', '2018-03-30 14:17:18', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('edd6430f148049b490d19382b0d7b6d2', 'oAvgj0W3vwXZrDuS0OpIcvioUKvQ', '梦想是我的宝贝', '2018-04-22 20:21:07', '2018-04-24 19:36:33', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eofD96opK97RWEOvUIg1rxd8MWeIDiase0OAtJ01jmh9JdGWFeDkZEBPORQU95e8tlTF5YeibfK7lUw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('ee6564f1ea4a4d6da0fbed3991c1e7b4', 'oAvgj0Q7_AU37twvf84VSE3Wq3T4', 'Olivia', '2018-03-17 11:34:57', '2018-03-18 10:38:16', 'https://wx.qlogo.cn/mmopen/vi_32/hmeudOkUXh4hznXN7B5icmU0qL1qVSw4ciadl5ibZDhCNpPlF8kUouicXdAJlNMmk9dkrK4yUYDicrYft0eiaWwdtW4Q/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('ee70f620b9cc4072a15b2bfb9082d677', 'oAvgj0fCAmYN_rnHed0BGY1ulI4o', 'rdgztest_VIWCBN', '2018-03-27 16:26:16', '2018-03-27 16:26:39', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('ef7eb90f67024d23a4d6999125af1289', 'oAvgj0SWQ5m__VUQ7d6naTP5vVH0', '李全鑫', '2018-03-04 11:27:57', '2018-03-04 21:28:49', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKjhq3Pnsz4HzlpPUdgia9LehSNgJhs96OBoqciahicuTInuDbria7vc2lIEuoOa3H22qZm0TRQsevC3w/0', '15828248160', 1, 1, '1968-12-14', '李全鑫', 2, NULL);
INSERT INTO `tb_weixin_user` VALUES ('ef8ab76473de4b8499b039d2ddbb0851', 'oAvgj0a5XjPjr6CtbZAjlBbDK_bA', '打开心扉', '2018-03-15 19:27:22', '2018-04-18 10:55:57', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKU2EUvVo3QyprIhQRujloND1zbWfBYK7CNicaqjvhISr95pp4oEkicD0J3GNoEnbkwMT87SNJ4wAfw/0', '13981876246', 1, 1, '2017-07-18', '王超', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('ef8db59256f147469b10e63e65099378', 'oAvgj0Z6bBC5-d6X1qYF8OfmRXUA', '越灸越健康王坤杰', '2018-03-15 20:26:01', '2018-04-15 17:48:52', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL5ic5iaoLOpOllBibD6dhY5bOiccwgGJwwnWq34eDxiaUGDBaGicGZ6p7r3lbuJQNghB9pxnoZ4tg1hPrg/0', '17785227922', 1, 1, '1974-03-30', '王坤杰', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f03fb262dcb84ec0a89ca45e9b5b6805', 'oAvgj0eNMTRXNxrvn54d_v-aAM80', '小可爱', '2018-05-16 15:50:40', '2018-05-16 15:51:22', 'https://wx.qlogo.cn/mmopen/vi_32/eL0SjMBgiauRG0qIPoxYd9LibqMUwKzSiaW53icLzKzicHRrbW6ib47Fb2f53jp5MdvaOqcXNx472wDibuVC9WbcRWxsQ/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f0a56de47213410a8993538e8f12bb94', 'oAvgj0WRBN5sc5vzPoZNOOAYz9gw', '静', '2018-03-17 13:09:00', '2018-03-17 13:10:32', 'https://wx.qlogo.cn/mmopen/vi_32/aeCJlOUAyLV3AdT6wf2b3ecqJybrqCiahkgfHHkWj6ibxiadOd8C0gfeQvrI6nUFnPoznW2UYq3icaJsvNqGSc1EVw/0', '13981943313', 0, 1, '2017-09-01', '王静', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f0a5a262d2f4430097a121cefe3496df', 'oAvgj0YGGi_8SCzMJn_XGPSMcbIY', '脉啦啦许胖哥', '2018-03-05 09:40:07', '2018-03-20 11:25:43', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLrU0sufRr2sRGia5ib8o9M5qSpc1IHskGDlxjQ8JQM8xhlT8LAVicBrkycXajApK6AwVASm9ZKnoqyg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f0c11d261c934897834c2ce3ea4fcff1', 'oAvgj0c2kAf3VD4hrFsNixPzf5qU', NULL, '2018-04-21 15:12:28', '2018-04-21 15:12:28', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f10bfe82a72a43758780d89108ba07ef', 'oAvgj0WPQf3LcfPZdM0_9KR99DN4', 'monster斗斗', '2018-04-23 11:01:23', '2018-04-23 11:01:25', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erhvyJos8fFcPxqoQf5ekfpQRROWibMeBMA4QWHRIhrXF67OZiaujsyRPKCdDichYychUWFjEJw0BTXA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f11ca7344e884f458d2d7c451826c0ea', 'oAvgj0ast5GnpvO4HzHa2HxAKyCM', NULL, '2018-04-14 08:38:55', '2018-04-14 08:38:55', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f14f31c8ca77425fb933ca89ac9a3705', 'oAvgj0fyIuPD5tbyiRMO9fH_ePZE', '奋斗的小青年', '2018-04-21 13:13:25', '2018-04-26 22:05:44', 'https://wx.qlogo.cn/mmopen/vi_32/rq5lTBxUEdWzzvWiafWj1ksbq1BDEMiaKUa0ZicGI72EURLj1ZJKc19iaFo4hJyJOIjbdYSiauZsDsRGNd4TpARrcibQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f164b95639b04161a3210390bd7cd90a', 'oAvgj0Rk2UgVd8ueX2kEhWRvjlVo', NULL, '2018-06-01 20:00:21', '2018-06-01 20:00:22', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f1bf4433be714bb5bc5b0d7a0f69f542', 'oAvgj0ZjrSFFx_d20B1ZzoC1tWog', NULL, '2018-05-16 22:53:14', '2018-05-16 22:53:14', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f1c9d12b8f6540cba82831caa527c5ef', 'oAvgj0flPxpO76jeNnPnSHQ_hofQ', '老陈', '2018-03-28 15:38:53', '2018-03-28 15:39:00', 'https://wx.qlogo.cn/mmopen/vi_32/eu0ZgkMgfgzmsMWpJKjYytIdk7B1TtXo4CBL0xAicFJZ6kgRRLLUEJAJaTkr41UZLZ88KvPB5gfpUpc2fNicu7sQ/0', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f1d82d2dd59e47b98437e1874cbf3b2e', 'oAvgj0WR5-mAJDKcmRaUktyaAg6w', '清风', '2018-04-23 12:13:09', '2018-04-23 12:13:13', 'https://wx.qlogo.cn/mmopen/vi_32/4ZDY9mHh45BXQk3j7bm338c8GR6w4C1q30Yl0qyK1NHiaxx3cB4ZZAnwZfg6lQvFAmWvCxic8CqZsUyFE6UgKzng/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f1ea5146fbae41218478bfb5b7671faa', 'oAvgj0Ud5miuZ3Bgr8OuWrLEvRRU', 'rdgztest_THILUU', '2018-04-14 14:23:43', '2018-04-14 14:23:58', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f213b6c2e1144e418d91bcf9a18c521b', 'oAvgj0UuJphQPzF7Af33WvYwu8N8', '余', '2018-03-31 10:04:34', '2018-03-31 12:27:30', 'https://wx.qlogo.cn/mmopen/vi_32/rVPgtbGVJZEwzKrHibMzoyGq75pM1rNw37WibstmrKmbuAAWYrLIqG5WJicJTZuoVjla95XiaWKuk1oric2Va6WArkw/0', '18328526077', 1, 1, '1990-02-01', '余刚', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f25be03ab6eb4979931e33505c1b0516', 'oAvgj0WJAQGr474n9-I6pequtj9g', 'chenxin', '2018-04-21 17:23:04', '2018-04-21 17:23:10', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJjGypw65XYqTEgMoE7XbffZ43koNP2UPbAeCib1NzoqSIayISUV3wR14JtByKl0AAP4ibfSaAq3DCQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f2645bc5a08b40b49134b1f555924294', 'oAvgj0VWIVLxyNsnjuyXSJjIF4Kg', '心之所向', '2018-04-14 11:41:42', '2018-04-21 14:37:52', 'https://wx.qlogo.cn/mmopen/vi_32/b2REjyI7OA8ReyZI9eR4rTPXqVua4FYWpqAiau73AsVhR6ynlCiaicRzhphg6fGalp4cQyuwB38iaeBcibvKpalNDJA/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f2a0746acc97463ca50d88d22e5370cd', 'oAvgj0bNnV5gkna5dyTDoz0C5d0M', '张工', '2018-04-25 11:06:17', '2018-04-25 11:06:19', 'https://wx.qlogo.cn/mmopen/vi_32/tjRJjc4BVmj4aJoWmtJG96czRQWt6kicj6iaqdr3IxRTT32Df3iaJAIz6BAicPPcXZjCPjXhHwsw0TDFCnGYARnPxA/0', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f2f7c208afad486aa400db05a3e756a8', 'oAvgj0YFpUlBpWjQouQ8blVajzW8', NULL, '2018-03-10 10:59:49', '2018-03-10 10:59:49', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f333b50e15504db6a6e5d7d14511f324', 'oAvgj0Uw_8Y5M0yOdyAExgMHohB4', NULL, '2018-06-01 19:56:54', '2018-06-01 19:57:27', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f3d4d6407c6943d596944a718d0050fd', 'oAvgj0UZEaoevo41o6Dwp8il02gs', 'Qnxhz', '2018-03-28 14:27:42', '2018-04-21 15:49:20', 'https://wx.qlogo.cn/mmopen/vi_32/K3IJ9UEkZ3uh000SM0Ec8tmgPjeYHic7GMibWyOOCeoRm6uVUURC1gBURcs6ElP7aN0myCVDYiaWrwjXRorn7RojQ/0', '18328522575', 1, 1, '1989-05-14', '18328522575', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f3eef1bc923542de9bae649719645462', 'oAvgj0fmzEcZ0YBmiWu39KURZkQ8', '唐留芝', '2018-03-17 10:57:50', '2018-05-30 13:28:18', 'https://wx.qlogo.cn/mmopen/vi_32/HTIcHD4nxPg17L9XK7fPTvH4q305FXeR9SDZQn3OoQFJsvu5JB1via9DSKnBBJh6UvJViaO1FXOj083p43YeeXkQ/132', '18284567047', 0, 1, '1964-07-15', '唐留芝', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f402e6027aad4690895edba1ee774823', 'oAvgj0UCQ1CKKXAldXUxZOy6piUk', '梅花', '2018-03-17 14:57:21', '2018-03-18 07:55:19', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIaxhA2xdIRKeRV1libFZk6f17jaqMRgWNZuxU8m7dbWbXwzV1b89vlX5WOZl3pvXlyq44Ab1ZMcZg/0', '13882044083', 2, 1, '2017-09-01', '黃', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f449deb7a0f14322b084ccf9f110717c', 'oAvgj0U1TgorH0VEbcAen83oTdx8', '勿忘初心', '2018-04-22 22:29:42', '2018-04-22 22:29:54', 'https://wx.qlogo.cn/mmopen/vi_32/k94bNW3Vnia7lAppaMDJINrjvPVjTC5znrxID0znCzkBEticnHhN9BwB2YicI3ibicYhtN2dYS7DvLAwqVyWfEqqdBQ/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f4991eb5558744a5a432120104fc112c', 'oAvgj0cDuYlGZJp9hpRBmjqok41g', '我家宝贝', '2018-05-14 08:37:52', '2018-06-03 13:15:27', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI2GyzfhE5mKUuUXnxV7pevE992fd1JL5Tf5eAQGGFfibxnmmV2djwzpLhoo8F9Pfwl2NK6P0nbmPg/132', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f4b5760e67944bc09a81a0a51c07b328', 'oAvgj0RbZ_0lTaLa8alyVWm_gQos', NULL, '2018-04-02 17:56:48', '2018-04-02 17:56:48', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f5030983c3464d859ae070df24962290', 'oAvgj0fJR-JK0rjgR2sasOAG5P7M', '传滨', '2018-03-17 16:59:02', '2018-03-17 16:59:04', 'https://wx.qlogo.cn/mmopen/vi_32/FicK25HvwSkygfG9uia5xulWIVoQgqyqDohDsT27rttSFnCdOsd11kp52yqBq3ibVl8Mvibicd3SAE3ZlQSnCeKwDjg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f51850e52622420c89924641c392457b', 'oAvgj0fm1WpSns5zHMDsgLn8rd4c', 'rdgztest_MHNGSZ', '2018-03-18 18:15:02', '2018-03-18 18:15:20', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f59056f05f054a95a910eac831cea6a7', 'oAvgj0aeOsEmo-bnKyI1cJBMZbSs', NULL, '2018-04-21 16:25:44', '2018-04-21 16:25:44', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f5e6352dccc44cf6938e9483e9774d4a', 'oAvgj0f2p1Y8pRyUoxMVslu5M8Ws', '恺乐奶奶', '2018-06-01 19:52:04', '2018-06-01 22:31:20', 'https://wx.qlogo.cn/mmopen/vi_32/qpv9RoCCWibUmhXx5Fa9sR1T91llZ0DNJpEpqiakWwD8e6dfZxBHG0c5hSJG8GfapFZVQA6sRy6YC6v85Yf7SpjQ/132', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f67dd2f0e9064ac28cdd837a5c288176', 'oAvgj0c9YwiNQ-qyrlW6uYuinuoU', NULL, '2018-03-06 15:26:02', '2018-03-06 15:26:02', NULL, NULL, NULL, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f6d8be7a5248495dae0f8867f9d6584c', 'oAvgj0UDTI8uGcRk7Vb4O6DBOsZ4', '资源互推', '2018-05-19 00:16:48', '2018-05-19 00:16:54', 'https://wx.qlogo.cn/mmopen/vi_32/ptD6dDJXsS9bricwdrVHGRia5vm0I2Z8obXP8E5WU2QmF1VkvmGNialviar5aRiaTGrQ5KzCX8fq1ialHamSep6eC9kQ/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f75ddacd8db046ef92070952c5cc665e', 'oAvgj0S_cptgBY28IRd3qTA7VSGY', '刘奇，超越梦想', '2018-03-15 14:05:14', '2018-05-10 15:19:18', 'https://wx.qlogo.cn/mmopen/vi_32/0iaiauALtEFdUmGicT1NuL8bUbGQyIVQVsOPEsmrSlro5fNCKQOneDgu2vWaYARugcvp750JqLDRey1qgSKA5r4kA/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f7c1fbfbf5d54bdc875cbf0d1e7547b3', 'oAvgj0axgmvGzJ36XvtQJYO_103o', '摔车门小姐', '2018-04-10 14:33:36', '2018-04-10 14:34:14', 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaELcJ2mH81gzUVMupkiaZ9nfsmdt4DFz9mVBGl7u629NBuprAjBZk1ahL0l6JlsxHIXufHQ6TMSvVlg/0', NULL, 2, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f7edca4ab9c349bea1ea0d5fa19206b7', 'oAvgj0cC-Z2v_vqv2zhHt1GrYV7c', '哦嚯。。。', '2018-03-30 15:57:28', '2018-03-31 13:17:38', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJcZh2daicchErzaZI6h1qKiceOshTSiaFT7wR2Njlia8bQAvjgibcubGlzRnPOeowQkx8oYqBIOLia1PNA/0', '18284321998', 1, 1, '1988-09-01', '阿奇', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f80f9fd39a4c403296cb372e64965ffd', 'oAvgj0W8uSY6Q7kcpS0Mk9xon6Qw', '~林~', '2018-03-23 11:25:59', '2018-03-24 13:39:43', 'https://wx.qlogo.cn/mmopen/vi_32/8NJXCibjiaDoMGwndhnKtxR8zPKMMdAHtWT7qIURAWtvCVExZ2ZFKtnfXtib7xjJicKf0ic2OA98FVflS8RHxpsSDmw/0', '18581855885', 1, 1, '1900-09-01', '林建洪', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f84e5a2435a142dabe85f63c60fc5013', 'oAvgj0do_rggs4MY-Zw-9DdJK64c', '中书大人', '2018-03-13 07:13:45', '2018-03-13 07:13:47', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJXE3Zz0U5edRbblicQ3gZVExvrdpiavZ3o8KKhv9Tq36Ob8bbWOttDzA1ibicpbibIbLznVmwTFrASNjQ/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f8b13fb0f1b54b2c8aa31245e657f98a', 'oAvgj0bB1EylaEx7EHCbh722sV6g', '互联网咨询^李', '2018-03-02 20:19:05', '2018-05-17 14:58:17', 'https://wx.qlogo.cn/mmopen/vi_32/Ze4MjpsicYACgxk1KfPQ1Bjmvcqn2NKEy40Da5xAtb7TfHoUPfIGM7Y73db6JR6b63u2tL4m9g4ianZO5xpRQCug/132', '17381907701', 1, 1, '1992-05-15', '李生', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f96df15d155e4d3ab02510ddd5b44cd1', 'oAvgj0QfwP5IEBdxES80aYlx1eHI', '庸人修心路', '2018-02-28 16:34:48', '2018-06-04 12:29:18', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKlias48UEFnpkcsXOciaILBoL3wUg7LWq40icGFOcB8C01s7hklRlYk4XMBkQMJx44bxlbvOs1eEqVw/132', '15982183168', 1, 1, '1995-09-01', '李伟', 5, NULL);
INSERT INTO `tb_weixin_user` VALUES ('f9e7fd6b46094fd69ad388186c02faf3', 'oAvgj0bTNjKn-lQIsvc6nYnriON8', '蠢货', '2018-04-25 07:16:40', '2018-04-25 17:05:02', 'https://wx.qlogo.cn/mmopen/vi_32/dD226qgsSRSYTRnIfDvpxZsf68bs1XLgiaaibfdrQtOjjicYcBzXYf5a9MFjfyE0U5z8T6WXXrhAccHTYuibdoz5Ig/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('fa1a318256c64270a7a989cc953953c9', 'oAvgj0ZJMw9WdyehvAeHGyOvqGcA', '一米阳光', '2018-05-11 10:13:26', '2018-05-16 16:04:28', 'https://wx.qlogo.cn/mmopen/vi_32/rvw5eIm4Y3dpYL1MoFGSH8FDyicR9k5ECMe0eqwqUibibN70kmxALVhPJ3sbUqObIdWq94lic1lbZlllo7elz8vS0w/132', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('fa96c7b45e294f4a873b76d654a13d04', 'oAvgj0SjSKjHiRpbpGBKl5ljgvkM', '为爱掉层皮', '2018-03-06 14:30:01', '2018-04-14 18:27:32', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoV3bHmuVXqZ0pgTibd2BYEjTKwTQxN1SY2riaGXcvpu8zcUWeqB618BH6fgbWLGvRw8Q30WSiaUYWBA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('fb83738237f348bc96b4a828516feebb', 'oAvgj0ftAdVLMH7LbxsfgPIwejuc', '张松林', '2018-03-21 15:59:39', '2018-03-26 15:35:28', 'https://wx.qlogo.cn/mmopen/vi_32/eL0SjMBgiauRG0qIPoxYd9GLdwABx4OSibIdt15HxTVwuQ7lSsLYozuK1qoFuzjPaziaeXwIStjvqvFb5HpyXGpiaw/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('fb8c79c8216f444db67c344d07f32a84', 'oAvgj0bhbhOlPvhj3-c3DmuvJtkY', 'Bling', '2018-05-07 22:22:12', '2018-05-07 22:22:48', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK0DgLsDPcgV4D0gQ0ZUsuceCVgNGibdZ0RjU2snpHgwNgSGcW7sAJia2vZaQqdJZU143bpCA4VE6ww/132', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('fc11addf60934852b8a5f3c7a1472348', 'oAvgj0eMSGri3r8bFiNS-s-nP0U8', '茶小萝尊享黑茶', '2018-03-16 16:18:41', '2018-03-16 16:21:09', 'https://wx.qlogo.cn/mmopen/vi_32/Q8cMvuFQ5NTBxhZF50jG7cD37k6BRQvvIbAIvlPlcKibDP9kt9awSs4t2NkyYYRCRnqaAYKgMANuPfpsrtCtgJg/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('fcbe1e59f35d42d1b1c8761722c85915', 'oAvgj0USdCl2z2529lSt4HBTw1NE', '田青  大好人', '2018-04-21 10:37:07', '2018-04-21 10:37:45', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJA3ueB6fLNpoCPIz12RfRXJ1mqftkibPuXCyBP5ib7AjTJCGDUAicshmZjFycNsXwcPpxXg2icwgdK3g/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('fd3fb360edf9488da13b87f1dcaf47ca', 'oAvgj0V606ZvX8aMxgiKvc2GrII0', '项彬', '2018-04-22 22:29:09', '2018-04-22 22:29:17', 'https://wx.qlogo.cn/mmopen/vi_32/7g6icshVrInJ6aSP1jLXp3gBr5jVYPrp21JAzhAMJLhibEwh9h1ADVzhWdnaAsVgamf6uJ8lcrTich6nvL16GcpZA/0', NULL, 1, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('fd5f4ac4f7dc47c6b6122390e3beb78c', 'oAvgj0QbX31UoAX0Xj0x6Gll72Wc', 'rdgztest_IXTJUN', '2018-04-17 14:41:26', '2018-04-17 14:41:51', '', NULL, 0, 1, NULL, NULL, 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('fde74234c07f4447a4c71127f7b68cb4', 'oAvgj0VPLekFy2EcHcRuSKIQxh-M', 'V', '2018-04-02 09:25:19', '2018-04-17 15:59:54', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epBUaqBcCkkxgnNQRibQXOLd2hO4m7t8AicGxNk5BhcAiazU2OBG8JLtclb1icRx2ZZ7le1vlUI2DQjMA/0', '13623654284', 1, 1, '1994-01-04', 'Vain', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('fee00ba406fe44e9bdb0d1d2b33f2fde', 'oAvgj0QJyKznuJzFtwzJ2giVFECw', '和气，生财13982095890', '2018-03-06 09:50:40', '2018-06-02 16:29:24', 'https://wx.qlogo.cn/mmopen/vi_32/fhcBH7NoWfkZLqOialArYNEJSwgDIUQYeTNqYlRRB3seupicAOEJZJlkDYcNZ2eHNtsFCTSgwaSR4yicEmiaA4hF8Q/0', '13982095890', 1, 1, '1985-12-13', '左大成', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('ff04af8969944980ad118f2fc089e4c9', 'oAvgj0cnWZ2Z2n7E0YAhRX7ecmgg', '南风凉', '2018-04-10 18:49:52', '2018-06-03 12:20:47', 'https://wx.qlogo.cn/mmopen/vi_32/Tn8P2MVmN7zRibq40pmZj8vEFotxPjEosxg0VIKGvQQhl3Uqdw4pOJ8D42q2UqREBTDXnlecAKpojCFAmvT6XUQ/132', '17358532489', 2, 1, '1998-09-01', '罗嘉兴', 0, NULL);
INSERT INTO `tb_weixin_user` VALUES ('ffc51217a69a4c2eb063db9e202eefb3', 'oAvgj0fKYwxz9COPRvyyUP1Cb03A', '飘雪', '2018-03-17 14:32:14', '2018-03-17 21:56:13', 'https://wx.qlogo.cn/mmopen/vi_32/NJIWsZ7hUPwoxnkCzt79gCg7mOesWPBqcCGKvykRgIOGXH0N5Y51Caf3Ur1QAJF2WKguliaZblGS3SvZ9hgJDlA/0', '13648083929', 2, 1, '1982-09-01', '叶娟', 0, NULL);

-- ----------------------------
-- Table structure for weixin_command
-- ----------------------------
DROP TABLE IF EXISTS `weixin_command`;
CREATE TABLE `weixin_command`  (
  `COMMAND_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `KEYWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键词',
  `COMMANDCODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用路径',
  `CREATETIME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(1) NOT NULL COMMENT '状态',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`COMMAND_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of weixin_command
-- ----------------------------
INSERT INTO `weixin_command` VALUES ('2636750f6978451b8330874c9be042c2', '锁定服务器', 'rundll32.exe user32.dll,LockWorkStation', '2015-05-10 21:25:06', 1, '锁定计算机');
INSERT INTO `weixin_command` VALUES ('46217c6d44354010823241ef484f7214', '打开浏览器', 'C:/Program Files/Internet Explorer/iexplore.exe', '2015-05-09 02:43:02', 1, '打开浏览器操作');
INSERT INTO `weixin_command` VALUES ('576adcecce504bf3bb34c6b4da79a177', '关闭浏览器', 'taskkill /f /im iexplore.exe', '2015-05-09 02:36:48', 2, '关闭浏览器操作');
INSERT INTO `weixin_command` VALUES ('854a157c6d99499493f4cc303674c01f', '关闭QQ', 'taskkill /f /im qq.exe', '2015-05-10 21:25:46', 1, '关闭QQ');
INSERT INTO `weixin_command` VALUES ('ab3a8c6310ca4dc8b803ecc547e55ae7', '打开QQ', 'D:/SOFT/QQ/QQ/Bin/qq.exe', '2015-05-10 21:25:25', 1, '打开QQ');

-- ----------------------------
-- Table structure for weixin_imgmsg
-- ----------------------------
DROP TABLE IF EXISTS `weixin_imgmsg`;
CREATE TABLE `weixin_imgmsg`  (
  `IMGMSG_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `KEYWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键词',
  `CREATETIME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(11) NOT NULL COMMENT '状态',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `TITLE1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题1',
  `DESCRIPTION1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述1',
  `IMGURL1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址1',
  `TOURL1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '超链接1',
  `TITLE2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题2',
  `DESCRIPTION2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述2',
  `IMGURL2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址2',
  `TOURL2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '超链接2',
  `TITLE3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题3',
  `DESCRIPTION3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述3',
  `IMGURL3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址3',
  `TOURL3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '超链接3',
  `TITLE4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题4',
  `DESCRIPTION4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述4',
  `IMGURL4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址4',
  `TOURL4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '超链接4',
  `TITLE5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题5',
  `DESCRIPTION5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述5',
  `IMGURL5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址5',
  `TOURL5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '超链接5',
  `TITLE6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题6',
  `DESCRIPTION6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述6',
  `IMGURL6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址6',
  `TOURL6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '超链接6',
  `TITLE7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题7',
  `DESCRIPTION7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述7',
  `IMGURL7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址7',
  `TOURL7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '超链接7',
  `TITLE8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题8',
  `DESCRIPTION8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述8',
  `IMGURL8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址8',
  `TOURL8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '超链接8',
  PRIMARY KEY (`IMGMSG_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of weixin_imgmsg
-- ----------------------------
INSERT INTO `weixin_imgmsg` VALUES ('380b2cb1f4954315b0e20618f7b5bd8f', '首页', '2015-05-10 20:51:09', 1, '图文回复', '图文回复标题', '图文回复描述', 'http://a.hiphotos.baidu.com/image/h%3D360/sign=c6c7e73ebc389b5027ffe654b535e5f1/a686c9177f3e6709392bb8df3ec79f3df8dc55e3.jpg', 'www.baidu.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for weixin_key
-- ----------------------------
DROP TABLE IF EXISTS `weixin_key`;
CREATE TABLE `weixin_key`  (
  `KEY_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `USERNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `APPID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'appid',
  `APPSECRET` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'appsecret',
  `ACCESS_TOKEN` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'access_token',
  `CREATETIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `WXUSERNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公众号',
  PRIMARY KEY (`KEY_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of weixin_key
-- ----------------------------
INSERT INTO `weixin_key` VALUES ('58510f788aea4924b4a5438ecda5f749', 'itFteacher', '11111112222', '1111222333', '', '2017-03-29 02:31:03', 'itFteacher', 'itFteacher');

-- ----------------------------
-- Table structure for weixin_mymenu
-- ----------------------------
DROP TABLE IF EXISTS `weixin_mymenu`;
CREATE TABLE `weixin_mymenu`  (
  `MYMENU_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `WXUSERNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公众号',
  `USERNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `TITLE` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `TYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `CONTENT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指向',
  `XID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'XID',
  PRIMARY KEY (`MYMENU_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of weixin_mymenu
-- ----------------------------
INSERT INTO `weixin_mymenu` VALUES ('00ca43bbba2746429c8a6e0028a2f197', 'itFteacher', 'itFteacher', '', '', '', 'M33');
INSERT INTO `weixin_mymenu` VALUES ('02c67417e56f43a6be5356d5c5201ef7', 'itFteacher', 'itFteacher', '', '', '', 'M21');
INSERT INTO `weixin_mymenu` VALUES ('13e5b9a51f87430dabe2d8cc998d297c', 'itFteacher', 'itFteacher', '一级菜单', '', '', 'M1');
INSERT INTO `weixin_mymenu` VALUES ('14e68258190b45cba4d21e132508252d', 'itFteacher', 'itFteacher', '', '', '', 'M13');
INSERT INTO `weixin_mymenu` VALUES ('16230e4149134556ac5edf691d25be2a', 'itFteacher', 'itFteacher', '', '', '', 'M24');
INSERT INTO `weixin_mymenu` VALUES ('19353267c4ea43fb903b88f6401ea41a', 'itFteacher', 'itFteacher', '', '', '', 'M25');
INSERT INTO `weixin_mymenu` VALUES ('230f6447fee84bcd827de0ec73970660', 'itFteacher', 'itFteacher', '', '', '', 'M2');
INSERT INTO `weixin_mymenu` VALUES ('24315e33166647198dcbd31a44a1a866', 'itFteacher', 'itFteacher', '', '', '', 'M14');
INSERT INTO `weixin_mymenu` VALUES ('3daed1d236224a729860e77fe7295ea7', 'itFteacher', 'itFteacher', '', '', '', 'M32');
INSERT INTO `weixin_mymenu` VALUES ('3fbae4e173de4f36a6d721ca77b6480c', 'itFteacher', 'itFteacher', '', '', '', 'M34');
INSERT INTO `weixin_mymenu` VALUES ('4532044ae6cd4c7cb1c89e2cfdb0d812', 'itFteacher', 'itFteacher', '', '', '', 'M22');
INSERT INTO `weixin_mymenu` VALUES ('5fb159eb85a049ef9e0f7b56c2c8538e', 'itFteacher', 'itFteacher', '', '', '', 'M12');
INSERT INTO `weixin_mymenu` VALUES ('656c281ed7a142d6907baa6b36e93347', 'itFteacher', 'itFteacher', '', '', '', 'M23');
INSERT INTO `weixin_mymenu` VALUES ('679127c586784974a18e64a3660e0d11', 'itFteacher', 'itFteacher', '', '', '', 'M35');
INSERT INTO `weixin_mymenu` VALUES ('999a8965d4484facaaeb2768471207c5', 'itFteacher', 'itFteacher', '', '', '', 'M3');
INSERT INTO `weixin_mymenu` VALUES ('aa09cedf69e04eda9bb3a0f3b77db46c', 'itFteacher', 'itFteacher', '', '', '', 'M15');
INSERT INTO `weixin_mymenu` VALUES ('c193c0f155034d68a79c662b4046699f', 'itFteacher', 'itFteacher', '', '', '', 'M11');
INSERT INTO `weixin_mymenu` VALUES ('e940253208d84c81ae8fbec4f5f299a9', 'itFteacher', 'itFteacher', '', '', '', 'M31');

-- ----------------------------
-- Table structure for weixin_textmsg
-- ----------------------------
DROP TABLE IF EXISTS `weixin_textmsg`;
CREATE TABLE `weixin_textmsg`  (
  `TEXTMSG_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `KEYWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键词',
  `CONTENT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `CREATETIME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(2) NULL DEFAULT NULL COMMENT '状态',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TEXTMSG_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of weixin_textmsg
-- ----------------------------
INSERT INTO `weixin_textmsg` VALUES ('695cd74779734231928a253107ab0eeb', '吃饭', '吃了噢噢噢噢', '2015-05-10 22:52:27', 1, '文本回复');
INSERT INTO `weixin_textmsg` VALUES ('d4738af7aea74a6ca1a5fb25a98f9acb', '关注', '这里是关注后回复的内容', '2015-05-11 02:12:36', 1, '关注回复');

SET FOREIGN_KEY_CHECKS = 1;
