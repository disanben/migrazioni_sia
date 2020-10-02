-- MySQL dump 10.17  Distrib 10.3.14-MariaDB, for CYGWIN (x86_64)
--
-- Host: localhost    Database: migrazioni
-- ------------------------------------------------------
-- Server version	10.3.14-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `check_istanze`
--

DROP TABLE IF EXISTS `check_istanze`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `check_istanze` (
  `Istanza` varchar(15) DEFAULT NULL,
  `Tipo` varchar(15) DEFAULT NULL,
  `Server` varchar(15) DEFAULT NULL,
  `Note` varchar(100) DEFAULT NULL,
  `DataCheck` varchar(25) DEFAULT NULL,
  `Firma` varchar(10) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_istanze`
--

LOCK TABLES `check_istanze` WRITE;
/*!40000 ALTER TABLE `check_istanze` DISABLE KEYS */;
INSERT INTO `check_istanze` VALUES ('PSITOD00007P','FIRE','FSITODSNDA01','Ok ma in logoff','2020-09-03 12:45:08','BdS',1),('PSITOD00008P','FIRE','FSITODSNDA01','Ok ma in logoff','2020-09-03 12:45:20','BdS',2),('PSITOD00011P','FIRE','FSITODSNDA01','Ok ma in logoff','2020-09-03 12:45:29','BdS',3),('PSITOD00012P','FIRE','FSITODSNDA01','Ok ma in logoff','2020-09-03 12:45:39','BdS',4),('PSITOD00013P','FIRE','FSITODSNDA01','Ok ma in logoff','2020-09-03 12:45:51','BdS',5),('PSITOD00001P','FIRE','ZSITOASNDA01','Ok ed in LogOn','2020-09-03 15:32:28','BdS',6),('PSITOD00002P','FIRE','ZSITOASNDA01','Ok ed in LogOn','2020-09-03 15:32:42','BdS',7),('PSITOB00002P','FIRE','ZSITOASNDA01','Ok ma in LogOff','2020-09-03 15:59:15','BdS',8),('PSITOB00003P','FIRE','ZSITOASNDA01','Ok ma in LogOff','2020-09-03 15:59:38','BdS',9),('PSITOD00005B','FIRE','GSITOG201606','Ok ma spento - Get Service Session <2404>','2020-09-03 16:21:36','BdS',10),('PSITOD00006B','FIRE','GSITOG201606','Ok ma spento - Get Service Session <2404>','2020-09-03 16:22:02','BdS',11),('PSITOD00007B','FIRE','GSITOG201606','Ok ma spento - Get Service Session <2404>','2020-09-03 16:22:13','BdS',12),('PSITOD00008B','FIRE','GSITOG201606','Ok ma spento - Get Service Session <2404>','2020-09-03 16:22:19','BdS',13),('PSITOC00003P','FIRE','GSITOG201602','NON Verificata - Server non accetta mie credenziali','2020-09-03 16:41:33','BdS',14),('PSITOC00012P','FIRE','GSITOG201602','NON Verificata - Server non accetta mie credenziali','2020-09-03 16:41:40','BdS',15),('JSITOAES009P','FEMSWS','GSITOG201602','NON Verificata - Server non accetta mie credenziali','2020-09-03 16:43:20','BdS',16),('PSITOC00001P','FIRE','GSITOG201604','OK ma in logoff','2020-09-03 16:50:13','BdS',17),('PSITOC00011P','FIRE','GSITOG201604','OK ma in logoff','2020-09-03 16:50:31','BdS',18),('FSSITOGMF604','FEMSMQ','GSITOG201604','OK in LogOn','2020-09-03 17:10:31','BdS',20),('FVSITOCMF131','FEMSMQ','GSITOG201607','Migrato e funzionante','2020-09-28 11:43:09','BdS',21);
/*!40000 ALTER TABLE `check_istanze` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-29 16:48:58
