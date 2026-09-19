-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: healhub
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicine` (
  `medicine_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `company` varchar(100) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`medicine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES (1,'Paracetamol 500mg','Cipla','Used for fever and mild pain relief'),(2,'Ibuprofen 400mg','Sun Pharma','Pain reliever and anti-inflammatory'),(3,'Amoxicillin 250mg','Mankind','Antibiotic for bacterial infections'),(4,'Azithromycin 500mg','Pfizer','Used for respiratory infections'),(5,'Cetirizine 10mg','Zydus','Anti-allergy medication'),(6,'Metformin 500mg','Ranbaxy','Used for type 2 diabetes'),(7,'Aspirin 75mg','Bayer','Blood thinner and pain reliever'),(8,'Pantoprazole 40mg','Dr Reddy','Acidity and GERD treatment'),(9,'Omeprazole 20mg','Lupin','Reduces stomach acid'),(10,'Losartan 50mg','Torrent Pharma','Treats high blood pressure'),(11,'Atorvastatin 10mg','Sun Pharma','Lowers cholesterol'),(12,'Clopidogrel 75mg','Cipla','Prevents blood clots'),(13,'Dolo 650','Micro Labs','Fever and body pain relief'),(14,'Disprin','Reckitt','Pain relief and fever reducer'),(15,'Crocin Advance','GSK','Fast pain relief'),(16,'Augmentin 625','GSK','Antibiotic combination'),(17,'Calpol 500','GSK','Paracetamol for fever'),(18,'Flexon','Aristo Pharma','Pain relief for muscles'),(19,'Zerodol SP','Ipca Labs','Pain and swelling reducer'),(20,'Volini Gel','Sun Pharma','Topical pain relief'),(21,'Digene Tablets','Abbott','Acidity and indigestion'),(22,'ORS Sachet','Electral','Prevents dehydration'),(23,'Loperamide','Janssen','Treats diarrhea'),(24,'Domperidone','Cipla','Controls nausea and vomiting'),(25,'Ondansetron','Sun Pharma','Anti-nausea medication'),(26,'Levocetirizine','Mankind','Allergy relief'),(27,'Montelukast','Lupin','Asthma and allergy control'),(28,'Salbutamol Inhaler','Cipla','Asthma relief inhaler'),(29,'Insulin Injection','Novo Nordisk','Diabetes management'),(30,'Thyroxine 50mcg','Abbott','Thyroid hormone supplement'),(31,'Vitamin C Tablets','Himalaya','Boosts immunity'),(32,'Vitamin D3 Capsules','Zydus','Bone health supplement'),(33,'B-Complex Tablets','Cipla','Vitamin deficiency treatment'),(34,'Calcium Tablets','Shelcal','Bone strength supplement'),(35,'Iron Tablets','Dexorange','Treats anemia'),(36,'Folic Acid','Cipla','Prevents folate deficiency'),(37,'Eno Powder','GSK','Quick relief from acidity'),(38,'Gelusil Syrup','Pfizer','Antacid syrup'),(39,'Benadryl Syrup','Johnson & Johnson','Cough relief'),(40,'Ascoril Syrup','Glenmark','Cough and cold treatment'),(41,'Corex Syrup','Pfizer','Cough suppressant'),(42,'Sinarest Tablets','Centaur Pharma','Cold and flu relief'),(43,'Combiflam','Sanofi','Pain and inflammation relief'),(44,'Brufen 600','Abbott','Strong pain reliever'),(45,'Norflox 400','Cipla','Antibiotic for infections'),(46,'Ofloxacin 200','Ranbaxy','Bacterial infection treatment'),(47,'Cefixime 200','Lupin','Antibiotic'),(48,'Levofloxacin 500','Cipla','Broad spectrum antibiotic'),(49,'Doxycycline 100','Pfizer','Antibiotic for infections'),(50,'Rantac 150','J B Chemicals','Reduces stomach acid');
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy`
--

DROP TABLE IF EXISTS `pharmacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacy` (
  `pharmacy_id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int NOT NULL,
  `pname` varchar(100) NOT NULL,
  `oname` varchar(100) NOT NULL,
  `address` text,
  `contact` varchar(15) DEFAULT NULL,
  `city` varchar(50) DEFAULT 'Indore',
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pharmacy_id`),
  KEY `owner_id` (`owner_id`),
  CONSTRAINT `pharmacy_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy`
--

LOCK TABLES `pharmacy` WRITE;
/*!40000 ALTER TABLE `pharmacy` DISABLE KEYS */;
INSERT INTO `pharmacy` VALUES ();
/*!40000 ALTER TABLE `pharmacy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `stock_id` int NOT NULL AUTO_INCREMENT,
  `pharmacy_id` int NOT NULL,
  `medicine_id` int NOT NULL,
  `quantity` int DEFAULT '0',
  `last_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`stock_id`),
  KEY `pharmacy_id` (`pharmacy_id`),
  KEY `medicine_id` (`medicine_id`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacy` (`pharmacy_id`),
  CONSTRAINT `stock_ibfk_2` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`medicine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES ();
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) DEFAULT 'USER',
  `status` varchar(20) DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ();
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-26 16:02:24
