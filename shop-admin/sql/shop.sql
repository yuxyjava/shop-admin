/*
SQLyog Enterprise - MySQL GUI v7.13 
MySQL - 5.6.26-log : Database - fh_1902
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`fh_1902` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `fh_1902`;

/*Table structure for table `t_area` */

DROP TABLE IF EXISTS `t_area`;

CREATE TABLE `t_area` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `areaName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fatherId` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_area` */

insert  into `t_area`(`id`,`areaName`,`fatherId`) values (1,'河南省',0),(2,'河北省',0),(3,'山东省',0),(5,'洛阳市',1),(9,'石家庄',2),(11,'青岛',3),(12,'济南',3),(17,'青岛666',11),(18,'济南1',12),(19,'新疆',0);

/*Table structure for table `t_brand` */

DROP TABLE IF EXISTS `t_brand`;

CREATE TABLE `t_brand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brandName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hot` int(11) DEFAULT '0',
  `sort` int(11) DEFAULT '0',
  `logo` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_brand` */

insert  into `t_brand`(`id`,`brandName`,`hot`,`sort`,`logo`) values (2,'华为',0,100,NULL),(3,'联想',0,0,NULL),(4,'苹果',1,7,NULL),(5,'Vivo',1,6,NULL),(6,'Oppo',0,0,NULL),(7,'格力',0,3,'/images/92fcf0ef-ae1c-4a5b-9b60-b5238700266d.jpg'),(8,'海尔fff',0,99,'/images/85212502-e3d3-429e-8c1d-7e1ad20976bf.jpg');

/*Table structure for table `t_category` */

DROP TABLE IF EXISTS `t_category`;

CREATE TABLE `t_category` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fatherId` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_category` */

insert  into `t_category`(`id`,`categoryName`,`fatherId`) values (0,'分类管理',-1),(1,'家用电器',0),(2,'手机/运营商/数码',0),(3,'电视',1),(4,'空调',1),(5,'超薄电视',3),(6,'全面屏电视',3),(7,'智能电视',3),(8,'挂机空调',4),(9,'中央空调',4),(10,'手机通讯',2),(11,'手机',10),(12,'游戏手机',10),(13,'老年机',10),(14,'摄影摄像',2),(15,'数码相机',14),(16,'单反相机',14),(17,'电脑/办公',0),(18,'电脑整机',17),(19,'笔记本',18),(20,'游戏本',18),(21,'平板电脑',18),(22,'电脑配件',17),(23,'cpu',22),(24,'主板',22),(25,'硬盘',22),(26,'内存',22),(27,'机箱',22),(28,'外设产品',17),(29,'鼠标',28),(30,'键盘',28),(33,'男装/女装',0),(34,'男装',33),(35,'女装',33),(36,'T恤',34),(37,'牛仔裤',34),(38,'连衣裙',35),(39,'卫衣',35),(40,'风衣',34),(41,'夹克',34),(42,'hh',35);

/*Table structure for table `t_log` */

DROP TABLE IF EXISTS `t_log`;

CREATE TABLE `t_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `realName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currDate` datetime DEFAULT NULL,
  `info` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `errorMsg` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `detail` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_log` */

