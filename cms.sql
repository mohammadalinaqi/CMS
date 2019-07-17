CREATE DATABASE  IF NOT EXISTS `cms` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_persian_ci */;
USE `cms`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: cms
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'علوم پایه',0),(2,'فنی و مهندسی',0),(3,'علوم انسانی',0),(4,'پزشکی',0),(5,'هنر',0),(6,'ادبیات',0),(7,'فیزیک',1),(8,'ریاضیات',1),(9,'شیمی',1),(10,'مهندسی برق',2),(11,'مهندسی کامپیوتر',2),(12,'مهندسی مکانیک',2),(13,'مهندسی عمران',2),(14,'مهندسی معدن',2),(15,'حقوق',3),(16,'روانشناسی',3),(17,'الهیات',3),(18,'جامعه شناسی',3),(19,'قلب و عروق',4),(20,'دهان و دندان',4),(21,'زنان و زایمان',4),(22,'طب سنتی',4),(23,'تئاتر',5),(24,'نقاشی',5),(25,'مینیاتور',5),(26,'صنایع دستی',5),(27,'دیوان اشعار',6),(28,'دستور زبان',6),(29,'تاریخ ادبیات',6);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(70) COLLATE utf8_persian_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_persian_ci NOT NULL,
  `website` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  `comment` text COLLATE utf8_persian_ci NOT NULL,
  `comment_time` int(11) NOT NULL,
  `user_ip` varchar(45) COLLATE utf8_persian_ci NOT NULL,
  `post_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id_idx` (`post_id`),
  CONSTRAINT `post_id` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'علی','','','سلام<br />\r\n این یک این یک دیدگاه آزمایشی است.<br />\r\nاین یک این یک دیدگاه آزمایشی است.<br />\r\nاین یک این یک دیدگاه آزمایشی است.<br />\r\nاین یک این یک دیدگاه آزمایشی است.<br />\r\nاین یک این یک دیدگاه آزمایشی است. ',1411235957,'::1',13,0),(2,'محمد','','','سلام<br />\r\n این یک این یک پاسخ آزمایشی است.<br />\r\nاین یک این یک پاسخ آزمایشی است.<br />\r\nاین یک این یک پاسخ آزمایشی است.<br />\r\nاین یک این یک پاسخ آزمایشی است.<br />\r\nاین یک این یک پاسخ آزمایشی است. ',1411235988,'::1',13,1),(3,'عباس','','','سلام<br />\r\n این یک این یک دیدگاه آزمایشی است.<br />\r\nاین یک این یک دیدگاه آزمایشی است.<br />\r\nاین یک این یک دیدگاه آزمایشی است.<br />\r\nاین یک این یک دیدگاه آزمایشی است.<br />\r\nاین یک این یک دیدگاه آزمایشی است. ',1411236006,'::1',13,0);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(300) COLLATE utf8_persian_ci NOT NULL,
  `content` text COLLATE utf8_persian_ci NOT NULL,
  `post_type` tinyint(4) NOT NULL,
  `user_id` int(11) NOT NULL,
  `published` tinyint(4) NOT NULL,
  `allow_comments` tinyint(4) NOT NULL,
  `link` varchar(300) COLLATE utf8_persian_ci NOT NULL,
  `creation_time` int(11) NOT NULL,
  `last_modify` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'پست آزمایشی شماره 1','<p>پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1</p>\r\n\r\n<p>پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1</p>\r\n\r\n<p>پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1</p>\r\n\r\n<p>--more--</p>\r\n\r\n<p>پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1</p>\r\n\r\n<p>پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1</p>\r\n\r\n<p>پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1پست آزمایشی شماره 1</p>\r\n',1,1,1,1,'http://localhost/Example/download.zip',1411235262,1411235262),(2,'پست آزمایشی شماره 2','<p>پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2</p>\r\n\r\n<p>پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2</p>\r\n\r\n<p>پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2</p>\r\n\r\n<p>--more--</p>\r\n\r\n<p>پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2</p>\r\n\r\n<p>پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2</p>\r\n\r\n<p>پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2</p>\r\n\r\n<p>پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2</p>\r\n\r\n<p>پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2پست آزمایشی شماره 2</p>\r\n',1,1,1,1,'http://localhost/Example/download.zip',1411235476,1411235476),(3,'پست آزمایشی شماره 3','<p>پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3</p>\r\n\r\n<p>--more--</p>\r\n\r\n<p>پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3</p>\r\n\r\n<p>پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3</p>\r\n\r\n<p>پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3</p>\r\n\r\n<p>پست آزمایشی شماره 3</p>\r\n\r\n<p>پست آزمایشی شماره 3</p>\r\n\r\n<p>پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3</p>\r\n\r\n<p>پست آزمایشی شماره 3</p>\r\n\r\n<p>پست آزمایشی شماره 3</p>\r\n\r\n<p>پست آزمایشی شماره 3پست آزمایشی شماره 3</p>\r\n\r\n<p>پست آزمایشی شماره 3پست آزمایشی شماره 3پست آزمایشی شماره 3</p>\r\n\r\n<p>پست آزمایشی شماره 3</p>\r\n\r\n<p>پست آزمایشی شماره 3</p>\r\n\r\n<p>پست آزمایشی شماره 3</p>\r\n',1,1,1,1,'http://localhost/Example/download.zip',1411235523,1411235523),(4,'پست آزمایشی شماره 4','<p>پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4</p>\r\n\r\n<p>پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4</p>\r\n\r\n<p>--more--</p>\r\n\r\n<p>پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4</p>\r\n\r\n<p>پست آزمایشی شماره 4</p>\r\n\r\n<p>پست آزمایشی شماره 4</p>\r\n\r\n<p>پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4</p>\r\n\r\n<p>پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4</p>\r\n\r\n<p>پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4پست آزمایشی شماره 4</p>\r\n',1,1,1,0,'http://localhost/Example/download.zip',1411235579,1411235579),(5,'پست آزمایشی شماره 5 ','<p>پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5</p>\r\n\r\n<p>--more--</p>\r\n\r\n<p>پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5</p>\r\n\r\n<p>پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5</p>\r\n\r\n<p>پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5</p>\r\n\r\n<p>پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5</p>\r\n\r\n<p>پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5</p>\r\n\r\n<p>پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5</p>\r\n\r\n<p>پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5 پست آزمایشی شماره 5</p>\r\n',1,1,1,1,'http://localhost/Example/download.zip',1411235623,1411235623),(6,'پست آزمایشی شماره 6 ','<p>پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6</p>\r\n\r\n<p>پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6</p>\r\n\r\n<p>پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6</p>\r\n\r\n<p>پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6</p>\r\n\r\n<p>--more--</p>\r\n\r\n<p>پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6</p>\r\n\r\n<p>پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6</p>\r\n\r\n<p>پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6</p>\r\n\r\n<p>پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6 پست آزمایشی شماره 6</p>\r\n',1,1,1,1,'http://localhost/Example/download.zip',1411235666,1411235666),(7,'پست آزمایشی شماره 7 ','<p>پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7</p>\r\n\r\n<p>--more--</p>\r\n\r\n<p>پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7</p>\r\n\r\n<p>پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7</p>\r\n\r\n<p>پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7</p>\r\n\r\n<p>پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7 پست آزمایشی شماره 7</p>\r\n',1,1,1,1,'http://localhost/Example/download.zip',1411235771,1411235771),(8,'پست آزمایشی شماره 8 ','<p>پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8</p>\r\n\r\n<p>--more--</p>\r\n\r\n<p>پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8</p>\r\n\r\n<p>پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8</p>\r\n\r\n<p>پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8</p>\r\n\r\n<p>پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8</p>\r\n\r\n<p>پست آزمایشی شماره 8</p>\r\n\r\n<p>پست آزمایشی شماره 8</p>\r\n\r\n<p>پست آزمایشی شماره 8</p>\r\n\r\n<p>پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8 پست آزمایشی شماره 8</p>\r\n',1,1,1,1,'http://localhost/Example/download.zip',1411235806,1411235806),(9,'پست آزمایشی شماره 9 ','<p>پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9</p>\r\n\r\n<p>--more--</p>\r\n\r\n<p>پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9</p>\r\n\r\n<p>پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9</p>\r\n\r\n<p>پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9</p>\r\n\r\n<p>پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9 پست آزمایشی شماره 9</p>\r\n',1,1,1,1,'http://localhost/Example/download.zip',1411235844,1411235844),(10,'پست آزمایشی شماره 10 ','<p>پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10</p>\r\n\r\n<p>--more--</p>\r\n\r\n<p>پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10</p>\r\n\r\n<p>پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10</p>\r\n\r\n<p>پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10</p>\r\n\r\n<p>پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10 پست آزمایشی شماره 10</p>\r\n',1,1,1,0,'http://localhost/Example/download.zip',1411235886,1411236147),(11,'درباره ما','<p>این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.</p>\r\n\r\n<p>این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.</p>\r\n\r\n<p>این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.</p>\r\n\r\n<p>این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.</p>\r\n\r\n<p>این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.</p>\r\n\r\n<p>این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.این یک برگه آزمایشی است.</p>\r\n',2,1,1,0,'',1411254005,1411254005),(12,'تماس با ما','<p>تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما</p>\r\n\r\n<p>تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما</p>\r\n\r\n<p>تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما ت</p>\r\n\r\n<p>تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما تماس با ما</p>\r\n',2,1,1,1,'',1411254113,1411254113),(13,'مطلب شماره 11','<p>مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11</p>\r\n\r\n<p><strong>مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11</strong></p>\r\n\r\n<p>مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11</p>\r\n\r\n<p>--more--</p>\r\n\r\n<p>مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11</p>\r\n\r\n<p>مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11</p>\r\n\r\n<p>مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11مطلب شماره 11</p>\r\n',1,1,1,1,'http://localhost/Example/download.zip',1411298328,1411313048);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_cats`
--

DROP TABLE IF EXISTS `posts_cats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts_cats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id_idx` (`post_id`),
  KEY `cat_id_idx` (`cat_id`),
  CONSTRAINT `cat_id` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `post_id2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_cats`
--

LOCK TABLES `posts_cats` WRITE;
/*!40000 ALTER TABLE `posts_cats` DISABLE KEYS */;
INSERT INTO `posts_cats` VALUES (1,1,1),(2,1,10),(3,1,11),(4,1,14),(5,2,9),(6,2,12),(7,2,20),(8,3,10),(9,3,11),(10,3,14),(11,3,17),(12,3,20),(13,3,23),(14,4,10),(15,4,11),(16,4,15),(17,4,24),(18,5,11),(19,5,14),(20,5,20),(21,5,29),(22,6,10),(23,6,11),(24,6,14),(25,7,2),(26,7,10),(27,7,11),(28,7,13),(29,8,7),(30,8,8),(31,8,9),(32,9,27),(33,9,28),(34,9,29),(43,10,7),(44,10,8),(45,10,10),(46,10,11),(49,13,8),(50,13,12);
/*!40000 ALTER TABLE `posts_cats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_types`
--

DROP TABLE IF EXISTS `user_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_types` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `user_type` varchar(45) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_types`
--

