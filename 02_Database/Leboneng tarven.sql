-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: leboneng_tavern
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `date` date NOT NULL,
  `clock_in` datetime DEFAULT NULL,
  `clock_out` datetime DEFAULT NULL,
  `hours_worked` decimal(5,2) DEFAULT NULL,
  `overtime_hours` decimal(5,2) DEFAULT NULL,
  `attendance_status` enum('present','absent','late','flagged') NOT NULL DEFAULT 'present',
  `clock_in_latitude` decimal(10,7) DEFAULT NULL,
  `clock_in_longitude` decimal(10,7) DEFAULT NULL,
  `location_latitude` decimal(10,7) DEFAULT NULL,
  `location_longitude` decimal(10,7) DEFAULT NULL,
  `location_verified` tinyint(1) NOT NULL DEFAULT '1',
  `selfie_image_url` longtext,
  `notes` text,
  `start_cash` decimal(10,2) DEFAULT NULL,
  `end_cash` decimal(10,2) DEFAULT NULL,
  `cash_variance` decimal(10,2) DEFAULT NULL,
  `sales_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `transaction_count` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_employee_date` (`employee_id`,`date`),
  KEY `idx_status` (`attendance_status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,1,'2026-06-17','2026-06-17 13:14:04',NULL,NULL,NULL,'present',-29.8570000,31.0247000,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,0.00,0,'2026-06-17 13:14:04','2026-06-17 13:14:04'),(2,6,'2026-06-17','2026-06-17 13:32:39',NULL,NULL,NULL,'present',-29.8570000,31.0247000,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,0.00,0,'2026-06-17 13:32:39','2026-06-17 13:32:39'),(3,6,'2026-06-18','2026-06-18 09:04:40',NULL,NULL,NULL,'present',-29.8570000,31.0247000,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,0.00,0,'2026-06-18 09:04:40','2026-06-18 09:04:40'),(4,6,'2026-06-22','2026-06-22 08:36:49',NULL,NULL,NULL,'present',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,0.00,0,'2026-06-22 08:36:49','2026-06-22 08:36:49');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance_audit_log`
--

DROP TABLE IF EXISTS `attendance_audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance_audit_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `action` varchar(50) NOT NULL,
  `details` json DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_audit_log`
--

LOCK TABLES `attendance_audit_log` WRITE;
/*!40000 ALTER TABLE `attendance_audit_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance_audit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_audit_log`
--

DROP TABLE IF EXISTS `order_audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_audit_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` varchar(64) NOT NULL,
  `changed_by_id` int NOT NULL,
  `changed_by_role` varchar(20) DEFAULT NULL,
  `old_status` varchar(20) DEFAULT NULL,
  `new_status` varchar(20) DEFAULT NULL,
  `old_payment` varchar(20) DEFAULT NULL,
  `new_payment` varchar(20) DEFAULT NULL,
  `order_total` decimal(10,2) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_changed_by` (`changed_by_id`),
  KEY `idx_new_status` (`new_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_audit_log`
--

LOCK TABLES `order_audit_log` WRITE;
/*!40000 ALTER TABLE `order_audit_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_audit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` varchar(20) NOT NULL,
  `user_id` int DEFAULT NULL,
  `items` json NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `status` varchar(20) DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_name` varchar(100) DEFAULT NULL,
  `payment` varchar(20) DEFAULT 'cash',
  `source` enum('staff','online') DEFAULT 'online',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'ORD-323093',2,'[{\"qty\": 1, \"name\": \"stayvesent\", \"price\": \"5.00\"}, {\"qty\": 1, \"name\": \"fried chips\", \"price\": \"20.00\"}, {\"qty\": 1, \"name\": \"begar\", \"price\": \"40.00\"}]',65.00,'completed','2026-05-09 01:32:03',NULL,'cash','online'),(2,'ORD-424818',2,'[{\"qty\": 2, \"name\": \"Flying Fish Lemon\", \"price\": \"28.00\"}]',56.00,'completed','2026-05-09 01:50:24',NULL,'cash','online'),(3,'ORD-506840',2,'[{\"qty\": 2, \"name\": \"stayvesent\", \"price\": \"5.00\"}]',10.00,'completed','2026-05-09 01:51:46',NULL,'cash','online'),(4,'ORD-912826',2,'[{\"qty\": 2, \"name\": \"Bernini Blush\", \"price\": \"30.00\"}]',60.00,'completed','2026-05-09 02:15:12',NULL,'cash','online'),(5,'ORD-910086',2,'[{\"qty\": 1, \"name\": \"Heineken\", \"price\": \"30.00\"}, {\"qty\": 1, \"name\": \"Hansa Pilsener\", \"price\": \"24.00\"}]',54.00,'completed','2026-05-09 05:01:50',NULL,'cash','online'),(6,'ORD-723521',2,'[{\"qty\": 1, \"name\": \"Premium Whiskey\", \"price\": \"350.00\"}]',350.00,'completed','2026-05-09 13:18:44',NULL,'cash','online'),(7,'ORD-685292',2,'[{\"qty\": 2, \"name\": \"Bernini classic\", \"price\": \"28.00\"}]',56.00,'completed','2026-05-10 02:54:45',NULL,'cash','online'),(8,'ORD-668462',2,'[{\"qty\": 1, \"name\": \"Premium Whiskey\", \"price\": \"300.00\"}]',300.00,'completed','2026-05-11 12:31:08',NULL,'cash','online'),(9,'ORD-814861',2,'[{\"qty\": 1, \"name\": \"Premium Whiskey\", \"price\": \"300.00\"}]',300.00,'completed','2026-05-11 12:33:35',NULL,'cash','online'),(10,'ORD-203973',2,'[{\"qty\": 2, \"name\": \"Bernini classic\", \"price\": \"28.00\"}]',56.00,'completed','2026-05-12 12:00:04',NULL,'cash','online'),(11,'ORD-970041',2,'[{\"qty\": 2, \"name\": \"Premium Whiskey\", \"price\": \"300.00\"}]',600.00,'completed','2026-05-13 11:16:10',NULL,'cash','online'),(12,'ORD-701856',2,'[{\"qty\": 3, \"name\": \"Premium Whiskey\", \"price\": \"300.00\"}]',900.00,'completed','2026-05-13 11:28:22',NULL,'cash','online'),(13,'ORD-412758',2,'[{\"qty\": 5, \"name\": \"Premium Whiskey\", \"price\": \"305.00\"}]',1525.00,'completed','2026-05-13 12:13:33',NULL,'cash','online'),(14,'ORD-303644',2,'[{\"qty\": 4, \"name\": \"Premium Whiskey\", \"price\": \"305.00\"}]',1220.00,'completed','2026-05-13 12:28:24',NULL,'cash','online'),(15,'ORD-037922',2,'[{\"qty\": 9, \"name\": \"Premium Whiskey\", \"price\": \"305.00\"}]',2745.00,'completed','2026-05-13 12:40:38',NULL,'cash','online'),(16,'ORD-200383',2,'[{\"qty\": 5, \"name\": \"Premium Whiskey\", \"price\": \"305.00\"}]',1525.00,'completed','2026-05-13 12:43:20',NULL,'cash','online'),(17,'ORD-586518',2,'[{\"qty\": 2, \"name\": \"Bernini classic\", \"price\": \"28.00\"}]',56.00,'completed','2026-05-15 07:53:07',NULL,'cash','online'),(18,'ORD-629911',2,'[{\"qty\": 1, \"name\": \"Bernini classic\", \"price\": \"28.00\"}]',28.00,'completed','2026-05-18 01:10:30',NULL,'cash','online'),(19,'ORD-911394',2,'[{\"qty\": 2, \"name\": \"Bernini classic\", \"price\": \"28.00\"}]',56.00,'completed','2026-05-19 21:25:11',NULL,'cash','online'),(20,'ORD-380900',2,'[{\"qty\": 1, \"name\": \"Bernini classic\", \"price\": \"28.00\"}]',28.00,'pending','2026-05-22 00:56:21',NULL,'cash','online'),(21,'ORD-780090',2,'[{\"qty\": 1, \"name\": \"Hansa Pilsener\", \"price\": \"24.00\"}, {\"qty\": 1, \"name\": \"Heineken\", \"price\": \"30.00\"}, {\"qty\": 1, \"name\": \"Bernini classic\", \"price\": \"28.00\"}]',82.00,'pending','2026-05-22 01:19:40',NULL,'cash','online'),(22,'ORD-939196',2,'[{\"qty\": 1, \"name\": \"Bernini classic\", \"price\": \"28.00\"}]',28.00,'cancelled','2026-05-22 07:28:59',NULL,'cash','online'),(23,'ORD-646481',NULL,'[{\"qty\": 1, \"name\": \"Carling Black Label\", \"price\": \"26.00\"}]',26.00,'cancelled','2026-05-22 07:57:26',NULL,'cash','online'),(24,'ORD-164413',4,'[{\"qty\": 1, \"name\": \"Hansa Pilsener\", \"price\": \"24.00\"}]',24.00,'cancelled','2026-05-22 08:06:04',NULL,'cash','online'),(25,'ORD-927125',2,'[{\"qty\": 21, \"name\": \"Bernini classic\", \"price\": \"28.00\"}]',588.00,'completed','2026-05-23 10:25:27',NULL,'cash','online'),(26,'ORD-599198',2,'[{\"qty\": 21, \"name\": \"Bernini classic\", \"price\": \"28.00\"}]',588.00,'completed','2026-05-23 10:36:39',NULL,'cash','online'),(27,'ORD-858186',2,'[{\"id\": 19, \"qty\": 5, \"name\": \"Bernini classic\", \"price\": \"28.00\"}]',140.00,'cancelled','2026-05-23 10:57:38','Thabo','cash','online'),(28,'ORD-934951',2,'[{\"id\": 19, \"qty\": 1, \"name\": \"Bernini classic\", \"price\": \"28.00\"}]',28.00,'cancelled','2026-05-23 10:58:55','Thabo','cash','online'),(29,'ORD-947735',2,'[{\"id\": 19, \"qty\": 1, \"name\": \"Bernini classic\", \"price\": \"28.00\"}]',28.00,'completed','2026-05-23 10:59:08','Thabo','cash','online'),(30,'ORD-009599',1,'[{\"id\": 19, \"qty\": 13, \"name\": \"Bernini classic\", \"price\": \"28.00\"}]',364.00,'completed','2026-05-23 11:00:10','Admin','cash','online'),(31,'ORD-349659',2,'[{\"id\": 19, \"qty\": 20, \"name\": \"Bernini classic\", \"price\": \"28.00\"}]',560.00,'completed','2026-05-23 11:05:50','Thabo','cash','online'),(32,'ORD-665080',NULL,'[{\"id\": 69, \"qty\": 1, \"name\": \"Premium Whiskey\", \"price\": \"300.00\"}]',300.00,'completed','2026-05-23 12:01:05',NULL,'cash','online'),(33,'ORD-547830',2,'[{\"id\": 65, \"qty\": 1, \"name\": \"Hunters Extreme\", \"price\": \"35.00\"}, {\"id\": 66, \"qty\": 1, \"name\": \"Redd’s Cider\", \"price\": \"30.00\"}]',65.00,'completed','2026-06-03 21:35:48','Thabo','cash','online'),(34,'ORD-461204',4,'[{\"id\": 24, \"qty\": 10, \"name\": \"Corona Extra\", \"price\": \"30.00\"}]',300.00,'completed','2026-06-04 05:21:01','Tau','cash','online'),(35,'ORD-901940',4,'[{\"id\": 19, \"qty\": 2, \"name\": \"Bernini classic\", \"price\": \"28.00\"}]',56.00,'pending','2026-06-04 05:45:02','Tau','cash','online'),(36,'ORD-689278',NULL,'[{\"id\": 32, \"qty\": 1, \"name\": \"begar\", \"price\": \"40.00\"}]',40.00,'pending','2026-06-13 18:18:09','Thabo','cash','online'),(37,'ORD-243896',NULL,'[{\"id\": 19, \"qty\": 1, \"name\": \"Bernini classic\", \"price\": \"28.00\"}]',28.00,'pending','2026-06-17 10:14:04',NULL,'cash','online'),(38,'ORD-269377',2,'[{\"id\": 19, \"qty\": 1, \"name\": \"Bernini classic\", \"price\": \"28.00\"}, {\"id\": 21, \"qty\": 1, \"name\": \"Heineken\", \"price\": \"30.00\"}]',58.00,'completed','2026-06-17 10:14:29','Thabo','cash','online'),(39,'ORD-650049',NULL,'[{\"id\": 21, \"qty\": 1, \"name\": \"Heineken\", \"price\": \"30.00\"}]',30.00,'pending','2026-06-17 10:20:50','Thabo','cash','online'),(40,'ORD-026909',NULL,'[{\"id\": 32, \"qty\": 1, \"name\": \"begar\", \"price\": \"40.00\"}]',40.00,'pending','2026-06-17 10:27:07','Thabo','cash','online'),(41,'ORD-035711',NULL,'[{\"id\": 33, \"qty\": 1, \"name\": \"fried chips\", \"price\": \"20.00\"}]',20.00,'completed','2026-06-17 10:27:16','Thabo','cash','online'),(42,'ORD-065624',2,'[{\"id\": 19, \"qty\": 1, \"name\": \"Bernini classic\", \"price\": \"28.00\"}]',28.00,'completed','2026-06-17 10:27:46','Thabo','cash','online'),(43,'ORD-087800',2,'[{\"id\": 24, \"qty\": 1, \"name\": \"Corona Extra\", \"price\": \"30.00\"}]',30.00,'completed','2026-06-17 10:28:08','Thabo','cash','online'),(44,'ORD-492175',2,'[{\"id\": 19, \"qty\": 3, \"name\": \"Bernini classic\", \"price\": \"28.00\"}]',84.00,'completed','2026-06-18 07:08:12','Thabo','cash','online'),(45,'ORD-599878',2,'[{\"id\": 21, \"qty\": 1, \"name\": \"Heineken\", \"price\": \"30.00\"}]',30.00,'cancelled','2026-06-18 07:10:00','Thabo','cash','online'),(46,'ORD-544866',6,'[{\"qty\": 2, \"price\": \"24.00\", \"productId\": 23}]',48.00,'cancelled','2026-06-18 07:25:45',NULL,'cash','online'),(47,'ORD-649973',6,'[{\"qty\": 6, \"price\": \"24.00\", \"productId\": 23}]',144.00,'cancelled','2026-06-18 07:27:30',NULL,'cash','online'),(48,'ORD-078104',6,'[{\"qty\": 1, \"price\": \"30.00\", \"productId\": 24}]',30.00,'pending','2026-06-18 08:07:58',NULL,'cash','online'),(49,'ORD-246247',6,'[{\"qty\": 2, \"price\": \"25.00\", \"productId\": 27}]',50.00,'pending','2026-06-18 08:10:46',NULL,'cash','online'),(50,'ORD-990479',6,'[{\"qty\": 1, \"price\": \"28.00\", \"productId\": 19}, {\"qty\": 1, \"price\": \"24.00\", \"productId\": 23}]',52.00,'pending','2026-06-18 08:23:10',NULL,'cash','online'),(51,'ORD-025264',6,'[{\"qty\": 1, \"price\": \"30.00\", \"productId\": 21}]',30.00,'completed','2026-06-18 08:23:45',NULL,'cash','online'),(52,'ORD-780251',6,'[{\"qty\": 1, \"price\": \"28.00\", \"productId\": 19}]',28.00,'completed','2026-06-18 08:36:20',NULL,'cash','online'),(53,'ORD-552678',6,'[{\"qty\": 2, \"price\": \"28.00\", \"productId\": 19}]',56.00,'completed','2026-06-18 12:42:33',NULL,'cash','online'),(54,'ORD-691234',6,'[{\"qty\": 2, \"price\": \"28.00\", \"productId\": 19}]',56.00,'completed','2026-06-18 12:44:51',NULL,'cash','online'),(55,'ORD-773139',6,'[{\"qty\": 1, \"price\": \"28.00\", \"productId\": 19}]',28.00,'completed','2026-06-18 13:02:53',NULL,'cash','online'),(56,'ORD-921320',6,'[{\"qty\": 1, \"price\": \"28.00\", \"productId\": 19}]',28.00,'completed','2026-06-18 13:05:21',NULL,'cash','online'),(57,'ORD-957243',6,'[{\"qty\": 1, \"price\": \"28.00\", \"productId\": 19}]',28.00,'completed','2026-06-18 13:05:57',NULL,'cash','online'),(58,'ORD-989997',6,'[{\"qty\": 1, \"price\": \"28.00\", \"productId\": 19}]',28.00,'completed','2026-06-18 13:06:30',NULL,'cash','online'),(59,'ORD-915594',6,'[{\"qty\": 6, \"price\": \"30.00\", \"productId\": 21}]',180.00,'pending','2026-06-18 13:21:56',NULL,'cash','online'),(60,'ORD-928613',6,'[{\"qty\": 2, \"price\": \"30.00\", \"productId\": 21}]',60.00,'pending','2026-06-18 13:22:09',NULL,'cash','online'),(61,'ORD-135179',NULL,'[{\"qty\": 4, \"price\": \"30.00\", \"productId\": 21}]',120.00,'completed','2026-06-19 09:42:16',NULL,'cash','online'),(62,'ORD-318931',6,'[{\"qty\": 2, \"price\": \"24.00\", \"productId\": 23}]',48.00,'pending','2026-06-19 09:45:19',NULL,'cash','online'),(63,'ORD-367999',6,'[{\"qty\": 2, \"price\": \"24.00\", \"productId\": 23}]',48.00,'completed','2026-06-19 09:46:08',NULL,'cash','online'),(64,'ORD-837812',6,'[{\"qty\": 1, \"price\": \"24.00\", \"productId\": 23}]',24.00,'pending','2026-06-19 09:53:58',NULL,'cash','online'),(65,'ORD-224785',6,'[{\"qty\": 1, \"price\": \"24.00\", \"productId\": 23}]',24.00,'completed','2026-06-19 10:00:25',NULL,'cash','online'),(66,'ORD-265264',6,'[{\"qty\": 1, \"price\": \"30.00\", \"productId\": 24}]',30.00,'completed','2026-06-19 10:01:05',NULL,'cash','online'),(67,'ORD-655148',6,'[{\"qty\": 1, \"price\": \"30.00\", \"productId\": 24}]',30.00,'cancelled','2026-06-19 10:07:35',NULL,'cash','online'),(68,'ORD-508056',6,'[{\"qty\": 1, \"price\": \"30.00\", \"productId\": 24}]',30.00,'cancelled','2026-06-19 10:38:28',NULL,'card','online'),(69,'ORD-542610',6,'[{\"qty\": 1, \"price\": \"30.00\", \"productId\": 24}]',30.00,'completed','2026-06-19 10:39:03',NULL,'card','online'),(70,'ORD-599226',6,'[{\"qty\": 6, \"price\": \"30.00\", \"productId\": 25}]',180.00,'cancelled','2026-06-19 10:39:59',NULL,'card','online'),(71,'ORD-358474',6,'[{\"qty\": 4, \"price\": \"30.00\", \"productId\": 25}]',120.00,'cancelled','2026-06-19 10:52:38',NULL,'cash','online'),(72,'ORD-982310',6,'[{\"qty\": 3, \"price\": \"30.00\", \"productId\": 25}]',90.00,'pending','2026-06-20 07:03:02',NULL,'card','staff'),(73,'ORD-754695',6,'[{\"qty\": 1, \"price\": \"30.00\", \"productId\": 25}]',30.00,'completed','2026-06-21 12:09:15',NULL,'cash','staff'),(74,'ORD-940844',2,'[{\"id\": 25, \"qty\": 1, \"name\": \"Stella Artois\", \"price\": \"30.00\"}]',30.00,'completed','2026-06-21 12:12:21','Thabo','cash','online'),(75,'ORD-052425',6,'[{\"qty\": 1, \"price\": \"30.00\", \"productId\": 25}]',30.00,'completed','2026-06-21 12:14:12',NULL,'cash','staff'),(76,'ORD-390491',NULL,'[{\"qty\": 1, \"price\": \"25.00\", \"productId\": 27}]',25.00,'completed','2026-06-21 13:09:51',NULL,'cash','staff'),(77,'ORD-416153',6,'[{\"qty\": 1, \"price\": \"26.00\", \"productId\": 26}]',26.00,'completed','2026-06-21 13:10:16',NULL,'cash','staff'),(78,'ORD-465378',2,'[{\"id\": 26, \"qty\": 1, \"name\": \"Carling Black Label\", \"price\": \"26.00\"}]',26.00,'completed','2026-06-21 13:11:05','Thabo','cash','online'),(79,'ORD-018854',2,'[{\"id\": 26, \"qty\": 1, \"name\": \"Carling Black Label\", \"price\": \"26.00\"}]',26.00,'completed','2026-06-22 06:33:39','Thabo','cash','online'),(80,'ORD-615524',6,'[{\"qty\": 1, \"price\": \"25.00\", \"productId\": 27}]',25.00,'completed','2026-06-22 07:00:16',NULL,'card','staff');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `category` varchar(50) NOT NULL,
  `img` text NOT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `lowStockThreshold` int NOT NULL DEFAULT '5',
  `barcode` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (19,'Bernini classic',28.00,'cider','https://tse3.mm.bing.net/th/id/OIP.lwH8jD05fFSguJW6Nkl0nAHaHa?rs=1&pid=ImgDetMain&o=7&rm=3',2,5,''),(21,'Heineken',30.00,'beer','https://www.bing.com/th/id/OIP.DfI9aBFLg2zmbZdzVMZaagHaLH?w=188&h=282&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2',4,5,''),(23,'Hansa Pilsener',24.00,'beer','https://i.pinimg.com/736x/c3/35/6b/c3356b0eb8b89151f8223f8383b82c99.jpg',5,5,''),(24,'Corona Extra',30.00,'cider','https://i.pinimg.com/736x/b2/92/16/b2921643056ef0c2d8d76a4ce3a7e5ff.jpg',4,5,''),(25,'Stella Artois',30.00,'beer','https://i.pinimg.com/736x/39/32/21/393221b1556ac2ff0840c291c09ff98b.jpg',4,5,''),(26,'Carling Black Label',26.00,'beer','https://i.pinimg.com/736x/02/22/80/022280ffbb0e767b12aac108f903d98b.jpg',17,5,''),(27,'Amstel Lager',25.00,'beer','https://i.pinimg.com/736x/0a/c6/d8/0ac6d86344455aa7b4a9c32f449c7397.jpg',16,5,''),(28,'Bernini Blush',30.00,'cider','https://www.makro.co.za/sys-master/images/h6d/hdc/11473550278686/silo-MIN_444869_CSC_large',20,5,''),(30,'Flying Fish Lemon',28.00,'cider','https://i.pinimg.com/736x/2a/f8/20/2af820b3d9ce4ace0ebac31bacf392a5.jpg',20,5,''),(31,'Strong Bow',28.00,'cider','https://i.pinimg.com/736x/31/40/a1/3140a15c486e269a45feebc4c234f68d.jpg',20,5,''),(32,'begar',40.00,'food','https://i1-c.pinimg.com/736x/a9/fb/d3/a9fbd33a71d72b951c36e775eb08dcb5.jpg',98,5,''),(33,'fried chips',20.00,'food','https://i.pinimg.com/736x/c5/96/79/c59679512e9161782fc74e506d6e0e63.jpg',99,5,''),(35,'stayvesent',5.00,'','',20,5,''),(38,'courtley',6.00,'','',20,5,''),(40,'6 Pippe + flavor',200.00,'hubbly','https://tse1.mm.bing.net/th/id/OIP.w0Hph4NAdRZ6JBpJ7gj3BwAAAA?pid=ImgDet&w=189&h=189&c=7&o=7&rm=3',6,5,''),(41,'2 pipe + Flavor',40.00,'hubbly','https://i1-c.pinimg.com/736x/46/90/46/46904676e791d84d6e8f8188714b565f.jpg',20,5,''),(42,'4 Pipe + flavor',150.00,'hubbly','https://tse3.mm.bing.net/th/id/OIP.DecTpjb4t0L7hHpg_HGhAQHaHa?rs=1&pid=ImgDetMain&o=7&rm=3',20,5,''),(43,'3Pipe hookah + flavor',100.00,'hubbly','https://th.bing.com/th/id/R.2ed994986ca9f31f52e6f54e2d9fc1cc?rik=KIEmXr7cX0X%2fOg&riu=http%3a%2f%2fafricasexclusivetobacconist.co.za%2fcdn%2fshop%2fproducts%2fHUB103.png%3fv%3d1649448972&ehk=WoXhUg476umiNIKQxTmUIAPwXgOawdMohhsm5TgHI%2bA%3d&risl=&pid=ImgRaw&r=0',20,5,''),(44,'Kota',30.00,'food','https://i.pinimg.com/736x/66/70/4d/66704dab3dfea58b9ce3c17b991074ca.jpg',20,5,''),(45,'Platter for 3',220.00,'food','https://i1-c.pinimg.com/736x/e9/fa/f8/e9faf8250e8a352d950383186a18c2ea.jpg',20,5,''),(46,'Smirnofff',200.00,'vodka','https://i1-c.pinimg.com/736x/a4/9e/b4/a49eb42bd244e6ba0760c90dd267c6af.jpg',20,5,''),(47,'Absolute',240.00,'vodka','https://i1-c.pinimg.com/736x/70/46/19/704619f0f782d2332c6ef344f03393f8.jpg',20,5,''),(48,'Grey Goose',250.00,'vodka','https://i1-c.pinimg.com/736x/64/a8/0a/64a80a47a736487311174d6ff0f38da6.jpg',20,5,''),(49,'Russian Bear',200.00,'vodka','https://i1-c.pinimg.com/736x/f9/81/7b/f9817b1527e2f46b04ec32646f079fac.jpg',20,5,''),(50,'Vusa African',220.00,'vodka','https://i1-c.pinimg.com/736x/75/58/ca/7558ca40bb903a1f34922a922d8aae26.jpg',20,5,''),(51,'Pravda',399.99,'vodka','https://cdn-prd-02.pnp.co.za/sys-master/images/h9d/h77/9296573923358/silo-084380422041-front-322086_515Wx515H',20,5,''),(52,'Skyy Vodka',299.99,'vodka','https://i.pinimg.com/736x/ae/f6/0a/aef60a9431f5df3e2eca196c6a378e7f.jpg',20,5,''),(53,'Ciroc',270.00,'vodka','https://i1-c.pinimg.com/736x/bc/16/2b/bc162b8ea72139c2810055a3298c1dfe.jpg',20,5,''),(54,'Three Ships whiskey',250.00,'whiskey','https://www.shoprite.co.za/medias/checkers515Wx515H-medias-10128306EA-en-shopriteGlobalProductCatalog-addb-20250808024206.webp?context=bWFzdGVyfGltYWdlc3wxODc5NnxpbWFnZS93ZWJwfGltYWdlcy9oYzcvaDcxLzEyNTQ2MzU1NzI0MzE4LndlYnB8MzRlZTBmNmFjOTg3ZTQ2YTRjZmE1ZmU5MWZhZDc0MzU1Nzk5YTBlMmUzNDJjMDU3MWRiZmMwOTJiZWMyMDNhYg',20,5,''),(56,'Jameson',300.00,'whiskey','https://i1-c.pinimg.com/736x/e4/12/c5/e412c58765540e2bb67c79a846b1f8fb.jpg',20,5,''),(57,'glenfiddich',300.00,'whiskey','https://i.pinimg.com/736x/2f/8f/55/2f8f55779540fc8bd428edbc929fec1b.jpg',20,5,''),(58,'Johnie walker Red Label',300.00,'whiskey','https://i1-c.pinimg.com/736x/3f/75/f6/3f75f6e4560c1f32583a8d8d7ed3ecf5.jpg',20,5,''),(59,'johnnie walker blue label',300.00,'whiskey','https://i1-c.pinimg.com/736x/f0/67/97/f0679774f573ddd6dc3c82fd10624a6f.jpg',20,5,''),(60,'johnnie walker Black labels',300.00,'whiskey','https://i1-c.pinimg.com/736x/ef/e1/ea/efe1ea180ca15348d9964e50101f21cf.jpg',20,5,''),(61,'savannah angry lemon',30.00,'cider','https://www.tonysqualitymeat.com.au/assets/full/4216.png?20210521092224',20,5,''),(62,'Savannah Premium',30.00,'cider','https://biz-file.com/c/2302/686759.png',20,5,''),(63,'Hunters Gold',30.00,'cider','https://tse3.mm.bing.net/th/id/OIP.EUjJcsbj91M23XLGp3VTWwHaHa?rs=1&pid=ImgDetMain&o=7&rm=3',20,5,''),(64,'Hunters Dry',30.00,'cider','https://jayswines.com/wp-content/uploads/2022/11/Buy-Hunters-Dry-330ml-online-in-Nairobi.jpg',20,5,''),(65,'Hunters Extreme',35.00,'cider','https://th.bing.com/th/id/R.0159413077ad5da5edc2e5a911ff96c4?rik=lXnU5932%2bt6Y1Q&pid=ImgRaw&r=0',5,5,''),(66,'Redd’s Cider',30.00,'cider','https://images.heb.com/is/image/HEBGrocery/001667847-1',4,5,''),(67,'Redd\'s MXD',30.00,'cider','https://tse3.mm.bing.net/th/id/OIP.16ppYbjIHK19S-sgxBZv-wAAAA?w=245&h=342&rs=1&pid=ImgDetMain&o=7&rm=3',0,5,NULL),(69,'Premium Whiskey',300.00,'whiskey','https://i1-c.pinimg.com/736x/5d/f6/15/5df615b93da326ddf77296171b41862b.jpg',19,5,'');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `role` varchar(20) DEFAULT 'customer',
  `dob` date DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `emergency_name` varchar(100) DEFAULT NULL,
  `emergency_phone` varchar(20) DEFAULT NULL,
  `refresh_token` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','Admin','Admin','admin@test.com',NULL,'$2b$10$xZILiocNZ.SgLAG.mtZIpONRsq2S9LqMeTW4VkdXFZRAt6GYV9IfO','2026-04-19 20:18:23','admin',NULL,NULL,NULL,NULL,NULL),(2,'Thabo','Thabo','Thabo','mosikidi012@gmail.com',NULL,'$2b$10$/4wKTJHg2COMU9g6vMzbn.DEfF9SNKE2td7/tQh16A6.KDOxwFbyi','2026-04-19 21:29:30','customer',NULL,NULL,NULL,NULL,NULL),(4,'Tau','Tau','Tau','tau@gmail.com',NULL,'$2b$10$MYcN5G9KFw8k6iaRtJD81e3RG.pKj3wIciXekxr/KuyYgYF2JKXHi','2026-05-22 07:55:38','customer',NULL,NULL,NULL,NULL,NULL),(5,'Test User','Test','User','test3@test.com','0712345678','$2b$10$gmq7BpESlAwrgydV3UbbCe521Vi33g0KjhjHX1lEfPpYeB.zx0JWi','2026-05-25 22:21:33','customer',NULL,NULL,NULL,NULL,NULL),(6,'Eta Mosikidi','Eta','Mosikidi','alettamosikidi@gmail.com','+27826511691','$2b$10$5wX8FLq9007AkDwl8WYjDOgL1t2Z4XShU0By2UtY1kHDY0r/.qUrO','2026-05-25 22:22:40','staff','2002-09-18','male','Aletta','0649009305',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-03 14:28:52
