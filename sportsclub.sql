-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 25, 2022 at 06:53 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sportsclub`
--

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `area` varchar(50) NOT NULL,
  `description` tinytext DEFAULT NULL,
  `trainerName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`area`, `description`, `trainerName`) VALUES
('athletics', 'High jump, long jump, decathlon, penthalon, sprint distances and the like', 'nelly'),
('fitness', 'Comprises all courses that encrease healthy lifestyle and fitness', 'lena'),
('martialArts', 'Wrestling, Judo and the like', 'klopp'),
('watersport', 'All sports that have to do with water', 'lazy');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `coursePK` smallint(5) UNSIGNED NOT NULL,
  `courseName` varchar(50) NOT NULL,
  `areaFK` varchar(50) NOT NULL,
  `targetGroupFK` char(3) DEFAULT NULL,
  `trainerFK` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`coursePK`, `courseName`, `areaFK`, `targetGroupFK`, `trainerFK`) VALUES
(5, 'running', 'fitness', 'men', NULL),
(6, 'wrestling', 'martialArts', 'men', 'klopp'),
(7, 'waterball', 'watersport', 'men', 'klopp'),
(10, 'swimming', 'watersport', 'fam', NULL),
(11, 'Obstacle race', 'athletics', 'fam', 'lena'),
(12, 'high jump', 'athletics', 'fam', 'lena'),
(13, 'fitnessKids', 'fitness', 'kid', 'klopp'),
(14, 'jogging', 'fitness', 'fam', 'lena'),
(19, 'free style', 'watersport', 'kid', 'lazy'),
(20, 'aerobics', 'fitness', 'fam', 'lena');

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `courseID` smallint(5) UNSIGNED NOT NULL,
  `memberNamePK` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`courseID`, `memberNamePK`) VALUES
(5, 'hope'),
(6, 'hope'),
(7, 'hope'),
(10, 'hope'),
(14, 'hope'),
(5, 'lion'),
(6, 'lion'),
(7, 'lion'),
(10, 'lion'),
(12, 'lion'),
(13, 'lion'),
(14, 'lion'),
(6, 'lisa'),
(12, 'lisa'),
(5, 'nelly'),
(6, 'nelly'),
(7, 'nelly'),
(10, 'nelly'),
(13, 'nelly'),
(14, 'nelly'),
(5, 'robin'),
(6, 'robin'),
(7, 'robin'),
(10, 'robin'),
(11, 'robin'),
(12, 'robin'),
(5, 'rose'),
(6, 'rose'),
(7, 'rose'),
(10, 'rose'),
(12, 'rose'),
(5, 'val'),
(6, 'val'),
(11, 'val'),
(14, 'val'),
(5, 'valerie'),
(6, 'valerie'),
(7, 'valerie'),
(10, 'valerie'),
(11, 'valerie'),
(14, 'valerie');

-- --------------------------------------------------------

--
-- Table structure for table `memtra`
--

