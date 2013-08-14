CREATE DATABASE  IF NOT EXISTS `starline` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `starline`;
-- MySQL dump 10.13  Distrib 5.5.32, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: starline
-- ------------------------------------------------------
-- Server version	5.5.32-0ubuntu0.12.04.1

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
-- Table structure for table `administrativesupply`
--

DROP TABLE IF EXISTS `administrativesupply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrativesupply` (
  `AdminSupplylID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Description` varchar(120) NOT NULL,
  `LastOrdered` date NOT NULL,
  `StockLow` tinyint(1) NOT NULL DEFAULT '0',
  `Cost` double unsigned NOT NULL,
  `AmountLeft` double unsigned NOT NULL,
  `Maximum Capacity` double unsigned NOT NULL,
  `NonMedicalSupplyID` int(10) unsigned NOT NULL,
  `SupplyTypeID` int(10) unsigned NOT NULL,
  `UnitID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`AdminSupplylID`,`NonMedicalSupplyID`,`SupplyTypeID`,`UnitID`),
  KEY `fk_AdministrativeSupply_NonMedicalSupplies1_idx` (`NonMedicalSupplyID`,`SupplyTypeID`),
  KEY `fk_AdministrativeSupply_Unit1_idx` (`UnitID`),
  CONSTRAINT `fk_AdministrativeSupply_NonMedicalSupplies1` FOREIGN KEY (`NonMedicalSupplyID`, `SupplyTypeID`) REFERENCES `nonmedicalsupplies` (`NonMedicalSupplyID`, `SupplyTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_AdministrativeSupply_Unit1` FOREIGN KEY (`UnitID`) REFERENCES `unit` (`UnitID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrativesupply`
--

LOCK TABLES `administrativesupply` WRITE;
/*!40000 ALTER TABLE `administrativesupply` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrativesupply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrativesupply_has_vendor`
--

DROP TABLE IF EXISTS `administrativesupply_has_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrativesupply_has_vendor` (
  `AdminSupplylID` int(10) unsigned NOT NULL,
  `NonMedicalSupplyID` int(10) unsigned NOT NULL,
  `SupplyTypeID` int(10) unsigned NOT NULL,
  `VendorID` int(11) NOT NULL,
  PRIMARY KEY (`AdminSupplylID`,`NonMedicalSupplyID`,`SupplyTypeID`,`VendorID`),
  KEY `fk_AdministrativeSupply_has_Vendor_Vendor1_idx` (`VendorID`),
  KEY `fk_AdministrativeSupply_has_Vendor_AdministrativeSupply1_idx` (`AdminSupplylID`,`NonMedicalSupplyID`,`SupplyTypeID`),
  CONSTRAINT `fk_AdministrativeSupply_has_Vendor_AdministrativeSupply1` FOREIGN KEY (`AdminSupplylID`, `NonMedicalSupplyID`, `SupplyTypeID`) REFERENCES `administrativesupply` (`AdminSupplylID`, `NonMedicalSupplyID`, `SupplyTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_AdministrativeSupply_has_Vendor_Vendor1` FOREIGN KEY (`VendorID`) REFERENCES `vendor` (`VendorID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrativesupply_has_vendor`
--

LOCK TABLES `administrativesupply_has_vendor` WRITE;
/*!40000 ALTER TABLE `administrativesupply_has_vendor` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrativesupply_has_vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment` (
  `AppointmentID` int(11) NOT NULL,
  `Notes` text,
  `StartTime` datetime NOT NULL,
  `EndTime` datetime NOT NULL,
  `EmployeeListID` int(11) NOT NULL,
  `PatientListID` int(11) DEFAULT NULL,
  `ServiceID` int(11) DEFAULT NULL,
  `RoomID` int(11) DEFAULT NULL,
  `UnitID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`AppointmentID`),
  KEY `EmployeeListId_idx` (`EmployeeListID`),
  KEY `PatientID_idx` (`PatientListID`),
  KEY `ServiceID_idx` (`ServiceID`),
  KEY `RoomID_idx` (`RoomID`),
  KEY `UnitID_idx` (`UnitID`),
  CONSTRAINT `PatientList_ID` FOREIGN KEY (`PatientListID`) REFERENCES `patient_list` (`PatientListID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `EmployeeListId` FOREIGN KEY (`EmployeeListID`) REFERENCES `employee_list` (`EmployeeListID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `RoomID` FOREIGN KEY (`RoomID`) REFERENCES `room` (`RoomID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ServiceID` FOREIGN KEY (`ServiceID`) REFERENCES `service` (`ServiceID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `UnitID` FOREIGN KEY (`UnitID`) REFERENCES `unit` (`UnitID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendingphysician`
--

DROP TABLE IF EXISTS `attendingphysician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendingphysician` (
  `JuniorDoctorID` int(10) unsigned NOT NULL,
  `AttendingID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`JuniorDoctorID`,`AttendingID`),
  KEY `fk_Employee_has_Employee_Employee2_idx` (`AttendingID`),
  KEY `fk_Employee_has_Employee_Employee1_idx` (`JuniorDoctorID`),
  CONSTRAINT `fk_Employee_has_Employee_Employee1` FOREIGN KEY (`JuniorDoctorID`) REFERENCES `employee` (`EmployeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employee_has_Employee_Employee2` FOREIGN KEY (`AttendingID`) REFERENCES `employee` (`EmployeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendingphysician`
--

LOCK TABLES `attendingphysician` WRITE;
/*!40000 ALTER TABLE `attendingphysician` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendingphysician` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basicpatientsupply`
--

DROP TABLE IF EXISTS `basicpatientsupply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basicpatientsupply` (
  `BasicPatientSupplyID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Description` varchar(120) NOT NULL,
  `LastOrdered` date NOT NULL,
  `StockLow` tinyint(1) NOT NULL DEFAULT '0',
  `Cost` double unsigned NOT NULL,
  `AmountLeft` double unsigned NOT NULL,
  `Maximum Capacity` double unsigned NOT NULL,
  `NonMedicalSupplyID` int(10) unsigned NOT NULL,
  `SupplyTypeID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`BasicPatientSupplyID`,`NonMedicalSupplyID`,`SupplyTypeID`),
  KEY `fk_BasicPatientSupply_NonMedicalSupplies1_idx` (`NonMedicalSupplyID`,`SupplyTypeID`),
  CONSTRAINT `fk_BasicPatientSupply_NonMedicalSupplies1` FOREIGN KEY (`NonMedicalSupplyID`, `SupplyTypeID`) REFERENCES `nonmedicalsupplies` (`NonMedicalSupplyID`, `SupplyTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basicpatientsupply`
--

LOCK TABLES `basicpatientsupply` WRITE;
/*!40000 ALTER TABLE `basicpatientsupply` DISABLE KEYS */;
/*!40000 ALTER TABLE `basicpatientsupply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basicpatientsupply_has_vendor`
--

DROP TABLE IF EXISTS `basicpatientsupply_has_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basicpatientsupply_has_vendor` (
  `BasicPatientSupplyID` int(10) unsigned NOT NULL,
  `NonMedicalSupplyID` int(10) unsigned NOT NULL,
  `SupplyTypeID` int(10) unsigned NOT NULL,
  `VendorID` int(11) NOT NULL,
  PRIMARY KEY (`BasicPatientSupplyID`,`NonMedicalSupplyID`,`SupplyTypeID`,`VendorID`),
  KEY `fk_BasicPatientSupply_has_Vendor_Vendor1_idx` (`VendorID`),
  KEY `fk_BasicPatientSupply_has_Vendor_BasicPatientSupply1_idx` (`BasicPatientSupplyID`,`NonMedicalSupplyID`,`SupplyTypeID`),
  CONSTRAINT `fk_BasicPatientSupply_has_Vendor_BasicPatientSupply1` FOREIGN KEY (`BasicPatientSupplyID`, `NonMedicalSupplyID`, `SupplyTypeID`) REFERENCES `basicpatientsupply` (`BasicPatientSupplyID`, `NonMedicalSupplyID`, `SupplyTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_BasicPatientSupply_has_Vendor_Vendor1` FOREIGN KEY (`VendorID`) REFERENCES `vendor` (`VendorID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basicpatientsupply_has_vendor`
--

LOCK TABLES `basicpatientsupply_has_vendor` WRITE;
/*!40000 ALTER TABLE `basicpatientsupply_has_vendor` DISABLE KEYS */;
/*!40000 ALTER TABLE `basicpatientsupply_has_vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `EmployeeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Address` varchar(120) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `PostalCode` varchar(45) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `UnitID` int(10) unsigned NOT NULL,
  `JobID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE KEY `EmployeeID_UNIQUE` (`EmployeeID`),
  KEY `fk_Employee_Unit_idx` (`UnitID`),
  KEY `fk_Employee_JobPayroll1_idx` (`JobID`),
  CONSTRAINT `fk_Employee_JobPayroll1` FOREIGN KEY (`JobID`) REFERENCES `jobpayroll` (`JobID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employee_Unit` FOREIGN KEY (`UnitID`) REFERENCES `unit` (`UnitID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1500 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (8,'Dollar','Narula','123 Something','514 555 5555','HOH OHO','2013-08-10',1,1),(1000,'Armand','Cochran','603-6264 Praesent Rd.','(952) 416-5585','G5K 9V9','0000-00-00',1,5),(1001,'Donovan','Holland','Ap #688-2331 Interdum St.','(317) 886-3004','P1C 9A3','0000-00-00',3,9),(1002,'Isabelle','Haynes','591-6774 Vehicula. Street','(953) 685-7536','E1L 7B0','0000-00-00',1,11),(1003,'Thane','Cook','Ap #518-3368 Etiam Avenue','(876) 436-9727','R6M 3J6','0000-00-00',1,1),(1004,'Keegan','Raymond','3458 Orci, Rd.','(882) 435-1025','C1G 4C5','0000-00-00',2,14),(1005,'Chantale','Rich','P.O. Box 686, 1128 Adipiscing Rd.','(807) 745-5689','N5K 4A5','0000-00-00',1,1),(1006,'Lucius','Finley','2146 Magna. Ave','(587) 648-4551','P9P 9A5','2011-06-06',3,2),(1007,'Keegan','Mckinney','Ap #475-6219 Risus St.','(943) 768-5440','X9P 0S2','0000-00-00',1,14),(1008,'Allegra','Curry','Ap #733-6750 At St.','(673) 132-4701','B6X 9E7','0000-00-00',2,9),(1009,'Wyatt','Pugh','8474 Mauris Rd.','(819) 685-1591','N1V 1V2','0000-00-00',3,3),(1010,'Daryl','Griffith','Ap #934-1797 Enim. St.','(377) 356-4412','Y5S 1E2','0000-00-00',1,6),(1011,'Francesca','Wade','P.O. Box 735, 4541 Quis St.','(490) 303-0856','R2G 0A2','0000-00-00',2,15),(1012,'Kylan','Perkins','7010 Vitae, Ave','(647) 912-2025','A1H 5B4','0000-00-00',1,9),(1013,'Damon','Freeman','850-8286 Erat, Street','(125) 192-5616','C9Y 6R9','0000-00-00',3,6),(1014,'Ria','Sutton','787-2124 Etiam Avenue','(905) 786-9468','S8L 1R5','0000-00-00',2,3),(1015,'Cameran','Lucas','Ap #168-6629 Morbi Ave','(199) 818-8757','Y3V 1Y5','0000-00-00',1,9),(1016,'Abdul','Gomez','8638 Neque. Rd.','(226) 722-7225','C6C 4G2','0000-00-00',2,2),(1017,'Inez','Melton','Ap #603-5888 Sollicitudin Rd.','(822) 813-0702','H3Z 3V1','0000-00-00',1,13),(1018,'Basia','Tyler','P.O. Box 108, 9384 Ligula Street','(254) 713-0311','T4Z 6A2','0000-00-00',3,3),(1019,'Zephania','Wood','P.O. Box 780, 6979 Fringilla Av.','(708) 700-2474','Y8P 1V3','0000-00-00',3,12),(1020,'Leila','Reynolds','P.O. Box 110, 5855 Gravida Rd.','(776) 543-5305','C7W 8R8','0000-00-00',2,5),(1021,'Raymond','Craig','Ap #565-3539 Nec Rd.','(613) 660-4359','T5R 1R7','0000-00-00',3,1),(1022,'Teagan','Hopkins','P.O. Box 493, 7368 Mus. Rd.','(203) 739-8755','H9R 3G4','0000-00-00',3,1),(1023,'Wade','Silva','Ap #481-9866 Nascetur Rd.','(392) 764-7010','N4R 6H9','0000-00-00',3,14),(1024,'Kylan','Tran','346-6222 Nascetur Ave','(882) 384-2018','M9X 4V4','0000-00-00',2,14),(1025,'Sloane','Hooper','686-644 Nibh. St.','(743) 101-8246','X5C 7M6','0000-00-00',3,10),(1026,'Portia','Gonzales','9897 Sit Rd.','(991) 451-1951','H2R 0X2','0000-00-00',1,12),(1027,'Wynter','Hayes','925 Cras Ave','(522) 101-0934','M0V 5W7','0000-00-00',2,9),(1028,'Sylvia','Beard','6531 Lobortis Avenue','(930) 611-1332','J8V 8L3','0000-00-00',2,9),(1029,'Idola','Larson','893-8775 Cursus Avenue','(428) 487-6938','L7R 0B9','0000-00-00',1,9),(1030,'Teagan','Steele','340-8545 Netus Street','(422) 316-5994','A4M 5S9','0000-00-00',2,10),(1031,'Hadley','England','P.O. Box 844, 3426 Mattis Rd.','(115) 409-6227','V1K 5P3','0000-00-00',3,12),(1032,'Abigail','Anderson','3600 Nec, Ave','(988) 261-2875','B0Y 9V6','0000-00-00',3,12),(1033,'Shoshana','Wong','Ap #440-3973 Nec, Road','(530) 570-3510','K0T 1G7','0000-00-00',3,7),(1034,'Cassidy','Carr','6348 Etiam Avenue','(970) 514-0445','S6X 4B7','0000-00-00',1,8),(1035,'Sloane','Bradford','335-2114 Lectus St.','(501) 361-9651','N1W 0A5','0000-00-00',1,10),(1036,'Neville','Townsend','Ap #862-8741 In, Av.','(281) 406-4280','Y9X 5N4','0000-00-00',2,13),(1037,'Olympia','Greer','1887 Amet Ave','(689) 378-4607','Y4H 3J0','0000-00-00',3,10),(1038,'Deirdre','Emerson','3452 Enim. Av.','(618) 309-9992','J8M 0L6','0000-00-00',3,12),(1039,'Alisa','Walker','986-6010 Vulputate, Road','(584) 429-5026','A4K 7C7','0000-00-00',1,4),(1040,'Lila','Mcgowan','855-9737 Ornare, St.','(212) 277-0202','L2K 7X3','0000-00-00',1,10),(1041,'Charde','Crosby','7954 Mauris Street','(978) 258-3705','S8Y 9N2','0000-00-00',2,12),(1042,'Howard','Ramos','Ap #139-3074 Et St.','(826) 705-4870','R6K 5G1','0000-00-00',3,2),(1043,'Hector','Cabrera','554-6531 Quisque Avenue','(162) 190-3583','T3X 9G5','0000-00-00',1,5),(1044,'Kenneth','Moreno','4917 Nonummy Ave','(983) 330-3023','L1A 5M2','0000-00-00',3,6),(1045,'Hop','Spencer','P.O. Box 729, 8673 Dui. Street','(776) 525-4688','Y4V 3E2','0000-00-00',3,2),(1046,'Kalia','Cohen','317-8507 Feugiat Avenue','(559) 347-0022','K4S 5J6','0000-00-00',2,11),(1047,'Zia','Bowers','571-3516 Lacus. St.','(257) 432-9354','G8B 9V4','0000-00-00',1,8),(1048,'Ivor','Huff','P.O. Box 988, 8623 Aliquam Ave','(211) 643-1275','A1X 5R1','0000-00-00',2,12),(1049,'Harriet','Osborn','P.O. Box 585, 6257 Nibh. St.','(237) 218-2357','L2P 2B6','0000-00-00',3,11),(1050,'Hamish','Washington','P.O. Box 608, 6935 Elit, Avenue','(278) 730-0012','M2J 2H7','0000-00-00',3,7),(1051,'Jermaine','Snyder','462-5096 Convallis Rd.','(645) 207-9943','C7K 5H9','0000-00-00',3,8),(1052,'Sebastian','Mcfadden','662-9798 Cursus St.','(414) 861-2233','M5G 0Z3','0000-00-00',1,5),(1053,'Preston','Gross','812-6483 Diam St.','(490) 184-2329','S7G 0A7','0000-00-00',2,8),(1054,'Malachi','Dyer','Ap #617-9830 Pede. Rd.','(662) 426-2371','A8Z 4B7','0000-00-00',3,15),(1055,'Demetria','Gardner','P.O. Box 488, 5580 Lacinia Street','(901) 507-1213','R5L 6B4','0000-00-00',3,6),(1056,'Kirsten','Beach','1852 Dapibus Rd.','(954) 100-9014','K0Z 3L6','0000-00-00',1,15),(1057,'Aurora','Allen','P.O. Box 586, 3105 Risus. Ave','(249) 969-5195','H4V 2Z1','0000-00-00',1,15),(1058,'Francesca','Weeks','Ap #655-7890 Enim. Ave','(738) 360-7693','L0P 4T9','0000-00-00',2,8),(1059,'Scott','Knox','Ap #566-7830 Felis. Av.','(223) 801-1938','Y4Z 4X4','0000-00-00',3,2),(1060,'Kirk','Johns','774-8113 Neque Street','(654) 136-3754','E5L 2B3','0000-00-00',3,11),(1061,'Oliver','Blanchard','Ap #456-999 Tempor Rd.','(564) 250-7911','E0V 9M9','0000-00-00',3,9),(1062,'Kiona','Valencia','105-7119 Nunc Rd.','(262) 577-2197','K9L 0W6','0000-00-00',1,12),(1063,'Aphrodite','Mathews','Ap #219-4686 Ante. Rd.','(877) 848-4741','L3R 2B0','0000-00-00',2,10),(1064,'Blaze','Kelley','P.O. Box 225, 4920 Aliquam Avenue','(760) 818-5970','E3H 8T7','0000-00-00',3,3),(1065,'Colt','George','146-7949 Suspendisse Street','(599) 646-3444','B1E 2Y3','0000-00-00',2,1),(1066,'Lawrence','Daniel','4445 Fusce Street','(697) 195-5941','V5Y 2N2','0000-00-00',2,1),(1067,'Faith','Nash','Ap #831-1453 Vel Rd.','(804) 740-6206','E6Y 2C7','0000-00-00',3,9),(1068,'Piper','Bass','412-9634 Metus Street','(795) 603-6410','N4A 1Z2','0000-00-00',2,12),(1069,'Russell','Strickland','Ap #324-186 Dui Avenue','(753) 150-9060','M3Z 3S5','0000-00-00',2,5),(1070,'Orson','Phelps','4679 Dui. Ave','(644) 374-9270','V5Z 2W4','0000-00-00',3,13),(1071,'Renee','Copeland','9319 Sed St.','(865) 550-1043','Y6J 7N3','0000-00-00',3,14),(1072,'Macey','Benjamin','7696 Facilisis Av.','(701) 891-6561','C1S 9B0','0000-00-00',1,11),(1073,'Tatiana','Pitts','726-3008 Auctor Ave','(301) 278-2962','S4Z 4W1','0000-00-00',1,5),(1074,'May','Kirby','Ap #941-4622 Erat Ave','(867) 690-5023','N7L 8P1','0000-00-00',3,8),(1075,'Gisela','Massey','Ap #361-6754 Dolor St.','(701) 740-2161','K6E 9Z7','0000-00-00',1,4),(1076,'Nerea','Green','Ap #971-8677 Non Street','(215) 583-4099','S4J 9T7','0000-00-00',1,4),(1077,'Louis','Tate','Ap #432-9256 Sem Rd.','(364) 356-3101','K4H 6P9','0000-00-00',2,8),(1078,'Bethany','Summers','Ap #617-7084 Mi. Av.','(313) 706-3588','C3K 6N7','0000-00-00',1,3),(1079,'Blake','Rodriguez','5376 Sed Ave','(673) 230-4431','A8K 1A3','0000-00-00',2,1),(1080,'Edward','Harding','4918 Quis Avenue','(179) 744-2274','Y2C 4H5','0000-00-00',2,13),(1081,'Karen','Boone','P.O. Box 337, 9334 Lacus. Rd.','(598) 449-1365','P4J 4K3','0000-00-00',3,15),(1082,'Nolan','Jones','P.O. Box 386, 597 Nonummy Avenue','(191) 386-2707','J7Y 3R5','0000-00-00',3,3),(1083,'Quinn','Waters','745-6331 Consectetuer St.','(166) 476-3892','P9T 8Z1','0000-00-00',2,4),(1084,'Lunea','Taylor','320-1772 Molestie St.','(434) 204-8785','J4A 5N6','0000-00-00',2,4),(1085,'Jillian','Doyle','147-3693 Vel Rd.','(827) 142-4835','G7S 4G0','0000-00-00',2,3),(1086,'Wynter','Daniel','1032 Non Rd.','(725) 139-9670','X3B 3N3','0000-00-00',1,15),(1087,'Kirsten','Durham','120-126 Auctor, St.','(764) 571-8231','X3W 8Y7','0000-00-00',1,4),(1088,'Castor','Acosta','660-9342 Ac Ave','(364) 461-9167','P6G 8L1','0000-00-00',1,8),(1089,'Damon','Duke','P.O. Box 274, 1543 Vestibulum St.','(184) 788-3210','Y8N 4X1','0000-00-00',1,3),(1090,'Barclay','Bowman','P.O. Box 342, 7659 Eu Rd.','(347) 558-3051','A9S 1E6','0000-00-00',3,15),(1091,'Alvin','Odom','1686 A Avenue','(986) 314-5529','C6L 9R7','0000-00-00',1,2),(1092,'Ainsley','Mooney','386 Semper St.','(341) 232-1193','T5W 9S1','0000-00-00',1,6),(1093,'Armando','Golden','2810 Euismod St.','(166) 347-5986','K9C 7K0','0000-00-00',1,2),(1094,'Kennedy','Walter','Ap #975-5381 Nullam Rd.','(945) 976-5490','Y0E 0X5','0000-00-00',1,7),(1095,'Alfreda','Ayala','P.O. Box 854, 3356 Morbi Road','(939) 888-3481','B4V 5J7','0000-00-00',1,7),(1096,'Macey','Lara','P.O. Box 804, 5269 Mauris Rd.','(415) 354-5433','E8Y 5M0','0000-00-00',2,12),(1097,'Zelda','Donovan','1535 Fringilla Street','(876) 951-3676','P5P 9J4','0000-00-00',1,4),(1098,'Brooke','Cole','Ap #428-7046 A Ave','(980) 808-6681','N8Z 7A5','0000-00-00',3,4),(1099,'Giacomo','Molina','P.O. Box 716, 8418 Mattis. Rd.','(435) 704-6136','V0G 0W7','0000-00-00',1,15),(1200,'Kim','Oneill','Ap #755-3989 Luctus Street','(138) 906-6358','A6S 8V3','0000-00-00',1,10),(1201,'Ila','Duran','Ap #617-9803 Convallis Street','(395) 126-4154','J1C 0L1','0000-00-00',3,4),(1202,'Oliver','Bush','Ap #427-7407 Nunc Rd.','(563) 266-0263','K5H 6K6','0000-00-00',3,2),(1203,'Rae','Irwin','Ap #452-3451 Orci St.','(588) 864-5951','H8G 3J6','0000-00-00',2,9),(1204,'Walter','Mccray','P.O. Box 180, 7771 Condimentum Street','(933) 368-1477','K4H 9X5','0000-00-00',3,5),(1205,'Sarah','Black','Ap #922-7371 Aliquam St.','(129) 298-4310','Y0M 2V8','0000-00-00',1,5),(1206,'Oscar','Barrett','Ap #710-6650 Habitant Rd.','(683) 554-7557','M0H 7P2','0000-00-00',2,15),(1207,'Serina','Ball','2951 Nec Rd.','(678) 345-8293','J8V 7W8','0000-00-00',3,5),(1208,'Colt','Sawyer','507-8526 Vulputate St.','(404) 420-0135','P5R 9R9','0000-00-00',3,3),(1209,'Roary','Hendricks','903-4441 Sociis Rd.','(598) 972-9152','P2B 8A7','0000-00-00',1,11),(1210,'Gay','Mosley','Ap #520-3686 Metus. Avenue','(306) 250-0308','E1J 9M9','0000-00-00',2,14),(1211,'Cain','Marsh','185-8267 Nulla St.','(904) 447-4099','C8Z 0X1','0000-00-00',1,15),(1212,'Cecilia','Collier','P.O. Box 318, 2293 Donec Rd.','(844) 924-0684','H2R 3R7','0000-00-00',2,5),(1213,'Callum','Mcpherson','414 Neque St.','(286) 419-2541','L6S 8Y1','0000-00-00',3,13),(1214,'Cody','Compton','5903 Mollis Rd.','(744) 724-9112','T4S 6H8','0000-00-00',1,2),(1215,'Blaze','Vang','6776 Fringilla Avenue','(204) 780-4241','R1H 9G7','0000-00-00',2,15),(1216,'Quynn','Ortiz','2521 Vivamus Road','(597) 574-7794','X4Z 4L9','0000-00-00',2,15),(1217,'Blaze','Marshall','9815 Taciti St.','(843) 345-7332','V7L 4S2','0000-00-00',1,13),(1218,'Germaine','Carroll','Ap #348-8988 Risus. Av.','(259) 957-3808','V9H 6Z1','0000-00-00',2,12),(1219,'Haviva','Hardy','Ap #945-2348 Praesent St.','(978) 369-7582','J0R 1H4','0000-00-00',2,4),(1220,'Bianca','Mcdowell','Ap #574-4625 Rhoncus St.','(361) 380-9636','L3N 7P9','0000-00-00',2,2),(1221,'Richard','Collins','Ap #211-6959 Non, St.','(814) 467-9797','E5Z 3V4','0000-00-00',3,15),(1222,'Noel','Gates','P.O. Box 964, 4603 Purus Street','(301) 479-5122','X9X 8L1','0000-00-00',3,4),(1223,'Jorden','Haynes','1556 Enim Street','(604) 898-1094','Y1H 8L3','0000-00-00',3,14),(1224,'Rhea','Haynes','3229 Vel Ave','(227) 508-0039','B1N 8B5','0000-00-00',1,3),(1225,'Sacha','Fletcher','Ap #261-5111 Integer Ave','(132) 963-1481','P8H 8Y3','0000-00-00',2,15),(1226,'Adam','Horton','P.O. Box 135, 4029 Neque. St.','(971) 122-4411','R4Z 6S6','0000-00-00',3,4),(1227,'Kelsie','Watson','520-8995 Quis Rd.','(559) 698-3095','K5X 6G5','0000-00-00',1,7),(1228,'Ariana','Clark','7795 Nisl Ave','(722) 971-5200','H8Y 6H9','0000-00-00',1,14),(1229,'Aiko','Stout','P.O. Box 462, 7270 Mi Rd.','(364) 141-3610','V6R 7B9','0000-00-00',3,10),(1230,'Maggie','Wyatt','5715 Turpis Avenue','(872) 819-1842','V6P 6H9','0000-00-00',1,9),(1231,'Karen','Wheeler','P.O. Box 514, 9037 Mus. Street','(108) 956-7848','C8Y 7K8','0000-00-00',3,10),(1232,'Ginger','Weeks','186 Rutrum Rd.','(632) 681-6805','G1E 0T8','0000-00-00',2,10),(1233,'Chadwick','Mcdaniel','6592 A Av.','(391) 871-4140','X6H 3G5','0000-00-00',1,10),(1234,'Macon','Gonzalez','P.O. Box 669, 8111 Metus Rd.','(746) 619-5273','V3R 5Z5','0000-00-00',2,4),(1235,'Burton','Dominguez','5186 Commodo Road','(751) 819-5661','A3B 4P6','0000-00-00',3,9),(1236,'Fleur','Sweet','7977 Hymenaeos. Av.','(916) 492-0439','G9P 0N3','0000-00-00',2,5),(1237,'Anika','Sosa','161-8347 Eleifend. Rd.','(436) 216-3892','J9J 6L6','0000-00-00',1,2),(1238,'Maia','Allison','733-104 Nascetur St.','(724) 807-1792','H5C 3H4','0000-00-00',2,5),(1239,'Hedley','Miranda','P.O. Box 823, 8334 Augue Av.','(991) 698-8378','E1Y 5G2','0000-00-00',1,13),(1240,'Audrey','Gilmore','253 Tincidunt Road','(908) 386-1787','B4L 2H9','0000-00-00',3,11),(1241,'Jada','Hayes','Ap #189-401 Commodo Avenue','(973) 873-8566','B4C 7A2','0000-00-00',1,12),(1242,'Colorado','Huff','952-8947 Lectus Rd.','(395) 494-1328','H7S 0C7','0000-00-00',3,2),(1243,'Latifah','Dunlap','766-868 Nisl. Rd.','(925) 918-8627','K2V 5R1','0000-00-00',1,6),(1244,'Dean','Franks','P.O. Box 785, 6571 Malesuada Road','(631) 340-5906','Y5L 3R8','0000-00-00',3,13),(1245,'Kenneth','Herrera','Ap #643-4913 Morbi St.','(795) 561-8743','V6B 6Z0','0000-00-00',3,15),(1246,'Dieter','Harper','P.O. Box 936, 3270 Nullam Avenue','(618) 255-1198','P1M 6L3','0000-00-00',1,13),(1247,'Dante','Kane','Ap #402-5843 Fusce St.','(928) 854-9355','X6Y 7H5','0000-00-00',3,12),(1248,'Venus','Randolph','P.O. Box 457, 8529 Purus Road','(253) 513-7913','Y6S 7K6','0000-00-00',2,3),(1249,'Henry','Fitzgerald','3203 Ornare Rd.','(406) 535-7992','C4K 5P0','0000-00-00',1,4),(1250,'Joy','Durham','Ap #418-6681 Mauris Street','(973) 707-7721','E2J 4G4','0000-00-00',1,15),(1251,'Sasha','Mckee','Ap #515-6574 Hendrerit Road','(472) 832-5705','R9P 6C7','0000-00-00',2,12),(1252,'TaShya','Hickman','9794 Ut St.','(783) 420-8036','C5V 5J0','0000-00-00',2,9),(1253,'Darrel','Farley','421-7928 Phasellus Avenue','(859) 746-4807','E5G 7V3','0000-00-00',3,15),(1254,'Eric','Lloyd','Ap #215-9077 Tempor Rd.','(302) 680-0775','L0J 4W5','0000-00-00',2,4),(1255,'Abbot','Beard','615-3244 Vel Ave','(329) 411-4472','G4L 5W8','0000-00-00',2,13),(1256,'Leandra','Castaneda','Ap #362-4883 Libero Road','(908) 531-7358','E2T 0G0','0000-00-00',2,15),(1257,'Jared','Merrill','206-4698 Dictum Street','(851) 100-1855','N1J 5K5','0000-00-00',1,5),(1258,'Oprah','Brady','P.O. Box 146, 5697 Et, Avenue','(630) 788-2993','P6H 9M8','0000-00-00',1,2),(1259,'Basil','Roy','147-5584 Sed Rd.','(996) 952-3601','K6E 5X8','0000-00-00',2,5),(1260,'Cadman','Byrd','8518 Vitae Rd.','(423) 738-6356','M8C 9E2','0000-00-00',3,12),(1261,'Hollee','Rutledge','Ap #317-718 Diam Avenue','(896) 781-0183','M2M 3E9','0000-00-00',1,9),(1262,'Calvin','Glenn','Ap #452-1174 Fusce Street','(137) 336-2031','A6J 5H8','0000-00-00',1,6),(1263,'Remedios','Roth','3429 Ut, Avenue','(476) 917-0452','X4T 0W0','0000-00-00',3,3),(1264,'Britanni','Lambert','2241 A Ave','(564) 547-8137','V6B 7W6','0000-00-00',2,2),(1265,'Magee','Fleming','P.O. Box 505, 8458 Aliquet Ave','(685) 500-0454','M2A 6A8','0000-00-00',1,7),(1266,'Frances','Bridges','2195 Consectetuer, St.','(419) 667-2436','X9G 0L8','0000-00-00',2,7),(1267,'Lydia','Michael','Ap #827-6101 Justo Street','(737) 561-7573','P6H 0K2','0000-00-00',1,15),(1268,'Amal','Mcclure','901-862 Donec Rd.','(417) 274-6592','K0B 3W6','0000-00-00',3,11),(1269,'Virginia','Cantu','807-8802 Sed Street','(623) 537-6094','K8R 0P0','0000-00-00',2,10),(1270,'Brielle','Moody','386-1228 Erat Avenue','(164) 840-1864','P7Y 2T3','0000-00-00',2,5),(1271,'Amery','Gould','607-2669 Diam Rd.','(755) 166-7152','T0S 0M2','0000-00-00',1,10),(1272,'Ryan','Hendrix','Ap #606-8880 Cum Rd.','(212) 740-2019','G0G 8C0','0000-00-00',3,13),(1273,'Velma','Roth','P.O. Box 945, 8394 Eu Road','(645) 237-3658','V7N 7V7','0000-00-00',3,12),(1274,'Regina','Alston','P.O. Box 641, 7149 Amet Avenue','(208) 184-5459','S7H 5P1','0000-00-00',1,15),(1275,'Dillon','Cameron','6793 A St.','(155) 113-2213','M1X 7A4','0000-00-00',1,8),(1276,'Karina','Rojas','918-3257 Nullam St.','(573) 444-0052','L1P 9C1','0000-00-00',2,12),(1277,'Barrett','Yang','468-9227 Libero. St.','(242) 278-9123','B5W 8Z2','0000-00-00',2,5),(1278,'Zeus','Lynch','Ap #414-1051 Aptent St.','(645) 947-4792','S2Y 0S9','0000-00-00',2,13),(1279,'Kylee','Jones','8078 Fringilla Rd.','(109) 730-3853','Y2Z 4B3','0000-00-00',1,6),(1280,'Cooper','Gaines','1874 Mauris Street','(849) 427-4272','L2X 7R5','0000-00-00',2,11),(1281,'Medge','Stevens','8526 Praesent St.','(420) 622-4728','G7N 8L0','0000-00-00',3,1),(1282,'Eric','Pate','568-6714 Lectus St.','(207) 291-4977','L9M 4H7','0000-00-00',1,3),(1283,'Cleo','Reilly','8816 Rutrum Rd.','(478) 725-8330','G2G 4K7','0000-00-00',1,8),(1284,'Thomas','Hale','Ap #971-5968 Sit Road','(452) 245-9322','E1W 7S0','0000-00-00',3,2),(1285,'Uriel','Talley','Ap #478-6973 Id, Street','(883) 837-3698','L1Z 6S2','0000-00-00',1,14),(1286,'Quail','Lane','Ap #859-3157 Dapibus Road','(119) 588-3167','T8P 7Z0','0000-00-00',3,1),(1287,'Ryan','Webster','P.O. Box 468, 413 Dis Rd.','(186) 916-1029','M2A 5P8','0000-00-00',3,8),(1288,'Hayfa','Carroll','P.O. Box 429, 3098 Dapibus Road','(884) 395-0552','K5E 9T7','0000-00-00',1,10),(1289,'Chadwick','Pollard','Ap #688-9088 Torquent Ave','(201) 539-3712','V4A 4V4','0000-00-00',2,5),(1290,'Ali','Watkins','Ap #598-4694 Erat Ave','(930) 621-5368','L2A 7B8','0000-00-00',1,1),(1291,'Clare','Booker','Ap #426-9235 Vel Avenue','(905) 554-7509','K5P 3E0','0000-00-00',3,10),(1292,'Merrill','Collins','P.O. Box 952, 8262 Egestas Ave','(493) 782-8464','Y4V 6T1','0000-00-00',3,7),(1293,'Cally','Franklin','288-5249 Iaculis Street','(195) 179-9177','A9C 4Z1','0000-00-00',2,9),(1294,'Uriel','Pruitt','9018 Nunc Rd.','(942) 367-3534','L0C 8P3','0000-00-00',2,5),(1295,'Sybil','Maldonado','Ap #646-3019 In Road','(339) 229-6422','N0G 8K6','0000-00-00',1,10),(1296,'Suki','Lambert','4231 Ligula. Rd.','(137) 690-8300','B2X 3W7','0000-00-00',2,15),(1297,'Stone','Short','P.O. Box 675, 6217 Ipsum. Ave','(710) 650-9369','M5W 4C8','0000-00-00',2,8),(1298,'Murphy','Arnold','Ap #156-3583 Interdum. Rd.','(785) 342-5480','G7Y 7A4','0000-00-00',2,13),(1299,'Daria','Schroeder','Ap #656-4053 Mi Road','(911) 948-7011','G7H 0G5','0000-00-00',2,11),(1400,'Sophia','Ochoa','Ap #240-6100 Diam Rd.','(829) 827-4928','S3L 7P6','0000-00-00',1,15),(1401,'Quail','Gay','Ap #712-7561 In St.','(514) 772-9702','S3N 7N2','0000-00-00',2,9),(1402,'Amela','Webb','Ap #798-9762 Ullamcorper. Rd.','(485) 161-2080','J0G 9J9','0000-00-00',1,13),(1403,'Darryl','Sellers','P.O. Box 796, 7123 Ultrices Ave','(143) 837-7983','X2R 7A9','0000-00-00',1,3),(1404,'Roanna','Espinoza','226-9639 Libero. St.','(180) 761-1995','M9R 6H5','0000-00-00',3,10),(1405,'Upton','Wagner','868 Quam Avenue','(282) 591-4822','K2A 0Y5','0000-00-00',2,5),(1406,'Magee','Spencer','P.O. Box 798, 2466 In Street','(101) 114-8388','R6C 0B5','0000-00-00',2,6),(1407,'Dominique','Cannon','Ap #328-534 Venenatis St.','(952) 782-7938','H9T 6R4','0000-00-00',2,3),(1408,'Farrah','Rodgers','764-5574 Fusce Road','(992) 292-7195','T6Z 9X2','0000-00-00',2,12),(1409,'Tucker','Meyer','P.O. Box 334, 3501 Nonummy Rd.','(566) 326-1581','R2V 4V5','0000-00-00',3,10),(1410,'Brenda','Rodriguez','P.O. Box 481, 6249 Donec Avenue','(196) 332-9951','L8L 0G1','0000-00-00',2,11),(1411,'Emery','Woodward','Ap #765-8830 Tincidunt St.','(179) 539-4027','T3L 5A8','0000-00-00',1,3),(1412,'Imogene','Holt','Ap #343-6253 Odio, Rd.','(231) 922-6170','J9L 5V2','0000-00-00',1,3),(1413,'Shannon','Cooper','P.O. Box 282, 3020 Luctus Av.','(188) 340-6609','N7H 7X6','0000-00-00',3,11),(1414,'Quinn','Farmer','Ap #106-7557 Gravida Rd.','(388) 519-3027','E8H 9A8','0000-00-00',1,14),(1415,'Morgan','Flores','4231 Dis Rd.','(809) 407-6950','C6E 3R5','0000-00-00',1,7),(1416,'Jerry','Kline','Ap #750-792 Egestas Road','(836) 774-8789','A5A 5Y1','0000-00-00',2,7),(1417,'Clementine','Burnett','Ap #971-3503 Donec Av.','(638) 346-6044','H2S 7C7','0000-00-00',2,5),(1418,'Eden','Campbell','492-3503 Luctus Street','(820) 866-1495','N0C 8G4','0000-00-00',1,9),(1419,'Austin','Thomas','Ap #571-3381 Eu St.','(876) 304-5121','R9W 2P4','0000-00-00',3,6),(1420,'Declan','Poole','P.O. Box 428, 3751 Adipiscing. Rd.','(559) 988-7518','H8T 6N3','0000-00-00',1,11),(1421,'Marny','George','8749 Erat, Street','(903) 247-6975','K6C 4J0','0000-00-00',3,9),(1422,'Neve','Conrad','Ap #243-345 Eu, Road','(172) 862-8932','K5A 9Y4','0000-00-00',3,1),(1423,'Lydia','Ashley','P.O. Box 612, 1574 Ultrices. Avenue','(898) 198-8264','V7E 8Z5','0000-00-00',2,8),(1424,'Isabella','York','230-3748 Nibh Road','(304) 823-8138','R6M 2B3','0000-00-00',1,3),(1425,'Xena','Davenport','6141 Purus. Avenue','(939) 443-6575','X4E 9P2','0000-00-00',3,2),(1426,'Madonna','Contreras','129-8128 Morbi Av.','(527) 386-6700','V2M 9R4','0000-00-00',1,11),(1427,'Illana','Rose','P.O. Box 986, 2227 Ullamcorper St.','(784) 769-9327','A9R 7R5','0000-00-00',1,13),(1428,'Vanna','Brock','Ap #930-3398 Felis Rd.','(993) 810-7683','T5T 6C7','0000-00-00',2,13),(1429,'Lance','Riggs','439-2887 Amet, St.','(898) 727-6658','M6Z 3J7','0000-00-00',3,5),(1430,'Valentine','Barton','150 Orci, St.','(821) 264-9526','J5B 0W4','0000-00-00',3,15),(1431,'Lewis','Ingram','2969 Dui Avenue','(887) 967-7898','A6K 7R6','0000-00-00',2,6),(1432,'Cecilia','Cook','P.O. Box 283, 8372 Morbi Street','(567) 396-1757','J1C 7Z1','0000-00-00',2,5),(1433,'Hanae','Graham','P.O. Box 187, 2218 Tincidunt, St.','(732) 917-6906','C9T 4P1','0000-00-00',2,4),(1434,'Mercedes','Patrick','2136 Ultrices, Rd.','(972) 984-7166','H5W 8T1','0000-00-00',2,7),(1435,'Amity','Osborne','101-1964 Amet Rd.','(988) 808-5284','J1A 8K3','0000-00-00',3,8),(1436,'Gwendolyn','Dean','335-7941 Elit. St.','(370) 390-1791','K9B 9P4','0000-00-00',2,8),(1437,'Belle','Mcgowan','6855 Duis Rd.','(717) 135-3166','X6Y 5C3','0000-00-00',1,11),(1438,'Yasir','Boyd','Ap #882-302 Lacus. Avenue','(315) 282-3636','V3A 6C9','0000-00-00',1,11),(1439,'Daphne','Banks','518-4756 Donec Road','(731) 644-7966','L6N 1M3','0000-00-00',1,14),(1440,'Jolene','Juarez','315-6472 Dui Rd.','(969) 407-7231','G8G 1C6','0000-00-00',2,3),(1441,'Roth','Morin','P.O. Box 370, 7852 Mauris Street','(192) 351-8559','P4X 7N1','0000-00-00',1,5),(1442,'Lev','Reid','270-3629 Nulla. Ave','(343) 524-4470','B6W 3W4','0000-00-00',2,10),(1443,'Ronan','Pitts','8434 Lorem Road','(125) 549-7933','R4V 2B3','0000-00-00',1,12),(1444,'Herman','Odonnell','Ap #666-5864 Mauris Ave','(389) 270-4258','L6B 2M7','0000-00-00',1,6),(1445,'Neve','Deleon','Ap #510-4673 Facilisis Av.','(729) 482-2739','J6L 6N9','0000-00-00',3,12),(1446,'Halee','Mayo','867-686 Sem, Av.','(466) 803-0078','R9K 4E7','0000-00-00',1,15),(1447,'Cain','Mathis','825-2465 Varius Rd.','(665) 569-1382','K7P 3K2','0000-00-00',3,14),(1448,'Edan','Rhodes','869-188 Morbi Road','(954) 771-3360','B9B 9G4','0000-00-00',1,11),(1449,'Orla','Rosario','P.O. Box 194, 8693 Ac St.','(753) 652-1008','S4M 4W5','0000-00-00',1,7),(1450,'Illiana','Tate','371-4407 Non Rd.','(244) 322-8683','Y8P 3A3','0000-00-00',3,15),(1451,'Samson','Livingston','P.O. Box 343, 5639 Quam. Rd.','(799) 130-4836','V5H 8Z2','0000-00-00',1,3),(1452,'Miranda','Long','4351 Facilisis, Ave','(370) 406-0950','B9E 1E5','0000-00-00',1,10),(1453,'Alana','Petersen','Ap #112-5433 Ipsum Av.','(362) 205-8198','J0A 0P1','0000-00-00',3,15),(1454,'Abigail','Rogers','359-9002 Hymenaeos. St.','(115) 168-7997','J6S 3L0','0000-00-00',2,12),(1455,'Ivy','Hull','Ap #154-8349 Facilisis St.','(821) 212-2739','L8K 2T7','0000-00-00',2,1),(1456,'Simone','Hart','611-7358 Eu Street','(563) 641-8539','C5E 1N6','0000-00-00',3,10),(1457,'Zephania','Valenzuela','Ap #747-1008 Sed Ave','(895) 470-9064','M3W 1A9','0000-00-00',1,7),(1458,'Paloma','Collins','1632 Gravida. Street','(268) 839-6340','E1L 3N4','0000-00-00',1,8),(1459,'Vance','Sullivan','2149 Diam St.','(803) 195-2531','J7V 4J7','0000-00-00',3,5),(1460,'Melvin','Huff','5741 Vitae St.','(988) 170-8839','H2J 3P0','0000-00-00',3,14),(1461,'Miranda','Harrison','Ap #657-8375 Proin St.','(278) 238-0198','M7K 4Z7','0000-00-00',1,13),(1462,'Ora','Gaines','729-7203 Massa Street','(384) 976-6570','K6J 2H8','0000-00-00',2,13),(1463,'Jacqueline','Nelson','170-3141 Dignissim Avenue','(447) 110-9596','X6V 7V1','0000-00-00',1,9),(1464,'Gregory','Cantrell','P.O. Box 460, 3021 Nulla Rd.','(436) 560-8419','J8T 9C6','0000-00-00',2,3),(1465,'Kendall','Stout','P.O. Box 775, 4762 Nam Street','(535) 868-2339','P2V 7V1','0000-00-00',2,4),(1466,'Maia','Hughes','P.O. Box 614, 6344 Eget Ave','(596) 331-6892','C1B 3N7','0000-00-00',3,4),(1467,'Kyra','Finch','215-7756 Tellus. Street','(488) 153-9152','H4Y 5C0','0000-00-00',1,4),(1468,'Naida','Diaz','9821 In St.','(542) 850-3493','C8N 4B6','0000-00-00',3,5),(1469,'Rebekah','Mcbride','Ap #688-213 Etiam Street','(902) 906-3359','J2K 6L5','0000-00-00',2,14),(1470,'Kennan','Wade','Ap #814-2049 Curabitur Rd.','(219) 818-9389','P1T 5N1','0000-00-00',1,3),(1471,'Noelle','Spencer','367-853 Dolor. St.','(496) 218-3064','S5W 8X4','0000-00-00',3,9),(1472,'Zena','Mcgowan','Ap #668-3645 Sem Rd.','(577) 781-6537','A0T 6W4','0000-00-00',2,10),(1473,'Charles','Miles','P.O. Box 410, 6462 Morbi St.','(983) 617-3952','K0C 0W1','0000-00-00',1,4),(1474,'Austin','Martin','P.O. Box 978, 5348 Tristique Avenue','(405) 765-5017','J7V 5L1','0000-00-00',3,8),(1475,'Lance','Lowery','Ap #359-9592 Eu, Road','(519) 573-4211','X4Z 4C3','0000-00-00',3,11),(1476,'Brynne','Vega','P.O. Box 498, 1346 Aliquam Rd.','(388) 673-7775','G4R 9P5','0000-00-00',1,4),(1477,'Hammett','Larsen','1528 Lacus. Rd.','(567) 518-8964','N7V 7A5','0000-00-00',3,15),(1478,'Zelda','Holden','8131 Ornare. Avenue','(358) 839-2068','C2E 9E4','0000-00-00',1,9),(1479,'Josephine','Weeks','8244 Arcu. St.','(240) 248-4962','H3K 4X0','0000-00-00',1,10),(1480,'Melinda','Boone','707-1049 Dolor Rd.','(383) 275-6760','H3G 9Y5','0000-00-00',2,2),(1481,'Ferris','Francis','731-2860 Quam, St.','(635) 337-1709','X6J 9R6','0000-00-00',1,10),(1482,'Hall','Shannon','969-6133 Dis Street','(419) 246-4988','T9V 4S6','0000-00-00',3,2),(1483,'Basil','Allen','Ap #111-5399 At, Ave','(339) 393-4948','K6S 4E4','0000-00-00',2,13),(1484,'Jemima','Walker','Ap #106-1682 At St.','(278) 321-5144','X7X 7S3','0000-00-00',2,14),(1485,'Honorato','George','2645 Adipiscing Rd.','(574) 175-3445','V9P 3X9','0000-00-00',3,9),(1486,'Cora','Nelson','238-3896 Turpis Avenue','(699) 514-2659','N4B 1P9','0000-00-00',1,14),(1487,'Britanney','Burt','P.O. Box 526, 6817 Eget, St.','(949) 186-0812','X2Z 8S5','0000-00-00',1,5),(1488,'Duncan','Ratliff','Ap #836-9592 Eu Av.','(980) 459-8506','H2V 6C6','0000-00-00',1,2),(1489,'Tallulah','Britt','Ap #808-3122 Risus. Rd.','(469) 259-0635','P8E 6K4','0000-00-00',2,3),(1490,'Zahir','Chavez','9862 Egestas. St.','(235) 818-2784','Y1Y 5H9','0000-00-00',2,12),(1491,'Charissa','Clements','Ap #679-8727 Praesent Av.','(779) 671-9201','Y6G 7B2','0000-00-00',1,5),(1492,'Robert','Alston','9627 Eu, St.','(318) 877-5561','M9G 6E0','0000-00-00',1,13),(1493,'Lee','Sherman','5669 Nullam Street','(193) 293-4013','J5A 6L1','0000-00-00',3,13),(1494,'Byron','Fuller','496-3655 Sodales Ave','(376) 337-1691','C7Z 0S3','0000-00-00',3,7),(1495,'Kirsten','Petty','1179 Gravida Avenue','(328) 862-1483','L6S 4B8','0000-00-00',3,10),(1496,'Leandra','Sparks','Ap #245-1475 At Rd.','(311) 223-3119','G6E 9G6','0000-00-00',2,5),(1497,'Keiko','Stuart','Ap #712-4714 Donec Rd.','(520) 742-8540','B7N 3E7','0000-00-00',3,12),(1498,'Amal','Glenn','2519 Quis Street','(208) 873-3030','Y0X 8V0','0000-00-00',2,10),(1499,'Whitney','Knox','Ap #427-3812 Arcu. Road','(106) 137-0168','T0J 4W3','0000-00-00',2,15);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_list`
--

DROP TABLE IF EXISTS `employee_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_list` (
  `EmployeeListID` int(11) NOT NULL,
  `EmployeeID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`EmployeeListID`,`EmployeeID`),
  KEY `EmployeeID_idx` (`EmployeeID`),
  CONSTRAINT `EmployeeID` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_list`
--

LOCK TABLES `employee_list` WRITE;
/*!40000 ALTER TABLE `employee_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobpayroll`
--

DROP TABLE IF EXISTS `jobpayroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobpayroll` (
  `JobID` int(10) unsigned NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Payroll` int(10) unsigned NOT NULL,
  `WageRate` varchar(45) NOT NULL,
  `OvertimeMultiplier` int(11) DEFAULT NULL,
  PRIMARY KEY (`JobID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobpayroll`
--

LOCK TABLES `jobpayroll` WRITE;
/*!40000 ALTER TABLE `jobpayroll` DISABLE KEYS */;
INSERT INTO `jobpayroll` VALUES (1,'Director',125000,'year',NULL),(2,'Senior Administrator',98000,'year',0),(3,'Administrator',78500,'year',0),(4,'Doctor',0,'service',0),(5,'Intern',40000,'year',0),(6,'Resident 1st Year',42000,'year',0),(7,'Resident 2nd Year',44000,'year',0),(8,'Resident 3rd Year',46000,'year',0),(9,'Supervisor Nurse',28,'hour',1),(10,'Nurse',25,'hour',1),(11,'Technician X-Ray',19,'hour',2),(12,'Technician Computer',18,'hour',2),(13,'Technician Blood-Work',18,'hour',2),(14,'Technician Sterilization',16,'hour',2),(15,'Technician Pediatric',16,'hour',2);
/*!40000 ALTER TABLE `jobpayroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicalsupplies`
--

DROP TABLE IF EXISTS `medicalsupplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicalsupplies` (
  `SupplyTypeID` int(10) unsigned NOT NULL,
  `MedicalSupplyID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Type` varchar(45) NOT NULL,
  PRIMARY KEY (`MedicalSupplyID`),
  KEY `fk_MedicalSupplies_Supplies_idx` (`SupplyTypeID`),
  CONSTRAINT `fk_MedicalSupplies_Supplies` FOREIGN KEY (`SupplyTypeID`) REFERENCES `supplies` (`SupplyTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicalsupplies`
--

LOCK TABLES `medicalsupplies` WRITE;
/*!40000 ALTER TABLE `medicalsupplies` DISABLE KEYS */;
INSERT INTO `medicalsupplies` VALUES (1,1,'Medication');
/*!40000 ALTER TABLE `medicalsupplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medication`
--

DROP TABLE IF EXISTS `medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medication` (
  `SupplyTypeID` int(10) unsigned NOT NULL,
  `MedicationID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MedicalSupplyID` int(10) unsigned NOT NULL,
  `Description` varchar(120) NOT NULL,
  `LastOrdered` date NOT NULL,
  `StockLow` tinyint(1) NOT NULL DEFAULT '0',
  `Cost` double unsigned NOT NULL,
  `AmountLeft` double unsigned NOT NULL,
  `Maximum Capacity` double unsigned NOT NULL,
  PRIMARY KEY (`MedicationID`),
  KEY `fk_Medication_MedicalSupplies1_idx` (`SupplyTypeID`,`MedicalSupplyID`),
  CONSTRAINT `fk_Medication_MedicalSupplies1` FOREIGN KEY (`SupplyTypeID`, `MedicalSupplyID`) REFERENCES `medicalsupplies` (`SupplyTypeID`, `MedicalSupplyID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medication`
--

LOCK TABLES `medication` WRITE;
/*!40000 ALTER TABLE `medication` DISABLE KEYS */;
/*!40000 ALTER TABLE `medication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medication_has_supplyroom`
--

DROP TABLE IF EXISTS `medication_has_supplyroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medication_has_supplyroom` (
  `SupplyTypeID` int(10) unsigned NOT NULL,
  `MedicationID` int(10) unsigned NOT NULL,
  `MedicalSupplyID` int(10) unsigned NOT NULL,
  `SupplyRoomNumber` int(10) unsigned NOT NULL,
  `Floor` int(10) unsigned NOT NULL,
  PRIMARY KEY (`SupplyTypeID`,`MedicationID`,`MedicalSupplyID`,`SupplyRoomNumber`,`Floor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medication_has_supplyroom`
--

LOCK TABLES `medication_has_supplyroom` WRITE;
/*!40000 ALTER TABLE `medication_has_supplyroom` DISABLE KEYS */;
/*!40000 ALTER TABLE `medication_has_supplyroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medication_list`
--

DROP TABLE IF EXISTS `medication_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medication_list` (
  `MedicationListID` int(11) NOT NULL AUTO_INCREMENT,
  `MedicationID` int(11) NOT NULL,
  PRIMARY KEY (`MedicationListID`),
  UNIQUE KEY `MedicationID_UNIQUE` (`MedicationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medication_list`
--

LOCK TABLES `medication_list` WRITE;
/*!40000 ALTER TABLE `medication_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `medication_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nonmedicalsupplies`
--

DROP TABLE IF EXISTS `nonmedicalsupplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nonmedicalsupplies` (
  `NonMedicalSupplyID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Type` varchar(45) NOT NULL,
  `SupplyTypeID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`NonMedicalSupplyID`,`SupplyTypeID`),
  KEY `fk_NonMedicalSupplies_Supplies1_idx` (`SupplyTypeID`),
  CONSTRAINT `fk_NonMedicalSupplies_Supplies1` FOREIGN KEY (`SupplyTypeID`) REFERENCES `supplies` (`SupplyTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nonmedicalsupplies`
--

LOCK TABLES `nonmedicalsupplies` WRITE;
/*!40000 ALTER TABLE `nonmedicalsupplies` DISABLE KEYS */;
/*!40000 ALTER TABLE `nonmedicalsupplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutritionalsupply`
--

DROP TABLE IF EXISTS `nutritionalsupply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nutritionalsupply` (
  `NutritionalSupplyID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Type` varchar(45) NOT NULL,
  `LastOrdered` date NOT NULL,
  `NeedsFill` tinyint(1) NOT NULL DEFAULT '0',
  `SupplyTypeID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`NutritionalSupplyID`,`SupplyTypeID`),
  KEY `fk_NutritionalSupply_Supplies1_idx` (`SupplyTypeID`),
  CONSTRAINT `fk_NutritionalSupply_Supplies1` FOREIGN KEY (`SupplyTypeID`) REFERENCES `supplies` (`SupplyTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutritionalsupply`
--

LOCK TABLES `nutritionalsupply` WRITE;
/*!40000 ALTER TABLE `nutritionalsupply` DISABLE KEYS */;
/*!40000 ALTER TABLE `nutritionalsupply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutritionalsupply_has_vendor`
--

DROP TABLE IF EXISTS `nutritionalsupply_has_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nutritionalsupply_has_vendor` (
  `NutritionalSupplyID` int(10) unsigned NOT NULL,
  `SupplyTypeID` int(10) unsigned NOT NULL,
  `VendorID` int(11) NOT NULL,
  PRIMARY KEY (`NutritionalSupplyID`,`SupplyTypeID`,`VendorID`),
  KEY `fk_NutritionalSupply_has_Vendor_Vendor1_idx` (`VendorID`),
  KEY `fk_NutritionalSupply_has_Vendor_NutritionalSupply1_idx` (`NutritionalSupplyID`,`SupplyTypeID`),
  CONSTRAINT `fk_NutritionalSupply_has_Vendor_NutritionalSupply1` FOREIGN KEY (`NutritionalSupplyID`, `SupplyTypeID`) REFERENCES `nutritionalsupply` (`NutritionalSupplyID`, `SupplyTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_NutritionalSupply_has_Vendor_Vendor1` FOREIGN KEY (`VendorID`) REFERENCES `vendor` (`VendorID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutritionalsupply_has_vendor`
--

LOCK TABLES `nutritionalsupply_has_vendor` WRITE;
/*!40000 ALTER TABLE `nutritionalsupply_has_vendor` DISABLE KEYS */;
/*!40000 ALTER TABLE `nutritionalsupply_has_vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `HospitalCardID` int(11) NOT NULL AUTO_INCREMENT,
  `MedicareNumber` int(11) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `MedicationListID` int(11) DEFAULT NULL,
  `DoctorNotes` text,
  PRIMARY KEY (`HospitalCardID`),
  UNIQUE KEY `MedicareNumber_UNIQUE` (`MedicareNumber`),
  UNIQUE KEY `HospitalCardID_UNIQUE` (`HospitalCardID`),
  KEY `MedicationListID_idx` (`MedicationListID`),
  CONSTRAINT `MedicationListID` FOREIGN KEY (`MedicationListID`) REFERENCES `medication_list` (`MedicationListID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_list`
--

DROP TABLE IF EXISTS `patient_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_list` (
  `PatientListID` int(11) NOT NULL,
  `PatientID` int(11) NOT NULL,
  PRIMARY KEY (`PatientListID`,`PatientID`),
  KEY `Patient_ID_idx` (`PatientID`),
  CONSTRAINT `Patient_ID` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`HospitalCardID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_list`
--

LOCK TABLES `patient_list` WRITE;
/*!40000 ALTER TABLE `patient_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `RoomID` int(11) NOT NULL,
  `UnitID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`RoomID`,`UnitID`),
  KEY `Unit_ID_idx` (`UnitID`),
  CONSTRAINT `Unit_ID` FOREIGN KEY (`UnitID`) REFERENCES `unit` (`UnitID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `ShiftID` int(11) NOT NULL AUTO_INCREMENT,
  `StartTime` datetime NOT NULL,
  `EndTime` datetime NOT NULL,
  `EmployeeListID` int(11) NOT NULL,
  `PatientListID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ShiftID`),
  KEY `EmployeeList_ID_idx` (`EmployeeListID`),
  KEY `PatientListID_idx` (`PatientListID`),
  CONSTRAINT `PatientListID` FOREIGN KEY (`PatientListID`) REFERENCES `patient_list` (`PatientListID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `EmployeeList_ID` FOREIGN KEY (`EmployeeListID`) REFERENCES `employee_list` (`EmployeeListID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service` (
  `ServiceID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `AmountBillable` double DEFAULT NULL,
  PRIMARY KEY (`ServiceID`),
  UNIQUE KEY `Name_UNIQUE` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplies`
--

DROP TABLE IF EXISTS `supplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplies` (
  `SupplyTypeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Type` varchar(45) NOT NULL,
  PRIMARY KEY (`SupplyTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplies`
--

LOCK TABLES `supplies` WRITE;
/*!40000 ALTER TABLE `supplies` DISABLE KEYS */;
INSERT INTO `supplies` VALUES (1,'Medical');
/*!40000 ALTER TABLE `supplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplyroom`
--

DROP TABLE IF EXISTS `supplyroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplyroom` (
  `SupplyRoomNumber` int(10) unsigned NOT NULL,
  `Floor` int(10) unsigned NOT NULL,
  PRIMARY KEY (`SupplyRoomNumber`,`Floor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplyroom`
--

LOCK TABLES `supplyroom` WRITE;
/*!40000 ALTER TABLE `supplyroom` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplyroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplyroom_has_basicpatientsupply`
--

DROP TABLE IF EXISTS `supplyroom_has_basicpatientsupply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplyroom_has_basicpatientsupply` (
  `SupplyRoomNumber` int(10) unsigned NOT NULL,
  `Floor` int(10) unsigned NOT NULL,
  `BasicPatientSupplyID` int(10) unsigned NOT NULL,
  `NonMedicalSupplyID` int(10) unsigned NOT NULL,
  `SupplyTypeID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`SupplyRoomNumber`,`Floor`,`BasicPatientSupplyID`,`NonMedicalSupplyID`,`SupplyTypeID`),
  KEY `fk_SupplyRoom_has_BasicPatientSupply_BasicPatientSupply1_idx` (`BasicPatientSupplyID`,`NonMedicalSupplyID`,`SupplyTypeID`),
  KEY `fk_SupplyRoom_has_BasicPatientSupply_SupplyRoom1_idx` (`SupplyRoomNumber`,`Floor`),
  CONSTRAINT `fk_SupplyRoom_has_BasicPatientSupply_SupplyRoom1` FOREIGN KEY (`SupplyRoomNumber`, `Floor`) REFERENCES `supplyroom` (`SupplyRoomNumber`, `Floor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SupplyRoom_has_BasicPatientSupply_BasicPatientSupply1` FOREIGN KEY (`BasicPatientSupplyID`, `NonMedicalSupplyID`, `SupplyTypeID`) REFERENCES `basicpatientsupply` (`BasicPatientSupplyID`, `NonMedicalSupplyID`, `SupplyTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplyroom_has_basicpatientsupply`
--

LOCK TABLES `supplyroom_has_basicpatientsupply` WRITE;
/*!40000 ALTER TABLE `supplyroom_has_basicpatientsupply` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplyroom_has_basicpatientsupply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplyroom_has_medication`
--

DROP TABLE IF EXISTS `supplyroom_has_medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplyroom_has_medication` (
  `SupplyRoomNumber` int(10) unsigned NOT NULL,
  `Floor` int(10) unsigned NOT NULL,
  `SupplyTypeID` int(10) unsigned NOT NULL,
  `MedicationID` int(10) unsigned NOT NULL,
  `MedicalSupplyID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Floor`,`SupplyTypeID`,`MedicationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplyroom_has_medication`
--

LOCK TABLES `supplyroom_has_medication` WRITE;
/*!40000 ALTER TABLE `supplyroom_has_medication` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplyroom_has_medication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supportingdevices`
--

DROP TABLE IF EXISTS `supportingdevices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supportingdevices` (
  `SupportingDeviceslID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Description` varchar(120) NOT NULL,
  `LastOrdered` date NOT NULL,
  `StockLow` tinyint(1) NOT NULL DEFAULT '0',
  `Cost` double unsigned NOT NULL,
  `AmountLeft` double unsigned NOT NULL,
  `Maximum Capacity` double unsigned NOT NULL,
  `Rented` double DEFAULT NULL,
  `MedicalSupplyTypeID` int(10) unsigned NOT NULL,
  `MedicalSupplyID` int(10) unsigned NOT NULL,
  `UnitID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`SupportingDeviceslID`,`MedicalSupplyTypeID`,`MedicalSupplyID`,`UnitID`),
  KEY `fk_SupportingDevices_MedicalSupplies1_idx` (`MedicalSupplyTypeID`,`MedicalSupplyID`),
  KEY `fk_SupportingDevices_Unit1_idx` (`UnitID`),
  CONSTRAINT `fk_SupportingDevices_MedicalSupplies1` FOREIGN KEY (`MedicalSupplyTypeID`, `MedicalSupplyID`) REFERENCES `medicalsupplies` (`SupplyTypeID`, `MedicalSupplyID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SupportingDevices_Unit1` FOREIGN KEY (`UnitID`) REFERENCES `unit` (`UnitID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supportingdevices`
--

LOCK TABLES `supportingdevices` WRITE;
/*!40000 ALTER TABLE `supportingdevices` DISABLE KEYS */;
/*!40000 ALTER TABLE `supportingdevices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surgicalequipment`
--

DROP TABLE IF EXISTS `surgicalequipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surgicalequipment` (
  `SurgicalID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Description` varchar(120) NOT NULL,
  `LastOrdered` date NOT NULL,
  `StockLow` tinyint(1) NOT NULL DEFAULT '0',
  `Cost` double unsigned NOT NULL,
  `AmountLeft` double unsigned NOT NULL,
  `Maximum Capacity` double unsigned NOT NULL,
  `MedicalSupplyTypeID` int(10) unsigned NOT NULL,
  `MedicalSupplyID` int(10) unsigned NOT NULL,
  `UnitID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`SurgicalID`,`MedicalSupplyTypeID`,`MedicalSupplyID`,`UnitID`),
  KEY `fk_SurgicalEquipment_MedicalSupplies1_idx` (`MedicalSupplyTypeID`,`MedicalSupplyID`),
  KEY `fk_SurgicalEquipment_Unit1_idx` (`UnitID`),
  CONSTRAINT `fk_SurgicalEquipment_MedicalSupplies1` FOREIGN KEY (`MedicalSupplyTypeID`, `MedicalSupplyID`) REFERENCES `medicalsupplies` (`SupplyTypeID`, `MedicalSupplyID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SurgicalEquipment_Unit1` FOREIGN KEY (`UnitID`) REFERENCES `unit` (`UnitID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surgicalequipment`
--

LOCK TABLES `surgicalequipment` WRITE;
/*!40000 ALTER TABLE `surgicalequipment` DISABLE KEYS */;
INSERT INTO `surgicalequipment` VALUES (1,'Surgical Bed','2013-08-08',0,2560.34,20,25,1,1,1);
/*!40000 ALTER TABLE `surgicalequipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit` (
  `UnitID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  PRIMARY KEY (`UnitID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES (1,'Long Term Palliative Care\r\n'),(2,'Children\r\n'),(3,'Surgical\r\n');
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit_has_nutritionalsupply`
--

DROP TABLE IF EXISTS `unit_has_nutritionalsupply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit_has_nutritionalsupply` (
  `UnitID` int(10) unsigned NOT NULL,
  `NutritionalSupplyID` int(10) unsigned NOT NULL,
  `SupplyTypeID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`UnitID`,`NutritionalSupplyID`,`SupplyTypeID`),
  KEY `fk_Unit_has_NutritionalSupply_NutritionalSupply__idx` (`NutritionalSupplyID`,`SupplyTypeID`),
  KEY `fk_Unit_has_NutritionalSupply_Unit1_idx` (`UnitID`),
  CONSTRAINT `fk_Unit_has_NutritionalSupply_Unit1` FOREIGN KEY (`UnitID`) REFERENCES `unit` (`UnitID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Unit_has_NutritionalSupply_NutritionalSupply_ha1` FOREIGN KEY (`NutritionalSupplyID`, `SupplyTypeID`) REFERENCES `nutritionalsupply_has_vendor` (`NutritionalSupplyID`, `SupplyTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_has_nutritionalsupply`
--

LOCK TABLES `unit_has_nutritionalsupply` WRITE;
/*!40000 ALTER TABLE `unit_has_nutritionalsupply` DISABLE KEYS */;
/*!40000 ALTER TABLE `unit_has_nutritionalsupply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit_has_supplyroom`
--

DROP TABLE IF EXISTS `unit_has_supplyroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit_has_supplyroom` (
  `UnitID` int(10) unsigned NOT NULL,
  `SupplyRoomNumber` int(10) unsigned NOT NULL,
  `Floor` int(10) unsigned NOT NULL,
  PRIMARY KEY (`UnitID`,`SupplyRoomNumber`,`Floor`),
  KEY `fk_Unit_has_SupplyRoom_SupplyRoom1_idx` (`SupplyRoomNumber`,`Floor`),
  KEY `fk_Unit_has_SupplyRoom_Unit1_idx` (`UnitID`),
  CONSTRAINT `fk_Unit_has_SupplyRoom_Unit1` FOREIGN KEY (`UnitID`) REFERENCES `unit` (`UnitID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Unit_has_SupplyRoom_SupplyRoom1` FOREIGN KEY (`SupplyRoomNumber`, `Floor`) REFERENCES `supplyroom` (`SupplyRoomNumber`, `Floor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_has_supplyroom`
--

LOCK TABLES `unit_has_supplyroom` WRITE;
/*!40000 ALTER TABLE `unit_has_supplyroom` DISABLE KEYS */;
/*!40000 ALTER TABLE `unit_has_supplyroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `Login` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'direct','dollar',8),(2,'admin','dollar',1006);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor` (
  `VendorID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`VendorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_has_medication`
--

DROP TABLE IF EXISTS `vendor_has_medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_has_medication` (
  `VendorID` int(11) NOT NULL,
  `SupplyTypeID` int(10) unsigned NOT NULL,
  `MedicationID` int(10) unsigned NOT NULL,
  `MedicalSupplyID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`VendorID`,`SupplyTypeID`,`MedicationID`,`MedicalSupplyID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_has_medication`
--

LOCK TABLES `vendor_has_medication` WRITE;
/*!40000 ALTER TABLE `vendor_has_medication` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor_has_medication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_has_supportingdevices`
--

DROP TABLE IF EXISTS `vendor_has_supportingdevices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_has_supportingdevices` (
  `VendorID` int(11) NOT NULL,
  `SupportingDeviceslID` int(10) unsigned NOT NULL,
  `MedicalSupplyTypeID` int(10) unsigned NOT NULL,
  `MedicalSupplyID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`VendorID`,`SupportingDeviceslID`,`MedicalSupplyTypeID`,`MedicalSupplyID`),
  KEY `fk_Vendor_has_SupportingDevices_SupportingDevices1_idx` (`SupportingDeviceslID`,`MedicalSupplyTypeID`,`MedicalSupplyID`),
  KEY `fk_Vendor_has_SupportingDevices_Vendor1_idx` (`VendorID`),
  CONSTRAINT `fk_Vendor_has_SupportingDevices_Vendor1` FOREIGN KEY (`VendorID`) REFERENCES `vendor` (`VendorID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vendor_has_SupportingDevices_SupportingDevices1` FOREIGN KEY (`SupportingDeviceslID`, `MedicalSupplyTypeID`, `MedicalSupplyID`) REFERENCES `supportingdevices` (`SupportingDeviceslID`, `MedicalSupplyTypeID`, `MedicalSupplyID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_has_supportingdevices`
--

LOCK TABLES `vendor_has_supportingdevices` WRITE;
/*!40000 ALTER TABLE `vendor_has_supportingdevices` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor_has_supportingdevices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_has_surgicalequipment`
--

DROP TABLE IF EXISTS `vendor_has_surgicalequipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_has_surgicalequipment` (
  `VendorID` int(11) NOT NULL,
  `SurgicalID` int(10) unsigned NOT NULL,
  `MedicalSupplyTypeID` int(10) unsigned NOT NULL,
  `MedicalSupplyID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`VendorID`,`SurgicalID`,`MedicalSupplyTypeID`,`MedicalSupplyID`),
  KEY `fk_Vendor_has_SurgicalEquipment_SurgicalEquipment1_idx` (`SurgicalID`,`MedicalSupplyTypeID`,`MedicalSupplyID`),
  KEY `fk_Vendor_has_SurgicalEquipment_Vendor1_idx` (`VendorID`),
  CONSTRAINT `fk_Vendor_has_SurgicalEquipment_Vendor1` FOREIGN KEY (`VendorID`) REFERENCES `vendor` (`VendorID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vendor_has_SurgicalEquipment_SurgicalEquipment1` FOREIGN KEY (`SurgicalID`, `MedicalSupplyTypeID`, `MedicalSupplyID`) REFERENCES `surgicalequipment` (`SurgicalID`, `MedicalSupplyTypeID`, `MedicalSupplyID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_has_surgicalequipment`
--

LOCK TABLES `vendor_has_surgicalequipment` WRITE;
/*!40000 ALTER TABLE `vendor_has_surgicalequipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor_has_surgicalequipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yearsofserviceadjustement`
--

DROP TABLE IF EXISTS `yearsofserviceadjustement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yearsofserviceadjustement` (
  `JobID` int(11) NOT NULL,
  `YearsOfService` int(10) unsigned NOT NULL,
  `Add` decimal(10,5) unsigned DEFAULT NULL,
  `Multiply` decimal(10,5) unsigned DEFAULT NULL,
  PRIMARY KEY (`JobID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yearsofserviceadjustement`
--

LOCK TABLES `yearsofserviceadjustement` WRITE;
/*!40000 ALTER TABLE `yearsofserviceadjustement` DISABLE KEYS */;
INSERT INTO `yearsofserviceadjustement` VALUES (1,1,0.00000,1.01500),(2,1,0.00000,1.01500),(3,1,0.00000,1.01000),(9,5,1.50000,0.00000),(10,5,1.50000,0.00000),(11,8,1.25000,0.00000),(12,8,1.25000,0.00000),(13,8,1.25000,0.00000),(14,8,1.25000,0.00000),(15,8,1.25000,0.00000);
/*!40000 ALTER TABLE `yearsofserviceadjustement` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-08-13  9:56:54
