-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: koronatedavi
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `tbl_adresler`
--

DROP TABLE IF EXISTS `tbl_adresler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_adresler` (
  `adresId` int NOT NULL AUTO_INCREMENT,
  `adresSahibi` varchar(30) NOT NULL,
  `adresBilgi` varchar(100) NOT NULL,
  PRIMARY KEY (`adresId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_adresler`
--

LOCK TABLES `tbl_adresler` WRITE;
/*!40000 ALTER TABLE `tbl_adresler` DISABLE KEYS */;
INSERT INTO `tbl_adresler` VALUES (1,'Kocaeli Hastanesi','Mercan Sokak'),(2,'Ankara Devlet Hastanesi','Kızılay Caddesi'),(3,'Ahmet Tanpınar','Dicle sokak'),(4,'Mustafa Koçyiğit','Muratlı Sokak'),(5,'Öznur Koçak','Atmaca Caddesi'),(6,'Selami Uçar','Fevzi Çakmak Sokak'),(7,'Tuncay Kantarcı','Manolya Sokak'),(8,'Duran Şatıroğlu','Aslan Akbey Sokak'),(9,'Mehmet Karahanlı','Davulcu Caddesi'),(10,'Mehmet Polatlı','Mücevher Sokak');
/*!40000 ALTER TABLE `tbl_adresler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_covidbelirtiler`
--

DROP TABLE IF EXISTS `tbl_covidbelirtiler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_covidbelirtiler` (
  `belirtiId` int NOT NULL AUTO_INCREMENT,
  `belirtiAd` varchar(30) NOT NULL,
  `belirtiDerece` int NOT NULL,
  PRIMARY KEY (`belirtiId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_covidbelirtiler`
--

LOCK TABLES `tbl_covidbelirtiler` WRITE;
/*!40000 ALTER TABLE `tbl_covidbelirtiler` DISABLE KEYS */;
INSERT INTO `tbl_covidbelirtiler` VALUES (1,'Öksürük',1),(2,'Öksürük',2),(3,'Öksürük',3),(4,'Öksürük',4),(5,'Solunum Zorluğu',1),(6,'Solunum Zorluğu',2),(7,'Solunum Zorluğu',3),(8,'Solunum Zorluğu',4),(9,'Yüksek Ateş',1),(10,'Yüksek Ateş',2),(11,'Yüksek Ateş',3);
/*!40000 ALTER TABLE `tbl_covidbelirtiler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_doktorlar`
--

DROP TABLE IF EXISTS `tbl_doktorlar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_doktorlar` (
  `doktorId` int NOT NULL AUTO_INCREMENT,
  `doktorAd` varchar(30) NOT NULL,
  `doktorSoyad` varchar(30) NOT NULL,
  `uzmanlikId` int NOT NULL,
  `doktorlarTelNo` varchar(30) NOT NULL,
  `doktorAdresId` int NOT NULL,
  PRIMARY KEY (`doktorId`),
  KEY `uzmanlikId` (`uzmanlikId`),
  KEY `doktorAdresId` (`doktorAdresId`),
  CONSTRAINT `tbl_doktorlar_ibfk_1` FOREIGN KEY (`uzmanlikId`) REFERENCES `tbl_uzmanlik` (`uzmanlikId`),
  CONSTRAINT `tbl_doktorlar_ibfk_2` FOREIGN KEY (`doktorAdresId`) REFERENCES `tbl_adresler` (`adresId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_doktorlar`
--

LOCK TABLES `tbl_doktorlar` WRITE;
/*!40000 ALTER TABLE `tbl_doktorlar` DISABLE KEYS */;
INSERT INTO `tbl_doktorlar` VALUES (1,'Selami','Uçar',1,'902345642343',6),(2,'Tuncay','Kantarcı',2,'902345645643',7),(3,'Duran','Şatıroğlu',4,'902345649865',8),(4,'Mehmet','Karahanlı',3,'902345649865',9);
/*!40000 ALTER TABLE `tbl_doktorlar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_hastalar`
--

DROP TABLE IF EXISTS `tbl_hastalar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_hastalar` (
  `hastaId` int NOT NULL AUTO_INCREMENT,
  `doktorId` int NOT NULL,
  `hastaneId` int NOT NULL,
  `hastaTcNo` varchar(11) NOT NULL,
  `hastaAd` varchar(30) NOT NULL,
  `hastaSoyad` varchar(30) NOT NULL,
  `hastaTelNo` varchar(16) DEFAULT NULL,
  `hastaAdresId` int NOT NULL,
  PRIMARY KEY (`hastaId`),
  KEY `doktorId` (`doktorId`),
  KEY `hastaneId` (`hastaneId`),
  KEY `hastaAdresId` (`hastaAdresId`),
  CONSTRAINT `tbl_hastalar_ibfk_1` FOREIGN KEY (`doktorId`) REFERENCES `tbl_doktorlar` (`doktorId`),
  CONSTRAINT `tbl_hastalar_ibfk_2` FOREIGN KEY (`hastaneId`) REFERENCES `tbl_hastaneler` (`hastaneId`),
  CONSTRAINT `tbl_hastalar_ibfk_3` FOREIGN KEY (`hastaAdresId`) REFERENCES `tbl_adresler` (`adresId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_hastalar`
--

LOCK TABLES `tbl_hastalar` WRITE;
/*!40000 ALTER TABLE `tbl_hastalar` DISABLE KEYS */;
INSERT INTO `tbl_hastalar` VALUES (1,1,1,'14356489735','Ahmet','Tanpınar','903256754367',3),(2,2,2,'14148769735','Mustafa','Koçyiğit','903356894367',4),(3,3,1,'14356499635','Öznur','Koçak','903436798367',5),(4,4,2,'15358723735','Mehmet','Polatlı','903336654390',10);
/*!40000 ALTER TABLE `tbl_hastalar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_hastaneler`
--

DROP TABLE IF EXISTS `tbl_hastaneler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_hastaneler` (
  `hastaneId` int NOT NULL AUTO_INCREMENT,
  `hastaneYoneticiId` int NOT NULL,
  `hastaneAd` varchar(30) NOT NULL,
  `hastaneAdresId` int NOT NULL,
  PRIMARY KEY (`hastaneId`),
  KEY `hastaneAdresId` (`hastaneAdresId`),
  KEY `hastaneYoneticiId` (`hastaneYoneticiId`),
  CONSTRAINT `tbl_hastaneler_ibfk_1` FOREIGN KEY (`hastaneAdresId`) REFERENCES `tbl_adresler` (`adresId`),
  CONSTRAINT `tbl_hastaneler_ibfk_2` FOREIGN KEY (`hastaneYoneticiId`) REFERENCES `tbl_doktorlar` (`doktorId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_hastaneler`
--

LOCK TABLES `tbl_hastaneler` WRITE;
/*!40000 ALTER TABLE `tbl_hastaneler` DISABLE KEYS */;
INSERT INTO `tbl_hastaneler` VALUES (1,1,'Ankara Devlet Hastanesi',2),(2,4,'Kocaeli Hastanesi',1);
/*!40000 ALTER TABLE `tbl_hastaneler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_iyilesmedurumu`
--

DROP TABLE IF EXISTS `tbl_iyilesmedurumu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_iyilesmedurumu` (
  `iyilesmeId` int NOT NULL AUTO_INCREMENT,
  `hastaId` int NOT NULL,
  `doktorId` int NOT NULL,
  `hastaneId` int NOT NULL,
  `belirtiId` int NOT NULL,
  `iyilesmeDurumu` varchar(5) NOT NULL,
  `durumSuresi` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`iyilesmeId`),
  KEY `hastaId` (`hastaId`),
  KEY `doktorId` (`doktorId`),
  KEY `hastaneId` (`hastaneId`),
  KEY `belirtiId` (`belirtiId`),
  CONSTRAINT `tbl_iyilesmedurumu_ibfk_1` FOREIGN KEY (`hastaId`) REFERENCES `tbl_hastalar` (`hastaId`),
  CONSTRAINT `tbl_iyilesmedurumu_ibfk_2` FOREIGN KEY (`doktorId`) REFERENCES `tbl_doktorlar` (`doktorId`),
  CONSTRAINT `tbl_iyilesmedurumu_ibfk_3` FOREIGN KEY (`hastaneId`) REFERENCES `tbl_hastaneler` (`hastaneId`),
  CONSTRAINT `tbl_iyilesmedurumu_ibfk_4` FOREIGN KEY (`belirtiId`) REFERENCES `tbl_covidbelirtiler` (`belirtiId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_iyilesmedurumu`
--

LOCK TABLES `tbl_iyilesmedurumu` WRITE;
/*!40000 ALTER TABLE `tbl_iyilesmedurumu` DISABLE KEYS */;
INSERT INTO `tbl_iyilesmedurumu` VALUES (1,1,1,1,7,'Evet','17 Gün'),(2,2,2,2,3,'Evet','10 Gün'),(3,3,3,1,11,'Evet','21 Gün'),(4,4,4,2,8,'Hayır','14 Gün');
/*!40000 ALTER TABLE `tbl_iyilesmedurumu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_uzmanlik`
--

DROP TABLE IF EXISTS `tbl_uzmanlik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_uzmanlik` (
  `uzmanlikId` int NOT NULL AUTO_INCREMENT,
  `uzmanlikAd` varchar(30) NOT NULL,
  PRIMARY KEY (`uzmanlikId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_uzmanlik`
--

LOCK TABLES `tbl_uzmanlik` WRITE;
/*!40000 ALTER TABLE `tbl_uzmanlik` DISABLE KEYS */;
INSERT INTO `tbl_uzmanlik` VALUES (1,'İç hastalıkları'),(2,'Kulak Burun Boğaz'),(3,'Göğüs hastalıkları'),(4,'Enfeksiyon hastalıkları');
/*!40000 ALTER TABLE `tbl_uzmanlik` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-30 16:27:48
