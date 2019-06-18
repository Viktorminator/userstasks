-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 18, 2019 at 03:15 PM
-- Server version: 5.7.25
-- PHP Version: 7.0.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `testdoitsoftware`
--

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(32) NOT NULL,
  `description` varchar(32) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `due_date` datetime DEFAULT NULL,
  `priority` tinyint(1) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `active`, `due_date`, `priority`, `created`, `modified`) VALUES
(1, 19, 'F', 'Some simple task', 1, '2019-06-19 00:00:00', 1, '2019-06-14 00:00:00', '2019-06-14 18:28:51'),
(2, 20, 'B', 'Task for Some', 1, NULL, 1, '2019-06-14 00:00:00', '2019-06-14 18:40:02'),
(3, 19, 'C', 'Task for viktor', 0, NULL, 3, '2019-06-14 00:00:00', '2019-06-14 18:40:29'),
(4, 19, 'D', 'Make this task done.', 1, NULL, 1, '2019-06-15 00:19:10', '2019-06-14 21:19:10'),
(5, 19, 'E', 'Make this task done.', 1, NULL, 2, '2019-06-15 00:20:38', '2019-06-14 21:20:38'),
(6, 19, 'B', 'Make this task done.', 1, NULL, 1, '2019-06-15 00:22:10', '2019-06-14 21:22:10'),
(7, 20, 'E', 'This task is undone.', 0, NULL, 2, '2019-06-15 00:23:26', '2019-06-14 21:23:26'),
(8, 20, 'C', 'This task is done.', 1, NULL, 1, '2019-06-15 00:23:39', '2019-06-14 21:23:39'),
(9, 20, 'B', 'This task is totally undone.', 0, '1900-01-18 00:00:00', 1, '2019-06-15 00:25:23', '2019-06-14 21:25:23'),
(10, 20, '', 'This task is totally undone.', 0, NULL, 2, '2019-06-15 00:25:41', '2019-06-14 21:25:41'),
(11, 20, 'B', 'This task is totally undone.', 1, NULL, 3, '2019-06-15 00:28:50', '2019-06-14 21:28:50'),
(12, 20, '', 'Some new task.', 1, '2019-07-23 00:00:00', 1, '2019-06-15 11:04:09', '2019-06-15 08:04:09'),
(13, 20, 'N', 'Some more task.', 1, NULL, 3, '2019-06-15 11:04:23', '2019-06-15 08:04:23'),
(14, 24, 'S', 'Some simple task', 1, '2019-07-11 00:00:00', 2, '2019-06-14 00:00:00', '2019-06-14 15:28:51'),
(15, 24, '', 'Task for Some', 1, NULL, 2, '2019-06-14 00:00:00', '2019-06-14 15:40:02'),
(16, 24, 'E', 'Task for viktor', 0, '2019-07-17 00:00:00', 1, '2019-06-14 00:00:00', '2019-06-14 15:40:29'),
(17, 24, '', 'Make this task done.', 1, NULL, 2, '2019-06-15 00:19:10', '2019-06-14 18:19:10'),
(18, 24, 'B', 'Make this task done.', 1, NULL, 1, '2019-06-15 00:20:38', '2019-06-14 18:20:38'),
(19, 24, '', 'Make this task done.', 1, '1900-01-19 00:00:00', 1, '2019-06-15 00:22:10', '2019-06-14 18:22:10'),
(20, 24, 'D', 'This task is undone.', 0, NULL, 3, '2019-06-15 00:23:26', '2019-06-14 18:23:26'),
(21, 24, '', 'This task is done.', 1, '2019-07-25 00:00:00', 2, '2019-06-15 00:23:39', '2019-06-14 18:23:39'),
(22, 24, 'E', 'This task is totally undone.', 0, '2019-07-12 00:00:00', 2, '2019-06-15 00:25:23', '2019-06-14 18:25:23'),
(23, 24, '', 'This task is totally undone.', 0, NULL, 3, '2019-06-15 00:25:41', '2019-06-14 18:25:41'),
(24, 24, 'Q', 'This task is totally undone.', 1, '2019-07-19 00:00:00', 1, '2019-06-15 00:28:50', '2019-06-14 18:28:50'),
(25, 24, '', 'Some new task.', 1, NULL, 1, '2019-06-15 11:04:09', '2019-06-15 05:04:09'),
(26, 24, '', 'Some more task.', 1, '2019-07-25 00:00:00', 3, '2019-06-15 11:04:23', '2019-06-15 05:04:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `created`, `modified`) VALUES
(19, 'viktor@gmail.com', 'viktor', '2019-06-14 00:00:00', '2019-06-14 18:27:42'),
(20, 'some@gmail.com', 'some', '2019-06-14 00:00:00', '2019-06-14 18:39:37'),
(21, 'serhioramos@gmail.com', '$2y$10$mhUIgbUT4Ko7TFurtKmQk.vj1wcHob8tzeQ72rGkrFcjTCEof4l2u', '2019-06-16 14:06:56', '2019-06-16 11:06:56'),
(22, 'viktorio_updated@gmail.com', '$2y$10$y2DhGPiwCk2KPoJyM4eBBu.nkR8XkfGaGBHE3M0AS/NkFftxg1LRC', '2019-06-17 00:10:13', '2019-06-16 21:10:13'),
(23, 'viktorminator@gmail.com', '$2y$10$yyuzO1CvVO4Wni6b993j/OpCAPtteWgp4fxFoFN8fqzDSbl4lYvmK', '2019-06-17 01:06:13', '2019-06-16 22:06:13'),
(24, '111@gmail.com', '$2y$10$EeDepVpMMHGg2g/kshk0.O/UQ1yZSOSvhKYupH3QOB24bLISmxFaa', '2019-06-17 14:17:42', '2019-06-17 11:17:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
