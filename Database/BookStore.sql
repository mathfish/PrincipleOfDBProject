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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHOR`
--

LOCK TABLES `AUTHOR` WRITE;
/*!40000 ALTER TABLE `AUTHOR` DISABLE KEYS */;
INSERT INTO `AUTHOR` VALUES (1,'Stephen ','Hawkings',NULL),(2,'Douglas','Adams',NULL),(3,'Eoin','Colfer',NULL),(4,'Dr','Seuss',NULL),(5,'John','Grisham',NULL),(6,'Stephen','King',NULL),(7,'J','Rowling','K');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BILL_ADDRESS`
--

LOCK TABLES `BILL_ADDRESS` WRITE;
/*!40000 ALTER TABLE `BILL_ADDRESS` DISABLE KEYS */;
INSERT INTO `BILL_ADDRESS` VALUES (1,1,' 111 Lone Pine','Laurel','MD',20777,NULL),(2,2,'123 Pine Rd','Baltimore','MD',27777,NULL),(3,3,'456 Oak St','Westminster','MD',33333,NULL),(4,4,'12334 Hickory','Ball','MD',12344,'5'),(5,5,'678 Pecan','Rockville','MD',77777,NULL);
/*!40000 ALTER TABLE `BILL_ADDRESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BOOK`
--

DROP TABLE IF EXISTS `BOOK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BOOK` (
  `ISBN` double NOT NULL,
  `Publisher_id` int(11) NOT NULL,
  `Title` varchar(45) DEFAULT NULL,
  `Edition` varchar(20) DEFAULT NULL,
  `Hardcover` tinyint(1) DEFAULT NULL,
  `Paperback` tinyint(1) DEFAULT NULL,
  `Weight_oz` float unsigned NOT NULL,
  `Publish_date` date NOT NULL,
  `Cost` decimal(10,2) NOT NULL,
  `Page_count` int(10) unsigned DEFAULT NULL,
  `Stock_count` int(11) NOT NULL,
  `Reorder` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ISBN`),
  KEY `fk_BOOK_PUBLISHER1_idx` (`Publisher_id`),
  CONSTRAINT `fk_BOOK_PUBLISHER1` FOREIGN KEY (`Publisher_id`) REFERENCES `PUBLISHER` (`Publisher_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BOOK`
--

LOCK TABLES `BOOK` WRITE;
/*!40000 ALTER TABLE `BOOK` DISABLE KEYS */;
INSERT INTO `BOOK` VALUES (9780345391803,2,'The Hitch Hiker\'s Guide to the Galaxy',NULL,0,1,11.6,'1995-09-27',15.00,224,1,0),(9780394800011,1,'The Cat in the Hat',NULL,1,0,9.1,'1957-03-12',7.00,61,3,0),(9780394800165,1,'Green Eggs and Ham','1',1,0,8.8,'1988-01-01',9.00,65,0,1),(9780439708180,8,'Harry Potter and the Sorcerer\'s Stone',NULL,0,1,7.2,'1998-09-01',5.00,309,2,0),(9780440245919,3,'A Time to Kill',NULL,0,1,12.6,'2009-06-23',5.00,672,1,0),(9780451169518,7,'IT',NULL,0,1,16,'1987-08-07',5.00,1104,3,0),(9780553380163,3,'A Brief History of Time',NULL,1,0,11.4,'1998-09-01',20.00,212,2,0);
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
  `ISBN` double NOT NULL,
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
INSERT INTO `BOOK_AUTHOR` VALUES (2,9780345391803),(3,9780345391803),(4,9780394800011),(4,9780394800165),(7,9780439708180),(5,9780440245919),(6,9780451169518),(1,9780553380163);
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
  `ISBN` double NOT NULL,
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
INSERT INTO `BOOK_GENRE` VALUES (1,9780345391803),(3,9780345391803),(6,9780345391803),(7,9780394800011),(14,9780394800011),(7,9780394800165),(14,9780394800165),(1,9780439708180),(7,9780439708180),(3,9780440245919),(5,9780451169518),(9,9780553380163),(11,9780553380163);
/*!40000 ALTER TABLE `BOOK_GENRE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BOOK_ORDER`
--

DROP TABLE IF EXISTS `BOOK_ORDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BOOK_ORDER` (
  `Order_id` int(11) NOT NULL,
  `ISBN` double NOT NULL,
  `Customer_id` int(11) NOT NULL,
  `Count` int(10) NOT NULL,
  `Sale` decimal(10,2) DEFAULT NULL,
  `Total_weight_oz` float DEFAULT NULL,
  PRIMARY KEY (`ISBN`,`Order_id`,`Customer_id`),
  KEY `fk_BOOK_INSTANCE_BOOK1_idx` (`ISBN`),
  KEY `fk_ORDER_BOOKORDER_idx` (`Order_id`,`Customer_id`),
  CONSTRAINT `fk_BOOK_INSTANCE_BOOK1` FOREIGN KEY (`ISBN`) REFERENCES `BOOK` (`ISBN`) ON UPDATE CASCADE,
  CONSTRAINT `fk_BOOK_ORDER_FORDER` FOREIGN KEY (`Order_id`, `Customer_id`) REFERENCES `FULL_ORDER` (`Order_id`, `Customer_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BOOK_ORDER`
--

LOCK TABLES `BOOK_ORDER` WRITE;
/*!40000 ALTER TABLE `BOOK_ORDER` DISABLE KEYS */;
INSERT INTO `BOOK_ORDER` VALUES (1,9780345391803,1,1,15.00,11.6),(2,9780394800165,3,2,18.00,17.6),(4,9780439708180,1,1,5.00,7.2),(1,9780440245919,1,1,5.00,12.6),(3,9780451169518,2,1,5.00,16);
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
  `Creation_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Email` varchar(45) DEFAULT NULL,
  `Primary_phone` bigint(10) DEFAULT NULL,
  `Password` varchar(10) NOT NULL,
  PRIMARY KEY (`Customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER`
--

LOCK TABLES `CUSTOMER` WRITE;
/*!40000 ALTER TABLE `CUSTOMER` DISABLE KEYS */;
INSERT INTO `CUSTOMER` VALUES (1,'Jim','Bob','Y','1970-03-15','2015-11-18 04:15:51',NULL,999555111,'swordfigh'),(2,'Mary','Mo','A','2000-12-01','2015-08-08 03:19:13','marymo@meme.com',NULL,'teddybears'),(3,'Cletus','Parker','S','1983-01-12','2015-01-22 23:32:49','clet@country.com',5554443333,'moonshine'),(4,'Kimi','Lee',NULL,'1990-08-27','2015-03-29 00:38:24','kimi@email.com',1112223333,'sushi'),(5,'Joe','Little','B','2007-06-12','2015-11-29 01:38:24','joey@dinosaur.com',NULL,'candy');
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
  `Card_number` bigint(16) unsigned NOT NULL,
  `First_name` varchar(45) NOT NULL,
  `Last_name` varchar(45) NOT NULL,
  `Middle_init` varchar(1) DEFAULT NULL,
  `Security_code` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Payment_id`),
  KEY `fk_CUSTOMER_PAYMENT_CUSTOMER1_idx` (`Customer_id`),
  CONSTRAINT `fk_CUSTOMER_PAYMENT_CUSTOMER1` FOREIGN KEY (`Customer_id`) REFERENCES `CUSTOMER` (`Customer_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER_PAYMENT`
--

LOCK TABLES `CUSTOMER_PAYMENT` WRITE;
/*!40000 ALTER TABLE `CUSTOMER_PAYMENT` DISABLE KEYS */;
INSERT INTO `CUSTOMER_PAYMENT` VALUES (1,1,'VISA','2017-12-02',1111222233334444,'Jim','Bob',NULL,333),(2,2,'MASTERCARD','2018-02-22',3333444455556666,'Mary','Mo','A',222),(3,3,'VISA','2016-01-03',1000200030004000,'Cletus','Parker','S',111),(4,4,'DISCOVER','2020-02-10',4444555566667777,'Kimi','Lee',NULL,666),(5,5,'MASTERCARD','2018-03-04',9999888877776666,'Joe','Little','B',123),(6,5,'VISA','2017-03-24',1234123412341234,'Joe','Little','B',456);
/*!40000 ALTER TABLE `CUSTOMER_PAYMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FULL_ORDER`
--

DROP TABLE IF EXISTS `FULL_ORDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FULL_ORDER` (
  `Order_id` int(11) NOT NULL,
  `History_id` int(11) NOT NULL,
  `Method_id` int(11) NOT NULL,
  `Ship_address_id` int(11) NOT NULL,
  `Customer_id` int(11) NOT NULL,
  `Order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Total_books` int(11) DEFAULT '0',
  `Book_cost` decimal(10,2) DEFAULT '0.00',
  `Total_weight` float DEFAULT '0',
  PRIMARY KEY (`Order_id`,`Customer_id`),
  KEY `fk_CUSTOMER_FULL_idx` (`Customer_id`),
  KEY `fk_HISTORY_FULL_idx` (`History_id`),
  KEY `fk_SHMETHOD_FULL_idx` (`Method_id`),
  KEY `fk_SHADDRESS_FULL_idx` (`Ship_address_id`),
  CONSTRAINT `fk_CUSTOMER_FULL` FOREIGN KEY (`Customer_id`) REFERENCES `CUSTOMER` (`Customer_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_HISTORY_FULL` FOREIGN KEY (`History_id`) REFERENCES `ORDER_HISTORY` (`History_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_SHADDRESS_FULL` FOREIGN KEY (`Ship_address_id`) REFERENCES `SHIP_ADDRESS` (`Ship_address_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_SHMETHOD_FULL` FOREIGN KEY (`Method_id`) REFERENCES `SHIPPING_METHOD` (`Method_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FULL_ORDER`
--

LOCK TABLES `FULL_ORDER` WRITE;
/*!40000 ALTER TABLE `FULL_ORDER` DISABLE KEYS */;
INSERT INTO `FULL_ORDER` VALUES (1,1,1,1,1,'2015-11-23 04:20:48',2,20.00,24.2),(2,3,2,4,3,'2015-01-24 01:48:06',2,18.00,17.6),(3,2,3,3,2,'2015-10-29 17:13:36',1,5.00,16),(4,1,1,1,1,'2015-11-29 22:43:57',1,5.00,7.2);
/*!40000 ALTER TABLE `FULL_ORDER` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='This is a reference entity that holds genres related to books. \n\nid = 1: Adventure\nid = 2: Romance\nid = 3: Mystery\nid = 4: Science Fiction\nid = 5: Horror\nid = 6: Humor\nid = 7: Children\nid = 8: Action\nid = 10: Science\nid = 11: Religious\nid = 12: Self-Improvement\nid = 13: History\nid = 14: Non-Fiction\nid = 15: Education';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GENRE`
--

LOCK TABLES `GENRE` WRITE;
/*!40000 ALTER TABLE `GENRE` DISABLE KEYS */;
INSERT INTO `GENRE` VALUES (1,'Adventure'),(2,'Romance'),(3,'Mystery'),(4,'Science Fiction'),(5,'Horror'),(6,'Humor'),(7,'Children'),(8,'Action'),(9,'Science'),(10,'Religious'),(11,'Self-Improvement'),(12,'History'),(13,'Non-fiction'),(14,'Education');
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
  `Payment_id` int(11) DEFAULT NULL,
  `Payment_received` tinyint(1) NOT NULL DEFAULT '0',
  `Ship_cost` decimal(10,2) DEFAULT NULL,
  `Tax_cost` decimal(10,2) DEFAULT NULL,
  `Total_cost` decimal(10,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`Invoice_id`),
  KEY `fk_Invoice_ORDER1_idx` (`Order_id`,`Customer_id`),
  KEY `fk_Invoice_CUSTOMER_PAYMENT1_idx` (`Payment_id`),
  CONSTRAINT `fk_FORDER_INVOICE` FOREIGN KEY (`Order_id`, `Customer_id`) REFERENCES `FULL_ORDER` (`Order_id`, `Customer_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Invoice_CUSTOMER_PAYMENT1` FOREIGN KEY (`Payment_id`) REFERENCES `CUSTOMER_PAYMENT` (`Payment_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INVOICE`
--

LOCK TABLES `INVOICE` WRITE;
/*!40000 ALTER TABLE `INVOICE` DISABLE KEYS */;
INSERT INTO `INVOICE` VALUES (5,1,1,1,1,8.47,1.20,29.67),(6,2,3,3,1,22.00,1.08,41.08),(7,3,2,2,1,12.00,0.30,17.30),(9,4,1,NULL,0,2.52,0.30,7.82);
/*!40000 ALTER TABLE `INVOICE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDER_HISTORY`
--

DROP TABLE IF EXISTS `ORDER_HISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORDER_HISTORY` (
  `History_id` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_id` int(11) NOT NULL,
  PRIMARY KEY (`History_id`,`Customer_id`),
  KEY `fk_ORDER_HISTORY_CUSTOMER1_idx` (`Customer_id`),
  CONSTRAINT `fk_ORDER_HISTORY_CUSTOMER1` FOREIGN KEY (`Customer_id`) REFERENCES `CUSTOMER` (`Customer_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDER_HISTORY`
--

LOCK TABLES `ORDER_HISTORY` WRITE;
/*!40000 ALTER TABLE `ORDER_HISTORY` DISABLE KEYS */;
INSERT INTO `ORDER_HISTORY` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
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
  `Order_id` int(11) NOT NULL,
  `Customer_id` int(11) NOT NULL,
  `Delivered` tinyint(1) DEFAULT '0',
  `Shipped` tinyint(1) DEFAULT '0',
  `Processed` tinyint(1) DEFAULT '0',
  `Delivered_date` date DEFAULT NULL,
  `Shipped_date` date DEFAULT NULL,
  `Processed_date` date DEFAULT NULL,
  PRIMARY KEY (`Status_id`,`Order_id`,`Customer_id`),
  KEY `fk_ORDER_STATUS_ORDER1_idx` (`Order_id`,`Customer_id`),
  CONSTRAINT `fk_ORDER_STATUS_FORDER` FOREIGN KEY (`Order_id`, `Customer_id`) REFERENCES `FULL_ORDER` (`Order_id`, `Customer_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDER_STATUS`
--

LOCK TABLES `ORDER_STATUS` WRITE;
/*!40000 ALTER TABLE `ORDER_STATUS` DISABLE KEYS */;
INSERT INTO `ORDER_STATUS` VALUES (1,1,1,1,1,1,'2015-11-30','2015-11-23','2015-11-22'),(2,2,3,1,1,1,'2015-01-25','2015-01-24','2015-01-23'),(3,3,2,1,1,1,'2015-11-05','2015-11-01','2015-10-30');
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
  `City` varchar(45) NOT NULL,
  `State` varchar(2) DEFAULT NULL,
  `Country` varchar(45) NOT NULL,
  PRIMARY KEY (`Publisher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PUBLISHER`
--

LOCK TABLES `PUBLISHER` WRITE;
/*!40000 ALTER TABLE `PUBLISHER` DISABLE KEYS */;
INSERT INTO `PUBLISHER` VALUES (1,'Random House','New York','NY','USA'),(2,'Del Rey','New York',NULL,'USA'),(3,'Bantam Dell','New York','NY','USA'),(4,'Wynwood Press','Miami','FL','USA'),(5,'Viking','New York','NY','USA'),(6,'Bloomsbury Publishing','London',NULL,'UK'),(7,'Signet','New York','NY','USA'),(8,'Scholastic','New York','NY','USA');
/*!40000 ALTER TABLE `PUBLISHER` ENABLE KEYS */;
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
  `Cost_per_oz` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Method_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='This is a reference entity for shipping methods:\nid = 1: Ground\nid = 2: Overnight\nid = 3: Priority';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHIPPING_METHOD`
--

LOCK TABLES `SHIPPING_METHOD` WRITE;
/*!40000 ALTER TABLE `SHIPPING_METHOD` DISABLE KEYS */;
INSERT INTO `SHIPPING_METHOD` VALUES (1,'Ground',0.35),(2,'Overnight',1.25),(3,'Priority',0.75);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHIP_ADDRESS`
--

LOCK TABLES `SHIP_ADDRESS` WRITE;
/*!40000 ALTER TABLE `SHIP_ADDRESS` DISABLE KEYS */;
INSERT INTO `SHIP_ADDRESS` VALUES (1,1,'111 Lone Pine','Laurel','MD',20777,NULL),(2,1,'303 Sage Brush','Baltimore','MD',20888,'3'),(3,2,'123 Pine Rd','Baltimore','MD',27777,NULL),(4,3,'456 Oak St','Westminster','MD',33333,NULL),(5,4,'12334 Hickory','Ball','MD',12344,'5'),(6,5,'678 Pecan','Rockville','MD',77777,NULL);
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

-- Dump completed on 2015-11-29 21:09:24
