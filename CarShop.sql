-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: ix.cs.uoregon.edu    Database: CarShop
-- ------------------------------------------------------
-- Server version	5.7.27-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Car`
--

DROP TABLE IF EXISTS `Car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Car` (
  `Vin` varchar(45) NOT NULL,
  `licence_plate` varchar(6) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `manufacturer` varchar(45) DEFAULT NULL,
  `Customer_cid` int(11) NOT NULL,
  PRIMARY KEY (`Vin`,`Customer_cid`),
  KEY `fk_Car_Customer1_idx` (`Customer_cid`),
  CONSTRAINT `fk_Car_Customer1` FOREIGN KEY (`Customer_cid`) REFERENCES `Customer` (`cid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Car`
--

LOCK TABLES `Car` WRITE;
/*!40000 ALTER TABLE `Car` DISABLE KEYS */;
INSERT INTO `Car` VALUES ('1B7HF13ZX1J572139','EXA516',2001,'Ram','Dodge',12),('1B7KF26Z5VJ597480','NOJEDI',1997,'Ram','Dodge',4),('1C4RJFBG5DC522189','HTN967',2013,'Cherokee','Jeep',16),('1FMZK04185GA30815','3STK32',2005,'Freestyle','Ford',1),('1GNEK13T7YJ204464','HCXA2',2000,'Tahoe','Chevrolet',18),('1HGEM21292L047875','829HST',2002,'Civic','Honda',7),('2T3DK4DV8CW082696','940YPC',2012,'Rav4','Toyota',11),('4T1BE30K12U058669','8DLM02',2002,'Camry','Toyota',13),('5FNRL38209B014050','4MC243',2009,'Odyssey','Honda',14),('5XYKTCA69DG347850','MS2G1P',2013,'Sorento','Kia',3),('JH4DA9440LS003097','4F99Y0',1990,'Integra','Acura',11),('JH4KA3250HC004235','FYV619',1987,'Legend','Acura',2),('JH4NA1260MT001906','SC1849',1991,'NSX','Acura',8),('JM1FE173540138012','BDP644',2004,'RX8','Mazda',6),('JN1CA21DXXT805880','GL90HJ',1999,'Maxima','Nissan',10),('JN8AZ2NE5C9016953','7WZL19',2012,'QX56','Infiniti',10),('WBAVB13506PT22180','8JRM31',2006,'3','BMW',9),('WDDDJ72X97A116339','8FXY15',2007,'CLS','Mercedes',17),('YS3AL76L1R7002116','HRE835',1994,'900','Saab',5),('YV1MS382262161511','SC1903',2006,'S40','Volvo',15);
/*!40000 ALTER TABLE `Car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contract`
--

DROP TABLE IF EXISTS `Contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contract` (
  `cnumber` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `est_hrs` decimal(10,0) DEFAULT NULL,
  `completed_on` date DEFAULT NULL,
  `Vin` varchar(45) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`cnumber`),
  KEY `fk_Contract_Car1_idx` (`Vin`,`cid`),
  CONSTRAINT `fk_Contract_Car1` FOREIGN KEY (`Vin`, `cid`) REFERENCES `Car` (`Vin`, `Customer_cid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contract`
--

LOCK TABLES `Contract` WRITE;
/*!40000 ALTER TABLE `Contract` DISABLE KEYS */;
INSERT INTO `Contract` VALUES (1,200,1,'2021-11-12','1B7HF13ZX1J572139',12),(2,689,3,'2021-05-15','1B7KF26Z5VJ597480',4),(3,422,4,'2020-01-06','1C4RJFBG5DC522189',16),(4,1200,8,'2021-07-02','1FMZK04185GA30815',1),(5,2500,12,'2021-12-12','1GNEK13T7YJ204464',18),(6,190,1,'2021-04-09','1HGEM21292L047875',7),(7,560,3,'2021-03-11','2T3DK4DV8CW082696',11),(8,272,3,'2021-05-08','4T1BE30K12U058669',13),(9,337,3,'2021-02-12','5FNRL38209B014050',14),(10,4568,6,'2021-07-19','5XYKTCA69DG347850',3),(11,216,2,'2021-05-01','JH4DA9440LS003097',11),(12,3857,9,'2021-06-27','JH4KA3250HC004235',2),(13,648,4,'2021-08-13','JH4NA1260MT001906',8),(14,784,5,'2021-04-16','JM1FE173540138012',6),(15,396,3,'2021-02-21','JN1CA21DXXT805880',10),(16,890,4,'2021-12-12','JN8AZ2NE5C9016953',10),(17,560,5,'2021-07-19','WBAVB13506PT22180',9),(18,1100,6,'2021-01-29','WDDDJ72X97A116339',17),(19,1900,3,NULL,'YS3AL76L1R7002116',5),(20,785,2,NULL,'YV1MS382262161511',15);
/*!40000 ALTER TABLE `Contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `cid` int(11) NOT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `fname` varchar(45) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,'555-438-4772','Ivana','Ballard','580 Ac Avenue','ivanab@yahoo.com'),(2,'555-534-3926','Karyn','Ramirez','192 Distal rd.','hendrerit@protonmail.com'),(3,'555-548-5931','Hu','Cross','7570 Nec rd.','crosshu@icloud.com'),(4,'555-414-6123','Colton','Sampson','4938 Nisi street','dolors@yahoo.com'),(5,'555-798-6252','Charlotte','Dominguez','295 Collins street','dominguez@gmail.com'),(6,'555-222-2408','Silas','Hall','435 Eliott ave','silashall@gmail.com'),(7,'555-777-1969','Uta ','Clay','1683 Curabit street','utauta@yahoo.com'),(8,'555-442-8556','Julie ','Hahn','156 Arcus street','hahnjulie@protonmail.com'),(9,'555-921-8763','Kenneth','Torres','43 Music street','torrezk@gmail.com'),(10,'555-260-3967','Brody','O\'Neill','509 Magra rd.','brodyo@yahoo.com'),(11,'555-985-1438','Pandora','Munoz','6633 Donec street','pandorasbox@gmail.com'),(12,'555-424-2154','Devin','Black','5223 Augue st.','devinblack@gmail.com'),(13,'555-878-9702','Mohammad','Medina','3920 Nisi street','medinatime@yahoo.com'),(14,'555-939-2775','Rogan ','Woodart','1157 Nulla Avenue','woodartr@gmail.com'),(15,'555-135-4359','Connor','Frank','8401 Risus Avenue','befrank@gmail.com'),(16,'555-461-3016','Carol','Reese','6979 Turpis street','reesespieces@gmail.com'),(17,'555-764-8450','Frances','Mcfarland','899 Lorem Avenue','mcfarlandlives@yahoo.com'),(18,'555-530-8304','Dominic','Olson','9641 Momentum street','donolson@gmail.com');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `eid` int(11) NOT NULL,
  `ssn` varchar(11) NOT NULL,
  `fname` varchar(45) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `Shop_Address` varchar(45) NOT NULL,
  PRIMARY KEY (`eid`,`ssn`,`Shop_Address`),
  KEY `fk_Employee_Shop1_idx` (`Shop_Address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1,'577-70-0916','Clark','Melanie','100 Rockstar ave'),(2,'536-35-2069','Moore','Lucas','100 Rockstar ave'),(3,'529-26-1445','Murray','Brad','100 Rockstar ave'),(4,'234-36-4676','Kelley','Amy','100 Rockstar ave'),(5,'222-26-1775','Scott','Gianna','100 Rockstar ave'),(6,'680-92-0774','Myers','Eric','100 Rockstar ave'),(7,'250-06-0596','Richards','Abraham','100 Rockstar ave'),(8,'520-04-1630','Smith','Aida','100 Rockstar ave'),(9,'542-20-0740','Baker','Jared','200 Anglewood st'),(10,'251-17-8973','Brooks','Elise','200 Anglewood st'),(11,'169-01-2954','Hawkins','Sam','200 Anglewood st'),(12,'576-62-4439','Miller','John','200 Anglewood st'),(13,'530-38-5892','Stevens','Victor','200 Anglewood st'),(14,'472-04-3008','Payne','Fred','200 Anglewood st'),(15,'223-76-5085','Johnson','Oscar','200 Anglewood st'),(16,'549-07-9947','Sullivan','Henry','200 Anglewood st'),(17,'501-21-5390','Armstrong','Jenna','200 Anglewood st'),(18,'232-52-2321','Morris','Harold','200 Anglewood st'),(19,'222-96-3853','Tucker','Kimberly','200 Anglewood st'),(20,'648-38-3050','Walker','Edgar','200 Anglewood st');
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mechanic`
--

DROP TABLE IF EXISTS `Mechanic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mechanic` (
  `Toolbox` int(11) DEFAULT NULL,
  `eid` int(11) NOT NULL,
  `ssn` varchar(11) NOT NULL,
  PRIMARY KEY (`eid`,`ssn`),
  KEY `fk_Mechanic_Employee1_idx` (`eid`,`ssn`),
  CONSTRAINT `fk_Mechanic_Employee1` FOREIGN KEY (`eid`, `ssn`) REFERENCES `Employee` (`eid`, `ssn`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mechanic`
--

LOCK TABLES `Mechanic` WRITE;
/*!40000 ALTER TABLE `Mechanic` DISABLE KEYS */;
INSERT INTO `Mechanic` VALUES (1,1,'577-70-0916'),(2,2,'536-35-2069'),(3,4,'234-36-4676'),(4,5,'222-26-1775'),(5,7,'250-06-0596'),(6,8,'520-04-1630'),(7,10,'251-17-8973'),(8,11,'169-01-2954'),(9,13,'530-38-5892'),(10,14,'472-04-3008'),(11,16,'549-07-9947'),(12,17,'501-21-5390'),(13,19,'222-96-3853'),(14,20,'648-38-3050');
/*!40000 ALTER TABLE `Mechanic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shop`
--

DROP TABLE IF EXISTS `Shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Shop` (
  `Address` varchar(45) NOT NULL,
  `Phone` varchar(12) DEFAULT NULL,
  `Bays` int(11) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shop`
--

LOCK TABLES `Shop` WRITE;
/*!40000 ALTER TABLE `Shop` DISABLE KEYS */;
INSERT INTO `Shop` VALUES ('100 Rockstar ave','555-897-3451',5,'Goofys'),('200 Anglewood st','555-346-6452',8,'Fudds');
/*!40000 ALTER TABLE `Shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Staff` (
  `client_list` int(11) DEFAULT NULL,
  `eid` int(11) NOT NULL,
  `ssn` varchar(11) NOT NULL,
  PRIMARY KEY (`eid`,`ssn`),
  KEY `fk_Staff_Employee1_idx` (`eid`,`ssn`),
  CONSTRAINT `fk_Staff_Employee1` FOREIGN KEY (`eid`, `ssn`) REFERENCES `Employee` (`eid`, `ssn`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
INSERT INTO `Staff` VALUES (1,3,'529-26-1445'),(2,6,'680-92-0774'),(3,9,'542-20-0740'),(4,12,'576-62-4439'),(5,15,'223-76-5085'),(6,18,'232-52-2321');
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Work_done`
--

DROP TABLE IF EXISTS `Work_done`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Work_done` (
  `description` varchar(45) DEFAULT NULL,
  `Contract_cnumber` int(11) DEFAULT NULL,
  `did` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`did`),
  KEY `fk_Work Done_Contract1` (`Contract_cnumber`),
  CONSTRAINT `fk_Work Done_Contract1` FOREIGN KEY (`Contract_cnumber`) REFERENCES `Contract` (`cnumber`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Work_done`
--

LOCK TABLES `Work_done` WRITE;
/*!40000 ALTER TABLE `Work_done` DISABLE KEYS */;
INSERT INTO `Work_done` VALUES ('Regular maintenance',1,1),('Brakes replaced',2,2),('Timing belt',3,3),('Water pump',4,4),('Engine rebuild',5,5),('Oil change',6,6),('Shocks replaced',7,7),('Regular maintenance',8,8),('Blake pads',9,9),('Timing chain',10,10),('Oil and coolant change',11,11),('Supercharger rebuild',12,12),('Suspension',13,13),('Cylinder gasket',14,14),('Suspension work',15,15),('Turbo replaced',16,16),('Fuel pump',17,17),('ECU replaced',18,18),('Engine swap',19,19),('Radiator replaced',20,20),('Suspension ',1,21),('Fluids replaced',5,22),('Intercooler install',12,23),('ECU tune',16,24),('Adjustments',19,25);
/*!40000 ALTER TABLE `Work_done` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Worked_on`
--

DROP TABLE IF EXISTS `Worked_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Worked_on` (
  `cnumber` int(11) DEFAULT NULL,
  `eid` int(11) DEFAULT NULL,
  `ssn` varchar(11) DEFAULT NULL,
  `wid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`wid`),
  KEY `ssn_idx` (`ssn`),
  KEY `cnumber_idx` (`cnumber`),
  KEY `ssn_idx1` (`eid`),
  KEY `eid_idx` (`eid`,`ssn`),
  CONSTRAINT `cnumber` FOREIGN KEY (`cnumber`) REFERENCES `Contract` (`cnumber`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mechanic` FOREIGN KEY (`eid`, `ssn`) REFERENCES `Mechanic` (`eid`, `ssn`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Worked_on`
--

LOCK TABLES `Worked_on` WRITE;
/*!40000 ALTER TABLE `Worked_on` DISABLE KEYS */;
INSERT INTO `Worked_on` VALUES (1,1,'577-70-0916',1),(2,2,'536-35-2069',2),(3,4,'234-36-4676',3),(4,5,'222-26-1775',4),(5,7,'250-06-0596',5),(6,8,'520-04-1630',6),(7,10,'251-17-8973',7),(8,11,'169-01-2954',8),(9,13,'530-38-5892',9),(10,14,'472-04-3008',10),(11,16,'549-07-9947',11),(12,17,'501-21-5390',12),(13,19,'222-96-3853',13),(14,20,'648-38-3050',14),(15,13,'530-38-5892',15),(16,14,'472-04-3008',16),(17,16,'549-07-9947',17),(18,17,'501-21-5390',18),(19,19,'222-96-3853',19),(20,20,'648-38-3050',20),(2,7,'250-06-0596',21),(4,10,'251-17-8973',22),(5,8,'520-04-1630',23),(5,10,'251-17-8973',24),(10,20,'648-38-3050',25),(14,14,'472-04-3008',26),(17,13,'530-38-5892',27),(19,20,'648-38-3050',28),(19,17,'501-21-5390',29);
/*!40000 ALTER TABLE `Worked_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Works_with`
--

DROP TABLE IF EXISTS `Works_with`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Works_with` (
  `cid` int(11) DEFAULT NULL,
  `eid` int(11) DEFAULT NULL,
  `ssn` varchar(11) DEFAULT NULL,
  `rid` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`rid`),
  KEY `fk_Works_with_Staff1_idx` (`eid`,`ssn`),
  KEY `customer_idx` (`cid`),
  CONSTRAINT `customer` FOREIGN KEY (`cid`) REFERENCES `Customer` (`cid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `staff` FOREIGN KEY (`eid`, `ssn`) REFERENCES `Staff` (`eid`, `ssn`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Works_with`
--

LOCK TABLES `Works_with` WRITE;
/*!40000 ALTER TABLE `Works_with` DISABLE KEYS */;
INSERT INTO `Works_with` VALUES (1,3,'529-26-1445',1),(2,6,'680-92-0774',2),(3,9,'542-20-0740',3),(4,12,'576-62-4439',4),(5,15,'223-76-5085',5),(6,18,'232-52-2321',6),(7,12,'576-62-4439',7),(8,6,'680-92-0774',8),(9,15,'223-76-5085',9),(10,3,'529-26-1445',10),(11,9,'542-20-0740',11),(12,6,'680-92-0774',12),(13,18,'232-52-2321',13),(14,6,'680-92-0774',14),(15,15,'223-76-5085',15),(16,3,'529-26-1445',16),(17,12,'576-62-4439',17),(18,9,'542-20-0740',18),(3,12,'576-62-4439',32),(7,3,'529-26-1445',33),(9,3,'529-26-1445',34),(11,18,'232-52-2321',35),(18,12,'576-62-4439',36);
/*!40000 ALTER TABLE `Works_with` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-07 12:07:14
