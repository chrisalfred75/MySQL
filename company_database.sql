-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: company_database
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `Branch_ID` int NOT NULL,
  `Brach_Name` varchar(40) DEFAULT NULL,
  `MGR_ID` int DEFAULT NULL,
  PRIMARY KEY (`Branch_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'CORPORATE',100),(2,'SCRANTON',102),(3,'STAMFORD',106);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_supplier`
--

DROP TABLE IF EXISTS `branch_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch_supplier` (
  `Branch_ID` int NOT NULL,
  `Supplier_Name` varchar(40) NOT NULL,
  `Supply_Type` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Branch_ID`,`Supplier_Name`),
  CONSTRAINT `branch_supplier_ibfk_1` FOREIGN KEY (`Branch_ID`) REFERENCES `branch` (`Branch_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_supplier`
--

LOCK TABLES `branch_supplier` WRITE;
/*!40000 ALTER TABLE `branch_supplier` DISABLE KEYS */;
INSERT INTO `branch_supplier` VALUES (2,'Hammer Mill','Paper'),(2,'J.T Forms','Custom Forms'),(2,'Uni Ball','Pen'),(3,'Hammer Mill','Paper'),(3,'Patriot Paper','Paper'),(3,'Stamford Forms','Custom Forms'),(3,'Uni Ball','Pen');
/*!40000 ALTER TABLE `branch_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `client_ID` int NOT NULL,
  `Client_Name` varchar(40) DEFAULT NULL,
  `Branch_ID` int DEFAULT NULL,
  PRIMARY KEY (`client_ID`),
  KEY `Branch_ID` (`Branch_ID`),
  CONSTRAINT `client_ibfk_1` FOREIGN KEY (`Branch_ID`) REFERENCES `branch` (`Branch_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `Employee_ID` int NOT NULL,
  `First_Name` varchar(40) DEFAULT NULL,
  `Last_Name` varchar(40) DEFAULT NULL,
  `Birthday` date DEFAULT NULL,
  `Sex` varchar(10) DEFAULT NULL,
  `Salary` int DEFAULT NULL,
  `Super_ID` int DEFAULT NULL,
  `Branch_ID` int DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`),
  KEY `Branch_ID` (`Branch_ID`),
  KEY `Super_ID` (`Super_ID`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`Branch_ID`) REFERENCES `branch` (`Branch_ID`) ON DELETE SET NULL,
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`Super_ID`) REFERENCES `employee` (`Employee_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (100,'David','Wallace','1997-11-17','M',250000,NULL,1),(101,'Jan','Levinson','1961-01-11','F',110000,100,1),(102,'Micheal','Scott','1972-03-21','M',75000,100,2),(103,'Angela','Martin','1982-04-01','F',63000,102,2),(104,'Kelly','Kapoor','1980-02-07','F',55000,102,2),(105,'Stanley','Hudson','1962-06-15','M',69000,102,2),(106,'Josh','Peter','1976-05-07','M',78000,100,3),(107,'Andy','Bernard','1982-07-07','M',62000,106,3),(108,'Jim','Halpert','1978-09-12','M',70000,106,3);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works_with`
--

DROP TABLE IF EXISTS `works_with`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works_with` (
  `Employee_ID` int NOT NULL,
  `Client_ID` int NOT NULL,
  `Total_Sales` int DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`,`Client_ID`),
  KEY `Client_ID` (`Client_ID`),
  CONSTRAINT `works_with_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`) ON DELETE CASCADE,
  CONSTRAINT `works_with_ibfk_2` FOREIGN KEY (`Client_ID`) REFERENCES `client` (`client_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_with`
--

LOCK TABLES `works_with` WRITE;
/*!40000 ALTER TABLE `works_with` DISABLE KEYS */;
INSERT INTO `works_with` VALUES (102,401,2655000),(102,406,86000),(105,400,55000),(105,403,5000),(105,406,186000),(107,403,45000),(107,405,56000),(108,402,325000),(108,404,55000);
/*!40000 ALTER TABLE `works_with` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-18 20:18:44
