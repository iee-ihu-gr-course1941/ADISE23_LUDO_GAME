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
  `piece` varchar(3) DEFAULT NULL,
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
	(2, 3, 'W', NULL, NULL, NULL, NULL, NULL, NULL),
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
	(6, 11, 'W', 'Y', 'Y1', 17, 26, 35, 8),
	(7, 1, 'W', NULL, NULL, 34, 7, 16, 25),
	(7, 2, 'W', NULL, NULL, 33, 6, 15, 24),
	(7, 3, 'W', NULL, NULL, 32, 5, 14, 23),
	(7, 4, 'W', NULL, NULL, 31, 4, 13, 22),
	(7, 5, 'BY', NULL, NULL, NULL, NULL, NULL, NULL),
	(7, 6, 'B', NULL, NULL, NULL, 39, NULL, NULL),
	(7, 7, 'BR', NULL, NULL, NULL, NULL, NULL, NULL),
	(7, 8, 'W', 'Y', 'Y1', 21, 30, 3, 12),
	(7, 9, 'W', NULL, NULL, 20, 29, 2, 11),
	(7, 10, 'R', 'Y', 'Y1', 19, 28, 1, 10),
	(7, 11, 'W', NULL, NULL, 18, 27, NULL, 9),
	(8, 1, 'B', NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 2, 'B', NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 3, 'B', NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 4, 'B', NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 5, 'W', NULL, NULL, 30, 3, 12, 21),
	(8, 6, 'B', 'R', 'R3', NULL, 38, NULL, NULL),
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
	(9, 9, 'W', NULL, NULL, NULL, NULL, NULL, NULL),
	(9, 10, 'W', NULL, NULL, NULL, NULL, NULL, NULL),
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
	(10, 10, 'W', NULL, NULL, NULL, NULL, NULL, NULL),
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
  `piece` varchar(3) DEFAULT NULL,
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
CREATE TABLE IF NOT EXISTS `game_status` (
  `status` enum('not active','initialized','started','\r\nended','aborded') NOT NULL DEFAULT 'not active',
  `p_turn` enum('R','G','B','Y') DEFAULT NULL,
  `result` enum('R','G','B','Y','D') DEFAULT NULL,
  `last_change` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table adise23_ludo_game.game_status: ~1 rows (approximately)
DELETE FROM `game_status`;
INSERT INTO `game_status` (`status`, `p_turn`, `result`, `last_change`) VALUES
	('started', 'Y', 'D', '2023-11-25 14:08:06');

-- Dumping structure for procedure adise23_ludo_game.move_piece
DROP PROCEDURE IF EXISTS `move_piece`;
DELIMITER //
CREATE PROCEDURE `move_piece`(
	IN `x1` TINYINT,
	IN `y1` TINYINT,
	IN `x2` TINYINT,
	IN `y2` TINYINT
)
BEGIN
    DECLARE p, p_color, piece_val VARCHAR(3);
    DECLARE color_val ENUM('R','G','B','Y');

    -- Use exception handling to rollback on error
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
           ROLLBACK;
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'An error occurred, transaction rolled back.';
    END;

    -- Start the transaction
    START TRANSACTION;

    -- Check if the piece exists at the source coordinates
    SELECT piece, piece_color INTO p, p_color
    FROM `board`
    WHERE X = x1 AND Y = y1;

    -- If the piece exists, move it
    IF p IS NOT NULL THEN
        -- Move the piece to the destination coordinates
        UPDATE `board`
        SET piece = NULL, piece_color = NULL
        WHERE X = x1 AND Y = y1;

        UPDATE `board`
        SET piece = p, piece_color = p_color
        WHERE X = x2 AND Y = y2;

UPDATE game_status SET p_turn=if(p_color='Y','R','Y');

        -- Debugging information
        SELECT * FROM `board` WHERE X = x1 AND Y = y1;
        SELECT * FROM `board` WHERE X = x2 AND Y = y2;

        -- Commit the transaction if everything is successful
        COMMIT;
    ELSE
        -- If the piece does not exist at the source coordinates, rollback the transaction
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Piece does not exist at the specified coordinates.';
    END IF;
END//
DELIMITER ;

-- Dumping structure for procedure adise23_ludo_game.move_y_path
DROP PROCEDURE IF EXISTS `move_y_path`;
DELIMITER //
CREATE PROCEDURE `move_y_path`()
BEGIN
    DECLARE current_x TINYINT;
    DECLARE current_y TINYINT;
    DECLARE current_ypath INT;
    DECLARE new_x TINYINT;
    DECLARE new_y TINYINT;
    DECLARE new_ypath INT;
DECLARE dice_result INT;

    -- Use exception handling to rollback on error
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION


    -- Start the transaction
    START TRANSACTION;

    -- Get the current coordinates of the yellow piece
    SELECT x, y, y_path INTO current_x, current_y, current_ypath
    FROM board
    WHERE piece_color = 'Y' AND piece = 'Y1';

 SET dice_result =  roll_dice() ;
         SELECT dice_result;

    -- If the piece exists, move it
    IF  (current_ypath IS NULL)   THEN
        -- Move the piece to the destination coordinates
        UPDATE board
        SET piece = NULL, piece_color = NULL
        WHERE X = current_x AND Y = current_y;



        UPDATE board
        SET piece = 'Y1', piece_color = 'Y'
        WHERE X= 5 AND Y= 2 ;

UPDATE game_status SET p_turn= 'R' ;

        -- Debugging information
  SELECT * FROM board WHERE X = 2 AND Y = 3;
        SELECT * FROM board WHERE y_path=1 ;
        -- Commit the transaction if everything is successful
 COMMIT;
       ELSEIF current_ypath IS NOT NULL THEN
   SET new_ypath=current_ypath + dice_result;
          -- Move the piece to the destination coordinates
        UPDATE board
        SET piece = NULL, piece_color = NULL
        WHERE X = current_x AND Y = current_y;
        UPDATE board
        SET piece = 'Y1', piece_color = 'Y'
        WHERE y_path=new_ypath;
UPDATE game_status SET p_turn= 'R' ;
        -- Debugging information
  SELECT * FROM board WHERE X = current_x AND Y = current_y;
        SELECT * FROM board WHERE y_path = new_ypath;
        -- Commit the transaction if everything is successful
        COMMIT;
 ELSE
   ROLLBACK;
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Piece does not exist at the specified coordinates.';
 END IF;
END//
DELIMITER ;

-- Dumping structure for πίνακας adise23_ludo_game.players
DROP TABLE IF EXISTS `players`;
CREATE TABLE IF NOT EXISTS `players` (
  `username` varchar(20) DEFAULT NULL,
  `piece_color` enum('B','R','G','Y') NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `last_action` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`piece_color`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table adise23_ludo_game.players: ~4 rows (approximately)
DELETE FROM `players`;
INSERT INTO `players` (`username`, `piece_color`, `token`, `last_action`) VALUES
	(NULL, 'B', NULL, NULL),
	('dsd', 'R', 'd628363845209193b4fc9321586d62f5', '2023-11-25 14:05:16'),
	(NULL, 'G', NULL, NULL),
	('sdsds', 'Y', '9d1bf7b00048b0ab4b86d57b9cf6987e', '2023-11-25 14:05:27');

-- Dumping structure for πίνακας adise23_ludo_game.players_empty
DROP TABLE IF EXISTS `players_empty`;
CREATE TABLE IF NOT EXISTS `players_empty` (
  `username` varchar(20) DEFAULT NULL,
  `piece_color` enum('B','R','G','Y') NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `last_action` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`piece_color`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table adise23_ludo_game.players_empty: ~4 rows (approximately)
DELETE FROM `players_empty`;
INSERT INTO `players_empty` (`username`, `piece_color`, `token`, `last_action`) VALUES
	(NULL, 'B', NULL, NULL),
	(NULL, 'R', NULL, NULL),
	(NULL, 'G', NULL, NULL),
	(NULL, 'Y', NULL, NULL);

-- Dumping structure for function adise23_ludo_game.roll_dice
DROP FUNCTION IF EXISTS `roll_dice`;
DELIMITER //
CREATE FUNCTION `roll_dice`() RETURNS int(11)
BEGIN
DECLARE dice_result INT;

    -- Generate a random number between 1 and 6
    SET dice_result = FLOOR(1 + (RAND() * 6));

    -- Debugging information
    return  dice_result;

 END//
DELIMITER ;

-- Dumping structure for πίνακας adise23_ludo_game.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `usersId` int(11) NOT NULL AUTO_INCREMENT,
  `usersName` varchar(128) NOT NULL,
  `usersEmail` varchar(128) NOT NULL,
  `usersPwd` varchar(128) NOT NULL,
  PRIMARY KEY (`usersId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table adise23_ludo_game.users: ~3 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`usersId`, `usersName`, `usersEmail`, `usersPwd`) VALUES
	(1, 'Dimitris', 'dimitris121997@gmail.com', '$2y$10$wHp4pOtEadNxnRBCmhUOjOf7fXJjRUCE2TIf4okRtEJRol1pDwuVq'),
	(3, 'test', 'test@gmail.com', '$2y$10$WQt5m/LDZ627ioDYj2T6peGwMeRHjq5RHlnjSGzQX1e/K1x/KC5Oy'),
	(4, 'blue', 'margarita.iliopoulou@hotmail.com', '$2y$10$jlYZYN4gCf4i8dHMsi9iC.FyIz9MWo6iCG0wqMKDQEJXT2bq0WLF2');

-- Dumping structure for trigger adise23_ludo_game.game_status_update
DROP TRIGGER IF EXISTS `game_status_update`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER game_status_update BEFORE UPDATE
ON game_status
FOR EACH ROW BEGIN
SET NEW.last_change = NOW();
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