insert  into `t_log`(`id`,`userName`,`realName`,`currDate`,`info`,`status`,`errorMsg`,`detail`,`content`) values (1,'admin','张三丰','2019-09-08 17:31:47','执行了com.fh.shop.admin.controller.resource.ResourceController的add方法成功！！！',1,'',NULL,NULL),(2,'admin','张三丰','2019-09-08 17:32:51','执行了com.fh.shop.admin.controller.user.UserController的updateUser方法失败！！！',0,'*********',NULL,NULL),(3,'admin','张三丰','2019-09-08 17:34:19','执行了com.fh.shop.admin.controller.role.RoleController的update方法成功！！！',1,'',NULL,NULL),(4,'zhangsan','张三','2019-09-08 17:34:38','执行了com.fh.shop.admin.controller.resource.ResourceController的deleteBatch方法成功！！！',1,'',NULL,NULL),(5,'admin','张三丰','2019-09-09 11:46:28','执行了com.fh.shop.admin.controller.resource.ResourceController的add方法成功！！！',1,'',NULL,NULL),(6,'admin','张三丰','2019-09-09 11:46:37','执行了com.fh.shop.admin.controller.role.RoleController的update方法成功！！！',1,'',NULL,NULL),(7,'admin','张三丰','2019-09-09 11:47:07','执行了com.fh.shop.admin.controller.resource.ResourceController的update方法成功！！！',1,'',NULL,NULL),(8,'admin','张三丰','2019-09-09 12:24:29','执行了com.fh.shop.admin.controller.user.UserController的deleteUser方法成功！！！',1,'',NULL,NULL),(9,'admin','张三丰','2019-09-09 12:24:37','执行了com.fh.shop.admin.controller.user.UserController的deleteUser方法成功！！！',1,'',NULL,NULL),(10,'admin','张三丰','2019-09-09 12:52:16','执行了com.fh.shop.admin.controller.user.UserController的deleteUser方法成功！！！',1,'','id=24',NULL),(11,'admin','张三丰','2019-09-09 12:53:05','执行了com.fh.shop.admin.controller.user.UserController的add方法成功！！！',1,'','userName=uuurealName=游游password=111age=22sex=1salary=30000phone=12143324email=ww@126.comentryTime=2019-09-12roleIds=2,6,25',NULL),(12,'admin','张三丰','2019-09-09 12:54:42','执行了com.fh.shop.admin.controller.resource.ResourceController的add方法成功！！！',1,'','|fatherId=1|menuName=测试999|url=/user/9999|type=1',NULL),(13,'admin','张三丰','2019-09-09 16:53:53','执行了com.fh.shop.admin.controller.user.UserController的deleteUser方法成功！！！',1,'','|id=29','删除用户'),(14,'admin','张三丰','2019-09-09 16:54:00','执行了com.fh.shop.admin.controller.user.UserController的deleteBatch方法成功！！！',1,'','|userIds[]=23,22','批量删除用户'),(15,'admin','张三丰','2019-09-09 16:54:24','执行了com.fh.shop.admin.controller.user.UserController的add方法成功！！！',1,'','|userName=dd|realName=11|password=11|age=|salary=|phone=|email=|entryTime=|roleIds=','添加用户'),(16,'admin','张三丰','2019-09-09 17:01:07','执行了com.fh.shop.admin.controller.user.UserController的deleteUser方法成功！！！',1,'','|id=30','删除用户'),(17,'admin','张三丰','2019-09-11 15:57:50','执行了com.fh.shop.admin.controller.user.UserController的updateUserStatus方法成功！！！',1,'','|id=18','解锁用户'),(18,'admin','张三丰','2019-09-10 16:04:10','执行了com.fh.shop.admin.controller.user.UserController的updateUser方法失败！！！',0,'*********','|userName=zhangsan|realName=张三|password=3b7f848e7e2b66528f2eba93c421007a|id=18|age=22|phone=|email=|salary=|entryTime=|sex=0|roleIds=2,3,4',''),(19,'admin','张三丰','2019-09-10 16:05:13','执行了com.fh.shop.admin.controller.user.UserController的updateUser方法失败！！！',0,'*********','|userName=zhangsan|realName=张三|password=3b7f848e7e2b66528f2eba93c421007a|id=18|age=22|phone=|email=|salary=|entryTime=|sex=0|roleIds=2,3,4',''),(20,'admin','张三丰','2019-09-10 16:12:29','执行了com.fh.shop.admin.controller.user.UserController的updateUser方法成功！！！',1,'','|userName=zhangsan|realName=张三|password=3b7f848e7e2b66528f2eba93c421007a|id=18|age=22|phone=|email=|salary=|entryTime=|sex=0|roleIds=2,3,4',''),(21,'zhangsan','张三','2019-09-10 17:34:31','执行了com.fh.shop.admin.controller.user.UserController的updatePassword方法成功！！！',1,'','|userId=18|oldPassword=|newPassword=|confirmPassword=','修改密码'),(22,'zhangsan','张三','2019-09-10 17:38:50','执行了com.fh.shop.admin.controller.user.UserController的updatePassword方法成功！！！',1,'','|userId=18|oldPassword=|newPassword=|confirmPassword=','修改密码'),(23,'admin','张三丰','2019-09-10 17:41:45','执行了com.fh.shop.admin.controller.role.RoleController的update方法成功！！！',1,'','|id=1|roleName=管理员|ids[]=1,17,18,27,28,29,30,31,19,32,33,34,35,20,23,24,39,40,41,25,42,43,26,45',''),(24,'zhangsan','张三','2019-09-10 17:43:59','执行了com.fh.shop.admin.controller.user.UserController的updatePassword方法成功！！！',1,'','|userId=18|oldPassword=|newPassword=|confirmPassword=','修改密码'),(25,'zhangsan','张三','2019-09-10 17:44:05','执行了com.fh.shop.admin.controller.user.UserController的updatePassword方法成功！！！',1,'','|userId=18|oldPassword=sdsdsdsd|newPassword=|confirmPassword=','修改密码'),(26,'zhangsan','张三','2019-09-10 17:44:12','执行了com.fh.shop.admin.controller.user.UserController的updatePassword方法成功！！！',1,'','|userId=18|oldPassword=sdsdsdsd|newPassword=111|confirmPassword=111','修改密码'),(27,'zhangsan','张三','2019-09-10 17:44:49','执行了com.fh.shop.admin.controller.user.UserController的updatePassword方法成功！！！',1,'','|userId=18|oldPassword=sdsdsdsd|newPassword=111|confirmPassword=111','修改密码'),(28,'zhangsan','张三','2019-09-10 17:45:06','执行了com.fh.shop.admin.controller.user.UserController的updatePassword方法成功！！！',1,'','|userId=18|oldPassword=123456|newPassword=111|confirmPassword=111','修改密码'),(29,'zhangsan','张三','2019-09-10 17:45:15','执行了com.fh.shop.admin.controller.user.UserController的updatePassword方法成功！！！',1,'','|userId=18|oldPassword=123456|newPassword=111|confirmPassword=111','修改密码'),(30,'zhangsan','张三','2019-09-10 17:46:06','执行了com.fh.shop.admin.controller.user.UserController的updatePassword方法成功！！！',1,'','|userId=18|oldPassword=123456|newPassword=111|confirmPassword=111','修改密码'),(31,'zhangsan','张三','2019-09-10 17:48:29','执行了com.fh.shop.admin.controller.user.UserController的updatePassword方法成功！！！',1,'','|userId=18|oldPassword=123456|newPassword=111|confirmPassword=111','修改密码'),(32,'admin','张三丰','2019-09-10 17:53:21','执行了com.fh.shop.admin.controller.user.UserController的deleteBatch方法失败！！！',0,'*********','|userIds[]=21,20','批量删除用户'),(33,'admin','张三丰','2019-09-11 09:53:48','执行了com.fh.shop.admin.controller.user.UserController的updateUser方法成功！！！',1,'','|userName=t1ttt|realName=t1|password=0a447f2c11321cb6bf5acb9ab2c5943c|id=21|age=22|phone=|email=|salary=|entryTime=|sex=1|roleIds=3,5,6',''),(34,'admin','张三丰','2019-09-11 09:53:59','执行了com.fh.shop.admin.controller.user.UserController的updatePassword方法成功！！！',1,'','|userId=20|oldPassword=|newPassword=|confirmPassword=','修改密码'),(35,'admin','张三丰','2019-09-11 10:35:43','执行了com.fh.shop.admin.controller.user.UserController的updatePassword方法成功！！！',1,'','|userId=20|oldPassword=|newPassword=|confirmPassword=','修改密码'),(36,'admin','张三丰','2019-09-11 11:14:09','执行了com.fh.shop.admin.controller.user.UserController的resetUserPassword方法成功！！！',1,'','|id=18','重置用户密码'),(37,'admin','张三丰','2019-09-11 11:15:51','执行了com.fh.shop.admin.controller.user.UserController的resetUserPassword方法成功！！！',1,'','|id=10000000','重置用户密码'),(38,'zhangsan','张三','2019-09-11 11:19:15','执行了com.fh.shop.admin.controller.user.UserController的resetUserPassword方法成功！！！',1,'','|id=20','重置用户密码'),(39,'admin','张三丰','2019-09-11 11:21:20','执行了com.fh.shop.admin.controller.resource.ResourceController的add方法成功！！！',1,'','|fatherId=24|menuName=解锁|url=/user/updateUserStatus.jhtml|type=2',''),(40,'admin','张三丰','2019-09-11 11:21:38','执行了com.fh.shop.admin.controller.resource.ResourceController的add方法成功！！！',1,'','|fatherId=24|menuName=重置密码|url=/user/resetUserPassword.jhtml|type=2',''),(41,'admin','张三丰','2019-09-11 11:21:51','执行了com.fh.shop.admin.controller.role.RoleController的update方法成功！！！',1,'','|id=1|roleName=管理员|ids[]=1,17,18,27,28,29,30,31,19,32,33,34,35,20,23,24,39,40,41,47,48,25,42,43,26,45',''),(42,'admin','张三丰','2019-09-11 11:22:23','执行了com.fh.shop.admin.controller.user.UserController的resetUserPassword方法成功！！！',1,'','|id=20','重置用户密码'),(43,'admin','张三丰','2019-09-11 12:48:28','执行了com.fh.shop.admin.controller.user.UserController的updateUser方法成功！！！',1,'','|userName=zhangsan|realName=张三|id=18|age=22|phone=|email=532028476@qq.com|salary=|entryTime=|sex=0|roleIds=2,3,4',''),(44,'admin','张三丰','2019-09-11 12:48:48','执行了com.fh.shop.admin.controller.user.UserController的resetUserPassword方法成功！！！',1,'','|id=21','重置用户密码'),(45,'admin','张三丰','2019-09-11 12:49:22','执行了com.fh.shop.admin.controller.user.UserController的updateUser方法成功！！！',1,'','|userName=t1|realName=t1|id=21|age=22|phone=|email=784510419@qq.com|salary=|entryTime=|sex=1|roleIds=3,5,6',''),(46,'admin','张三丰','2019-09-12 15:51:13','执行了com.fh.shop.admin.controller.user.UserController的deleteUser方法成功！！！',1,'','|id=21','删除用户'),(47,'admin','张三丰','2019-09-12 16:29:24','执行了com.fh.shop.admin.controller.user.UserController的add方法成功！！！',1,'','|userName=tt1|realName=|password=|age=|salary=|phone=|email=|entryTime=|roleIds=','添加用户'),(48,'admin','张三丰','2019-09-15 18:23:02','执行了com.fh.shop.admin.controller.user.UserController的add方法成功！！！',1,'','|userName=sysadmin|realName=小南|password=111|age=34|sex=1|salary=|phone=|email=|entryTime=|roleIds=2,6','添加用户'),(49,'admin','张三丰','2019-09-15 18:23:53','执行了com.fh.shop.admin.controller.role.RoleController的update方法成功！！！',1,'','|id=2|roleName=商品维护人|ids[]=1,17,18,19,20',''),(50,'admin','张三丰','2019-09-15 18:24:26','执行了com.fh.shop.admin.controller.resource.ResourceController的add方法成功！！！',1,'','|fatherId=20|menuName=删除1|url=/s/f/safd|type=1',''),(51,'admin','张三丰','2019-09-15 18:24:36','执行了com.fh.shop.admin.controller.resource.ResourceController的add方法成功！！！',1,'','|fatherId=49|menuName=删除11|url=/s/df/sdf|type=1',''),(52,'admin','张三丰','2019-09-15 18:24:46','执行了com.fh.shop.admin.controller.resource.ResourceController的add方法成功！！！',1,'','|fatherId=50|menuName=删除111|url=/s/dfs/a|type=1',''),(53,'admin','张三丰','2019-09-15 18:26:05','执行了com.fh.shop.admin.controller.role.RoleController的update方法成功！！！',1,'','|id=1|roleName=管理员|ids[]=1,17,18,27,28,29,30,31,19,32,33,34,35,20,49,50,51,23,24,39,40,41,47,48,25,42,43,26,45',''),(54,'sysadmin','小南','2019-09-15 18:26:50','执行了com.fh.shop.admin.controller.resource.ResourceController的deleteBatch方法成功！！！',1,'','|ids[]=46',''),(55,'sysadmin','小南','2019-09-15 18:28:33','执行了com.fh.shop.admin.controller.user.UserController的updatePassword方法成功！！！',1,'','|userId=25|oldPassword=|newPassword=|confirmPassword=','修改密码'),(56,'sysadmin','小南','2019-09-15 18:28:37','执行了com.fh.shop.admin.controller.user.UserController的updatePassword方法成功！！！',1,'','|userId=25|oldPassword=sdfsdf|newPassword=|confirmPassword=','修改密码'),(57,'sysadmin','小南','2019-09-15 18:28:49','执行了com.fh.shop.admin.controller.user.UserController的updatePassword方法成功！！！',1,'','|userId=25|oldPassword=sdfsdf|newPassword=222222|confirmPassword=222222','修改密码'),(58,'sysadmin','小南','2019-09-15 18:29:01','执行了com.fh.shop.admin.controller.user.UserController的updatePassword方法成功！！！',1,'','|userId=25|oldPassword=111|newPassword=222222|confirmPassword=222222','修改密码'),(59,'admin','张三丰','2019-09-15 18:31:20','执行了com.fh.shop.admin.controller.user.UserController的updateUserStatus方法成功！！！',1,'','|id=25','解锁用户'),(60,'zhangsan','张三','2019-09-15 18:33:16','执行了com.fh.shop.admin.controller.user.UserController的updatePassword方法成功！！！',1,'','|userId=18|oldPassword=26eW38|newPassword=111111|confirmPassword=111111','修改密码'),(61,'admin','张三丰','2019-09-15 18:38:45','执行了com.fh.shop.admin.controller.user.UserController的resetUserPassword方法成功！！！',1,'','|id=18','重置用户密码'),(62,'admin','张三丰','2019-09-16 12:37:46','执行了com.fh.shop.admin.controller.user.UserController的add方法成功！！！',1,'','|userName=ceshi|realName=测试|password=111|age=|salary=|phone=|email=|entryTime=|roleIds=3,6','添加用户'),(63,'admin','张三丰','2019-09-16 12:37:57','执行了com.fh.shop.admin.controller.user.UserController的deleteUser方法成功！！！',1,'','|id=26','删除用户'),(64,'admin','张三丰','2019-09-16 16:08:20','执行了com.fh.shop.admin.controller.role.RoleController的update方法成功！！！',1,'','|id=1|roleName=管理员|ids[]=1,17,18,27,28,29,30,31,19,32,33,34,35,20,49,50,51,21,22,23,24,39,40,41,47,48,25,42,43,44,26,45',''),(65,'admin','张三丰','2019-09-16 16:08:38','执行了com.fh.shop.admin.controller.resource.ResourceController的deleteBatch方法成功！！！',1,'','|ids[]=18,27,28,29,30,31,19,32,33,34,35,20,49,50,51',''),(66,'admin','张三丰','2019-09-16 16:08:48','执行了com.fh.shop.admin.controller.resource.ResourceController的update方法成功！！！',1,'','|id=17|menuName=商品管理|url=/product/index.jhtml|type=1',''),(67,'admin','张三丰','2019-09-16 16:30:59','执行了com.fh.shop.admin.controller.product.ProductController的add方法成功！！！',1,'','|productName=华为p20|price=4000|createDate=2019-09-05',''),(68,'admin','张三丰','2019-09-16 17:12:32','执行了com.fh.shop.admin.controller.product.ProductController的add方法成功！！！',1,'','|productName=tt|price=4000|createDate=2019-09-11',''),(69,'admin','张三丰','2019-09-16 17:12:35','执行了com.fh.shop.admin.controller.product.ProductController的delete方法成功！！！',1,'','|id=8',''),(70,'admin','张三丰','2019-09-17 09:58:20','执行了com.fh.shop.admin.controller.product.ProductController的add方法成功！！！',1,'','|productName=小米9|price=3000|createDate=2019-09-05',''),(71,'admin','张三丰','2019-09-17 09:58:46','执行了com.fh.shop.admin.controller.product.ProductController的add方法成功！！！',1,'','|productName=苹果9s|price=4500|createDate=2019-09-28',''),(72,'admin','张三丰','2019-09-17 09:58:52','执行了com.fh.shop.admin.controller.product.ProductController的delete方法成功！！！',1,'','|id=6',''),(73,'admin','张三丰','2019-09-17 10:20:53','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=苹果10s|price=6000|createDate=2019-09-28|id=9',''),(74,'admin','张三丰','2019-09-17 10:24:36','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=苹果10s|price=6000|createDate=2019-09-26|id=9',''),(75,'admin','张三丰','2019-09-17 11:00:08','执行了com.fh.shop.admin.controller.product.ProductController的updateProductStatus方法成功！！！',1,'','|id=9|status=1',''),(76,'admin','张三丰','2019-09-17 11:00:09','执行了com.fh.shop.admin.controller.product.ProductController的updateProductStatus方法成功！！！',1,'','|id=7|status=1',''),(77,'admin','张三丰','2019-09-17 11:04:23','执行了com.fh.shop.admin.controller.product.ProductController的add方法成功！！！',1,'','|productName=小米10|price=2300|createDate=2019-09-06',''),(78,'admin','张三丰','2019-09-17 11:04:33','执行了com.fh.shop.admin.controller.product.ProductController的updateProductStatus方法成功！！！',1,'','|id=10|status=1',''),(79,'admin','张三丰','2019-09-17 11:30:53','执行了com.fh.shop.admin.controller.product.ProductController的add方法失败！！！',0,'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.IllegalStateException: Type handler was null on parameter mapping for property \'brand\'. It was either not specified and/or could not be found for the javaType (com.fh.shop.admin.po.brand.Brand) : jdbcType (null) combination.\r\n### The error may exist in com/fh/shop/admin/mapper/product/IProductMapper.java (best guess)\r\n### The error may involve com.fh.shop.admin.mapper.product.IProductMapper.insert\r\n### The error occurred while executing an update\r\n### Cause: java.lang.IllegalStateException: Type handler was null on parameter mapping for property \'brand\'. It was either not specified and/or could not be found for the javaType (com.fh.shop.admin.po.brand.Brand) : jdbcType (null) combination.','|productName=kk|price=2000|createDate=2019-09-12',''),(80,'admin','张三丰','2019-09-17 11:58:30','执行了com.fh.shop.admin.controller.product.ProductController的add方法成功！！！',1,'','|productName=看看|price=4000|createDate=2019-09-19',''),(81,'admin','张三丰','2019-09-17 11:59:54','执行了com.fh.shop.admin.controller.product.ProductController的add方法成功！！！',1,'','|productName=ff|productPrice=4000|createDate=2019-09-05',''),(82,'admin','张三丰','2019-09-17 12:24:07','执行了com.fh.shop.admin.controller.product.ProductController的add方法成功！！！',1,'','|productName=cc|productPrice=4000|createDate=2019-09-11|brandId=4',''),(83,'admin','张三丰','2019-09-17 12:42:18','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=cc|price=4000|createDate=2019-09-11|brandId=2|id=16',''),(84,'admin','张三丰','2019-09-17 12:42:38','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=cc66|price=4008|createDate=2019-09-13|brandId=1|id=16',''),(85,'admin','张三丰','2019-09-17 12:42:48','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=cc66|price=4008|createDate=2019-09-13|brandId=1|id=16',''),(86,'admin','张三丰','2019-09-17 12:43:19','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=cc66|productPrice=4008|createDate=2019-09-13|brandId=3|id=16',''),(87,'admin','张三丰','2019-09-17 12:43:36','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=ff|productPrice=4000|createDate=2019-09-05|brandId=3|id=15',''),(88,'admin','张三丰','2019-09-17 12:43:39','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=看看|productPrice=|createDate=2019-09-19|brandId=4|id=14',''),(89,'admin','张三丰','2019-09-17 12:43:43','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=测试44|productPrice=260|createDate=2019-09-17|brandId=2|id=12',''),(90,'admin','张三丰','2019-09-17 12:43:48','执行了com.fh.shop.admin.controller.product.ProductController的updateProductStatus方法成功！！！',1,'','|id=12|status=1',''),(91,'admin','张三丰','2019-09-17 12:44:17','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=看看|productPrice=678|createDate=2019-09-19|brandId=4|id=14',''),(92,'admin','张三丰','2019-09-17 15:03:46','执行了com.fh.shop.admin.controller.resource.ResourceController的add方法成功！！！',1,'','|fatherId=25|menuName=菜单管理1|url=|type=1',''),(93,'admin','张三丰','2019-09-17 15:03:53','执行了com.fh.shop.admin.controller.resource.ResourceController的add方法成功！！！',1,'','|fatherId=49|menuName=菜单管理11|url=|type=1',''),(94,'admin','张三丰','2019-09-17 15:04:07','执行了com.fh.shop.admin.controller.resource.ResourceController的add方法成功！！！',1,'','|fatherId=50|menuName=菜单管理111|url=/user/a.jhtml|type=1',''),(95,'admin','张三丰','2019-09-17 15:04:33','执行了com.fh.shop.admin.controller.role.RoleController的update方法成功！！！',1,'','|id=1|roleName=管理员|ids[]=1,17,21,22,23,24,39,40,41,47,48,25,42,43,44,49,50,51,26,45',''),(96,'admin','张三丰','2019-09-17 15:06:07','执行了com.fh.shop.admin.controller.resource.ResourceController的deleteBatch方法成功！！！',1,'','|ids[]=49,50,51',''),(97,'admin','张三丰','2019-09-17 15:06:18','执行了com.fh.shop.admin.controller.role.RoleController的update方法成功！！！',1,'','|id=1|roleName=管理员|ids[]=1,17,21,22,23,24,39,40,41,47,48,25,42,43,44,26,45',''),(98,'admin','张三丰','2019-09-17 15:08:56','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=cc66|productPrice=4008|createDate=2019-09-13|brandId=1|id=16',''),(99,'admin','张三丰','2019-10-04 12:26:08','执行了com.fh.shop.admin.controller.product.ProductController的add方法成功！！！',1,'','|productName=飞狐1902|productPrice=2000|createDate=2019-10-10|brandId=3',''),(100,'admin','张三丰','2019-10-04 12:27:53','执行了com.fh.shop.admin.controller.product.ProductController的delete方法成功！！！',1,'','|id=4',''),(101,'admin','张三丰','2019-10-04 12:28:12','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=飞狐1902最新|productPrice=2000|createDate=2019-10-10|brandId=3|id=17',''),(102,'admin','张三丰','2019-10-06 15:16:28','执行了com.fh.shop.admin.controller.product.ProductController的add方法成功！！！',1,'','|productName=美的空调|productPrice=3000|createDate=2019-10-09|brandId=3',''),(103,'admin','张三丰','2019-10-06 15:17:00','执行了com.fh.shop.admin.controller.product.ProductController的delete方法成功！！！',1,'','|id=17',''),(104,'admin','张三丰','2019-10-06 15:52:51','执行了com.fh.shop.admin.controller.product.ProductController的updateProductStatus方法成功！！！',1,'','|id=18|status=1',''),(105,'admin','张三丰','2019-10-06 15:52:58','执行了com.fh.shop.admin.controller.product.ProductController的updateProductStatus方法成功！！！',1,'','|id=16|status=1',''),(106,'admin','张三丰','2019-10-06 15:53:03','执行了com.fh.shop.admin.controller.product.ProductController的updateProductStatus方法成功！！！',1,'','|id=16|status=0',''),(107,'admin','张三丰','2019-10-06 16:22:11','执行了com.fh.shop.admin.controller.product.ProductController的updateProductStatus方法成功！！！',1,'','|id=22|status=1',''),(108,'admin','张三丰','2019-10-07 10:40:36','执行了com.fh.shop.admin.controller.resource.ResourceController的update方法成功！！！',1,'','|id=21|menuName=品牌管理|url=/brand/index.jhtml|type=1',''),(109,'admin','张三丰','2019-10-07 12:05:25','执行了com.fh.shop.admin.controller.brand.BrandController的updateBrandHot方法成功！！！',1,'','|id=5|hot=1',''),(110,'admin','张三丰','2019-10-07 12:05:28','执行了com.fh.shop.admin.controller.brand.BrandController的updateBrandHot方法成功！！！',1,'','|id=3|hot=1',''),(111,'admin','张三丰','2019-10-07 12:05:30','执行了com.fh.shop.admin.controller.brand.BrandController的updateBrandHot方法成功！！！',1,'','|id=6|hot=0',''),(112,'admin','张三丰','2019-10-07 12:12:48','执行了com.fh.shop.admin.controller.brand.BrandController的updateBrandHot方法成功！！！',1,'','|id=3|hot=0',''),(113,'admin','张三丰','2019-10-07 12:12:55','执行了com.fh.shop.admin.controller.brand.BrandController的updateBrandHot方法成功！！！',1,'','|id=4|hot=1',''),(114,'admin','张三丰','2019-10-07 12:42:30','执行了com.fh.shop.admin.controller.brand.BrandController的updateBrandSort方法成功！！！',1,'','|id=5|sort=6',''),(115,'admin','张三丰','2019-10-07 12:43:57','执行了com.fh.shop.admin.controller.brand.BrandController的updateBrandSort方法成功！！！',1,'','|id=4|sort=7',''),(116,'admin','张三丰','2019-10-07 16:01:01','执行了com.fh.shop.admin.controller.brand.BrandController的updateBrandSort方法成功！！！',1,'','|id=1|sort=10',''),(117,'admin','张三丰','2019-10-07 16:26:52','执行了com.fh.shop.admin.controller.brand.BrandController的updateBrandHot方法成功！！！',1,'','|id=2|hot=1',''),(118,'admin','张三丰','2019-10-07 16:26:56','执行了com.fh.shop.admin.controller.brand.BrandController的updateBrandSort方法成功！！！',1,'','|id=2|sort=12',''),(119,'admin','张三丰','2019-10-07 17:52:16','执行了com.fh.shop.admin.controller.product.ProductController的add方法成功！！！',1,'','|productName=|productPrice=|createDate=|brandId=-1',''),(120,'admin','张三丰','2019-10-07 19:40:19','执行了com.fh.shop.admin.controller.product.ProductController的add方法成功！！！',1,'','|productName=rr|productPrice=4000|createDate=2019-10-09|brandId=3|mainImage=/images/22ac84bd-40df-4e70-bc01-07be05e4ba34.jpg',''),(121,'admin','张三丰','2019-10-07 19:52:41','执行了com.fh.shop.admin.controller.product.ProductController的add方法成功！！！',1,'','|productName=iphone9s|productPrice=5000|createDate=2019-10-24|brandId=4|mainImage=/images/ceba541e-6eba-4a30-af40-a7912d297540.jpg',''),(122,'admin','张三丰','2019-10-07 19:52:49','执行了com.fh.shop.admin.controller.product.ProductController的updateProductStatus方法成功！！！',1,'','|id=25|status=1',''),(123,'admin','张三丰','2019-10-07 19:59:01','执行了com.fh.shop.admin.controller.product.ProductController的updateProductStatus方法成功！！！',1,'','|id=24|status=1',''),(124,'admin','张三丰','2019-10-09 12:44:34','执行了com.fh.shop.admin.controller.brand.BrandController的add方法成功！！！',1,'','|brandName=格力|logo=/images/92fcf0ef-ae1c-4a5b-9b60-b5238700266d.jpg|sort=3|hot=1',''),(125,'admin','张三丰','2019-10-09 12:48:46','执行了com.fh.shop.admin.controller.brand.BrandController的add方法成功！！！',1,'','|brandName=海尔|logo=/images/85212502-e3d3-429e-8c1d-7e1ad20976bf.jpg|sort=9|hot=1',''),(126,'admin','张三丰','2019-10-09 17:00:51','执行了com.fh.shop.admin.controller.brand.BrandController的updateBrandHot方法成功！！！',1,'','|id=7|hot=0',''),(127,'admin','张三丰','2019-10-09 17:24:43','执行了com.fh.shop.admin.controller.product.ProductController的updateProductStatus方法成功！！！',1,'','|id=25|status=0',''),(128,'admin','张三丰','2019-10-09 17:40:45','执行了com.fh.shop.admin.controller.product.ProductController的updateProductStatus方法成功！！！',1,'','|id=25|status=1',''),(129,'admin','张三丰','2019-10-10 11:51:52','执行了com.fh.shop.admin.controller.product.ProductController的add方法成功！！！',1,'','|productName=dd|productPrice=4000|createDate=2019-10-01|brandId=2|mainImage=/images/f917f04f-d30e-4638-b0d0-3d4ad7f7b096.jpg|cate1=2|cate2=10|cate3=11',''),(130,'admin','张三丰','2019-10-10 11:54:58','执行了com.fh.shop.admin.controller.product.ProductController的add方法成功！！！',1,'','|productName=sfd|productPrice=4000|createDate=2019-10-17|brandId=3|mainImage=/images/04b10111-5bb0-49f1-a619-c085c4a6c424.jpg|cate1=2|cate2=10|cate3=12',''),(131,'admin','张三丰','2019-10-10 11:56:01','执行了com.fh.shop.admin.controller.product.ProductController的add方法成功！！！',1,'','|productName=www|productPrice=4000|createDate=2019-10-16|brandId=3|mainImage=/images/168877f5-56f4-485a-ac91-f61adf3b12fc.jpg|cate1=17|cate2=18|cate3=19',''),(132,'admin','张三丰','2019-10-10 12:22:17','执行了com.fh.shop.admin.controller.product.ProductController的add方法成功！！！',1,'','|productName=bbb|productPrice=4000|createDate=2019-10-01|brandId=2|mainImage=/images/b9ee9dfc-7931-4232-9387-5704f899106c.jpg|cate1=1|cate2=3|cate3=5',''),(133,'admin','张三丰','2019-10-10 17:30:24','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=bbb|productPrice=4000.00|createDate=2019-10-01|brandId=2|id=29|cate1=1|cate2=4|cate3=9',''),(134,'admin','张三丰','2019-10-10 17:31:29','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=bbb33|productPrice=4000.00|createDate=2019-10-01|brandId=2|id=29',''),(135,'admin','张三丰','2019-10-10 17:31:54','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=bbb33|productPrice=4000.00|createDate=2019-10-01|brandId=2|id=29|cate1=17|cate2=18|cate3=19',''),(136,'admin','张三丰','2019-10-10 17:32:26','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=bbb33|productPrice=4000.00|createDate=2019-10-01|brandId=2|id=29|cate1=2|cate2=14|cate3=16',''),(137,'admin','张三丰','2019-10-10 17:32:41','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=wwwtt|productPrice=4000.00|createDate=2019-10-16|brandId=3|id=28',''),(138,'admin','张三丰','2019-10-10 17:33:06','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=bbb3366|productPrice=4000.00|createDate=2019-10-01|brandId=3|id=29',''),(139,'admin','张三丰','2019-10-10 17:33:20','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=wwwtt|productPrice=4000.00|createDate=2019-10-16|brandId=3|id=28|cate1=1|cate2=4|cate3=8',''),(140,'admin','张三丰','2019-10-10 17:33:46','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=wwwtt|productPrice=4000.00|createDate=2019-10-16|brandId=3|id=28|cate1=1|cate2=3|cate3=5',''),(141,'admin','张三丰','2019-10-10 17:40:23','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=bbb3366|productPrice=4000.00|createDate=2019-10-01|brandId=3|id=29|cate1=1|cate2=4|cate3=9',''),(142,'admin','张三丰','2019-10-10 17:40:32','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=bbb3366|productPrice=4000.00|createDate=2019-10-01|brandId=3|id=29',''),(143,'admin','张三丰','2019-10-10 17:40:40','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=sfd|productPrice=4000.00|createDate=2019-10-17|brandId=3|id=27|cate1=2|cate2=14|cate3=16',''),(144,'admin','张三丰','2019-10-10 17:45:51','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=dd|productPrice=4000.00|createDate=2019-10-01|brandId=2|id=26|cate1=17|cate2=18|cate3=19',''),(145,'admin','张三丰','2019-10-10 17:45:59','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=iphone9s|productPrice=5000.00|createDate=2019-10-24|brandId=4|id=25|cate1=2|cate2=10|cate3=11',''),(146,'admin','张三丰','2019-10-10 17:55:24','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=bbb3366|productPrice=4000.00|createDate=2019-10-01|brandId=3|id=29|cate1=1|cate2=3|cate3=-1',''),(147,'admin','张三丰','2019-10-11 10:03:45','执行了com.fh.shop.admin.controller.resource.ResourceController的add方法成功！！！',1,'','|fatherId=1|menuName=分类管理|url=/category/index.jhtml|type=1',''),(148,'admin','张三丰','2019-10-11 10:04:03','执行了com.fh.shop.admin.controller.role.RoleController的update方法成功！！！',1,'','|id=1|roleName=管理员|ids[]=1,17,21,22,23,24,39,40,41,47,48,25,42,43,44,26,45,49',''),(149,'admin','张三丰','2019-10-11 10:12:58','执行了com.fh.shop.admin.controller.category.CategoryController的add方法成功！！！',1,'','|fatherId=18|categoryName=游戏本',''),(150,'admin','张三丰','2019-10-11 10:13:58','执行了com.fh.shop.admin.controller.category.CategoryController的add方法成功！！！',1,'','|fatherId=18|categoryName=平板电脑',''),(151,'admin','张三丰','2019-10-11 10:14:21','执行了com.fh.shop.admin.controller.category.CategoryController的add方法成功！！！',1,'','|fatherId=17|categoryName=电脑配件',''),(152,'admin','张三丰','2019-10-11 10:14:31','执行了com.fh.shop.admin.controller.category.CategoryController的add方法成功！！！',1,'','|fatherId=22|categoryName=cpu',''),(153,'admin','张三丰','2019-10-11 10:14:36','执行了com.fh.shop.admin.controller.category.CategoryController的add方法成功！！！',1,'','|fatherId=22|categoryName=主板',''),(154,'admin','张三丰','2019-10-11 10:18:49','执行了com.fh.shop.admin.controller.category.CategoryController的add方法成功！！！',1,'','|fatherId=22|categoryName=硬盘',''),(155,'admin','张三丰','2019-10-11 10:53:10','执行了com.fh.shop.admin.controller.category.CategoryController的add方法成功！！！',1,'','|fatherId=22|categoryName=内存',''),(156,'admin','张三丰','2019-10-11 10:56:10','执行了com.fh.shop.admin.controller.category.CategoryController的add方法成功！！！',1,'','|fatherId=22|categoryName=机箱',''),(157,'admin','张三丰','2019-10-11 11:14:24','执行了com.fh.shop.admin.controller.category.CategoryController的add方法成功！！！',1,'','|fatherId=17|categoryName=外设产品',''),(158,'admin','张三丰','2019-10-11 11:14:30','执行了com.fh.shop.admin.controller.category.CategoryController的add方法成功！！！',1,'','|fatherId=28|categoryName=鼠标',''),(159,'admin','张三丰','2019-10-11 11:14:39','执行了com.fh.shop.admin.controller.category.CategoryController的add方法成功！！！',1,'','|fatherId=28|categoryName=键盘',''),(160,'admin','张三丰','2019-10-11 12:54:30','执行了com.fh.shop.admin.controller.category.CategoryController的add方法成功！！！',1,'','|fatherId=0|categoryName=男装/女装',''),(161,'admin','张三丰','2019-10-11 12:54:47','执行了com.fh.shop.admin.controller.category.CategoryController的add方法成功！！！',1,'','|fatherId=33|categoryName=男装',''),(162,'admin','张三丰','2019-10-11 12:54:52','执行了com.fh.shop.admin.controller.category.CategoryController的add方法成功！！！',1,'','|fatherId=33|categoryName=女装',''),(163,'admin','张三丰','2019-10-11 12:55:12','执行了com.fh.shop.admin.controller.category.CategoryController的add方法成功！！！',1,'','|fatherId=34|categoryName=T恤',''),(164,'admin','张三丰','2019-10-11 12:55:18','执行了com.fh.shop.admin.controller.category.CategoryController的add方法成功！！！',1,'','|fatherId=34|categoryName=牛仔裤',''),(165,'admin','张三丰','2019-10-11 12:55:37','执行了com.fh.shop.admin.controller.category.CategoryController的add方法成功！！！',1,'','|fatherId=35|categoryName=连衣裙',''),(166,'admin','张三丰','2019-10-11 12:55:41','执行了com.fh.shop.admin.controller.category.CategoryController的add方法成功！！！',1,'','|fatherId=35|categoryName=卫衣',''),(167,'admin','张三丰','2019-10-17 11:51:11','执行了com.fh.shop.admin.controller.product.ProductController的add方法成功！！！',1,'','|productName=vvvv|productPrice=4000|createDate=2019-10-08|brandId=3|mainImage=/images/1b638dcb-5a76-4f0b-99e1-ed7eb8023a98.jpg|cate1=1|cate2=3|cate3=6',''),(168,'admin','张三丰','2019-10-17 11:58:23','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=vvvv|productPrice=4000.00|createDate=2019-10-08|brandId=3|id=33|cate1=2|cate2=10|cate3=11',''),(169,'admin','张三丰','2019-10-17 11:58:34','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=vvvvtt|productPrice=4000.00|createDate=2019-10-08|brandId=3|id=33|cate1=33|cate2=35|cate3=38',''),(170,'admin','张三丰','2019-10-17 12:32:24','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=vvvvtt|productPrice=5000.00|createDate=2019-10-08|brandId=3|oldImagePath=/images/1b638dcb-5a76-4f0b-99e1-ed7eb8023a98.jpg|mainImage=|id=33',''),(171,'admin','张三丰','2019-10-17 12:33:36','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=vvvvtt|productPrice=5000.00|createDate=2019-10-08|brandId=3|oldImagePath=/images/1b638dcb-5a76-4f0b-99e1-ed7eb8023a98.jpg|mainImage=/images/b9a4b2f6-31de-4b04-8030-2adaf9254cd3.jpg|id=33',''),(172,'admin','张三丰','2019-10-17 12:36:26','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=mmm|productPrice=34.00|createDate=2019-10-20|brandId=5|oldImagePath=|mainImage=/images/60973e5c-7f22-49a6-ae0c-2122dbbb4cb2.jpg|id=32|cate1=2|cate2=10|cate3=11',''),(173,'admin','张三丰','2019-10-17 12:36:32','执行了com.fh.shop.admin.controller.product.ProductController的updateProductStatus方法成功！！！',1,'','|id=32|status=1',''),(174,'admin','张三丰','2019-10-17 12:37:07','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=fd|productPrice=33.00|createDate=2019-10-29|brandId=4|oldImagePath=|mainImage=/images/9b496d96-be83-425e-8467-6cb994d9ea24.jpg|id=30|cate1=2|cate2=14|cate3=16',''),(175,'admin','张三丰','2019-10-17 12:37:13','执行了com.fh.shop.admin.controller.product.ProductController的updateProductStatus方法成功！！！',1,'','|id=30|status=1',''),(176,'admin','张三丰','2019-10-17 17:24:29','执行了com.fh.shop.admin.controller.product.ProductController的add方法成功！！！',1,'','|productName=dd|productPrice=4000|createDate=2019-10-01|brandId=4|mainImage=http://fh1902-111.oss-cn-beijing.aliyuncs.com/2019-10-17/18dd4e6c-c52f-4ff2-9da0-b5dd3d9b3330.jpg|cate1=2|cate2=14|cate3=16',''),(177,'admin','张三丰','2019-10-17 17:31:30','执行了com.fh.shop.admin.controller.product.ProductController的add方法成功！！！',1,'','|productName=safdsa|productPrice=4005|createDate=2019-10-15|brandId=5|mainImage=http://fh1902-111.oss-cn-beijing.aliyuncs.com/2019-10-17/54d74f33-dd35-4690-b058-9c5da0709190.gif|cate1=2|cate2=14|cate3=16',''),(178,'admin','张三丰','2019-10-17 17:44:56','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=eeeee|productPrice=4005.00|createDate=2019-10-15|brandId=5|oldImagePath=http://fh1902-111.oss-cn-beijing.aliyuncs.com/2019-10-17/54d74f33-dd35-4690-b058-9c5da0709190.gif|mainImage=|id=35',''),(179,'admin','张三丰','2019-10-17 17:45:34','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=eeeee|productPrice=4005.00|createDate=2019-10-15|brandId=5|oldImagePath=http://fh1902-111.oss-cn-beijing.aliyuncs.com/2019-10-17/54d74f33-dd35-4690-b058-9c5da0709190.gif|mainImage=http://fh1902-111.oss-cn-beijing.aliyuncs.com/2019-10-17/5b17a1a1-c148-4edd-83b6-c18299f74032.jpg|id=35',''),(180,'admin','张三丰','2019-10-17 17:45:47','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=eeeee|productPrice=4005.00|createDate=2019-10-15|brandId=5|oldImagePath=http://fh1902-111.oss-cn-beijing.aliyuncs.com/2019-10-17/5b17a1a1-c148-4edd-83b6-c18299f74032.jpg|mainImage=http://fh1902-111.oss-cn-beijing.aliyuncs.com/2019-10-17/29dbce5a-b68d-415e-a11c-e9ccd078a05f.jpg|id=35',''),(181,'admin','张三丰','2019-10-17 17:49:52','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=eeeee|productPrice=4005.00|createDate=2019-10-15|brandId=5|oldImagePath=http://fh1902-111.oss-cn-beijing.aliyuncs.com/2019-10-17/29dbce5a-b68d-415e-a11c-e9ccd078a05f.jpg|mainImage=http://fh1902-111.oss-cn-beijing.aliyuncs.com/2019-10-17/ec064540-975f-469d-acd3-bee5346477d3.jpg|id=35',''),(182,'admin','张三丰','2019-10-17 17:51:01','执行了com.fh.shop.admin.controller.product.ProductController的update方法成功！！！',1,'','|productName=eeeee|productPrice=4005.00|createDate=2019-10-15|brandId=5|oldImagePath=http://fh1902-111.oss-cn-beijing.aliyuncs.com/2019-10-17/ec064540-975f-469d-acd3-bee5346477d3.jpg|mainImage=http://fh1902-111.oss-cn-beijing.aliyuncs.com/2019-10-17/cfc7c9be-776c-45af-9872-2f5bc96226c9.gif|id=35',''),(183,'admin','张三丰','2019-10-17 17:53:20','执行了com.fh.shop.admin.controller.product.ProductController的updateProductStatus方法成功！！！',1,'','|id=35|status=1',''),(184,'admin','张三丰','2019-10-23 18:30:08','执行了com.fh.shop.admin.controller.category.CategoryController的add方法成功！！！',1,'','|fatherId=34|categoryName=风衣',''),(185,'admin','张三丰','2019-10-23 18:56:30','执行了com.fh.shop.admin.controller.category.CategoryController的add方法成功！！！',1,'','|fatherId=34|categoryName=夹克',''),(186,'admin','张三丰','2019-10-23 18:56:55','执行了com.fh.shop.admin.controller.resource.ResourceController的deleteBatch方法成功！！！',1,'','|ids[]=4,8,9',''),(187,'admin','张三丰','2019-10-23 18:57:23','执行了com.fh.shop.admin.controller.category.CategoryController的add方法成功！！！',1,'','|fatherId=35|categoryName=hh',''),(188,'admin','张三丰','2019-10-23 20:39:32','执行了com.fh.shop.admin.controller.product.ProductController的update方法失败！！！',0,'Object Key \"/images/ceba541e-6eba-4a30-af40-a7912d297540.jpg\" 无效。Object名称在使用UTF-8编码后长度必须在 1-1023字节之间，而且不能包含回车、换行、以及xml1.0不支持的字符，同时也不能以“/”或者“\\”开头。','|productName=iphone9s|productPrice=5000.00|createDate=2019-10-24|brandId=4|oldImagePath=/images/ceba541e-6eba-4a30-af40-a7912d297540.jpg|mainImage=http://fh1902-111.oss-cn-beijing.aliyuncs.com/2019-10-23/647e683c-ae28-4ba4-baf6-9f368c2343ef.jpg|id=25',''),(189,'admin','张三丰','2019-10-23 20:41:40','执行了com.fh.shop.admin.controller.product.ProductController的add方法成功！！！',1,'','|productName=小米8s|productPrice=3500|createDate=2019-10-14|brandId=4|mainImage=http://fh1902-111.oss-cn-beijing.aliyuncs.com/2019-10-23/0fe5ae58-c5c8-4c0d-80ae-18e175aad00c.jpg|cate1=2|cate2=10|cate3=11',''),(190,'admin','张三丰','2019-10-23 20:41:42','执行了com.fh.shop.admin.controller.product.ProductController的updateProductStatus方法成功！！！',1,'','|id=36|status=1',''),(191,'admin','张三丰','2019-10-23 20:42:12','执行了com.fh.shop.admin.controller.product.ProductController的add方法成功！！！',1,'','|productName=华为p30|productPrice=3999|createDate=2019-11-01|brandId=2|mainImage=http://fh1902-111.oss-cn-beijing.aliyuncs.com/2019-10-23/071afc9c-4901-434e-bb86-9c95271e66b0.jpg|cate1=2|cate2=10|cate3=11',''),(192,'admin','张三丰','2019-10-23 20:42:14','执行了com.fh.shop.admin.controller.product.ProductController的updateProductStatus方法成功！！！',1,'','|id=37|status=1',''),(193,'admin','张三丰','2019-10-24 09:38:09','执行了com.fh.shop.admin.controller.product.ProductController的updateProductStatus方法成功！！！',1,'','|id=35|status=0',''),(194,'admin','张三丰','2019-10-24 09:38:59','执行了com.fh.shop.admin.controller.product.ProductController的add方法成功！！！',1,'','|productName=苹果9|productPrice=5665|createDate=2019-10-23|brandId=4|mainImage=http://fh1902-111.oss-cn-beijing.aliyuncs.com/2019-10-24/7660ddec-925b-43f5-861a-7f4f6e2a831b.jpg|cate1=2|cate2=10|cate3=11',''),(195,'admin','张三丰','2019-10-24 09:39:05','执行了com.fh.shop.admin.controller.product.ProductController的updateProductStatus方法成功！！！',1,'','|id=38|status=1','');