LOCK TABLES `user_types` WRITE;
/*!40000 ALTER TABLE `user_types` DISABLE KEYS */;
INSERT INTO `user_types` VALUES (1,'admin'),(2,'editor'),(3,'registered');
/*!40000 ALTER TABLE `user_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) COLLATE utf8_persian_ci NOT NULL,
  `user_pass` varchar(45) COLLATE utf8_persian_ci NOT NULL,
  `user_email` varchar(45) COLLATE utf8_persian_ci NOT NULL,
  `signup_time` int(11) NOT NULL,
  `first_name` varchar(45) COLLATE utf8_persian_ci NOT NULL,
  `last_name` varchar(45) COLLATE utf8_persian_ci NOT NULL,
  `activated` tinyint(4) NOT NULL,
  `activation_code` varchar(45) COLLATE utf8_persian_ci NOT NULL,
  `user_type` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_type_idx` (`user_type`),
  CONSTRAINT `user_type` FOREIGN KEY (`user_type`) REFERENCES `user_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','123','abbassac@gmail.com',1411111111,'عباس','مقدم',1,'22222211',1),(2,'ahmad','111111','ahmad.moosavi@gmail.com',1411200116,'احمد','موسوی',1,'6803253',2),(3,'mohammad','111111','phpcourseexample@gmail.com',1411200280,'محمد','موسوی',1,'6950195',3);
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

-- Dump completed on 2014-09-22  2:36:37
