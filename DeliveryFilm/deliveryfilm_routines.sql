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
-- Temporary view structure for view `mediapercasa`
--

DROP TABLE IF EXISTS `mediapercasa`;
/*!50001 DROP VIEW IF EXISTS `mediapercasa`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mediapercasa` AS SELECT 
 1 AS `nome`,
 1 AS `AvgPrezzoAcqu`,
 1 AS `AvgPrezzoNol`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `prova`
--

DROP TABLE IF EXISTS `prova`;
/*!50001 DROP VIEW IF EXISTS `prova`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `prova` AS SELECT 
 1 AS `impiegato`,
 1 AS `count(*)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `spesepercliente`
--

DROP TABLE IF EXISTS `spesepercliente`;
/*!50001 DROP VIEW IF EXISTS `spesepercliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `spesepercliente` AS SELECT 
 1 AS `email`,
 1 AS `Totale`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `frequenzapercliente`
--

DROP TABLE IF EXISTS `frequenzapercliente`;
/*!50001 DROP VIEW IF EXISTS `frequenzapercliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `frequenzapercliente` AS SELECT 
 1 AS `Numero`,
 1 AS `nazione`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `prova2`
--

DROP TABLE IF EXISTS `prova2`;
/*!50001 DROP VIEW IF EXISTS `prova2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `prova2` AS SELECT 
 1 AS `impiegato`,
 1 AS `num`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `consegnaperimpiegato`
--

DROP TABLE IF EXISTS `consegnaperimpiegato`;
/*!50001 DROP VIEW IF EXISTS `consegnaperimpiegato`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `consegnaperimpiegato` AS SELECT 
 1 AS `num`,
 1 AS `codicefiscale`,
 1 AS `ubicazione`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `attoripernazione`
--

DROP TABLE IF EXISTS `attoripernazione`;
/*!50001 DROP VIEW IF EXISTS `attoripernazione`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `attoripernazione` AS SELECT 
 1 AS `totale`,
 1 AS `nazione`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `attoriinsaga`
--

DROP TABLE IF EXISTS `attoriinsaga`;
/*!50001 DROP VIEW IF EXISTS `attoriinsaga`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `attoriinsaga` AS SELECT 
 1 AS `nome`,
 1 AS `Attore`,
 1 AS `Film`,
 1 AS `Saga`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `operazioni`
--

DROP TABLE IF EXISTS `operazioni`;
/*!50001 DROP VIEW IF EXISTS `operazioni`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `operazioni` AS SELECT 
 1 AS `cliente`,
 1 AS `prodottovideo`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `mediapercasa`
--

/*!50001 DROP VIEW IF EXISTS `mediapercasa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mediapercasa` AS select `c`.`nome` AS `nome`,avg(`p`.`prezzoacquisto`) AS `AvgPrezzoAcqu`,avg(`p`.`prezzonoleggio`) AS `AvgPrezzoNol` from ((`casaproduttrice` `c` join `prodottoda` `pd`) join `prodottovideo` `p`) where ((`c`.`codice` = `pd`.`casaproduttrice`) and (`pd`.`prodottovideo` = `p`.`codice`)) group by `c`.`codice` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `prova`
--

/*!50001 DROP VIEW IF EXISTS `prova`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prova` AS select `consegna`.`impiegato` AS `impiegato`,count(0) AS `count(*)` from `consegna` group by `consegna`.`impiegato` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `spesepercliente`
--

/*!50001 DROP VIEW IF EXISTS `spesepercliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `spesepercliente` AS select `c`.`email` AS `email`,sum(`p`.`prezzoacquisto`) AS `Totale` from ((`cliente` `c` join `acquisto` `a`) join `prodottovideo` `p`) where ((`c`.`email` = `a`.`cliente`) and (`a`.`prodottovideo` = `p`.`codice`)) group by `c`.`email` union select `c`.`email` AS `email`,sum(`p`.`prezzonoleggio`) AS `Totale` from ((`cliente` `c` join `noleggio` `n`) join `prodottovideo` `p`) where ((`c`.`email` = `n`.`cliente`) and (`n`.`prodottovideo` = `p`.`codice`)) group by `c`.`email` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `frequenzapercliente`
--

/*!50001 DROP VIEW IF EXISTS `frequenzapercliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `frequenzapercliente` AS select count(0) AS `Numero`,`a`.`nazione` AS `nazione`,`c`.`email` AS `email` from (((`attore` `a` join `operazioni` `ac`) join `recita` `r`) join `cliente` `c`) where ((`a`.`codice` = `r`.`attore`) and (`r`.`prodottovideo` = `ac`.`prodottovideo`) and (`c`.`email` = `ac`.`cliente`)) group by `c`.`email`,`a`.`nazione` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `prova2`
--

/*!50001 DROP VIEW IF EXISTS `prova2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prova2` AS select `consegna`.`impiegato` AS `impiegato`,count(0) AS `num` from `consegna` group by `consegna`.`impiegato` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `consegnaperimpiegato`
--

/*!50001 DROP VIEW IF EXISTS `consegnaperimpiegato`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `consegnaperimpiegato` AS select count(0) AS `num`,`i`.`codicefiscale` AS `codicefiscale`,`c`.`ubicazione` AS `ubicazione` from (`impiegato` `i` join `consegna` `c`) where (`i`.`codicefiscale` = `c`.`impiegato`) group by `i`.`codicefiscale`,`c`.`ubicazione` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `attoripernazione`
--

/*!50001 DROP VIEW IF EXISTS `attoripernazione`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `attoripernazione` AS select count(0) AS `totale`,`a`.`nazione` AS `nazione` from `attore` `a` group by `a`.`nazione` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `attoriinsaga`
--

/*!50001 DROP VIEW IF EXISTS `attoriinsaga`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `attoriinsaga` AS select `s`.`nome` AS `nome`,`a`.`codice` AS `Attore`,`p`.`codice` AS `Film`,`s`.`codice` AS `Saga` from ((((`saga` `s` join `attore` `a`) join `prodottovideo` `p`) join `recita` `r`) join `appartiene` `ap`) where ((`a`.`codice` = `r`.`attore`) and (`r`.`prodottovideo` = `p`.`codice`) and (`ap`.`prodottovideo` = `p`.`codice`) and (`ap`.`saga` = `s`.`codice`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `operazioni`
--

/*!50001 DROP VIEW IF EXISTS `operazioni`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `operazioni` AS select `acquisto`.`cliente` AS `cliente`,`acquisto`.`prodottovideo` AS `prodottovideo` from `acquisto` union select `noleggio`.`cliente` AS `cliente`,`noleggio`.`prodottovideo` AS `prodottovideo` from `noleggio` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'deliveryfilm'
--

--
-- Dumping routines for database 'deliveryfilm'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-08 11:18:16