CREATE TABLE `memtra` (
  `namePK` varchar(50) NOT NULL,
  `isMember` tinyint(1) NOT NULL,
  `isTrainer` tinyint(1) NOT NULL DEFAULT 0,
  `DoB` date NOT NULL,
  `age` int(11) GENERATED ALWAYS AS (timestampdiff(YEAR,`DoB`,curdate())) VIRTUAL,
  `gender` enum('f','m','d') NOT NULL,
  `entryDate` date DEFAULT NULL,
  `email` varchar(80) NOT NULL,
  `isChildOfFK` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `memtra`
--

INSERT INTO `memtra` (`namePK`, `isMember`, `isTrainer`, `DoB`, `gender`, `entryDate`, `email`, `isChildOfFK`) VALUES
('aron', 1, 0, '2013-11-06', 'm', NULL, 'klopp@xx.ge', 'klopp'),
('coach', 1, 1, '1988-12-01', 'm', NULL, 'coach@xx.ge', NULL),
('figaro', 1, 0, '1989-05-07', 'm', NULL, 'figaro@xx.ge', NULL),
('hope', 1, 0, '1965-09-14', 'f', NULL, 'hope@xx.ge', NULL),
('klopp', 0, 1, '1980-12-24', 'm', NULL, 'klopp@xx.ge', NULL),
('lazy', 0, 1, '1996-11-25', 'm', NULL, 'lazy@xx.ge', NULL),
('lena', 0, 1, '1995-01-25', 'f', NULL, 'lena@xx.ge', NULL),
('levan', 1, 0, '2013-11-06', 'm', NULL, 'klopp@xx.ge', 'klopp'),
('lion', 1, 0, '1990-10-10', 'm', NULL, 'lion@xxx.ge', NULL),
('lisa', 1, 0, '2015-11-19', 'f', NULL, 'figaro@xx.ge', 'figaro'),
('luke', 1, 0, '1998-11-22', 'm', NULL, 'luke@xx.ge', 'hope'),
('Mother.Winter', 1, 0, '1980-11-12', 'f', NULL, 'm.winter@xx.ge', NULL),
('nelly', 1, 1, '1990-04-21', 'f', NULL, 'nelly@xx.ge', NULL),
('robin', 1, 0, '2012-09-16', 'm', NULL, 'nelly@xx.ge', 'nelly'),
('rose', 1, 0, '2015-02-10', 'f', NULL, 'lion@xx.ge', 'lion'),
('val', 1, 0, '2013-07-12', 'm', NULL, 'val@xx.ge', 'figaro'),
('valerie', 1, 0, '1970-03-20', 'f', NULL, 'val@xx.ge', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `targetgroup`
--

CREATE TABLE `targetgroup` (
  `code` char(3) NOT NULL,
  `description` tinytext DEFAULT NULL,
  `title` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `targetgroup`
--

INSERT INTO `targetgroup` (`code`, `description`, `title`) VALUES
('fam', '', 'family sport'),
('kid', 'for kids ages 6-12', 'kids sport'),
('men', '', 'mens sports group'),
('sen', 'ages 50+', 'senior sports'),
('wom', '', 'womens sports group');

-- --------------------------------------------------------

--
-- Table structure for table `trainer`
--

CREATE TABLE `trainer` (
  `namePK` varchar(50) NOT NULL,
  `license` tinyint(1) DEFAULT NULL,
  `startDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trainer`
--

INSERT INTO `trainer` (`namePK`, `license`, `startDate`) VALUES
('coach', 1, '2021-10-01'),
('klopp', 1, NULL),
('lazy', 1, NULL),
('lena', 0, NULL),
('nelly', 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`area`),
  ADD UNIQUE KEY `header_idx` (`trainerName`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`coursePK`),
  ADD KEY `trainerFK` (`trainerFK`),
  ADD KEY `areaFK` (`areaFK`),
  ADD KEY `targetGroupFK` (`targetGroupFK`);

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`memberNamePK`,`courseID`),
  ADD KEY `courseID` (`courseID`);

--
-- Indexes for table `memtra`
--
ALTER TABLE `memtra`
  ADD PRIMARY KEY (`namePK`),
  ADD KEY `idx_parent` (`isChildOfFK`);

--
-- Indexes for table `targetgroup`
--
ALTER TABLE `targetgroup`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `trainer`
--
ALTER TABLE `trainer`
  ADD PRIMARY KEY (`namePK`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `coursePK` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `area`
--
ALTER TABLE `area`
  ADD CONSTRAINT `area_ibfk_1` FOREIGN KEY (`trainerName`) REFERENCES `trainer` (`namePK`) ON UPDATE CASCADE;

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`areaFK`) REFERENCES `area` (`area`) ON UPDATE CASCADE,
  ADD CONSTRAINT `course_ibfk_2` FOREIGN KEY (`trainerFK`) REFERENCES `trainer` (`namePK`) ON UPDATE CASCADE,
  ADD CONSTRAINT `course_ibfk_3` FOREIGN KEY (`targetGroupFK`) REFERENCES `targetgroup` (`code`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`memberNamePK`) REFERENCES `memtra` (`namePK`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`courseID`) REFERENCES `course` (`coursePK`) ON UPDATE CASCADE;

--
-- Constraints for table `memtra`
--
ALTER TABLE `memtra`
  ADD CONSTRAINT `memtra_ibfk_1` FOREIGN KEY (`isChildOfFK`) REFERENCES `memtra` (`namePK`) ON UPDATE CASCADE;

--
-- Constraints for table `trainer`
--
ALTER TABLE `trainer`
  ADD CONSTRAINT `trainer_ibfk_1` FOREIGN KEY (`namePK`) REFERENCES `memtra` (`namePK`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
