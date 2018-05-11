CREATE DATABASE  IF NOT EXISTS `hl7` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `hl7`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 192.168.1.16    Database: hl7
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.17.10.1

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
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Address` (
  `id` varchar(100) NOT NULL,
  `type` varchar(250) DEFAULT NULL,
  `use` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `use` (`use`),
  CONSTRAINT `Address_ibfk_1` FOREIGN KEY (`type`) REFERENCES `AddressType` (`DestinationCode`),
  CONSTRAINT `Address_ibfk_2` FOREIGN KEY (`use`) REFERENCES `AddressUse` (`DestinationCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AddressType`
--

DROP TABLE IF EXISTS `AddressType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AddressType` (
  `sourceCode` varchar(250) DEFAULT NULL,
  `equivalence` varchar(250) DEFAULT NULL,
  `DestinationCode` varchar(10) NOT NULL,
  PRIMARY KEY (`DestinationCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AddressType`
--

LOCK TABLES `AddressType` WRITE;
/*!40000 ALTER TABLE `AddressType` DISABLE KEYS */;
/*!40000 ALTER TABLE `AddressType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AddressUse`
--

DROP TABLE IF EXISTS `AddressUse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AddressUse` (
  `sourceCode` varchar(250) DEFAULT NULL,
  `equivalence` varchar(250) DEFAULT NULL,
  `DestinationCode` varchar(10) NOT NULL,
  PRIMARY KEY (`DestinationCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AddressUse`
--

LOCK TABLES `AddressUse` WRITE;
/*!40000 ALTER TABLE `AddressUse` DISABLE KEYS */;
/*!40000 ALTER TABLE `AddressUse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Calibration`
--

DROP TABLE IF EXISTS `Calibration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Calibration` (
  `id` varchar(100) NOT NULL,
  `state` varchar(20) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `state` (`state`),
  KEY `type` (`type`),
  CONSTRAINT `Calibration_ibfk_1` FOREIGN KEY (`state`) REFERENCES `DeviceMetricCalibrationState` (`Code`),
  CONSTRAINT `Calibration_ibfk_2` FOREIGN KEY (`type`) REFERENCES `DeviceMetricCalibrationType` (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Calibration`
--

