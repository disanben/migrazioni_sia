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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note_server`
--

LOCK TABLES `note_server` WRITE;
/*!40000 ALTER TABLE `note_server` DISABLE KEYS */;
INSERT INTO `note_server` VALUES ('HSITOG200804','Server non raggiungibile','2020-09-02 16:53:02',1),('HSITOG200805','Server non raggiungibile','2020-09-02 17:00:44',2),('GSITOD200803','Server non più raggiungibile','2020-09-03 10:45:06',3),('GSITOG201607','Nuovo Server Virtuale inserito da Giaimo-Bonetti il 2 Sep','2020-09-04 13:59:53',4),('GSITOG201608','Nuovo Server Virtuale inserito da Giaimo-Bonetti il 2 Sep','2020-09-04 14:00:24',5),('GSITOG201609','Nuovo Server Virtuale inserito da Giaimo-Bonetti il 2 Sep','2020-09-04 14:00:35',6),('GSITOG201610','Nuovo Server Virtuale inserito da Giaimo-Bonetti il 2 Sep','2020-09-04 14:00:43',7),('KSITOC200806','Server non più raggiungibile','2020-09-04 16:41:01',8),('GSITOF200801','Server non più raggiungibile','2020-09-04 16:41:30',9),('GSITOG200801','Server non più raggiungibile','2020-09-04 16:41:44',10),('GSITOG200802','Server non più raggiungibile','2020-09-04 16:42:07',11),('KSITOA200804','Server non più raggiungibile','2020-09-04 16:42:37',12),('KSITOB200802','Server non più raggiungibile','2020-09-04 16:42:48',13),('KSITOC200806','Server non più raggiungibile','2020-09-04 16:43:01',14),('KSITOF200801','Server non più raggiungibile','2020-09-04 16:43:14',15),('KSITOG200807','Server non più raggiungibile','2020-09-04 16:43:30',16),('KSITOG200808','Server non più raggiungibile','2020-09-04 16:45:12',17),('USITOA200823','Server non più raggiungibile','2020-09-04 16:46:07',18),('USITOA200824','Server non più raggiungibile','2020-09-04 16:46:18',19),('USITOB200815','Server non più raggiungibile','2020-09-04 16:46:30',20),('USITOB200816','Server non più raggiungibile','2020-09-04 16:46:41',21);
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

-- Dump completed on 2020-09-29 16:49:00
