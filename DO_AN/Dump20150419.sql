-- MySQL dump 10.13  Distrib 5.6.23, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: d_a
-- ------------------------------------------------------
-- Server version	5.6.24-log

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
-- Table structure for table `clss`
--

DROP TABLE IF EXISTS `clss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clss` (
  `clssID` int(11) NOT NULL AUTO_INCREMENT,
  `clssname` varchar(50) DEFAULT NULL,
  `yearStart` year(4) DEFAULT NULL,
  `yearfinish` year(4) DEFAULT NULL,
  `notes` text,
  `actived` bit(1) DEFAULT NULL,
  PRIMARY KEY (`clssID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clss`
--

LOCK TABLES `clss` WRITE;
/*!40000 ALTER TABLE `clss` DISABLE KEYS */;
INSERT INTO `clss` VALUES (2,'12a',2012,2015,'aaa',''),(3,'12a1',2010,2011,'asd','');
/*!40000 ALTER TABLE `clss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplines`
--

DROP TABLE IF EXISTS `disciplines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disciplines` (
  `disciplinesID` int(11) NOT NULL AUTO_INCREMENT,
  `discipname` text,
  PRIMARY KEY (`disciplinesID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplines`
--

LOCK TABLES `disciplines` WRITE;
/*!40000 ALTER TABLE `disciplines` DISABLE KEYS */;
INSERT INTO `disciplines` VALUES (1,'physical'),(2,'math');
/*!40000 ALTER TABLE `disciplines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exams`
--

DROP TABLE IF EXISTS `exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exams` (
  `examsID` int(11) NOT NULL AUTO_INCREMENT,
  `quizID` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `points` float DEFAULT NULL,
  PRIMARY KEY (`examsID`),
  KEY `fkex1_idx` (`quizID`),
  KEY `fkex2_idx` (`userID`),
  CONSTRAINT `fkex1` FOREIGN KEY (`quizID`) REFERENCES `quiz` (`quizID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkex2` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exams`
--

LOCK TABLES `exams` WRITE;
/*!40000 ALTER TABLE `exams` DISABLE KEYS */;
INSERT INTO `exams` VALUES (1,1,1,NULL),(2,4,4,NULL);
/*!40000 ALTER TABLE `exams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exams_details`
--

DROP TABLE IF EXISTS `exams_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exams_details` (
  `examsID` int(11) NOT NULL,
  `questionsID` int(11) NOT NULL,
  `answer` text,
  KEY `fk1_idx` (`examsID`),
  KEY `fke_d2_idx` (`questionsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exams_details`
--

LOCK TABLES `exams_details` WRITE;
/*!40000 ALTER TABLE `exams_details` DISABLE KEYS */;
INSERT INTO `exams_details` VALUES (1,1,'1/2 động năng'),(1,2,'100.000.000km/s'),(1,3,'2'),(1,1,'1/2 động năng'),(1,2,'100.000.000km/s'),(1,3,'2'),(1,1,'1/2 động năng'),(1,2,'100.000.000km/s'),(1,3,'2'),(1,1,'1/2 động năng'),(1,2,'100.000.000km/s'),(1,3,'2');
/*!40000 ALTER TABLE `exams_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `questionsID` int(11) NOT NULL AUTO_INCREMENT,
  `quizID` int(11) DEFAULT NULL,
  `content` text,
  `chooseA` text,
  `chooseB` text,
  `chooseC` text,
  `chooseD` text,
  `answer` text,
  PRIMARY KEY (`questionsID`),
  KEY `fkques1_idx` (`quizID`),
  CONSTRAINT `fkques1` FOREIGN KEY (`quizID`) REFERENCES `quiz` (`quizID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,1,'cơ năng bằng','1/2 động năng',' a asd asd asd asd asda sd asd asd asd asd asd asd asd asd asd á đá asd asda sda sdas','1/4 động năng asd a d a d ad ad a da d ad a da d ad a d ad ad a da d ad a d ad a d ad a da d a d ad ad ad ad da dâ ','1/5 động năng  ada ad ad ada da ad ad ad adad ','1/2 động năng ada đa ad ad aad ad ad ad  ad a sdas asd asd  ad asd asd asd asd asd asd a'),(2,1,'vận tốc ánh sáng bằng','100.000.000km/s','10.000.000km/s','1.000.000km/s','100.000km/s','100.000.000km/s'),(3,1,'1+1','2','3','4','5','2');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz` (
  `quizID` int(11) NOT NULL AUTO_INCREMENT,
  `disciplinesID` int(11) DEFAULT NULL,
  `content` text,
  `active` bit(1) DEFAULT NULL,
  `isview` bit(1) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `total_ques` int(11) DEFAULT NULL,
  PRIMARY KEY (`quizID`),
  KEY `fkquiz1_idx` (`disciplinesID`),
  CONSTRAINT `fkquiz1` FOREIGN KEY (`disciplinesID`) REFERENCES `disciplines` (`disciplinesID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
INSERT INTO `quiz` VALUES (1,1,'thi giữa kỳ ','','',45,10),(4,1,'kiểm tra 15 phút','','',15,10);
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `roleID` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) DEFAULT NULL,
  `active` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin','true'),(2,'Staf','true');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `clssID` int(11) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `roleID` int(11) DEFAULT NULL,
  PRIMARY KEY (`userID`),
  KEY `fkus1_idx` (`clssID`),
  KEY `fkus2_idx` (`roleID`),
  CONSTRAINT `fkus1` FOREIGN KEY (`clssID`) REFERENCES `clss` (`clssID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkus2` FOREIGN KEY (`roleID`) REFERENCES `role` (`roleID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'trongtan','123','Nguyen trong','tan',NULL,3,'',1),(2,'trongtan1','123','trongtan','asdad','1991-01-01',3,'',1),(4,'truonggian','123','nguyentruong giang','123','1991-11-11',3,'',NULL),(5,'truonggian','123','nguyentruong giang','123','1991-11-11',3,'',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-19 10:25:44
