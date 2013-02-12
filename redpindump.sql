-- MySQL dump 10.13  Distrib 5.5.29, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: redpin
-- ------------------------------------------------------
-- Server version	5.5.29-0ubuntu0.12.10.1
DROP DATABASE IF EXISTS RedPin;

CREATE DATABASE RedPin;

USE RedPin;

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
-- Table structure for table `bluetoothreading`
--

DROP TABLE IF EXISTS `bluetoothreading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bluetoothreading` (
  `bluetoothReadingId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `friendlyName` varchar(45) DEFAULT NULL,
  `bluetoothAddress` varchar(45) DEFAULT NULL,
  `majorDeviceClass` varchar(45) DEFAULT NULL,
  `minorDeviceClass` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bluetoothReadingId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bluetoothreading`
--

LOCK TABLES `bluetoothreading` WRITE;
/*!40000 ALTER TABLE `bluetoothreading` DISABLE KEYS */;
/*!40000 ALTER TABLE `bluetoothreading` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fingerprint`
--

DROP TABLE IF EXISTS `fingerprint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fingerprint` (
  `fingerprintId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locationId` int(10) unsigned DEFAULT NULL,
  `measurementId` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`fingerprintId`),
  KEY `location` (`locationId`),
  KEY `measurement` (`measurementId`),
  CONSTRAINT `location` FOREIGN KEY (`locationId`) REFERENCES `location` (`locationId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `measurement` FOREIGN KEY (`measurementId`) REFERENCES `measurement` (`measurementId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fingerprint`
--

LOCK TABLES `fingerprint` WRITE;
/*!40000 ALTER TABLE `fingerprint` DISABLE KEYS */;
/*!40000 ALTER TABLE `fingerprint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gsmreading`
--

DROP TABLE IF EXISTS `gsmreading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gsmreading` (
  `gsmReadingId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cellId` varchar(45) DEFAULT NULL,
  `areaId` varchar(45) DEFAULT NULL,
  `signalStrength` varchar(45) DEFAULT NULL,
  `MCC` varchar(45) DEFAULT NULL,
  `MNC` varchar(45) DEFAULT NULL,
  `networkName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`gsmReadingId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gsmreading`
--

LOCK TABLES `gsmreading` WRITE;
/*!40000 ALTER TABLE `gsmreading` DISABLE KEYS */;
/*!40000 ALTER TABLE `gsmreading` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `locationId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `symbolicId` varchar(90) DEFAULT NULL,
  `mapId` int(10) unsigned DEFAULT NULL,
  `mapXCord` int(10) unsigned DEFAULT NULL,
  `mapYCord` int(10) unsigned DEFAULT NULL,
  `accuracy` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`locationId`),
  KEY `symbolicId` (`symbolicId`),
  KEY `map` (`mapId`),
  CONSTRAINT `map` FOREIGN KEY (`mapId`) REFERENCES `map` (`mapId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map`
--

DROP TABLE IF EXISTS `map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map` (
  `mapId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mapName` varchar(45) DEFAULT NULL,
  `mapURL` text,
  PRIMARY KEY (`mapId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map`
--

LOCK TABLES `map` WRITE;
/*!40000 ALTER TABLE `map` DISABLE KEYS */;
/*!40000 ALTER TABLE `map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measurement`
--

DROP TABLE IF EXISTS `measurement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measurement` (
  `measurementId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`measurementId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measurement`
--

LOCK TABLES `measurement` WRITE;
/*!40000 ALTER TABLE `measurement` DISABLE KEYS */;
/*!40000 ALTER TABLE `measurement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `readinginmeasurement`
--

DROP TABLE IF EXISTS `readinginmeasurement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `readinginmeasurement` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `measurementId` int(10) unsigned NOT NULL,
  `readingId` int(10) unsigned NOT NULL,
  `readingClassName` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `measurement` (`measurementId`),
  KEY `reading` (`readingId`),
  CONSTRAINT `measurementFk` FOREIGN KEY (`measurementId`) REFERENCES `measurement` (`measurementId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `readinginmeasurement`
--

LOCK TABLES `readinginmeasurement` WRITE;
/*!40000 ALTER TABLE `readinginmeasurement` DISABLE KEYS */;
/*!40000 ALTER TABLE `readinginmeasurement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wifireading`
--

DROP TABLE IF EXISTS `wifireading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wifireading` (
  `wifiReadingId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bssid` varchar(45) DEFAULT NULL,
  `ssid` varchar(45) DEFAULT NULL,
  `rssi` int(10) DEFAULT NULL,
  `wepEnabled` tinyint(1) DEFAULT NULL,
  `isInfrastructure` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`wifiReadingId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wifireading`
--

LOCK TABLES `wifireading` WRITE;
/*!40000 ALTER TABLE `wifireading` DISABLE KEYS */;
/*!40000 ALTER TABLE `wifireading` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-02-02  0:11:05
