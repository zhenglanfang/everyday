-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: everyday
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_3365adb0ccf1b039_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_3365adb0ccf1b039_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_247e62a50ee19b1f_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_620925110094944a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user',7,'add_user'),(20,'Can change user',7,'change_user'),(21,'Can delete user',7,'delete_user'),(22,'Can add address',8,'add_address'),(23,'Can change address',8,'change_address'),(24,'Can delete address',8,'delete_address'),(25,'Can add type info',9,'add_typeinfo'),(26,'Can change type info',9,'change_typeinfo'),(27,'Can delete type info',9,'delete_typeinfo'),(28,'Can add goods info',10,'add_goodsinfo'),(29,'Can change goods info',10,'change_goodsinfo'),(30,'Can delete goods info',10,'delete_goodsinfo'),(31,'Can add reviews',11,'add_reviews'),(32,'Can change reviews',11,'change_reviews'),(33,'Can delete reviews',11,'delete_reviews'),(34,'Can add cart info',12,'add_cartinfo'),(35,'Can change cart info',12,'change_cartinfo'),(36,'Can delete cart info',12,'delete_cartinfo'),(37,'Can add order info',13,'add_orderinfo'),(38,'Can change order info',13,'change_orderinfo'),(39,'Can delete order info',13,'delete_orderinfo'),(40,'Can add order detail info',14,'add_orderdetailinfo'),(41,'Can change order detail info',14,'change_orderdetailinfo'),(42,'Can delete order detail info',14,'delete_orderdetailinfo');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$LwCvDCJ7D99S$YowVy8ZZusn7N42GGCYeodhZ5YNizM6P2gjyDsl0BA4=','2017-10-13 03:45:06.564688',1,'zheng','','','123@qq.com',1,1,'2017-10-13 03:44:43.231748');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_54f04cddf06f7364_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_54f04cddf06f7364_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_3eddb7ecc99c42e7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_2b39be17fcd0fc97_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_2b39be17fcd0fc97_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_5e7466d4db9b54f2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_cartinfo`
--

DROP TABLE IF EXISTS `cart_cartinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_cartinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nums` int(11) NOT NULL,
  `cart_good_id` int(11) NOT NULL,
  `cart_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_cartinf_cart_good_id_36184f04ef3d719d_fk_goods_goodsinfo_id` (`cart_good_id`),
  KEY `cart_cartinfo_cart_user_id_2e0192be6a3ab189_fk_user_user_id` (`cart_user_id`),
  CONSTRAINT `cart_cartinf_cart_good_id_36184f04ef3d719d_fk_goods_goodsinfo_id` FOREIGN KEY (`cart_good_id`) REFERENCES `goods_goodsinfo` (`id`),
  CONSTRAINT `cart_cartinfo_cart_user_id_2e0192be6a3ab189_fk_user_user_id` FOREIGN KEY (`cart_user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_cartinfo`
--

LOCK TABLES `cart_cartinfo` WRITE;
/*!40000 ALTER TABLE `cart_cartinfo` DISABLE KEYS */;
INSERT INTO `cart_cartinfo` VALUES (145,3,26,4),(146,10,7,4),(148,3,25,1),(149,1,24,1),(150,1,9,1),(151,1,22,1);
/*!40000 ALTER TABLE `cart_cartinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_583883f523e0d3ef_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_8102c9dcc70dd35_fk_auth_user_id` (`user_id`),
  CONSTRAINT `djang_content_type_id_583883f523e0d3ef_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_8102c9dcc70dd35_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-10-13 03:46:54.962491','1','新鲜水果',1,'',9,1),(2,'2017-10-13 03:47:04.147324','2','海鲜水产',1,'',9,1),(3,'2017-10-13 03:47:14.435583','3','猪牛羊肉',1,'',9,1),(4,'2017-10-13 03:47:21.843596','4','禽类蛋品',1,'',9,1),(5,'2017-10-13 03:47:34.025162','5','新鲜蔬菜',1,'',9,1),(6,'2017-10-13 03:47:41.498415','6','速冻食品',1,'',9,1),(7,'2017-10-13 04:26:18.219033','1','新鲜红心蜜柚5斤当季柚子水',1,'',10,1),(8,'2017-10-13 04:33:00.928817','2','陕西大荔冬枣甜脆枣',1,'',10,1),(9,'2017-10-13 04:38:12.782155','3','四川攀枝花凯特芒',1,'',10,1),(10,'2017-10-13 05:32:34.589122','4','正宗麻阳冰糖橙',1,'',10,1),(11,'2017-10-13 05:38:11.122881','5','正宗红心柚福建平和琯溪蜜柚红肉',1,'',10,1),(12,'2017-10-13 05:42:15.272945','6','正宗湘西纽荷尔脐橙',1,'',10,1),(13,'2017-10-13 05:44:04.997866','7','湘西塔罗科血橙',1,'',10,1),(14,'2017-10-13 05:46:33.980688','8','美国新奇士进口柠檬',1,'',10,1),(15,'2017-10-13 05:49:42.134298','9','海南莲雾水果 黑珍珠莲雾',1,'',10,1),(16,'2017-10-13 05:51:53.316597','10','金都一号红色红心火龙果',1,'',10,1),(17,'2017-10-13 06:05:14.972753','11','南果梨新鲜东北果香梨酒香梨小酥',1,'',10,1),(18,'2017-10-13 06:08:01.088967','12','海南芒果青皮',1,'',10,1),(19,'2017-10-13 06:09:53.279809','13','红心木瓜',1,'',10,1),(20,'2017-10-13 06:11:50.183383','14','百香果',1,'',10,1),(21,'2017-10-13 06:15:04.764968','15','云南蒙自石榴',1,'',10,1),(22,'2017-10-13 06:17:44.948538','16','欢乐果园 泰国金枕头冷冻榴莲',1,'',10,1),(23,'2017-10-13 06:20:10.022060','17','南非红西柚',1,'',10,1),(24,'2017-10-13 06:22:56.646050','18','五丰 美仑达 精品特级 琯溪蜜',1,'',10,1),(25,'2017-10-13 09:18:54.258628','3','四川凯特芒',2,'已修改 good_title 。',10,1),(26,'2017-10-13 13:24:08.690265','5','正宗红心柚福建平和琯溪蜜柚红肉',2,'已修改 imgs 。',10,1),(27,'2017-10-13 13:25:27.224570','1','新鲜红心蜜柚5斤当季柚子水',2,'已修改 imgs 。',10,1),(28,'2017-10-14 02:39:00.320011','9','海南莲雾水果 黑珍珠莲雾',2,'已修改 unit 。',10,1),(29,'2017-10-14 02:39:09.210503','10','金都一号红色红心火龙果',2,'已修改 unit 。',10,1),(30,'2017-10-14 02:39:28.410655','12','海南芒果青皮',2,'已修改 unit 。',10,1),(31,'2017-10-14 02:40:39.399649','3','四川凯特芒',2,'已修改 unit 。',10,1),(32,'2017-10-14 02:40:56.741905','4','正宗麻阳冰糖橙',2,'已修改 unit 。',10,1),(33,'2017-10-14 02:42:08.405348','10','金都一号红色红心火龙果',2,'已修改 unit 。',10,1),(34,'2017-10-14 02:49:35.408240','4','正宗麻阳冰糖橙',2,'已修改 unit 。',10,1),(35,'2017-10-14 02:49:45.732677','3','四川凯特芒',2,'已修改 unit 。',10,1),(36,'2017-10-14 02:57:21.935780','9','海南莲雾水果 黑珍珠莲雾',2,'已修改 unit 。',10,1),(37,'2017-10-14 09:20:44.286609','1','CartInfo object',1,'',12,1),(38,'2017-10-14 09:20:57.901568','2','CartInfo object',1,'',12,1),(39,'2017-10-14 09:21:13.362170','2','CartInfo object',3,'',12,1),(40,'2017-10-14 09:21:22.219276','3','CartInfo object',1,'',12,1),(41,'2017-10-14 09:28:46.463993','3','CartInfo object',3,'',12,1),(42,'2017-10-14 09:28:46.465826','1','CartInfo object',3,'',12,1),(43,'2017-10-14 09:46:46.345444','4','CartInfo object',1,'',12,1),(44,'2017-10-14 09:46:54.290609','5','CartInfo object',1,'',12,1),(45,'2017-10-14 13:03:34.156864','6','CartInfo object',1,'',12,1),(46,'2017-10-14 13:03:41.795500','7','CartInfo object',1,'',12,1),(47,'2017-10-14 13:09:15.899498','8','CartInfo object',1,'',12,1),(48,'2017-10-14 13:09:22.117584','9','CartInfo object',1,'',12,1),(49,'2017-10-14 13:15:38.818427','10','CartInfo object',1,'',12,1),(50,'2017-10-14 13:15:45.900837','11','CartInfo object',1,'',12,1),(51,'2017-10-14 13:15:53.724687','12','CartInfo object',1,'',12,1),(52,'2017-10-14 13:35:59.592440','13','CartInfo object',1,'',12,1),(53,'2017-10-14 13:36:10.815963','14','CartInfo object',1,'',12,1),(54,'2017-10-14 13:51:15.422090','15','CartInfo object',1,'',12,1),(55,'2017-10-14 13:51:23.948442','16','CartInfo object',1,'',12,1),(56,'2017-10-14 13:51:32.112005','17','CartInfo object',1,'',12,1),(57,'2017-10-15 01:37:41.621007','18','CartInfo object',1,'',12,1),(58,'2017-10-16 11:22:06.358099','19',' 越南巴沙鱼柳',1,'',10,1),(59,'2017-10-16 11:30:09.083411','20',' 熟冻北极虾',1,'',10,1),(60,'2017-10-16 14:39:13.418155','21',' 蒲江黄心猕猴桃',1,'',10,1),(61,'2017-10-16 14:45:20.462402','22','冰糖心红富士丑苹果',1,'',10,1),(62,'2017-10-16 14:50:56.005976','23','人参果人生果',1,'',10,1),(63,'2017-10-16 14:53:27.083744','24','新鲜水果芒果',1,'',10,1),(64,'2017-10-16 14:56:11.043132','25','红心猕猴桃',1,'',10,1),(65,'2017-10-16 14:58:19.666690','26','越南玉芒 芒果 青皮芒果',1,'',10,1),(66,'2017-10-20 00:00:03.769831','111','CartInfo object',3,'',12,1),(67,'2017-10-20 00:00:03.771604','110','CartInfo object',3,'',12,1),(68,'2017-10-20 00:00:03.773172','109','CartInfo object',3,'',12,1),(69,'2017-10-20 00:00:03.779760','108','CartInfo object',3,'',12,1),(70,'2017-10-20 00:00:03.781360','107','CartInfo object',3,'',12,1),(71,'2017-10-20 00:00:03.782356','106','CartInfo object',3,'',12,1),(72,'2017-10-20 00:00:03.783340','105','CartInfo object',3,'',12,1),(73,'2017-10-20 00:00:03.784306','104','CartInfo object',3,'',12,1),(74,'2017-10-20 00:00:03.785721','103','CartInfo object',3,'',12,1),(75,'2017-10-20 00:00:03.787608','102','CartInfo object',3,'',12,1),(76,'2017-10-20 00:00:03.789190','101','CartInfo object',3,'',12,1),(77,'2017-10-20 00:00:03.790288','100','CartInfo object',3,'',12,1),(78,'2017-10-20 01:05:21.534626','2','2',1,'',13,1),(79,'2017-10-20 01:05:44.244422','3','3',1,'',13,1),(80,'2017-10-20 01:07:31.747231','2','越南玉芒 芒果 青皮芒果',1,'',14,1),(81,'2017-10-20 01:10:09.959053','3','红心木瓜',1,'',14,1),(82,'2017-10-20 01:10:34.298370','4','四川凯特芒',1,'',14,1),(83,'2017-10-20 03:19:29.652593','5','正宗红心柚福建平和琯溪蜜柚红肉',1,'',14,1),(84,'2017-10-20 03:19:41.985925','6','百香果',1,'',14,1),(85,'2017-10-20 03:25:19.743567','4','4',1,'',13,1),(86,'2017-10-20 03:25:30.018635','5','5',1,'',13,1),(87,'2017-10-20 03:25:39.811896','6','6',1,'',13,1),(88,'2017-10-20 03:46:47.530048','6','6',3,'',13,1),(89,'2017-10-20 03:46:47.531605','5','5',3,'',13,1),(90,'2017-10-20 03:46:47.533170','4','4',3,'',13,1),(91,'2017-10-21 04:27:40.642793','20171021','20171021',3,'',13,1),(92,'2017-10-21 07:14:39.056741','3','3',3,'',13,1),(93,'2017-10-21 07:14:39.070510','2','2',3,'',13,1),(94,'2017-10-21 07:20:13.977170','7','湘西塔罗科血橙',2,'已修改 stock 。',10,1),(95,'2017-10-21 07:38:10.930764','1508571348','1508571348',2,'已修改 isPlay 。',13,1),(96,'2017-10-21 08:46:21.478801','1508575497','1508575497',3,'',13,1),(97,'2017-10-21 08:46:21.485928','1508575482','1508575482',3,'',13,1),(98,'2017-10-21 11:55:23.622063','1508574886','1508574886',3,'',13,1),(99,'2017-10-21 11:55:23.804744','1508571806','1508571806',3,'',13,1),(100,'2017-10-21 11:55:23.863324','1508571705','1508571705',3,'',13,1),(101,'2017-10-21 11:55:23.924875','1508571655','1508571655',3,'',13,1),(102,'2017-10-21 11:55:23.932328','1508571548','1508571548',3,'',13,1),(103,'2017-10-21 11:55:23.934204','1508571348','1508571348',3,'',13,1),(104,'2017-10-21 11:55:23.949272','1508571306','1508571306',3,'',13,1),(105,'2017-10-21 11:55:23.951007','1508571033','1508571033',3,'',13,1),(106,'2017-10-21 11:55:23.956244','1508570913','1508570913',3,'',13,1),(107,'2017-10-21 11:55:23.958283','1508568139','1508568139',3,'',13,1),(108,'2017-10-21 11:55:23.982571','1508560229','1508560229',3,'',13,1),(109,'2017-10-21 11:55:24.044586','1508560135','1508560135',3,'',13,1),(110,'2017-10-21 11:55:24.046790','1508560082','1508560082',3,'',13,1),(111,'2017-10-21 11:55:58.970213','7','湘西塔罗科血橙',2,'已修改 stock 。',10,1),(112,'2017-10-21 12:08:32.775812','1508585953','1508585953',1,'',13,1),(113,'2017-10-21 12:08:38.690397','31','美国新奇士进口柠檬',1,'',14,1),(114,'2017-10-21 13:13:59.711377','4','正宗麻阳冰糖橙',2,'已修改 stock 。',10,1),(115,'2017-10-21 13:56:44.788926','27','12',1,'',10,1),(116,'2017-10-21 13:57:30.588868','27','12',3,'',10,1),(117,'2017-10-22 01:52:46.967588','28','1',1,'',10,1),(118,'2017-10-22 03:34:27.510649','29','2',1,'',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_6d0e7c9ed8041308_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(12,'cart','cartinfo'),(5,'contenttypes','contenttype'),(10,'goods','goodsinfo'),(11,'goods','reviews'),(9,'goods','typeinfo'),(14,'order','orderdetailinfo'),(13,'order','orderinfo'),(6,'sessions','session'),(8,'user','address'),(7,'user','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-10-12 11:24:01.562032'),(2,'auth','0001_initial','2017-10-12 11:24:04.481242'),(3,'admin','0001_initial','2017-10-12 11:24:05.200390'),(4,'contenttypes','0002_remove_content_type_name','2017-10-12 11:24:05.536413'),(5,'auth','0002_alter_permission_name_max_length','2017-10-12 11:24:05.612329'),(6,'auth','0003_alter_user_email_max_length','2017-10-12 11:24:05.802294'),(7,'auth','0004_alter_user_username_opts','2017-10-12 11:24:05.891038'),(8,'auth','0005_alter_user_last_login_null','2017-10-12 11:24:06.101705'),(9,'auth','0006_require_contenttypes_0002','2017-10-12 11:24:06.104902'),(10,'sessions','0001_initial','2017-10-12 11:24:06.219224'),(11,'user','0001_initial','2017-10-12 11:24:06.565755'),(12,'goods','0001_initial','2017-10-13 03:32:59.377337'),(13,'goods','0002_auto_20171013_1951','2017-10-13 11:51:30.516032'),(14,'goods','0003_auto_20171014_1631','2017-10-14 08:31:57.419087'),(15,'cart','0001_initial','2017-10-14 08:31:57.783391'),(16,'goods','0004_reviews_date','2017-10-19 23:59:24.876781'),(17,'goods','0005_auto_20171020_0759','2017-10-19 23:59:24.898130'),(18,'order','0001_initial','2017-10-19 23:59:25.315602');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2ax92nl37w3gqkpmzo4uwil9kpj4rwco','ODhjZDZhNjA1YjRlY2VmM2Y1OGIyNjE4MWQ4ODhhZWFlMWE3YjdmZDp7InZlcmlmeWNvZGUiOiJPSTQ1In0=','2017-11-03 02:11:05.473689'),('5oqt08ugixuy5vfdahweui4bpcetpxl4','YjdhNTI0NjRhZjdjYjc1MWViMmVhMDU4ZGZjMjAxZWQ2ZjhlYjI5ZTp7InJlbV91c2VycHdkIjoiMTIzNDU2IiwidmVyaWZ5Y29kZSI6Ik1OSkEiLCJ1c2VyaWQiOjEsInVzZXJuYW1lIjoiMTM4NDkxODIxNTAiLCJyZW1fdXNlcm5hbWUiOiIxMzg0OTE4MjE1MCJ9','2017-10-27 01:23:27.753582'),('80xrpelhv0sl0afc6z8i5yg3988nsbkc','OWJlZjI2NmU2OTMzMWJiM2Q1MDVkOTQ0NDA4NzkyNDc4Y2U4NDU2YTp7InJlbV91c2VybmFtZSI6IjEzODQ5MTgyMTk5IiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsInJlbV91c2VycHdkIjoiMTIzNDU2IiwidmVyaWZ5Y29kZSI6IlhJVUkiLCJfYXV0aF91c2VyX2hhc2giOiJjNGQ3Mzc0ODk2M2I5ZTQ2Nzc0MTFlMWEwYmU4NTBiMjE1YmE1ZjFkIn0=','2017-11-05 13:43:06.663775'),('h0bwl6uov3bvck0l3v7v0wcw01d2twpr','MTkzOGViYmU0YWM5MjEzYjRiYTE5MmJjOTk0MWFjMzAyZDA2YWVlYTp7InZlcmlmeWNvZGUiOiJUWlBNIn0=','2017-11-06 03:29:12.691597'),('l4ua4zadm6whfgzr6x3mmiu1v4au4mcn','ODM4OTdkMjg0MjgzODM4OTAyNmJmMTc3ZGI1MDAyODM5ZTNmMDQzODp7InZlcmlmeWNvZGUiOiJLSzIwIn0=','2017-10-29 10:32:41.344530'),('p0vcq0izipbmuqixogolysm2l9mpnlqb','NGEyNzRhMDIwMDliNzY2MGU5MzA2ZTg3Njc3Y2QwNDQwMzdkM2MzNDp7InZlcmlmeWNvZGUiOiJCT08zIn0=','2017-12-02 03:08:32.577092'),('zn300c9v3aynj3u70dyaamgej6oatm2b','YzRjZTU1MGE4M2I4NjQ1ZWIxOTM4NmFmZjJkMTg4ZmQwYTdiZjYzOTp7InZlcmlmeWNvZGUiOiJOSFJNIn0=','2017-10-29 13:57:19.505582');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_goodsinfo`
--

DROP TABLE IF EXISTS `goods_goodsinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_goodsinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good_title` varchar(15) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `promo_price` decimal(5,2) NOT NULL,
  `unit` varchar(10) NOT NULL,
  `desc` varchar(100) NOT NULL,
  `detail` longtext NOT NULL,
  `stock` int(11) NOT NULL,
  `freight` decimal(5,2) NOT NULL,
  `sell_count` int(11) NOT NULL,
  `imgs` varchar(100) NOT NULL,
  `isdelete` tinyint(1) NOT NULL,
  `good_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goodsinfo_0e6c0610` (`good_type_id`),
  CONSTRAINT `goods_goodsinfo_ibfk_1` FOREIGN KEY (`good_type_id`) REFERENCES `goods_typeinfo` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_goodsinfo`
