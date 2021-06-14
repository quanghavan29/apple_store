CREATE DATABASE  IF NOT EXISTS `apple_store` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `apple_store`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: apple_store
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` varchar(255) NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('iPhone_11','iPhone 11'),('iPhone_12','iPhone 12'),('iPhone_X','iPhone X');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` varchar(255) NOT NULL,
  `category_id` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `category_id_idx` (`category_id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('iPhone_11','iPhone_11','iPhone 11'),('iPhone_12','iPhone_12','iPhone 12'),('iPhone_12_Pro','iPhone_12','iPhone 12 Pro'),('iPhone_12_Pro_Max','iPhone_12','iPhone 12 Pro Max');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_detail`
--

DROP TABLE IF EXISTS `product_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_detail` (
  `product_detail_id` varchar(255) NOT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `sale` int DEFAULT NULL,
  `image_detail` varchar(255) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `specifications_id` varchar(255) DEFAULT NULL,
  `image_intro` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_detail_id`),
  KEY `specifications_id_idx` (`specifications_id`),
  CONSTRAINT `specifications_id` FOREIGN KEY (`specifications_id`) REFERENCES `specifications` (`specifications_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_detail`
--

LOCK TABLES `product_detail` WRITE;
/*!40000 ALTER TABLE `product_detail` DISABLE KEYS */;
INSERT INTO `product_detail` VALUES ('iPhone_11_128GB_black','iPhone_11','128GB','Black',21490,16,'iPhone_11_black.jpg',567,'iPhone_11','iPhone_11_black_intro.jpg'),('iPhone_11_128GB_green','iPhone_11','128GB','Green',21890,16,'iPhone_11_green.jpg',345,'iPhone_11','iPhone_11_green_intro.jpg'),('iPhone_11_128GB_red','iPhone_11','128GB','Red',21690,16,'iPhone_11_red.jpg',56,'iPhone_11','iPhone_11_red_intro.jpg'),('iPhone_11_128GB_white','iPhone_11','128GB','White',21590,16,'iPhone_11_white.jpg',654,'iPhone_11','iPhone_11_white_intro.jpg'),('iPhone_11_256GB_black','iPhone_11','256GB','Black',22590,5,'iPhone_11_black.jpg',34,'iPhone_11','iPhone_11_black_intro.jpg'),('iPhone_11_256GB_green','iPhone_11','256GB','Green',22890,5,'iPhone_11_green.jpg',657,'iPhone_11','iPhone_11_green_intro.jpg'),('iPhone_11_256GB_red','iPhone_11','256GB','Red',22690,5,'iPhone_11_red.jpg',657,'iPhone_11','iPhone_11_red_intro.jpg'),('iPhone_11_256GB_white','iPhone_11','256GB','White',22890,5,'iPhone_11_white.jpg',45,'iPhone_11','iPhone_11_white_intro.jpg'),('iPhone_11_64GB_black','iPhone_11','64GB','Black',18890,13,'iPhone_11_black.jpg',34,'iPhone_11','iPhone_11_black_intro.jpg'),('iPhone_11_64GB_green','iPhone_11','64GB','Green',18990,13,'iPhone_11_green.jpg',565,'iPhone_11','iPhone_11_green_intro.jpg'),('iPhone_11_64GB_red','iPhone_11','64GB','Red',18790,13,'iPhone_11_red.jpg',324,'iPhone_11','iPhone_11_red_intro.jpg'),('iPhone_11_64GB_white','iPhone_11','64GB','White',19090,13,'iPhone_11_white.jpg',767,'iPhone_11','iPhone_11_white_intro.jpg'),('iPhone_12_128GB_black','iPhone_12','128GB','Black',25690,12,'iPhone_12_black.jpg',43,'iPhone_12','iPhone_12_black_intro.jpg'),('iPhone_12_128GB_blue','iPhone_12','128GB','Blue',25990,12,'iPhone_12_blue.jpg',853,'iPhone_12','iPhone_12_blue_intro.jpg'),('iPhone_12_128GB_green','iPhone_12','128GB','Green',25890,12,'iPhone_12_green.jpg',555,'iPhone_12','iPhone_12_green_intro.jpg'),('iPhone_12_128GB_purple','iPhone_12','128GB','Purple',25490,12,'iPhone_12_purple.jpg',652,'iPhone_12','iPhone_12_purple_intro.jpg'),('iPhone_12_128GB_red','iPhone_12','128GB','Red',25590,12,'iPhone_12_red.jpg',458,'iPhone_12','iPhone_12_red_intro.jpg'),('iPhone_12_128GB_white','iPhone_12','128GB','White',25890,12,'iPhone_12_white.jpg',235,'iPhone_12','iPhone_12_white_intro.jpg'),('iPhone_12_256GB_black','iPhone_12','256GB','Black',26790,8,'iPhone_12_black.jpg',435,'iPhone_12','iPhone_12_black_intro.jpg'),('iPhone_12_256GB_blue','iPhone_12','256GB','Blue',26590,8,'iPhone_12_blue.jpg',45,'iPhone_12','iPhone_12_blue_intro.jpg'),('iPhone_12_256GB_green','iPhone_12','256GB','Green',26690,8,'iPhone_12_green.jpg',876,'iPhone_12','iPhone_12_green_intro.jpg'),('iPhone_12_256GB_purple','iPhone_12','256GB','Purple',26890,8,'iPhone_12_purple.jpg',65,'iPhone_12','iPhone_12_purple_intro.jpg'),('iPhone_12_256GB_red','iPhone_12','256GB','Red',26790,8,'iPhone_12_red.jpg',378,'iPhone_12','iPhone_12_red_intro.jpg'),('iPhone_12_256GB_white','iPhone_12','256GB','White',26690,8,'iPhone_12_white.jpg',562,'iPhone_12','iPhone_12_white_intro.jpg'),('iPhone_12_64GB_black','iPhone_12','64GB','Black',20490,5,'iPhone_12_black.jpg',647,'iPhone_12','iPhone_12_black_intro.jpg'),('iPhone_12_64GB_blue','iPhone_12','64GB','Blue',20390,5,'iPhone_12_blue.jpg',43,'iPhone_12','iPhone_12_blue_intro.jpg'),('iPhone_12_64GB_green','iPhone_12','64GB','Green',20590,5,'iPhone_12_green.jpg',546,'iPhone_12','iPhone_12_green_intro.jpg'),('iPhone_12_64GB_purple ','iPhone_12','64GB','Purple',20690,5,'iPhone_12_purple.jpg',506,'iPhone_12','iPhone_12_purple_intro.jpg'),('iPhone_12_64GB_red','iPhone_12','64GB','Red',20590,5,'iPhone_12_red.jpg',378,'iPhone_12','iPhone_12_red_intro.jpg'),('iPhone_12_64GB_white','iPhone_12','64GB','White',20390,5,'iPhone_12_white.jpg',897,'iPhone_12','iPhone_12_white_intro.jpg'),('iPhone_12_Pro_128GB_blue','iPhone_12_Pro','128GB','Blue',31090,8,'iPhone_12_Pro_blue.jpg',657,'iPhone_12_Pro','iPhone_12_Pro_blue_intro.jpg'),('iPhone_12_Pro_128GB_gold','iPhone_12_Pro','128GB','Gold',30890,8,'iPhone_12_Pro_gold.jpg',84,'iPhone_12_Pro','iPhone_12_Pro_gold_intro.jpg'),('iPhone_12_Pro_128GB_gray','iPhone_12_Pro','128GB','Gray',30790,8,'iPhone_12_Pro_gray.jpg',876,'iPhone_12_Pro','iPhone_12_Pro_gray_intro.jpg'),('iPhone_12_Pro_128GB_silver','iPhone_12_Pro','128GB','Silver',30990,8,'iPhone_12_Pro_silver.jpg',623,'iPhone_12_Pro','iPhone_12_Pro_silver_intro.jpg');
/*!40000 ALTER TABLE `product_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specifications`
--

DROP TABLE IF EXISTS `specifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specifications` (
  `specifications_id` varchar(255) NOT NULL,
  `screen` varchar(255) DEFAULT NULL,
  `ram` varchar(255) DEFAULT NULL,
  `rear_camera` varchar(255) DEFAULT NULL,
  `front_camera` varchar(255) DEFAULT NULL,
  `pin` varchar(255) DEFAULT NULL,
  `chip` varchar(255) DEFAULT NULL,
  `sim` varchar(255) DEFAULT NULL,
  `operating_system` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`specifications_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specifications`
--

LOCK TABLES `specifications` WRITE;
/*!40000 ALTER TABLE `specifications` DISABLE KEYS */;
INSERT INTO `specifications` VALUES ('iPhone_11','IPS LCD, 6.1\", Liquid Retina','4GB','2 camera 12 MP','12 MP','3110 mAh, 18 W','Apple A13 Bionic','1 Nano SIM & 1 eSIM, Hỗ trợ 4G','IOS 14'),('iPhone_12','OLED, 6.1\", Super Retina XDR','4GB','2 camera 12 MP','12 MP','2815 mAh, 20 W','Apple A14 Bionic','1 Nano SIM & 1 eSIM, Hỗ trợ 5G','IOS 14'),('iPhone_12_Pro','OLED, 6.1\", Super Retina XDR','6GB','3 camera 12 MP','12 MP','2815 mAh, 20 W','Apple A14 Bionic','1 Nano SIM & 1 eSIM, Hỗ trợ 5G','IOS 14'),('iPhone_12_Pro_Max','OLED, 6.7\", Super Retina XDR','6GB','3 camera 12 MP','12 MP','3687 mAh, 20 W','Apple A14 Bionic','1 Nano SIM & 1 eSIM, Hỗ trợ 5G','IOS 14');
/*!40000 ALTER TABLE `specifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'apple_store'
--

--
-- Dumping routines for database 'apple_store'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-13 23:26:36