/*Table structure for table `t_member` */

DROP TABLE IF EXISTS `t_member`;

CREATE TABLE `t_member` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `memberName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `realName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sheng` bigint(11) DEFAULT NULL,
  `shi` bigint(11) DEFAULT NULL,
  `xian` bigint(11) DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_member` */

insert  into `t_member`(`id`,`memberName`,`password`,`realName`,`birthday`,`phone`,`email`,`sheng`,`shi`,`xian`,`address`) values (51,'aaa','111','张三','2019-10-11','15001359482','yuxy@126.com',1,1,1,NULL),(52,'xx','111','天天','2017-07-18','15853411513','532028476@qq.com',3,11,17,NULL);

/*Table structure for table `t_order` */

DROP TABLE IF EXISTS `t_order`;

CREATE TABLE `t_order` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `payTime` datetime DEFAULT NULL,
  `totalPrice` decimal(10,2) DEFAULT NULL,
  `totalCount` bigint(20) DEFAULT NULL,
  `payType` int(11) DEFAULT NULL,
  `addressId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_order` */

insert  into `t_order`(`id`,`userId`,`createTime`,`status`,`payTime`,`totalPrice`,`totalCount`,`payType`,`addressId`) values ('201910231649558811186927723045486593',51,'2019-10-23 16:49:56',10,NULL,'18080.01',9,1,NULL),('201910231653480961186928697038454785',51,'2019-10-23 16:53:48',10,NULL,'18080.01',9,1,NULL);

