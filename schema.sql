-- --------------------------------------------------------
-- Διακομιστής:                  127.0.0.1
-- Έκδοση διακομιστή:            10.4.28-MariaDB - mariadb.org binary distribution
-- Λειτ. σύστημα διακομιστή:     Win64
-- HeidiSQL Έκδοση:              12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Set the time zone globally for the entire server
SET GLOBAL time_zone = '+2:00';

-- Set the time zone for the current session
SET time_zone = '+2:00';
-- Dumping database structure for adise23_ludo_game
CREATE DATABASE IF NOT EXISTS `adise23_ludo_game` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `adise23_ludo_game`;

-- Dumping structure for πίνακας adise23_ludo_game.board
DROP TABLE IF EXISTS `board`;
CREATE TABLE IF NOT EXISTS `board` (
  `x` tinyint(1) NOT NULL,
  `y` tinyint(1) NOT NULL,
  `b_color` enum('R','G','B','Y','W','MIX','GR','BR','BY','GY') NOT NULL,
  `piece_color` enum('R','G','B','Y') DEFAULT NULL,
  `piece` enum('R1','R2','R3','R4','G1','G2','G3','G4','B1','B2','B3','B4','Y1','Y2','Y3','Y4') DEFAULT NULL,
  `y_path` int(11) DEFAULT NULL CHECK (`y_path` is null or `y_path` >= 1 and `y_path` <= 39),
  `b_path` int(11) DEFAULT NULL CHECK (`b_path` is null or `b_path` >= 1 and `b_path` <= 39),
  `r_path` int(11) DEFAULT NULL CHECK (`r_path` is null or `r_path` >= 1 and `r_path` <= 39),
  `g_path` int(11) DEFAULT NULL CHECK (`g_path` is null or `g_path` >= 1 and `g_path` <= 39),
  PRIMARY KEY (`x`,`y`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table adise23_ludo_game.board: ~121 rows (approximately)
DELETE FROM `board`;
INSERT INTO `board` (`x`, `y`, `b_color`, `piece_color`, `piece`, `y_path`, `b_path`, `r_path`, `g_path`) VALUES
	(1, 1, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
	(1, 2, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
	(1, 3, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
	(1, 4, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
	(1, 5, 'W', NULL, NULL, 7, 16, 25, 34),
	(1, 6, 'W', NULL, NULL, 8, 17, 26, 35),
	(1, 7, 'W', NULL, NULL, 9, 18, 27, NULL),
	(1, 8, 'G', NULL, NULL, NULL, NULL, NULL, NULL),
	(1, 9, 'G', NULL, NULL, NULL, NULL, NULL, NULL),
	(1, 10, 'G', NULL, NULL, NULL, NULL, NULL, NULL),
	(1, 11, 'G', NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 1, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 2, 'W', 'Y', 'Y3', NULL, NULL, NULL, NULL),
	(2, 3, 'W', 'Y', 'Y1', NULL, NULL, NULL, NULL),
	(2, 4, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 5, 'W', NULL, NULL, 6, 15, 24, 33),
	(2, 6, 'G', NULL, NULL, NULL, NULL, NULL, 36),
	(2, 7, 'G', NULL, NULL, 10, 19, 28, 1),
	(2, 8, 'G', NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 9, 'W', 'G', 'G3', NULL, NULL, NULL, NULL),
	(2, 10, 'W', 'G', 'G1', NULL, NULL, NULL, NULL),
	(2, 11, 'G', NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 1, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 2, 'W', 'Y', 'Y4', NULL, NULL, NULL, NULL),
	(3, 3, 'W', 'Y', 'Y2', NULL, NULL, NULL, NULL),
	(3, 4, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 5, 'W', NULL, NULL, 5, 14, 23, 32),
	(3, 6, 'G', NULL, NULL, NULL, NULL, NULL, 37),
	(3, 7, 'W', NULL, NULL, 11, 20, 29, 2),
	(3, 8, 'G', NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 9, 'W', 'G', 'G4', NULL, NULL, NULL, NULL),
	(3, 10, 'W', 'G', 'G2', NULL, NULL, NULL, NULL),
	(3, 11, 'G', NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 1, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 2, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 3, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 4, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 5, 'W', NULL, NULL, 4, 13, 22, 31),
	(4, 6, 'G', NULL, NULL, NULL, NULL, NULL, 38),
	(4, 7, 'W', NULL, NULL, 12, 21, 30, 3),
	(4, 8, 'G', NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 9, 'G', NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 10, 'G', NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 11, 'G', NULL, NULL, NULL, NULL, NULL, NULL),
	(5, 1, 'W', NULL, NULL, NULL, 9, 18, 27),
	(5, 2, 'Y', NULL, NULL, 1, 10, 19, 28),
	(5, 3, 'W', NULL, NULL, 2, 11, 20, 29),
	(5, 4, 'W', NULL, NULL, 3, 12, 21, 30),
	(5, 5, 'GY', NULL, NULL, NULL, NULL, NULL, NULL),
	(5, 6, 'G', NULL, NULL, NULL, NULL, NULL, 39),
	(5, 7, 'GR', NULL, NULL, NULL, NULL, NULL, NULL),
	(5, 8, 'W', NULL, NULL, 13, 22, 31, 4),
	(5, 9, 'W', NULL, NULL, 14, 23, 32, 5),
	(5, 10, 'W', NULL, NULL, 15, 24, 33, 6),
	(5, 11, 'W', NULL, NULL, 16, 25, 34, 7),
	(6, 1, 'W', NULL, NULL, 35, 8, 17, 26),
	(6, 2, 'Y', NULL, NULL, 36, NULL, NULL, NULL),
	(6, 3, 'Y', NULL, NULL, 37, NULL, NULL, NULL),
	(6, 4, 'Y', NULL, NULL, 38, NULL, NULL, NULL),
	(6, 5, 'Y', NULL, NULL, 39, NULL, NULL, NULL),
	(6, 6, 'MIX', NULL, NULL, NULL, NULL, NULL, NULL),
	(6, 7, 'R', NULL, NULL, NULL, NULL, 39, NULL),
	(6, 8, 'R', NULL, NULL, NULL, NULL, 38, NULL),
	(6, 9, 'R', NULL, NULL, NULL, NULL, 37, NULL),
	(6, 10, 'R', NULL, NULL, NULL, NULL, 36, NULL),
	(6, 11, 'W', NULL, NULL, 17, 26, 35, 8),
	(7, 1, 'W', NULL, NULL, 34, 7, 16, 25),
	(7, 2, 'W', NULL, NULL, 33, 6, 15, 24),
	(7, 3, 'W', NULL, NULL, 32, 5, 14, 23),
	(7, 4, 'W', NULL, NULL, 31, 4, 13, 22),
	(7, 5, 'BY', NULL, NULL, NULL, NULL, NULL, NULL),
	(7, 6, 'B', NULL, NULL, NULL, 39, NULL, NULL),
	(7, 7, 'BR', NULL, NULL, NULL, NULL, NULL, NULL),
	(7, 8, 'W', NULL, NULL, 21, 30, 3, 12),
	(7, 9, 'W', NULL, NULL, 20, 29, 2, 11),
	(7, 10, 'R', NULL, NULL, 19, 28, 1, 10),
	(7, 11, 'W', NULL, NULL, 18, 27, NULL, 9),
	(8, 1, 'B', NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 2, 'B', NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 3, 'B', NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 4, 'B', NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 5, 'W', NULL, NULL, 30, 3, 12, 21),
	(8, 6, 'B', NULL, NULL, NULL, 38, NULL, NULL),
	(8, 7, 'W', NULL, NULL, 22, 31, 4, 13),
	(8, 8, 'R', NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 9, 'R', NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 10, 'R', NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 11, 'R', NULL, NULL, NULL, NULL, NULL, NULL),
	(9, 1, 'B', NULL, NULL, NULL, NULL, NULL, NULL),
	(9, 2, 'W', 'B', 'B3', NULL, NULL, NULL, NULL),
	(9, 3, 'W', 'B', 'B1', NULL, NULL, NULL, NULL),
	(9, 4, 'B', NULL, NULL, NULL, NULL, NULL, NULL),
	(9, 5, 'W', NULL, NULL, 29, 2, 11, 20),
	(9, 6, 'B', NULL, NULL, NULL, 37, NULL, NULL),
	(9, 7, 'W', NULL, NULL, 32, 5, 27, 14),
	(9, 8, 'R', NULL, NULL, NULL, NULL, NULL, NULL),
	(9, 9, 'W', 'R', 'R3', NULL, NULL, NULL, NULL),
	(9, 10, 'W', 'R', 'R1', NULL, NULL, NULL, NULL),
	(9, 11, 'R', NULL, NULL, NULL, NULL, NULL, NULL),
	(10, 1, 'B', NULL, NULL, NULL, NULL, NULL, NULL),
	(10, 2, 'W', 'B', 'B4', NULL, NULL, NULL, NULL),
	(10, 3, 'W', 'B', 'B2', NULL, NULL, NULL, NULL),
	(10, 4, 'B', NULL, NULL, NULL, NULL, NULL, NULL),
	(10, 5, 'B', NULL, NULL, 28, 1, 10, 19),
	(10, 6, 'B', NULL, NULL, NULL, 36, NULL, NULL),
	(10, 7, 'W', NULL, NULL, 24, 33, 6, 15),
	(10, 8, 'R', NULL, NULL, NULL, NULL, NULL, NULL),
	(10, 9, 'W', 'R', 'R4', NULL, NULL, NULL, NULL),
	(10, 10, 'W', 'R', 'R2', NULL, NULL, NULL, NULL),
	(10, 11, 'R', NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 1, 'B', NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 2, 'B', NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 3, 'B', NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 4, 'B', NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 5, 'W', NULL, NULL, 27, NULL, 9, 18),
	(11, 6, 'W', NULL, NULL, 26, 35, 8, 17),
	(11, 7, 'W', NULL, NULL, 25, 34, 7, 16),
	(11, 8, 'R', NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 9, 'R', NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 10, 'R', NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 11, 'R', NULL, NULL, NULL, NULL, NULL, NULL);

-- Dumping structure for πίνακας adise23_ludo_game.board_empty
DROP TABLE IF EXISTS `board_empty`;
CREATE TABLE IF NOT EXISTS `board_empty` (
  `x` tinyint(1) NOT NULL,
  `y` tinyint(1) NOT NULL,
  `b_color` enum('R','G','B','Y','W','MIX','GR','BR','BY','GY') NOT NULL,
  `piece_color` enum('R','G','B','Y') DEFAULT NULL,
  `piece` enum('R1','R2','R3','R4','G1','G2','G3','G4','B1','B2','B3','B4','Y1','Y2','Y3','Y4') DEFAULT NULL,
  `y_path` int(11) DEFAULT NULL CHECK (`y_path` is null or `y_path` >= 1 and `y_path` <= 39),
  `b_path` int(11) DEFAULT NULL CHECK (`b_path` is null or `b_path` >= 1 and `b_path` <= 39),
  `r_path` int(11) DEFAULT NULL CHECK (`r_path` is null or `r_path` >= 1 and `r_path` <= 39),
  `g_path` int(11) DEFAULT NULL CHECK (`g_path` is null or `g_path` >= 1 and `g_path` <= 39),
  PRIMARY KEY (`x`,`y`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table adise23_ludo_game.board_empty: ~121 rows (approximately)
DELETE FROM `board_empty`;
INSERT INTO `board_empty` (`x`, `y`, `b_color`, `piece_color`, `piece`, `y_path`, `b_path`, `r_path`, `g_path`) VALUES
	(1, 1, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
	(1, 2, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
	(1, 3, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
	(1, 4, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
	(1, 5, 'W', NULL, NULL, 7, 16, 25, 34),
	(1, 6, 'W', NULL, NULL, 8, 17, 26, 35),
	(1, 7, 'W', NULL, NULL, 9, 18, 27, NULL),
	(1, 8, 'G', NULL, NULL, NULL, NULL, NULL, NULL),
	(1, 9, 'G', NULL, NULL, NULL, NULL, NULL, NULL),
	(1, 10, 'G', NULL, NULL, NULL, NULL, NULL, NULL),
	(1, 11, 'G', NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 1, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 2, 'W', 'Y', 'Y3', NULL, NULL, NULL, NULL),
	(2, 3, 'W', 'Y', 'Y1', NULL, NULL, NULL, NULL),
	(2, 4, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 5, 'W', NULL, NULL, 6, 15, 24, 33),
	(2, 6, 'G', NULL, NULL, NULL, NULL, NULL, 36),
	(2, 7, 'G', NULL, NULL, 10, 19, 28, 1),
	(2, 8, 'G', NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 9, 'W', 'G', 'G3', NULL, NULL, NULL, NULL),
	(2, 10, 'W', 'G', 'G1', NULL, NULL, NULL, NULL),
	(2, 11, 'G', NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 1, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 2, 'W', 'Y', 'Y4', NULL, NULL, NULL, NULL),
	(3, 3, 'W', 'Y', 'Y2', NULL, NULL, NULL, NULL),
	(3, 4, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 5, 'W', NULL, NULL, 5, 14, 23, 32),
	(3, 6, 'G', NULL, NULL, NULL, NULL, NULL, 37),
	(3, 7, 'W', NULL, NULL, 11, 20, 29, 2),
	(3, 8, 'G', NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 9, 'W', 'G', 'G4', NULL, NULL, NULL, NULL),
	(3, 10, 'W', 'G', 'G2', NULL, NULL, NULL, NULL),
	(3, 11, 'G', NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 1, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 2, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 3, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 4, 'Y', NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 5, 'W', NULL, NULL, 4, 13, 22, 31),
	(4, 6, 'G', NULL, NULL, NULL, NULL, NULL, 38),
	(4, 7, 'W', NULL, NULL, 12, 21, 30, 3),
	(4, 8, 'G', NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 9, 'G', NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 10, 'G', NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 11, 'G', NULL, NULL, NULL, NULL, NULL, NULL),
	(5, 1, 'W', NULL, NULL, NULL, 9, 18, 27),
	(5, 2, 'Y', NULL, NULL, 1, 10, 19, 28),
	(5, 3, 'W', NULL, NULL, 2, 11, 20, 29),
	(5, 4, 'W', NULL, NULL, 3, 12, 21, 30),
	(5, 5, 'GY', NULL, NULL, NULL, NULL, NULL, NULL),
	(5, 6, 'G', NULL, NULL, NULL, NULL, NULL, 39),
	(5, 7, 'GR', NULL, NULL, NULL, NULL, NULL, NULL),
	(5, 8, 'W', NULL, NULL, 13, 22, 31, 4),
	(5, 9, 'W', NULL, NULL, 14, 23, 32, 5),
	(5, 10, 'W', NULL, NULL, 15, 24, 33, 6),
	(5, 11, 'W', NULL, NULL, 16, 25, 34, 7),
	(6, 1, 'W', NULL, NULL, 35, 8, 17, 26),
	(6, 2, 'Y', NULL, NULL, 36, NULL, NULL, NULL),
	(6, 3, 'Y', NULL, NULL, 37, NULL, NULL, NULL),
	(6, 4, 'Y', NULL, NULL, 38, NULL, NULL, NULL),
	(6, 5, 'Y', NULL, NULL, 39, NULL, NULL, NULL),
	(6, 6, 'MIX', NULL, NULL, NULL, NULL, NULL, NULL),
	(6, 7, 'R', NULL, NULL, NULL, NULL, 39, NULL),
	(6, 8, 'R', NULL, NULL, NULL, NULL, 38, NULL),
	(6, 9, 'R', NULL, NULL, NULL, NULL, 37, NULL),
	(6, 10, 'R', NULL, NULL, NULL, NULL, 36, NULL),
	(6, 11, 'W', NULL, NULL, 17, 26, 35, 8),
	(7, 1, 'W', NULL, NULL, 34, 7, 16, 25),
	(7, 2, 'W', NULL, NULL, 33, 6, 15, 24),
	(7, 3, 'W', NULL, NULL, 32, 5, 14, 23),
	(7, 4, 'W', NULL, NULL, 31, 4, 13, 22),
	(7, 5, 'BY', NULL, NULL, NULL, NULL, NULL, NULL),
	(7, 6, 'B', NULL, NULL, NULL, 39, NULL, NULL),
	(7, 7, 'BR', NULL, NULL, NULL, NULL, NULL, NULL),
	(7, 8, 'W', NULL, NULL, 21, 30, 3, 12),
	(7, 9, 'W', NULL, NULL, 20, 29, 2, 11),
	(7, 10, 'R', NULL, NULL, 19, 28, 1, 10),
	(7, 11, 'W', NULL, NULL, 18, 27, NULL, 9),
	(8, 1, 'B', NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 2, 'B', NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 3, 'B', NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 4, 'B', NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 5, 'W', NULL, NULL, 30, 3, 12, 21),
	(8, 6, 'B', NULL, NULL, NULL, 38, NULL, NULL),
	(8, 7, 'W', NULL, NULL, 22, 31, 4, 13),
	(8, 8, 'R', NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 9, 'R', NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 10, 'R', NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 11, 'R', NULL, NULL, NULL, NULL, NULL, NULL),
	(9, 1, 'B', NULL, NULL, NULL, NULL, NULL, NULL),
	(9, 2, 'W', 'B', 'B3', NULL, NULL, NULL, NULL),
	(9, 3, 'W', 'B', 'B1', NULL, NULL, NULL, NULL),
	(9, 4, 'B', NULL, NULL, NULL, NULL, NULL, NULL),
	(9, 5, 'W', NULL, NULL, 29, 2, 11, 20),
	(9, 6, 'B', NULL, NULL, NULL, 37, NULL, NULL),
	(9, 7, 'W', NULL, NULL, 32, 5, 27, 14),
	(9, 8, 'R', NULL, NULL, NULL, NULL, NULL, NULL),
	(9, 9, 'W', 'R', 'R3', NULL, NULL, NULL, NULL),
	(9, 10, 'W', 'R', 'R1', NULL, NULL, NULL, NULL),
	(9, 11, 'R', NULL, NULL, NULL, NULL, NULL, NULL),
	(10, 1, 'B', NULL, NULL, NULL, NULL, NULL, NULL),
	(10, 2, 'W', 'B', 'B4', NULL, NULL, NULL, NULL),
	(10, 3, 'W', 'B', 'B2', NULL, NULL, NULL, NULL),
	(10, 4, 'B', NULL, NULL, NULL, NULL, NULL, NULL),
	(10, 5, 'B', NULL, NULL, 28, 1, 10, 19),
	(10, 6, 'B', NULL, NULL, NULL, 36, NULL, NULL),
	(10, 7, 'W', NULL, NULL, 24, 33, 6, 15),
	(10, 8, 'R', NULL, NULL, NULL, NULL, NULL, NULL),
	(10, 9, 'W', 'R', 'R4', NULL, NULL, NULL, NULL),
	(10, 10, 'W', 'R', 'R2', NULL, NULL, NULL, NULL),
	(10, 11, 'R', NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 1, 'B', NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 2, 'B', NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 3, 'B', NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 4, 'B', NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 5, 'W', NULL, NULL, 27, NULL, 9, 18),
	(11, 6, 'W', NULL, NULL, 26, 35, 8, 17),
	(11, 7, 'W', NULL, NULL, 25, 34, 7, 16),
	(11, 8, 'R', NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 9, 'R', NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 10, 'R', NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 11, 'R', NULL, NULL, NULL, NULL, NULL, NULL);

-- Dumping structure for procedure adise23_ludo_game.clean_board
DROP PROCEDURE IF EXISTS `clean_board`;
DELIMITER //
CREATE PROCEDURE `clean_board`()
BEGIN
	REPLACE INTO  board SELECT * FROM  board_empty;
END//
DELIMITER ;

-- Dumping structure for procedure adise23_ludo_game.clean_players
DROP PROCEDURE IF EXISTS `clean_players`;
DELIMITER //
CREATE PROCEDURE `clean_players`()
BEGIN
	REPLACE INTO  players SELECT * FROM players_empty;
END//
DELIMITER ;

-- Dumping structure for πίνακας adise23_ludo_game.game_status
DROP TABLE IF EXISTS `game_status`;
CREATE TABLE `game_status` (
`status` enum('not active','initialized','started','
ended','aborded') NOT NULL DEFAULT 'not active',
`p_turn` enum('R','G','B','Y') DEFAULT NULL,
`result` enum('R','G','B','Y','D') DEFAULT NULL,
`last_change` NOW() NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Dumping data for table adise23_ludo_game.game_status: ~1 rows (approximately)
DELETE FROM `game_status`;
INSERT INTO `game_status` (`status`, `p_turn`, `result`, `last_change`) VALUES
	('not active', NULL, NULL, NULL);

-- Dumping structure for procedure adise23_ludo_game.move_piece
DROP PROCEDURE IF EXISTS `move_piece`;
DELIMITER //
CREATE PROCEDURE `move_piece`(x1 TINYINT,y1 TINYINT,x2 TINYINT,y2 TINYINT)
BEGIN
DECLARE p, p_color CHAR;
SELECT piece, piece_color INTO p, p_color
FROM `board` WHERE X=x1 AND Y=y1;
UPDATE board
SET piece=p, piece_color=p_color
WHERE X=x2 AND Y=y2;
UPDATE board
SET piece=NULL,piece_color=NULL
WHERE X=x1 AND Y=y1;
END//
DELIMITER ;

-- Dumping structure for πίνακας adise23_ludo_game.players
DROP TABLE IF EXISTS `players`;
CREATE TABLE IF NOT EXISTS `players` (
  `username` varchar(20) DEFAULT NULL,
  `piece_color` enum('B','R','G','Y') NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `last_action` timestamp NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`piece_color`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table adise23_ludo_game.players: ~4 rows (approximately)
DELETE FROM `players`;
INSERT INTO `players` (`username`, `piece_color`, `token`, `last_action`) VALUES
	(NULL, 'B', NULL, NULL),
	(NULL, 'R', NULL, NULL),
	(NULL, 'G', NULL, NULL),
	(NULL, 'Y', NULL, NULL);

-- Dumping structure for πίνακας adise23_ludo_game.players_empty
DROP TABLE IF EXISTS `players_empty`;
CREATE TABLE IF NOT EXISTS `players_empty` (
  `username` varchar(20) DEFAULT NULL,
  `piece_color` enum('B','R','G','Y') NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `last_action` timestamp NULL DEFAULT NOW() ON UPDATE  NOW(),
  PRIMARY KEY (`piece_color`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table adise23_ludo_game.players_empty: ~4 rows (approximately)
DELETE FROM `players_empty`;
INSERT INTO `players_empty` (`username`, `piece_color`, `token`, `last_action`) VALUES
	(NULL, 'B', NULL, NULL),
	(NULL, 'R', NULL, NULL),
	(NULL, 'G', NULL, NULL),
	(NULL, 'Y', NULL, NULL);

-- Dumping structure for trigger adise23_ludo_game.game_status_update
DROP TRIGGER IF EXISTS `game_status_update`;
 

DELIMITER $$
CREATE
TRIGGER game_status_update BEFORE UPDATE
ON game_status
FOR EACH ROW BEGIN
SET NEW.last_change = NOW();
END$$
DELIMITER ;

playersplayers