--

LOCK TABLES `goods_goodsinfo` WRITE;
/*!40000 ALTER TABLE `goods_goodsinfo` DISABLE KEYS */;
INSERT INTO `goods_goodsinfo` VALUES (1,'新鲜红心蜜柚5斤当季柚子水',39.90,19.80,'2500g','现摘新鲜红心蜜柚5斤当季柚子水果批发低价包邮平和管溪红肉红柚 ','<p class=\"attr-list-hd tm-clear\"><em>产品参数：</em></p>\r\n<ul id=\"J_AttrUL\">\r\n<li title=\"江苏大沙河现代农业综合开发集团有限公司\">厂名：江苏大沙河现代农业综合开发集团有限公司</li>\r\n<li title=\"江苏省丰县东环路大沙河集团电子商务物流中心\">厂址：江苏省丰县东环路大沙河集团电子商务物流中心</li>\r\n<li title=\"15371629057\">厂家联系方式：15371629057</li>\r\n<li title=\"红心柚子\">配料表：红心柚子</li>\r\n<li title=\"20\">保质期：20 天</li>\r\n<li title=\"&nbsp;2500g\">净含量:&nbsp;2500g</li>\r\n<li title=\"&nbsp;散装\">包装方式:&nbsp;散装</li>\r\n<li title=\"&nbsp;同城24小时物流送货上门\">同城服务:&nbsp;同城24小时物流送货上门</li>\r\n<li id=\"J_attrBrandName\" title=\"&nbsp;DSH/大沙河\">品牌:&nbsp;DSH/大沙河</li>\r\n<li title=\"&nbsp;单品\">售卖方式:&nbsp;单品</li>\r\n<li title=\"&nbsp;否\">是否为有机食品:&nbsp;否</li>\r\n<li title=\"&nbsp;15-18℃\">生鲜储存温度:&nbsp;15-18℃</li>\r\n<li title=\"&nbsp;6月&nbsp;7月&nbsp;8月&nbsp;9月&nbsp;10月&nbsp;11月\">热卖时间:&nbsp;6月&nbsp;7月&nbsp;8月&nbsp;9月&nbsp;10月&nbsp;11月</li>\r\n<li title=\"&nbsp;中国大陆\">产地:&nbsp;中国大陆</li>\r\n<li title=\"&nbsp;福建省\">省份:&nbsp;福建省</li>\r\n<li title=\"&nbsp;漳州市\">城市:&nbsp;漳州市</li>\r\n<li title=\"&nbsp;2人份\">套餐份量:&nbsp;2人份</li>\r\n<li title=\"&nbsp;1周\">套餐周期:&nbsp;1周</li>\r\n<li title=\"&nbsp;1周1次\">配送频次:&nbsp;1周1次</li>\r\n<li title=\"&nbsp;平和琯溪蜜柚\">特产品类:&nbsp;平和琯溪蜜柚</li>\r\n<li title=\"&nbsp;0-50元\">价格:&nbsp;0-50元</li>\r\n</ul>\r\n<p><img src=\"https://img.alicdn.com/imgextra/i3/2345847088/TB2cnC_atqgF1JjSsppXXaBNXXa_!!2345847088.jpg\" alt=\"\" width=\"665\" height=\"528\" /></p>',0,0.00,0,'images/goods/TB2FDecg1sAV1JjSZFsXXadZXXa_2345847088.jpg_430x430q90.jpg',0,1),(2,'陕西大荔冬枣甜脆枣',20.00,17.90,'1.05kg','展卉 陕西大荔冬枣甜脆枣 1kg 单果约12-16g（大果） 新鲜水果 ,枣子皮薄汁多，脆嫩可口，水分充足','<ul class=\"parameter2 p-parameter-list\">\r\n<li title=\"京东生鲜陕西大荔冬枣1kg\">商品名称：京东生鲜陕西大荔冬枣1kg</li>\r\n<li title=\"4441407\">商品编号：4441407</li>\r\n<li title=\"1.05kg\">商品毛重：1.05kg</li>\r\n<li title=\"陕西大荔\">商品产地：陕西大荔</li>\r\n<li title=\"国产\">国产/进口：国产</li>\r\n<li title=\"鲜枣\">分类：鲜枣</li>\r\n<li title=\"1kg-2kg\">重量：1kg-2kg</li>\r\n<li title=\"简装\">包装：简装</li>\r\n</ul>\r\n<p>&nbsp;</p>',1000,10.00,100,'images/goods/595d9332Nd7658b26.jpg',0,1),(3,'四川凯特芒',31.90,31.90,'3.00kg','四川攀枝花凯特芒1.5kg 2-3个 新鲜水果 ','<ul class=\"parameter2 p-parameter-list\">\r\n<li title=\"京东生鲜凯特芒\">商品名称：京东生鲜凯特芒</li>\r\n<li title=\"4533173\">商品编号：4533173</li>\r\n<li title=\"3.005kg\">商品毛重：3.005kg</li>\r\n<li title=\"中国大陆\">商品产地：中国大陆</li>\r\n<li title=\"国产\">国产/进口：国产</li>\r\n<li title=\"凯特芒\">分类：凯特芒</li>\r\n<li title=\"2kg-4kg\">重量：2kg-4kg</li>\r\n<li title=\"中国（四川）\">原产地：中国（四川）</li>\r\n</ul>',1000,10.00,200,'images/goods/596c3ac4N43d78063.jpg',0,1),(4,'正宗麻阳冰糖橙',29.90,29.90,'5.00kg','湖南麻阳冰糖橙之乡，大湘西云贵高原的二级梯度地带，富硒土壤，肥沃的红沙土孕育出甜味的好水果，麻阳是湖产水果的重要产销地，好山好水好生活，中国著名的长寿之乡，地理条件优越，生产的冰糖橙果型美观、橙色艳丽','<ul class=\"attributes-list\">\r\n<li title=\"5000g\">净含量:&nbsp;5000g</li>\r\n<li title=\"食用农产品\">包装方式:&nbsp;食用农产品</li>\r\n<li title=\"同城24小时物流送货上门\">同城服务:&nbsp;同城24小时物流送货上门</li>\r\n<li title=\"水果先生\">品牌:&nbsp;水果先生</li>\r\n<li title=\"单品\">售卖方式:&nbsp;单品</li>\r\n<li title=\"否\">是否为有机食品:&nbsp;否</li>\r\n<li title=\"8-15℃\">生鲜储存温度:&nbsp;8-15℃</li>\r\n<li title=\"中国大陆\">产地:&nbsp;中国大陆</li>\r\n<li title=\"湖南省\">省份:&nbsp;湖南省</li>\r\n<li title=\"怀化市\">城市:&nbsp;怀化市</li>\r\n<li title=\"5人份\">套餐份量:&nbsp;5人份</li>\r\n<li title=\"1个月\">套餐周期:&nbsp;1个月</li>\r\n<li title=\"1周2次\">配送频次:&nbsp;1周2次</li>\r\n<li title=\"0-50元\">价格:&nbsp;0-50元</li>\r\n</ul>',2,10.00,10,'images/goods/TB2t2aOydBopuFjSZPcXXc9EpXa_593851963.jpg',0,1),(5,'正宗红心柚福建平和琯溪蜜柚红肉',25.80,25.80,'2250g','收藏减7元 正宗红心柚福建平和琯溪蜜柚红肉柚子农家新鲜水果包邮 ','<ul class=\"attributes-list\">\r\n<li title=\"2250g\">净含量:&nbsp;2250g</li>\r\n<li title=\"食用农产品\">包装方式:&nbsp;食用农产品</li>\r\n<li title=\"同城24小时物流送货上门\">同城服务:&nbsp;同城24小时物流送货上门</li>\r\n<li title=\"他山果业\">品牌:&nbsp;他山果业</li>\r\n<li title=\"单品\">售卖方式:&nbsp;单品</li>\r\n<li title=\"8-15℃\">生鲜储存温度:&nbsp;8-15℃</li>\r\n<li title=\"1月 2月 9月 10月 11月 12月\">热卖时间:&nbsp;1月 2月 9月 10月 11月 12月</li>\r\n<li title=\"中国大陆\">产地:&nbsp;中国大陆</li>\r\n<li title=\"福建省\">省份:&nbsp;福建省</li>\r\n<li title=\"漳州市\">城市:&nbsp;漳州市</li>\r\n<li title=\"3人份\">套餐份量:&nbsp;3人份</li>\r\n<li title=\"1周\">套餐周期:&nbsp;1周</li>\r\n<li title=\"1周1次\">配送频次:&nbsp;1周1次</li>\r\n<li title=\"平和琯溪蜜柚\">特产品类:&nbsp;平和琯溪蜜柚</li>\r\n<li title=\"红心柚\">水果种类:&nbsp;红心柚</li>\r\n</ul>\r\n<p><img src=\"https://img.alicdn.com/imgextra/i3/2616083165/TB200tFaPifF1Jjy1zkXXX0pVXa_!!2616083165.jpg\" alt=\"\" width=\"317\" height=\"348\" /></p>',996,0.00,14,'images/goods/TB2cjd0b3MPMeJjy1XcXXXpppXa_2616083165.jpg',0,1),(6,'正宗湘西纽荷尔脐橙',68.00,23.80,'2500g',' 正宗湘西纽荷尔脐橙孕妇新鲜水果现摘橙子甜橙5斤包邮非赣南脐橙  产地直发 现摘现发. 保证自然果，树上成熟 ，新鲜发售，不打蜡 不催熟 不染色 不打甜蜜素 肉脆水份多;脐橙可批发可代发。详细请咨询客','<ul class=\"attributes-list\">\r\n<li title=\"2500g\">净含量:&nbsp;2500g</li>\r\n<li title=\"食用农产品\">包装方式:&nbsp;食用农产品</li>\r\n<li title=\"同城24小时物流送货上门\">同城服务:&nbsp;同城24小时物流送货上门</li>\r\n<li title=\"单品\">售卖方式:&nbsp;单品</li>\r\n<li title=\"否\">是否为有机食品:&nbsp;否</li>\r\n<li title=\"8-15℃\">生鲜储存温度:&nbsp;8-15℃</li>\r\n<li title=\"1月 2月 3月 12月\">热卖时间:&nbsp;1月 2月 3月 12月</li>\r\n<li title=\"中国大陆\">产地:&nbsp;中国大陆</li>\r\n<li title=\"湖南省\">省份:&nbsp;湖南省</li>\r\n<li title=\"怀化市\">城市:&nbsp;怀化市</li>\r\n<li title=\"3人份\">套餐份量:&nbsp;3人份</li>\r\n<li title=\"1周\">套餐周期:&nbsp;1周</li>\r\n<li title=\"1周1次\">配送频次:&nbsp;1周1次</li>\r\n<li title=\"纽荷尔脐橙\">特产品类:&nbsp;纽荷尔脐橙</li>\r\n<li title=\"0-50元\">价格:&nbsp;0-50元</li>\r\n<li title=\"脐橙\">水果种类:&nbsp;脐橙</li>\r\n</ul>',1000,0.00,20,'images/goods/TB2GVpxmBcHL1JjSZJiXXcKcpXa_593851963.jpg',0,1),(7,'湘西塔罗科血橙',128.00,68.00,'5000g','预售湘西塔罗科血橙10斤包邮新鲜水果红肉橙子冰糖橙非中华血脐橙 ','<ul class=\"attributes-list\">\r\n<li title=\"5000g\">净含量:&nbsp;5000g</li>\r\n<li title=\"食用农产品\">包装方式:&nbsp;食用农产品</li>\r\n<li title=\"0.15kg\">单果重量:&nbsp;0.15kg</li>\r\n<li title=\"同城24小时物流送货上门\">同城服务:&nbsp;同城24小时物流送货上门</li>\r\n<li title=\"湘西塔罗科血橙\">品牌:&nbsp;湘西塔罗科血橙</li>\r\n<li title=\"单品\">售卖方式:&nbsp;单品</li>\r\n<li title=\"否\">是否为有机食品:&nbsp;否</li>\r\n<li title=\"0-8℃\">生鲜储存温度:&nbsp;0-8℃</li>\r\n<li title=\"1月 2月 3月 12月\">热卖时间:&nbsp;1月 2月 3月 12月</li>\r\n<li title=\"中国大陆\">产地:&nbsp;中国大陆</li>\r\n<li title=\"湖南省\">省份:&nbsp;湖南省</li>\r\n<li title=\"湘西土家族苗族自治州\">城市:&nbsp;湘西土家族苗族自治州</li>\r\n<li title=\"5人份\">套餐份量:&nbsp;5人份</li>\r\n<li title=\"塔罗科血橙\">特产品类:&nbsp;塔罗科血橙</li>\r\n<li title=\"51-100元\">价格:&nbsp;51-100元</li>\r\n<li title=\"血橙\">水果种类:&nbsp;血橙</li>\r\n</ul>',10,0.00,5,'images/goods/TB2vUkKbF6.F1JjSZFpXXcZjXXa_593851963.jpg',0,1),(8,'美国新奇士进口柠檬',50.00,36.00,'900g','8个装大果，新店开张，单果110-120克左右，至少900克左右，本店在广州江南果批内有实体店，一手货源，量大者价格从优，可直接致电：13590697960，黄生','<div id=\"attributes\" class=\"attributes\">\r\n<ul class=\"attributes-list\">\r\n<li title=\"900g\">净含量:&nbsp;900g</li>\r\n<li title=\"食用农产品\">包装方式:&nbsp;食用农产品</li>\r\n<li title=\"中国\">原产地:&nbsp;中国</li>\r\n<li title=\"同城24小时物流送货上门\">同城服务:&nbsp;同城24小时物流送货上门</li>\r\n<li title=\"天天鲜果乐园\">品牌:&nbsp;天天鲜果乐园</li>\r\n<li title=\"单品\">售卖方式:&nbsp;单品</li>\r\n<li title=\"否\">是否为有机食品:&nbsp;否</li>\r\n<li title=\"1月 2月 3月 4月 5月 6月 7月 8月 9月 10月 11月 12月\">热卖时间:&nbsp;1月 2月 3月 4月 5月 6月 7月 8月 9月 10月 11月 12月</li>\r\n<li title=\"中国大陆\">产地:&nbsp;中国大陆</li>\r\n<li title=\"广东省\">省份:&nbsp;广东省</li>\r\n<li title=\"广州市\">城市:&nbsp;广州市</li>\r\n<li title=\"1人份\">套餐份量:&nbsp;1人份</li>\r\n<li title=\"12个月\">套餐周期:&nbsp;12个月</li>\r\n<li title=\"1周2次\">配送频次:&nbsp;1周2次</li>\r\n<li title=\"0-50元\">价格:&nbsp;0-50元</li>\r\n<li title=\"黄柠檬\">水果种类:&nbsp;黄柠檬</li>\r\n</ul>\r\n<p><img src=\"https://img.alicdn.com/imgextra/i3/2864635314/TB2J0QJnFXXXXbgXpXXXXXXXXXX_!!2864635314.jpg\" alt=\"\" width=\"384\" height=\"256\" /></p>\r\n</div>',0,0.00,0,'images/goods/TB2jYQHnFXXXXbFXpXXXXXXXXXX_2864635314.jpg',0,1),(9,'海南莲雾水果 黑珍珠莲雾',98.00,39.80,'1000g',' 2斤海南莲雾水果 黑珍珠莲雾 水果批发包邮新鲜包邮当季水果  海南果园直购水果，需要其它斤数的亲可以联系客服咨询，拍的越多越优惠。','<ul class=\"attributes-list\">\r\n<li title=\"食用农产品\">包装方式:&nbsp;食用农产品</li>\r\n<li title=\"莲雾\">水果种类:&nbsp;莲雾</li>\r\n<li title=\"1000\">重量(g):&nbsp;1000</li>\r\n<li title=\"中国大陆\">产地:&nbsp;中国大陆</li>\r\n<li title=\"海南省\">省份:&nbsp;海南省</li>\r\n<li title=\"三亚市\">城市:&nbsp;三亚市</li>\r\n</ul>\r\n<p><img src=\"https://img.alicdn.com/imgextra/i4/2512544011/TB2iB0IbNwlyKJjSZFsXXar3XXa_!!2512544011.jpg\" alt=\"\" width=\"474\" height=\"565\" /></p>',993,0.00,67,'images/goods/TB2RS8MyhhmpuFjSZFyXXcLdFXa_2512544011.jpg',0,1),(10,'金都一号红色红心火龙果',138.00,49.90,'2500g','海南红心火龙果与越南火龙果相比海南果个头小皮更薄，一人1个食用刚刚好，口感甜度上海南果更胜一筹。且海南果产期比越南果更长，生长发育也更为成熟。5斤8--9个果。','<ul class=\"attributes-list\">\r\n<li title=\"食用农产品\">包装方式:&nbsp;食用农产品</li>\r\n<li title=\"单品\">售卖方式:&nbsp;单品</li>\r\n<li title=\"火龙果\">水果种类:&nbsp;火龙果</li>\r\n<li title=\"2500\">重量(g):&nbsp;2500</li>\r\n<li title=\"中国大陆\">产地:&nbsp;中国大陆</li>\r\n<li title=\"海南省\">省份:&nbsp;海南省</li>\r\n<li title=\"三亚市\">城市:&nbsp;三亚市</li>\r\n<li title=\"1周\">套餐周期:&nbsp;1周</li>\r\n</ul>',20,0.00,12,'images/goods/TB2GunPpHXlpuFjSszfXXcSGXXa_2512544011.jpg',0,1),(11,'南果梨新鲜东北果香梨酒香梨小酥',8.00,5.50,'500g','南果梨新鲜东北果香梨酒香梨小酥梨辽宁鞍山海城南国梨拍10斤包邮 ','<ul class=\"attributes-list\">\r\n<li title=\"500g\">净含量:&nbsp;500g</li>\r\n<li title=\"食用农产品\">包装方式:&nbsp;食用农产品</li>\r\n<li title=\"1月 2月 3月 8月 9月 10月 11月 12月\">热卖时间:&nbsp;1月 2月 3月 8月 9月 10月 11月 12月</li>\r\n<li title=\"中国大陆\">产地:&nbsp;中国大陆</li>\r\n<li title=\"辽宁省\">省份:&nbsp;辽宁省</li>\r\n<li title=\"鞍山市\">城市:&nbsp;鞍山市</li>\r\n<li title=\"鞍山南果梨\">特产品类:&nbsp;鞍山南果梨</li>\r\n<li title=\"南果梨\">水果种类:&nbsp;南果梨</li>\r\n</ul>',110,5.00,630,'images/goods/TB239kQXwn.PuJjSZFkXXc_lpXa_679577800.jpg',0,1),(12,'海南芒果青皮',128.00,69.90,'4kg','海南芒果青皮澳芒凯特澳芒新鲜水果绿皮澳芒金煌芒果大青芒果8斤 ','<ul class=\"attributes-list\">\r\n<li title=\"4000g\">净含量:&nbsp;4000g</li>\r\n<li title=\"食用农产品\">包装方式:&nbsp;食用农产品</li>\r\n<li title=\"中国大陆\">产地:&nbsp;中国大陆</li>\r\n<li title=\"海南省\">省份:&nbsp;海南省</li>\r\n<li title=\"三亚市\">城市:&nbsp;三亚市</li>\r\n<li title=\"凯特芒\">水果种类:&nbsp;凯特芒</li>\r\n</ul>',16395,0.00,77,'images/goods/TB2GZtytrxmpuFjSZJiXXXauVXa_2512544011.jpg',0,1),(13,'红心木瓜',88.00,29.80,'2500g','海南三亚红心木瓜 海南水果 新鲜木瓜 海南红心木瓜 5斤特价包邮','<ul class=\"attributes-list\">\r\n<li title=\"2500g\">净含量:&nbsp;2500g</li>\r\n<li title=\"食用农产品\">包装方式:&nbsp;食用农产品</li>\r\n<li title=\"中国大陆\">产地:&nbsp;中国大陆</li>\r\n<li title=\"海南省\">省份:&nbsp;海南省</li>\r\n<li title=\"三亚市\">城市:&nbsp;三亚市</li>\r\n</ul>',16395,0.00,5,'images/goods/TB2W.Gyq4XlpuFjSsphXXbJOXXa_2512544011.jpg',0,1),(14,'百香果',118.00,49.80,'1500g','百香果 水果批发包邮 新鲜水果鸡蛋果时令水果西番莲 3斤精选大果','<ul class=\"attributes-list\">\r\n<li title=\"食用农产品\">包装方式:&nbsp;食用农产品</li>\r\n<li title=\"百香果\">水果种类:&nbsp;百香果</li>\r\n<li title=\"1500\">重量(g):&nbsp;1500</li>\r\n<li title=\"中国大陆\">产地:&nbsp;中国大陆</li>\r\n<li title=\"海南省\">省份:&nbsp;海南省</li>\r\n<li title=\"三亚市\">城市:&nbsp;三亚市</li>\r\n</ul>',13424,0.00,7,'images/goods/TB2qVirsbXlpuFjy1zbXXb_qpXa_2512544011.jpg',0,1),(15,'云南蒙自石榴',39.90,22.90,'1.82kg','蒙生 云南蒙自石榴 6粒装 单果约重230-280g 新鲜水果 ','<ul class=\"parameter2 p-parameter-list\">\r\n<li title=\"京东生鲜云南蒙自石榴\">商品名称：京东生鲜云南蒙自石榴</li>\r\n<li title=\"5309412\">商品编号：5309412</li>\r\n<li title=\"1.82kg\">商品毛重：1.82kg</li>\r\n<li title=\"云南\">商品产地：云南</li>\r\n<li title=\"国产\">国产/进口：国产</li>\r\n<li title=\"石榴\">分类：石榴</li>\r\n<li title=\"1kg-2kg\">重量：1kg-2kg</li>\r\n<li title=\"简装\">包装：简装</li>\r\n</ul>',1000,10.00,110,'images/goods/59814190Nf62f4166.jpg',0,1),(16,'欢乐果园 泰国金枕头冷冻榴莲',54.90,54.90,'500g','欢乐果园 泰国金枕头冷冻榴莲 1盒装 约重430-450g','<ul class=\"parameter2 p-parameter-list\">\r\n<li title=\"欢乐果园泰国金枕头冷冻榴莲 1盒450g\">商品名称：欢乐果园泰国金枕头冷冻榴莲 1盒450g</li>\r\n<li title=\"4087436\">商品编号：4087436</li>\r\n<li title=\"490.00g\">商品毛重：490.00g</li>\r\n<li title=\"泰国\">商品产地：泰国</li>\r\n<li title=\"进口\">国产/进口：进口</li>\r\n<li title=\"榴莲\">分类：榴莲</li>\r\n<li title=\"1kg以下\">重量：1kg以下</li>\r\n</ul>',1230,0.00,210,'images/goods/588739d0N2e112a59.jpg',0,1),(17,'南非红西柚',49.90,49.90,'1.89kg',' 欢乐果园 优选南非红西柚 4个装 单果约400g-430g 新鲜水果','<ul class=\"parameter2 p-parameter-list\">\r\n<li title=\"欢乐果园南非红西柚 4个装\">商品名称：欢乐果园南非红西柚 4个装</li>\r\n<li title=\"5231398\">商品编号：5231398</li>\r\n<li title=\"1.89kg\">商品毛重：1.89kg</li>\r\n<li title=\"南非\">商品产地：南非</li>\r\n<li title=\"进口\">国产/进口：进口</li>\r\n<li title=\"葡萄柚/西柚\">分类：葡萄柚/西柚</li>\r\n<li title=\"1kg-2kg\">重量：1kg-2kg</li>\r\n<li title=\"南非\">原产地：南非</li>\r\n</ul>',318,0.00,12,'images/goods/597ffc7eN77e99523.jpg',0,1),(18,'五丰 美仑达 精品特级 琯溪蜜',18.80,18.80,'2.2kg','五丰 美仑达 精品特级 琯溪蜜柚 白心柚子2粒装 2.5kg-3kg 简致礼盒 新鲜水果 ','<ul id=\"parameter-brand\" class=\"p-parameter-list\">\r\n<li title=\"美仑达（Melonend）\">品牌： <a href=\"https://list.jd.com/list.html?cat=12218,12221,13562&amp;ev=exbrand_175138\" target=\"_blank\">美仑达（Melonend）</a></li>\r\n</ul>\r\n<ul class=\"parameter2 p-parameter-list\">\r\n<li title=\"美仑达特级琯溪蜜柚2白肉\">商品名称：美仑达特级琯溪蜜柚2白肉</li>\r\n<li title=\"3627928\">商品编号：3627928</li>\r\n<li title=\"2.2kg\">商品毛重：2.2kg</li>\r\n<li title=\"福建漳州平和县\">商品产地：福建漳州平和县</li>\r\n<li title=\"国产\">国产/进口：国产</li>\r\n<li title=\"蜜柚\">分类：蜜柚</li>\r\n<li title=\"2kg-4kg\">重量：2kg-4kg</li>\r\n</ul>',110,0.00,120,'images/goods/57d7c4b9N8c2e5e53.jpg',0,1),(19,' 越南巴沙鱼柳',11.99,11.99,'500g',' 海鲜颂 越南巴沙鱼柳 冷冻 原装进口 海鲜水产 单片试吃装 无骨无刺 辅食佳品 肉嫩味闰 火锅涮料','<ul id=\"parameter-brand\" class=\"p-parameter-list\">\r\n<li title=\"海鲜颂\">品牌： <a href=\"https://list.jd.com/list.html?cat=12218,12222,12241&amp;ev=exbrand_261652\" target=\"_blank\">海鲜颂</a></li>\r\n</ul>\r\n<ul class=\"parameter2 p-parameter-list\">\r\n<li title=\"海鲜颂 越南巴沙鱼柳 冷冻 原装进口 海鲜水产 单片试吃装\">商品名称：海鲜颂 越南巴沙鱼柳 冷冻 原装进口 海鲜水产 单片试吃装</li>\r\n<li title=\"12399583521\">商品编号：12399583521</li>\r\n<li title=\"海鲜颂官方旗舰店\">店铺： <a href=\"https://changshengfoodshyw.jd.com\" target=\"_blank\">海鲜颂官方旗舰店</a></li>\r\n<li title=\"1.0kg\">商品毛重：1.0kg</li>\r\n<li title=\"冷冻\">保存状态：冷冻</li>\r\n<li title=\"越南\">原产地：越南</li>\r\n<li title=\"1kg-2kg\">重量：1kg-2kg</li>\r\n<li title=\"海水\">海水/淡水：海水</li>\r\n<li title=\"进口\">国产/进口：进口</li>\r\n<li title=\"简装\">包装：简装</li>\r\n<li title=\"巴沙鱼\">分类：巴沙鱼</li>\r\n<li title=\"煎炸，蒸菜\">烹饪建议：煎炸，蒸菜</li>\r\n</ul>\r\n<p><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t9202/117/461798230/68049/699f8584/59a90a69Nd570931f.jpg\" alt=\"\" width=\"577\" height=\"397\" /><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t7690/215/2148971307/75803/4c4d93a4/59a90a6bNfa85c6f2.jpg\" alt=\"\" width=\"574\" height=\"322\" /></p>',1000,10.00,60,'images/goods/58c23d15N42cccb05.jpg',0,2),(20,' 熟冻北极虾',49.00,49.00,'500g',' 海鲜颂 熟冻北极虾 北极甜虾 头籽 腹籽 加拿大进口 海鲜水产 500g（40-50只） 捕捞后海上立即加熟！加拿大进口野生北极甜虾 70%以上带籽 20%-30%黑头！','<ul id=\"parameter-brand\" class=\"p-parameter-list\">\r\n<li title=\"海鲜颂\">品牌： <a href=\"https://list.jd.com/list.html?cat=12218,12222,12242&amp;ev=exbrand_261652\" target=\"_blank\">海鲜颂</a></li>\r\n</ul>\r\n<ul class=\"parameter2 p-parameter-list\">\r\n<li title=\"海鲜颂 熟冻北极虾 北极甜虾 头籽 腹籽 加拿大进口 海鲜水产 500g（40-50只）\">商品名称：海鲜颂 熟冻北极虾 北极甜虾 头籽 腹籽 加拿大进口 海鲜水产 500g（40-50只）</li>\r\n<li title=\"15972865240\">商品编号：15972865240</li>\r\n<li title=\"海鲜颂官方旗舰店\">店铺： <a href=\"https://changshengfoodshyw.jd.com\" target=\"_blank\">海鲜颂官方旗舰店</a></li>\r\n<li title=\"500.00g\">商品毛重：500.00g</li>\r\n<li title=\"冷冻\">保存状态：冷冻</li>\r\n<li title=\"500g-1kg\">重量：500g-1kg</li>\r\n<li title=\"火锅，炒菜，煎炸，蒸菜，烧烤，加热即食\">烹饪建议：火锅，炒菜，煎炸，蒸菜，烧烤，加热即食</li>\r\n<li title=\"进口\">国产/进口：进口</li>\r\n<li title=\"简装\">包装：简装</li>\r\n<li title=\"北极甜虾\">分类：北极甜虾</li>\r\n<li title=\"加拿大\">原产地：加拿大</li>\r\n</ul>\r\n<p><a href=\"https://list.jd.com/list.html?cat=12218,12222,12242&amp;ev=exbrand_261652\" target=\"_blank\"><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t9424/185/341092540/183550/95fbe2fd/59a65dc5Nc18e3951.jpg\" alt=\"\" width=\"790\" height=\"908\" /></a><a href=\"https://list.jd.com/list.html?cat=12218,12222,12242&amp;ev=exbrand_261652\" target=\"_blank\"><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t8536/177/359483447/69027/e391852d/59a65dc5N5fe1c914.jpg\" alt=\"\" width=\"790\" height=\"427\" /></a></p>',120,10.00,30,'images/goods/59a65da9Nbf9ca08c.jpg',0,2),(21,' 蒲江黄心猕猴桃',19.90,19.90,'750g','蒲江地标水果之王黄心猕猴桃,水果皇后,维C之冠,果肉细嫩、香气浓郁、口感香甜清爽、酸度极低，营养丰富，特别是微量元素中的含钙量较高，富含VC，无毛、果汁特多！纯甜的猕猴桃哦！','<ul class=\"attributes-list\">\r\n<li title=\"750g\">净含量:&nbsp;750g</li>\r\n<li title=\"食用农产品\">包装方式:&nbsp;食用农产品</li>\r\n<li title=\"50-70g\">单果重量:&nbsp;50-70g</li>\r\n<li title=\"15个装\">单箱规格:&nbsp;15个装</li>\r\n<li title=\"SPRJ/蜀蒲人家\">品牌:&nbsp;SPRJ/蜀蒲人家</li>\r\n<li title=\"单品\">售卖方式:&nbsp;单品</li>\r\n<li title=\"0-8℃\">生鲜储存温度:&nbsp;0-8℃</li>\r\n<li title=\"1月 2月 3月 8月 9月 10月 11月 12月\">热卖时间:&nbsp;1月 2月 3月 8月 9月 10月 11月 12月</li>\r\n<li title=\"中国大陆\">产地:&nbsp;中国大陆</li>\r\n<li title=\"四川省\">省份:&nbsp;四川省</li>\r\n<li title=\"成都市\">城市:&nbsp;成都市</li>\r\n<li title=\"5人份\">套餐份量:&nbsp;5人份</li>\r\n<li title=\"6个月\">套餐周期:&nbsp;6个月</li>\r\n<li title=\"1周2次\">配送频次:&nbsp;1周2次</li>\r\n<li title=\"蒲江猕猴桃\">特产品类:&nbsp;蒲江猕猴桃</li>\r\n<li title=\"0-50元\">价格:&nbsp;0-50元</li>\r\n<li title=\"0-50元\">水果种类:&nbsp;黄心</li>\r\n</ul>\r\n<p><img src=\"https://img.alicdn.com/imgextra/i3/267179735/TB2vJaupVXXXXXuXXXXXXXXXXXX_!!267179735.jpg\" alt=\"\" width=\"750\" height=\"794\" /></p>\r\n<p><img src=\"https://img.alicdn.com/imgextra/i2/267179735/TB27GCgpVXXXXa0XXXXXXXXXXXX_!!267179735.jpg\" alt=\"\" width=\"750\" height=\"572\" /></p>',14827,0.00,3,'images/goods/TB2wjoBapXXXXbVXXXXXXXXXXXX_267179735.jpg',0,1),(22,'冰糖心红富士丑苹果',19.00,19.00,'500g','	新疆阿克苏冰糖心红富士丑苹果10斤新鲜水果整箱包邮 非烟台陕西  新疆原产 正宗阿克苏 冰糖心 脆甜多汁 ','<p class=\"attr-list-hd tm-clear\"><em>产品参数：</em></p>\r\n<ul id=\"J_AttrUL\">\r\n<li title=\"新疆维吾尔族自治区阿克苏农场\">厂名：新疆维吾尔族自治区阿克苏农场</li>\r\n<li title=\"新疆阿克苏红旗坡柯柯牙灌溉区斯迪克冰糖心苹果种植地\">厂址：新疆阿克苏红旗坡柯柯牙灌溉区斯迪克冰糖心苹果种植地</li>\r\n<li title=\"0731-52770177\">厂家联系方式：0731-52770177</li>\r\n<li title=\"新疆阿克苏冰糖心苹果\">配料表：新疆阿克苏冰糖心苹果</li>\r\n<li title=\"低温冷藏保鲜\">储藏方法：低温冷藏保鲜</li>\r\n<li title=\"15\">保质期：15 天</li>\r\n<li title=\"无\">食品添加剂：无</li>\r\n<li title=\"&nbsp;5000g\">净含量:&nbsp;5000g</li>\r\n<li title=\"&nbsp;包装\">包装方式:&nbsp;包装</li>\r\n<li id=\"J_attrBrandName\" title=\"&nbsp;甜可果园\">品牌:&nbsp;甜可果园</li>\r\n<li title=\"&nbsp;80mm（含）-85mm(不含)\">苹果果径:&nbsp;80mm（含）-85mm(不含)</li>\r\n<li title=\"&nbsp;1月&nbsp;2月&nbsp;11月&nbsp;12月\">热卖时间:&nbsp;1月&nbsp;2月&nbsp;11月&nbsp;12月</li>\r\n<li title=\"&nbsp;中国大陆\">产地:&nbsp;中国大陆</li>\r\n<li title=\"&nbsp;新疆维吾尔族自治区\">省份:&nbsp;新疆维吾尔族自治区</li>\r\n<li title=\"&nbsp;阿克苏地区\">城市:&nbsp;阿克苏地区</li>\r\n<li title=\"&nbsp;5人份\">套餐份量:&nbsp;5人份</li>\r\n<li title=\"&nbsp;3个月\">套餐周期:&nbsp;3个月</li>\r\n<li title=\"&nbsp;1周2次\">配送频次:&nbsp;1周2次</li>\r\n<li title=\"&nbsp;阿克苏冰糖心苹果\">特产品类:&nbsp;阿克苏冰糖心苹果</li>\r\n<li title=\"&nbsp;201-300元\">价格:&nbsp;201-300元</li>\r\n<li title=\"&nbsp;冰糖心\">水果种类:&nbsp;冰糖心</li>\r\n</ul>\r\n<p><img src=\"https://img.alicdn.com/imgextra/i3/2623953058/TB2YAHVaOGO.eBjSZFpXXb3tFXa_!!2623953058.jpg\" alt=\"\" width=\"750\" height=\"1501\" /></p>',47039,0.00,3369,'images/goods/TB10hvYjRcHL1JjSZFBXXaiGXXa_0-item_pic.jpg_430x430q90.jpg',0,1),(23,'人参果人生果',26.80,26.80,'500g','云南石林人参果人生果5斤圆果水果包邮新鲜长寿非甘肃清泉雪莲果  石林人生果，圆果，现货！现货！现货！ ','<p class=\"attr-list-hd tm-clear\"><em>产品参数：</em></p>\r\n<ul id=\"J_AttrUL\">\r\n<li title=\"云南果格农业科技有限公司\">厂名：云南果格农业科技有限公司</li>\r\n<li title=\"云南省昆明市官渡区凉亭中路10号\">厂址：云南省昆明市官渡区凉亭中路10号</li>\r\n<li title=\"0871-63555412\">厂家联系方式：0871-63555412</li>\r\n<li title=\"30\">保质期：30 天</li>\r\n<li title=\"&nbsp;2500g\">净含量:&nbsp;2500g</li>\r\n<li title=\"&nbsp;包装\">包装方式:&nbsp;包装</li>\r\n<li title=\"&nbsp;同城24小时物流送货上门\">同城服务:&nbsp;同城24小时物流送货上门</li>\r\n<li id=\"J_attrBrandName\" title=\"&nbsp;长春湖\">品牌:&nbsp;长春湖</li>\r\n<li title=\"&nbsp;人参果2.5千克\">系列:&nbsp;人参果2.5千克</li>\r\n<li title=\"&nbsp;人参果5斤装\">规格:&nbsp;人参果5斤装</li>\r\n<li title=\"&nbsp;单品\">售卖方式:&nbsp;单品</li>\r\n<li title=\"&nbsp;否\">是否为有机食品:&nbsp;否</li>\r\n<li title=\"&nbsp;其他\">水果种类:&nbsp;其他</li>\r\n<li title=\"&nbsp;0-8℃\">生鲜储存温度:&nbsp;0-8℃</li>\r\n<li title=\"&nbsp;8月&nbsp;9月&nbsp;10月&nbsp;11月&nbsp;12月\">热卖时间:&nbsp;8月&nbsp;9月&nbsp;10月&nbsp;11月&nbsp;12月</li>\r\n<li title=\"&nbsp;中国大陆\">产地:&nbsp;中国大陆</li>\r\n<li title=\"&nbsp;云南省\">省份:&nbsp;云南省</li>\r\n<li title=\"&nbsp;昆明市\">城市:&nbsp;昆明市</li>\r\n<li title=\"&nbsp;1人份\">套餐份量:&nbsp;1人份</li>\r\n<li title=\"&nbsp;1周\">套餐周期:&nbsp;1周</li>\r\n<li title=\"&nbsp;1周1次\">配送频次:&nbsp;1周1次</li>\r\n<li title=\"&nbsp;51-100元\">价格:&nbsp;51-100元</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p><img src=\"https://img.alicdn.com/imgextra/i3/2212454980/TB26FgPjhuaVKJjSZFjXXcjmpXa_!!2212454980.jpg\" alt=\"\" width=\"790\" height=\"977\" /></p>\r\n<p><img src=\"https://img.alicdn.com/imgextra/i4/2212454980/TB2D4xbbbsTMeJjy1zbXXchlVXa_!!2212454980.jpg\" alt=\"\" width=\"790\" height=\"1034\" /></p>',8773,0.00,4045,'images/goods/TB287kLa3oQMeJjy0FpXXcTxpXa_2212454980.jpg_430x430q90.jpg',0,1),(24,'新鲜水果芒果',33.80,33.80,'500g','	【升森水果】新鲜水果芒果 芒果8斤热带水果青芒批发包邮  肉厚多汁 ','<p class=\"attr-list-hd tm-clear\"><em>产品参数：</em></p>\r\n<ul id=\"J_AttrUL\">\r\n<li title=\"升森水果\">厂名：升森水果</li>\r\n<li title=\"榴岛大道255号\">厂址：榴岛大道255号</li>\r\n<li title=\"18805767699\">厂家联系方式：18805767699</li>\r\n<li title=\"15\">保质期：15 天</li>\r\n<li title=\"无\">食品添加剂：无</li>\r\n<li title=\"&nbsp;4000g\">净含量:&nbsp;4000g</li>\r\n<li title=\"&nbsp;散装\">包装方式:&nbsp;散装</li>\r\n<li title=\"&nbsp;500-100g\">单果重量:&nbsp;500-100g</li>\r\n<li title=\"&nbsp;中国\">原产地:&nbsp;中国</li>\r\n<li title=\"&nbsp;同城24小时物流送货上门\">同城服务:&nbsp;同城24小时物流送货上门</li>\r\n<li id=\"J_attrBrandName\" title=\"&nbsp;升森\">品牌:&nbsp;升森</li>\r\n<li title=\"&nbsp;单品\">售卖方式:&nbsp;单品</li>\r\n<li title=\"&nbsp;1月&nbsp;2月&nbsp;3月&nbsp;4月&nbsp;5月&nbsp;6月&nbsp;7月&nbsp;8月&nbsp;9月&nbsp;11月&nbsp;12月\">热卖时间:&nbsp;1月&nbsp;2月&nbsp;3月&nbsp;4月&nbsp;5月&nbsp;6月&nbsp;7月&nbsp;8月&nbsp;9月&nbsp;11月&nbsp;12月</li>\r\n<li title=\"&nbsp;越南\">产地:&nbsp;越南</li>\r\n<li title=\"&nbsp;2人份\">套餐份量:&nbsp;2人份</li>\r\n<li title=\"&nbsp;1周\">套餐周期:&nbsp;1周</li>\r\n<li title=\"&nbsp;1周1次\">配送频次:&nbsp;1周1次</li>\r\n<li title=\"&nbsp;其他\">水果种类:&nbsp;其他</li>\r\n<li title=\"&nbsp;0-50元\">价格:&nbsp;0-50元</li>\r\n</ul>\r\n<p><img src=\"https://img.alicdn.com/imgextra/i1/1070626038/TB2utcretqUQKJjSZFIXXcOkFXa_!!1070626038.jpg\" alt=\"\" width=\"750\" height=\"1430\" /></p>',1223,0.00,1511,'images/goods/TB2iNMXs1J8puFjy1XbXXagqVXa_1070626038.jpg_430x430q90.jpg',0,1),(25,'红心猕猴桃',21.00,21.00,'500g',' 果然亮 四川蒲江红心猕猴桃新鲜5斤胜黄心水果现摘现发精品奇异果  正宗，来自国家地理标志猕猴桃示范区','<p class=\"attr-list-hd tm-clear\"><em>产品参数：</em></p>\r\n<ul id=\"J_AttrUL\">\r\n<li title=\"四川蒲江猕猴桃示范基地\">厂名：四川蒲江猕猴桃示范基地</li>\r\n<li title=\"四川蒲江猕猴桃示范基地\">厂址：四川蒲江猕猴桃示范基地</li>\r\n<li title=\"02864620011\">厂家联系方式：02864620011</li>\r\n<li title=\"常温放熟\">储藏方法：常温放熟</li>\r\n<li title=\"10\">保质期：10 天</li>\r\n<li title=\"&nbsp;2400g\">净含量:&nbsp;2400g</li>\r\n<li title=\"&nbsp;散装\">包装方式:&nbsp;散装</li>\r\n<li id=\"J_attrBrandName\" title=\"&nbsp;果然亮\">品牌:&nbsp;果然亮</li>\r\n<li title=\"&nbsp;套餐一&nbsp;套餐二\">套餐:&nbsp;套餐一&nbsp;套餐二</li>\r\n<li title=\"&nbsp;8月&nbsp;9月&nbsp;10月&nbsp;11月&nbsp;12月\">热卖时间:&nbsp;8月&nbsp;9月&nbsp;10月&nbsp;11月&nbsp;12月</li>\r\n<li title=\"&nbsp;中国大陆\">产地:&nbsp;中国大陆</li>\r\n<li title=\"&nbsp;四川省\">省份:&nbsp;四川省</li>\r\n<li title=\"&nbsp;成都市\">城市:&nbsp;成都市</li>\r\n<li title=\"&nbsp;0-50元\">价格:&nbsp;0-50元</li>\r\n<li title=\"&nbsp;红心\">水果种类:&nbsp;红心</li>\r\n</ul>\r\n<p><img src=\"https://img.alicdn.com/imgextra/i1/3299399456/TB2fYvwaUgQMeJjy0FiXXXhqXXa_!!3299399456.jpg\" alt=\"\" width=\"750\" height=\"1002\" /></p>',12342,0.00,15561,'images/goods/TB2K0G5cDZRMeJjSspnXXcJdFXa_3299399456.jpg_430x430q90.jpg',0,1),(26,'越南玉芒 芒果 青皮芒果',29.90,29.90,'500g',' 梁老师 越南玉芒 芒果 青皮芒果热带水果 香甜汁多 现摘现发 8斤  现摘现发 现货','<p class=\"attr-list-hd tm-clear\"><em>产品参数：</em></p>\r\n<ul id=\"J_AttrUL\">\r\n<li title=\"成都寒号鸟商贸有限公司\">厂名：成都寒号鸟商贸有限公司</li>\r\n<li title=\"都江堰\">厂址：都江堰</li>\r\n<li title=\"02887110607\">厂家联系方式：02887110607</li>\r\n<li title=\"30\">保质期：30 天</li>\r\n<li title=\"&nbsp;4000g\">净含量:&nbsp;4000g</li>\r\n<li title=\"&nbsp;包装\">包装方式:&nbsp;包装</li>\r\n<li title=\"&nbsp;100-600g\">单果重量:&nbsp;100-600g</li>\r\n<li title=\"&nbsp;中国\">原产地:&nbsp;中国</li>\r\n<li title=\"&nbsp;同城24小时物流送货上门\">同城服务:&nbsp;同城24小时物流送货上门</li>\r\n<li id=\"J_attrBrandName\" title=\"&nbsp;梁老师\">品牌:&nbsp;梁老师</li>\r\n<li title=\"&nbsp;单品\">售卖方式:&nbsp;单品</li>\r\n<li title=\"&nbsp;1月&nbsp;2月&nbsp;3月&nbsp;4月&nbsp;7月&nbsp;8月&nbsp;9月&nbsp;10月&nbsp;11月&nbsp;12月\">热卖时间:&nbsp;1月&nbsp;2月&nbsp;3月&nbsp;4月&nbsp;7月&nbsp;8月&nbsp;9月&nbsp;10月&nbsp;11月&nbsp;12月</li>\r\n<li title=\"&nbsp;越南\">产地:&nbsp;越南</li>\r\n<li title=\"&nbsp;其他\">水果种类:&nbsp;其他</li>\r\n<li title=\"&nbsp;0-50元\">价格:&nbsp;0-50元</li>\r\n</ul>\r\n<p><img src=\"https://img.alicdn.com/imgextra/i3/2926174945/TB28DN0X7Gj11JjSZFMXXXnRVXa_!!2926174945.jpg\" alt=\"\" width=\"790\" height=\"5682\" /></p>',21331,0.00,1235,'images/goods/TB29F0TX7Gj11JjSZFMXXXnRVXa_2926174945.jpg_430x430q90.jpg',0,1),(28,'1',1.00,1.00,'500g','1','<p>111111111111</p>',0,0.00,0,'images/goods/2017/10/22/Hydrangeas.jpg',0,1),(29,'2',1.00,1.00,'500g','1111','<p>111111111111111111111111111111</p>',0,0.00,0,'images/goods/2017/10/22/20171022113427289302.jpg',0,1);
/*!40000 ALTER TABLE `goods_goodsinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_reviews`
--

DROP TABLE IF EXISTS `goods_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `context` longtext NOT NULL,
  `par_review_id` int(11) DEFAULT NULL,
  `reviews_good_id` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_reviews_par_review_id_cb0f0ed00b1c8e2_fk_goods_reviews_id` (`par_review_id`),
  KEY `goods_rev_reviews_good_id_41b66f17c1ef4272_fk_goods_goodsinfo_id` (`reviews_good_id`),
  CONSTRAINT `goods_rev_reviews_good_id_41b66f17c1ef4272_fk_goods_goodsinfo_id` FOREIGN KEY (`reviews_good_id`) REFERENCES `goods_goodsinfo` (`id`),
  CONSTRAINT `goods_reviews_par_review_id_cb0f0ed00b1c8e2_fk_goods_reviews_id` FOREIGN KEY (`par_review_id`) REFERENCES `goods_reviews` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_reviews`
--

LOCK TABLES `goods_reviews` WRITE;
/*!40000 ALTER TABLE `goods_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_typeinfo`
--

DROP TABLE IF EXISTS `goods_typeinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_typeinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_title` varchar(15) NOT NULL,
  `isdelete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_typeinfo`
--

LOCK TABLES `goods_typeinfo` WRITE;
/*!40000 ALTER TABLE `goods_typeinfo` DISABLE KEYS */;
INSERT INTO `goods_typeinfo` VALUES (1,'新鲜水果',0),(2,'海鲜水产',0),(3,'猪牛羊肉',0),(4,'禽类蛋品',0),(5,'新鲜蔬菜',0),(6,'速冻食品',0);
/*!40000 ALTER TABLE `goods_typeinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_orderdetailinfo`
--

DROP TABLE IF EXISTS `order_orderdetailinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_orderdetailinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(5,2) NOT NULL,
  `count` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_orderdetaili_good_id_b7fa2278c2ffbd4_fk_goods_goodsinfo_id` (`good_id`),
  KEY `order_orderdetailinfo_69dfcb07` (`order_id`),
  CONSTRAINT `order_orderdetai_order_id_1f2944371fcb42c6_fk_order_orderinfo_id` FOREIGN KEY (`order_id`) REFERENCES `order_orderinfo` (`id`),
  CONSTRAINT `order_orderdetaili_good_id_b7fa2278c2ffbd4_fk_goods_goodsinfo_id` FOREIGN KEY (`good_id`) REFERENCES `goods_goodsinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_orderdetailinfo`
--

LOCK TABLES `order_orderdetailinfo` WRITE;
/*!40000 ALTER TABLE `order_orderdetailinfo` DISABLE KEYS */;
INSERT INTO `order_orderdetailinfo` VALUES (29,25.80,2,5,1508575633),(30,21.00,2,25,1508585952),(31,21.00,12,8,1508585953),(32,29.90,2,26,1508588297),(33,19.90,3,21,1508592894),(34,33.80,7,24,1510974150);
/*!40000 ALTER TABLE `order_orderdetailinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_orderinfo`
--

DROP TABLE IF EXISTS `order_orderinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_orderinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `isPlay` tinyint(1) NOT NULL,
  `total` decimal(6,2) NOT NULL,
  `address` varchar(150) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_orderinfo_user_id_71dfb5b78c515f1f_fk_user_user_id` (`user_id`),
  CONSTRAINT `order_orderinfo_user_id_71dfb5b78c515f1f_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1510974151 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_orderinfo`
--

LOCK TABLES `order_orderinfo` WRITE;
/*!40000 ALTER TABLE `order_orderinfo` DISABLE KEYS */;
INSERT INTO `order_orderinfo` VALUES (1508575633,'2017-10-21 11:25:31.400554',1,61.60,'北京市 海淀区 东北旺西路8号中关村软件园 （李明收） 18200007528',4),(1508585952,'2017-10-21 11:44:38.443613',1,52.00,'北京市 海淀区 东北旺西路8号中关村软件园 （李明收） 18200007528',4),(1508585953,'2017-10-21 12:08:32.740242',0,21.00,'123',4),(1508588297,'2017-10-21 12:18:17.331065',0,69.80,'北京市 海淀区 东北旺西路8号中关村软件园 （李明收） 18200007528',4),(1508592894,'2017-10-21 13:35:26.142279',1,69.70,'北京市 海淀区 东北旺西路8号中关村软件园 （李明收） 18200007528',4),(1510974150,'2017-11-18 03:02:32.059759',1,246.60,'1 （1收） 13666666666',1);
/*!40000 ALTER TABLE `order_orderinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_address`
--

DROP TABLE IF EXISTS `user_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipients` varchar(20) NOT NULL,
  `add` varchar(60) NOT NULL,
  `cel` varchar(11) NOT NULL,
  `postcode` varchar(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_address_e8701ad4` (`user_id`),
  CONSTRAINT `user_address_user_id_2af8884ea6fbaf96_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_address`
--

LOCK TABLES `user_address` WRITE;
/*!40000 ALTER TABLE `user_address` DISABLE KEYS */;
INSERT INTO `user_address` VALUES (2,'李明','北京市 海淀区 东北旺西路8号中关村软件园','18200007528','450000',4),(4,'立夏','河南省 郑州市 郑东新区 龙子湖高校园区','13210907520','450000',4),(5,'1','1','13666666666','450000',1);
/*!40000 ALTER TABLE `user_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user`
--

DROP TABLE IF EXISTS `user_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(13) NOT NULL,
  `upwd` varchar(40) NOT NULL,
  `ucel` varchar(11) NOT NULL,
  `uadd` varchar(20) DEFAULT NULL,
  `uemail` varchar(254) NOT NULL,
  `isdelete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user`
--

LOCK TABLES `user_user` WRITE;
/*!40000 ALTER TABLE `user_user` DISABLE KEYS */;
INSERT INTO `user_user` VALUES (1,'13849182150','7c4a8d09ca3762af61e59520943dc26494f8941b','13849182150',NULL,'123@qq.com',0),(2,'13809189150','7c4a8d09ca3762af61e59520943dc26494f8941b','13809189150',NULL,'123@qq.com',0),(3,'13140182150','7c4a8d09ca3762af61e59520943dc26494f8941b','13140182150',NULL,'123@qq.com',0),(4,'13849182199','7c4a8d09ca3762af61e59520943dc26494f8941b','13849182199',NULL,'123@qq.com',0);
/*!40000 ALTER TABLE `user_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-24 18:14:48
