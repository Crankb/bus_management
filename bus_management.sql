-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 25, 2021 at 01:42 PM
-- Server version: 5.7.34-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bus_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `privileges` varchar(100) NOT NULL,
  `last_active` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `privileges`, `last_active`) VALUES
(1, 'admin', 'admin', 'all', '2021-06-16 00:00:00'),
(2, 'kingpin', 'king', 'all', '2021-06-16 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `assigned_buses`
--

CREATE TABLE `assigned_buses` (
  `id` int(11) NOT NULL,
  `bus_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `bus_state` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assigned_buses`
--

INSERT INTO `assigned_buses` (`id`, `bus_id`, `driver_id`, `route_id`, `bus_state`) VALUES
(1, 1, 2, 1, 'onroad'),
(2, 2, 1, 2, 'onroad'),
(3, 3, 3, 1, 'onservice'),
(4, 4, 4, 2, 'onpacking');

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `id` int(11) NOT NULL,
  `number_plate` varchar(100) NOT NULL,
  `made_type` varchar(100) NOT NULL,
  `sits_number` int(11) NOT NULL,
  `picture` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`id`, `number_plate`, `made_type`, `sits_number`, `picture`) VALUES
(1, 'KBK 123T', 'TOYOTA', 63, ''),
(2, 'KCG 335Y', 'ISUZU', 60, ''),
(3, 'KSG 838Y', 'SCANIA', 72, ''),
(4, 'KTC 366Q', 'ISUZU', 63, '');

-- --------------------------------------------------------

--
-- Table structure for table `bus_locations`
--

CREATE TABLE `bus_locations` (
  `id` int(11) NOT NULL,
  `bus_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `next_station_id` int(11) NOT NULL,
  `direction` varchar(1) NOT NULL,
  `distance_to_next_station` float NOT NULL,
  `distance_to_direction` float NOT NULL,
  `last_update` datetime NOT NULL,
  `bus_speed` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bus_locations`
--

INSERT INTO `bus_locations` (`id`, `bus_id`, `route_id`, `next_station_id`, `direction`, `distance_to_next_station`, `distance_to_direction`, `last_update`, `bus_speed`) VALUES
(1, 1, 1, 17, 'A', 1, 12, '2021-06-16 00:00:00', 56),
(2, 2, 2, 18, 'B', 2, 10, '2021-06-16 00:00:00', 70);

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `id` int(11) NOT NULL,
  `driver_name` varchar(100) NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `id_number` int(11) NOT NULL,
  `picture` varchar(1000) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `registered_date` datetime NOT NULL,
  `last_active` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`id`, `driver_name`, `phone_number`, `id_number`, `picture`, `password`, `registered_date`, `last_active`) VALUES
(1, 'Samuel Githaiga', '072345678', 34343425, '', 'pass', '2021-06-16 00:00:00', '2021-06-17 00:00:00'),
(2, 'Joseph Rabani', '0748656356', 6456456, '', 'pass', '2021-06-16 00:00:00', '2021-06-17 00:00:00'),
(3, 'Rasta Kamaru', '07343464624', 532526765, '', 'pass', '2021-06-16 00:00:00', '2021-06-17 00:00:00'),
(4, 'Krmana Ramathan', '0723457452', 24456647, '', 'pass', '2021-06-16 00:00:00', '2021-06-17 00:00:00'),
(5, 'Brian Waranam', '07232374332', 757656756, '', 'pass', '2021-06-16 00:00:00', '2021-06-17 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `passagers`
--

CREATE TABLE `passagers` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `picture` varchar(200) DEFAULT NULL,
  `regestered_date` datetime NOT NULL,
  `last_active` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passagers`
--

INSERT INTO `passagers` (`id`, `username`, `password`, `phone_number`, `email`, `picture`, `regestered_date`, `last_active`) VALUES
(1, 'Jabali Moster', '$2y$10$D9Zwtjy5Z4deCYLTA92xBugtdqjiyduGYWY/Yi3Jj0sRU/dERL3qS', '0754679233', 'jabali@fun.com', NULL, '2021-06-23 12:23:07', '2021-06-23 12:23:07');

-- --------------------------------------------------------

--
-- Table structure for table `passagers_sits`
--

CREATE TABLE `passagers_sits` (
  `id` int(11) NOT NULL,
  `bus_id` int(11) NOT NULL,
  `sit_number` int(11) NOT NULL,
  `state` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passagers_sits`
--

INSERT INTO `passagers_sits` (`id`, `bus_id`, `sit_number`, `state`) VALUES
(1, 1, 1, 'free'),
(2, 1, 2, 'free'),
(3, 1, 3, 'free'),
(4, 1, 4, 'free'),
(5, 1, 5, 'free'),
(6, 1, 6, 'free'),
(7, 1, 7, 'free'),
(8, 1, 8, 'free'),
(9, 1, 9, 'free'),
(10, 1, 10, 'free'),
(11, 1, 11, 'free'),
(12, 1, 12, 'free'),
(13, 1, 13, 'free'),
(14, 1, 14, 'free'),
(15, 1, 15, 'free'),
(16, 1, 16, 'free'),
(17, 1, 17, 'free'),
(18, 1, 18, 'free'),
(19, 1, 19, 'free'),
(20, 1, 20, 'free'),
(21, 1, 21, 'free'),
(22, 1, 22, 'free'),
(23, 1, 23, 'free'),
(24, 1, 24, 'free'),
(25, 1, 25, 'free'),
(26, 1, 26, 'free'),
(27, 1, 27, 'free'),
(28, 1, 28, 'free'),
(29, 1, 29, 'free'),
(30, 1, 30, 'free'),
(31, 1, 31, 'free'),
(32, 1, 32, 'free'),
(33, 1, 33, 'free'),
(34, 1, 34, 'free'),
(35, 1, 35, 'free'),
(36, 1, 36, 'free'),
(37, 1, 37, 'free'),
(38, 1, 38, 'free'),
(39, 1, 39, 'free'),
(40, 1, 40, 'free'),
(41, 1, 41, 'free'),
(42, 1, 42, 'free'),
(43, 1, 43, 'free'),
(44, 1, 44, 'free'),
(45, 1, 45, 'free'),
(46, 1, 46, 'free'),
(47, 1, 47, 'free'),
(48, 1, 48, 'free'),
(49, 1, 49, 'free'),
(50, 1, 50, 'free'),
(51, 1, 51, 'free'),
(52, 1, 52, 'free'),
(53, 1, 53, 'free'),
(54, 1, 54, 'free'),
(55, 1, 55, 'free'),
(56, 1, 56, 'free'),
(57, 1, 57, 'free'),
(58, 1, 58, 'free'),
(59, 1, 59, 'free'),
(60, 1, 60, 'free'),
(61, 1, 61, 'free'),
(62, 1, 62, 'free'),
(63, 1, 63, 'free'),
(64, 2, 1, 'free'),
(65, 2, 2, 'free'),
(66, 2, 3, 'free'),
(67, 2, 4, 'free'),
(68, 2, 5, 'free'),
(69, 2, 6, 'free'),
(70, 2, 7, 'free'),
(71, 2, 8, 'free'),
(72, 2, 9, 'free'),
(73, 2, 10, 'free'),
(74, 2, 11, 'free'),
(75, 2, 12, 'free'),
(76, 2, 13, 'free'),
(77, 2, 14, 'free'),
(78, 2, 15, 'free'),
(79, 2, 16, 'free'),
(80, 2, 17, 'free'),
(81, 2, 18, 'free'),
(82, 2, 19, 'free'),
(83, 2, 20, 'free'),
(84, 2, 21, 'free'),
(85, 2, 22, 'free'),
(86, 2, 23, 'free'),
(87, 2, 24, 'free'),
(88, 2, 25, 'free'),
(89, 2, 26, 'free'),
(90, 2, 27, 'free'),
(91, 2, 28, 'free'),
(92, 2, 29, 'free'),
(93, 2, 30, 'free'),
(94, 2, 31, 'free'),
(95, 2, 32, 'free'),
(96, 2, 33, 'free'),
(97, 2, 34, 'free'),
(98, 2, 35, 'free'),
(99, 2, 36, 'free'),
(100, 2, 37, 'free'),
(101, 2, 38, 'free'),
(102, 2, 39, 'free'),
(103, 2, 40, 'free'),
(104, 2, 41, 'free'),
(105, 2, 42, 'free'),
(106, 2, 43, 'free'),
(107, 2, 44, 'free'),
(108, 2, 45, 'free'),
(109, 2, 46, 'free'),
(110, 2, 47, 'free'),
(111, 2, 48, 'free'),
(112, 2, 49, 'free'),
(113, 2, 50, 'free'),
(114, 2, 51, 'free'),
(115, 2, 52, 'free'),
(116, 2, 53, 'free'),
(117, 2, 54, 'free'),
(118, 2, 55, 'free'),
(119, 2, 56, 'free'),
(120, 2, 57, 'free'),
(121, 2, 58, 'free'),
(122, 2, 59, 'free'),
(123, 2, 60, 'free'),
(124, 3, 1, 'free'),
(125, 3, 2, 'free'),
(126, 3, 3, 'free'),
(127, 3, 4, 'free'),
(128, 3, 5, 'free'),
(129, 3, 6, 'free'),
(130, 3, 7, 'free'),
(131, 3, 8, 'free'),
(132, 3, 9, 'free'),
(133, 3, 10, 'free'),
(134, 3, 11, 'free'),
(135, 3, 12, 'free'),
(136, 3, 13, 'free'),
(137, 3, 14, 'free'),
(138, 3, 15, 'free'),
(139, 3, 16, 'free'),
(140, 3, 17, 'free'),
(141, 3, 18, 'free'),
(142, 3, 19, 'free'),
(143, 3, 20, 'free'),
(144, 3, 21, 'free'),
(145, 3, 22, 'free'),
(146, 3, 23, 'free'),
(147, 3, 24, 'free'),
(148, 3, 25, 'free'),
(149, 3, 26, 'free'),
(150, 3, 27, 'free'),
(151, 3, 28, 'free'),
(152, 3, 29, 'free'),
(153, 3, 30, 'free'),
(154, 3, 31, 'free'),
(155, 3, 32, 'free'),
(156, 3, 33, 'free'),
(157, 3, 34, 'free'),
(158, 3, 35, 'free'),
(159, 3, 36, 'free'),
(160, 3, 37, 'free'),
(161, 3, 38, 'free'),
(162, 3, 39, 'free'),
(163, 3, 40, 'free'),
(164, 3, 41, 'free'),
(165, 3, 42, 'free'),
(166, 3, 43, 'free'),
(167, 3, 44, 'free'),
(168, 3, 45, 'free'),
(169, 3, 46, 'free'),
(170, 3, 47, 'free'),
(171, 3, 48, 'free'),
(172, 3, 49, 'free'),
(173, 3, 50, 'free'),
(174, 3, 51, 'free'),
(175, 3, 52, 'free'),
(176, 3, 53, 'free'),
(177, 3, 54, 'free'),
(178, 3, 55, 'free'),
(179, 3, 56, 'free'),
(180, 3, 57, 'free'),
(181, 3, 58, 'free'),
(182, 3, 59, 'free'),
(183, 3, 60, 'free'),
(184, 3, 61, 'free'),
(185, 3, 62, 'free'),
(186, 3, 63, 'free'),
(187, 3, 64, 'free'),
(188, 3, 65, 'free'),
(189, 3, 66, 'free'),
(190, 3, 67, 'free'),
(191, 3, 68, 'free'),
(192, 3, 69, 'free'),
(193, 3, 70, 'free'),
(194, 3, 71, 'free'),
(195, 3, 72, 'free'),
(196, 4, 1, 'free'),
(197, 4, 2, 'free'),
(198, 4, 3, 'free'),
(199, 4, 4, 'free'),
(200, 4, 5, 'free'),
(201, 4, 6, 'free'),
(202, 4, 7, 'free'),
(203, 4, 8, 'free'),
(204, 4, 9, 'free'),
(205, 4, 10, 'free'),
(206, 4, 11, 'free'),
(207, 4, 12, 'free'),
(208, 4, 13, 'free'),
(209, 4, 14, 'free'),
(210, 4, 15, 'free'),
(211, 4, 16, 'free'),
(212, 4, 17, 'free'),
(213, 4, 18, 'free'),
(214, 4, 19, 'free'),
(215, 4, 20, 'free'),
(216, 4, 21, 'free'),
(217, 4, 22, 'free'),
(218, 4, 23, 'free'),
(219, 4, 24, 'free'),
(220, 4, 25, 'free'),
(221, 4, 26, 'free'),
(222, 4, 27, 'free'),
(223, 4, 28, 'free'),
(224, 4, 29, 'free'),
(225, 4, 30, 'free'),
(226, 4, 31, 'free'),
(227, 4, 32, 'free'),
(228, 4, 33, 'free'),
(229, 4, 34, 'free'),
(230, 4, 35, 'free'),
(231, 4, 36, 'free'),
(232, 4, 37, 'free'),
(233, 4, 38, 'free'),
(234, 4, 39, 'free'),
(235, 4, 40, 'free'),
(236, 4, 41, 'free'),
(237, 4, 42, 'free'),
(238, 4, 43, 'free'),
(239, 4, 44, 'free'),
(240, 4, 45, 'free'),
(241, 4, 46, 'free'),
(242, 4, 47, 'free'),
(243, 4, 48, 'free'),
(244, 4, 49, 'free'),
(245, 4, 50, 'free'),
(246, 4, 51, 'free'),
(247, 4, 52, 'free'),
(248, 4, 53, 'free'),
(249, 4, 54, 'free'),
(250, 4, 55, 'free'),
(251, 4, 56, 'free'),
(252, 4, 57, 'free'),
(253, 4, 58, 'free'),
(254, 4, 59, 'free'),
(255, 4, 60, 'free'),
(256, 4, 61, 'free'),
(257, 4, 62, 'free'),
(258, 4, 63, 'free');

-- --------------------------------------------------------

--
-- Table structure for table `passager_location`
--

CREATE TABLE `passager_location` (
  `id` int(11) NOT NULL,
  `passager_id` int(11) NOT NULL,
  `near_station_id` int(11) NOT NULL,
  `distance_to_station` float NOT NULL,
  `last_update` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `id` int(11) NOT NULL,
  `station_A` int(11) NOT NULL,
  `station_B` int(11) NOT NULL,
  `distance` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `routes`
--

INSERT INTO `routes` (`id`, `station_A`, `station_B`, `distance`) VALUES
(1, 13, 10, 51),
(2, 13, 7, 29);

-- --------------------------------------------------------

--
-- Table structure for table `route_stations`
--

CREATE TABLE `route_stations` (
  `id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `station_id` int(11) NOT NULL,
  `number_from_A` int(11) NOT NULL,
  `distance_from_A` float NOT NULL,
  `amount_from_A` int(11) NOT NULL,
  `amount_from_last` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `route_stations`
--

INSERT INTO `route_stations` (`id`, `route_id`, `station_id`, `number_from_A`, `distance_from_A`, `amount_from_A`, `amount_from_last`) VALUES
(1, 1, 13, 0, 0, 0, 0),
(2, 1, 14, 1, 4, 20, 20),
(3, 1, 15, 2, 7, 30, 20),
(4, 1, 16, 3, 9, 30, 20),
(5, 1, 17, 4, 11, 40, 20),
(6, 1, 11, 5, 13, 40, 20),
(7, 1, 1, 6, 15, 40, 20),
(8, 1, 2, 7, 17, 50, 20),
(9, 1, 3, 8, 18, 50, 20),
(10, 1, 4, 9, 19, 60, 20),
(11, 1, 18, 10, 21, 70, 20),
(12, 1, 5, 11, 22, 70, 20),
(13, 1, 6, 12, 27, 80, 20),
(14, 1, 8, 13, 32, 80, 20),
(15, 1, 9, 14, 39, 100, 30),
(16, 1, 10, 15, 50, 120, 40),
(17, 2, 13, 0, 0, 0, 0),
(18, 2, 14, 1, 4, 20, 20),
(19, 2, 15, 2, 7, 30, 20),
(20, 2, 16, 3, 9, 30, 20),
(21, 2, 17, 4, 11, 40, 20),
(22, 2, 11, 5, 13, 40, 20),
(23, 2, 1, 6, 15, 40, 20),
(24, 2, 2, 7, 17, 50, 20),
(25, 2, 3, 8, 18, 50, 20),
(26, 2, 4, 9, 19, 60, 20),
(27, 2, 18, 10, 21, 70, 20),
(28, 2, 5, 11, 22, 70, 20),
(29, 2, 7, 12, 29, 80, 20);

-- --------------------------------------------------------

--
-- Table structure for table `stations`
--

CREATE TABLE `stations` (
  `id` int(11) NOT NULL,
  `station_name` varchar(200) NOT NULL,
  `picture` varchar(1000) NOT NULL,
  `location` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stations`
--

INSERT INTO `stations` (`id`, `station_name`, `picture`, `location`) VALUES
(1, 'githurai', '', ''),
(2, 'kahawa wendani', '', ''),
(3, 'kahawa sukari', '', ''),
(4, 'kenyatta university', '', ''),
(5, 'bypass', '', ''),
(6, 'ruiru inje', '', ''),
(7, 'ruiru town', '', ''),
(8, 'kimbo', '', ''),
(9, 'juja', '', ''),
(10, 'thika', '', ''),
(11, 'car wash', '', ''),
(12, 'santon', '', ''),
(13, 'nairobi town', '', ''),
(14, 'pangani', '', ''),
(15, 'don home', '', ''),
(16, 'roisambo', '', ''),
(17, 'muthurwa', '', ''),
(18, 'brookside', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `to_route_station_id` int(11) NOT NULL,
  `from_route_station_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `bus_id` int(11) NOT NULL,
  `sit_id` int(11) NOT NULL,
  `state` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_fare`
--

CREATE TABLE `ticket_fare` (
  `id` int(11) NOT NULL,
  `passager_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `acquired_time` date NOT NULL,
  `last_checked_time` datetime NOT NULL,
  `state` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `transaction_code` varchar(200) NOT NULL,
  `transaction_time` datetime NOT NULL,
  `type` varchar(100) NOT NULL,
  `deal_state` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assigned_buses`
--
ALTER TABLE `assigned_buses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bus_locations`
--
ALTER TABLE `bus_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `passagers`
--
ALTER TABLE `passagers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `passagers_sits`
--
ALTER TABLE `passagers_sits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `passager_location`
--
ALTER TABLE `passager_location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `route_stations`
--
ALTER TABLE `route_stations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stations`
--
ALTER TABLE `stations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_fare`
--
ALTER TABLE `ticket_fare`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `assigned_buses`
--
ALTER TABLE `assigned_buses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `bus`
--
ALTER TABLE `bus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `bus_locations`
--
ALTER TABLE `bus_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `passagers`
--
ALTER TABLE `passagers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `passagers_sits`
--
ALTER TABLE `passagers_sits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=259;
--
-- AUTO_INCREMENT for table `passager_location`
--
ALTER TABLE `passager_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `route_stations`
--
ALTER TABLE `route_stations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `stations`
--
ALTER TABLE `stations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ticket_fare`
--
ALTER TABLE `ticket_fare`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
