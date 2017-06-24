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

-- Dumping data for table trip_checker.roles: ~1 rows (approximately)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`username`, `role`) VALUES
	('adam', 'boss');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping data for table trip_checker.trips: ~0 rows (approximately)
DELETE FROM `trips`;
/*!40000 ALTER TABLE `trips` DISABLE KEYS */;
/*!40000 ALTER TABLE `trips` ENABLE KEYS */;

-- Dumping data for table trip_checker.trip_names: ~0 rows (approximately)
DELETE FROM `trip_names`;
/*!40000 ALTER TABLE `trip_names` DISABLE KEYS */;
INSERT INTO `trip_names` (`id`, `name`) VALUES
	(1, 'Karika2017');
/*!40000 ALTER TABLE `trip_names` ENABLE KEYS */;

-- Dumping data for table trip_checker.users: ~1 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `email`, `password`, `enabled`) VALUES
	(1, 'adam', 'nagyadam2092@gmail.com', '$2a$10$xLGNLwrJRzRyn.Ihex5QBewu7LuZZ35e299LTYQRYPWHOCNXKekaS', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping data for table trip_checker.user_trips: ~0 rows (approximately)
DELETE FROM `user_trips`;
/*!40000 ALTER TABLE `user_trips` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_trips` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