/*Table structure for table `t_order_detail` */

DROP TABLE IF EXISTS `t_order_detail`;

CREATE TABLE `t_order_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `orderId` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `productId` bigint(20) DEFAULT NULL,
  `image` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `productName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `subTotalPrice` decimal(10,2) DEFAULT NULL,
  `count` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_order_detail` */

insert  into `t_order_detail`(`id`,`orderId`,`userId`,`productId`,`image`,`productName`,`price`,`subTotalPrice`,`count`) values (1,'201910231649558811186927723045486593',51,18,NULL,'美的空调','3000.00','18000.00',NULL),(2,'201910231649558811186927723045486593',51,22,NULL,'测试88','26.67','80.01',NULL),(3,'201910231653480961186928697038454785',51,18,NULL,'美的空调','3000.00','18000.00',6),(4,'201910231653480961186928697038454785',51,22,NULL,'测试88','26.67','80.01',3);

/*Table structure for table `t_product` */

DROP TABLE IF EXISTS `t_product`;

CREATE TABLE `t_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `productName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `createDate` date DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `brandId` bigint(20) DEFAULT NULL,
  `mainImage` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cate1` bigint(20) DEFAULT NULL,
  `cate2` bigint(20) DEFAULT NULL,
  `cate3` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_product` */

insert  into `t_product`(`id`,`productName`,`price`,`createDate`,`status`,`brandId`,`mainImage`,`cate1`,`cate2`,`cate3`) values (5,'测试44','130.00','2019-09-16',0,1,NULL,NULL,NULL,NULL),(7,'华为p20','4000.00','2019-09-05',1,2,NULL,NULL,NULL,NULL),(8,'小米9','3000.00','2019-09-05',0,1,NULL,NULL,NULL,NULL),(9,'苹果10s','6000.00','2019-09-26',1,4,NULL,NULL,NULL,NULL),(10,'小米10','2300.00','2019-09-06',1,1,NULL,NULL,NULL,NULL),(11,'测试44','260.00','2019-09-17',0,1,NULL,NULL,NULL,NULL),(12,'测试44','260.00','2019-09-17',1,2,NULL,NULL,NULL,NULL),(13,'测试44','260.00','2019-09-17',0,1,NULL,NULL,NULL,NULL),(14,'看看','678.00','2019-09-19',0,4,NULL,NULL,NULL,NULL),(15,'ff','4000.00','2019-09-05',0,3,NULL,NULL,NULL,NULL),(16,'cc66','4008.00','2019-09-13',0,1,NULL,NULL,NULL,NULL),(18,'美的空调','3000.00','2019-10-09',1,3,NULL,NULL,NULL,NULL),(19,'测试44','26.00','2019-10-06',0,1,NULL,NULL,NULL,NULL),(20,'测试66','26.50','2019-10-06',0,1,NULL,NULL,NULL,NULL),(21,'测试88','26.66','2019-10-06',0,1,NULL,NULL,NULL,NULL),(22,'测试88','26.67','2019-10-06',1,1,NULL,NULL,NULL,NULL),(24,'rr','4000.00','2019-10-09',1,3,'/images/22ac84bd-40df-4e70-bc01-07be05e4ba34.jpg',NULL,NULL,NULL),(25,'iphone9s','5000.00','2019-10-24',0,4,'/images/ceba541e-6eba-4a30-af40-a7912d297540.jpg',2,10,11),(26,'dd','4000.00','2019-10-01',0,2,'/images/f917f04f-d30e-4638-b0d0-3d4ad7f7b096.jpg',17,18,19),(27,'sfd','4000.00','2019-10-17',0,3,'/images/04b10111-5bb0-49f1-a619-c085c4a6c424.jpg',2,14,16),(28,'wwwtt','4000.00','2019-10-16',0,3,'/images/168877f5-56f4-485a-ac91-f61adf3b12fc.jpg',1,3,5),(30,'fd','33.00','2019-10-29',1,4,'/images/9b496d96-be83-425e-8467-6cb994d9ea24.jpg',2,14,16),(32,'mmm','34.00','2019-10-20',1,5,'/images/60973e5c-7f22-49a6-ae0c-2122dbbb4cb2.jpg',2,10,11),(33,'vvvvtt','5000.00','2019-10-08',0,3,'/images/b9a4b2f6-31de-4b04-8030-2adaf9254cd3.jpg',33,35,38),(34,'dd','4000.00','2019-10-01',0,4,'http://fh1902-111.oss-cn-beijing.aliyuncs.com/2019-10-17/18dd4e6c-c52f-4ff2-9da0-b5dd3d9b3330.jpg',2,14,16),(35,'eeeee','4005.00','2019-10-15',0,5,'http://fh1902-111.oss-cn-beijing.aliyuncs.com/2019-10-17/cfc7c9be-776c-45af-9872-2f5bc96226c9.gif',2,14,16),(36,'小米8s','3500.00','2019-10-14',1,4,'http://fh1902-111.oss-cn-beijing.aliyuncs.com/2019-10-23/0fe5ae58-c5c8-4c0d-80ae-18e175aad00c.jpg',2,10,11),(37,'华为p30','3999.00','2019-11-01',1,2,'http://fh1902-111.oss-cn-beijing.aliyuncs.com/2019-10-23/071afc9c-4901-434e-bb86-9c95271e66b0.jpg',2,10,11),(38,'苹果9','5665.00','2019-10-23',1,4,'http://fh1902-111.oss-cn-beijing.aliyuncs.com/2019-10-24/7660ddec-925b-43f5-861a-7f4f6e2a831b.jpg',2,10,11);

/*Table structure for table `t_resource` */

DROP TABLE IF EXISTS `t_resource`;

CREATE TABLE `t_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menuName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fatherId` bigint(20) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `url` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_resource` */

