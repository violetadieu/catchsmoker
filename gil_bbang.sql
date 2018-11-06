-- MySQL dump 10.13  Distrib 5.7.20, for Win64 (x86_64)
--
-- Host: localhost    Database: webtoon
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `cartoon_friday`
--

DROP TABLE IF EXISTS `cartoon_friday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartoon_friday` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  `genre` text,
  `synopsis` text,
  `name` text,
  `filename` text,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartoon_friday`
--

LOCK TABLES `cartoon_friday` WRITE;
/*!40000 ALTER TABLE `cartoon_friday` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartoon_friday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartoon_monday`
--

DROP TABLE IF EXISTS `cartoon_monday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartoon_monday` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  `genre` text,
  `synopsis` text,
  `name` text,
  `filename` text,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartoon_monday`
--

LOCK TABLES `cartoon_monday` WRITE;
/*!40000 ALTER TABLE `cartoon_monday` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartoon_monday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartoon_saturday`
--

DROP TABLE IF EXISTS `cartoon_saturday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartoon_saturday` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  `genre` text,
  `synopsis` text,
  `name` text,
  `filename` text,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartoon_saturday`
--

LOCK TABLES `cartoon_saturday` WRITE;
/*!40000 ALTER TABLE `cartoon_saturday` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartoon_saturday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartoon_sunday`
--

DROP TABLE IF EXISTS `cartoon_sunday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartoon_sunday` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  `genre` text,
  `synopsis` text,
  `name` text,
  `filename` text,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartoon_sunday`
--

LOCK TABLES `cartoon_sunday` WRITE;
/*!40000 ALTER TABLE `cartoon_sunday` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartoon_sunday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartoon_thursday`
--

DROP TABLE IF EXISTS `cartoon_thursday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartoon_thursday` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  `genre` text,
  `synopsis` text,
  `name` text,
  `filename` text,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartoon_thursday`
--

LOCK TABLES `cartoon_thursday` WRITE;
/*!40000 ALTER TABLE `cartoon_thursday` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartoon_thursday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartoon_tuesday`
--

DROP TABLE IF EXISTS `cartoon_tuesday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartoon_tuesday` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  `genre` text,
  `synopsis` text,
  `name` text,
  `filename` text,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartoon_tuesday`
--

LOCK TABLES `cartoon_tuesday` WRITE;
/*!40000 ALTER TABLE `cartoon_tuesday` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartoon_tuesday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartoon_wednesday`
--

DROP TABLE IF EXISTS `cartoon_wednesday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartoon_wednesday` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  `genre` text,
  `synopsis` text,
  `name` text,
  `filename` text,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartoon_wednesday`
--

LOCK TABLES `cartoon_wednesday` WRITE;
/*!40000 ALTER TABLE `cartoon_wednesday` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartoon_wednesday` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-15 20:55:47
