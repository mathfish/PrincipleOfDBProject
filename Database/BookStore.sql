CREATE DATABASE  IF NOT EXISTS `ThompsonBookStoreDB` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ThompsonBookStoreDB`;
-- MySQL dump 10.13  Distrib 5.6.24, for osx10.8 (x86_64)
--
-- Host: 127.0.0.1    Database: ThompsonBookStoreDB
-- ------------------------------------------------------
-- Server version	5.6.26-log

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
-- Table structure for table `AUTHOR`
--

DROP TABLE IF EXISTS `AUTHOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHOR` (
  `Author_id` int(11) NOT NULL AUTO_INCREMENT,
  `First_name` varchar(45) NOT NULL,
  `Last_name` varchar(45) NOT NULL,
  `Middle_init` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`Author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHOR`
--

LOCK TABLES `AUTHOR` WRITE;
/*!40000 ALTER TABLE `AUTHOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `AUTHOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BILL_ADDRESS`
--

DROP TABLE IF EXISTS `BILL_ADDRESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BILL_ADDRESS` (
  `Bill_address_id` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_id` int(11) NOT NULL,
  `Street_address` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `State` varchar(2) NOT NULL,
  `Zip_code` int(5) unsigned NOT NULL,
  `Unit_number` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Bill_address_id`),
  KEY `fk_BILL_ADDRESS_CUSTOMER1_idx` (`Customer_id`),
  CONSTRAINT `fk_BILL_ADDRESS_CUSTOMER1` FOREIGN KEY (`Customer_id`) REFERENCES `CUSTOMER` (`Customer_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BILL_ADDRESS`
--

LOCK TABLES `BILL_ADDRESS` WRITE;
/*!40000 ALTER TABLE `BILL_ADDRESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `BILL_ADDRESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BOOK`
--

DROP TABLE IF EXISTS `BOOK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BOOK` (
  `ISBN` int(11) NOT NULL,
  `Publisher_id` int(11) NOT NULL,
  `ISSN` int(11) NOT NULL,
  `Book_Inventory_id` int(11) NOT NULL,
  `Title` varchar(45) DEFAULT NULL,
  `Edition` varchar(20) NOT NULL,
  `Hardcover` tinyint(1) DEFAULT NULL,
  `Paperback` tinyint(1) DEFAULT NULL,
  `Weight` float unsigned NOT NULL,
  `Publish_date` date NOT NULL,
  `Cost` float NOT NULL,
  `Page_count` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ISBN`),
  UNIQUE KEY `ISSN_UNIQUE` (`ISSN`),
  KEY `fk_BOOK_PUBLISHER1_idx` (`Publisher_id`),
  KEY `fk_BOOK_BOOK_INVENTORY1_idx` (`Book_Inventory_id`),
  CONSTRAINT `fk_BOOK_BOOK_INVENTORY1` FOREIGN KEY (`Book_Inventory_id`) REFERENCES `BOOK_INVENTORY` (`Book_Inventory_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_BOOK_PUBLISHER1` FOREIGN KEY (`Publisher_id`) REFERENCES `PUBLISHER` (`Publisher_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BOOK`
--

LOCK TABLES `BOOK` WRITE;
/*!40000 ALTER TABLE `BOOK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BOOK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BOOK_AUTHOR`
--

DROP TABLE IF EXISTS `BOOK_AUTHOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BOOK_AUTHOR` (
  `Author_id` int(11) NOT NULL,
  `ISBN` int(11) NOT NULL,
  PRIMARY KEY (`Author_id`,`ISBN`),
  KEY `fk_BOOK_AUTHOR_BOOK1_idx` (`ISBN`),
  CONSTRAINT `fk_BOOK_AUTHOR_AUTHOR1` FOREIGN KEY (`Author_id`) REFERENCES `AUTHOR` (`Author_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_BOOK_AUTHOR_BOOK1` FOREIGN KEY (`ISBN`) REFERENCES `BOOK` (`ISBN`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BOOK_AUTHOR`
--

LOCK TABLES `BOOK_AUTHOR` WRITE;
/*!40000 ALTER TABLE `BOOK_AUTHOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `BOOK_AUTHOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BOOK_GENRE`
--

DROP TABLE IF EXISTS `BOOK_GENRE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BOOK_GENRE` (
  `Genre_id` int(11) NOT NULL,
  `ISBN` int(11) NOT NULL,
  PRIMARY KEY (`Genre_id`,`ISBN`),
  KEY `fk_BOOK_GENRE_BOOK1_idx` (`ISBN`),
  CONSTRAINT `fk_BOOK_GENRE_BOOK1` FOREIGN KEY (`ISBN`) REFERENCES `BOOK` (`ISBN`) ON UPDATE CASCADE,
  CONSTRAINT `fk_BOOK_GENRE_GENRE1` FOREIGN KEY (`Genre_id`) REFERENCES `GENRE` (`Genre_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BOOK_GENRE`
--

LOCK TABLES `BOOK_GENRE` WRITE;
/*!40000 ALTER TABLE `BOOK_GENRE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BOOK_GENRE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BOOK_INVENTORY`
--

DROP TABLE IF EXISTS `BOOK_INVENTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BOOK_INVENTORY` (
  `Book_Inventory_id` int(11) NOT NULL AUTO_INCREMENT,
  `Stock_count` int(10) unsigned NOT NULL,
  `Reorder` tinyint(1) NOT NULL,
  PRIMARY KEY (`Book_Inventory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BOOK_INVENTORY`
--

LOCK TABLES `BOOK_INVENTORY` WRITE;
/*!40000 ALTER TABLE `BOOK_INVENTORY` DISABLE KEYS */;
/*!40000 ALTER TABLE `BOOK_INVENTORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BOOK_ORDER`
--

DROP TABLE IF EXISTS `BOOK_ORDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BOOK_ORDER` (
  `Order_id` int(11) NOT NULL,
  `ISBN` int(11) NOT NULL,
  `Count` int(10) unsigned NOT NULL,
  `Sale` float unsigned NOT NULL,
  PRIMARY KEY (`Order_id`,`ISBN`),
  KEY `fk_BOOK_INSTANCE_BOOK1_idx` (`ISBN`),
  KEY `fk_BOOK_INSTANCE_ORDER1_idx` (`Order_id`),
  CONSTRAINT `fk_BOOK_INSTANCE_BOOK1` FOREIGN KEY (`ISBN`) REFERENCES `BOOK` (`ISBN`) ON UPDATE CASCADE,
  CONSTRAINT `fk_BOOK_INSTANCE_ORDER1` FOREIGN KEY (`Order_id`) REFERENCES `ORDER` (`Order_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BOOK_ORDER`
--

LOCK TABLES `BOOK_ORDER` WRITE;
/*!40000 ALTER TABLE `BOOK_ORDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `BOOK_ORDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMER`
--

DROP TABLE IF EXISTS `CUSTOMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMER` (
  `Customer_id` int(11) NOT NULL,
  `First_name` varchar(45) DEFAULT NULL,
  `Last_name` varchar(45) DEFAULT NULL,
  `Middle_init` varchar(1) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Creation_date` date DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Primary_phone` int(10) DEFAULT NULL,
  `Password` varchar(10) NOT NULL,
  PRIMARY KEY (`Customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER`
--

LOCK TABLES `CUSTOMER` WRITE;
/*!40000 ALTER TABLE `CUSTOMER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CUSTOMER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMER_PAYMENT`
--

DROP TABLE IF EXISTS `CUSTOMER_PAYMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMER_PAYMENT` (
  `Payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_id` int(11) NOT NULL,
  `Credit_card_type` varchar(45) NOT NULL,
  `Expire_date` date NOT NULL,
  `Card_number` int(10) unsigned NOT NULL,
  `First_name` varchar(45) NOT NULL,
  `Last_name` varchar(45) NOT NULL,
  `Middle_init` varchar(1) DEFAULT NULL,
  `Security_code` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Payment_id`),
  KEY `fk_CUSTOMER_PAYMENT_CUSTOMER1_idx` (`Customer_id`),
  CONSTRAINT `fk_CUSTOMER_PAYMENT_CUSTOMER1` FOREIGN KEY (`Customer_id`) REFERENCES `CUSTOMER` (`Customer_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER_PAYMENT`
--

LOCK TABLES `CUSTOMER_PAYMENT` WRITE;
/*!40000 ALTER TABLE `CUSTOMER_PAYMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `CUSTOMER_PAYMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GENRE`
--

DROP TABLE IF EXISTS `GENRE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GENRE` (
  `Genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(75) NOT NULL,
  PRIMARY KEY (`Genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This is a reference entity that holds genres related to books. \n\nid = 1: Adventure\nid = 2: Romance\nid = 3: Mystery\nid = 4: Science Fiction\nid = 5: Horror\nid = 6: Humor\nid = 7: Children\nid = 8: Action\nid = 10: Science\nid = 11: Religious\nid = 12: Self-Improvement\nid = 13: History\nid = 14: Non-Fiction\nid = 15: Education';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GENRE`
--

LOCK TABLES `GENRE` WRITE;
/*!40000 ALTER TABLE `GENRE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GENRE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INVOICE`
--

DROP TABLE IF EXISTS `INVOICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INVOICE` (
  `Invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `Order_id` int(11) NOT NULL,
  `Customer_id` int(11) NOT NULL,
  `Payment_id` int(11) NOT NULL,
  `Shipping_id` int(11) NOT NULL,
  `Payment_received` tinyint(1) NOT NULL,
  `Total_cost` float unsigned NOT NULL,
  PRIMARY KEY (`Invoice_id`),
  KEY `fk_Invoice_ORDER1_idx` (`Order_id`,`Customer_id`),
  KEY `fk_Invoice_CUSTOMER_PAYMENT1_idx` (`Payment_id`),
  KEY `fk_Invoice_SHIPPING_INFO1_idx` (`Shipping_id`),
  CONSTRAINT `fk_Invoice_CUSTOMER_PAYMENT1` FOREIGN KEY (`Payment_id`) REFERENCES `CUSTOMER_PAYMENT` (`Payment_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Invoice_ORDER1` FOREIGN KEY (`Order_id`, `Customer_id`) REFERENCES `ORDER` (`Order_id`, `Customer_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Invoice_SHIPPING_INFO1` FOREIGN KEY (`Shipping_id`) REFERENCES `SHIPPING_INFO` (`Shipping_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INVOICE`
--

LOCK TABLES `INVOICE` WRITE;
/*!40000 ALTER TABLE `INVOICE` DISABLE KEYS */;
/*!40000 ALTER TABLE `INVOICE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDER`
--

DROP TABLE IF EXISTS `ORDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORDER` (
  `Order_id` int(11) NOT NULL AUTO_INCREMENT,
  `History_id` int(11) NOT NULL,
  `Method_id` int(11) NOT NULL,
  `Ship_address_id` int(11) NOT NULL,
  `Customer_id` int(11) NOT NULL,
  `Order_date` datetime NOT NULL,
  `Tax_cost` float unsigned NOT NULL,
  `Book_cost` float unsigned NOT NULL,
  PRIMARY KEY (`Order_id`,`Customer_id`),
  KEY `fk_ORDER_ORDER_HISTORY1_idx` (`History_id`),
  KEY `fk_ORDER_CUSTOMER1_idx` (`Customer_id`),
  KEY `fk_ORDER_SHIP_ADDRESS1_idx` (`Ship_address_id`),
  KEY `fk_ORDER_SHIPPING_METHOD1_idx` (`Method_id`),
  CONSTRAINT `fk_ORDER_CUSTOMER1` FOREIGN KEY (`Customer_id`) REFERENCES `CUSTOMER` (`Customer_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ORDER_ORDER_HISTORY1` FOREIGN KEY (`History_id`) REFERENCES `ORDER_HISTORY` (`History_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ORDER_SHIPPING_METHOD1` FOREIGN KEY (`Method_id`) REFERENCES `SHIPPING_METHOD` (`Method_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ORDER_SHIP_ADDRESS1` FOREIGN KEY (`Ship_address_id`) REFERENCES `SHIP_ADDRESS` (`Ship_address_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDER`
--

LOCK TABLES `ORDER` WRITE;
/*!40000 ALTER TABLE `ORDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `ORDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDER_HISTORY`
--

DROP TABLE IF EXISTS `ORDER_HISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORDER_HISTORY` (
  `History_id` int(11) NOT NULL,
  `Customer_id` int(11) NOT NULL,
  PRIMARY KEY (`History_id`,`Customer_id`),
  KEY `fk_ORDER_HISTORY_CUSTOMER1_idx` (`Customer_id`),
  CONSTRAINT `fk_ORDER_HISTORY_CUSTOMER1` FOREIGN KEY (`Customer_id`) REFERENCES `CUSTOMER` (`Customer_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDER_HISTORY`
--

LOCK TABLES `ORDER_HISTORY` WRITE;
/*!40000 ALTER TABLE `ORDER_HISTORY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ORDER_HISTORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDER_STATUS`
--

DROP TABLE IF EXISTS `ORDER_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORDER_STATUS` (
  `Status_id` int(11) NOT NULL AUTO_INCREMENT,
  `Shipping_id` int(11) NOT NULL,
  `Delivered` tinyint(1) DEFAULT NULL,
  `Shipped` tinyint(1) DEFAULT NULL,
  `Processed` tinyint(1) DEFAULT NULL,
  `Order_id` int(11) NOT NULL,
  `Customer_id` int(11) NOT NULL,
  PRIMARY KEY (`Status_id`,`Order_id`,`Customer_id`),
  KEY `fk_ORDER_STATUS_SHIPPING1_idx` (`Shipping_id`),
  KEY `fk_ORDER_STATUS_ORDER1_idx` (`Order_id`,`Customer_id`),
  CONSTRAINT `fk_ORDER_STATUS_ORDER1` FOREIGN KEY (`Order_id`, `Customer_id`) REFERENCES `ORDER` (`Order_id`, `Customer_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ORDER_STATUS_SHIPPING1` FOREIGN KEY (`Shipping_id`) REFERENCES `SHIPPING_INFO` (`Shipping_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDER_STATUS`
--

LOCK TABLES `ORDER_STATUS` WRITE;
/*!40000 ALTER TABLE `ORDER_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `ORDER_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PUBLISHER`
--

DROP TABLE IF EXISTS `PUBLISHER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PUBLISHER` (
  `Publisher_id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Street_address` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `State` varchar(2) NOT NULL,
  `Zip` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Publisher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PUBLISHER`
--

LOCK TABLES `PUBLISHER` WRITE;
/*!40000 ALTER TABLE `PUBLISHER` DISABLE KEYS */;
/*!40000 ALTER TABLE `PUBLISHER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHIPPING_INFO`
--

DROP TABLE IF EXISTS `SHIPPING_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHIPPING_INFO` (
  `Shipping_id` int(11) NOT NULL AUTO_INCREMENT,
  `Order_id` int(11) NOT NULL,
  `Customer_id` int(11) NOT NULL,
  `Delivered_date` date DEFAULT NULL,
  `Shipped_date` date DEFAULT NULL,
  `Ship_cost` float unsigned NOT NULL,
  PRIMARY KEY (`Shipping_id`),
  KEY `fk_SHIPPING_INFO_ORDER1_idx` (`Order_id`),
  CONSTRAINT `fk_SHIPPING_INFO_ORDER1` FOREIGN KEY (`Order_id`) REFERENCES `ORDER` (`Order_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHIPPING_INFO`
--

LOCK TABLES `SHIPPING_INFO` WRITE;
/*!40000 ALTER TABLE `SHIPPING_INFO` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHIPPING_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHIPPING_METHOD`
--

DROP TABLE IF EXISTS `SHIPPING_METHOD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHIPPING_METHOD` (
  `Method_id` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(75) NOT NULL,
  PRIMARY KEY (`Method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This is a reference entity for shipping methods:\nid = 1: Ground\nid = 2: Overnight\nid = 3: Priority';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHIPPING_METHOD`
--

LOCK TABLES `SHIPPING_METHOD` WRITE;
/*!40000 ALTER TABLE `SHIPPING_METHOD` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHIPPING_METHOD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHIP_ADDRESS`
--

DROP TABLE IF EXISTS `SHIP_ADDRESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHIP_ADDRESS` (
  `Ship_address_id` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_id` int(11) NOT NULL,
  `Street_address` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `State` varchar(2) NOT NULL,
  `Zip` int(5) unsigned NOT NULL,
  `Unit_number` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Ship_address_id`),
  KEY `fk_SHIP_ADDRESS_CUSTOMER1_idx` (`Customer_id`),
  CONSTRAINT `fk_SHIP_ADDRESS_CUSTOMER1` FOREIGN KEY (`Customer_id`) REFERENCES `CUSTOMER` (`Customer_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHIP_ADDRESS`
--

LOCK TABLES `SHIP_ADDRESS` WRITE;
/*!40000 ALTER TABLE `SHIP_ADDRESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHIP_ADDRESS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-17 19:44:35
