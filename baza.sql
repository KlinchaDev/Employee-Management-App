CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `delavec`
--

DROP TABLE IF EXISTS `delavec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delavec` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ime` varchar(100) DEFAULT NULL,
  `priimek` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `stopnja_izkusenj` varchar(100) DEFAULT NULL,
  `identifikacijska_stevilka` int NOT NULL,
  `organizacijska_skupina_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_številka_UNIQUE` (`identifikacijska_stevilka`),
  KEY `fk_delavec_organizacijska_skupina1_idx` (`organizacijska_skupina_id`),
  CONSTRAINT `fk_delavec_organizacijska_skupina1` FOREIGN KEY (`organizacijska_skupina_id`) REFERENCES `organizacijska_skupina` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delavec`
--

LOCK TABLES `delavec` WRITE;
/*!40000 ALTER TABLE `delavec` DISABLE KEYS */;
INSERT INTO `delavec` VALUES (1,'Zdravko','Riba','zdravko.riba@notbadlab.com','Senior',1001,1),(2,'Rok','Potekel','rok.potekel@notbadlab.com','Junior',1003,2),(3,'Ziva','Zver','ziva.zver@notbadlab.com','Senior',1004,2),(4,'Jelka','Bor','jelka.bor@notbadlab.com','Mid',1002,1),(5,'Zdravko','Dren','zdravko.dren@notbadlab.com','Senior',1005,3),(6,'Ana','Ban','ana.ban@notbadlab.com','Mid',1007,4),(7,'Jana','Slika','jasna.slika@notbadlab.com','Senior',1008,4),(8,'Vinko','Vodopivec','vinko.vodopivec@notbadlab.com','Junior',1006,5),(9,'Marko','Kralj','marko.kralj@notbadlab.com','Junior',1009,3),(10,'Eva','Novak','eva.novak@notbadlab.com','Mid',1010,5);
/*!40000 ALTER TABLE `delavec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delavec_tip_produkta`
--

DROP TABLE IF EXISTS `delavec_tip_produkta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delavec_tip_produkta` (
  `id` int NOT NULL,
  `poslovna_enota_has_tip_produkta_id` int NOT NULL,
  `delavec_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_delavec_tip_produkta_poslovna_enota_has_tip_produkta1_idx` (`poslovna_enota_has_tip_produkta_id`),
  KEY `fk_delavec_tip_produkta_delavec1_idx` (`delavec_id`),
  CONSTRAINT `fk_delavec_tip_produkta_delavec1` FOREIGN KEY (`delavec_id`) REFERENCES `delavec` (`id`),
  CONSTRAINT `fk_delavec_tip_produkta_poslovna_enota_has_tip_produkta1` FOREIGN KEY (`poslovna_enota_has_tip_produkta_id`) REFERENCES `poslovna_enota_has_tip_produkta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delavec_tip_produkta`
--

LOCK TABLES `delavec_tip_produkta` WRITE;
/*!40000 ALTER TABLE `delavec_tip_produkta` DISABLE KEYS */;
INSERT INTO `delavec_tip_produkta` VALUES (1,2,1),(2,1,2),(3,2,4),(4,3,5),(5,4,7),(6,3,3),(7,4,8),(8,5,9),(9,2,10),(10,4,6);
/*!40000 ALTER TABLE `delavec_tip_produkta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizacijska_skupina`
--

DROP TABLE IF EXISTS `organizacijska_skupina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizacijska_skupina` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ime` varchar(100) DEFAULT NULL,
  `opis` varchar(250) DEFAULT NULL,
  `poslovna_enota_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_organizacijska_skupina_poslovna_enota1_idx` (`poslovna_enota_id`),
  CONSTRAINT `fk_organizacijska_skupina_poslovna_enota1` FOREIGN KEY (`poslovna_enota_id`) REFERENCES `poslovna_enota` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizacijska_skupina`
--

LOCK TABLES `organizacijska_skupina` WRITE;
/*!40000 ALTER TABLE `organizacijska_skupina` DISABLE KEYS */;
INSERT INTO `organizacijska_skupina` VALUES (1,'NotBadCrew','Backend in API integracije',1),(2,'NotBadSqad','Rrazvoj mobilnih aplikacij',2),(3,'NotBadBrain','UI/UX in frontend razvoj',3),(4,'NotBadTribe','Rrazvoj mobilnih aplikacij',1),(5,'NotBadTeam','Backend in API integracije',2),(6,'NotBadGroup','Rrazvoj mobilnih aplikacij',3);
/*!40000 ALTER TABLE `organizacijska_skupina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poslovna_enota`
--

DROP TABLE IF EXISTS `poslovna_enota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poslovna_enota` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ime` varchar(100) DEFAULT NULL,
  `naslov` varchar(150) DEFAULT NULL,
  `postna_stevilka` varchar(20) DEFAULT NULL,
  `mesto` varchar(100) DEFAULT NULL,
  `drzava` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poslovna_enota`
--

LOCK TABLES `poslovna_enota` WRITE;
/*!40000 ALTER TABLE `poslovna_enota` DISABLE KEYS */;
INSERT INTO `poslovna_enota` VALUES (1,'NotBadLab','Dornavska cesta 7A','2250','Ptuj','Slovenija','info@notbadlab.com'),(2,'NotBadKod','Industriestrasse 12','80331','Munchen','Nemcija','infor@notbadcode.com'),(3,'NotBadWerk','Via Antonio Locatelli 4','056420','Venecia','Italija','notbadwerk@gmail.com');
/*!40000 ALTER TABLE `poslovna_enota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poslovna_enota_has_tip_produkta`
--

DROP TABLE IF EXISTS `poslovna_enota_has_tip_produkta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poslovna_enota_has_tip_produkta` (
  `id` int NOT NULL,
  `poslovna_enota_id` int NOT NULL,
  `tip_digitalni_produkt_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_poslovna_enota_has_tip_produkta_poslovna_enota1_idx` (`poslovna_enota_id`),
  KEY `fk_poslovna_enota_has_tip_produkta_tip_digitalni_produkt1_idx` (`tip_digitalni_produkt_id`),
  CONSTRAINT `fk_poslovna_enota_has_tip_produkta_poslovna_enota1` FOREIGN KEY (`poslovna_enota_id`) REFERENCES `poslovna_enota` (`id`),
  CONSTRAINT `fk_poslovna_enota_has_tip_produkta_tip_digitalni_produkt1` FOREIGN KEY (`tip_digitalni_produkt_id`) REFERENCES `tip_digitalni_produkt` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poslovna_enota_has_tip_produkta`
--

LOCK TABLES `poslovna_enota_has_tip_produkta` WRITE;
/*!40000 ALTER TABLE `poslovna_enota_has_tip_produkta` DISABLE KEYS */;
INSERT INTO `poslovna_enota_has_tip_produkta` VALUES (1,1,7),(2,1,8),(3,2,9),(4,3,10),(5,2,7);
/*!40000 ALTER TABLE `poslovna_enota_has_tip_produkta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tip_digitalni_produkt`
--

DROP TABLE IF EXISTS `tip_digitalni_produkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tip_digitalni_produkt` (
  `id` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(100) DEFAULT NULL,
  `opis` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tip_digitalni_produkt`
--

LOCK TABLES `tip_digitalni_produkt` WRITE;
/*!40000 ALTER TABLE `tip_digitalni_produkt` DISABLE KEYS */;
INSERT INTO `tip_digitalni_produkt` VALUES (7,'Spletna aplikacija','Razvoj spletnih resitev'),(8,'Mobilna aplikacija','Razvoj Android in iOS aplikacije'),(9,'API integracija','Povezovanje zunanjih sistemov'),(10,'Analiticna platforma','Analiza in vizualizacija podatkov');
/*!40000 ALTER TABLE `tip_digitalni_produkt` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-29  2:08:50
