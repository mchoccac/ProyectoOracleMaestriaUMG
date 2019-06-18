CREATE DATABASE  IF NOT EXISTS `ProyectoMaestria` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ProyectoMaestria`;
-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: ProyectoMaestria
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

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
-- Table structure for table `T_AGENCIA`
--

DROP TABLE IF EXISTS `T_AGENCIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_AGENCIA` (
  `ID_AGENCIA` int(11) NOT NULL,
  `ID_MUNICIPIO` int(11) DEFAULT NULL,
  `NOMBRE_AGENCIA` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_AGENCIA`),
  KEY `FK_RELATIONSHIP_8` (`ID_MUNICIPIO`),
  CONSTRAINT `FK_RELATIONSHIP_8` FOREIGN KEY (`ID_MUNICIPIO`) REFERENCES `T_MUNICIPIOS` (`ID_MUNICIPIO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_AGENCIA`
--

LOCK TABLES `T_AGENCIA` WRITE;
/*!40000 ALTER TABLE `T_AGENCIA` DISABLE KEYS */;
INSERT INTO `T_AGENCIA` VALUES (1,1,'Llamas'),(2,1,'Centra Norte'),(3,3,'Valle dorado'),(4,4,'LEX-NORTE');
/*!40000 ALTER TABLE `T_AGENCIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_DEPARTAMENTO`
--

DROP TABLE IF EXISTS `T_DEPARTAMENTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_DEPARTAMENTO` (
  `ID_DEPARTAMENTO` int(11) NOT NULL,
  `NOMBRE_DEPARTAMENTO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_DEPARTAMENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_DEPARTAMENTO`
--

LOCK TABLES `T_DEPARTAMENTO` WRITE;
/*!40000 ALTER TABLE `T_DEPARTAMENTO` DISABLE KEYS */;
INSERT INTO `T_DEPARTAMENTO` VALUES (1,'Guatemala'),(2,'Zacapa'),(3,'Alta Verapaz');
/*!40000 ALTER TABLE `T_DEPARTAMENTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_DETALLE_PEDIDO`
--

DROP TABLE IF EXISTS `T_DETALLE_PEDIDO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_DETALLE_PEDIDO` (
  `ID_DETALLE_PEDIDO` int(11) NOT NULL,
  `ID_PRODUCTO` varchar(255) DEFAULT NULL,
  `FECHA_PEDIDO` datetime DEFAULT NULL,
  `CANTIDAD` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_DETALLE_PEDIDO`),
  KEY `FK_RELATIONSHIP_5` (`ID_PRODUCTO`),
  CONSTRAINT `FK_RELATIONSHIP_5` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `T_PRODUCTO` (`ID_PRODUCTO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_DETALLE_PEDIDO`
--

LOCK TABLES `T_DETALLE_PEDIDO` WRITE;
/*!40000 ALTER TABLE `T_DETALLE_PEDIDO` DISABLE KEYS */;
INSERT INTO `T_DETALLE_PEDIDO` VALUES (1,'1','2019-04-23 18:51:09',2),(2,'1','2019-04-20 18:51:21',10),(3,'3','2019-04-20 18:51:21',40),(4,'2','2019-04-20 18:51:21',20),(5,'1','2019-04-20 18:51:21',11);
/*!40000 ALTER TABLE `T_DETALLE_PEDIDO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_ENTREGA_PEDIDO`
--

DROP TABLE IF EXISTS `T_ENTREGA_PEDIDO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_ENTREGA_PEDIDO` (
  `ID_ENTREGA_PEDIDO` int(11) NOT NULL,
  `ID_USUARIO` int(11) DEFAULT NULL,
  `FECHA_ENTREGA_PEDIDO` date DEFAULT NULL,
  `HORA_ENTREGA_PEDIDO` time DEFAULT NULL,
  `T_DETALLE_PEDIDO_ID_DETALLE_PEDIDO` int(11) NOT NULL,
  PRIMARY KEY (`ID_ENTREGA_PEDIDO`),
  KEY `FK_RELATIONSHIP_7` (`ID_USUARIO`),
  KEY `fk_T_ENTREGA_PEDIDO_T_DETALLE_PEDIDO1_idx` (`T_DETALLE_PEDIDO_ID_DETALLE_PEDIDO`),
  CONSTRAINT `FK_RELATIONSHIP_7` FOREIGN KEY (`ID_USUARIO`) REFERENCES `T_USUARIO` (`ID_USUARIO`),
  CONSTRAINT `fk_T_ENTREGA_PEDIDO_T_DETALLE_PEDIDO1` FOREIGN KEY (`T_DETALLE_PEDIDO_ID_DETALLE_PEDIDO`) REFERENCES `T_DETALLE_PEDIDO` (`ID_DETALLE_PEDIDO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_ENTREGA_PEDIDO`
--

LOCK TABLES `T_ENTREGA_PEDIDO` WRITE;
/*!40000 ALTER TABLE `T_ENTREGA_PEDIDO` DISABLE KEYS */;
INSERT INTO `T_ENTREGA_PEDIDO` VALUES (1,1,'2019-04-23','18:54:52',1),(2,2,'2019-04-23','18:55:19',2),(3,4,'2019-04-23','18:55:37',4),(4,1,'2019-04-23','18:55:37',3),(5,1,'2019-04-23','18:55:37',5);
/*!40000 ALTER TABLE `T_ENTREGA_PEDIDO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_MUNICIPIOS`
--

DROP TABLE IF EXISTS `T_MUNICIPIOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_MUNICIPIOS` (
  `ID_MUNICIPIO` int(11) NOT NULL,
  `ID_DEPARTAMENTO` int(11) DEFAULT NULL,
  `NOMBRE_MUNICIPIO` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_MUNICIPIO`),
  KEY `FK_RELATIONSHIP_1` (`ID_DEPARTAMENTO`),
  CONSTRAINT `FK_RELATIONSHIP_1` FOREIGN KEY (`ID_DEPARTAMENTO`) REFERENCES `T_DEPARTAMENTO` (`ID_DEPARTAMENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_MUNICIPIOS`
--

LOCK TABLES `T_MUNICIPIOS` WRITE;
/*!40000 ALTER TABLE `T_MUNICIPIOS` DISABLE KEYS */;
INSERT INTO `T_MUNICIPIOS` VALUES (1,1,'Ciudad Guatemala'),(2,1,'Mixco'),(3,2,'Cabañas'),(4,3,'Coban'),(5,3,'San Cristobal');
/*!40000 ALTER TABLE `T_MUNICIPIOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_PRODUCTO`
--

DROP TABLE IF EXISTS `T_PRODUCTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_PRODUCTO` (
  `ID_PRODUCTO` varchar(255) NOT NULL,
  `NOMBRE_PRODUCTO` varchar(100) DEFAULT NULL,
  `DESCRIPCION_PRODUCTO` varchar(100) DEFAULT NULL,
  `EXISTENCIA_PRODUCTO` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_PRODUCTO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_PRODUCTO`
--

LOCK TABLES `T_PRODUCTO` WRITE;
/*!40000 ALTER TABLE `T_PRODUCTO` DISABLE KEYS */;
INSERT INTO `T_PRODUCTO` VALUES ('1','Papel bond','Resma de papel tamanio carta',20),('2','Lapiz','Lapiz tipo B2',5000),('3','Marcadore Azul','Para pizzarra',500),('5','Marcadore Negro','Para pizzarra',100);
/*!40000 ALTER TABLE `T_PRODUCTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_USUARIO`
--

DROP TABLE IF EXISTS `T_USUARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_USUARIO` (
  `ID_USUARIO` int(11) NOT NULL,
  `ID_AGENCIA` int(11) DEFAULT NULL,
  `ID_MUNICIPIO` int(11) DEFAULT NULL,
  `PRIMER_NOMBRE` varchar(50) DEFAULT NULL,
  `SEGUNDO_NOMBRE` varchar(50) DEFAULT NULL,
  `TERCER_NOMBRE` varchar(50) DEFAULT NULL,
  `PRIMER_APELLIDO` varchar(50) DEFAULT NULL,
  `SEGUNDO_APELLIDO` varchar(50) DEFAULT NULL,
  `TELEFONO` varchar(20) DEFAULT NULL,
  `DIRECCION` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_USUARIO`),
  KEY `FK_RELATIONSHIP_2` (`ID_MUNICIPIO`),
  KEY `FK_RELATIONSHIP_3` (`ID_AGENCIA`),
  CONSTRAINT `FK_RELATIONSHIP_2` FOREIGN KEY (`ID_MUNICIPIO`) REFERENCES `T_MUNICIPIOS` (`ID_MUNICIPIO`),
  CONSTRAINT `FK_RELATIONSHIP_3` FOREIGN KEY (`ID_AGENCIA`) REFERENCES `T_AGENCIA` (`ID_AGENCIA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_USUARIO`
--

LOCK TABLES `T_USUARIO` WRITE;
/*!40000 ALTER TABLE `T_USUARIO` DISABLE KEYS */;
INSERT INTO `T_USUARIO` VALUES (1,1,1,'Mynor','','','choc','','32323232','Guatemala'),(2,2,1,'Cesar','',NULL,'Hidalgo',NULL,'36562652',NULL),(3,3,3,'Miguel','','','Cruz',NULL,NULL,NULL),(4,4,4,'Miguel','',NULL,'Chocooj',NULL,NULL,NULL);
/*!40000 ALTER TABLE `T_USUARIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ProyectoMaestria'
--

--
-- Dumping routines for database 'ProyectoMaestria'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_total_productos_entregados_a_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_total_productos_entregados_a_usuario`(idProducto integer, idUsuario integer) RETURNS int(11)
BEGIN
DECLARE idTemp int default 0;

SELECT 
sum(detalle.CANTIDAD) into idTemp
FROM `ProyectoMaestria`.`T_DETALLE_PEDIDO` detalle
inner join  `ProyectoMaestria`.`T_PRODUCTO` producto
on detalle.ID_PRODUCTO = producto.ID_PRODUCTO
inner join `ProyectoMaestria`.`T_ENTREGA_PEDIDO` entrega
on entrega.T_DETALLE_PEDIDO_ID_DETALLE_PEDIDO = detalle.ID_DETALLE_PEDIDO 
inner join  `ProyectoMaestria`.`T_USUARIO` usuario
on usuario.ID_USUARIO = entrega.ID_USUARIO
where producto.ID_PRODUCTO = idProducto and usuario.ID_USUARIO = idUsuario;

IF idTemp is null THEN
	set idTemp =0;
END IF;

RETURN idTemp;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_total_productos_entregados_por_municipio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_total_productos_entregados_por_municipio`(idProducto integer, idMunicipio integer) RETURNS int(11)
BEGIN
DECLARE idTemp int default 0;

SELECT 
sum(detalle.CANTIDAD) into  idTemp
FROM `ProyectoMaestria`.`T_DETALLE_PEDIDO` detalle
inner join  `ProyectoMaestria`.`T_PRODUCTO` producto
on detalle.ID_PRODUCTO = producto.ID_PRODUCTO
inner join `ProyectoMaestria`.`T_ENTREGA_PEDIDO` entrega
on entrega.T_DETALLE_PEDIDO_ID_DETALLE_PEDIDO = detalle.ID_DETALLE_PEDIDO 
inner join  `ProyectoMaestria`.`T_USUARIO` usuario
on usuario.ID_USUARIO = entrega.ID_USUARIO
inner join `ProyectoMaestria`.`T_AGENCIA` agencia
on agencia.ID_AGENCIA =  usuario.ID_AGENCIA
where producto.ID_PRODUCTO = idProducto and agencia.ID_MUNICIPIO = idMunicipio;

IF idTemp is null THEN
	set idTemp =0;
END IF;

RETURN idTemp;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DELETE_T_AGENCIA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_T_AGENCIA`(
IN p_ID_AGENCIA int(11))
BEGIN
DELETE FROM `T_AGENCIA`
WHERE `ID_AGENCIA` = p_ID_AGENCIA;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DELETE_T_DEPARTAMENTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_T_DEPARTAMENTO`(
IN p_ID_DEPARTAMENTO int(11))
BEGIN
DELETE FROM `T_DEPARTAMENTO`
WHERE `ID_DEPARTAMENTO` = p_ID_DEPARTAMENTO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DELETE_T_DETALLE_PEDIDO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_T_DETALLE_PEDIDO`(
IN p_ID_DETALLE_PEDIDO int(11))
BEGIN
DELETE FROM `T_DETALLE_PEDIDO`
WHERE `ID_DETALLE_PEDIDO` = p_ID_DETALLE_PEDIDO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DELETE_T_ENTREGA_PEDIDO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_T_ENTREGA_PEDIDO`(
IN p_ID_ENTREGA_PEDIDO int(11))
BEGIN
DELETE FROM `T_ENTREGA_PEDIDO`
WHERE `ID_ENTREGA_PEDIDO` = p_ID_ENTREGA_PEDIDO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DELETE_T_MUNICIPIOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_T_MUNICIPIOS`(
IN p_ID_MUNICIPIO int(11))
BEGIN
DELETE FROM `T_MUNICIPIOS`
WHERE `ID_MUNICIPIO` = p_ID_MUNICIPIO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DELETE_T_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_T_PRODUCTO`(
IN p_ID_PRODUCTO varchar(255))
BEGIN
DELETE FROM `T_PRODUCTO`
WHERE `ID_PRODUCTO` = p_ID_PRODUCTO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DELETE_T_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_T_USUARIO`(
IN p_ID_USUARIO int(11))
BEGIN
DELETE FROM `T_USUARIO`
WHERE `ID_USUARIO` = p_ID_USUARIO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_T_AGENCIA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_T_AGENCIA`(
IN p_ID_AGENCIA int(11), 
IN p_ID_MUNICIPIO int(11), 
IN p_NOMBRE_AGENCIA varchar(255)
)
BEGIN
INSERT INTO `T_AGENCIA`(`ID_AGENCIA`, `ID_MUNICIPIO`, `NOMBRE_AGENCIA`) 
VALUES (p_ID_AGENCIA, p_ID_MUNICIPIO, p_NOMBRE_AGENCIA);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_T_DEPARTAMENTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_T_DEPARTAMENTO`(
IN p_ID_DEPARTAMENTO int(11), 
IN p_NOMBRE_DEPARTAMENTO varchar(255)
)
BEGIN
INSERT INTO `T_DEPARTAMENTO`(`ID_DEPARTAMENTO`, `NOMBRE_DEPARTAMENTO`) 
VALUES (p_ID_DEPARTAMENTO, p_NOMBRE_DEPARTAMENTO);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_T_DETALLE_PEDIDO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_T_DETALLE_PEDIDO`(
IN p_ID_DETALLE_PEDIDO int(11), 
IN p_ID_PRODUCTO varchar(255), 
IN p_FECHA_PEDIDO datetime, 
IN p_CANTIDAD int(11)
)
BEGIN
INSERT INTO `T_DETALLE_PEDIDO`(`ID_DETALLE_PEDIDO`, `ID_PRODUCTO`, `FECHA_PEDIDO`, `CANTIDAD`) 
VALUES (p_ID_DETALLE_PEDIDO, p_ID_PRODUCTO, p_FECHA_PEDIDO, p_CANTIDAD);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_T_ENTREGA_PEDIDO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_T_ENTREGA_PEDIDO`(
IN p_ID_ENTREGA_PEDIDO int(11), 
IN p_ID_USUARIO int(11), 
IN p_FECHA_ENTREGA_PEDIDO date, 
IN p_HORA_ENTREGA_PEDIDO time, 
IN p_T_DETALLE_PEDIDO_ID_DETALLE_PEDIDO int(11)
)
BEGIN
INSERT INTO `T_ENTREGA_PEDIDO`(`ID_ENTREGA_PEDIDO`, `ID_USUARIO`, `FECHA_ENTREGA_PEDIDO`, `HORA_ENTREGA_PEDIDO`, 
`T_DETALLE_PEDIDO_ID_DETALLE_PEDIDO`) 
VALUES (p_ID_ENTREGA_PEDIDO, p_ID_USUARIO, p_FECHA_ENTREGA_PEDIDO, p_HORA_ENTREGA_PEDIDO, 
p_T_DETALLE_PEDIDO_ID_DETALLE_PEDIDO);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_T_MUNICIPIOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_T_MUNICIPIOS`(
IN p_ID_MUNICIPIO int(11), 
IN p_ID_DEPARTAMENTO int(11), 
IN p_NOMBRE_MUNICIPIO varchar(100)
)
BEGIN
INSERT INTO `T_MUNICIPIOS`(`ID_MUNICIPIO`, `ID_DEPARTAMENTO`, `NOMBRE_MUNICIPIO`) 
VALUES (p_ID_MUNICIPIO, p_ID_DEPARTAMENTO, p_NOMBRE_MUNICIPIO);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_T_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_T_PRODUCTO`(
IN p_ID_PRODUCTO varchar(255), 
IN p_NOMBRE_PRODUCTO varchar(100), 
IN p_DESCRIPCION_PRODUCTO varchar(100), 
IN p_EXISTENCIA_PRODUCTO int(11)
)
BEGIN
INSERT INTO `T_PRODUCTO`(`ID_PRODUCTO`, `NOMBRE_PRODUCTO`, `DESCRIPCION_PRODUCTO`, `EXISTENCIA_PRODUCTO`) 
VALUES (p_ID_PRODUCTO, p_NOMBRE_PRODUCTO, p_DESCRIPCION_PRODUCTO, p_EXISTENCIA_PRODUCTO);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_T_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_T_USUARIO`(
IN p_ID_USUARIO int(11), 
IN p_ID_AGENCIA int(11), 
IN p_ID_MUNICIPIO int(11), 
IN p_PRIMER_NOMBRE varchar(50), 
IN p_SEGUNDO_NOMBRE varchar(50), 
IN p_TERCER_NOMBRE varchar(50), 
IN p_PRIMER_APELLIDO varchar(50), 
IN p_SEGUNDO_APELLIDO varchar(50), 
IN p_TELEFONO varchar(20), 
IN p_DIRECCION varchar(50)
)
BEGIN
INSERT INTO `T_USUARIO`(`ID_USUARIO`, `ID_AGENCIA`, `ID_MUNICIPIO`, `PRIMER_NOMBRE`, 
`SEGUNDO_NOMBRE`, `TERCER_NOMBRE`, `PRIMER_APELLIDO`, `SEGUNDO_APELLIDO`, 
`TELEFONO`, `DIRECCION`) 
VALUES (p_ID_USUARIO, p_ID_AGENCIA, p_ID_MUNICIPIO, p_PRIMER_NOMBRE, 
p_SEGUNDO_NOMBRE, p_TERCER_NOMBRE, p_PRIMER_APELLIDO, p_SEGUNDO_APELLIDO, 
p_TELEFONO, p_DIRECCION);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_T_AGENCIA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_T_AGENCIA`()
BEGIN
SELECT `ID_AGENCIA`, `ID_MUNICIPIO`, `NOMBRE_AGENCIA`
FROM `T_AGENCIA`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_T_DEPARTAMENTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_T_DEPARTAMENTO`()
BEGIN
SELECT `ID_DEPARTAMENTO`, `NOMBRE_DEPARTAMENTO`
FROM `T_DEPARTAMENTO`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_T_DETALLE_PEDIDO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_T_DETALLE_PEDIDO`()
BEGIN
SELECT `ID_DETALLE_PEDIDO`, `ID_PRODUCTO`, `FECHA_PEDIDO`, `CANTIDAD`
FROM `T_DETALLE_PEDIDO`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_T_ENTREGA_PEDIDO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_T_ENTREGA_PEDIDO`()
BEGIN
SELECT `ID_ENTREGA_PEDIDO`, `ID_USUARIO`, `FECHA_ENTREGA_PEDIDO`, `HORA_ENTREGA_PEDIDO`, 
`T_DETALLE_PEDIDO_ID_DETALLE_PEDIDO`
FROM `T_ENTREGA_PEDIDO`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_T_MUNICIPIOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_T_MUNICIPIOS`()
BEGIN
SELECT `ID_MUNICIPIO`, `ID_DEPARTAMENTO`, `NOMBRE_MUNICIPIO`
FROM `T_MUNICIPIOS`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_T_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_T_PRODUCTO`()
BEGIN
SELECT `ID_PRODUCTO`, `NOMBRE_PRODUCTO`, `DESCRIPCION_PRODUCTO`, `EXISTENCIA_PRODUCTO`
FROM `T_PRODUCTO`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_T_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_T_USUARIO`()
BEGIN
SELECT `ID_USUARIO`, `ID_AGENCIA`, `ID_MUNICIPIO`, `PRIMER_NOMBRE`, 
`SEGUNDO_NOMBRE`, `TERCER_NOMBRE`, `PRIMER_APELLIDO`, `SEGUNDO_APELLIDO`, 
`TELEFONO`, `DIRECCION`
FROM `T_USUARIO`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_T_AGENCIA_SELECT_CODIGO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_T_AGENCIA_SELECT_CODIGO`(
IN p_ID_AGENCIA int(11))
BEGIN
SELECT `ID_AGENCIA`, `ID_MUNICIPIO`, `NOMBRE_AGENCIA`
FROM `T_AGENCIA`
WHERE `ID_AGENCIA` = p_ID_AGENCIA;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_T_DEPARTAMENTO_SELECT_CODIGO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_T_DEPARTAMENTO_SELECT_CODIGO`(
IN p_ID_DEPARTAMENTO int(11))
BEGIN
SELECT `ID_DEPARTAMENTO`, `NOMBRE_DEPARTAMENTO`
FROM `T_DEPARTAMENTO`
WHERE `ID_DEPARTAMENTO` = p_ID_DEPARTAMENTO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_T_DETALLE_PEDIDO_SELECT_CODIGO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_T_DETALLE_PEDIDO_SELECT_CODIGO`(
IN p_ID_DETALLE_PEDIDO int(11))
BEGIN
SELECT `ID_DETALLE_PEDIDO`, `ID_PRODUCTO`, `FECHA_PEDIDO`, `CANTIDAD`
FROM `T_DETALLE_PEDIDO`
WHERE `ID_DETALLE_PEDIDO` = p_ID_DETALLE_PEDIDO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_T_ENTREGA_PEDIDO_SELECT_CODIGO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_T_ENTREGA_PEDIDO_SELECT_CODIGO`(
IN p_ID_ENTREGA_PEDIDO int(11))
BEGIN
SELECT `ID_ENTREGA_PEDIDO`, `ID_USUARIO`, `FECHA_ENTREGA_PEDIDO`, `HORA_ENTREGA_PEDIDO`, 
`T_DETALLE_PEDIDO_ID_DETALLE_PEDIDO`
FROM `T_ENTREGA_PEDIDO`
WHERE `ID_ENTREGA_PEDIDO` = p_ID_ENTREGA_PEDIDO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_T_MUNICIPIOS_SELECT_CODIGO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_T_MUNICIPIOS_SELECT_CODIGO`(
IN p_ID_MUNICIPIO int(11))
BEGIN
SELECT `ID_MUNICIPIO`, `ID_DEPARTAMENTO`, `NOMBRE_MUNICIPIO`
FROM `T_MUNICIPIOS`
WHERE `ID_MUNICIPIO` = p_ID_MUNICIPIO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_T_PRODUCTO_SELECT_CODIGO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_T_PRODUCTO_SELECT_CODIGO`(
IN p_ID_PRODUCTO varchar(255))
BEGIN
SELECT `ID_PRODUCTO`, `NOMBRE_PRODUCTO`, `DESCRIPCION_PRODUCTO`, `EXISTENCIA_PRODUCTO`
FROM `T_PRODUCTO`
WHERE `ID_PRODUCTO` = p_ID_PRODUCTO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_T_USUARIO_SELECT_CODIGO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_T_USUARIO_SELECT_CODIGO`(
IN p_ID_USUARIO int(11))
BEGIN
SELECT `ID_USUARIO`, `ID_AGENCIA`, `ID_MUNICIPIO`, `PRIMER_NOMBRE`, 
`SEGUNDO_NOMBRE`, `TERCER_NOMBRE`, `PRIMER_APELLIDO`, `SEGUNDO_APELLIDO`, 
`TELEFONO`, `DIRECCION`
FROM `T_USUARIO`
WHERE `ID_USUARIO` = p_ID_USUARIO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UPDATE_T_AGENCIA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_T_AGENCIA`(
IN p_ID_AGENCIA int(11), 
IN p_ID_MUNICIPIO int(11), 
IN p_NOMBRE_AGENCIA varchar(255)
)
BEGIN
UPDATE `T_AGENCIA` 
SET `ID_MUNICIPIO` = p_ID_MUNICIPIO, `NOMBRE_AGENCIA` = p_NOMBRE_AGENCIA
WHERE `ID_AGENCIA` = p_ID_AGENCIA;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UPDATE_T_DEPARTAMENTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_T_DEPARTAMENTO`(
IN p_ID_DEPARTAMENTO int(11), 
IN p_NOMBRE_DEPARTAMENTO varchar(255)
)
BEGIN
UPDATE `T_DEPARTAMENTO` 
SET `NOMBRE_DEPARTAMENTO` = p_NOMBRE_DEPARTAMENTO
WHERE `ID_DEPARTAMENTO` = p_ID_DEPARTAMENTO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UPDATE_T_DETALLE_PEDIDO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_T_DETALLE_PEDIDO`(
IN p_ID_DETALLE_PEDIDO int(11), 
IN p_ID_PRODUCTO varchar(255), 
IN p_FECHA_PEDIDO datetime, 
IN p_CANTIDAD int(11)
)
BEGIN
UPDATE `T_DETALLE_PEDIDO` 
SET `ID_PRODUCTO` = p_ID_PRODUCTO, `FECHA_PEDIDO` = p_FECHA_PEDIDO, `CANTIDAD` = p_CANTIDAD
WHERE `ID_DETALLE_PEDIDO` = p_ID_DETALLE_PEDIDO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UPDATE_T_ENTREGA_PEDIDO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_T_ENTREGA_PEDIDO`(
IN p_ID_ENTREGA_PEDIDO int(11), 
IN p_ID_USUARIO int(11), 
IN p_FECHA_ENTREGA_PEDIDO date, 
IN p_HORA_ENTREGA_PEDIDO time, 
IN p_T_DETALLE_PEDIDO_ID_DETALLE_PEDIDO int(11)
)
BEGIN
UPDATE `T_ENTREGA_PEDIDO` 
SET `ID_USUARIO` = p_ID_USUARIO, `FECHA_ENTREGA_PEDIDO` = p_FECHA_ENTREGA_PEDIDO, `HORA_ENTREGA_PEDIDO` = p_HORA_ENTREGA_PEDIDO, `T_DETALLE_PEDIDO_ID_DETALLE_PEDIDO` = p_T_DETALLE_PEDIDO_ID_DETALLE_PEDIDO
WHERE `ID_ENTREGA_PEDIDO` = p_ID_ENTREGA_PEDIDO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UPDATE_T_MUNICIPIOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_T_MUNICIPIOS`(
IN p_ID_MUNICIPIO int(11), 
IN p_ID_DEPARTAMENTO int(11), 
IN p_NOMBRE_MUNICIPIO varchar(100)
)
BEGIN
UPDATE `T_MUNICIPIOS` 
SET `ID_DEPARTAMENTO` = p_ID_DEPARTAMENTO, `NOMBRE_MUNICIPIO` = p_NOMBRE_MUNICIPIO
WHERE `ID_MUNICIPIO` = p_ID_MUNICIPIO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UPDATE_T_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_T_PRODUCTO`(
IN p_ID_PRODUCTO varchar(255), 
IN p_NOMBRE_PRODUCTO varchar(100), 
IN p_DESCRIPCION_PRODUCTO varchar(100), 
IN p_EXISTENCIA_PRODUCTO int(11)
)
BEGIN
UPDATE `T_PRODUCTO` 
SET `NOMBRE_PRODUCTO` = p_NOMBRE_PRODUCTO, `DESCRIPCION_PRODUCTO` = p_DESCRIPCION_PRODUCTO, `EXISTENCIA_PRODUCTO` = p_EXISTENCIA_PRODUCTO
WHERE `ID_PRODUCTO` = p_ID_PRODUCTO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UPDATE_T_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_T_USUARIO`(
IN p_ID_USUARIO int(11), 
IN p_ID_AGENCIA int(11), 
IN p_ID_MUNICIPIO int(11), 
IN p_PRIMER_NOMBRE varchar(50), 
IN p_SEGUNDO_NOMBRE varchar(50), 
IN p_TERCER_NOMBRE varchar(50), 
IN p_PRIMER_APELLIDO varchar(50), 
IN p_SEGUNDO_APELLIDO varchar(50), 
IN p_TELEFONO varchar(20), 
IN p_DIRECCION varchar(50)
)
BEGIN
UPDATE `T_USUARIO` 
SET `ID_AGENCIA` = p_ID_AGENCIA, `ID_MUNICIPIO` = p_ID_MUNICIPIO, `PRIMER_NOMBRE` = p_PRIMER_NOMBRE, `SEGUNDO_NOMBRE` = p_SEGUNDO_NOMBRE, 
`TERCER_NOMBRE` = p_TERCER_NOMBRE, `PRIMER_APELLIDO` = p_PRIMER_APELLIDO, `SEGUNDO_APELLIDO` = p_SEGUNDO_APELLIDO, `TELEFONO` = p_TELEFONO, 
`DIRECCION` = p_DIRECCION
WHERE `ID_USUARIO` = p_ID_USUARIO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-23 19:43:41
