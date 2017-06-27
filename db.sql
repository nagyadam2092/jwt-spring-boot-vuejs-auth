-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.18-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Verzió:              9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for trip_checker
DROP DATABASE IF EXISTS `trip_checker`;
CREATE DATABASE IF NOT EXISTS `trip_checker` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `trip_checker`;

-- Dumping structure for tábla trip_checker.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `username` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL DEFAULT 'plebs',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table trip_checker.roles: ~1 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
REPLACE INTO `roles` (`username`, `role`) VALUES
	('adam', 'boss');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for tábla trip_checker.trips
DROP TABLE IF EXISTS `trips`;
CREATE TABLE IF NOT EXISTS `trips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trip_name_id` int(11) NOT NULL,
  `stop_name` varchar(150) NOT NULL DEFAULT 'UNDEFINED STOP NAME',
  `stop_lat` varchar(50) DEFAULT NULL,
  `stop_lon` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__trip_names_trips` (`trip_name_id`),
  CONSTRAINT `FK__trip_names_trips` FOREIGN KEY (`trip_name_id`) REFERENCES `trip_names` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table trip_checker.trips: ~0 rows (approximately)
/*!40000 ALTER TABLE `trips` DISABLE KEYS */;
/*!40000 ALTER TABLE `trips` ENABLE KEYS */;

-- Dumping structure for tábla trip_checker.trip_names
DROP TABLE IF EXISTS `trip_names`;
CREATE TABLE IF NOT EXISTS `trip_names` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table trip_checker.trip_names: ~0 rows (approximately)
/*!40000 ALTER TABLE `trip_names` DISABLE KEYS */;
REPLACE INTO `trip_names` (`id`, `name`) VALUES
	(1, 'Karika2017');
/*!40000 ALTER TABLE `trip_names` ENABLE KEYS */;

-- Dumping structure for tábla trip_checker.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_hungarian_ci NOT NULL DEFAULT '0',
  `email` varchar(50) COLLATE utf8_hungarian_ci NOT NULL DEFAULT '0',
  `password` varchar(250) COLLATE utf8_hungarian_ci NOT NULL DEFAULT '0',
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- Dumping data for table trip_checker.users: ~1 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`id`, `username`, `email`, `password`, `enabled`) VALUES
	(1, 'adam', 'nagyadam2092@gmail.com', '$2a$10$xLGNLwrJRzRyn.Ihex5QBewu7LuZZ35e299LTYQRYPWHOCNXKekaS', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for tábla trip_checker.user_trips
DROP TABLE IF EXISTS `user_trips`;
CREATE TABLE IF NOT EXISTS `user_trips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `trip_name_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__users` (`user_id`),
  KEY `FK__trip_names` (`trip_name_id`),
  CONSTRAINT `FK__trip_names` FOREIGN KEY (`trip_name_id`) REFERENCES `trip_names` (`id`),
  CONSTRAINT `FK__users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table trip_checker.user_trips: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_trips` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_trips` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
