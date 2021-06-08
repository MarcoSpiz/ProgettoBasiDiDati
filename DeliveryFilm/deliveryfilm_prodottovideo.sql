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
-- Table structure for table `prodottovideo`
--

DROP TABLE IF EXISTS `prodottovideo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prodottovideo` (
  `codice` varchar(6) NOT NULL,
  `titolo` varchar(45) NOT NULL,
  `annopubblicazione` date NOT NULL,
  `trama` varchar(80) NOT NULL,
  `prezzoacquisto` decimal(15,2) NOT NULL,
  `prezzonoleggio` decimal(15,2) NOT NULL,
  `tipo` varchar(7) NOT NULL,
  `duratamin` int DEFAULT NULL,
  `genere` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codice`),
  KEY `genere` (`genere`),
  CONSTRAINT `prodottovideo_ibfk_1` FOREIGN KEY (`genere`) REFERENCES `genere` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodottovideo`
--

LOCK TABLES `prodottovideo` WRITE;
/*!40000 ALTER TABLE `prodottovideo` DISABLE KEYS */;
INSERT INTO `prodottovideo` VALUES ('cne','cenerentola','1990-01-01','storia di una ragazza',15.00,8.00,'serie',NULL,'per bambini'),('g','gomorra','2010-01-01','uno spaccato di società',30.00,12.00,'serie',NULL,'drammatico'),('himym','how i met your mother','2005-10-10','la storia di un ragazzo che racconta la sua gioventù',60.00,22.50,'serie',NULL,'sitcom'),('hp3','harry 3','2005-01-01','trama',30.10,18.00,'film',180,'fantasy'),('hpelcs','harry potter e la camera dei segreti','2001-10-10','Harry continua le sue avventure',20.00,12.50,'film',190,'fantasy'),('hpelpf','harry potter e la pietra filosofale','1998-10-10','le storie di un giovane maghetto',20.00,12.50,'film',190,'fantasy'),('ig','il gladiatore','2000-10-10','epoca romana',12.00,6.00,'film',180,'storico'),('isl','io sono leggenda','2010-10-10','un uomo si trova da solo contro un virus',15.00,8.00,'film',210,'horror'),('pp','prova','1990-10-10','film',111.00,11.00,'film',123,'commedia'),('s1f1','s1f1','2000-01-01','trama',10.00,5.00,'film',100,'fantasy'),('s1f2','s1f2','2000-01-01','trama',10.00,5.00,'film',100,'fantasy'),('s2f1','s2f1','2000-01-01','trama',10.00,5.00,'film',100,'fantasy'),('s2f2','s2f2','2000-01-01','trama',10.00,5.00,'film',100,'fantasy'),('t','topolino','1990-01-01','storia di un topolino',15.00,8.00,'serie',NULL,'per bambini'),('tbbt','the big bang theory','2005-10-10','un gruppo di scienziati amici',32.50,18.00,'serie',NULL,'sitcom');
/*!40000 ALTER TABLE `prodottovideo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `prodottovideo_BEFORE_INSERT` BEFORE INSERT ON `prodottovideo` FOR EACH ROW BEGIN
	if new.tipo = "film" and new.duratamin is Null then
		 SIGNAL SQLSTATE '45000'
		SET message_text = 'Errore di inserimento, la durata non può essere null';
	end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-08 11:18:14
