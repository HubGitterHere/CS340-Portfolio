--
-- Table structure for table `bsg_planets`
--
SET FOREIGN_KEY_CHECKS = 0;
SET AUTOCOMMIT = 0;
DROP TABLE IF EXISTS `bsg_planets`;
CREATE TABLE `bsg_planets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `population` bigint(20) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `capital` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bsg_planets`
--

LOCK TABLES `bsg_planets` WRITE;
INSERT INTO `bsg_planets` VALUES (1,'Gemenon',2800000000,'Old Gemenese','Oranu'),(2,'Leonis',2600000000,'Leonese','Luminere'),(3,'Caprica',4900000000,'Caprican','Caprica City'),(7,'Sagittaron',1700000000,NULL,'Tawa'),(16,'Aquaria',25000,NULL,NULL),(17,'Canceron',6700000000,NULL,'Hades'),(18,'Libran',2100000,NULL,NULL),(19,'Picon',1400000000,NULL,'Queestown'),(20,'Scorpia',450000000,NULL,'Celeste'),(21,'Tauron',2500000000,'Tauron','Hypatia'),(22,'Virgon',4300000000,NULL,'Boskirk');
UNLOCK TABLES;

--
-- Table structure for table `bsg_cert`
--

DROP TABLE IF EXISTS `bsg_cert`;
CREATE TABLE `bsg_cert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bsg_cert`
--

LOCK TABLES `bsg_cert` WRITE;
INSERT INTO `bsg_cert` VALUES (1,'Raptor'),(2,'Viper'),(3,'Mechanic'),(4,'Command');
UNLOCK TABLES;

--
-- Table structure for table `bsg_people`
--

DROP TABLE IF EXISTS `bsg_people`;
CREATE TABLE `bsg_people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `homeworld` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `homeworld` (`homeworld`),
  CONSTRAINT `bsg_people_ibfk_1` FOREIGN KEY (`homeworld`) REFERENCES `bsg_planets` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bsg_people`
--

LOCK TABLES `bsg_people` WRITE;
INSERT INTO `bsg_people` VALUES (1,'William','Adama',3,61),(2,'Lee','Adama',3,30),(3,'Laura','Roslin',3,NULL),(4,'Kara','Thrace',3,NULL),(5,'Gaius','Baltar',3,NULL),(6,'Saul','Tigh',NULL,71),(7,'Karl','Agathon',1,NULL),(8,'Galen','Tyrol',1,32),(9,'Callandra','Henderson',NULL,NULL);
UNLOCK TABLES;

--
-- Table structure for table `bsg_cert_people`
--

DROP TABLE IF EXISTS `bsg_cert_people`;
CREATE TABLE `bsg_cert_people` (
  `cid` int(11) NOT NULL DEFAULT '0',
  `pid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`,`pid`),
  KEY `pid` (`pid`),
  CONSTRAINT `bsg_cert_people_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `bsg_cert` (`id`),
  CONSTRAINT `bsg_cert_people_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `bsg_people` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bsg_cert_people`
--

LOCK TABLES `bsg_cert_people` WRITE;
INSERT INTO `bsg_cert_people` VALUES (2,2),(4,2),(4,3),(2,4),(4,6),(1,7),(3,8),(3,9);
UNLOCK TABLES;
SET FOREIGN_KEY_CHECKS = 1;
COMMIT;
