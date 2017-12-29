/*
Navicat MariaDB Data Transfer

Source Server         : Localhost
Source Server Version : 100124
Source Host           : localhost:3306
Source Database       : db_menpro

Target Server Type    : MariaDB
Target Server Version : 100124
File Encoding         : 65001

Date: 2017-12-29 17:36:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('Dokter', '2', '1514543679');
INSERT INTO `auth_assignment` VALUES ('Super Admin', '1', '1512620032');

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('/*', '2', null, null, null, '1512619988', '1512619988');
INSERT INTO `auth_item` VALUES ('/admin/*', '2', null, null, null, '1512619986', '1512619986');
INSERT INTO `auth_item` VALUES ('/admin/assignment/*', '2', null, null, null, '1512619984', '1512619984');
INSERT INTO `auth_item` VALUES ('/admin/assignment/assign', '2', null, null, null, '1512619984', '1512619984');
INSERT INTO `auth_item` VALUES ('/admin/assignment/index', '2', null, null, null, '1512619984', '1512619984');
INSERT INTO `auth_item` VALUES ('/admin/assignment/revoke', '2', null, null, null, '1512619984', '1512619984');
INSERT INTO `auth_item` VALUES ('/admin/assignment/view', '2', null, null, null, '1512619984', '1512619984');
INSERT INTO `auth_item` VALUES ('/admin/default/*', '2', null, null, null, '1512619984', '1512619984');
INSERT INTO `auth_item` VALUES ('/admin/default/index', '2', null, null, null, '1512619984', '1512619984');
INSERT INTO `auth_item` VALUES ('/admin/menu/*', '2', null, null, null, '1512619984', '1512619984');
INSERT INTO `auth_item` VALUES ('/admin/menu/create', '2', null, null, null, '1512619984', '1512619984');
INSERT INTO `auth_item` VALUES ('/admin/menu/delete', '2', null, null, null, '1512619984', '1512619984');
INSERT INTO `auth_item` VALUES ('/admin/menu/index', '2', null, null, null, '1512619984', '1512619984');
INSERT INTO `auth_item` VALUES ('/admin/menu/update', '2', null, null, null, '1512619984', '1512619984');
INSERT INTO `auth_item` VALUES ('/admin/menu/view', '2', null, null, null, '1512619984', '1512619984');
INSERT INTO `auth_item` VALUES ('/admin/permission/*', '2', null, null, null, '1512619985', '1512619985');
INSERT INTO `auth_item` VALUES ('/admin/permission/assign', '2', null, null, null, '1512619985', '1512619985');
INSERT INTO `auth_item` VALUES ('/admin/permission/create', '2', null, null, null, '1512619984', '1512619984');
INSERT INTO `auth_item` VALUES ('/admin/permission/delete', '2', null, null, null, '1512619985', '1512619985');
INSERT INTO `auth_item` VALUES ('/admin/permission/index', '2', null, null, null, '1512619984', '1512619984');
INSERT INTO `auth_item` VALUES ('/admin/permission/remove', '2', null, null, null, '1512619985', '1512619985');
INSERT INTO `auth_item` VALUES ('/admin/permission/update', '2', null, null, null, '1512619984', '1512619984');
INSERT INTO `auth_item` VALUES ('/admin/permission/view', '2', null, null, null, '1512619984', '1512619984');
INSERT INTO `auth_item` VALUES ('/admin/role/*', '2', null, null, null, '1512619985', '1512619985');
INSERT INTO `auth_item` VALUES ('/admin/role/assign', '2', null, null, null, '1512619985', '1512619985');
INSERT INTO `auth_item` VALUES ('/admin/role/create', '2', null, null, null, '1512619985', '1512619985');
INSERT INTO `auth_item` VALUES ('/admin/role/delete', '2', null, null, null, '1512619985', '1512619985');
INSERT INTO `auth_item` VALUES ('/admin/role/index', '2', null, null, null, '1512619985', '1512619985');
INSERT INTO `auth_item` VALUES ('/admin/role/remove', '2', null, null, null, '1512619985', '1512619985');
INSERT INTO `auth_item` VALUES ('/admin/role/update', '2', null, null, null, '1512619985', '1512619985');
INSERT INTO `auth_item` VALUES ('/admin/role/view', '2', null, null, null, '1512619985', '1512619985');
INSERT INTO `auth_item` VALUES ('/admin/route/*', '2', null, null, null, '1512619985', '1512619985');
INSERT INTO `auth_item` VALUES ('/admin/route/assign', '2', null, null, null, '1512619985', '1512619985');
INSERT INTO `auth_item` VALUES ('/admin/route/create', '2', null, null, null, '1512619985', '1512619985');
INSERT INTO `auth_item` VALUES ('/admin/route/index', '2', null, null, null, '1512619985', '1512619985');
INSERT INTO `auth_item` VALUES ('/admin/route/refresh', '2', null, null, null, '1512619985', '1512619985');
INSERT INTO `auth_item` VALUES ('/admin/route/remove', '2', null, null, null, '1512619985', '1512619985');
INSERT INTO `auth_item` VALUES ('/admin/rule/*', '2', null, null, null, '1512619985', '1512619985');
INSERT INTO `auth_item` VALUES ('/admin/rule/create', '2', null, null, null, '1512619985', '1512619985');
INSERT INTO `auth_item` VALUES ('/admin/rule/delete', '2', null, null, null, '1512619985', '1512619985');
INSERT INTO `auth_item` VALUES ('/admin/rule/index', '2', null, null, null, '1512619985', '1512619985');
INSERT INTO `auth_item` VALUES ('/admin/rule/update', '2', null, null, null, '1512619985', '1512619985');
INSERT INTO `auth_item` VALUES ('/admin/rule/view', '2', null, null, null, '1512619985', '1512619985');
INSERT INTO `auth_item` VALUES ('/admin/user/*', '2', null, null, null, '1512619986', '1512619986');
INSERT INTO `auth_item` VALUES ('/admin/user/activate', '2', null, null, null, '1512619986', '1512619986');
INSERT INTO `auth_item` VALUES ('/admin/user/change-password', '2', null, null, null, '1512619986', '1512619986');
INSERT INTO `auth_item` VALUES ('/admin/user/delete', '2', null, null, null, '1512619985', '1512619985');
INSERT INTO `auth_item` VALUES ('/admin/user/index', '2', null, null, null, '1512619985', '1512619985');
INSERT INTO `auth_item` VALUES ('/admin/user/login', '2', null, null, null, '1512619986', '1512619986');
INSERT INTO `auth_item` VALUES ('/admin/user/logout', '2', null, null, null, '1512619986', '1512619986');
INSERT INTO `auth_item` VALUES ('/admin/user/request-password-reset', '2', null, null, null, '1512619986', '1512619986');
INSERT INTO `auth_item` VALUES ('/admin/user/reset-password', '2', null, null, null, '1512619986', '1512619986');
INSERT INTO `auth_item` VALUES ('/admin/user/signup', '2', null, null, null, '1512619986', '1512619986');
INSERT INTO `auth_item` VALUES ('/admin/user/view', '2', null, null, null, '1512619985', '1512619985');
INSERT INTO `auth_item` VALUES ('/debug/*', '2', null, null, null, '1512619986', '1512619986');
INSERT INTO `auth_item` VALUES ('/debug/default/*', '2', null, null, null, '1512619986', '1512619986');
INSERT INTO `auth_item` VALUES ('/debug/default/db-explain', '2', null, null, null, '1512619986', '1512619986');
INSERT INTO `auth_item` VALUES ('/debug/default/download-mail', '2', null, null, null, '1512619986', '1512619986');
INSERT INTO `auth_item` VALUES ('/debug/default/index', '2', null, null, null, '1512619986', '1512619986');
INSERT INTO `auth_item` VALUES ('/debug/default/toolbar', '2', null, null, null, '1512619986', '1512619986');
INSERT INTO `auth_item` VALUES ('/debug/default/view', '2', null, null, null, '1512619986', '1512619986');
INSERT INTO `auth_item` VALUES ('/debug/user/*', '2', null, null, null, '1512619986', '1512619986');
INSERT INTO `auth_item` VALUES ('/debug/user/reset-identity', '2', null, null, null, '1512619986', '1512619986');
INSERT INTO `auth_item` VALUES ('/debug/user/set-identity', '2', null, null, null, '1512619986', '1512619986');
INSERT INTO `auth_item` VALUES ('/dokter/*', '2', null, null, null, '1512619987', '1512619987');
INSERT INTO `auth_item` VALUES ('/dokter/create', '2', null, null, null, '1512619987', '1512619987');
INSERT INTO `auth_item` VALUES ('/dokter/delete', '2', null, null, null, '1512619987', '1512619987');
INSERT INTO `auth_item` VALUES ('/dokter/index', '2', null, null, null, '1512619987', '1512619987');
INSERT INTO `auth_item` VALUES ('/dokter/update', '2', null, null, null, '1512619987', '1512619987');
INSERT INTO `auth_item` VALUES ('/dokter/view', '2', null, null, null, '1512619987', '1512619987');
INSERT INTO `auth_item` VALUES ('/gii/*', '2', null, null, null, '1512619987', '1512619987');
INSERT INTO `auth_item` VALUES ('/gii/default/*', '2', null, null, null, '1512619987', '1512619987');
INSERT INTO `auth_item` VALUES ('/gii/default/action', '2', null, null, null, '1512619986', '1512619986');
INSERT INTO `auth_item` VALUES ('/gii/default/diff', '2', null, null, null, '1512619986', '1512619986');
INSERT INTO `auth_item` VALUES ('/gii/default/index', '2', null, null, null, '1512619986', '1512619986');
INSERT INTO `auth_item` VALUES ('/gii/default/preview', '2', null, null, null, '1512619986', '1512619986');
INSERT INTO `auth_item` VALUES ('/gii/default/view', '2', null, null, null, '1512619986', '1512619986');
INSERT INTO `auth_item` VALUES ('/gridview/*', '2', null, null, null, '1512619986', '1512619986');
INSERT INTO `auth_item` VALUES ('/gridview/export/*', '2', null, null, null, '1512619986', '1512619986');
INSERT INTO `auth_item` VALUES ('/gridview/export/download', '2', null, null, null, '1512619986', '1512619986');
INSERT INTO `auth_item` VALUES ('/obat/*', '2', null, null, null, '1512619987', '1512619987');
INSERT INTO `auth_item` VALUES ('/obat/create', '2', null, null, null, '1512619987', '1512619987');
INSERT INTO `auth_item` VALUES ('/obat/delete', '2', null, null, null, '1512619987', '1512619987');
INSERT INTO `auth_item` VALUES ('/obat/index', '2', null, null, null, '1512619987', '1512619987');
INSERT INTO `auth_item` VALUES ('/obat/update', '2', null, null, null, '1512619987', '1512619987');
INSERT INTO `auth_item` VALUES ('/obat/view', '2', null, null, null, '1512619987', '1512619987');
INSERT INTO `auth_item` VALUES ('/resep/*', '2', null, null, null, '1512619987', '1512619987');
INSERT INTO `auth_item` VALUES ('/resep/bulk-delete', '2', null, null, null, '1512619987', '1512619987');
INSERT INTO `auth_item` VALUES ('/resep/create', '2', null, null, null, '1512619987', '1512619987');
INSERT INTO `auth_item` VALUES ('/resep/delete', '2', null, null, null, '1512619987', '1512619987');
INSERT INTO `auth_item` VALUES ('/resep/index', '2', null, null, null, '1512619987', '1512619987');
INSERT INTO `auth_item` VALUES ('/resep/update', '2', null, null, null, '1512619987', '1512619987');
INSERT INTO `auth_item` VALUES ('/resep/view', '2', null, null, null, '1512619987', '1512619987');
INSERT INTO `auth_item` VALUES ('/site/*', '2', null, null, null, '1512619988', '1512619988');
INSERT INTO `auth_item` VALUES ('/site/about', '2', null, null, null, '1512619987', '1512619987');
INSERT INTO `auth_item` VALUES ('/site/captcha', '2', null, null, null, '1512619987', '1512619987');
INSERT INTO `auth_item` VALUES ('/site/error', '2', null, null, null, '1512619987', '1512619987');
INSERT INTO `auth_item` VALUES ('/site/index', '2', null, null, null, '1512619987', '1512619987');
INSERT INTO `auth_item` VALUES ('/site/login', '2', null, null, null, '1512619987', '1512619987');
INSERT INTO `auth_item` VALUES ('/site/logout', '2', null, null, null, '1512619987', '1512619987');
INSERT INTO `auth_item` VALUES ('/site/request-password-reset', '2', null, null, null, '1512619988', '1512619988');
INSERT INTO `auth_item` VALUES ('/site/reset-password', '2', null, null, null, '1512619988', '1512619988');
INSERT INTO `auth_item` VALUES ('/site/signup', '2', null, null, null, '1512619988', '1512619988');
INSERT INTO `auth_item` VALUES ('/user/*', '2', null, null, null, '1512619988', '1512619988');
INSERT INTO `auth_item` VALUES ('/user/create', '2', null, null, null, '1512619988', '1512619988');
INSERT INTO `auth_item` VALUES ('/user/delete', '2', null, null, null, '1512619988', '1512619988');
INSERT INTO `auth_item` VALUES ('/user/index', '2', null, null, null, '1512619988', '1512619988');
INSERT INTO `auth_item` VALUES ('/user/update', '2', null, null, null, '1512619988', '1512619988');
INSERT INTO `auth_item` VALUES ('/user/view', '2', null, null, null, '1512619988', '1512619988');
INSERT INTO `auth_item` VALUES ('Apoteker', '1', null, null, null, '1514542493', '1514542493');
INSERT INTO `auth_item` VALUES ('Dokter', '1', null, null, null, '1514542463', '1514542463');
INSERT INTO `auth_item` VALUES ('Super Admin', '1', null, null, null, '1512619965', '1512620006');

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO `auth_item_child` VALUES ('Apoteker', '/obat/*');
INSERT INTO `auth_item_child` VALUES ('Apoteker', '/obat/create');
INSERT INTO `auth_item_child` VALUES ('Apoteker', '/obat/delete');
INSERT INTO `auth_item_child` VALUES ('Apoteker', '/obat/index');
INSERT INTO `auth_item_child` VALUES ('Apoteker', '/obat/update');
INSERT INTO `auth_item_child` VALUES ('Apoteker', '/obat/view');
INSERT INTO `auth_item_child` VALUES ('Apoteker', '/resep/index');
INSERT INTO `auth_item_child` VALUES ('Apoteker', '/resep/view');
INSERT INTO `auth_item_child` VALUES ('Dokter', '/resep/*');
INSERT INTO `auth_item_child` VALUES ('Dokter', '/resep/create');
INSERT INTO `auth_item_child` VALUES ('Dokter', '/resep/delete');
INSERT INTO `auth_item_child` VALUES ('Dokter', '/resep/index');
INSERT INTO `auth_item_child` VALUES ('Dokter', '/resep/view');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/*');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/*');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/assignment/*');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/assignment/assign');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/assignment/index');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/assignment/revoke');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/assignment/view');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/default/*');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/default/index');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/menu/*');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/menu/create');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/menu/delete');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/menu/index');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/menu/update');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/menu/view');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/permission/*');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/permission/assign');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/permission/create');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/permission/delete');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/permission/index');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/permission/remove');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/permission/update');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/permission/view');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/role/*');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/role/assign');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/role/create');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/role/delete');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/role/index');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/role/remove');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/role/update');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/role/view');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/route/*');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/route/assign');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/route/create');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/route/index');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/route/refresh');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/route/remove');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/rule/*');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/rule/create');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/rule/delete');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/rule/index');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/rule/update');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/rule/view');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/user/*');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/user/activate');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/user/change-password');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/user/delete');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/user/index');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/user/login');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/user/logout');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/user/request-password-reset');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/user/reset-password');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/user/signup');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/admin/user/view');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/debug/*');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/debug/default/*');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/debug/default/db-explain');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/debug/default/download-mail');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/debug/default/index');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/debug/default/toolbar');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/debug/default/view');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/debug/user/*');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/debug/user/reset-identity');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/debug/user/set-identity');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/dokter/*');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/dokter/create');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/dokter/delete');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/dokter/index');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/dokter/update');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/dokter/view');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/gii/*');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/gii/default/*');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/gii/default/action');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/gii/default/diff');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/gii/default/index');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/gii/default/preview');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/gii/default/view');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/gridview/*');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/gridview/export/*');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/gridview/export/download');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/obat/*');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/obat/create');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/obat/delete');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/obat/index');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/obat/update');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/obat/view');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/resep/*');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/resep/bulk-delete');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/resep/create');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/resep/delete');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/resep/index');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/resep/update');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/resep/view');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/site/*');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/site/about');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/site/captcha');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/site/error');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/site/index');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/site/login');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/site/logout');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/site/request-password-reset');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/site/reset-password');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/site/signup');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/user/*');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/user/create');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/user/delete');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/user/index');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/user/update');
INSERT INTO `auth_item_child` VALUES ('Super Admin', '/user/view');

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for dokter
-- ----------------------------
DROP TABLE IF EXISTS `dokter`;
CREATE TABLE `dokter` (
  `id_dokter` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `spesialisasi` varchar(255) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_dokter`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dokter
-- ----------------------------

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', '1512404414');

-- ----------------------------
-- Table structure for obat
-- ----------------------------
DROP TABLE IF EXISTS `obat`;
CREATE TABLE `obat` (
  `id_obat` int(11) NOT NULL AUTO_INCREMENT,
  `nama_obat` varchar(255) NOT NULL,
  `cara_pemakaian` varchar(255) NOT NULL,
  `merk_obat` varchar(255) NOT NULL,
  `stock` int(11) NOT NULL,
  PRIMARY KEY (`id_obat`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of obat
-- ----------------------------
INSERT INTO `obat` VALUES ('1', 'Asam Mefenamat', 'Diminum', '-', '100');
INSERT INTO `obat` VALUES ('2', 'Paracetamol ', 'Diminum', '-', '100');
INSERT INTO `obat` VALUES ('3', 'Dipenhidramin', 'Dioles', '-', '100');
INSERT INTO `obat` VALUES ('4', 'Diazepam', 'Diminum', '-', '100');
INSERT INTO `obat` VALUES ('5', 'Dextromethorphan\r\n', 'Diminum', '-', '100');
INSERT INTO `obat` VALUES ('6', 'Phenobarbital', 'Diminum', '-', '100');
INSERT INTO `obat` VALUES ('7', 'Amoxicillin\r\n', 'Diminum', '-', '100');
INSERT INTO `obat` VALUES ('8', 'Warfarin\r\n', 'Diminum', '-', '100');
INSERT INTO `obat` VALUES ('9', 'Penicillin\r\n', 'Diminum', '-', '100');

-- ----------------------------
-- Table structure for ref_resep
-- ----------------------------
DROP TABLE IF EXISTS `ref_resep`;
CREATE TABLE `ref_resep` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_resep` int(11) NOT NULL,
  `obat` varchar(255) NOT NULL,
  `dosis` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ref_resep
-- ----------------------------
INSERT INTO `ref_resep` VALUES ('1', '5', '5', '12');
INSERT INTO `ref_resep` VALUES ('2', '5', '6', '12');
INSERT INTO `ref_resep` VALUES ('3', '6', '5', '12');
INSERT INTO `ref_resep` VALUES ('4', '6', '6', '12');
INSERT INTO `ref_resep` VALUES ('5', '7', '5', '12');
INSERT INTO `ref_resep` VALUES ('6', '7', '3', '12');
INSERT INTO `ref_resep` VALUES ('7', '8', '5', '12');
INSERT INTO `ref_resep` VALUES ('8', '8', '3', '12');

-- ----------------------------
-- Table structure for resep
-- ----------------------------
DROP TABLE IF EXISTS `resep`;
CREATE TABLE `resep` (
  `id_resep` int(11) NOT NULL AUTO_INCREMENT,
  `nama_pasien` varchar(255) NOT NULL,
  `created_at` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_resep`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of resep
-- ----------------------------
INSERT INTO `resep` VALUES ('3', 'ow', '1514455345', '0');
INSERT INTO `resep` VALUES ('5', '12', '1514479378', '0');
INSERT INTO `resep` VALUES ('6', '12', '1514479386', '0');
INSERT INTO `resep` VALUES ('7', 'aw', '1514479398', '0');
INSERT INTO `resep` VALUES ('8', 'aw', '1514479430', '0');

-- ----------------------------
-- Table structure for user
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
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'NZLGRfv8Mj7RGVjzJ4jL3qVUDqj-5P9n', '$2y$13$aUA5CpFGDPp4JLEl7WEAauMLPvQpYtPMmNGGMg4GXTfT2K4Mj2yZ2', null, 'admin@ad.min', '10', '1512568699', '1512568699', '0');
INSERT INTO `user` VALUES ('2', 'dokter', 'Wt5CFI-5QBo5d4OFA-ileBnyutxmOiem', '$2y$13$aUA5CpFGDPp4JLEl7WEAauMLPvQpYtPMmNGGMg4GXTfT2K4Mj2yZ2', null, 'dokter@dok.ter', '10', '1514543545', '1514543545', '0');
