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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `email` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cognome` varchar(45) NOT NULL,
  `datanascita` date NOT NULL,
  `numerocarta` int NOT NULL,
  `datascadenza` date NOT NULL,
  `codicecvv` int NOT NULL,
  `telefono` int DEFAULT NULL,
  `ubicazione` varchar(6) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`email`),
  KEY `ubicazione` (`ubicazione`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`ubicazione`) REFERENCES `ubicazione` (`codice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('a@a.it','an','ac','2000-01-01',444,'2030-01-01',1111111,123,'aac1','anac'),('aan@aab.it','aan','aab','2010-01-01',4554,'2033-01-01',433,12,'aac117','aanaab'),('b@b.it','bn','bc','1993-01-01',423423,'2030-01-01',324,213,'bbc1','bnbc'),('c@c.it','cn','cc','1993-01-01',423423,'2030-01-01',324,213,'ccc1','cncc'),('giovanni@giovanno.it','giovanni','giovanno','2000-01-01',7832,'2030-01-01',322,111,'ggc1','giovannigiovanno'),('ilaria@mail.com','ilaria','franchi','1997-05-25',9999999,'2026-07-24',999,NULL,'ifc1','ilariafranchi'),('luca@neri.it','luca','neri','1980-05-11',222,'2030-05-11',567,80808,'lnc1','lucaneri'),('ma@ros.it','marco','rossi','1990-01-01',4343,'2020-01-01',3321,NULL,'mrc178','marcorossi'),('mario@rossi.it','mario','rossi','1992-01-01',111,'2025-03-03',123,60606,'mrc1','mariorossi'),('martina@martini.it','martina','martini','1990-01-01',332123,'2050-01-01',213,NULL,'mmc1','martinamartini'),('prova@provi.it','prova','provi','1990-10-10',888,'2030-01-01',123,123321,'ppc1','provaprovi'),('stefano@gialli.it','stefano','gialli','2010-03-01',111,'2028-10-10',890,90909,'sgc1','stefanogialli'),('test@test.it','test','test','2000-01-01',122,'2030-01-01',111,NULL,'ttc1','testtest'),('test2@test2.it','test','test','1999-10-10',111,'2030-10-10',111,NULL,'ttc139','password');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-08 11:18:16
