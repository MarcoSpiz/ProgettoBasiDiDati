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
-- Table structure for table `acquisto`
--

DROP TABLE IF EXISTS `acquisto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acquisto` (
  `numero` int NOT NULL AUTO_INCREMENT,
  `cliente` varchar(45) NOT NULL,
  `prodottovideo` varchar(6) NOT NULL,
  `formato` varchar(8) NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `cliente` (`cliente`),
  KEY `prodottovideo` (`prodottovideo`),
  CONSTRAINT `acquisto_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`email`),
  CONSTRAINT `acquisto_ibfk_2` FOREIGN KEY (`prodottovideo`) REFERENCES `prodottovideo` (`codice`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acquisto`
--

LOCK TABLES `acquisto` WRITE;
/*!40000 ALTER TABLE `acquisto` DISABLE KEYS */;
INSERT INTO `acquisto` VALUES (1,'a@a.it','himym','fisico'),(2,'a@a.it','himym','fisico'),(3,'a@a.it','hpelcs','fisico'),(4,'a@a.it','himym','fisico'),(6,'giovanni@giovanno.it','isl','fisico'),(7,'ma@ros.it','himym','digitale'),(8,'ma@ros.it','hpelcs','fisico'),(10,'ma@ros.it','isl','digitale'),(11,'ma@ros.it','isl','fisico'),(12,'b@b.it','cne','digitale'),(13,'b@b.it','tbbt','digitale'),(14,'ilaria@mail.com','tbbt','digitale'),(15,'test2@test2.it','t','fisico'),(16,'test@test.it','t','fisico'),(17,'test@test.it','ig','fisico'),(18,'test@test.it','g','fisico'),(19,'test@test.it','tbbt','digitale');
/*!40000 ALTER TABLE `acquisto` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ClienteMinorenne` BEFORE INSERT ON `acquisto` FOR EACH ROW BEGIN
	declare etaCli date;
    set etaCli =(select datanascita from cliente where email=new.cliente );
    if year(etaCli)>(year(current_date())-18) then
		SIGNAL SQLSTATE '45000'
		SET message_text = 'Errore, il cliente è minorenne non può effettuare operazioni';
	end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `InsertConsegna` AFTER INSERT ON `acquisto` FOR EACH ROW BEGIN
	declare prod varchar(6);
    declare ubi varchar(6);
    declare imp varchar(45);
    set prod = new.prodottovideo;
    set ubi = (SELECT ubicazione FROM cliente WHERE email=new.cliente);
    set imp = (select impiegato
				from prova2
				where num<=ALL (select num from prova2));
    if new.formato="fisico" then
		insert into consegna values(default, imp,ubi,prod );
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
