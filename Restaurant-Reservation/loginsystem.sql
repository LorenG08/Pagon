-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2024 at 03:59 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loginsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reserv_id` int(11) NOT NULL,
  `f_name` text NOT NULL,
  `l_name` text NOT NULL,
  `num_guests` int(11) NOT NULL,
  `num_tables` int(11) NOT NULL,
  `rdate` date NOT NULL,
  `time_zone` text NOT NULL,
  `telephone` text NOT NULL,
  `comment` mediumtext NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reserv_id`, `f_name`, `l_name`, `num_guests`, `num_tables`, `rdate`, `time_zone`, `telephone`, `comment`, `reg_date`, `user_fk`) VALUES
(62, 'Bill', 'Fotos', 10, 4, '2019-05-30', '12:00 - 16:00', '21096321232', 'fsdfsd', '2019-05-04 23:38:47', 28),
(64, 'Bill', 'Foto', 6, 2, '2019-05-20', '12:00 - 16:00', '1321312', 'fdsfsd', '2019-05-04 23:43:58', 28),
(71, 'Bill', 'Fotos', 10, 4, '2019-05-14', '12:00 - 16:00', '2129632123', 'fsfsd', '2019-05-05 00:51:50', 28),
(72, 'Bill', 'Foto', 10, 4, '2019-05-15', '16:00 - 20:00', '2109632123', 'fsfsfsd', '2019-05-05 00:52:09', 28),
(73, 'Bill', 'dsadsadas', 30, 14, '2019-05-22', '12:00 - 16:00', '2109632123', 'dsadsadas', '2019-05-05 00:52:39', 28),
(74, 'Bill', 'Fotos', 6, 2, '2019-05-10', '12:00 - 16:00', '2129632123', '312312312', '2019-05-05 00:54:08', 28),
(75, 'Bill', 'Fotos', 6, 2, '2019-05-10', '16:00 - 20:00', '2109632123', '', '2019-05-05 00:54:40', 28),
(76, 'Bill', 'Fotos', 1, 1, '2019-05-24', '12:00 - 16:00', '2109632123', 'sfsdfsd', '2019-05-06 23:28:11', 28);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`) VALUES
(1),
(2),
(3);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `schedule_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `open_time` time NOT NULL DEFAULT '12:00:00',
  `close_time` time NOT NULL DEFAULT '00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`schedule_id`, `date`, `open_time`, `close_time`) VALUES
(6, '2019-05-15', '03:11:00', '11:11:00'),
(7, '2019-05-16', '01:00:00', '01:00:00'),
(8, '2019-05-18', '02:01:00', '15:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `tables_id` int(11) NOT NULL,
  `t_date` date NOT NULL,
  `t_tables` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`tables_id`, `t_date`, `t_tables`) VALUES
(6, '2019-05-17', 5),
(7, '2019-05-15', 10),
(8, '2019-05-10', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `uidUsers` tinytext NOT NULL,
  `emailUsers` tinytext NOT NULL,
  `pwdUsers` longtext NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `role_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `uidUsers`, `emailUsers`, `pwdUsers`, `reg_date`, `role_id`) VALUES
(28, 'kappa2', 'kappa2@hotmail.com', '$2y$10$jfiG7gFvyQo..Cx1ZwktaOcs.83Zhsn0fkvq.9CvQCRA4Ognb/cBK', '2019-04-30 20:46:20', 2),
(35, 'Lorengie', 'pagonlorengie@gmail.com', '$2y$10$ZPH9wCgF.yUVbpmWNTejpOAZ8BWot2lBNJmJvC7tkD1jhRHe9f0BK', '2024-05-12 01:49:27', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reserv_id`),
  ADD KEY `users_fk` (`user_fk`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedule_id`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`tables_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reserv_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `tables_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `idusers` FOREIGN KEY (`user_fk`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
