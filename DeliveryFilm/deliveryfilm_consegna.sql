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
-- Table structure for table `consegna`
--

DROP TABLE IF EXISTS `consegna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consegna` (
  `numero` int NOT NULL AUTO_INCREMENT,
  `impiegato` varchar(45) NOT NULL,
  `ubicazione` varchar(6) NOT NULL,
  `prodottovideo` varchar(6) NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `impiegato` (`impiegato`),
  KEY `ubicazione` (`ubicazione`),
  KEY `prodottovideo` (`prodottovideo`),
  CONSTRAINT `consegna_ibfk_1` FOREIGN KEY (`impiegato`) REFERENCES `impiegato` (`codicefiscale`),
  CONSTRAINT `consegna_ibfk_2` FOREIGN KEY (`ubicazione`) REFERENCES `ubicazione` (`codice`),
  CONSTRAINT `consegna_ibfk_3` FOREIGN KEY (`prodottovideo`) REFERENCES `prodottovideo` (`codice`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consegna`
--

LOCK TABLES `consegna` WRITE;
/*!40000 ALTER TABLE `consegna` DISABLE KEYS */;
INSERT INTO `consegna` VALUES (1,'cod1','ditta1','himym'),(2,'cod1','ditta1','himym'),(3,'cod1','ditta1','himym'),(4,'cod1','ditta1','himym'),(5,'cod2','lnc1','himym'),(6,'cod2','lnc1','himym'),(7,'cod2','lnc1','himym'),(8,'cod2','lnc1','himym'),(9,'cod2','lnc1','himym'),(10,'cod2','lnc1','himym'),(11,'cod2','ditta1','himym'),(12,'cod2','lnc1','himym'),(13,'cod2','lnc1','himym'),(14,'cod2','lnc1','himym'),(15,'cod2','ditta1','himym'),(16,'cod2','ditta1','himym'),(17,'cod2','ditta1','himym'),(18,'cod1','aac1','himym'),(19,'cod1','aac1','himym'),(20,'cod1','aac1','hpelcs'),(21,'cod1','aac1','himym'),(23,'cod1','ggc1','isl'),(24,'cod1','mrc178','hpelcs'),(26,'cod3','mrc178','isl'),(27,'cod3','ttc139','t'),(28,'cod3','ttc1','t'),(29,'cod3','ttc1','ig'),(30,'cod3','ttc1','g');
/*!40000 ALTER TABLE `consegna` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-08 11:18:12
