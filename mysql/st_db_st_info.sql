--CREATE DATABASE  IF NOT EXISTS `st_db` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
--USE `st_db`;

--DROP TABLE IF EXISTS `st_info`;

CREATE TABLE `st_info` (
  `ST_ID` int(11) NOT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `DEPT` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--INSERT INTO `st_info` VALUES (202501,'LeeGilDong','Game'),(202502,'KimGilDong','Computer'),(202503,'HongGilDong','Computer');
