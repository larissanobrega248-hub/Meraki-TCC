CREATE DATABASE  IF NOT EXISTS `meraki` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `meraki`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: meraki
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
  `acessibilidade` enum('Deficiência física','Deficiência auditiva','Deficiência visual','Deficiência intelectual','TEA','Não possui acessibilidade') NOT NULL,
  PRIMARY KEY (`acessibilidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acessibilidade`
--

LOCK TABLES `acessibilidade` WRITE;
/*!40000 ALTER TABLE `acessibilidade` DISABLE KEYS */;
INSERT INTO `acessibilidade` VALUES ('Deficiência física'),('Deficiência auditiva'),('Deficiência visual'),('Deficiência intelectual'),('TEA'),('Não possui acessibilidade');
/*!40000 ALTER TABLE `acessibilidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acessibilidade_espaco`
--

DROP TABLE IF EXISTS `acessibilidade_espaco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acessibilidade_espaco` (
  `acessibilidade` enum('Deficiência física','Deficiência auditiva','Deficiência visual','Deficiência intelectual','TEA','Não possui acessibilidade') NOT NULL,
  `idespaco` int NOT NULL,
  PRIMARY KEY (`acessibilidade`,`idespaco`),
  KEY `fk_acessibilidade_has_espaco_espaco1_idx` (`idespaco`),
  KEY `fk_acessibilidade_has_espaco_acessibilidade1_idx` (`acessibilidade`),
  CONSTRAINT `fk_acessibilidade_has_espaco_acessibilidade1` FOREIGN KEY (`acessibilidade`) REFERENCES `acessibilidade` (`acessibilidade`),
  CONSTRAINT `fk_acessibilidade_has_espaco_espaco1` FOREIGN KEY (`idespaco`) REFERENCES `espaco` (`idespaco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acessibilidade_espaco`
--

LOCK TABLES `acessibilidade_espaco` WRITE;
/*!40000 ALTER TABLE `acessibilidade_espaco` DISABLE KEYS */;
INSERT INTO `acessibilidade_espaco` VALUES ('Deficiência física',1),('Deficiência física',2),('Deficiência física',3),('Deficiência física',4),('Deficiência física',5),('Deficiência física',6),('Deficiência física',7),('Deficiência física',8),('Deficiência física',9),('Deficiência física',10),('Deficiência física',11),('Deficiência física',12),('Deficiência física',13),('Deficiência física',14),('Deficiência física',15),('Deficiência física',16),('Deficiência física',17),('Deficiência física',18),('Deficiência física',19),('Deficiência física',21),('Deficiência física',23),('Deficiência física',24),('Deficiência física',25),('Deficiência física',27),('Deficiência física',28),('Deficiência física',29),('Deficiência física',30),('Deficiência física',31),('Deficiência física',33),('Deficiência visual',1),('Deficiência visual',2),('Deficiência visual',14),('Deficiência visual',15),('Deficiência visual',17),('Deficiência intelectual',13),('Deficiência intelectual',14),('Deficiência intelectual',15),('Deficiência intelectual',17),('TEA',1),('TEA',2),('TEA',14),('TEA',15),('TEA',17),('TEA',31),('Não possui acessibilidade',20),('Não possui acessibilidade',22),('Não possui acessibilidade',26),('Não possui acessibilidade',32);
/*!40000 ALTER TABLE `acessibilidade_espaco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `categoria` enum('Físicas','Artísticas','Intelectuais','Manuais','Sociais') NOT NULL,
  PRIMARY KEY (`categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES ('Físicas'),('Artísticas'),('Intelectuais'),('Manuais'),('Sociais');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_espaco`
--

DROP TABLE IF EXISTS `categoria_espaco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_espaco` (
  `idespaco` int NOT NULL,
  `categoria` enum('Físicas','Artísticas','Intelectuais','Manuais','Sociais') NOT NULL,
  PRIMARY KEY (`idespaco`,`categoria`),
  KEY `fk_categoria_has_espaco_espaco1_idx` (`idespaco`),
  KEY `fk_categoria_has_espaco_categoria1_idx` (`categoria`),
  CONSTRAINT `fk_categoria_has_espaco_categoria1` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`categoria`),
  CONSTRAINT `fk_categoria_has_espaco_espaco1` FOREIGN KEY (`idespaco`) REFERENCES `espaco` (`idespaco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_espaco`
--

LOCK TABLES `categoria_espaco` WRITE;
/*!40000 ALTER TABLE `categoria_espaco` DISABLE KEYS */;
INSERT INTO `categoria_espaco` VALUES (1,'Físicas'),(2,'Físicas'),(3,'Físicas'),(4,'Físicas'),(5,'Físicas'),(6,'Físicas'),(7,'Físicas'),(8,'Físicas'),(9,'Físicas'),(11,'Físicas'),(12,'Físicas'),(14,'Físicas'),(15,'Físicas'),(16,'Físicas'),(17,'Físicas'),(18,'Físicas'),(19,'Físicas'),(20,'Físicas'),(21,'Físicas'),(22,'Físicas'),(23,'Físicas'),(29,'Físicas'),(14,'Artísticas'),(15,'Artísticas'),(16,'Artísticas'),(29,'Artísticas'),(30,'Artísticas'),(31,'Artísticas'),(32,'Artísticas'),(13,'Intelectuais'),(14,'Intelectuais'),(18,'Intelectuais'),(19,'Intelectuais'),(22,'Intelectuais'),(23,'Intelectuais'),(30,'Intelectuais'),(31,'Intelectuais'),(32,'Intelectuais'),(14,'Manuais'),(22,'Manuais'),(23,'Manuais'),(30,'Manuais'),(31,'Manuais'),(32,'Manuais'),(33,'Manuais'),(1,'Sociais'),(2,'Sociais'),(3,'Sociais'),(4,'Sociais'),(5,'Sociais'),(6,'Sociais'),(7,'Sociais'),(8,'Sociais'),(9,'Sociais'),(10,'Sociais'),(11,'Sociais'),(12,'Sociais'),(13,'Sociais'),(14,'Sociais'),(15,'Sociais'),(16,'Sociais'),(17,'Sociais'),(18,'Sociais'),(19,'Sociais'),(20,'Sociais'),(21,'Sociais'),(22,'Sociais'),(23,'Sociais'),(24,'Sociais'),(25,'Sociais'),(26,'Sociais'),(27,'Sociais'),(29,'Sociais');
/*!40000 ALTER TABLE `categoria_espaco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipamento`
--

DROP TABLE IF EXISTS `equipamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipamento` (
  `equipamento` enum('Playground','Aulas de culinaria','Aulas ou atividades esportivas','Bibliotecas','Aulas ou atividades artisticas','Grupos escoteiros') NOT NULL,
  PRIMARY KEY (`equipamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipamento`
--

LOCK TABLES `equipamento` WRITE;
/*!40000 ALTER TABLE `equipamento` DISABLE KEYS */;
INSERT INTO `equipamento` VALUES ('Playground'),('Aulas de culinaria'),('Aulas ou atividades esportivas'),('Bibliotecas'),('Aulas ou atividades artisticas'),('Grupos escoteiros');
/*!40000 ALTER TABLE `equipamento` ENABLE KEYS */;
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
  `tipo_atividade` varchar(120) DEFAULT NULL,
  `link_contato` varchar(255) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `descricao` mediumtext,
  `foto_adicional` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`idespaco`),
  KEY `fk_espaco_usuario_adm1_idx` (`email`),
  CONSTRAINT `fk_espaco_usuario_adm1` FOREIGN KEY (`email`) REFERENCES `usuario_adm` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `espaco`
--

