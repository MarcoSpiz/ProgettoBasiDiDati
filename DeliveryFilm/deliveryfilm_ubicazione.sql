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
-- Table structure for table `ubicazione`
--

DROP TABLE IF EXISTS `ubicazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubicazione` (
  `codice` varchar(6) NOT NULL,
  `nomecitta` varchar(45) NOT NULL,
  `nomevia` varchar(45) NOT NULL,
  `cap` int NOT NULL,
  `numerocivico` int NOT NULL,
  `nazione` varchar(45) NOT NULL,
  PRIMARY KEY (`codice`),
  KEY `nazione` (`nazione`),
  CONSTRAINT `ubicazione_ibfk_1` FOREIGN KEY (`nazione`) REFERENCES `nazione` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicazione`
--

LOCK TABLES `ubicazione` WRITE;
/*!40000 ALTER TABLE `ubicazione` DISABLE KEYS */;
INSERT INTO `ubicazione` VALUES ('aac1','milano','loreto',5,23,'italia'),('aac117','torino','strada1',12,1,'italia'),('bbc1','firenze','strada',123,123,'italia'),('ccc1','firenze','strada',123,1,'italia'),('ditta1','tivoli','garibaldi',112,2323,'italia'),('ditta2','milano','como',111,11,'italia'),('ggc1','bruges','stradalibera',3333,22,'belgio'),('ifc1','roma','via lolli',0,8,'italiana'),('lnc1','tivoli','mazzini',8,12,'italia'),('mmc1','firenze','roma',122,1,'italia'),('mrc1','roma','garibaldi',1,10,'italia'),('mrc178','roma','garibaldi',112,8,'italia'),('ppc1','oslo','oslostreet',5555,56,'norvegia'),('sgc1','madrid','ippocrate',134,1010,'spagna'),('ttc1','roma','rossi',122,2,'italia'),('ttc139','napoli','rosso',1,1,'italia');
/*!40000 ALTER TABLE `ubicazione` ENABLE KEYS */;
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
