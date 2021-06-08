-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: deliveryfilm
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
-- Table structure for table `attore`
--

DROP TABLE IF EXISTS `attore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attore` (
  `codice` varchar(6) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cognome` varchar(45) NOT NULL,
  `datanascita` date NOT NULL,
  `nazione` varchar(45) NOT NULL,
  PRIMARY KEY (`codice`),
  KEY `nazione` (`nazione`),
  CONSTRAINT `attore_ibfk_1` FOREIGN KEY (`nazione`) REFERENCES `nazione` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attore`
--

LOCK TABLES `attore` WRITE;
/*!40000 ALTER TABLE `attore` DISABLE KEYS */;
INSERT INTO `attore` VALUES ('a1','attore','attore','1990-10-10','spagna'),('a2','attore','attore','2000-10-10','italia'),('aa','andres','andreis','1980-10-11','spagna'),('as1','nome1','cognome1','1990-10-10','italia'),('as1f1','nome1','cognome1','1990-10-10','italia'),('as2','nome1','cognome1','1990-10-10','italia'),('as2f1','nome1','cognome1','1990-10-10','italia'),('dr','daniel','rac','1990-01-01','inghilterra'),('hh','harry','ProvaStampa','1990-01-01','spagna'),('ll','luca','luchi','2000-10-11','italia'),('mm','mario','mari','1960-10-11','italia'),('pp','prova','provi','1980-01-01','germania');
/*!40000 ALTER TABLE `attore` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-08 11:18:15