LOCK TABLES `espaco` WRITE;
/*!40000 ALTER TABLE `espaco` DISABLE KEYS */;
INSERT INTO `espaco` VALUES (1,'Bosque Municipal de Pinhais','assets/img/1.jpg','Rua 24 de Maio, s/n - Centro, Pinhais - PR, 83323-060','Até 12 anos (playground)','Todos os dias das 06:00 - 21:00','Entrada com acessibilidade para pessoas em cadeira de rodas\r, Estacionamento com acessibilidade para pessoas em cadeira de rodas','Gratuito','Este bosque disponibiliza um playground, de trilhas e áreas de piquenique.','pinhais.pr.gov.br',NULL,'O bosque oferece diversas opções de lazer para crianças, incluindo trilhas, playground, balanços e escorregadores. Também conta com trilhas voltadas ao público infantil, ciclofaixas e mesas para piquenique, proporcionando atividades ao ar livre para toda a família. O local possui banheiro público, estacionamento descoberto gratuito e permite a presença de cães, sendo uma opção adequada para passeios em família.','','admin@meraki.com.br'),(2,'Parque das Águas','assets/img/2.jpg','Rod. Dep. João Leopoldo Jacomel, 8682 - Parque das Aguas, Pinhais - PR, 83331-330','Entrada livre acompanhado','Todos os dias das 06:00 - 21:00','Entrada com acessibilidade para pessoas em cadeira de rodas, Estacionamento com acessibilidade para pessoas em cadeira de rodas','Gratuito','Este parque disponibiliza um playground, quadras, áreas de caminhada e ciclismo.','pinhais.pr.gov.br',NULL,'O parque é uma opção completa de lazer ao ar livre, oferecendo trilhas, playground, balanços e escorregadores para as crianças. Também conta com área para prática de skate, ciclofaixas e quadras de basquete, vôlei e tênis, além de espaço para piqueniques. Possui banheiro público e estacionamento descoberto gratuito. A presença de cães também é permitida, tornando o local uma alternativa para passeios em família.','','admin@meraki.com.br'),(3,'Espaço Boulevard Parque das Águas','assets/img/3.jpg','Estr. Ecológica de Pinhais, 12 - Parque das Aguas, Pinhais - PR, 83331-330','Até 12 anos','','Banheiro com acessibilidade para pessoas em cadeira de rodas, Entrada com acessibilidade para pessoas em cadeira de rodas, Estacionamento com acessibilidade para pessoas em cadeira de rodas','Gratuito','Este espaço disponibiliza o maior playground de Pinhais/PR.','pinhais.pr.gov.br',NULL,'O espaço é uma opção de lazer para crianças e famílias, contando com playground para recreação infantil. Também possui banheiro e quadra de tênis, oferecendo uma estrutura simples para momentos de diversão e atividades ao ar livre.',NULL,'admin@meraki.com.br'),(4,'Bosque Bordignon','assets/img/4.jpg','R. Enedina Irael da Rosa, S/n - Alto Tarumã, Pinhais - PR','Até 12 anos (playground)','Todos os dias das 06:00 - 21:00','Entrada com acessibilidade para pessoas em cadeira de rodas','Gratuito ','Este bosque disponibiliza um playground, de trilhas e áreas de piquenique.',NULL,'(41) 3912-5000','O bosque é uma ótima opção para passeios em família, oferecendo trilhas e atividades voltadas para crianças, como playground, balanços e escorregadores. Também conta com mesas para piquenique, proporcionando um ambiente agradável para momentos de lazer ao ar livre. O local possui banheiro público e permite a presença de cães.',NULL,'admin@meraki.com.br'),(5,'Parque Graciosa','assets/img/5.jpg','Alphaville Graciosa, Pinhais - PR','Até 12 anos (playground)','Ter a Dom das 07:00 - 19:00','Entrada com acessibilidade para pessoas em cadeira de rodas, Estacionamento com acessibilidade para pessoas em cadeira de rodas','Gratuito ','Este bosque disponibiliza um playground, de trilhas e áreas de piquenique.',NULL,NULL,'O parque é uma opção de lazer ao ar livre para toda a família, com trilhas e atividades voltadas para crianças. Conta com playground e balanços, além de áreas que podem ser aproveitadas para piqueniques. As trilhas para crianças tornam o passeio ainda mais atrativo, e a presença de cães é permitida no local.',NULL,'admin@meraki.com.br'),(6,'ParCão Pinhais','assets/img/6.jpg','Rod. Dep. João Leopoldo Jacomel, 15102 - Vila Taruma, Curitiba - PR, 82530-230','6 anos com supervisão','Aberto 24h','Entrada com acessibilidade para pessoas em cadeira de rodas, Estacionamento com acessibilidade para pessoas em cadeira de rodas ','Gratuito ','Este parque disponibiliza um playground canino, sendo indicado para familias com cachorros.',NULL,NULL,'O Parcão é um espaço voltado para o lazer e a convivência com animais de estimação. O local possui um parque canino, proporcionando um ambiente adequado para que os cães possam brincar e se exercitar.',NULL,'admin@meraki.com.br'),(7,'Parque Palmital Pinhais','assets/img/7.jpg','R. Estr. da Graciosa, 2013 - Atuba, Pinhais - PR, 83413-200','Entrada livre acompanhado','Aberto 24h ','Entrada com acessibilidade para pessoas em cadeira de rodas, Estacionamento com acessibilidade para pessoas em cadeira de rodas','Gratuito','Este parque disponibiliza trilhas e áreas para ciclismo.',NULL,NULL,'O parque oferece trilhas, sendo uma opção para atividades ao ar livre. É adequado para crianças e conta com trilhas voltadas para o público infantil.',NULL,'admin@meraki.com.br'),(8,'Bosque Pastor José de Jesus \'Bosque Jerivá\'','assets/img/8.jpg','R. Jacarezinho, 1686 - Alto Tarumã, Pinhais - PR, 83325-330','Entrada livre acompanhado','Todos os dias das 06:00 - 21:00','Entrada com acessibilidade para pessoas em cadeira de rodas, Estacionamento com acessibilidade para pessoas em cadeira de rodas','Gratuito','Este bosque disponibiliza um playground, de trilhas e áreas de piquenique.',NULL,NULL,'O bosque é uma opção para atividades ao ar livre, oferecendo trilhas e espaços para piqueniques. Conta com ciclofaixas e mesas para piquenique, além de playground. É adequado para crianças e possui trilhas voltadas ao público infantil.',NULL,'admin@meraki.com.br'),(9,'Panorâmico Parque Clube','assets/img/9.jpg','Av. Fabio Vicente de Moura, 2370 - Jardim das Nascentes, Pinhais - PR, 83328-200','Entrada livre acompanhado','Qui a Ter das 09:00 - 17:30','Banheiro com acessibilidade para pessoas em cadeira de rodas, Entrada com acessibilidade para pessoas em cadeira de rodas, Estacionamento com acessibilidade para pessoas em cadeira de rodas','R$ 80 por pessoa','Este parque aquático disponibiliza de um playground aquatico, de áreas para churrasco e outras atrações.','panoramico.com.br','(41) 3669-6266','O parque oferece shows ao vivo e opções de comida, sendo uma boa opção para um passeio em família. Conta com armários, banheiro, bar, restaurante e serviços para festas.',NULL,'admin@meraki.com.br'),(10,'Mundo da Lua','assets/img/10.jpg','Rod. Dep. João Leopoldo Jacomel, 12329 - Centro, Pinhais - PR, 83323-410','Entrada livre acompanhado','Todos os dias das 18:00 - 23:00','Assento com acessibilidade para pessoas em cadeira de rodas, Banheiro com acessibilidade para pessoas em cadeira de rodas, Entrada com acessibilidade para pessoas em cadeira de rodas, Estacionamento com acessibilidade para pessoas em cadeira de rodas','R$ 40-140 por pessoa','Este restaurante disponibiliza um playground, shows infantis e cardapio infantil.','restaurantemundodalua.com.br','(41) 98900-2120','O restaurante oferece refeições no local e serviço de entrega. Possui mesas na cobertura, ótimas sobremesas e ótimos coquetéis, sendo uma opção para almoço e jantar. O cardápio conta com café, opções veganas, porções pequenas, pratos para happy hour e opções de comida tarde da noite. Também dispõe de espaço privativo para eventos e serviço de garçons.',NULL,'admin@meraki.com.br'),(11,'Pista de Kart Pinhais KartGT','assets/img/11.jpg','R. Nova Esperança, 665 - Emiliano Perneta, Pinhais - PR, 83324-400','A partir de 6 anos','Ter a Sex das 15:30 - 18:30','Entrada com acessibilidade para pessoas em cadeira de rodas','15 min - R$80, 25min - R$ 100','Este espaço disponibiliza pistas de kart para corrida infantil, com diversas modalidades.','https://www.instagram.com/kartgtpinhais/','(41) 98425-8090','Pista de kart com opções para adultos e crianças. O kart infantil é indicado para crianças a partir de 6 anos e 1,20 m de altura, com corridas de 15 ou 25 minutos. As corridas infantis acontecem de terça a sexta, das 15h30 às 18h30. O local também oferece corridas especiais para pais e filhos, banheiro e pagamentos por cartão ou aproximação. Uma opção de lazer para famílias que buscam diversão e adrenalina.',NULL,'admin@meraki.com.br'),(12,'Gramado Boliche Bar','assets/img/12.jpg','Av. Camilo di Lellis, 25 - Centro, Pinhais - PR, 83323-000','A partir de 3 anos','Seg a Sex das 17:00 - 00:00, Sáb das 16:00 - 00:00, Dom das 16:00 - 23:00','Assento com acessibilidade para pessoas em cadeira de rodas, Banheiro com acessibilidade para pessoas em cadeira de rodas, Entrada com acessibilidade para pessoas em cadeira de rodas, Estacionamento com acessibilidade para pessoas em cadeira de rodas','Úteis 1h-$100 30m-$50 Sáb/Dom 1h-$140 30m-$70','Este espaço disponibiliza pistas de boliche.','https://gramadoboliche.com.br/','(41) 99924-1889','Em um ambiente animado, descontraído e festivo, o espaço oferece pistas profissionais de boliche, mesas de sinuca e uma área gastronômica completa, com destaque para as porções na chapa, hambúrgueres e drinks da casa. Conta com placares eletrônicos automáticos, Wi-Fi, atendimento nas pistas, serviço de bar e opções de combos para festas. É uma escolha perfeita para comemorações de aniversário, happy hour de empresas ou passeios em família nos fins de semana. O local possui calçados especiais para locação obrigatória na pista, aceita reservas de pistas antecipadas e dispõe de estacionamento privativo.',NULL,'admin@meraki.com.br'),(13,'Biblioteca Pública Municipal de Pinhais','assets/img/13.jpg','R. Vinte e Dois de Abril, 305 - Centro, Pinhais - PR, 83323-240','Entrada livre acompanhado','Seg a Sex das 08:00 - 19:00','Entrada com acessibilidade para pessoas em cadeira de rodas, Estacionamento com acessibilidade para pessoas em cadeira de rodas.','Gratuito','Esta biblioteca disponibiliza livros que podem ser alugados por menores de 12 anos acompanhados.',NULL,NULL,'Em um ambiente silencioso, focado e convidativo à leitura, o espaço oferece um vasto acervo de livros, periódicos, espaço para estudos e computadores com acesso à internet, com destaque para o cantinho da literatura infantil e lançamentos literários. Conta com mesas individuais e coletivas de estudo, Wi-Fi gratuito, atendimento de bibliotecários no local e sistema de empréstimo domiciliar. É uma opção excelente para concurseiros, estudantes universitários ou para quem busca o prazer da leitura. O local possui espaço de contação de histórias para crianças, aceita doações de livros em bom estado e dispõe de ambiente climatizado.',NULL,'admin@meraki.com.br'),(14,'Centro Cultural Wanda dos Santos Mallmann','assets/img/14.jpg','R. Vinte e Dois de Abril, 305 - Estância Pinhais, Pinhais - PR, 83323-240','Entrada livre acompanhado','Seg a Sex das 8:00 - 21:00, Sáb das 8:00 - 12:00','Banheiro com acessibilidade para pessoas em cadeira de rodas, Entrada com acessibilidade para pessoas em cadeira de rodas, Estacionamento com acessibilidade para pessoas em cadeira de rodas.','Gratuito','Este centro disponibiliza aulas e eventos de arte, como por exemplo teatro.',NULL,'(41) 99225-8389','Em um ambiente artístico, histórico e inspirador, o espaço oferece exposições de arte, oficinas de artesanato, aulas de dança e teatro, com destaque para o auditório principal e as galerias de artistas locais. Conta com salas de ensaio estruturadas, painéis informativos, atendimento ao público no local e recepção para eventos solenes. É uma opção enriquecedora para estudantes, amantes das artes visuais ou turistas interessados no patrimônio municipal. O local possui entrada franca na maioria das exposições, aceita agendamento de visitas guiadas para escolas e dispõe de estacionamento no pátio interno.',NULL,'admin@meraki.com.br'),(15,'CEU - Centro de Artes e Esportes Unificados','assets/img/15.jpg','R. Rio Trombetas, 828 - Planta Bairro Weissópolis, Pinhais - PR, 83322-280','Depende da atividade','Seg a Sex das 08:00 - 12:00 / 13:00 - 17:00','Entrada com acessibilidade para pessoas em cadeira de rodas, Estacionamento com acessibilidade para pessoas em cadeira de rodas.','Gratuito','Este centro disponibiliza aulas e eventos de arte e esporte.',NULL,'(41) 3912-5487','Em um ambiente integrado, multicultural e vibrante, o espaço oferece quadra poliesportiva, cineteatro, salas de oficinas e pista de skate, com destaque para as apresentações teatrais, mostras de cinema e oficinas gratuitas. Conta com biblioteca comunitária, Wi-Fi nas áreas comuns, atendimento de assistência social no local (CRAS) e espaços lúdicos para o público infantil. É o ponto de encontro ideal para famílias, jovens artistas ou para quem busca lazer e qualificação perto de casa. O local possui programação cultural diversificada, aceita parcerias com coletivos locais e dispõe de áreas abertas totalmente acessíveis.',NULL,'admin@meraki.com.br'),(16,'Ginásio Poliesportivo Tancredo de Almeida Neves','assets/img/16.jpg','Rua 11 de Junho, 637 - Centro, Pinhais - PR, 83323-040','Depende da atividade','Todos os dias das 08:00 - 23:00','Entrada com acessibilidade para pessoas em cadeira de rodas, Estacionamento com acessibilidade para pessoas em cadeira de rodas.','Gratuito','Este ginásio disponibiliza a quadra e eventos esportivos.','http://www.pinhais.pr.gov.br/','(41) 3912-5250','Em um ambiente tradicional, espaçoso e multiuso, o espaço oferece quadra coberta de alta resistência para Manuais esportivas e grandes eventos, com destaque para competições escolares, artes marciais e eventos comunitários. Conta com arquibancadas de grande capacidade, palco para premiações, atendimento administrativo no local e banheiros públicos adequados. É uma referência histórica para a cidade, ideal para festivais esportivos, finais de campeonatos regionais ou assembleias locais. O local possui gestão pública municipal, aceita solicitações formais de uso pela comunidade e dispõe de vias de acesso rápido.',NULL,'admin@meraki.com.br'),(17,'CIE Pinhais - Centro Iniciação Esporte','assets/img/17.jpg','Av. Maringá, 2553 - Atuba, Pinhais - PR, 83326-010','Depende da atividade','Seg a Sex das 08:00 - 23:00','Entrada com acessibilidade para pessoas em cadeira de rodas, Estacionamento com acessibilidade para pessoas em cadeira de rodas.','Gratuito','Este ginásio disponibiliza diversas quadras e eventos esportivos.',NULL,'(41) 3912-5492','Em um ambiente moderno, inclusivo e focado no desenvolvimento social, o espaço oferece iniciação esportiva em diversas modalidades olímpicas e paralímpicas, com destaque para o atletismo, basquete, handebol e ginástica. Conta com pista oficial, academia equipada, atendimento por profissionais de educação física no local e programas voltados à saúde pública. É uma infraestrutura de excelência para crianças em idade escolar, jovens promessas do esporte ou atletas com deficiência. O local possui programas governamentais totalmente gratuitos, exige matrícula institucional prévia e dispõe de acessibilidade universal em todas as dependências.',NULL,'admin@meraki.com.br'),(18,'Rede Esportes centro esportivo','assets/img/18.jpg','Av. Nossa Sra. da Boa Esperança, 06 - Estância Pinhais, Pinhais - PR, 83323-000','A partir de 7 anos','Seg 14-23:30, Ter 8:30-23:30, Qua 15-23:30, Qui  8:30-23:30, Sex 15-23:30, Sab  8-23:30, Dom 9-22','Entrada com acessibilidade para pessoas em cadeira de rodas, Estacionamento com acessibilidade para pessoas em cadeira de rodas.','R$ 149,99/mês','Este espaço disponibiliza diversas quadras e eventos esportivos.','redeesportes.com.br','(41) 99609-3265','Em um ambiente estruturado, profissional e dinâmico, o espaço oferece locação de quadras sintéticas, escolinhas de esportes e organização de ligas, com destaque para o futebol society e torneios corporativos. Conta com churrasqueiras para o pós-jogo, Wi-Fi, lanchonete com espetinhos e bebidas no local e telas para transmissão de partidas profissionais. É uma escolha excelente para a famosa \"pelada\" entre amigos, eventos de empresas ou treinamentos infantis. O local possui planos mensais para mensalistas fixos, aceita reservas via aplicativo e dispõe de amplo estacionamento para veículos.',NULL,'admin@meraki.com.br'),(19,'Ginásio Poliesportivo Perdizes','assets/img/19.jpg','R. Alcídes Jazar, 610 - Atuba, Pinhais - PR, 83326-070','Entrada livre acompanhado','Seg a Sex das 08:00 - 17:00','Entrada com acessibilidade para pessoas em cadeira de rodas, Estacionamento com acessibilidade para pessoas em cadeira de rodas.','Gratuito','Este ginásio disponibiliza a quadra e eventos esportivos.',NULL,'(41) 99227-8003','Em um ambiente comunitário, amplo e movimentado, o espaço oferece quadra coberta para diversas modalidades, com destaque para partidas de Futsal, Voleibol e Handebol. Conta com arquibancadas estruturadas para o público, vestiários masculinos e femininos, atendimento para projetos sociais no local e espaço para campeonatos locais. É um ponto de encontro tradicional para times do bairro, ligas amadoras ou estudantes da região. O local possui horários reservados para o uso comunitário, é integrado ao planejamento urbano e dispõe de estacionamento e áreas de acesso facilitado nas imediações.',NULL,'admin@meraki.com.br'),(20,'Quadra Publica de Tênis','assets/img/20.jpg','Maria Antonieta - Pinhais','Entrada livre acompanhado','Aberto 24h','Não há informação.','Gratuito','Este espaço disponibiliza a quadra.',NULL,NULL,'Em um ambiente aberto, casual e de livre acesso, o espaço oferece área para a prática de tênis de campo e exercícios físicos.',NULL,'admin@meraki.com.br'),(21,'Arena 25 Beach Sports','assets/img/21.jpg','R. Cassiano Ricardo, 791 - Vargem Grande, Pinhais - PR, 83321-090','A partir de 10 anos','Seg a Sex das 18:00 - 00:00, Sáb das 10:00 - 20:00, Dom das 10:00 - 18:00','Entrada com acessibilidade para pessoas em cadeira de rodas, Estacionamento com acessibilidade para pessoas em cadeira de rodas.','A partir R$ 20 por pessoa','Esta arena disponibiliza a quadra.',NULL,'(41) 98778-3908','Em um ambiente praiano, descontraído e esportivo, o espaço oferece quadras de areia para locação, treinos funcionais e torneios, com destaque para a prática de Beach Tennis, Futevôlei e Vôlei de Praia. Conta com área de convivência social, Wi-Fi, quiosque com bebidas e petiscos no local e vestiários bem equipados. É uma opção perfeita para grupos de amigos, atletas amadores ou famílias que querem manter a forma na areia. O local possui aulas com professores qualificados, aceita reservas de horários fixos ou avulsos e dispõe de infraestrutura moderna e iluminada para jogos noturnos.',NULL,'admin@meraki.com.br'),(22,'Grupo Escoteiro Pingo d\'Água - 126/PR','assets/img/22.jpg','R. Quênia, 363 - Centro, Pinhais - PR, 83320-150','A partir de 6 anos','Sáb das 14:30 - 17:30  ','Não há informação.','Cerca de R$90','Este espaço disponibiliza áreas para atividades, encontros e acampamentos de grupos escoteiros.','https://www.pingodagua.org.br/','(41) 9854-7788','Em um ambiente fraterno, solidário e de cooperação, o espaço oferece dinâmicas de Escotismo baseadas na cidadania ativa, com destaque para a superação de desafios práticos, pioneiria e ações comunitárias. Conta com sede própria para encontros, equipes de chefia dedicadas, atendimento aos finais de semana e atividades Manuais de campo. É uma escolha engajadora para famílias, jovens e crianças interessados em aventura e formação de caráter. O local possui divisões por ramos conforme a idade, aceita visitantes espontâneos e atua de acordo com as normas oficiais da União dos Escoteiros do Brasil.',NULL,'admin@meraki.com.br'),(23,'Grupo Escoteiro Santa Mônica (GESM)','assets/img/23.jpg','Jardim das Nascentes, Pinhais - PR','A partir de 6 anos','Sáb das 14:30 - 17:30','Entrada com acessibilidade para pessoas em cadeira de rodas, Estacionamento com acessibilidade para pessoas em cadeira de rodas.','Cerca de R$90','Este espaço disponibiliza áreas para atividades, encontros e acampamentos de grupos escoteiros associados ao clube.','https://www.instagram.com/grupoescoteirosantamonica/','(41) 98749-6953','Em um ambiente integrado à natureza, comunitário e educativo, o espaço oferece atividades ao ar livre, jogos cooperativos e desenvolvimento de habilidades de liderança, com destaque para o espírito de equipe, cidadania e acampamentos. Conta com reuniões semanais, estrutura para Manuais de campo, orientação de voluntários experientes e vivências em grupo. É uma oportunidade fantástica para crianças, jovens e famílias que buscam desenvolvimento pessoal e valores sociais. O local possui atividades separadas por faixas etárias, aceita novas inscrições em períodos específicos do ano e promove o respeito ao meio ambiente e à sustentabilidade.',NULL,'admin@meraki.com.br'),(24,'Café com Lente Jardins','assets/img/24.jpg','Rua Primeiro de Maio, 387 - Centro, Pinhais - PR, 83323-020','Entrada livre acompanhado','Ter a Sex das 11:45 - 19:00, Sab e Dom das 10:00 - 18:00,','Assento com acessibilidade para pessoas em cadeira de rodas, Banheiro com acessibilidade para pessoas em cadeira de rodas, Entrada com acessibilidade para pessoas em cadeira de rodas, Estacionamento com acessibilidade para pessoas em cadeira de rodas.','R$ 20-80 por pessoa','Este restaurante disponibiliza um playground e área verde.','https://canva.link/gpb35dufn5x7id6','(41) 99599-6856','Em um ambiente aconchegante, casual e tranquilo, o espaço oferece opções para café da manhã, brunch, almoço e sobremesas, com destaque para o café, chás e doces. Conta com mesas externas, Wi-Fi gratuito, atendimento no local, entrega e opções para viagem. É uma opção agradável para famílias, grupos ou para quem deseja trabalhar com o laptop. O local possui cardápio infantil, aceita reservas e dispõe de estacionamento gratuito, além de permitir a presença de cães na área externa.',NULL,'admin@meraki.com.br'),(25,'Pizza Americana ','assets/img/25.jpg','Rod. Dep. João Leopoldo Jacomel, 12431 - Centro, Pinhais - PR, 83323-410','Entrada livre acompanhado','Todos os dias das 11:30 - 14:30 / 18:30 - 23:00','Assento com acessibilidade para pessoas em cadeira de rodas, Banheiro com acessibilidade para pessoas em cadeira de rodas, Entrada com acessibilidade para pessoas em cadeira de rodas, Estacionamento com acessibilidade para pessoas em cadeira de rodas','R$ 60-80 por pessoa','Este restaurante disponibiliza um fliperama.',NULL,'(41) 98460-9466','A pizzaria oferece opções de entrega, para viagem e refeição no local. Possui ótimos coquetéis e é adequado para almoço, jantar e para quem deseja comer sozinho. O cardápio conta com buffet à vontade, porções pequenas, refeições rápidas e opções de comida tarde da noite, além de sobremesas. O local também dispõe de espaço privativo para eventos e aceita reservas.',NULL,'admin@meraki.com.br'),(26,'Loretto Pizzaria e Hambúrgueria','assets/img/26.jpg','Rod. Dep. João Leopoldo Jacomel, 11250 - Pineville, Pinhais - PR, 83320-005','Entrada livre acompanhado','Ter a Dom das 18:00 - 23:30','','R$ 40-60 por pessoa','Este restaurante disponibiliza um playground.',NULL,'(41) 99535-1874','O restaurante oferece refeição no local, com mesas na cobertura e opções de entretenimento relacionadas a esportes. O ambiente é casual, moderno e tranquilo, sendo adequado para grupos.',NULL,'admin@meraki.com.br'),(27,'Comodoro Burguer - Pinhais','assets/img/27.jpg','Av. Iraí, 1552 - Weissópolis, Pinhais - PR, 83321-000','Entrada livre acompanhado','Todos os dias das 18:00 - 23:30','Assento com acessibilidade para pessoas em cadeira de rodas, Banheiro com acessibilidade para pessoas em cadeira de rodas, Entrada com acessibilidade para pessoas em cadeira de rodas, Estacionamento com acessibilidade para pessoas em cadeira de rodas','R$ 40-60 por pessoa','Este restaurante disponibiliza um playground.','https://comodoroburguer.com/','(41) 3403-2417','A hamburgueria oferece opções de entrega, para viagem e refeição no local.  O cardápio conta com porções pequenas, refeições rápidas, além de sobremesas.',NULL,'admin@meraki.com.br'),(28,'Alexandria Burger Pinhais','assets/img/28.jpg','Av. Iraí, 568 - Weissópolis, Pinhais - PR, 83321-000','Entrada livre acompanhado','Todos os dias das 11:00 - 23:00','Assento com acessibilidade para pessoas em cadeira de rodas, Banheiro com acessibilidade para pessoas em cadeira de rodas, Entrada com acessibilidade para pessoas em cadeira de rodas, Estacionamento com acessibilidade para pessoas em cadeira de rodas','R$ 60-80 por pessoa','Este restaurante disponibiliza um playground.',NULL,'(41) 98851-2426','A hamburgueria oferece opções de entrega, para viagem e refeição no local. O cardápio conta com buffet à vontade, porções pequenas, refeições rápidas e opções de comida tarde da noite, além de sobremesas. O local também dispõe de espaço privativo para eventos e serviço de garçons.',NULL,'admin@meraki.com.br'),(29,'Patinação Gold Roller Cwb','assets/img/29.jpg','Av. Ayrton Senna da Silva, 2650 - Centro, Pinhais - PR, 83320-570','Entrada livre acompanhado','Sab das 19:00 - 21:00','Assento com acessibilidade para pessoas em cadeira de rodas, Entrada com acessibilidade para pessoas em cadeira de rodas, Estacionamento com acessibilidade para pessoas em cadeira de rodas.','R$25 com patins próprios','Este espaço disponibiliza a quadra e aluguel de patins.','https://www.goldrollercwb.com/','(41) 9259-2697','Em um ambiente enérgico, divertido e familiar, o espaço oferece pista de patinação coberta, patinação recreativa e espaço para lazer aos sábados, com destaque para o clima animado, músicas envolventes e integração social. Conta com aluguel de patins no local, Wi-Fi, lanchonete com mesas confortáveis e camarote superior com mesa de sinuca. É uma opção incrível para crianças, jovens e adultos, grupos de amigos ou famílias. O local possui entrada livre para quem não vai patinar, aceita reservas para eventos e festas de aniversário e dispõe de estacionamento próprio e acessibilidade.',NULL,'admin@meraki.com.br'),(30,'Escola de Música Mendelssohn','assets/img/30.jpg','Av. Camilo di Lellis, 200 - Centro, Pinhais - PR, 83323-000','A partir de 6 meses','Seg a Sex das 9:00 - 21:00, Sáb das 8:00 - 13:00','Banheiro com acessibilidade para pessoas em cadeira de rodas, Entrada com acessibilidade para pessoas em cadeira de rodas, Estacionamento com acessibilidade para pessoas em cadeira de rodas.','Cerca de R$150','Esta escola disponibiliza de aulas de música infantil.','https://escolamendelssohn.com.br/','(41) 99570-5766','Em um ambiente sofisticado, acadêmico e clássico, o espaço oferece formação técnica e livre em música, com destaque para a leitura de partituras, instrumentos de cordas, teclas e sopro. Conta com estúdios de ensaio estruturados, professores qualificados, atendimento agendado no local e preparação direcionada para exames e recitais. É uma escolha altamente recomendada para estudantes dedicados, apreciadores da música erudita ou indivíduos que buscam alto padrão técnico. O local possui programas pedagógicos personalizados por faixa etária, aceita consultas de turmas e reservas de horários e dispõe de infraestrutura focada no conforto e na acústica adequada dos alunos.',NULL,'admin@meraki.com.br'),(31,'Escola de Música Acordes','assets/img/31.jpg','R. Rio Negro, 595 - Weissópolis, Pinhais - PR, 83322-030','A partir de 6 meses','Seg a Sex das 14:00 - 21:00, Sáb das 9:00 - 12:00','Assento com acessibilidade para pessoas em cadeira de rodas, Banheiro com acessibilidade para pessoas em cadeira de rodas, Entrada com acessibilidade para pessoas em cadeira de rodas, Estacionamento com acessibilidade para pessoas em cadeira de rodas.','R$ 250/mês ','Esta escola disponibiliza de aulas de música infantil.','https://www.instagram.com/acordes_escola_de_musica/','(41) 99928-1852','Em um ambiente criativo, focado e amigável, o espaço oferece treinamento musical completo para iniciantes e avançados, com destaque para aulas de violão, canto, bateria e mais de 10 cursos à disposição. Conta com estúdios bem equipados, Wi-Fi na recepção, atendimento presencial no local, além de oferecer aulas online. É uma alternativa perfeita para crianças, jovens talentos ou para quem busca a música como hobby. O local é liderado por profissionais graduados e pós-graduados na área, aceita agendamento de aula experimental gratuita e dispõe de acessibilidade e estacionamento gratuito no local.',NULL,'admin@meraki.com.br'),(32,'Academia De Musica Estrela','assets/img/32.jpg','R. Antônio Gonçalves Dias, 1458 - Vargem Grande, Pinhais - PR, 83321-070','A partir de 6 anos','Seg a Qua das 9:00 - 19:00, Sex das 9:00 - 19:00','Não há informação.','Valores variados ','Esta escola disponibiliza de aulas de música infantil.','https://sites.google.com/view/academia-de-musica-estrela/','(41) 98702-2340','Em um ambiente harmônico, acolhedor e inspirador, o espaço oferece aulas de canto, prática de instrumentos variados e teoria musical, com destaque para o ensino de piano, teclado, órgão e violão. Conta com salas estruturadas para o aprendizado, instrumentos modernos para uso dos alunos, atendimento personalizado no local e suporte completo para apresentações recitais. É uma opção ideal para crianças a partir de 6 anos, adultos de todas as idades ou profissionais que desejam aprimorar suas habilidades artísticas. O local possui metodologia de ensino tradicional e consagrada, aceita o agendamento de novas matrículas e disponibiliza canais de atendimento digital para consulta de turmas e horários flexíveis.',NULL,'admin@meraki.com.br'),(33,'Escola Du Chef','assets/img/33.jpg','R. Rio Solimões, n 140 - Weissópolis, Pinhais - PR, 83413-636','A partir de 6 anos','Seg a Sex das 8:00 - 22:00, Sáb das 8:00 - 16:00','Entrada com acessibilidade para pessoas em cadeira de rodas, Estacionamento com acessibilidade para pessoas em cadeira de rodas.','R$ 4.200, com todos os materiais inclusos','Esta escola disponibiliza de aulas de culinária infantil.','https://escoladuchef.com.br/','(41) 99860-1249','Em um ambiente dinâmico, didático e profissional, o espaço oferece cursos de gastronomia, workshops rápidos e especializações na cozinha, com destaque para as técnicas de panificação, confeitaria e formação de chef de cozinha. Conta com bancadas de trabalho individuais, insumos inclusos para as receitas, atendimento presencial no local e suporte direto dos professores. É uma opção excelente para entusiastas da culinária, profissionais da área ou jovens que buscam aprender por hobby. O local possui turmas especiais para o público infantil (Chef Jr), aceita matrículas ao longo do ano e disponibiliza fardamento e material didático dependendo da campanha vigente.',NULL,'admin@meraki.com.br');
/*!40000 ALTER TABLE `espaco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `espaco_equipamento`
--

DROP TABLE IF EXISTS `espaco_equipamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `espaco_equipamento` (
  `idespaco` int NOT NULL,
  `equipamento` enum('Playground','Aulas de culinaria','Aulas ou atividades esportivas','Bibliotecas','Aulas ou atividades artisticas','Grupos escoteiros') NOT NULL,
  PRIMARY KEY (`idespaco`,`equipamento`),
  KEY `fk_espaco_has_equipamentos_equipamentos1_idx` (`equipamento`),
  KEY `fk_espaco_has_equipamentos_espaco1_idx` (`idespaco`),
  CONSTRAINT `fk_espaco_has_equipamentos_equipamentos1` FOREIGN KEY (`equipamento`) REFERENCES `equipamento` (`equipamento`),
  CONSTRAINT `fk_espaco_has_equipamentos_espaco1` FOREIGN KEY (`idespaco`) REFERENCES `espaco` (`idespaco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `espaco_equipamento`
--

LOCK TABLES `espaco_equipamento` WRITE;
/*!40000 ALTER TABLE `espaco_equipamento` DISABLE KEYS */;
INSERT INTO `espaco_equipamento` VALUES (1,'Playground'),(2,'Playground'),(3,'Playground'),(4,'Playground'),(5,'Playground'),(8,'Playground'),(9,'Playground'),(10,'Playground'),(24,'Playground'),(25,'Playground'),(26,'Playground'),(27,'Playground'),(28,'Playground'),(33,'Aulas de culinaria'),(1,'Aulas ou atividades esportivas'),(2,'Aulas ou atividades esportivas'),(4,'Aulas ou atividades esportivas'),(5,'Aulas ou atividades esportivas'),(6,'Aulas ou atividades esportivas'),(7,'Aulas ou atividades esportivas'),(8,'Aulas ou atividades esportivas'),(11,'Aulas ou atividades esportivas'),(12,'Aulas ou atividades esportivas'),(15,'Aulas ou atividades esportivas'),(16,'Aulas ou atividades esportivas'),(17,'Aulas ou atividades esportivas'),(18,'Aulas ou atividades esportivas'),(19,'Aulas ou atividades esportivas'),(20,'Aulas ou atividades esportivas'),(21,'Aulas ou atividades esportivas'),(29,'Aulas ou atividades esportivas'),(13,'Bibliotecas'),(14,'Aulas ou atividades artisticas'),(15,'Aulas ou atividades artisticas'),(30,'Aulas ou atividades artisticas'),(31,'Aulas ou atividades artisticas'),(32,'Aulas ou atividades artisticas'),(22,'Grupos escoteiros'),(23,'Grupos escoteiros');
/*!40000 ALTER TABLE `espaco_equipamento` ENABLE KEYS */;
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
INSERT INTO `faixa_etaria` VALUES ('Depende da atividade'),('A partir de 0 anos'),('A partir de 3 anos'),('A partir de 6 anos'),('A partir de 8 anos'),('A partir de 10 anos'),('Livre');
/*!40000 ALTER TABLE `faixa_etaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faixa_etaria_espaco`
--

DROP TABLE IF EXISTS `faixa_etaria_espaco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faixa_etaria_espaco` (
  `faixa_etaria` enum('Depende da atividade','A partir de 0 anos','A partir de 3 anos','A partir de 6 anos','A partir de 8 anos','A partir de 10 anos','Livre') NOT NULL,
  `idespaco` int NOT NULL,
  PRIMARY KEY (`faixa_etaria`,`idespaco`),
  KEY `fk_faixa_etaria_has_espaco_espaco1_idx` (`idespaco`),
  KEY `fk_faixa_etaria_has_espaco_faixa_etaria1_idx` (`faixa_etaria`),
  CONSTRAINT `fk_faixa_etaria_has_espaco_espaco1` FOREIGN KEY (`idespaco`) REFERENCES `espaco` (`idespaco`),
  CONSTRAINT `fk_faixa_etaria_has_espaco_faixa_etaria1` FOREIGN KEY (`faixa_etaria`) REFERENCES `faixa_etaria` (`faixa_etaria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faixa_etaria_espaco`
--

LOCK TABLES `faixa_etaria_espaco` WRITE;
/*!40000 ALTER TABLE `faixa_etaria_espaco` DISABLE KEYS */;
INSERT INTO `faixa_etaria_espaco` VALUES ('Depende da atividade',1),('Depende da atividade',2),('Depende da atividade',7),('Depende da atividade',8),('Depende da atividade',9),('Depende da atividade',10),('Depende da atividade',13),('Depende da atividade',14),('Depende da atividade',15),('Depende da atividade',16),('Depende da atividade',17),('Depende da atividade',19),('Depende da atividade',20),('Depende da atividade',25),('Depende da atividade',26),('Depende da atividade',27),('Depende da atividade',28),('Depende da atividade',29),('A partir de 0 anos',1),('A partir de 0 anos',2),('A partir de 0 anos',3),('A partir de 0 anos',4),('A partir de 0 anos',5),('A partir de 0 anos',7),('A partir de 0 anos',8),('A partir de 0 anos',9),('A partir de 0 anos',10),('A partir de 0 anos',13),('A partir de 0 anos',14),('A partir de 0 anos',15),('A partir de 0 anos',16),('A partir de 0 anos',17),('A partir de 0 anos',19),('A partir de 0 anos',20),('A partir de 0 anos',24),('A partir de 0 anos',25),('A partir de 0 anos',26),('A partir de 0 anos',27),('A partir de 0 anos',28),('A partir de 0 anos',29),('A partir de 0 anos',30),('A partir de 0 anos',31),('A partir de 3 anos',12),('A partir de 6 anos',6),('A partir de 6 anos',11),('A partir de 6 anos',22),('A partir de 6 anos',23),('A partir de 6 anos',32),('A partir de 6 anos',33),('A partir de 8 anos',18),('A partir de 10 anos',21);
/*!40000 ALTER TABLE `faixa_etaria_espaco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorito`
--

DROP TABLE IF EXISTS `favorito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorito` (
  `email` varchar(100) NOT NULL,
  `idespaco` int NOT NULL,
  PRIMARY KEY (`email`,`idespaco`),
  KEY `fk_usuario_normal_has_espaco_espaco1_idx` (`idespaco`),
  KEY `fk_usuario_normal_has_espaco_usuario_normal1_idx` (`email`),
  CONSTRAINT `fk_usuario_normal_has_espaco_espaco1` FOREIGN KEY (`idespaco`) REFERENCES `espaco` (`idespaco`),
  CONSTRAINT `fk_usuario_normal_has_espaco_usuario_normal1` FOREIGN KEY (`email`) REFERENCES `usuario_normal` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorito`
--

LOCK TABLES `favorito` WRITE;
/*!40000 ALTER TABLE `favorito` DISABLE KEYS */;
INSERT INTO `favorito` VALUES ('eduardo.tieppo@ifpr.edu.br',13);
/*!40000 ALTER TABLE `favorito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_pagamento`
--

DROP TABLE IF EXISTS `forma_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma_pagamento` (
  `forma_pagamento` enum('Privado','Publico','Sem informacao') NOT NULL,
  PRIMARY KEY (`forma_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pagamento`
--

LOCK TABLES `forma_pagamento` WRITE;
/*!40000 ALTER TABLE `forma_pagamento` DISABLE KEYS */;
INSERT INTO `forma_pagamento` VALUES ('Privado'),('Publico'),('Sem informacao');
/*!40000 ALTER TABLE `forma_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_pagamento_espaco`
--

DROP TABLE IF EXISTS `forma_pagamento_espaco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma_pagamento_espaco` (
  `forma_pagamento_forma_pagamento` enum('Privado','Publico','Sem informacao') NOT NULL,
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
INSERT INTO `forma_pagamento_espaco` VALUES ('Privado',9),('Privado',10),('Privado',11),('Privado',12),('Privado',18),('Privado',21),('Privado',22),('Privado',23),('Privado',24),('Privado',25),('Privado',26),('Privado',27),('Privado',28),('Privado',29),('Privado',30),('Privado',31),('Privado',32),('Privado',33),('Publico',1),('Publico',2),('Publico',3),('Publico',4),('Publico',5),('Publico',6),('Publico',7),('Publico',8),('Publico',13),('Publico',14),('Publico',15),('Publico',16),('Publico',17),('Publico',19),('Publico',20);
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
  `idespaco` int NOT NULL,
  PRIMARY KEY (`dia`,`idespaco`),
  KEY `fk_horario_funcionamento_espaco1_idx` (`idespaco`),
  CONSTRAINT `fk_horario_funcionamento_espaco1` FOREIGN KEY (`idespaco`) REFERENCES `espaco` (`idespaco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario_funcionamento`
--

LOCK TABLES `horario_funcionamento` WRITE;
/*!40000 ALTER TABLE `horario_funcionamento` DISABLE KEYS */;
INSERT INTO `horario_funcionamento` VALUES ('Domingo		','06:00:00','21:00:00',2),('Domingo		','06:00:00','21:00:00',4),('Domingo		','07:00:00','19:00:00',5),('Domingo','06:00:00','21:00:00',1),('Domingo','00:00:00','23:59:59',6),('Domingo','00:00:00','23:59:59',7),('Domingo','06:00:00','21:00:00',8),('Domingo','09:00:00','17:30:00',9),('Domingo','18:00:00','23:00:00',10),('Domingo','16:00:00','23:00:00',12),('Domingo','08:00:00','23:00:00',16),('Domingo','09:00:00','22:00:00',18),('Domingo','00:00:00','23:59:59',20),('Domingo','10:00:00','18:00:00',21),('Domingo','10:00:00','18:00:00',24),('Domingo','11:30:00','23:00:00',25),('Domingo','18:00:00','23:30:00',26),('Domingo','18:00:00','23:30:00',27),('Domingo','11:00:00','23:00:00',28),('Quarta-feira		','06:00:00','21:00:00',2),('Quarta-feira		','06:00:00','21:00:00',4),('Quarta-feira		','07:00:00','19:00:00',5),('Quarta-feira','06:00:00','21:00:00',1),('Quarta-feira','00:00:00','23:59:59',6),('Quarta-feira','00:00:00','23:59:59',7),('Quarta-feira','06:00:00','21:00:00',8),('Quarta-feira','18:00:00','23:00:00',10),('Quarta-feira','15:30:00','18:30:00',11),('Quarta-feira','17:00:00','00:00:00',12),('Quarta-feira','08:00:00','19:00:00',13),('Quarta-feira','08:00:00','21:00:00',14),('Quarta-feira','08:00:00','17:00:00',15),('Quarta-feira','08:00:00','23:00:00',16),('Quarta-feira','08:00:00','23:00:00',17),('Quarta-feira','15:00:00','23:30:00',18),('Quarta-feira','08:00:00','17:00:00',19),('Quarta-feira','00:00:00','23:59:59',20),('Quarta-feira','18:00:00','00:00:00',21),('Quarta-feira','11:45:00','19:00:00',24),('Quarta-feira','11:30:00','23:00:00',25),('Quarta-feira','18:00:00','23:30:00',26),('Quarta-feira','18:00:00','23:30:00',27),('Quarta-feira','11:00:00','23:00:00',28),('Quarta-feira','09:00:00','21:00:00',30),('Quarta-feira','14:00:00','21:00:00',31),('Quarta-feira','09:00:00','19:00:00',32),('Quarta-feira','08:00:00','22:00:00',33),('Quinta-feira		','06:00:00','21:00:00',2),('Quinta-feira		','06:00:00','21:00:00',4),('Quinta-feira		','07:00:00','19:00:00',5),('Quinta-feira','06:00:00','21:00:00',1),('Quinta-feira','00:00:00','23:59:59',6),('Quinta-feira','00:00:00','23:59:59',7),('Quinta-feira','06:00:00','21:00:00',8),('Quinta-feira','09:00:00','17:30:00',9),('Quinta-feira','18:00:00','23:00:00',10),('Quinta-feira','15:30:00','18:30:00',11),('Quinta-feira','17:00:00','00:00:00',12),('Quinta-feira','08:00:00','19:00:00',13),('Quinta-feira','08:00:00','21:00:00',14),('Quinta-feira','08:00:00','17:00:00',15),('Quinta-feira','08:00:00','23:00:00',16),('Quinta-feira','08:00:00','23:00:00',17),('Quinta-feira','08:30:00','23:30:00',18),('Quinta-feira','08:00:00','17:00:00',19),('Quinta-feira','00:00:00','23:59:59',20),('Quinta-feira','18:00:00','00:00:00',21),('Quinta-feira','11:45:00','19:00:00',24),('Quinta-feira','11:30:00','23:00:00',25),('Quinta-feira','18:00:00','23:30:00',26),('Quinta-feira','18:00:00','23:30:00',27),('Quinta-feira','11:00:00','23:00:00',28),('Quinta-feira','09:00:00','21:00:00',30),('Quinta-feira','14:00:00','21:00:00',31),('Quinta-feira','08:00:00','22:00:00',33),('Sábado		','06:00:00','21:00:00',2),('Sábado		','06:00:00','21:00:00',4),('Sábado		','07:00:00','19:00:00',5),('Sábado','06:00:00','21:00:00',1),('Sábado','00:00:00','23:59:59',6),('Sábado','00:00:00','23:59:59',7),('Sábado','06:00:00','21:00:00',8),('Sábado','09:00:00','17:30:00',9),('Sábado','18:00:00','23:00:00',10),('Sábado','16:00:00','00:00:00',12),('Sábado','08:00:00','12:00:00',14),('Sábado','08:00:00','23:00:00',16),('Sábado','08:00:00','23:30:00',18),('Sábado','00:00:00','23:59:59',20),('Sábado','10:00:00','20:00:00',21),('Sábado','14:30:00','17:30:00',22),('Sábado','14:30:00','17:30:00',23),('Sábado','10:00:00','18:00:00',24),('Sábado','11:30:00','23:00:00',25),('Sábado','18:00:00','23:30:00',26),('Sábado','18:00:00','23:30:00',27),('Sábado','11:00:00','23:00:00',28),('Sábado','19:00:00','21:00:00',29),('Sábado','08:00:00','13:00:00',30),('Sábado','09:00:00','12:00:00',31),('Sábado','08:00:00','16:00:00',33),('Segunda-feira		','06:00:00','21:00:00',2),('Segunda-feira		','06:00:00','21:00:00',4),('Segunda-feira','06:00:00','21:00:00',1),('Segunda-feira','00:00:00','23:59:59',6),('Segunda-feira','00:00:00','23:59:59',7),('Segunda-feira','06:00:00','21:00:00',8),('Segunda-feira','09:00:00','17:30:00',9),('Segunda-feira','18:00:00','23:00:00',10),('Segunda-feira','17:00:00','00:00:00',12),('Segunda-feira','08:00:00','19:00:00',13),('Segunda-feira','08:00:00','21:00:00',14),('Segunda-feira','08:00:00','17:00:00',15),('Segunda-feira','08:00:00','23:00:00',16),('Segunda-feira','08:00:00','23:00:00',17),('Segunda-feira','14:00:00','23:30:00',18),('Segunda-feira','08:00:00','17:00:00',19),('Segunda-feira','00:00:00','23:59:59',20),('Segunda-feira','18:00:00','00:00:00',21),('Segunda-feira','11:30:00','23:00:00',25),('Segunda-feira','18:00:00','23:30:00',27),('Segunda-feira','11:00:00','23:00:00',28),('Segunda-feira','09:00:00','21:00:00',30),('Segunda-feira','14:00:00','21:00:00',31),('Segunda-feira','09:00:00','19:00:00',32),('Segunda-feira','08:00:00','22:00:00',33),('Sexta-feira		','06:00:00','21:00:00',2),('Sexta-feira		','06:00:00','21:00:00',4),('Sexta-feira		','07:00:00','19:00:00',5),('Sexta-feira','06:00:00','21:00:00',1),('Sexta-feira','00:00:00','23:59:59',6),('Sexta-feira','00:00:00','23:59:59',7),('Sexta-feira','06:00:00','21:00:00',8),('Sexta-feira','09:00:00','17:30:00',9),('Sexta-feira','18:00:00','23:00:00',10),('Sexta-feira','15:30:00','18:30:00',11),('Sexta-feira','17:00:00','00:00:00',12),('Sexta-feira','08:00:00','19:00:00',13),('Sexta-feira','08:00:00','21:00:00',14),('Sexta-feira','08:00:00','17:00:00',15),('Sexta-feira','08:00:00','23:00:00',16),('Sexta-feira','08:00:00','23:00:00',17),('Sexta-feira','15:00:00','23:30:00',18),('Sexta-feira','08:00:00','17:00:00',19),('Sexta-feira','00:00:00','23:59:59',20),('Sexta-feira','18:00:00','00:00:00',21),('Sexta-feira','11:45:00','19:00:00',24),('Sexta-feira','11:30:00','23:00:00',25),('Sexta-feira','18:00:00','23:30:00',26),('Sexta-feira','18:00:00','23:30:00',27),('Sexta-feira','11:00:00','23:00:00',28),('Sexta-feira','09:00:00','21:00:00',30),('Sexta-feira','14:00:00','21:00:00',31),('Sexta-feira','09:00:00','19:00:00',32),('Sexta-feira','08:00:00','22:00:00',33),('Terça-feira','06:00:00','21:00:00',1),('Terça-feira ','06:00:00','21:00:00',2),('Terça-feira ','06:00:00','21:00:00',4),('Terça-feira ','07:00:00','19:00:00',5),('Terça-feira','00:00:00','23:59:59',6),('Terça-feira','00:00:00','23:59:59',7),('Terça-feira','06:00:00','21:00:00',8),('Terça-feira','09:00:00','17:30:00',9),('Terça-feira','18:00:00','23:00:00',10),('Terça-feira','15:30:00','18:30:00',11),('Terça-feira','17:00:00','00:00:00',12),('Terça-feira','08:00:00','19:00:00',13),('Terça-feira','08:00:00','21:00:00',14),('Terça-feira','08:00:00','17:00:00',15),('Terça-feira','08:00:00','23:00:00',16),('Terça-feira','08:00:00','23:00:00',17),('Terça-feira','08:30:00','23:30:00',18),('Terça-feira','08:00:00','17:00:00',19),('Terça-feira','00:00:00','23:59:59',20),('Terça-feira','18:00:00','00:00:00',21),('Terça-feira','11:45:00','19:00:00',24),('Terça-feira','11:30:00','23:00:00',25),('Terça-feira','18:00:00','23:30:00',26),('Terça-feira','18:00:00','23:30:00',27),('Terça-feira','11:00:00','23:00:00',28),('Terça-feira','09:00:00','21:00:00',30),('Terça-feira','14:00:00','21:00:00',31),('Terça-feira','09:00:00','19:00:00',32),('Terça-feira','08:00:00','22:00:00',33);
/*!40000 ALTER TABLE `horario_funcionamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `email` varchar(100) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('admin@meraki.com.br','Meraki','123456'),('eduardo.tieppo@ifpr.edu.br','Eduardo Tieppo','$2y$10$7yoL1qltM/VGTjKolh6TseNWEAJzyLRMcuwVP8eL1RsFftO5szpxG'),('larissa.nobrega248@gmail.com','Larissa Nóbrega','$2y$10$CBzEViMehtXYwx9ssRNn.OacuWSJMzyE8oj7S687fxAti/eo.W6oG');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
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
  CONSTRAINT `fk_usuario_adm_usuarios1` FOREIGN KEY (`email`) REFERENCES `usuario` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_adm`
--

LOCK TABLES `usuario_adm` WRITE;
/*!40000 ALTER TABLE `usuario_adm` DISABLE KEYS */;
INSERT INTO `usuario_adm` VALUES ('admin@meraki.com.br');
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
  CONSTRAINT `fk_usuario_normal_usuarios1` FOREIGN KEY (`email`) REFERENCES `usuario` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_normal`
--

LOCK TABLES `usuario_normal` WRITE;
/*!40000 ALTER TABLE `usuario_normal` DISABLE KEYS */;
INSERT INTO `usuario_normal` VALUES ('eduardo.tieppo@ifpr.edu.br'),('larissa.nobrega248@gmail.com');
/*!40000 ALTER TABLE `usuario_normal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-08 15:28:39
