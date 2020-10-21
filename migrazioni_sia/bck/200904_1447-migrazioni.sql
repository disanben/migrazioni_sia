-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: migrazioni
-- ------------------------------------------------------
-- Server version	5.7.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Anag_Srv`
--

DROP TABLE IF EXISTS `Anag_Srv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Anag_Srv` (
  `Name` varchar(15) DEFAULT NULL,
  `IP_Address` varchar(15) DEFAULT NULL,
  `ObjectCat` varchar(50) DEFAULT NULL,
  `DataCre` varchar(10) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Anag_Srv`
--

LOCK TABLES `Anag_Srv` WRITE;
/*!40000 ALTER TABLE `Anag_Srv` DISABLE KEYS */;
/*!40000 ALTER TABLE `Anag_Srv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Check_Istanze`
--

DROP TABLE IF EXISTS `Check_Istanze`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Check_Istanze` (
  `Istanza` varchar(15) DEFAULT NULL,
  `Tipo` varchar(15) DEFAULT NULL,
  `Server` varchar(15) DEFAULT NULL,
  `Note` varchar(100) DEFAULT NULL,
  `DataCheck` varchar(25) DEFAULT NULL,
  `Firma` varchar(10) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Check_Istanze`
--

LOCK TABLES `Check_Istanze` WRITE;
/*!40000 ALTER TABLE `Check_Istanze` DISABLE KEYS */;
INSERT INTO `Check_Istanze` VALUES ('PSITOD00007P','FIRE','FSITODSNDA01','Ok ma in logoff','2020-09-03 12:45:08','BdS',1),('PSITOD00008P','FIRE','FSITODSNDA01','Ok ma in logoff','2020-09-03 12:45:20','BdS',2),('PSITOD00011P','FIRE','FSITODSNDA01','Ok ma in logoff','2020-09-03 12:45:29','BdS',3),('PSITOD00012P','FIRE','FSITODSNDA01','Ok ma in logoff','2020-09-03 12:45:39','BdS',4),('PSITOD00013P','FIRE','FSITODSNDA01','Ok ma in logoff','2020-09-03 12:45:51','BdS',5),('PSITOD00001P','FIRE','ZSITOASNDA01','Ok ed in LogOn','2020-09-03 15:32:28','BdS',6),('PSITOD00002P','FIRE','ZSITOASNDA01','Ok ed in LogOn','2020-09-03 15:32:42','BdS',7),('PSITOB00002P','FIRE','ZSITOASNDA01','Ok ma in LogOff','2020-09-03 15:59:15','BdS',8),('PSITOB00003P','FIRE','ZSITOASNDA01','Ok ma in LogOff','2020-09-03 15:59:38','BdS',9),('PSITOD00005B','FIRE','GSITOG201606','Ok ma spento - Get Service Session <2404>','2020-09-03 16:21:36','BdS',10),('PSITOD00006B','FIRE','GSITOG201606','Ok ma spento - Get Service Session <2404>','2020-09-03 16:22:02','BdS',11),('PSITOD00007B','FIRE','GSITOG201606','Ok ma spento - Get Service Session <2404>','2020-09-03 16:22:13','BdS',12),('PSITOD00008B','FIRE','GSITOG201606','Ok ma spento - Get Service Session <2404>','2020-09-03 16:22:19','BdS',13),('PSITOC00003P','FIRE','GSITOG201602','NON Verificata - Server non accetta mie credenziali','2020-09-03 16:41:33','BdS',14),('PSITOC00012P','FIRE','GSITOG201602','NON Verificata - Server non accetta mie credenziali','2020-09-03 16:41:40','BdS',15),('JSITOAES009P','FEMSWS','GSITOG201602','NON Verificata - Server non accetta mie credenziali','2020-09-03 16:43:20','BdS',16),('PSITOC00001P','FIRE','GSITOG201604','OK ma in logoff','2020-09-03 16:50:13','BdS',17),('PSITOC00011P','FIRE','GSITOG201604','OK ma in logoff','2020-09-03 16:50:31','BdS',18),('FSSITOGMF604','FEMSMQ','GSITOG201604','OK in LogOn','2020-09-03 17:10:31','BdS',20);
/*!40000 ALTER TABLE `Check_Istanze` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Da_Buttare`
--

DROP TABLE IF EXISTS `Da_Buttare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Da_Buttare` (
  `daButtare` varchar(15) DEFAULT NULL,
  `IP_Address` varchar(15) DEFAULT NULL,
  `FV` varchar(15) DEFAULT NULL,
  `Note` varchar(30) DEFAULT NULL,
  `Eliminata` varchar(8) DEFAULT NULL,
  `DataCre` varchar(10) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Da_Buttare`
--

LOCK TABLES `Da_Buttare` WRITE;
/*!40000 ALTER TABLE `Da_Buttare` DISABLE KEYS */;
/*!40000 ALTER TABLE `Da_Buttare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Elencoserver_Feng_2016`
--

DROP TABLE IF EXISTS `Elencoserver_Feng_2016`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Elencoserver_Feng_2016` (
  `Macchina` varchar(15) DEFAULT NULL,
  `TipoMacchina` varchar(15) DEFAULT NULL,
  `SpostareIn` varchar(15) DEFAULT NULL,
  `Istanze` varchar(15) DEFAULT NULL,
  `TipoIstanza` varchar(15) DEFAULT NULL,
  `EasId` varchar(15) DEFAULT NULL,
  `Ruolo` varchar(15) DEFAULT NULL,
  `Performance` varchar(15) DEFAULT NULL,
  `Versione` varchar(25) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `SO` varchar(15) DEFAULT NULL,
  `Note` varchar(15) DEFAULT NULL,
  `DataCre` varchar(10) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Elencoserver_Feng_2016`
--

LOCK TABLES `Elencoserver_Feng_2016` WRITE;
/*!40000 ALTER TABLE `Elencoserver_Feng_2016` DISABLE KEYS */;
/*!40000 ALTER TABLE `Elencoserver_Feng_2016` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Elencoserver_Feng_Listafinale`
--

DROP TABLE IF EXISTS `Elencoserver_Feng_Listafinale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Elencoserver_Feng_Listafinale` (
  `Sito` varchar(15) DEFAULT NULL,
  `ServerPartenza` varchar(15) DEFAULT NULL,
  `SitoArrivo` varchar(15) DEFAULT NULL,
  `ServerArrivo` varchar(15) DEFAULT NULL,
  `StatoIstanze` varchar(30) DEFAULT NULL,
  `Flag2` varchar(15) DEFAULT NULL,
  `FemsId_Fire` varchar(15) DEFAULT NULL,
  `Colonna1` varchar(15) DEFAULT NULL,
  `Colonna12` varchar(15) DEFAULT NULL,
  `TipoFems2` varchar(15) DEFAULT NULL,
  `EasId2` varchar(15) DEFAULT NULL,
  `EpUtilizzato` varchar(15) DEFAULT NULL,
  `Role2` varchar(15) DEFAULT NULL,
  `EpUtilizzato3` varchar(15) DEFAULT NULL,
  `Performance` varchar(15) DEFAULT NULL,
  `Vers` varchar(15) DEFAULT NULL,
  `IP` varchar(30) DEFAULT NULL,
  `Colonna22` varchar(15) DEFAULT NULL,
  `Note` varchar(30) DEFAULT NULL,
  `Col23` varchar(5) DEFAULT NULL,
  `Col24` varchar(5) DEFAULT NULL,
  `Col25` varchar(5) DEFAULT NULL,
  `Col26` varchar(5) DEFAULT NULL,
  `Col27` varchar(5) DEFAULT NULL,
  `DataCre` varchar(10) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Elencoserver_Feng_Listafinale`
--

LOCK TABLES `Elencoserver_Feng_Listafinale` WRITE;
/*!40000 ALTER TABLE `Elencoserver_Feng_Listafinale` DISABLE KEYS */;
/*!40000 ALTER TABLE `Elencoserver_Feng_Listafinale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Note_Server`
--

DROP TABLE IF EXISTS `Note_Server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Note_Server` (
  `Server` varchar(15) DEFAULT NULL,
  `Note` varchar(100) DEFAULT NULL,
  `Data` varchar(25) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Note_Server`
--

LOCK TABLES `Note_Server` WRITE;
/*!40000 ALTER TABLE `Note_Server` DISABLE KEYS */;
INSERT INTO `Note_Server` VALUES ('HSITOG200804','Server non raggiungibile','2020-09-02 16:53:02',1),('HSITOG200805','Server non raggiungibile','2020-09-02 17:00:44',2),('GSITOD200803','Server non più raggiungibile','2020-09-03 10:45:06',3),('GSITOG201607','Nuovo Server Virtuale inserito da Giaimo-Bonetti il 2 Sep','2020-09-04 13:59:53',4),('GSITOG201608','Nuovo Server Virtuale inserito da Giaimo-Bonetti il 2 Sep','2020-09-04 14:00:24',5),('GSITOG201609','Nuovo Server Virtuale inserito da Giaimo-Bonetti il 2 Sep','2020-09-04 14:00:35',6),('GSITOG201610','Nuovo Server Virtuale inserito da Giaimo-Bonetti il 2 Sep','2020-09-04 14:00:43',7);
/*!40000 ALTER TABLE `Note_Server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Yang_FemsWS`
--

DROP TABLE IF EXISTS `Yang_FemsWS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Yang_FemsWS` (
  `LSiteId` int(11) DEFAULT NULL,
  `LSiteName` varchar(15) DEFAULT NULL,
  `FemsWsId` varchar(15) DEFAULT NULL,
  `FemsWsLabel` varchar(15) DEFAULT NULL,
  `UniqueNo` int(11) DEFAULT NULL,
  `Enabled` char(1) DEFAULT NULL,
  `Server_Kind` varchar(15) DEFAULT NULL,
  `ServerId` varchar(15) DEFAULT NULL,
  `PNodeId` varchar(15) DEFAULT NULL,
  `CNodeId` varchar(15) DEFAULT NULL,
  `NetPort` int(11) DEFAULT NULL,
  `Involved` int(11) DEFAULT NULL,
  `Life_Cycle_State` varchar(15) DEFAULT NULL,
  `Admin_State` varchar(15) DEFAULT NULL,
  `DataCre` varchar(10) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Yang_FemsWS`
--

LOCK TABLES `Yang_FemsWS` WRITE;
/*!40000 ALTER TABLE `Yang_FemsWS` DISABLE KEYS */;
/*!40000 ALTER TABLE `Yang_FemsWS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-04 14:47:19