LOCK TABLES `Calibration` WRITE;
/*!40000 ALTER TABLE `Calibration` DISABLE KEYS */;
/*!40000 ALTER TABLE `Calibration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CommonTags`
--

DROP TABLE IF EXISTS `CommonTags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CommonTags` (
  `Code` varchar(20) NOT NULL,
  `Display` varchar(50) DEFAULT NULL,
  `Definition` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CommonTags`
--

LOCK TABLES `CommonTags` WRITE;
/*!40000 ALTER TABLE `CommonTags` DISABLE KEYS */;
/*!40000 ALTER TABLE `CommonTags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ContactPoint`
--

DROP TABLE IF EXISTS `ContactPoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ContactPoint` (
  `id` varchar(100) NOT NULL,
  `period` datetime DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `system` varchar(15) DEFAULT NULL,
  `use` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system` (`system`),
  KEY `use` (`use`),
  CONSTRAINT `ContactPoint_ibfk_1` FOREIGN KEY (`system`) REFERENCES `ContactPointSystem` (`SourceCode`),
  CONSTRAINT `ContactPoint_ibfk_2` FOREIGN KEY (`use`) REFERENCES `ContactPointUse` (`SourceCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContactPoint`
--

LOCK TABLES `ContactPoint` WRITE;
/*!40000 ALTER TABLE `ContactPoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `ContactPoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ContactPointSystem`
--

DROP TABLE IF EXISTS `ContactPointSystem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ContactPointSystem` (
  `id` varchar(100) NOT NULL,
  `SourceCode` varchar(15) NOT NULL,
  `Equivalence` varchar(50) DEFAULT NULL,
  `DestinationCode` varchar(10) NOT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `SourceCode` (`SourceCode`),
  UNIQUE KEY `DestinationCode` (`DestinationCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContactPointSystem`
--

LOCK TABLES `ContactPointSystem` WRITE;
/*!40000 ALTER TABLE `ContactPointSystem` DISABLE KEYS */;
/*!40000 ALTER TABLE `ContactPointSystem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ContactPointUse`
--

DROP TABLE IF EXISTS `ContactPointUse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ContactPointUse` (
  `id` varchar(100) NOT NULL,
  `SourceCode` varchar(15) DEFAULT NULL,
  `Equivalence` varchar(50) DEFAULT NULL,
  `DestinationCode` varchar(10) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `SourceCode` (`SourceCode`),
  UNIQUE KEY `DestinationCode` (`DestinationCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContactPointUse`
--

LOCK TABLES `ContactPointUse` WRITE;
/*!40000 ALTER TABLE `ContactPointUse` DISABLE KEYS */;
/*!40000 ALTER TABLE `ContactPointUse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Device`
--

DROP TABLE IF EXISTS `Device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Device` (
  `id` varchar(255) NOT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `expirationDate` datetime DEFAULT NULL,
  `identifier` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `lotNumber` varchar(255) DEFAULT NULL,
  `manufactureDate` datetime DEFAULT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `owner` varchar(100) DEFAULT NULL,
  `patient` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `udiCarrier` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contact` (`contact`),
  KEY `identifier` (`identifier`),
  KEY `location` (`location`),
  KEY `owner` (`owner`),
  KEY `status` (`status`),
  KEY `type` (`type`),
  KEY `udiCarrier` (`udiCarrier`),
  CONSTRAINT `Device_ibfk_1` FOREIGN KEY (`contact`) REFERENCES `ContactPoint` (`id`),
  CONSTRAINT `Device_ibfk_2` FOREIGN KEY (`identifier`) REFERENCES `Identifier` (`id`),
  CONSTRAINT `Device_ibfk_3` FOREIGN KEY (`location`) REFERENCES `Location` (`id`),
  CONSTRAINT `Device_ibfk_4` FOREIGN KEY (`owner`) REFERENCES `Organization` (`id`),
  CONSTRAINT `Device_ibfk_5` FOREIGN KEY (`status`) REFERENCES `DeviceStatus` (`Code`),
  CONSTRAINT `Device_ibfk_6` FOREIGN KEY (`type`) REFERENCES `DeviceTypes` (`Code`),
  CONSTRAINT `Device_ibfk_7` FOREIGN KEY (`udiCarrier`) REFERENCES `Identifier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Device`
--

LOCK TABLES `Device` WRITE;
/*!40000 ALTER TABLE `Device` DISABLE KEYS */;
/*!40000 ALTER TABLE `Device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeviceComponent`
--

DROP TABLE IF EXISTS `DeviceComponent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeviceComponent` (
  `id` varchar(100) NOT NULL,
  `identifier` varchar(100) DEFAULT NULL,
  `languageCode` varchar(20) DEFAULT NULL,
  `lastSystemChange` datetime DEFAULT NULL,
  `measurementPrinciple` varchar(20) DEFAULT NULL,
  `operationalStatus` varchar(255) DEFAULT NULL,
  `parameterGroup` varchar(255) DEFAULT NULL,
  `parent` varchar(100) DEFAULT NULL,
  `productionSpecification` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`),
  KEY `languageCode` (`languageCode`),
  KEY `measurementPrinciple` (`measurementPrinciple`),
  KEY `parent` (`parent`),
  KEY `productionSpecification` (`productionSpecification`),
  KEY `source` (`source`),
  CONSTRAINT `DeviceComponent_ibfk_1` FOREIGN KEY (`identifier`) REFERENCES `Identifier` (`id`),
  CONSTRAINT `DeviceComponent_ibfk_2` FOREIGN KEY (`languageCode`) REFERENCES `Languages` (`Code`),
  CONSTRAINT `DeviceComponent_ibfk_3` FOREIGN KEY (`measurementPrinciple`) REFERENCES `MeasurementPrinciple` (`Code`),
  CONSTRAINT `DeviceComponent_ibfk_4` FOREIGN KEY (`parent`) REFERENCES `DeviceComponent` (`id`),
  CONSTRAINT `DeviceComponent_ibfk_5` FOREIGN KEY (`productionSpecification`) REFERENCES `ProductionSpecification` (`id`),
  CONSTRAINT `DeviceComponent_ibfk_6` FOREIGN KEY (`source`) REFERENCES `Device` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeviceComponent`
--

LOCK TABLES `DeviceComponent` WRITE;
/*!40000 ALTER TABLE `DeviceComponent` DISABLE KEYS */;
/*!40000 ALTER TABLE `DeviceComponent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeviceMetric`
--

DROP TABLE IF EXISTS `DeviceMetric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeviceMetric` (
  `id` varchar(100) NOT NULL,
  `calibration` varchar(100) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `identifier` varchar(100) DEFAULT NULL,
  `measurementPeriod` varchar(100) DEFAULT NULL,
  `operationalStatus` varchar(20) DEFAULT NULL,
  `parent` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calibration` (`calibration`),
  KEY `category` (`category`),
  KEY `color` (`color`),
  KEY `identifier` (`identifier`),
  KEY `measurementPeriod` (`measurementPeriod`),
  KEY `operationalStatus` (`operationalStatus`),
  KEY `parent` (`parent`),
  KEY `source` (`source`),
  CONSTRAINT `DeviceMetric_ibfk_1` FOREIGN KEY (`calibration`) REFERENCES `Calibration` (`id`),
  CONSTRAINT `DeviceMetric_ibfk_2` FOREIGN KEY (`category`) REFERENCES `DeviceMetricCategory` (`Code`),
  CONSTRAINT `DeviceMetric_ibfk_3` FOREIGN KEY (`color`) REFERENCES `DeviceMetricColor` (`Code`),
  CONSTRAINT `DeviceMetric_ibfk_4` FOREIGN KEY (`identifier`) REFERENCES `Identifier` (`id`),
  CONSTRAINT `DeviceMetric_ibfk_5` FOREIGN KEY (`measurementPeriod`) REFERENCES `Timing` (`id`),
  CONSTRAINT `DeviceMetric_ibfk_6` FOREIGN KEY (`operationalStatus`) REFERENCES `DeviceMetricOperationalStatus` (`code`),
  CONSTRAINT `DeviceMetric_ibfk_7` FOREIGN KEY (`parent`) REFERENCES `DeviceComponent` (`id`),
  CONSTRAINT `DeviceMetric_ibfk_8` FOREIGN KEY (`source`) REFERENCES `Device` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeviceMetric`
--

LOCK TABLES `DeviceMetric` WRITE;
/*!40000 ALTER TABLE `DeviceMetric` DISABLE KEYS */;
/*!40000 ALTER TABLE `DeviceMetric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeviceMetricCalibrationState`
--

DROP TABLE IF EXISTS `DeviceMetricCalibrationState`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeviceMetricCalibrationState` (
  `Code` varchar(20) NOT NULL,
  `Display` varchar(50) DEFAULT NULL,
  `Definition` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeviceMetricCalibrationState`
--

LOCK TABLES `DeviceMetricCalibrationState` WRITE;
/*!40000 ALTER TABLE `DeviceMetricCalibrationState` DISABLE KEYS */;
/*!40000 ALTER TABLE `DeviceMetricCalibrationState` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeviceMetricCalibrationType`
--

DROP TABLE IF EXISTS `DeviceMetricCalibrationType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeviceMetricCalibrationType` (
  `Code` varchar(20) NOT NULL,
  `Display` varchar(50) DEFAULT NULL,
  `Definition` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeviceMetricCalibrationType`
--

LOCK TABLES `DeviceMetricCalibrationType` WRITE;
/*!40000 ALTER TABLE `DeviceMetricCalibrationType` DISABLE KEYS */;
/*!40000 ALTER TABLE `DeviceMetricCalibrationType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeviceMetricCategory`
--

DROP TABLE IF EXISTS `DeviceMetricCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeviceMetricCategory` (
  `Code` varchar(20) NOT NULL,
  `Display` varchar(50) DEFAULT NULL,
  `Definition` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeviceMetricCategory`
--

LOCK TABLES `DeviceMetricCategory` WRITE;
/*!40000 ALTER TABLE `DeviceMetricCategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `DeviceMetricCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeviceMetricColor`
--

DROP TABLE IF EXISTS `DeviceMetricColor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeviceMetricColor` (
  `Code` varchar(20) NOT NULL,
  `Display` varchar(50) DEFAULT NULL,
  `Definition` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeviceMetricColor`
--

LOCK TABLES `DeviceMetricColor` WRITE;
/*!40000 ALTER TABLE `DeviceMetricColor` DISABLE KEYS */;
/*!40000 ALTER TABLE `DeviceMetricColor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeviceMetricOperationalStatus`
--

DROP TABLE IF EXISTS `DeviceMetricOperationalStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeviceMetricOperationalStatus` (
  `code` varchar(255) NOT NULL,
  `event` datetime DEFAULT NULL,
  `repeat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeviceMetricOperationalStatus`
--

LOCK TABLES `DeviceMetricOperationalStatus` WRITE;
/*!40000 ALTER TABLE `DeviceMetricOperationalStatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `DeviceMetricOperationalStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeviceStatus`
--

DROP TABLE IF EXISTS `DeviceStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeviceStatus` (
  `Code` varchar(20) NOT NULL,
  `Display` varchar(50) DEFAULT NULL,
  `Definition` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeviceStatus`
--

LOCK TABLES `DeviceStatus` WRITE;
/*!40000 ALTER TABLE `DeviceStatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `DeviceStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeviceTypes`
--

DROP TABLE IF EXISTS `DeviceTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeviceTypes` (
  `Code` varchar(20) NOT NULL,
  `Display` varchar(50) DEFAULT NULL,
  `Definition` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeviceTypes`
--

LOCK TABLES `DeviceTypes` WRITE;
/*!40000 ALTER TABLE `DeviceTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `DeviceTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeviceUseRequest`
--

DROP TABLE IF EXISTS `DeviceUseRequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeviceUseRequest` (
  `id` varchar(100) NOT NULL,
  `authored` datetime DEFAULT NULL,
  `basedOn` varchar(100) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `definition` varchar(100) DEFAULT NULL,
  `deviceReference` varchar(100) DEFAULT NULL,
  `identifier` varchar(100) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `occurrence` varchar(100) DEFAULT NULL,
  `performer` varchar(100) DEFAULT NULL,
  `performerType` varchar(255) DEFAULT NULL,
  `reasonCode` varchar(255) DEFAULT NULL,
  `reasonReference` varchar(255) DEFAULT NULL,
  `reasonRejected` varchar(255) DEFAULT NULL,
  `relevantHistory` varchar(255) DEFAULT NULL,
  `replaces` varchar(100) DEFAULT NULL,
  `requester` varchar(100) DEFAULT NULL,
  `requisition` varchar(100) DEFAULT NULL,
  `stage` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `supportingInfo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authored` (`authored`),
  KEY `basedOn` (`basedOn`),
  KEY `definition` (`definition`),
  KEY `deviceReference` (`deviceReference`),
  KEY `identifier` (`identifier`),
  KEY `occurrence` (`occurrence`),
  KEY `performer` (`performer`),
  KEY `replaces` (`replaces`),
  KEY `requester` (`requester`),
  KEY `requisition` (`requisition`),
  KEY `supportingInfo` (`supportingInfo`),
  CONSTRAINT `DeviceUseRequest_ibfk_1` FOREIGN KEY (`basedOn`) REFERENCES `Resource` (`id`),
  CONSTRAINT `DeviceUseRequest_ibfk_10` FOREIGN KEY (`supportingInfo`) REFERENCES `Resource` (`id`),
  CONSTRAINT `DeviceUseRequest_ibfk_2` FOREIGN KEY (`definition`) REFERENCES `Resource` (`id`),
  CONSTRAINT `DeviceUseRequest_ibfk_3` FOREIGN KEY (`deviceReference`) REFERENCES `Device` (`id`),
  CONSTRAINT `DeviceUseRequest_ibfk_4` FOREIGN KEY (`identifier`) REFERENCES `Identifier` (`id`),
  CONSTRAINT `DeviceUseRequest_ibfk_5` FOREIGN KEY (`occurrence`) REFERENCES `Timing` (`id`),
  CONSTRAINT `DeviceUseRequest_ibfk_6` FOREIGN KEY (`performer`) REFERENCES `Device` (`id`),
  CONSTRAINT `DeviceUseRequest_ibfk_7` FOREIGN KEY (`replaces`) REFERENCES `Resource` (`id`),
  CONSTRAINT `DeviceUseRequest_ibfk_8` FOREIGN KEY (`requester`) REFERENCES `Device` (`id`),
  CONSTRAINT `DeviceUseRequest_ibfk_9` FOREIGN KEY (`requisition`) REFERENCES `Identifier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeviceUseRequest`
--

LOCK TABLES `DeviceUseRequest` WRITE;
/*!40000 ALTER TABLE `DeviceUseRequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `DeviceUseRequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeviceUseStatement`
--

DROP TABLE IF EXISTS `DeviceUseStatement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeviceUseStatement` (
  `id` varchar(100) NOT NULL,
  `bodySite` varchar(255) DEFAULT NULL,
  `device` varchar(100) DEFAULT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `indication` varchar(100) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `recodedOn` varchar(255) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `timing` varchar(100) DEFAULT NULL,
  `whenused` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `device` (`device`),
  UNIQUE KEY `subject` (`subject`),
  KEY `timing` (`timing`),
  CONSTRAINT `DeviceUseStatement_ibfk_1` FOREIGN KEY (`device`) REFERENCES `Device` (`id`),
  CONSTRAINT `DeviceUseStatement_ibfk_2` FOREIGN KEY (`timing`) REFERENCES `Timing` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeviceUseStatement`
--

LOCK TABLES `DeviceUseStatement` WRITE;
/*!40000 ALTER TABLE `DeviceUseStatement` DISABLE KEYS */;
/*!40000 ALTER TABLE `DeviceUseStatement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EventTiming`
--

DROP TABLE IF EXISTS `EventTiming`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EventTiming` (
  `Code` varchar(20) NOT NULL,
  `Display` varchar(50) DEFAULT NULL,
  `Definition` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EventTiming`
--

LOCK TABLES `EventTiming` WRITE;
/*!40000 ALTER TABLE `EventTiming` DISABLE KEYS */;
/*!40000 ALTER TABLE `EventTiming` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Identifier`
--

DROP TABLE IF EXISTS `Identifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Identifier` (
  `id` varchar(100) NOT NULL,
  `assigner` varchar(255) DEFAULT NULL,
  `period` varchar(255) DEFAULT NULL,
  `system` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `use` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `use` (`use`),
  CONSTRAINT `Identifier_ibfk_1` FOREIGN KEY (`type`) REFERENCES `IdentifierType` (`Code`),
  CONSTRAINT `Identifier_ibfk_2` FOREIGN KEY (`use`) REFERENCES `IdentifierUse` (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Identifier`
--

LOCK TABLES `Identifier` WRITE;
/*!40000 ALTER TABLE `Identifier` DISABLE KEYS */;
/*!40000 ALTER TABLE `Identifier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IdentifierType`
--

DROP TABLE IF EXISTS `IdentifierType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IdentifierType` (
  `Code` varchar(10) NOT NULL,
  `Display` varchar(50) DEFAULT NULL,
  `Definition` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IdentifierType`
--

LOCK TABLES `IdentifierType` WRITE;
/*!40000 ALTER TABLE `IdentifierType` DISABLE KEYS */;
/*!40000 ALTER TABLE `IdentifierType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IdentifierUse`
--

DROP TABLE IF EXISTS `IdentifierUse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IdentifierUse` (
  `Code` varchar(10) NOT NULL,
  `Display` varchar(50) DEFAULT NULL,
  `Definition` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IdentifierUse`
--

LOCK TABLES `IdentifierUse` WRITE;
/*!40000 ALTER TABLE `IdentifierUse` DISABLE KEYS */;
/*!40000 ALTER TABLE `IdentifierUse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Languages`
--

DROP TABLE IF EXISTS `Languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Languages` (
  `Code` varchar(20) NOT NULL,
  `Display` varchar(50) DEFAULT NULL,
  `Definition` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Languages`
--

LOCK TABLES `Languages` WRITE;
/*!40000 ALTER TABLE `Languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `Languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Location` (
  `id` varchar(100) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `endPoint` varchar(255) DEFAULT NULL,
  `identifier` varchar(100) DEFAULT NULL,
  `managingOrganization` varchar(100) DEFAULT NULL,
  `mode` varchar(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `partOf` varchar(100) DEFAULT NULL,
  `physicalType` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `telecom` varchar(100) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `address` (`address`),
  KEY `identifier` (`identifier`),
  KEY `mode` (`mode`),
  KEY `partOf` (`partOf`),
  KEY `telecom` (`telecom`),
  CONSTRAINT `Location_ibfk_1` FOREIGN KEY (`address`) REFERENCES `Address` (`id`),
  CONSTRAINT `Location_ibfk_2` FOREIGN KEY (`identifier`) REFERENCES `Identifier` (`id`),
  CONSTRAINT `Location_ibfk_3` FOREIGN KEY (`mode`) REFERENCES `LocationMode` (`Code`),
  CONSTRAINT `Location_ibfk_4` FOREIGN KEY (`partOf`) REFERENCES `Location` (`id`),
  CONSTRAINT `Location_ibfk_5` FOREIGN KEY (`telecom`) REFERENCES `ContactPoint` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location`
--

LOCK TABLES `Location` WRITE;
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LocationMode`
--

DROP TABLE IF EXISTS `LocationMode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LocationMode` (
  `Code` varchar(20) NOT NULL,
  `Display` varchar(50) DEFAULT NULL,
  `Definition` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LocationMode`
--

LOCK TABLES `LocationMode` WRITE;
/*!40000 ALTER TABLE `LocationMode` DISABLE KEYS */;
/*!40000 ALTER TABLE `LocationMode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MeasurementPrinciple`
--

DROP TABLE IF EXISTS `MeasurementPrinciple`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MeasurementPrinciple` (
  `Code` varchar(20) NOT NULL,
  `Display` varchar(50) DEFAULT NULL,
  `Definition` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MeasurementPrinciple`
--

LOCK TABLES `MeasurementPrinciple` WRITE;
/*!40000 ALTER TABLE `MeasurementPrinciple` DISABLE KEYS */;
/*!40000 ALTER TABLE `MeasurementPrinciple` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Meta`
--

DROP TABLE IF EXISTS `Meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Meta` (
  `id` varchar(100) NOT NULL,
  `lastUpdated` varchar(255) DEFAULT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `security` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `versioId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Meta`
--

LOCK TABLES `Meta` WRITE;
/*!40000 ALTER TABLE `Meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `Meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Organization`
--

DROP TABLE IF EXISTS `Organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Organization` (
  `id` varchar(100) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `address` (`address`),
  CONSTRAINT `Organization_ibfk_1` FOREIGN KEY (`address`) REFERENCES `Address` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Organization`
--

LOCK TABLES `Organization` WRITE;
/*!40000 ALTER TABLE `Organization` DISABLE KEYS */;
/*!40000 ALTER TABLE `Organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductionSpecification`
--

DROP TABLE IF EXISTS `ProductionSpecification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductionSpecification` (
  `componentId` varchar(255) DEFAULT NULL,
  `id` varchar(100) NOT NULL,
  `productionSpec` varchar(255) DEFAULT NULL,
  `specType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductionSpecification`
--

LOCK TABLES `ProductionSpecification` WRITE;
/*!40000 ALTER TABLE `ProductionSpecification` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductionSpecification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Repeat`
--

DROP TABLE IF EXISTS `Repeat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Repeat` (
  `id` varchar(100) NOT NULL,
  `bounds` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `countMax` int(11) DEFAULT NULL,
  `duration` decimal(10,0) DEFAULT NULL,
  `durationMax` decimal(10,0) DEFAULT NULL,
  `durationUnit` varchar(255) DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  `frequencyMax` int(11) DEFAULT NULL,
  `offset` int(10) unsigned DEFAULT NULL,
  `period` decimal(10,0) DEFAULT NULL,
  `periodMax` decimal(10,0) DEFAULT NULL,
  `periodUnit` varchar(255) DEFAULT NULL,
  `when` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Repeat`
--

LOCK TABLES `Repeat` WRITE;
/*!40000 ALTER TABLE `Repeat` DISABLE KEYS */;
/*!40000 ALTER TABLE `Repeat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Resource`
--

DROP TABLE IF EXISTS `Resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Resource` (
  `id` varchar(100) NOT NULL,
  `implicitRules` varchar(255) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `meta` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `language` (`language`),
  KEY `meta` (`meta`),
  CONSTRAINT `Resource_ibfk_1` FOREIGN KEY (`language`) REFERENCES `Languages` (`Code`),
  CONSTRAINT `Resource_ibfk_2` FOREIGN KEY (`meta`) REFERENCES `Meta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Resource`
--

LOCK TABLES `Resource` WRITE;
/*!40000 ALTER TABLE `Resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `Resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SecurityLabels`
--

DROP TABLE IF EXISTS `SecurityLabels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SecurityLabels` (
  `Code` varchar(20) NOT NULL,
  `Display` varchar(50) DEFAULT NULL,
  `Definition` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SecurityLabels`
--

LOCK TABLES `SecurityLabels` WRITE;
/*!40000 ALTER TABLE `SecurityLabels` DISABLE KEYS */;
/*!40000 ALTER TABLE `SecurityLabels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Timing`
--

DROP TABLE IF EXISTS `Timing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Timing` (
  `id` varchar(100) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `event` datetime DEFAULT NULL,
  `repeat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `code` (`code`),
  KEY `repeat` (`repeat`),
  CONSTRAINT `Timing_ibfk_1` FOREIGN KEY (`code`) REFERENCES `TimingAbbreviation` (`Code`),
  CONSTRAINT `Timing_ibfk_2` FOREIGN KEY (`repeat`) REFERENCES `Repeat` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Timing`
--

LOCK TABLES `Timing` WRITE;
/*!40000 ALTER TABLE `Timing` DISABLE KEYS */;
/*!40000 ALTER TABLE `Timing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TimingAbbreviation`
--

DROP TABLE IF EXISTS `TimingAbbreviation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TimingAbbreviation` (
  `Code` varchar(20) NOT NULL,
  `Display` varchar(50) DEFAULT NULL,
  `Definition` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TimingAbbreviation`
--

LOCK TABLES `TimingAbbreviation` WRITE;
/*!40000 ALTER TABLE `TimingAbbreviation` DISABLE KEYS */;
/*!40000 ALTER TABLE `TimingAbbreviation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UnitsOfTime`
--

DROP TABLE IF EXISTS `UnitsOfTime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UnitsOfTime` (
  `Code` varchar(20) NOT NULL,
  `Display` varchar(50) DEFAULT NULL,
  `Definition` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UnitsOfTime`
--

LOCK TABLES `UnitsOfTime` WRITE;
/*!40000 ALTER TABLE `UnitsOfTime` DISABLE KEYS */;
/*!40000 ALTER TABLE `UnitsOfTime` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-11 16:45:02