insert  into `t_resource`(`id`,`menuName`,`fatherId`,`type`,`url`) values (1,'后台管理的菜单',0,NULL,NULL),(17,'商品管理',1,1,'/product/index.jhtml'),(21,'品牌管理',1,1,'/brand/index.jhtml'),(22,'地区管理',1,1,'/a/b'),(23,'系统管理',1,1,''),(24,'用户管理',23,1,'/user/index.jhtml'),(25,'菜单管理',23,1,'/resource/index.jhtml'),(26,'角色管理',23,1,'/role/index.jhtml'),(39,'用户删除',24,2,'/user/deleteUser.jhtml'),(40,'批量删除',24,2,'/user/deleteBatch'),(41,'添加用户',24,2,'/user/add'),(42,'添加菜单',25,2,'/resource/add'),(43,'修改菜单',25,2,'/resource/update'),(44,'删除',25,2,'/resource/deleteBatch'),(45,'日志管理',1,1,'/log/index.jhtml'),(47,'解锁',24,2,'/user/updateUserStatus.jhtml'),(48,'重置密码',24,2,'/user/resetUserPassword.jhtml'),(49,'分类管理',1,1,'/category/index.jhtml');

/*Table structure for table `t_role` */

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_role` */

insert  into `t_role`(`id`,`roleName`) values (1,'管理员'),(2,'商品维护人'),(3,'品牌维护人'),(4,'地区维护人'),(5,'分类维护人'),(6,'菜单维护人'),(25,'系统管理模块负责人'),(26,'ddd'),(27,'wwww'),(28,'测试');

/*Table structure for table `t_role_resource` */

DROP TABLE IF EXISTS `t_role_resource`;

CREATE TABLE `t_role_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleId` bigint(20) DEFAULT NULL,
  `resourceid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=510 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_role_resource` */

insert  into `t_role_resource`(`id`,`roleId`,`resourceid`) values (73,25,1),(74,25,23),(75,25,24),(76,25,25),(77,25,26),(81,5,1),(83,3,1),(84,3,21),(307,28,1),(308,28,17),(310,6,1),(311,6,23),(312,6,25),(313,6,44),(389,2,1),(390,2,17),(492,1,1),(493,1,17),(494,1,21),(495,1,22),(496,1,23),(497,1,24),(498,1,39),(499,1,40),(500,1,41),(501,1,47),(502,1,48),(503,1,25),(504,1,42),(505,1,43),(506,1,44),(507,1,26),(508,1,45),(509,1,49);

/*Table structure for table `t_stu` */

DROP TABLE IF EXISTS `t_stu`;

CREATE TABLE `t_stu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stuname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_stu` */

insert  into `t_stu`(`id`,`stuname`,`age`) values (1,'张三',20),(2,'李四',22),(3,'张三',23),(4,'张三',20),(5,'李四',35),(6,'李四',35),(7,'张三',20);

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salt` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `realName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `entryTime` date DEFAULT NULL,
  `loginTime` datetime DEFAULT NULL,
  `loginCount` int(11) DEFAULT '0',
  `loginErrorCount` int(11) DEFAULT '0',
  `loginErrorDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`userName`,`salt`,`realName`,`password`,`sex`,`age`,`phone`,`email`,`salary`,`entryTime`,`loginTime`,`loginCount`,`loginErrorCount`,`loginErrorDate`) values (18,'zhangsan','33c6a0f6-7097-4c0c-9358-d51978bd2311','张三','847f406c2020c0383a9271333f553065',0,22,'','532028476@qq.com',NULL,NULL,'2019-09-15 18:38:54',3,5,'2019-09-15 18:39:04'),(20,'admin','45f0fc4c-197f-4ff1-8b8e-9a60611cf3f8','张三丰','4f06162185d168db45e251108f345f81',1,55,'','',NULL,NULL,'2019-10-24 09:38:02',1,0,'2019-10-24 09:37:55'),(23,'llll','b5371a71-e561-4d7f-8256-ac07e08313e1','订单','fa370ad1ad68627d9f6fd18d63386543',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL),(24,'kkk','6afbe0b8-c435-42ad-ad29-dcdba739d2cb',NULL,'2274f2efc1aa9547c4cb6d48124db663',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL),(25,'sysadmin','2657ebb9-7bcd-46b3-b8e1-37a45101e36f','小南','42008635eb2e30f4c4657588289c6688',1,34,'','',NULL,NULL,'2019-09-15 18:31:31',4,0,'2019-09-15 18:29:43');

/*Table structure for table `t_user_role` */

DROP TABLE IF EXISTS `t_user_role`;

CREATE TABLE `t_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL,
  `roleId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_user_role` */

insert  into `t_user_role`(`id`,`userId`,`roleId`) values (13,12,2),(14,12,3),(15,12,5),(16,13,5),(17,13,6),(25,20,1),(51,18,2),(52,18,3),(53,18,4),(62,24,1),(63,24,2),(64,24,3),(65,23,4),(66,23,5),(67,25,2),(68,25,6);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
