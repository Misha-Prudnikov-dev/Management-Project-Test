-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: mng2
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `databasechangelog`
--

DROP TABLE IF EXISTS `databasechangelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `databasechangelog` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `databasechangelog`
--

LOCK TABLES `databasechangelog` WRITE;
/*!40000 ALTER TABLE `databasechangelog` DISABLE KEYS */;
INSERT INTO `databasechangelog` VALUES ('1.0.0','Misha.Prudnikov','liquibase/db.changelog-1.0.xml','2024-01-19 18:27:21',1,'EXECUTED','8:3962d41ef3226b6e3ce83d32b2100334','createTable tableName=users','',NULL,'4.17.2',NULL,NULL,'5678041670'),('1.0.1','Misha.Prudnikov','liquibase/db.changelog-1.0.xml','2024-01-19 18:27:21',2,'EXECUTED','8:95eb215c69098b776638453851d488cb','createTable tableName=roles','',NULL,'4.17.2',NULL,NULL,'5678041670'),('1.0.2','Misha.Prudnikov','liquibase/db.changelog-1.0.xml','2024-01-19 18:27:21',3,'EXECUTED','8:3d3633cc36543137b4488d42ead53d14','createTable tableName=roles_has_users','',NULL,'4.17.2',NULL,NULL,'5678041670'),('1.0.3','Misha.Prudnikov','liquibase/db.changelog-1.0.xml','2024-01-19 18:27:21',4,'EXECUTED','8:9f6ebb74b5b7744e87d36112ee938eda','addForeignKeyConstraint baseTableName=roles_has_users, constraintName=fk_roles_has_users_roles, referencedTableName=roles','',NULL,'4.17.2',NULL,NULL,'5678041670'),('1.0.4','Misha.Prudnikov','liquibase/db.changelog-1.0.xml','2024-01-19 18:27:21',5,'EXECUTED','8:0e5800b290e2e1db59fd0469af331918','addForeignKeyConstraint baseTableName=roles_has_users, constraintName=fk_roles_has_users_users, referencedTableName=users','',NULL,'4.17.2',NULL,NULL,'5678041670'),('1.0.5','Misha.Prudnikov','liquibase/db.changelog-1.0.xml','2024-01-19 18:27:21',6,'EXECUTED','8:c4154d5502d971f2d4c10a45ac887a5c','insert tableName=roles; insert tableName=roles; insert tableName=roles; insert tableName=roles; insert tableName=users; insert tableName=roles_has_users','',NULL,'4.17.2',NULL,NULL,'5678041670');
/*!40000 ALTER TABLE `databasechangelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `databasechangeloglock`
--

DROP TABLE IF EXISTS `databasechangeloglock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `databasechangeloglock` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `databasechangeloglock`
--

LOCK TABLES `databasechangeloglock` WRITE;
/*!40000 ALTER TABLE `databasechangeloglock` DISABLE KEYS */;
INSERT INTO `databasechangeloglock` VALUES (1,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `databasechangeloglock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id_roles` bigint NOT NULL AUTO_INCREMENT,
  `name_roles` varchar(100) NOT NULL,
  PRIMARY KEY (`id_roles`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrator'),(2,'Sale_User'),(3,'Customer_User'),(4,'Secure_API_User');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_has_users`
--

DROP TABLE IF EXISTS `roles_has_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_has_users` (
  `roles_id_roles` bigint DEFAULT NULL,
  `users_id_users` bigint DEFAULT NULL,
  KEY `fk_roles_has_users_roles` (`roles_id_roles`),
  KEY `fk_roles_has_users_users` (`users_id_users`),
  CONSTRAINT `fk_roles_has_users_roles` FOREIGN KEY (`roles_id_roles`) REFERENCES `roles` (`id_roles`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_roles_has_users_users` FOREIGN KEY (`users_id_users`) REFERENCES `users` (`id_users`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_has_users`
--

LOCK TABLES `roles_has_users` WRITE;
/*!40000 ALTER TABLE `roles_has_users` DISABLE KEYS */;
INSERT INTO `roles_has_users` VALUES (1,1);
/*!40000 ALTER TABLE `roles_has_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_users` bigint NOT NULL AUTO_INCREMENT,
  `name_users` varchar(20) DEFAULT NULL,
  `surname_users` varchar(40) DEFAULT NULL,
  `patronymic_users` varchar(40) DEFAULT NULL,
  `email_users` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_users`),
  UNIQUE KEY `name_users` (`name_users`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Alex','Alexson','Karpovich','alex@mail.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mng2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-24 15:45:44
