-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: empresa
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `Departamentos`
--

DROP TABLE IF EXISTS `Departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Departamentos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Departamentos`
--

LOCK TABLES `Departamentos` WRITE;
/*!40000 ALTER TABLE `Departamentos` DISABLE KEYS */;
INSERT INTO `Departamentos` VALUES (1,'Departamento 1'),(2,'Departamento 2'),(3,'Departamento 3'),(6,'\"Departamento PROCDURE\"'),(7,'\"Departamento PROCDURE\"'),(8,'\"Departamento PROCDURE1\"');
/*!40000 ALTER TABLE `Departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Funcionarios`
--

DROP TABLE IF EXISTS `Funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Funcionarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `rg` varchar(20) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `sexo` varchar(20) NOT NULL,
  `data_nascimento` date NOT NULL,
  `habilitacao` tinyint NOT NULL DEFAULT '0',
  `salario` double NOT NULL DEFAULT '0',
  `carga_horaria_semanal` int NOT NULL DEFAULT '40',
  `func_departamento` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `func_departamento` (`func_departamento`),
  CONSTRAINT `Funcionarios_ibfk_1` FOREIGN KEY (`func_departamento`) REFERENCES `Departamentos` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `Funcionarios_ibfk_2` FOREIGN KEY (`func_departamento`) REFERENCES `Departamentos` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Funcionarios`
--

LOCK TABLES `Funcionarios` WRITE;
/*!40000 ALTER TABLE `Funcionarios` DISABLE KEYS */;
INSERT INTO `Funcionarios` VALUES (1,'Funcionario 1','12345678910','12345678','61123456789','Masculino','2023-04-17',1,500,40,1),(2,'Funcionario 2','12345678911','12346579','61123456789','Feminino','2023-04-17',0,550,40,2),(3,'\"João Silva 123\"','\"123.456.789-00\"','\"12.345.678-9\"','\"(11) 99999-9999\"','\"Masculino\"','1990-01-01',1,3000,40,1);
/*!40000 ALTER TABLE `Funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ParticipacaoProjeto`
--

DROP TABLE IF EXISTS `ParticipacaoProjeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ParticipacaoProjeto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `carga_horaria` int NOT NULL,
  `funcionario_id` int NOT NULL,
  `projeto_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `funcionario_id` (`funcionario_id`),
  KEY `projeto_id` (`projeto_id`),
  CONSTRAINT `ParticipacaoProjeto_ibfk_1` FOREIGN KEY (`funcionario_id`) REFERENCES `Funcionarios` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `ParticipacaoProjeto_ibfk_2` FOREIGN KEY (`projeto_id`) REFERENCES `Projetos` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ParticipacaoProjeto`
--

LOCK TABLES `ParticipacaoProjeto` WRITE;
/*!40000 ALTER TABLE `ParticipacaoProjeto` DISABLE KEYS */;
INSERT INTO `ParticipacaoProjeto` VALUES (1,5,1,1),(2,10,2,1);
/*!40000 ALTER TABLE `ParticipacaoProjeto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Projetos`
--

DROP TABLE IF EXISTS `Projetos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Projetos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `horas_necessarias` int NOT NULL,
  `prazo_estimado` date NOT NULL,
  `horas_realizadas` int NOT NULL,
  `ultima_atualizacao` date NOT NULL,
  `projeto_departamento` int NOT NULL,
  `projeto_supervisor` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projeto_supervisor` (`projeto_supervisor`),
  KEY `projeto_departamento` (`projeto_departamento`),
  CONSTRAINT `Projetos_ibfk_1` FOREIGN KEY (`projeto_departamento`) REFERENCES `Departamentos` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `Projetos_ibfk_2` FOREIGN KEY (`projeto_supervisor`) REFERENCES `Funcionarios` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `Projetos_ibfk_3` FOREIGN KEY (`projeto_departamento`) REFERENCES `Departamentos` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Projetos`
--

LOCK TABLES `Projetos` WRITE;
/*!40000 ALTER TABLE `Projetos` DISABLE KEYS */;
INSERT INTO `Projetos` VALUES (1,'Projeto 1',30,'2023-05-17',2,'2023-04-17',1,1),(2,'Projeto 2',50,'2023-06-17',15,'2023-04-17',2,1);
/*!40000 ALTER TABLE `Projetos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supervisao`
--

DROP TABLE IF EXISTS `Supervisao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Supervisao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `carga_horaria` int NOT NULL,
  `funcionario_id` int NOT NULL,
  `projeto_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `funcionario_id` (`funcionario_id`),
  KEY `projeto_id` (`projeto_id`),
  CONSTRAINT `Supervisao_ibfk_1` FOREIGN KEY (`funcionario_id`) REFERENCES `Funcionarios` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `Supervisao_ibfk_2` FOREIGN KEY (`projeto_id`) REFERENCES `Projetos` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supervisao`
--

LOCK TABLES `Supervisao` WRITE;
/*!40000 ALTER TABLE `Supervisao` DISABLE KEYS */;
INSERT INTO `Supervisao` VALUES (1,5,1,1),(2,10,2,2);
/*!40000 ALTER TABLE `Supervisao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-18  0:58:13
