-- MySQL dump 10.13  Distrib 5.7.18, for macos10.12 (x86_64)
--
-- Host: localhost    Database: familytree
-- ------------------------------------------------------
-- Server version	5.7.18

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
-- Table structure for table `gravesites`
--

DROP TABLE IF EXISTS `gravesites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gravesites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastname` varchar(100) DEFAULT NULL,
  `firstname_mi` varchar(100) DEFAULT NULL,
  `memorial_num` varchar(100) DEFAULT NULL,
  `birth_dt` varchar(15) DEFAULT NULL,
  `death_dt` varchar(15) DEFAULT NULL,
  `cemetery` varchar(500) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gravesites`
--

LOCK TABLES `gravesites` WRITE;
/*!40000 ALTER TABLE `gravesites` DISABLE KEYS */;
INSERT INTO `gravesites` (`id`, `lastname`, `firstname_mi`, `memorial_num`, `birth_dt`, `death_dt`, `cemetery`, `city`, `state`) VALUES (1,'Holland','Patricia Ann Spriggs','7211477','Jan 2 1942','Apr 10, 2011','Rockland Cemetery, Belpre, OH 45714','Belpre','Ohio'),(2,'Spriggs','Alice M','151490590','Nov 9 1925','Mar 25 2001','Rockland Cemetery, Belpre, OH 45714','Belpre','Ohio'),(3,'Spriggs','Alice Mayle','107165701','1911','1974','Rockland Cemetery, Belpre, OH 45714','Belpre','Ohio'),(4,'Spriggs','Anna L','108307199','1925','1970','Rockland Cemetery, Belpre, OH 45714','Belpre','Ohio'),(5,'Spriggs','Charles C','108306300','1897','1966','Rockland Cemetery, Belpre, OH 45714','Belpre','Ohio'),(6,'Spriggs','Frank','107173594','Jan 20 1870','Dec 4 1946','Rockland Cemetery, Belpre, OH 45714','Belpre','Ohio'),(7,'Spriggs','Fredrick C','108306597','Apr 22 1917','Jan 26 1965','Rockland Cemetery, Belpre, OH 45714','Belpre','Ohio'),(8,'Spriggs','H. Eugene','107883842','Jun 27 1913','Apr 17 1976','Rockland Cemetery, Belpre, OH 45714','Belpre','Ohio'),(9,'Spriggs Jr.','James C','27769234','Jan 18 1952','Nov 3 2003','Rockland Cemetery, Belpre, OH 45714','Belpre','Ohio'),(10,'Spriggs Sr.','James C','151490540','Jul 18 1919','Mar 10 1985','Rockland Cemetery, Belpre, OH 45714','Belpre','Ohio'),(11,'Spriggs','Mildred E','108284583','1916','1974','Rockland Cemetery, Belpre, OH 45714','Belpre','Ohio'),(12,'Spriggs','Robert D','108284659','16 Nov 1915','30 Apr 1982','Rockland Cemetery, Belpre, OH 45714','Belpre','Ohio'),(13,'Spriggs','Robin Denise','94880666','Jan. 1 1955','Jan 1 1955','Rockland Cemetery, Belpre, OH 45714','Belpre','Ohio'),(14,'Spriggs','Rev Fr William T','107165601','1911','1962','Rockland Cemetery, Belpre, OH 45714','Belpre','Ohio'),(15,'Smithers','Priscilla Jane','181598077','Jan 2 1942','Jul 15 2017','501 West McCreight Avenue, Springfield, Ohio 45504','Springfield','Ohio');
/*!40000 ALTER TABLE `gravesites` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-19 23:20:48
