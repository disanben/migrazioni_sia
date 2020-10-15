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
-- Table structure for table `note_server`
--

DROP TABLE IF EXISTS `note_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note_server` (
  `Server` varchar(15) DEFAULT NULL,
  `Note` varchar(100) DEFAULT NULL,
  `Data` varchar(25) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Stato` int(11) DEFAULT NULL,
  `StatoDesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note_server`
--

LOCK TABLES `note_server` WRITE;
/*!40000 ALTER TABLE `note_server` DISABLE KEYS */;
INSERT INTO `note_server` VALUES ('HSITOG200804','Server non raggiungibile','2020-09-02 16:53:02',1,NULL,NULL),('HSITOG200805','Server non raggiungibile','2020-09-02 17:00:44',2,NULL,NULL),('GSITOD200803','Server non più raggiungibile','2020-09-03 10:45:06',3,NULL,NULL),('GSITOG201607','Nuovo Server Virtuale inserito da Giaimo-Bonetti il 2 Sep','2020-09-04 13:59:53',4,NULL,NULL),('GSITOG201608','Nuovo Server Virtuale inserito da Giaimo-Bonetti il 2 Sep','2020-09-04 14:00:24',5,NULL,NULL),('GSITOG201609','Nuovo Server Virtuale inserito da Giaimo-Bonetti il 2 Sep','2020-09-04 14:00:35',6,NULL,NULL),('GSITOG201610','Nuovo Server Virtuale inserito da Giaimo-Bonetti il 2 Sep','2020-09-04 14:00:43',7,NULL,NULL),('KSITOC200806','Server non più raggiungibile','2020-09-04 16:41:01',8,NULL,NULL),('GSITOF200801','Server non più raggiungibile','2020-09-04 16:41:30',9,NULL,NULL),('GSITOG200801','Server non più raggiungibile','2020-09-04 16:41:44',10,NULL,NULL),('GSITOG200802','Server non più raggiungibile','2020-09-04 16:42:07',11,NULL,NULL),('KSITOA200804','Server non più raggiungibile','2020-09-04 16:42:37',12,NULL,NULL),('KSITOB200802','Server non più raggiungibile','2020-09-04 16:42:48',13,NULL,NULL),('KSITOC200806','Server non più raggiungibile','2020-09-04 16:43:01',14,NULL,NULL),('KSITOF200801','Server non più raggiungibile','2020-09-04 16:43:14',15,NULL,NULL),('KSITOG200807','Server non più raggiungibile','2020-09-04 16:43:30',16,NULL,NULL),('KSITOG200808','Server non più raggiungibile','2020-09-04 16:45:12',17,NULL,NULL),('USITOA200823','Server non più raggiungibile','2020-09-04 16:46:07',18,NULL,NULL),('USITOA200824','Server non più raggiungibile','2020-09-04 16:46:18',19,NULL,NULL),('USITOB200815','Server non più raggiungibile','2020-09-04 16:46:30',20,NULL,NULL),('USITOB200816','Server non più raggiungibile','2020-09-04 16:46:41',21,NULL,NULL),('gsitog201608','Tentata installazione del Feng 031. Non si riesce a creare la istanza per errore su Postgres.','2020-09-30 09:45:50',22,NULL,NULL),('gsitog201609','Tentata installazione dei prerequisiti w2016. Non riesco a connettermi su Postgres.','2020-09-30 09:48:29',23,NULL,NULL),('gsitog201609','Fatto upgrade a FENG 460','2020-09-30 17:04:44',24,NULL,NULL),('gsitog201607','Installata istanza FEMSMQ FVSITOCMF131','2020-09-30 17:22:44',25,NULL,NULL),('gsitog201608','Fatto Update KB890830 - KB4576750 - KB4577015','2020-10-01 10:02:00',26,NULL,NULL),('gsitog201607','Fatto Update KB4565912 - KB890830 - KB4576750 - KB4577015','2020-10-01 10:17:13',27,NULL,NULL),('gsitog201609','Fatto Update KB4565912 - KB890830 - KB4576750 - KB4577015','2020-10-01 10:18:24',28,NULL,NULL),('gsitog201610','Fatto Update KB4565912 - KB890830 - KB4576750 - KB4577015','2020-10-01 10:19:25',29,NULL,NULL),('gsitog201606','Fatto Update KB4565912 - KB890830 - KB4576750 - KB4577015','2020-10-01 10:21:00',30,NULL,NULL),('gsitog201605','Fatto Update KB4565912 - KB890830 - KB4576750 - KB4577015','2020-10-02 18:34:22',31,4,'MIGRATO_DA_AGGIORN.'),('gsitog201605','Installata versione FENG 105','2020-10-02 18:34:22',32,4,'MIGRATO_DA_AGGIORN.'),('gsitog201606','\nInstallata versione FENG 105','2020-10-01 14:16:12',34,NULL,NULL),('gsitog201607','\nInstallata versione FENG 105','2020-10-01 14:36:20',35,NULL,NULL),('gsitog201610','\nInstallata versione FENG 031','2020-10-01 15:21:07',36,NULL,NULL),('gsitog201608','\nInstallata versione FENG 031','2020-10-01 15:32:07',38,NULL,NULL),('FSITODSNDA01','Inserito lo stato a RAGGIUNG-MIGRATO','2020-10-05 16:15:48',59,NULL,NULL),('GSITOD200803','Inserito lo stato a ELIMINATO_DA_COMUNIC','2020-10-05 16:21:04',60,NULL,NULL),('GSITOD200803','Questo server è ancora raggiungibile ma è stato inserito nella lista da buttare','2020-10-05 16:24:52',61,NULL,NULL),('GSITOF200801','Inserito lo stato a ELIMINATO','2020-10-05 17:00:48',62,NULL,NULL),('ZSITOASNDA01','Inserito lo stato a RAGGIUNG-MIGRATO','2020-10-05 17:08:59',63,NULL,NULL),('ZSITOASNDA01','Fatto Update KB4565912 - KB890830 - KB4576750 - KB4577015','2020-10-05 17:15:26',64,NULL,NULL),('ZSITOASNDA01','Installata versione FENG 085','2020-10-06 08:52:09',65,NULL,NULL),('KSITOA200804','Inserito lo stato a ELIMINATO','2020-10-06 17:39:48',66,NULL,NULL),('GSITOG201601','Inserito lo stato a RAGGIUNG-MIGRATO','2020-10-06 17:56:21',68,NULL,NULL),('KSITOA200804','Aggiornato lo stato a ELIMINATO','2020-10-06 17:57:13',69,NULL,NULL),('KSITOA200803','Non più raggiungibile','2020-10-07 11:47:43',70,NULL,NULL),('gsitog201602','Fatto Update KB4565912 - KB890830 - KB4576750 - KB4577015 - KB4577015','2020-10-07 14:29:53',72,NULL,NULL),('gsitog201602','Aggiornamento a KB4577015 non completato per mancanza di spazio disco','2020-10-07 14:42:01',73,NULL,NULL),('gsitog201602','Eliminati circa 30 Gb di log files e liberato spazio disco','2020-10-07 15:28:33',74,NULL,NULL),('GSITOD200803','Aggiornato lo stato a ELIMINATO_DA_COMUNIC','2020-10-07 15:40:06',75,NULL,NULL),('GSITOF200801','Aggiornato lo stato a ELIMINATO','2020-10-07 15:42:04',76,NULL,NULL),('usitoa200824','Inserito lo stato a ELIMINATO','2020-10-07 15:46:02',77,NULL,NULL),('USITOA200824','Inserito lo stato a ELIMINATO','2020-10-07 15:47:34',78,NULL,NULL),('ZSITOA200806','Inserito lo stato a ELIMINATO_DA_COMUNIC','2020-10-07 15:58:05',79,NULL,NULL),('gsitog201602','Fatto Update a KB4577015','2020-10-07 16:38:32',80,NULL,NULL),('GSITOG201602','Inserito lo stato a MIGRAZIONE_IN_CORSO','2020-10-07 17:29:08',81,NULL,NULL),('GSITOG201601','Fatto Update a KB4565912 - KB4576750 - KB4577015 - KB890830','2020-10-07 17:39:09',82,NULL,NULL),('GSITOG201603','Fatto Update a KB4565912 - KB4576750 - KB4577015 - KB890830','2020-10-07 17:40:02',83,NULL,NULL),('ZSITOL201602','Fatto Update a KB4565912 - KB4576750 - KB4577015 - KB890830','2020-10-07 17:41:07',84,NULL,NULL),('USITOC200820','Inserito lo stato a MIGRAZIONE_IN_CORSO','2020-10-08 16:56:32',85,NULL,NULL),('GSITOG201608','Inserito lo stato a MIGRAZIONE_IN_CORSO','2020-10-08 16:58:23',86,NULL,NULL),('gsitog201607','Inserito lo stato a RAGGIUNG-MIGRATO','2020-10-08 16:59:21',87,NULL,NULL);
/*!40000 ALTER TABLE `note_server` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-08 22:25:04
