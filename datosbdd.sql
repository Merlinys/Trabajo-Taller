-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: restobarbdd
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `ADMIN_RUT` char(13) NOT NULL,
  `ADMIN_MOMBRE` varchar(50) DEFAULT NULL,
  `ADMIN_PASS` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ADMIN_RUT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('12345678-9','Josh','4321'),('21268331-0','Benjamin','1234');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$YpLccuBtuiUWdgJApU1pbk$6pvEkPwjbKuAQBs4c/qI5ObqZXFxb5eUsspzK3czyZA=','2022-11-17 22:53:20.980042',1,'Benja','','','benjaminaguilera493@gmail.com',1,1,'2022-11-17 22:52:51.636484');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banco`
--

DROP TABLE IF EXISTS `banco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banco` (
  `BANCO_ID` int NOT NULL,
  `BANCO_NOMBRE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`BANCO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banco`
--

LOCK TABLES `banco` WRITE;
/*!40000 ALTER TABLE `banco` DISABLE KEYS */;
INSERT INTO `banco` VALUES (1,'santander'),(2,'estado'),(3,'bci'),(4,'fallabela');
/*!40000 ALTER TABLE `banco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `CLI_RUT` char(13) NOT NULL,
  `CLI_NOMBRE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CLI_RUT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('12022','Agustin'),('21123','Martin'),('211234','Benjamin');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_of`
--

DROP TABLE IF EXISTS `com_of`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `com_of` (
  `COM_ID` int NOT NULL,
  `OF_ID` int NOT NULL,
  `COM_OF_CANTIDAD` int DEFAULT NULL,
  `COM_OF_PRECIO` int DEFAULT NULL,
  PRIMARY KEY (`COM_ID`,`OF_ID`),
  KEY `FK_COM_OF2` (`OF_ID`),
  CONSTRAINT `FK_COM_OF` FOREIGN KEY (`COM_ID`) REFERENCES `comanda` (`COM_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_COM_OF2` FOREIGN KEY (`OF_ID`) REFERENCES `oferta` (`OF_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_of`
--

LOCK TABLES `com_of` WRITE;
/*!40000 ALTER TABLE `com_of` DISABLE KEYS */;
INSERT INTO `com_of` VALUES (111,1,2,1500),(112,1,2,1500),(113,1,2,1500);
/*!40000 ALTER TABLE `com_of` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_prod`
--

DROP TABLE IF EXISTS `com_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `com_prod` (
  `COM_ID` int NOT NULL,
  `PROD_ID` int NOT NULL,
  `CP_CANTIDAD` int DEFAULT NULL,
  `CP_PRECIO` int DEFAULT NULL,
  PRIMARY KEY (`COM_ID`,`PROD_ID`),
  KEY `FK_COM_PROD2` (`PROD_ID`),
  CONSTRAINT `FK_COM_PROD` FOREIGN KEY (`COM_ID`) REFERENCES `comanda` (`COM_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_COM_PROD2` FOREIGN KEY (`PROD_ID`) REFERENCES `producto` (`PROD_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_prod`
--

LOCK TABLES `com_prod` WRITE;
/*!40000 ALTER TABLE `com_prod` DISABLE KEYS */;
INSERT INTO `com_prod` VALUES (113,2222222,1,1700),(114,1111111,4,3200);
/*!40000 ALTER TABLE `com_prod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comanda`
--

DROP TABLE IF EXISTS `comanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comanda` (
  `COM_ID` int NOT NULL,
  `GAR_RUT` char(13) NOT NULL,
  `VEN_ID` int DEFAULT NULL,
  `CLI_RUT` char(13) DEFAULT NULL,
  `MESA_ID` int NOT NULL,
  `COM_FECHA_HORA` datetime DEFAULT NULL,
  `COM_NRO_PERSONAS` int DEFAULT NULL,
  PRIMARY KEY (`COM_ID`),
  KEY `FK_CLI_COM` (`CLI_RUT`),
  KEY `FK_COM_GAR` (`GAR_RUT`),
  KEY `FK_COM_MESA` (`MESA_ID`),
  KEY `FK_VEN_COM` (`VEN_ID`),
  CONSTRAINT `FK_CLI_COM` FOREIGN KEY (`CLI_RUT`) REFERENCES `cliente` (`CLI_RUT`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_COM_GAR` FOREIGN KEY (`GAR_RUT`) REFERENCES `garzon` (`GAR_RUT`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_COM_MESA` FOREIGN KEY (`MESA_ID`) REFERENCES `mesa` (`MESA_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_VEN_COM` FOREIGN KEY (`VEN_ID`) REFERENCES `venta` (`VEN_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comanda`
--

LOCK TABLES `comanda` WRITE;
/*!40000 ALTER TABLE `comanda` DISABLE KEYS */;
INSERT INTO `comanda` VALUES (111,'12345',1,NULL,1,'2022-11-18 14:00:00',2),(112,'12345',1,NULL,1,'2022-11-18 14:30:00',2),(113,'12345',1,NULL,1,'2022-11-18 14:35:00',2),(114,'12345',2,'21123',2,'2022-11-19 15:00:00',4),(115,'12345',3,'211234',1,'2022-11-20 16:00:00',2);
/*!40000 ALTER TABLE `comanda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-11-17 18:40:52.751906'),(2,'auth','0001_initial','2022-11-17 18:40:53.033076'),(3,'admin','0001_initial','2022-11-17 18:40:53.111535'),(4,'admin','0002_logentry_remove_auto_add','2022-11-17 18:40:53.118300'),(5,'admin','0003_logentry_add_action_flag_choices','2022-11-17 18:40:53.123805'),(6,'contenttypes','0002_remove_content_type_name','2022-11-17 18:40:53.168252'),(7,'auth','0002_alter_permission_name_max_length','2022-11-17 18:40:53.199021'),(8,'auth','0003_alter_user_email_max_length','2022-11-17 18:40:53.216882'),(9,'auth','0004_alter_user_username_opts','2022-11-17 18:40:53.221975'),(10,'auth','0005_alter_user_last_login_null','2022-11-17 18:40:53.254477'),(11,'auth','0006_require_contenttypes_0002','2022-11-17 18:40:53.256546'),(12,'auth','0007_alter_validators_add_error_messages','2022-11-17 18:40:53.262602'),(13,'auth','0008_alter_user_username_max_length','2022-11-17 18:40:53.295640'),(14,'auth','0009_alter_user_last_name_max_length','2022-11-17 18:40:53.328393'),(15,'auth','0010_alter_group_name_max_length','2022-11-17 18:40:53.339936'),(16,'auth','0011_update_proxy_permissions','2022-11-17 18:40:53.347478'),(17,'auth','0012_alter_user_first_name_max_length','2022-11-17 18:40:53.380650'),(18,'sessions','0001_initial','2022-11-17 18:40:53.416277');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('vii8ecor9mcw3944yzdnb7n4w9h3golx','.eJxVjDsOwjAQBe_iGll2_IlDSZ8zWLveDQ4gW4qTCnF3EikFtG9m3ltE2NYct8ZLnElchRaX3w0hPbkcgB5Q7lWmWtZlRnko8qRNjpX4dTvdv4MMLe91cIbcpEJi1xs_dQM7rYPBHlGHhB2wBWcNQPCg0Dgib9Pg1V4EYmvF5wvc6DfQ:1ovnl2:jAHog-BOaGYrOctyCw1Z_PM69OLabQV-ra_DfawH_V0','2022-12-01 22:53:20.984054');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garzon`
--

DROP TABLE IF EXISTS `garzon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garzon` (
  `GAR_RUT` char(13) NOT NULL,
  `GAR_NOMBRE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`GAR_RUT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garzon`
--

LOCK TABLES `garzon` WRITE;
/*!40000 ALTER TABLE `garzon` DISABLE KEYS */;
INSERT INTO `garzon` VALUES ('12345','Felipe');
/*!40000 ALTER TABLE `garzon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesa`
--

DROP TABLE IF EXISTS `mesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mesa` (
  `MESA_ID` int NOT NULL,
  `MESA_NOMBRE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MESA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesa`
--

LOCK TABLES `mesa` WRITE;
/*!40000 ALTER TABLE `mesa` DISABLE KEYS */;
INSERT INTO `mesa` VALUES (1,'mesa central'),(2,'mesa amarilla'),(3,'mesa roble');
/*!40000 ALTER TABLE `mesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oferta`
--

DROP TABLE IF EXISTS `oferta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oferta` (
  `OF_ID` int NOT NULL,
  `ADMIN_RUT` char(13) NOT NULL,
  `OF_FINICIO` date DEFAULT NULL,
  `OF_FFIN` date DEFAULT NULL,
  `OF_PRECIO` int DEFAULT NULL,
  PRIMARY KEY (`OF_ID`),
  KEY `FK_OF_ADMIN` (`ADMIN_RUT`),
  CONSTRAINT `FK_OF_ADMIN` FOREIGN KEY (`ADMIN_RUT`) REFERENCES `admin` (`ADMIN_RUT`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oferta`
--

LOCK TABLES `oferta` WRITE;
/*!40000 ALTER TABLE `oferta` DISABLE KEYS */;
INSERT INTO `oferta` VALUES (1,'21268331-0','2022-11-21','2022-11-30',1500);
/*!40000 ALTER TABLE `oferta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `PAGO_ID` int NOT NULL,
  `BANCO_ID` int NOT NULL,
  `VEN_ID` int DEFAULT NULL,
  `TPAG_ID` int NOT NULL,
  `PAGO_FECHA_HORA` datetime DEFAULT NULL,
  `PAGO_NRO_BOUCHER` varchar(100) DEFAULT NULL,
  `PAGO_MONTO` int DEFAULT NULL,
  PRIMARY KEY (`PAGO_ID`),
  KEY `FK_PA_BAN` (`BANCO_ID`),
  KEY `FK_PA_TP` (`TPAG_ID`),
  KEY `FK_VEN_PAG` (`VEN_ID`),
  CONSTRAINT `FK_PA_BAN` FOREIGN KEY (`BANCO_ID`) REFERENCES `banco` (`BANCO_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_PA_TP` FOREIGN KEY (`TPAG_ID`) REFERENCES `tipo_pago` (`TPAG_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_VEN_PAG` FOREIGN KEY (`VEN_ID`) REFERENCES `venta` (`VEN_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (1,1,1,2,'2022-11-18 00:00:00','1234123',4700),(2,2,2,2,'2022-11-19 16:00:00','4123412',3200),(3,2,3,2,'2022-11-20 17:00:00','4412313',3000);
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prod_oferta`
--

DROP TABLE IF EXISTS `prod_oferta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prod_oferta` (
  `PROD_ID` int NOT NULL,
  `OF_ID` int NOT NULL,
  PRIMARY KEY (`PROD_ID`,`OF_ID`),
  KEY `FK_PROD_OFERTA2` (`OF_ID`),
  CONSTRAINT `FK_PROD_OFERTA` FOREIGN KEY (`PROD_ID`) REFERENCES `producto` (`PROD_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_PROD_OFERTA2` FOREIGN KEY (`OF_ID`) REFERENCES `oferta` (`OF_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_oferta`
--

LOCK TABLES `prod_oferta` WRITE;
/*!40000 ALTER TABLE `prod_oferta` DISABLE KEYS */;
INSERT INTO `prod_oferta` VALUES (3333333,1),(4444444,1);
/*!40000 ALTER TABLE `prod_oferta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `PROD_ID` int NOT NULL,
  `ADMIN_RUT` char(13) NOT NULL,
  `TP_ID` int NOT NULL,
  `PROD_NOMBRE` varchar(50) DEFAULT NULL,
  `PROD_PRECIO` int DEFAULT NULL,
  `PROD_DISPONIBLE` tinyint(1) DEFAULT NULL,
  `PROD_FECHA_INGRESO` date DEFAULT NULL,
  PRIMARY KEY (`PROD_ID`),
  KEY `FK_PRO_ADMIN` (`ADMIN_RUT`),
  KEY `FK_PTP` (`TP_ID`),
  CONSTRAINT `FK_PRO_ADMIN` FOREIGN KEY (`ADMIN_RUT`) REFERENCES `admin` (`ADMIN_RUT`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_PTP` FOREIGN KEY (`TP_ID`) REFERENCES `tipo_prod` (`TP_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1111111,'12345678-9',2,'piscola',800,1,'2022-01-17'),(2222222,'21268331-0',2,'mojito',1700,1,'2022-04-01'),(3333333,'21268331-0',1,'completo',1000,1,'2021-01-01'),(4444444,'21268331-0',2,'jugo natural',1300,1,'2021-02-01'),(5555555,'21268331-0',1,'hamburguesa ',2000,1,'2021-05-04'),(6666666,'12345678-9',1,'chorrilana',13000,1,'2022-06-20'),(7777777,'12345678-9',2,'michelada',15000,1,'2022-03-01');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_pago`
--

DROP TABLE IF EXISTS `tipo_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_pago` (
  `TPAG_ID` int NOT NULL,
  `TPAG_NOMBRE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`TPAG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_pago`
--

LOCK TABLES `tipo_pago` WRITE;
/*!40000 ALTER TABLE `tipo_pago` DISABLE KEYS */;
INSERT INTO `tipo_pago` VALUES (1,'efectivo'),(2,'debito'),(3,'credito'),(4,'transferencia'),(5,'sodexo');
/*!40000 ALTER TABLE `tipo_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_prod`
--

DROP TABLE IF EXISTS `tipo_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_prod` (
  `TP_ID` int NOT NULL,
  `TP_NOMBRE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`TP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_prod`
--

LOCK TABLES `tipo_prod` WRITE;
/*!40000 ALTER TABLE `tipo_prod` DISABLE KEYS */;
INSERT INTO `tipo_prod` VALUES (1,'comidas'),(2,'bebidas');
/*!40000 ALTER TABLE `tipo_prod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `VEN_ID` int NOT NULL,
  `VEN_FECHA` date DEFAULT NULL,
  PRIMARY KEY (`VEN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,'2022-11-18'),(2,'2022-11-19'),(3,'2022-11-20');
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-18 22:09:50
