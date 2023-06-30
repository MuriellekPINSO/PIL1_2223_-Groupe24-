

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add classes',7,'add_classes'),(26,'Can change classes',7,'change_classes'),(27,'Can delete classes',7,'delete_classes'),(28,'Can view classes',7,'view_classes'),(29,'Can add cours',8,'add_cours'),(30,'Can change cours',8,'change_cours'),(31,'Can delete cours',8,'delete_cours'),(32,'Can view cours',8,'view_cours'),(33,'Can add filiere',9,'add_filiere'),(34,'Can change filiere',9,'change_filiere'),(35,'Can delete filiere',9,'delete_filiere'),(36,'Can view filiere',9,'view_filiere'),(37,'Can add salle',10,'add_salle'),(38,'Can change salle',10,'change_salle'),(39,'Can delete salle',10,'delete_salle'),(40,'Can view salle',10,'view_salle'),(41,'Can add programme',11,'add_programme'),(42,'Can change programme',11,'change_programme'),(43,'Can delete programme',11,'delete_programme'),(44,'Can view programme',11,'view_programme'),(45,'Can add emplois',12,'add_emplois'),(46,'Can change emplois',12,'change_emplois'),(47,'Can delete emplois',12,'delete_emplois'),(48,'Can view emplois',12,'view_emplois'),(49,'Can add semaine',13,'add_semaine'),(50,'Can change semaine',13,'change_semaine'),(51,'Can delete semaine',13,'delete_semaine'),(52,'Can view semaine',13,'view_semaine'),(53,'Can add enseignant',14,'add_enseignant'),(54,'Can change enseignant',14,'change_enseignant'),(55,'Can delete enseignant',14,'delete_enseignant'),(56,'Can view enseignant',14,'view_enseignant'),(57,'Can add niveau',15,'add_niveau'),(58,'Can change niveau',15,'change_niveau'),(59,'Can delete niveau',15,'delete_niveau'),(60,'Can view niveau',15,'view_niveau'),(61,'Can add communique',16,'add_communique'),(62,'Can change communique',16,'change_communique'),(63,'Can delete communique',16,'delete_communique'),(64,'Can view communique',16,'view_communique');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$Cih6tfww2JRbHa2YaSuFeq$R1UNPkA7rRW6QXJVGXG7lOmxmM4wovK3lNYmpYYsJa4=','2023-06-29 19:44:48.060175',0,'55555','MURI','KPINSO','MURI@gmail.com',0,1,'2023-06-28 19:25:06.084393'),(2,'pbkdf2_sha256$600000$DskPO4skFVh4aSo7c8hTge$tceTNAZn/+3PaS+Vcbs0M0zKL49EdlNGtJcSV+RrgXs=','2023-06-29 14:39:38.016011',0,'19871122','Khalid','TCHIBOZO','khalidtchibozo@gmail.com',0,1,'2023-06-29 14:39:33.007987'),(3,'pbkdf2_sha256$600000$6hViHTPoqMmbeGUFM7XlNL$cy/adg0tGaUFKdvrsgBYIqe4ZpcFljnUC9kC//aTQ9U=','2023-06-29 19:46:06.542758',0,'1111111','JIJ','LILI','JIJ@gmail.com',0,1,'2023-06-29 19:43:54.421769'),(4,'pbkdf2_sha256$600000$ngLYvCGsICliuvocof4aJB$MW/QjnCQ3ao+nYHmLaN4yo0c3CHITNHVktLVyLVSwlE=','2023-06-29 20:16:02.831364',0,'77777777','HHHHHHHHHHHHH','kml','gggggggggggggggg@gmail.com',0,1,'2023-06-29 20:15:35.633963');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'home','classes'),(16,'home','communique'),(8,'home','cours'),(12,'home','emplois'),(14,'home','enseignant'),(9,'home','filiere'),(15,'home','niveau'),(11,'home','programme'),(10,'home','salle'),(13,'home','semaine'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-06-28 19:23:19.834834'),(2,'auth','0001_initial','2023-06-28 19:23:24.231054'),(3,'admin','0001_initial','2023-06-28 19:23:24.950398'),(4,'admin','0002_logentry_remove_auto_add','2023-06-28 19:23:25.016045'),(5,'admin','0003_logentry_add_action_flag_choices','2023-06-28 19:23:25.071690'),(6,'contenttypes','0002_remove_content_type_name','2023-06-28 19:23:25.516880'),(7,'auth','0002_alter_permission_name_max_length','2023-06-28 19:23:25.679669'),(8,'auth','0003_alter_user_email_max_length','2023-06-28 19:23:25.831022'),(9,'auth','0004_alter_user_username_opts','2023-06-28 19:23:25.905127'),(10,'auth','0005_alter_user_last_login_null','2023-06-28 19:23:26.184850'),(11,'auth','0006_require_contenttypes_0002','2023-06-28 19:23:26.217451'),(12,'auth','0007_alter_validators_add_error_messages','2023-06-28 19:23:26.285154'),(13,'auth','0008_alter_user_username_max_length','2023-06-28 19:23:26.412166'),(14,'auth','0009_alter_user_last_name_max_length','2023-06-28 19:23:26.602012'),(15,'auth','0010_alter_group_name_max_length','2023-06-28 19:23:26.748093'),(16,'auth','0011_update_proxy_permissions','2023-06-28 19:23:26.834418'),(17,'auth','0012_alter_user_first_name_max_length','2023-06-28 19:23:26.994096'),(18,'home','0001_initial','2023-06-28 19:23:29.413699'),(19,'home','0002_semaine','2023-06-28 19:23:29.753200'),(20,'home','0003_enseignant','2023-06-28 19:23:30.282787'),(21,'home','0004_delete_enseignant','2023-06-28 19:23:30.432579'),(22,'home','0005_enseignant','2023-06-28 19:23:31.286309'),(23,'home','0006_delete_enseignant','2023-06-28 19:23:31.420608'),(24,'home','0007_enseignant','2023-06-28 19:23:32.180632'),(25,'home','0008_semaine_date_debut_semaine_date_fin','2023-06-28 19:23:32.395088'),(26,'home','0009_niveau','2023-06-28 19:23:32.768111'),(27,'home','0010_cours_niveau','2023-06-28 19:23:33.237535'),(28,'home','0011_cours_filiere','2023-06-28 19:23:33.950283'),(29,'home','0012_rename_salle_programme_salle_remove_programme_cours_and_more','2023-06-28 19:23:38.315536'),(30,'home','0013_alter_programme_jour','2023-06-28 19:23:38.932763'),(31,'home','0014_alter_programme_heure_deb_alter_programme_heure_fin','2023-06-28 19:23:40.096325'),(32,'home','0015_alter_programme_jour','2023-06-28 19:23:40.804844'),(33,'home','0016_programme_publich','2023-06-28 19:23:40.955758'),(34,'home','0017_semaine_publich','2023-06-28 19:23:41.087176'),(35,'home','0018_remove_programme_publich','2023-06-28 19:23:41.219128'),(36,'home','0019_programme_enseignant','2023-06-28 19:23:42.098676'),(37,'home','0020_programmefiliere','2023-06-28 19:23:43.218814'),(38,'home','0021_delete_programmefiliere','2023-06-28 19:23:43.315759'),(39,'home','0022_remove_programme_filiere','2023-06-28 19:23:44.278054'),(40,'home','0023_programme_filieres','2023-06-28 19:23:46.236785'),(41,'sessions','0001_initial','2023-06-28 19:23:47.171347'),(42,'home','0024_communique','2023-06-29 19:00:20.724294');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('ac9iqb22gznyvlhzo7k46bqipalb7048','.eJxVjMsOgjAURP-la9OUS2mpS_d8Q3MfraCmJBRWxn8XEha6nDln5q0ibusYt5qWOIm6qkZdfjtCfqZyAHlguc-a57IuE-lD0SetepglvW6n-3cwYh33dZsgOBCykA27YKzvek-55yBoO8_OUBsAMPVNJqEGDcsec4aOnGerPl_deTgr:1qEwRe:a6ztRsjInYWnmvfwuG9gcEtxH0tonwa3zKCAITaaHQA','2023-07-13 18:32:42.780678'),('dtwgtcs0w43y824nbd09ewta4n2vifvm','.eJxVjEEOwiAQRe_C2hCgAxSX7j0DGWZQqgaS0q6Md7dNutDtf-_9t4i4LiWuPc9xYnEWIE6_W0J65roDfmC9N0mtLvOU5K7Ig3Z5bZxfl8P9OyjYy1abISTDZnSACnVW5PFGKYAKgBugkUIOzDAkbwfLFp31QNqBsY60cuLzBelLN5o:1qEy3e:11Hi2kJmCLzb78sIt69LsFsv8qYIWVj1eLkCyPD_h8w','2023-07-13 20:16:02.869341');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_classes`
--

DROP TABLE IF EXISTS `home_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_classes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom_classes` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_classes`
--

LOCK TABLES `home_classes` WRITE;
/*!40000 ALTER TABLE `home_classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `home_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_communique`
--

DROP TABLE IF EXISTS `home_communique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_communique` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `contenu` varchar(255) NOT NULL,
  `date_commu` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_communique`
--

LOCK TABLES `home_communique` WRITE;
/*!40000 ALTER TABLE `home_communique` DISABLE KEYS */;
INSERT INTO `home_communique` VALUES (1,'gggggg','jjjjjjjjj','2023-06-29');
/*!40000 ALTER TABLE `home_communique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_cours`
--

DROP TABLE IF EXISTS `home_cours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_cours` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom_cours` varchar(64) NOT NULL,
  `niveau_id` bigint DEFAULT NULL,
  `filiere_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `home_cours_niveau_id_81bb223e_fk_home_niveau_id` (`niveau_id`),
  KEY `home_cours_filiere_id_09817b3b_fk_home_filiere_id` (`filiere_id`),
  CONSTRAINT `home_cours_filiere_id_09817b3b_fk_home_filiere_id` FOREIGN KEY (`filiere_id`) REFERENCES `home_filiere` (`id`),
  CONSTRAINT `home_cours_niveau_id_81bb223e_fk_home_niveau_id` FOREIGN KEY (`niveau_id`) REFERENCES `home_niveau` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_cours`
--

LOCK TABLES `home_cours` WRITE;
/*!40000 ALTER TABLE `home_cours` DISABLE KEYS */;
INSERT INTO `home_cours` VALUES (1,'BD',1,1);
/*!40000 ALTER TABLE `home_cours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_emplois`
--

DROP TABLE IF EXISTS `home_emplois`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_emplois` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `annee` varchar(64) NOT NULL,
  `date` date NOT NULL,
  `Filiere_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `home_emplois_Filiere_id_3da383ee_fk_home_filiere_id` (`Filiere_id`),
  CONSTRAINT `home_emplois_Filiere_id_3da383ee_fk_home_filiere_id` FOREIGN KEY (`Filiere_id`) REFERENCES `home_filiere` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_emplois`
--

LOCK TABLES `home_emplois` WRITE;
/*!40000 ALTER TABLE `home_emplois` DISABLE KEYS */;
/*!40000 ALTER TABLE `home_emplois` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_enseignant`
--

DROP TABLE IF EXISTS `home_enseignant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_enseignant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `filiere_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `home_enseignant_filiere_id_58657893_fk_home_filiere_id` (`filiere_id`),
  CONSTRAINT `home_enseignant_filiere_id_58657893_fk_home_filiere_id` FOREIGN KEY (`filiere_id`) REFERENCES `home_filiere` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_enseignant`
--

LOCK TABLES `home_enseignant` WRITE;
/*!40000 ALTER TABLE `home_enseignant` DISABLE KEYS */;
INSERT INTO `home_enseignant` VALUES (1,'KPINSO','Pascaline','345678',1);
/*!40000 ALTER TABLE `home_enseignant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_filiere`
--

DROP TABLE IF EXISTS `home_filiere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_filiere` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_filiere`
--

LOCK TABLES `home_filiere` WRITE;
/*!40000 ALTER TABLE `home_filiere` DISABLE KEYS */;
INSERT INTO `home_filiere` VALUES (1,'im');
/*!40000 ALTER TABLE `home_filiere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_niveau`
--

DROP TABLE IF EXISTS `home_niveau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_niveau` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_niveau`
--

LOCK TABLES `home_niveau` WRITE;
/*!40000 ALTER TABLE `home_niveau` DISABLE KEYS */;
INSERT INTO `home_niveau` VALUES (1,'Licenc1'),(2,'Licence 2');
/*!40000 ALTER TABLE `home_niveau` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_programme`
--

DROP TABLE IF EXISTS `home_programme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_programme` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `jour` varchar(20) NOT NULL,
  `heure_deb` int NOT NULL,
  `heure_fin` int NOT NULL,
  `salle_id` bigint NOT NULL,
  `niveau_id` bigint DEFAULT NULL,
  `semaine_id` bigint DEFAULT NULL,
  `cours_id` bigint DEFAULT NULL,
  `enseignant_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `home_programme_salle_id_b8fb0689_fk_home_salle_id` (`salle_id`),
  KEY `home_programme_niveau_id_c9470574_fk_home_niveau_id` (`niveau_id`),
  KEY `home_programme_semaine_id_860218a9_fk_home_semaine_id` (`semaine_id`),
  KEY `home_programme_cours_id_e13747ee_fk_home_cours_id` (`cours_id`),
  KEY `home_programme_enseignant_id_66e4638c_fk_home_enseignant_id` (`enseignant_id`),
  CONSTRAINT `home_programme_cours_id_e13747ee_fk_home_cours_id` FOREIGN KEY (`cours_id`) REFERENCES `home_cours` (`id`),
  CONSTRAINT `home_programme_enseignant_id_66e4638c_fk_home_enseignant_id` FOREIGN KEY (`enseignant_id`) REFERENCES `home_enseignant` (`id`),
  CONSTRAINT `home_programme_niveau_id_c9470574_fk_home_niveau_id` FOREIGN KEY (`niveau_id`) REFERENCES `home_niveau` (`id`),
  CONSTRAINT `home_programme_salle_id_b8fb0689_fk_home_salle_id` FOREIGN KEY (`salle_id`) REFERENCES `home_salle` (`id`),
  CONSTRAINT `home_programme_semaine_id_860218a9_fk_home_semaine_id` FOREIGN KEY (`semaine_id`) REFERENCES `home_semaine` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_programme`
--

LOCK TABLES `home_programme` WRITE;
/*!40000 ALTER TABLE `home_programme` DISABLE KEYS */;
INSERT INTO `home_programme` VALUES (1,'Jeudi',10,11,1,2,1,1,1),(2,'Mercredi',9,13,1,1,1,1,1);
/*!40000 ALTER TABLE `home_programme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_programme_filieres`
--

DROP TABLE IF EXISTS `home_programme_filieres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_programme_filieres` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `programme_id` bigint NOT NULL,
  `filiere_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `home_programme_filieres_programme_id_filiere_id_c683b0a0_uniq` (`programme_id`,`filiere_id`),
  KEY `home_programme_filieres_filiere_id_dfeb6a30_fk_home_filiere_id` (`filiere_id`),
  CONSTRAINT `home_programme_filie_programme_id_dfbfde93_fk_home_prog` FOREIGN KEY (`programme_id`) REFERENCES `home_programme` (`id`),
  CONSTRAINT `home_programme_filieres_filiere_id_dfeb6a30_fk_home_filiere_id` FOREIGN KEY (`filiere_id`) REFERENCES `home_filiere` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_programme_filieres`
--

LOCK TABLES `home_programme_filieres` WRITE;
/*!40000 ALTER TABLE `home_programme_filieres` DISABLE KEYS */;
INSERT INTO `home_programme_filieres` VALUES (1,1,1),(2,2,1);
/*!40000 ALTER TABLE `home_programme_filieres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_salle`
--

DROP TABLE IF EXISTS `home_salle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_salle` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom_Salle` varchar(20) NOT NULL,
  `capacite_Salle` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_salle`
--

LOCK TABLES `home_salle` WRITE;
/*!40000 ALTER TABLE `home_salle` DISABLE KEYS */;
INSERT INTO `home_salle` VALUES (1,'iran',300);
/*!40000 ALTER TABLE `home_salle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_semaine`
--

DROP TABLE IF EXISTS `home_semaine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_semaine` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nemuro_semaine` int NOT NULL,
  `annee_scolaire` varchar(25) NOT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `publich` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_semaine`
--

LOCK TABLES `home_semaine` WRITE;
/*!40000 ALTER TABLE `home_semaine` DISABLE KEYS */;
INSERT INTO `home_semaine` VALUES (1,1,'2022-2023','2023-06-30','2023-08-06',1),(3,3,'2022-2023','2023-06-29','2023-07-01',0);
/*!40000 ALTER TABLE `home_semaine` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-29 21:46:17
