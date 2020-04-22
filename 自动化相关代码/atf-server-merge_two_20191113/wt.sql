/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : wt

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 15/11/2019 18:39:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES (1, 'Can add permission', 1, 'add_permission');
INSERT INTO `auth_permission` VALUES (2, 'Can change permission', 1, 'change_permission');
INSERT INTO `auth_permission` VALUES (3, 'Can delete permission', 1, 'delete_permission');
INSERT INTO `auth_permission` VALUES (4, 'Can view permission', 1, 'view_permission');
INSERT INTO `auth_permission` VALUES (5, 'Can add group', 2, 'add_group');
INSERT INTO `auth_permission` VALUES (6, 'Can change group', 2, 'change_group');
INSERT INTO `auth_permission` VALUES (7, 'Can delete group', 2, 'delete_group');
INSERT INTO `auth_permission` VALUES (8, 'Can view group', 2, 'view_group');
INSERT INTO `auth_permission` VALUES (9, 'Can add content type', 3, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (10, 'Can change content type', 3, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (11, 'Can delete content type', 3, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (12, 'Can view content type', 3, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (13, 'Can add session', 4, 'add_session');
INSERT INTO `auth_permission` VALUES (14, 'Can change session', 4, 'change_session');
INSERT INTO `auth_permission` VALUES (15, 'Can delete session', 4, 'delete_session');
INSERT INTO `auth_permission` VALUES (16, 'Can view session', 4, 'view_session');
INSERT INTO `auth_permission` VALUES (17, 'Can add 菜单', 5, 'add_menu');
INSERT INTO `auth_permission` VALUES (18, 'Can change 菜单', 5, 'change_menu');
INSERT INTO `auth_permission` VALUES (19, 'Can delete 菜单', 5, 'delete_menu');
INSERT INTO `auth_permission` VALUES (20, 'Can view 菜单', 5, 'view_menu');
INSERT INTO `auth_permission` VALUES (21, 'Can add 权限', 6, 'add_permission');
INSERT INTO `auth_permission` VALUES (22, 'Can change 权限', 6, 'change_permission');
INSERT INTO `auth_permission` VALUES (23, 'Can delete 权限', 6, 'delete_permission');
INSERT INTO `auth_permission` VALUES (24, 'Can view 权限', 6, 'view_permission');
INSERT INTO `auth_permission` VALUES (25, 'Can add role', 7, 'add_role');
INSERT INTO `auth_permission` VALUES (26, 'Can change role', 7, 'change_role');
INSERT INTO `auth_permission` VALUES (27, 'Can delete role', 7, 'delete_role');
INSERT INTO `auth_permission` VALUES (28, 'Can view role', 7, 'view_role');
INSERT INTO `auth_permission` VALUES (29, 'Can add 组织架构', 8, 'add_organization');
INSERT INTO `auth_permission` VALUES (30, 'Can change 组织架构', 8, 'change_organization');
INSERT INTO `auth_permission` VALUES (31, 'Can delete 组织架构', 8, 'delete_organization');
INSERT INTO `auth_permission` VALUES (32, 'Can view 组织架构', 8, 'view_organization');
INSERT INTO `auth_permission` VALUES (33, 'Can add 用户信息', 9, 'add_userprofile');
INSERT INTO `auth_permission` VALUES (34, 'Can change 用户信息', 9, 'change_userprofile');
INSERT INTO `auth_permission` VALUES (35, 'Can delete 用户信息', 9, 'delete_userprofile');
INSERT INTO `auth_permission` VALUES (36, 'Can view 用户信息', 9, 'view_userprofile');
INSERT INTO `auth_permission` VALUES (37, 'Can add 业务', 10, 'add_business');
INSERT INTO `auth_permission` VALUES (38, 'Can change 业务', 10, 'change_business');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 业务', 10, 'delete_business');
INSERT INTO `auth_permission` VALUES (40, 'Can view 业务', 10, 'view_business');
INSERT INTO `auth_permission` VALUES (41, 'Can add 设备组', 11, 'add_devicegroup');
INSERT INTO `auth_permission` VALUES (42, 'Can change 设备组', 11, 'change_devicegroup');
INSERT INTO `auth_permission` VALUES (43, 'Can delete 设备组', 11, 'delete_devicegroup');
INSERT INTO `auth_permission` VALUES (44, 'Can view 设备组', 11, 'view_devicegroup');
INSERT INTO `auth_permission` VALUES (45, 'Can add 扫描信息', 12, 'add_devicescaninfo');
INSERT INTO `auth_permission` VALUES (46, 'Can change 扫描信息', 12, 'change_devicescaninfo');
INSERT INTO `auth_permission` VALUES (47, 'Can delete 扫描信息', 12, 'delete_devicescaninfo');
INSERT INTO `auth_permission` VALUES (48, 'Can view 扫描信息', 12, 'view_devicescaninfo');
INSERT INTO `auth_permission` VALUES (49, 'Can add 标签', 13, 'add_label');
INSERT INTO `auth_permission` VALUES (50, 'Can change 标签', 13, 'change_label');
INSERT INTO `auth_permission` VALUES (51, 'Can delete 标签', 13, 'delete_label');
INSERT INTO `auth_permission` VALUES (52, 'Can view 标签', 13, 'view_label');
INSERT INTO `auth_permission` VALUES (53, 'Can add historical 设备信息', 14, 'add_historicaldeviceinfo');
INSERT INTO `auth_permission` VALUES (54, 'Can change historical 设备信息', 14, 'change_historicaldeviceinfo');
INSERT INTO `auth_permission` VALUES (55, 'Can delete historical 设备信息', 14, 'delete_historicaldeviceinfo');
INSERT INTO `auth_permission` VALUES (56, 'Can view historical 设备信息', 14, 'view_historicaldeviceinfo');
INSERT INTO `auth_permission` VALUES (57, 'Can add 字典', 15, 'add_dict');
INSERT INTO `auth_permission` VALUES (58, 'Can change 字典', 15, 'change_dict');
INSERT INTO `auth_permission` VALUES (59, 'Can delete 字典', 15, 'delete_dict');
INSERT INTO `auth_permission` VALUES (60, 'Can view 字典', 15, 'view_dict');
INSERT INTO `auth_permission` VALUES (61, 'Can add 设备信息', 16, 'add_deviceinfo');
INSERT INTO `auth_permission` VALUES (62, 'Can change 设备信息', 16, 'change_deviceinfo');
INSERT INTO `auth_permission` VALUES (63, 'Can delete 设备信息', 16, 'delete_deviceinfo');
INSERT INTO `auth_permission` VALUES (64, 'Can view 设备信息', 16, 'view_deviceinfo');
INSERT INTO `auth_permission` VALUES (65, 'Can add device file', 17, 'add_devicefile');
INSERT INTO `auth_permission` VALUES (66, 'Can change device file', 17, 'change_devicefile');
INSERT INTO `auth_permission` VALUES (67, 'Can delete device file', 17, 'delete_devicefile');
INSERT INTO `auth_permission` VALUES (68, 'Can view device file', 17, 'view_devicefile');
INSERT INTO `auth_permission` VALUES (69, 'Can add 连接信息', 18, 'add_connectioninfo');
INSERT INTO `auth_permission` VALUES (70, 'Can change 连接信息', 18, 'change_connectioninfo');
INSERT INTO `auth_permission` VALUES (71, 'Can delete 连接信息', 18, 'delete_connectioninfo');
INSERT INTO `auth_permission` VALUES (72, 'Can view 连接信息', 18, 'view_connectioninfo');
INSERT INTO `auth_permission` VALUES (73, 'Can add 部署记录', 19, 'add_deployrecord');
INSERT INTO `auth_permission` VALUES (74, 'Can change 部署记录', 19, 'change_deployrecord');
INSERT INTO `auth_permission` VALUES (75, 'Can delete 部署记录', 19, 'delete_deployrecord');
INSERT INTO `auth_permission` VALUES (76, 'Can view 部署记录', 19, 'view_deployrecord');
INSERT INTO `auth_permission` VALUES (77, 'Can add 项目配置', 20, 'add_project');
INSERT INTO `auth_permission` VALUES (78, 'Can change 项目配置', 20, 'change_project');
INSERT INTO `auth_permission` VALUES (79, 'Can delete 项目配置', 20, 'delete_project');
INSERT INTO `auth_permission` VALUES (80, 'Can view 项目配置', 20, 'view_project');
INSERT INTO `auth_permission` VALUES (81, 'Can add 页面元素', 21, 'add_pageelement');
INSERT INTO `auth_permission` VALUES (82, 'Can change 页面元素', 21, 'change_pageelement');
INSERT INTO `auth_permission` VALUES (83, 'Can delete 页面元素', 21, 'delete_pageelement');
INSERT INTO `auth_permission` VALUES (84, 'Can view 页面元素', 21, 'view_pageelement');
INSERT INTO `auth_permission` VALUES (85, 'Can add 测试用例', 22, 'add_testcase');
INSERT INTO `auth_permission` VALUES (86, 'Can change 测试用例', 22, 'change_testcase');
INSERT INTO `auth_permission` VALUES (87, 'Can delete 测试用例', 22, 'delete_testcase');
INSERT INTO `auth_permission` VALUES (88, 'Can view 测试用例', 22, 'view_testcase');
INSERT INTO `auth_permission` VALUES (89, 'Can add 测试步骤', 23, 'add_uistep');
INSERT INTO `auth_permission` VALUES (90, 'Can change 测试步骤', 23, 'change_uistep');
INSERT INTO `auth_permission` VALUES (91, 'Can delete 测试步骤', 23, 'delete_uistep');
INSERT INTO `auth_permission` VALUES (92, 'Can view 测试步骤', 23, 'view_uistep');
INSERT INTO `auth_permission` VALUES (93, 'Can add 测试检查点', 24, 'add_uicheck');
INSERT INTO `auth_permission` VALUES (94, 'Can change 测试检查点', 24, 'change_uicheck');
INSERT INTO `auth_permission` VALUES (95, 'Can delete 测试检查点', 24, 'delete_uicheck');
INSERT INTO `auth_permission` VALUES (96, 'Can view 测试检查点', 24, 'view_uicheck');
COMMIT;

-- ----------------------------
-- Table structure for cmdb_business
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_business`;
CREATE TABLE `cmdb_business` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `modify_time` datetime(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cmdb_connectioninfo
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_connectioninfo`;
CREATE TABLE `cmdb_connectioninfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `modify_time` datetime(6) NOT NULL,
  `hostname` varchar(80) NOT NULL,
  `auth_type` varchar(30) NOT NULL,
  `port` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(80) NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `desc` varchar(150) DEFAULT NULL,
  `uid_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cmdb_connectioninfo_uid_id_38b84113_fk_rbac_userprofile_id` (`uid_id`),
  CONSTRAINT `cmdb_connectioninfo_uid_id_38b84113_fk_rbac_userprofile_id` FOREIGN KEY (`uid_id`) REFERENCES `rbac_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cmdb_devicefile
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_devicefile`;
CREATE TABLE `cmdb_devicefile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `modify_time` datetime(6) NOT NULL,
  `file_content` varchar(100) DEFAULT NULL,
  `upload_user` varchar(20) NOT NULL,
  `device_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cmdb_devicefile_device_id_1222de4d_fk_cmdb_deviceinfo_id` (`device_id`),
  CONSTRAINT `cmdb_devicefile_device_id_1222de4d_fk_cmdb_deviceinfo_id` FOREIGN KEY (`device_id`) REFERENCES `cmdb_deviceinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cmdb_devicegroup
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_devicegroup`;
CREATE TABLE `cmdb_devicegroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `modify_time` datetime(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cmdb_deviceinfo
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_deviceinfo`;
CREATE TABLE `cmdb_deviceinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `modify_time` datetime(6) NOT NULL,
  `status` varchar(10) NOT NULL,
  `sys_hostname` varchar(100) NOT NULL,
  `mac_address` varchar(150) NOT NULL,
  `sn_number` varchar(150) NOT NULL,
  `os_type` varchar(50) NOT NULL,
  `os_version` varchar(100) NOT NULL,
  `device_type` varchar(50) NOT NULL,
  `device_model` varchar(150) NOT NULL,
  `auth_type` varchar(30) NOT NULL,
  `hostname` varchar(50) NOT NULL,
  `network_type` int(11) DEFAULT NULL,
  `leader` varchar(50) DEFAULT NULL,
  `buy_date` date NOT NULL,
  `warranty_date` date NOT NULL,
  `desc` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `pid_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cmdb_deviceinfo_changed_by_id_1a864b67_fk_rbac_userprofile_id` (`changed_by_id`),
  KEY `cmdb_deviceinfo_pid_id_617c7690_fk_cmdb_deviceinfo_id` (`pid_id`),
  CONSTRAINT `cmdb_deviceinfo_changed_by_id_1a864b67_fk_rbac_userprofile_id` FOREIGN KEY (`changed_by_id`) REFERENCES `rbac_userprofile` (`id`),
  CONSTRAINT `cmdb_deviceinfo_pid_id_617c7690_fk_cmdb_deviceinfo_id` FOREIGN KEY (`pid_id`) REFERENCES `cmdb_deviceinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cmdb_deviceinfo_businesses
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_deviceinfo_businesses`;
CREATE TABLE `cmdb_deviceinfo_businesses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deviceinfo_id` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cmdb_deviceinfo_business_deviceinfo_id_business_i_ba3f302c_uniq` (`deviceinfo_id`,`business_id`),
  KEY `cmdb_deviceinfo_busi_business_id_18409b77_fk_cmdb_busi` (`business_id`),
  CONSTRAINT `cmdb_deviceinfo_busi_business_id_18409b77_fk_cmdb_busi` FOREIGN KEY (`business_id`) REFERENCES `cmdb_business` (`id`),
  CONSTRAINT `cmdb_deviceinfo_busi_deviceinfo_id_2b68f4f0_fk_cmdb_devi` FOREIGN KEY (`deviceinfo_id`) REFERENCES `cmdb_deviceinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cmdb_deviceinfo_groups
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_deviceinfo_groups`;
CREATE TABLE `cmdb_deviceinfo_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deviceinfo_id` int(11) NOT NULL,
  `devicegroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cmdb_deviceinfo_groups_deviceinfo_id_devicegrou_009ddef3_uniq` (`deviceinfo_id`,`devicegroup_id`),
  KEY `cmdb_deviceinfo_grou_devicegroup_id_420c38c7_fk_cmdb_devi` (`devicegroup_id`),
  CONSTRAINT `cmdb_deviceinfo_grou_devicegroup_id_420c38c7_fk_cmdb_devi` FOREIGN KEY (`devicegroup_id`) REFERENCES `cmdb_devicegroup` (`id`),
  CONSTRAINT `cmdb_deviceinfo_grou_deviceinfo_id_f9b1a246_fk_cmdb_devi` FOREIGN KEY (`deviceinfo_id`) REFERENCES `cmdb_deviceinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cmdb_deviceinfo_labels
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_deviceinfo_labels`;
CREATE TABLE `cmdb_deviceinfo_labels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deviceinfo_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cmdb_deviceinfo_labels_deviceinfo_id_label_id_a8abd796_uniq` (`deviceinfo_id`,`label_id`),
  KEY `cmdb_deviceinfo_labels_label_id_3477b101_fk_cmdb_label_id` (`label_id`),
  CONSTRAINT `cmdb_deviceinfo_labe_deviceinfo_id_8b7d99d3_fk_cmdb_devi` FOREIGN KEY (`deviceinfo_id`) REFERENCES `cmdb_deviceinfo` (`id`),
  CONSTRAINT `cmdb_deviceinfo_labels_label_id_3477b101_fk_cmdb_label_id` FOREIGN KEY (`label_id`) REFERENCES `cmdb_label` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cmdb_devicescaninfo
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_devicescaninfo`;
CREATE TABLE `cmdb_devicescaninfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `modify_time` datetime(6) NOT NULL,
  `status` varchar(10) NOT NULL,
  `sys_hostname` varchar(100) NOT NULL,
  `mac_address` varchar(150) NOT NULL,
  `sn_number` varchar(150) NOT NULL,
  `os_type` varchar(50) NOT NULL,
  `os_version` varchar(100) NOT NULL,
  `device_type` varchar(50) NOT NULL,
  `device_model` varchar(150) NOT NULL,
  `hostname` varchar(80) NOT NULL,
  `auth_type` varchar(30) NOT NULL,
  `port` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(80) NOT NULL,
  `error_message` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cmdb_dict
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_dict`;
CREATE TABLE `cmdb_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(80) NOT NULL,
  `value` varchar(80) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `pid_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cmdb_dict_pid_id_05bfc652_fk_cmdb_dict_id` (`pid_id`),
  CONSTRAINT `cmdb_dict_pid_id_05bfc652_fk_cmdb_dict_id` FOREIGN KEY (`pid_id`) REFERENCES `cmdb_dict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmdb_dict
-- ----------------------------
BEGIN;
INSERT INTO `cmdb_dict` VALUES (1, 'DEVICE_TYPE', '设备类型', '', NULL);
INSERT INTO `cmdb_dict` VALUES (2, 'VM', '虚拟机', '', 1);
INSERT INTO `cmdb_dict` VALUES (3, 'PHY', '物理机', '', 1);
INSERT INTO `cmdb_dict` VALUES (4, 'SERVICE_TYPE', '服务类型', '', NULL);
INSERT INTO `cmdb_dict` VALUES (5, 'password', 'SSH服务|PWD', '', 4);
INSERT INTO `cmdb_dict` VALUES (6, 'private_key', 'SSH服务|KEY', '', 4);
INSERT INTO `cmdb_dict` VALUES (7, 'mysql', 'MYSQL服务', '', 4);
INSERT INTO `cmdb_dict` VALUES (8, 'PROJECT_TYPE', '项目类型', '', NULL);
INSERT INTO `cmdb_dict` VALUES (9, 'all', '所有项目', '', 8);
INSERT INTO `cmdb_dict` VALUES (10, 'ui', 'UI自动化', '', 8);
INSERT INTO `cmdb_dict` VALUES (11, 'api', 'API自动化', '', 8);
INSERT INTO `cmdb_dict` VALUES (12, 'jmeter', 'JMETER测试', '', 8);
INSERT INTO `cmdb_dict` VALUES (13, 'REPO_TYPE', '项目子类型', '', NULL);
INSERT INTO `cmdb_dict` VALUES (14, 'wx_h5', '微信H5', '', 13);
INSERT INTO `cmdb_dict` VALUES (15, 'app', 'APP', '', 13);
INSERT INTO `cmdb_dict` VALUES (16, 'web', 'WEB应用', '', 4);
INSERT INTO `cmdb_dict` VALUES (17, 'other', '其他服务', '', 4);
COMMIT;

-- ----------------------------
-- Table structure for cmdb_historicaldeviceinfo
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_historicaldeviceinfo`;
CREATE TABLE `cmdb_historicaldeviceinfo` (
  `id` int(11) NOT NULL,
  `status` varchar(10) NOT NULL,
  `sys_hostname` varchar(100) NOT NULL,
  `mac_address` varchar(150) NOT NULL,
  `sn_number` varchar(150) NOT NULL,
  `os_type` varchar(50) NOT NULL,
  `os_version` varchar(100) NOT NULL,
  `device_type` varchar(50) NOT NULL,
  `device_model` varchar(150) NOT NULL,
  `auth_type` varchar(30) NOT NULL,
  `hostname` varchar(50) NOT NULL,
  `network_type` int(11) DEFAULT NULL,
  `leader` varchar(50) DEFAULT NULL,
  `buy_date` date NOT NULL,
  `warranty_date` date NOT NULL,
  `desc` longtext NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `cmdb_historicaldevic_history_user_id_fc7deca8_fk_rbac_user` (`history_user_id`),
  KEY `cmdb_historicaldeviceinfo_id_3be8b451` (`id`),
  KEY `cmdb_historicaldeviceinfo_changed_by_id_34b3603c` (`changed_by_id`),
  CONSTRAINT `cmdb_historicaldevic_history_user_id_fc7deca8_fk_rbac_user` FOREIGN KEY (`history_user_id`) REFERENCES `rbac_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cmdb_label
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_label`;
CREATE TABLE `cmdb_label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `modify_time` datetime(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for deployment_deployrecord
-- ----------------------------
DROP TABLE IF EXISTS `deployment_deployrecord`;
CREATE TABLE `deployment_deployrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `modify_time` datetime(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `record_id` varchar(100) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `server_ids` varchar(10) DEFAULT NULL,
  `target_root` varchar(200) NOT NULL,
  `target_releases` varchar(200) NOT NULL,
  `prev_record` varchar(100) NOT NULL,
  `is_rollback` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES (2, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (1, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (10, 'cmdb', 'business');
INSERT INTO `django_content_type` VALUES (18, 'cmdb', 'connectioninfo');
INSERT INTO `django_content_type` VALUES (17, 'cmdb', 'devicefile');
INSERT INTO `django_content_type` VALUES (11, 'cmdb', 'devicegroup');
INSERT INTO `django_content_type` VALUES (16, 'cmdb', 'deviceinfo');
INSERT INTO `django_content_type` VALUES (12, 'cmdb', 'devicescaninfo');
INSERT INTO `django_content_type` VALUES (15, 'cmdb', 'dict');
INSERT INTO `django_content_type` VALUES (14, 'cmdb', 'historicaldeviceinfo');
INSERT INTO `django_content_type` VALUES (13, 'cmdb', 'label');
INSERT INTO `django_content_type` VALUES (3, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (19, 'deployment', 'deployrecord');
INSERT INTO `django_content_type` VALUES (20, 'deployment', 'project');
INSERT INTO `django_content_type` VALUES (5, 'rbac', 'menu');
INSERT INTO `django_content_type` VALUES (8, 'rbac', 'organization');
INSERT INTO `django_content_type` VALUES (6, 'rbac', 'permission');
INSERT INTO `django_content_type` VALUES (7, 'rbac', 'role');
INSERT INTO `django_content_type` VALUES (9, 'rbac', 'userprofile');
INSERT INTO `django_content_type` VALUES (4, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (21, 'testcenter', 'pageelement');
INSERT INTO `django_content_type` VALUES (22, 'testcenter', 'testcase');
INSERT INTO `django_content_type` VALUES (24, 'testcenter', 'uicheck');
INSERT INTO `django_content_type` VALUES (23, 'testcenter', 'uistep');
COMMIT;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2019-08-27 23:34:42.272954');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2019-08-27 23:34:42.694103');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2019-08-27 23:34:43.234099');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2019-08-27 23:34:44.019118');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2019-08-27 23:34:44.134458');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2019-08-27 23:34:44.197772');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2019-08-27 23:34:44.259819');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2019-08-27 23:34:44.378745');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2019-08-27 23:34:44.441897');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2019-08-27 23:34:44.556161');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2019-08-27 23:34:44.626885');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2019-08-27 23:34:44.880517');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2019-08-27 23:34:45.057101');
INSERT INTO `django_migrations` VALUES (14, 'rbac', '0001_initial', '2019-08-27 23:34:47.612076');
INSERT INTO `django_migrations` VALUES (15, 'cmdb', '0001_initial', '2019-08-27 23:34:54.579266');
INSERT INTO `django_migrations` VALUES (16, 'deployment', '0001_initial', '2019-08-27 23:34:57.575213');
INSERT INTO `django_migrations` VALUES (17, 'sessions', '0001_initial', '2019-08-27 23:34:57.811928');
INSERT INTO `django_migrations` VALUES (18, 'deployment', '0002_auto_20190828_2233', '2019-08-28 22:33:21.737946');
INSERT INTO `django_migrations` VALUES (19, 'testcenter', '0001_initial', '2019-08-28 22:33:22.216809');
INSERT INTO `django_migrations` VALUES (20, 'testcenter', '0002_auto_20190829_1204', '2019-08-29 12:04:37.923857');
INSERT INTO `django_migrations` VALUES (21, 'deployment', '0003_auto_20190830_1617', '2019-08-30 16:28:45.989328');
INSERT INTO `django_migrations` VALUES (22, 'testcenter', '0003_auto_20190830_1617', '2019-08-30 16:28:46.502912');
INSERT INTO `django_migrations` VALUES (23, 'testcenter', '0004_remove_pageelement_owner', '2019-08-31 22:53:23.739127');
INSERT INTO `django_migrations` VALUES (24, 'testcenter', '0005_auto_20190901_1454', '2019-09-01 14:54:05.381311');
INSERT INTO `django_migrations` VALUES (25, 'testcenter', '0002_auto_20190902_1436', '2019-09-02 14:36:27.442020');
INSERT INTO `django_migrations` VALUES (26, 'testcenter', '0003_auto_20190918_1708', '2019-09-18 17:08:58.506989');
COMMIT;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for project_project
-- ----------------------------
DROP TABLE IF EXISTS `project_project`;
CREATE TABLE `project_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `modify_time` datetime(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `project_type` varchar(30) NOT NULL,
  `repo_mode` varchar(30) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `apk_path` varchar(100) DEFAULT NULL,
  `ui_capabilities` varchar(1000) DEFAULT NULL,
  `user_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deployment_project_owner_id_b5a55633` (`owner_id`),
  CONSTRAINT `deployment_project_owner_id_b5a55633_fk_rbac_userprofile_id` FOREIGN KEY (`owner_id`) REFERENCES `rbac_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_project
-- ----------------------------
BEGIN;
INSERT INTO `project_project` VALUES (9, '2019-08-29 10:53:49.529771', '2019-09-03 10:01:22.039088', 'miduopay9', '12310', 'ui', 'wx_h5', 1, '/Users/charles/developer/PycharmProjects/AppiumAutoUi/app/weixin.apk', 'capabilities = {\n    \"platformName\": \"Android\",\n    \"platformVersion\": \"7.1.1\",\n    \"deviceName\": \"8TE645R8459HBEUW\",\n    \"appPackage\": \"com.tencent.mm\",\n    \"appActivity\": \"com.tencent.mm.ui.LauncherUI\",\n    \"noReset\": \"true\",\n    \"fullReset\": \"false\",\n    \"fastReset\": \"false\",\n    \"chromeOptions\": {\'androidProcess\': \'com.tencent.mm:tools\'}\n}', '1,3,5,7,9');
INSERT INTO `project_project` VALUES (10, '2019-08-29 10:53:49.529771', '2019-09-03 10:01:22.039088', 'miduopay10', '12310', 'ui', 'wx_h5', 1, '/Users/charles/developer/PycharmProjects/AppiumAutoUi/app/weixin.apk', 'capabilities = {\n    \"platformName\": \"Android\",\n    \"platformVersion\": \"7.1.1\",\n    \"deviceName\": \"8TE645R8459HBEUW\",\n    \"appPackage\": \"com.tencent.mm\",\n    \"appActivity\": \"com.tencent.mm.ui.LauncherUI\",\n    \"noReset\": \"true\",\n    \"fullReset\": \"false\",\n    \"fastReset\": \"false\",\n    \"chromeOptions\": {\'androidProcess\': \'com.tencent.mm:tools\'}\n}', '1,3,5,7,9');
INSERT INTO `project_project` VALUES (11, '2019-08-29 10:53:49.529771', '2019-09-03 10:01:22.039088', 'miduopay', '12310', 'ui', 'wx_h5', 1, '/Users/charles/developer/PycharmProjects/AppiumAutoUi/app/weixin.apk', 'capabilities = {\n    \"platformName\": \"Android\",\n    \"platformVersion\": \"7.1.1\",\n    \"deviceName\": \"8TE645R8459HBEUW\",\n    \"appPackage\": \"com.tencent.mm\",\n    \"appActivity\": \"com.tencent.mm.ui.LauncherUI\",\n    \"noReset\": \"true\",\n    \"fullReset\": \"false\",\n    \"fastReset\": \"false\",\n    \"chromeOptions\": {\'androidProcess\': \'com.tencent.mm:tools\'}\n}', '1,3,5,7,9');
INSERT INTO `project_project` VALUES (12, '2019-08-29 18:02:54.580334', '2019-09-03 10:01:47.057734', 'miduopay1', '12310', 'ui', 'wx_h5', 1, '/Users/charles/developer/PycharmProjects/AppiumAutoUi/app/weixin.apk', 'capabilities = {\n    \"platformName\": \"Android\",\n    \"platformVersion\": \"7.1.1\",\n    \"deviceName\": \"8TE645R8459HBEUW\",\n    \"appPackage\": \"com.tencent.mm\",\n    \"appActivity\": \"com.tencent.mm.ui.LauncherUI\",\n    \"noReset\": \"true\",\n    \"fullReset\": \"false\",\n    \"fastReset\": \"false\",\n    \"chromeOptions\": {\'androidProcess\': \'com.tencent.mm:tools\'}\n}', '1,3,5,7,9');
INSERT INTO `project_project` VALUES (13, '2019-08-30 14:53:12.254081', '2019-09-03 10:02:01.755222', 'miduopay2', '12310', 'ui', 'wx_h5', 1, '/Users/charles/developer/PycharmProjects/AppiumAutoUi/app/weixin.apk', 'capabilities = {\n    \"platformName\": \"Android\",\n    \"platformVersion\": \"7.1.1\",\n    \"deviceName\": \"8TE645R8459HBEUW\",\n    \"appPackage\": \"com.tencent.mm\",\n    \"appActivity\": \"com.tencent.mm.ui.LauncherUI\",\n    \"noReset\": \"true\",\n    \"fullReset\": \"false\",\n    \"fastReset\": \"false\",\n    \"chromeOptions\": {\'androidProcess\': \'com.tencent.mm:tools\'}\n}', '1,3,5,7,9');
INSERT INTO `project_project` VALUES (15, '2019-09-18 15:08:50.687215', '2019-09-18 15:09:05.454343', 'miduopay8', '12310', 'ui', 'wx_h5', 1, '/Users/charles/developer/PycharmProjects/AppiumAutoUi/app/weixin.apk', 'capabilities = {\n    \"platformName\": \"Android\",\n    \"platformVersion\": \"7.1.1\",\n    \"deviceName\": \"8TE645R8459HBEUW\",\n    \"appPackage\": \"com.tencent.mm\",\n    \"appActivity\": \"com.tencent.mm.ui.LauncherUI\",\n    \"noReset\": \"true\",\n    \"fullReset\": \"false\",\n    \"fastReset\": \"false\",\n    \"chromeOptions\": {\'androidProcess\': \'com.tencent.mm:tools\'}\n}', '1,3,5,7,9');
INSERT INTO `project_project` VALUES (16, '2019-08-30 14:53:12.254081', '2019-09-03 10:02:01.755222', 'miduopay2', '12310', 'ui', 'wx_h5', 1, '/Users/charles/developer/PycharmProjects/AppiumAutoUi/app/weixin.apk', 'capabilities = {\n    \"platformName\": \"Android\",\n    \"platformVersion\": \"7.1.1\",\n    \"deviceName\": \"8TE645R8459HBEUW\",\n    \"appPackage\": \"com.tencent.mm\",\n    \"appActivity\": \"com.tencent.mm.ui.LauncherUI\",\n    \"noReset\": \"true\",\n    \"fullReset\": \"false\",\n    \"fastReset\": \"false\",\n    \"chromeOptions\": {\'androidProcess\': \'com.tencent.mm:tools\'}\n}', '1,3,5,7,9');
INSERT INTO `project_project` VALUES (17, '2019-08-30 14:53:12.254081', '2019-09-03 10:02:01.755222', 'miduopay2', '12310', 'ui', 'wx_h5', 1, '/Users/charles/developer/PycharmProjects/AppiumAutoUi/app/weixin.apk', 'capabilities = {\n    \"platformName\": \"Android\",\n    \"platformVersion\": \"7.1.1\",\n    \"deviceName\": \"8TE645R8459HBEUW\",\n    \"appPackage\": \"com.tencent.mm\",\n    \"appActivity\": \"com.tencent.mm.ui.LauncherUI\",\n    \"noReset\": \"true\",\n    \"fullReset\": \"false\",\n    \"fastReset\": \"false\",\n    \"chromeOptions\": {\'androidProcess\': \'com.tencent.mm:tools\'}\n}', '1,3,5,7,9');
INSERT INTO `project_project` VALUES (18, '2019-08-30 14:53:12.254081', '2019-09-03 10:02:01.755222', 'miduopay2', '12310', 'ui', 'wx_h5', 1, '/Users/charles/developer/PycharmProjects/AppiumAutoUi/app/weixin.apk', 'capabilities = {\n    \"platformName\": \"Android\",\n    \"platformVersion\": \"7.1.1\",\n    \"deviceName\": \"8TE645R8459HBEUW\",\n    \"appPackage\": \"com.tencent.mm\",\n    \"appActivity\": \"com.tencent.mm.ui.LauncherUI\",\n    \"noReset\": \"true\",\n    \"fullReset\": \"false\",\n    \"fastReset\": \"false\",\n    \"chromeOptions\": {\'androidProcess\': \'com.tencent.mm:tools\'}\n}', '1,3,5,7,9');
INSERT INTO `project_project` VALUES (19, '2019-08-30 14:53:12.254081', '2019-09-03 10:02:01.755222', 'miduopay2', '12310', 'ui', 'wx_h5', 1, '/Users/charles/developer/PycharmProjects/AppiumAutoUi/app/weixin.apk', 'capabilities = {\n    \"platformName\": \"Android\",\n    \"platformVersion\": \"7.1.1\",\n    \"deviceName\": \"8TE645R8459HBEUW\",\n    \"appPackage\": \"com.tencent.mm\",\n    \"appActivity\": \"com.tencent.mm.ui.LauncherUI\",\n    \"noReset\": \"true\",\n    \"fullReset\": \"false\",\n    \"fastReset\": \"false\",\n    \"chromeOptions\": {\'androidProcess\': \'com.tencent.mm:tools\'}\n}', '1,3,5,7,9');
INSERT INTO `project_project` VALUES (20, '2019-08-30 14:53:12.254081', '2019-09-03 10:02:01.755222', 'miduopay2', '12310', 'ui', 'wx_h5', 1, '/Users/charles/developer/PycharmProjects/AppiumAutoUi/app/weixin.apk', 'capabilities = {\n    \"platformName\": \"Android\",\n    \"platformVersion\": \"7.1.1\",\n    \"deviceName\": \"8TE645R8459HBEUW\",\n    \"appPackage\": \"com.tencent.mm\",\n    \"appActivity\": \"com.tencent.mm.ui.LauncherUI\",\n    \"noReset\": \"true\",\n    \"fullReset\": \"false\",\n    \"fastReset\": \"false\",\n    \"chromeOptions\": {\'androidProcess\': \'com.tencent.mm:tools\'}\n}', '1,3,5,7,9');
INSERT INTO `project_project` VALUES (21, '2019-08-30 14:53:12.254081', '2019-09-03 10:02:01.755222', 'miduopay2', '12310', 'ui', 'wx_h5', 1, '/Users/charles/developer/PycharmProjects/AppiumAutoUi/app/weixin.apk', 'capabilities = {\n    \"platformName\": \"Android\",\n    \"platformVersion\": \"7.1.1\",\n    \"deviceName\": \"8TE645R8459HBEUW\",\n    \"appPackage\": \"com.tencent.mm\",\n    \"appActivity\": \"com.tencent.mm.ui.LauncherUI\",\n    \"noReset\": \"true\",\n    \"fullReset\": \"false\",\n    \"fastReset\": \"false\",\n    \"chromeOptions\": {\'androidProcess\': \'com.tencent.mm:tools\'}\n}', '1,3,5,7,9');
INSERT INTO `project_project` VALUES (22, '2019-08-30 14:53:12.254081', '2019-09-03 10:02:01.755222', 'miduopay2', '12310', 'ui', 'wx_h5', 1, '/Users/charles/developer/PycharmProjects/AppiumAutoUi/app/weixin.apk', 'capabilities = {\n    \"platformName\": \"Android\",\n    \"platformVersion\": \"7.1.1\",\n    \"deviceName\": \"8TE645R8459HBEUW\",\n    \"appPackage\": \"com.tencent.mm\",\n    \"appActivity\": \"com.tencent.mm.ui.LauncherUI\",\n    \"noReset\": \"true\",\n    \"fullReset\": \"false\",\n    \"fastReset\": \"false\",\n    \"chromeOptions\": {\'androidProcess\': \'com.tencent.mm:tools\'}\n}', '1,3,5,7,9');
INSERT INTO `project_project` VALUES (23, '2019-08-30 14:53:12.254081', '2019-09-03 10:02:01.755222', 'miduopay2', '12310', 'ui', 'wx_h5', 1, '/Users/charles/developer/PycharmProjects/AppiumAutoUi/app/weixin.apk', 'capabilities = {\n    \"platformName\": \"Android\",\n    \"platformVersion\": \"7.1.1\",\n    \"deviceName\": \"8TE645R8459HBEUW\",\n    \"appPackage\": \"com.tencent.mm\",\n    \"appActivity\": \"com.tencent.mm.ui.LauncherUI\",\n    \"noReset\": \"true\",\n    \"fullReset\": \"false\",\n    \"fastReset\": \"false\",\n    \"chromeOptions\": {\'androidProcess\': \'com.tencent.mm:tools\'}\n}', '1,3,5,7,9');
INSERT INTO `project_project` VALUES (24, '2019-08-30 14:53:12.254081', '2019-09-03 10:02:01.755222', 'miduopay2', '12310', 'ui', 'wx_h5', 1, '/Users/charles/developer/PycharmProjects/AppiumAutoUi/app/weixin.apk', 'capabilities = {\n    \"platformName\": \"Android\",\n    \"platformVersion\": \"7.1.1\",\n    \"deviceName\": \"8TE645R8459HBEUW\",\n    \"appPackage\": \"com.tencent.mm\",\n    \"appActivity\": \"com.tencent.mm.ui.LauncherUI\",\n    \"noReset\": \"true\",\n    \"fullReset\": \"false\",\n    \"fastReset\": \"false\",\n    \"chromeOptions\": {\'androidProcess\': \'com.tencent.mm:tools\'}\n}', '1,3,5,7,9');
INSERT INTO `project_project` VALUES (25, '2019-09-19 09:10:01.297174', '2019-09-19 09:10:01.297412', '复制___miduopay9', '12310', 'ui', 'wx_h5', 1, '/Users/charles/developer/PycharmProjects/AppiumAutoUi/app/weixin.apk', 'capabilities = {\n    \"platformName\": \"Android\",\n    \"platformVersion\": \"7.1.1\",\n    \"deviceName\": \"8TE645R8459HBEUW\",\n    \"appPackage\": \"com.tencent.mm\",\n    \"appActivity\": \"com.tencent.mm.ui.LauncherUI\",\n    \"noReset\": \"true\",\n    \"fullReset\": \"false\",\n    \"fastReset\": \"false\",\n    \"chromeOptions\": {\'androidProcess\': \'com.tencent.mm:tools\'}\n}', '1,3,5,7,9');
INSERT INTO `project_project` VALUES (26, '2019-09-19 10:39:11.258170', '2019-09-19 10:39:11.258258', 'test1', 'test1', 'ui', 'wx_h5', 1, '1', '1', '');
INSERT INTO `project_project` VALUES (27, '2019-09-19 11:09:55.618929', '2019-09-19 11:09:55.618973', 'root', 'root', 'ui', 'wx_h5', 2, '1', '111', '');
INSERT INTO `project_project` VALUES (28, '2019-09-19 11:58:35.079811', '2019-09-19 11:58:35.079914', 'oooooo', '0000', 'ui', 'wx_h5', 2, '00', '0000000000', '');
INSERT INTO `project_project` VALUES (29, '2019-09-19 14:34:20.656559', '2019-09-19 14:34:20.656612', '复制___test1', 'test1', 'ui', 'wx_h5', 1, '1', '1', '');
INSERT INTO `project_project` VALUES (30, '2019-09-19 14:34:49.002858', '2019-09-19 14:34:49.002887', '复制___复制___test1', 'test1', 'ui', 'wx_h5', 1, '1', '1', '');
COMMIT;

-- ----------------------------
-- Table structure for rbac_menu
-- ----------------------------
DROP TABLE IF EXISTS `rbac_menu`;
CREATE TABLE `rbac_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `path` varchar(158) DEFAULT NULL,
  `is_frame` tinyint(1) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `sort` int(11) DEFAULT NULL,
  `component` varchar(200) DEFAULT NULL,
  `pid_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `rbac_menu_pid_id_a43b3c84_fk_rbac_menu_id` (`pid_id`),
  CONSTRAINT `rbac_menu_pid_id_a43b3c84_fk_rbac_menu_id` FOREIGN KEY (`pid_id`) REFERENCES `rbac_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_menu
-- ----------------------------
BEGIN;
INSERT INTO `rbac_menu` VALUES (1, '系统管理', 'system', 'system', 0, 1, 90, NULL, NULL);
INSERT INTO `rbac_menu` VALUES (2, '用户管理', 'user', 'users', 0, 1, 11, 'system/user/index', 1);
INSERT INTO `rbac_menu` VALUES (3, '菜单管理', 'caidan', 'menus', 0, 1, 12, 'system/menu/index', 1);
INSERT INTO `rbac_menu` VALUES (4, '角色管理', 'role', 'roles', 0, 1, 14, 'system/role/index', 1);
INSERT INTO `rbac_menu` VALUES (5, '权限管理', 'permission', 'permissions', 0, 1, 13, 'system/permission/index', 1);
INSERT INTO `rbac_menu` VALUES (6, '组织架构', 'zuzhi', 'organizations', 0, 1, 15, 'system/organization/index', 1);
INSERT INTO `rbac_menu` VALUES (17, '项目管理', 'fabu', 'projects', 0, 1, 10, 'projects/index', NULL);
INSERT INTO `rbac_menu` VALUES (18, '项目配置', 'xiangmu', 'project', 0, 1, 11, 'projects/project/index', 17);
INSERT INTO `rbac_menu` VALUES (19, '【页面】新建项目', '', 'project/create', 0, 0, 999, 'projects/project/form.vue', 17);
INSERT INTO `rbac_menu` VALUES (20, '【页面】项目详情', '', 'project/detail', 0, 0, 999, 'projects/project/form.vue', 17);
INSERT INTO `rbac_menu` VALUES (27, '测试中心', 'tiaoshi', 'testcenter', 0, 1, 20, '', NULL);
INSERT INTO `rbac_menu` VALUES (28, '页面元素', 'ziyuan', 'pageelement', 0, 1, 20, 'testcenter/pageelement/index', 27);
INSERT INTO `rbac_menu` VALUES (29, '用例管理', 'fwb', 'testcase', 0, 1, 21, 'testcenter/testcase/index', 27);
INSERT INTO `rbac_menu` VALUES (30, '【页面】新增用例', '', 'testcase/create', 0, 0, 999, 'testcenter/testcase/form.vue', 27);
INSERT INTO `rbac_menu` VALUES (31, '【页面】用例详情', '', 'testcase/detail', 0, 0, 999, 'testcenter/testcase/form.vue', 27);
COMMIT;

-- ----------------------------
-- Table structure for rbac_organization
-- ----------------------------
DROP TABLE IF EXISTS `rbac_organization`;
CREATE TABLE `rbac_organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `type` varchar(20) NOT NULL,
  `pid_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rbac_organization_pid_id_0cf751aa_fk_rbac_organization_id` (`pid_id`),
  CONSTRAINT `rbac_organization_pid_id_0cf751aa_fk_rbac_organization_id` FOREIGN KEY (`pid_id`) REFERENCES `rbac_organization` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_organization
-- ----------------------------
BEGIN;
INSERT INTO `rbac_organization` VALUES (1, '测试部', 'department', NULL);
INSERT INTO `rbac_organization` VALUES (2, '7768', 'department', NULL);
INSERT INTO `rbac_organization` VALUES (3, 'eqeqeqw', 'company', 1);
INSERT INTO `rbac_organization` VALUES (4, 'qeqwe', 'company', 3);
COMMIT;

-- ----------------------------
-- Table structure for rbac_permission
-- ----------------------------
DROP TABLE IF EXISTS `rbac_permission`;
CREATE TABLE `rbac_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `method` varchar(50) DEFAULT NULL,
  `pid_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `rbac_permission_pid_id_6939354d_fk_rbac_permission_id` (`pid_id`),
  CONSTRAINT `rbac_permission_pid_id_6939354d_fk_rbac_permission_id` FOREIGN KEY (`pid_id`) REFERENCES `rbac_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_permission
-- ----------------------------
BEGIN;
INSERT INTO `rbac_permission` VALUES (1, '系统管理员', 'admin', NULL);
INSERT INTO `rbac_permission` VALUES (2, '用户管理', 'user_all', NULL);
INSERT INTO `rbac_permission` VALUES (3, '用户列表', 'user_list', 2);
INSERT INTO `rbac_permission` VALUES (4, '用户创建', 'user_create', 2);
INSERT INTO `rbac_permission` VALUES (5, '用户编辑', 'user_edit', 2);
INSERT INTO `rbac_permission` VALUES (6, '用户删除', 'user_delete', 2);
INSERT INTO `rbac_permission` VALUES (7, '菜单管理', 'menu_all', NULL);
INSERT INTO `rbac_permission` VALUES (8, '菜单列表', 'menu_list', 7);
INSERT INTO `rbac_permission` VALUES (9, '菜单创建', 'menu_create', 7);
INSERT INTO `rbac_permission` VALUES (10, '菜单编辑', 'menu_edit', 7);
INSERT INTO `rbac_permission` VALUES (11, '菜单删除', 'menu_delete', 7);
INSERT INTO `rbac_permission` VALUES (12, '角色管理', 'role_all', NULL);
INSERT INTO `rbac_permission` VALUES (13, '角色列表', 'role_list', 12);
INSERT INTO `rbac_permission` VALUES (14, '角色创建', 'role_create', 12);
INSERT INTO `rbac_permission` VALUES (15, '角色编辑', 'role_edit', 12);
INSERT INTO `rbac_permission` VALUES (16, '角色删除', 'role_delete', 12);
INSERT INTO `rbac_permission` VALUES (17, '权限管理', 'permission_all', NULL);
INSERT INTO `rbac_permission` VALUES (18, '权限列表', 'permission_list', 17);
INSERT INTO `rbac_permission` VALUES (19, '权限创建', 'permission_create', 17);
INSERT INTO `rbac_permission` VALUES (20, '权限编辑', 'permission_edit', 17);
INSERT INTO `rbac_permission` VALUES (21, '权限删除', 'permission_delete', 17);
INSERT INTO `rbac_permission` VALUES (22, '组织管理', 'organization_all', NULL);
INSERT INTO `rbac_permission` VALUES (23, '组织列表', 'organization_list', 22);
INSERT INTO `rbac_permission` VALUES (24, '组织创建', 'organization_create', 22);
INSERT INTO `rbac_permission` VALUES (25, '组织编辑', 'organization_edit', 22);
INSERT INTO `rbac_permission` VALUES (26, '组织删除', 'organization_delete', 22);
INSERT INTO `rbac_permission` VALUES (48, '项目管理', 'project_all', NULL);
INSERT INTO `rbac_permission` VALUES (49, '项目列表', 'project_list', 48);
INSERT INTO `rbac_permission` VALUES (50, '项目创建', 'project_create', 48);
INSERT INTO `rbac_permission` VALUES (51, '项目编辑', 'project_edit', 48);
INSERT INTO `rbac_permission` VALUES (52, '项目删除', 'project_delete', 48);
INSERT INTO `rbac_permission` VALUES (65, '页面元素', 'pageelement_all', NULL);
INSERT INTO `rbac_permission` VALUES (66, '元素列表', 'pageelement_list', 65);
INSERT INTO `rbac_permission` VALUES (67, '元素创建', 'pageelement_create', 65);
INSERT INTO `rbac_permission` VALUES (68, '元素修改', 'pageelement_edit', 65);
INSERT INTO `rbac_permission` VALUES (69, '元素删除', 'pageelement_delete', 65);
INSERT INTO `rbac_permission` VALUES (70, '用例管理', 'testcase_all', NULL);
INSERT INTO `rbac_permission` VALUES (71, '用例新增', 'testcase_create', 70);
INSERT INTO `rbac_permission` VALUES (72, '用例删除', 'testcase_delete', 70);
INSERT INTO `rbac_permission` VALUES (73, '用例修改', 'testcase_edit', 70);
INSERT INTO `rbac_permission` VALUES (74, '用例列表', 'testcase_list', 70);
COMMIT;

-- ----------------------------
-- Table structure for rbac_role
-- ----------------------------
DROP TABLE IF EXISTS `rbac_role`;
CREATE TABLE `rbac_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `desc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_role
-- ----------------------------
BEGIN;
INSERT INTO `rbac_role` VALUES (1, '系统管理员', '系统默认管理员');
INSERT INTO `rbac_role` VALUES (2, '开发工程师', '');
INSERT INTO `rbac_role` VALUES (5, '2', '系统默认管理员');
INSERT INTO `rbac_role` VALUES (12, '9', '系统默认管理员');
INSERT INTO `rbac_role` VALUES (13, '10', '系统默认管理员');
INSERT INTO `rbac_role` VALUES (14, '00', '00');
INSERT INTO `rbac_role` VALUES (15, 'tt', 'tt');
COMMIT;

-- ----------------------------
-- Table structure for rbac_role_menus
-- ----------------------------
DROP TABLE IF EXISTS `rbac_role_menus`;
CREATE TABLE `rbac_role_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rbac_role_menus_role_id_menu_id_579f5861_uniq` (`role_id`,`menu_id`),
  KEY `rbac_role_menus_menu_id_180f4f9a_fk_rbac_menu_id` (`menu_id`),
  CONSTRAINT `rbac_role_menus_menu_id_180f4f9a_fk_rbac_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `rbac_menu` (`id`),
  CONSTRAINT `rbac_role_menus_role_id_323259a4_fk_rbac_role_id` FOREIGN KEY (`role_id`) REFERENCES `rbac_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_role_menus
-- ----------------------------
BEGIN;
INSERT INTO `rbac_role_menus` VALUES (6, 2, 17);
INSERT INTO `rbac_role_menus` VALUES (7, 2, 18);
INSERT INTO `rbac_role_menus` VALUES (13, 2, 19);
INSERT INTO `rbac_role_menus` VALUES (8, 2, 20);
INSERT INTO `rbac_role_menus` VALUES (14, 2, 27);
INSERT INTO `rbac_role_menus` VALUES (15, 2, 28);
INSERT INTO `rbac_role_menus` VALUES (16, 2, 29);
INSERT INTO `rbac_role_menus` VALUES (17, 2, 30);
INSERT INTO `rbac_role_menus` VALUES (18, 2, 31);
INSERT INTO `rbac_role_menus` VALUES (19, 14, 27);
INSERT INTO `rbac_role_menus` VALUES (20, 15, 1);
INSERT INTO `rbac_role_menus` VALUES (21, 15, 2);
COMMIT;

-- ----------------------------
-- Table structure for rbac_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `rbac_role_permissions`;
CREATE TABLE `rbac_role_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rbac_role_permissions_role_id_permission_id_d01303da_uniq` (`role_id`,`permission_id`),
  KEY `rbac_role_permission_permission_id_f5e1e866_fk_rbac_perm` (`permission_id`),
  CONSTRAINT `rbac_role_permission_permission_id_f5e1e866_fk_rbac_perm` FOREIGN KEY (`permission_id`) REFERENCES `rbac_permission` (`id`),
  CONSTRAINT `rbac_role_permissions_role_id_d10416cb_fk_rbac_role_id` FOREIGN KEY (`role_id`) REFERENCES `rbac_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_role_permissions
-- ----------------------------
BEGIN;
INSERT INTO `rbac_role_permissions` VALUES (1, 1, 1);
INSERT INTO `rbac_role_permissions` VALUES (16, 2, 48);
INSERT INTO `rbac_role_permissions` VALUES (4, 2, 49);
INSERT INTO `rbac_role_permissions` VALUES (17, 2, 50);
INSERT INTO `rbac_role_permissions` VALUES (18, 2, 51);
INSERT INTO `rbac_role_permissions` VALUES (19, 2, 52);
INSERT INTO `rbac_role_permissions` VALUES (20, 2, 65);
INSERT INTO `rbac_role_permissions` VALUES (21, 2, 66);
INSERT INTO `rbac_role_permissions` VALUES (22, 2, 67);
INSERT INTO `rbac_role_permissions` VALUES (23, 2, 68);
INSERT INTO `rbac_role_permissions` VALUES (24, 2, 69);
INSERT INTO `rbac_role_permissions` VALUES (27, 2, 72);
INSERT INTO `rbac_role_permissions` VALUES (28, 2, 73);
INSERT INTO `rbac_role_permissions` VALUES (30, 2, 74);
INSERT INTO `rbac_role_permissions` VALUES (31, 14, 65);
INSERT INTO `rbac_role_permissions` VALUES (32, 14, 66);
INSERT INTO `rbac_role_permissions` VALUES (33, 14, 67);
INSERT INTO `rbac_role_permissions` VALUES (34, 14, 68);
INSERT INTO `rbac_role_permissions` VALUES (35, 14, 69);
INSERT INTO `rbac_role_permissions` VALUES (36, 14, 70);
INSERT INTO `rbac_role_permissions` VALUES (37, 14, 71);
INSERT INTO `rbac_role_permissions` VALUES (38, 14, 72);
INSERT INTO `rbac_role_permissions` VALUES (39, 14, 73);
INSERT INTO `rbac_role_permissions` VALUES (40, 14, 74);
INSERT INTO `rbac_role_permissions` VALUES (41, 15, 3);
COMMIT;

-- ----------------------------
-- Table structure for rbac_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `rbac_userprofile`;
CREATE TABLE `rbac_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `superior_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `rbac_userprofile_department_id_d0f32bd9_fk_rbac_organization_id` (`department_id`),
  KEY `rbac_userprofile_superior_id_5d0a3780_fk_rbac_userprofile_id` (`superior_id`),
  CONSTRAINT `rbac_userprofile_department_id_d0f32bd9_fk_rbac_organization_id` FOREIGN KEY (`department_id`) REFERENCES `rbac_organization` (`id`),
  CONSTRAINT `rbac_userprofile_superior_id_5d0a3780_fk_rbac_userprofile_id` FOREIGN KEY (`superior_id`) REFERENCES `rbac_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_userprofile
-- ----------------------------
BEGIN;
INSERT INTO `rbac_userprofile` VALUES (1, 'pbkdf2_sha256$150000$d4DBJ0rj7o0C$QWSf2yUohCQO5BBtw9ohv0p9XFVkW65LdC4ise0mbL8=', NULL, 1, 'admin', '', '', 1, 1, '2019-03-23 14:01:30.868000', '管理员', '', 'admin@admin.com', 'image/123.jpg', NULL, NULL, NULL);
INSERT INTO `rbac_userprofile` VALUES (2, 'pbkdf2_sha256$150000$RnfBpcdVRFfr$WX6W2UXEqK1agsaVxNNg2DHV51/SwL9dcy9HrIPtcCY=', NULL, 0, 'root', '', '', 0, 1, '2019-08-28 17:29:45.747467', '大龙虾', '13232132312', '13@123.com', 'image/123.jpg', '', 1, NULL);
INSERT INTO `rbac_userprofile` VALUES (3, 'pbkdf2_sha256$150000$xilF2sT86eG5$NVDVFJDXmmutgwo3fLMb8sGtVp/eD/epgaluoM52OXw=', NULL, 0, '111', '', '', 0, 0, '2019-08-29 17:14:18.310883', '111', '13511111111', '111@12.com', 'image/222.jpeg', '122', 1, 2);
INSERT INTO `rbac_userprofile` VALUES (4, 'pbkdf2_sha256$150000$xTLPKdXXr10j$R3ijxm54nO19cZJFKOiPk8hYy4VYLP2J9dAs97l1xOI=', NULL, 0, '555', '', '', 0, 1, '2019-08-29 17:27:16.559054', '555', '13655555555', '555@33.com', 'image/222.jpeg', '2242', 1, NULL);
INSERT INTO `rbac_userprofile` VALUES (6, 'pbkdf2_sha256$150000$vFuETkLbM5IC$ockEjFrbgNdYkyB5TyAE62ZRdzA7t69oO1b88/v67Ok=', NULL, 0, 'W1111', '', '', 0, 0, '2019-11-13 17:04:57.916422', 'W', '15502168672', 'WW@12.com', 'image/default.png', '2323', 1, 2);
INSERT INTO `rbac_userprofile` VALUES (7, '123456', NULL, 0, 'root222', '', '', 0, 0, '2019-11-13 17:45:10.871473', '234324324', '13222222222', '332@qq.com', 'image/default.png', '34324', 1, 2);
INSERT INTO `rbac_userprofile` VALUES (8, '123456', NULL, 0, '32223432', '', '', 0, 0, '2019-11-13 17:50:33.106774', '3243243', '13233333333', '43243432@123.com', 'image/123.png', '233', 1, 2);
COMMIT;

-- ----------------------------
-- Table structure for rbac_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `rbac_userprofile_groups`;
CREATE TABLE `rbac_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rbac_userprofile_groups_userprofile_id_group_id_4d710b30_uniq` (`userprofile_id`,`group_id`),
  KEY `rbac_userprofile_groups_group_id_2c47610b_fk_auth_group_id` (`group_id`),
  CONSTRAINT `rbac_userprofile_gro_userprofile_id_9cacde37_fk_rbac_user` FOREIGN KEY (`userprofile_id`) REFERENCES `rbac_userprofile` (`id`),
  CONSTRAINT `rbac_userprofile_groups_group_id_2c47610b_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rbac_userprofile_roles
-- ----------------------------
DROP TABLE IF EXISTS `rbac_userprofile_roles`;
CREATE TABLE `rbac_userprofile_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rbac_userprofile_roles_userprofile_id_role_id_ba9254c5_uniq` (`userprofile_id`,`role_id`),
  KEY `rbac_userprofile_roles_role_id_ddc12d7e_fk_rbac_role_id` (`role_id`),
  CONSTRAINT `rbac_userprofile_rol_userprofile_id_3a7afbe9_fk_rbac_user` FOREIGN KEY (`userprofile_id`) REFERENCES `rbac_userprofile` (`id`),
  CONSTRAINT `rbac_userprofile_roles_role_id_ddc12d7e_fk_rbac_role_id` FOREIGN KEY (`role_id`) REFERENCES `rbac_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_userprofile_roles
-- ----------------------------
BEGIN;
INSERT INTO `rbac_userprofile_roles` VALUES (1, 1, 1);
INSERT INTO `rbac_userprofile_roles` VALUES (9, 2, 15);
INSERT INTO `rbac_userprofile_roles` VALUES (3, 3, 2);
INSERT INTO `rbac_userprofile_roles` VALUES (4, 4, 2);
INSERT INTO `rbac_userprofile_roles` VALUES (6, 6, 2);
INSERT INTO `rbac_userprofile_roles` VALUES (7, 7, 2);
INSERT INTO `rbac_userprofile_roles` VALUES (8, 8, 2);
COMMIT;

-- ----------------------------
-- Table structure for rbac_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `rbac_userprofile_user_permissions`;
CREATE TABLE `rbac_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rbac_userprofile_user_pe_userprofile_id_permissio_16bbd20f_uniq` (`userprofile_id`,`permission_id`),
  KEY `rbac_userprofile_use_permission_id_740ad67c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `rbac_userprofile_use_permission_id_740ad67c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `rbac_userprofile_use_userprofile_id_38afd71d_fk_rbac_user` FOREIGN KEY (`userprofile_id`) REFERENCES `rbac_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for testcenter_pageelement
-- ----------------------------
DROP TABLE IF EXISTS `testcenter_pageelement`;
CREATE TABLE `testcenter_pageelement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `modify_time` datetime(6) NOT NULL,
  `element_name` varchar(100) NOT NULL,
  `element_alias` varchar(100) NOT NULL,
  `page_name` varchar(100) NOT NULL,
  `element_by` varchar(10) NOT NULL,
  `element_locate` varchar(300) NOT NULL,
  `element_index` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`element_name`) USING BTREE,
  KEY `testcenter_pageeleme_project_id_03682be5_fk_deploymen` (`project_id`),
  CONSTRAINT `testcenter_pageeleme_project_id_03682be5_fk_deploymen` FOREIGN KEY (`project_id`) REFERENCES `project_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of testcenter_pageelement
-- ----------------------------
BEGIN;
INSERT INTO `testcenter_pageelement` VALUES (9, '2019-09-02 10:45:34.369547', '2019-09-02 10:54:08.924096', '$go_pay_1', '12312', 'home_page', 'ids', '//2342343242', 1, 11);
INSERT INTO `testcenter_pageelement` VALUES (10, '2019-09-04 09:13:35.988334', '2019-09-04 09:13:35.988415', '$qqqa', '12334', 'q', 'by', '234324324', 2, 11);
INSERT INTO `testcenter_pageelement` VALUES (11, '2019-09-02 10:45:34.369547', '2019-09-02 10:54:08.924096', '$go_pay_1', '12312', 'home_page', 'ids', '//2342343242', 1, 11);
INSERT INTO `testcenter_pageelement` VALUES (12, '2019-09-02 10:45:34.369547', '2019-09-02 10:54:08.924096', '$go_pay_1', '12312', 'home_page', 'ids', '//2342343242', 1, 11);
INSERT INTO `testcenter_pageelement` VALUES (13, '2019-09-02 10:45:34.369547', '2019-09-02 10:54:08.924096', '$go_pay_1', '12312', 'home_page', 'ids', '//2342343242', 1, 11);
INSERT INTO `testcenter_pageelement` VALUES (14, '2019-09-02 10:45:34.369547', '2019-09-02 10:54:08.924096', '$go_pay_1', '12312', 'home_page', 'ids', '//2342343242', 1, 11);
INSERT INTO `testcenter_pageelement` VALUES (15, '2019-09-02 10:45:34.369547', '2019-09-02 10:54:08.924096', '$go_pay_1', '12312', 'home_page', 'ids', '//2342343242', 1, 11);
INSERT INTO `testcenter_pageelement` VALUES (16, '2019-09-02 10:45:34.369547', '2019-09-02 10:54:08.924096', '$go_pay_1', '12312', 'home_page', 'ids', '//2342343242', 1, 11);
INSERT INTO `testcenter_pageelement` VALUES (17, '2019-09-02 10:45:34.369547', '2019-09-02 10:54:08.924096', '$go_pay_1', '12312', 'home_page', 'ids', '//2342343242', 1, 11);
INSERT INTO `testcenter_pageelement` VALUES (18, '2019-09-02 10:45:34.369547', '2019-09-02 10:54:08.924096', '$go_pay_1', '12312', 'home_page', 'ids', '//2342343242', 1, 11);
INSERT INTO `testcenter_pageelement` VALUES (19, '2019-09-02 10:45:34.369547', '2019-09-02 10:54:08.924096', '$go_pay_1', '12312', 'home_page', 'ids', '//2342343242', 1, 11);
INSERT INTO `testcenter_pageelement` VALUES (20, '2019-09-02 10:45:34.369547', '2019-09-02 10:54:08.924096', '$go_pay_1', '12312', 'home_page', 'ids', '//2342343242', 1, 11);
INSERT INTO `testcenter_pageelement` VALUES (21, '2019-09-02 10:45:34.369547', '2019-09-02 10:54:08.924096', '$go_pay_1', '12312', 'home_page', 'ids', '//2342343242', 1, 11);
INSERT INTO `testcenter_pageelement` VALUES (22, '2019-09-02 10:45:34.369547', '2019-09-02 10:54:08.924096', '$go_pay_1', '12312', 'home_page', 'ids', '//2342343242', 1, 11);
COMMIT;

-- ----------------------------
-- Table structure for testcenter_testcase
-- ----------------------------
DROP TABLE IF EXISTS `testcenter_testcase`;
CREATE TABLE `testcenter_testcase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `modify_time` datetime(6) NOT NULL,
  `case_model` varchar(50) NOT NULL,
  `case_title` varchar(100) NOT NULL,
  `case_setUp` varchar(10) DEFAULT NULL,
  `case_tearDown` varchar(10) DEFAULT NULL,
  `flag` tinyint(1) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `case_type` varchar(50) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `testcenter_testcase_project_id_8ee473eb_fk_deployment_project_id` (`project_id`),
  KEY `testcenter_testcase_owner_id_37802832_fk_rbac_userprofile_id` (`owner_id`),
  CONSTRAINT `testcenter_testcase_owner_id_37802832_fk_rbac_userprofile_id` FOREIGN KEY (`owner_id`) REFERENCES `rbac_userprofile` (`id`),
  CONSTRAINT `testcenter_testcase_project_id_8ee473eb_fk_deployment_project_id` FOREIGN KEY (`project_id`) REFERENCES `project_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of testcenter_testcase
-- ----------------------------
BEGIN;
INSERT INTO `testcenter_testcase` VALUES (1, '2019-09-02 14:36:52.000000', '2019-09-20 15:41:32.635445', '1', 'qeqwewq', '1', '1', 1, 28, '1', 1);
INSERT INTO `testcenter_testcase` VALUES (5, '2019-09-18 17:13:57.483013', '2019-09-18 17:13:57.483040', '1', '复制___1', '1', '1', 1, 11, '1', 1);
INSERT INTO `testcenter_testcase` VALUES (6, '2019-09-18 17:22:51.760731', '2019-09-18 17:22:51.760769', '1', '复制___复制___1', '1', '1', 1, 11, '1', 1);
INSERT INTO `testcenter_testcase` VALUES (7, '2019-09-18 18:02:55.561684', '2019-09-18 18:02:55.561733', '1', '复制___复制___复制___1', '1', '1', 1, 11, '1', 1);
INSERT INTO `testcenter_testcase` VALUES (8, '2019-09-19 16:19:43.428642', '2019-09-19 16:19:43.428697', '1', '复制___复制___复制___1', '1', '1', 1, 11, '1', 1);
INSERT INTO `testcenter_testcase` VALUES (9, '2019-09-20 14:59:12.531380', '2019-09-20 14:59:12.531444', '444', '444', '', '', 0, 10, '444', 1);
INSERT INTO `testcenter_testcase` VALUES (10, '2019-09-20 15:26:11.948072', '2019-09-20 15:26:11.948170', '1', '1', '', '', 0, 9, '1', 1);
COMMIT;

-- ----------------------------
-- Table structure for testcenter_uicheck
-- ----------------------------
DROP TABLE IF EXISTS `testcenter_uicheck`;
CREATE TABLE `testcenter_uicheck` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `modify_time` datetime(6) NOT NULL,
  `check_name` varchar(50) NOT NULL,
  `check_type` varchar(30) NOT NULL,
  `check_input` varchar(100) DEFAULT NULL,
  `index` int(11) NOT NULL,
  `case_id` int(11) NOT NULL,
  `check_element_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `testcenter_uicheck_case_id_ae6596fa_fk_testcenter_uistep_id` (`case_id`),
  KEY `testcenter_uicheck_check_element_id_eac25ea2_fk_testcente` (`check_element_id`),
  CONSTRAINT `testcenter_uicheck_case_id_ae6596fa_fk_testcenter_uistep_id` FOREIGN KEY (`case_id`) REFERENCES `testcenter_uistep` (`id`),
  CONSTRAINT `testcenter_uicheck_check_element_id_eac25ea2_fk_testcente` FOREIGN KEY (`check_element_id`) REFERENCES `testcenter_pageelement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for testcenter_uistep
-- ----------------------------
DROP TABLE IF EXISTS `testcenter_uistep`;
CREATE TABLE `testcenter_uistep` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `modify_time` datetime(6) NOT NULL,
  `step_name` varchar(50) NOT NULL,
  `step_type` varchar(30) NOT NULL,
  `step_input` varchar(100) DEFAULT NULL,
  `index` int(11) NOT NULL,
  `case_id` int(11) NOT NULL,
  `step_element_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `testcenter_uistep_case_id_808c93ed_fk_testcenter_testcase_id` (`case_id`),
  KEY `testcenter_uistep_step_element_id_8806ad30_fk_testcente` (`step_element_id`),
  CONSTRAINT `testcenter_uistep_case_id_808c93ed_fk_testcenter_testcase_id` FOREIGN KEY (`case_id`) REFERENCES `testcenter_testcase` (`id`),
  CONSTRAINT `testcenter_uistep_step_element_id_8806ad30_fk_testcente` FOREIGN KEY (`step_element_id`) REFERENCES `testcenter_pageelement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
