-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: meraki2.0
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `acessibilidade`
--

DROP TABLE IF EXISTS `acessibilidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acessibilidade` (
  `acessibilidade` enum('Não acessível','Parcialmente acessível','Totalmente acessível') NOT NULL,
  PRIMARY KEY (`acessibilidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acessibilidade`
--

LOCK TABLES `acessibilidade` WRITE;
/*!40000 ALTER TABLE `acessibilidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `acessibilidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acessibilidade_espaco`
--

DROP TABLE IF EXISTS `acessibilidade_espaco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acessibilidade_espaco` (
  `acessibilidade_acessibilidade` enum('Não acessível','Parcialmente acessível','Totalmente acessível') NOT NULL,
  `espaco_idespaco` int NOT NULL,
  PRIMARY KEY (`acessibilidade_acessibilidade`,`espaco_idespaco`),
  KEY `fk_acessibilidade_has_espaco_espaco1_idx` (`espaco_idespaco`),
  KEY `fk_acessibilidade_has_espaco_acessibilidade1_idx` (`acessibilidade_acessibilidade`),
  CONSTRAINT `fk_acessibilidade_has_espaco_acessibilidade1` FOREIGN KEY (`acessibilidade_acessibilidade`) REFERENCES `acessibilidade` (`acessibilidade`),
  CONSTRAINT `fk_acessibilidade_has_espaco_espaco1` FOREIGN KEY (`espaco_idespaco`) REFERENCES `espaco` (`idespaco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acessibilidade_espaco`
--

LOCK TABLES `acessibilidade_espaco` WRITE;
/*!40000 ALTER TABLE `acessibilidade_espaco` DISABLE KEYS */;
/*!40000 ALTER TABLE `acessibilidade_espaco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `categoria` enum('Físicas','Artísticas','Intelectuais','Práticas','Sociais') NOT NULL,
  PRIMARY KEY (`categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_espaco`
--

DROP TABLE IF EXISTS `categoria_espaco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_espaco` (
  `categoria_categoria` enum('Físicas','Artísticas','Intelectuais','Práticas','Sociais') NOT NULL,
  `espaco_idespaco` int NOT NULL,
  PRIMARY KEY (`categoria_categoria`,`espaco_idespaco`),
  KEY `fk_categoria_has_espaco_espaco1_idx` (`espaco_idespaco`),
  KEY `fk_categoria_has_espaco_categoria1_idx` (`categoria_categoria`),
  CONSTRAINT `fk_categoria_has_espaco_categoria1` FOREIGN KEY (`categoria_categoria`) REFERENCES `categoria` (`categoria`),
  CONSTRAINT `fk_categoria_has_espaco_espaco1` FOREIGN KEY (`espaco_idespaco`) REFERENCES `espaco` (`idespaco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_espaco`
--

LOCK TABLES `categoria_espaco` WRITE;
/*!40000 ALTER TABLE `categoria_espaco` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria_espaco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `espaco`
--

DROP TABLE IF EXISTS `espaco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `espaco` (
  `idespaco` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `faixa_etaria` varchar(30) DEFAULT NULL,
  `horario_de_funcionamento` varchar(100) DEFAULT NULL,
  `acessibilidade` text,
  `forma_pagamento` varchar(50) DEFAULT NULL,
  `tipo_atividade` varchar(255) DEFAULT NULL,
  `link_contato` varchar(255) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `descricao` mediumtext,
  `foto_adicional` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`idespaco`),
  KEY `fk_espaco_usuario_adm1_idx` (`email`),
  CONSTRAINT `fk_espaco_usuario_adm1` FOREIGN KEY (`email`) REFERENCES `usuario_adm` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `espaco`
--

LOCK TABLES `espaco` WRITE;
/*!40000 ALTER TABLE `espaco` DISABLE KEYS */;
/*!40000 ALTER TABLE `espaco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faixa_etaria`
--

DROP TABLE IF EXISTS `faixa_etaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faixa_etaria` (
  `faixa_etaria` enum('Depende da atividade','A partir de 0 anos','A partir de 3 anos','A partir de 6 anos','A partir de 8 anos','A partir de 10 anos','Livre') NOT NULL,
  PRIMARY KEY (`faixa_etaria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faixa_etaria`
--

LOCK TABLES `faixa_etaria` WRITE;
/*!40000 ALTER TABLE `faixa_etaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `faixa_etaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faixa_etaria_espaco`
--

DROP TABLE IF EXISTS `faixa_etaria_espaco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faixa_etaria_espaco` (
  `faixa_etaria_faixa_etaria` enum('Depende da atividade','A partir de 0 anos','A partir de 3 anos','A partir de 6 anos','A partir de 8 anos','A partir de 10 anos','Livre') NOT NULL,
  `espaco_idespaco` int NOT NULL,
  PRIMARY KEY (`faixa_etaria_faixa_etaria`,`espaco_idespaco`),
  KEY `fk_faixa_etaria_has_espaco_espaco1_idx` (`espaco_idespaco`),
  KEY `fk_faixa_etaria_has_espaco_faixa_etaria1_idx` (`faixa_etaria_faixa_etaria`),
  CONSTRAINT `fk_faixa_etaria_has_espaco_espaco1` FOREIGN KEY (`espaco_idespaco`) REFERENCES `espaco` (`idespaco`),
  CONSTRAINT `fk_faixa_etaria_has_espaco_faixa_etaria1` FOREIGN KEY (`faixa_etaria_faixa_etaria`) REFERENCES `faixa_etaria` (`faixa_etaria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faixa_etaria_espaco`
--

LOCK TABLES `faixa_etaria_espaco` WRITE;
/*!40000 ALTER TABLE `faixa_etaria_espaco` DISABLE KEYS */;
/*!40000 ALTER TABLE `faixa_etaria_espaco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favoritos`
--

DROP TABLE IF EXISTS `favoritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favoritos` (
  `usuario_normal_email` varchar(100) NOT NULL,
  `espaco_idespaco` int NOT NULL,
  PRIMARY KEY (`usuario_normal_email`,`espaco_idespaco`),
  KEY `fk_usuario_normal_has_espaco_espaco1_idx` (`espaco_idespaco`),
  KEY `fk_usuario_normal_has_espaco_usuario_normal1_idx` (`usuario_normal_email`),
  CONSTRAINT `fk_usuario_normal_has_espaco_espaco1` FOREIGN KEY (`espaco_idespaco`) REFERENCES `espaco` (`idespaco`),
  CONSTRAINT `fk_usuario_normal_has_espaco_usuario_normal1` FOREIGN KEY (`usuario_normal_email`) REFERENCES `usuario_normal` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoritos`
--

LOCK TABLES `favoritos` WRITE;
/*!40000 ALTER TABLE `favoritos` DISABLE KEYS */;
/*!40000 ALTER TABLE `favoritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_pagamento`
--

DROP TABLE IF EXISTS `forma_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma_pagamento` (
  `forma_pagamento` enum('Gratuito','Pago','Sem informacao') NOT NULL,
  PRIMARY KEY (`forma_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pagamento`
--

LOCK TABLES `forma_pagamento` WRITE;
/*!40000 ALTER TABLE `forma_pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `forma_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_pagamento_espaco`
--

DROP TABLE IF EXISTS `forma_pagamento_espaco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma_pagamento_espaco` (
  `forma_pagamento_forma_pagamento` enum('Gratuito','Pago','Sem informacao') NOT NULL,
  `espaco_idespaco` int NOT NULL,
  PRIMARY KEY (`forma_pagamento_forma_pagamento`,`espaco_idespaco`),
  KEY `fk_forma_pagamento_has_espaco_espaco1_idx` (`espaco_idespaco`),
  KEY `fk_forma_pagamento_has_espaco_forma_pagamento1_idx` (`forma_pagamento_forma_pagamento`),
  CONSTRAINT `fk_forma_pagamento_has_espaco_espaco1` FOREIGN KEY (`espaco_idespaco`) REFERENCES `espaco` (`idespaco`),
  CONSTRAINT `fk_forma_pagamento_has_espaco_forma_pagamento1` FOREIGN KEY (`forma_pagamento_forma_pagamento`) REFERENCES `forma_pagamento` (`forma_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pagamento_espaco`
--

LOCK TABLES `forma_pagamento_espaco` WRITE;
/*!40000 ALTER TABLE `forma_pagamento_espaco` DISABLE KEYS */;
/*!40000 ALTER TABLE `forma_pagamento_espaco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario_funcionamento`
--

DROP TABLE IF EXISTS `horario_funcionamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario_funcionamento` (
  `dia` varchar(15) NOT NULL,
  `hora_abertura` time NOT NULL,
  `hora_fechamento` time NOT NULL,
  `espaco_idespaco` int NOT NULL,
  PRIMARY KEY (`dia`,`espaco_idespaco`),
  KEY `fk_horario_funcionamento_espaco1_idx` (`espaco_idespaco`),
  CONSTRAINT `fk_horario_funcionamento_espaco1` FOREIGN KEY (`espaco_idespaco`) REFERENCES `espaco` (`idespaco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario_funcionamento`
--

LOCK TABLES `horario_funcionamento` WRITE;
/*!40000 ALTER TABLE `horario_funcionamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `horario_funcionamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_adm`
--

DROP TABLE IF EXISTS `usuario_adm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_adm` (
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `fk_usuario_adm_usuarios1` FOREIGN KEY (`email`) REFERENCES `usuarios` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_adm`
--

LOCK TABLES `usuario_adm` WRITE;
/*!40000 ALTER TABLE `usuario_adm` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_adm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_normal`
--

DROP TABLE IF EXISTS `usuario_normal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_normal` (
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `fk_usuario_normal_usuarios1` FOREIGN KEY (`email`) REFERENCES `usuarios` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_normal`
--

LOCK TABLES `usuario_normal` WRITE;
/*!40000 ALTER TABLE `usuario_normal` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_normal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `email` varchar(100) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `senha_hash` varchar(255) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-08 14:32:53
