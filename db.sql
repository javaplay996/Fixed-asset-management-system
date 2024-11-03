/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - gudingzhichanguanli
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gudingzhichanguanli` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `gudingzhichanguanli`;

/*Table structure for table `baofei` */

DROP TABLE IF EXISTS `baofei`;

CREATE TABLE `baofei` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `zichan_name` varchar(255) DEFAULT NULL COMMENT '报废资产',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '报废时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='资产报废';

/*Data for the table `baofei` */

insert  into `baofei`(`id`,`zichan_name`,`insert_time`,`create_time`) values (1,'资产1','2021-04-06 16:00:52','2021-04-06 16:00:52'),(2,'资产2','2021-04-06 16:07:34','2021-04-06 16:07:34');

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'picture1','http://localhost:8080/gongchengcailiao/upload/1614999756013.jpg'),(2,'picture2','http://localhost:8080/gongchengcailiao/upload/1614999769770.jpg'),(3,'picture3','http://localhost:8080/gongchengcailiao/upload/1614999778981.jpg'),(6,'homepage',NULL);

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` tinyint(4) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`create_time`) values (1,'sex_types','性别',1,'男',NULL,'2021-04-06 15:31:55'),(2,'sex_types','性别',2,'女',NULL,'2021-04-06 15:31:55'),(3,'bumen_types','所属部门名称',1,'部门1',NULL,'2021-04-06 15:31:55'),(4,'bumen_types','所属部门名称',2,'部门2',NULL,'2021-04-06 15:31:55'),(5,'bumen_types','所属部门名称',3,'部门3',NULL,'2021-04-06 15:31:55'),(6,'zichan_types','资产分类名称',1,'资产分类1',NULL,'2021-04-06 15:31:55'),(7,'zichan_types','资产分类名称',2,'资产分类2',NULL,'2021-04-06 15:31:55'),(8,'zichan_types','资产分类名称',3,'资产分类3',NULL,'2021-04-06 15:31:55'),(9,'bumen_types','所属部门名称',4,'部门4',NULL,'2021-04-06 16:06:43'),(10,'zichan_types','资产分类名称',4,'资产分类4',NULL,'2021-04-06 16:06:52');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1,'admin','users','管理员','ix3nxdd4xmmw2ld2l796d2njotscs4p4','2021-04-06 15:34:42','2021-04-06 17:03:05'),(2,1,'111','yonghu','用户','1yiclvsojjdyp30ekrxj0xmhhdu10fn7','2021-04-06 16:07:48','2021-04-06 17:07:49');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','admin','管理员','2021-02-25 15:59:12');

/*Table structure for table `weixiu` */

DROP TABLE IF EXISTS `weixiu`;

CREATE TABLE `weixiu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `zichan_id` int(11) DEFAULT NULL COMMENT '维修资产',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '负责员工',
  `weixiu_money` decimal(10,4) DEFAULT NULL COMMENT '维修费用',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '维修时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='资产维修';

/*Data for the table `weixiu` */

insert  into `weixiu`(`id`,`zichan_id`,`yonghu_id`,`weixiu_money`,`insert_time`,`create_time`) values (2,3,2,'1000.0000','2021-04-06 16:07:04','2021-04-06 16:07:04');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '学生姓名  Search111 ',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别',
  `bumen_types` int(11) DEFAULT NULL COMMENT '所属部门名称',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '身份证号  Search111 ',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '手机号 Search111 ',
  `yonghu_photo` varchar(200) DEFAULT NULL COMMENT '照片',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='员工';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`username`,`password`,`yonghu_name`,`sex_types`,`bumen_types`,`yonghu_id_number`,`yonghu_phone`,`yonghu_photo`,`create_time`) values (1,'111','123456','员工1',2,3,'410882194511212121','17745544545','http://localhost:8080/gudingzhichanguanli/file/download?fileName=1617695062189.jpg','2021-04-06 15:44:24'),(2,'222','123456','员工2',1,2,'410882199902121211','17748844544','http://localhost:8080/gudingzhichanguanli/file/download?fileName=1617696309695.jpg','2021-04-06 16:05:10');

/*Table structure for table `zhejiu` */

DROP TABLE IF EXISTS `zhejiu`;

CREATE TABLE `zhejiu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `zichan_id` int(11) DEFAULT NULL COMMENT '资产名称',
  `weixiu_zhejiu` varchar(255) DEFAULT NULL COMMENT '折旧程度',
  `weixiu_content` varchar(200) DEFAULT NULL COMMENT '详细信息',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='资产折旧';

/*Data for the table `zhejiu` */

insert  into `zhejiu`(`id`,`zichan_id`,`weixiu_zhejiu`,`weixiu_content`,`create_time`) values (1,3,'2%','详细信息2\r\n','2021-04-06 16:07:24');

/*Table structure for table `zichan` */

DROP TABLE IF EXISTS `zichan`;

CREATE TABLE `zichan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `zichan_name` varchar(255) DEFAULT NULL COMMENT '资产名称 Search111',
  `zichan_types` int(11) DEFAULT NULL COMMENT '资产分类 Search111',
  `bumen_types` int(11) DEFAULT NULL COMMENT '所属部门 Search111',
  `zichan_guige` varchar(255) DEFAULT NULL COMMENT '规格型号 ',
  `zichan_changjia` varchar(255) DEFAULT NULL COMMENT '生产厂家 ',
  `zichan_baoyang` varchar(255) DEFAULT NULL COMMENT '保养周期 ',
  `zichan_money` decimal(10,4) DEFAULT NULL COMMENT '购买价格',
  `zichan_content` varchar(200) DEFAULT NULL COMMENT '详细信息',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='资产';

/*Data for the table `zichan` */

insert  into `zichan`(`id`,`zichan_name`,`zichan_types`,`bumen_types`,`zichan_guige`,`zichan_changjia`,`zichan_baoyang`,`zichan_money`,`zichan_content`,`create_time`) values (2,'资产1',2,1,'规格型号1','生产厂家1','保养周期1','1.1000','详细信息1\r\n','2021-04-06 16:06:04');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
