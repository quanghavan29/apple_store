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
  `logo` varchar(255) DEFAULT NULL,
  `hot` int DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('Energizer','Energizer','Energizer42-b_32.jpg',13),('iPhone','iPhone (Apple)','logo-iphone-220x48.png',1),('Itel','Itel','Itel42-b_54.jpg',11),('Master','Master','Masstel42-b_0.png',12),('Mobell','Mobell','Mobell42-b_19.jpg',10),('NOKIA','NOKIA','Nokia42-b_21.jpg',9),('OnePlus','OnePlus','OnePlus42-b_36.jpg',8),('OPPO','OPPO','OPPO42-b_5.jpg',3),('Realme','Realme','Realme42-b_37.png',6),('Samsung','Samsung','Samsung42-b_25.jpg',2),('VIVO','VIVO','Vivo42-b_50.jpg',4),('Vsmart','Vsmart','Vsmart42-b_40.png',7),('Xiaomi','Xiaomi','logo-xiaomi-220x48-5.png',5);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `product_detail_id` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `FK_order_id_fh63t_idx` (`order_id`),
  KEY `FK_product_detail_id_hg72h_idx` (`product_detail_id`),
  CONSTRAINT `FK_order_id_fh63t` FOREIGN KEY (`order_id`) REFERENCES `ordered` (`order_id`),
  CONSTRAINT `FK_product_detail_id_hg72h` FOREIGN KEY (`product_detail_id`) REFERENCES `product_detail` (`product_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (78,'Samsung_Galaxy_S21_5G_128GB_white','2',88),(79,'iPhone_11_128GB_red','1',88),(80,'Samsung_Galaxy_S21_5G_128GB_gray','1',89),(81,'iPhone_12_Pro_Max_128GB_blue','2',90),(82,'iPhone_SE_2020_128_white','1',90),(83,'iPhone_11_128GB_green','2',91),(84,'Samsung_Galaxy_S21_5G_128GB_gray','2',92),(85,'iPhone_12_Pro_128GB_blue','1',92),(86,'iPhone_11_128GB_green','1',92);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordered`
--

DROP TABLE IF EXISTS `ordered`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordered` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_date` date DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `total_amount` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK_email_user_idx` (`email`),
  CONSTRAINT `FK_email_user` FOREIGN KEY (`email`) REFERENCES `users` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordered`
--

LOCK TABLES `ordered` WRITE;
/*!40000 ALTER TABLE `ordered` DISABLE KEYS */;
INSERT INTO `ordered` VALUES (88,'2021-06-26','pending',60116,'quanghavan29@gmail.com','Sóc Sơn - Hà Nội','0968904962','Hà Văn Quang'),(89,'2021-06-26','pending',20990,'quanghavan29@gmail.com','Sóc Sơn - Hà Nội','0968904962','Hà Văn Quang'),(90,'2021-06-26','pending',70375,'quanghavan29@gmail.com','Lai Cách - Xuân Giang - Sóc Sơn - Hà Nội','0998736543','Hà Văn Quang'),(91,'2021-06-26','pending',36272,'anntd@gmail.com','Lò Voi - Cầu Giấy - Hà Nội','0903928372','Nguyễn Trọng Duy An'),(92,'2021-06-26','pending',88443,'anntd@gmail.com','Luy Thuỷ - Xuân Hạ - Hoàn Kiếm','0364374636','Nguyễn Trọng Duy An');
/*!40000 ALTER TABLE `ordered` ENABLE KEYS */;
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
  `is_monopoly` tinyint DEFAULT NULL,
  `is_credit` tinyint DEFAULT NULL,
  `MFYear` int DEFAULT NULL,
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
INSERT INTO `product` VALUES ('iPhone_11','iPhone','iPhone 11',0,1,2019),('iPhone_12','iPhone','iPhone 12',0,1,2020),('iPhone_12_Pro','iPhone','iPhone 12 Pro',1,0,2020),('iPhone_12_Pro_Max','iPhone','iPhone 12 Pro Max',1,1,2020),('iPhone_SE_2020','iPhone','iPhone SE 2020',0,0,2019),('iPhone_XR','iPhone','iPhone XR',0,1,2018),('OPPO_Reno5','OPPO','OPPO Reno5',0,0,2020),('Samsung_Galaxy_M51','Samsung','Samsung Galaxy M51',1,1,2021),('Samsung_Galaxy_S21_5G','Samsung','Samsung Galaxy S21 5G',1,1,2021),('Vivo_Y53s','VIVO','Vivo Y53s',1,0,2021);
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
  `quantity_product` int DEFAULT NULL,
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
INSERT INTO `product_detail` VALUES ('iPhone_11_128GB_green','iPhone_11','128GB','Green',21590,16,'iPhone_11_green.jpg',345,'iPhone_11','iPhone_11_green_intro.jpg'),('iPhone_11_128GB_red','iPhone_11','128GB','Red',21590,16,'iPhone_11_red.jpg',56,'iPhone_11','iPhone_11_red_intro.jpg'),('iPhone_11_128GB_white','iPhone_11','128GB','White',21590,16,'iPhone_11_white.jpg',654,'iPhone_11','iPhone_11_white_intro.jpg'),('iPhone_11_256GB_green','iPhone_11','256GB','Green',22690,5,'iPhone_11_green.jpg',657,'iPhone_11','iPhone_11_green_intro.jpg'),('iPhone_11_256GB_red','iPhone_11','256GB','Red',22690,5,'iPhone_11_red.jpg',657,'iPhone_11','iPhone_11_red_intro.jpg'),('iPhone_11_256GB_white','iPhone_11','256GB','White',22690,5,'iPhone_11_white.jpg',45,'iPhone_11','iPhone_11_white_intro.jpg'),('iPhone_11_64GB_green','iPhone_11','64GB','Green',18790,13,'iPhone_11_green.jpg',565,'iPhone_11','iPhone_11_green_intro.jpg'),('iPhone_11_64GB_red','iPhone_11','64GB','Red',18790,13,'iPhone_11_red.jpg',324,'iPhone_11','iPhone_11_red_intro.jpg'),('iPhone_11_64GB_white','iPhone_11','64GB','White',18790,13,'iPhone_11_white.jpg',767,'iPhone_11','iPhone_11_white_intro.jpg'),('iPhone_12_128GB_black','iPhone_12','128GB','Black',25490,12,'iPhone_12_black.jpg',43,'iPhone_12','iPhone_12_black_intro.jpg'),('iPhone_12_128GB_blue','iPhone_12','128GB','Blue',25490,12,'iPhone_12_blue.jpg',853,'iPhone_12','iPhone_12_blue_intro.jpg'),('iPhone_12_128GB_green','iPhone_12','128GB','Green',25490,12,'iPhone_12_green.jpg',555,'iPhone_12','iPhone_12_green_intro.jpg'),('iPhone_12_128GB_purple','iPhone_12','128GB','Purple',25490,12,'iPhone_12_purple.jpg',652,'iPhone_12','iPhone_12_purple_intro.jpg'),('iPhone_12_128GB_red','iPhone_12','128GB','Red',25490,12,'iPhone_12_red.jpg',458,'iPhone_12','iPhone_12_red_intro.jpg'),('iPhone_12_128GB_white','iPhone_12','128GB','White',25490,12,'iPhone_12_white.jpg',235,'iPhone_12','iPhone_12_white_intro.jpg'),('iPhone_12_256GB_black','iPhone_12','256GB','Black',26890,8,'iPhone_12_black.jpg',435,'iPhone_12','iPhone_12_black_intro.jpg'),('iPhone_12_256GB_blue','iPhone_12','256GB','Blue',26890,8,'iPhone_12_blue.jpg',45,'iPhone_12','iPhone_12_blue_intro.jpg'),('iPhone_12_256GB_green','iPhone_12','256GB','Green',26890,8,'iPhone_12_green.jpg',876,'iPhone_12','iPhone_12_green_intro.jpg'),('iPhone_12_256GB_purple','iPhone_12','256GB','Purple',26890,8,'iPhone_12_purple.jpg',65,'iPhone_12','iPhone_12_purple_intro.jpg'),('iPhone_12_256GB_red','iPhone_12','256GB','Red',26890,8,'iPhone_12_red.jpg',378,'iPhone_12','iPhone_12_red_intro.jpg'),('iPhone_12_256GB_white','iPhone_12','256GB','White',26890,8,'iPhone_12_white.jpg',562,'iPhone_12','iPhone_12_white_intro.jpg'),('iPhone_12_64GB_black','iPhone_12','64GB','Black',20390,5,'iPhone_12_black.jpg',647,'iPhone_12','iPhone_12_black_intro.jpg'),('iPhone_12_64GB_blue','iPhone_12','64GB','Blue',20390,5,'iPhone_12_blue.jpg',43,'iPhone_12','iPhone_12_blue_intro.jpg'),('iPhone_12_64GB_green','iPhone_12','64GB','Green',20590,5,'iPhone_12_green.jpg',546,'iPhone_12','iPhone_12_green_intro.jpg'),('iPhone_12_64GB_purple ','iPhone_12','64GB','Purple',20590,5,'iPhone_12_purple.jpg',506,'iPhone_12','iPhone_12_purple_intro.jpg'),('iPhone_12_64GB_red','iPhone_12','64GB','Red',20590,5,'iPhone_12_red.jpg',378,'iPhone_12','iPhone_12_red_intro.jpg'),('iPhone_12_64GB_white','iPhone_12','64GB','White',20390,5,'iPhone_12_white.jpg',897,'iPhone_12','iPhone_12_white_intro.jpg'),('iPhone_12_Pro_128GB_blue','iPhone_12_Pro','128GB','Blue',30790,8,'iPhone_12_Pro_blue.jpg',657,'iPhone_12_Pro','iPhone_12_Pro_blue_intro.jpg'),('iPhone_12_Pro_128GB_gold','iPhone_12_Pro','128GB','Gold',30790,8,'iPhone_12_Pro_gold.jpg',84,'iPhone_12_Pro','iPhone_12_Pro_gold_intro.jpg'),('iPhone_12_Pro_128GB_gray','iPhone_12_Pro','128GB','Gray',30790,8,'iPhone_12_Pro_gray.jpg',876,'iPhone_12_Pro','iPhone_12_Pro_gray_intro.jpg'),('iPhone_12_Pro_128GB_silver','iPhone_12_Pro','128GB','Silver',30790,8,'iPhone_12_Pro_silver.jpg',623,'iPhone_12_Pro','iPhone_12_Pro_silver_intro.jpg'),('iPhone_12_Pro_256GB_blue','iPhone_12_Pro','256GB','Blue',31790,10,'iPhone_12_Pro_blue.jpg',534,'iPhone_12_Pro','iPhone_12_Pro_blue_intro.jpg'),('iPhone_12_Pro_256GB_gold','iPhone_12_Pro','256GB','Gold',31790,10,'iPhone_12_Pro_gold.jpg',56,'iPhone_12_Pro','iPhone_12_Pro_gold_intro.jpg'),('iPhone_12_Pro_256GB_gray','iPhone_12_Pro','256GB','Gray',31790,10,'iPhone_12_Pro_gray.jpg',67,'iPhone_12_Pro','iPhone_12_Pro_gray_intro.jpg'),('iPhone_12_Pro_256GB_silver','iPhone_12_Pro','256GB','Silver',31790,10,'iPhone_12_Pro_silver.jpg',794,'iPhone_12_Pro','iPhone_12_Pro_silver_intro.jpg'),('iPhone_12_Pro_512GB_blue','iPhone_12_Pro','512GB','Blue',38790,5,'iPhone_12_Pro_blue.jpg',546,'iPhone_12_Pro','iPhone_12_Pro_blue_intro.jpg'),('iPhone_12_Pro_512GB_gold','iPhone_12_Pro','512GB','Gold',38790,5,'iPhone_12_Pro_gold.jpg',8,'iPhone_12_Pro','iPhone_12_Pro_gold_intro.jpg'),('iPhone_12_Pro_512GB_gray','iPhone_12_Pro','512GB','Gray',38790,5,'iPhone_12_Pro_gray.jpg',34,'iPhone_12_Pro','iPhone_12_Pro_gray_intro.jpg'),('iPhone_12_Pro_512GB_silver','iPhone_12_Pro','512GB','Silver',38790,5,'iPhone_12_Pro_silver.jpg',905,'iPhone_12_Pro','iPhone_12_Pro_silver_intro.jpg'),('iPhone_12_Pro_Max_128GB_blue','iPhone_12_Pro_Max','128GB','Blue',32990,12,'iPhone_12_Pro_Max_blue.jpg',43,'iPhone_12_Pro_Max','iPhone_12_Pro_Max_blue_intro.jpg'),('iPhone_12_Pro_Max_128GB_gold','iPhone_12_Pro_Max','128GB','Gold',32990,12,'iPhone_12_Pro_Max_gold.jpg',798,'iPhone_12_Pro_Max','iPhone_12_Pro_Max_gold_intro.jpg'),('iPhone_12_Pro_Max_128GB_gray','iPhone_12_Pro_Max','128GB','Gray',32990,12,'iPhone_12_Pro_Max_gray.jpg',484,'iPhone_12_Pro_Max','iPhone_12_Pro_Max_gray_intro.jpg'),('iPhone_12_Pro_Max_128GB_silver','iPhone_12_Pro_Max','128GB','Silver',32990,12,'iPhone_12_Pro_Max_silver.jpg',243,'iPhone_12_Pro_Max','iPhone_12_Pro_Max_silver_intro.jpg'),('iPhone_12_Pro_Max_256GB_blue','iPhone_12_Pro_Max','256GB','Blue',37490,10,'iPhone_12_Pro_Max_blue.jpg',236,'iPhone_12_Pro_Max','iPhone_12_Pro_Max_gold_intro.jpg'),('iPhone_12_Pro_Max_256GB_gold','iPhone_12_Pro_Max','256GB','Gold',37490,10,'iPhone_12_Pro_Max_gold.jpg',654,'iPhone_12_Pro_Max','iPhone_12_Pro_Max_blue_intro.jpg'),('iPhone_12_Pro_Max_256GB_gray','iPhone_12_Pro_Max','256GB','Gray',37490,10,'iPhone_12_Pro_Max_gray.jpg',88,'iPhone_12_Pro_Max','iPhone_12_Pro_Max_gray_intro.jpg'),('iPhone_12_Pro_Max_256GB_silver','iPhone_12_Pro_Max','256GB','Silver',37490,10,'iPhone_12_Pro_Max_silver.jpg',890,'iPhone_12_Pro_Max','iPhone_12_Pro_Max_silver_intro.jpg'),('iPhone_12_Pro_Max_512GB_blue','iPhone_12_Pro_Max','512GB','Blue',41490,8,'iPhone_12_Pro_Max_blue.jpg',676,'iPhone_12_Pro_Max','iPhone_12_Pro_Max_gold_intro.jpg'),('iPhone_12_Pro_Max_512GB_gold','iPhone_12_Pro_Max','512GB','Gold',41490,8,'iPhone_12_Pro_Max_gold.jpg',56,'iPhone_12_Pro_Max','iPhone_12_Pro_Max_blue_intro.jpg'),('iPhone_12_Pro_Max_512GB_gray','iPhone_12_Pro_Max','512GB','Gray',41490,8,'iPhone_12_Pro_Max_gray.jpg',3,'iPhone_12_Pro_Max','iPhone_12_Pro_Max_gray_intro.jpg'),('iPhone_12_Pro_Max_512GB_silver','iPhone_12_Pro_Max','512GB','Silver',41490,8,'iPhone_12_Pro_Max_silver.jpg',437,'iPhone_12_Pro_Max','iPhone_12_Pro_Max_silver_intro.jpg'),('iPhone_SE_2020_128_white','iPhone_SE_2020','128GB','White',13990,12,'iPhone_SE_2020_white.jpg',345,'iPhone_SE_2020','iPhone_SE_2020_white_intro.jpg'),('iPhone_SE_2020_256_white','iPhone_SE_2020','256GB','White',15990,12,'iPhone_SE_2020_white.jpg',545,'iPhone_SE_2020','iPhone_SE_2020_white_intro.jpg'),('iPhone_XR_128GB_black','iPhone_XR','128GB','Black',14290,8,'iPhone_XR_black.jpg',437,'iPhone_XR','iPhone_XR_black_intro.jpg'),('iPhone_XR_128GB_blue','iPhone_XR','128GB','Blue',14290,8,'iPhone_XR_blue.jpg',65,'iPhone_XR','iPhone_XR_blue_intro.jpg'),('iPhone_XR_128GB_red','iPhone_XR','128GB','Red',14290,8,'iPhone_XR_red.jpg',87,'iPhone_XR','iPhone_XR_red_intro.jpg'),('iPhone_XR_128GB_white','iPhone_XR','128GB','White',14290,8,'iPhone_XR_white.jpg',435,'iPhone_XR','iPhone_XR_white_intro.jpg'),('iPhone_XR_64GB_black','iPhone_XR','64GB','Black',15190,10,'iPhone_XR_black.jpg',435,'iPhone_XR','iPhone_XR_black_intro.jpg'),('iPhone_XR_64GB_blue','iPhone_XR','64GB','Blue',15190,10,'iPhone_XR_blue.jpg',562,'iPhone_XR','iPhone_XR_blue_intro.jpg'),('iPhone_XR_64GB_red','iPhone_XR','64GB','Red',15190,10,'iPhone_XR_red.jpg',784,'iPhone_XR','iPhone_XR_red_intro.jpg'),('iPhone_XR_64GB_white','iPhone_XR','64GB','White',15190,10,'iPhone_XR_white.jpg',44,'iPhone_XR','iPhone_XR_white_intro.jpg'),('OPPO_Reno5_128GB_white','OPPO_Reno5','128GB','White',8690,0,'OPPO_Reno5_white.jpg',45,'OPPO_Reno5','OPPO_Reno5_white_intro.jpg'),('OPPO_Reno5_5G_128GB_white','OPPO_Reno5','256GB','White',9690,0,'OPPO_Reno5_white.jpg',873,'OPPO_Reno5','OPPO_Reno5_white_intro.jpg'),('Samsung_Galaxy_M51_128GB_black','Samsung_Galaxy_M51','128GB','Black',9400,10,'Samsung_Galaxy_M51_black.jpg',67,'Samsung_Galaxy_M51','Samsung_Galaxy_M51_black_intro.jpg'),('Samsung_Galaxy_M51_128GB_white','Samsung_Galaxy_M51','128GB','White',9400,10,'Samsung_Galaxy_M51_white.jpg',673,'Samsung_Galaxy_M51','Samsung_Galaxy_M51_white_intro.jpg'),('Samsung_Galaxy_S21_5G_128GB_gray','Samsung_Galaxy_S21_5G','128GB','Gray',20990,0,'Samsung_Galaxy_S21_5G_gray.jpg',34,'Samsung_Galaxy_S21_5G','			Samsung_Galaxy_S21_5G_gray_intro.jpg'),('Samsung_Galaxy_S21_5G_128GB_purple','Samsung_Galaxy_S21_5G','128GB','Purple',20990,0,'Samsung_Galaxy_S21_5G_purple.jpg',465,'Samsung_Galaxy_S21_5G','Samsung_Galaxy_S21_5G_purple_intro.jpg'),('Samsung_Galaxy_S21_5G_128GB_white','Samsung_Galaxy_S21_5G','128GB','White',20990,0,'Samsung_Galaxy_S21_5G_white.jpg',456,'Samsung_Galaxy_S21_5G','Samsung_Galaxy_S21_5G_white_intro.jpg'),('Samsung_Galaxy_S21_5G_256GB_gray','Samsung_Galaxy_S21_5G','256GB','Gray',21990,0,'Samsung_Galaxy_S21_5G_gray.jpg',653,'Samsung_Galaxy_S21_5G','			Samsung_Galaxy_S21_5G_gray_intro.jpg'),('Samsung_Galaxy_S21_5G_256GB_purple','Samsung_Galaxy_S21_5G','256GB','Purple',21990,0,'Samsung_Galaxy_S21_5G_purple.jpg',76,'Samsung_Galaxy_S21_5G','Samsung_Galaxy_S21_5G_purple_intro.jpg'),('Samsung_Galaxy_S21_5G_256GB_white','Samsung_Galaxy_S21_5G','256GB','White',21990,0,'Samsung_Galaxy_S21_5G_white.jpg',76,'Samsung_Galaxy_S21_5G','Samsung_Galaxy_S21_5G_white_intro.jpg'),('Vivo_Y53s_128GB_blue','Vivo_Y53s','128GB','Blue',6990,0,'Vivo_Y53s_blue.jpg',45,'Vivo_Y53s','Vivo_Y53s_blue_intro.jpg');
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
INSERT INTO `specifications` VALUES ('iPhone_11','IPS LCD, 6.1\", Liquid Retina','4GB','2 camera 12 MP','12 MP','3110 mAh, 18 W','Apple A13 Bionic','1 Nano SIM & 1 eSIM, Hỗ trợ 4G','IOS 14'),('iPhone_12','OLED, 6.1\", Super Retina XDR','4GB','2 camera 12 MP','12 MP','2815 mAh, 20 W','Apple A14 Bionic','1 Nano SIM & 1 eSIM, Hỗ trợ 5G','IOS 14'),('iPhone_12_Pro','OLED, 6.1\", Super Retina XDR','6GB','3 camera 12 MP','12 MP','2815 mAh, 20 W','Apple A14 Bionic','1 Nano SIM & 1 eSIM, Hỗ trợ 5G','IOS 14'),('iPhone_12_Pro_Max','OLED, 6.7\", Super Retina XDR','6GB','3 camera 12 MP','12 MP','3687 mAh, 20 W','Apple A14 Bionic','1 Nano SIM & 1 eSIM, Hỗ trợ 5G','IOS 14'),('iPhone_SE_2020','IPS LCD, 4.7\"','3GB','12 MP','7 MP','1821 mAh18 W','Apple A13 Bionic','1 Nano SIM & 1 eSIM, Hỗ trợ 4G','IOS 14'),('iPhone_XR','IPS LCD, 6.1\", Liquid Retina','3GB','12 MP','7 MP','2942 mAh15 W','Apple A12 Bionic','1 Nano SIM & 1 eSIM, Hỗ trợ 4G','IOS 14'),('OPPO_Reno5','AMOLED, 6.43\", Full HD+','8 GB','Chính 64 MP & Phụ 8 MP, 2 MP, 2 MP','44 MP','4310 mAh50 W','Snapdragon 720G','2 Nano SIM, Hỗ trợ 4G','Android 11'),('Samsung_Galaxy_M51','Super AMOLED Plus, 6.7\", Full HD+','8 GB','Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP','32 MP','7000 mAh25 W','Snapdragon 730','2 Nano SIMHỗ trợ 4G','Android 10'),('Samsung_Galaxy_S21_5G','Dynamic AMOLED 2X6.2\", Full HD+','8GB','Chính 12 MP & Phụ 64 MP, 12 MP','10 MP','4000 mAh25 W','Exynos 2100','2 Nano SIM hoặc 1 Nano SIM + 1 eSIM, Hỗ trợ 5G','Android 11'),('Vivo_Y53s','IPS LCD, 6.58\", Full HD+','8GB','Chính 64 MP & Phụ 2 MP, 2 MP','16 MP','5000 mAh33 W','MediaTek Helio G80','2 Nano SIM, Hỗ trợ 4G','Android 11');
/*!40000 ALTER TABLE `specifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `gender` tinyint DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('Nguyễn Trọng Duy An','anntd@gmail.com','0938263536','Cầu Giấy - Hà Nội',1),('Trần Thị Bí','bitt@gmail.com','0357263647','Gia Lai - Đắc Lắc - Kontum',NULL),('Nguyễn Thành Công','congnt@gmail.com','0352746534','Cầu Giấy - Hà Nội',NULL),('Trần Đình Đức','ductd@gmail.com','0362534653','Quận 5 - Thủ Đức - TP HCM',NULL),('Đỗ Thị Thu Hằng','hangdtt@gmail.com','0938736476','Xuân Tảo - Xuân Giang - Sóc Sơn',NULL),('Nguyễn Thị Hằng','hangnt@gmail.com','0382737464','Quận 9 - TP HCM',NULL),('Nguyễn Văn Hùng','hungnv@gmail.com','0937625534','Đại Tảo - Xuân ',NULL),('Nguyễn Đình Khuê','khuend2@gmail.com','0981726364','Thạch Hoà - Thạch Thất',1),('Đặng Văn Lâm','lamdv@gmail.com','0362836473','Lai Cách - Xuân Giang - Sóc Sơn - Hà Nội - 0968904962',NULL),('Châu Quang Khải','laoxao@gmail.com','0983625635','Minh Khai - Hà Giang',NULL),('Nguyễn Thị Trà My','myntt@gmail.com','0354165200','Minh Khai - Hà Giang',NULL),('Trần Diệu Nhi','nhitd@gmail.com','0928736543','165 - Hồ Hoàn Kiếm',NULL),('Hà Văn Quang','quanghavan29@gmail.com','0968904962','Lai Cách - Xuân Giang - Sóc Sơn - Hà Nội',1),('Trần Thảo Thanh','thanhtt@gmail.com','0938746736','Lò vôi - Hoàng Xá',NULL),('Lý thị Thuỷ','thuylt@gmail.com','0946354653','Xã Đại Đồng Thành - Bắc Ninh',NULL),('Trần Thị Thu Thuỷ','thuyttt@gmail.com','0937254736','Thôn 9 - Tam Sơn - Sơn ',NULL),('Vũ Minh Tuấn','tuanvm@gmail.com','0362576483','Hòn Xoái - Địa Ba - Đà Nẵng',NULL),('Lý Quang Tùng','tunglq@gmail.com','0938364535','Lý Đoàn - Hải Dương',NULL),('Trịnh Văn Tú','tuvt@gmail.com','0356473647','Lò vôi - Hoàng Xá',1),('Nguyễn Thị Tuyến','tuyennt@gmail.com','0938463536','Đèo Lắc - Hải Dương',NULL),('Hà Văn Vinh','vinhhv@gmail.com','0958585556','FPT University',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
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

-- Dump completed on 2021-06-27  8:31:27
