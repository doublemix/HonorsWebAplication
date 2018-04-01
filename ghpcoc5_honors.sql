-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 20, 2018 at 07:02 PM
-- Server version: 10.2.12-MariaDB-log
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ghpcoc5_honors`
--

-- --------------------------------------------------------

--
-- Table structure for table `capstone`
--

CREATE TABLE `capstone` (
  `capstone_id` int(11) NOT NULL,
  `usr_id` int(11) NOT NULL,
  `capstone_name` varchar(100) NOT NULL,
  `capstone_description` varchar(500) NOT NULL,
  `capstone_advisor` varchar(60) NOT NULL,
  `capstone_requirements` varchar(200) NOT NULL,
  `capstone_startdate` datetime NOT NULL,
  `capstone_enddate` datetime NOT NULL,
  `capstone_complete` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `capstone`
--

INSERT INTO `capstone` (`capstone_id`, `usr_id`, `capstone_name`, `capstone_description`, `capstone_advisor`, `capstone_requirements`, `capstone_startdate`, `capstone_enddate`, `capstone_complete`) VALUES
(1, 221, 'Synthesis of Gold Nanoparticles using Catechins in Tea', 'Gold nanoparticles will be formed using various brands of tea to reduce gold chloride in aqueous solution.', 'Dr. Dumm', 'Written report and poster presentation', '2016-09-23 00:00:00', '2017-04-28 16:00:00', 1),
(2, 184, 'An Analysis of African American Gangs and Community-based Initiatives', 'See student proposal', 'Dr. Brooke Harlowe; Dr. Tiothy Baylor', 'Paper and poster presentation', '2016-02-12 00:00:00', '2016-12-02 01:00:00', 1),
(3, 189, 'Business Card Exchange Application for Android devices', 'See student proposal', 'Dr. Krish Pillai; Dr. Susan Strayer', 'Computer project; reflection on project; presentation', '2016-09-23 00:00:00', '2016-12-02 01:00:00', 1),
(4, 190, 'Work Function measurements via STM and TS on clean fresh cleaved HOPG and Gold thin films on HOPG un', 'See proposal', 'Dr. IC Senevirathne, Dr. Marian Tzolov', 'paper and presentation', '2016-02-12 00:00:00', '2016-12-02 01:00:00', 1),
(5, 214, 'Ambient Local density of states measurements via STM and TS on HOPG and Gold thin films on HOPG', 'See proposal', 'Dr. IC Senevirathne, Dr. Marian Tzolov', 'paper and presentation', '2016-02-12 00:00:00', '2016-12-02 01:00:00', 1),
(6, 194, 'Kinesio Tape: Shoulder Stability', 'See proposal; Independent Study', 'Dr. Lippincott, Dr. Streator', 'paper and poster presentation', '2016-09-16 00:00:00', '2016-12-02 01:00:00', 1),
(7, 196, 'Exercise Modality and Self-Selected Exercise', 'See proposal', 'Dr. Haile, Dr. Dixon', 'paper and presentation', '2016-02-12 00:00:00', '2016-12-02 01:00:00', 1),
(8, 210, 'Cosmic Rays and Their High Energy Interactions with Earth\'s Atmosphere', 'See proposal', 'Dr. Reid, Dr. Wheeler', 'paper and presentation', '2016-02-12 00:00:00', '2016-12-02 01:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `FA17_academicevents`
--

CREATE TABLE `FA17_academicevents` (
  `acad_id` int(11) NOT NULL,
  `acad_title` varchar(60) NOT NULL,
  `acad_description` varchar(200) NOT NULL,
  `acad_start_date` datetime NOT NULL,
  `acad_end_date` datetime NOT NULL,
  `acad_bg_color` varchar(7) DEFAULT '#0000ff',
  `acad_ft_color` varchar(7) DEFAULT '#ffffff'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FA17_academicevents`
--

INSERT INTO `FA17_academicevents` (`acad_id`, `acad_title`, `acad_description`, `acad_start_date`, `acad_end_date`, `acad_bg_color`, `acad_ft_color`) VALUES
(1, 'Scholarship Info. Session', 'AE', '2017-09-05 15:45:00', '2017-09-05 16:45:00', '#0000ff', '#ffffff'),
(2, 'Documentary & Discussion', 'AE', '2017-09-14 12:30:00', '2017-09-14 13:30:00', '#0000ff', '#ffffff'),
(3, 'International Night', 'AE', '2017-09-20 18:30:00', '2017-09-20 19:30:00', '#0000ff', '#ffffff'),
(4, 'Career Services Workshop', 'AE', '2017-09-26 12:30:00', '2017-09-26 13:30:00', '#0000ff', '#ffffff'),
(5, 'Stress Relief Workshop', 'AE', '2017-10-11 19:00:00', '2017-10-11 20:00:00', '#0000ff', '#ffffff'),
(6, 'Domestic Violence Vigil', 'AE', '2017-10-15 00:00:00', '2017-10-15 01:00:00', '#0000ff', '#ffffff'),
(7, 'Guest Poet', 'AE', '2017-10-16 19:00:00', '2017-10-16 20:00:00', '#0000ff', '#ffffff'),
(8, 'Department Roulette', 'AE', '2017-10-19 18:00:00', '2017-10-19 19:00:00', '#0000ff', '#ffffff'),
(9, 'Art Show', 'AE', '2017-10-23 18:00:00', '2017-10-23 19:00:00', '#0000ff', '#ffffff'),
(10, 'Last Lecture Speaker Series', 'AE', '2017-11-08 18:30:00', '2017-11-08 19:30:00', '#0000ff', '#ffffff'),
(11, 'Documentary & Discussion', 'AE', '2017-11-14 12:30:00', '2017-11-14 13:30:00', '#0000ff', '#ffffff'),
(12, 'Capstone Presentations', 'Capstone presentations', '2017-12-07 18:30:00', '2017-12-07 19:30:00', '#0000ff', '#ffffff'),
(13, 'Paris and London Meeting', 'Informational meeting about the Paris and London trip.', '2017-09-21 18:00:00', '2017-09-21 19:00:00', '#0000ff', '#ffffff'),
(14, 'Dance Consort', 'Dance Consort', '2017-11-17 00:00:00', '2017-11-17 01:00:00', '#0000ff', '#ffffff'),
(15, 'Choral Concert', 'LHU Choral Concert', '2017-12-01 00:00:00', '2017-12-01 01:00:00', '#0000ff', '#ffffff');

-- --------------------------------------------------------

--
-- Table structure for table `FA17_academicevent_attendence`
--

CREATE TABLE `FA17_academicevent_attendence` (
  `acad_att_id` int(11) NOT NULL,
  `acad_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FA17_academicevent_attendence`
--

INSERT INTO `FA17_academicevent_attendence` (`acad_att_id`, `acad_id`, `pstu_id`) VALUES
(2, 1, 8),
(28, 1, 22),
(19, 1, 23),
(12, 1, 24),
(27, 1, 25),
(11, 1, 45),
(3, 1, 46),
(25, 1, 65),
(7, 1, 78),
(22, 1, 96),
(26, 1, 97),
(1, 1, 128),
(8, 1, 229),
(13, 1, 230),
(21, 1, 231),
(14, 1, 233),
(5, 1, 235),
(20, 1, 241),
(10, 1, 246),
(23, 1, 248),
(9, 1, 251),
(15, 1, 254),
(24, 1, 255),
(6, 1, 257),
(4, 1, 259),
(16, 1, 267),
(18, 1, 269),
(17, 1, 270),
(65, 1, 273),
(31, 2, 42),
(30, 2, 234),
(29, 2, 243),
(39, 3, 18),
(48, 3, 42),
(49, 3, 48),
(51, 3, 50),
(53, 3, 105),
(54, 3, 110),
(37, 3, 127),
(34, 3, 217),
(32, 3, 227),
(33, 3, 228),
(35, 3, 229),
(36, 3, 230),
(38, 3, 245),
(45, 3, 252),
(46, 3, 257),
(47, 3, 260),
(50, 3, 263),
(52, 3, 264),
(61, 4, 28),
(60, 4, 31),
(59, 4, 44),
(57, 4, 48),
(58, 4, 60),
(56, 4, 91),
(55, 4, 160),
(70, 5, 61),
(75, 5, 67),
(78, 5, 80),
(79, 5, 85),
(81, 5, 100),
(82, 5, 102),
(87, 5, 105),
(84, 5, 106),
(86, 5, 110),
(69, 5, 123),
(73, 5, 132),
(76, 5, 135),
(66, 5, 229),
(67, 5, 231),
(68, 5, 234),
(71, 5, 241),
(72, 5, 243),
(74, 5, 248),
(77, 5, 255),
(80, 5, 263),
(83, 5, 264),
(85, 5, 265),
(104, 6, 49),
(105, 6, 66),
(106, 6, 91),
(103, 6, 111),
(101, 6, 143),
(102, 6, 148),
(112, 7, 17),
(119, 7, 43),
(116, 7, 72),
(118, 7, 89),
(121, 7, 95),
(122, 7, 101),
(117, 7, 140),
(107, 7, 228),
(108, 7, 231),
(109, 7, 232),
(110, 7, 236),
(111, 7, 237),
(113, 7, 245),
(114, 7, 248),
(115, 7, 252),
(120, 7, 261),
(223, 8, 9),
(224, 8, 10),
(234, 8, 21),
(239, 8, 37),
(240, 8, 40),
(231, 8, 64),
(238, 8, 85),
(241, 8, 96),
(243, 8, 109),
(227, 8, 127),
(230, 8, 131),
(237, 8, 147),
(242, 8, 156),
(245, 8, 158),
(220, 8, 231),
(221, 8, 233),
(222, 8, 234),
(225, 8, 240),
(226, 8, 241),
(228, 8, 242),
(229, 8, 244),
(232, 8, 248),
(233, 8, 251),
(235, 8, 254),
(236, 8, 258),
(244, 8, 265),
(97, 9, 12),
(89, 9, 24),
(96, 9, 29),
(88, 9, 59),
(98, 9, 69),
(123, 9, 84),
(93, 9, 101),
(100, 9, 137),
(99, 9, 160),
(94, 9, 227),
(92, 9, 228),
(95, 9, 239),
(91, 9, 252),
(90, 9, 260),
(159, 10, 8),
(191, 10, 9),
(141, 10, 10),
(174, 10, 12),
(190, 10, 13),
(126, 10, 17),
(155, 10, 22),
(178, 10, 23),
(154, 10, 25),
(175, 10, 29),
(137, 10, 30),
(153, 10, 34),
(135, 10, 39),
(194, 10, 40),
(133, 10, 43),
(157, 10, 45),
(196, 10, 47),
(124, 10, 53),
(128, 10, 54),
(176, 10, 56),
(199, 10, 57),
(189, 10, 64),
(142, 10, 66),
(138, 10, 68),
(168, 10, 69),
(177, 10, 76),
(186, 10, 79),
(146, 10, 80),
(145, 10, 84),
(160, 10, 98),
(125, 10, 102),
(161, 10, 103),
(131, 10, 106),
(127, 10, 109),
(164, 10, 111),
(139, 10, 119),
(172, 10, 120),
(180, 10, 123),
(156, 10, 126),
(179, 10, 132),
(149, 10, 135),
(162, 10, 143),
(140, 10, 145),
(129, 10, 147),
(163, 10, 148),
(198, 10, 158),
(158, 10, 159),
(181, 10, 217),
(151, 10, 227),
(193, 10, 229),
(134, 10, 231),
(165, 10, 234),
(169, 10, 235),
(148, 10, 236),
(147, 10, 237),
(143, 10, 239),
(150, 10, 240),
(167, 10, 241),
(171, 10, 243),
(197, 10, 244),
(182, 10, 246),
(136, 10, 247),
(166, 10, 248),
(187, 10, 252),
(195, 10, 253),
(188, 10, 254),
(170, 10, 255),
(144, 10, 256),
(132, 10, 257),
(173, 10, 258),
(185, 10, 260),
(183, 10, 263),
(184, 10, 264),
(192, 10, 265),
(130, 10, 267),
(200, 11, 61),
(261, 12, 36),
(256, 12, 37),
(257, 12, 40),
(260, 12, 58),
(262, 12, 63),
(264, 12, 90),
(263, 12, 116),
(265, 12, 126),
(267, 12, 128),
(266, 12, 140),
(253, 12, 240),
(258, 12, 242),
(259, 12, 250),
(255, 12, 259),
(62, 13, 81),
(64, 13, 226),
(63, 13, 235),
(207, 14, 31),
(218, 14, 36),
(249, 14, 49),
(216, 14, 60),
(217, 14, 63),
(215, 14, 72),
(247, 14, 79),
(205, 14, 81),
(209, 14, 86),
(208, 14, 88),
(210, 14, 90),
(219, 14, 116),
(201, 14, 119),
(206, 14, 120),
(211, 14, 131),
(202, 14, 233),
(246, 14, 239),
(212, 14, 242),
(248, 14, 246),
(214, 14, 250),
(213, 14, 251),
(203, 14, 269),
(204, 14, 273),
(250, 15, 26),
(251, 15, 156),
(269, 15, 244),
(268, 15, 250),
(252, 15, 259);

-- --------------------------------------------------------

--
-- Table structure for table `FA17_activitygroup`
--

CREATE TABLE `FA17_activitygroup` (
  `ag_id` int(11) NOT NULL,
  `ag_title` varchar(40) NOT NULL,
  `ag_description` varchar(500) NOT NULL,
  `ag_imagepath` varchar(30) DEFAULT NULL,
  `ag_bg_color` varchar(7) DEFAULT '#0000ff',
  `ag_ft_color` varchar(7) DEFAULT '#ffffff'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FA17_activitygroup`
--

INSERT INTO `FA17_activitygroup` (`ag_id`, `ag_title`, `ag_description`, `ag_imagepath`, `ag_bg_color`, `ag_ft_color`) VALUES
(1, 'Special Events', 'SE', '', '#0000ff', '#ffffff'),
(2, 'Study Hour', 'AG', '', '#0000ff', '#ffffff'),
(3, 'Disney Movies', 'AG', '', '#0000ff', '#ffffff'),
(4, 'Superhero Movie Group', 'AG', '', '#0000ff', '#ffffff'),
(5, 'Anything Goes', 'AG', '', '#0000ff', '#ffffff'),
(6, 'Dr. Honors', 'AG', '', '#0000ff', '#ffffff'),
(7, 'Release the Beasts', 'AG', '', '#0000ff', '#ffffff'),
(8, 'Animania', 'AG', '', '#0000ff', '#ffffff'),
(9, 'Musicals and More', 'AG', '', '#0000ff', '#ffffff'),
(10, 'Color Me Crazy', 'AG', '', '#0000ff', '#ffffff'),
(11, 'Diagnose and Discuss', 'AG', '', '#0000ff', '#ffffff'),
(12, 'Spikeball', 'AG', '', '#0000ff', '#ffffff'),
(13, 'Study Time', 'AG', '', '#0000ff', '#ffffff'),
(14, 'Creating Utopia', 'AG', '', '#0000ff', '#ffffff'),
(15, 'BIW', 'Online AG', '', '#0000ff', '#ffffff'),
(16, 'Studying the Sciences', 'AG', '', '#0000ff', '#ffffff'),
(17, 'Update Group', 'update group', '', '#0000ff', '#ffffff');

-- --------------------------------------------------------

--
-- Table structure for table `FA17_activitygroupleaders`
--

CREATE TABLE `FA17_activitygroupleaders` (
  `ag_leaders` int(11) NOT NULL,
  `ag_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FA17_activitygroupleaders`
--

INSERT INTO `FA17_activitygroupleaders` (`ag_leaders`, `ag_id`, `pstu_id`) VALUES
(29, 1, 24),
(2, 2, 113),
(3, 3, 12),
(21, 4, 54),
(20, 4, 149),
(9, 5, 56),
(8, 5, 160),
(11, 6, 98),
(10, 6, 103),
(5, 7, 97),
(17, 8, 8),
(16, 8, 42),
(6, 9, 100),
(7, 9, 102),
(12, 10, 95),
(15, 11, 46),
(18, 12, 6),
(19, 12, 29),
(13, 13, 85),
(14, 14, 131),
(4, 15, 145),
(23, 16, 64),
(22, 16, 101),
(30, 17, 50);

-- --------------------------------------------------------

--
-- Table structure for table `FA17_activitygroupsession`
--

CREATE TABLE `FA17_activitygroupsession` (
  `agses_id` int(11) NOT NULL,
  `ag_id` int(11) NOT NULL,
  `agses_start_time` datetime NOT NULL,
  `agses_end_time` datetime NOT NULL,
  `agses_description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FA17_activitygroupsession`
--

INSERT INTO `FA17_activitygroupsession` (`agses_id`, `ag_id`, `agses_start_time`, `agses_end_time`, `agses_description`) VALUES
(2, 1, '2017-08-30 12:30:00', '2017-08-30 13:30:00', 'Welcome Back BBQ'),
(3, 5, '2017-09-11 17:00:00', '2017-09-11 18:00:00', 'HIIT workout-cardio, thighs, abs'),
(4, 5, '2017-09-13 17:00:00', '2017-09-13 18:00:00', 'HIIT-legs, arms, abs, cardio'),
(5, 5, '2017-09-18 17:00:00', '2017-09-18 18:00:00', 'HIIT-legs, arms, abs, cardio'),
(6, 5, '2017-09-20 17:00:00', '2017-09-20 18:00:00', 'stations-abs, legs, cardio, arms'),
(7, 5, '2017-09-25 17:00:00', '2017-09-25 18:00:00', 'HIIT workout'),
(8, 5, '2017-09-27 17:00:00', '2017-09-27 18:00:00', '7 minute workouts'),
(9, 5, '2017-10-02 17:00:00', '2017-10-02 18:00:00', 'stations focusing on core and thighs'),
(10, 5, '2017-10-04 17:00:00', '2017-10-04 18:00:00', 'HIIT workout'),
(11, 5, '2017-10-11 17:00:00', '2017-10-11 18:00:00', 'HIIT- 4 sets of 4, 30 second exercises'),
(12, 5, '2017-10-16 17:00:00', '2017-10-16 18:00:00', 'HIIT Workout'),
(13, 5, '2017-10-18 17:00:00', '2017-10-18 18:00:00', 'Full body bar workout'),
(14, 5, '2017-10-23 17:00:00', '2017-10-23 18:00:00', 'full body workout with a weighted bar'),
(15, 5, '2017-10-25 17:00:00', '2017-10-25 18:00:00', 'legs and cardio'),
(16, 5, '2017-10-30 17:00:00', '2017-10-30 18:00:00', 'HIIT workout'),
(17, 5, '2017-11-01 17:00:00', '2017-11-01 18:00:00', 'HIIT workout'),
(18, 5, '2017-11-06 17:00:00', '2017-11-06 18:00:00', 'abs, arms, and cardio'),
(19, 5, '2017-11-08 17:00:00', '2017-11-08 18:00:00', 'Arms, legs, and abs with the steppers'),
(20, 5, '2017-11-13 17:00:00', '2017-11-13 18:00:00', 'HIIT workout'),
(21, 5, '2017-11-15 17:00:00', '2017-11-15 18:00:00', 'stations'),
(22, 5, '2017-11-20 17:00:00', '2017-11-20 18:00:00', 'HIIT workout'),
(23, 5, '2017-11-27 17:00:00', '2017-11-27 18:00:00', 'Stability Ball workout'),
(24, 5, '2017-11-29 17:00:00', '2017-11-29 18:00:00', 'this session has not occurred yet'),
(25, 5, '2017-12-04 17:00:00', '2017-12-04 18:00:00', '\"Anything Goes\"-we did a little bit of everything and let the class decide what workouts they wanted to do'),
(26, 5, '2017-12-06 17:00:00', '2017-12-06 18:00:00', 'HIIT workout'),
(27, 9, '2017-09-13 18:00:00', '2017-09-13 19:00:00', 'This session has not occurred yet'),
(28, 9, '2017-09-20 18:00:00', '2017-09-20 19:00:00', 'This session has not occurred yet'),
(29, 9, '2017-09-27 18:00:00', '2017-09-27 19:00:00', 'We began watching Les MisÃ©rables.'),
(30, 9, '2017-10-04 18:00:00', '2017-10-04 19:00:00', 'We continued to watch Les MisÃ©rables.'),
(31, 9, '2017-10-11 18:00:00', '2017-10-11 19:00:00', 'We finished Les MisÃ©rables.'),
(32, 9, '2017-10-18 18:00:00', '2017-10-18 19:00:00', 'We started watching Into The Woods.'),
(33, 9, '2017-10-25 18:00:00', '2017-10-25 19:00:00', 'We continued watching Into The Woods.'),
(34, 9, '2017-11-01 18:00:00', '2017-11-01 19:00:00', 'We finished Into The Woods and started Billy Elliot.'),
(35, 9, '2017-11-08 18:00:00', '2017-11-08 19:00:00', 'This session has not occurred yet'),
(36, 9, '2017-11-15 18:00:00', '2017-11-15 19:00:00', 'We continued watching Billy Elliot.'),
(37, 9, '2017-11-29 18:00:00', '2017-11-29 19:00:00', 'Today we finished watching Billy Elliot.'),
(38, 9, '2017-12-06 18:00:00', '2017-12-06 19:00:00', 'Today, we listened to popular musical soundtracks while studying.'),
(39, 7, '2017-09-12 12:00:00', '2017-09-12 13:00:00', 'We walked and played with several dogs at the SPCA'),
(40, 7, '2017-09-19 12:00:00', '2017-09-19 13:00:00', 'Played with several dogs in the yard and also played and brushed cats in the cat room.'),
(41, 7, '2017-09-26 12:00:00', '2017-09-26 13:00:00', 'Gave a dog a bath and played with several cats in the cat room.'),
(42, 7, '2017-10-03 12:00:00', '2017-10-03 13:00:00', 'Helped decorate and reorganize the SPCA hallway to get ready for the fall.'),
(43, 7, '2017-10-10 12:00:00', '2017-10-10 13:00:00', 'session was cancelled due to change to a monday schedule'),
(44, 7, '2017-10-17 12:00:00', '2017-10-17 13:00:00', 'Played with cats in the cat room and socialized dogs on walks.'),
(45, 7, '2017-10-24 12:00:00', '2017-10-24 13:00:00', 'Walked the dogs and played in the cat room.'),
(46, 7, '2017-10-31 12:00:00', '2017-10-31 13:00:00', 'Walked the dogs and played in the cat room.'),
(47, 7, '2017-11-07 12:00:00', '2017-11-07 13:00:00', 'Walked dogs and played in the cat room.'),
(48, 7, '2017-11-14 12:00:00', '2017-11-14 13:00:00', 'This session has not occurred yet'),
(49, 7, '2017-11-28 12:00:00', '2017-11-28 13:00:00', 'Walked dogs and played in the cat room.'),
(50, 13, '2017-09-07 14:00:00', '2017-09-07 15:00:00', 'Honors Members can attend Study Time on Thursdays from 2-3PM at the honors house and work together or independently to meet their academic goals and complete work.'),
(51, 13, '2017-09-14 14:00:00', '2017-09-14 15:00:00', 'Honors Members can attend Study Time on Thursdays from 2-3PM at the honors house and work together or independently to meet their academic goals and complete work.'),
(52, 13, '2017-09-21 14:00:00', '2017-09-21 15:00:00', 'Honors Members can attend Study Time on Thursdays from 2-3PM at the honors house and work together or independently to meet their academic goals and complete work.'),
(53, 13, '2017-09-28 14:00:00', '2017-09-28 15:00:00', 'Honors Members can attend Study Time on Thursdays from 2-3PM at the honors house and work together or independently to meet their academic goals and complete work.'),
(54, 13, '2017-10-05 14:00:00', '2017-10-05 15:00:00', 'Honors Members can attend Study Time on Thursdays from 2-3PM at the honors house and work together or independently to meet their academic goals and complete work.'),
(55, 13, '2017-10-12 14:00:00', '2017-10-12 15:00:00', 'Honors Members can attend Study Time on Thursdays from 2-3PM at the honors house and work together or independently to meet their academic goals and complete work.'),
(56, 13, '2017-10-19 14:00:00', '2017-10-19 15:00:00', 'Honors Members can attend Study Time on Thursdays from 2-3PM at the honors house and work together or independently to meet their academic goals and complete work.'),
(57, 13, '2017-10-26 14:00:00', '2017-10-26 15:00:00', 'Honors Members can attend Study Time on Thursdays from 2-3PM at the honors house and work together or independently to meet their academic goals and complete work.'),
(58, 13, '2017-11-02 14:00:00', '2017-11-02 15:00:00', 'Honors Members can attend Study Time on Thursdays from 2-3PM at the honors house and work together or independently to meet their academic goals and complete work.'),
(59, 13, '2017-11-09 14:00:00', '2017-11-09 15:00:00', 'Honors Members can attend Study Time on Thursdays from 2-3PM at the honors house and work together or independently to meet their academic goals and complete work.'),
(60, 13, '2017-11-16 14:00:00', '2017-11-16 15:00:00', 'Honors Members can attend Study Time on Thursdays from 2-3PM at the honors house and work together or independently to meet their academic goals and complete work.'),
(61, 13, '2017-11-23 14:00:00', '2017-11-23 15:00:00', 'Honors Members can attend Study Time on Thursdays from 2-3PM at the honors house and work together or independently to meet their academic goals and complete work.'),
(62, 13, '2017-11-30 14:00:00', '2017-11-30 15:00:00', 'Honors Members can attend Study Time on Thursdays from 2-3PM at the honors house and work together or independently to meet their academic goals and complete work.'),
(63, 13, '2017-12-07 14:00:00', '2017-12-07 15:00:00', 'Honors Members can attend Study Time on Thursdays from 2-3PM at the honors house and work together or independently to meet their academic goals and complete work.'),
(64, 15, '2017-09-08 16:00:00', '2017-09-08 17:00:00', 'Tell me about your summer break!'),
(65, 15, '2017-09-15 16:00:00', '2017-09-15 17:00:00', 'session not yet held'),
(66, 15, '2017-09-22 16:00:00', '2017-09-22 17:00:00', 'What are you most nervous about for this semester'),
(67, 15, '2017-09-29 16:00:00', '2017-09-29 17:00:00', 'Write a letter to a fall tree to try to convince it not to lose its leaves this year.'),
(68, 15, '2017-10-06 16:00:00', '2017-10-06 17:00:00', 'What are you most afraid of?'),
(70, 15, '2017-10-20 16:00:00', '2017-10-20 17:00:00', 'What made you join the honors program'),
(71, 15, '2017-10-27 16:00:00', '2017-10-27 17:00:00', 'What is your proudest moment?'),
(72, 15, '2017-11-03 16:00:00', '2017-11-03 17:00:00', 'Write a story from the perspective of a piece of Halloween candy.'),
(73, 15, '2017-11-10 16:00:00', '2017-11-10 17:00:00', 'Tell me what made you select your major!'),
(74, 15, '2017-11-17 16:00:00', '2017-11-17 17:00:00', 'What are you thankful for?'),
(75, 15, '2017-12-01 16:00:00', '2017-12-01 17:00:00', 'Tell me about your holiday traditions'),
(76, 15, '2017-12-08 16:00:00', '2017-12-08 17:00:00', 'session not yet held'),
(77, 4, '2017-09-11 00:00:00', '2017-09-11 01:00:00', ''),
(78, 4, '2017-09-18 00:00:00', '2017-09-18 01:00:00', ''),
(79, 4, '2017-09-25 00:00:00', '2017-09-25 01:00:00', ''),
(80, 4, '2017-10-02 00:00:00', '2017-10-02 01:00:00', ''),
(81, 4, '2017-10-16 00:00:00', '2017-10-16 01:00:00', ''),
(82, 4, '2017-10-23 00:00:00', '2017-10-23 01:00:00', ''),
(83, 4, '2017-10-30 00:00:00', '2017-10-30 01:00:00', ''),
(84, 4, '2017-11-06 00:00:00', '2017-11-06 01:00:00', ''),
(85, 4, '2017-11-13 00:00:00', '2017-11-13 01:00:00', ''),
(86, 4, '2017-10-09 00:00:00', '2017-10-09 01:00:00', ''),
(87, 4, '2017-11-13 00:00:00', '2017-11-13 01:00:00', ''),
(88, 4, '2017-11-20 00:00:00', '2017-11-20 01:00:00', ''),
(89, 4, '2017-11-27 00:00:00', '2017-11-27 01:00:00', ''),
(90, 4, '2017-12-04 00:00:00', '2017-12-04 01:00:00', ''),
(91, 6, '2017-09-12 11:00:00', '2017-09-12 12:00:00', 'This session has not occurred yet.'),
(92, 6, '2017-09-19 11:00:00', '2017-09-19 12:00:00', 'This session has not occurred yet.'),
(93, 6, '2017-09-26 11:00:00', '2017-09-26 12:00:00', 'Group ran smoothly and discussed rabies.'),
(94, 6, '2017-10-03 11:00:00', '2017-10-03 12:00:00', 'This session has not occurred yet.'),
(95, 6, '2017-10-10 11:00:00', '2017-10-10 12:00:00', 'This session has not occurred yet.'),
(96, 6, '2017-10-17 11:00:00', '2017-10-17 12:00:00', 'This session has not occurred yet.'),
(97, 6, '2017-10-24 11:00:00', '2017-10-24 12:00:00', 'This session has not occurred yet.'),
(98, 6, '2017-10-31 11:00:00', '2017-10-31 12:00:00', 'This session has not occurred yet.'),
(99, 6, '2017-11-07 11:00:00', '2017-11-07 12:00:00', 'This session has not occurred yet.'),
(100, 6, '2017-11-14 11:00:00', '2017-11-14 12:00:00', 'This session has not occurred yet.'),
(101, 6, '2017-11-21 11:00:00', '2017-11-21 12:00:00', 'This session has not occurred yet.'),
(102, 6, '2017-11-28 11:00:00', '2017-11-28 12:00:00', 'This session has not occurred yet.'),
(104, 16, '2017-09-13 13:30:00', '2017-09-13 14:30:00', 'We met in the first floor study lounge of ECSC and studied for one hour.'),
(105, 16, '2017-09-20 13:30:00', '2017-09-20 14:30:00', 'Activity members studied for upcoming assignments.'),
(106, 16, '2017-09-27 13:30:00', '2017-09-27 14:30:00', 'Studied for upcoming assignments and exams in East Campus J306'),
(107, 16, '2017-10-04 13:30:00', '2017-10-04 14:30:00', 'Studied for upcoming assignments and exams in East Campus J306.'),
(108, 16, '2017-10-11 13:30:00', '2017-10-11 14:30:00', 'Studied for upcoming assignments and exams in East Campus J306.'),
(109, 16, '2017-10-18 13:30:00', '2017-10-18 14:30:00', 'We met in J306 of ECSC and studied for one hour.'),
(110, 16, '2017-10-25 13:30:00', '2017-10-25 14:30:00', 'We met in J306 of ECSC and studied for one hour.'),
(111, 16, '2017-11-01 13:30:00', '2017-11-01 14:30:00', 'We met in J306 of ECSC and studied for one hour.'),
(112, 16, '2017-11-08 13:30:00', '2017-11-08 14:30:00', 'Met in East Campus J306 and studied for upcoming assignments'),
(113, 16, '2017-11-15 13:30:00', '2017-11-15 14:30:00', 'Studied for upcoming assignments and exams in East Campus J306.'),
(114, 16, '2017-11-22 13:30:00', '2017-11-22 14:30:00', 'This session has not occurred yet'),
(115, 16, '2017-11-29 13:30:00', '2017-11-29 14:30:00', 'We met in J306 to study. No students came during the hour.'),
(118, 3, '2017-09-11 16:00:00', '2017-09-11 17:00:00', 'We started watching the Lion King.'),
(119, 3, '2017-09-18 16:00:00', '2017-09-18 17:00:00', 'We finished the Lion King and talked about the movie, and started Peter Pan.'),
(120, 3, '2017-09-25 16:00:00', '2017-09-25 17:00:00', 'We finished Peter Pan and discussed life lessons.'),
(121, 3, '2017-10-02 16:00:00', '2017-10-02 17:00:00', 'We started watching Hercules!'),
(123, 3, '2017-10-23 16:00:00', '2017-10-23 17:00:00', 'We started Tangled!!!!!'),
(124, 3, '2017-10-30 16:00:00', '2017-10-30 17:00:00', 'we finished tangled'),
(125, 3, '2017-11-06 16:00:00', '2017-11-06 17:00:00', 'We started Pocahontas'),
(126, 3, '2017-11-13 16:00:00', '2017-11-13 17:00:00', 'we finished Pocahontas'),
(127, 3, '2017-11-20 16:00:00', '2017-11-20 17:00:00', 'We started The Emperor\'s New Groove'),
(128, 3, '2017-11-27 16:00:00', '2017-11-27 17:00:00', 'We started Brave'),
(129, 3, '2017-12-04 16:00:00', '2017-12-04 17:00:00', 'we finished The Emperor\'s New Groove'),
(130, 14, '2017-09-07 14:00:00', '2017-09-07 15:00:00', 'Waited and no one was in attendance.'),
(131, 14, '2017-09-14 14:00:00', '2017-09-14 15:00:00', ''),
(132, 14, '2017-09-21 14:00:00', '2017-09-21 15:00:00', ''),
(133, 14, '2017-09-28 14:00:00', '2017-09-28 15:00:00', ''),
(134, 14, '2017-10-05 14:00:00', '2017-10-05 15:00:00', ''),
(135, 14, '2017-10-12 14:00:00', '2017-10-12 15:00:00', ''),
(136, 14, '2017-10-19 14:00:00', '2017-10-19 15:00:00', ''),
(137, 14, '2017-10-26 14:00:00', '2017-10-26 15:00:00', ''),
(138, 14, '2017-11-02 14:00:00', '2017-11-02 15:00:00', ''),
(139, 14, '2017-11-09 14:00:00', '2017-11-09 15:00:00', ''),
(140, 14, '2017-11-16 14:00:00', '2017-11-16 15:00:00', ''),
(141, 14, '2017-11-30 14:00:00', '2017-11-30 15:00:00', ''),
(142, 8, '2017-09-12 13:00:00', '2017-09-12 14:00:00', 'Session 1'),
(143, 8, '2017-09-19 13:00:00', '2017-09-19 14:00:00', 'Session 2'),
(144, 8, '2017-09-26 13:00:00', '2017-09-26 14:00:00', 'Session 3'),
(146, 8, '2017-10-17 13:00:00', '2017-10-17 14:00:00', 'Session 5'),
(147, 8, '2017-10-24 13:00:00', '2017-10-24 14:00:00', 'Session 6'),
(148, 8, '2017-10-31 13:00:00', '2017-10-31 14:00:00', 'Session 7'),
(149, 8, '2017-11-07 13:00:00', '2017-11-07 14:00:00', 'Session 8'),
(150, 8, '2017-11-14 13:00:00', '2017-11-14 14:00:00', 'Session 9'),
(151, 8, '2017-11-21 13:00:00', '2017-11-21 14:00:00', 'Session 10'),
(152, 8, '2017-11-28 13:00:00', '2017-11-28 14:00:00', 'Session 11'),
(153, 8, '2017-12-05 13:00:00', '2017-12-05 14:00:00', 'Session 12'),
(154, 10, '2017-09-13 12:00:00', '2017-09-13 13:00:00', ''),
(155, 10, '2017-09-20 12:00:00', '2017-09-20 13:00:00', ''),
(156, 10, '2017-09-27 12:00:00', '2017-09-27 13:00:00', ''),
(157, 10, '2017-10-04 12:00:00', '2017-10-04 13:00:00', ''),
(158, 10, '2017-10-11 12:00:00', '2017-10-11 13:00:00', ''),
(159, 10, '2017-10-18 12:00:00', '2017-10-18 13:00:00', ''),
(160, 10, '2017-10-25 12:00:00', '2017-10-25 13:00:00', ''),
(161, 10, '2017-11-01 12:00:00', '2017-11-01 13:00:00', ''),
(162, 10, '2017-11-08 12:00:00', '2017-11-08 13:00:00', ''),
(163, 10, '2017-11-15 12:00:00', '2017-11-15 13:00:00', ''),
(164, 10, '2017-11-22 12:00:00', '2017-11-22 13:00:00', ''),
(165, 10, '2017-11-29 12:00:00', '2017-11-29 13:00:00', ''),
(166, 10, '2017-12-06 12:00:00', '2017-12-06 13:00:00', ''),
(167, 2, '2017-09-11 14:30:00', '2017-09-11 15:30:00', 'We had to have our meeting in the conference room on the second floor, as Dr. Gruber was holding her own meeting downstairs in my normal meeting room.  We did introductions and I told them what the activity group was all about, and then we studied the rest of the time.'),
(168, 2, '2017-09-18 14:30:00', '2017-09-18 15:30:00', 'We did a quick intro activity and then studied. Noticed some rudeness in some individuals, and some came late and others were packing up early, so may need to address that at next week\'s meeting.'),
(169, 2, '2017-09-25 14:30:00', '2017-09-25 15:30:00', 'We did a quick introductory ice breaker and then we studied.'),
(170, 2, '2017-10-02 14:30:00', '2017-10-02 15:30:00', 'We did a quick intro activity and then studied.  I reminded them to study the whole time at the end of the session, since there have been issues with packing up early.'),
(171, 2, '2017-10-16 14:30:00', '2017-10-16 15:30:00', 'We studied outside today, and I forgot to do our quick little introductory activity.'),
(172, 2, '2017-10-23 14:30:00', '2017-10-23 15:30:00', 'We did a quick introductory activity and then we studied for the rest of the time.'),
(173, 2, '2017-10-30 14:30:00', '2017-10-30 15:30:00', 'We did a quick introductory activity and then we studied for the rest of the time.'),
(174, 2, '2017-11-06 14:30:00', '2017-11-06 15:30:00', 'We did a quick introductory activity and then we studied for the rest of the time.'),
(175, 2, '2017-11-13 14:30:00', '2017-11-13 15:30:00', 'We did a quick introductory activity and then we studied for the rest of the time.'),
(176, 2, '2017-11-20 14:30:00', '2017-11-20 15:30:00', 'We did a quick introductory activity and then we studied for the rest of the time.'),
(177, 2, '2017-11-27 14:30:00', '2017-11-27 15:30:00', 'We did a fast introductory activity and then we studied for the rest of the time.'),
(178, 11, '2017-09-13 15:00:00', '2017-09-13 16:00:00', ''),
(179, 11, '2017-09-20 15:00:00', '2017-09-20 16:00:00', ''),
(180, 11, '2017-09-27 15:00:00', '2017-09-27 16:00:00', ''),
(181, 11, '2017-10-04 15:00:00', '2017-10-04 16:00:00', ''),
(182, 11, '2017-10-11 15:00:00', '2017-10-11 16:00:00', ''),
(183, 11, '2017-10-18 15:00:00', '2017-10-18 16:00:00', ''),
(184, 11, '2017-10-25 15:00:00', '2017-10-25 16:00:00', ''),
(185, 11, '2017-11-01 15:00:00', '2017-11-01 16:00:00', ''),
(186, 11, '2017-11-08 15:00:00', '2017-11-08 16:00:00', ''),
(187, 11, '2017-11-15 15:00:00', '2017-11-15 16:00:00', ''),
(188, 11, '2017-11-22 15:00:00', '2017-11-22 16:00:00', ''),
(189, 11, '2017-11-29 15:00:00', '2017-11-29 16:00:00', ''),
(190, 1, '2017-09-11 18:00:00', '2017-09-11 19:00:00', 'Clash of Classes Kickball'),
(191, 1, '2017-09-12 18:30:00', '2017-09-12 19:30:00', 'Clash of Classes Trivia'),
(192, 1, '2017-09-13 18:00:00', '2017-09-13 19:00:00', 'Clash of Classes Ultimate Frisbee'),
(194, 1, '2017-10-30 19:00:00', '2017-10-30 20:00:00', 'Halloween Party'),
(195, 1, '2017-11-07 19:00:00', '2017-11-07 20:00:00', 'Mr./Mrs. Pageant'),
(196, 1, '2017-11-15 19:00:00', '2017-11-15 20:00:00', 'Talent Show'),
(197, 1, '2017-11-20 18:30:00', '2017-11-20 19:30:00', 'Structure Construction'),
(198, 1, '2017-12-05 18:30:00', '2017-12-05 19:30:00', 'Holiday Party'),
(199, 1, '2017-09-21 18:00:00', '2017-09-21 19:00:00', 'Homecoming Parade'),
(200, 6, '2017-09-26 11:00:00', '2017-09-26 12:00:00', ''),
(201, 8, '2017-10-03 13:00:00', '2017-10-03 14:00:00', 'Session 4'),
(202, 3, '2017-10-10 16:00:00', '2017-10-10 17:00:00', 'We started watching Benchwarmers because someone rented out Hercules at the library.'),
(203, 12, '2017-09-07 13:00:00', '2017-09-07 14:00:00', ''),
(204, 12, '2017-10-05 15:30:00', '2017-10-05 16:30:00', ''),
(205, 12, '2017-10-12 15:30:00', '2017-10-12 16:30:00', ''),
(206, 12, '2017-10-19 15:30:00', '2017-10-19 16:30:00', ''),
(207, 6, '2017-11-07 11:00:00', '2017-11-07 12:00:00', ''),
(208, 12, '2017-11-09 15:30:00', '2017-11-09 16:30:00', ''),
(209, 17, '2017-11-08 00:00:00', '2017-11-08 01:00:00', ''),
(210, 12, '2017-11-16 15:30:00', '2017-11-16 16:30:00', ''),
(211, 12, '2017-11-30 15:30:00', '2017-11-30 16:30:00', ''),
(212, 6, '2017-12-05 11:00:00', '2017-12-05 12:00:00', ''),
(213, 7, '2017-12-05 12:00:00', '2017-12-05 13:00:00', ''),
(214, 1, '2017-12-04 18:30:00', '2017-12-04 19:30:00', 'Challenge the SADs'),
(215, 1, '2017-11-07 18:30:00', '2017-11-07 19:30:00', 'Mr. and Mrs. Honors Participants');

-- --------------------------------------------------------

--
-- Table structure for table `FA17_activitygroupstats`
--

CREATE TABLE `FA17_activitygroupstats` (
  `agstat_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL,
  `agses_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FA17_activitygroupstats`
--

INSERT INTO `FA17_activitygroupstats` (`agstat_id`, `pstu_id`, `agses_id`) VALUES
(1080, 5, 198),
(71, 6, 190),
(717, 6, 194),
(662, 6, 195),
(1073, 6, 198),
(18, 8, 142),
(167, 8, 143),
(234, 8, 144),
(394, 8, 146),
(479, 8, 147),
(520, 8, 148),
(656, 8, 149),
(862, 8, 150),
(893, 8, 151),
(1087, 8, 153),
(290, 8, 201),
(68, 9, 190),
(149, 9, 192),
(604, 9, 194),
(667, 9, 195),
(1071, 9, 198),
(69, 10, 190),
(148, 10, 192),
(616, 10, 194),
(670, 10, 195),
(1074, 10, 198),
(203, 10, 199),
(1157, 10, 214),
(268, 12, 93),
(297, 12, 94),
(461, 12, 96),
(648, 12, 98),
(164, 12, 118),
(132, 12, 119),
(220, 12, 120),
(277, 12, 121),
(433, 12, 123),
(518, 12, 124),
(578, 12, 125),
(797, 12, 126),
(891, 12, 127),
(922, 12, 128),
(987, 12, 129),
(603, 12, 194),
(343, 12, 202),
(412, 12, 205),
(411, 12, 206),
(777, 12, 207),
(771, 12, 208),
(859, 12, 210),
(605, 13, 194),
(669, 13, 195),
(1078, 13, 198),
(640, 17, 194),
(675, 17, 195),
(758, 18, 19),
(841, 18, 20),
(681, 18, 195),
(1044, 18, 198),
(630, 21, 194),
(687, 21, 195),
(1067, 21, 198),
(27, 22, 3),
(123, 22, 4),
(360, 22, 11),
(522, 22, 16),
(628, 22, 194),
(1083, 22, 198),
(727, 23, 194),
(690, 23, 195),
(1042, 23, 198),
(42, 24, 178),
(208, 24, 179),
(241, 24, 180),
(310, 24, 181),
(363, 24, 182),
(390, 24, 183),
(488, 24, 184),
(531, 24, 185),
(750, 24, 186),
(835, 24, 187),
(959, 24, 189),
(712, 24, 194),
(691, 24, 195),
(1082, 24, 198),
(26, 25, 3),
(124, 25, 4),
(186, 25, 6),
(302, 25, 10),
(359, 25, 11),
(405, 25, 13),
(524, 25, 16),
(550, 25, 17),
(848, 25, 21),
(942, 25, 22),
(1001, 25, 25),
(627, 25, 194),
(692, 25, 195),
(1056, 25, 198),
(873, 26, 74),
(983, 26, 75),
(1021, 26, 196),
(1158, 26, 214),
(130, 27, 65),
(336, 27, 68),
(429, 27, 70),
(505, 27, 71),
(735, 27, 72),
(790, 27, 73),
(872, 27, 74),
(970, 27, 75),
(1142, 27, 76),
(119, 28, 77),
(254, 28, 79),
(312, 28, 80),
(443, 28, 81),
(540, 28, 83),
(772, 28, 84),
(17, 28, 118),
(135, 28, 119),
(221, 28, 120),
(279, 28, 121),
(517, 28, 124),
(583, 28, 125),
(163, 28, 168),
(278, 29, 121),
(579, 29, 125),
(889, 29, 127),
(986, 29, 129),
(631, 30, 194),
(725, 31, 194),
(694, 31, 195),
(1070, 31, 198),
(1160, 31, 214),
(25, 32, 3),
(155, 32, 5),
(185, 32, 6),
(226, 32, 7),
(286, 32, 9),
(303, 32, 10),
(358, 32, 11),
(383, 32, 12),
(404, 32, 13),
(454, 32, 14),
(523, 32, 16),
(549, 32, 17),
(644, 32, 18),
(840, 32, 20),
(847, 32, 21),
(943, 32, 22),
(934, 32, 23),
(1000, 32, 25),
(1089, 32, 26),
(726, 32, 194),
(695, 32, 195),
(1057, 32, 198),
(5, 34, 2),
(697, 34, 195),
(792, 35, 73),
(698, 35, 195),
(127, 36, 65),
(210, 36, 66),
(331, 36, 68),
(421, 36, 70),
(513, 36, 71),
(779, 36, 73),
(863, 36, 74),
(964, 36, 75),
(1135, 36, 76),
(78, 36, 191),
(622, 37, 194),
(720, 39, 194),
(701, 39, 195),
(1066, 39, 198),
(621, 40, 194),
(19, 42, 142),
(166, 42, 143),
(235, 42, 144),
(395, 42, 146),
(478, 42, 147),
(519, 42, 148),
(655, 42, 149),
(861, 42, 150),
(892, 42, 151),
(1086, 42, 153),
(83, 42, 191),
(597, 42, 194),
(291, 42, 201),
(632, 44, 194),
(702, 44, 195),
(11, 45, 50),
(47, 45, 51),
(187, 45, 52),
(247, 45, 53),
(315, 45, 54),
(368, 45, 55),
(334, 45, 68),
(256, 45, 169),
(379, 45, 171),
(471, 45, 172),
(43, 46, 178),
(207, 46, 179),
(242, 46, 180),
(309, 46, 181),
(364, 46, 182),
(391, 46, 183),
(489, 46, 184),
(530, 46, 185),
(749, 46, 186),
(834, 46, 187),
(958, 46, 189),
(713, 46, 194),
(704, 46, 195),
(1075, 46, 198),
(436, 49, 123),
(8, 50, 2),
(551, 50, 17),
(646, 50, 18),
(757, 50, 19),
(839, 50, 20),
(1090, 50, 26),
(721, 50, 194),
(707, 50, 195),
(1072, 50, 198),
(723, 53, 194),
(660, 53, 195),
(1020, 53, 196),
(1081, 53, 198),
(198, 53, 199),
(118, 54, 77),
(446, 54, 78),
(449, 54, 79),
(444, 54, 80),
(440, 54, 81),
(438, 54, 82),
(539, 54, 83),
(824, 54, 87),
(923, 54, 89),
(719, 54, 194),
(661, 54, 195),
(1108, 55, 102),
(74, 55, 191),
(1101, 55, 212),
(23, 56, 3),
(122, 56, 4),
(151, 56, 5),
(182, 56, 6),
(225, 56, 7),
(243, 56, 8),
(281, 56, 9),
(357, 56, 11),
(382, 56, 12),
(401, 56, 13),
(450, 56, 14),
(490, 56, 15),
(521, 56, 16),
(548, 56, 17),
(642, 56, 18),
(752, 56, 19),
(836, 56, 20),
(845, 56, 21),
(939, 56, 22),
(929, 56, 23),
(997, 56, 25),
(1088, 56, 26),
(84, 56, 191),
(1098, 57, 63),
(974, 57, 75),
(1141, 57, 76),
(269, 57, 93),
(296, 57, 94),
(462, 57, 96),
(455, 57, 97),
(649, 57, 98),
(1104, 57, 102),
(773, 57, 207),
(1099, 57, 212),
(737, 58, 72),
(1140, 58, 76),
(463, 58, 96),
(458, 58, 97),
(652, 58, 98),
(1107, 58, 102),
(56, 58, 190),
(81, 58, 191),
(144, 58, 192),
(1036, 58, 198),
(776, 58, 207),
(1103, 58, 212),
(28, 60, 3),
(184, 60, 6),
(362, 60, 11),
(384, 60, 12),
(403, 60, 13),
(453, 60, 14),
(842, 60, 20),
(944, 60, 22),
(935, 60, 23),
(201, 60, 199),
(738, 62, 72),
(795, 62, 73),
(881, 62, 74),
(980, 62, 75),
(1143, 62, 76),
(555, 62, 173),
(801, 62, 174),
(814, 62, 175),
(905, 62, 177),
(716, 62, 194),
(1065, 62, 198),
(355, 63, 31),
(316, 63, 54),
(366, 63, 55),
(420, 63, 56),
(493, 63, 57),
(544, 63, 58),
(759, 63, 59),
(851, 63, 60),
(960, 63, 62),
(1097, 63, 63),
(40, 64, 104),
(178, 64, 105),
(238, 64, 106),
(293, 64, 107),
(345, 64, 108),
(386, 64, 109),
(482, 64, 110),
(527, 64, 111),
(742, 64, 112),
(826, 64, 113),
(945, 64, 115),
(129, 65, 65),
(212, 65, 66),
(480, 65, 67),
(337, 65, 68),
(424, 65, 70),
(503, 65, 71),
(731, 65, 72),
(784, 65, 73),
(874, 65, 74),
(966, 65, 75),
(4, 66, 2),
(1137, 66, 76),
(988, 66, 129),
(33, 66, 167),
(260, 66, 169),
(325, 66, 170),
(376, 66, 171),
(561, 66, 173),
(1015, 66, 196),
(1048, 66, 198),
(1016, 68, 196),
(497, 69, 57),
(546, 69, 58),
(857, 69, 60),
(131, 69, 65),
(338, 69, 68),
(514, 69, 71),
(736, 69, 72),
(883, 69, 74),
(972, 69, 75),
(686, 69, 195),
(1, 72, 2),
(647, 76, 18),
(968, 76, 75),
(372, 76, 171),
(556, 76, 173),
(802, 76, 174),
(822, 76, 175),
(900, 76, 176),
(914, 76, 177),
(85, 76, 191),
(145, 79, 192),
(125, 80, 65),
(211, 80, 66),
(266, 80, 67),
(330, 80, 68),
(423, 80, 70),
(501, 80, 71),
(729, 80, 72),
(783, 80, 73),
(1138, 80, 76),
(584, 80, 194),
(699, 84, 195),
(9, 85, 50),
(44, 85, 51),
(217, 85, 52),
(246, 85, 53),
(314, 85, 54),
(365, 85, 55),
(413, 85, 56),
(499, 85, 57),
(541, 85, 58),
(768, 85, 59),
(858, 85, 60),
(961, 85, 62),
(14, 86, 50),
(52, 86, 51),
(191, 86, 52),
(249, 86, 53),
(318, 86, 54),
(495, 86, 57),
(542, 86, 58),
(760, 86, 59),
(80, 86, 191),
(617, 86, 194),
(15, 88, 50),
(51, 88, 51),
(190, 88, 52),
(248, 88, 53),
(317, 88, 54),
(496, 88, 57),
(543, 88, 58),
(761, 88, 59),
(79, 88, 191),
(599, 88, 194),
(846, 89, 21),
(875, 89, 74),
(977, 89, 75),
(887, 89, 127),
(956, 89, 189),
(585, 89, 194),
(1018, 89, 196),
(1045, 89, 198),
(197, 89, 199),
(860, 89, 210),
(991, 89, 211),
(600, 90, 194),
(265, 91, 67),
(426, 91, 70),
(732, 91, 72),
(786, 91, 73),
(870, 91, 74),
(973, 91, 75),
(236, 91, 106),
(294, 91, 107),
(346, 91, 108),
(741, 91, 112),
(218, 95, 154),
(219, 95, 155),
(273, 95, 156),
(313, 95, 157),
(351, 95, 158),
(535, 95, 159),
(534, 95, 160),
(533, 95, 161),
(948, 95, 162),
(950, 95, 163),
(952, 95, 165),
(1149, 95, 166),
(428, 96, 70),
(442, 96, 81),
(439, 96, 82),
(926, 96, 89),
(1094, 96, 90),
(432, 96, 123),
(800, 96, 126),
(920, 96, 128),
(985, 96, 129),
(1014, 96, 196),
(21, 97, 39),
(168, 97, 40),
(230, 97, 41),
(304, 97, 42),
(399, 97, 44),
(574, 97, 45),
(573, 97, 46),
(1113, 97, 47),
(1121, 97, 48),
(1128, 97, 49),
(1134, 97, 213),
(270, 98, 93),
(299, 98, 94),
(460, 98, 96),
(457, 98, 97),
(651, 98, 98),
(1105, 98, 102),
(222, 98, 120),
(70, 98, 190),
(76, 98, 191),
(705, 98, 195),
(1076, 98, 198),
(775, 98, 207),
(1100, 98, 212),
(609, 100, 194),
(39, 101, 104),
(177, 101, 105),
(237, 101, 106),
(292, 101, 107),
(344, 101, 108),
(387, 101, 109),
(481, 101, 110),
(528, 101, 111),
(743, 101, 112),
(827, 101, 113),
(946, 101, 115),
(606, 102, 194),
(708, 102, 195),
(271, 103, 93),
(298, 103, 94),
(464, 103, 96),
(456, 103, 97),
(650, 103, 98),
(1106, 103, 102),
(57, 103, 190),
(75, 103, 191),
(142, 103, 192),
(709, 103, 195),
(1052, 103, 198),
(774, 103, 207),
(1102, 103, 212),
(1068, 105, 198),
(239, 106, 29),
(300, 106, 30),
(354, 106, 31),
(393, 106, 32),
(487, 106, 33),
(537, 106, 34),
(832, 106, 36),
(947, 106, 37),
(607, 106, 194),
(1035, 106, 198),
(965, 109, 75),
(916, 109, 128),
(912, 109, 177),
(339, 110, 68),
(871, 110, 74),
(962, 110, 75),
(925, 110, 89),
(37, 110, 167),
(377, 110, 171),
(957, 110, 189),
(590, 110, 194),
(1017, 110, 196),
(1046, 110, 198),
(38, 113, 167),
(156, 113, 168),
(263, 113, 169),
(329, 113, 170),
(566, 113, 171),
(565, 113, 172),
(564, 113, 173),
(812, 113, 174),
(823, 113, 175),
(903, 113, 176),
(904, 113, 177),
(715, 117, 194),
(658, 117, 195),
(1084, 117, 198),
(128, 119, 65),
(213, 119, 66),
(264, 119, 67),
(333, 119, 68),
(425, 119, 70),
(504, 119, 71),
(730, 119, 72),
(781, 119, 73),
(866, 119, 74),
(967, 119, 75),
(867, 123, 74),
(969, 123, 75),
(510, 127, 71),
(864, 127, 74),
(982, 127, 75),
(1147, 127, 76),
(820, 127, 175),
(906, 127, 177),
(1019, 127, 196),
(1053, 127, 198),
(1002, 132, 25),
(509, 132, 71),
(791, 132, 73),
(868, 132, 74),
(1139, 132, 76),
(272, 133, 156),
(352, 133, 158),
(949, 133, 162),
(951, 133, 163),
(953, 133, 165),
(1150, 133, 166),
(22, 137, 3),
(121, 137, 4),
(183, 137, 6),
(245, 137, 8),
(280, 137, 9),
(361, 137, 11),
(381, 137, 12),
(402, 137, 13),
(452, 137, 14),
(491, 137, 15),
(751, 137, 19),
(838, 137, 20),
(843, 137, 21),
(940, 137, 22),
(931, 137, 23),
(998, 137, 25),
(86, 137, 191),
(385, 140, 12),
(126, 140, 65),
(214, 140, 66),
(267, 140, 67),
(332, 140, 68),
(430, 140, 70),
(502, 140, 71),
(733, 140, 72),
(782, 140, 73),
(865, 140, 74),
(7, 146, 2),
(722, 146, 194),
(240, 147, 29),
(301, 147, 30),
(353, 147, 31),
(392, 147, 32),
(486, 147, 33),
(536, 147, 34),
(833, 147, 36),
(1093, 147, 38),
(55, 147, 190),
(82, 147, 191),
(141, 147, 192),
(116, 149, 77),
(447, 149, 78),
(448, 149, 79),
(445, 149, 80),
(441, 149, 81),
(437, 149, 82),
(538, 149, 83),
(825, 149, 87),
(924, 149, 89),
(73, 149, 190),
(718, 149, 194),
(1069, 149, 198),
(2, 159, 2),
(714, 159, 194),
(711, 159, 195),
(1079, 159, 198),
(24, 160, 3),
(120, 160, 4),
(150, 160, 5),
(181, 160, 6),
(244, 160, 8),
(282, 160, 9),
(356, 160, 11),
(380, 160, 12),
(400, 160, 13),
(451, 160, 14),
(492, 160, 15),
(754, 160, 19),
(837, 160, 20),
(844, 160, 21),
(938, 160, 22),
(930, 160, 23),
(999, 160, 25),
(115, 217, 77),
(209, 217, 78),
(253, 217, 79),
(311, 217, 80),
(1096, 217, 90),
(165, 217, 143),
(72, 217, 190),
(1095, 217, 210),
(995, 217, 211),
(1151, 217, 214),
(789, 222, 73),
(32, 222, 167),
(255, 222, 169),
(321, 222, 170),
(378, 222, 171),
(476, 222, 172),
(563, 222, 173),
(817, 222, 175),
(896, 222, 176),
(58, 222, 190),
(418, 226, 56),
(763, 226, 59),
(409, 226, 206),
(770, 226, 208),
(996, 226, 210),
(990, 226, 211),
(172, 227, 40),
(305, 227, 42),
(575, 227, 45),
(1115, 227, 47),
(1116, 227, 48),
(1122, 227, 49),
(629, 227, 194),
(657, 227, 195),
(1039, 227, 198),
(196, 227, 199),
(1130, 227, 213),
(216, 228, 66),
(335, 228, 68),
(511, 228, 71),
(728, 228, 72),
(794, 228, 73),
(882, 228, 74),
(472, 228, 172),
(560, 228, 173),
(641, 228, 194),
(659, 228, 195),
(1050, 228, 198),
(288, 229, 9),
(407, 229, 13),
(554, 229, 17),
(756, 229, 19),
(850, 229, 21),
(936, 229, 23),
(1004, 229, 25),
(1092, 229, 26),
(41, 229, 104),
(179, 229, 105),
(295, 229, 107),
(347, 229, 108),
(389, 229, 109),
(483, 229, 110),
(828, 229, 113),
(602, 229, 194),
(663, 229, 195),
(1012, 229, 196),
(1061, 229, 198),
(762, 230, 59),
(740, 230, 72),
(793, 230, 73),
(884, 230, 74),
(978, 230, 75),
(886, 230, 127),
(954, 230, 165),
(899, 230, 176),
(77, 230, 191),
(1028, 230, 198),
(176, 231, 40),
(34, 231, 167),
(474, 231, 172),
(532, 231, 185),
(748, 231, 186),
(64, 231, 190),
(136, 231, 192),
(612, 231, 194),
(664, 231, 195),
(1077, 231, 198),
(195, 231, 199),
(1171, 231, 215),
(1049, 232, 198),
(764, 233, 59),
(927, 233, 89),
(580, 233, 125),
(798, 233, 126),
(888, 233, 127),
(917, 233, 128),
(806, 233, 174),
(815, 233, 175),
(895, 233, 176),
(910, 233, 177),
(594, 233, 194),
(665, 233, 195),
(994, 233, 211),
(175, 234, 40),
(50, 234, 51),
(189, 234, 52),
(251, 234, 53),
(414, 234, 56),
(498, 234, 57),
(422, 234, 70),
(63, 234, 190),
(137, 234, 192),
(608, 234, 194),
(666, 234, 195),
(1063, 234, 198),
(193, 234, 199),
(1172, 234, 215),
(767, 235, 59),
(852, 235, 60),
(877, 235, 74),
(810, 235, 174),
(897, 235, 176),
(911, 235, 177),
(613, 235, 194),
(668, 235, 195),
(1005, 235, 196),
(1024, 235, 198),
(1159, 235, 214),
(1030, 236, 198),
(626, 237, 194),
(671, 237, 195),
(1032, 237, 198),
(215, 239, 66),
(427, 239, 70),
(506, 239, 71),
(734, 239, 72),
(788, 239, 73),
(876, 239, 74),
(976, 239, 75),
(1136, 239, 76),
(614, 239, 194),
(672, 239, 195),
(1051, 239, 198),
(224, 240, 120),
(275, 240, 121),
(434, 240, 123),
(515, 240, 124),
(581, 240, 125),
(796, 240, 126),
(918, 240, 128),
(633, 240, 194),
(674, 240, 195),
(1038, 240, 198),
(341, 240, 202),
(180, 241, 105),
(485, 241, 110),
(525, 241, 111),
(744, 241, 112),
(373, 241, 171),
(473, 241, 172),
(558, 241, 173),
(66, 241, 190),
(147, 241, 192),
(615, 241, 194),
(169, 242, 40),
(231, 242, 41),
(307, 242, 42),
(398, 242, 44),
(568, 242, 45),
(572, 242, 46),
(1111, 242, 47),
(1119, 242, 48),
(1125, 242, 49),
(638, 242, 194),
(676, 242, 195),
(1058, 242, 198),
(1132, 242, 213),
(174, 243, 40),
(49, 243, 51),
(192, 243, 52),
(252, 243, 53),
(319, 243, 54),
(369, 243, 55),
(415, 243, 56),
(500, 243, 57),
(59, 243, 190),
(146, 243, 192),
(625, 243, 194),
(677, 243, 195),
(1007, 243, 196),
(1031, 243, 198),
(194, 243, 199),
(1161, 243, 214),
(941, 244, 22),
(928, 244, 89),
(919, 244, 128),
(894, 244, 176),
(915, 244, 177),
(53, 244, 190),
(140, 244, 192),
(592, 244, 194),
(678, 244, 195),
(1064, 244, 198),
(993, 244, 211),
(65, 245, 190),
(620, 245, 194),
(679, 245, 195),
(1170, 245, 215),
(48, 246, 51),
(417, 246, 56),
(766, 246, 59),
(853, 246, 60),
(680, 246, 195),
(1043, 246, 198),
(408, 246, 206),
(769, 246, 208),
(989, 246, 211),
(595, 247, 194),
(1164, 247, 195),
(1013, 247, 196),
(1029, 247, 198),
(1153, 247, 214),
(1168, 247, 215),
(171, 248, 40),
(232, 248, 41),
(306, 248, 42),
(397, 248, 44),
(569, 248, 45),
(570, 248, 46),
(1110, 248, 47),
(1120, 248, 48),
(1123, 248, 49),
(188, 248, 52),
(250, 248, 53),
(419, 248, 56),
(61, 248, 190),
(138, 248, 192),
(611, 248, 194),
(682, 248, 195),
(1037, 248, 198),
(1131, 248, 213),
(591, 249, 194),
(683, 249, 195),
(1054, 249, 198),
(512, 250, 71),
(739, 250, 72),
(879, 250, 74),
(979, 250, 75),
(1145, 250, 76),
(639, 250, 194),
(1163, 250, 195),
(1006, 250, 196),
(1025, 250, 198),
(1173, 250, 199),
(1169, 250, 215),
(20, 251, 39),
(170, 251, 40),
(576, 251, 45),
(416, 251, 56),
(765, 251, 59),
(854, 251, 60),
(637, 251, 194),
(684, 251, 195),
(1055, 251, 198),
(992, 251, 211),
(1114, 252, 47),
(1118, 252, 48),
(1127, 252, 49),
(62, 252, 190),
(610, 252, 194),
(685, 252, 195),
(1008, 252, 196),
(1041, 252, 198),
(1133, 252, 213),
(1152, 252, 214),
(1166, 252, 215),
(161, 253, 168),
(623, 253, 194),
(688, 253, 195),
(1010, 253, 196),
(1026, 253, 198),
(1155, 253, 214),
(3, 254, 2),
(856, 254, 60),
(885, 254, 74),
(955, 254, 165),
(1148, 254, 166),
(898, 254, 176),
(54, 254, 190),
(635, 254, 194),
(689, 254, 195),
(1047, 254, 198),
(173, 255, 40),
(233, 255, 41),
(308, 255, 42),
(396, 255, 44),
(567, 255, 45),
(571, 255, 46),
(1112, 255, 47),
(1117, 255, 48),
(1126, 255, 49),
(10, 255, 50),
(320, 255, 54),
(370, 255, 55),
(60, 255, 190),
(143, 255, 192),
(624, 255, 194),
(693, 255, 195),
(1009, 255, 196),
(1040, 255, 198),
(202, 255, 199),
(1129, 255, 213),
(1156, 255, 214),
(1165, 256, 195),
(1027, 256, 198),
(410, 256, 206),
(1154, 256, 214),
(1167, 256, 215),
(29, 257, 3),
(152, 257, 5),
(287, 257, 9),
(160, 257, 168),
(259, 257, 169),
(326, 257, 170),
(811, 257, 174),
(696, 257, 195),
(1060, 257, 198),
(16, 258, 118),
(133, 258, 119),
(289, 258, 133),
(371, 258, 171),
(559, 258, 173),
(805, 258, 174),
(821, 258, 175),
(67, 258, 190),
(139, 258, 192),
(593, 258, 194),
(831, 258, 209),
(134, 259, 119),
(223, 259, 120),
(276, 259, 121),
(435, 259, 123),
(516, 259, 124),
(582, 259, 125),
(799, 259, 126),
(890, 259, 127),
(921, 259, 128),
(636, 259, 194),
(700, 259, 195),
(1059, 259, 198),
(342, 259, 202),
(367, 260, 55),
(494, 260, 57),
(545, 260, 58),
(322, 260, 170),
(475, 260, 172),
(562, 260, 173),
(807, 260, 174),
(819, 260, 175),
(634, 260, 194),
(1023, 260, 198),
(596, 261, 194),
(703, 261, 195),
(508, 262, 71),
(780, 262, 73),
(984, 262, 74),
(963, 262, 75),
(1144, 262, 76),
(830, 262, 113),
(477, 262, 172),
(809, 262, 174),
(818, 262, 175),
(907, 262, 177),
(747, 262, 186),
(31, 263, 3),
(153, 263, 5),
(227, 263, 7),
(284, 263, 9),
(12, 263, 50),
(45, 263, 51),
(159, 263, 168),
(261, 263, 169),
(327, 263, 170),
(619, 263, 194),
(706, 263, 195),
(1034, 263, 198),
(199, 263, 199),
(30, 264, 3),
(154, 264, 5),
(228, 264, 7),
(283, 264, 9),
(552, 264, 17),
(643, 264, 18),
(13, 264, 50),
(46, 264, 51),
(162, 264, 168),
(262, 264, 169),
(328, 264, 170),
(618, 264, 194),
(1033, 264, 198),
(200, 264, 199),
(229, 265, 7),
(285, 265, 9),
(406, 265, 13),
(553, 265, 17),
(755, 265, 19),
(849, 265, 21),
(937, 265, 23),
(1003, 265, 25),
(1091, 265, 26),
(601, 265, 194),
(710, 265, 195),
(1011, 265, 196),
(1062, 265, 198),
(340, 267, 68),
(507, 267, 71),
(785, 267, 73),
(880, 267, 74),
(975, 267, 75),
(1146, 267, 76),
(349, 267, 108),
(526, 267, 111),
(746, 267, 112),
(829, 267, 113),
(36, 269, 167),
(157, 269, 168),
(258, 269, 169),
(323, 269, 170),
(374, 269, 171),
(470, 269, 172),
(557, 269, 173),
(804, 269, 174),
(816, 269, 175),
(902, 269, 176),
(909, 269, 177),
(981, 270, 75),
(35, 270, 167),
(158, 270, 168),
(257, 270, 169),
(324, 270, 170),
(375, 270, 171),
(469, 270, 172),
(813, 270, 175),
(901, 270, 176),
(908, 270, 177),
(787, 273, 73),
(878, 273, 74),
(971, 273, 75),
(348, 273, 108),
(388, 273, 109),
(484, 273, 110),
(529, 273, 111),
(745, 273, 112),
(274, 273, 191),
(673, 273, 195);

-- --------------------------------------------------------

--
-- Table structure for table `FA17_com_serv`
--

CREATE TABLE `FA17_com_serv` (
  `com_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL,
  `com_title` varchar(50) NOT NULL,
  `com_advisor` varchar(60) NOT NULL,
  `com_advisor_contact` varchar(60) NOT NULL,
  `com_description` varchar(500) NOT NULL,
  `com_date` datetime NOT NULL,
  `com_hours` decimal(5,1) NOT NULL,
  `com_verified` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FA17_com_serv`
--

INSERT INTO `FA17_com_serv` (`com_id`, `pstu_id`, `com_title`, `com_advisor`, `com_advisor_contact`, `com_description`, `com_date`, `com_hours`, `com_verified`) VALUES
(1, 50, 'Jazz Ensemble Valet Parking', 'Kathy Brown', '7068970596', 'The Lock Haven women\'s soccer team assisted in parking for the Jazz Ensemble at the Durrwachter Alumni Conference Center.', '2017-08-18 20:00:00', '2.0', 2),
(2, 50, 'Movers & Shakers', 'Kathy Brown', '7068970596', 'The Lock Haven Women\'s soccer team assisted in move-in for the second floor at Fairview Suites.', '2017-08-23 09:00:00', '1.0', 2),
(3, 50, 'Convocation', 'Lynn Maggs', 'lmm177@lockhaven.edu', 'Held the banner for faculty that were speaking during the event.', '2017-08-27 00:00:00', '1.0', 2),
(4, 44, 'Move and Shake', 'Allison Reed', 'amr794@lockhaven.edu', 'Helped incoming Honors freshmen move into fairview.', '2017-08-22 11:30:00', '3.0', 2),
(5, 34, 'moving and shaking', 'Allison Reed', 'honors@lockhaven.edu', 'spent the day moving in honors freshman', '2017-08-22 12:00:00', '2.0', 2),
(6, 28, 'Movers and shakers', 'Ashley Spencer', 'aspencer@lockhaven.edu', 'New student move in', '2017-08-23 08:00:00', '8.0', 2),
(7, 28, 'Movers/shakers', 'Ashley Spencer', 'aspencer@lockhaven.edu', 'New Student Move in', '2017-08-24 07:30:00', '6.0', 2),
(8, 59, 'Mover and Shakers', 'Honors Program', 'honors@lockhaven.edu', 'I helped the freshman honors students move into the dorms and assisted them by answering any questions they had.', '2017-08-22 11:30:00', '2.0', 2),
(9, 31, 'Movers and Shakers', 'Rachael Metzinger', 'rxm2509@lockhaven.edu', 'Moving students into fairview', '2017-08-21 12:30:00', '2.0', 2),
(10, 31, 'Movers and Shakers', 'Rachael Metzinger', 'rxm2509@lockhaven.edu', 'Moving students into Fairview', '2017-08-23 12:30:00', '2.0', 2),
(11, 31, 'Movers and Shakers', 'Micheal Heck', 'Resident Director at Fairview Suites', 'Moving Students into Fairview', '2017-08-24 11:30:00', '3.0', 2),
(12, 31, 'Movers and Shakers', 'Micheal Heck', 'Resident Director at Fairview Suites', 'Moving Students into Fairview', '2017-08-24 11:30:00', '3.0', 2),
(13, 31, 'Movers and Shakers', 'Micheal Heck', 'Resident Director at Fairview Suites', 'Moving Students into Fairview', '2017-08-24 11:30:00', '3.0', 2),
(14, 47, 'BINGO', 'Kathy Brown (Coach)', '7068970596', 'Worked the bingo event with Volleyball team', '2017-09-04 02:00:00', '1.0', 2),
(15, 47, 'Valet Parking', 'Kathy Brown (Coach)', '7068970596', 'Valet parked for the guests attending the Jazz Concert', '2017-08-18 18:00:00', '2.0', 2),
(16, 50, 'LHU Bingo', 'Kathy Brown', '7068970596', 'The women\'s soccer team and volleyball team hosted a Bingo at Sloan Auditorium. Players helped run event by setting up, calling numbers and handing out prizes.', '2017-09-04 14:00:00', '1.0', 2),
(17, 47, 'LHU student move in', 'kathy Brown (Coach)', '7068970596', 'helped move new students into their dorms', '2017-08-24 10:00:00', '2.0', 2),
(18, 22, 'Honors Movers and Shakers 2017', 'Rachael Metzinger', 'rxm2509@lockhaven.edu', 'Helped students move and shake in both Woolridge and Smith Halls.', '2017-08-22 00:00:00', '2.0', 2),
(19, 110, 'International Orientation Week', 'John Gradel', 'jrg5874@lockhaven.edu', 'I volunteered from August 24th until August 27th to accompany international students to various information sessions and events. Our goal was to give them valuable knowledge that they will need for their time here, as well as get them acclimated to campus and show them what Lock Haven University has to offer.', '2017-08-24 12:00:00', '20.0', 2),
(20, 217, 'Honors movers and shakers', 'Allison', 'Honors@lockhaven.edu', 'Help incoming freshmen move in', '2017-08-22 11:30:00', '2.0', 2),
(21, 231, 'Red cross Blood drive', 'Lauren A. Wright', 'law3363@lockhaven.edu', 'I will be volunteering as staff at the blood drive', '2017-09-12 16:00:00', '3.0', 2),
(22, 231, 'Academic Majors Fair', 'Kelly Hibbler', 'KHibbler@lockhaven.edu / 570-502-2374', 'Helping do the raffle at the Academic Majors fair', '2017-09-07 17:30:00', '2.0', 2),
(23, 103, 'Cleanscapes River Clean Up', 'Sara Galbraith', 'sng565@lockhaven.edu', 'We went into the Susquehanna River and removed garbage and tires.', '2017-09-09 09:00:00', '4.0', 2),
(24, 34, 'River Clean-up', 'Sara Galbraith', 'sng565@lockhaven.edu', 'I spent the morning wading through susquehanna river with the Clinton County Cleanscapes association clearing debris out of the river.', '2017-09-09 09:00:00', '3.0', 2),
(25, 84, 'River Cleanup', 'Sara Galbraith', 'sng565@lockhaven.edu', 'Helped pull tires and trash out of the Susquehanna', '2017-09-09 09:00:00', '4.0', 2),
(26, 22, 'Clinton County Clean Scapes River Clean Up', 'Sara Galbraith', 'sng565@lockhaven.edu', 'Our group waded through the water pulling out tires and pieces of trash stuck on the the bottom of the river.', '2017-09-09 00:00:00', '3.0', 2),
(27, 10, 'Convocation', 'Rachael Metzinger', '570-985-4764', 'I assisted with Convocation', '2017-08-27 12:00:00', '1.0', 2),
(28, 12, 'Academic Majors Fair', 'Kelly Hibbler', 'KHibbler@lockhaven.edu', 'I scanned people in, and gave newcomers direction around the fair.', '2017-09-07 17:30:00', '2.0', 2),
(29, 107, 'Susquehanna River Cleanup', 'Sara Galbraith', 'sng565@lockhaven.edu', 'Assisted Clinton County Cleanscapes in pulling tires  and junk out of part of the Susquehanna River to  improve the local environment and the community.', '2017-09-09 09:00:00', '5.0', 2),
(30, 159, '9/11 Moving Tribute', 'Jonathan Britton', 'jmb946@lockhaven.edu', 'Keeping the American Flag in constant motion to honor and remember those involved on 9/11.', '2017-09-11 06:00:00', '1.0', 2),
(31, 91, 'FROSH tutor', 'Amy Downes', '570-932-0850', 'tutor for the FROSH program in Fairview Suites', '2017-09-06 21:00:00', '1.0', 2),
(32, 69, 'CleanScape Cleanup', 'Sara Galbraith', 'sng565@lockhaven.edu', 'Cleaned up trash/removed tires from the Susquehanna River.', '2017-09-09 09:00:00', '4.0', 2),
(33, 48, 'Movers and Shakers', 'Aaron Russell', 'arussell@lockhaven.edu', 'Helped freshman move into Smith, Woolridge, and Fairview residence halls', '2017-08-31 12:00:00', '4.0', 2),
(34, 48, 'Whelan Event Services', 'Aaron Russell', 'arussell@lockhaven.edu', 'Working PSU games as member of on-field security staff or gate-entrance security staff', '2017-09-09 11:00:00', '0.0', 3),
(35, 48, 'Whelan Event Services', 'aaron russell', 'arussell@lockhaven.edu', 'worked as member of on-field security and gate-entrance security', '2017-09-09 11:00:00', '7.0', 2),
(36, 24, 'River Clean Up', 'Sara Galbraith', 'sng565@lockhaven.edu', 'I helped pull tires out of the river for Clinton County Cleanscapes.', '2017-09-09 09:00:00', '5.0', 2),
(37, 234, 'River Clean Up', 'Sara Galbraith', 'sng565@lockhaven.edu', 'Cleaning up the Susquehanna.', '2017-09-09 00:00:00', '4.0', 2),
(38, 258, 'Blood Drive Donation', 'Marge Smith', '18662363276', 'I donated a bag of blood for the Red Cross Blood Drive on 9/12/17', '2017-09-12 12:00:00', '1.0', 2),
(39, 24, 'Red Cross Blood Drive', 'Lauren Wright', 'law3363@lockhaven.edu', 'I helped out at the canteen table giving people food and water.', '2017-09-12 03:15:00', '4.0', 2),
(40, 46, 'Red Cross Blood Drive', 'Lauren Wright', 'law3363@lockhaven.edu', 'I worked the service table and watched after donors after they finished donating.', '2017-09-12 13:00:00', '6.0', 2),
(41, 269, 'Blood Drive', 'Lauren Wright', 'law3363@lockhaven.edu', 'I helped set up the refreshment table and then stayed to work it.', '2017-09-12 11:30:00', '2.0', 2),
(42, 48, 'Whelan Event Services', 'Aaron Russell', 'arussell@lockhaven.edu', 'Member of the on-field and hate-entry security staff at Penn State University\'s Beaver Stadium', '2017-09-09 10:00:00', '6.0', 2),
(43, 46, 'Red Cross Blood Drive', 'Lauren Wright', 'law3363@lockhaven.edu', 'I worked at the recovery table and helped donors eat and drink after they had donated.', '2017-09-13 16:30:00', '3.0', 2),
(44, 60, 'CCC River Clean Up', 'Lauren Wright', 'law3363@lockhaven.edu', 'Went with Clinton County Cleanscapes to do a river cleanup.  Pulled trash out of the river', '2017-09-09 09:00:00', '5.0', 2),
(45, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Major Sharon Cupp', '570-748-2951', 'I teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2017-09-13 17:15:00', '2.0', 2),
(46, 28, 'Blood Donation', 'N/A', 'N/A', '! hour, blood donation.', '2017-09-12 13:00:00', '1.0', 2),
(47, 28, '9/11 Memorial Run', 'Mathew Henry', 'mjh7610@lockhaven.edu', 'Memorial flag run for 9/11 tribute.', '2017-09-11 13:00:00', '1.0', 2),
(48, 103, 'Honors Freshmen Move in and BBQ', 'Rachael Metzinger', 'rxm2509@lockhaven.edu', 'We helped move the new honors freshmen in and helped out at the orientation BBQ', '2017-08-22 12:00:00', '3.0', 2),
(49, 103, 'House clean up', 'Rachael Metzinger', 'rxm2509@lockhaven.edu', 'We cleaned up the basement and other parts of the Honor\'s House.', '2017-09-14 19:00:00', '1.0', 2),
(50, 103, 'Blood Drive', 'Rachael Metzinger', 'rxm2509@lockhaven.edu', 'I gave blood to save lives.', '2017-09-13 16:30:00', '1.0', 2),
(51, 24, 'Red Cross Blood Drive', 'Lauren Wright', 'law3363@lockhaven.edu', 'I helped out at the canteen table.', '2017-09-13 16:30:00', '3.0', 2),
(52, 69, 'Red Cross Blood Drive', 'Lauren Wright', 'law3363@lockhaven.edu', 'Served refreshments and snacks to donors, walked around campus passing out flyers for the blood drive', '2017-09-12 13:30:00', '3.0', 2),
(53, 243, 'River Clean Up', 'Sara Galbraith', 'sng565@lockhaven.edu', 'Land Crew River Clean Up. Pulling tires out of the river.', '2017-09-09 09:00:00', '5.0', 2),
(54, 34, 'Red Cross Blood Drive', 'The Red Cross', 'redcross.org', 'I donated Blood on 9/12/17.', '2017-09-12 15:45:00', '1.0', 2),
(55, 126, 'Blood Drive', 'Red Cross', '5703269131', 'I donated a pint of blood to the red cross', '2017-09-12 00:00:00', '1.0', 2),
(56, 8, 'Lock Haven Shoe Bank', 'Wendy Stiver', 'Wstiver@lockhaven.com', 'Help kids find and try on new shoes.', '2017-09-16 00:00:00', '4.0', 2),
(57, 91, 'FROSH tutor', 'Amy Downes', '5709320850', 'I tutor for the FROSH program in Fairview Suites', '2017-09-13 21:00:00', '1.0', 2),
(58, 17, 'Convocation Volunteer', 'Stacey Masorti', 'sjm1038@lockhaven.edu', 'Scanned student Id\'s and handed out programs for the convocation', '2017-08-27 12:00:00', '2.0', 2),
(59, 248, 'Release the Beasts', 'Eric Shuffelbottom', '7179688115', 'Went to the Lock Haven SPCA and played with the dogs and cats', '2017-09-19 12:30:00', '1.0', 2),
(60, 255, 'Clinton County CleanScapes River Clean Up', 'Sara Galbraith', 'sng565@lockhaven.edu', 'I helped clean out the Susquehanna River by taking tires out of the river.', '2017-09-09 09:00:00', '5.0', 2),
(61, 255, 'Red Cross Blood Drive', 'Lauren Wright', 'law3363@lockhaven.edu', 'I wore a blood drop costume and provided the campus with information about the Blood drive.', '2017-09-12 13:00:00', '3.0', 2),
(62, 243, 'Red Cross Blood Bank', 'Lauren Wright', 'law3363@lockhaven.edu', 'Wore red blood drop outfit as well as making sure that students and community members receive food and snacks after they donated blood.', '2017-09-12 13:00:00', '4.0', 2),
(63, 64, 'PAWS', 'Kelsey Shampoe', 'med_asst@centrecountypaws.org', 'Transported cats to and from their vet appointments.', '2017-08-24 09:00:00', '2.0', 2),
(64, 64, 'Centre County PAWS', 'Kelsey Shampoe', 'med_asst@centrecountypaws.org', 'Transported cats to and from vet appointments', '2017-08-25 12:00:00', '2.0', 2),
(65, 91, 'FROHS tutor', 'Amy Downes', '570-932-0850', 'I tutor for the FROSH program at Fairview Suites', '2017-09-20 21:00:00', '1.0', 2),
(66, 227, 'Clinton County CleanScapes River Clean Up', 'Lauren Wright', 'law3363@lockhaven.edu', 'We went to the river and took tires out of the water', '2017-09-09 08:00:00', '4.0', 2),
(67, 227, 'Trail Clean Up', 'Jared Brandt', 'jdb5820@lockhaven.edu', 'The environmental club went on the lock haven nature trail and picked up trash along our way, filling up about 5 bags.', '2017-09-20 17:00:00', '1.0', 2),
(68, 31, 'Golf cart clean up', 'Tom bates', 'Sad', 'Took down honors cart', '2017-09-21 19:00:00', '1.0', 2),
(69, 8, 'Farm city family fun fest', 'Susie Peters', 'speters@clintoncountypa.com', 'Worked art station', '2017-09-23 00:00:00', '4.0', 2),
(70, 227, 'Farm-City Festival', 'Susie Peters', 'speters@clintoncountypa.com', 'We went to the far and did whatever they needed us to do, such as work the registration table, put up signs, clean up and set up, and work at the kids\' crafts table', '2017-09-23 08:00:00', '7.0', 2),
(71, 242, 'River Clean Up', 'Sara Galbraith', 'sng565@lockhaven.edu', 'Cleaned up tires stuck in the Susquehanna river.', '2017-09-09 09:15:00', '4.0', 2),
(72, 233, '2017 River Cleanup', 'Sara Galbraith', 'sng565@lockhaven.edu', 'Pulling tires out of the Susquehanna all day', '2017-09-09 09:00:00', '4.0', 2),
(73, 151, 'Out of The Darkness Suicide Awareness Walk', 'Heather Garbrick', 'gidget8472@gmail.com', 'We walked in memory of those who have committed suicide, and to draw attention to this issue.', '2017-09-24 12:00:00', '3.0', 2),
(74, 160, 'CAC- Block Party Table', 'Alyssa Henry', '717-348-7816', 'I volunteered at the College\'s Against Cancer table at the homecoming block party. During the block party we spread awareness for child cancer by giving out free yellow lollipops with facts about childhood cancer attached to them. We also spread the word to the community about the mission of our club and collected donations for the American Cancer Society.', '2017-09-23 17:30:00', '3.0', 2),
(75, 103, 'Greenhouse Clean-Up', 'Dr. Joseph Calabrese', 'jcalabre@lockhaven.edu', 'Helped Professor Calabrese clean the greenhouse on campus near the rec center.', '2017-09-24 10:30:00', '1.0', 2),
(76, 43, 'Farm-City Family Festival', 'Susie Peters', 'speters@clintoncountypa.com', 'I helped with crafts at the festival', '2017-09-23 08:30:00', '6.0', 2),
(77, 115, '9/11 Memorial Ride', 'Todd Winder', '570-971-2685', 'My volunteer fire department holds an event every year to honor the fallen Americans of the 9/11 tragedy. This year I assisted with the memorial throughout the whole day worth of events. This included setting up the ride, volunteering on the ambulance as an EMT, and doing any odd jobs around the station that needed my help. This is a county wide event that has a large impact in our community.', '2017-09-11 07:00:00', '12.0', 2),
(78, 248, 'Release the Beasts', 'Eric Shuffelbottom', '7179688115', 'Went to Lock Haven SPCA and washed and played with cats and dogs', '2017-09-26 12:30:00', '1.0', 2),
(79, 159, 'Red Cross Blood Donation', 'Marge Smith', 'marge.smith@redcross.org', 'I donated blood with Red Cross when they came to campus', '2017-09-13 18:00:00', '1.0', 2),
(80, 272, 'Movers and Shakers', 'Rachael Metzinger', 'honors_program@lockhaven.edu', 'Helped University Move-in', '2017-08-24 00:00:00', '14.0', 2),
(81, 72, 'Cleaning the Honors House', 'Tom', 'twb9017@lockhaven.edu', 'I helped the Special Events Committee clean up the honors house', '2017-09-28 00:00:00', '1.0', 2),
(82, 248, 'Release the Beasts', 'Eric Shuffelbottom', '7179688115', 'Helped decorate the lobby for fall', '2017-10-03 12:30:00', '1.0', 2),
(83, 243, 'Release the Beasts', 'Eric', 'All I know is he is in honors, couldn\'t find contact info', 'Volunteering as the SPCA to walk and play with both cats and dogs that do not have permanent homes or owners. We give them love.', '2017-09-19 12:30:00', '1.0', 2),
(84, 98, 'Cleanscapes River Clean up', 'LHU mountain serve', '570-484-2495', 'Worked to help remove tires and other trash from the river.', '2017-09-09 09:00:00', '4.0', 2),
(85, 98, 'LHU Movers and Shakers', 'Allison Reed', '570-484-2053', 'Helped move freshmen into the residence halls during orientation.', '2017-08-23 09:00:00', '2.0', 2),
(86, 98, 'Green House Clean Up', 'Dr. Calabrese', 'jcalabrese@lockhaven.edu', 'Helped to clean up and weed the Lock Haven Green House.', '2017-09-23 09:00:00', '1.0', 2),
(87, 123, 'Field Hockey Ball Girl', 'Lindsay Reese', 'lreese@lockhaven.edu', 'Volunteer as a ball girl for the women\'s field hockey team on 9/22.', '2017-09-22 14:45:00', '2.0', 2),
(88, 123, 'Penn State Football Volunteer', 'Lindsay Reese', 'lreese@lockhaven.edu', 'Volunteer with women\'s lacrosse team to provide services during Penn State Football game at entrances to stadium seating.', '2017-09-09 09:30:00', '9.0', 2),
(89, 88, 'Honors Mover and Shaker', 'Elizabeth Gruber', 'egruber@lhup.edu', 'I and several other honors students spent approximately 2 hours of our time to help move in the new global honors freshman. The duties included unpacking their vehicles, unpacking bins in their rooms, and directing them what they should do next.', '2017-08-22 12:00:00', '2.0', 2),
(90, 103, 'Domino\'s 20th Anniversary', 'Leah Frederick', 'leahf9@outlook.com', 'We held up signs outside of Domino\'s to bring in customers and played games with children while patrons waited for their food.', '2017-10-06 16:00:00', '3.0', 2),
(91, 43, 'Dominos 20th Aniversary celebration', 'Leah Frederick', 'leahf9@outlook.com', 'I helped with childrens games and handed out prizes.', '2017-10-06 15:45:00', '3.0', 2),
(92, 248, 'Decorating for SPCA', 'Marissa Henry', '5707484756', 'Helped make fall decorations for the SPCA lobby', '2017-10-06 13:30:00', '2.0', 2),
(93, 231, 'Highland Cemetery- Historical Lantern Light Tour', 'Sarah Greenzweig', 'sbg1868@lockhaven.edu, (302) 544-0002', 'Portrayed a historical character along the tour', '2017-10-06 17:00:00', '4.0', 2),
(94, 231, 'Highland Cemetery-Historical Lantern Light Tour', 'Sarah Greenzweig', 'sbg1868@lockhaven.edu, (302) 544-0002', 'Portrayed a historical character along tour- Did this for Friday and Saturday', '2017-10-07 17:00:00', '4.0', 2),
(95, 72, 'LHU Mens Soccer ID Clinic', 'Patrick Long', '15706602093', 'Helped coach with a day full of training sessions with hopeful recruits', '2017-10-08 11:30:00', '2.0', 2),
(96, 137, 'Awareness Table for ACS', 'Alyssa Henry', '717-348-7816', 'I handed out lollipops and educated people on childhood cancer. I gave them facts and statistics about childhood cancer in the United States. I also collected donations and sold t-shirts that would benefit the American Cancer Society.', '2017-09-22 00:00:00', '3.0', 2),
(97, 137, 'Breast Cancer Awareness', 'Alyssa Henry', '717348-7816', 'I sat at a table on campus handing out candy and pamphlets about breast cancer and self breast exams. I also encouraged people to decorate a bra for free so that they could be hung around campus to raise awareness for breast cancer month.', '2017-10-04 00:00:00', '2.0', 2),
(98, 120, 'Band Booster Concession Worker', 'Jenny Leuth', '814-222-0351', 'I worked in the band booster\'s concession stand at Bellefonte High School\'s football game to help support the band and their upcoming trip to Disney in November. I served as a cashier and runner during the game, taking orders and delivering the food. I also helped with set up and tear down after the game by prepping the food and helping to clean all the dishes and materials.', '2017-10-06 17:00:00', '5.0', 2),
(99, 67, 'Mentoring', 'Dr. Bruner', 'lbruner@lockhaven.edu', 'I am a mentor for the Psychology department and meet with different mentees. I talk to them about different things they may need help with throughout the semester.', '0000-00-00 00:00:00', '3.0', 2),
(100, 91, 'FROSH tutor', 'Amy Downes', '570-932-0850', 'I tutor for the FROSH program at Fairview suites', '2017-10-04 21:00:00', '1.0', 2),
(101, 91, 'FROSH tutor', 'Amy Downes', '570-932-0850', 'I tutor for the FROSH program at Fairview Suites', '2017-09-27 21:00:00', '1.0', 2),
(102, 23, 'Open House', 'Allison Reed', 'amr794@lockhaven.edu', 'I worked the open house with A-Team on 10/14', '2017-10-14 08:30:00', '2.0', 2),
(103, 34, 'Steamtown Marathon', 'Cynthia Weiss', 'cweiss@fcrsd.org', 'I went home and volunteered to help direct runners through my high school prior to the beginning of the steamtown marathon', '2017-10-08 05:30:00', '3.0', 2),
(104, 234, 'Release the Beasts', 'Eric Shufflebottom', '717-968-8115', 'Played with cats', '2017-09-19 00:30:00', '1.0', 2),
(105, 234, 'SPCA', 'Melissa Henry', '570-748-4756', 'Decorated the lobby, walked dogs', '2017-10-06 01:26:00', '2.0', 2),
(106, 23, 'Open House-Afternoon Session', 'Allison Reed', 'amr794@lockhaven.edu', 'I worked the afternoon session of the Open House with A-Team on 10/14.', '2017-10-14 13:00:00', '1.0', 2),
(107, 102, 'Open House', 'Allison Reed', 'honors@lockhaven.edu', 'I worked at the morning session of the OH. I talked to incoming students about the Honors Program and welcomed them to the University', '2017-10-14 08:00:00', '2.0', 2),
(108, 227, 'Open House', 'Allison Reed', 'amr794@lockhaven.edu', 'For the A-Team we informed and recruited prospective students into the GHP.', '2017-10-14 00:00:00', '3.0', 2),
(109, 234, 'Open House', 'Allison Reed', 'honors_program@lockhaven.edu', 'Worked the open house and interviewed.', '2017-10-14 00:00:00', '3.0', 2),
(110, 149, 'Open House', 'Allison Reed', 'honors@lhup.edu', 'I went to the open house with the Honors Admissions Team and talked to high school students about potentially joining the Honors Program. I also trained a freshman during the morning portion of the open house and trained two freshman in the afternoon when I conducted an interview with a prospective student.', '2017-10-14 08:00:00', '3.0', 2),
(111, 243, 'Open House', 'Alison Reed', 'amr794@lockhaven.edu', 'Member of the A-team. Attending open houses and talking to high school students and their parents about the honors program as well as taking part in the interviews in the afternoon session of the open house.', '2017-10-14 08:00:00', '3.0', 2),
(112, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Major Sharon Cupp', '570-748-2951', 'I teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2017-09-20 17:30:00', '2.0', 2),
(113, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Major Sharon Cupp', '570-748-2951', 'I teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2017-09-27 17:30:00', '2.0', 2),
(114, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Major Sharon Cupp', '570-748-2951', 'I teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2017-10-04 17:30:00', '2.0', 2),
(115, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Major Sharon Cupp', '570-748-2951', 'I teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2017-10-11 17:30:00', '2.0', 2),
(116, 34, 'Open House', 'Allison Reed', 'honors@lockhaven.edu', 'I participated in the open house as an Honors admissions team member in both the morning and afternoon sessions.', '2017-10-14 08:15:00', '3.0', 2),
(117, 28, 'Domestic Violence Vigil', 'Mathew Henry', 'mjh7610@lockhaven.edu', 'set up, usher attendess, and take down materials for the vigil.', '2017-10-18 17:30:00', '2.0', 2),
(118, 217, 'Pumpkin chunking festival', 'Mark Ott', 'chunkinvolunteers@gmail.com', 'Orignally assinged to direct traffic, ended up loading a mini trebuchet for  5.5 hours.', '2017-10-21 09:00:00', '5.0', 2),
(119, 66, 'HOPE Center Domestic Violence Vigil', 'Kyle McCarthy', '570-982-4940', 'Volunteered with Alpha Sigma Phi to set up, usher, and clean up Domestic Violence Vigil', '2017-10-18 17:30:00', '2.0', 2),
(120, 232, 'Jazz Jam with LHUWS', 'Kathy Brown', '706-897-0596', 'I parked cars and greeted people at the Jazz Jam which was located at the Durrwachter Center.', '2017-08-19 18:00:00', '2.0', 2),
(121, 232, 'Clinton County SPCA', 'Makenzie David', '570-404-4852', 'With my FDG group, I went to the Clinton County SPCA. While I was there I helped with the dogs and cats by giving them attention and making sure they were taken care of.', '2017-09-12 12:30:00', '1.0', 2),
(122, 142, 'Helping Hand', 'Janet Klinefelter', '(814) 777-4738', 'The Donald P. Bellisario College of Communications at Penn State University was having a banquet in honor of the donor\'s who donated scholarship money for student\'s with excellent academic standing and financial need. I helped set up tables and distribute name tags as well as directing students and donors to their designated tables.', '2017-10-22 11:00:00', '10.0', 2),
(123, 22, 'Honors A-Team Open House', 'Rachael Metzinger', 'rxm2509@lockhaven.edu', 'The Honors A-Team talked with a variety of students at the open house, making sure to tell them how great the honors program is!', '2017-10-14 00:00:00', '2.0', 2),
(124, 65, 'Socktober Donations', 'Erica Berkowitz', 'elp6665@lockhaven.edu', 'Donated 12 pairs of new socks for families in need in the Lock Haven Area', '2017-10-23 00:00:00', '2.0', 2),
(125, 65, 'HungerBowl Donations', 'Lauren Wright', 'law3363@lockhaven.edu', 'Donated 8 non-perishable food items to be given to families in need in the Lock Haven area', '2017-10-23 00:00:00', '2.0', 2),
(126, 137, 'Breast Cancer Awareness Table', 'Alyssa Henry', '717-348-7816', 'I participated in the Pink out football game and handed out flyers about breast cancer. I also gave out pink flowers and candy to people attending the game. We educated people about breast cancer and handed out informational pamphlets. This table was to raise awareness for breast cancer and honor those who are fighting breast cancer and who have beaten it.', '2017-10-21 12:00:00', '4.0', 2),
(127, 160, 'CAC-Fountain Dyeing', 'Alyssa Henry', '7173487816', 'I co-organized and ran Lock Haven University\'s annual fountain dyeing. On Ivy Lane, we had a table set up handing out cups of pink water for LHU students and facility to dump into the fountain. The event was geared to raise awareness and money for breast cancer. In addition to handing out cups of dye, we also gave out lollipops with breast cancer facts, pink ribbons, and educational brochures.', '2017-10-13 11:00:00', '2.0', 2),
(128, 160, 'CAC- October Awareness Table', 'Alyssa Henry', '7173487816', 'I co-organized and ran an awareness table outside of Bentley during the open house hours. During this time, we talked to current LHU students and prospective students and their families about breast cancer. We handed out lollipops with facts about breast cancer, pink ribbons, and educational brochures.', '2017-10-14 11:00:00', '3.0', 2),
(129, 160, 'CAC- Pink Out Football Game', 'Alyssa Henry', '7173487816', 'CAC partnered with ZTA to raise awareness for breast cancer at the home football game this past weekend. At the event, we spoke with families and students about breast cancer and handed out free goodies to spread awareness. Some items we handed out were mini footballs with pink ribbons, pink Hershey kisses, pink carnations with facts about breast cancer, and education brochures. We also collected donations at this event.', '2017-10-21 11:00:00', '4.0', 2),
(130, 68, 'Domestic Violence Vigil Set Up/Clean Up', 'Kyle McCarthy', 'kmj2080@lockhaven.edu', 'Set up and Clean up at the Domestic Violence Vigil. This was through Alpha Sigma Phi', '2017-10-18 17:30:00', '2.0', 2),
(131, 248, 'Release the Beasts', 'Eric Shuffelbottom', '7179688115', 'Walked a dog around town and socialized with her.', '2017-10-24 12:30:00', '1.0', 2),
(132, 228, 'SPCA', 'MacKenzie David', 'mkd9008@lockhaven.edu', 'Went and played with cats (my favorite was Stella)', '2017-09-12 12:30:00', '1.0', 2),
(133, 273, 'River Cleanup', 'Lauren Wright', 'Lauren Wright', 'I took pictures of everyone during the river cleanup.', '2017-09-09 09:00:00', '4.0', 2),
(134, 273, 'First Church of Christ Fall Fest', 'Steve Salmon', '570-748-3519', 'I helped run children\'s games at a fall fest for a local church.', '2017-10-14 11:00:00', '4.0', 2),
(135, 273, 'Volleyball Statistician', 'Shannon Gerencir', 'slg945@lockhaven.edu', 'I voluntarily take stats for the volleyball team during each home game.', '2017-09-22 19:00:00', '3.0', 2),
(136, 273, 'Volleyball Statistician', 'Shannon Gerencir', 'slg945@lockhaven.edu', 'I voluntarily take stats for the volleyball team during each home game.', '2017-09-23 13:00:00', '2.0', 2),
(137, 273, 'Volleyball Statistician', 'Shannon Gerencir', 'slg945@lockhaven.edu', 'I voluntarily take stats for the volleyball team during each home game.', '2017-10-06 19:00:00', '2.0', 2),
(138, 273, 'Volleyball Statistician', 'Shannon Gerencir', 'slg945@lockhaven.edu', 'I voluntarily take stats for the volleyball team during each home game.', '2017-10-07 13:00:00', '1.0', 2),
(139, 273, 'Volleyball Statistician', 'Shannon Gerencir', 'slg945@lockhaven.edu', 'I voluntarily take stats for the volleyball team during each home game.', '2017-10-10 19:00:00', '2.0', 2),
(140, 100, 'Open House A-Team', 'Allison Reed', 'honors@lockhaven.edu', 'On October 14th I volunteered through A-Team by talking to prospective LHU honors students at the open house.', '2017-10-14 08:00:00', '2.0', 2),
(141, 63, 'Scene shop volunteer', 'Ramona Broomer', 'rbroomer@lockhaven.edu', 'I helped out in the scene shop for a work call and set up lights and gathered props for the upcoming mainstage productions in Sloan Auditorium.', '2017-10-14 12:00:00', '7.0', 2),
(142, 17, 'Volunteer for soccer clinic', 'Patrick Long', '5706602093', 'Helped at soccer clinic with refereeing and water supply', '2017-10-08 11:00:00', '2.0', 2),
(143, 10, 'Open house', 'Allison Reed', '415-7022', 'I\'m on A-team', '2017-10-14 00:00:00', '1.0', 2),
(144, 135, 'Storm Runners- 3k Run/Walk for Hurricane Relief', 'Heaven Martin', 'hlm8156@lockhaven.edu', 'I assisted in set up for the run. Then during the run I directed runners and supplied prizes.', '2017-10-29 00:00:00', '4.0', 2),
(145, 100, 'CEC Halloween Party', 'Dr. Johnathan Stout', 'jstout1@lockhaven.edu', 'On October 26th I helped CEC, a club on campus, and the ASL club throw a Halloween party for children and adults with disabilities. At the party, I was in charge of an activity table and interacted with the attendees.', '2017-10-26 17:30:00', '1.0', 2),
(146, 103, 'Open House', 'Dr. Elizabeth Gruber', 'egruber@lockhaven.edu', 'Talked to prospective students about the Global Honors Program and interviewed interested students.', '2017-10-28 08:30:00', '3.0', 2),
(147, 66, 'Big Brothers Big Sisters Canning Fundraiser', 'Zack Coccio', '201-563-3661', 'Collecting donations from passing cars in town with Alpha Sigma Phi to support Big Brothers Big Sisters Foundation', '2017-10-28 00:00:00', '5.0', 2),
(148, 269, '5K at SusqueView Home', 'Susan Triponey', 'striponey@susqueviewhome.com', 'I helped set up and register the runners for the 5K that took place on October 28th.', '2017-10-28 08:00:00', '2.0', 2),
(149, 32, 'Open House', 'Allison', 'amr794@lockhaven.edu', 'A-Team-morning and afternoon session', '2017-10-28 08:15:00', '3.0', 2),
(150, 32, 'Open House', 'Allison', 'amr794@lockhaven.edu', 'A-Team-morning and afternoon session', '2017-10-14 08:15:00', '3.0', 2),
(151, 32, 'Orientation Weekend', 'Rachael', 'rxm2509@lockhaven.edu', 'Honors Movers and Shakers and Welcome Back BBQ', '2017-08-22 11:00:00', '3.0', 2),
(152, 23, 'Open House', 'Allison Reed', 'amr794@lockhaven.edu', 'I worked the open house on October 28', '2017-10-28 08:00:00', '3.0', 2),
(153, 149, 'Honors Admissions Open House', 'Allison Reed', 'honors@lockhaven.edu', 'I went to the university\'s open house with the Honors Admissions Team and talked to high school students and their families about the Honors Program. During the morning session, I passed out fliers about the program and directed students and their families to our table. In the afternoon, I helped to conduct interviews of some prospective students.', '2017-10-28 08:00:00', '3.0', 2),
(154, 149, 'SPSEA Halloween Party', 'Abigail Storrs', 'ams4900@lockhaven.edu', 'SPSEA, the Student Pennsylvania State Education Association, hosted a Halloween party at Ross Library for kids who go to the local elementary and middle schools. We dressed in costumes and planned and organized several games and activities for the kids to participate in at the party.', '2017-10-24 18:00:00', '2.0', 2),
(155, 240, 'Rails To Trails Cleanup', 'Sara Galbraith', 'sng565@lockhaven.edu', 'I helped to rid Youngdale Road of debris that people threw over the guardrail by cleaning said debris by placing it in garbage bags and using proper disposal methods.', '2017-10-28 09:30:00', '3.0', 2),
(156, 240, 'American Red Cross Blood Drive', 'Lauren Wright', 'law3363@lockhaven.edu', 'Volunteered to help people who got their blood drawn to regain energy by giving them drinks and food and a warm conversation.', '2017-09-13 15:30:00', '2.0', 2),
(157, 248, 'Release the Beasts', 'Eric Shuffelbottom', '7179688115', 'Socialized cats and walked one of the dogs around town', '2017-10-31 12:30:00', '1.0', 2),
(158, 45, 'Phoenixville Hospital Fall Fest', 'Barbara O\' Connor', 'BarbaraM.Oconnor@towerhealth.org; 610-983-1295', 'I helped sliced bags of bread in order to help make the sloppy joe\'s that were being sold in the prep kitchen. I also stood in a carrot costume and handed out carrots and apples to people walking in and out of the festival at the nutrition information table. Then, I helped with clean up.', '2017-10-28 07:00:00', '10.0', 2),
(159, 151, 'Hunger Bowl', 'LHU Psychological Association', 'rxm2509@lockhaven.edu', 'I donated six items to the Hunger Bowl.', '2017-10-25 00:00:00', '2.0', 2),
(160, 54, 'Hustling for Houston', 'Katie Krasinski', '570-789-0374', 'I helped run the 5k the Strength, Conditioning and Fitness club did. The proceeds went to the Red Cross of the Greater Houston area. I helped with registration and signing runners in. After that I helped film the video of the runners running and then I helped give away the door prizes and clean up the event.', '2017-10-18 17:00:00', '2.0', 2),
(161, 54, 'Trick or Treating at Susqueview Nursing Home', 'Cassidy Barshinger', '717-825-6947', 'Susqueview started Trick or Treating at 7pm, and before that they ran games and activities for the kids to participate in. I helped set up, run and tear down the games. I ran the one game (spider race) and interacted with the parents and kids as they came to my station to play the games. After the event, we had to tear down all of the games and also talked with some of the residents and visited with them.', '2017-10-25 17:30:00', '2.0', 2),
(162, 69, 'Susque-View 5K/Craft and Vendor Show', 'Teresa Fortney', 'tfortney@susqueviewhome.com', 'I assisted residents around the Craft and Vendor Show', '2017-10-28 09:00:00', '3.0', 2),
(163, 25, 'Open House', 'Allison Reed', 'honors@lockhaven.edu', 'attended the open house with admissions team', '2017-10-28 08:15:00', '3.0', 2),
(164, 262, 'Fresh Express', 'Lindsay Caprio (Assistant Coach)', 'lac40@lockhaven.edu', 'Volunteered (with the LHU lacrosse team) at a food bank held at Lenovo Elementary School.', '2017-11-02 15:30:00', '2.0', 2),
(165, 116, 'Clinton County SPCA', 'Marissa Henry', 'ccspcaOutreach@gmail.com', 'Volunteer dog P.A.L. and walker', '2017-10-20 13:00:00', '2.0', 2),
(166, 85, 'Adopt a Family Tags', 'Skylar Hetrick', 'slh6276@lockhaven.edu', 'I worked at the Mountain Serve office to help fill out the tags that will be hung on trees for the \"Adopt a Family\" Program', '2017-11-03 14:30:00', '1.0', 2),
(167, 91, 'FROSH tutor', 'Amy Downes', '5709320850', 'tutor for the FROSH program in Fairview Suites', '2017-11-01 21:00:00', '1.0', 2),
(168, 80, 'Horses of Hope', 'Esther Duck', '(570) 502-4164', 'These hours include those for both October 26 and November 2, where I attended Horses of Hope with my advisor and friend, Esther Duck, where we spend from 5-8:00pm exercising, mucking stalls and pastures, and feeding the horses under the program\'s care.', '2017-10-26 17:00:00', '6.0', 2),
(169, 97, 'Help at SPCA', 'Carina Howell', 'chowell@lockhaven.edu', 'Help socialize dogs and cats along with preparing and decorating the SPCA building', '2017-12-11 00:00:00', '40.0', 2),
(170, 84, 'Punkin Chunkin Festival', 'Mark Ott', 'chunkinvolunteers@gmail.com', 'Helped park cars at the punkin chunkin festival', '2017-10-21 09:00:00', '2.0', 2),
(171, 22, 'A-Team Open House', 'Rachael Metzinger', 'rxm2509@lockhaven.edu', 'In the afternoon session the Honors A-Team talked to many families and gave interviews to prospective students.', '2017-10-28 00:00:00', '1.0', 2),
(172, 235, 'Trunk or Treat', 'Pastor Tim Boger', '570-893-8274', 'Passed out candy to kids at Big Woods Bible church on Halloween.', '2017-10-31 17:00:00', '2.0', 2),
(173, 98, 'Global Honors Matriculated Open House', 'Allison Reed', 'honors@lockhaven.edu', 'Volunteered to meet with current Lock Haven Students to encourage them to join the global honors program.', '2017-11-06 00:00:00', '1.0', 2),
(174, 30, 'Biology Peer Mentoring', 'Dr. Amy Kutay', 'akutay@lockhaven.edu', 'Every week I meet with my Biology Peer Mentor Student for an hour and discuss assigned topics for the week. I also help them with any problems or concerns that they have had throughout the semester such as scheduling, exams, midterms, etc.', '2017-09-01 13:00:00', '11.0', 2),
(175, 30, 'Helping at the Biology Convocation', 'Dr. Carina Howell', 'chowell@lockhaven.edu', 'I helped to greet incoming family members, students and faculty by inviting them in, helping with parking and their coats. I also handed out programs and directed people to the bathroom and into the main ceremony room.', '2017-11-03 13:00:00', '1.0', 2),
(176, 267, 'Biology Department Mentor', 'Dr. Hunter & Dr. Kutay', 'shunter@lockhaven.edu', 'I meet with two mentees once a week for an hour to discuss topics of biology and how classes are going.', '2017-09-04 12:15:00', '12.0', 2),
(177, 248, 'Release the Beasts', 'Eric Shufflebottom', '7179688115', 'Socialized cats', '2017-11-07 12:30:00', '1.0', 2),
(178, 248, 'SPCA', 'Marissa Henry', '5707484756', 'Walked dogs, played with cats', '2017-11-09 14:00:00', '2.0', 2),
(179, 273, 'Volleyball Statistician', 'Shannon Gerencir', 'slg945@lockhaven.edu', 'I am the official statistician for home games', '2017-11-10 19:00:00', '2.0', 2),
(180, 100, 'GHP Luncheon', 'Allison Reed', 'honors@lockhaven.edu', 'At the honors luncheon, I talked to prospective LHU honors students. While at lunch we discussed the university, classes, etc. The high school students were then walked to the Alumni building for a short presentation. Following the presentation, I conducted interviews.', '2017-10-31 11:00:00', '2.0', 2),
(181, 103, 'Matriculated Open House', 'Dr. Elizabeth Gruber', 'egruber@lockhaven.edu', 'Talked with prospective Honor\'s Students that currently go to Lock Haven.', '2017-11-06 19:00:00', '1.0', 2),
(182, 109, 'Sock Donation', 'Rachael Metzinger', 'rxm2509@lockhaven.edu', 'I dropped off six pairs of socks to the honors house. There were three pairs of boy socks and three pairs of girl socks for a fundraising event.', '2017-10-30 19:00:00', '2.0', 2),
(183, 109, 'Canned Goods Donation', 'Rachael Metzinger', 'rxm2509@lockhaven.edu', 'I dropped off 6 cans of non-perishable items to the box in the honors house for a fundraising event.', '2017-10-30 19:00:00', '2.0', 2),
(184, 102, 'GHP Luncheon', 'Alison Reed', 'honors@lockhaven.edu', 'I attended the luncheon, had lunch with prospective honors students, played a get-to-know you game with them, and conducted an interview.', '2017-10-31 11:00:00', '2.0', 2),
(185, 23, 'Luncheon', 'Allison Reed', 'amr794@lockhaven.edu', 'I worked the admissions luncheon with A-Team!', '2017-10-31 12:30:00', '1.0', 2),
(186, 235, 'Open House', 'Allison Reed', 'amr794@lockhaven.edu', 'I helped with the Open House with A team', '2017-10-14 00:00:00', '3.0', 2),
(187, 235, 'Open House', 'Allison Reed', 'amr794@lockhaven.edu', 'I helped with Open House with A team.', '2017-10-28 00:00:00', '2.0', 2),
(188, 235, 'Honors Luncheon', 'Allison Reed', 'amr794@lockhaven.edu', 'I conducted interviews on behalf of the A team.', '2017-10-31 00:00:00', '1.0', 2),
(189, 140, 'Operation Christmas Child', 'Sarah Snyder', '570-660-1919', 'Packing shoebox gifts into shipping boxes to send out to under-privileged children', '2017-11-15 09:00:00', '4.0', 2),
(190, 21, 'Nature Trail Cleanup', 'Allison Spielman', 'ans1047@lockhaven.edu', 'I did a trail cleanup with environmental club', '2017-09-20 16:30:00', '1.0', 2),
(191, 21, 'Environmental Club', 'Allison Spielman', 'ans1047@lockhaven.edu', 'I did a cleanup on the river', '2017-10-04 16:30:00', '1.0', 2),
(192, 21, 'Wrestling tournament', 'Victoria Moses', 'vcm8480@lockhaven.edu', 'I volunteered at the wrestling tournament', '2017-10-21 08:00:00', '2.0', 2),
(193, 103, 'Open House', 'Dr. Elizabeth Gruber', 'egruber@lockhaven.edu', 'We talked to prospective students in the morning about the GHP and interviewed possible members for the program.', '2017-11-19 08:30:00', '2.0', 2),
(194, 43, 'Lock Haven Shoe Bank', 'Wendy Stiver', 'wstiver@lockhaven.com', 'I help at the shoe bank by helping the children try on shoes.', '2017-11-18 11:00:00', '3.0', 2),
(195, 22, 'Susqueview Thanksgiving Dinner', 'tfortney@susqueview.com', 'Teresa Fortney', 'Last Friday a group of students and I served Thanksgiving dinner to the residents and their families. Over 400 people attended the event.', '2017-11-17 00:00:00', '2.0', 2),
(196, 25, 'Susqueview Thanksgiving Dinner', 'Teresa Fortney', 'tfortney@susqueviewhome.com', 'Helped serve thanksgiving dinner to the residents and their families', '2017-11-17 17:30:00', '2.0', 2),
(197, 25, 'Honors Open House', 'Allison Reed', 'honors@lockhaven.edu', 'Worked the open house with admissions team', '2017-11-18 08:15:00', '3.0', 2),
(198, 22, 'Honors Admissions Team- Open House', 'Allison Reed', 'amr794@lockhaven.edu', 'On Saturday the Honors Admissions Team talked to prospective students and their families during the morning session. During the afternoon portion we gave interviews to students.', '2017-11-18 00:00:00', '3.0', 2),
(199, 235, 'Open House', 'Allison Reed', 'amr794@lockhaven.edu', 'Told prospective students about GHP with Honors A Team at Open House', '2017-11-18 08:00:00', '2.0', 2),
(200, 222, 'Thanksgiving Dinner distribution', 'Dr. Jessica Hosley', 'jhosley@lockhaven.edu', 'I, with my other club members on campus, distributed turkeys, and other food to families in need, for the Thanksgiving holiday. We went to a local elementary school to distribute them and drove to the Beech Creek area to hand them out.', '2017-11-20 12:00:00', '2.0', 2),
(201, 243, 'Open House', 'Allison Reed', 'amr794@lockhaven.deu', 'A-Team for honors and interviewing that followed', '2017-10-28 08:00:00', '3.0', 2),
(202, 243, 'Open House', 'Allison Reed', 'amr794@lockhaven.edu', 'A-team', '2017-11-18 08:00:00', '2.0', 2),
(203, 64, 'Centre County PAWS', 'Kelsey Shampoe', 'med_asst@centrecountypaws.org', 'Transported cats to and from their vet appointments.', '2017-11-24 11:30:00', '2.0', 2),
(204, 23, 'Open House', 'Allison Reed', 'amr794@lockhaven.edu', 'I worked the open house with A-Team on 11/18.', '2017-11-18 09:00:00', '3.0', 2),
(205, 102, 'Open House', 'Allison Reed', 'honors@lockhaven.edu', 'I talked to prospective students in the morning, and conducted an interview in the afternoon!', '2017-11-18 08:00:00', '3.0', 2),
(206, 149, 'Honors Admissions Team Open House', 'Allison Reed', 'honors@lockhaven.edu', 'I went to the university\'s open house with the Honors admissions team and talked to high school students about potentially joining the Honors Program. I passed out flyers about the program during the morning session at the rec center. In the afternoon, I directed students to get their interviews done and also gave more information about the program to some other students who were interested.', '2017-11-18 08:00:00', '3.0', 2),
(207, 149, 'Honors Admissions Team Open House', 'Allison Reed', 'honors@lockhaven.edu', 'I went to the university\'s open house with the Honors admissions team and talked to high school students about potentially joining the Honors Program. I passed out flyers about the program during the morning session at the rec center. In the afternoon, I directed students to get their interviews done and also gave more information about the program to some other students who were interested.', '2017-11-18 08:00:00', '3.0', 2),
(208, 262, 'LHU Lacrosse Clinic', 'Lindsay Caprio', 'lac40@lockhaven.edu', 'Demonstrated drills; assisted clinic participants with skills', '2017-10-15 08:00:00', '4.0', 2),
(209, 91, 'Storm runners 3k run/walk', 'Matt Girton', 'mgirton@lockhaven.edu', 'I helped coordinate and plan the 3k run/walk for hurricane relief. We raised 160 dollars for Operation USA.', '2017-10-29 10:00:00', '3.0', 2),
(210, 116, 'Clinton County SPCA', 'Marissa Henry (community outreach coordinator)', 'Â ccspcaoutreach@gmail.com', 'Dog walker', '2017-11-16 12:00:00', '2.0', 2),
(211, 21, 'Susqueview Family Thanksgiving', 'Teresa Fortney', 'tfortney@susqueviewhome.com 570-893-59', 'I volunteered at the nursing home to help serve the residents and their families thanksgiving dinner', '2017-11-17 17:30:00', '2.0', 2),
(212, 258, 'Susque View Thanksgiving Dinner', 'Ed Gately', '5707489377', 'I helped serve the residents of Susque View and their family\'s a Thanksgiving dinner.', '2017-11-17 17:30:00', '2.0', 2),
(213, 67, 'Blood Drive', 'Mountain Serve', '?', 'Donated blood at the last blood drive.', '0000-00-00 00:00:00', '1.0', 2),
(214, 81, 'University Players', 'Ramona Broomer', 'rbroomer@lockhaven.edu', 'I assisted in taking down the set for our show', '2017-10-22 15:30:00', '2.0', 2),
(215, 81, 'UP Haunted Studio', 'Ramona Broomer', 'rbroomer@lockhaven.edu', 'Set up for our Haunted Studio fundraiser', '2017-10-27 16:00:00', '2.0', 2),
(216, 159, 'Veterans Expo', 'Major Jonathon Britton', 'jmb946@lockhaven.edu', 'Helped assisted vendors and elderly carrying in and setting up their booths. Also helped with the tear down/clean-up.', '2017-11-09 16:30:00', '3.0', 2),
(217, 100, 'Honors Open House', 'Allison Reed', 'honors@lockhaven.edu', 'On 11/18 I helped with the GHP A-Team open house. During the morning session I spoke to high school students about the GHP and in the afternoon I conducted interviews of prospective LHU GHP students.', '2017-11-18 08:00:00', '3.0', 2),
(218, 251, 'Volunteering Lunch Program - Salvation Army', 'Tabitha Hayes', 'tabitha.hayes@use.salvationarmy.org', 'I helped prepare the meals for the lunch as well as served them with the other kitchen volunteers.  After lunch, I helped do the dishes and clean up. During downtime, Tabitha provided me with work to do towards the fundraiser for the Soup Off. This work involved labeling cups with stickers and also stapling pamphlets.', '2017-11-02 08:00:00', '4.0', 2),
(219, 251, 'Susquehanna River Clean-Up', 'Sara Galbraith', 'sng565@lockhaven.edu', 'I helped in the river by walking up and down the Susquehanna pulling out tires and other trash.  My partner and I only pulled out four tires but we also pulled out lots of cans and bottles.', '2017-09-09 00:00:00', '4.0', 2),
(220, 260, 'SPCA pet therapy', 'Lizzie Laatsch', 'lizzielaatsch11@gmail.com', 'we entertained cats and dogs at the spca', '2017-09-26 12:30:00', '1.0', 2),
(221, 79, 'A-Team Open House', 'Allison Reed', 'amr794@lockhaven.edu', 'With the A-Team, I helped the GHP try to recruit new members at an admissions Open House.  I also trained Maggie at the morning session, and was an honors program representative at the physics academic table for about half the morning as well.  Unfortunately, I couldn\'t help with the afternoon interviews this time.', '2017-10-14 08:15:00', '2.0', 2),
(222, 79, 'A-Team Open House', 'Allison Reed', 'amr794@lockhaven.edu', 'With the A-Team, I helped the GHP try to recruit new members at the admissions Open House.  I was an honors program representative at the physics academic table this morning, and talked to one person about joining the honors program.  In the afternoon, I gave an interview to an exceptionally bright and involved student.  He was very excited about the program, and came in well-informed.', '2017-10-28 08:15:00', '3.0', 2),
(223, 79, 'A-Team Open House', 'Allison Reed', 'amr794@lockhaven.edu', 'With the A-Team, I helped the GHP try to recruit new members at the admissions Open House.  I was an honors program representative at the physics academic table this morning, and talked to one person about joining the honors program.  In the afternoon, Adam Richards and I welcomed students into the Great Room for interviews.  We talked to at least 5 new students about the program, and 2 of whom went immediately for an interview.  I also got to meet some Honors Alumni from the class of 2014.', '2017-11-18 08:15:00', '3.0', 2);
INSERT INTO `FA17_com_serv` (`com_id`, `pstu_id`, `com_title`, `com_advisor`, `com_advisor_contact`, `com_description`, `com_date`, `com_hours`, `com_verified`) VALUES
(224, 79, 'A-Team Open House', 'Allison Reed', 'amr794@lockhaven.edu', 'With the A-Team, I helped the GHP try to recruit new members at the admissions Open House.  I was an honors program representative at the physics academic table this morning, and talked to one person about joining the honors program.  In the afternoon, Adam Richards and I welcomed students into the Great Room for interviews.  We talked to at least 5 new students about the program, and 2 of whom went immediately for an interview.  I also got to meet some Honors Alumni from the class of 2014.', '2017-11-18 08:15:00', '3.0', 2),
(225, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Major Sharon Cupp', '570-748-2951', 'I teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2017-10-18 17:30:00', '2.0', 2),
(226, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Major Sharon Cupp', '570-748-2951', 'I teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2017-11-29 16:30:00', '4.0', 2),
(227, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Major Sharon Cupp', '570-748-2951', 'I teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2017-11-01 17:30:00', '2.0', 2),
(228, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Major Sharon Cupp', '570-748-2951', 'I teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2017-11-15 17:30:00', '2.0', 2),
(229, 106, 'Lock Haven Food Drive', 'N/A', 'N/A', 'Donated 4 canned items to the food drive', '2017-10-18 00:00:00', '1.0', 2),
(230, 106, 'Adopt a Family', 'N/A', 'N/A', 'Picked a family who wanted a Walmart gift card and donated a $50 gift card', '2017-11-29 00:00:00', '1.0', 2),
(231, 234, 'Open House', 'Alison Reed', 'honors_program@lockhaven.edu', 'Worked the Open House and did interviews.', '2017-10-28 08:00:00', '3.0', 2),
(232, 234, 'Open House', 'Alison Reed', 'honors_program@lockhaven.edu', 'Worked the open house and did interviews', '2017-11-18 08:00:00', '3.0', 2),
(233, 234, 'SPCA', 'Marissa Henry', 'ccspcaoutreach@gmail.com', 'Walked dogs and played with cats', '2017-11-09 14:00:00', '2.0', 2),
(234, 234, 'SPCA', 'Marissa Henry', 'ccspcaoutreach@gmail.com', 'Walked dogs, played with dogs, played/socialized cats', '2017-11-17 14:00:00', '2.0', 2),
(235, 46, 'Blood Drive', 'Morgan Capobianco', 'mpc7999@lockhaven.edu', 'I worked at the canteen table to look after those who donated', '2017-11-29 12:00:00', '2.0', 2),
(236, 103, 'Blood Drive', 'Elizabeth Gruber', 'egruber@lockhaven.edu', 'I gave blood at the blood drive.', '2017-11-29 16:30:00', '1.0', 2),
(237, 28, 'Blood Donation', 'n/a', 'n/a', 'Blood Donation', '2017-11-29 15:30:00', '1.0', 2),
(238, 258, 'Blood Drive Donation', 'Marge Smith', '5705602840      marge.smith@redcross.org', 'I made a donation of blood for the American Red Cross.', '2017-11-30 12:30:00', '5.0', 2),
(239, 258, 'Red Cross Blood Drive Donation', 'Marge Smith', '5705602840    marge.smith@redcross.org', 'I donated blood for the Red Cross. On my last submission I accidentally wrote in 5 hours for this event instead of 1. This submission is accurate and I am sorry for the inconvenience that my last submission may have caused.', '2017-11-30 12:30:00', '1.0', 2),
(240, 258, 'Red Cross Blood Drive Event Volunteering', 'Sierra Laughead', '7178853252     shl3496@lockhaven.edu', 'I helped the Red Cross Club during the blood drive by giving blood donors refreshments and making sure that they recovered after making their donations.', '2017-11-30 13:30:00', '5.0', 2),
(241, 60, 'Red Cross Blood Drive', 'Red Cross', '1 (800) 733-2767', 'I donated blood today at the SRC during the Red Cross Blood Drive', '2017-11-30 00:00:00', '1.0', 2),
(242, 46, 'Blood Drive', 'Olivia Bellomo', 'otb1090@lockhaven.edu', 'I worked the canteen table and made sure donors were taken care of after donation.', '2017-11-30 12:00:00', '6.0', 2),
(243, 31, 'Red Cross Blood Donation', 'Rachael Metzinger', 'SAD', 'Donated blood for red cross', '2017-11-30 16:00:00', '1.0', 2),
(244, 65, 'Adopt-A-Family', 'Skylar Herrick', 'slh6276@lockhaven.edu', 'Donated books and gifts for Nevaeh, a boy in one of the Adopt-A-Family families for this years holiday gift drive.', '0000-00-00 00:00:00', '2.0', 2),
(245, 250, 'SPCA', 'Elizabeth Laatsch', 'ejl2251@lockhaven.edu', 'Went to the SPCA to volunteer by petting/playing with the animals', '2017-10-10 12:00:00', '1.0', 2),
(246, 250, 'SPCA', 'Marissa Henry', 'ccspcaoutreach@gmail.com', 'Went to the SPCA to volunteer by petting the cats.', '2017-10-12 12:00:00', '1.0', 2),
(247, 250, 'Blood Drive', 'Morgan Capobianco', 'mpc7999@lockhaven.edu', 'Volunteered to help clean up the blood drive.', '2017-11-30 18:00:00', '1.0', 2),
(248, 250, 'Adopt a Family', 'Elizabeth Laatsch', 'ejl2251@lockhaven.edu', 'My FDG and I adopted a family and went shopping for the two children we got.', '2017-11-28 12:30:00', '1.0', 2),
(249, 128, 'Phi Sigma Pi Initiate Advising (Community Aspect)', 'Bethy Wells', 'ejw4272@lockhaven.edu', 'Throughout the semester, I spent a minimum of 1 hour a week with the 10 new initiates of Phi Sigma Pi, educating them on fraternity practices and supervising their projects. I advised and supervised them on their community service education and projects, including their creation of a collection program to benefit the Women\'s Center. I provided them with supplies, contacts, advice, and assisted in their fundraising. They are still currently collecting supplies that will go to benefit women.', '2017-09-24 19:00:00', '11.0', 2),
(250, 229, 'Storm Runners 3K', 'Kimberly Rogers', 'kfr6225@lockhaven.edu', 'I helped set up for the events, and then stood as a marker along the running path to point people in the right direction and hand out candy.', '2017-10-29 10:00:00', '3.0', 2),
(251, 229, 'Susque-View \"Thanksgiving Dinner\"', 'Theresa Fortney', 'tfortney@susqueviewhome.com', 'I helped serve the residents at the assisted living facility and their families with a Thanksgiving meal, and also helped to set up and clean up.', '2017-11-17 17:00:00', '3.0', 2),
(252, 229, 'Susque-View \"Deck the Halls\"', 'Theresa Fortney', 'tfortney@susqueviewhome.com', 'I helped to make decorations for the assisted living facility and decorated the building for Christmas!', '2017-12-01 14:30:00', '2.0', 2),
(253, 253, 'SPCA', 'Lizzie Laatsch', 'lizzielaatsch11@gmail.com', 'My FDG visited the Clinton County SPCA to socialize the animals there.', '2017-09-26 12:30:00', '1.0', 2),
(254, 253, 'Susque View Nursing Home', 'Teresa Fortney', 'tfortney@susqueviewhome.com', 'I helped set up Christmas decorations at the local nursing home', '2017-12-01 15:00:00', '1.0', 2),
(255, 76, 'Red Cross Blood Drive', 'Red Cross Club', 'law3363@lockhaven.edu', 'assisted blood donors to the recovery table', '2017-11-30 12:30:00', '2.0', 2),
(256, 17, 'SPCA Volunteer', 'Lizzie Laatsch', '2672222353', 'Volunteered at the animal shelter, played with the dogs and cats', '2017-09-26 12:30:00', '1.0', 2),
(257, 85, 'Adopt-A-Family Gifts', 'Skylar Hetrick', 'slh6276@lockhaven.edu', 'Donated two gifts to Adopt-A-Family.\r\nGift 1:  2 yo-yos and a cardgame\r\nGift 2:  Action figures', '2017-12-04 08:00:00', '2.0', 2),
(258, 116, 'Clinton County SPCA', 'Marissa Henry', 'Â ccspcaoutreach@gmail.com', 'Dog Walker', '2017-11-30 00:00:00', '2.0', 2),
(259, 10, 'Open House', 'Allison Reed', '585-415-7022', 'A-team', '2017-10-28 09:00:00', '3.0', 2),
(260, 85, 'Adopt-A-Family gift wrapping', 'Lauren Wright', 'law3363@lockhaven.edu', 'Helped wrapped gifts for Adopt-a-Family', '2017-12-05 13:00:00', '3.0', 2),
(261, 158, 'Troop Climbing Merit Badge Weekend', 'LaRue Reedy', '570-768-8769', 'A full weekend helping scouts to earn their climbing merit badge at Camp Brule. I helped out by setting up the climbing tower and instructing scouts on how to belay, tie knots, and some basic climbing knowledge. The weekend was also completed with a night climb where scouts were able to climb the tower in the dark as well as any other participants.', '2017-10-13 19:00:00', '18.0', 2),
(262, 116, 'Adopt A Family', 'Lauren Wright', '570-484-2499', 'gift wrapping', '2017-12-05 00:00:00', '2.0', 2),
(263, 132, 'Fresh Express', 'Lindsey Caprio', '267-474-8421', 'Helped with Fresh Express food drive at Renovo Elementary School with my lacrosse team (Lock Haven Women\'s Lacrosse). We sorted food and helped deliver boxes of food to community member\'s cars.', '2017-11-02 15:00:00', '4.0', 2),
(264, 132, 'Field Hockey Game', 'Lindsay Caprio', '267-474-8421', 'Worked as a ball girl for the Lock Haven Field Hockey team for their game against Sacred Heart.', '2017-08-25 16:00:00', '2.0', 2),
(265, 88, 'Personal Care Home volunteer', 'Christine Weaver', '2163236972', 'I volunteered my time at the Forest Hills Personal Care Home to help with handing out dinner, keeping the residents entertained, and lastly, helping them find an activity to participate in before they\'re bed time.', '2017-11-21 16:00:00', '3.0', 2),
(266, 23, 'Open House', 'Allison Reed', 'amr794@lockhaven.edu', 'I worked the open house on November 18 with A-Team.', '2017-11-18 08:00:00', '3.0', 2),
(267, 227, 'SPCA Volunteering', 'Eric Shufflebottom', 'ecs8241@lockhaven.edu', 'We would go to the SPCA and help with whatever they needed, from brushing animals to playing with them, to cleaning up, etc. We did this as an activity group. I went 6 times for an hour each, so I used the last day we went as the \"start date\".', '2017-12-05 12:30:00', '6.0', 2),
(268, 18, 'Halloween Program', 'Teresa Fortney', '(570) 893-5941', 'Planned and coordinated games and activities at a Halloween function at Susque View Nursing Home and Rehabilitation Center.', '2017-10-25 16:00:00', '5.0', 2),
(269, 18, 'Bear Mountain River Run Invitational', 'Aaron Russell', 'arussel@lockhaven.edu', 'Volunteered to help work the cross country meet Lock Haven hosted for high school and middle school teams.', '2017-09-02 09:00:00', '3.0', 2),
(270, 116, 'Limited Days Boot Camp', 'Jeremy Cornelius', '717-635-0426', 'Assisted with training camp operations', '2017-12-09 11:00:00', '2.0', 2),
(271, 132, 'Fresh Express', 'Lindsay Caprio', '267-474-8421', 'Volunteered at Renovo Elementary School with a food drive. We participated in building new shelves to store the food for upcoming month\'s food drives as well as sorting food and helping families pick out items.', '2017-12-07 15:00:00', '4.0', 2),
(272, 28, 'CEI Video Shoot', 'Ashley Spencer', 'Ulmer 139', 'Volunteered to be Talon for a Holiday video shoot for LHU', '2017-12-11 12:00:00', '3.0', 1),
(273, 226, 'community service', 'doug buckwalter', 'mporter@lockhaven.edu', 'worked the king of the mountain tournament', '2017-12-15 16:00:00', '5.0', 1),
(274, 159, 'SEC Basement Cleaning', 'Thomas Bates', 'twb9017@lockhaven.edu', 'Spent the time during one of the SEC meetings to clean and organize the Honors House basement.', '2017-09-14 19:00:00', '2.0', 1),
(275, 54, 'Recreation Management Mentoring', 'Julie Lammel', '(570) 484-2826', 'I have a mentee who is a freshman in the Recreation Management Department and we have met four times over the course of the fall semester to help him adjust to campus life and to college itself in general.', '2017-12-05 00:00:00', '4.0', 1),
(276, 257, 'Susqueview Family Dinner', 'Teresa Fortney', 'tfortney@susqueviewhome.com', 'Volunteered at the nursing homes Thanksgiving dinner. Helped by serving the residents and cleaning up.', '2017-11-17 17:30:00', '2.0', 1),
(277, 257, 'susqueview decorating', 'Teresa Fortney', 'tfortney@susqueviewhome.com', 'Make decorations for Christmas at the nursing home and helped to put them up', '2017-12-01 16:00:00', '2.0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `FA17_currentstudents`
--

CREATE TABLE `FA17_currentstudents` (
  `pstu_id` int(11) NOT NULL,
  `pstu_in_fdg` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FA17_currentstudents`
--

INSERT INTO `FA17_currentstudents` (`pstu_id`, `pstu_in_fdg`) VALUES
(5, 0),
(6, 0),
(8, 0),
(9, 0),
(10, 0),
(12, 0),
(13, 0),
(17, 0),
(18, 0),
(21, 0),
(22, 0),
(23, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(37, 0),
(39, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0),
(50, 0),
(53, 0),
(54, 0),
(55, 0),
(56, 0),
(57, 0),
(58, 0),
(59, 0),
(60, 0),
(61, 0),
(62, 0),
(63, 0),
(64, 0),
(65, 0),
(66, 0),
(67, 0),
(68, 0),
(69, 0),
(70, 0),
(72, 0),
(73, 0),
(75, 0),
(76, 0),
(78, 0),
(79, 0),
(80, 0),
(81, 0),
(82, 0),
(83, 0),
(84, 0),
(85, 0),
(86, 0),
(88, 0),
(89, 0),
(90, 0),
(91, 0),
(95, 0),
(96, 0),
(97, 0),
(98, 0),
(100, 0),
(101, 0),
(102, 0),
(103, 0),
(105, 0),
(106, 0),
(107, 0),
(108, 0),
(109, 0),
(110, 0),
(111, 0),
(112, 0),
(113, 0),
(115, 0),
(116, 0),
(117, 0),
(118, 0),
(119, 0),
(120, 0),
(121, 0),
(123, 0),
(126, 0),
(127, 0),
(128, 0),
(130, 0),
(131, 0),
(132, 0),
(133, 0),
(135, 0),
(137, 0),
(140, 0),
(142, 0),
(143, 0),
(144, 0),
(145, 0),
(146, 0),
(147, 0),
(148, 0),
(149, 0),
(151, 0),
(152, 0),
(154, 0),
(156, 0),
(158, 0),
(159, 0),
(160, 0),
(162, 0),
(197, 0),
(217, 0),
(222, 0),
(226, 0),
(227, 1),
(228, 1),
(229, 1),
(230, 1),
(231, 1),
(232, 1),
(233, 1),
(234, 1),
(235, 1),
(236, 1),
(237, 1),
(239, 1),
(240, 1),
(241, 1),
(242, 1),
(243, 1),
(244, 1),
(245, 1),
(246, 1),
(247, 1),
(248, 1),
(249, 1),
(250, 1),
(251, 1),
(252, 1),
(253, 1),
(254, 1),
(255, 1),
(256, 1),
(257, 1),
(258, 1),
(259, 1),
(260, 1),
(261, 1),
(262, 1),
(263, 1),
(264, 1),
(265, 1),
(266, 0),
(267, 0),
(268, 0),
(269, 0),
(270, 0),
(271, 0),
(272, 0),
(273, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `FA17_dates`
-- (See below for the actual view)
--
CREATE TABLE `FA17_dates` (
`start` datetime
,`end` datetime
,`title` varchar(60)
,`event_id` bigint(20)
,`group` int(11)
,`back_color` varchar(7)
,`font_color` varchar(7)
);

-- --------------------------------------------------------

--
-- Table structure for table `FA17_events`
--

CREATE TABLE `FA17_events` (
  `event_id` int(11) NOT NULL,
  `event_title` varchar(60) NOT NULL,
  `event_description` varchar(200) NOT NULL,
  `event_start_date` datetime NOT NULL,
  `event_end_date` datetime NOT NULL,
  `event_bg_color` varchar(7) DEFAULT '#0000ff',
  `event_ft_color` varchar(7) DEFAULT '#ffffff'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `FA17_exceptions`
--

CREATE TABLE `FA17_exceptions` (
  `excptn_id` int(11) NOT NULL,
  `excptn_name` varchar(60) NOT NULL,
  `excptn_type` int(11) NOT NULL,
  `excptn_value` decimal(5,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FA17_exceptions`
--

INSERT INTO `FA17_exceptions` (`excptn_id`, `excptn_name`, `excptn_type`, `excptn_value`) VALUES
(1, 'FULL AG', 1, '10.00'),
(2, '1/2 AG', 1, '5.00'),
(3, 'FULL AE', 2, '2.00');

-- --------------------------------------------------------

--
-- Table structure for table `FA17_exception_grants`
--

CREATE TABLE `FA17_exception_grants` (
  `grant_id` int(11) NOT NULL,
  `excptn_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FA17_exception_grants`
--

INSERT INTO `FA17_exception_grants` (`grant_id`, `excptn_id`, `pstu_id`) VALUES
(86, 1, 5),
(32, 1, 9),
(20, 1, 10),
(24, 1, 13),
(14, 1, 17),
(16, 1, 18),
(33, 1, 21),
(17, 1, 22),
(19, 1, 23),
(70, 1, 30),
(40, 1, 31),
(34, 1, 33),
(22, 1, 34),
(37, 1, 37),
(31, 1, 40),
(23, 1, 43),
(35, 1, 44),
(25, 1, 47),
(12, 1, 48),
(68, 1, 49),
(3, 1, 50),
(15, 1, 53),
(66, 1, 59),
(30, 1, 61),
(5, 1, 67),
(69, 1, 68),
(21, 1, 72),
(49, 1, 73),
(48, 1, 75),
(62, 1, 78),
(39, 1, 79),
(61, 1, 81),
(13, 1, 83),
(64, 1, 84),
(36, 1, 90),
(26, 1, 105),
(82, 1, 107),
(60, 1, 108),
(10, 1, 111),
(52, 1, 112),
(56, 1, 115),
(4, 1, 116),
(79, 1, 118),
(18, 1, 120),
(75, 1, 121),
(7, 1, 126),
(71, 1, 128),
(57, 1, 130),
(9, 1, 135),
(53, 1, 142),
(63, 1, 143),
(2, 1, 146),
(67, 1, 148),
(74, 1, 151),
(78, 1, 154),
(8, 1, 156),
(6, 1, 158),
(65, 1, 159),
(38, 1, 232),
(28, 1, 236),
(29, 1, 237),
(11, 1, 266),
(83, 1, 272),
(44, 2, 26),
(43, 2, 123),
(45, 2, 132),
(41, 2, 247),
(87, 2, 253),
(46, 2, 256),
(85, 3, 5),
(50, 3, 73),
(47, 3, 75),
(81, 3, 107),
(59, 3, 108),
(51, 3, 112),
(55, 3, 115),
(80, 3, 118),
(76, 3, 121),
(72, 3, 128),
(58, 3, 130),
(54, 3, 142),
(1, 3, 146),
(73, 3, 151),
(77, 3, 154),
(84, 3, 272);

-- --------------------------------------------------------

--
-- Table structure for table `FA17_fdg`
--

CREATE TABLE `FA17_fdg` (
  `pfdg_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FA17_fdg`
--

INSERT INTO `FA17_fdg` (`pfdg_id`) VALUES
(2),
(5),
(6),
(7),
(8),
(9),
(11);

-- --------------------------------------------------------

--
-- Table structure for table `FA17_fdg_attendence`
--

CREATE TABLE `FA17_fdg_attendence` (
  `pfdg_att_id` int(11) NOT NULL,
  `pfdg_report_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FA17_fdg_attendence`
--

INSERT INTO `FA17_fdg_attendence` (`pfdg_att_id`, `pfdg_report_id`, `pstu_id`) VALUES
(24, 1, 230),
(18, 1, 232),
(23, 1, 236),
(20, 1, 239),
(16, 1, 254),
(25, 1, 262),
(27, 2, 228),
(12, 2, 230),
(13, 2, 232),
(11, 2, 236),
(10, 2, 239),
(8, 2, 254),
(153, 3, 228),
(154, 3, 230),
(151, 3, 232),
(149, 3, 236),
(150, 3, 239),
(152, 3, 254),
(159, 4, 228),
(158, 4, 230),
(157, 4, 236),
(156, 4, 239),
(160, 4, 254),
(165, 5, 228),
(163, 5, 230),
(166, 5, 232),
(162, 5, 236),
(161, 5, 239),
(164, 5, 254),
(204, 6, 228),
(208, 6, 230),
(205, 6, 232),
(207, 6, 236),
(206, 6, 239),
(203, 6, 254),
(258, 8, 228),
(251, 8, 230),
(259, 8, 232),
(256, 8, 236),
(252, 8, 239),
(257, 8, 254),
(344, 9, 228),
(273, 9, 230),
(276, 9, 232),
(272, 9, 236),
(271, 9, 239),
(274, 9, 254),
(339, 10, 228),
(343, 10, 230),
(340, 10, 232),
(342, 10, 236),
(341, 10, 239),
(338, 10, 254),
(423, 11, 228),
(427, 11, 230),
(424, 11, 232),
(426, 11, 236),
(425, 11, 239),
(422, 11, 254),
(429, 12, 228),
(433, 12, 230),
(430, 12, 232),
(432, 12, 236),
(431, 12, 239),
(428, 12, 254),
(453, 14, 228),
(457, 14, 230),
(454, 14, 232),
(456, 14, 236),
(455, 14, 239),
(452, 14, 254),
(527, 15, 228),
(525, 15, 230),
(528, 15, 232),
(524, 15, 236),
(523, 15, 239),
(526, 15, 254),
(532, 16, 228),
(530, 16, 230),
(533, 16, 232),
(529, 16, 239),
(531, 16, 254),
(559, 17, 228),
(557, 17, 230),
(560, 17, 232),
(556, 17, 236),
(555, 17, 239),
(558, 17, 254),
(562, 18, 228),
(566, 18, 230),
(563, 18, 232),
(565, 18, 236),
(564, 18, 239),
(561, 18, 254),
(662, 19, 228),
(660, 19, 230),
(663, 19, 232),
(659, 19, 236),
(658, 19, 239),
(661, 19, 254),
(665, 20, 228),
(669, 20, 230),
(666, 20, 232),
(668, 20, 236),
(667, 20, 239),
(664, 20, 254),
(759, 21, 228),
(757, 21, 230),
(760, 21, 232),
(756, 21, 236),
(755, 21, 239),
(758, 21, 254),
(765, 23, 228),
(763, 23, 230),
(766, 23, 232),
(762, 23, 236),
(761, 23, 239),
(764, 23, 254),
(807, 24, 228),
(805, 24, 230),
(808, 24, 232),
(804, 24, 236),
(803, 24, 239),
(806, 24, 254),
(813, 25, 228),
(811, 25, 230),
(814, 25, 232),
(810, 25, 236),
(809, 25, 239),
(812, 25, 254),
(911, 26, 228),
(909, 26, 230),
(912, 26, 232),
(908, 26, 236),
(907, 26, 239),
(910, 26, 254),
(917, 27, 228),
(915, 27, 230),
(918, 27, 232),
(914, 27, 236),
(913, 27, 239),
(916, 27, 254),
(923, 28, 228),
(921, 28, 230),
(924, 28, 232),
(920, 28, 236),
(919, 28, 239),
(922, 28, 254),
(14, 29, 233),
(17, 29, 242),
(26, 29, 244),
(21, 29, 249),
(22, 29, 251),
(15, 29, 257),
(19, 29, 261),
(34, 30, 233),
(29, 30, 242),
(32, 30, 244),
(28, 30, 249),
(33, 30, 251),
(31, 30, 257),
(30, 30, 261),
(60, 31, 233),
(66, 31, 242),
(62, 31, 244),
(63, 31, 249),
(61, 31, 251),
(64, 31, 257),
(65, 31, 261),
(108, 32, 233),
(110, 32, 242),
(109, 32, 244),
(107, 32, 249),
(106, 32, 251),
(111, 32, 257),
(105, 32, 261),
(172, 33, 233),
(169, 33, 242),
(170, 33, 244),
(171, 33, 249),
(167, 33, 251),
(173, 33, 257),
(168, 33, 261),
(213, 34, 233),
(211, 34, 242),
(214, 34, 244),
(209, 34, 249),
(212, 34, 257),
(210, 34, 261),
(226, 35, 233),
(222, 35, 242),
(224, 35, 244),
(221, 35, 249),
(220, 35, 251),
(225, 35, 257),
(223, 35, 261),
(262, 36, 233),
(264, 36, 242),
(263, 36, 244),
(261, 36, 249),
(260, 36, 251),
(270, 36, 257),
(269, 36, 261),
(311, 37, 233),
(313, 37, 242),
(308, 37, 244),
(312, 37, 249),
(310, 37, 251),
(309, 37, 257),
(314, 37, 261),
(317, 38, 233),
(325, 38, 242),
(315, 38, 244),
(323, 38, 249),
(316, 38, 251),
(324, 38, 257),
(377, 39, 233),
(376, 39, 242),
(375, 39, 244),
(378, 39, 249),
(380, 39, 251),
(379, 39, 257),
(381, 39, 261),
(416, 40, 233),
(420, 40, 242),
(419, 40, 244),
(418, 40, 249),
(421, 40, 251),
(417, 40, 257),
(415, 40, 261),
(486, 43, 242),
(484, 43, 244),
(492, 43, 249),
(485, 43, 251),
(487, 43, 257),
(488, 43, 261),
(550, 45, 233),
(548, 45, 242),
(553, 45, 244),
(546, 45, 249),
(549, 45, 251),
(554, 45, 257),
(547, 45, 261),
(636, 46, 233),
(634, 46, 242),
(633, 46, 244),
(639, 46, 249),
(635, 46, 251),
(637, 46, 257),
(638, 46, 261),
(643, 47, 233),
(641, 47, 242),
(645, 47, 244),
(642, 47, 249),
(640, 47, 251),
(644, 47, 257),
(630, 48, 233),
(646, 48, 242),
(632, 48, 244),
(649, 48, 249),
(631, 48, 251),
(648, 48, 257),
(647, 48, 261),
(703, 49, 233),
(699, 49, 242),
(702, 49, 244),
(698, 49, 249),
(704, 49, 251),
(700, 49, 257),
(701, 49, 261),
(705, 50, 242),
(709, 50, 244),
(707, 50, 249),
(706, 50, 257),
(708, 50, 261),
(787, 51, 233),
(791, 51, 242),
(788, 51, 244),
(790, 51, 251),
(789, 51, 257),
(786, 51, 261),
(794, 52, 233),
(792, 52, 242),
(796, 52, 249),
(793, 52, 251),
(795, 52, 261),
(39, 54, 227),
(35, 54, 237),
(37, 54, 243),
(38, 54, 246),
(36, 54, 263),
(40, 54, 264),
(73, 55, 227),
(75, 55, 237),
(72, 55, 243),
(74, 55, 246),
(71, 55, 263),
(76, 55, 264),
(190, 56, 227),
(188, 56, 237),
(187, 56, 243),
(189, 56, 246),
(186, 56, 263),
(191, 56, 264),
(197, 57, 227),
(196, 57, 237),
(193, 57, 243),
(195, 57, 246),
(192, 57, 263),
(194, 57, 264),
(236, 58, 227),
(235, 58, 237),
(233, 58, 243),
(237, 58, 246),
(232, 58, 263),
(234, 58, 264),
(330, 61, 227),
(331, 61, 237),
(327, 61, 243),
(329, 61, 246),
(326, 61, 263),
(328, 61, 264),
(390, 62, 227),
(393, 62, 237),
(389, 62, 243),
(392, 62, 246),
(388, 62, 263),
(391, 62, 264),
(402, 64, 227),
(405, 64, 237),
(401, 64, 243),
(404, 64, 246),
(400, 64, 263),
(403, 64, 264),
(467, 66, 227),
(466, 66, 237),
(463, 66, 243),
(464, 66, 246),
(462, 66, 263),
(465, 66, 264),
(508, 67, 227),
(510, 67, 237),
(507, 67, 243),
(509, 67, 246),
(506, 67, 263),
(511, 67, 264),
(503, 68, 227),
(502, 68, 237),
(501, 68, 243),
(505, 68, 246),
(500, 68, 263),
(504, 68, 264),
(535, 69, 227),
(536, 69, 237),
(534, 69, 243),
(537, 69, 246),
(599, 70, 227),
(600, 70, 237),
(597, 70, 243),
(596, 70, 263),
(598, 70, 264),
(627, 72, 227),
(629, 72, 237),
(625, 72, 243),
(628, 72, 246),
(624, 72, 263),
(626, 72, 264),
(691, 73, 227),
(690, 73, 237),
(688, 73, 243),
(689, 73, 246),
(687, 73, 263),
(753, 74, 227),
(754, 74, 237),
(750, 74, 243),
(752, 74, 246),
(749, 74, 263),
(751, 74, 264),
(774, 75, 227),
(776, 75, 237),
(777, 75, 243),
(775, 75, 246),
(840, 79, 227),
(842, 79, 237),
(839, 79, 243),
(841, 79, 246),
(838, 79, 263),
(843, 79, 264),
(835, 80, 237),
(837, 80, 246),
(834, 80, 263),
(836, 80, 264),
(879, 81, 227),
(877, 81, 237),
(876, 81, 243),
(878, 81, 246),
(875, 81, 263),
(880, 81, 264),
(927, 82, 246),
(926, 82, 263),
(925, 82, 264),
(47, 83, 235),
(42, 83, 247),
(46, 83, 250),
(43, 83, 253),
(44, 83, 256),
(45, 83, 260),
(52, 84, 235),
(48, 84, 247),
(53, 84, 250),
(49, 84, 253),
(51, 84, 256),
(50, 84, 260),
(59, 85, 235),
(54, 85, 247),
(58, 85, 250),
(55, 85, 253),
(56, 85, 256),
(57, 85, 260),
(69, 86, 235),
(70, 86, 250),
(68, 86, 256),
(67, 86, 260),
(148, 87, 235),
(143, 87, 247),
(146, 87, 250),
(144, 87, 253),
(147, 87, 256),
(145, 87, 260),
(202, 88, 235),
(198, 88, 247),
(201, 88, 250),
(200, 88, 256),
(199, 88, 260),
(216, 89, 247),
(218, 89, 250),
(215, 89, 253),
(217, 89, 256),
(219, 89, 260),
(230, 90, 235),
(227, 90, 247),
(231, 90, 250),
(228, 90, 256),
(229, 90, 260),
(278, 91, 235),
(280, 91, 247),
(282, 91, 250),
(277, 91, 253),
(281, 91, 256),
(279, 91, 260),
(334, 92, 235),
(332, 92, 247),
(336, 92, 250),
(337, 92, 256),
(333, 92, 260),
(385, 93, 235),
(382, 93, 247),
(386, 93, 250),
(387, 93, 253),
(384, 93, 256),
(383, 93, 260),
(414, 94, 235),
(413, 94, 250),
(412, 94, 260),
(460, 96, 235),
(461, 96, 250),
(458, 96, 256),
(459, 96, 260),
(516, 97, 235),
(512, 97, 247),
(515, 97, 250),
(514, 97, 253),
(517, 97, 256),
(513, 97, 260),
(519, 98, 235),
(520, 98, 247),
(522, 98, 250),
(518, 98, 256),
(521, 98, 260),
(576, 99, 235),
(574, 99, 247),
(575, 99, 250),
(572, 99, 253),
(577, 99, 256),
(573, 99, 260),
(571, 100, 235),
(567, 100, 247),
(570, 100, 250),
(569, 100, 256),
(568, 100, 260),
(680, 101, 235),
(676, 101, 247),
(678, 101, 250),
(675, 101, 253),
(677, 101, 256),
(679, 101, 260),
(673, 102, 235),
(670, 102, 247),
(674, 102, 250),
(671, 102, 256),
(672, 102, 260),
(685, 103, 235),
(683, 103, 247),
(686, 103, 250),
(681, 103, 253),
(682, 103, 256),
(684, 103, 260),
(769, 104, 235),
(767, 104, 256),
(768, 104, 260),
(771, 105, 235),
(772, 105, 250),
(770, 105, 253),
(773, 105, 260),
(800, 106, 235),
(797, 106, 250),
(801, 106, 256),
(802, 106, 260),
(823, 108, 235),
(822, 108, 250),
(821, 108, 256),
(824, 108, 260),
(826, 109, 235),
(825, 109, 250),
(827, 109, 260),
(80, 110, 229),
(82, 110, 240),
(77, 110, 252),
(78, 110, 255),
(79, 110, 259),
(81, 110, 265),
(87, 111, 229),
(88, 111, 240),
(83, 111, 252),
(84, 111, 255),
(86, 111, 259),
(85, 111, 265),
(95, 112, 229),
(89, 112, 240),
(92, 112, 252),
(93, 112, 255),
(94, 112, 259),
(91, 112, 265),
(103, 113, 229),
(101, 113, 240),
(100, 113, 252),
(104, 113, 255),
(102, 113, 259),
(96, 113, 265),
(613, 114, 229),
(614, 114, 240),
(616, 114, 252),
(615, 114, 255),
(612, 114, 259),
(611, 114, 265),
(182, 115, 229),
(185, 115, 252),
(184, 115, 255),
(180, 115, 259),
(183, 115, 265),
(240, 118, 229),
(243, 118, 240),
(242, 118, 252),
(239, 118, 255),
(241, 118, 259),
(238, 118, 265),
(248, 119, 229),
(247, 119, 240),
(250, 119, 252),
(244, 119, 255),
(249, 119, 259),
(246, 119, 262),
(245, 119, 265),
(290, 120, 229),
(288, 120, 240),
(292, 120, 252),
(291, 120, 255),
(289, 120, 259),
(283, 120, 265),
(298, 121, 229),
(296, 121, 240),
(297, 121, 252),
(306, 121, 255),
(294, 121, 259),
(305, 121, 262),
(295, 121, 265),
(398, 122, 229),
(399, 122, 240),
(396, 122, 252),
(395, 122, 255),
(397, 122, 259),
(394, 122, 265),
(409, 123, 229),
(410, 123, 240),
(407, 123, 252),
(411, 123, 255),
(408, 123, 259),
(406, 123, 262),
(470, 125, 229),
(477, 125, 240),
(475, 125, 252),
(476, 125, 255),
(469, 125, 259),
(468, 125, 265),
(482, 126, 229),
(483, 126, 240),
(480, 126, 252),
(479, 126, 255),
(481, 126, 259),
(478, 126, 265),
(494, 127, 229),
(498, 127, 240),
(497, 127, 252),
(499, 127, 255),
(493, 127, 259),
(496, 127, 262),
(495, 127, 265),
(539, 128, 229),
(541, 128, 240),
(543, 128, 252),
(542, 128, 255),
(538, 128, 259),
(545, 128, 265),
(621, 129, 229),
(617, 129, 240),
(622, 129, 252),
(623, 129, 255),
(620, 129, 259),
(619, 129, 262),
(618, 129, 265),
(602, 130, 229),
(608, 130, 240),
(607, 130, 252),
(606, 130, 255),
(601, 130, 259),
(609, 130, 265),
(652, 131, 229),
(654, 131, 240),
(653, 131, 252),
(655, 131, 255),
(651, 131, 259),
(650, 131, 265),
(696, 132, 229),
(697, 132, 240),
(694, 132, 252),
(693, 132, 255),
(695, 132, 259),
(692, 132, 265),
(779, 135, 229),
(781, 135, 240),
(782, 135, 252),
(784, 135, 255),
(783, 135, 259),
(780, 135, 262),
(785, 135, 265),
(818, 137, 229),
(819, 137, 240),
(820, 137, 252),
(816, 137, 255),
(817, 137, 259),
(815, 137, 265),
(882, 138, 229),
(887, 138, 240),
(883, 138, 252),
(886, 138, 255),
(881, 138, 259),
(885, 138, 262),
(884, 138, 265),
(114, 139, 231),
(116, 139, 234),
(117, 139, 241),
(113, 139, 245),
(115, 139, 248),
(112, 139, 258),
(121, 140, 231),
(126, 140, 234),
(119, 140, 241),
(120, 140, 245),
(122, 140, 248),
(118, 140, 258),
(130, 141, 231),
(128, 141, 234),
(127, 141, 241),
(134, 141, 245),
(129, 141, 248),
(135, 141, 258),
(136, 142, 231),
(142, 142, 234),
(139, 142, 241),
(138, 142, 245),
(141, 142, 248),
(137, 142, 258),
(174, 143, 231),
(175, 143, 234),
(177, 143, 241),
(176, 143, 248),
(179, 143, 258),
(346, 144, 231),
(347, 144, 234),
(350, 144, 241),
(349, 144, 245),
(348, 144, 248),
(345, 144, 258),
(353, 145, 231),
(355, 145, 234),
(352, 145, 241),
(357, 145, 245),
(351, 145, 248),
(354, 145, 258),
(360, 146, 231),
(361, 146, 234),
(362, 146, 241),
(364, 146, 245),
(359, 146, 248),
(363, 146, 258),
(372, 147, 231),
(367, 147, 234),
(369, 147, 241),
(368, 147, 245),
(366, 147, 248),
(373, 147, 258),
(435, 150, 231),
(436, 150, 234),
(438, 150, 241),
(439, 150, 245),
(437, 150, 248),
(434, 150, 258),
(448, 151, 231),
(450, 151, 234),
(451, 151, 241),
(446, 151, 245),
(447, 151, 248),
(449, 151, 258),
(440, 152, 231),
(442, 152, 234),
(445, 152, 241),
(443, 152, 245),
(441, 152, 248),
(444, 152, 258),
(578, 153, 231),
(581, 153, 234),
(583, 153, 241),
(580, 153, 245),
(579, 153, 248),
(582, 153, 258),
(587, 154, 231),
(585, 154, 234),
(588, 154, 241),
(586, 154, 245),
(584, 154, 248),
(589, 154, 258),
(591, 155, 231),
(595, 155, 234),
(592, 155, 241),
(594, 155, 245),
(590, 155, 248),
(593, 155, 258),
(726, 157, 231),
(729, 157, 234),
(733, 157, 241),
(732, 157, 245),
(731, 157, 248),
(734, 157, 258),
(735, 158, 231),
(739, 158, 234),
(740, 158, 241),
(741, 158, 245),
(738, 158, 248),
(742, 158, 258),
(745, 159, 231),
(746, 159, 234),
(748, 159, 241),
(743, 159, 245),
(747, 159, 248),
(744, 159, 258),
(854, 161, 231),
(850, 161, 234),
(853, 161, 241),
(852, 161, 245),
(851, 161, 248),
(849, 161, 258),
(846, 162, 231),
(845, 162, 234),
(844, 162, 241),
(847, 162, 248),
(848, 162, 258),
(711, 163, 234),
(712, 163, 241),
(710, 163, 245),
(713, 163, 258),
(725, 164, 231),
(722, 164, 234),
(724, 164, 241),
(723, 164, 245),
(721, 164, 248),
(720, 164, 258),
(715, 166, 231),
(714, 166, 234),
(718, 166, 241),
(717, 166, 245),
(716, 166, 248),
(719, 166, 258),
(829, 167, 233),
(828, 167, 242),
(831, 167, 244),
(830, 167, 249),
(832, 167, 251),
(833, 167, 257),
(899, 169, 242),
(897, 169, 244),
(900, 169, 249),
(896, 169, 251),
(898, 169, 257),
(901, 170, 233),
(905, 170, 242),
(906, 170, 244),
(903, 170, 249),
(902, 170, 251),
(904, 170, 257),
(855, 171, 231),
(857, 171, 234),
(858, 171, 241),
(863, 171, 245),
(856, 171, 248),
(862, 171, 258),
(866, 172, 231),
(865, 172, 234),
(867, 172, 241),
(869, 172, 245),
(864, 172, 248),
(868, 172, 258),
(871, 173, 231),
(872, 173, 234),
(874, 173, 245),
(873, 173, 248),
(870, 173, 258),
(891, 174, 229),
(894, 174, 240),
(895, 174, 252),
(889, 174, 255),
(893, 174, 259),
(888, 174, 265),
(932, 175, 229),
(930, 175, 252),
(933, 175, 255),
(931, 175, 259),
(929, 175, 262),
(928, 175, 265);

-- --------------------------------------------------------

--
-- Table structure for table `FA17_fdg_event`
--

CREATE TABLE `FA17_fdg_event` (
  `pfdg_event_id` int(11) NOT NULL,
  `pfdg_event_name` varchar(60) NOT NULL,
  `pfdg_event_description` varchar(500) DEFAULT NULL,
  `pfdg_start_date` datetime NOT NULL,
  `pfdg_end_date` datetime NOT NULL,
  `pfdg_event_bg_color` varchar(7) DEFAULT '#0000ff',
  `pfdg_event_ft_color` varchar(7) DEFAULT '#ffffff'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FA17_fdg_event`
--

INSERT INTO `FA17_fdg_event` (`pfdg_event_id`, `pfdg_event_name`, `pfdg_event_description`, `pfdg_start_date`, `pfdg_end_date`, `pfdg_event_bg_color`, `pfdg_event_ft_color`) VALUES
(1, 'TEST', 'TEST', '2017-08-14 00:00:00', '2017-08-14 01:00:00', '#0000ff', '#ffffff');

-- --------------------------------------------------------

--
-- Table structure for table `FA17_fdg_event_attendence`
--

CREATE TABLE `FA17_fdg_event_attendence` (
  `pfdg_eve_att_id` int(11) NOT NULL,
  `pfdg_event_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `FA17_fdg_leaders`
--

CREATE TABLE `FA17_fdg_leaders` (
  `pfdg_leader_id` int(11) NOT NULL,
  `pfdg_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FA17_fdg_leaders`
--

INSERT INTO `FA17_fdg_leaders` (`pfdg_leader_id`, `pfdg_id`, `pstu_id`) VALUES
(1, 2, 17),
(2, 2, 23),
(3, 5, 34),
(4, 5, 43),
(5, 6, 18),
(6, 6, 31),
(10, 8, 9),
(11, 8, 10),
(12, 9, 21),
(13, 9, 44),
(14, 7, 22),
(15, 7, 13);

-- --------------------------------------------------------

--
-- Table structure for table `FA17_fdg_members`
--

CREATE TABLE `FA17_fdg_members` (
  `pfdg_member_id` int(11) NOT NULL,
  `pfdg_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FA17_fdg_members`
--

INSERT INTO `FA17_fdg_members` (`pfdg_member_id`, `pfdg_id`, `pstu_id`) VALUES
(2, 7, 254),
(4, 7, 239),
(5, 7, 228),
(6, 7, 236),
(7, 7, 230),
(8, 7, 232),
(9, 8, 248),
(10, 8, 241),
(11, 8, 258),
(12, 8, 245),
(13, 8, 234),
(14, 8, 231),
(15, 5, 251),
(16, 5, 249),
(17, 5, 257),
(18, 5, 244),
(19, 5, 233),
(20, 5, 242),
(21, 5, 261),
(22, 2, 253),
(23, 2, 247),
(24, 2, 250),
(25, 2, 260),
(26, 2, 235),
(27, 2, 256),
(28, 6, 263),
(29, 6, 227),
(33, 6, 237),
(34, 6, 243),
(35, 6, 246),
(36, 9, 259),
(37, 9, 265),
(38, 9, 255),
(39, 9, 240),
(40, 9, 229),
(41, 9, 252),
(42, 6, 264),
(43, 9, 262);

-- --------------------------------------------------------

--
-- Table structure for table `FA17_fdg_points`
--

CREATE TABLE `FA17_fdg_points` (
  `pfdg_points_id` int(11) NOT NULL,
  `pfdg_id` int(11) NOT NULL,
  `pfdg_event_id` int(11) NOT NULL,
  `pfdg_points_points` decimal(5,1) NOT NULL DEFAULT 0.0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `FA17_fdg_reports`
--

CREATE TABLE `FA17_fdg_reports` (
  `pfdg_report_id` int(11) NOT NULL,
  `pfdg_id` int(11) NOT NULL,
  `pfdg_report_start_date` datetime NOT NULL,
  `pfdg_report_end_date` datetime NOT NULL,
  `pfdg_report_hours` decimal(5,1) DEFAULT NULL,
  `pfdg_report_description` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FA17_fdg_reports`
--

INSERT INTO `FA17_fdg_reports` (`pfdg_report_id`, `pfdg_id`, `pfdg_report_start_date`, `pfdg_report_end_date`, `pfdg_report_hours`, `pfdg_report_description`) VALUES
(1, 7, '2017-08-29 12:30:00', '2017-08-29 13:30:00', '1.0', 'This meeting our group worked on sketching and painting our poster.'),
(2, 7, '2017-08-31 12:30:00', '2017-08-31 13:30:00', '1.0', 'This meeting our group completed the sketching and painting of our poster.'),
(3, 7, '2017-09-05 12:30:00', '2017-09-05 13:30:00', '1.0', 'This meeting we began by eating some goodies and watching our old Halloween videos to celebrate Caleb\'s  Birthday. For the rest of the meeting we played Apples to Apples.'),
(4, 7, '2017-09-07 12:30:00', '2017-09-07 13:30:00', '1.0', 'This meeting we enjoyed some delicious treats from Ice Shack!!'),
(5, 7, '2017-09-12 12:30:00', '2017-09-12 13:30:00', '1.0', 'This meeting we visited some cute little critters at the Clinton County SPCA.'),
(6, 7, '2017-09-14 12:30:00', '2017-09-14 13:30:00', '1.0', 'This meeting we watched a movie and ate some popcorn in my apartment.'),
(7, 7, '2017-09-19 12:30:00', '2017-09-19 13:30:00', '1.0', 'this session has not occurred yet'),
(8, 7, '2017-09-21 12:30:00', '2017-09-21 13:30:00', '1.0', 'This meeting we played cards against humanity.'),
(9, 7, '2017-09-26 12:30:00', '2017-09-26 13:30:00', '1.0', 'This meeting we began planning our Halloween video.'),
(10, 7, '2017-09-28 12:30:00', '2017-09-28 13:30:00', '1.0', 'This meeting we met in Lower Bentley for lunch and the planning of our halloween video.'),
(11, 7, '2017-10-03 12:30:00', '2017-10-03 13:30:00', '1.0', 'This meeting we worked on our Halloween video and watched the dance videos from FDG wars'),
(12, 7, '2017-10-05 12:30:00', '2017-10-05 13:30:00', '1.0', 'This meeting we finished all of the planning for our Halloween video'),
(14, 7, '2017-10-12 12:30:00', '2017-10-12 13:30:00', '1.0', 'This meeting we began filming our Halloween video.'),
(15, 7, '2017-10-17 12:30:00', '2017-10-17 13:30:00', '1.0', 'This meeting we worked on our Halloween video.'),
(16, 7, '2017-10-19 12:30:00', '2017-10-19 13:30:00', '1.0', 'This meeting we planned how to carve our pumpkin and ate fall treats.'),
(17, 7, '2017-10-24 12:30:00', '2017-10-24 13:30:00', '1.0', 'This meeting we finished our video! Be prepared for a great work of art.'),
(18, 7, '2017-10-26 12:30:00', '2017-10-26 13:30:00', '1.0', 'This meeting we carved our pumpkin.'),
(19, 7, '2017-10-31 12:30:00', '2017-10-31 13:30:00', '1.0', 'This FDG we went to avenue.'),
(20, 7, '2017-11-02 12:30:00', '2017-11-02 13:30:00', '1.0', 'This meeting we had a study session in the library.'),
(21, 7, '2017-11-07 12:30:00', '2017-11-07 13:30:00', '1.0', 'This meeting we played board games in the honors house.'),
(23, 7, '2017-11-09 12:30:00', '2017-11-09 13:30:00', '1.0', 'This meeting we studied at the library'),
(24, 7, '2017-11-14 12:30:00', '2017-11-14 13:30:00', '1.0', 'This meeting we watched some performances at Avenue.'),
(25, 7, '2017-11-16 12:30:00', '2017-11-16 13:30:00', '1.0', 'This meeting we went to ice shack.'),
(26, 7, '2017-11-20 18:00:00', '2017-11-20 19:00:00', '1.0', 'This meeting we ate dinner together in Bentley.'),
(27, 7, '2017-11-28 12:30:00', '2017-11-28 13:30:00', '1.0', 'This meeting we worked on our story and picked names for our secret santa!'),
(28, 7, '2017-11-30 12:30:00', '2017-11-30 13:30:00', '1.0', 'This meeting we finished our story.'),
(29, 5, '2017-08-28 18:15:00', '2017-08-28 19:15:00', '1.0', 'We worked on the poster'),
(30, 5, '2017-08-31 18:15:00', '2017-08-31 19:15:00', '1.0', 'We worked on the poster.'),
(31, 5, '2017-09-05 18:15:00', '2017-09-05 19:15:00', '1.0', 'We went to the rec center and rock climbed and played volleyball'),
(32, 5, '2017-09-07 18:15:00', '2017-09-07 19:15:00', '1.0', 'We went to ice shack'),
(33, 5, '2017-09-12 18:15:00', '2017-09-12 19:15:00', '1.0', 'We went on a hike to see a waterfall and to see the reservoir.'),
(34, 5, '2017-09-14 18:15:00', '2017-09-14 19:15:00', '1.0', 'went to the PUB and played ping pong and Mario cart'),
(35, 5, '2017-09-19 18:15:00', '2017-09-19 19:15:00', '1.0', 'We went to Upper Bentley for supper'),
(36, 5, '2017-09-21 18:15:00', '2017-09-21 19:15:00', '1.0', 'we went to the homecoming golf cart parade and played lawn games'),
(37, 5, '2017-09-26 18:15:00', '2017-09-26 19:15:00', '1.0', 'We colored and studied in the honors house'),
(38, 5, '2017-09-28 18:15:00', '2017-09-28 19:15:00', '1.0', 'We made cookies and worked on our movie script at fairview'),
(39, 5, '2017-10-03 18:15:00', '2017-10-03 19:15:00', '1.0', 'we worked on our Halloween video'),
(40, 5, '2017-10-05 18:15:00', '2017-10-05 19:15:00', '1.0', 'We worked on putting together the beginning of our movie and talked about what we needed to film next'),
(41, 5, '2017-10-10 18:15:00', '2017-10-10 19:15:00', '1.0', 'this meeting has not occured yet'),
(42, 5, '2017-10-12 18:15:00', '2017-10-12 19:15:00', '1.0', 'thi s meeting has not occured yet'),
(43, 5, '2017-10-17 18:15:00', '2017-10-17 19:15:00', '1.0', 'We recorded more of our video'),
(44, 5, '2017-10-19 18:15:00', '2017-10-19 19:15:00', '1.0', 'We painted our pumpkin for the Halloween party'),
(45, 5, '2017-10-24 18:15:00', '2017-10-24 19:15:00', '1.0', 'we finished up recording and then spent some time at the fall fest in the commons'),
(46, 5, '2017-10-26 18:15:00', '2017-10-26 19:15:00', '1.0', 'we finished the pumpkin'),
(47, 5, '2017-10-31 18:15:00', '2017-10-31 19:15:00', '1.0', 'We watched Hocus Pocus'),
(48, 5, '2017-11-02 18:15:00', '2017-11-02 19:15:00', '1.0', 'We finished Hocus Pocus'),
(49, 5, '2017-11-07 18:15:00', '2017-11-07 19:15:00', '1.0', 'We went to the Mr and Mrs Honors pagent'),
(50, 5, '2017-11-09 18:15:00', '2017-11-09 19:15:00', '1.0', 'we talked about scheduling'),
(51, 5, '2017-11-14 18:15:00', '2017-11-14 19:15:00', '1.0', 'we worked on the board upstairs'),
(52, 5, '2017-11-16 18:15:00', '2017-11-16 19:15:00', '1.0', 'We studied and played games at the house'),
(54, 6, '2017-09-05 18:00:00', '2017-09-05 19:00:00', '1.0', 'We worked on our FDG poster and talked about our highs and lows'),
(55, 6, '2017-09-07 18:00:00', '2017-09-07 19:00:00', '1.0', 'We finished our poster and started making plans for the upcoming weeks'),
(56, 6, '2017-09-12 18:30:00', '2017-09-12 19:30:00', '1.0', 'We went on a nature hike on the trail on campus'),
(57, 6, '2017-09-14 18:45:00', '2017-09-14 19:45:00', '1.0', 'We went to the honors house and watched Despicable Me'),
(58, 6, '2017-09-19 18:00:00', '2017-09-19 19:00:00', '1.0', 'We drove over to Bobby\'s riverlot and had a campfire'),
(59, 6, '2017-09-21 20:00:00', '2017-09-21 21:00:00', '1.0', 'We went to the hypnotist show as a group'),
(61, 6, '2017-09-28 18:00:00', '2017-09-28 20:00:00', '2.0', 'We held a two hour meet and drove up to hyner'),
(62, 6, '2017-10-03 18:30:00', '2017-10-03 19:30:00', '1.0', 'We had a study session in fairview'),
(64, 6, '2017-10-05 19:00:00', '2017-10-05 20:00:00', '1.0', 'Our FDG went to the pif together'),
(66, 6, '2017-10-12 18:00:00', '2017-10-12 19:00:00', '1.0', 'We talked about what we wanted to do for our Halloween video'),
(67, 6, '2017-10-17 18:00:00', '2017-10-17 19:00:00', '1.0', 'we discusses our video some more and came up for a plan for filming t'),
(68, 6, '2017-10-19 18:00:00', '2017-10-19 19:00:00', '1.0', 'We continued to work on our Halloween video'),
(69, 6, '2017-10-24 18:00:00', '2017-10-24 19:00:00', '1.0', 'we came up with ideas for our pumpkin as well as worked on our bulletin board'),
(70, 6, '2017-10-26 18:00:00', '2017-10-26 19:00:00', '1.0', 'today we worked on our bulletin board and carved/ decorated or pumpkins'),
(72, 6, '2017-11-02 19:00:00', '2017-11-02 21:00:00', '2.0', 'We went to the LHU unity presentation'),
(73, 6, '2017-11-07 19:00:00', '2017-11-07 20:00:00', '1.0', 'We went to the honors Mr and Mrs Pageant'),
(74, 6, '2017-11-09 19:00:00', '2017-11-09 20:00:00', '1.0', 'Went to the sports date auction'),
(75, 6, '2017-11-14 18:00:00', '2017-11-14 19:00:00', '1.0', 'Had a study session in Fairview'),
(76, 6, '2017-11-16 18:00:00', '2017-11-16 19:00:00', '1.0', 'Went to Ice Shack as an FDG'),
(79, 6, '2017-11-28 17:00:00', '2017-11-28 19:00:00', '2.0', 'Hung out at the honors house and caught up/talked about our Thanksgiving break'),
(80, 6, '2017-11-30 18:00:00', '2017-11-30 19:00:00', '1.0', 'Went to the sports hosted pong tournament'),
(81, 6, '2017-12-05 18:30:00', '2017-12-05 19:30:00', '1.0', 'Went to the Honors Christmas Party'),
(82, 6, '2017-12-07 18:00:00', '2017-12-07 19:00:00', '1.0', 'went to wing night at Dutch Haven'),
(83, 2, '2017-08-29 12:30:00', '2017-08-29 13:30:00', '1.0', 'First meeting, worked on poster'),
(84, 2, '2017-08-31 12:30:00', '2017-08-31 13:30:00', '1.0', 'Finished poster'),
(85, 2, '2017-09-05 12:30:00', '2017-09-05 13:30:00', '1.0', 'Played board games in Honors House'),
(86, 2, '2017-09-07 12:30:00', '2017-09-07 13:30:00', '1.0', 'Made a visit to Ice Shack'),
(87, 2, '2017-09-12 12:30:00', '2017-09-12 13:30:00', '1.0', 'We went on a walk through the club fair and by the river.'),
(88, 2, '2017-09-14 12:30:00', '2017-09-14 13:30:00', '1.0', 'We watched a movie in the honors house and played a game!'),
(89, 2, '2017-09-19 12:30:00', '2017-09-19 13:30:00', '1.0', 'We continued to watch a movie!'),
(90, 2, '2017-09-21 12:30:00', '2017-09-21 13:30:00', '1.0', 'We finished the movie!'),
(91, 2, '2017-09-26 12:30:00', '2017-09-26 13:30:00', '1.0', 'We visited the SPCA for some pet therapy!'),
(92, 2, '2017-09-28 12:30:00', '2017-09-28 13:30:00', '1.0', 'We had an ethics study session!'),
(93, 2, '2017-10-03 12:30:00', '2017-10-03 13:30:00', '1.0', 'We started to decorate the bulletin board!'),
(94, 2, '2017-10-05 12:30:00', '2017-10-05 13:30:00', '1.0', 'We finished the bulletin board!'),
(95, 2, '2017-10-10 12:30:00', '2017-10-10 13:30:00', '1.0', 'We did not meet this day due to fall break schedule.'),
(96, 2, '2017-10-12 12:30:00', '2017-10-12 13:30:00', '1.0', 'We ate lunch together and talked about video and pumpkin ideas!'),
(97, 2, '2017-10-17 12:30:00', '2017-10-17 13:30:00', '1.0', 'We started to film our Halloween video!'),
(98, 2, '2017-10-19 12:30:00', '2017-10-19 13:30:00', '1.0', 'We continued to film our Halloween video!'),
(99, 2, '2017-10-24 12:30:00', '2017-10-24 13:30:00', '1.0', 'We finished filming our video!'),
(100, 2, '2017-10-26 12:30:00', '2017-10-26 13:30:00', '1.0', 'We worked on our pumpkin!'),
(101, 2, '2017-10-31 12:30:00', '2017-10-31 13:30:00', '1.0', 'We played Apples to Apples!'),
(102, 2, '2017-11-02 12:30:00', '2017-11-02 13:30:00', '1.0', 'We took a trip to Avenue 209!'),
(103, 2, '2017-11-07 12:30:00', '2017-11-07 13:30:00', '1.0', 'We went thrift shopping for Mr./Mrs. Honors clothes!'),
(104, 2, '2017-11-09 12:30:00', '2017-11-09 13:30:00', '1.0', 'We had another ethics study session!'),
(105, 2, '2017-11-14 12:30:00', '2017-11-14 13:30:00', '1.0', 'We met at the honors house to go over scheduling and play games!'),
(106, 2, '2017-11-16 12:30:00', '2017-11-16 13:30:00', '1.0', 'We ate lunch together at Bentley!'),
(107, 2, '2017-11-21 12:30:00', '2017-11-21 13:30:00', '1.0', 'We did not meet this day'),
(108, 2, '2017-11-28 12:30:00', '2017-11-28 13:30:00', '1.0', 'We went shopping for Adopt-a-Family gifts!'),
(109, 2, '2017-11-30 12:30:00', '2017-11-30 13:30:00', '1.0', 'We wrote our Christmas story! This was our last meeting of the semester.'),
(110, 9, '2017-08-29 16:30:00', '2017-08-29 17:30:00', '1.0', 'We worked on the poster'),
(111, 9, '2017-08-31 16:30:00', '2017-08-31 17:30:00', '1.0', 'We worked on the poster'),
(112, 9, '2017-09-05 16:45:00', '2017-09-05 17:45:00', '1.0', 'We went for a hike'),
(113, 9, '2017-09-07 16:30:00', '2017-09-07 17:30:00', '1.0', 'We went rock climbing at the REC and played volleyball'),
(114, 9, '2017-09-12 16:30:00', '2017-09-12 17:30:00', '1.0', 'Ice Shack'),
(115, 9, '2017-09-14 16:30:00', '2017-09-14 17:30:00', '1.0', 'Study session'),
(118, 9, '2017-09-19 16:30:00', '2017-09-19 17:30:00', '1.0', 'We played games at the honors house'),
(119, 9, '2017-09-21 16:30:00', '2017-09-21 17:30:00', '1.0', 'We planned for our Halloween video'),
(120, 9, '2017-09-26 16:30:00', '2017-09-26 17:30:00', '1.0', 'We began to watch a movie'),
(121, 9, '2017-09-28 16:30:00', '2017-09-28 17:30:00', '1.0', 'Study Session'),
(122, 9, '2017-10-03 16:30:00', '2017-10-03 17:30:00', '1.0', 'We finished watching a movie'),
(123, 9, '2017-10-05 16:30:00', '2017-10-05 17:30:00', '1.0', 'We met at the PIF for FDG'),
(125, 9, '2017-10-12 16:30:00', '2017-10-12 17:30:00', '1.0', 'We began to plan our video'),
(126, 9, '2017-10-17 16:30:00', '2017-10-17 17:30:00', '1.0', 'We worked on our halloween video'),
(127, 9, '2017-10-19 16:30:00', '2017-10-19 17:30:00', '1.0', 'We finished our Halloween video'),
(128, 9, '2017-10-24 16:30:00', '2017-10-24 17:30:00', '1.0', 'We worked on our pumpkin idea'),
(129, 9, '2017-10-26 16:30:00', '2017-10-26 17:30:00', '1.0', 'We went to the pumpkin patch'),
(130, 9, '2017-10-31 16:30:00', '2017-10-31 17:30:00', '1.0', 'We carved our own pumpkins'),
(131, 9, '2017-11-02 16:30:00', '2017-11-02 17:30:00', '1.0', 'We went to Ice Shack'),
(132, 9, '2017-11-07 18:15:00', '2017-11-07 20:15:00', '2.0', 'We went to dinner and then went to Mr. and Mrs. Honors together'),
(133, 9, '2017-11-09 16:30:00', '2017-11-09 17:30:00', '1.0', 'This session has not occurred yet'),
(135, 9, '2017-11-16 16:30:00', '2017-11-16 18:30:00', '2.0', 'We had a study session'),
(137, 9, '2017-11-28 16:30:00', '2017-11-28 17:30:00', '1.0', 'We played games in the honors couse'),
(138, 9, '2017-11-30 16:30:00', '2017-11-30 17:30:00', '1.0', 'We wrote our Christmas story'),
(139, 8, '2017-08-28 17:30:00', '2017-08-28 18:30:00', '1.0', ''),
(140, 8, '2017-08-30 17:30:00', '2017-08-30 18:30:00', '1.0', ''),
(141, 8, '2017-09-07 17:30:00', '2017-09-07 18:30:00', '1.0', ''),
(142, 8, '2017-09-11 17:30:00', '2017-09-11 18:30:00', '1.0', ''),
(143, 8, '2017-09-13 17:30:00', '2017-09-13 18:30:00', '1.0', ''),
(144, 8, '2017-09-18 17:30:00', '2017-09-18 18:30:00', '1.0', 'Attendance'),
(145, 8, '2017-09-20 17:30:00', '2017-09-20 18:30:00', '1.0', 'This meeting has not happened yet'),
(146, 8, '2017-09-25 17:30:00', '2017-09-25 18:30:00', '1.0', 'This meeting has not happened yet'),
(147, 8, '2017-09-27 17:30:00', '2017-09-27 18:30:00', '1.0', 'This meeting has not happened yet'),
(148, 8, '2017-10-02 17:30:00', '2017-10-02 18:30:00', '1.0', 'meeting complete'),
(150, 8, '2017-10-04 17:30:00', '2017-10-04 18:30:00', '1.0', 'Meeting complete'),
(151, 8, '2017-10-11 17:30:00', '2017-10-11 18:30:00', '1.0', 'meeting complete'),
(152, 8, '2017-10-09 17:30:00', '2017-10-09 18:30:00', '1.0', 'meeting complete'),
(153, 8, '2017-10-16 17:29:00', '2017-10-16 18:29:00', '1.0', 'Meeting  completed'),
(154, 8, '2017-10-18 17:29:00', '2017-10-18 18:29:00', '1.0', 'Meeting  completed'),
(155, 8, '2017-10-23 17:30:00', '2017-10-23 18:30:00', '1.0', 'Meeting completed'),
(157, 8, '2017-11-01 17:30:00', '2017-11-01 18:30:00', '1.0', 'Meeting completed'),
(158, 8, '2017-11-06 17:30:00', '2017-11-06 18:30:00', '1.0', 'Meeting completed'),
(159, 8, '2017-11-08 17:30:00', '2017-11-08 18:30:00', '1.0', 'Meeting completed'),
(161, 8, '2017-11-15 17:30:00', '2017-11-15 18:30:00', '1.0', 'Meeting completed'),
(162, 8, '2017-11-20 17:30:00', '2017-11-20 18:30:00', '1.0', 'Meeting completed'),
(163, 8, '2017-10-29 15:00:00', '2017-10-29 16:00:00', '1.0', 'Flam meeting completed'),
(164, 8, '2017-10-30 19:00:00', '2017-10-30 20:00:00', '1.0', 'flamingo meeting complete'),
(166, 8, '2017-10-29 16:00:00', '2017-10-29 17:00:00', '1.0', 'Meeting Complete'),
(167, 5, '2017-11-28 18:15:00', '2017-11-28 19:15:00', '1.0', 'we watched a movie and built a gingerbread house'),
(168, 5, '2017-11-30 18:15:00', '2017-11-30 19:15:00', '1.0', 'this meeting has not occurred'),
(169, 5, '2017-12-05 18:15:00', '2017-12-05 19:15:00', '1.0', 'we attended the Christmas Party'),
(170, 5, '2017-12-07 18:00:00', '2017-12-07 19:00:00', '1.0', 'We had a potluck in Fairview'),
(171, 8, '2017-11-27 16:00:00', '2017-11-27 17:00:00', '1.0', 'Meeting Completed'),
(172, 8, '2017-11-29 18:00:00', '2017-11-29 19:00:00', '1.0', 'meeting completed'),
(173, 8, '2017-12-04 18:00:00', '2017-12-04 19:00:00', '1.0', 'meeting completed'),
(174, 9, '2017-12-05 17:30:00', '2017-12-05 18:30:00', '1.0', 'We went to the Christmas party!'),
(175, 9, '2017-12-07 16:30:00', '2017-12-07 17:30:00', '1.0', 'We scheduled our meetings for next semester'),
(176, 7, '2017-12-05 12:30:00', '2017-12-05 13:30:00', '1.0', 'For our last meeting we had lunch together and exchanged secret santa gifts!');

-- --------------------------------------------------------

--
-- Table structure for table `FA17_pif`
--

CREATE TABLE `FA17_pif` (
  `pif_id` int(11) NOT NULL,
  `pif_start_date` datetime NOT NULL,
  `pif_end_date` datetime NOT NULL,
  `pif_title` varchar(60) NOT NULL,
  `pif_description` varchar(250) DEFAULT NULL,
  `pif_bg_color` varchar(7) DEFAULT '#0000ff',
  `pif_ft_color` varchar(7) DEFAULT '#ffffff'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FA17_pif`
--

INSERT INTO `FA17_pif` (`pif_id`, `pif_start_date`, `pif_end_date`, `pif_title`, `pif_description`, `pif_bg_color`, `pif_ft_color`) VALUES
(1, '2017-10-05 19:00:00', '2017-10-05 20:00:00', 'PIF #1', 'AE', '#0000ff', '#ffffff'),
(2, '2017-11-02 19:00:00', '2017-11-02 20:00:00', 'PIF#2', 'AE', '#0000ff', '#ffffff');

-- --------------------------------------------------------

--
-- Table structure for table `FA17_pif_stats`
--

CREATE TABLE `FA17_pif_stats` (
  `pifstat_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL,
  `pif_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FA17_pif_stats`
--

INSERT INTO `FA17_pif_stats` (`pifstat_id`, `pstu_id`, `pif_id`) VALUES
(6, 6, 1),
(62, 6, 2),
(64, 9, 2),
(15, 10, 1),
(66, 13, 2),
(68, 17, 2),
(27, 18, 1),
(72, 21, 2),
(34, 24, 1),
(75, 27, 2),
(36, 28, 1),
(37, 32, 1),
(79, 32, 2),
(40, 34, 1),
(46, 39, 1),
(48, 44, 1),
(50, 46, 1),
(51, 47, 1),
(3, 53, 1),
(4, 54, 1),
(60, 54, 2),
(5, 55, 1),
(61, 56, 2),
(13, 58, 1),
(65, 59, 2),
(19, 62, 1),
(67, 62, 2),
(26, 65, 1),
(77, 76, 2),
(78, 78, 2),
(43, 86, 1),
(44, 88, 1),
(81, 89, 2),
(88, 97, 2),
(52, 98, 1),
(83, 98, 2),
(55, 100, 1),
(56, 102, 1),
(84, 102, 2),
(57, 103, 1),
(85, 103, 2),
(1, 113, 1),
(59, 113, 2),
(71, 137, 2),
(47, 149, 1),
(82, 149, 2),
(87, 159, 2),
(32, 222, 1),
(74, 222, 2),
(42, 226, 1),
(2, 227, 1),
(7, 229, 1),
(8, 230, 1),
(63, 230, 2),
(9, 231, 1),
(10, 232, 1),
(11, 233, 1),
(12, 234, 1),
(14, 235, 1),
(16, 236, 1),
(17, 237, 1),
(18, 239, 1),
(20, 240, 1),
(21, 241, 1),
(22, 242, 1),
(23, 243, 1),
(24, 244, 1),
(69, 245, 2),
(25, 246, 1),
(70, 247, 2),
(28, 248, 1),
(29, 250, 1),
(30, 251, 1),
(31, 252, 1),
(73, 253, 2),
(33, 254, 1),
(35, 255, 1),
(76, 256, 2),
(38, 257, 1),
(39, 258, 1),
(80, 258, 2),
(41, 259, 1),
(45, 260, 1),
(49, 261, 1),
(53, 262, 1),
(54, 263, 1),
(58, 264, 1),
(86, 265, 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `FA17_stats`
-- (See below for the actual view)
--
CREATE TABLE `FA17_stats` (
`usr_fname` varchar(20)
,`usr_lname` varchar(35)
,`usr_school_id` varchar(4)
,`usr_id` int(11)
,`acad_events` decimal(29,2)
,`ags` decimal(29,2)
,`com_hours` decimal(30,2)
,`pifs` bigint(21)
,`fdg` decimal(28,2)
,`capstone` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `fa2016_academicevents`
--

CREATE TABLE `fa2016_academicevents` (
  `acad_id` int(11) NOT NULL,
  `acad_title` varchar(60) NOT NULL,
  `acad_description` varchar(200) NOT NULL,
  `acad_start_date` datetime NOT NULL,
  `acad_end_date` datetime NOT NULL,
  `acad_bg_color` varchar(7) DEFAULT '#0000ff',
  `acad_ft_color` varchar(7) DEFAULT '#ffffff'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fa2016_academicevents`
--

INSERT INTO `fa2016_academicevents` (`acad_id`, `acad_title`, `acad_description`, `acad_start_date`, `acad_end_date`, `acad_bg_color`, `acad_ft_color`) VALUES
(1, 'Documentary and Discussion', 'watch and discuss documentary', '2016-09-14 12:30:00', '2016-09-14 13:30:00', '#0000ff', '#ffffff'),
(2, 'Career Service Workshop', 'focus quiz', '2016-09-20 12:30:00', '2016-09-20 13:30:00', '#0000ff', '#ffffff'),
(3, 'International Night', 'Learn about study abroad opportunities!', '2016-09-29 19:00:00', '2016-09-29 20:00:00', '#0000ff', '#ffffff'),
(4, 'Department Roulette', 'Learn about a department on campus!', '2016-10-20 12:30:00', '2016-10-20 13:30:00', '#0000ff', '#ffffff'),
(5, 'Last Lecture Speaker Series', 'Come hear Dr. Judy Brink, a former LHU Professor, speak about her Last Lecture', '2016-11-07 19:00:00', '2016-11-07 20:00:00', '#0000ff', '#ffffff'),
(6, 'Documentary and Discussion', 'Has not happened yet', '2016-11-16 12:30:00', '2016-11-16 13:30:00', '#0000ff', '#ffffff'),
(7, 'PSECU', 'credit event', '2016-10-18 12:45:00', '2016-10-18 13:45:00', '#0000ff', '#ffffff'),
(8, 'Update #2', 'For second update', '2016-11-01 00:00:00', '2016-11-01 01:00:00', '#0000ff', '#ffffff'),
(9, 'Guest Speaker: Jeff Deist', 'Jeff Deist came and spoke', '2016-11-10 19:00:00', '2016-11-10 20:00:00', '#0000ff', '#ffffff'),
(10, 'Maddox Hafer guest reader', 'Tom Bailey came and read some of his work', '2016-11-09 19:30:00', '2016-11-09 20:30:00', '#0000ff', '#ffffff'),
(11, 'International Presentation', 'Study Abroad: The Global Marketplace and Where Itâ€™s Heading', '2016-11-16 19:00:00', '2016-11-16 20:00:00', '#0000ff', '#ffffff'),
(12, 'Dance Consort', 'Attendance and discussion of the dance concort', '2016-11-18 19:00:00', '2016-11-19 21:00:00', '#0000ff', '#ffffff'),
(13, 'Choir Show', 'Attended the Choir Show', '2016-11-18 19:00:00', '2016-11-19 20:00:00', '#0000ff', '#ffffff'),
(14, 'Capstone', 'Students Presented their capstone', '2016-12-15 19:00:00', '2016-12-15 20:30:00', '#0000ff', '#ffffff'),
(15, 'Capstone', 'Students presented their Capstone', '2016-12-08 19:00:00', '2016-12-08 20:30:00', '#0000ff', '#ffffff');

-- --------------------------------------------------------

--
-- Table structure for table `fa2016_academicevent_attendence`
--

CREATE TABLE `fa2016_academicevent_attendence` (
  `acad_att_id` int(11) NOT NULL,
  `acad_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fa2016_academicevent_attendence`
--

INSERT INTO `fa2016_academicevent_attendence` (`acad_att_id`, `acad_id`, `pstu_id`) VALUES
(27, 1, 22),
(28, 1, 44),
(31, 1, 48),
(29, 1, 103),
(30, 1, 124),
(26, 1, 146),
(44, 2, 11),
(35, 2, 14),
(50, 2, 22),
(38, 2, 23),
(47, 2, 25),
(42, 2, 29),
(34, 2, 30),
(49, 2, 34),
(37, 2, 39),
(39, 2, 43),
(48, 2, 52),
(43, 2, 65),
(46, 2, 69),
(41, 2, 83),
(45, 2, 84),
(36, 2, 91),
(52, 2, 98),
(51, 2, 108),
(32, 2, 194),
(40, 2, 202),
(33, 2, 212),
(10, 3, 5),
(11, 3, 7),
(53, 3, 8),
(155, 3, 17),
(12, 3, 18),
(14, 3, 21),
(15, 3, 22),
(16, 3, 23),
(17, 3, 25),
(18, 3, 31),
(19, 3, 32),
(20, 3, 34),
(21, 3, 39),
(25, 3, 47),
(22, 3, 48),
(24, 3, 50),
(5, 3, 73),
(6, 3, 75),
(3, 3, 127),
(4, 3, 159),
(7, 3, 161),
(1, 3, 169),
(2, 3, 194),
(8, 3, 216),
(9, 3, 217),
(143, 5, 6),
(144, 5, 10),
(145, 5, 12),
(146, 5, 26),
(147, 5, 28),
(148, 5, 29),
(149, 5, 33),
(150, 5, 35),
(151, 5, 36),
(152, 5, 40),
(153, 5, 43),
(154, 5, 49),
(116, 5, 53),
(117, 5, 54),
(118, 5, 55),
(119, 5, 56),
(120, 5, 57),
(121, 5, 58),
(122, 5, 59),
(123, 5, 66),
(124, 5, 67),
(125, 5, 68),
(127, 5, 70),
(128, 5, 72),
(129, 5, 74),
(130, 5, 80),
(131, 5, 81),
(132, 5, 88),
(133, 5, 93),
(134, 5, 95),
(135, 5, 100),
(136, 5, 102),
(137, 5, 106),
(138, 5, 109),
(139, 5, 110),
(104, 5, 111),
(105, 5, 122),
(106, 5, 126),
(107, 5, 131),
(108, 5, 134),
(109, 5, 135),
(110, 5, 137),
(111, 5, 143),
(112, 5, 148),
(113, 5, 150),
(114, 5, 154),
(115, 5, 160),
(84, 5, 162),
(85, 5, 163),
(86, 5, 165),
(87, 5, 167),
(88, 5, 172),
(89, 5, 176),
(90, 5, 177),
(91, 5, 180),
(92, 5, 183),
(93, 5, 187),
(94, 5, 188),
(95, 5, 190),
(96, 5, 192),
(97, 5, 195),
(98, 5, 196),
(99, 5, 199),
(100, 5, 205),
(101, 5, 207),
(102, 5, 211),
(140, 5, 214),
(141, 5, 216),
(142, 5, 217),
(173, 6, 12),
(174, 6, 44),
(172, 6, 182),
(73, 7, 5),
(74, 7, 8),
(75, 7, 14),
(76, 7, 24),
(77, 7, 25),
(78, 7, 31),
(79, 7, 42),
(80, 7, 43),
(81, 7, 46),
(82, 7, 52),
(64, 7, 64),
(65, 7, 69),
(66, 7, 70),
(67, 7, 84),
(68, 7, 85),
(69, 7, 86),
(70, 7, 88),
(71, 7, 90),
(72, 7, 101),
(59, 7, 114),
(60, 7, 122),
(61, 7, 125),
(62, 7, 152),
(63, 7, 156),
(54, 7, 173),
(56, 7, 176),
(57, 7, 183),
(58, 7, 199),
(156, 8, 28),
(241, 8, 31),
(242, 8, 35),
(243, 8, 58),
(83, 8, 107),
(159, 9, 8),
(160, 9, 16),
(161, 9, 18),
(163, 9, 26),
(162, 9, 50),
(170, 9, 60),
(171, 9, 82),
(164, 9, 131),
(165, 9, 134),
(166, 9, 139),
(167, 9, 140),
(168, 9, 151),
(169, 9, 152),
(157, 9, 178),
(158, 9, 192),
(195, 10, 5),
(196, 10, 6),
(197, 10, 9),
(198, 10, 10),
(199, 10, 11),
(200, 10, 13),
(201, 10, 14),
(202, 10, 17),
(203, 10, 21),
(204, 10, 24),
(205, 10, 26),
(206, 10, 28),
(207, 10, 29),
(208, 10, 31),
(209, 10, 36),
(210, 10, 37),
(211, 10, 40),
(212, 10, 41),
(213, 10, 43),
(214, 10, 46),
(215, 10, 48),
(216, 10, 49),
(217, 10, 52),
(189, 10, 81),
(190, 10, 86),
(191, 10, 90),
(192, 10, 106),
(193, 10, 108),
(184, 10, 116),
(185, 10, 123),
(186, 10, 128),
(187, 10, 132),
(188, 10, 145),
(175, 10, 167),
(176, 10, 171),
(177, 10, 172),
(178, 10, 178),
(240, 10, 179),
(179, 10, 189),
(180, 10, 191),
(181, 10, 203),
(182, 10, 206),
(183, 10, 209),
(194, 10, 214),
(234, 11, 6),
(235, 11, 9),
(236, 11, 13),
(237, 11, 21),
(238, 11, 47),
(239, 11, 51),
(231, 11, 63),
(232, 11, 82),
(233, 11, 110),
(230, 11, 158),
(229, 11, 159),
(256, 12, 30),
(254, 12, 32),
(245, 12, 36),
(252, 12, 37),
(261, 12, 40),
(247, 12, 51),
(248, 12, 63),
(263, 12, 74),
(257, 12, 83),
(246, 12, 101),
(262, 12, 111),
(255, 12, 116),
(258, 12, 143),
(260, 12, 148),
(266, 12, 154),
(250, 12, 162),
(253, 12, 168),
(251, 12, 180),
(249, 12, 205),
(264, 13, 101),
(265, 13, 168),
(288, 15, 12),
(289, 15, 37),
(290, 15, 44),
(291, 15, 45),
(292, 15, 51),
(287, 15, 89),
(282, 15, 125),
(283, 15, 127),
(284, 15, 132),
(285, 15, 144),
(286, 15, 156),
(267, 15, 166),
(268, 15, 167),
(281, 15, 172),
(269, 15, 173),
(270, 15, 177),
(272, 15, 179),
(273, 15, 187),
(274, 15, 195),
(275, 15, 198),
(276, 15, 200),
(277, 15, 202),
(278, 15, 206),
(279, 15, 212),
(280, 15, 213);

-- --------------------------------------------------------

--
-- Table structure for table `fa2016_activitygroup`
--

CREATE TABLE `fa2016_activitygroup` (
  `ag_id` int(11) NOT NULL,
  `ag_title` varchar(40) NOT NULL,
  `ag_description` varchar(500) NOT NULL,
  `ag_imagepath` varchar(30) DEFAULT NULL,
  `ag_bg_color` varchar(7) DEFAULT '#0000ff',
  `ag_ft_color` varchar(7) DEFAULT '#ffffff'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fa2016_activitygroup`
--

INSERT INTO `fa2016_activitygroup` (`ag_id`, `ag_title`, `ag_description`, `ag_imagepath`, `ag_bg_color`, `ag_ft_color`) VALUES
(2, 'Anything Goes', 'Led by Hannah Zerby & Erica Berkowitz', '', '#0000ff', '#ffffff'),
(3, 'Basics of Imaginary Writing', 'Led by Megan McKenna & Brook Wampole.  Online AG.', '', '#0000ff', '#ffffff'),
(4, 'Chicks, Flicks, and Conflicts', 'Led by Cydney Branch', '', '#0000ff', '#ffffff'),
(5, 'Color Me Crazy', 'Led by Tabitha Schappell', '', '#0000ff', '#ffffff'),
(8, 'Game of Thrones', 'Led by Roman Marijczuk', '', '#0000ff', '#ffffff'),
(13, 'Study Hour', 'Led by Chelsea Allen', '', '#0000ff', '#ffffff'),
(14, 'Study Session', 'by Roxanne Bell & Lindsey Dry', '', '#0000ff', '#ffffff'),
(15, 'Super Hero Movie Group', 'Led by Aaron Lagana & Adam Richards', '', '#0000ff', '#ffffff'),
(16, 'Walleyball', 'Led by Mary Arnold, Melissa Covert, & Adam Richards', '', '#0000ff', '#ffffff'),
(17, 'Special Events', 'Count as AGs', '', '#0000ff', '#ffffff'),
(18, 'Novel Writing', 'Led by Sam Wesnak.  Online AG', '', '#0000ff', '#ffffff'),
(19, 'UPDATE GROUP', 'This AG is used to correct statuses', '', '#0000ff', '#ffffff'),
(20, 'Rhythm Game Group', 'AG', '', '#0000ff', '#ffffff'),
(21, 'Lost', 'AG', '', '#0000ff', '#ffffff'),
(22, 'Not Just Dungeons and Dragons', 'AG', '', '#0000ff', '#ffffff'),
(24, 'Study Time', 'AG', '', '#0000ff', '#ffffff'),
(25, 'Get Outside', 'AG', '', '#0000ff', '#ffffff');

-- --------------------------------------------------------

--
-- Table structure for table `fa2016_activitygroupleaders`
--

CREATE TABLE `fa2016_activitygroupleaders` (
  `ag_leaders` int(11) NOT NULL,
  `ag_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fa2016_activitygroupleaders`
--

INSERT INTO `fa2016_activitygroupleaders` (`ag_leaders`, `ag_id`, `pstu_id`) VALUES
(3, 2, 56),
(2, 2, 160),
(4, 3, 145),
(5, 3, 155),
(6, 4, 167),
(7, 5, 95),
(12, 8, 190),
(30, 8, 193),
(19, 13, 113),
(21, 14, 62),
(35, 14, 75),
(34, 15, 54),
(23, 15, 149),
(24, 16, 115),
(25, 16, 125),
(29, 17, 117),
(26, 17, 214),
(27, 18, 209),
(32, 19, 146),
(36, 20, 42),
(37, 21, 114),
(38, 21, 144),
(41, 22, 213),
(33, 24, 85),
(39, 25, 126),
(40, 25, 133);

-- --------------------------------------------------------

--
-- Table structure for table `fa2016_activitygroupsession`
--

CREATE TABLE `fa2016_activitygroupsession` (
  `agses_id` int(11) NOT NULL,
  `ag_id` int(11) NOT NULL,
  `agses_start_time` datetime NOT NULL,
  `agses_end_time` datetime NOT NULL,
  `agses_description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fa2016_activitygroupsession`
--

INSERT INTO `fa2016_activitygroupsession` (`agses_id`, `ag_id`, `agses_start_time`, `agses_end_time`, `agses_description`) VALUES
(1, 17, '2016-08-30 12:00:00', '2016-08-30 14:00:00', 'Welcome back bbq'),
(17, 18, '2016-09-05 00:00:00', '2016-09-09 17:00:00', 'Created a character profile of at least 350 words.'),
(18, 18, '2016-09-16 00:00:00', '2016-09-16 17:00:00', 'Create a story of at least 500 words that displays an internal character conflict'),
(19, 4, '2016-09-12 14:25:00', '2016-09-12 15:25:00', 'We watched a portion of the movie Spy with Melissa McCarthy'),
(20, 4, '2016-09-19 14:25:00', '2016-09-19 15:25:00', 'We continued to watch Spy.'),
(21, 4, '2016-09-26 14:25:00', '2016-09-26 15:25:00', 'We finished watching Spy and began watching Bridesmaids.'),
(22, 4, '2016-10-03 14:25:00', '2016-10-03 15:25:00', 'We continued to watch Bridesmaids.'),
(23, 4, '2016-10-10 14:25:00', '2016-10-10 15:25:00', 'We did not hold a meeting because of Fall Holiday.'),
(24, 4, '2016-10-17 14:25:00', '2016-10-17 15:25:00', 'We finished watching Bridesmaids and began watching Hotel Transylvania for Halloween.'),
(25, 4, '2016-10-24 14:25:00', '2016-10-24 15:25:00', 'We continued watching Hotel Transylvania.'),
(26, 4, '2016-10-31 14:25:00', '2016-10-31 15:25:00', 'We started the new Ghostbusters movie.'),
(27, 4, '2016-11-07 14:25:00', '2016-11-07 15:25:00', 'We finished watching Ghostbusters. It was a really good movie.'),
(28, 4, '2016-11-14 14:25:00', '2016-11-14 15:25:00', 'We began watching The Heat.'),
(29, 4, '2016-11-21 14:25:00', '2016-11-21 15:25:00', 'Nobody showed up =('),
(30, 4, '2016-11-28 14:25:00', '2016-11-28 15:25:00', 'We continued watching The Heat.'),
(31, 13, '2016-09-12 13:00:00', '2016-09-12 14:00:00', 'We did a quick introductory activity/icebreaker and then we studied.'),
(32, 13, '2016-09-19 13:00:00', '2016-09-19 14:00:00', 'I ran through my introduction quickly for newcomers, and then we studied.'),
(33, 13, '2016-09-26 13:00:00', '2016-09-26 14:00:00', 'We shared some studying ideas of what works for each of us, introduced ourselves, and then studied for the rest of the time.'),
(34, 13, '2016-10-03 13:00:00', '2016-10-03 14:00:00', 'We did a quick introduction and then we studied for the rest of the time.'),
(36, 13, '2016-10-17 13:00:00', '2016-10-17 14:00:00', 'We did a quick introductory exercise and then we studied for the rest of the time.'),
(37, 13, '2016-10-24 13:00:00', '2016-10-24 14:00:00', 'We did a quick introductory exercise and then we studied for the rest of the time.'),
(38, 13, '2016-10-31 13:00:00', '2016-10-31 14:00:00', 'We did quick introduction activity and then we studied.'),
(39, 13, '2016-11-07 13:00:00', '2016-11-07 14:00:00', 'We all introduced ourselves and then we studied for the rest of the time.'),
(40, 13, '2016-11-14 13:00:00', '2016-11-14 14:00:00', 'We all introduced ourselves and then we studied for the rest of the time.'),
(41, 13, '2016-11-21 13:00:00', '2016-11-21 14:00:00', 'We did a quick intro activity and then we studied.'),
(42, 13, '2016-11-28 13:00:00', '2016-11-28 14:00:00', 'We did a quick introduction, and then we studied for the rest of the time.'),
(43, 2, '2016-09-13 17:00:00', '2016-09-13 18:00:00', 'total body workout'),
(44, 2, '2016-09-15 17:00:00', '2016-09-15 18:00:00', 'squats, abs, and jump rope'),
(45, 2, '2016-09-20 17:00:00', '2016-09-20 18:00:00', 'towel workout'),
(46, 2, '2016-09-22 17:00:00', '2016-09-22 18:00:00', 'station workout'),
(47, 2, '2016-09-27 17:00:00', '2016-09-27 18:00:00', 'butt and leg workouts'),
(48, 2, '2016-09-29 17:00:00', '2016-09-29 18:00:00', 'HIT workout'),
(49, 2, '2016-10-04 17:00:00', '2016-10-04 18:00:00', 'station workout'),
(50, 2, '2016-10-06 17:00:00', '2016-10-06 18:00:00', 'ab and leg workouts'),
(51, 2, '2016-10-11 17:00:00', '2016-10-11 18:00:00', 'arms and abs'),
(52, 2, '2016-10-13 17:00:00', '2016-10-13 18:00:00', 'towel workout'),
(53, 2, '2016-10-18 17:00:00', '2016-10-18 18:00:00', 'Stations'),
(54, 2, '2016-10-20 17:00:00', '2016-10-20 18:00:00', 'stations'),
(55, 2, '2016-10-25 17:00:00', '2016-10-25 18:00:00', 'total body workout'),
(56, 2, '2016-10-27 17:00:00', '2016-10-27 18:00:00', 'anything goes'),
(57, 2, '2016-11-01 17:00:00', '2016-11-01 18:00:00', 'stations'),
(58, 2, '2016-11-03 17:00:00', '2016-11-03 18:00:00', 'HIIT workout'),
(59, 2, '2016-11-08 17:00:00', '2016-11-08 18:00:00', 'thigh workout'),
(60, 2, '2016-11-10 17:00:00', '2016-11-10 18:00:00', 'stations-arms and abs'),
(61, 2, '2016-11-15 17:00:00', '2016-11-15 18:00:00', 'HIIT workout'),
(62, 2, '2016-11-17 17:00:00', '2016-11-17 18:00:00', '4 by 30 second workouts'),
(66, 2, '2016-11-29 17:00:00', '2016-11-29 18:00:00', 'four workouts for 30 seconds, 3 different sets'),
(68, 2, '2016-12-06 17:00:00', '2016-12-06 18:00:00', 'arms and abs'),
(69, 2, '2016-12-08 17:00:00', '2016-12-08 18:00:00', 'lower body and abs'),
(70, 16, '2016-09-12 16:00:00', '2016-09-12 17:00:00', 'We played Wallyball. We volleyed the ball for a while, played a game to 25 points, and then volleyed the ball some more. We switched up teams multiple times to make it more interesting.'),
(71, 16, '2016-09-19 16:00:00', '2016-09-19 17:00:00', 'We volleyed the ball back on forth and switched up the teams a few times.'),
(72, 16, '2016-09-26 16:00:00', '2016-09-26 17:00:00', 'We volleyed the ball back and forth and had fun.'),
(73, 16, '2016-10-03 16:00:00', '2016-10-03 17:00:00', 'We played Wallyball. We volleyed the ball back and forth for a while, just warming up. We then played two or three games.'),
(75, 16, '2016-10-17 16:00:00', '2016-10-17 17:00:00', 'We played Wallyball. First we volleyed the ball back and forth for a while to warm up, and then we played a real game.'),
(76, 16, '2016-10-24 16:00:00', '2016-10-24 17:00:00', 'We played Wallyball. We volleyed the ball for a while and then played an actual game - two on two.'),
(77, 16, '2016-11-07 16:00:00', '2016-11-07 17:00:00', 'We played Wallyball. We warmed up for a while by hitting the ball back and forth and then played one game.'),
(78, 16, '2016-11-14 16:00:00', '2016-11-14 17:00:00', 'We warmed up through volleying the ball back and forth. Then we played two games.'),
(79, 16, '2016-11-21 16:00:00', '2016-11-21 17:00:00', 'We warmed up for a little while and then played two games of Wallyball.'),
(80, 8, '2016-09-15 18:00:00', '2016-09-15 19:00:00', 'Game of Thrones Season 1 ep. 1'),
(81, 8, '2016-09-22 18:00:00', '2016-09-22 19:00:00', 'Game of Thrones Season 1 ep. 2'),
(82, 3, '2016-09-15 23:00:00', '2016-09-16 00:00:00', 'For this week\'s prompt, we would like you to tell us what you did this summer! Tell us about all of your amazing adventures and fun in the sun! If you don\'t think that you did anything overly exciting over the summer, then never fear, we still have something great for you! If you find the topic of summer doesn\'t really suit your needs, feel free to tell us about yourself. We would love to get to know you guys, especially since we aren\'t meeting face-to-face.'),
(83, 3, '2016-09-22 23:00:00', '2016-09-23 00:00:00', 'For this weeks prompt we want to know what your favorite part of college is! If you can\'t decide, you could also write your most stressful part of college is! Please keep in mind that responses should be 500 words in length.'),
(84, 3, '2016-09-29 23:00:00', '2016-09-30 00:00:00', 'This week we are going to be asking you to help us get to know you a little better. Unfortunately, we don\'t get the chance to meet all of you, so this week we want to know what makes you tick. That means this prompt has a couple options for what you can write about. The first is to tell us what you are looking to the most about this year of college! This is a question we all have to answer a lot, so please bare with us and answer it one more time!'),
(85, 3, '2016-10-06 23:00:00', '2016-10-07 00:00:00', 'This week we are going to get to learn a little more about you. We are asking you to write about what your biggest dream is in life. It can be a dream job, something you have always dreamed of doing, anything of that nature! Make sure you let us know in 500 words and email it to ghp.biw@gmail.com! We are super excited to hear from you, and can\'t wait to see what kind of dreamers we have!'),
(86, 3, '2016-10-13 23:00:00', '2016-10-14 00:00:00', 'This week I think that maybe we should do something a little out of the box. So instead of talking about college and the future, why don\'t we have a little chat about the past? For this week\'s prompt, we want you to tell us about your favorite (or worst) memory from when you were growing up. Try to be as thorough as possible so that we can get to know you even more! As usual, responses should be 500 words and sent to ghp.biw@gmail.com! Can\'t wait to hear from you!'),
(87, 3, '2016-10-20 23:00:00', '2016-10-21 00:00:00', 'This week we would love it if you all could do a little reflection for us! That being said, this week we want to know what led you to join the Global Honors Program. Each of us were brought here for different reasons, and we would love to hear what yours were! As usual, we ask that you response be no less than 500 words, and be sent to ghp.biw@gmail.com! We are really excited to hear from you all!'),
(88, 3, '2016-10-27 23:00:00', '2016-10-28 00:00:00', 'Hello writers!\r\n \r\nSince it\'s Halloween this week we\'re going to do something a little different this week! Instead of our normal prompt we\'re going to have you write us a story from the perspective of a piece of Halloween candy. It can be anything you want, the sky\'s the limit. Just make sure responses are no less than 500 words. Please send them to GHP.BIW@gmail.com. Can\'t wait to hear from you!'),
(89, 3, '2016-11-03 23:00:00', '2016-11-04 00:00:00', 'First of all, you all did such a great job on the Halloween prompt! There were so many different ideas and each one of them made us smile! Since all of the answers were so good, we decided to stick with another creative prompt this week! We would like you to tell us a little story from the perspective of your pet! It can be anything: a memory you share with them, a time they went to the vet, or it can be something completely made up!'),
(90, 3, '2016-11-10 23:00:00', '2016-11-11 00:00:00', 'Hello wonderful writers!\r\n \r\nSorry about the mix up that we had with the email last week! We apologize for goofing that up. However, mistake behind us, we are going to be continuing onward with another interesting prompt for the week. We have really been loving all of the creative stuff that you guys have been turning in for us, so we are going to stick with it for another week. For the prompt this week, we would love for you to tell us a story about being the last human left on Earth.'),
(91, 3, '2016-12-01 23:00:00', '2016-12-02 00:00:00', 'Write a letter to Santa!!!'),
(92, 14, '2016-09-13 15:00:00', '2016-09-13 16:00:00', 'For this session, we studied in the common room at the Honors House.'),
(93, 14, '2016-09-20 15:00:00', '2016-09-20 16:00:00', 'For this session, we studied in the common room at the Honors House.'),
(94, 14, '2016-09-27 15:00:00', '2016-09-27 16:00:00', 'For this session, we studied in the common room at the Honors House.'),
(95, 14, '2016-10-04 15:00:00', '2016-10-04 16:00:00', 'For this session, we studied in the common room at the Honors House.'),
(96, 14, '2016-10-11 15:00:00', '2016-10-11 16:00:00', 'no meeting this week'),
(97, 14, '2016-10-18 15:00:00', '2016-10-18 16:00:00', 'For this session, we studied in the common room at the Honors House.'),
(98, 14, '2016-10-25 15:00:00', '2016-10-25 16:00:00', 'For this session, we studied in the common room at the Honors House.'),
(99, 14, '2016-11-01 15:00:00', '2016-11-01 16:00:00', 'For this session, we studied in the common room at the Honors House.'),
(100, 14, '2016-11-08 15:00:00', '2016-11-08 16:00:00', 'For this session, we studied in the common room at the Honors House.'),
(101, 14, '2016-11-15 15:00:00', '2016-11-15 16:00:00', 'For this session, we studied in the common room at the Honors House.'),
(102, 14, '2016-11-22 15:00:00', '2016-11-22 16:00:00', 'We did not have an activity group for this week.'),
(103, 14, '2016-11-29 15:00:00', '2016-11-29 16:00:00', 'For this session, we studied in the common room at the Honors House.'),
(104, 15, '2016-09-14 14:00:00', '2016-09-14 15:00:00', 'We discussed what our favorite comic book characters were and which movies/shows we wanted to watch.'),
(116, 15, '2016-09-21 14:00:00', '2016-09-21 15:00:00', 'We started the movie Captain America: Civil War'),
(117, 15, '2016-09-28 14:00:00', '2016-09-28 15:00:00', 'Continued to watch Captain America: Civil War'),
(118, 15, '2016-10-05 14:00:00', '2016-10-05 15:00:00', 'Finished Captain America:Civil War and started Batman Begins'),
(119, 15, '2016-10-12 14:00:00', '2016-10-12 15:00:00', 'Continued to watch Batman Begins and discussed what to watch next.'),
(120, 15, '2016-10-19 14:00:00', '2016-10-19 15:00:00', 'We finished up Batman Begins and discussed what we\'all watch next week'),
(121, 15, '2016-10-26 14:00:00', '2016-10-26 15:00:00', 'We started to watch Deadpool:The Movie.'),
(123, 5, '2016-09-07 16:00:00', '2016-09-07 17:00:00', 'Nobody showed up.'),
(124, 5, '2016-09-14 16:00:00', '2016-09-14 17:00:00', 'We ripped pages out of some of my coloring books and colored.'),
(125, 5, '2016-09-21 16:00:00', '2016-09-21 17:00:00', 'We colored while discussing our majors and getting to know each other.'),
(126, 5, '2016-09-28 16:00:00', '2016-09-28 17:00:00', 'We continued pieces we worked on last time and had great conversation!'),
(127, 5, '2016-10-05 16:00:00', '2016-10-05 17:00:00', 'We colored and talked about our weeks.'),
(128, 5, '2016-10-12 16:00:00', '2016-10-12 17:00:00', 'I did not hold this session due to an unexpected scheduling issue.'),
(129, 5, '2016-10-19 16:00:00', '2016-10-19 17:00:00', 'We discussed the strike and colored to relieve our stresses!'),
(130, 5, '2016-10-26 16:00:00', '2016-10-26 17:00:00', 'We colored and shared in our excitement about Halloween!'),
(131, 5, '2016-11-02 16:00:00', '2016-11-02 17:00:00', 'We colored and it was the biggest attendance yet!'),
(132, 5, '2016-11-09 16:00:00', '2016-11-09 17:00:00', 'We colored and chatted.'),
(133, 5, '2016-11-16 16:00:00', '2016-11-16 17:00:00', 'We colored and shared in our excitement for Thanksgiving!'),
(134, 5, '2016-11-23 16:00:00', '2016-11-23 17:00:00', 'Thanksgiving Break.'),
(135, 5, '2016-11-30 16:00:00', '2016-11-30 17:00:00', 'We discussed our exhaustion and colored.'),
(151, 8, '2016-09-29 18:00:00', '2016-09-29 19:00:00', 'Season 1 ep. 3'),
(178, 18, '2016-09-23 00:00:00', '2016-09-23 17:00:00', 'This week  we are going to create a book jacket summary for your novel. You must include the main character and conflict in this summary and it should be at least 300 words.'),
(179, 18, '2016-09-30 00:00:00', '2016-09-30 17:00:00', 'To do this you need to start off by writing a timeline of events that lead up and follow the main event of the story all the way to the end. This can either be done in bullet point or paragraph format. It must include the main event and at least 15 other events that come before or after the main event.'),
(180, 18, '2016-10-07 00:00:00', '2016-10-07 17:00:00', 'Using your timeline from last week write a conflict that occurs in your novel. It should be at least 500 words'),
(181, 18, '2016-10-14 00:00:00', '2016-10-14 17:00:00', 'Wild Card time! This week write whatever you type of short story, conflict, timeline, etc that you want. It just has to be at least 500 words.'),
(182, 18, '2016-10-21 00:00:00', '2016-10-21 17:00:00', 'So this week we are going to add another important element to story writing, the setting. In at least 350 words describe a setting you want to be included in your novel or that you want to use in a short story.'),
(183, 18, '2016-10-28 00:00:00', '2016-10-28 17:00:00', 'So in at least 500 words write a short story that has a central conflict but also describes the environment that the conflict is occurring in.'),
(184, 8, '2016-10-06 18:00:00', '2016-10-06 19:00:00', 'episode 4'),
(185, 8, '2016-10-13 18:00:00', '2016-10-13 19:00:00', 'episode 5'),
(187, 17, '2016-09-21 19:00:00', '2016-09-21 20:00:00', 'Clash of the Classes-Frisbee'),
(188, 17, '2016-09-19 19:00:00', '2016-09-19 20:00:00', 'Clash of the Clashes-Kickball'),
(189, 17, '2016-09-20 19:00:00', '2016-09-20 20:00:00', 'Clash of the Classes-Trivia'),
(190, 17, '2016-10-06 06:30:00', '2016-10-06 07:30:00', 'Challenge the SADs'),
(191, 19, '2016-10-12 00:00:00', '2016-10-12 01:00:00', 'Updates for 10/11'),
(194, 18, '2016-11-04 00:00:00', '2016-11-04 17:00:00', 'Start it! So this week write a beginning to your novel that is about 500 words. Make sure you hook your readers in and have them wanting more.'),
(195, 18, '2016-11-11 00:00:00', '2016-11-11 17:00:00', 'Keep it going this week! Continue your last piece or write a new piece that goes with your novel. Make sure it is at least 500 words.'),
(196, 18, '2016-11-18 00:00:00', '2016-11-18 17:00:00', 'Wild Card: dystopian! So this week write a short story that is at least 500 words and has either dystopian characteristics.'),
(197, 18, '2016-11-25 00:00:00', '2016-11-25 17:00:00', 'Write an ending! So this week write a 500 word short story that would either end your novel or a chapter of your novel.'),
(198, 8, '2016-11-03 18:00:00', '2016-11-03 19:00:00', 'Game of thrones episode 6'),
(199, 8, '2016-11-10 18:00:00', '2016-11-10 19:00:00', 'episode 7'),
(200, 8, '2016-10-27 19:00:00', '2016-10-27 20:00:00', 'ep 5'),
(201, 19, '2016-11-01 00:00:00', '2016-11-01 01:00:00', 'update #2'),
(202, 15, '2016-11-02 14:00:00', '2016-11-02 15:00:00', 'Finished up watching Deadpool and discussed what to watch next time.'),
(203, 17, '2016-10-27 19:00:00', '2016-10-27 20:30:00', 'Halloween Party'),
(204, 17, '2016-11-01 19:00:00', '2016-11-01 20:40:00', 'FDG video night'),
(205, 17, '2016-11-03 19:00:00', '2016-11-03 20:00:00', 'Mr./Mrs. Honors'),
(206, 17, '2016-11-03 19:00:00', '2016-11-03 20:00:00', 'Mr. Mrs. Honors participants'),
(209, 15, '2016-11-09 14:00:00', '2016-11-09 15:00:00', 'We started watching the Dark Knight'),
(210, 19, '2016-11-15 00:00:00', '2016-11-15 01:00:00', 'Update #3'),
(211, 15, '2016-11-16 14:00:00', '2016-11-16 15:00:00', 'We continued watching Dark Knight'),
(212, 15, '2016-11-30 14:00:00', '2016-11-30 15:00:00', 'Finished The Dark Knight and started Antman.'),
(213, 3, '2016-11-17 00:00:00', '2016-11-18 00:00:00', 'Since we are so vey near to Thanksgiving break, that can only mean one thing. A holday prompt! You know how much we love these! This week, we want you to tell us what you are thankful for. It can be anything that you want, and we are really excited to hear what you guys have to say! I know that this year we are super super thankful for all of you! You have made this a great year, so we can\'t wait to finish it off strong in the next couple weeks!'),
(214, 8, '2016-11-17 00:00:00', '2016-11-17 01:00:00', ''),
(215, 16, '2016-10-31 16:00:00', '2016-10-31 17:00:00', 'We played Wallyball. We volleyed the ball to warm-up and then played a couple of games.'),
(217, 17, '2016-11-14 19:00:00', '2016-11-14 20:00:00', 'Structure Construction'),
(218, 18, '2016-12-02 00:00:00', '2016-12-02 17:00:00', 'Keep it going this week! Continue your last piece or write a new piece that goes with your novel. Make sure it is at least 500 words. \r\n    All submissions are due by 5pm on FRIDAY:\r\nnovelwritingghplhu@gmail.com'),
(219, 18, '2016-12-09 00:00:00', '2016-12-09 17:00:00', 'Week 14\r\n    Write an ending! So this week write a 500 word short story that would either end your novel or a chapter of your novel.\r\n    All submissions are due by 5pm on FRIDAY:\r\nnovelwritingghplhu@gmail.com'),
(220, 16, '2016-11-28 16:00:00', '2016-11-28 17:00:00', 'We warmed up for a while and then played a couple of games'),
(221, 3, '2016-11-24 23:00:00', '2016-11-25 00:00:00', 'Write a story using the following prompt:\r\nWhen we cut into the pumpkin, I didn\'t expect to see...'),
(224, 8, '2016-12-01 18:00:00', '2016-12-01 19:00:00', ''),
(225, 8, '2016-12-08 18:00:00', '2016-12-08 19:00:00', ''),
(226, 2, '2016-12-01 17:00:00', '2016-12-01 18:00:00', 'stations, wall-sits, and 7-minute abs'),
(227, 16, '2016-12-05 16:00:00', '2016-12-05 17:00:00', 'We warmed up for a little while and then played a couple of games'),
(228, 14, '2016-12-06 15:00:00', '2016-12-06 16:00:00', 'We did not hold our activity group this week.'),
(231, 15, '2016-12-07 14:00:00', '2016-12-07 15:00:00', 'We watched Ant-Man for my last activity group ever :('),
(232, 13, '2016-12-05 13:00:00', '2016-12-05 14:00:00', 'We all did a quick introduction, and then we got right to studying.'),
(233, 5, '2016-12-07 16:00:00', '2016-12-07 17:00:00', 'We colored and talked about how excited we were for winter break!'),
(235, 3, '2016-12-08 23:00:00', '2016-12-09 00:00:00', 'Write about your family\'s Christmas tradition in no less than 500 words'),
(237, 17, '2016-12-06 19:00:00', '2016-12-06 20:00:00', 'Super Smash Bros Tournament'),
(242, 17, '2016-12-07 19:00:00', '2016-12-07 20:00:00', 'The spectacular Holiday Party!!!'),
(243, 5, '2017-01-30 15:00:00', '2017-01-30 16:00:00', ''),
(244, 5, '2017-02-06 15:00:00', '2017-02-06 16:00:00', ''),
(245, 5, '2017-02-13 15:00:00', '2017-02-13 16:00:00', ''),
(246, 5, '2017-02-20 15:00:00', '2017-02-20 16:00:00', ''),
(247, 5, '2017-02-27 15:00:00', '2017-02-27 16:00:00', ''),
(248, 5, '2017-03-06 15:00:00', '2017-03-06 16:00:00', ''),
(249, 5, '2017-03-13 15:00:00', '2017-03-13 16:00:00', ''),
(250, 5, '2017-03-20 15:00:00', '2017-03-20 16:00:00', ''),
(251, 5, '2017-03-27 15:00:00', '2017-03-27 16:00:00', ''),
(252, 5, '2017-04-03 15:00:00', '2017-04-03 16:00:00', ''),
(253, 5, '2017-04-10 15:00:00', '2017-04-10 16:00:00', ''),
(254, 5, '2017-04-17 15:00:00', '2017-04-17 16:00:00', ''),
(255, 5, '2017-04-24 15:00:00', '2017-04-24 16:00:00', ''),
(256, 5, '2017-05-01 15:00:00', '2017-05-01 16:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `fa2016_activitygroupstats`
--

CREATE TABLE `fa2016_activitygroupstats` (
  `agstat_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL,
  `agses_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fa2016_activitygroupstats`
--

INSERT INTO `fa2016_activitygroupstats` (`agstat_id`, `pstu_id`, `agses_id`) VALUES
(265, 5, 1),
(536, 5, 37),
(198, 5, 93),
(435, 5, 97),
(560, 5, 98),
(444, 5, 120),
(515, 5, 121),
(113, 5, 125),
(323, 5, 189),
(361, 5, 190),
(586, 5, 202),
(631, 5, 203),
(768, 5, 205),
(778, 5, 206),
(1132, 5, 242),
(249, 6, 1),
(79, 6, 80),
(203, 6, 81),
(204, 6, 151),
(348, 6, 184),
(555, 6, 185),
(333, 6, 187),
(902, 6, 198),
(906, 6, 199),
(557, 6, 200),
(671, 6, 203),
(711, 6, 204),
(765, 6, 205),
(774, 6, 206),
(909, 6, 214),
(1083, 6, 224),
(1133, 6, 242),
(643, 7, 203),
(924, 7, 217),
(1134, 7, 242),
(30, 8, 104),
(92, 8, 116),
(143, 8, 117),
(220, 8, 118),
(386, 8, 119),
(518, 8, 121),
(358, 8, 190),
(587, 8, 202),
(691, 8, 203),
(737, 8, 205),
(805, 8, 209),
(860, 8, 211),
(1135, 8, 242),
(124, 9, 21),
(653, 9, 203),
(706, 9, 204),
(749, 9, 205),
(925, 9, 217),
(563, 10, 98),
(27, 10, 104),
(136, 10, 117),
(217, 10, 118),
(390, 10, 119),
(445, 10, 120),
(321, 10, 189),
(364, 10, 190),
(580, 10, 202),
(645, 10, 203),
(692, 10, 204),
(766, 10, 205),
(776, 10, 206),
(803, 10, 209),
(858, 10, 211),
(929, 10, 217),
(60, 11, 20),
(126, 11, 21),
(412, 11, 86),
(473, 11, 87),
(521, 11, 88),
(822, 11, 90),
(1033, 11, 91),
(464, 11, 182),
(750, 11, 205),
(927, 11, 217),
(4, 12, 19),
(56, 12, 20),
(122, 12, 21),
(196, 12, 22),
(431, 12, 24),
(492, 12, 25),
(550, 12, 26),
(841, 12, 28),
(736, 12, 205),
(5, 13, 19),
(57, 13, 20),
(125, 13, 21),
(195, 13, 22),
(430, 13, 24),
(494, 13, 25),
(366, 13, 190),
(665, 13, 203),
(709, 13, 204),
(722, 13, 205),
(926, 13, 217),
(343, 14, 85),
(440, 14, 97),
(569, 14, 98),
(389, 14, 119),
(450, 14, 120),
(514, 14, 121),
(425, 14, 181),
(322, 14, 189),
(362, 14, 190),
(714, 14, 205),
(585, 15, 202),
(802, 15, 209),
(933, 15, 217),
(533, 16, 183),
(651, 16, 203),
(283, 17, 1),
(770, 17, 205),
(780, 17, 206),
(932, 17, 217),
(1136, 17, 242),
(353, 18, 190),
(751, 18, 205),
(194, 21, 22),
(429, 21, 24),
(161, 21, 126),
(548, 21, 130),
(594, 21, 131),
(664, 21, 203),
(702, 21, 204),
(721, 21, 205),
(260, 22, 1),
(18, 22, 31),
(65, 22, 32),
(156, 22, 33),
(230, 22, 34),
(39, 22, 44),
(74, 22, 45),
(150, 22, 47),
(176, 22, 48),
(216, 22, 49),
(382, 22, 51),
(402, 22, 52),
(491, 22, 53),
(505, 22, 55),
(578, 22, 57),
(801, 22, 59),
(814, 22, 60),
(887, 22, 62),
(1010, 22, 66),
(1080, 22, 68),
(1095, 22, 69),
(678, 22, 203),
(767, 22, 205),
(777, 22, 206),
(1137, 22, 242),
(58, 23, 20),
(123, 23, 21),
(197, 23, 22),
(433, 23, 24),
(493, 23, 25),
(551, 23, 26),
(655, 23, 203),
(704, 23, 204),
(720, 23, 205),
(919, 23, 217),
(115, 24, 125),
(163, 24, 126),
(546, 24, 130),
(597, 24, 131),
(878, 24, 133),
(657, 24, 203),
(695, 24, 204),
(712, 24, 205),
(259, 25, 1),
(41, 25, 44),
(75, 25, 45),
(99, 25, 46),
(148, 25, 47),
(172, 25, 48),
(214, 25, 49),
(290, 25, 50),
(381, 25, 51),
(401, 25, 52),
(489, 25, 53),
(502, 25, 55),
(576, 25, 57),
(605, 25, 58),
(800, 25, 59),
(816, 25, 60),
(886, 25, 62),
(1009, 25, 66),
(1081, 25, 68),
(1092, 25, 69),
(677, 25, 203),
(729, 25, 205),
(1029, 25, 226),
(1138, 25, 242),
(759, 26, 205),
(940, 26, 217),
(1140, 26, 242),
(6, 27, 19),
(59, 27, 20),
(31, 27, 104),
(94, 27, 116),
(141, 27, 117),
(218, 27, 118),
(387, 27, 119),
(517, 27, 121),
(324, 27, 189),
(356, 27, 190),
(660, 27, 203),
(742, 27, 205),
(422, 28, 86),
(392, 28, 119),
(453, 28, 120),
(519, 28, 121),
(532, 28, 183),
(363, 28, 190),
(588, 28, 202),
(646, 28, 203),
(703, 28, 204),
(764, 28, 205),
(773, 28, 206),
(806, 28, 209),
(861, 28, 211),
(1002, 28, 212),
(1066, 28, 231),
(243, 29, 1),
(254, 30, 1),
(944, 30, 41),
(1099, 30, 69),
(116, 30, 125),
(160, 30, 126),
(596, 30, 131),
(350, 30, 190),
(649, 30, 203),
(1070, 30, 232),
(1117, 30, 235),
(26, 31, 104),
(82, 31, 116),
(135, 31, 117),
(391, 31, 119),
(448, 31, 120),
(511, 31, 121),
(351, 31, 190),
(584, 31, 202),
(650, 31, 203),
(856, 31, 211),
(1141, 31, 242),
(271, 32, 1),
(73, 32, 45),
(100, 32, 46),
(149, 32, 47),
(173, 32, 48),
(215, 32, 49),
(404, 32, 52),
(501, 32, 55),
(606, 32, 58),
(799, 32, 59),
(817, 32, 60),
(853, 32, 61),
(885, 32, 62),
(1008, 32, 66),
(675, 32, 203),
(728, 32, 205),
(775, 32, 206),
(1028, 32, 226),
(840, 33, 28),
(224, 33, 34),
(539, 33, 37),
(718, 33, 205),
(920, 33, 217),
(270, 34, 1),
(38, 34, 44),
(76, 34, 45),
(98, 34, 46),
(147, 34, 47),
(170, 34, 48),
(213, 34, 49),
(288, 34, 50),
(400, 34, 52),
(490, 34, 53),
(500, 34, 55),
(575, 34, 57),
(604, 34, 58),
(815, 34, 60),
(852, 34, 61),
(884, 34, 62),
(1093, 34, 69),
(428, 34, 191),
(684, 34, 203),
(730, 34, 205),
(931, 34, 217),
(1142, 34, 242),
(50, 35, 124),
(114, 35, 125),
(159, 35, 126),
(293, 35, 127),
(590, 35, 131),
(807, 35, 132),
(877, 35, 133),
(693, 35, 204),
(40, 36, 44),
(102, 36, 46),
(177, 36, 48),
(291, 36, 50),
(339, 36, 85),
(405, 36, 86),
(474, 36, 87),
(522, 36, 88),
(620, 36, 89),
(320, 36, 189),
(355, 36, 190),
(642, 36, 203),
(698, 36, 204),
(1143, 36, 242),
(696, 37, 204),
(921, 37, 217),
(357, 38, 190),
(432, 39, 24),
(495, 39, 25),
(552, 39, 26),
(782, 39, 27),
(347, 39, 151),
(365, 39, 190),
(654, 39, 203),
(710, 39, 204),
(769, 39, 205),
(779, 39, 206),
(928, 39, 217),
(1144, 39, 242),
(697, 40, 204),
(738, 41, 205),
(437, 42, 97),
(564, 42, 98),
(33, 42, 104),
(93, 42, 116),
(140, 42, 117),
(222, 42, 118),
(388, 42, 119),
(449, 42, 120),
(516, 42, 121),
(476, 42, 129),
(630, 42, 203),
(804, 42, 209),
(857, 42, 211),
(923, 42, 217),
(1063, 42, 231),
(63, 43, 32),
(155, 43, 33),
(479, 43, 36),
(537, 43, 37),
(609, 43, 38),
(199, 43, 93),
(200, 43, 94),
(208, 43, 95),
(436, 43, 97),
(570, 43, 98),
(661, 43, 203),
(694, 43, 204),
(745, 43, 205),
(918, 43, 217),
(1100, 44, 69),
(219, 44, 118),
(385, 44, 119),
(325, 44, 189),
(354, 44, 190),
(583, 44, 202),
(667, 44, 203),
(701, 44, 204),
(733, 44, 205),
(1004, 44, 212),
(1145, 44, 242),
(272, 45, 1),
(101, 45, 46),
(175, 45, 48),
(289, 45, 50),
(403, 45, 52),
(462, 45, 54),
(534, 45, 56),
(734, 45, 205),
(1146, 45, 242),
(480, 46, 36),
(942, 46, 41),
(957, 46, 42),
(1031, 46, 91),
(567, 46, 98),
(451, 46, 120),
(477, 46, 129),
(592, 46, 131),
(713, 46, 205),
(1147, 46, 242),
(760, 47, 205),
(284, 48, 1),
(763, 48, 205),
(772, 48, 206),
(263, 49, 1),
(527, 49, 88),
(359, 49, 190),
(1057, 49, 191),
(1055, 49, 201),
(681, 49, 203),
(1056, 49, 210),
(1065, 49, 231),
(1116, 49, 235),
(1148, 49, 242),
(273, 50, 1),
(352, 50, 190),
(735, 50, 205),
(950, 51, 30),
(541, 51, 37),
(958, 51, 42),
(1032, 51, 91),
(438, 51, 97),
(561, 51, 98),
(571, 51, 99),
(844, 51, 101),
(994, 51, 103),
(593, 51, 131),
(264, 52, 1),
(17, 52, 31),
(157, 52, 33),
(174, 52, 48),
(818, 52, 60),
(1082, 52, 68),
(676, 52, 203),
(1126, 52, 237),
(1149, 52, 242),
(369, 53, 190),
(689, 53, 203),
(941, 53, 217),
(375, 54, 190),
(662, 54, 203),
(281, 55, 1),
(304, 55, 188),
(313, 55, 189),
(21, 56, 43),
(36, 56, 44),
(71, 56, 45),
(96, 56, 46),
(145, 56, 47),
(169, 56, 48),
(210, 56, 49),
(286, 56, 50),
(379, 56, 51),
(399, 56, 52),
(486, 56, 53),
(460, 56, 54),
(499, 56, 55),
(535, 56, 56),
(577, 56, 57),
(603, 56, 58),
(798, 56, 59),
(812, 56, 60),
(849, 56, 61),
(1007, 56, 66),
(1076, 56, 68),
(1091, 56, 69),
(1026, 56, 226),
(367, 57, 190),
(282, 58, 1),
(13, 58, 70),
(23, 58, 92),
(999, 58, 103),
(360, 58, 187),
(315, 58, 189),
(1052, 58, 201),
(656, 58, 203),
(1051, 58, 210),
(1111, 58, 235),
(1150, 58, 242),
(837, 60, 40),
(946, 60, 41),
(962, 60, 42),
(1012, 60, 66),
(335, 60, 187),
(317, 60, 189),
(859, 60, 211),
(1030, 60, 226),
(640, 62, 203),
(467, 63, 87),
(830, 63, 195),
(899, 63, 213),
(908, 63, 214),
(1086, 63, 224),
(46, 64, 82),
(185, 64, 84),
(346, 64, 85),
(416, 64, 86),
(466, 64, 87),
(528, 64, 88),
(629, 64, 89),
(1046, 64, 91),
(900, 64, 213),
(1121, 64, 235),
(235, 65, 1),
(66, 65, 32),
(478, 65, 36),
(540, 65, 37),
(15, 65, 70),
(43, 65, 82),
(104, 65, 83),
(417, 65, 86),
(465, 65, 87),
(318, 65, 189),
(274, 66, 1),
(302, 66, 188),
(310, 66, 189),
(374, 66, 190),
(634, 66, 203),
(707, 66, 204),
(727, 66, 205),
(938, 66, 217),
(943, 67, 41),
(964, 67, 42),
(191, 67, 84),
(342, 67, 85),
(407, 67, 86),
(470, 67, 87),
(785, 67, 100),
(894, 67, 213),
(1069, 67, 232),
(268, 68, 1),
(1058, 68, 91),
(700, 68, 204),
(761, 68, 205),
(954, 68, 220),
(1125, 68, 221),
(1050, 68, 227),
(1108, 68, 235),
(1151, 68, 242),
(503, 69, 55),
(607, 69, 58),
(819, 69, 60),
(469, 69, 87),
(1043, 69, 91),
(562, 69, 98),
(747, 69, 205),
(1130, 69, 217),
(969, 69, 221),
(1129, 69, 237),
(110, 70, 83),
(188, 70, 84),
(345, 70, 85),
(415, 70, 86),
(472, 70, 87),
(529, 70, 88),
(627, 70, 89),
(826, 70, 90),
(974, 70, 221),
(244, 73, 1),
(543, 73, 37),
(520, 73, 88),
(622, 73, 89),
(820, 73, 90),
(1041, 73, 91),
(297, 73, 188),
(309, 73, 189),
(685, 73, 203),
(740, 73, 205),
(45, 74, 82),
(106, 74, 83),
(326, 74, 189),
(644, 74, 203),
(716, 74, 205),
(245, 75, 1),
(542, 75, 37),
(960, 75, 42),
(559, 75, 98),
(572, 75, 99),
(787, 75, 100),
(998, 75, 103),
(296, 75, 188),
(686, 75, 203),
(739, 75, 205),
(1014, 76, 66),
(842, 78, 28),
(952, 78, 30),
(152, 78, 33),
(225, 78, 34),
(611, 78, 38),
(832, 78, 39),
(955, 78, 42),
(1034, 78, 91),
(383, 78, 191),
(971, 78, 221),
(368, 79, 190),
(672, 79, 203),
(757, 79, 205),
(937, 79, 217),
(111, 80, 83),
(186, 80, 84),
(340, 80, 85),
(337, 80, 187),
(303, 80, 188),
(311, 80, 189),
(639, 80, 203),
(708, 80, 204),
(717, 80, 205),
(934, 80, 217),
(1152, 80, 242),
(187, 81, 84),
(418, 81, 86),
(468, 81, 87),
(524, 81, 88),
(624, 81, 89),
(1045, 81, 91),
(423, 81, 181),
(463, 81, 182),
(531, 81, 183),
(617, 81, 194),
(105, 82, 83),
(344, 82, 85),
(413, 82, 86),
(471, 82, 87),
(896, 82, 213),
(241, 83, 1),
(504, 84, 55),
(608, 84, 58),
(1039, 84, 91),
(566, 84, 98),
(746, 84, 205),
(890, 84, 213),
(1110, 84, 235),
(1128, 84, 237),
(42, 85, 82),
(406, 85, 86),
(623, 85, 89),
(824, 85, 90),
(253, 86, 1),
(67, 86, 32),
(154, 86, 33),
(227, 86, 34),
(484, 86, 36),
(615, 86, 38),
(833, 86, 39),
(305, 86, 189),
(633, 86, 203),
(935, 86, 217),
(252, 88, 1),
(68, 88, 32),
(153, 88, 33),
(226, 88, 34),
(485, 88, 36),
(614, 88, 38),
(835, 88, 39),
(298, 88, 188),
(306, 88, 189),
(632, 88, 203),
(240, 89, 1),
(679, 89, 203),
(723, 89, 205),
(299, 90, 188),
(328, 90, 189),
(635, 90, 203),
(370, 91, 190),
(659, 91, 203),
(1153, 91, 242),
(373, 93, 190),
(758, 93, 205),
(1154, 93, 242),
(331, 96, 187),
(377, 96, 190),
(648, 96, 203),
(1155, 96, 242),
(256, 97, 1),
(434, 97, 97),
(845, 97, 101),
(995, 97, 103),
(1054, 97, 201),
(1053, 97, 210),
(1109, 97, 235),
(236, 98, 1),
(14, 98, 70),
(372, 98, 190),
(744, 98, 205),
(939, 98, 217),
(16, 100, 31),
(64, 100, 32),
(158, 100, 33),
(223, 100, 34),
(482, 100, 36),
(538, 100, 37),
(610, 100, 38),
(307, 100, 189),
(732, 100, 205),
(843, 100, 210),
(19, 101, 31),
(229, 101, 34),
(481, 101, 36),
(545, 101, 37),
(613, 101, 38),
(836, 101, 39),
(838, 101, 40),
(947, 101, 41),
(961, 101, 42),
(1067, 101, 232),
(376, 102, 190),
(687, 102, 203),
(371, 103, 190),
(666, 103, 203),
(743, 103, 205),
(1156, 103, 242),
(663, 105, 203),
(724, 105, 205),
(308, 106, 189),
(690, 106, 203),
(78, 107, 80),
(201, 107, 81),
(205, 107, 151),
(349, 107, 184),
(554, 107, 185),
(901, 107, 198),
(907, 107, 199),
(556, 107, 200),
(910, 107, 214),
(1085, 107, 224),
(255, 108, 1),
(1036, 108, 91),
(565, 108, 98),
(790, 108, 100),
(848, 108, 101),
(996, 108, 103),
(591, 108, 131),
(810, 108, 132),
(426, 108, 181),
(1114, 108, 235),
(1042, 109, 91),
(51, 109, 124),
(598, 109, 131),
(876, 109, 133),
(1021, 109, 135),
(301, 109, 188),
(316, 109, 189),
(741, 109, 205),
(1087, 109, 233),
(1122, 109, 235),
(232, 110, 1),
(638, 110, 203),
(327, 111, 189),
(1115, 111, 235),
(688, 112, 203),
(3, 113, 1),
(637, 113, 203),
(250, 114, 1),
(80, 114, 80),
(420, 114, 86),
(558, 114, 201),
(636, 114, 203),
(699, 114, 204),
(715, 114, 205),
(965, 114, 221),
(1157, 114, 242),
(234, 115, 1),
(9, 115, 70),
(121, 115, 71),
(127, 115, 72),
(81, 115, 80),
(332, 115, 187),
(300, 115, 188),
(641, 115, 203),
(530, 120, 88),
(294, 120, 127),
(589, 120, 131),
(808, 120, 132),
(891, 120, 213),
(1015, 122, 66),
(1078, 122, 68),
(1097, 122, 69),
(109, 122, 83),
(189, 122, 84),
(341, 122, 85),
(414, 122, 86),
(523, 122, 88),
(628, 122, 89),
(895, 122, 213),
(975, 122, 221),
(103, 123, 83),
(190, 123, 84),
(1035, 123, 91),
(889, 123, 213),
(1118, 123, 235),
(616, 124, 38),
(829, 124, 90),
(1037, 124, 91),
(977, 124, 103),
(888, 124, 213),
(970, 124, 221),
(1072, 124, 232),
(1112, 124, 235),
(237, 125, 1),
(11, 125, 70),
(117, 125, 71),
(129, 125, 72),
(242, 126, 1),
(1044, 127, 91),
(719, 127, 205),
(897, 127, 213),
(1048, 127, 218),
(1104, 127, 219),
(968, 127, 221),
(1073, 127, 232),
(1119, 127, 235),
(1158, 127, 242),
(334, 131, 187),
(44, 132, 82),
(823, 132, 90),
(1047, 132, 91),
(893, 132, 213),
(966, 132, 221),
(238, 133, 1),
(12, 133, 70),
(120, 133, 71),
(880, 133, 133),
(1022, 133, 135),
(831, 133, 195),
(1088, 133, 233),
(112, 134, 83),
(419, 134, 86),
(526, 134, 88),
(619, 134, 89),
(424, 134, 181),
(618, 134, 194),
(647, 134, 203),
(892, 134, 213),
(967, 134, 221),
(625, 135, 89),
(821, 135, 90),
(1107, 135, 218),
(1106, 135, 219),
(972, 135, 221),
(1123, 135, 235),
(20, 137, 43),
(35, 137, 44),
(70, 137, 45),
(95, 137, 46),
(144, 137, 47),
(168, 137, 48),
(211, 137, 49),
(285, 137, 50),
(378, 137, 51),
(487, 137, 53),
(461, 137, 54),
(498, 137, 55),
(602, 137, 58),
(796, 137, 59),
(813, 137, 60),
(850, 137, 61),
(883, 137, 62),
(1006, 137, 66),
(1075, 137, 68),
(1090, 137, 69),
(312, 137, 189),
(682, 137, 203),
(1025, 137, 226),
(329, 143, 189),
(441, 144, 97),
(573, 144, 99),
(786, 144, 100),
(847, 144, 101),
(47, 145, 82),
(108, 145, 83),
(1, 146, 1),
(338, 147, 187),
(330, 148, 189),
(936, 148, 217),
(239, 149, 1),
(10, 149, 70),
(118, 149, 71),
(128, 149, 72),
(25, 149, 104),
(134, 149, 117),
(875, 149, 118),
(398, 149, 119),
(873, 149, 120),
(871, 149, 121),
(868, 149, 202),
(867, 149, 209),
(862, 149, 211),
(251, 150, 1),
(8, 150, 70),
(119, 150, 71),
(130, 150, 72),
(295, 150, 73),
(458, 150, 75),
(553, 150, 76),
(913, 150, 77),
(915, 150, 78),
(948, 150, 79),
(912, 150, 215),
(976, 150, 220),
(549, 152, 26),
(783, 152, 27),
(951, 152, 30),
(959, 152, 42),
(1003, 152, 212),
(953, 152, 220),
(1049, 152, 227),
(1068, 152, 232),
(1127, 152, 237),
(1159, 152, 242),
(963, 154, 42),
(621, 154, 89),
(788, 154, 100),
(1113, 154, 235),
(48, 155, 82),
(107, 155, 83),
(1011, 156, 66),
(1077, 156, 68),
(1098, 156, 69),
(209, 156, 95),
(439, 156, 97),
(568, 156, 98),
(574, 156, 99),
(846, 156, 101),
(997, 156, 103),
(1027, 156, 226),
(228, 158, 34),
(483, 158, 36),
(544, 158, 37),
(612, 158, 38),
(834, 158, 39),
(839, 158, 40),
(945, 158, 41),
(956, 158, 42),
(1038, 158, 91),
(269, 159, 1),
(22, 160, 43),
(37, 160, 44),
(72, 160, 45),
(97, 160, 46),
(146, 160, 47),
(171, 160, 48),
(212, 160, 49),
(287, 160, 50),
(380, 160, 51),
(488, 160, 53),
(459, 160, 54),
(497, 160, 55),
(601, 160, 58),
(797, 160, 59),
(811, 160, 60),
(851, 160, 61),
(882, 160, 62),
(1005, 160, 66),
(1074, 160, 68),
(1089, 160, 69),
(314, 160, 189),
(683, 160, 203),
(1024, 160, 226),
(266, 162, 1),
(77, 165, 80),
(202, 165, 81),
(206, 165, 151),
(903, 165, 198),
(905, 165, 199),
(904, 165, 200),
(911, 165, 214),
(1084, 165, 224),
(7, 167, 19),
(496, 167, 25),
(1079, 172, 68),
(1096, 172, 69),
(90, 172, 116),
(452, 172, 120),
(207, 172, 151),
(748, 172, 205),
(1064, 172, 231),
(1071, 172, 232),
(1120, 172, 235),
(916, 177, 78),
(949, 177, 79),
(421, 177, 86),
(525, 177, 88),
(626, 177, 89),
(828, 177, 90),
(1040, 177, 91),
(898, 177, 213),
(973, 177, 221),
(1124, 177, 235),
(258, 179, 1),
(2, 181, 1),
(24, 188, 104),
(133, 188, 117),
(874, 188, 118),
(393, 188, 119),
(872, 188, 120),
(870, 188, 121),
(319, 188, 189),
(869, 188, 202),
(866, 188, 209),
(865, 188, 211),
(246, 190, 1),
(731, 190, 205),
(247, 193, 1),
(248, 197, 1),
(669, 197, 203),
(726, 197, 205),
(257, 200, 1),
(262, 208, 1),
(336, 208, 187),
(233, 210, 1),
(668, 210, 203),
(725, 210, 205),
(267, 214, 1),
(670, 214, 203),
(1139, 214, 242),
(791, 216, 100),
(809, 216, 132),
(879, 216, 133),
(680, 216, 203),
(32, 217, 104),
(83, 217, 116),
(137, 217, 117),
(221, 217, 118),
(384, 217, 119),
(446, 217, 120),
(510, 217, 121),
(579, 217, 202),
(658, 217, 203),
(762, 217, 205),
(771, 217, 206),
(922, 217, 217),
(1131, 217, 242),
(261, 222, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fa2016_com_serv`
--

CREATE TABLE `fa2016_com_serv` (
  `com_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL,
  `com_title` varchar(50) NOT NULL,
  `com_advisor` varchar(60) NOT NULL,
  `com_advisor_contact` varchar(60) NOT NULL,
  `com_description` varchar(500) NOT NULL,
  `com_date` datetime NOT NULL,
  `com_hours` decimal(5,1) NOT NULL,
  `com_verified` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fa2016_com_serv`
--

INSERT INTO `fa2016_com_serv` (`com_id`, `pstu_id`, `com_title`, `com_advisor`, `com_advisor_contact`, `com_description`, `com_date`, `com_hours`, `com_verified`) VALUES
(2, 187, 'Movers & Shakers', 'Emmy Borst', 'eborst@lhup.edu', 'Assisted for 2 days in moving in freshmen to LHU dorms.  Answered their questions about campus. Represented LHU with a smile.', '2016-08-26 09:00:00', '11.0', 2),
(3, 102, 'Moving and Shaking', 'Shelby Helwig', 'honors@lhup.edu', 'I was a part of the moving and shaking at Smith. I was the first person the honors freshmen talked to when they arrived at that resident hall. I welcomed them and explained to them how everything worked, and directed the upperclassmen that were with me to them so they could get moved in.', '2016-08-25 11:00:00', '3.0', 2),
(4, 68, 'Movers and Shakers', 'Mike Heck, RHA, Hall Council', 'mheck@lhup.edu', 'For both move in days this year I volunteered to serve as a mover and shaker. I got to work with students and parents as they moved into fairview suites for the first time. Most of the time I spent directing traffic and cars and some was with the students actually unloading and loading carts. Overall a great time and a great experience. The first day went from 8:45-4 and the second from 8:45-noon. I rounded the hours so I started at 9 each day.', '2016-08-26 09:00:00', '10.0', 2),
(5, 54, 'Freshman Move In', 'Rachael Metzinger', '(570)985-4764', 'I helped Honors freshman move into their dorms at Fairview Suites.', '2016-08-25 11:00:00', '2.0', 2),
(6, 93, 'Movers and Shakers', 'Shelby Helwig', 'sth1064@lhup.edu', 'I helped move honors freshman into their dorms. I got to meet them and their parents and welcome them onto the campus for the firs time. I am also an FDG leader so I got to help my student along with the others acclimate to their first few days at the university.', '2016-08-04 12:00:00', '3.0', 2),
(7, 65, 'Convocation', 'Jackie', 'jwhitlin@lhup.edu', 'I assisted with ushering at Convocation by welcoming students and faculty into the building and handing out programs before the event.', '2016-09-07 13:00:00', '2.0', 2),
(8, 103, 'Moving and Shaking', 'Dr. Jacqueline Whitling Dumm', 'jwhitlin@lhup.edu', 'We helped move in the new Honors Freshman to their dorms. I held a sign letting parents know the Fairview Suites entrance.', '2016-08-25 11:30:00', '3.0', 2),
(9, 197, 'Haiti Mission Trip', 'Thom Fulmer', 'thom@acfellowship.org', 'I spent 7 days in Haiti on a mission trip this summer. I am claiming only 10 hours of community service, but I actually completed somewhere around 50 hours. The team I was on built a water station for a town called Onaville. We were based at an orphanage in Port au Prince, where we spent all of our down time with the children. The experience was like none other in my life and was absolutely the most profoundly life-changing experience I have ever been apart of.', '2016-06-25 00:00:00', '50.0', 2),
(10, 106, 'Moving and Shaking', 'Shelby Helwig', 'honors_program@lhup.edu', 'Helped the honors freshmen move in the dorms.', '2016-08-25 00:00:00', '3.0', 2),
(12, 188, 'Honors Move In', 'Shelby Helwig', 'honors@lhup.edu', 'Helped move in honors freshmen and other honors students.', '2016-08-25 12:00:00', '3.0', 2),
(15, 74, 'Honors Movers and Shakers', 'Shelby Helwig', 'sth1064@lhup.edu', 'I worked with other members in the Honors Program to help move in the freshman into their prospective living areas! Conversing and helping with getting all of their belongings into their new home.', '2016-08-25 00:00:00', '3.0', 2),
(16, 74, 'Movers and Shakers', 'Mike Heck', 'MHeck@lhup.edu', 'Helping the new freshman move into their living areas. Conversing with families and answering any questions. Interacting with new students was an amazing experience.', '2016-08-26 08:30:00', '3.0', 2),
(17, 74, 'Movers and Shakers', 'Mike Heck', 'MHeck@lhup.edu', 'Helping the new freshman move into their living areas. Conversing with families and answering any questions. Interacting with new students was an amazing experience.', '2016-09-24 08:30:00', '3.0', 2),
(18, 103, 'Convocation', 'Tyana Lange', 'tsl400@lhup.edu', 'I handed out programs and held the door to audience members of the convocation ceremony.', '2016-09-07 13:00:00', '2.0', 2),
(19, 113, 'Honors Freshman Move-In', 'Shelby Helwig', '7176508904', 'Helped move new Honors Freshmen into their dorms.', '2016-08-25 11:30:00', '2.0', 2),
(20, 113, 'Convocation', 'Stacey Masorti', 'sjm1038@lhup.edu', 'Handed programs to people coming in for the event, and helped set up before people showed up.', '2016-09-07 13:00:00', '2.0', 2),
(21, 160, 'Clinton County River Clean-up', 'Morgan Priscilla', 'mpc7999@lhup.edu', 'I helped clear tires and other debris out of the Susquehanna River', '2016-09-10 09:00:00', '4.0', 2),
(22, 65, 'River Clean Up', 'Morgan Capobianco', 'mpc7999@lhup.edu', 'I helped to pull tires and other trash out of the Susquehanna River.', '2016-09-10 09:00:00', '4.0', 2),
(23, 150, 'Freshman Honors Move in', 'Rachael Metzinger', '(570)-985-4764', 'Helped move the new honors freshman into their dorms.', '2016-09-25 11:30:00', '3.0', 2),
(24, 22, 'Clinton County Clean Scapes River Cleanup', 'Morgan Capobianco', 'mpc7999@lhup.edu', 'Together our group fished almost four hundred tires out of a small portion of the Susquehanna River. This was equivalent to one large and one small dumpster. In addition to the tires, we managed to fill a trailer with all sorts of plastic and metal debris. Everybody had fun working hard and getting muddy.', '2016-09-10 09:00:00', '5.0', 2),
(25, 137, 'River Clean Up', 'Morgan Capobianco', 'mpc7999@lhup.edu', 'Today I removed tires and other trash from a local river. We spent a few hours combing the river and also working together to remove the tires from the river.', '2016-09-10 09:00:00', '4.0', 2),
(26, 137, 'Moving and Shaking', 'Shelby Helwig', '717-650-8904', 'I helped move in the the new honors freshmen. I talked to these people and their families while also helping to find their new dorm room. I answered questions about the honors program and attempted to make the transition into school easier.', '2016-08-25 11:00:00', '3.0', 2),
(27, 107, 'Clinton County Cleanscapes River Cleanup', 'Morgan Capobianco', 'mpc7999@lhup.edu', 'I assisted in pulling old, discarded tires and other man-made garbage and debris out of the river. This volunteer effort helped reduce the impact on the environment.', '2016-09-10 09:00:00', '5.0', 2),
(28, 24, 'Clinton County River Clean Up', 'Morgan Capobianco', 'mpc7999@lhup.edu', 'Pulled tires out of the river.', '2016-09-10 09:00:00', '4.0', 2),
(29, 103, 'River Clean-Up', 'Morgan Capobianco', 'mpc7999@lhup.edu', 'We sifted through a river for tires and pulled them out as we did. We pulled out hundreds of tires.', '2016-09-10 09:10:00', '4.0', 2),
(31, 190, 'Movers and Shakers', 'Shelby Helwig', 'N/A', 'Helped move honors freshmen in.', '2016-08-25 11:00:00', '3.0', 2),
(32, 190, 'River Clean Up', 'Bethy Wells', 'N/A', 'Participated in annual river clean up by removing tires.', '2016-09-10 09:00:00', '4.0', 2),
(33, 75, 'Clinton County River Clean Up', 'Morgan Capobianco', 'mpc7999@lhup.edu', 'Helped pull tires and trash out of the river', '2016-09-10 09:00:00', '4.0', 2),
(34, 23, 'Clinton County River Clean-Up', 'Morgan Capobianco', 'mpc7999@lhup.edu', 'We pulled hundreds of tires out of the river!', '2016-09-10 09:00:00', '5.0', 2),
(35, 73, 'Clinton County River Clean Up', 'Morgan Capobianco', 'mpc7999@lhup.edu', 'We cleaned tires and other trash out of the river. The program has been doing this for twenty years and continually moves down the river to new spots. This allows us to clean up the the entire river. Eventually, I\'m hoping that there will no longer need to be a river clean up because that will mean there is no more trash being thrown in there.', '2016-09-10 09:00:00', '4.0', 2),
(36, 48, 'Color Event', 'Aaron Russell', 'arussel@lhup.edu', 'Set up, administered color packets, cleaned up', '2016-09-04 18:15:00', '2.0', 2),
(37, 48, 'River Cleanup', 'Aaron Russell', 'arussell@lhup.edu', 'Pulled nearly 400 tires out of river, as well as removed countless numbers of bags filled with miscellaneous trash from the water', '2016-09-10 09:00:00', '4.0', 2),
(38, 115, 'Freshmen move in', 'Rachael Metzinger', '5709854764', 'Helped move the freshmen in.', '2016-08-25 11:30:00', '3.0', 2),
(39, 115, '9/11 Memorial Ride', 'Todd Winder', '5709712685', 'Clinton Twp Fire Company has a memorial motorcycle ride each year and dedicates the day to the fallen people from 9/11. I aided as an EMT, and helped set up with the ride.', '2016-09-11 07:00:00', '11.0', 2),
(40, 66, 'Honors Moving and Shaking', 'Rachael Metzinger', 'honors_program@lhup.edu', 'I helped move in the Honors freshmen when they arrived for the semester.', '2016-08-25 00:00:00', '3.0', 2),
(41, 192, 'Movers & Shakers', 'Michael Heck', 'mheck@lhup.edu', 'I help move the incoming freshmen into the dorms for two days. It was nice helping the next person in line, because I know when I was a freshman I was thankful that I had help. It is important to help people and try to make their lives a little easier. A community mind set is much more effective than a individualized mindset. I did it August 26 and 27', '2016-08-26 00:00:00', '10.0', 2),
(42, 31, 'Clinton County River Clean-up', 'Morgan Capobianco', 'mpc7999@lhup.edu', 'Going into of Clinton County and cleaning the tires out of the Susquehanna river.', '2016-09-10 09:00:00', '5.0', 2),
(43, 27, 'Blood Drive - Tuesday', 'Danielle Michon', 'dmm6437@lhup.edu', 'Helped set up at the blood drive in the rec center from 11-12', '2016-09-13 11:00:00', '1.0', 2),
(44, 149, 'GHP Orientation', 'Shelby Helwig', 'honors@lhup.edu', 'I helped to move in the incoming honors freshmen at Fairview suites and directed traffic behind Fairview as students moved in.', '2016-08-25 00:00:00', '3.0', 2),
(45, 34, 'Red Cross Blood Drive', 'Red Cross', '1-800-RED CROSS', 'I donated one pint of blood on 9/13/16 at 5pm at the Rec Center Blood drive', '2016-09-13 16:30:00', '1.0', 2),
(46, 160, 'Blood Drive', 'Danielle Michon', 'dmm6437@lhup.edu', 'I assisted at the refreshment table, ensuring that donors felt well after donating.', '2016-09-13 11:30:00', '2.0', 2),
(47, 62, 'Freshmen Move-In', 'Rachael Metzinger', 'rxm2509@lhup.edu', 'I volunteered to help with the honors freshmen move-in and the university freshmen move-in. I assisted the freshmen with moving all of their belongings into their dorm and answered any questions that they might have had.', '2016-08-25 10:00:00', '2.0', 2),
(48, 62, 'Blood Drive', 'Lauren Wright', 'law3363@lhup.edu', 'I volunteered to sit at the recovery table at the blood drive held in the Rec Center. The recovery table provides the donors with snacks and drinks after they have donated blood. I sat at the recovery table to make sure that the donors get plenty of food and drink and to make sure that they are well enough to leave.', '2016-09-13 12:00:00', '2.0', 2),
(49, 67, 'Blood Drive', 'Danielle Michon', 'dmm6437@lhup.edu', 'I donated blood to the blood drive.', '2016-09-13 14:59:00', '1.0', 2),
(50, 67, 'March of Dimes Fundraiser', 'Dio Rivera', 'dkr6862@lhup.edu', 'I raised money for the March of Dimes with my sorority on campus.', '2016-09-12 12:00:00', '1.0', 2),
(51, 69, 'Red Cross Blood Drive', 'Danielle Michon', 'dmm6437@lhup.edu', 'Walked around campus and passed out flyers, sat at the snack table and served snacks to the donors', '2016-09-13 11:30:00', '5.0', 2),
(52, 69, 'Red Cross Blood Drive', 'Danielle Michon', 'dmm6437@lhup.edu', 'Walked around campus and passed out flyers, sat at the snack table and served snacks to the donors', '2016-09-13 11:30:00', '5.0', 2),
(53, 160, 'Blood Drive', 'Danielle Michon', 'dmm6437@lhup.edu', 'I assisted at the refreshment table, handing out snacks and beverages, while ensuring everyone felt okay.', '2016-09-14 14:30:00', '2.0', 2),
(54, 210, 'Movers & Shakers', 'Shelby & Rachael', 'Honors@lhup.edu', 'I moved in freshmen.', '2016-08-25 00:00:00', '2.0', 2),
(55, 210, 'River Clean-up', 'Beth Wells', 'Honors@lhup.edu', 'Dredged tires from the Susquehanna River.', '2016-09-10 00:00:00', '4.0', 2),
(56, 210, 'Blood Drive', 'American Red Cross', 'Cheryl', 'I donated blood.', '2016-09-14 00:00:00', '1.0', 2),
(57, 103, 'Blood Drive', 'Dr. Jackie Dumm', 'jwhitlin@lhup.edu', 'I donated 1 bag of blood.', '2016-09-14 14:30:00', '1.0', 2),
(58, 50, 'Volunteer at LHU Bingo', 'Coach Kathy Brown', '706-897-0596', 'Lock Haven hosted a bingo at Sloan Auditorium that as a team we volunteered for by checking to see if participants had winning bingo cards and we handed out numerous prizes.', '2016-09-04 14:00:00', '2.0', 2),
(59, 14, 'Clinton County CleanScapes River Clean-up', 'Morgan Capobianco', 'mpc7999@lhup.edu', 'Collecting man-made related debris and tires from the Susquehanna River.', '2016-09-10 09:00:00', '5.0', 2),
(60, 137, 'Red Cross Blood Drive', 'Lauren Wright', 'law3363@lhup.edu', 'I helped out at the blood drive at the refreshment table. I made sure people were feeling okay after donating blood.', '2016-09-13 11:30:00', '2.0', 2),
(61, 137, 'Red Cross Blood Drive', 'Lauren Wright', 'law3363@lhup.edu', 'I helped out at the blood drive at the refreshment table. I made sure people were feeling okay after donating blood.', '2016-09-14 14:30:00', '2.0', 2),
(62, 62, 'Blood Drive', 'Lauren Wright', 'law3363@lhup.edu', 'I volunteered to set up the recovery table at the blood drive held in the Rec Center. The recovery table provides the donors with snacks and drinks after they have donated blood.', '2016-09-14 11:00:00', '1.0', 2),
(63, 28, 'Blood Drive', 'unknown', 'unknown', 'Donated blood and waited approx. 90 minutes, donated in about 20-25.', '2016-09-13 16:00:00', '1.0', 2),
(64, 143, 'Moving and Shaking', 'Rachael Metzinger', 'honors@lhup.edu', 'Helped move in Honors freshman', '2016-08-25 10:00:00', '3.0', 2),
(65, 17, 'Blood Drive', 'Red Cross', 'www.redcross.org', 'Donated blood at the Rec Center', '2016-09-14 13:30:00', '1.0', 2),
(66, 161, 'Clinton County River Clean Up', 'Morgan Capobianco', 'mpc7999@lhup.edu', 'Collected tires and trash from the river.', '2016-09-11 09:00:00', '5.0', 2),
(67, 165, 'River Cleanup', 'Morgan Capobianco', 'mpc7999@lhup.edu', 'We removed tires and other trash from the river in order to dispose of it in a more proper manner', '2016-09-10 09:00:00', '5.0', 2),
(68, 17, 'Watering Field Hockey Field', 'Patrick Long', 'pdl347@lhup.edu', 'Every home field hockey game requires the turf to be watered, so I helped set up hoses and clean up', '2016-09-18 11:00:00', '2.0', 2),
(69, 191, 'Voter Registration', 'Kerry Cahoon', '(952) 221-5854', 'I went door-to-door in Lock Haven to register voters for the upcoming election.', '2016-09-18 12:00:00', '2.0', 2),
(70, 95, 'Annual River Clean Up', 'Morgan Capobianco', 'mpc7999@lhup.edu', 'I picked trash and old tires out of the river with the River Serve group.', '2016-09-10 09:00:00', '5.0', 2),
(71, 72, 'Watered Field Hockey Field', 'Danielle Barney', 'dbarney@lhup.edu', 'I went to the field hockey field three hours before their game and made sure the field was ready to go for the game. The field needed to be watered and set up.', '2016-09-18 11:00:00', '2.0', 2),
(72, 72, 'Referee', 'Patrick Long', 'pdl347@lhup.edu', 'I refereed the Mill Hall U12 Co-Ed soccer game', '2016-09-18 15:00:00', '2.0', 2),
(73, 123, 'Penn State Football Game', 'Whitney Boshart', 'web1120@lhup.edu', 'Work with Landmark security services during Penn State football games. Had to use a magnetic detecting wand to scan people\'s pockets before they entered the game and provide help services throughout the game.', '2016-09-17 06:30:00', '9.0', 2),
(74, 123, 'Ball Girl LHU Field Hockey', 'Whitney Boshart', 'web1120@lhup.edu', 'Work as ball girl for LHU field hockey team', '2016-09-18 13:45:00', '1.0', 2),
(75, 17, 'Mill Hall AYSO Volunteer Soccer Referee', 'Patrick Long', 'pdl347@lhup.edu', 'I was a volunteer referee for a U12 Co-ed soccer game in the Mill Hall AYSO soccer league.', '2016-09-18 15:00:00', '2.0', 2),
(76, 80, 'River Clean-Up', 'Morgan Priscilla Capobianco', 'mpc7999@lhup.edu', 'I accompanied a large group of student from campus to a branch of the Susquehanna river located in Jersey Shore to remove tires from where they have been washed into the river after decades of dumping them on the land next to the river. overall, we pulled 400 tires from the river that day.', '2016-09-10 09:00:00', '5.0', 2),
(77, 60, 'Blood Drive', 'American Red Cross', '18007332767', 'Donated blood at the American Red Cross Blood Drive.', '2016-09-13 17:00:00', '1.0', 2),
(78, 36, 'River Clean-Up', 'Morgan Capobianco', 'mpc7999@lhup.edu', 'Went to Clinton County and cleaned tires out of the river', '2016-09-10 09:00:00', '5.0', 2),
(79, 189, 'Blood Donation', 'Red Cross', 'Red Cross', 'I gave double red blood cells at the american red cross. With my O+ blood it is always desired so I try to give whenever I can.', '2016-09-14 14:00:00', '1.0', 2),
(80, 189, 'American Dream Ride', 'Wayne Halliday', 'wayne.halliday@gmail.com', 'This was a charity event motorcycle ride were all of the proceeds went to Dream Come True. At the event I was helping to register people for the event and also helping with the Chinese auction. In between these two tasks I went on the motorcycle ride through the Poconos. It was a great ride and benefit that i\'m glad I got to be a part of', '2016-09-18 07:00:00', '4.0', 2),
(81, 145, 'BENV Kiwanis Kicks Cancer for Kids', 'Jodi Treas', '5704194049', 'At this event we helped a local Kiwanis club to raise money for children that suffer from childhood cancer. At this event there were a variety of games, organizations, and a bake and soup sale as a way to raise money for these things.', '2016-09-17 08:00:00', '5.0', 2),
(82, 191, 'Voter Registration', 'Kerry Cahoon', '952-221-5854', 'I went with Kerry Cahoon of the Democratic Party to register student voters around campus.', '2016-09-25 12:00:00', '2.0', 2),
(83, 52, 'Blood Donation', 'American Red Cross', '570-793-2717', 'I donated blood', '2016-09-13 16:00:00', '1.0', 2),
(84, 125, 'Youth Group Leading', 'Ashley Stensland', 'joyhopefaithlove@comcast.net', 'I am a leader for my church\'s youth group and we held youth group last night. I taught a lesson and talked with the kids.', '2016-09-25 17:30:00', '2.0', 2),
(85, 67, 'Wendy\'s Fundraiser', 'Mariah Kachmar', 'mlk3933@lhup.edu', 'My sorority planned a fundraiser where 10% of all sales went towards our local philanthropy. We went there to thank people as well as eat with them.', '2016-09-26 17:00:00', '2.0', 2),
(86, 67, 'Club Fair', 'Mariah Kachmar', 'mlk3933@lhup.edu', 'I helped with my sorority\'s table and CKI table. I answered questions and helped freshman find what tables they were looking for.', '2016-09-14 12:00:00', '3.0', 2),
(87, 159, 'Honors Freshmen Move-In', 'Dr. Dumm, Thomas Bates', 'twb9017@lhup.edu', 'Helped honors students move into their dorm rooms.', '2016-08-25 12:00:00', '3.0', 2),
(88, 159, 'Out of the Darkness Suicide Prevention Walk', 'Mr. Cody Meyers', '(570) 484-2903', 'Attended the annual Suicide Prevention Walk for Clinton County. Listened to presentations and inspirational speakers, then after walked 3 laps in honor of people who\'s lives were taken away by the act of suicide.', '2016-09-25 15:00:00', '1.0', 2),
(89, 144, 'Penn state football', 'Tim Jackson', 'timjack8101@gmail.com', 'Volunteered at a food stand before and during a Penn state football game', '2016-09-17 09:00:00', '5.0', 2),
(90, 144, 'Penn state football', 'Tim jackson', 'timjack8101@gmail.com', 'volunteered at a food stand before and during a Penn state football game.', '2016-09-03 12:00:00', '5.0', 2),
(91, 191, 'Voter Registration', 'Kerry Cahoon', '952-221-5854', 'Went with Kerry Cahoon of the Democratic National Party to register Lock Haven students to vote.', '2016-10-02 12:00:00', '2.0', 2),
(92, 59, 'Movers and Shakers', 'Shelby Helwig', 'honors@lhup.edu', 'I helped check in the honors freshmen and give them all the information that they needed for move in day.', '2016-08-25 00:00:00', '3.0', 2),
(93, 17, 'Field Hockey Field Preparation', 'Patrick Long', 'pdl347@lhup.edu', 'Moved goals on and off field, set up flags, helped with scoreboard and maintenance of field before game', '2016-10-02 08:00:00', '1.0', 2),
(94, 17, 'Mill Hall AYSO Volunteer Soccer Referee', 'Patrick Long', 'pdl347@lhup.edu', 'Volunteered as a ref for a coed u12 soccer game in the Mill Hall AYSO league.', '2016-10-02 15:15:00', '2.0', 2),
(95, 134, 'Oley Fair Clean Up', 'Mike Schaeffer', '4843881033', 'Assisted the clean up operations after the community fair. Helped put away signs, tables, and chairs. Aided in gathering trash and making sure the fairgrounds were clean. Helped venders clean up their tent areas.', '2016-09-18 07:00:00', '8.0', 2),
(96, 189, 'Strongman competition', 'David Monsel', 'dam9803@lhup.edu', 'On September 24th I helped to lift and set up all of the competition events such as moving the rope for the truck pull, spotting the lifters, moving the weights into the designated positions, and rolling cement blocks off of stands and into the correct position for people to lift them.', '2016-09-24 07:00:00', '7.0', 2),
(97, 60, 'Downtown Window Decorating', 'Lauren Wright', 'law3363@lhup.edu', 'Visited Avenue 209 Coffeehouse and Reese\'s printing to paint windows to beautify downtown.', '2016-10-05 12:30:00', '2.0', 2),
(98, 98, 'Convocation Volunteer', 'Dr. Dumm', 'jwhitlin@lhup.edu', 'Served as an usher for the fall convocation and handled out programs for the event.', '2016-09-07 00:00:00', '2.0', 2),
(101, 191, 'Voter Registration', 'Kerry Cahoon', '952-221-5854', 'Before the rally with Governor Wolf and Representative Hanna, I registered voters on Ivy Lane', '2016-10-05 12:00:00', '1.0', 2),
(102, 48, 'Eagleton 50k Trail Race', 'Aaron Russell', 'arussell@lhup.edu', 'Worked as a crossing guard for runners competing in the race. Job included stopping traffic, assuring health/safety of competitors, and cheering them on, etc', '2016-10-09 07:00:00', '6.0', 2),
(103, 34, 'Steamtown Marathon', 'Cynthia Weiss', 'cweiss@fcrsd.org', 'The starting line for the Steamtown Marathon is in the parking lot of Forest City High School. this takes many volunteers, many of which are faculty, students and alumni. While there, I greeted buses full of runners explaining to them what they were to be doing and where to go. After the runners take off, there is lots of clean-up to be done by the volunteers as well.', '2016-10-09 05:30:00', '3.0', 2),
(104, 201, 'Buddy Walk', 'Linda Crawley', '570-772-2534', 'The event was held at the Williamsport Memorial Park. It supported and raised awareness for people with downs syndrome. I helped maintain a pumpkin decorating station before the event, as well as walk the event, and help out after with food afterwards for the community.', '2016-10-09 12:00:00', '3.0', 2),
(105, 132, 'Penn State Football Game', 'Whitney Boshart', 'web1120@lhup.edu', 'LHU Womens lacrosse team volunteered at the Penn State Football Game on September 17. We performed security-like jobs at the front gates before people went through the ticket line.', '2016-09-17 07:00:00', '9.0', 2),
(106, 132, 'Lock Haven Lacrosse Clinic', 'Whitney Boshart', 'web1120@lhup.edu', 'I was part of half of our team that coached a high school girls lacrosse clinic at our field, Charlotte E. Smith Field that day. We taught them various drills, games, and lacrosse techniques and coached them throughout the day.', '2016-09-24 08:00:00', '8.0', 2),
(107, 123, 'Lacrosse Clinic', 'Whitney Boshart', 'Web1120@lhup.edu', 'Teach clinic attendees drills and coach them throughout the day for various drills and games. This clinic was for high school aged lacrosse players that are possible recruiting prospects for the Lock Haven lacrosse team.', '2016-09-24 08:00:00', '8.0', 2),
(108, 188, 'Open House', 'Rachel Metzinger', 'honors_program@lhup.edu', 'Worked with the A-Team at the Open House to help recruit new students into the program.', '2016-10-08 08:30:00', '2.0', 2),
(110, 161, 'Exeter Haunted Hayride', 'Denise Kramer', '6104053287', 'Volunteered with my old Girl Scout Troop. Service entailed running a game booth for our community\'s annual Halloween event.', '2016-10-07 19:00:00', '3.0', 2),
(111, 114, 'Moving and Shaking', 'Shelby Helwig', '717-650-8904', 'Helped honors freshmen move into their dorms.', '2016-08-25 12:00:00', '2.0', 2),
(112, 162, 'Operation Christmas Child', 'Tammey Aichner', 'danoaichner@hotmail.com', 'Wrapped shoe boxes to use for Samaritan\'s Purse that can then be used for holidays gifts for children around the world.', '2016-09-17 00:00:00', '2.0', 2),
(113, 162, 'Samaritan\'s Purse Display', 'Tammey Aichner', 'danoaichner@hotmail.com', 'Set up a display for Samaritan\'s Purse/ Operation Christmas Child.', '2016-10-09 10:00:00', '1.0', 2),
(114, 162, 'Meal in a Bag', 'Tammey Aichner', 'danoaichner@hotmail.com', 'Delivered meals in a bad to low income areas around home.', '2016-10-08 10:00:00', '2.0', 2),
(115, 21, 'Hunger bowl', 'GHP', 'honors_program@lhup.edu', 'I brought in 12 cans of food to the honors house for the hunger bowl', '2016-10-11 00:00:00', '2.0', 2),
(116, 114, 'Concession stand volunteer', 'Kate Jackson', '859-319-9454', 'Volunteered at a concession stand at Beaver Stadium, serving food', '2016-09-17 08:00:00', '5.0', 2),
(117, 114, 'Concession Stand Volunteer', 'Kate Jackson', '859-319-9454', 'Volunteered working a concession stand at Beaver Stadium, serving food', '2016-10-01 09:00:00', '5.0', 2),
(118, 103, 'Admissions Open House', 'Dr. Jackie Whitling-Dumm', 'jwhitlin@lhup.edu', 'We talked and interviewed prospective students who were interested in the Honors program.', '2016-10-08 08:30:00', '2.0', 2),
(119, 22, 'Clinton County Women\'s Shelter Volunteer Work', 'Dawn Barner', '570-748-9539', 'I vacuumed and mopped all of the rooms on the first floor. I also wiped down all of the windows on the first floor.', '2016-10-14 01:00:00', '1.0', 2),
(120, 212, 'Red Cross Home Fire Preparedness Event', 'Janel Gordner', 'janel.gordner@redcross.org', 'The American Red Cross went around to families of the community to check and replace fire detectors for free. While we were there, we also gave them a floor plan layout so they could develop a fire escape root in case of an emergency. The families we helped were extremely grateful and welcomed us into their homes with open arms. I had an overall wonderful volunteer experience with the Red Cross.', '2016-10-14 13:30:00', '3.0', 2),
(121, 8, 'lock haven shoe bank', 'Wendy Stiver', 'wstiver@lockhaven.com', 'help people determine shoe size and pick out shoes', '2016-10-15 10:30:00', '4.0', 2),
(122, 134, 'Oley Halloween Parade Set Up/Clean up', 'Mike Schaeffer', '4843881033', 'Helped line up floats and those entered in the parade. Helped hand out lunch for all of the individuals involved. Set up for the homecoming king and queen announcement ceremony. Helped clean up the fairgrounds after the event.', '2016-10-15 12:00:00', '4.0', 2),
(123, 98, 'Honors Orientation- Movers and Shakers', 'Shelby Helwig', '717-650-8904', 'Worked with other honors students to move in freshmen honors students as part of the GHP orientation process.', '2016-08-25 00:00:00', '3.0', 2),
(124, 98, 'Open House Volunteer- A-Team', 'Shelby Helwig', '570-974-8757', 'Volunteered time on A-team to talk to perspective honors students at an open house. Also conducted an interview in the afternoon.', '2016-10-08 00:00:00', '3.0', 2),
(125, 65, 'Hunger Bowl Donations', 'Jackie Dumm', 'jwhitlin@lhup.edu', 'I donated 10 non-perishable food items for the local huger bowl to help feed families in need.', '2016-10-19 12:00:00', '2.0', 2),
(126, 149, 'Honors Admissions Team Open House', 'Shelby Helwig', 'honors@lhup.edu', 'I talked to high school students at the open house about possibly joining the Honors Program. I also trained a freshman who was doing Admissions Team for the first time. I also gave an interview in the afternoon portion of the open house.', '2016-10-08 08:00:00', '2.0', 2),
(127, 63, 'Painting', 'Mary Beth Ruggiero', 'mbr6609@lhup.edu', 'I helped to paint the set for the Brothers Grimm Spectaculathon on Saturday. They have been struggling to find people to finish the set before the show starts.', '2016-10-15 13:00:00', '5.0', 2),
(128, 22, 'C.C.W.C. Candle Light Vigil', 'Dawn Barner', '570-748-9539', 'A candle light vigil was held in memory of those who lost their lives to domestic violence in Clinton county. I helped by passing out glow sticks, programs, donuts, and candles. At the end I helped clean up and take down all of the decorations.', '2016-10-19 17:45:00', '1.0', 2),
(129, 191, 'Campaigning', 'Kerry Cahoon', '952-221-5854', 'I worked with the Democratic National Party to campaign for Hillary Clinton in Bentley', '2016-10-23 15:00:00', '3.0', 2),
(130, 28, 'Food drive', 'Regina Beers, Roxanne Aretta', '814-762-3732', '10 cans for 2 hours service', '2016-10-21 00:00:00', '2.0', 2),
(131, 211, 'APSCUF Strike', 'Dr. Burkholder; Dr. Schillig; Dr. Devi; Dr. Baker', 'lhup.edu email', 'I supplied two separate faculty strike stations with one bag of oranges and a large variety bag of chips each (by the PUB and in front of Stevenson Library). I also participated in striking alongside the faculty each day that the strike was in progress. (3+ hours each day of striking, plus an hour for each donation?) I\'m not sure how this should be counted.', '2016-10-19 00:00:00', '5.0', 2),
(132, 41, 'Lock Haven Weight Room', 'Coach Danielle Fraser', 'dfraser@lhup.edu', 'Monitored the Rogers Gym weight room, made sure people signed in, and cleaned up after the day was over.', '2016-09-06 00:00:00', '12.0', 2),
(133, 91, 'Moving and Shaking', 'Shelby Helwig', '717-650-8904', 'I helped the freshman move into their dorms and get settled.', '2016-08-25 11:30:00', '3.0', 2),
(134, 91, 'Hunger-Bowl', 'Shelby Helwig', '717-650-8904', 'I donated 5 cans to the hunger bowl for honors.', '2016-10-25 16:30:00', '1.0', 2),
(135, 212, 'Favors Forward - Haven Helpers', 'Dr. Helen Prien', 'hprien@lhup.edu', 'For my small group communications class, several others and I went to Williamsport as volunteers for a program called Favors Forward. This is a program for elderly adults who need help around their house and yard with things they are unable to do by themselves anymore. We visited two houses - at one house we cleaned out and reorganized a lady\'s back porch that was infested by birds earlier this fall - at another lady\'s house we raked leaves and put them curbside for the town to pick them up.', '2016-10-24 14:30:00', '3.0', 2),
(136, 165, 'Road Cleanup', 'Bob Myers', 'rmyers3@lhup.edu', 'The Lock Haven Environmental Club walked the length of Glen Road, picking up any and all trash that we found as we went.', '2016-10-18 17:00:00', '2.0', 2),
(137, 43, 'A-team', 'Shelby Helwig', 'shelby', 'worked at open house', '2016-10-08 08:00:00', '2.0', 2),
(138, 43, 'Hunger Bowl', 'Bethy Wells', 'Bethy', '10 cans', '2016-10-20 17:00:00', '2.0', 2),
(139, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Kathy Deavor', '(570) 295-7109', 'I co-teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2016-09-21 17:30:00', '2.0', 2),
(140, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Kathy Deavor', '(570) 295-7109', 'I co-teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2016-10-05 17:30:00', '2.0', 2),
(141, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Kathy Deavor', '(570) 295-7109', 'I co-teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2016-10-12 17:30:00', '2.0', 2),
(142, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Kathy Deavor', '(570) 295-7109', 'I co-teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2016-10-19 17:30:00', '2.0', 2),
(143, 82, 'Lock Haven Lacrosse Clinic', 'Whitney Boshart (coach)', 'web1120@lhup.edu', 'During this clinic, Lock Haven recruits and anyone interested in expanding their knowledge about lacrosse was welcome to come. We helped to coach the young girls and run through drills. There were about 30 girls at the clinic and we spent the day coaching, guiding, and teaching lacrosse. At the end we even had 2 girls commit to play with us next year!!!', '2016-09-24 08:00:00', '8.0', 2),
(144, 107, 'All Night Bowling Fundraiser', 'Morgan Capobianco', 'mpc7999@lhup.edu', 'I obtained a ticket and shoe rentals to have unlimited bowling. A portion of the proceeds from my ticket went to a local food bank, thereby raising money in and supporting my local community.', '2016-10-21 23:00:00', '3.0', 2),
(145, 34, 'Food Drive Donation', 'Amy Downs', 'abd350@lhup.edu', 'Donated 5 items of non-perishable food at Smith Hall', '2016-10-27 00:00:00', '1.0', 2),
(146, 5, 'Red Cross Blood Drive', 'Lauren Wright', 'law3363@lhup.edu', 'Passed out snacks and water at the blood drive and monitored people for signs of lightheadedness. (Sept 13: 11am-4pm, Sept 14: 11:30-6pm)', '2016-09-13 11:00:00', '11.0', 2),
(147, 34, 'Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'I spent time with the Admissions Team on Saturday speaking with prospective students', '2016-10-29 08:15:00', '2.0', 2),
(148, 145, 'A Team Open House', 'Shelby Helwig', '717-650-8904', 'During the Open House this weekend, I had a chance to talk with a few prospective students and tell them about the program. The female student that I interviewed, Olivia, and I had a great session, and she showed a genuine interest in the program. She was also very willing to ask any questions she had, and was very excited by a lot of the answers she got. I honestly think that if she comes to LHU, she will be a part of the program!', '2016-10-29 08:00:00', '2.0', 2),
(149, 145, 'InterPACK 2016', 'Jessica Tressa', '570-881-0748', 'This was a Circle K Conference in which a variety of service projects were done for the benefit of small children. While there, I made a variety of spiritual reflection bags, colored puzzles for the children to build, wrote letters that would go to hospitalized children in the UK, completed color a smile pictures, and packaged hotel shampoos and conditioners that would be donated to women\'s shelters across PA.', '2016-10-21 18:00:00', '5.0', 2),
(150, 191, 'Campaigning for Hillary Clinton', 'Kerry Cahoon', '952-221-5854', 'I went to the homes of registered democrats in Lock Haven and asked them who they are planning to vote for', '2016-10-30 15:00:00', '3.0', 2),
(151, 102, 'Open House', 'Shelby Helwig', 'honors@lhup.edu', 'As a member of A-Team, I attended the Open House, talked to prospective students, and conducted an interview.', '2016-10-29 08:00:00', '2.0', 2),
(152, 22, 'Open House', 'Shelby Helwig', 'honors@lhup.edu', 'Helped pass out flyers, talked to to prospective students and their families, and interviewed students', '2016-10-08 08:30:00', '2.0', 2),
(153, 22, 'LHU A-Team Orientation', 'Shelby Helwig', 'honors@lhup.edu', 'helped pass out flyers, talked to prospective students and their families, and conducted interviews', '2016-10-29 08:30:00', '2.0', 2),
(154, 17, 'Hunger Bowl', 'Patrick Long', 'pdl347@lhup.edu', 'Brought in 5 cans of food for the Hunger bowl', '2016-10-31 12:00:00', '1.0', 2),
(155, 17, 'Mill Hall AYSO Volunteer Referee', 'Patrick Long', 'pdl347@lhup.edu', 'Volunteer soccer referee for U12 soccer game in Mill hall league', '2016-10-31 15:00:00', '2.0', 2),
(156, 200, 'Bowling for Saint Judes', 'Greg Segarra', '(267) 229-5667', 'We bowled from 11pm-4am to raise money and awareness for Saint Jude\'s. It was a really amazing time.', '2016-10-28 23:00:00', '5.0', 2),
(157, 188, 'A-Team/Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'I helped recruit new students into the honors program.', '2016-10-28 08:00:00', '2.0', 2),
(158, 74, 'Circle K Halloween Party', 'Megan McKenna', 'mem271@lhup.edu', 'I helped set up the halloween party for Circle K.', '2016-10-26 17:00:00', '2.0', 2),
(159, 84, 'Salvation Army', 'Kirsten', '570-748-2951', 'Helped out with pricing and putting things away at the Salvation Army', '2016-10-27 12:15:00', '5.0', 2),
(160, 47, 'Food Drive - Cans', 'Honors Directors', 'Honors House', 'Brought in 10 non-perishable food cans to the honors house', '2016-10-27 00:00:00', '2.0', 2),
(161, 88, 'Mover and Shaker', 'Dr. Jackie Dumm', 'jwhitlin@lhup.edu', 'A handful of honors students helped move in the freshman into their resident\'s hall. My job was to help unpack the student\'s belongings and place them in bins and take them to their designated rooms. This allowed me to get an idea who was new in the program and also, to get to know them better.', '2016-08-25 11:00:00', '3.0', 2),
(162, 47, 'BINGO', 'Kathy Brown', '7068970596', 'Ran the bingo event with my teammates for community service', '2016-09-04 12:00:00', '2.0', 2),
(163, 50, 'Non-Perishable Food Collection', 'Global Honors Program', 'Honors Directors', 'Donated 10 Non-perishable food cans.', '2016-10-30 00:00:00', '2.0', 2),
(164, 125, 'Youth Group Leadership', 'Ashley Stensland', 'joyhopefaithlove@comcast.net', 'I helped lead the girl\'s youth group at my church. I lead a discussion about a topic in the Bible and helped facilitate pumpkin carving with the kids.', '2016-10-23 17:30:00', '2.0', 2),
(165, 125, 'Youth Group Leadership', 'Ashley Stensland', 'joyhopefaithlove@comcast.net', 'I helped lead the girl\'s youth group at my church. I hung out with the girls and got to ask some of them about what was going on in their lives. I also helped with discussion during another leader\'s lesson.', '2016-10-30 17:30:00', '2.0', 2),
(166, 88, 'Homecoming Block Party Assitant', 'Ashley Spencer', 'aspencer@lhup.edu', 'My job for this event was to assist Haven Leadership with the Block Party by having students sign in. Also, I was to hand out t-shirts for all the alumni and current students of Lock Haven University who attended. We advised alumni of what events were going on and helped them find where they could go.', '2016-10-14 18:00:00', '1.0', 2),
(167, 47, 'LHU Soccer Clinic and Tours', 'Kathy Brown (Coach)', '7068970596', 'Registered and helped run the women\'s soccer clinic for high school girls. Answered questions for parents and gave tours around campus and dorms', '2016-10-30 13:00:00', '4.0', 2),
(168, 50, 'LHU ID Soccer Clinic', 'Coach Kathy Brown', '706-897-0596', 'I worked a LHU ID Soccer clinic where I was responsible for assisting high-school players and answering questions.', '2016-10-30 00:00:00', '2.0', 2),
(169, 110, 'Hunger Bowl', 'Elizabeth Wells', 'ejw4272@lhup.edu', 'I brought in 10 cans of perishable food for the canned food drive.', '2016-10-24 12:00:00', '2.0', 2),
(170, 190, 'Movers and Shakers', 'Shelby Helwig', 'N/A', 'Helped move in honors freshmen', '2016-09-25 11:00:00', '3.0', 3),
(171, 190, 'A-Team', 'Shelby Helwig', 'N/A', 'Help train new A-Team members at the first open house', '2016-10-08 08:00:00', '2.0', 2),
(172, 60, 'SPCA', 'Scott Knyrim', '5704784756', 'Took multiple dogs on walks and played with cats.', '2016-10-24 14:00:00', '2.0', 2),
(173, 25, 'Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'Work with Honors Admission team for an open house', '2016-10-08 08:20:00', '2.0', 2),
(174, 60, 'SPCA', 'Scott Knyrim', '5707484756', 'Walked multiple dogs and entertained cats.', '2016-10-17 14:00:00', '2.0', 2),
(175, 25, 'Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'Work an open house with Honors Admission Team', '2016-10-29 08:15:00', '1.0', 2),
(176, 158, 'Troop 79 Climbing Merit Badge Weekend', 'LaRue Reedy', '570-768-8769', 'The entire weekend was spent working towards getting 12 members from Troop 79 in Sullivan County to complete the requirements for the climbing merit badge. They were on the climbing tower at Camp Brule\' in Forksville, PA.', '2016-10-01 08:00:00', '12.0', 2),
(177, 78, 'Democratic Party Office', 'Shannon Lachman', '8142321665', 'Working in the Clinton County Democratic office.', '2016-10-31 16:00:00', '4.0', 2),
(178, 160, 'A-team Open House', 'Shelby Helwig', '7176508904', 'I talked with perspective students at the October 29th open house. I was also available to preform an interview in the afternoon.', '2016-10-29 08:15:00', '2.0', 2),
(179, 158, 'Food Drive', 'Dr. Drumm', '?', '15 cans of veggies, soups, and spagettio\'s were donated at the honors house.', '2016-11-04 09:26:00', '2.0', 2),
(180, 72, 'Volunteer at Salvation Army', 'Coach Pat Long', '1-570-660-2093', 'Some members of the LHU mens soccer team volunteered a couple hours to help the children at the salvation army with homework. We also played with them outside during recess.', '2016-11-02 00:00:00', '2.0', 2),
(182, 156, 'Elizabeth Wells', 'Dr. Dumm', 'jwhitlin@lhup.edu', 'I donated 10 nonperishable items toward the GHP\'s donation to the Hunger Bowl cause.', '2016-11-04 12:00:00', '2.0', 2),
(183, 103, 'Open House', 'Dr. Jackie Dumm', 'jwhitlin@lhup.edu', 'We met with prospective students for Lock Haven University and the Global Honors Program', '2016-10-29 08:15:00', '2.0', 2),
(184, 50, 'Volunteer at LHU Swim Meet', 'Coach Kathy Brown', '706-897-0596', 'Assisted in being a back up timer for the swim meet.', '2016-11-05 00:30:00', '2.0', 2),
(185, 217, 'River Cleanup', 'Morgan Capobianco', 'mpc7999@lhup.edu, or 570.484.2499.', 'River Cleanup', '2016-09-10 08:00:00', '4.0', 2),
(186, 217, 'Open House', 'Shelby/Rachel', 'Honors@lhup.edu', 'A-Team', '2016-10-08 08:00:00', '2.0', 2),
(187, 217, 'Open House', 'Shelby', 'Honors@lhup.edu', 'A-Team', '2016-10-29 08:00:00', '2.0', 2),
(188, 122, 'Habitat for Humanity', 'Stephanie Clevenger', '(814) 353-2390 or restore@habitatgcc.org', 'Volunteered at Habitat for Humanity Greater Centre County ReStore performing various tasks such as cleaning and lifting.', '2016-11-05 00:00:00', '5.0', 2),
(189, 213, 'Move In Weekend', 'Emmy Borst', 'Emmy Borst', 'I helped the new Freshmen move in over the first weekend before classes.', '2016-08-26 08:00:00', '8.0', 2),
(190, 213, 'Move In Weekend', 'Emmy Borst', 'Emmy Borst', 'I helped move freshmen in over the first weekend of the semester.', '2016-08-27 08:00:00', '6.0', 2),
(191, 149, 'Honors Admissions Team Open House', 'Shelby Helwig', 'honors@lhup.edu', 'During the morning section of the open house, I talked to high school students about joining the honors program and the application process for it. In the afternoon, I sat at the table and directed students into our room so they could take their interviews.', '2016-10-29 08:00:00', '2.0', 2),
(192, 59, 'A-Team', 'Shelby Helwig', 'honors@lhup.edu', 'Helping out at the open house in the morning, and the afternoon for interviews', '2016-10-29 08:00:00', '2.0', 2),
(193, 132, 'Halloween nursing home activity', 'Whitney Boshart', 'web1120@lhup.edu', 'Our lacrosse team went to Susque View rehabilitation center to help the elderly hand out candy to children Trick-or-Treaters. We also hosted stands of games for the children.', '2016-10-27 17:45:00', '2.0', 2),
(194, 133, 'Penn State Concessions (CSF)', 'Buzz', 'http://csf-lhu.weebly.com/leadership-team.html', 'Volunteered with CSF (Christian Student Fellowship of both LHU and PSU) to run a concession stand at a Penn State football game.', '2016-09-24 08:00:00', '8.0', 2),
(195, 133, 'Little Pine State Park Trail Cleanup', 'Bob Myers', 'rmyers3@lhup.edu', 'Went with environmental club to Little Pine State Park and helped clean section of the Mid-State Trail.', '2016-11-05 10:00:00', '4.0', 2),
(196, 53, 'Movers and Shakers', 'Shelby', 'Shelby', 'Helped freshman students move in', '2016-08-25 00:00:00', '3.0', 2),
(197, 53, 'A- Team open House', 'Shelby', 'Shelby', 'work the morning and afternoon session for the open house', '2016-10-08 00:00:00', '2.0', 2),
(198, 53, 'A team open house', 'shelby', 'shelby', 'worked the morning and afternoon sessions for the open house', '2016-10-29 00:00:00', '2.0', 2),
(199, 11, 'Hunger Bowl', 'FDG leaders Chadd and Morgan', '5703671478', 'Donated 10 cans of food', '2016-11-02 17:00:00', '2.0', 2),
(200, 43, 'A-team', 'Shelby', 'Shelby', 'worked morning and afternoon session at open house', '2016-10-29 00:00:00', '2.0', 2),
(201, 39, 'A-Team open house', 'Shelby Helwig', 'sth1064@lhup.edu', 'Attended open house as a member of A-team and talked to seniors in high school to recruit them to the GHP. I also attended the afternoon session and interviewed students.', '2016-10-08 08:00:00', '2.0', 2),
(202, 39, 'Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'Attended open house as a member of Admissions Team, and recruited high school seniors to join the GHP. I also attended the afternoon session for interviews.', '2016-10-29 08:00:00', '2.0', 2),
(203, 23, 'Cans for Hunger Bowl', 'Chadd Miller and Morgan Rager', 'cmw4143@lhup.edu', 'I brought it 10 cans for the Hunger Bowl canned food drive.', '2016-11-02 16:00:00', '2.0', 2),
(204, 23, 'Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'I did both morning and after sessions for the Open House on October 29.', '2016-10-29 08:30:00', '2.0', 2),
(205, 23, 'Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'I volunteered at the Open House on October 8 as a part of A-Team. I did both morning and afternoon sessions', '2016-10-08 08:30:00', '2.0', 2),
(206, 98, 'Open House- Admissions Team', 'Shelby Helwig', 'sth1064@lhup.edu', 'Worked as part of the GHP admissions team to help recruit and interview perspective high school students for the program.', '2016-10-29 00:00:00', '1.0', 2),
(207, 56, 'Covenant Cafe', 'Fran Decker', 'fdecker@kcnet.org', 'Help plan and carry out activities for this early stage Alzheimer\'s support group. We try to challenge them physically and mentally, while having fun and connecting with others. The sessions are twice a month for 2 hours each session. I took part in each session for the months of September, October, and November', '2016-09-06 13:00:00', '12.0', 2),
(208, 102, 'Open House 1', 'Shelby Helwig', 'honors@lhup.edu', 'I attended the morning session and talked to prospective students and the afternoon session and interviewed a prospective student', '2016-10-08 08:00:00', '2.0', 2),
(209, 102, 'Open House 2', 'Shelby Helwig', 'honos@lhup.edu', 'I attended the morning session and talked to prospective students and the afternoon session and interviewed a prospective student', '2016-10-29 08:00:00', '2.0', 2),
(210, 188, 'Open House', 'Shelby Helwig', 'honors@lhup.edu', 'Helped A-Team recruit at the Open House', '2016-10-29 08:00:00', '2.0', 2),
(211, 97, 'Work at the SPCA', 'Dr. Howell', 'chowell@lhup.edu', 'I go to the SPCA twice a week for 2-3 hours helping socialize the dogs.  I actually began volunteering there before school started and got to go in every day for a few hours.  That first week I got about 10 hours and I\'ve been getting 4 a week there ever since.  Now I usually go on Tuesdays and Fridays from 2-4 pm.  This is Mary Ellen\'s number so you can contact her 570-786-1099', '2016-08-22 14:00:00', '46.0', 2),
(212, 84, 'Salvation Army', 'Deb Moore', '5707482951', 'Folded and hung clothes. Priced items. Etc.', '2016-10-27 12:00:00', '10.0', 2),
(213, 84, 'Salvation Army', 'Deb Moore', '5707482951', 'Folded and hung clothes. Priced items. Etc.', '2016-10-27 12:00:00', '10.0', 2),
(214, 84, 'Salvation Army', 'Deb Moore', '5707482951', 'Folded and hung clothes. Priced items. Etc.', '2016-10-27 12:00:00', '10.0', 2),
(215, 167, 'CIU Development Center for Adults', 'Marianne Taylor', 'mtaylor@ciu10.org', 'I help tutor adults that are looking to get their GED. Most often I work with Annette. It is amazing to see how hard people work to better themselves no matter how old they are.', '2016-10-26 17:00:00', '7.0', 2),
(216, 34, 'Bazaar at SusqueView Health Center', 'Teresa Fortney', 'tfortney@susqueviewhome.com', 'At this event I brought residents down to the ground level to help theme look around at vendors and then brought them back to their room when they were done looking.', '2016-11-12 09:00:00', '3.0', 2),
(217, 160, 'CAC Canning', 'Colleen Eccles', '4848326528', 'I canned for College Against Cancer to raise money for Relay for Life.', '2016-11-12 11:00:00', '2.0', 2),
(218, 143, 'Donate to Hunger Bowl', 'Honors', 'honors@lhup.edu', 'Donated 10 canned goods for the Hunger Bowl for Honors', '2016-10-25 00:00:00', '2.0', 2),
(219, 109, 'Handed Out Flyers at Convocation', 'Dr. Jacqueline Whitling', 'jwhitlin@lhup.edu', 'At the beginning of the semester, me and a few other honors students handed out flyers for the 2016 convocation ceremony.', '2016-09-07 13:00:00', '2.0', 2),
(220, 109, 'Hunger Bowl', 'Jacqueline Whitling', 'jwhitlin@lhup.edu', 'I purchased and donated 10 non-perishable food items on behalf of the Global Honors Program for Lock Haven University\'s 2016 Hunger Bowl.', '0000-00-00 00:00:00', '2.0', 2),
(221, 35, 'Canned Goods Donation', 'Rachael', 'honors_program@lhup.edu', 'Donated 10 canned goods, dropped them off in the honors house, and put my name on the sign in sheet', '0000-00-00 00:00:00', '2.0', 2);
INSERT INTO `fa2016_com_serv` (`com_id`, `pstu_id`, `com_title`, `com_advisor`, `com_advisor_contact`, `com_description`, `com_date`, `com_hours`, `com_verified`) VALUES
(222, 50, 'LHU Soccer ID Clinic', 'Coach Kathy Brown', '706-897-0596', 'Assisted in doing drills with high school players who are interested in joining LHU\'s team. Also, I gave a tour of campus at the end of the training session.', '2016-11-13 13:00:00', '3.0', 2),
(223, 116, 'Adopt A Family', 'Dr. Dumm', 'jwhitlin@lhup.edu', 'Two Christmas gifts \r\nAbigail: Shopkins coloring book, crayons, and colored pencils\r\nBryan: Teenage Mutant Ninja Turtles coloring book, crayons, and colored pencils', '2016-11-15 09:30:00', '2.0', 2),
(224, 165, 'Nature Trail Cleanup', 'Robert Myers', 'rmyers3@lhup.edu', 'Walked LHU Nature Trail picking up any trash we found.', '2016-11-15 16:00:00', '1.0', 2),
(225, 160, 'CAC Tabling', 'Colleen Eccles', '4848326528', 'I sat at a table in the lower part of Bentley, advising students how to sign up for Relay for Life.', '2016-11-15 11:00:00', '1.0', 2),
(226, 98, 'Phi Beta Delta: Bingo for Bellies', 'John Gradel', '570-484-2140', 'Helped set up prior to the event and played bingo to help benefit a local food pantry.', '2016-11-15 00:00:00', '1.0', 2),
(227, 79, 'Moving and Shaking', 'Shelby Helwig/Rachael Metzinger', 'sth1064@lhup.edu/rxm2509@lhup.edu', 'I helped Freshmen move in during move-in weekend.  Specifically, I directed traffic to avoid a huge back up.', '2016-08-25 12:00:00', '3.0', 2),
(228, 79, 'River Clean-Up', 'Elisabeth Lynch', 'clintoncountycleanscapes@yahoo.com', 'I was part of the in-river crew that dug tires out of the water!  We combed the downstream side for tires, and then moved upstream.  As always, it was a very rewarding experience cleaning up our local waterways, and the best part was that there were FAR fewer tires than last year!', '2016-09-10 09:00:00', '5.0', 2),
(229, 78, 'Democratic Party Office', 'Shannon Lachman', '8142321665', 'I canvassed (went door knocking) through the Lock Haven area for candidates like Mike Hanna, Katie McGinty and Hillary Clinton.', '2016-11-07 13:00:00', '4.0', 2),
(230, 78, 'Democratic Party Office', 'Shannon Lachman', '8142321665', 'I canvassed (went door knocking) through the Lock Haven area for candidates like Mike Hanna, Katie McGinty and Hillary Clinton. This was election day, so I also worked at the polls.', '2016-11-08 13:00:00', '4.0', 2),
(231, 79, 'Open House Morning and Afternoon', 'Shelby Helwig', 'sth1064@lhup.edu', 'I\'m on A-Team and helped out at the Open House in the morning and the afternoon interview!', '2016-09-24 08:20:00', '2.0', 2),
(232, 79, 'Open House Morning and Afternoon', 'Shelby Helwig', 'sth1064@lhup.edu', 'I\'m on A-Team and helped out at the Open House in the morning and the afternoon interview!', '2016-10-29 08:20:00', '2.0', 2),
(233, 125, 'Habitat for Humanity Restore', 'Jill Redman', 'jill@habitatgcc.org', 'My small group from my Small Group Communications class went to the habitat for humanity restore in Bellefonte and bring new inventory into the store, clean it, and then place it on the floor to be sold.', '2016-11-05 12:00:00', '5.0', 2),
(234, 125, 'Youth Group Leadership', 'Ashley Stensland', 'joyhopefaithlove@comcast.net', 'I help lead the girls youth group at my church. This past week, I helped them prep desserts for an event we are doing this Sunday and spent time talking to some of them about what is going on in their lives.', '2016-11-13 17:30:00', '2.0', 2),
(235, 96, 'BINGO for Bellies', 'Phi Beta Delta', 'international@lhup.edu', 'Donated non-perishable food ideas to support families in need.', '2016-11-15 19:00:00', '1.0', 2),
(236, 85, 'Adopt A Family', 'Dr. Dumm', 'jwhitlin@lhup.edu', 'I participated in getting gifts for one of the tags, Bryan age 5, for the Christmas \"Adopt a Family\" event.', '2016-11-17 12:00:00', '1.0', 2),
(237, 34, 'Susqueview Thanksgiving Dinner', 'Teresa Fortney', 'tfortney@susqueviewhome.com', 'At this event, I served dinner and desserts to residents as well as clearing plates and tables at the end of the night.', '2016-11-18 17:30:00', '2.0', 2),
(238, 29, 'HOLTF- Operation Christmas Child', 'Sarah E. Snyder', 'ssnyder@houseofthelordfellowship.org / #570-660-1919', 'I packaged donations into large boxes to be taken to penn state to be sent out to people around the world. I also attached tracking labels on all of the packages.', '2016-11-19 08:00:00', '7.0', 2),
(239, 49, 'Operation Christmas Child', 'Sarah Snyder', 'ssnyder@houseofthelordfellowship.org', 'I packed and sealed boxes for the OCC National Collection Week at the House of the Lord Fellowship Church', '2016-11-19 08:00:00', '7.0', 2),
(240, 27, 'Salute the Troops', 'Lara Ringgold', 'ljr71@lhup.edu', 'Volunteered to help clean up Highland Cemetery. Placed wreaths and flowers, cleaned up leaves, straightened out flags and markers on veterans\' graves.', '2016-11-19 14:00:00', '3.0', 2),
(241, 8, 'Lock Haven Shoe Bank', 'Wendy Stiver', 'wstiver@lockhaven.com', 'I helped measure kids\' feet and pick out their shoes.', '2016-11-19 10:30:00', '4.0', 2),
(242, 100, 'Open House', 'Shelby Helwig', 'honors@lhup.edu', 'During the first open house I was trained by my A-team mentor. I talked to high school students who are interested in the program and aided in the interviewing process.', '2012-10-08 00:00:00', '2.0', 2),
(243, 100, 'Open House', 'Shelby Helwig', 'honors@lhup.edu', 'During this open house I talked to students interested in the GHP. At the afternoon session I interviewed the high school students who had expressed interest in our program.', '2016-11-19 08:20:00', '2.0', 2),
(244, 23, 'Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'I did the morning and afternoon sessions for the Open House on November 26.', '2016-11-26 08:20:00', '2.0', 2),
(245, 39, 'Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'Attended the morning and afternoon sessions for open house as a member of Admissions Team', '2016-11-19 08:00:00', '2.0', 2),
(246, 39, 'Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'Attended the morning and afternoon sessions for open house as a member of Admissions Team', '2016-11-19 08:00:00', '2.0', 2),
(247, 39, 'Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'Attended the morning and afternoon sessions for open house as a member of Admissions Team', '2016-11-19 08:00:00', '2.0', 2),
(248, 67, 'Open House', 'Ashley Spencer', 'aspencer@lhup.edu', 'Gave tours to high school seniors', '2016-11-19 10:30:00', '5.0', 2),
(249, 25, 'Susque View Thanksgiving Dinner', 'Teresa Fortney', 'tfortney@susqueviewhome.com', 'Served dinner to residents and members of their families.', '2016-11-18 17:30:00', '2.0', 2),
(250, 25, 'Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'Worked with admissions team at the open house', '2016-11-19 08:20:00', '2.0', 2),
(251, 65, 'Adopt-A-Family Gift Donations', 'Jackie Dumm', 'jwhitlin@lhup.edu', 'Purchased three gifts to fulfill the requests on two Adopt-A-Family gift tags', '2016-11-21 00:00:00', '2.0', 2),
(252, 22, 'LHU Hunger Bowl', 'N/A', 'N/A', 'Donated 10 non-perishable items as stated on clipboard in the honors house', '2016-10-27 00:00:00', '2.0', 2),
(253, 22, 'LHU A-Team Open House', 'Shelby Helwig', 'honors@lhup.edu', 'Talked to families and conducted interviews as a part of the Honor\'s Admissions Team', '2016-11-19 08:20:00', '2.0', 2),
(254, 22, 'Susqueview Thanksgiving Dinner', 'Teresa Fortnry', 'tfortney@susqueviewhome.com', 'Served Thanksgiving dinner to the residents of the nursing center. Once they were done eating we cleaned up all of the tables. Over 300 people were served that night.', '2016-11-18 17:29:00', '2.0', 2),
(255, 192, 'Special Olympics Spaghetti Dinner', 'Kelly Hibbler', 'khibbler@lhup.edu', 'I help the Special Olympics volunteers with serving their dinner and selling raffle tickets. I was amazed at how much money was donated towards the benefactors. It is definitely hard work trying to organize an event like this, year after year. I am glad to volunteer my time for the Special Olympics because it gives the participants an initiative to stay involved and feel like they are apart of something. I would gladly do it again next year.', '2016-11-19 15:30:00', '4.0', 2),
(256, 194, 'Salute the Troops', 'Lara Ringgold', 'ljr71@lhup.edu', 'Hours were put in to rake leaves and decorate the graves at the Highland Cemetery for the Veteran\'s graves.', '2016-11-22 13:00:00', '3.0', 2),
(257, 167, 'CIU Development Center', 'Marianne Taylor', 'mtaylor@ciu10.org', 'I help tutor adults seeking to acquire their GED', '2016-11-14 17:30:00', '4.0', 2),
(258, 42, 'Ross Library Book Sale', 'Diane Whitaker', 'ross1@rosslibrary.org', 'Helped handle money and bag books at the Ross Library Book Sale', '2016-08-10 15:00:00', '5.0', 2),
(259, 42, 'Ross Library Reshelving Project', 'Diane Whitaker', 'ross1@rosslibrary.org', 'Moving the nonfiction books to make more room for the fiction.', '2016-09-16 14:00:00', '11.0', 2),
(261, 179, 'River Clean Up', 'Morgan Capovianco', 'mpc7999@lhup.edu', 'Cleaned The River', '2016-09-10 00:00:00', '5.0', 2),
(262, 101, 'Salvation Army After School Program', 'Kathy Deavor', '(570) 295-7109', 'I co-teach a \"Moonbeams\" class (5-6 year olds) based off of emblems that include lessons from the Bible, snack, crafts, and physical activity. After each emblem is completed (Summer Fun, Mind Your Manners, Cooking, Wellness, etc) each child will receive a badge to add to their collection of completed emblems. Each emblem takes approximately 3 meetings (weeks) to complete.', '2016-11-02 17:30:00', '2.0', 2),
(263, 101, 'Lock Haven Salvation Army After School Program', 'Kathy Deavor', '(570) 295-7109', 'I co-teach a \"Moonbeams\" class (5-6 year olds) based off of emblems that include lessons from the Bible, snack, crafts, and physical activity. After each emblem is completed (Summer Fun, Mind Your Manners, Cooking, Wellness, etc) each child will receive a badge to add to their collection of completed emblems. Each emblem takes approximately 3 meetings (weeks) to complete.', '2016-11-16 17:30:00', '2.0', 2),
(264, 150, 'Salvation Army Thrift Store', 'Kathy Deavor', '570-295-7109', 'I helped sort through clothes and clean store so it looked presentable to the costumers.', '2016-10-12 00:00:00', '3.0', 2),
(265, 11, 'Special Olympics Spaghetti Dinner', 'Kelly Hibbler', 'khibbler@lhup.edu', 'I helped plate spaghetti for the fundraiser that the Special Olympics committee holds annually.', '2016-11-11 15:30:00', '3.0', 2),
(266, 149, 'Honors Admissions Team Open House', 'Shelby Helwig', 'honors@lhup.edu', 'I talked to high school students about the honors program during the morning portion of the open house. In the afternoon, I helped out with an honors session that was held for certain students to give them more information about the honors program. I also gave an interview in the afternoon.', '2016-11-19 00:00:00', '2.0', 2),
(267, 62, 'Susque-View Home Beauty Shop', 'Teresa Fortney', '570-893-5941', 'At Susque-View Home they have a beauty shop for residents to get their hair done. I volunteered to transport the residents from their rooms down to the beauty shop on the first floor.', '2016-11-29 09:30:00', '2.0', 2),
(268, 184, 'Adopt-A-Family', 'Mountain Serve', 'MountainServe@lhup.edu', 'Purchased 5 separate gifts for children in Family #20 for the holiday season.', '2016-11-29 10:00:00', '5.0', 2),
(269, 194, 'Hunger Bowl', 'Heather Porter', 'hjp9573@lhup.edu', 'I donated 20 items to Mountain Serve under the LHU Outing Club', '2016-11-10 11:00:00', '2.0', 2),
(270, 166, 'Dentistry from the Heart', 'Dr. Bonomo, DDS', '5704309635', 'Assisted Red Hill Dental in providing free hygiene and cleaning exams to the less fortunate members of the community.', '2016-11-30 07:00:00', '11.0', 2),
(271, 103, 'Open House', 'Jackie Dumm', 'jwhitlin@lhup.edu', 'We talked to prospective students about the Global Honors Program.', '2016-11-19 09:00:00', '1.0', 2),
(272, 103, 'Blood Drive', 'Jackie Dumm', 'jwhitlin@lhup.edu', 'I gave blood and saved up to 3 lives.', '2016-11-30 14:45:00', '1.0', 2),
(273, 24, 'Red Cross Blood Drive', 'Lauren Wright', 'law@3363@lhup.edu', 'I helped make sure people ate food and drank something after donating blood.', '2016-11-30 16:00:00', '3.0', 2),
(274, 24, 'Red Cross Blood Drive', 'Lauren Wright', 'law3363@lhup.edu', 'I helped make sure people ate food and drank something after donating blood', '2016-12-01 16:00:00', '3.0', 2),
(275, 17, 'Blood donation', 'Red Cross', 'www.redcross.org', 'donated blood', '2016-11-30 12:15:00', '1.0', 2),
(276, 72, 'Wrestling meet ticket sales', 'Patrick Long/ Danielle Barney', '15706602093', 'I sat at the entrance for the wrestling meet and sold tickets to get into the meet.', '2016-12-03 18:00:00', '2.0', 2),
(277, 46, 'Blood Drive', 'Lauren Wright', 'law3363@lhup.edu', 'I worked the refreshment table by looking after donors and making sure they ate and rested after donating.', '2016-12-28 12:00:00', '4.0', 2),
(278, 195, 'Good Works', 'Shanna Cornuet', '(610) 383-6311', 'We go and fix up houses of the less fortunate around the area. That day we put in new plumbing for this family that lived in a trailer, painted part of her house, starting to put down new flooring in the house to cover the hole, and also mowed her grass for her.\r\n\r\nI apologize for turning in my community service hours so late and way way past the 2 week deadline. I just kept forgetting to put it in and I finally remembered. I know that is no excuse and again I apologize for being so late.', '2016-10-08 00:00:00', '8.0', 2),
(279, 17, 'Concession Stand at Wrestling match', 'Pat Long', 'pdl347@lhup.edu', 'Sold concessions during lock haven vs George Mason wrestling match', '2016-12-04 11:00:00', '3.0', 2),
(280, 31, 'LHU Blood Drive', 'law3363@lhup.edu', 'law3363@lhup.edu', 'I went to the blood drive and did the double red donation, which took 2 hours due to the waiting, the questions, the set up of the machine, actually getting blood taken, and the wait time after.', '2016-11-30 13:30:00', '2.0', 2),
(281, 45, 'Special Olympics Spaghetti Dinner', 'Kelly Hibbler', '570-502-2374', 'I helped serve spaghetti dinners and drinks for a fundraiser for the Special Olympics.', '2016-11-19 15:30:00', '3.0', 2),
(282, 8, 'lock haven shoe bank', 'Wendy Stiver', 'wstiver@lockhaven.com', 'help kids measure their feet and get shoes', '2016-11-19 10:30:00', '4.0', 2),
(283, 24, 'Adopt-A-Family', 'Lauren Wright', 'law3363@lhup.edu', 'I bought a pair of jeans for a family in need.', '2016-12-01 12:15:00', '1.0', 2),
(284, 46, 'Adopt A Family', 'Lauren Wright', 'law3363@lhup.edu', 'I bought a pair of pants for a fourteen year old boy.', '2016-12-01 00:15:00', '1.0', 2),
(285, 76, 'Covenant Cafe', 'Frances Decker', 'fdecker@kcnet.org', 'Every first and third Tuesday of the month I volunteered to help individuals with early stage dementia with crafts, activities, and exercises for two hours each session.', '2016-09-05 00:00:00', '12.0', 2),
(286, 35, 'Adopt a Family', 'Honors Program', 'honors_program@lhup.edu', 'Bought gifts for one of the tags off of the honors tree', '2016-12-02 00:00:00', '1.0', 2),
(287, 52, 'GED Tutoring', 'Maryann', '570-893-4038', 'I tutor adults in mathematics', '2016-11-14 17:00:00', '3.0', 2),
(288, 52, 'GED Tutoring', 'Maryann', '570-893-4038', 'I tutor adults in math to prepare for their GED test', '2016-11-21 17:00:00', '3.0', 2),
(289, 52, 'Nursing Home Thanksgiving Dinner', 'mrs. fortney', 'tfortney@susqueviewhome.com', 'I helped serve Thanksgiving Dinner to the elderly at a nursing home', '2016-11-18 17:30:00', '2.0', 2),
(290, 54, 'Santa\'s Workshop', 'Dave Shimchel', '570-726-8434', 'I worked with the local Kiwanis club on running their Santa\'s Workshop. Children in the local community came in to partake in multiple different activities. I dressed up as a snowman and danced around to get the kids excited for the different activities. I also helped make crafts and hand out gifts to the kids as they finished getting pictures with Santa Claus.', '2016-12-04 00:00:00', '4.0', 2),
(291, 54, 'Holiday Reading Day at Ross Library', 'Nancy Ansham', '570-748-3321', 'I helped children who attended the holiday reading event at Ross Library make a craft. I also helped the women who worked for the library set up and clean up. I got to interact with various families in the community and get a better understanding of the community,', '2016-12-03 00:00:00', '2.0', 2),
(292, 62, 'Susque-View Home Beauty Shop', 'Teresa Fortney', '570-893-5941', 'I helped at the beauty shop that is in Susque-View Home with transporting the residents from their rooms down to the beauty shop on the first floor.', '2016-12-06 09:30:00', '2.0', 2),
(293, 203, 'Adopt A Family', 'Lauren Wright', 'law3363', 'Ulmer 219 took on not only an entire tree, but additional tags as well as part of the Adopt A Family experience this year', '2016-12-05 00:00:00', '1.0', 2),
(294, 203, 'Clothing Donation', 'Mechanicsburg Goodwill', '7176352881', 'While home for the holiday I went through clothes and donated 3 bags to the local Goodwill', '2016-11-26 12:00:00', '3.0', 2),
(295, 28, 'Blood Donatiom', 'Regina Beers', 'unknown', 'Blood donation', '2016-12-01 00:00:00', '1.0', 2),
(296, 10, 'Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'For this open house I was trained as a new member of A-team. I helped at the morning session by welcoming students to the open house and informing them of the honors program. In the afternoon I helped conduct interviews for potential honors students.', '2016-10-08 09:00:00', '2.0', 2),
(297, 10, 'Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'This was the second open house I attended as a member of A-team. In the morning session I welcomed students to the open house and provided them with information about the honors program. In the afternoon, I helped escort students and parents to the conference room, where we held a new \'honors\' session. I also conversed with parents who were waiting for their child to return from interviews.', '2016-11-19 09:00:00', '2.0', 2),
(298, 73, 'Holiday Gift Wrapping', 'Lauren Wright', 'law3363@lhup.edu', 'The Holiday\'s are a time of giving, the Gift wrapping was a part of the Adopt A Family Gift Drive. The group donates gifts to family\'s who are not able to provide any for their children or who have had a recent tragedy occur within the family. During my volunteer hours, I helped wrap gifts for the families so they can have an extra special Christmas.', '2016-12-07 00:00:00', '5.0', 2),
(299, 75, 'Adopt-A-Family Gift Wrapping', 'Lauren Wright', 'law3363@lhup.edu', 'I helped wrap gifts that people bought for the families on Adopt-A-Family trees.', '2016-12-07 13:00:00', '6.0', 2),
(300, 160, 'A-Team Open House', 'Shelby Helwig', '7176508904', 'I spoke with perspective honors students and their families at the admission open house. I conducted interviews with perspective students in the afternoon session.', '2016-11-19 09:00:00', '2.0', 2),
(301, 100, 'Adopt A Family Holiday Gift Drive', 'Jackie Dumm', 'jwhitlin@lhup.edu', 'For an hour of community service I bought a gift for a young girl who was part of the Holiday Gift Drive held on campus. The gift was delivered to the Honors house on 11/30/16.', '2016-11-30 00:00:00', '1.0', 2),
(302, 37, 'All In Phone a Thon', 'Anna Rodgers and Pat Rudy', 'axr1159@lhup.edu and prudy@lhup.edu', 'Called alumni and updated their contract information and asked for donations', '2016-11-29 16:00:00', '1.0', 2),
(303, 37, 'All In Phone a Thon', 'Anna Rodgers and Pat Rudy', 'axr1159@lhup.edu and prudy@lhup.edu', 'Called alumni and updated their contact information and informed them of the All-In day of giving', '2016-11-17 18:00:00', '3.0', 2),
(304, 28, 'Adopt-A-Family', 'Lauren Wright', 'law3363@lhup.edu', 'Delivered presents to Adopt A Family recipients.', '2016-12-09 10:00:00', '4.0', 2),
(305, 62, 'Susque View Christmas Concert', 'Teresa Fortney', '570-893-5941', 'I assisted with transporting residents to the common area on the first floor for a church choir concert.', '2016-12-10 09:30:00', '2.0', 2),
(306, 88, 'Portage Cheerleading Assistant', 'Lisa Dividock', '814-243-4655', 'Over thanksgiving break, I spent a day at my old high school helping cheerleaders learn cheers from when I was in high school. I also helped design signs for fundraisers for their season. I was there for an hour.', '2016-11-21 15:00:00', '1.0', 2),
(307, 53, 'A Team open house', 'shelby', 'shelby', 'volunteered at the morning and afternoon sessions of the open house', '2016-11-19 00:00:00', '2.0', 2),
(308, 195, 'Can Goods', 'Rachael', 'honors_program@lhup.edu', 'I brought 10 can goods for 2 hours of service. I put my name on the list, but it has not shown up.', '2016-11-03 00:00:00', '2.0', 2),
(309, 199, 'Donate to food drive', 'Honors', '570-484-3045', 'Donated ten food items for the food drive', '2016-11-04 00:00:00', '2.0', 2),
(310, 199, 'Red Cross Blood Drive', 'Lauren Wright', '(570) 484-2498', 'Donated one until of blood.', '2016-11-29 00:00:00', '1.0', 2),
(311, 199, 'Helped with adopt a family', 'Lauren Wright', '(570) 484-2498', 'Helped carry gifts from Raub to the PUB and organize gifts', '2016-12-05 00:00:00', '1.0', 2),
(312, 199, 'Purcahsed a gift for adopt a family', 'Honors', '(570) 484-3045', 'Purchased a pair of boots and socks for adopt a family', '2016-12-01 00:00:00', '1.0', 2),
(313, 152, 'Goodwill Industries', 'Tracey Hughes', '5707485000', 'I helped with day to day activities like bringing in donations and distributing them throughout the store.', '2016-11-14 12:00:00', '5.0', 2),
(314, 152, 'Goodwill Industries', 'Tracey hughes', '5707485000', 'I helped with the daily activities of accepting donations and distributing them throughout the store.', '2016-12-07 12:00:00', '5.0', 2),
(315, 89, 'Moving and Shaking', 'Shelby Helwig', 'sth1064@lhup.edu', 'I helped freshmen move in.', '2016-08-25 13:00:00', '2.0', 2),
(316, 89, 'Can drive', 'Rachael Metzinger', '570-985-4764', 'I donated ten cans to the food drive.', '2016-11-03 16:00:00', '2.0', 2),
(317, 89, 'Spaghetti dinner fundraiser', 'Julie Sheetz', '570-502-1117', 'I helped out at a spaghetti dinner to raise money for a woman battling cancer.', '2016-10-19 12:00:00', '2.0', 2),
(318, 89, 'Spaghetti dinner fundraiser', 'Julie Sheetz', '570-502-1117', 'I helped out at a spaghetti dinner to raise money for a woman battling cancer.', '2016-10-19 12:00:00', '2.0', 2),
(319, 140, 'St. John Nuemann Nursing Home', 'Shannon Wesney', '(215) 698-5600', 'Helping with bingo and transportation', '2016-12-26 10:00:00', '5.0', 2);

-- --------------------------------------------------------

--
-- Table structure for table `fa2016_currentstudents`
--

CREATE TABLE `fa2016_currentstudents` (
  `pstu_id` int(11) NOT NULL,
  `pstu_in_fdg` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fa2016_currentstudents`
--

INSERT INTO `fa2016_currentstudents` (`pstu_id`, `pstu_in_fdg`) VALUES
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 0),
(54, 0),
(55, 0),
(56, 0),
(57, 0),
(58, 0),
(59, 0),
(60, 0),
(61, 0),
(62, 0),
(63, 0),
(64, 0),
(65, 0),
(66, 0),
(67, 0),
(68, 0),
(69, 0),
(70, 0),
(72, 0),
(73, 0),
(74, 0),
(75, 0),
(76, 0),
(77, 0),
(78, 0),
(79, 0),
(80, 0),
(81, 0),
(82, 0),
(83, 0),
(84, 0),
(85, 0),
(86, 0),
(87, 0),
(88, 0),
(89, 0),
(90, 0),
(91, 0),
(92, 0),
(93, 0),
(94, 0),
(95, 0),
(96, 0),
(97, 0),
(98, 0),
(99, 0),
(100, 0),
(101, 0),
(102, 0),
(103, 0),
(104, 0),
(105, 0),
(106, 0),
(107, 0),
(108, 0),
(109, 0),
(110, 0),
(111, 0),
(112, 0),
(113, 0),
(114, 0),
(115, 0),
(116, 0),
(117, 0),
(118, 0),
(119, 0),
(120, 0),
(121, 0),
(122, 0),
(123, 0),
(124, 0),
(125, 0),
(126, 0),
(127, 0),
(128, 0),
(129, 0),
(130, 0),
(131, 0),
(132, 0),
(133, 0),
(134, 0),
(135, 0),
(137, 0),
(138, 0),
(139, 0),
(140, 0),
(141, 0),
(142, 0),
(143, 0),
(144, 0),
(145, 0),
(146, 0),
(147, 0),
(148, 0),
(149, 0),
(150, 0),
(151, 0),
(152, 0),
(153, 0),
(154, 0),
(155, 0),
(156, 0),
(157, 0),
(158, 0),
(159, 0),
(160, 0),
(161, 1),
(162, 0),
(163, 0),
(164, 0),
(165, 0),
(166, 0),
(167, 0),
(168, 0),
(169, 0),
(170, 0),
(171, 0),
(172, 0),
(173, 0),
(174, 0),
(175, 0),
(176, 0),
(177, 0),
(178, 0),
(179, 0),
(180, 0),
(181, 0),
(182, 0),
(183, 0),
(184, 0),
(185, 0),
(187, 0),
(188, 0),
(189, 0),
(190, 0),
(191, 0),
(192, 0),
(193, 0),
(194, 0),
(195, 0),
(196, 0),
(197, 0),
(198, 0),
(199, 0),
(200, 0),
(201, 0),
(202, 0),
(203, 0),
(204, 0),
(205, 0),
(206, 0),
(207, 0),
(208, 0),
(209, 0),
(210, 0),
(211, 0),
(212, 0),
(213, 0),
(214, 0),
(216, 1),
(217, 1),
(222, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `fa2016_dates`
-- (See below for the actual view)
--
CREATE TABLE `fa2016_dates` (
`start` datetime
,`end` datetime
,`title` varchar(60)
,`event_id` bigint(20)
,`group` int(11)
,`back_color` varchar(7)
,`font_color` varchar(7)
);

-- --------------------------------------------------------

--
-- Table structure for table `fa2016_events`
--

CREATE TABLE `fa2016_events` (
  `event_id` int(11) NOT NULL,
  `event_title` varchar(60) NOT NULL,
  `event_description` varchar(200) NOT NULL,
  `event_start_date` datetime NOT NULL,
  `event_end_date` datetime NOT NULL,
  `event_bg_color` varchar(7) DEFAULT '#0000ff',
  `event_ft_color` varchar(7) DEFAULT '#ffffff'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fa2016_events`
--

INSERT INTO `fa2016_events` (`event_id`, `event_title`, `event_description`, `event_start_date`, `event_end_date`, `event_bg_color`, `event_ft_color`) VALUES
(1, 'Challenge The SADs', 'Come face off against the SADs in mortal combat! Not really more like Mario Kart and Rock Paper Scissors', '2016-10-06 18:30:00', '2016-10-06 19:30:00', '#8B0000', '#ffffff'),
(2, 'Seige of the Seig', 'Come stay at the Seig conference center with us!', '2016-10-21 17:00:00', '2016-10-22 15:00:00', '#8B0000', '#ffffff'),
(3, 'Halloween Party', 'Festive Honors party! Dress up,eat candy, celebrateeee! PUB MPR', '2016-10-27 19:00:00', '2016-10-27 20:00:00', '#8B0000', '#ffffff'),
(4, 'Mr./Ms. Honors Pageant', 'Clothes from goodwill= $10Admission= $1Memories= PricelessCome see your fellow students cross dress in a', '2016-11-03 19:00:00', '2016-11-03 20:00:00', '#8B0000', '#ffffff'),
(5, 'Talent Show', 'The Annual GHP Talent show held at Price Auditorium. Admission is $2 dollars and $1 for chances at raffel prizes!', '2016-11-09 19:00:00', '2016-11-09 20:00:00', '#8B0000', '#ffffff'),
(6, 'Structure Construction Surprise', 'A building, popping, rootin, tootin, good timeeee!at the PUB MPR come and earn some honors Olympics points for your FDG!', '2016-11-14 19:00:00', '2016-11-14 20:00:00', '#8B0000', '#ffffff'),
(7, 'Holiday Party!', 'Happy Holidays!!!Come celebrate the impending break with us at the house one last time as a family before we are all away for a month!Wear an ugly sweater and come prepared to partyyy!', '2016-12-01 19:00:00', '2016-12-01 20:00:00', '#8B0000', '#ffffff');

-- --------------------------------------------------------

--
-- Table structure for table `fa2016_exceptions`
--

CREATE TABLE `fa2016_exceptions` (
  `excptn_id` int(11) NOT NULL,
  `excptn_name` varchar(60) NOT NULL,
  `excptn_type` int(11) NOT NULL,
  `excptn_value` decimal(5,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fa2016_exceptions`
--

INSERT INTO `fa2016_exceptions` (`excptn_id`, `excptn_name`, `excptn_type`, `excptn_value`) VALUES
(2, 'Student Athlete in Season', 1, '10.00'),
(3, 'Capstone Research', 1, '10.00'),
(4, 'Study Abroad Semester AG', 1, '10.00'),
(5, 'Study Abroad Semester AE', 2, '2.00'),
(6, 'Study Abroad Semester CS', 3, '5.00'),
(7, 'Student Athlete out of Season', 1, '5.00'),
(8, 'Nano Scholar', 1, '10.00'),
(9, 'Professional Block Semester', 1, '10.00'),
(10, 'FDG Leaders', 1, '10.00'),
(11, 'AG Leaders', 1, '10.00'),
(12, 'Other AG', 1, '10.00'),
(13, 'Other AE', 2, '2.00'),
(14, 'Other AE half', 2, '1.00'),
(15, 'Other AG half', 1, '5.00'),
(16, 'Student Teaching AG', 1, '10.00'),
(17, 'Student Teaching AE', 2, '2.00'),
(18, 'Internship AG', 1, '10.00'),
(19, 'Internship AE', 2, '2.00'),
(20, 'FDG AE', 2, '2.00'),
(21, 'ATEP Block AG', 1, '10.00'),
(22, 'ATEP Block AE', 2, '2.00'),
(23, 'Other AE half freshman', 2, '2.00'),
(24, 'SAD AG', 1, '10.00'),
(25, 'SAD CS', 3, '10.00'),
(26, 'SAD AE', 2, '2.00'),
(27, 'CS Volunteers', 3, '10.00');

-- --------------------------------------------------------

--
-- Table structure for table `fa2016_exception_grants`
--

CREATE TABLE `fa2016_exception_grants` (
  `grant_id` int(11) NOT NULL,
  `excptn_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fa2016_exception_grants`
--

INSERT INTO `fa2016_exception_grants` (`grant_id`, `excptn_id`, `pstu_id`) VALUES
(56, 2, 17),
(57, 2, 18),
(50, 2, 29),
(62, 2, 37),
(53, 2, 38),
(60, 2, 40),
(48, 2, 41),
(47, 2, 47),
(55, 2, 48),
(51, 2, 50),
(58, 2, 61),
(43, 2, 72),
(46, 2, 83),
(52, 2, 90),
(44, 2, 104),
(18, 2, 105),
(54, 2, 116),
(45, 2, 161),
(49, 2, 171),
(59, 2, 202),
(79, 3, 119),
(86, 3, 176),
(80, 3, 179),
(144, 3, 182),
(83, 3, 183),
(82, 3, 189),
(84, 3, 194),
(81, 3, 200),
(124, 3, 205),
(140, 3, 206),
(85, 3, 210),
(87, 3, 212),
(73, 7, 15),
(72, 7, 82),
(74, 7, 123),
(71, 7, 132),
(61, 8, 169),
(63, 8, 214),
(66, 9, 162),
(65, 9, 168),
(68, 9, 185),
(67, 9, 197),
(64, 9, 198),
(70, 9, 201),
(69, 9, 211),
(9, 10, 53),
(3, 10, 54),
(4, 10, 55),
(12, 10, 57),
(5, 10, 66),
(16, 10, 79),
(17, 10, 89),
(7, 10, 91),
(10, 10, 93),
(14, 10, 96),
(11, 10, 98),
(8, 10, 102),
(6, 10, 103),
(13, 10, 106),
(15, 10, 110),
(22, 11, 56),
(38, 11, 62),
(26, 11, 95),
(37, 11, 113),
(41, 11, 115),
(42, 11, 125),
(34, 11, 131),
(29, 11, 139),
(30, 11, 140),
(36, 11, 143),
(23, 11, 145),
(35, 11, 148),
(40, 11, 149),
(24, 11, 155),
(21, 11, 160),
(25, 11, 167),
(39, 11, 188),
(31, 11, 190),
(32, 11, 193),
(27, 11, 208),
(33, 11, 209),
(20, 11, 213),
(28, 11, 222),
(93, 12, 59),
(113, 12, 118),
(94, 12, 121),
(112, 12, 128),
(105, 12, 129),
(116, 12, 138),
(117, 12, 142),
(104, 12, 151),
(91, 12, 159),
(109, 12, 163),
(96, 12, 173),
(92, 12, 180),
(108, 12, 191),
(98, 12, 196),
(95, 12, 199),
(101, 12, 203),
(115, 13, 138),
(118, 13, 142),
(119, 13, 201),
(114, 14, 118),
(111, 14, 128),
(106, 14, 129),
(139, 14, 130),
(103, 14, 151),
(110, 14, 163),
(122, 14, 169),
(107, 14, 191),
(102, 14, 203),
(121, 14, 209),
(99, 15, 63),
(100, 15, 154),
(77, 16, 174),
(78, 17, 174),
(127, 18, 112),
(138, 18, 130),
(128, 18, 147),
(75, 18, 166),
(88, 18, 192),
(126, 19, 112),
(125, 19, 147),
(123, 19, 166),
(19, 20, 105),
(90, 21, 204),
(89, 22, 204),
(120, 23, 30),
(129, 24, 117),
(130, 24, 146),
(131, 24, 181),
(133, 25, 117),
(134, 25, 146),
(132, 25, 181),
(137, 26, 117),
(135, 26, 146),
(136, 26, 181),
(141, 27, 81),
(143, 27, 156),
(142, 27, 214);

-- --------------------------------------------------------

--
-- Table structure for table `fa2016_fdg`
--

CREATE TABLE `fa2016_fdg` (
  `pfdg_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fa2016_fdg`
--

INSERT INTO `fa2016_fdg` (`pfdg_id`) VALUES
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

-- --------------------------------------------------------

--
-- Table structure for table `fa2016_fdg_attendence`
--

CREATE TABLE `fa2016_fdg_attendence` (
  `pfdg_att_id` int(11) NOT NULL,
  `pfdg_report_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fa2016_fdg_attendence`
--

INSERT INTO `fa2016_fdg_attendence` (`pfdg_att_id`, `pfdg_report_id`, `pstu_id`) VALUES
(269, 3, 6),
(268, 3, 9),
(264, 3, 11),
(267, 3, 13),
(265, 3, 23),
(263, 3, 33),
(266, 3, 39),
(257, 4, 6),
(256, 4, 9),
(260, 4, 11),
(259, 4, 13),
(261, 4, 23),
(262, 4, 33),
(258, 4, 39),
(249, 5, 6),
(253, 5, 9),
(250, 5, 11),
(255, 5, 13),
(251, 5, 23),
(252, 5, 33),
(254, 5, 39),
(248, 6, 6),
(247, 6, 9),
(243, 6, 11),
(245, 6, 13),
(244, 6, 23),
(246, 6, 33),
(242, 6, 39),
(95, 7, 27),
(94, 7, 36),
(93, 7, 44),
(98, 8, 27),
(96, 8, 36),
(1073, 8, 37),
(97, 8, 44),
(99, 9, 27),
(101, 9, 36),
(1071, 9, 37),
(1070, 9, 40),
(100, 9, 44),
(103, 10, 27),
(104, 10, 36),
(102, 10, 37),
(106, 10, 40),
(105, 10, 44),
(108, 11, 27),
(109, 11, 36),
(107, 11, 37),
(111, 11, 40),
(110, 11, 44),
(270, 12, 27),
(272, 12, 36),
(271, 12, 37),
(273, 12, 40),
(274, 12, 44),
(413, 13, 27),
(414, 13, 36),
(415, 13, 37),
(622, 13, 38),
(417, 13, 40),
(416, 13, 44),
(419, 15, 27),
(421, 15, 36),
(418, 15, 37),
(621, 15, 38),
(422, 15, 40),
(420, 15, 44),
(690, 16, 27),
(689, 16, 36),
(482, 16, 37),
(620, 16, 38),
(483, 16, 40),
(480, 16, 44),
(510, 17, 27),
(512, 17, 36),
(509, 17, 37),
(619, 17, 38),
(513, 17, 40),
(511, 17, 44),
(545, 18, 27),
(544, 18, 36),
(691, 18, 37),
(618, 18, 38),
(692, 18, 40),
(543, 18, 44),
(607, 20, 27),
(610, 20, 36),
(606, 20, 37),
(608, 20, 38),
(611, 20, 40),
(609, 20, 44),
(613, 21, 27),
(614, 21, 36),
(612, 21, 37),
(616, 21, 38),
(615, 21, 40),
(617, 21, 44),
(684, 22, 27),
(688, 22, 36),
(683, 22, 37),
(686, 22, 38),
(687, 22, 40),
(685, 22, 44),
(842, 23, 27),
(840, 23, 36),
(839, 23, 37),
(841, 23, 38),
(843, 23, 40),
(844, 23, 44),
(846, 24, 27),
(845, 24, 36),
(847, 24, 44),
(852, 25, 27),
(849, 25, 36),
(848, 25, 37),
(850, 25, 40),
(851, 25, 44),
(854, 26, 27),
(856, 26, 36),
(853, 26, 37),
(857, 26, 40),
(855, 26, 44),
(1054, 28, 27),
(1057, 28, 36),
(1058, 28, 37),
(1055, 28, 38),
(1056, 28, 40),
(1062, 28, 44),
(1065, 29, 27),
(1064, 29, 36),
(1063, 29, 37),
(1068, 29, 38),
(1066, 29, 40),
(1067, 29, 44),
(1180, 30, 27),
(1181, 30, 36),
(1183, 30, 38),
(1182, 30, 44),
(1185, 31, 27),
(1186, 31, 36),
(1184, 31, 37),
(1189, 31, 38),
(1188, 31, 40),
(1187, 31, 44),
(1230, 32, 27),
(1228, 32, 36),
(1227, 32, 37),
(1231, 32, 40),
(1229, 32, 44),
(174, 33, 5),
(168, 33, 14),
(175, 33, 22),
(173, 33, 42),
(176, 33, 46),
(167, 33, 51),
(181, 34, 5),
(180, 34, 14),
(178, 34, 22),
(182, 34, 42),
(179, 34, 46),
(177, 34, 51),
(185, 35, 5),
(187, 35, 14),
(184, 35, 22),
(186, 35, 42),
(188, 35, 46),
(183, 35, 51),
(194, 36, 5),
(191, 36, 14),
(189, 36, 22),
(193, 36, 42),
(192, 36, 46),
(190, 36, 51),
(197, 37, 5),
(200, 37, 14),
(196, 37, 22),
(198, 37, 42),
(199, 37, 46),
(195, 37, 51),
(205, 38, 5),
(203, 38, 14),
(201, 38, 22),
(206, 38, 42),
(204, 38, 46),
(202, 38, 51),
(353, 39, 5),
(349, 39, 14),
(350, 39, 22),
(352, 39, 42),
(348, 39, 46),
(351, 39, 51),
(359, 40, 5),
(355, 40, 14),
(356, 40, 22),
(358, 40, 42),
(354, 40, 46),
(357, 40, 51),
(423, 41, 5),
(428, 41, 14),
(426, 41, 22),
(424, 41, 42),
(427, 41, 46),
(425, 41, 51),
(516, 43, 5),
(514, 43, 14),
(518, 43, 22),
(519, 43, 42),
(515, 43, 46),
(517, 43, 51),
(524, 44, 5),
(520, 44, 14),
(522, 44, 22),
(523, 44, 42),
(525, 44, 46),
(521, 44, 51),
(576, 46, 5),
(583, 46, 14),
(581, 46, 22),
(577, 46, 42),
(582, 46, 46),
(575, 46, 51),
(600, 47, 5),
(602, 47, 14),
(604, 47, 22),
(605, 47, 42),
(601, 47, 46),
(603, 47, 51),
(661, 48, 5),
(660, 48, 14),
(663, 48, 22),
(662, 48, 42),
(659, 48, 46),
(658, 48, 51),
(711, 49, 5),
(716, 49, 14),
(713, 49, 22),
(712, 49, 42),
(715, 49, 46),
(714, 49, 51),
(747, 50, 5),
(752, 50, 14),
(749, 50, 22),
(748, 50, 42),
(751, 50, 46),
(750, 50, 51),
(815, 51, 5),
(819, 51, 14),
(817, 51, 22),
(816, 51, 42),
(820, 51, 46),
(818, 51, 51),
(838, 52, 5),
(829, 52, 14),
(830, 52, 22),
(832, 52, 42),
(828, 52, 46),
(831, 52, 51),
(920, 53, 5),
(922, 53, 14),
(918, 53, 22),
(919, 53, 42),
(921, 53, 46),
(917, 53, 51),
(1046, 54, 5),
(1044, 54, 14),
(1042, 54, 22),
(1045, 54, 42),
(1043, 54, 46),
(1125, 55, 5),
(1127, 55, 14),
(1124, 55, 22),
(1126, 55, 42),
(1128, 55, 46),
(1123, 55, 51),
(1134, 56, 5),
(1130, 56, 14),
(1132, 56, 22),
(1133, 56, 42),
(1131, 56, 46),
(1129, 56, 51),
(1176, 59, 5),
(1177, 59, 14),
(1178, 59, 22),
(1179, 59, 42),
(1175, 59, 46),
(1174, 59, 51),
(1222, 60, 5),
(1225, 60, 14),
(1226, 60, 22),
(1223, 60, 42),
(1224, 60, 46),
(1221, 60, 51),
(276, 61, 16),
(275, 61, 21),
(281, 61, 24),
(277, 61, 30),
(278, 61, 31),
(280, 61, 216),
(287, 62, 16),
(284, 62, 21),
(289, 62, 24),
(290, 62, 30),
(286, 62, 31),
(288, 62, 216),
(294, 63, 16),
(292, 63, 21),
(298, 63, 24),
(296, 63, 30),
(293, 63, 31),
(295, 63, 216),
(299, 64, 16),
(303, 64, 21),
(304, 64, 24),
(301, 64, 30),
(302, 64, 31),
(305, 64, 216),
(306, 65, 16),
(310, 65, 21),
(312, 65, 24),
(313, 65, 30),
(307, 65, 31),
(308, 65, 216),
(318, 66, 16),
(314, 66, 21),
(320, 66, 24),
(319, 66, 30),
(317, 66, 31),
(316, 66, 216),
(464, 67, 16),
(460, 67, 21),
(463, 67, 24),
(461, 67, 30),
(462, 67, 31),
(459, 67, 216),
(465, 68, 16),
(468, 68, 21),
(470, 68, 24),
(472, 68, 30),
(466, 68, 31),
(467, 68, 216),
(479, 69, 16),
(477, 69, 21),
(476, 69, 24),
(478, 69, 30),
(474, 69, 31),
(473, 69, 216),
(623, 70, 16),
(626, 70, 21),
(624, 70, 24),
(629, 70, 30),
(628, 70, 31),
(627, 70, 216),
(630, 71, 16),
(636, 71, 21),
(634, 71, 24),
(635, 71, 30),
(632, 71, 31),
(631, 71, 216),
(637, 72, 16),
(642, 72, 21),
(641, 72, 24),
(643, 72, 30),
(639, 72, 31),
(638, 72, 216),
(644, 73, 16),
(647, 73, 21),
(649, 73, 24),
(650, 73, 30),
(646, 73, 31),
(645, 73, 216),
(651, 74, 16),
(652, 74, 21),
(654, 74, 24),
(657, 74, 30),
(655, 74, 31),
(656, 74, 216),
(725, 75, 16),
(731, 75, 21),
(727, 75, 24),
(730, 75, 30),
(729, 75, 31),
(728, 75, 216),
(732, 76, 16),
(737, 76, 21),
(736, 76, 24),
(738, 76, 30),
(734, 76, 31),
(733, 76, 216),
(739, 77, 16),
(743, 77, 21),
(741, 77, 24),
(742, 77, 30),
(745, 77, 31),
(744, 77, 216),
(877, 78, 16),
(881, 78, 21),
(883, 78, 24),
(880, 78, 30),
(879, 78, 31),
(878, 78, 216),
(884, 79, 16),
(893, 79, 21),
(885, 79, 24),
(892, 79, 30),
(891, 79, 31),
(890, 79, 216),
(895, 80, 16),
(898, 80, 21),
(897, 80, 24),
(899, 80, 30),
(900, 80, 31),
(901, 80, 216),
(1101, 81, 16),
(1106, 81, 21),
(1105, 81, 24),
(1107, 81, 30),
(1103, 81, 31),
(1102, 81, 216),
(1115, 82, 16),
(1113, 82, 21),
(1109, 82, 24),
(1114, 82, 30),
(1112, 82, 31),
(1111, 82, 216),
(1116, 83, 16),
(1121, 83, 21),
(1118, 83, 24),
(1122, 83, 30),
(1120, 83, 31),
(1119, 83, 216),
(1145, 84, 21),
(1142, 84, 24),
(1140, 84, 30),
(1143, 84, 31),
(1144, 84, 216),
(1237, 86, 16),
(1236, 86, 21),
(1234, 86, 24),
(1232, 86, 30),
(1235, 86, 31),
(1242, 87, 16),
(1239, 87, 21),
(1241, 87, 24),
(1238, 87, 31),
(3, 88, 17),
(6, 88, 32),
(7, 88, 34),
(5, 88, 45),
(8, 88, 48),
(4, 88, 50),
(11, 89, 32),
(12, 89, 34),
(13, 89, 45),
(14, 89, 48),
(209, 90, 17),
(216, 90, 18),
(215, 90, 32),
(207, 90, 34),
(214, 90, 45),
(210, 90, 48),
(208, 90, 50),
(222, 91, 17),
(221, 91, 18),
(220, 91, 32),
(219, 91, 34),
(223, 91, 45),
(217, 91, 48),
(218, 91, 50),
(15, 92, 32),
(16, 92, 34),
(17, 92, 45),
(18, 92, 48),
(142, 93, 17),
(148, 93, 18),
(143, 93, 32),
(144, 93, 34),
(146, 93, 45),
(147, 93, 48),
(145, 93, 50),
(392, 94, 17),
(390, 94, 18),
(391, 94, 32),
(388, 94, 34),
(393, 94, 45),
(387, 94, 48),
(389, 94, 50),
(405, 95, 17),
(404, 95, 18),
(402, 95, 32),
(403, 95, 34),
(394, 95, 48),
(395, 95, 50),
(412, 97, 18),
(410, 97, 32),
(409, 97, 34),
(408, 97, 45),
(407, 97, 48),
(411, 97, 50),
(441, 98, 17),
(445, 98, 18),
(447, 98, 32),
(446, 98, 34),
(444, 98, 45),
(442, 98, 48),
(443, 98, 50),
(526, 99, 17),
(532, 99, 18),
(527, 99, 32),
(529, 99, 34),
(531, 99, 45),
(528, 99, 48),
(530, 99, 50),
(540, 101, 17),
(541, 101, 18),
(542, 101, 32),
(535, 101, 34),
(539, 101, 45),
(534, 101, 48),
(533, 101, 50),
(572, 103, 17),
(574, 103, 32),
(573, 103, 34),
(570, 103, 45),
(571, 103, 48),
(676, 104, 17),
(679, 104, 18),
(677, 104, 32),
(674, 104, 34),
(678, 104, 45),
(680, 104, 47),
(675, 104, 48),
(673, 104, 50),
(664, 105, 17),
(670, 105, 18),
(666, 105, 32),
(668, 105, 34),
(669, 105, 45),
(671, 105, 47),
(667, 105, 48),
(665, 105, 50),
(708, 106, 17),
(705, 106, 18),
(707, 106, 32),
(706, 106, 34),
(704, 106, 45),
(710, 106, 47),
(703, 106, 48),
(709, 106, 50),
(719, 107, 17),
(724, 107, 18),
(722, 107, 32),
(721, 107, 34),
(723, 107, 45),
(717, 107, 47),
(720, 107, 48),
(718, 107, 50),
(814, 108, 17),
(811, 108, 18),
(809, 108, 45),
(810, 108, 47),
(813, 108, 48),
(812, 108, 50),
(822, 109, 17),
(825, 109, 32),
(826, 109, 34),
(827, 109, 45),
(824, 109, 47),
(823, 109, 48),
(821, 109, 50),
(908, 110, 17),
(902, 110, 18),
(909, 110, 32),
(905, 110, 34),
(906, 110, 45),
(903, 110, 47),
(907, 110, 48),
(904, 110, 50),
(923, 112, 17),
(929, 112, 18),
(924, 112, 32),
(925, 112, 34),
(930, 112, 45),
(928, 112, 47),
(927, 112, 48),
(926, 112, 50),
(1048, 113, 17),
(1053, 113, 18),
(1049, 113, 32),
(1051, 113, 34),
(1050, 113, 47),
(1047, 113, 48),
(1052, 113, 50),
(1097, 114, 17),
(1100, 114, 18),
(1095, 114, 32),
(1094, 114, 34),
(1099, 114, 45),
(1098, 114, 47),
(1096, 114, 50),
(1152, 116, 17),
(1153, 116, 18),
(1151, 116, 32),
(1149, 116, 34),
(1147, 116, 45),
(1148, 116, 47),
(1146, 116, 48),
(1150, 116, 50),
(1212, 117, 17),
(1204, 117, 18),
(1211, 117, 32),
(1210, 117, 34),
(1203, 117, 45),
(1202, 117, 47),
(1201, 117, 48),
(1209, 117, 50),
(1246, 118, 17),
(1249, 118, 18),
(1248, 118, 32),
(1247, 118, 34),
(1250, 118, 45),
(1243, 118, 47),
(1245, 118, 48),
(1244, 118, 50),
(1269, 119, 17),
(1276, 119, 18),
(1275, 119, 32),
(1272, 119, 34),
(1277, 119, 45),
(1271, 119, 47),
(1270, 119, 48),
(1274, 119, 50),
(35, 122, 8),
(33, 122, 12),
(37, 122, 29),
(36, 122, 41),
(34, 122, 49),
(46, 123, 8),
(41, 123, 12),
(38, 123, 41),
(44, 123, 49),
(49, 124, 12),
(50, 124, 38),
(47, 124, 41),
(48, 124, 49),
(151, 126, 8),
(149, 126, 12),
(154, 126, 29),
(153, 126, 38),
(150, 126, 41),
(152, 126, 49),
(364, 128, 8),
(366, 128, 12),
(365, 128, 29),
(360, 128, 41),
(363, 128, 49),
(430, 129, 8),
(431, 129, 12),
(432, 129, 29),
(429, 129, 41),
(433, 129, 49),
(487, 132, 8),
(488, 132, 12),
(486, 132, 29),
(484, 132, 41),
(485, 132, 49),
(493, 133, 8),
(492, 133, 12),
(490, 133, 29),
(494, 133, 41),
(491, 133, 49),
(784, 134, 8),
(786, 134, 12),
(785, 134, 29),
(787, 134, 41),
(783, 134, 49),
(762, 139, 8),
(761, 139, 12),
(760, 139, 29),
(759, 139, 41),
(758, 139, 49),
(756, 140, 8),
(755, 140, 12),
(757, 140, 29),
(754, 140, 41),
(753, 140, 49),
(1040, 141, 8),
(1037, 141, 12),
(1041, 141, 29),
(1039, 141, 41),
(1038, 141, 49),
(1025, 143, 8),
(1023, 143, 12),
(1022, 143, 29),
(1021, 143, 41),
(1024, 143, 49),
(1033, 146, 8),
(1032, 146, 12),
(1030, 146, 29),
(1031, 146, 41),
(1036, 146, 49),
(91, 161, 7),
(89, 161, 10),
(88, 161, 28),
(86, 161, 43),
(92, 161, 47),
(87, 161, 217),
(73, 166, 7),
(72, 166, 10),
(74, 166, 28),
(71, 166, 43),
(75, 166, 217),
(80, 167, 7),
(77, 167, 10),
(81, 167, 28),
(76, 167, 43),
(84, 167, 47),
(82, 167, 217),
(329, 169, 7),
(331, 169, 10),
(328, 169, 28),
(326, 169, 43),
(330, 169, 47),
(327, 169, 217),
(335, 170, 7),
(334, 170, 10),
(336, 170, 28),
(332, 170, 43),
(333, 170, 217),
(500, 172, 7),
(502, 172, 10),
(497, 172, 28),
(501, 172, 43),
(499, 172, 47),
(498, 172, 217),
(507, 173, 7),
(505, 173, 10),
(504, 173, 28),
(506, 173, 43),
(503, 173, 217),
(588, 175, 7),
(587, 175, 10),
(584, 175, 28),
(586, 175, 43),
(585, 175, 217),
(594, 176, 7),
(591, 176, 10),
(590, 176, 28),
(593, 176, 43),
(589, 176, 217),
(597, 177, 7),
(598, 177, 10),
(596, 177, 28),
(599, 177, 43),
(595, 177, 217),
(694, 178, 7),
(695, 178, 10),
(697, 178, 28),
(693, 178, 43),
(696, 178, 217),
(698, 179, 7),
(700, 179, 10),
(702, 179, 28),
(699, 179, 43),
(701, 179, 217),
(790, 180, 7),
(791, 180, 10),
(793, 180, 28),
(789, 180, 43),
(792, 180, 217),
(863, 181, 7),
(864, 181, 10),
(866, 181, 28),
(865, 181, 43),
(867, 181, 217),
(1076, 183, 7),
(1075, 183, 10),
(1077, 183, 28),
(1074, 183, 43),
(1078, 183, 217),
(1084, 184, 7),
(1083, 184, 10),
(1080, 184, 28),
(1082, 184, 43),
(1081, 184, 217),
(1087, 185, 7),
(1086, 185, 10),
(1085, 185, 43),
(1088, 185, 217),
(1093, 186, 7),
(1090, 186, 10),
(1089, 186, 28),
(1092, 186, 43),
(1091, 186, 217),
(1190, 188, 7),
(1192, 188, 10),
(1194, 188, 28),
(1193, 188, 43),
(1195, 188, 217),
(1196, 189, 7),
(1197, 189, 10),
(1199, 189, 28),
(1198, 189, 43),
(1200, 189, 217),
(1280, 190, 7),
(1281, 190, 10),
(1278, 190, 28),
(1282, 190, 43),
(1279, 190, 217),
(1285, 191, 7),
(1287, 191, 10),
(1283, 191, 28),
(1288, 191, 43),
(1284, 191, 217),
(54, 192, 7),
(53, 192, 10),
(52, 192, 28),
(57, 192, 43),
(51, 192, 217),
(64, 193, 7),
(63, 193, 10),
(68, 193, 28),
(56, 193, 43),
(70, 193, 47),
(69, 193, 217),
(113, 194, 25),
(114, 194, 26),
(112, 194, 35),
(115, 194, 52),
(120, 195, 15),
(117, 195, 25),
(118, 195, 26),
(116, 195, 35),
(119, 195, 52),
(125, 196, 15),
(122, 196, 25),
(124, 196, 26),
(121, 196, 35),
(123, 196, 52),
(127, 197, 15),
(129, 197, 25),
(135, 197, 26),
(126, 197, 35),
(128, 197, 52),
(136, 198, 15),
(137, 198, 25),
(141, 198, 26),
(140, 198, 35),
(139, 198, 52),
(232, 199, 15),
(234, 199, 25),
(231, 199, 26),
(224, 199, 35),
(233, 199, 52),
(340, 200, 15),
(339, 200, 25),
(342, 200, 26),
(341, 200, 35),
(338, 200, 52),
(453, 203, 15),
(455, 203, 25),
(457, 203, 26),
(456, 203, 35),
(454, 203, 52),
(560, 205, 15),
(563, 205, 25),
(562, 205, 26),
(561, 205, 35),
(564, 205, 52),
(565, 206, 15),
(567, 206, 25),
(568, 206, 26),
(566, 206, 35),
(569, 206, 52),
(343, 211, 15),
(345, 211, 25),
(347, 211, 26),
(346, 211, 35),
(344, 211, 52),
(448, 212, 15),
(451, 212, 25),
(452, 212, 26),
(450, 212, 35),
(449, 212, 52),
(799, 213, 15),
(800, 213, 25),
(803, 213, 26),
(801, 213, 35),
(802, 213, 52),
(805, 214, 15),
(806, 214, 25),
(804, 214, 26),
(807, 214, 35),
(808, 214, 52),
(868, 215, 15),
(870, 215, 25),
(872, 215, 26),
(871, 215, 35),
(869, 215, 52),
(873, 216, 15),
(874, 216, 25),
(876, 216, 26),
(875, 216, 35),
(936, 217, 15),
(938, 217, 25),
(937, 217, 26),
(939, 217, 35),
(935, 217, 52),
(931, 218, 15),
(933, 218, 25),
(934, 218, 26),
(932, 218, 52),
(1137, 219, 15),
(1136, 219, 25),
(1138, 219, 26),
(1139, 219, 35),
(1135, 219, 52),
(1216, 223, 15),
(1218, 223, 25),
(1219, 223, 26),
(1217, 223, 35),
(1220, 223, 52),
(1213, 224, 25),
(1214, 224, 26),
(1215, 224, 52),
(160, 225, 8),
(158, 225, 12),
(156, 225, 29),
(161, 225, 38),
(157, 225, 41),
(159, 225, 49),
(166, 226, 8),
(164, 226, 12),
(162, 226, 29),
(163, 226, 41),
(165, 226, 49),
(780, 228, 8),
(781, 228, 12),
(782, 228, 29),
(778, 228, 41),
(779, 228, 49),
(776, 230, 8),
(774, 230, 12),
(775, 230, 29),
(777, 230, 41),
(773, 230, 49),
(768, 231, 8),
(771, 231, 12),
(770, 231, 29),
(769, 231, 41),
(772, 231, 49),
(321, 232, 8),
(325, 232, 12),
(324, 232, 29),
(323, 232, 41),
(322, 232, 49),
(1026, 234, 8),
(1029, 234, 29),
(1028, 234, 41),
(1027, 234, 49),
(767, 235, 8),
(765, 235, 12),
(764, 235, 29),
(766, 235, 41),
(763, 235, 49),
(1171, 236, 8),
(1172, 236, 12),
(1173, 236, 29),
(1170, 236, 41),
(1169, 236, 49),
(1168, 237, 8),
(1165, 237, 12),
(1166, 237, 29),
(1167, 237, 41),
(1164, 237, 49),
(1162, 238, 8),
(1161, 238, 12),
(1163, 238, 29),
(1159, 238, 41),
(1160, 238, 49),
(1157, 246, 8),
(1156, 246, 12),
(1158, 246, 29),
(1154, 246, 41),
(1155, 246, 49),
(235, 247, 6),
(236, 247, 9),
(238, 247, 11),
(240, 247, 13),
(239, 247, 23),
(237, 247, 33),
(241, 247, 39),
(367, 249, 6),
(370, 249, 9),
(369, 249, 11),
(372, 249, 13),
(368, 249, 23),
(371, 249, 39),
(378, 250, 6),
(377, 250, 9),
(373, 250, 11),
(376, 250, 13),
(374, 250, 23),
(375, 250, 33),
(379, 250, 39),
(384, 251, 6),
(381, 251, 9),
(382, 251, 11),
(380, 251, 13),
(383, 251, 23),
(385, 251, 33),
(386, 251, 39),
(434, 253, 6),
(440, 253, 9),
(436, 253, 11),
(439, 253, 13),
(437, 253, 23),
(438, 253, 33),
(435, 253, 39),
(546, 254, 6),
(550, 254, 9),
(547, 254, 11),
(551, 254, 13),
(548, 254, 23),
(549, 254, 33),
(552, 254, 39),
(1014, 255, 6),
(1013, 255, 9),
(558, 255, 11),
(554, 255, 13),
(557, 255, 23),
(556, 255, 33),
(559, 255, 39),
(969, 256, 6),
(970, 256, 9),
(975, 256, 11),
(972, 256, 13),
(974, 256, 23),
(973, 256, 33),
(971, 256, 39),
(976, 257, 6),
(977, 257, 9),
(978, 257, 11),
(981, 257, 13),
(982, 257, 23),
(980, 257, 33),
(979, 257, 39),
(983, 258, 6),
(984, 258, 9),
(985, 258, 11),
(990, 258, 13),
(986, 258, 23),
(988, 258, 33),
(989, 258, 39),
(994, 259, 6),
(993, 259, 9),
(995, 259, 11),
(991, 259, 13),
(996, 259, 23),
(997, 259, 33),
(992, 259, 39),
(1001, 260, 6),
(1004, 260, 9),
(998, 260, 11),
(1003, 260, 13),
(999, 260, 23),
(1000, 260, 33),
(1002, 260, 39),
(1011, 261, 6),
(1010, 261, 9),
(1007, 261, 11),
(1006, 261, 13),
(1008, 261, 23),
(1009, 261, 33),
(1005, 261, 39),
(968, 262, 6),
(962, 262, 9),
(963, 262, 11),
(967, 262, 13),
(964, 262, 23),
(965, 262, 33),
(966, 262, 39),
(954, 263, 6),
(959, 263, 9),
(957, 263, 11),
(958, 263, 13),
(960, 263, 23),
(961, 263, 33),
(955, 263, 39),
(947, 264, 6),
(949, 264, 9),
(950, 264, 11),
(948, 264, 13),
(951, 264, 23),
(952, 264, 33),
(953, 264, 39),
(940, 265, 6),
(945, 265, 9),
(941, 265, 11),
(946, 265, 13),
(942, 265, 23),
(943, 265, 33),
(944, 265, 39),
(1289, 266, 6),
(1295, 266, 9),
(1292, 266, 11),
(1291, 266, 13),
(1293, 266, 23),
(1294, 266, 33),
(1290, 266, 39),
(1302, 267, 6),
(1301, 267, 9),
(1298, 267, 11),
(1297, 267, 13),
(1299, 267, 23),
(1300, 267, 33),
(1296, 267, 39),
(796, 268, 7),
(798, 268, 10),
(794, 268, 28),
(797, 268, 43),
(795, 268, 217),
(1020, 275, 6),
(1019, 275, 9),
(1016, 275, 11),
(1015, 275, 13),
(1017, 275, 23),
(1018, 275, 33),
(1012, 275, 39),
(1252, 278, 27),
(1253, 278, 36),
(1251, 278, 37),
(1256, 278, 40),
(1255, 278, 44),
(1259, 279, 5),
(1262, 279, 14),
(1258, 279, 22),
(1260, 279, 42),
(1261, 279, 46),
(1257, 279, 51),
(1267, 280, 5),
(1266, 280, 14),
(1264, 280, 22),
(1268, 280, 42),
(1265, 280, 46),
(1263, 280, 51),
(1329, 281, 6),
(1326, 281, 11),
(1325, 281, 13),
(1327, 281, 23),
(1328, 281, 33),
(1324, 281, 39),
(1323, 282, 6),
(1322, 282, 9),
(1319, 282, 11),
(1318, 282, 13),
(1320, 282, 23),
(1321, 282, 33),
(1317, 282, 39),
(1316, 283, 6),
(1315, 283, 9),
(1312, 283, 11),
(1311, 283, 13),
(1313, 283, 23),
(1314, 283, 33),
(1310, 283, 39),
(1309, 284, 6),
(1308, 284, 9),
(1305, 284, 11),
(1304, 284, 13),
(1306, 284, 23),
(1307, 284, 33),
(1303, 284, 39);

-- --------------------------------------------------------

--
-- Table structure for table `fa2016_fdg_event`
--

CREATE TABLE `fa2016_fdg_event` (
  `pfdg_event_id` int(11) NOT NULL,
  `pfdg_event_name` varchar(60) NOT NULL,
  `pfdg_event_description` varchar(500) DEFAULT NULL,
  `pfdg_start_date` datetime NOT NULL,
  `pfdg_end_date` datetime NOT NULL,
  `pfdg_event_bg_color` varchar(7) DEFAULT '#0000ff',
  `pfdg_event_ft_color` varchar(7) DEFAULT '#ffffff'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fa2016_fdg_event_attendence`
--

CREATE TABLE `fa2016_fdg_event_attendence` (
  `pfdg_eve_att_id` int(11) NOT NULL,
  `pfdg_event_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fa2016_fdg_leaders`
--

CREATE TABLE `fa2016_fdg_leaders` (
  `pfdg_leader_id` int(11) NOT NULL,
  `pfdg_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fa2016_fdg_leaders`
--

INSERT INTO `fa2016_fdg_leaders` (`pfdg_leader_id`, `pfdg_id`, `pstu_id`) VALUES
(1, 2, 105),
(2, 2, 102),
(3, 3, 106),
(4, 3, 57),
(5, 4, 93),
(6, 4, 98),
(7, 5, 53),
(8, 5, 55),
(9, 6, 96),
(10, 6, 110),
(11, 7, 103),
(12, 7, 91),
(13, 8, 79),
(14, 8, 89),
(15, 9, 66),
(16, 9, 54),
(18, 9, 146);

-- --------------------------------------------------------

--
-- Table structure for table `fa2016_fdg_members`
--

CREATE TABLE `fa2016_fdg_members` (
  `pfdg_member_id` int(11) NOT NULL,
  `pfdg_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fa2016_fdg_members`
--

INSERT INTO `fa2016_fdg_members` (`pfdg_member_id`, `pfdg_id`, `pstu_id`) VALUES
(9, 6, 216),
(10, 6, 21),
(11, 6, 24),
(12, 6, 16),
(13, 6, 31),
(14, 6, 30),
(15, 8, 39),
(16, 8, 13),
(17, 8, 11),
(18, 8, 23),
(19, 8, 33),
(20, 8, 9),
(21, 8, 6),
(22, 5, 10),
(25, 5, 43),
(26, 5, 217),
(27, 5, 28),
(28, 5, 7),
(29, 2, 17),
(30, 2, 50),
(31, 2, 45),
(32, 2, 32),
(33, 2, 34),
(34, 2, 48),
(35, 2, 161),
(36, 3, 52),
(39, 3, 25),
(40, 3, 35),
(41, 3, 15),
(42, 3, 26),
(43, 7, 14),
(44, 7, 51),
(45, 7, 22),
(46, 7, 42),
(47, 7, 5),
(48, 4, 8),
(49, 4, 49),
(50, 4, 29),
(51, 4, 41),
(52, 4, 12),
(54, 9, 20),
(58, 9, 37),
(59, 9, 27),
(60, 9, 36),
(61, 9, 44),
(62, 9, 40),
(63, 7, 46),
(64, 2, 18),
(65, 9, 38),
(66, 2, 47);

-- --------------------------------------------------------

--
-- Table structure for table `fa2016_fdg_points`
--

CREATE TABLE `fa2016_fdg_points` (
  `pfdg_points_id` int(11) NOT NULL,
  `pfdg_id` int(11) NOT NULL,
  `pfdg_event_id` int(11) NOT NULL,
  `pfdg_points_points` decimal(5,1) NOT NULL DEFAULT 0.0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fa2016_fdg_reports`
--

CREATE TABLE `fa2016_fdg_reports` (
  `pfdg_report_id` int(11) NOT NULL,
  `pfdg_id` int(11) NOT NULL,
  `pfdg_report_start_date` datetime NOT NULL,
  `pfdg_report_end_date` datetime NOT NULL,
  `pfdg_report_hours` decimal(5,1) DEFAULT NULL,
  `pfdg_report_description` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fa2016_fdg_reports`
--

INSERT INTO `fa2016_fdg_reports` (`pfdg_report_id`, `pfdg_id`, `pfdg_report_start_date`, `pfdg_report_end_date`, `pfdg_report_hours`, `pfdg_report_description`) VALUES
(3, 8, '2016-08-29 16:00:00', '2016-08-29 17:00:00', '1.0', 'We worked on our poster.'),
(4, 8, '2016-08-31 16:00:00', '2016-08-31 17:00:00', '1.0', 'We worked on our poster and made a list of activities for the semester.'),
(5, 8, '2016-09-07 16:00:00', '2016-09-07 17:00:00', '1.0', 'We played cards in the honors house.'),
(6, 8, '2016-09-12 16:00:00', '2016-09-12 17:00:00', '1.0', 'We went for Chinese food and ate in the park.'),
(7, 9, '2016-08-30 18:30:00', '2016-08-30 19:30:00', '1.0', 'Worked on our team poster.'),
(8, 9, '2016-09-01 18:30:00', '2016-09-01 19:30:00', '1.0', 'Worked on our team poster.'),
(9, 9, '2016-09-06 18:30:00', '2016-09-06 19:30:00', '1.0', 'Went to Ice Shack.'),
(10, 9, '2016-09-08 18:30:00', '2016-09-08 19:30:00', '1.0', 'Had a Game Night and learned how to play \"Spicy Uno.\"'),
(11, 9, '2016-09-13 18:30:00', '2016-09-13 19:30:00', '1.0', 'We went to dinner at Upper Bentley.'),
(12, 9, '2016-09-15 18:30:00', '2016-09-15 20:30:00', '2.0', 'We had a 2-hour meeting to watch the movie \"She\'s the Man\"'),
(13, 9, '2016-09-20 18:30:00', '2016-09-20 19:30:00', '1.0', 'We participated in the Clash of the Classes Trivia Night.'),
(15, 9, '2016-09-27 18:30:00', '2016-09-27 19:30:00', '1.0', ''),
(16, 9, '2016-09-29 18:30:00', '2016-09-29 19:30:00', '1.0', 'We went to Ice Shack'),
(17, 9, '2016-10-04 18:30:00', '2016-10-04 19:30:00', '1.0', 'We attended the first PIF of the semester'),
(18, 9, '2016-10-06 18:30:00', '2016-10-06 19:30:00', '1.0', 'We attended Challenge the SADs night'),
(20, 9, '2016-10-13 18:30:00', '2016-10-13 19:30:00', '1.0', 'We brainstormed ideas for our Halloween video.'),
(21, 9, '2016-10-18 18:30:00', '2016-10-18 19:30:00', '1.0', 'We filmed our Halloween video.'),
(22, 9, '2016-10-20 18:30:00', '2016-10-20 19:30:00', '1.0', 'We completed filming our Halloween video.'),
(23, 9, '2016-10-25 18:30:00', '2016-10-25 19:30:00', '1.0', 'We painted our Penguin Pumpkin!'),
(24, 9, '2016-10-27 19:00:00', '2016-10-27 20:00:00', '1.0', 'We attended the Honors Halloween Party!'),
(25, 9, '2016-11-01 19:00:00', '2016-11-01 20:00:00', '1.0', 'We attended the screening of the Halloween videos at the house.'),
(26, 9, '2016-11-03 19:00:00', '2016-11-03 21:00:00', '2.0', 'We attended Mr. and Mrs. Honors pagaent'),
(28, 9, '2016-11-08 18:30:00', '2016-11-08 19:30:00', '1.0', 'We relieved stress by smashing our Penguin Pumpkin from Halloween and then attended the women\'s volleyball game.'),
(29, 9, '2016-11-15 18:30:00', '2016-11-15 19:30:00', '1.0', 'We worked with our freshmen on scheduling.'),
(30, 9, '2016-11-17 18:30:00', '2016-11-17 19:30:00', '1.0', 'We went to dinner at Bentley'),
(31, 9, '2016-11-29 18:30:00', '2016-11-29 19:30:00', '1.0', 'We wrote our Christmas story for the Honors Christmas Party'),
(32, 9, '2016-12-01 18:30:00', '2016-12-01 19:30:00', '1.0', 'We discussed scheduling our meeting times for next semester then attended the Christmas Party'),
(33, 7, '2016-08-30 16:30:00', '2016-08-30 17:30:00', '1.0', 'We painted our poster.'),
(34, 7, '2016-09-01 16:30:00', '2016-09-01 17:30:00', '1.0', 'We went to the ice shack'),
(35, 7, '2016-09-06 16:30:00', '2016-09-06 17:30:00', '1.0', 'We finished our poster.'),
(36, 7, '2016-09-08 16:30:00', '2016-09-08 17:30:00', '1.0', 'We went to fairview suites and played board games.'),
(37, 7, '2016-09-13 16:30:00', '2016-09-13 17:30:00', '1.0', 'We had a picnic at the pavilion by the library.'),
(38, 7, '2016-09-15 16:30:00', '2016-09-15 17:30:00', '1.0', 'We went to the gym and played different sports.'),
(39, 7, '2016-09-20 16:30:00', '2016-09-20 17:30:00', '1.0', 'We went to the PUB Game Room and played pool and ping pong.'),
(40, 7, '2016-09-22 16:30:00', '2016-09-22 17:30:00', '1.0', 'We toured each others rooms and had a study session.'),
(41, 7, '2016-09-27 16:00:00', '2016-09-27 17:00:00', '1.0', 'We met in the study room in Fairview Suites so they could all study for the philosophy test on Thursday.'),
(42, 7, '2016-09-29 16:30:00', '2016-09-29 17:30:00', '1.0', 'We did not meet yet'),
(43, 7, '2016-10-04 16:30:00', '2016-10-04 17:30:00', '1.0', 'Met for two hours on Thursday, did not meet this day.'),
(44, 7, '2016-10-06 16:30:00', '2016-10-06 17:30:00', '1.0', 'Went to Hyner View for 2 hours and discussed upcoming Halloween activites.'),
(45, 7, '2016-10-11 16:00:00', '2016-10-11 17:00:00', '1.0', 'We did not have a meeting, it was a monday schedule'),
(46, 7, '2016-10-13 16:00:00', '2016-10-13 17:00:00', '1.0', 'We started to talk about our Halloween Video'),
(47, 7, '2016-10-18 16:30:00', '2016-10-18 17:30:00', '1.0', 'We started to film our Halloween video.'),
(48, 7, '2016-10-20 16:00:00', '2016-10-20 17:00:00', '1.0', 'We continued to work on our Halloween video.'),
(49, 7, '2016-10-25 16:00:00', '2016-10-25 17:00:00', '1.0', 'We finished filming our video and we started painting our pumpkins.'),
(50, 7, '2016-10-27 16:00:00', '2016-10-27 17:00:00', '1.0', 'We finished painting our pumpkin'),
(51, 7, '2016-11-01 16:00:00', '2016-11-01 17:00:00', '1.0', 'We made our bulletin board.'),
(52, 7, '2016-11-03 16:00:00', '2016-11-03 17:00:00', '1.0', 'We had a study session for their philosophy exam.'),
(53, 7, '2016-11-08 04:00:00', '2016-11-08 05:00:00', '1.0', 'We went to Ave 209 and hung out.'),
(54, 7, '2016-11-10 04:00:00', '2016-11-10 05:00:00', '1.0', 'We made flubber in Joe\'s apartment.'),
(55, 7, '2016-11-15 04:00:00', '2016-11-15 05:00:00', '1.0', 'We made chocolate chip cookies in a mug.'),
(56, 7, '2016-11-18 19:00:00', '2016-11-18 20:00:00', '1.0', 'We went to watch Joe perform in the dance consort.'),
(57, 7, '2016-11-22 04:30:00', '2016-11-22 05:30:00', '1.0', 'We did not meet yet'),
(58, 7, '2016-11-24 04:30:00', '2016-11-24 05:30:00', '1.0', 'We did not meet yet'),
(59, 7, '2016-11-29 04:00:00', '2016-11-29 05:00:00', '1.0', 'We started writing our christmas story.'),
(60, 7, '2016-12-01 16:00:00', '2016-12-01 17:00:00', '1.0', 'We finished our christmas story and talked.'),
(61, 6, '2016-08-29 15:00:00', '2016-08-29 16:00:00', '1.0', 'Worked on our poster at the honors house and got to know each other better.'),
(62, 6, '2016-08-31 15:00:00', '2016-08-31 16:00:00', '1.0', 'Continued our poster at the house.'),
(63, 6, '2016-09-07 15:00:00', '2016-09-07 16:00:00', '1.0', 'Went swimming at the river. No problems.'),
(64, 6, '2016-09-12 15:00:00', '2016-09-12 16:00:00', '1.0', 'Finished our poster at the house and played board games.'),
(65, 6, '2016-09-14 15:00:00', '2016-09-14 16:00:00', '1.0', 'Met at the rec center to go rock climbing. No problems.'),
(66, 6, '2016-09-19 15:00:00', '2016-09-19 16:00:00', '1.0', 'Played wallyball at the rec center.'),
(67, 6, '2016-09-21 15:00:00', '2016-09-21 16:00:00', '1.0', 'We walked down to Avenue 209. No problems'),
(68, 6, '2016-09-26 15:00:00', '2016-09-26 16:00:00', '1.0', 'Went to Ice Shack. Haylee And Morgan drove, No problems'),
(69, 6, '2016-09-28 15:00:00', '2016-09-28 16:00:00', '1.0', 'Had a study session for the first ethics exam and also studied individually studied.'),
(70, 6, '2016-10-03 15:00:00', '2016-10-03 16:00:00', '1.0', 'Did not meet this day. Had a two hour meeting on Wednesday.'),
(71, 6, '2016-10-05 15:00:00', '2016-10-05 16:00:00', '1.0', 'Went to Hyner View, Haylee and Morgan drove. No problems.'),
(72, 6, '2016-10-10 15:00:00', '2016-10-10 16:00:00', '1.0', 'Created our bulletin board in the honors house.'),
(73, 6, '2016-10-12 15:00:00', '2016-10-12 16:00:00', '1.0', 'Explored each others rooms and discussed pumpkin and video ideas.'),
(74, 6, '2016-10-17 15:00:00', '2016-10-17 16:00:00', '1.0', 'Did not meet had a two hour meeting Wednesday.'),
(75, 6, '2016-10-19 15:00:00', '2016-10-19 16:00:00', '1.0', 'Had a two hour meeting to plan and film our Halloween video.'),
(76, 6, '2016-10-24 15:00:00', '2016-10-24 16:00:00', '1.0', 'Played card games in Fairview. No problems.'),
(77, 6, '2016-10-26 15:00:00', '2016-10-26 16:00:00', '1.0', 'Completed our pumpkin and made finishing touches on our movie.'),
(78, 6, '2016-10-31 15:00:00', '2016-10-31 16:00:00', '1.0', 'Had a study session in Fairview. No problems'),
(79, 6, '2016-11-02 15:00:00', '2016-11-02 16:00:00', '1.0', 'Started a movie at the Honors House.'),
(80, 6, '2016-11-07 15:00:00', '2016-11-07 16:00:00', '1.0', 'Had a two hour meeting at the Honors house, finished the movie and then had a study session for the philosophy exam.'),
(81, 6, '2016-11-09 15:00:00', '2016-11-09 16:00:00', '1.0', 'Did not meet today. Had a two hour meeting on Monday.'),
(82, 6, '2016-11-14 15:00:00', '2016-11-14 16:00:00', '1.0', 'Played Wallyball at the Rec Center'),
(83, 6, '2016-11-16 15:00:00', '2016-11-16 16:00:00', '1.0', 'Made DIY stressballs at the honors house'),
(84, 6, '2016-11-21 15:00:00', '2016-11-21 16:00:00', '1.0', 'Played UNO in Fairview study room. Split into two teams of 4 and played to 500.'),
(85, 6, '2016-11-23 15:00:00', '2016-11-23 16:00:00', '1.0', 'Did not meet. Thanksgiving break.'),
(86, 6, '2016-11-28 15:00:00', '2016-11-28 16:00:00', '1.0', 'Met at Fairview and created our Christmas Story.'),
(87, 6, '2016-11-30 15:00:00', '2016-11-30 16:00:00', '1.0', 'Met at Fairview again to finish our Christmas Story and also plan out schedules for next semester meeting times.'),
(88, 2, '2016-08-30 12:50:00', '2016-08-30 13:50:00', '1.0', 'We completed our poster, then went to the Welcome Back Picnic'),
(89, 2, '2016-09-01 12:50:00', '2016-09-01 13:50:00', '1.0', 'We went to Ice Shack'),
(90, 2, '2016-09-06 12:50:00', '2016-09-06 13:50:00', '1.0', ''),
(91, 2, '2016-09-08 12:50:00', '2016-09-08 13:50:00', '1.0', ''),
(92, 2, '2016-09-13 12:50:00', '2016-09-13 13:50:00', '1.0', 'We played games in the Honors House'),
(93, 2, '2016-09-15 12:50:00', '2016-09-15 13:50:00', '1.0', 'We went to Ice Shack.'),
(94, 2, '2016-09-20 12:50:00', '2016-09-20 13:50:00', '1.0', ''),
(95, 2, '2016-09-22 12:50:00', '2016-09-22 13:50:00', '1.0', 'Went to the Pub game room'),
(97, 2, '2016-09-27 12:50:00', '2016-09-27 13:50:00', '1.0', 'We held a study session for the first Ethics Exam'),
(98, 2, '2016-09-29 12:50:00', '2016-09-29 13:50:00', '1.0', 'We played cards and watched a movie at the honors house.'),
(99, 2, '2016-10-04 12:50:00', '2016-10-04 13:50:00', '1.0', 'We had a brainstorming session about our halloween video and pumpkins.'),
(101, 2, '2016-10-06 12:50:00', '2016-10-06 13:50:00', '1.0', 'We started filming our halloween video'),
(102, 2, '2016-10-11 12:50:00', '2016-10-11 13:50:00', '1.0', 'No meeting'),
(103, 2, '2016-10-13 12:50:00', '2016-10-13 13:50:00', '1.0', 'We finished our Halloween video'),
(104, 2, '2016-10-18 12:50:00', '2016-10-18 13:50:00', '1.0', 'Lunch at Upper'),
(105, 2, '2016-10-20 12:50:00', '2016-10-20 13:50:00', '1.0', 'Youtube viewing session'),
(106, 2, '2016-10-25 12:50:00', '2016-10-25 13:50:00', '1.0', 'We started our pumpkin.'),
(107, 2, '2016-10-27 12:50:00', '2016-10-27 13:50:00', '1.0', 'We finished our pumpkin for the halloween party'),
(108, 2, '2016-11-01 12:50:00', '2016-11-01 13:50:00', '1.0', 'we had lunch at upper bentley'),
(109, 2, '2016-11-03 12:50:00', '2016-11-03 13:50:00', '1.0', 'We studied.'),
(110, 2, '2016-11-08 12:50:00', '2016-11-08 13:50:00', '1.0', 'We made stress balls'),
(112, 2, '2016-11-10 12:50:00', '2016-11-10 13:50:00', '1.0', 'We played the card game, Mafia.'),
(113, 2, '2016-11-15 12:50:00', '2016-11-15 13:50:00', '1.0', 'Instead of meeting this day, we attended and won Structure Construction Surprise on Mon. 11/14'),
(114, 2, '2016-11-17 12:50:00', '2016-11-17 13:50:00', '1.0', 'we got ready to make our bulletin board'),
(115, 2, '2016-11-22 12:50:00', '2016-11-22 13:50:00', '1.0', 'this session has not occurred yet'),
(116, 2, '2016-11-29 12:50:00', '2016-11-29 13:50:00', '1.0', 'We made our story/song for the holiday party.'),
(117, 2, '2016-12-01 12:50:00', '2016-12-01 13:50:00', '1.0', 'We played games'),
(118, 2, '2016-12-06 12:50:00', '2016-12-06 13:50:00', '1.0', 'We began watching Home Alone'),
(119, 2, '2016-12-08 12:50:00', '2016-12-08 13:50:00', '1.0', 'We decorated holiday cookies and attempted finishing Home Alone'),
(122, 4, '2016-09-08 18:00:00', '2016-09-08 19:00:00', '1.0', 'We enjoyed some water ice and pretzels today at ice shack!'),
(123, 4, '2016-09-13 18:00:00', '2016-09-13 19:00:00', '1.0', 'We went on a hike up the nature trail behind mac and had talks around the \"campfire\"'),
(124, 4, '2016-09-06 18:00:00', '2016-09-06 19:00:00', '1.0', 'Today was oppressive so our outdoor activities received a raincheck, instead we cooled down in the honors house and played a hilarious game of Cards Against Humanities'),
(126, 4, '2016-09-15 18:00:00', '2016-09-15 19:00:00', '1.0', 'Today we took it easy and caught up over some dinner in upper bentley!'),
(128, 4, '2016-09-22 18:00:00', '2016-09-22 19:00:00', '1.0', 'we had a 2 hour meeting Tuesday!'),
(129, 4, '2016-09-27 18:00:00', '2016-09-27 19:00:00', '1.0', 'today we had a study session for their first philosophy exam! cookies and chocolate milk of course'),
(132, 4, '2016-09-29 18:00:00', '2016-09-29 19:00:00', '1.0', 'today we rocked out at the rock wall!!!! we will be doing this again someday! #success'),
(133, 4, '2016-10-04 18:00:00', '2016-10-04 19:00:00', '1.0', 'today we will be going to the PIF to get some Academic credit and debate each other like champs'),
(134, 4, '2016-10-06 18:00:00', '2016-10-06 19:00:00', '1.0', 'Today we had a study session in the library'),
(139, 4, '2016-10-25 18:00:00', '2016-10-25 19:00:00', '1.0', 'Today we worked on our halloween movie'),
(140, 4, '2016-10-27 18:00:00', '2016-10-27 19:00:00', '1.0', 'today we carved our pumpkin and went to the Party together!'),
(141, 4, '2016-11-01 18:00:00', '2016-11-01 19:00:00', '1.0', 'Today we enjoyed some dinner at Bently'),
(143, 4, '2016-11-10 18:00:00', '2016-11-10 19:00:00', '1.0', 'We finished our movie today at evergreen with some snacks'),
(146, 4, '2016-11-03 18:00:00', '2016-11-03 19:00:00', '1.0', 'We went to the SPCA today to celebrate a hard worked Ethics Exam'),
(161, 5, '2016-09-12 05:30:00', '2016-09-12 06:30:00', '1.0', 'Pizza at Reginas'),
(166, 5, '2016-09-07 05:30:00', '2016-09-07 06:30:00', '1.0', 'went to ice shack'),
(167, 5, '2016-09-12 05:30:00', '2016-09-12 06:30:00', '1.0', 'Pizza at Reginas'),
(169, 5, '2016-09-19 05:30:00', '2016-09-19 06:30:00', '1.0', ''),
(170, 5, '2016-09-21 05:30:00', '2016-09-21 06:30:00', '1.0', ''),
(171, 5, '2016-09-26 05:30:00', '2016-09-26 06:30:00', '1.0', ''),
(172, 5, '2016-09-28 05:30:00', '2016-09-28 06:30:00', '1.0', ''),
(173, 5, '2016-10-03 05:30:00', '2016-10-03 06:30:00', '1.0', ''),
(174, 5, '2016-10-05 05:30:00', '2016-10-05 06:30:00', '1.0', ''),
(175, 5, '2016-10-10 05:30:00', '2016-10-10 06:30:00', '1.0', ''),
(176, 5, '2016-10-12 05:30:00', '2016-10-12 06:30:00', '1.0', ''),
(177, 5, '2016-10-17 05:30:00', '2016-10-17 06:30:00', '1.0', ''),
(178, 5, '2016-10-19 05:30:00', '2016-10-19 06:30:00', '1.0', ''),
(179, 5, '2016-10-24 05:30:00', '2016-10-24 06:30:00', '1.0', ''),
(180, 5, '2016-10-26 05:30:00', '2016-10-26 06:30:00', '1.0', ''),
(181, 5, '2016-10-31 05:30:00', '2016-10-31 06:30:00', '1.0', ''),
(182, 5, '2016-11-02 05:30:00', '2016-11-02 06:30:00', '1.0', ''),
(183, 5, '2016-11-07 05:30:00', '2016-11-07 06:30:00', '1.0', ''),
(184, 5, '2016-11-09 05:30:00', '2016-11-09 06:30:00', '1.0', ''),
(185, 5, '2016-11-14 05:30:00', '2016-11-14 06:30:00', '1.0', ''),
(186, 5, '2016-11-16 05:30:00', '2016-11-16 06:30:00', '1.0', ''),
(187, 5, '2016-11-21 05:30:00', '2016-11-21 06:30:00', '1.0', ''),
(188, 5, '2016-11-28 05:30:00', '2016-11-28 06:30:00', '1.0', ''),
(189, 5, '2016-11-30 05:30:00', '2016-11-30 06:30:00', '1.0', ''),
(190, 5, '2016-12-05 05:30:00', '2016-12-05 06:30:00', '1.0', ''),
(191, 5, '2016-12-07 05:30:00', '2016-12-07 06:30:00', '1.0', ''),
(192, 5, '2016-08-29 05:30:00', '2016-08-29 06:30:00', '1.0', 'worked on poster'),
(193, 5, '2016-08-31 05:30:00', '2016-08-31 06:30:00', '1.0', 'finished poster'),
(194, 3, '2016-08-30 15:30:00', '2016-08-30 16:30:00', '1.0', 'Worked on Poster at the honors house'),
(195, 3, '2016-09-01 15:30:00', '2016-09-01 16:30:00', '1.0', 'Went to Ice Shack'),
(196, 3, '2016-09-06 15:30:00', '2016-09-06 16:30:00', '1.0', 'Finished the poster'),
(197, 3, '2016-09-08 15:30:00', '2016-09-08 16:30:00', '1.0', 'Played pictionary at the honors house'),
(198, 3, '2016-09-13 15:30:00', '2016-09-13 16:30:00', '1.0', 'Climbed the rock wall at the rec'),
(199, 3, '2016-09-15 15:30:00', '2016-09-15 16:30:00', '1.0', 'Went to Avenue'),
(200, 3, '2016-09-20 15:30:00', '2016-09-20 16:30:00', '1.0', 'watched a movie'),
(203, 3, '2016-09-29 15:30:00', '2016-09-29 16:30:00', '1.0', 'played pool in the pub game room'),
(205, 3, '2016-10-04 15:30:00', '2016-10-04 16:30:00', '1.0', 'Played card games at the honors house'),
(206, 3, '2016-10-06 15:30:00', '2016-10-06 16:30:00', '1.0', 'Played volleyball at the rec'),
(207, 3, '2016-10-11 15:30:00', '2016-10-11 16:30:00', '1.0', 'No meeting this day because of fall holiday'),
(208, 3, '2016-10-13 15:30:00', '2016-10-13 16:30:00', '1.0', 'met at the house to discuss video and pumpkin ideas'),
(209, 3, '2016-10-18 15:30:00', '2016-10-18 16:30:00', '1.0', 'started the halloween  video'),
(210, 3, '2016-10-20 15:30:00', '2016-10-20 16:30:00', '1.0', 'No meeting today'),
(211, 3, '2016-09-22 15:30:00', '2016-09-22 16:30:00', '1.0', 'made cookies and brownies'),
(212, 3, '2016-09-27 15:30:00', '2016-09-27 16:30:00', '1.0', 'Had a study session at the pub'),
(213, 3, '2016-10-25 15:30:00', '2016-10-25 16:30:00', '1.0', 'Finished the Halloween video'),
(214, 3, '2016-10-27 15:30:00', '2016-10-27 16:30:00', '1.0', 'Carved our pumpkin'),
(215, 3, '2016-11-01 15:30:00', '2016-11-01 16:30:00', '1.0', 'Met at the rec to play sports'),
(216, 3, '2016-11-03 15:30:00', '2016-11-03 16:30:00', '1.0', 'Study session at the honors house'),
(217, 3, '2016-11-08 15:30:00', '2016-11-08 16:30:00', '1.0', 'Met at the house and went over how to schedule'),
(218, 3, '2016-11-10 15:30:00', '2016-11-10 16:30:00', '1.0', 'Met at fairview and toured everyone\'s dorm rooms'),
(219, 3, '2016-11-15 15:30:00', '2016-11-15 16:30:00', '1.0', 'two hour meeting where we watched funny shows and ordered pizza'),
(220, 3, '2016-11-17 15:30:00', '2016-11-17 16:30:00', '1.0', 'covered under our 2 hour meeting'),
(221, 3, '2016-11-22 15:30:00', '2016-11-22 16:30:00', '1.0', 'Meeting canceled so people can get an early start home'),
(222, 3, '2016-11-24 15:30:00', '2016-11-24 16:30:00', '1.0', 'Meeting hasn\'t happened yet'),
(223, 3, '2016-11-29 15:30:00', '2016-11-29 16:30:00', '1.0', 'Met at fairview to write our christmas story'),
(224, 3, '2016-12-01 15:30:00', '2016-12-01 16:30:00', '1.0', 'Went to the christmas party'),
(225, 4, '2016-08-30 18:00:00', '2016-08-30 19:00:00', '1.0', 'Today we finished our poster and came up with a bucket list for the semester in the honors house'),
(226, 4, '2016-09-01 18:00:00', '2016-09-01 19:00:00', '1.0', 'today we watched the LHU v Clarion volley ball game. We got to see Breeana kill it in her first PSAC game ever! Number one fans!'),
(228, 4, '2016-10-11 18:00:00', '2016-10-11 19:00:00', '1.0', 'Today we ate dinner and watched a halloween movie'),
(230, 4, '2016-10-13 18:00:00', '2016-10-13 19:00:00', '1.0', 'today we went to the homecoming golf cart parade and got free t-shirts'),
(231, 4, '2016-10-18 18:00:00', '2016-10-18 19:00:00', '1.0', 'Today we worked on our halloween movie'),
(232, 4, '2016-09-20 18:00:00', '2016-09-20 19:00:00', '1.0', 'today we took an adventure to Hyner View and took some great team photos! this meeting lasted 2 hours'),
(234, 4, '2016-11-08 18:00:00', '2016-11-08 19:00:00', '1.0', 'Today we started a movie'),
(235, 4, '2016-10-20 18:00:00', '2016-10-20 19:00:00', '1.0', 'Today we worked on our halloween movie'),
(236, 4, '2016-11-15 18:00:00', '2016-11-15 19:00:00', '1.0', 'We ate bently together, family dinner!'),
(237, 4, '2016-11-17 18:00:00', '2016-11-17 19:00:00', '1.0', 'Today we played some video games in the honor house'),
(238, 4, '2016-11-22 18:00:00', '2016-11-22 19:00:00', '1.0', 'Today we watched christmas movies and baked cookies! yum'),
(239, 4, '2016-11-24 18:00:00', '2016-11-24 19:00:00', '1.0', 'We did not meet today due to thanksgiving break'),
(241, 4, '2016-12-01 18:00:00', '2016-12-01 19:00:00', '1.0', 'this meeting has not occurred yet'),
(242, 4, '2016-12-06 18:00:00', '2016-12-06 19:00:00', '1.0', 'this meeting has not occurred yet'),
(243, 4, '2016-12-08 18:00:00', '2016-12-08 19:00:00', '1.0', 'this meeting has not occurred yet'),
(246, 4, '2016-11-29 18:00:00', '2016-11-29 19:00:00', '1.0', 'Today we made our fdg board and our christmas story!'),
(247, 8, '2016-09-14 16:00:00', '2016-09-14 17:00:00', '1.0', 'We played cards in the Honors House.'),
(248, 2, '2016-09-06 12:00:00', '2016-09-06 13:00:00', '1.0', 'We went to low ropes.'),
(249, 8, '2016-09-19 16:00:00', '2016-09-19 17:00:00', '1.0', 'We watched Friends.'),
(250, 8, '2016-09-21 16:00:00', '2016-09-21 17:00:00', '1.0', 'No meeting yet.'),
(251, 8, '2016-09-26 16:00:00', '2016-09-26 17:00:00', '1.0', 'We had a study session for the ethics exam on Thursday.'),
(253, 8, '2016-09-28 16:00:00', '2016-09-28 17:00:00', '1.0', 'Worked on studying for the first ethics exam.'),
(254, 8, '2016-10-03 16:00:00', '2016-10-03 17:00:00', '1.0', 'We watched past Halloween videos and tried to decide what type of movie we wanted ours to be.'),
(255, 8, '2016-10-05 16:00:00', '2016-10-05 17:00:00', '1.0', ''),
(256, 8, '2016-10-10 16:00:00', '2016-10-10 17:00:00', '1.0', ''),
(257, 8, '2016-10-12 16:00:00', '2016-10-12 17:00:00', '1.0', ''),
(258, 8, '2016-10-17 16:00:00', '2016-10-17 17:00:00', '1.0', ''),
(259, 8, '2016-10-19 16:00:00', '2016-10-19 17:00:00', '1.0', ''),
(260, 8, '2016-10-24 16:00:00', '2016-10-24 17:00:00', '1.0', ''),
(261, 8, '2016-10-26 16:00:00', '2016-10-26 17:00:00', '1.0', ''),
(262, 8, '2016-10-31 16:00:00', '2016-10-31 17:00:00', '1.0', ''),
(263, 8, '2016-11-02 16:00:00', '2016-11-02 17:00:00', '1.0', ''),
(264, 8, '2016-11-07 16:00:00', '2016-11-07 17:00:00', '1.0', ''),
(265, 8, '2016-11-09 16:00:00', '2016-11-09 17:00:00', '1.0', ''),
(266, 8, '2016-11-14 16:00:00', '2016-11-14 17:00:00', '1.0', ''),
(267, 8, '2016-11-16 16:00:00', '2016-11-16 17:00:00', '1.0', ''),
(268, 5, '2016-10-26 18:30:00', '2016-10-26 19:30:00', '1.0', ''),
(269, 5, '2016-11-07 00:00:00', '2016-11-07 01:00:00', '1.0', ''),
(270, 5, '2016-11-09 00:00:00', '2016-11-09 01:00:00', '1.0', ''),
(271, 5, '2016-11-14 00:00:00', '2016-11-14 01:00:00', '1.0', ''),
(272, 5, '2016-11-16 00:00:00', '2016-11-16 01:00:00', '1.0', ''),
(273, 5, '2016-11-21 00:00:00', '2016-11-21 01:00:00', '1.0', ''),
(274, 5, '2016-11-23 00:00:00', '2016-11-23 01:00:00', '1.0', ''),
(275, 8, '2016-10-05 16:00:00', '2016-10-05 17:00:00', '1.0', 'We started brainstorming for our Halloween video.'),
(276, 8, '2016-10-10 16:00:00', '2016-10-10 17:00:00', '1.0', 'We worked on our video.'),
(277, 8, '2016-10-12 16:00:00', '2016-10-12 17:00:00', '1.0', 'We worked on our video.'),
(278, 9, '2016-12-06 18:30:00', '2016-12-06 19:30:00', '1.0', 'We met at the Honors House to create our bulletin board. We made it as silly as possible and really enjoyed ourselves for the final meeting of the semester.'),
(279, 7, '2016-12-06 16:00:00', '2016-12-06 17:00:00', '1.0', 'We went to the ASPCA.'),
(280, 7, '2016-12-08 16:00:00', '2016-12-08 17:00:00', '1.0', 'We studied in Fairview Suites.'),
(281, 8, '2016-11-21 16:00:00', '2016-11-21 17:00:00', '1.0', 'We sat and talked about scheduling and came up with more ideas for FDG meetings.'),
(282, 8, '2016-11-28 16:00:00', '2016-11-28 17:00:00', '1.0', 'We helped the freshmen schedule.'),
(283, 8, '2016-11-30 16:00:00', '2016-11-30 17:00:00', '1.0', 'We played heads up.'),
(284, 8, '2016-12-05 16:00:00', '2016-12-05 17:00:00', '1.0', 'We went to the SPCA and played with the animals.'),
(285, 8, '2016-12-07 16:00:00', '2016-12-07 17:00:00', '1.0', 'We did not have a meeting because we went Ice Skating on Saturday(the 10th)'),
(286, 8, '2016-11-23 16:00:00', '2016-11-23 17:00:00', '1.0', 'No meeting');

-- --------------------------------------------------------

--
-- Table structure for table `fa2016_pif`
--

CREATE TABLE `fa2016_pif` (
  `pif_id` int(11) NOT NULL,
  `pif_start_date` datetime NOT NULL,
  `pif_end_date` datetime NOT NULL,
  `pif_title` varchar(60) NOT NULL,
  `pif_description` varchar(250) DEFAULT NULL,
  `pif_bg_color` varchar(7) DEFAULT '#0000ff',
  `pif_ft_color` varchar(7) DEFAULT '#ffffff'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fa2016_pif`
--

INSERT INTO `fa2016_pif` (`pif_id`, `pif_start_date`, `pif_end_date`, `pif_title`, `pif_description`, `pif_bg_color`, `pif_ft_color`) VALUES
(1, '2016-10-04 19:00:00', '2016-10-04 20:00:00', 'PIF #1', 'Topic not chosen at this time', '#0000ff', '#ffffff'),
(2, '2016-10-25 19:00:00', '2016-10-25 20:00:00', 'PIF #2', 'The topic has not been chosen yet', '#0000ff', '#ffffff'),
(3, '2016-10-11 00:00:00', '2016-10-11 01:00:00', 'Pif', 'test', '#0000ff', '#ffffff');

-- --------------------------------------------------------

--
-- Table structure for table `fa2016_pif_stats`
--

CREATE TABLE `fa2016_pif_stats` (
  `pifstat_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL,
  `pif_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fa2016_pif_stats`
--

INSERT INTO `fa2016_pif_stats` (`pifstat_id`, `pstu_id`, `pif_id`) VALUES
(34, 5, 1),
(114, 5, 2),
(142, 6, 2),
(70, 7, 1),
(97, 8, 1),
(71, 9, 1),
(143, 9, 2),
(72, 10, 1),
(115, 10, 2),
(73, 11, 1),
(116, 11, 2),
(74, 12, 1),
(75, 13, 1),
(144, 13, 2),
(76, 14, 1),
(117, 14, 2),
(118, 16, 2),
(77, 17, 1),
(145, 17, 2),
(78, 18, 1),
(119, 18, 2),
(79, 21, 1),
(80, 22, 1),
(36, 23, 1),
(120, 23, 2),
(81, 24, 1),
(126, 24, 2),
(82, 25, 1),
(88, 26, 1),
(146, 26, 2),
(38, 27, 1),
(39, 28, 1),
(89, 29, 1),
(40, 30, 1),
(41, 31, 1),
(42, 32, 1),
(147, 32, 2),
(121, 33, 2),
(43, 34, 1),
(122, 34, 2),
(44, 35, 1),
(125, 35, 2),
(45, 36, 1),
(46, 37, 1),
(47, 39, 1),
(148, 39, 2),
(48, 40, 1),
(49, 41, 1),
(91, 42, 1),
(149, 42, 2),
(50, 43, 1),
(51, 44, 1),
(52, 45, 1),
(92, 46, 1),
(123, 46, 2),
(93, 47, 1),
(150, 47, 2),
(151, 48, 2),
(94, 49, 1),
(152, 49, 2),
(95, 50, 1),
(153, 50, 2),
(96, 52, 1),
(11, 53, 1),
(12, 54, 1),
(103, 55, 2),
(104, 56, 2),
(138, 59, 2),
(64, 60, 1),
(13, 61, 1),
(105, 61, 2),
(14, 62, 1),
(106, 62, 2),
(17, 64, 1),
(18, 65, 1),
(19, 66, 1),
(20, 67, 1),
(139, 72, 2),
(65, 73, 1),
(23, 75, 1),
(140, 77, 2),
(66, 79, 1),
(107, 79, 2),
(67, 80, 1),
(124, 85, 2),
(108, 89, 2),
(109, 91, 2),
(25, 93, 1),
(26, 96, 1),
(110, 96, 2),
(27, 97, 1),
(111, 97, 2),
(28, 98, 1),
(68, 100, 1),
(29, 102, 1),
(30, 103, 1),
(112, 103, 2),
(31, 107, 1),
(32, 109, 1),
(69, 110, 1),
(5, 113, 1),
(130, 113, 2),
(131, 114, 2),
(6, 115, 1),
(132, 115, 2),
(101, 116, 2),
(60, 124, 1),
(133, 126, 2),
(61, 135, 1),
(62, 137, 1),
(135, 144, 2),
(63, 145, 1),
(8, 149, 1),
(136, 149, 2),
(9, 150, 1),
(137, 152, 2),
(102, 158, 2),
(10, 160, 1),
(127, 165, 2),
(55, 171, 1),
(154, 179, 2),
(1, 187, 1),
(2, 188, 1),
(98, 190, 2),
(3, 195, 1),
(56, 197, 1),
(99, 197, 2),
(57, 198, 1),
(128, 200, 2),
(58, 210, 1),
(100, 210, 2),
(59, 211, 1),
(4, 212, 1),
(90, 213, 1),
(129, 213, 2),
(113, 216, 2),
(33, 217, 1),
(141, 217, 2),
(7, 222, 1),
(134, 222, 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `fa2016_stats`
-- (See below for the actual view)
--
CREATE TABLE `fa2016_stats` (
`usr_fname` varchar(20)
,`usr_lname` varchar(35)
,`usr_school_id` varchar(4)
,`usr_id` int(11)
,`acad_events` decimal(29,2)
,`ags` decimal(29,2)
,`com_hours` decimal(30,2)
,`pifs` bigint(21)
,`fdg` decimal(28,2)
,`capstone` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `fdg`
--

CREATE TABLE `fdg` (
  `fdg_id` int(11) NOT NULL,
  `fdg_name` varchar(25) NOT NULL,
  `fdg_imagepath` varchar(60) DEFAULT NULL,
  `fdg_bg_color` varchar(7) DEFAULT '#0000ff',
  `fdg_ft_color` varchar(7) DEFAULT '#ffffff'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fdg`
--

INSERT INTO `fdg` (`fdg_id`, `fdg_name`, `fdg_imagepath`, `fdg_bg_color`, `fdg_ft_color`) VALUES
(1, 'None', '', '#0000ff', '#ffffff'),
(2, 'Hippos', '', '#0000ff', '#ffffff'),
(3, 'Bears', '', '#0000ff', '#ffffff'),
(4, 'Jaguars', '', '#0000ff', '#ffffff'),
(5, 'Gators', '', '#006600', '#ffffff'),
(6, 'Monkeys', '', '#6b3500', '#ffffff'),
(7, 'Cows', '', '#0000ff', '#ffffff'),
(8, 'Flamingos', '', '#cc3399', '#ffffff'),
(9, 'Penguins', '', '#0000ff', '#ffffff'),
(10, 'UPDATE', '', '#0000ff', '#ffffff'),
(11, 'FDGLT', '', '#0000ff', '#ffffff');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `group_id` int(11) NOT NULL,
  `group_name` varchar(50) NOT NULL,
  `group_description` varchar(200) DEFAULT NULL,
  `group_admin` int(11) NOT NULL,
  `group_imagepath` varchar(60) DEFAULT NULL,
  `group_type` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `image_slide`
--

CREATE TABLE `image_slide` (
  `slide_id` int(11) NOT NULL,
  `slide_name` varchar(50) NOT NULL,
  `slide_text` varchar(60) NOT NULL,
  `slide_imagename` varchar(60) NOT NULL,
  `slide_isactive` int(11) NOT NULL DEFAULT 2,
  `slide_pos` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `image_slide`
--

INSERT INTO `image_slide` (`slide_id`, `slide_name`, `slide_text`, `slide_imagename`, `slide_isactive`, `slide_pos`) VALUES
(1, 'Welcome Honors Students!', '', 'honorsOne.jpg', 1, 2),
(2, 'Congratulations Graduates!', '', 'honorsTwo.jpg', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL,
  `news_title` varchar(40) NOT NULL,
  `news_text` varchar(500) NOT NULL,
  `news_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`news_id`, `news_title`, `news_text`, `news_date`) VALUES
(1, 'Congrats on a successful 2016-17 year!', 'Thanks for your patience as we review end of semester statuses. If you DID NOT receive your log-in information or need to have your password reset, please contact Dr. Dumm at jwhitlin@lockhaven.edu. If you have any questions, concerns, or if you find any bugs, please let us know ASAP!', '2017-05-12');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `perm_id` int(11) NOT NULL,
  `usr_id` int(11) NOT NULL,
  `perm_admin` int(11) NOT NULL,
  `perm_worker` int(11) NOT NULL,
  `perm_users` int(11) NOT NULL,
  `perm_fdg` int(11) NOT NULL,
  `perm_exemptions` int(11) NOT NULL,
  `perm_academic_events` int(11) NOT NULL,
  `perm_activity_groups` int(11) NOT NULL,
  `perm_comm_serv` int(11) NOT NULL,
  `perm_pif` int(11) NOT NULL,
  `perm_image_slides` int(11) NOT NULL,
  `perm_events` int(11) NOT NULL,
  `perm_news` int(11) NOT NULL,
  `perm_groups` int(11) NOT NULL,
  `perm_stats` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`perm_id`, `usr_id`, `perm_admin`, `perm_worker`, `perm_users`, `perm_fdg`, `perm_exemptions`, `perm_academic_events`, `perm_activity_groups`, `perm_comm_serv`, `perm_pif`, `perm_image_slides`, `perm_events`, `perm_news`, `perm_groups`, `perm_stats`) VALUES
(1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(14, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(16, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(17, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(19, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(20, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(21, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(22, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(23, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(24, 24, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0),
(25, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(26, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(27, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(28, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(29, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(30, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(31, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(32, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(33, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(34, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(35, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(36, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(37, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(38, 38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(39, 39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(40, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(41, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(42, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(43, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(44, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(45, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(46, 46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(47, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(48, 48, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(49, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(50, 50, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1),
(51, 51, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(52, 52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(53, 53, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(54, 54, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(55, 55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(56, 56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(57, 57, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(58, 58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(59, 59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(61, 61, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(62, 62, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(63, 63, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(64, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(65, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(66, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(67, 67, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(68, 68, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(69, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(70, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(71, 71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(72, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(73, 73, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(74, 74, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(75, 75, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(76, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(77, 77, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78, 78, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79, 79, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(80, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(81, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(82, 82, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(83, 83, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(84, 84, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(85, 85, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(86, 86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(87, 87, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(88, 88, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(89, 89, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(90, 90, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(91, 91, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(92, 92, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(93, 93, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(94, 94, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(95, 95, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(96, 96, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(97, 97, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(98, 98, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(99, 99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(100, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(101, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(102, 102, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(103, 103, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(104, 104, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(105, 105, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(106, 106, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(107, 107, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(108, 108, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(109, 109, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(110, 110, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(111, 111, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(112, 112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(113, 113, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(114, 114, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(115, 115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(116, 116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(117, 117, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 0, 0),
(118, 118, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(119, 119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(120, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(121, 121, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(122, 122, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(123, 123, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(124, 124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(125, 125, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(126, 126, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(127, 127, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(128, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(129, 129, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(130, 130, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(131, 131, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(132, 132, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(133, 133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(134, 134, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(135, 135, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(136, 136, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(137, 137, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(138, 138, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(139, 139, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(140, 140, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(141, 141, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(142, 142, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(143, 143, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(144, 144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(145, 145, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(146, 146, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1),
(147, 147, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(148, 148, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(149, 149, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(150, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151, 151, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(152, 152, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(153, 153, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(154, 154, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(155, 155, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(156, 156, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(157, 157, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(158, 158, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(159, 159, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(160, 160, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(161, 161, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(162, 162, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(163, 163, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(164, 164, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(165, 165, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(166, 166, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(167, 167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(168, 168, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(169, 169, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(170, 170, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(171, 171, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(172, 172, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(173, 173, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(174, 174, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(175, 175, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(176, 176, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(177, 177, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(178, 178, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(179, 179, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(180, 180, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(181, 181, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(182, 182, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(183, 183, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(184, 184, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(185, 185, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(186, 186, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(187, 187, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(188, 188, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(189, 189, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(190, 190, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(191, 191, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(192, 192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(193, 193, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(194, 194, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(195, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(196, 196, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(197, 197, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(198, 198, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(199, 199, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(200, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(201, 201, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(202, 202, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(203, 203, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204, 204, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(205, 205, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(206, 206, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(207, 207, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(208, 208, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(209, 209, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(210, 210, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(211, 211, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(212, 212, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(213, 213, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(214, 214, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0),
(215, 215, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(216, 216, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(217, 217, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(218, 218, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(219, 219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(220, 220, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(221, 221, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(222, 222, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(223, 223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(224, 224, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(225, 226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(226, 227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(227, 228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(228, 229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(229, 230, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(230, 231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(231, 232, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(232, 233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(233, 234, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(234, 235, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(235, 236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(236, 237, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(237, 239, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(238, 240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(239, 241, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(240, 242, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(241, 243, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(242, 244, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(243, 245, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(244, 246, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(245, 247, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(246, 248, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(247, 249, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(248, 250, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(249, 251, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(250, 252, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(251, 253, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(252, 254, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(253, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(254, 256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(255, 257, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(256, 258, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(257, 259, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(258, 260, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(259, 261, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(260, 262, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(261, 263, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(262, 264, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(263, 265, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(264, 266, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(265, 267, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(266, 268, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(267, 269, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(268, 270, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(269, 271, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(270, 272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(271, 273, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `probations`
--

CREATE TABLE `probations` (
  `probation_id` int(11) NOT NULL,
  `probation_name` varchar(60) NOT NULL,
  `probation_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `probations`
--

INSERT INTO `probations` (`probation_id`, `probation_name`, `probation_type`) VALUES
(1, 'Cocurricular Probation - Lack of AG', 0),
(2, 'Cocurricular Probation - Lack of AE', 0),
(3, 'Cocurricular Probation - Lack of AG and AE', 0),
(4, 'Cocurricular Probation - Lack of FDG', 0),
(5, 'Cocurricular Probation', 0);

-- --------------------------------------------------------

--
-- Table structure for table `probation_grants`
--

CREATE TABLE `probation_grants` (
  `probation_grant_id` int(11) NOT NULL,
  `probation_id` int(11) NOT NULL,
  `usr_id` int(11) NOT NULL,
  `probation_grant_requirement` decimal(5,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `probation_grants`
--

INSERT INTO `probation_grants` (`probation_grant_id`, `probation_id`, `usr_id`, `probation_grant_requirement`) VALUES
(27, 5, 26, '0.0'),
(28, 5, 35, '0.0'),
(29, 5, 41, '0.0'),
(30, 5, 70, '0.0'),
(31, 5, 83, '0.0'),
(32, 5, 118, '0.0'),
(33, 5, 140, '0.0');

-- --------------------------------------------------------

--
-- Table structure for table `semesters`
--

CREATE TABLE `semesters` (
  `sem_id` int(11) NOT NULL,
  `sem_prefix` varchar(20) NOT NULL,
  `sem_name` varchar(20) NOT NULL,
  `sem_active` int(11) NOT NULL,
  `sem_start_date` datetime NOT NULL,
  `sem_end_date` datetime DEFAULT NULL,
  `carry_over_fdg` int(11) NOT NULL DEFAULT 0,
  `carry_over_com_serv` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `semesters`
--

INSERT INTO `semesters` (`sem_id`, `sem_prefix`, `sem_name`, `sem_active`, `sem_start_date`, `sem_end_date`, `carry_over_fdg`, `carry_over_com_serv`) VALUES
(12, 'fa2016', 'Fall 2016', 0, '2016-09-03 00:13:16', '2017-01-23 09:40:13', 0, 0),
(13, 'SP17', 'Spring 2017', 0, '2017-01-23 09:41:02', '2017-06-16 09:41:52', 1, 1),
(14, 'FA17', 'Fall 2017', 0, '2017-06-16 12:28:24', '2018-01-15 14:17:57', 0, 0),
(15, 'SP18', 'Spring 2018', 1, '2018-01-15 14:19:33', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `SP17_academicevents`
--

CREATE TABLE `SP17_academicevents` (
  `acad_id` int(11) NOT NULL,
  `acad_title` varchar(60) NOT NULL,
  `acad_description` varchar(200) NOT NULL,
  `acad_start_date` datetime NOT NULL,
  `acad_end_date` datetime NOT NULL,
  `acad_bg_color` varchar(7) DEFAULT '#0000ff',
  `acad_ft_color` varchar(7) DEFAULT '#ffffff'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SP17_academicevents`
--

INSERT INTO `SP17_academicevents` (`acad_id`, `acad_title`, `acad_description`, `acad_start_date`, `acad_end_date`, `acad_bg_color`, `acad_ft_color`) VALUES
(1, 'Student Opportunity Seminar', 'AE', '2017-02-08 18:00:00', '2017-02-08 19:00:00', '#0000ff', '#ffffff'),
(2, 'Documentary & Discussion', 'AE', '2017-02-14 12:30:00', '2017-02-14 13:30:00', '#0000ff', '#ffffff'),
(3, 'Tea with the President + Provost', 'AE', '2017-02-23 12:30:00', '2017-02-23 13:30:00', '#0000ff', '#ffffff'),
(4, 'Career Services Workshop', 'AE', '2017-02-28 12:30:00', '2017-02-28 13:30:00', '#0000ff', '#ffffff'),
(5, 'Department Roulette', 'AE', '2017-03-02 12:30:00', '2017-03-02 13:30:00', '#0000ff', '#ffffff'),
(6, 'Playwright Reading', 'AE', '2017-02-07 19:00:00', '2017-02-07 20:00:00', '#0000ff', '#ffffff'),
(7, 'Guest Speaker- Joby Topper', 'AE', '2017-02-27 18:30:00', '2017-02-27 19:30:00', '#0000ff', '#ffffff'),
(8, 'PSECU Event', 'AE', '2017-03-09 12:30:00', '2017-03-09 13:30:00', '#0000ff', '#ffffff'),
(9, 'Career Services Workshop', 'AE', '2017-03-30 12:30:00', '2017-03-30 13:30:00', '#0000ff', '#ffffff'),
(10, 'Last Lecture Speaker Series', 'AE', '2017-04-10 18:30:00', '2017-04-10 19:30:00', '#0000ff', '#ffffff'),
(11, 'Planetarium Show', 'AE', '2017-04-11 19:00:00', '2017-04-11 20:00:00', '#0000ff', '#ffffff'),
(12, 'Documentary & Discussion', 'AE', '2017-04-18 12:30:00', '2017-04-18 13:30:00', '#0000ff', '#ffffff'),
(13, 'PSECU Event', 'AE', '2017-04-27 12:30:00', '2017-04-27 13:30:00', '#0000ff', '#ffffff'),
(14, 'update1', 'AE', '2017-03-27 00:00:00', '2017-03-27 01:00:00', '#0000ff', '#ffffff'),
(15, 'Dance Consort', 'AE', '2017-04-20 14:00:00', '2017-04-20 15:00:00', '#0000ff', '#ffffff'),
(16, 'Take Back the Night', 'AE', '2017-04-26 00:00:00', '2017-04-26 01:00:00', '#0000ff', '#ffffff'),
(18, 'Alumni Networking', 'AE', '2017-04-29 12:00:00', '2017-04-29 13:00:00', '#0000ff', '#ffffff'),
(24, 'Talent Show', 'AE', '2017-05-05 19:00:00', '2017-05-05 20:00:00', '#0000ff', '#ffffff'),
(25, 'Celebration of Scholarship', 'AE', '2017-04-19 13:00:00', '2017-04-19 14:00:00', '#0000ff', '#ffffff'),
(26, 'Talent Show', 'AE', '2017-05-05 19:00:00', '2017-05-05 20:00:00', '#0000ff', '#ffffff');

-- --------------------------------------------------------

--
-- Table structure for table `SP17_academicevent_attendence`
--

CREATE TABLE `SP17_academicevent_attendence` (
  `acad_att_id` int(11) NOT NULL,
  `acad_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SP17_academicevent_attendence`
--

INSERT INTO `SP17_academicevent_attendence` (`acad_att_id`, `acad_id`, `pstu_id`) VALUES
(1, 1, 13),
(2, 1, 21),
(3, 1, 24),
(4, 1, 31),
(5, 1, 44),
(7, 1, 46),
(6, 1, 48),
(37, 2, 12),
(39, 2, 28),
(38, 2, 44),
(44, 2, 48),
(40, 2, 60),
(25, 3, 6),
(10, 3, 8),
(20, 3, 10),
(9, 3, 11),
(12, 3, 12),
(28, 3, 21),
(17, 3, 22),
(43, 3, 23),
(11, 3, 24),
(34, 3, 25),
(13, 3, 28),
(26, 3, 31),
(18, 3, 32),
(33, 3, 34),
(27, 3, 39),
(32, 3, 45),
(23, 3, 53),
(22, 3, 100),
(14, 3, 108),
(30, 3, 114),
(24, 3, 117),
(35, 3, 124),
(8, 3, 135),
(36, 3, 190),
(16, 3, 197),
(31, 3, 206),
(19, 3, 214),
(15, 3, 217),
(29, 3, 222),
(60, 4, 42),
(59, 4, 146),
(58, 4, 165),
(54, 5, 43),
(46, 5, 58),
(47, 5, 59),
(48, 5, 65),
(49, 5, 73),
(50, 5, 75),
(51, 5, 91),
(52, 5, 107),
(221, 5, 109),
(53, 5, 110),
(45, 5, 165),
(72, 6, 29),
(73, 6, 31),
(74, 6, 34),
(75, 6, 35),
(77, 6, 49),
(70, 6, 76),
(71, 6, 81),
(65, 6, 135),
(62, 6, 162),
(63, 6, 169),
(64, 6, 209),
(76, 6, 226),
(93, 7, 9),
(94, 7, 11),
(95, 7, 17),
(96, 7, 33),
(99, 7, 45),
(97, 7, 47),
(98, 7, 50),
(91, 7, 61),
(92, 7, 82),
(82, 7, 116),
(83, 7, 122),
(84, 7, 123),
(85, 7, 128),
(86, 7, 130),
(87, 7, 132),
(88, 7, 147),
(89, 7, 151),
(90, 7, 159),
(80, 7, 177),
(81, 7, 205),
(56, 8, 32),
(57, 8, 43),
(55, 8, 125),
(103, 9, 22),
(108, 9, 23),
(107, 9, 30),
(101, 9, 32),
(106, 9, 39),
(105, 9, 50),
(100, 9, 96),
(104, 9, 120),
(102, 9, 158),
(109, 9, 180),
(153, 10, 5),
(154, 10, 6),
(155, 10, 8),
(156, 10, 10),
(157, 10, 12),
(158, 10, 13),
(159, 10, 14),
(160, 10, 17),
(161, 10, 18),
(162, 10, 22),
(163, 10, 23),
(164, 10, 25),
(165, 10, 29),
(166, 10, 33),
(167, 10, 36),
(168, 10, 42),
(169, 10, 43),
(186, 10, 45),
(187, 10, 46),
(170, 10, 48),
(171, 10, 49),
(172, 10, 50),
(173, 10, 51),
(133, 10, 53),
(134, 10, 55),
(135, 10, 58),
(136, 10, 64),
(137, 10, 67),
(138, 10, 69),
(139, 10, 80),
(140, 10, 81),
(141, 10, 82),
(142, 10, 84),
(143, 10, 89),
(144, 10, 91),
(145, 10, 95),
(146, 10, 98),
(147, 10, 101),
(148, 10, 102),
(149, 10, 103),
(150, 10, 106),
(151, 10, 110),
(118, 10, 115),
(119, 10, 116),
(120, 10, 118),
(121, 10, 119),
(122, 10, 122),
(123, 10, 123),
(124, 10, 125),
(188, 10, 126),
(125, 10, 127),
(126, 10, 132),
(127, 10, 147),
(128, 10, 150),
(129, 10, 151),
(130, 10, 155),
(131, 10, 156),
(132, 10, 159),
(110, 10, 171),
(111, 10, 172),
(112, 10, 173),
(113, 10, 176),
(114, 10, 183),
(116, 10, 196),
(117, 10, 207),
(115, 10, 214),
(152, 10, 217),
(209, 11, 5),
(210, 11, 8),
(211, 11, 17),
(212, 11, 27),
(213, 11, 29),
(214, 11, 33),
(215, 11, 36),
(216, 11, 37),
(217, 11, 40),
(220, 11, 44),
(218, 11, 47),
(219, 11, 49),
(199, 11, 53),
(200, 11, 66),
(201, 11, 69),
(202, 11, 73),
(203, 11, 75),
(204, 11, 80),
(205, 11, 84),
(206, 11, 89),
(207, 11, 96),
(208, 11, 102),
(193, 11, 114),
(194, 11, 119),
(222, 11, 120),
(195, 11, 126),
(196, 11, 134),
(197, 11, 144),
(198, 11, 150),
(189, 11, 163),
(190, 11, 182),
(191, 11, 187),
(192, 11, 190),
(256, 12, 9),
(251, 12, 42),
(248, 12, 44),
(254, 12, 167),
(253, 12, 172),
(255, 12, 178),
(252, 12, 192),
(258, 13, 18),
(262, 13, 30),
(261, 13, 59),
(259, 13, 63),
(257, 13, 158),
(260, 13, 167),
(79, 14, 34),
(78, 14, 108),
(227, 15, 36),
(228, 15, 37),
(229, 15, 40),
(230, 15, 47),
(231, 15, 51),
(224, 15, 86),
(225, 15, 88),
(226, 15, 90),
(223, 15, 202),
(235, 16, 37),
(234, 16, 40),
(239, 16, 63),
(238, 16, 67),
(236, 16, 176),
(237, 16, 183),
(233, 16, 213),
(245, 18, 5),
(247, 18, 46),
(244, 18, 127),
(240, 18, 190),
(241, 18, 197),
(242, 18, 206),
(243, 18, 213),
(246, 18, 226),
(315, 25, 21),
(316, 25, 30),
(317, 25, 48),
(310, 25, 54),
(311, 25, 64),
(312, 25, 66),
(313, 25, 85),
(314, 25, 101),
(304, 25, 111),
(305, 25, 131),
(306, 25, 134),
(307, 25, 143),
(308, 25, 148),
(309, 25, 154),
(296, 25, 162),
(297, 25, 163),
(298, 25, 177),
(299, 25, 180),
(300, 25, 182),
(301, 25, 192),
(302, 25, 196),
(303, 25, 202),
(292, 26, 31),
(291, 26, 33),
(293, 26, 40),
(318, 26, 48),
(295, 26, 62),
(294, 26, 75),
(288, 26, 117),
(289, 26, 159),
(290, 26, 226);

-- --------------------------------------------------------

--
-- Table structure for table `SP17_activitygroup`
--

CREATE TABLE `SP17_activitygroup` (
  `ag_id` int(11) NOT NULL,
  `ag_title` varchar(40) NOT NULL,
  `ag_description` varchar(500) NOT NULL,
  `ag_imagepath` varchar(30) DEFAULT NULL,
  `ag_bg_color` varchar(7) DEFAULT '#0000ff',
  `ag_ft_color` varchar(7) DEFAULT '#ffffff'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SP17_activitygroup`
--

INSERT INTO `SP17_activitygroup` (`ag_id`, `ag_title`, `ag_description`, `ag_imagepath`, `ag_bg_color`, `ag_ft_color`) VALUES
(1, 'Special Events', 'SE', '', '#0000ff', '#ffffff'),
(2, 'Update Group', 'Updates', '', '#0000ff', '#ffffff'),
(3, 'Color Me Crazy', 'AG', '', '#0000ff', '#ffffff'),
(4, 'Super Hero Movie Group', 'AG', '', '#0000ff', '#ffffff'),
(5, 'Rhythm Game Group', 'AG', '', '#0000ff', '#ffffff'),
(6, 'Not Just Dungeons and Dragons', 'AG', '', '#0000ff', '#ffffff'),
(7, 'Chicks, Flicks, and Conflicts', 'AG', '', '#0000ff', '#ffffff'),
(8, 'Lost', 'AG', '', '#0000ff', '#ffffff'),
(9, 'Anything Goes', 'AG', '', '#0000ff', '#ffffff'),
(10, 'Study Session', 'AG', '', '#0000ff', '#ffffff'),
(11, 'Study Time', 'AG', '', '#0000ff', '#ffffff'),
(12, 'Get Outside', 'AG', '', '#0000ff', '#ffffff'),
(13, 'Walleyball', 'AG', '', '#0000ff', '#ffffff'),
(14, 'Study Hour', 'AG', '', '#0000ff', '#ffffff'),
(15, 'Game of Thrones', 'AG', '', '#0000ff', '#ffffff'),
(16, 'BIW', 'AG', '', '#0000ff', '#ffffff'),
(17, 'Novel Writing', 'AG', '', '#0000ff', '#ffffff');

-- --------------------------------------------------------

--
-- Table structure for table `SP17_activitygroupleaders`
--

CREATE TABLE `SP17_activitygroupleaders` (
  `ag_leaders` int(11) NOT NULL,
  `ag_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SP17_activitygroupleaders`
--

INSERT INTO `SP17_activitygroupleaders` (`ag_leaders`, `ag_id`, `pstu_id`) VALUES
(23, 1, 214),
(1, 3, 95),
(3, 4, 54),
(2, 4, 149),
(4, 5, 42),
(5, 6, 213),
(6, 7, 167),
(7, 8, 114),
(8, 8, 144),
(18, 9, 56),
(17, 9, 160),
(10, 10, 62),
(9, 10, 75),
(11, 11, 85),
(12, 12, 126),
(13, 12, 133),
(14, 13, 115),
(15, 13, 125),
(16, 14, 113),
(19, 15, 190),
(20, 16, 145),
(21, 16, 155),
(22, 17, 209);

-- --------------------------------------------------------

--
-- Table structure for table `SP17_activitygroupsession`
--

CREATE TABLE `SP17_activitygroupsession` (
  `agses_id` int(11) NOT NULL,
  `ag_id` int(11) NOT NULL,
  `agses_start_time` datetime NOT NULL,
  `agses_end_time` datetime NOT NULL,
  `agses_description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SP17_activitygroupsession`
--

INSERT INTO `SP17_activitygroupsession` (`agses_id`, `ag_id`, `agses_start_time`, `agses_end_time`, `agses_description`) VALUES
(2, 14, '2017-02-09 14:30:00', '2017-02-09 15:30:00', 'Session was canceled due to a snow day closure of campus.'),
(3, 14, '2017-02-16 14:30:00', '2017-02-16 15:30:00', 'We did a quick introductory activity and then we studied for the rest of the time.'),
(4, 14, '2017-02-23 14:30:00', '2017-02-23 15:30:00', 'We sat outside because it was such a beautiful day. We sat on the front porch to study.'),
(5, 14, '2017-03-02 14:30:00', '2017-03-02 15:30:00', 'We did a quick introduction icebreaker, and then we studied the rest of the time.'),
(6, 14, '2017-03-09 14:30:00', '2017-03-09 15:30:00', 'We did a quick introductory activity to get to know each other, and then we studied for the rest of the time.'),
(7, 14, '2017-03-23 14:30:00', '2017-03-23 15:30:00', 'We did a quick introductory activity and then we studied for the rest of the time.'),
(8, 14, '2017-03-30 14:30:00', '2017-03-30 15:30:00', 'We did an introductory activity and then we studied and shared studying tips for the rest of the time.'),
(9, 14, '2017-04-06 14:30:00', '2017-04-06 15:30:00', 'We did a fast introductory activity then we studied for the rest of the time.'),
(10, 14, '2017-04-13 14:30:00', '2017-04-13 15:30:00', 'We did a fast introductory activity and then we studied for the rest of the time.'),
(11, 14, '2017-04-20 14:30:00', '2017-04-20 15:30:00', 'We did a quick introductory activity, and then we studied for the rest of the time.'),
(12, 14, '2017-04-27 14:30:00', '2017-04-27 15:30:00', 'We did a quick introductory activity, and I said that this was the last meeting for the semester.  We will not meet next week.'),
(13, 7, '2017-01-31 16:00:00', '2017-01-31 17:00:00', ''),
(14, 7, '2017-02-07 16:00:00', '2017-02-07 17:00:00', ''),
(15, 7, '2017-02-14 16:00:00', '2017-02-14 17:00:00', ''),
(16, 7, '2017-02-21 16:00:00', '2017-02-21 17:00:00', ''),
(17, 7, '2017-02-28 16:00:00', '2017-02-28 17:00:00', ''),
(18, 7, '2017-03-07 16:00:00', '2017-03-07 17:00:00', ''),
(19, 7, '2017-03-14 16:00:00', '2017-03-14 17:00:00', ''),
(20, 7, '2017-03-21 16:00:00', '2017-03-21 17:00:00', ''),
(21, 7, '2017-03-28 16:00:00', '2017-03-28 17:00:00', ''),
(22, 7, '2017-03-28 16:00:00', '2017-03-28 17:00:00', ''),
(23, 7, '2017-04-04 16:00:00', '2017-04-04 17:00:00', ''),
(24, 7, '2017-04-11 16:00:00', '2017-04-11 17:00:00', ''),
(25, 7, '2017-04-18 16:00:00', '2017-04-18 17:00:00', ''),
(26, 7, '2017-04-25 16:00:00', '2017-04-25 17:00:00', ''),
(27, 7, '2017-05-02 16:00:00', '2017-05-02 17:00:00', ''),
(28, 10, '2017-02-01 11:00:00', '2017-02-01 12:00:00', 'We studied in the Honors House Common Room.'),
(29, 10, '2017-02-08 11:00:00', '2017-02-08 12:00:00', 'We studied in the Honors House Common Room.'),
(30, 10, '2017-02-15 11:00:00', '2017-02-15 12:00:00', 'We studied in the Honors House Common Room.'),
(31, 10, '2017-02-22 11:00:00', '2017-02-22 12:00:00', 'We studied in the Honors House Common Room.'),
(32, 10, '2017-03-01 11:00:00', '2017-03-01 12:00:00', 'We studied in the Honors House Common Room.'),
(35, 10, '2017-03-22 11:00:00', '2017-03-22 12:00:00', 'We studied in the Honors House Common Room'),
(36, 10, '2017-03-29 11:00:00', '2017-03-29 12:00:00', 'We studied in the Honors House Common Room.'),
(37, 10, '2017-04-05 11:00:00', '2017-04-05 12:00:00', 'We studied in the Honors House Common Room.'),
(38, 10, '2017-04-12 11:00:00', '2017-04-12 12:00:00', 'We studied in the Honors House common room.'),
(39, 10, '2017-04-19 11:00:00', '2017-04-19 12:00:00', 'We did not hold a session since it was Celebration of Scholarship.'),
(40, 10, '2017-04-26 11:00:00', '2017-04-26 12:00:00', 'We studied in the Honors House Common Room.'),
(41, 9, '2017-01-31 18:00:00', '2017-01-31 19:00:00', 'stations and wall sits'),
(42, 9, '2017-02-02 18:00:00', '2017-02-02 19:00:00', 'HIIT workout'),
(43, 9, '2017-02-07 18:00:00', '2017-02-07 19:00:00', '4 sets of 4 30-second workouts'),
(44, 9, '2017-02-09 18:00:00', '2017-02-09 19:00:00', 'stations and wall sits'),
(45, 9, '2017-02-14 18:00:00', '2017-02-14 19:00:00', 'HIIT workout'),
(46, 9, '2017-02-16 18:00:00', '2017-02-16 19:00:00', 'HIIT and jump rope'),
(47, 9, '2017-02-21 18:00:00', '2017-02-21 19:00:00', 'HIIT workout'),
(48, 9, '2017-02-23 18:00:00', '2017-02-23 19:00:00', 'stations and wall-sits'),
(49, 9, '2017-02-28 18:00:00', '2017-02-28 19:00:00', 'HIIT workout'),
(50, 9, '2017-03-02 18:00:00', '2017-03-02 19:00:00', 'HIIT and wall sits'),
(51, 9, '2017-03-07 18:00:00', '2017-03-07 19:00:00', 'HIIT workout'),
(52, 9, '2017-03-09 18:00:00', '2017-03-09 19:00:00', 'full body workout'),
(53, 9, '2017-03-21 18:00:00', '2017-03-21 19:00:00', 'stations, wall-sits, and jumping jacks'),
(54, 9, '2017-03-23 18:00:00', '2017-03-23 19:00:00', 'HIIT'),
(55, 9, '2017-03-28 18:00:00', '2017-03-28 19:00:00', 'HIIT workout 4 by 4'),
(56, 9, '2017-03-30 18:00:00', '2017-03-30 19:00:00', 'HIIT workouts'),
(57, 9, '2017-04-04 18:00:00', '2017-04-04 19:00:00', 'stations'),
(58, 9, '2017-04-06 18:00:00', '2017-04-06 19:00:00', 'HIIT workout and wall sits'),
(59, 9, '2017-04-11 18:00:00', '2017-04-11 19:00:00', 'HIIT, shoulders'),
(60, 9, '2017-04-13 18:00:00', '2017-04-13 19:00:00', 'HIIT and wall sits'),
(61, 9, '2017-04-18 18:00:00', '2017-04-18 19:00:00', 'stations and Anything Goes workouts'),
(62, 9, '2017-04-20 18:00:00', '2017-04-20 19:00:00', 'HIIT workout'),
(63, 9, '2017-04-25 18:00:00', '2017-04-25 19:00:00', 'butt and ab workout'),
(64, 9, '2017-04-27 18:00:00', '2017-04-27 19:00:00', 'stations and anything goes workouts'),
(65, 9, '2017-05-02 18:00:00', '2017-05-02 19:00:00', 'HIIT, 4 sets of 4, 30 second workouts'),
(66, 9, '2017-05-04 18:00:00', '2017-05-04 19:00:00', 'yoga'),
(67, 17, '2017-02-03 00:00:00', '2017-02-03 17:00:00', 'This week  we are going to create a book jacket summary for your novel, so you can get a feel of what you want to write. You must include the main character and conflict in this summary and it should be at least 300 words. You want to make sure to make it intriguing so you can try and grab readersâ€™ attention. \r\nAll submissions are due by 5pm on FRIDAY to: novelwritingghplhu@gmail.com\r\nThanks \r\nSam'),
(68, 17, '2017-02-10 00:00:00', '2017-02-10 17:00:00', 'So this week we are going to start with an important element to story writing, the setting. In at least 350 words describe a setting you want to be included in your novel or that you want to use in a short story. Try to be very descriptive and add some vivid imagery. You can include characters if you want, but we will do more on that next week.\r\n All submissions are due by 5pm on FRIDAY to: novelwritingghplhu@gmail.com\r\nThanks \r\nSam'),
(69, 17, '2017-02-17 00:00:00', '2017-02-17 01:00:00', 'This week we are going to create a character profile. This profile should be at least 350 words and include the name, age, looks and personality of the character you are creating, this part can be in either bullet points or paragraph format. Along with that you have to include a small internal monologue that shows how your character thinks. It can be about another character, themselves, a conflict, etc. Try to aim for a total of 350 words.\r\nAll submissions are due by 5pm on FRIDAY.'),
(70, 17, '2017-02-24 00:00:00', '2017-02-24 17:00:00', 'This week we are going to try and use the snowball effect, to get an outline of your novel. To do this you need to start off by writing a timeline of events that lead up and follow the main event of the story all the way to the end. This can either be done in bullet point or paragraph format. It must include the main event and at least 15 other events that come before or after the main event. They can be simple events or life changing ones, thatâ€™s all up to you.'),
(71, 17, '2017-03-03 00:00:00', '2017-03-03 17:00:00', 'Wild Card time! This week write whatever you type of short story, conflict, timeline, etc that you want. It just has to be at least 500 words. You can use this week to expand on the stories you have already started or to make something entirely new. \r\nAll submissions are due by 5pm on FRIDAY to: novelwritingghplhu@gmail.com\r\nThanks \r\nSam'),
(72, 17, '2017-03-10 00:00:00', '2017-03-10 17:00:00', 'This week we are going to combine setting, character and conflict. So in at least 500 words write a short story that has a central conflict but also describes the environment that the conflict is occurring in. You can use one character or multiple, whatever makes the story work.\r\nAll submissions are due by 5pm on FRIDAY:\r\nnovelwritingghplhu@gmail.com: \r\n\r\nThanks \r\nSam'),
(73, 17, '2017-03-17 00:00:00', '2017-03-17 17:00:00', 'Wild card time, again! In the spirit of St. Patrickâ€™s Day, write a short story combining supernatural elements (leprechauns, witches, etc.). You can combine them with everyday elements or not. The setting and conflict are up to you, just have fun with it!\r\n\r\nAll submissions are due by 5pm on FRIDAY:\r\nnovelwritingghplhu@gmail.com: \r\n\r\nThanks \r\nSam'),
(74, 17, '2017-03-24 00:00:00', '2017-03-24 17:00:00', 'Start it! So this week write a beginning to your novel that is about 500 words. Make sure you hook your readers in and have them wanting more. Use the work youâ€™ve already done or again the option to make something new is always there. Have fun with it and maybe this will be the beginning to your full novel one day.\r\n	All submissions are due by 5pm on FRIDAY:\r\nnovelwritingghplhu@gmail.com\r\nThanks, Sam'),
(75, 17, '2017-03-31 00:00:00', '2017-03-31 17:00:00', 'Keep it going this week! Continue your last piece or write a new piece that goes with your novel. Just make sure it is at least 500 words and to have fun with it.\r\n	All submissions are due by 5pm on FRIDAY:\r\nnovelwritingghplhu@gmail.com\r\nThanks, Sam'),
(76, 17, '2017-04-07 00:00:00', '2017-04-07 17:00:00', 'This week take a piece you already wrote or a new piece and write it from a new point of view. If the piece is new try to write from a point of view you donâ€™t really love. For example usually I write from third person, so to switch it up I would write something from first person (...I) or second person (...you). Try to write at least 500 words.\r\nAll submissions are due by 5pm on FRIDAY:\r\nnovelwritingghplhu@gmail.com\r\nThanks, Sam'),
(77, 17, '2017-04-14 00:00:00', '2017-04-14 17:00:00', 'Wild card time! With Easter being this weekend, write a short story including some of your favorite furry animals (chicks, bunnies, etc). You can add whatever characters you want to write the story, in whatever setting you prefer. Make sure it is at least 500 words and have fun with it.\r\nAll submissions are due by 5pm on FRIDAY:\r\nnovelwritingghplhu@gmail.com\r\nThanks, Sam'),
(78, 17, '2017-04-21 00:00:00', '2017-04-21 17:00:00', 'This week take an old piece youâ€™ve worked on and write it from a different characterâ€™s perspective from the original story. Make sure it is at least 500 words and try to use vivid imagery throughout your piece. \r\nAll submissions are due by 5pm on FRIDAY:\r\nnovelwritingghplhu@gmail.com\r\nThanks, Sam'),
(79, 17, '2017-05-05 00:00:00', '2017-05-05 01:00:00', 'Write an ending! So this week write a 500 word short story that would either end your novel or a chapter of your novel.\r\n	All submissions are due by 5pm on FRIDAY:\r\nnovelwritingghplhu@gmail.com'),
(80, 17, '2017-04-28 00:00:00', '2017-04-28 17:00:00', 'Wild card time! Write anything you want this week, a short story, a poem, a play, etc. Just make sure you write 350 words for a poem and 500 words for a short story, etc.\r\nAll submissions are due by 5pm on FRIDAY:\r\nnovelwritingghplhu@gmail.com\r\nThanks, Sam'),
(81, 14, '2017-02-02 14:30:00', '2017-02-02 15:30:00', 'We did a quick introductory activity, and then we studied for the rest of the time.'),
(82, 11, '2017-02-01 15:00:00', '2017-02-01 16:00:00', 'Study time allows everyone to work on assignments for class'),
(83, 11, '2017-02-08 15:00:00', '2017-02-08 16:00:00', 'allows students to work on assignments for class'),
(84, 11, '2017-02-15 15:00:00', '2017-02-15 16:00:00', 'allows students to work on assignments for class'),
(85, 11, '2017-02-22 15:00:00', '2017-02-22 16:00:00', 'allows students to work on assignments for class'),
(86, 11, '2017-03-01 15:00:00', '2017-03-01 16:00:00', 'allows students to work on assignments for class'),
(87, 11, '2017-03-08 15:00:00', '2017-03-08 16:00:00', 'allows students to work on assignments for class'),
(88, 11, '2017-03-22 15:00:00', '2017-03-22 16:00:00', 'allows students to work on assignments for class'),
(89, 11, '2017-03-29 15:00:00', '2017-03-29 16:00:00', 'allows students to work on assignments for class'),
(90, 11, '2017-04-05 15:00:00', '2017-04-05 16:00:00', 'allows students to work on assignments for class'),
(91, 11, '2017-04-12 15:00:00', '2017-04-12 16:00:00', 'allows students to work on assignments for class'),
(92, 11, '2017-04-19 15:00:00', '2017-04-19 16:00:00', 'allows students to work on assignments for class'),
(93, 11, '2017-04-26 15:00:00', '2017-04-26 16:00:00', 'allows students to work on assignments for class'),
(95, 4, '2017-01-30 16:00:00', '2017-01-30 17:00:00', 'We introduced everyone to each other and discussed which movies we would like to watch for the semester.'),
(96, 4, '2017-02-06 16:00:00', '2017-02-06 17:00:00', 'Today we watched the first hour of The Dark Knight Rises.'),
(97, 4, '2017-02-13 16:00:00', '2017-02-13 17:00:00', 'this session has not occurred yet'),
(98, 4, '2017-02-20 16:00:00', '2017-02-20 17:00:00', 'this session has not occurred yet'),
(99, 4, '2017-02-27 16:00:00', '2017-02-27 17:00:00', 'this session has not occurred yet'),
(100, 4, '2017-03-06 16:00:00', '2017-03-06 17:00:00', 'We finished the rest of Ant-Man and decided on the next movie we want to watch.'),
(101, 4, '2017-03-13 16:00:00', '2017-03-13 17:00:00', 'this session has not occurred yet'),
(102, 4, '2017-03-20 16:00:00', '2017-03-20 17:00:00', 'this session has not occurred yet'),
(103, 4, '2017-03-27 16:00:00', '2017-03-27 17:00:00', 'this session has not occurred yet'),
(104, 4, '2017-04-03 16:00:00', '2017-04-03 17:00:00', 'this session has not occurred yet'),
(105, 4, '2017-04-10 16:00:00', '2017-04-10 17:00:00', 'this session has not occurred yet'),
(106, 4, '2017-04-17 16:00:00', '2017-04-17 17:00:00', 'this session has not occurred yet'),
(107, 4, '2017-04-24 16:00:00', '2017-04-24 17:00:00', 'We watched the second part of X-Men Apocalypse.'),
(108, 16, '2017-01-30 00:00:00', '2017-02-03 16:00:00', 'What did you do over Christmas break??'),
(109, 16, '2017-02-06 00:00:00', '2017-02-10 16:00:00', 'If you were a superhero or a super villain who/what would your powers be'),
(110, 16, '2017-02-13 00:00:00', '2017-02-17 16:00:00', 'Write your favorite memory with your best friend!'),
(111, 16, '2017-02-20 00:00:00', '2017-02-24 16:00:00', 'If you were president for the day, what would you do?'),
(112, 16, '2017-02-27 00:00:00', '2017-03-03 16:00:00', 'Tell us a time when you found it hard to keep a secret'),
(113, 16, '2017-03-06 00:00:00', '2017-03-10 16:00:00', 'What are your big plans for spring break?'),
(114, 16, '2017-03-20 00:00:00', '2017-03-24 16:00:00', 'What did you do over spring break?'),
(115, 16, '2017-03-27 00:00:00', '2017-03-31 16:00:00', 'Session not held :('),
(116, 16, '2017-04-03 00:00:00', '2017-04-07 16:00:00', 'Tell us something that you have done that you are super proud of, or a failure you have had and what you learned from it.'),
(117, 16, '2017-04-14 16:00:00', '2017-04-14 17:00:00', 'Write about your life if it was in a parallel universe'),
(118, 16, '2017-04-17 00:00:00', '2017-04-21 16:00:00', 'Write about how you like to spend your free time!'),
(120, 16, '2017-05-01 00:00:00', '2017-05-05 16:00:00', 'Highlight or low light of the year'),
(121, 5, '2017-01-30 17:00:00', '2017-01-30 18:00:00', 'I was the only one there.'),
(122, 5, '2017-02-06 17:00:00', '2017-02-06 18:00:00', 'Downloaded & played ReRave.'),
(123, 5, '2017-02-13 17:00:00', '2017-02-13 18:00:00', 'Downloaded and played Hachi Hachi.'),
(124, 5, '2017-02-20 17:00:00', '2017-02-20 18:00:00', 'Played Symphonica.'),
(125, 5, '2017-02-27 17:00:00', '2017-02-27 18:00:00', 'I was the only one there.'),
(126, 5, '2017-03-06 17:00:00', '2017-03-06 18:00:00', 'I was the only one there.'),
(127, 5, '2017-03-20 17:00:00', '2017-03-20 18:00:00', 'I was the only one there.'),
(128, 5, '2017-03-27 17:00:00', '2017-03-27 18:00:00', 'Played Piano Tiles due to warm weather.'),
(129, 5, '2017-04-03 17:00:00', '2017-04-03 18:00:00', 'I was the only one there.'),
(130, 5, '2017-04-10 17:00:00', '2017-04-10 18:00:00', 'I was the only one there.'),
(131, 5, '2017-04-17 17:00:00', '2017-04-17 18:00:00', 'I was the only one there.'),
(132, 5, '2017-04-24 17:00:00', '2017-04-24 18:00:00', 'Session 12'),
(133, 5, '2017-05-01 17:00:00', '2017-05-01 18:00:00', 'Played Symphonica.'),
(134, 8, '2017-01-31 17:00:00', '2017-01-31 18:00:00', ''),
(135, 8, '2017-02-06 17:00:00', '2017-02-06 18:00:00', ''),
(136, 8, '2017-02-14 17:30:00', '2017-02-14 18:30:00', ''),
(137, 8, '2017-02-21 17:30:00', '2017-02-21 18:30:00', ''),
(138, 8, '2017-02-28 17:30:00', '2017-02-28 18:30:00', ''),
(139, 8, '2017-03-07 17:30:00', '2017-03-07 18:30:00', ''),
(140, 8, '2017-03-21 17:30:00', '2017-03-21 18:30:00', ''),
(141, 8, '2017-03-28 17:30:00', '2017-03-28 18:30:00', ''),
(142, 8, '2017-04-04 17:30:00', '2017-04-04 18:30:00', ''),
(143, 8, '2017-04-11 17:30:00', '2017-04-11 18:30:00', ''),
(144, 8, '2017-04-18 17:30:00', '2017-04-18 18:30:00', ''),
(145, 8, '2017-04-25 17:30:00', '2017-04-25 18:30:00', ''),
(146, 8, '2017-05-02 17:30:00', '2017-05-02 18:30:00', ''),
(147, 8, '2017-02-07 17:30:00', '2017-02-07 18:30:00', ''),
(148, 12, '2017-01-31 12:30:00', '2017-01-31 13:30:00', 'This session has not occurred yet'),
(149, 12, '2017-02-07 12:30:00', '2017-02-07 13:30:00', 'This session has not occurred yet'),
(150, 12, '2017-02-14 12:30:00', '2017-02-14 13:30:00', 'this session has not occurred yet'),
(151, 12, '2017-02-21 12:30:00', '2017-02-21 13:30:00', 'this session has not occurred yet'),
(152, 12, '2017-02-28 12:30:00', '2017-02-28 13:30:00', 'this session has not occurred yet'),
(153, 12, '2017-03-07 12:30:00', '2017-03-07 13:30:00', 'hasn\'t occurred yet'),
(154, 12, '2017-03-14 12:30:00', '2017-03-14 13:30:00', 'not yet'),
(155, 12, '2017-03-21 12:30:00', '2017-03-21 13:30:00', 'not yet'),
(156, 12, '2017-03-28 12:30:00', '2017-03-28 13:30:00', 'not yet'),
(157, 12, '2017-04-04 12:30:00', '2017-04-04 13:30:00', 'not yet'),
(158, 12, '2017-04-11 12:30:00', '2017-04-11 13:30:00', 'not yet'),
(159, 12, '2017-04-18 12:30:00', '2017-04-18 13:30:00', 'not yet'),
(160, 12, '2017-04-18 12:30:00', '2017-04-18 13:30:00', 'not yet'),
(161, 12, '2017-04-25 12:30:00', '2017-04-25 13:30:00', 'not yet'),
(162, 12, '2017-05-02 12:30:00', '2017-05-02 13:30:00', 'not yet'),
(163, 13, '2017-02-02 13:00:00', '2017-02-02 14:00:00', 'We warmed up first and then played a couple of games.'),
(164, 13, '2017-02-09 13:00:00', '2017-02-09 14:00:00', 'This session has not yet occurred.'),
(165, 13, '2017-02-16 13:00:00', '2017-02-16 14:00:00', 'We hit the ball back and forth the entire time'),
(166, 13, '2017-02-23 13:00:00', '2017-02-23 14:00:00', 'We volleyed the ball back and forth. We also learned a new way of overhand serving to put backspin on the ball and practiced that.'),
(167, 13, '2017-03-02 13:00:00', '2017-03-02 14:00:00', 'We volleyed back and forth and then played a few games.'),
(168, 13, '2017-02-09 13:00:00', '2017-02-09 14:00:00', 'This session has not yet occurred.'),
(169, 13, '2017-03-16 13:00:00', '2017-03-16 14:00:00', 'This session has not yet occurred.'),
(170, 13, '2017-03-16 13:00:00', '2017-03-16 14:00:00', 'This session has not yet occurred.'),
(171, 13, '2017-03-23 13:00:00', '2017-03-23 14:00:00', 'We volley the ball back and forth for a while, played two games, and then volleyed some more.'),
(172, 13, '2017-03-30 13:00:00', '2017-03-30 14:00:00', 'We volleyed back and forth for a while and then played a game.'),
(173, 13, '2017-04-06 13:00:00', '2017-04-06 14:00:00', 'We warmed up for a while and then played three games, switching who was on which team for each game.'),
(174, 13, '2017-04-13 13:00:00', '2017-04-13 14:00:00', 'We warmed up and then played 3 games.'),
(175, 13, '2017-04-20 13:00:00', '2017-04-20 14:00:00', 'This session has not yet occurred.'),
(176, 13, '2017-04-20 13:00:00', '2017-04-20 14:00:00', 'This session has not yet occurred.'),
(177, 13, '2017-04-27 13:00:00', '2017-04-27 14:00:00', 'We warmed up for a while and then played a couple of games.'),
(178, 13, '2017-05-04 13:00:00', '2017-05-04 14:00:00', 'We warmed up for a little and played 3 games.'),
(179, 3, '2017-01-30 15:00:00', '2017-01-30 16:00:00', 'We colored and welcomed new colorers to our group!'),
(180, 3, '2017-02-06 15:00:00', '2017-02-06 16:00:00', 'We colored and discussed school projects we were working on.'),
(181, 3, '2017-02-13 15:00:00', '2017-02-13 16:00:00', ''),
(182, 3, '2017-02-20 15:00:00', '2017-02-20 16:00:00', ''),
(183, 3, '2017-02-27 15:00:00', '2017-02-27 16:00:00', ''),
(184, 3, '2017-03-06 15:00:00', '2017-03-06 16:00:00', ''),
(185, 3, '2017-03-13 15:00:00', '2017-03-13 16:00:00', ''),
(186, 3, '2017-03-20 15:00:00', '2017-03-20 16:00:00', ''),
(187, 3, '2017-03-27 15:00:00', '2017-03-27 16:00:00', ''),
(188, 3, '2017-04-03 15:00:00', '2017-04-03 16:00:00', ''),
(189, 3, '2017-04-10 15:00:00', '2017-04-10 16:00:00', ''),
(190, 3, '2017-04-17 15:00:00', '2017-04-17 16:00:00', ''),
(191, 3, '2017-04-24 15:00:00', '2017-04-24 16:00:00', ''),
(192, 7, '2017-02-07 16:00:00', '2017-02-07 17:00:00', 'We finished watching The Girl on the Train today.'),
(193, 6, '2017-01-31 12:00:00', '2017-01-31 14:00:00', 'We filled out character sheets.'),
(194, 6, '2017-02-14 12:00:00', '2017-02-14 14:00:00', ''),
(195, 6, '2017-02-28 12:00:00', '2017-02-28 14:00:00', ''),
(196, 1, '2017-02-16 19:00:00', '2017-02-16 20:00:00', 'Newly Wed Night'),
(197, 1, '2017-01-17 19:00:00', '2017-01-17 20:00:00', 'Valentine\'s Day'),
(198, 15, '2017-02-01 00:00:00', '2017-02-01 01:00:00', ''),
(199, 15, '2017-03-29 00:00:00', '2017-03-29 01:00:00', ''),
(200, 10, '2017-03-08 11:00:00', '2017-03-08 12:00:00', 'We studied in the Honors House Common Room'),
(202, 1, '2017-03-02 19:00:00', '2017-03-02 20:00:00', 'Trivia'),
(203, 1, '2017-03-01 19:00:00', '2017-03-01 20:00:00', 'Clash of the Classes Mar 1st'),
(204, 1, '2017-03-03 18:30:00', '2017-03-03 19:30:00', 'Gameshow Extravaganza'),
(205, 2, '2017-03-27 00:00:00', '2017-03-27 01:00:00', 'update 1'),
(206, 1, '2017-03-29 16:30:00', '2017-03-29 17:30:00', 'The Egg hunt!'),
(207, 2, '2017-04-19 00:00:00', '2017-04-19 01:00:00', ''),
(208, 2, '2017-04-18 00:00:00', '2017-04-18 01:00:00', ''),
(209, 10, '2017-05-03 11:00:00', '2017-05-03 12:00:00', ''),
(211, 6, '2017-04-25 13:00:00', '2017-04-25 14:00:00', 'We played more of the campaign'),
(212, 6, '2017-01-31 13:00:00', '2017-01-31 14:00:00', 'We played the campaign.'),
(213, 6, '2017-02-14 13:00:00', '2017-02-14 14:00:00', 'We played the campaign.'),
(214, 6, '2017-03-28 13:00:00', '2017-03-28 14:00:00', 'We played the campaign.'),
(215, 6, '2017-04-11 13:00:00', '2017-04-11 14:00:00', 'We played the campaign.'),
(217, 6, '2017-04-11 12:00:00', '2017-04-11 13:00:00', 'We played the campaign.'),
(218, 6, '2017-04-25 12:00:00', '2017-04-25 13:00:00', 'We played the campaign.'),
(219, 6, '2017-02-28 13:00:00', '2017-02-28 14:00:00', 'We played the campaign.'),
(220, 6, '2017-03-14 13:00:00', '2017-03-14 14:00:00', 'We played the campaign.'),
(221, 6, '2017-03-14 12:00:00', '2017-03-14 13:00:00', 'We played the campaign.'),
(222, 3, '2017-05-01 15:00:00', '2017-05-01 16:00:00', 'We colored and talked about our excitement for the semester to be over!'),
(223, 11, '2017-05-03 15:00:00', '2017-05-03 16:00:00', ''),
(224, 2, '2017-05-04 00:00:00', '2017-05-04 01:00:00', ''),
(225, 2, '2017-05-04 00:00:00', '2017-05-04 01:00:00', ''),
(226, 2, '2017-05-05 00:00:00', '2017-05-05 01:00:00', 'update group'),
(227, 2, '2017-05-09 00:00:00', '2017-05-09 01:00:00', 'update group'),
(228, 2, '2017-05-03 04:00:00', '2017-05-03 05:00:00', 'update #5'),
(229, 2, '2017-05-03 15:00:00', '2017-05-03 16:00:00', 'update #5'),
(230, 2, '2017-05-03 12:00:00', '2017-05-03 13:00:00', 'update #4'),
(231, 2, '2017-05-03 00:00:00', '2017-05-03 01:00:00', 'update #4'),
(232, 15, '2017-02-08 00:00:00', '2017-02-08 01:00:00', 'I missed the meeting'),
(233, 15, '2017-05-03 00:00:00', '2017-05-03 01:00:00', ''),
(234, 15, '2017-05-01 00:00:00', '2017-05-01 01:00:00', ''),
(235, 10, '2017-05-03 11:00:00', '2017-05-03 12:00:00', 'We studied in the Honors House Common Room.'),
(236, 17, '2017-05-12 00:00:00', '2017-05-12 17:00:00', 'It\'s a dual prompt week. So you can pick one or the other. The first being most people\'s favorite, wild card! If that\'s too open for you though with finals week and all, you can try your hand at a story with a college campus as your setting. All submissions should be at least 500 words and are due by Friday at 5pm, but if you can have them sent in earlier that would be greatly appreciated. Thank you, Sam.'),
(237, 4, '2017-05-01 16:00:00', '2017-05-01 17:00:00', ''),
(238, 1, '2017-05-05 02:00:00', '2017-05-05 03:00:00', 'Alumni Trivia'),
(239, 1, '2017-04-20 14:31:00', '2017-04-20 15:31:00', 'Dance Consort'),
(240, 1, '2017-05-07 00:00:00', '2017-05-07 01:00:00', 'FDG wars');

-- --------------------------------------------------------

--
-- Table structure for table `SP17_activitygroupstats`
--

CREATE TABLE `SP17_activitygroupstats` (
  `agstat_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL,
  `agses_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SP17_activitygroupstats`
--

INSERT INTO `SP17_activitygroupstats` (`agstat_id`, `pstu_id`, `agses_id`) VALUES
(15, 5, 95),
(144, 5, 97),
(352, 5, 99),
(382, 5, 100),
(750, 5, 128),
(349, 5, 183),
(393, 5, 184),
(707, 5, 188),
(920, 5, 190),
(463, 5, 202),
(504, 5, 204),
(657, 5, 206),
(1045, 5, 240),
(1013, 6, 178),
(250, 6, 196),
(297, 6, 197),
(416, 6, 198),
(478, 6, 204),
(649, 6, 206),
(963, 6, 232),
(961, 6, 233),
(962, 6, 234),
(1015, 6, 237),
(1051, 6, 240),
(261, 7, 196),
(477, 7, 204),
(1061, 7, 240),
(634, 8, 23),
(62, 8, 179),
(64, 8, 180),
(208, 8, 181),
(211, 8, 182),
(348, 8, 183),
(392, 8, 184),
(558, 8, 186),
(617, 8, 187),
(706, 8, 188),
(745, 8, 189),
(464, 8, 202),
(646, 8, 206),
(1071, 8, 240),
(232, 9, 4),
(425, 9, 5),
(433, 9, 6),
(610, 9, 8),
(764, 9, 10),
(374, 9, 112),
(511, 9, 113),
(298, 9, 197),
(483, 9, 204),
(650, 9, 206),
(1056, 9, 240),
(188, 10, 16),
(321, 10, 17),
(388, 10, 18),
(216, 10, 137),
(326, 10, 138),
(406, 10, 139),
(665, 10, 142),
(749, 10, 143),
(262, 10, 196),
(465, 10, 202),
(497, 10, 204),
(1059, 10, 240),
(42, 11, 108),
(171, 11, 110),
(371, 11, 112),
(568, 11, 115),
(252, 11, 196),
(482, 11, 204),
(654, 11, 206),
(1057, 11, 240),
(1, 12, 13),
(70, 12, 14),
(323, 12, 15),
(185, 12, 16),
(318, 12, 17),
(387, 12, 18),
(518, 12, 20),
(585, 12, 22),
(636, 12, 23),
(783, 12, 25),
(996, 12, 120),
(234, 12, 196),
(466, 12, 202),
(489, 12, 204),
(644, 12, 206),
(1070, 12, 240),
(156, 13, 3),
(231, 13, 4),
(423, 13, 5),
(427, 13, 6),
(763, 13, 10),
(956, 13, 12),
(50, 13, 81),
(251, 13, 196),
(299, 13, 197),
(484, 13, 204),
(1055, 13, 240),
(386, 14, 100),
(547, 14, 102),
(583, 14, 103),
(681, 14, 104),
(716, 14, 105),
(821, 14, 106),
(300, 14, 197),
(656, 14, 206),
(1046, 14, 240),
(498, 15, 204),
(767, 17, 77),
(407, 17, 139),
(243, 17, 196),
(499, 17, 204),
(662, 17, 206),
(1063, 17, 240),
(267, 18, 196),
(492, 18, 204),
(661, 18, 206),
(155, 21, 3),
(230, 21, 4),
(422, 21, 5),
(429, 21, 6),
(608, 21, 8),
(760, 21, 10),
(52, 21, 81),
(89, 21, 83),
(255, 21, 196),
(496, 21, 204),
(10, 22, 41),
(25, 22, 42),
(80, 22, 43),
(101, 22, 44),
(124, 22, 45),
(196, 22, 47),
(223, 22, 48),
(340, 22, 49),
(363, 22, 50),
(402, 22, 51),
(445, 22, 52),
(527, 22, 53),
(597, 22, 55),
(626, 22, 56),
(677, 22, 57),
(688, 22, 58),
(738, 22, 59),
(799, 22, 61),
(810, 22, 62),
(862, 22, 63),
(946, 22, 65),
(75, 22, 122),
(253, 22, 196),
(655, 22, 206),
(1048, 22, 240),
(154, 23, 3),
(424, 23, 5),
(428, 23, 6),
(729, 23, 9),
(761, 23, 10),
(950, 23, 11),
(710, 23, 188),
(244, 23, 196),
(480, 23, 204),
(653, 23, 206),
(1054, 23, 240),
(148, 24, 3),
(229, 24, 4),
(426, 24, 5),
(434, 24, 6),
(556, 24, 7),
(609, 24, 8),
(727, 24, 9),
(90, 24, 83),
(129, 24, 84),
(199, 24, 85),
(408, 24, 87),
(543, 24, 88),
(604, 24, 89),
(73, 24, 122),
(146, 24, 123),
(301, 24, 197),
(6, 25, 41),
(28, 25, 42),
(79, 25, 43),
(102, 25, 44),
(126, 25, 45),
(221, 25, 48),
(341, 25, 49),
(361, 25, 50),
(401, 25, 51),
(447, 25, 52),
(529, 25, 53),
(539, 25, 54),
(599, 25, 55),
(628, 25, 56),
(675, 25, 57),
(687, 25, 58),
(737, 25, 59),
(798, 25, 61),
(809, 25, 62),
(864, 25, 63),
(880, 25, 64),
(948, 25, 65),
(968, 25, 66),
(269, 25, 196),
(487, 25, 204),
(57, 27, 96),
(142, 27, 97),
(373, 27, 112),
(516, 27, 113),
(572, 27, 115),
(701, 27, 116),
(834, 27, 118),
(991, 27, 120),
(36, 28, 67),
(109, 28, 68),
(11, 28, 95),
(54, 28, 96),
(139, 28, 97),
(183, 28, 98),
(354, 28, 99),
(384, 28, 100),
(550, 28, 102),
(580, 28, 103),
(263, 28, 196),
(1060, 28, 240),
(192, 29, 16),
(320, 29, 17),
(390, 29, 18),
(519, 29, 20),
(641, 29, 22),
(638, 29, 23),
(1068, 29, 240),
(147, 30, 3),
(228, 30, 4),
(432, 30, 6),
(611, 30, 8),
(951, 30, 11),
(953, 30, 12),
(51, 30, 81),
(37, 30, 108),
(113, 30, 109),
(66, 30, 180),
(12, 31, 95),
(56, 31, 96),
(143, 31, 97),
(181, 31, 98),
(549, 31, 102),
(579, 31, 103),
(841, 31, 107),
(72, 31, 122),
(620, 31, 187),
(256, 31, 196),
(494, 31, 204),
(8, 32, 41),
(26, 32, 42),
(81, 32, 43),
(100, 32, 44),
(128, 32, 45),
(195, 32, 47),
(224, 32, 48),
(339, 32, 49),
(362, 32, 50),
(403, 32, 51),
(446, 32, 52),
(528, 32, 53),
(598, 32, 55),
(627, 32, 56),
(673, 32, 57),
(689, 32, 58),
(736, 32, 59),
(782, 32, 60),
(800, 32, 61),
(808, 32, 62),
(863, 32, 63),
(878, 32, 64),
(947, 32, 65),
(969, 32, 66),
(241, 32, 196),
(658, 32, 206),
(1067, 32, 240),
(542, 33, 88),
(998, 33, 120),
(557, 33, 186),
(249, 33, 196),
(302, 33, 197),
(479, 33, 204),
(652, 33, 206),
(923, 33, 222),
(1053, 33, 240),
(7, 34, 41),
(27, 34, 42),
(103, 34, 44),
(123, 34, 45),
(194, 34, 47),
(222, 34, 48),
(338, 34, 49),
(360, 34, 50),
(444, 34, 52),
(526, 34, 53),
(538, 34, 54),
(596, 34, 55),
(625, 34, 56),
(676, 34, 57),
(690, 34, 58),
(735, 34, 59),
(797, 34, 61),
(811, 34, 62),
(861, 34, 63),
(879, 34, 64),
(949, 34, 65),
(242, 34, 196),
(659, 34, 206),
(1064, 34, 240),
(633, 35, 23),
(270, 35, 196),
(503, 35, 204),
(30, 36, 42),
(104, 36, 44),
(88, 36, 83),
(46, 36, 108),
(178, 36, 110),
(317, 36, 111),
(517, 36, 113),
(694, 36, 116),
(258, 36, 196),
(493, 36, 204),
(1075, 36, 240),
(993, 37, 120),
(930, 37, 146),
(500, 37, 204),
(974, 37, 209),
(934, 37, 223),
(245, 39, 196),
(467, 39, 202),
(481, 39, 204),
(651, 39, 206),
(1052, 39, 240),
(929, 40, 146),
(501, 40, 204),
(933, 40, 223),
(1043, 40, 236),
(1074, 40, 240),
(303, 41, 197),
(647, 41, 206),
(1072, 41, 240),
(95, 42, 193),
(239, 42, 196),
(304, 42, 197),
(475, 42, 204),
(919, 42, 212),
(1044, 42, 240),
(45, 43, 108),
(115, 43, 109),
(167, 43, 110),
(63, 43, 179),
(65, 43, 180),
(207, 43, 181),
(210, 43, 182),
(350, 43, 183),
(238, 43, 196),
(490, 43, 204),
(55, 44, 96),
(140, 44, 97),
(180, 44, 98),
(355, 44, 99),
(379, 44, 100),
(548, 44, 102),
(582, 44, 103),
(679, 44, 104),
(720, 44, 105),
(817, 44, 106),
(842, 44, 107),
(257, 44, 196),
(495, 44, 204),
(1014, 44, 237),
(1073, 44, 240),
(16, 45, 82),
(91, 45, 83),
(131, 45, 84),
(200, 45, 85),
(332, 45, 86),
(410, 45, 87),
(541, 45, 88),
(35, 45, 163),
(157, 45, 165),
(266, 45, 196),
(1062, 45, 240),
(752, 46, 37),
(356, 46, 99),
(385, 46, 100),
(552, 46, 102),
(584, 46, 103),
(682, 46, 104),
(717, 46, 105),
(820, 46, 106),
(840, 46, 107),
(569, 46, 115),
(1047, 46, 240),
(987, 47, 120),
(265, 47, 196),
(305, 47, 197),
(663, 47, 206),
(926, 47, 222),
(1066, 47, 240),
(310, 48, 196),
(187, 49, 16),
(389, 49, 18),
(637, 49, 23),
(722, 49, 24),
(786, 49, 25),
(843, 49, 26),
(233, 49, 196),
(468, 49, 202),
(704, 49, 205),
(645, 49, 206),
(1069, 49, 240),
(268, 50, 196),
(306, 50, 197),
(491, 50, 204),
(660, 50, 206),
(924, 50, 222),
(1065, 50, 240),
(893, 51, 80),
(184, 51, 124),
(979, 51, 133),
(931, 51, 146),
(237, 51, 196),
(976, 51, 209),
(281, 53, 197),
(259, 54, 196),
(282, 54, 197),
(327, 55, 138),
(456, 55, 202),
(4, 56, 41),
(24, 56, 42),
(76, 56, 43),
(98, 56, 44),
(122, 56, 45),
(164, 56, 46),
(193, 56, 47),
(219, 56, 48),
(336, 56, 49),
(359, 56, 50),
(398, 56, 51),
(442, 56, 52),
(523, 56, 53),
(535, 56, 54),
(590, 56, 55),
(623, 56, 56),
(670, 56, 57),
(686, 56, 58),
(734, 56, 59),
(778, 56, 60),
(793, 56, 61),
(805, 56, 62),
(858, 56, 63),
(877, 56, 64),
(942, 56, 65),
(965, 56, 66),
(283, 57, 197),
(958, 58, 12),
(160, 58, 69),
(888, 58, 80),
(871, 58, 93),
(117, 58, 109),
(170, 58, 110),
(509, 58, 113),
(284, 58, 197),
(457, 58, 202),
(935, 58, 223),
(612, 59, 36),
(896, 59, 40),
(114, 59, 109),
(166, 59, 110),
(507, 59, 113),
(564, 59, 115),
(696, 59, 116),
(831, 59, 118),
(986, 59, 120),
(970, 59, 209),
(9, 60, 41),
(127, 60, 45),
(600, 60, 55),
(742, 60, 59),
(801, 60, 61),
(806, 60, 62),
(866, 60, 63),
(882, 60, 64),
(563, 60, 115),
(692, 60, 116),
(823, 61, 78),
(984, 61, 79),
(698, 61, 116),
(992, 61, 120),
(285, 61, 197),
(1020, 62, 28),
(1022, 62, 29),
(1024, 62, 30),
(1026, 62, 31),
(1028, 62, 32),
(1032, 62, 35),
(1034, 62, 36),
(1036, 62, 37),
(1038, 62, 38),
(1040, 62, 40),
(1030, 62, 200),
(1042, 62, 209),
(365, 64, 71),
(545, 64, 74),
(616, 64, 75),
(683, 64, 76),
(824, 64, 78),
(983, 64, 79),
(889, 64, 80),
(743, 64, 91),
(776, 64, 117),
(854, 64, 161),
(86, 65, 29),
(203, 65, 31),
(345, 65, 32),
(613, 65, 36),
(333, 65, 86),
(409, 65, 87),
(168, 65, 110),
(370, 65, 112),
(510, 65, 113),
(438, 65, 200),
(260, 66, 196),
(286, 66, 197),
(448, 66, 203),
(502, 66, 204),
(959, 69, 12),
(44, 69, 108),
(315, 69, 111),
(377, 69, 112),
(570, 69, 115),
(702, 69, 116),
(829, 69, 118),
(814, 69, 160),
(857, 69, 161),
(978, 69, 209),
(53, 70, 81),
(43, 70, 108),
(116, 70, 109),
(174, 70, 110),
(67, 72, 180),
(347, 72, 183),
(394, 72, 184),
(618, 72, 187),
(705, 72, 188),
(173, 73, 110),
(770, 73, 117),
(61, 73, 179),
(68, 73, 180),
(206, 73, 181),
(209, 73, 182),
(560, 73, 186),
(708, 73, 188),
(287, 73, 197),
(469, 73, 204),
(1019, 75, 28),
(1021, 75, 29),
(1023, 75, 30),
(1025, 75, 31),
(1027, 75, 32),
(1031, 75, 35),
(1033, 75, 36),
(1035, 75, 37),
(1037, 75, 38),
(1039, 75, 40),
(1029, 75, 200),
(1041, 75, 209),
(32, 76, 41),
(31, 76, 42),
(82, 76, 43),
(99, 76, 44),
(198, 76, 47),
(220, 76, 48),
(364, 76, 50),
(399, 76, 51),
(443, 76, 52),
(525, 76, 53),
(536, 76, 54),
(592, 76, 55),
(624, 76, 56),
(672, 76, 57),
(741, 76, 59),
(781, 76, 60),
(794, 76, 61),
(943, 76, 65),
(966, 76, 66),
(20, 78, 28),
(85, 78, 29),
(118, 78, 30),
(614, 78, 36),
(751, 78, 37),
(758, 78, 38),
(40, 78, 108),
(316, 78, 111),
(574, 78, 115),
(773, 78, 117),
(247, 79, 196),
(288, 79, 197),
(892, 80, 80),
(514, 80, 113),
(565, 80, 115),
(693, 80, 116),
(771, 80, 117),
(827, 80, 118),
(988, 80, 120),
(264, 80, 196),
(289, 80, 197),
(474, 80, 204),
(150, 86, 3),
(420, 86, 5),
(48, 86, 81),
(290, 86, 197),
(458, 86, 202),
(473, 86, 204),
(149, 88, 3),
(421, 88, 5),
(47, 88, 81),
(291, 88, 197),
(459, 88, 202),
(471, 88, 204),
(246, 89, 196),
(292, 89, 197),
(485, 89, 204),
(293, 90, 197),
(460, 90, 202),
(472, 90, 204),
(21, 97, 28),
(87, 97, 29),
(204, 97, 31),
(346, 97, 32),
(532, 97, 35),
(730, 97, 37),
(439, 97, 200),
(802, 97, 205),
(803, 97, 207),
(804, 97, 208),
(632, 98, 23),
(787, 98, 25),
(294, 98, 197),
(461, 98, 202),
(488, 98, 204),
(648, 98, 206),
(119, 100, 30),
(344, 100, 32),
(530, 100, 35),
(732, 100, 37),
(755, 100, 38),
(897, 100, 40),
(837, 100, 118),
(816, 100, 160),
(435, 100, 200),
(971, 100, 209),
(885, 101, 80),
(378, 101, 100),
(581, 101, 103),
(176, 101, 110),
(577, 101, 115),
(699, 101, 116),
(836, 101, 118),
(855, 101, 161),
(69, 101, 180),
(709, 101, 188),
(295, 102, 197),
(595, 103, 55),
(236, 103, 196),
(462, 103, 202),
(235, 105, 196),
(14, 107, 95),
(59, 107, 96),
(141, 107, 97),
(179, 107, 98),
(351, 107, 99),
(381, 107, 100),
(546, 107, 102),
(578, 107, 103),
(678, 107, 104),
(718, 107, 105),
(818, 107, 106),
(839, 107, 107),
(319, 108, 17),
(635, 108, 23),
(544, 108, 74),
(769, 108, 77),
(884, 108, 80),
(873, 108, 93),
(819, 108, 106),
(573, 108, 115),
(703, 108, 116),
(921, 108, 190),
(960, 109, 12),
(38, 109, 108),
(835, 109, 118),
(994, 109, 120),
(869, 109, 205),
(867, 109, 207),
(868, 109, 208),
(939, 109, 229),
(940, 109, 230),
(254, 110, 196),
(296, 110, 197),
(476, 110, 204),
(886, 111, 80),
(18, 111, 82),
(132, 111, 84),
(567, 111, 115),
(832, 111, 118),
(999, 111, 120),
(272, 111, 197),
(450, 111, 202),
(470, 111, 204),
(106, 114, 134),
(212, 114, 136),
(214, 114, 137),
(324, 114, 138),
(404, 114, 139),
(521, 114, 140),
(603, 114, 141),
(667, 114, 142),
(748, 114, 143),
(850, 114, 145),
(928, 114, 146),
(108, 114, 147),
(273, 114, 197),
(274, 117, 197),
(34, 119, 163),
(159, 119, 165),
(309, 119, 166),
(713, 119, 167),
(534, 119, 171),
(631, 119, 172),
(715, 119, 173),
(791, 119, 174),
(891, 119, 177),
(1009, 119, 178),
(754, 120, 38),
(895, 120, 40),
(111, 120, 109),
(177, 120, 110),
(376, 120, 112),
(576, 120, 115),
(697, 120, 116),
(825, 120, 118),
(990, 120, 120),
(972, 120, 209),
(29, 122, 42),
(83, 122, 43),
(105, 122, 44),
(125, 122, 45),
(165, 122, 46),
(197, 122, 47),
(225, 122, 48),
(337, 122, 49),
(400, 122, 51),
(537, 122, 54),
(594, 122, 55),
(629, 122, 56),
(674, 122, 57),
(691, 122, 58),
(739, 122, 59),
(796, 122, 61),
(807, 122, 62),
(865, 122, 63),
(945, 122, 65),
(967, 122, 66),
(169, 124, 110),
(311, 124, 111),
(372, 124, 112),
(508, 124, 113),
(566, 124, 115),
(134, 126, 148),
(135, 126, 149),
(137, 126, 150),
(366, 126, 151),
(368, 126, 152),
(413, 126, 153),
(606, 126, 155),
(642, 126, 157),
(812, 126, 160),
(851, 126, 161),
(1005, 126, 162),
(768, 127, 77),
(822, 127, 78),
(985, 127, 79),
(894, 127, 80),
(700, 127, 116),
(774, 127, 117),
(828, 127, 118),
(1003, 127, 120),
(451, 127, 202),
(1016, 127, 238),
(898, 131, 40),
(766, 131, 77),
(982, 131, 79),
(883, 131, 80),
(777, 131, 117),
(995, 131, 120),
(856, 131, 161),
(1007, 131, 162),
(977, 131, 209),
(133, 133, 148),
(136, 133, 149),
(138, 133, 150),
(367, 133, 151),
(369, 133, 152),
(414, 133, 153),
(607, 133, 155),
(643, 133, 157),
(813, 133, 160),
(852, 133, 161),
(1006, 133, 162),
(765, 134, 77),
(887, 134, 80),
(41, 134, 108),
(110, 134, 109),
(175, 134, 110),
(375, 134, 112),
(513, 134, 113),
(772, 134, 117),
(830, 134, 118),
(561, 134, 205),
(153, 135, 3),
(19, 135, 28),
(342, 135, 32),
(531, 135, 35),
(615, 135, 36),
(753, 135, 37),
(331, 135, 86),
(411, 135, 87),
(540, 135, 88),
(437, 135, 200),
(5, 137, 41),
(22, 137, 42),
(78, 137, 43),
(97, 137, 44),
(121, 137, 45),
(163, 137, 46),
(218, 137, 48),
(335, 137, 49),
(358, 137, 50),
(397, 137, 51),
(441, 137, 52),
(524, 137, 53),
(591, 137, 55),
(622, 137, 56),
(671, 137, 57),
(685, 137, 58),
(740, 137, 59),
(779, 137, 60),
(795, 137, 61),
(860, 137, 63),
(875, 137, 64),
(944, 137, 65),
(275, 137, 197),
(313, 140, 111),
(562, 140, 115),
(17, 143, 82),
(39, 143, 108),
(312, 143, 111),
(515, 143, 113),
(575, 143, 115),
(826, 143, 118),
(989, 143, 120),
(276, 143, 197),
(453, 143, 202),
(107, 144, 134),
(213, 144, 136),
(215, 144, 137),
(325, 144, 138),
(405, 144, 139),
(602, 144, 141),
(668, 144, 142),
(747, 144, 143),
(847, 144, 144),
(848, 144, 145),
(277, 146, 197),
(838, 147, 107),
(395, 147, 184),
(559, 147, 186),
(619, 147, 187),
(711, 147, 188),
(746, 147, 189),
(922, 147, 190),
(454, 147, 202),
(449, 147, 203),
(664, 147, 205),
(925, 147, 222),
(278, 148, 197),
(455, 148, 202),
(505, 148, 204),
(33, 150, 163),
(158, 150, 165),
(308, 150, 166),
(712, 150, 167),
(533, 150, 171),
(630, 150, 172),
(714, 150, 173),
(790, 150, 174),
(890, 150, 177),
(1008, 150, 178),
(784, 152, 25),
(601, 152, 141),
(666, 152, 142),
(846, 152, 144),
(849, 152, 145),
(927, 152, 146),
(815, 152, 160),
(1012, 152, 178),
(937, 152, 223),
(721, 155, 105),
(151, 158, 3),
(226, 158, 4),
(419, 158, 5),
(430, 158, 6),
(554, 158, 7),
(726, 158, 9),
(762, 158, 10),
(161, 158, 69),
(49, 158, 81),
(172, 158, 110),
(279, 159, 197),
(3, 160, 41),
(23, 160, 42),
(77, 160, 43),
(96, 160, 44),
(120, 160, 45),
(162, 160, 46),
(217, 160, 48),
(334, 160, 49),
(357, 160, 50),
(396, 160, 51),
(440, 160, 52),
(522, 160, 53),
(589, 160, 55),
(621, 160, 56),
(669, 160, 57),
(684, 160, 58),
(733, 160, 59),
(780, 160, 60),
(792, 160, 61),
(859, 160, 63),
(874, 160, 64),
(941, 160, 65),
(964, 160, 66),
(280, 160, 197),
(152, 165, 3),
(227, 165, 4),
(418, 165, 5),
(431, 165, 6),
(553, 165, 7),
(728, 165, 9),
(759, 165, 10),
(954, 165, 12),
(916, 165, 195),
(417, 165, 198),
(900, 165, 211),
(908, 165, 214),
(905, 165, 215),
(907, 165, 217),
(902, 165, 218),
(914, 165, 219),
(911, 165, 220),
(912, 165, 221),
(2, 167, 13),
(71, 167, 14),
(186, 167, 16),
(322, 167, 17),
(391, 167, 18),
(520, 167, 20),
(587, 167, 22),
(640, 167, 23),
(725, 167, 24),
(789, 167, 25),
(845, 167, 26),
(586, 178, 22),
(639, 178, 23),
(724, 178, 24),
(788, 178, 25),
(844, 178, 26),
(271, 181, 197),
(84, 182, 43),
(94, 187, 193),
(328, 187, 194),
(329, 187, 195),
(901, 187, 211),
(918, 187, 212),
(917, 187, 213),
(909, 187, 214),
(904, 187, 215),
(906, 187, 217),
(903, 187, 218),
(915, 187, 219),
(910, 187, 220),
(913, 187, 221),
(957, 206, 12),
(981, 206, 79),
(605, 206, 89),
(872, 206, 93),
(997, 206, 120),
(853, 206, 161),
(436, 206, 200),
(975, 206, 209),
(936, 206, 223),
(1018, 206, 238),
(555, 207, 7),
(955, 207, 12),
(205, 207, 31),
(343, 207, 32),
(899, 207, 40),
(980, 207, 79),
(201, 207, 85),
(870, 207, 93),
(1000, 207, 120),
(973, 207, 209),
(130, 217, 84),
(13, 217, 95),
(58, 217, 96),
(145, 217, 97),
(182, 217, 98),
(353, 217, 99),
(380, 217, 100),
(551, 217, 102),
(680, 217, 104),
(719, 217, 105),
(240, 217, 196),
(1058, 217, 240),
(952, 222, 11),
(723, 222, 24),
(785, 222, 25),
(314, 222, 111),
(512, 222, 113),
(571, 222, 115),
(695, 222, 116),
(775, 222, 117),
(833, 222, 118),
(452, 222, 202),
(486, 226, 204),
(1017, 226, 238);

-- --------------------------------------------------------

--
-- Table structure for table `SP17_com_serv`
--

CREATE TABLE `SP17_com_serv` (
  `com_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL,
  `com_title` varchar(50) NOT NULL,
  `com_advisor` varchar(60) NOT NULL,
  `com_advisor_contact` varchar(60) NOT NULL,
  `com_description` varchar(500) NOT NULL,
  `com_date` datetime NOT NULL,
  `com_hours` decimal(5,1) NOT NULL,
  `com_verified` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SP17_com_serv`
--

INSERT INTO `SP17_com_serv` (`com_id`, `pstu_id`, `com_title`, `com_advisor`, `com_advisor_contact`, `com_description`, `com_date`, `com_hours`, `com_verified`) VALUES
(2, 187, 'Movers & Shakers', 'Emmy Borst', 'eborst@lhup.edu', 'Assisted for 2 days in moving in freshmen to LHU dorms.  Answered their questions about campus. Represented LHU with a smile.', '2016-08-26 09:00:00', '11.0', 2),
(3, 102, 'Moving and Shaking', 'Shelby Helwig', 'honors@lhup.edu', 'I was a part of the moving and shaking at Smith. I was the first person the honors freshmen talked to when they arrived at that resident hall. I welcomed them and explained to them how everything worked, and directed the upperclassmen that were with me to them so they could get moved in.', '2016-08-25 11:00:00', '3.0', 2),
(4, 68, 'Movers and Shakers', 'Mike Heck, RHA, Hall Council', 'mheck@lhup.edu', 'For both move in days this year I volunteered to serve as a mover and shaker. I got to work with students and parents as they moved into fairview suites for the first time. Most of the time I spent directing traffic and cars and some was with the students actually unloading and loading carts. Overall a great time and a great experience. The first day went from 8:45-4 and the second from 8:45-noon. I rounded the hours so I started at 9 each day.', '2016-08-26 09:00:00', '10.0', 2),
(5, 54, 'Freshman Move In', 'Rachael Metzinger', '(570)985-4764', 'I helped Honors freshman move into their dorms at Fairview Suites.', '2016-08-25 11:00:00', '2.0', 2),
(7, 65, 'Convocation', 'Jackie', 'jwhitlin@lhup.edu', 'I assisted with ushering at Convocation by welcoming students and faculty into the building and handing out programs before the event.', '2016-09-07 13:00:00', '2.0', 2),
(8, 103, 'Moving and Shaking', 'Dr. Jacqueline Whitling Dumm', 'jwhitlin@lhup.edu', 'We helped move in the new Honors Freshman to their dorms. I held a sign letting parents know the Fairview Suites entrance.', '2016-08-25 11:30:00', '3.0', 2),
(9, 197, 'Haiti Mission Trip', 'Thom Fulmer', 'thom@acfellowship.org', 'I spent 7 days in Haiti on a mission trip this summer. I am claiming only 10 hours of community service, but I actually completed somewhere around 50 hours. The team I was on built a water station for a town called Onaville. We were based at an orphanage in Port au Prince, where we spent all of our down time with the children. The experience was like none other in my life and was absolutely the most profoundly life-changing experience I have ever been apart of.', '2016-06-25 00:00:00', '50.0', 2),
(10, 106, 'Moving and Shaking', 'Shelby Helwig', 'honors_program@lhup.edu', 'Helped the honors freshmen move in the dorms.', '2016-08-25 00:00:00', '3.0', 2),
(12, 188, 'Honors Move In', 'Shelby Helwig', 'honors@lhup.edu', 'Helped move in honors freshmen and other honors students.', '2016-08-25 12:00:00', '3.0', 2),
(15, 74, 'Honors Movers and Shakers', 'Shelby Helwig', 'sth1064@lhup.edu', 'I worked with other members in the Honors Program to help move in the freshman into their prospective living areas! Conversing and helping with getting all of their belongings into their new home.', '2016-08-25 00:00:00', '3.0', 2),
(16, 74, 'Movers and Shakers', 'Mike Heck', 'MHeck@lhup.edu', 'Helping the new freshman move into their living areas. Conversing with families and answering any questions. Interacting with new students was an amazing experience.', '2016-08-26 08:30:00', '3.0', 2),
(17, 74, 'Movers and Shakers', 'Mike Heck', 'MHeck@lhup.edu', 'Helping the new freshman move into their living areas. Conversing with families and answering any questions. Interacting with new students was an amazing experience.', '2016-09-24 08:30:00', '3.0', 2),
(18, 103, 'Convocation', 'Tyana Lange', 'tsl400@lhup.edu', 'I handed out programs and held the door to audience members of the convocation ceremony.', '2016-09-07 13:00:00', '2.0', 2),
(19, 113, 'Honors Freshman Move-In', 'Shelby Helwig', '7176508904', 'Helped move new Honors Freshmen into their dorms.', '2016-08-25 11:30:00', '2.0', 2),
(20, 113, 'Convocation', 'Stacey Masorti', 'sjm1038@lhup.edu', 'Handed programs to people coming in for the event, and helped set up before people showed up.', '2016-09-07 13:00:00', '2.0', 2),
(21, 160, 'Clinton County River Clean-up', 'Morgan Priscilla', 'mpc7999@lhup.edu', 'I helped clear tires and other debris out of the Susquehanna River', '2016-09-10 09:00:00', '4.0', 2),
(22, 65, 'River Clean Up', 'Morgan Capobianco', 'mpc7999@lhup.edu', 'I helped to pull tires and other trash out of the Susquehanna River.', '2016-09-10 09:00:00', '4.0', 2),
(23, 150, 'Freshman Honors Move in', 'Rachael Metzinger', '(570)-985-4764', 'Helped move the new honors freshman into their dorms.', '2016-09-25 11:30:00', '3.0', 2),
(24, 22, 'Clinton County Clean Scapes River Cleanup', 'Morgan Capobianco', 'mpc7999@lhup.edu', 'Together our group fished almost four hundred tires out of a small portion of the Susquehanna River. This was equivalent to one large and one small dumpster. In addition to the tires, we managed to fill a trailer with all sorts of plastic and metal debris. Everybody had fun working hard and getting muddy.', '2016-09-10 09:00:00', '5.0', 2),
(25, 137, 'River Clean Up', 'Morgan Capobianco', 'mpc7999@lhup.edu', 'Today I removed tires and other trash from a local river. We spent a few hours combing the river and also working together to remove the tires from the river.', '2016-09-10 09:00:00', '4.0', 2),
(26, 137, 'Moving and Shaking', 'Shelby Helwig', '717-650-8904', 'I helped move in the the new honors freshmen. I talked to these people and their families while also helping to find their new dorm room. I answered questions about the honors program and attempted to make the transition into school easier.', '2016-08-25 11:00:00', '3.0', 2),
(27, 107, 'Clinton County Cleanscapes River Cleanup', 'Morgan Capobianco', 'mpc7999@lhup.edu', 'I assisted in pulling old, discarded tires and other man-made garbage and debris out of the river. This volunteer effort helped reduce the impact on the environment.', '2016-09-10 09:00:00', '5.0', 2),
(28, 24, 'Clinton County River Clean Up', 'Morgan Capobianco', 'mpc7999@lhup.edu', 'Pulled tires out of the river.', '2016-09-10 09:00:00', '4.0', 2),
(29, 103, 'River Clean-Up', 'Morgan Capobianco', 'mpc7999@lhup.edu', 'We sifted through a river for tires and pulled them out as we did. We pulled out hundreds of tires.', '2016-09-10 09:10:00', '4.0', 2),
(31, 190, 'Movers and Shakers', 'Shelby Helwig', 'N/A', 'Helped move honors freshmen in.', '2016-08-25 11:00:00', '3.0', 2),
(32, 190, 'River Clean Up', 'Bethy Wells', 'N/A', 'Participated in annual river clean up by removing tires.', '2016-09-10 09:00:00', '4.0', 2),
(33, 75, 'Clinton County River Clean Up', 'Morgan Capobianco', 'mpc7999@lhup.edu', 'Helped pull tires and trash out of the river', '2016-09-10 09:00:00', '4.0', 2),
(34, 23, 'Clinton County River Clean-Up', 'Morgan Capobianco', 'mpc7999@lhup.edu', 'We pulled hundreds of tires out of the river!', '2016-09-10 09:00:00', '5.0', 2),
(35, 73, 'Clinton County River Clean Up', 'Morgan Capobianco', 'mpc7999@lhup.edu', 'We cleaned tires and other trash out of the river. The program has been doing this for twenty years and continually moves down the river to new spots. This allows us to clean up the the entire river. Eventually, I\'m hoping that there will no longer need to be a river clean up because that will mean there is no more trash being thrown in there.', '2016-09-10 09:00:00', '4.0', 2),
(36, 48, 'Color Event', 'Aaron Russell', 'arussel@lhup.edu', 'Set up, administered color packets, cleaned up', '2016-09-04 18:15:00', '2.0', 2),
(37, 48, 'River Cleanup', 'Aaron Russell', 'arussell@lhup.edu', 'Pulled nearly 400 tires out of river, as well as removed countless numbers of bags filled with miscellaneous trash from the water', '2016-09-10 09:00:00', '4.0', 2),
(38, 115, 'Freshmen move in', 'Rachael Metzinger', '5709854764', 'Helped move the freshmen in.', '2016-08-25 11:30:00', '3.0', 2),
(39, 115, '9/11 Memorial Ride', 'Todd Winder', '5709712685', 'Clinton Twp Fire Company has a memorial motorcycle ride each year and dedicates the day to the fallen people from 9/11. I aided as an EMT, and helped set up with the ride.', '2016-09-11 07:00:00', '11.0', 2),
(40, 66, 'Honors Moving and Shaking', 'Rachael Metzinger', 'honors_program@lhup.edu', 'I helped move in the Honors freshmen when they arrived for the semester.', '2016-08-25 00:00:00', '3.0', 2),
(41, 192, 'Movers & Shakers', 'Michael Heck', 'mheck@lhup.edu', 'I help move the incoming freshmen into the dorms for two days. It was nice helping the next person in line, because I know when I was a freshman I was thankful that I had help. It is important to help people and try to make their lives a little easier. A community mind set is much more effective than a individualized mindset. I did it August 26 and 27', '2016-08-26 00:00:00', '10.0', 2),
(42, 31, 'Clinton County River Clean-up', 'Morgan Capobianco', 'mpc7999@lhup.edu', 'Going into of Clinton County and cleaning the tires out of the Susquehanna river.', '2016-09-10 09:00:00', '5.0', 2),
(43, 27, 'Blood Drive - Tuesday', 'Danielle Michon', 'dmm6437@lhup.edu', 'Helped set up at the blood drive in the rec center from 11-12', '2016-09-13 11:00:00', '1.0', 2),
(44, 149, 'GHP Orientation', 'Shelby Helwig', 'honors@lhup.edu', 'I helped to move in the incoming honors freshmen at Fairview suites and directed traffic behind Fairview as students moved in.', '2016-08-25 00:00:00', '3.0', 2),
(45, 34, 'Red Cross Blood Drive', 'Red Cross', '1-800-RED CROSS', 'I donated one pint of blood on 9/13/16 at 5pm at the Rec Center Blood drive', '2016-09-13 16:30:00', '1.0', 2),
(46, 160, 'Blood Drive', 'Danielle Michon', 'dmm6437@lhup.edu', 'I assisted at the refreshment table, ensuring that donors felt well after donating.', '2016-09-13 11:30:00', '2.0', 2),
(47, 62, 'Freshmen Move-In', 'Rachael Metzinger', 'rxm2509@lhup.edu', 'I volunteered to help with the honors freshmen move-in and the university freshmen move-in. I assisted the freshmen with moving all of their belongings into their dorm and answered any questions that they might have had.', '2016-08-25 10:00:00', '2.0', 2),
(48, 62, 'Blood Drive', 'Lauren Wright', 'law3363@lhup.edu', 'I volunteered to sit at the recovery table at the blood drive held in the Rec Center. The recovery table provides the donors with snacks and drinks after they have donated blood. I sat at the recovery table to make sure that the donors get plenty of food and drink and to make sure that they are well enough to leave.', '2016-09-13 12:00:00', '2.0', 2),
(49, 67, 'Blood Drive', 'Danielle Michon', 'dmm6437@lhup.edu', 'I donated blood to the blood drive.', '2016-09-13 14:59:00', '1.0', 2),
(50, 67, 'March of Dimes Fundraiser', 'Dio Rivera', 'dkr6862@lhup.edu', 'I raised money for the March of Dimes with my sorority on campus.', '2016-09-12 12:00:00', '1.0', 2),
(51, 69, 'Red Cross Blood Drive', 'Danielle Michon', 'dmm6437@lhup.edu', 'Walked around campus and passed out flyers, sat at the snack table and served snacks to the donors', '2016-09-13 11:30:00', '5.0', 2),
(52, 69, 'Red Cross Blood Drive', 'Danielle Michon', 'dmm6437@lhup.edu', 'Walked around campus and passed out flyers, sat at the snack table and served snacks to the donors', '2016-09-13 11:30:00', '5.0', 2),
(53, 160, 'Blood Drive', 'Danielle Michon', 'dmm6437@lhup.edu', 'I assisted at the refreshment table, handing out snacks and beverages, while ensuring everyone felt okay.', '2016-09-14 14:30:00', '2.0', 2),
(57, 103, 'Blood Drive', 'Dr. Jackie Dumm', 'jwhitlin@lhup.edu', 'I donated 1 bag of blood.', '2016-09-14 14:30:00', '1.0', 2),
(58, 50, 'Volunteer at LHU Bingo', 'Coach Kathy Brown', '706-897-0596', 'Lock Haven hosted a bingo at Sloan Auditorium that as a team we volunteered for by checking to see if participants had winning bingo cards and we handed out numerous prizes.', '2016-09-04 14:00:00', '2.0', 2),
(59, 14, 'Clinton County CleanScapes River Clean-up', 'Morgan Capobianco', 'mpc7999@lhup.edu', 'Collecting man-made related debris and tires from the Susquehanna River.', '2016-09-10 09:00:00', '5.0', 2),
(60, 137, 'Red Cross Blood Drive', 'Lauren Wright', 'law3363@lhup.edu', 'I helped out at the blood drive at the refreshment table. I made sure people were feeling okay after donating blood.', '2016-09-13 11:30:00', '2.0', 2),
(61, 137, 'Red Cross Blood Drive', 'Lauren Wright', 'law3363@lhup.edu', 'I helped out at the blood drive at the refreshment table. I made sure people were feeling okay after donating blood.', '2016-09-14 14:30:00', '2.0', 2),
(62, 62, 'Blood Drive', 'Lauren Wright', 'law3363@lhup.edu', 'I volunteered to set up the recovery table at the blood drive held in the Rec Center. The recovery table provides the donors with snacks and drinks after they have donated blood.', '2016-09-14 11:00:00', '1.0', 2),
(63, 28, 'Blood Drive', 'unknown', 'unknown', 'Donated blood and waited approx. 90 minutes, donated in about 20-25.', '2016-09-13 16:00:00', '1.0', 2),
(64, 143, 'Moving and Shaking', 'Rachael Metzinger', 'honors@lhup.edu', 'Helped move in Honors freshman', '2016-08-25 10:00:00', '3.0', 2),
(65, 17, 'Blood Drive', 'Red Cross', 'www.redcross.org', 'Donated blood at the Rec Center', '2016-09-14 13:30:00', '1.0', 2),
(66, 161, 'Clinton County River Clean Up', 'Morgan Capobianco', 'mpc7999@lhup.edu', 'Collected tires and trash from the river.', '2016-09-11 09:00:00', '5.0', 2),
(67, 165, 'River Cleanup', 'Morgan Capobianco', 'mpc7999@lhup.edu', 'We removed tires and other trash from the river in order to dispose of it in a more proper manner', '2016-09-10 09:00:00', '5.0', 2),
(68, 17, 'Watering Field Hockey Field', 'Patrick Long', 'pdl347@lhup.edu', 'Every home field hockey game requires the turf to be watered, so I helped set up hoses and clean up', '2016-09-18 11:00:00', '2.0', 2),
(69, 191, 'Voter Registration', 'Kerry Cahoon', '(952) 221-5854', 'I went door-to-door in Lock Haven to register voters for the upcoming election.', '2016-09-18 12:00:00', '2.0', 2),
(70, 95, 'Annual River Clean Up', 'Morgan Capobianco', 'mpc7999@lhup.edu', 'I picked trash and old tires out of the river with the River Serve group.', '2016-09-10 09:00:00', '5.0', 2),
(71, 72, 'Watered Field Hockey Field', 'Danielle Barney', 'dbarney@lhup.edu', 'I went to the field hockey field three hours before their game and made sure the field was ready to go for the game. The field needed to be watered and set up.', '2016-09-18 11:00:00', '2.0', 2),
(72, 72, 'Referee', 'Patrick Long', 'pdl347@lhup.edu', 'I refereed the Mill Hall U12 Co-Ed soccer game', '2016-09-18 15:00:00', '2.0', 2),
(73, 123, 'Penn State Football Game', 'Whitney Boshart', 'web1120@lhup.edu', 'Work with Landmark security services during Penn State football games. Had to use a magnetic detecting wand to scan people\'s pockets before they entered the game and provide help services throughout the game.', '2016-09-17 06:30:00', '9.0', 2),
(74, 123, 'Ball Girl LHU Field Hockey', 'Whitney Boshart', 'web1120@lhup.edu', 'Work as ball girl for LHU field hockey team', '2016-09-18 13:45:00', '1.0', 2),
(75, 17, 'Mill Hall AYSO Volunteer Soccer Referee', 'Patrick Long', 'pdl347@lhup.edu', 'I was a volunteer referee for a U12 Co-ed soccer game in the Mill Hall AYSO soccer league.', '2016-09-18 15:00:00', '2.0', 2),
(76, 80, 'River Clean-Up', 'Morgan Priscilla Capobianco', 'mpc7999@lhup.edu', 'I accompanied a large group of student from campus to a branch of the Susquehanna river located in Jersey Shore to remove tires from where they have been washed into the river after decades of dumping them on the land next to the river. overall, we pulled 400 tires from the river that day.', '2016-09-10 09:00:00', '5.0', 2),
(77, 60, 'Blood Drive', 'American Red Cross', '18007332767', 'Donated blood at the American Red Cross Blood Drive.', '2016-09-13 17:00:00', '1.0', 2),
(78, 36, 'River Clean-Up', 'Morgan Capobianco', 'mpc7999@lhup.edu', 'Went to Clinton County and cleaned tires out of the river', '2016-09-10 09:00:00', '5.0', 2),
(81, 145, 'BENV Kiwanis Kicks Cancer for Kids', 'Jodi Treas', '5704194049', 'At this event we helped a local Kiwanis club to raise money for children that suffer from childhood cancer. At this event there were a variety of games, organizations, and a bake and soup sale as a way to raise money for these things.', '2016-09-17 08:00:00', '5.0', 2),
(82, 191, 'Voter Registration', 'Kerry Cahoon', '952-221-5854', 'I went with Kerry Cahoon of the Democratic Party to register student voters around campus.', '2016-09-25 12:00:00', '2.0', 2),
(84, 125, 'Youth Group Leading', 'Ashley Stensland', 'joyhopefaithlove@comcast.net', 'I am a leader for my church\'s youth group and we held youth group last night. I taught a lesson and talked with the kids.', '2016-09-25 17:30:00', '2.0', 2),
(85, 67, 'Wendy\'s Fundraiser', 'Mariah Kachmar', 'mlk3933@lhup.edu', 'My sorority planned a fundraiser where 10% of all sales went towards our local philanthropy. We went there to thank people as well as eat with them.', '2016-09-26 17:00:00', '2.0', 2),
(86, 67, 'Club Fair', 'Mariah Kachmar', 'mlk3933@lhup.edu', 'I helped with my sorority\'s table and CKI table. I answered questions and helped freshman find what tables they were looking for.', '2016-09-14 12:00:00', '3.0', 2),
(87, 159, 'Honors Freshmen Move-In', 'Dr. Dumm, Thomas Bates', 'twb9017@lhup.edu', 'Helped honors students move into their dorm rooms.', '2016-08-25 12:00:00', '3.0', 2),
(88, 159, 'Out of the Darkness Suicide Prevention Walk', 'Mr. Cody Meyers', '(570) 484-2903', 'Attended the annual Suicide Prevention Walk for Clinton County. Listened to presentations and inspirational speakers, then after walked 3 laps in honor of people who\'s lives were taken away by the act of suicide.', '2016-09-25 15:00:00', '1.0', 2),
(89, 144, 'Penn state football', 'Tim Jackson', 'timjack8101@gmail.com', 'Volunteered at a food stand before and during a Penn state football game', '2016-09-17 09:00:00', '5.0', 2),
(90, 144, 'Penn state football', 'Tim jackson', 'timjack8101@gmail.com', 'volunteered at a food stand before and during a Penn state football game.', '2016-09-03 12:00:00', '5.0', 2),
(91, 191, 'Voter Registration', 'Kerry Cahoon', '952-221-5854', 'Went with Kerry Cahoon of the Democratic National Party to register Lock Haven students to vote.', '2016-10-02 12:00:00', '2.0', 2),
(92, 59, 'Movers and Shakers', 'Shelby Helwig', 'honors@lhup.edu', 'I helped check in the honors freshmen and give them all the information that they needed for move in day.', '2016-08-25 00:00:00', '3.0', 2),
(93, 17, 'Field Hockey Field Preparation', 'Patrick Long', 'pdl347@lhup.edu', 'Moved goals on and off field, set up flags, helped with scoreboard and maintenance of field before game', '2016-10-02 08:00:00', '1.0', 2),
(94, 17, 'Mill Hall AYSO Volunteer Soccer Referee', 'Patrick Long', 'pdl347@lhup.edu', 'Volunteered as a ref for a coed u12 soccer game in the Mill Hall AYSO league.', '2016-10-02 15:15:00', '2.0', 2),
(95, 134, 'Oley Fair Clean Up', 'Mike Schaeffer', '4843881033', 'Assisted the clean up operations after the community fair. Helped put away signs, tables, and chairs. Aided in gathering trash and making sure the fairgrounds were clean. Helped venders clean up their tent areas.', '2016-09-18 07:00:00', '8.0', 2),
(97, 60, 'Downtown Window Decorating', 'Lauren Wright', 'law3363@lhup.edu', 'Visited Avenue 209 Coffeehouse and Reese\'s printing to paint windows to beautify downtown.', '2016-10-05 12:30:00', '2.0', 2),
(98, 98, 'Convocation Volunteer', 'Dr. Dumm', 'jwhitlin@lhup.edu', 'Served as an usher for the fall convocation and handled out programs for the event.', '2016-09-07 00:00:00', '2.0', 2),
(101, 191, 'Voter Registration', 'Kerry Cahoon', '952-221-5854', 'Before the rally with Governor Wolf and Representative Hanna, I registered voters on Ivy Lane', '2016-10-05 12:00:00', '1.0', 2),
(102, 48, 'Eagleton 50k Trail Race', 'Aaron Russell', 'arussell@lhup.edu', 'Worked as a crossing guard for runners competing in the race. Job included stopping traffic, assuring health/safety of competitors, and cheering them on, etc', '2016-10-09 07:00:00', '6.0', 2),
(103, 34, 'Steamtown Marathon', 'Cynthia Weiss', 'cweiss@fcrsd.org', 'The starting line for the Steamtown Marathon is in the parking lot of Forest City High School. this takes many volunteers, many of which are faculty, students and alumni. While there, I greeted buses full of runners explaining to them what they were to be doing and where to go. After the runners take off, there is lots of clean-up to be done by the volunteers as well.', '2016-10-09 05:30:00', '3.0', 2),
(104, 201, 'Buddy Walk', 'Linda Crawley', '570-772-2534', 'The event was held at the Williamsport Memorial Park. It supported and raised awareness for people with downs syndrome. I helped maintain a pumpkin decorating station before the event, as well as walk the event, and help out after with food afterwards for the community.', '2016-10-09 12:00:00', '3.0', 2),
(105, 132, 'Penn State Football Game', 'Whitney Boshart', 'web1120@lhup.edu', 'LHU Womens lacrosse team volunteered at the Penn State Football Game on September 17. We performed security-like jobs at the front gates before people went through the ticket line.', '2016-09-17 07:00:00', '9.0', 2),
(106, 132, 'Lock Haven Lacrosse Clinic', 'Whitney Boshart', 'web1120@lhup.edu', 'I was part of half of our team that coached a high school girls lacrosse clinic at our field, Charlotte E. Smith Field that day. We taught them various drills, games, and lacrosse techniques and coached them throughout the day.', '2016-09-24 08:00:00', '8.0', 2),
(107, 123, 'Lacrosse Clinic', 'Whitney Boshart', 'Web1120@lhup.edu', 'Teach clinic attendees drills and coach them throughout the day for various drills and games. This clinic was for high school aged lacrosse players that are possible recruiting prospects for the Lock Haven lacrosse team.', '2016-09-24 08:00:00', '8.0', 2),
(108, 188, 'Open House', 'Rachel Metzinger', 'honors_program@lhup.edu', 'Worked with the A-Team at the Open House to help recruit new students into the program.', '2016-10-08 08:30:00', '2.0', 2),
(110, 161, 'Exeter Haunted Hayride', 'Denise Kramer', '6104053287', 'Volunteered with my old Girl Scout Troop. Service entailed running a game booth for our community\'s annual Halloween event.', '2016-10-07 19:00:00', '3.0', 2),
(111, 114, 'Moving and Shaking', 'Shelby Helwig', '717-650-8904', 'Helped honors freshmen move into their dorms.', '2016-08-25 12:00:00', '2.0', 2),
(112, 162, 'Operation Christmas Child', 'Tammey Aichner', 'danoaichner@hotmail.com', 'Wrapped shoe boxes to use for Samaritan\'s Purse that can then be used for holidays gifts for children around the world.', '2016-09-17 00:00:00', '2.0', 2),
(113, 162, 'Samaritan\'s Purse Display', 'Tammey Aichner', 'danoaichner@hotmail.com', 'Set up a display for Samaritan\'s Purse/ Operation Christmas Child.', '2016-10-09 10:00:00', '1.0', 2),
(114, 162, 'Meal in a Bag', 'Tammey Aichner', 'danoaichner@hotmail.com', 'Delivered meals in a bad to low income areas around home.', '2016-10-08 10:00:00', '2.0', 2),
(115, 21, 'Hunger bowl', 'GHP', 'honors_program@lhup.edu', 'I brought in 12 cans of food to the honors house for the hunger bowl', '2016-10-11 00:00:00', '2.0', 2),
(116, 114, 'Concession stand volunteer', 'Kate Jackson', '859-319-9454', 'Volunteered at a concession stand at Beaver Stadium, serving food', '2016-09-17 08:00:00', '5.0', 2),
(117, 114, 'Concession Stand Volunteer', 'Kate Jackson', '859-319-9454', 'Volunteered working a concession stand at Beaver Stadium, serving food', '2016-10-01 09:00:00', '5.0', 2),
(118, 103, 'Admissions Open House', 'Dr. Jackie Whitling-Dumm', 'jwhitlin@lhup.edu', 'We talked and interviewed prospective students who were interested in the Honors program.', '2016-10-08 08:30:00', '2.0', 2),
(119, 22, 'Clinton County Women\'s Shelter Volunteer Work', 'Dawn Barner', '570-748-9539', 'I vacuumed and mopped all of the rooms on the first floor. I also wiped down all of the windows on the first floor.', '2016-10-14 01:00:00', '1.0', 2),
(121, 8, 'lock haven shoe bank', 'Wendy Stiver', 'wstiver@lockhaven.com', 'help people determine shoe size and pick out shoes', '2016-10-15 10:30:00', '4.0', 2),
(122, 134, 'Oley Halloween Parade Set Up/Clean up', 'Mike Schaeffer', '4843881033', 'Helped line up floats and those entered in the parade. Helped hand out lunch for all of the individuals involved. Set up for the homecoming king and queen announcement ceremony. Helped clean up the fairgrounds after the event.', '2016-10-15 12:00:00', '4.0', 2),
(123, 98, 'Honors Orientation- Movers and Shakers', 'Shelby Helwig', '717-650-8904', 'Worked with other honors students to move in freshmen honors students as part of the GHP orientation process.', '2016-08-25 00:00:00', '3.0', 2),
(124, 98, 'Open House Volunteer- A-Team', 'Shelby Helwig', '570-974-8757', 'Volunteered time on A-team to talk to perspective honors students at an open house. Also conducted an interview in the afternoon.', '2016-10-08 00:00:00', '3.0', 2),
(125, 65, 'Hunger Bowl Donations', 'Jackie Dumm', 'jwhitlin@lhup.edu', 'I donated 10 non-perishable food items for the local huger bowl to help feed families in need.', '2016-10-19 12:00:00', '2.0', 2),
(126, 149, 'Honors Admissions Team Open House', 'Shelby Helwig', 'honors@lhup.edu', 'I talked to high school students at the open house about possibly joining the Honors Program. I also trained a freshman who was doing Admissions Team for the first time. I also gave an interview in the afternoon portion of the open house.', '2016-10-08 08:00:00', '2.0', 2),
(127, 63, 'Painting', 'Mary Beth Ruggiero', 'mbr6609@lhup.edu', 'I helped to paint the set for the Brothers Grimm Spectaculathon on Saturday. They have been struggling to find people to finish the set before the show starts.', '2016-10-15 13:00:00', '5.0', 2),
(128, 22, 'C.C.W.C. Candle Light Vigil', 'Dawn Barner', '570-748-9539', 'A candle light vigil was held in memory of those who lost their lives to domestic violence in Clinton county. I helped by passing out glow sticks, programs, donuts, and candles. At the end I helped clean up and take down all of the decorations.', '2016-10-19 17:45:00', '1.0', 2),
(129, 191, 'Campaigning', 'Kerry Cahoon', '952-221-5854', 'I worked with the Democratic National Party to campaign for Hillary Clinton in Bentley', '2016-10-23 15:00:00', '3.0', 2),
(130, 28, 'Food drive', 'Regina Beers, Roxanne Aretta', '814-762-3732', '10 cans for 2 hours service', '2016-10-21 00:00:00', '2.0', 2),
(131, 211, 'APSCUF Strike', 'Dr. Burkholder; Dr. Schillig; Dr. Devi; Dr. Baker', 'lhup.edu email', 'I supplied two separate faculty strike stations with one bag of oranges and a large variety bag of chips each (by the PUB and in front of Stevenson Library). I also participated in striking alongside the faculty each day that the strike was in progress. (3+ hours each day of striking, plus an hour for each donation?) I\'m not sure how this should be counted.', '2016-10-19 00:00:00', '5.0', 2),
(132, 41, 'Lock Haven Weight Room', 'Coach Danielle Fraser', 'dfraser@lhup.edu', 'Monitored the Rogers Gym weight room, made sure people signed in, and cleaned up after the day was over.', '2016-09-06 00:00:00', '12.0', 2),
(133, 91, 'Moving and Shaking', 'Shelby Helwig', '717-650-8904', 'I helped the freshman move into their dorms and get settled.', '2016-08-25 11:30:00', '3.0', 2),
(134, 91, 'Hunger-Bowl', 'Shelby Helwig', '717-650-8904', 'I donated 5 cans to the hunger bowl for honors.', '2016-10-25 16:30:00', '1.0', 2),
(136, 165, 'Road Cleanup', 'Bob Myers', 'rmyers3@lhup.edu', 'The Lock Haven Environmental Club walked the length of Glen Road, picking up any and all trash that we found as we went.', '2016-10-18 17:00:00', '2.0', 2),
(137, 43, 'A-team', 'Shelby Helwig', 'shelby', 'worked at open house', '2016-10-08 08:00:00', '2.0', 2),
(138, 43, 'Hunger Bowl', 'Bethy Wells', 'Bethy', '10 cans', '2016-10-20 17:00:00', '2.0', 2),
(139, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Kathy Deavor', '(570) 295-7109', 'I co-teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2016-09-21 17:30:00', '2.0', 2),
(140, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Kathy Deavor', '(570) 295-7109', 'I co-teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2016-10-05 17:30:00', '2.0', 2),
(141, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Kathy Deavor', '(570) 295-7109', 'I co-teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2016-10-12 17:30:00', '2.0', 2),
(142, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Kathy Deavor', '(570) 295-7109', 'I co-teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2016-10-19 17:30:00', '2.0', 2),
(143, 82, 'Lock Haven Lacrosse Clinic', 'Whitney Boshart (coach)', 'web1120@lhup.edu', 'During this clinic, Lock Haven recruits and anyone interested in expanding their knowledge about lacrosse was welcome to come. We helped to coach the young girls and run through drills. There were about 30 girls at the clinic and we spent the day coaching, guiding, and teaching lacrosse. At the end we even had 2 girls commit to play with us next year!!!', '2016-09-24 08:00:00', '8.0', 2),
(144, 107, 'All Night Bowling Fundraiser', 'Morgan Capobianco', 'mpc7999@lhup.edu', 'I obtained a ticket and shoe rentals to have unlimited bowling. A portion of the proceeds from my ticket went to a local food bank, thereby raising money in and supporting my local community.', '2016-10-21 23:00:00', '3.0', 2),
(145, 34, 'Food Drive Donation', 'Amy Downs', 'abd350@lhup.edu', 'Donated 5 items of non-perishable food at Smith Hall', '2016-10-27 00:00:00', '1.0', 2),
(146, 5, 'Red Cross Blood Drive', 'Lauren Wright', 'law3363@lhup.edu', 'Passed out snacks and water at the blood drive and monitored people for signs of lightheadedness. (Sept 13: 11am-4pm, Sept 14: 11:30-6pm)', '2016-09-13 11:00:00', '11.0', 2),
(147, 34, 'Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'I spent time with the Admissions Team on Saturday speaking with prospective students', '2016-10-29 08:15:00', '2.0', 2),
(148, 145, 'A Team Open House', 'Shelby Helwig', '717-650-8904', 'During the Open House this weekend, I had a chance to talk with a few prospective students and tell them about the program. The female student that I interviewed, Olivia, and I had a great session, and she showed a genuine interest in the program. She was also very willing to ask any questions she had, and was very excited by a lot of the answers she got. I honestly think that if she comes to LHU, she will be a part of the program!', '2016-10-29 08:00:00', '2.0', 2),
(149, 145, 'InterPACK 2016', 'Jessica Tressa', '570-881-0748', 'This was a Circle K Conference in which a variety of service projects were done for the benefit of small children. While there, I made a variety of spiritual reflection bags, colored puzzles for the children to build, wrote letters that would go to hospitalized children in the UK, completed color a smile pictures, and packaged hotel shampoos and conditioners that would be donated to women\'s shelters across PA.', '2016-10-21 18:00:00', '5.0', 2),
(150, 191, 'Campaigning for Hillary Clinton', 'Kerry Cahoon', '952-221-5854', 'I went to the homes of registered democrats in Lock Haven and asked them who they are planning to vote for', '2016-10-30 15:00:00', '3.0', 2),
(151, 102, 'Open House', 'Shelby Helwig', 'honors@lhup.edu', 'As a member of A-Team, I attended the Open House, talked to prospective students, and conducted an interview.', '2016-10-29 08:00:00', '2.0', 2),
(152, 22, 'Open House', 'Shelby Helwig', 'honors@lhup.edu', 'Helped pass out flyers, talked to to prospective students and their families, and interviewed students', '2016-10-08 08:30:00', '2.0', 2),
(153, 22, 'LHU A-Team Orientation', 'Shelby Helwig', 'honors@lhup.edu', 'helped pass out flyers, talked to prospective students and their families, and conducted interviews', '2016-10-29 08:30:00', '2.0', 2),
(154, 17, 'Hunger Bowl', 'Patrick Long', 'pdl347@lhup.edu', 'Brought in 5 cans of food for the Hunger bowl', '2016-10-31 12:00:00', '1.0', 2),
(155, 17, 'Mill Hall AYSO Volunteer Referee', 'Patrick Long', 'pdl347@lhup.edu', 'Volunteer soccer referee for U12 soccer game in Mill hall league', '2016-10-31 15:00:00', '2.0', 2),
(157, 188, 'A-Team/Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'I helped recruit new students into the honors program.', '2016-10-28 08:00:00', '2.0', 2),
(158, 74, 'Circle K Halloween Party', 'Megan McKenna', 'mem271@lhup.edu', 'I helped set up the halloween party for Circle K.', '2016-10-26 17:00:00', '2.0', 2),
(159, 84, 'Salvation Army', 'Kirsten', '570-748-2951', 'Helped out with pricing and putting things away at the Salvation Army', '2016-10-27 12:15:00', '5.0', 2),
(160, 47, 'Food Drive - Cans', 'Honors Directors', 'Honors House', 'Brought in 10 non-perishable food cans to the honors house', '2016-10-27 00:00:00', '2.0', 2),
(161, 88, 'Mover and Shaker', 'Dr. Jackie Dumm', 'jwhitlin@lhup.edu', 'A handful of honors students helped move in the freshman into their resident\'s hall. My job was to help unpack the student\'s belongings and place them in bins and take them to their designated rooms. This allowed me to get an idea who was new in the program and also, to get to know them better.', '2016-08-25 11:00:00', '3.0', 2),
(162, 47, 'BINGO', 'Kathy Brown', '7068970596', 'Ran the bingo event with my teammates for community service', '2016-09-04 12:00:00', '2.0', 2),
(163, 50, 'Non-Perishable Food Collection', 'Global Honors Program', 'Honors Directors', 'Donated 10 Non-perishable food cans.', '2016-10-30 00:00:00', '2.0', 2),
(164, 125, 'Youth Group Leadership', 'Ashley Stensland', 'joyhopefaithlove@comcast.net', 'I helped lead the girl\'s youth group at my church. I lead a discussion about a topic in the Bible and helped facilitate pumpkin carving with the kids.', '2016-10-23 17:30:00', '2.0', 2),
(165, 125, 'Youth Group Leadership', 'Ashley Stensland', 'joyhopefaithlove@comcast.net', 'I helped lead the girl\'s youth group at my church. I hung out with the girls and got to ask some of them about what was going on in their lives. I also helped with discussion during another leader\'s lesson.', '2016-10-30 17:30:00', '2.0', 2),
(166, 88, 'Homecoming Block Party Assitant', 'Ashley Spencer', 'aspencer@lhup.edu', 'My job for this event was to assist Haven Leadership with the Block Party by having students sign in. Also, I was to hand out t-shirts for all the alumni and current students of Lock Haven University who attended. We advised alumni of what events were going on and helped them find where they could go.', '2016-10-14 18:00:00', '1.0', 2),
(167, 47, 'LHU Soccer Clinic and Tours', 'Kathy Brown (Coach)', '7068970596', 'Registered and helped run the women\'s soccer clinic for high school girls. Answered questions for parents and gave tours around campus and dorms', '2016-10-30 13:00:00', '4.0', 2),
(168, 50, 'LHU ID Soccer Clinic', 'Coach Kathy Brown', '706-897-0596', 'I worked a LHU ID Soccer clinic where I was responsible for assisting high-school players and answering questions.', '2016-10-30 00:00:00', '2.0', 2),
(169, 110, 'Hunger Bowl', 'Elizabeth Wells', 'ejw4272@lhup.edu', 'I brought in 10 cans of perishable food for the canned food drive.', '2016-10-24 12:00:00', '2.0', 2),
(170, 190, 'Movers and Shakers', 'Shelby Helwig', 'N/A', 'Helped move in honors freshmen', '2016-09-25 11:00:00', '3.0', 3),
(171, 190, 'A-Team', 'Shelby Helwig', 'N/A', 'Help train new A-Team members at the first open house', '2016-10-08 08:00:00', '2.0', 2),
(172, 60, 'SPCA', 'Scott Knyrim', '5704784756', 'Took multiple dogs on walks and played with cats.', '2016-10-24 14:00:00', '2.0', 2),
(173, 25, 'Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'Work with Honors Admission team for an open house', '2016-10-08 08:20:00', '2.0', 2),
(174, 60, 'SPCA', 'Scott Knyrim', '5707484756', 'Walked multiple dogs and entertained cats.', '2016-10-17 14:00:00', '2.0', 2),
(175, 25, 'Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'Work an open house with Honors Admission Team', '2016-10-29 08:15:00', '1.0', 2),
(176, 158, 'Troop 79 Climbing Merit Badge Weekend', 'LaRue Reedy', '570-768-8769', 'The entire weekend was spent working towards getting 12 members from Troop 79 in Sullivan County to complete the requirements for the climbing merit badge. They were on the climbing tower at Camp Brule\' in Forksville, PA.', '2016-10-01 08:00:00', '12.0', 2),
(177, 78, 'Democratic Party Office', 'Shannon Lachman', '8142321665', 'Working in the Clinton County Democratic office.', '2016-10-31 16:00:00', '4.0', 2),
(178, 160, 'A-team Open House', 'Shelby Helwig', '7176508904', 'I talked with perspective students at the October 29th open house. I was also available to preform an interview in the afternoon.', '2016-10-29 08:15:00', '2.0', 2),
(179, 158, 'Food Drive', 'Dr. Drumm', '?', '15 cans of veggies, soups, and spagettio\'s were donated at the honors house.', '2016-11-04 09:26:00', '2.0', 2),
(180, 72, 'Volunteer at Salvation Army', 'Coach Pat Long', '1-570-660-2093', 'Some members of the LHU mens soccer team volunteered a couple hours to help the children at the salvation army with homework. We also played with them outside during recess.', '2016-11-02 00:00:00', '2.0', 2),
(182, 156, 'Elizabeth Wells', 'Dr. Dumm', 'jwhitlin@lhup.edu', 'I donated 10 nonperishable items toward the GHP\'s donation to the Hunger Bowl cause.', '2016-11-04 12:00:00', '2.0', 2),
(183, 103, 'Open House', 'Dr. Jackie Dumm', 'jwhitlin@lhup.edu', 'We met with prospective students for Lock Haven University and the Global Honors Program', '2016-10-29 08:15:00', '2.0', 2),
(184, 50, 'Volunteer at LHU Swim Meet', 'Coach Kathy Brown', '706-897-0596', 'Assisted in being a back up timer for the swim meet.', '2016-11-05 00:30:00', '2.0', 2),
(185, 217, 'River Cleanup', 'Morgan Capobianco', 'mpc7999@lhup.edu, or 570.484.2499.', 'River Cleanup', '2016-09-10 08:00:00', '4.0', 2),
(186, 217, 'Open House', 'Shelby/Rachel', 'Honors@lhup.edu', 'A-Team', '2016-10-08 08:00:00', '2.0', 2),
(187, 217, 'Open House', 'Shelby', 'Honors@lhup.edu', 'A-Team', '2016-10-29 08:00:00', '2.0', 2),
(188, 122, 'Habitat for Humanity', 'Stephanie Clevenger', '(814) 353-2390 or restore@habitatgcc.org', 'Volunteered at Habitat for Humanity Greater Centre County ReStore performing various tasks such as cleaning and lifting.', '2016-11-05 00:00:00', '5.0', 2),
(189, 213, 'Move In Weekend', 'Emmy Borst', 'Emmy Borst', 'I helped the new Freshmen move in over the first weekend before classes.', '2016-08-26 08:00:00', '8.0', 2),
(190, 213, 'Move In Weekend', 'Emmy Borst', 'Emmy Borst', 'I helped move freshmen in over the first weekend of the semester.', '2016-08-27 08:00:00', '6.0', 2),
(191, 149, 'Honors Admissions Team Open House', 'Shelby Helwig', 'honors@lhup.edu', 'During the morning section of the open house, I talked to high school students about joining the honors program and the application process for it. In the afternoon, I sat at the table and directed students into our room so they could take their interviews.', '2016-10-29 08:00:00', '2.0', 2),
(192, 59, 'A-Team', 'Shelby Helwig', 'honors@lhup.edu', 'Helping out at the open house in the morning, and the afternoon for interviews', '2016-10-29 08:00:00', '2.0', 2),
(193, 132, 'Halloween nursing home activity', 'Whitney Boshart', 'web1120@lhup.edu', 'Our lacrosse team went to Susque View rehabilitation center to help the elderly hand out candy to children Trick-or-Treaters. We also hosted stands of games for the children.', '2016-10-27 17:45:00', '2.0', 2),
(194, 133, 'Penn State Concessions (CSF)', 'Buzz', 'http://csf-lhu.weebly.com/leadership-team.html', 'Volunteered with CSF (Christian Student Fellowship of both LHU and PSU) to run a concession stand at a Penn State football game.', '2016-09-24 08:00:00', '8.0', 2),
(195, 133, 'Little Pine State Park Trail Cleanup', 'Bob Myers', 'rmyers3@lhup.edu', 'Went with environmental club to Little Pine State Park and helped clean section of the Mid-State Trail.', '2016-11-05 10:00:00', '4.0', 2),
(196, 53, 'Movers and Shakers', 'Shelby', 'Shelby', 'Helped freshman students move in', '2016-08-25 00:00:00', '3.0', 2),
(197, 53, 'A- Team open House', 'Shelby', 'Shelby', 'work the morning and afternoon session for the open house', '2016-10-08 00:00:00', '2.0', 2),
(198, 53, 'A team open house', 'shelby', 'shelby', 'worked the morning and afternoon sessions for the open house', '2016-10-29 00:00:00', '2.0', 2),
(199, 11, 'Hunger Bowl', 'FDG leaders Chadd and Morgan', '5703671478', 'Donated 10 cans of food', '2016-11-02 17:00:00', '2.0', 2),
(200, 43, 'A-team', 'Shelby', 'Shelby', 'worked morning and afternoon session at open house', '2016-10-29 00:00:00', '2.0', 2),
(201, 39, 'A-Team open house', 'Shelby Helwig', 'sth1064@lhup.edu', 'Attended open house as a member of A-team and talked to seniors in high school to recruit them to the GHP. I also attended the afternoon session and interviewed students.', '2016-10-08 08:00:00', '2.0', 2),
(202, 39, 'Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'Attended open house as a member of Admissions Team, and recruited high school seniors to join the GHP. I also attended the afternoon session for interviews.', '2016-10-29 08:00:00', '2.0', 2),
(203, 23, 'Cans for Hunger Bowl', 'Chadd Miller and Morgan Rager', 'cmw4143@lhup.edu', 'I brought it 10 cans for the Hunger Bowl canned food drive.', '2016-11-02 16:00:00', '2.0', 2),
(204, 23, 'Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'I did both morning and after sessions for the Open House on October 29.', '2016-10-29 08:30:00', '2.0', 2),
(205, 23, 'Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'I volunteered at the Open House on October 8 as a part of A-Team. I did both morning and afternoon sessions', '2016-10-08 08:30:00', '2.0', 2),
(206, 98, 'Open House- Admissions Team', 'Shelby Helwig', 'sth1064@lhup.edu', 'Worked as part of the GHP admissions team to help recruit and interview perspective high school students for the program.', '2016-10-29 00:00:00', '1.0', 2),
(207, 56, 'Covenant Cafe', 'Fran Decker', 'fdecker@kcnet.org', 'Help plan and carry out activities for this early stage Alzheimer\'s support group. We try to challenge them physically and mentally, while having fun and connecting with others. The sessions are twice a month for 2 hours each session. I took part in each session for the months of September, October, and November', '2016-09-06 13:00:00', '12.0', 2),
(208, 102, 'Open House 1', 'Shelby Helwig', 'honors@lhup.edu', 'I attended the morning session and talked to prospective students and the afternoon session and interviewed a prospective student', '2016-10-08 08:00:00', '2.0', 2),
(209, 102, 'Open House 2', 'Shelby Helwig', 'honos@lhup.edu', 'I attended the morning session and talked to prospective students and the afternoon session and interviewed a prospective student', '2016-10-29 08:00:00', '2.0', 2),
(210, 188, 'Open House', 'Shelby Helwig', 'honors@lhup.edu', 'Helped A-Team recruit at the Open House', '2016-10-29 08:00:00', '2.0', 2),
(211, 97, 'Work at the SPCA', 'Dr. Howell', 'chowell@lhup.edu', 'I go to the SPCA twice a week for 2-3 hours helping socialize the dogs.  I actually began volunteering there before school started and got to go in every day for a few hours.  That first week I got about 10 hours and I\'ve been getting 4 a week there ever since.  Now I usually go on Tuesdays and Fridays from 2-4 pm.  This is Mary Ellen\'s number so you can contact her 570-786-1099', '2016-08-22 14:00:00', '46.0', 2),
(212, 84, 'Salvation Army', 'Deb Moore', '5707482951', 'Folded and hung clothes. Priced items. Etc.', '2016-10-27 12:00:00', '10.0', 2),
(213, 84, 'Salvation Army', 'Deb Moore', '5707482951', 'Folded and hung clothes. Priced items. Etc.', '2016-10-27 12:00:00', '10.0', 2),
(214, 84, 'Salvation Army', 'Deb Moore', '5707482951', 'Folded and hung clothes. Priced items. Etc.', '2016-10-27 12:00:00', '10.0', 2),
(215, 167, 'CIU Development Center for Adults', 'Marianne Taylor', 'mtaylor@ciu10.org', 'I help tutor adults that are looking to get their GED. Most often I work with Annette. It is amazing to see how hard people work to better themselves no matter how old they are.', '2016-10-26 17:00:00', '7.0', 2),
(216, 34, 'Bazaar at SusqueView Health Center', 'Teresa Fortney', 'tfortney@susqueviewhome.com', 'At this event I brought residents down to the ground level to help theme look around at vendors and then brought them back to their room when they were done looking.', '2016-11-12 09:00:00', '3.0', 2),
(217, 160, 'CAC Canning', 'Colleen Eccles', '4848326528', 'I canned for College Against Cancer to raise money for Relay for Life.', '2016-11-12 11:00:00', '2.0', 2),
(218, 143, 'Donate to Hunger Bowl', 'Honors', 'honors@lhup.edu', 'Donated 10 canned goods for the Hunger Bowl for Honors', '2016-10-25 00:00:00', '2.0', 2),
(219, 109, 'Handed Out Flyers at Convocation', 'Dr. Jacqueline Whitling', 'jwhitlin@lhup.edu', 'At the beginning of the semester, me and a few other honors students handed out flyers for the 2016 convocation ceremony.', '2016-09-07 13:00:00', '2.0', 2),
(220, 109, 'Hunger Bowl', 'Jacqueline Whitling', 'jwhitlin@lhup.edu', 'I purchased and donated 10 non-perishable food items on behalf of the Global Honors Program for Lock Haven University\'s 2016 Hunger Bowl.', '0000-00-00 00:00:00', '2.0', 2),
(221, 35, 'Canned Goods Donation', 'Rachael', 'honors_program@lhup.edu', 'Donated 10 canned goods, dropped them off in the honors house, and put my name on the sign in sheet', '0000-00-00 00:00:00', '2.0', 2),
(222, 50, 'LHU Soccer ID Clinic', 'Coach Kathy Brown', '706-897-0596', 'Assisted in doing drills with high school players who are interested in joining LHU\'s team. Also, I gave a tour of campus at the end of the training session.', '2016-11-13 13:00:00', '3.0', 2),
(223, 116, 'Adopt A Family', 'Dr. Dumm', 'jwhitlin@lhup.edu', 'Two Christmas gifts \r\nAbigail: Shopkins coloring book, crayons, and colored pencils\r\nBryan: Teenage Mutant Ninja Turtles coloring book, crayons, and colored pencils', '2016-11-15 09:30:00', '2.0', 2),
(224, 165, 'Nature Trail Cleanup', 'Robert Myers', 'rmyers3@lhup.edu', 'Walked LHU Nature Trail picking up any trash we found.', '2016-11-15 16:00:00', '1.0', 2),
(225, 160, 'CAC Tabling', 'Colleen Eccles', '4848326528', 'I sat at a table in the lower part of Bentley, advising students how to sign up for Relay for Life.', '2016-11-15 11:00:00', '1.0', 2),
(226, 98, 'Phi Beta Delta: Bingo for Bellies', 'John Gradel', '570-484-2140', 'Helped set up prior to the event and played bingo to help benefit a local food pantry.', '2016-11-15 00:00:00', '1.0', 2),
(227, 79, 'Moving and Shaking', 'Shelby Helwig/Rachael Metzinger', 'sth1064@lhup.edu/rxm2509@lhup.edu', 'I helped Freshmen move in during move-in weekend.  Specifically, I directed traffic to avoid a huge back up.', '2016-08-25 12:00:00', '3.0', 2),
(228, 79, 'River Clean-Up', 'Elisabeth Lynch', 'clintoncountycleanscapes@yahoo.com', 'I was part of the in-river crew that dug tires out of the water!  We combed the downstream side for tires, and then moved upstream.  As always, it was a very rewarding experience cleaning up our local waterways, and the best part was that there were FAR fewer tires than last year!', '2016-09-10 09:00:00', '5.0', 2),
(229, 78, 'Democratic Party Office', 'Shannon Lachman', '8142321665', 'I canvassed (went door knocking) through the Lock Haven area for candidates like Mike Hanna, Katie McGinty and Hillary Clinton.', '2016-11-07 13:00:00', '4.0', 2),
(230, 78, 'Democratic Party Office', 'Shannon Lachman', '8142321665', 'I canvassed (went door knocking) through the Lock Haven area for candidates like Mike Hanna, Katie McGinty and Hillary Clinton. This was election day, so I also worked at the polls.', '2016-11-08 13:00:00', '4.0', 2),
(231, 79, 'Open House Morning and Afternoon', 'Shelby Helwig', 'sth1064@lhup.edu', 'I\'m on A-Team and helped out at the Open House in the morning and the afternoon interview!', '2016-09-24 08:20:00', '2.0', 2),
(232, 79, 'Open House Morning and Afternoon', 'Shelby Helwig', 'sth1064@lhup.edu', 'I\'m on A-Team and helped out at the Open House in the morning and the afternoon interview!', '2016-10-29 08:20:00', '2.0', 2),
(233, 125, 'Habitat for Humanity Restore', 'Jill Redman', 'jill@habitatgcc.org', 'My small group from my Small Group Communications class went to the habitat for humanity restore in Bellefonte and bring new inventory into the store, clean it, and then place it on the floor to be sold.', '2016-11-05 12:00:00', '5.0', 2),
(234, 125, 'Youth Group Leadership', 'Ashley Stensland', 'joyhopefaithlove@comcast.net', 'I help lead the girls youth group at my church. This past week, I helped them prep desserts for an event we are doing this Sunday and spent time talking to some of them about what is going on in their lives.', '2016-11-13 17:30:00', '2.0', 2);
INSERT INTO `SP17_com_serv` (`com_id`, `pstu_id`, `com_title`, `com_advisor`, `com_advisor_contact`, `com_description`, `com_date`, `com_hours`, `com_verified`) VALUES
(235, 96, 'BINGO for Bellies', 'Phi Beta Delta', 'international@lhup.edu', 'Donated non-perishable food ideas to support families in need.', '2016-11-15 19:00:00', '1.0', 2),
(236, 85, 'Adopt A Family', 'Dr. Dumm', 'jwhitlin@lhup.edu', 'I participated in getting gifts for one of the tags, Bryan age 5, for the Christmas \"Adopt a Family\" event.', '2016-11-17 12:00:00', '1.0', 2),
(237, 34, 'Susqueview Thanksgiving Dinner', 'Teresa Fortney', 'tfortney@susqueviewhome.com', 'At this event, I served dinner and desserts to residents as well as clearing plates and tables at the end of the night.', '2016-11-18 17:30:00', '2.0', 2),
(238, 29, 'HOLTF- Operation Christmas Child', 'Sarah E. Snyder', 'ssnyder@houseofthelordfellowship.org / #570-660-1919', 'I packaged donations into large boxes to be taken to penn state to be sent out to people around the world. I also attached tracking labels on all of the packages.', '2016-11-19 08:00:00', '7.0', 2),
(239, 49, 'Operation Christmas Child', 'Sarah Snyder', 'ssnyder@houseofthelordfellowship.org', 'I packed and sealed boxes for the OCC National Collection Week at the House of the Lord Fellowship Church', '2016-11-19 08:00:00', '7.0', 2),
(240, 27, 'Salute the Troops', 'Lara Ringgold', 'ljr71@lhup.edu', 'Volunteered to help clean up Highland Cemetery. Placed wreaths and flowers, cleaned up leaves, straightened out flags and markers on veterans\' graves.', '2016-11-19 14:00:00', '3.0', 2),
(241, 8, 'Lock Haven Shoe Bank', 'Wendy Stiver', 'wstiver@lockhaven.com', 'I helped measure kids\' feet and pick out their shoes.', '2016-11-19 10:30:00', '4.0', 2),
(242, 100, 'Open House', 'Shelby Helwig', 'honors@lhup.edu', 'During the first open house I was trained by my A-team mentor. I talked to high school students who are interested in the program and aided in the interviewing process.', '2012-10-08 00:00:00', '2.0', 2),
(243, 100, 'Open House', 'Shelby Helwig', 'honors@lhup.edu', 'During this open house I talked to students interested in the GHP. At the afternoon session I interviewed the high school students who had expressed interest in our program.', '2016-11-19 08:20:00', '2.0', 2),
(244, 23, 'Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'I did the morning and afternoon sessions for the Open House on November 26.', '2016-11-26 08:20:00', '2.0', 2),
(245, 39, 'Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'Attended the morning and afternoon sessions for open house as a member of Admissions Team', '2016-11-19 08:00:00', '2.0', 2),
(246, 39, 'Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'Attended the morning and afternoon sessions for open house as a member of Admissions Team', '2016-11-19 08:00:00', '2.0', 2),
(247, 39, 'Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'Attended the morning and afternoon sessions for open house as a member of Admissions Team', '2016-11-19 08:00:00', '2.0', 2),
(248, 67, 'Open House', 'Ashley Spencer', 'aspencer@lhup.edu', 'Gave tours to high school seniors', '2016-11-19 10:30:00', '5.0', 2),
(249, 25, 'Susque View Thanksgiving Dinner', 'Teresa Fortney', 'tfortney@susqueviewhome.com', 'Served dinner to residents and members of their families.', '2016-11-18 17:30:00', '2.0', 2),
(250, 25, 'Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'Worked with admissions team at the open house', '2016-11-19 08:20:00', '2.0', 2),
(251, 65, 'Adopt-A-Family Gift Donations', 'Jackie Dumm', 'jwhitlin@lhup.edu', 'Purchased three gifts to fulfill the requests on two Adopt-A-Family gift tags', '2016-11-21 00:00:00', '2.0', 2),
(252, 22, 'LHU Hunger Bowl', 'N/A', 'N/A', 'Donated 10 non-perishable items as stated on clipboard in the honors house', '2016-10-27 00:00:00', '2.0', 2),
(253, 22, 'LHU A-Team Open House', 'Shelby Helwig', 'honors@lhup.edu', 'Talked to families and conducted interviews as a part of the Honor\'s Admissions Team', '2016-11-19 08:20:00', '2.0', 2),
(254, 22, 'Susqueview Thanksgiving Dinner', 'Teresa Fortnry', 'tfortney@susqueviewhome.com', 'Served Thanksgiving dinner to the residents of the nursing center. Once they were done eating we cleaned up all of the tables. Over 300 people were served that night.', '2016-11-18 17:29:00', '2.0', 2),
(255, 192, 'Special Olympics Spaghetti Dinner', 'Kelly Hibbler', 'khibbler@lhup.edu', 'I help the Special Olympics volunteers with serving their dinner and selling raffle tickets. I was amazed at how much money was donated towards the benefactors. It is definitely hard work trying to organize an event like this, year after year. I am glad to volunteer my time for the Special Olympics because it gives the participants an initiative to stay involved and feel like they are apart of something. I would gladly do it again next year.', '2016-11-19 15:30:00', '4.0', 2),
(257, 167, 'CIU Development Center', 'Marianne Taylor', 'mtaylor@ciu10.org', 'I help tutor adults seeking to acquire their GED', '2016-11-14 17:30:00', '4.0', 2),
(258, 42, 'Ross Library Book Sale', 'Diane Whitaker', 'ross1@rosslibrary.org', 'Helped handle money and bag books at the Ross Library Book Sale', '2016-08-10 15:00:00', '5.0', 2),
(259, 42, 'Ross Library Reshelving Project', 'Diane Whitaker', 'ross1@rosslibrary.org', 'Moving the nonfiction books to make more room for the fiction.', '2016-09-16 14:00:00', '11.0', 2),
(262, 101, 'Salvation Army After School Program', 'Kathy Deavor', '(570) 295-7109', 'I co-teach a \"Moonbeams\" class (5-6 year olds) based off of emblems that include lessons from the Bible, snack, crafts, and physical activity. After each emblem is completed (Summer Fun, Mind Your Manners, Cooking, Wellness, etc) each child will receive a badge to add to their collection of completed emblems. Each emblem takes approximately 3 meetings (weeks) to complete.', '2016-11-02 17:30:00', '2.0', 2),
(263, 101, 'Lock Haven Salvation Army After School Program', 'Kathy Deavor', '(570) 295-7109', 'I co-teach a \"Moonbeams\" class (5-6 year olds) based off of emblems that include lessons from the Bible, snack, crafts, and physical activity. After each emblem is completed (Summer Fun, Mind Your Manners, Cooking, Wellness, etc) each child will receive a badge to add to their collection of completed emblems. Each emblem takes approximately 3 meetings (weeks) to complete.', '2016-11-16 17:30:00', '2.0', 2),
(264, 150, 'Salvation Army Thrift Store', 'Kathy Deavor', '570-295-7109', 'I helped sort through clothes and clean store so it looked presentable to the costumers.', '2016-10-12 00:00:00', '3.0', 2),
(265, 11, 'Special Olympics Spaghetti Dinner', 'Kelly Hibbler', 'khibbler@lhup.edu', 'I helped plate spaghetti for the fundraiser that the Special Olympics committee holds annually.', '2016-11-11 15:30:00', '3.0', 2),
(266, 149, 'Honors Admissions Team Open House', 'Shelby Helwig', 'honors@lhup.edu', 'I talked to high school students about the honors program during the morning portion of the open house. In the afternoon, I helped out with an honors session that was held for certain students to give them more information about the honors program. I also gave an interview in the afternoon.', '2016-11-19 00:00:00', '2.0', 2),
(267, 62, 'Susque-View Home Beauty Shop', 'Teresa Fortney', '570-893-5941', 'At Susque-View Home they have a beauty shop for residents to get their hair done. I volunteered to transport the residents from their rooms down to the beauty shop on the first floor.', '2016-11-29 09:30:00', '2.0', 2),
(271, 103, 'Open House', 'Jackie Dumm', 'jwhitlin@lhup.edu', 'We talked to prospective students about the Global Honors Program.', '2016-11-19 09:00:00', '1.0', 2),
(272, 103, 'Blood Drive', 'Jackie Dumm', 'jwhitlin@lhup.edu', 'I gave blood and saved up to 3 lives.', '2016-11-30 14:45:00', '1.0', 2),
(273, 24, 'Red Cross Blood Drive', 'Lauren Wright', 'law@3363@lhup.edu', 'I helped make sure people ate food and drank something after donating blood.', '2016-11-30 16:00:00', '3.0', 2),
(274, 24, 'Red Cross Blood Drive', 'Lauren Wright', 'law3363@lhup.edu', 'I helped make sure people ate food and drank something after donating blood', '2016-12-01 16:00:00', '3.0', 2),
(275, 17, 'Blood donation', 'Red Cross', 'www.redcross.org', 'donated blood', '2016-11-30 12:15:00', '1.0', 2),
(276, 72, 'Wrestling meet ticket sales', 'Patrick Long/ Danielle Barney', '15706602093', 'I sat at the entrance for the wrestling meet and sold tickets to get into the meet.', '2016-12-03 18:00:00', '2.0', 2),
(277, 46, 'Blood Drive', 'Lauren Wright', 'law3363@lhup.edu', 'I worked the refreshment table by looking after donors and making sure they ate and rested after donating.', '2016-12-28 12:00:00', '4.0', 2),
(279, 17, 'Concession Stand at Wrestling match', 'Pat Long', 'pdl347@lhup.edu', 'Sold concessions during lock haven vs George Mason wrestling match', '2016-12-04 11:00:00', '3.0', 2),
(280, 31, 'LHU Blood Drive', 'law3363@lhup.edu', 'law3363@lhup.edu', 'I went to the blood drive and did the double red donation, which took 2 hours due to the waiting, the questions, the set up of the machine, actually getting blood taken, and the wait time after.', '2016-11-30 13:30:00', '2.0', 2),
(281, 45, 'Special Olympics Spaghetti Dinner', 'Kelly Hibbler', '570-502-2374', 'I helped serve spaghetti dinners and drinks for a fundraiser for the Special Olympics.', '2016-11-19 15:30:00', '3.0', 2),
(282, 8, 'lock haven shoe bank', 'Wendy Stiver', 'wstiver@lockhaven.com', 'help kids measure their feet and get shoes', '2016-11-19 10:30:00', '4.0', 2),
(283, 24, 'Adopt-A-Family', 'Lauren Wright', 'law3363@lhup.edu', 'I bought a pair of jeans for a family in need.', '2016-12-01 12:15:00', '1.0', 2),
(284, 46, 'Adopt A Family', 'Lauren Wright', 'law3363@lhup.edu', 'I bought a pair of pants for a fourteen year old boy.', '2016-12-01 00:15:00', '1.0', 2),
(285, 76, 'Covenant Cafe', 'Frances Decker', 'fdecker@kcnet.org', 'Every first and third Tuesday of the month I volunteered to help individuals with early stage dementia with crafts, activities, and exercises for two hours each session.', '2016-09-05 00:00:00', '12.0', 2),
(286, 35, 'Adopt a Family', 'Honors Program', 'honors_program@lhup.edu', 'Bought gifts for one of the tags off of the honors tree', '2016-12-02 00:00:00', '1.0', 2),
(290, 54, 'Santa\'s Workshop', 'Dave Shimchel', '570-726-8434', 'I worked with the local Kiwanis club on running their Santa\'s Workshop. Children in the local community came in to partake in multiple different activities. I dressed up as a snowman and danced around to get the kids excited for the different activities. I also helped make crafts and hand out gifts to the kids as they finished getting pictures with Santa Claus.', '2016-12-04 00:00:00', '4.0', 2),
(291, 54, 'Holiday Reading Day at Ross Library', 'Nancy Ansham', '570-748-3321', 'I helped children who attended the holiday reading event at Ross Library make a craft. I also helped the women who worked for the library set up and clean up. I got to interact with various families in the community and get a better understanding of the community,', '2016-12-03 00:00:00', '2.0', 2),
(292, 62, 'Susque-View Home Beauty Shop', 'Teresa Fortney', '570-893-5941', 'I helped at the beauty shop that is in Susque-View Home with transporting the residents from their rooms down to the beauty shop on the first floor.', '2016-12-06 09:30:00', '2.0', 2),
(293, 203, 'Adopt A Family', 'Lauren Wright', 'law3363', 'Ulmer 219 took on not only an entire tree, but additional tags as well as part of the Adopt A Family experience this year', '2016-12-05 00:00:00', '1.0', 2),
(294, 203, 'Clothing Donation', 'Mechanicsburg Goodwill', '7176352881', 'While home for the holiday I went through clothes and donated 3 bags to the local Goodwill', '2016-11-26 12:00:00', '3.0', 2),
(295, 28, 'Blood Donatiom', 'Regina Beers', 'unknown', 'Blood donation', '2016-12-01 00:00:00', '1.0', 2),
(296, 10, 'Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'For this open house I was trained as a new member of A-team. I helped at the morning session by welcoming students to the open house and informing them of the honors program. In the afternoon I helped conduct interviews for potential honors students.', '2016-10-08 09:00:00', '2.0', 2),
(297, 10, 'Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'This was the second open house I attended as a member of A-team. In the morning session I welcomed students to the open house and provided them with information about the honors program. In the afternoon, I helped escort students and parents to the conference room, where we held a new \'honors\' session. I also conversed with parents who were waiting for their child to return from interviews.', '2016-11-19 09:00:00', '2.0', 2),
(298, 73, 'Holiday Gift Wrapping', 'Lauren Wright', 'law3363@lhup.edu', 'The Holiday\'s are a time of giving, the Gift wrapping was a part of the Adopt A Family Gift Drive. The group donates gifts to family\'s who are not able to provide any for their children or who have had a recent tragedy occur within the family. During my volunteer hours, I helped wrap gifts for the families so they can have an extra special Christmas.', '2016-12-07 00:00:00', '5.0', 2),
(299, 75, 'Adopt-A-Family Gift Wrapping', 'Lauren Wright', 'law3363@lhup.edu', 'I helped wrap gifts that people bought for the families on Adopt-A-Family trees.', '2016-12-07 13:00:00', '6.0', 2),
(300, 160, 'A-Team Open House', 'Shelby Helwig', '7176508904', 'I spoke with perspective honors students and their families at the admission open house. I conducted interviews with perspective students in the afternoon session.', '2016-11-19 09:00:00', '2.0', 2),
(301, 100, 'Adopt A Family Holiday Gift Drive', 'Jackie Dumm', 'jwhitlin@lhup.edu', 'For an hour of community service I bought a gift for a young girl who was part of the Holiday Gift Drive held on campus. The gift was delivered to the Honors house on 11/30/16.', '2016-11-30 00:00:00', '1.0', 2),
(302, 37, 'All In Phone a Thon', 'Anna Rodgers and Pat Rudy', 'axr1159@lhup.edu and prudy@lhup.edu', 'Called alumni and updated their contract information and asked for donations', '2016-11-29 16:00:00', '1.0', 2),
(303, 37, 'All In Phone a Thon', 'Anna Rodgers and Pat Rudy', 'axr1159@lhup.edu and prudy@lhup.edu', 'Called alumni and updated their contact information and informed them of the All-In day of giving', '2016-11-17 18:00:00', '3.0', 2),
(304, 28, 'Adopt-A-Family', 'Lauren Wright', 'law3363@lhup.edu', 'Delivered presents to Adopt A Family recipients.', '2016-12-09 10:00:00', '4.0', 2),
(305, 62, 'Susque View Christmas Concert', 'Teresa Fortney', '570-893-5941', 'I assisted with transporting residents to the common area on the first floor for a church choir concert.', '2016-12-10 09:30:00', '2.0', 2),
(306, 88, 'Portage Cheerleading Assistant', 'Lisa Dividock', '814-243-4655', 'Over thanksgiving break, I spent a day at my old high school helping cheerleaders learn cheers from when I was in high school. I also helped design signs for fundraisers for their season. I was there for an hour.', '2016-11-21 15:00:00', '1.0', 2),
(307, 53, 'A Team open house', 'shelby', 'shelby', 'volunteered at the morning and afternoon sessions of the open house', '2016-11-19 00:00:00', '2.0', 2),
(313, 152, 'Goodwill Industries', 'Tracey Hughes', '5707485000', 'I helped with day to day activities like bringing in donations and distributing them throughout the store.', '2016-11-14 12:00:00', '5.0', 2),
(314, 152, 'Goodwill Industries', 'Tracey hughes', '5707485000', 'I helped with the daily activities of accepting donations and distributing them throughout the store.', '2016-12-07 12:00:00', '5.0', 2),
(315, 89, 'Moving and Shaking', 'Shelby Helwig', 'sth1064@lhup.edu', 'I helped freshmen move in.', '2016-08-25 13:00:00', '2.0', 2),
(316, 89, 'Can drive', 'Rachael Metzinger', '570-985-4764', 'I donated ten cans to the food drive.', '2016-11-03 16:00:00', '2.0', 2),
(317, 89, 'Spaghetti dinner fundraiser', 'Julie Sheetz', '570-502-1117', 'I helped out at a spaghetti dinner to raise money for a woman battling cancer.', '2016-10-19 12:00:00', '2.0', 2),
(318, 89, 'Spaghetti dinner fundraiser', 'Julie Sheetz', '570-502-1117', 'I helped out at a spaghetti dinner to raise money for a woman battling cancer.', '2016-10-19 12:00:00', '2.0', 2),
(319, 140, 'St. John Nuemann Nursing Home', 'Shannon Wesney', '(215) 698-5600', 'Helping with bingo and transportation', '2016-12-26 10:00:00', '5.0', 2),
(320, 113, 'Adopt-A-Family', 'Dr. Dumm', 'jwhitlin@lhup.edu', 'I picked up a tag from the adopt-a-family tree in the honors house and bought the gift over the Thanksgiving break.  I brought back the headphones I had bought for the boy in need by the deadline.', '2016-12-01 14:00:00', '1.0', 2),
(321, 163, 'Church retreat kids co-leader', 'Amy Diehl', '8142277669', 'I went on a retreat with a portion of my church for the weekend.  There were quite a few families with children there, so with my siblings, we taught the kids Sunday school lessons, read with them, did crafts, and played games while the adults had their own sessions.', '2017-01-06 18:00:00', '6.0', 2),
(322, 27, 'Helping Hands Food Pantry', 'Peg Huyck', 'Email:helpinghandsfoodpantry233@gmail.com Phone:570-746-1384', 'Went weekly to my town\'s local food pantry. Helped pack bags for school\'s backpack program. Organized items and food. LOTS of food.', '2016-12-21 09:30:00', '21.0', 2),
(323, 177, 'Perry County Food Bank', 'Wanda Shultz & Justin Lee', '(717) 574-0203', 'I volunteered at the Perry County Food Bank on the morning of 1/28 and worked from 7 am to 1 pm.  I was responsible for packing food into containers, stocking the shelves, breaking down boxes to recycle, and distributing food to a few families.', '2017-01-28 00:00:00', '6.0', 2),
(324, 106, 'Food Drive', 'Dr. Dumm', 'jdumm@lhup.edu', 'Donated 10 cans to the lhu food drive', '2016-11-02 00:00:00', '2.0', 2),
(325, 113, 'Operation Christmas Child Shoebox Packing', 'Amy Bechdel', 'amybechdel@gmail.com', 'I assisted Big Woods Bible Church, located close in Castanea, with packing shoe boxes for children in need around the globe.  The purpose was to provide a Christmas gift to those who may never receive one their entire lives, thereby making an impression on them to aspire to greater things and form a relationship with Christ.  Items such as school supplies, hygiene products, and neat toys were packed tight into 145 shoe boxes, and then shipped by way of Samaritan\'s Purse to children everywhere.', '2016-11-12 15:00:00', '3.0', 2),
(326, 53, 'Admissions Team Open House', 'Shelby', 'Shelby', 'Volunteered at the morning and afternoon session', '2016-11-19 08:00:00', '2.0', 2),
(327, 82, 'Sort Food', 'Whitney Boshart', 'web1120@lhup.edu', 'The women\'s lacrosse team visited a local high school and helped to sort and package food for the needy families. The kids who attend the school can no always afford meals. We packed backpacks with food for the kids to take home and sorted foods that the parents could come and pick up.', '2017-02-02 14:30:00', '2.0', 2),
(328, 151, 'Angel Tree', 'Brittney Muthler', '570 893 1833', 'I bought items for two children from the Evergreen Angel Tree. \r\n\r\nSorry that it has taken me so long to submit this!!', '2016-12-06 00:00:00', '2.0', 2),
(329, 66, 'Food Drive (last semester)', 'Rachael Metzinger', 'you are Rachael', 'I donated 10 cans to the food drive in the Honors House', '2016-11-18 00:00:00', '2.0', 2),
(330, 21, 'Volunteering at Susqueview Nursing Home', 'Susan Triponey', 'striponey@susqueviewhome.com, 570-893-5971', 'I have volunteered in the nursing home therapy unit helping with paperwork, and assisting patients', '0000-00-00 00:00:00', '15.0', 2),
(331, 37, 'Jobs Fair Volunteer', 'Pat Rudy', 'prudy@lhup.edu', 'Volunteered to work an hour shift at the jobs fair in Rodgers', '2017-02-16 12:20:00', '1.0', 2),
(332, 37, 'Bingo', 'Pat Rudy', 'prudy@lhup.edu', 'Helped set up, tear down, and worked the registration table for Bingo', '2017-02-11 09:00:00', '5.0', 2),
(333, 107, 'Vagina Monologues', 'Meghan Mausteller', 'mlm6713@lhup.edu', 'I attended the university presentation of the Vagina Monologues and supported the Clinton County Community Women\'s Shelter. I have a program from the event.', '2017-02-17 19:00:00', '2.0', 2),
(334, 66, 'Vagina Monologues', 'HOPE Center', 'Ulmer 110', 'I attended the Vagina Monologues play benefitting the HOPE Center', '2017-02-17 00:00:00', '2.0', 2),
(335, 8, 'Lock Haven Shoe Bank', 'Wendy Stiver', 'wstiver@lockhaven.com', 'helping kids get shoes', '2017-02-18 10:30:00', '4.0', 2),
(336, 201, 'A Night to Shine', 'Erica Logan', '(570) 433-3002', 'This event is an all night event held in Montoursville, 30 minutes from Lock Haven. The event hosts a prom for people with a disability. It\'s hosted by Tim Tebow and held nationwide at churches. I was one of 200 volunteers that made the night a fun and environment for people who travelled from all over to be a part of this prom.', '2017-02-10 04:30:00', '5.0', 2),
(337, 66, 'Alpha Sigma Phi Adopt a Highway', 'Matt Henry', '5703692368', 'I cleaned up trash along Route 220 between the green bridge and Walmart with Alpha Sigma Phi Fraternity.', '2017-02-18 00:00:00', '3.0', 2),
(338, 203, 'The Vagina Monologues', 'Meghan Mausteller', 'mlm6713@lhup.edu', '90% of the proceeds from the event went to the Clinton Country Community Womenâ€™s Shelter, the other 10% will go  to V-day. Not only was the event supporting the community, but it was a wonderful production of the play by Eve Ensler.', '2017-02-17 19:00:00', '2.0', 2),
(339, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Kathy Deavor', '(570) 295-7109', 'I teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2017-01-25 17:30:00', '2.0', 2),
(340, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Kathy Deavor', '(570) 295-7109', 'I teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2017-02-01 17:25:00', '2.0', 2),
(341, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Kathy Deavor', '(570) 295-7109', 'I teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2017-02-08 17:30:00', '2.0', 2),
(342, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Kathy Deavor', '(570) 295-7109', 'I teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2017-02-15 17:30:00', '2.0', 2),
(343, 43, 'Lock Haven Shoe Bank', 'Wendy Stiver', 'wstiver@lockhaven.com', 'I volunteered at the shoe bank and help young children find a new pair of shoes', '2017-02-19 10:30:00', '3.0', 2),
(344, 21, 'The Vagina Monologues', 'LHU Hope Center', 'mlm6713@lhup.edu', 'Went to see program that supported Clinton County Women\'s Shelter to defend against domestic violence', '2017-02-17 07:00:00', '2.0', 2),
(345, 17, 'Basketball concession stand volunteer', 'Patrick Long', 'pdl347@lhup.edu', 'Volunteered at mens basketball concession stand during home game vs west chester', '2017-02-18 15:15:00', '3.0', 2),
(346, 17, 'Valet Driver', 'Patrick Long', 'pdl347@lhup.edu', 'valet driver for play held in durrwachter alumni center to raise money for LHU Athletics', '2017-02-10 20:00:00', '1.0', 2),
(347, 12, 'Safe Zone Ally Training', 'Dr. Deitloff', 'jmd240@lhup.edu', 'learned how to be an ally in the safe zone organization, and how to deal with certain situations should they arise', '2017-02-22 18:30:00', '1.0', 2),
(348, 156, 'LGBTQ+ Ally Training', 'Dr. Deitloff', 'jmd240@lhup.edu', 'I attended LHU Safe Zone\'s LGBTQ+ Ally training held on Wednesday, February 22nd. The training served as a means of furthering students\' understanding of what it means to be an ally to the LGBTQ+ community, as well as ways in which we can serve as an ally to others.', '2017-02-22 18:30:00', '1.0', 2),
(350, 28, 'Vagina Monologues', 'n/a', 'n/a', '2hour play for service hours, the LHU HOPE center has my name registered as an attendee.', '2017-02-17 19:00:00', '2.0', 2),
(351, 125, 'Youth Group Leading', 'Ashley Stensland', 'joyhopefaithlove@comcast.net', 'On Sunday evening, I helped lead the girls\' youth group at my church.', '2017-02-19 17:30:00', '2.0', 2),
(352, 98, 'Honors Admissions Luncheon', 'Shelby Helwig', 'honors@lhup.edu', 'Held a luncheon with prospective students for the program and explained to them the advantages of the program!', '2017-02-25 00:00:00', '2.0', 2),
(353, 213, 'Vagina Monologues', 'Gayatri Devi', 'gdevi@lhup.edu', 'I attended the Vagina Monologues', '2017-02-17 19:00:00', '2.0', 2),
(354, 60, 'Career Fair', 'Cortney Force', 'careerservices@lhup.edu', 'I worked the registration table and did cleanup at the LHU Spring Career fair.', '2017-02-16 12:30:00', '2.0', 2),
(355, 59, 'A-Team Luncheon', 'Shelby Helwig', 'honors@lhup.edu', 'I helped out with the luncheon, talking to future honors students and completed an interview with a student from my major.', '2017-02-25 10:30:00', '2.0', 2),
(356, 103, 'Honors Luncheon', 'Jackie Dumm', 'jwhitlin@lhup.edu', 'Ate lunch with, and interacted with prospective Honors students.', '2017-02-25 10:30:00', '2.0', 2),
(357, 22, 'A-Team Honors Luncheon', 'Shelby Helwig', 'honors@lhup.edu', 'Participated in Honors Luncheon for incoming students as a part of A-Team. Talked to and interviewed prospective students and families.', '2017-02-25 00:00:00', '2.0', 2),
(358, 149, 'Honors Admissions Luncheon', 'Shelby Helwig', 'honors@lhup.edu', 'We met with high school students and their families to have lunch with them and talk to them about potentially joining the Honors Program. I also gave an interview to a student in the afternoon after lunch and the presentation.', '2017-02-25 11:00:00', '2.0', 2),
(359, 149, 'Honors Admissions Open House', 'Shelby Helwig', 'honors@lhup.edu', 'We talked to high school students in the morning about possibly joining the Honors Program. We conducted interview during the afternoon session of the open house.', '2017-03-04 09:00:00', '2.0', 2),
(360, 25, 'Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'Worked during the open house with the admission\'s team.', '2017-03-04 08:20:00', '2.0', 2),
(361, 103, 'Admissions Open House', 'Jackie Dumm', 'jwhitlin@lhup.edu', 'We talked to prospective students about the Honors Program.', '2017-03-04 08:30:00', '2.0', 2),
(362, 23, 'Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'I worked the spring open house as a part of A-Team!', '2017-03-04 09:00:00', '2.0', 2),
(363, 29, 'LGBTQ Awareness Play', 'Dawn Gill, Shannon Gerencir', 'Dawn Gill: dms1008@lhup.edu Shannon Gerencir: 304-543-0036', 'I arrived at Durrwachter at 7:00 pm to be available to provide the attendants of the play their coats at intermission should they desire them. Then I stayed until the end of the play and gave back all the coats to the persons they belonged to until the coats were gone.', '2017-02-10 19:00:00', '2.0', 2),
(364, 29, 'Women in Sports Day', 'Shannon Gerencir', '304-543-0036', 'For an hour, I taught various little girls how to play volleyball as well as chatted with them and taught them some life lessons that can relate back to sports.', '2017-02-22 15:00:00', '1.0', 2),
(365, 12, 'Big Brothers Big Sisters Interview', 'Clarissa', 'BBBS@ClintonCountyPA.com', 'i got matched interviewed to match up with a little, who will have similar interests to mine', '2017-02-24 13:00:00', '1.0', 2),
(366, 49, 'Coat Checking', 'Dawn Gill', 'dms1008@lhup.edu', 'I worked in the admissions building as a coat checker', '2017-02-10 19:00:00', '2.0', 2),
(367, 32, 'A-team Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'morning and afternoon session', '2017-03-04 08:30:00', '2.0', 2),
(368, 209, 'Moosis Head Start', 'Joyce Urso', '570-955-7259', 'Worked with the kids and helped clean up the center.', '2017-03-17 00:00:00', '5.0', 2),
(369, 23, 'Matriculated Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'I worked the Matriculated Open House on March 8', '2017-03-08 18:00:00', '1.0', 2),
(370, 59, 'Matriculated Open House', 'Shelby Helwig', 'honors@lhup.edu', 'I met with students that were interested in the Global Honors Program for A-team. I answered any questions that they had about the program.', '2017-03-08 18:00:00', '1.0', 2),
(371, 126, 'Saints Peter & Paul Fish Fry', 'Dawna Miocic', '412-496-1272', 'I helped cook food on Thursday (3-6) and assisted wherever needed on Friday night (2-8) for the Lenten fish fry at my church.', '2017-03-16 15:00:00', '9.0', 2),
(372, 40, 'LHU Bingo', 'Pat Rudy', 'prudy@lhup.edu', 'Helped run a fundraiser for LHU women sports', '2017-02-11 09:00:00', '7.0', 2),
(373, 40, 'LHU Women in Sports Day', 'Pat Rudy', 'prudy@lhup.edu', 'Helped young women athlete experiment with different sports.', '2017-02-22 15:00:00', '4.0', 2),
(374, 116, 'Lend A Hand Clinic', 'Linda Kreiser', '7173034997', 'Designed artwork and layout for Lend A Hand Clinic. The Lend a Hand Clinic is a field hockey clinic for girls of all ages held at my hometown high school. All funds donated and raised from the clinic goes to the cancer recognized at the event. Each year a cancer survivor from the community is chosen to be recognized.', '2017-03-16 09:00:00', '2.0', 2),
(375, 183, 'Salvation Army Soup Kitchen', 'John Gradel - Phi Beta Delta Supervisor', 'jrg5874@lhup.edu', 'With Phi Beta Delta, I helped serve food to those in need, as well as clean up after lunch. It was a humbling experience, realizing just how many people are in need in our own area. I am glad that I was able to be a part of this effort, and will continue to support the Salvation Army in my remaining hours to complete.', '2017-03-22 00:00:00', '1.0', 2),
(376, 33, 'CIU #10 National History Day Competition', 'Edd Brady--HR director', '814-592-4060', 'Volunteered with the Central Intermediate Unit #10 to put on a natural history day competition for jr.  and sr. high school students from the surrounding school districts.', '2017-02-18 09:00:00', '7.0', 2),
(377, 217, 'Open House, Morning session', 'Shelby Helwig', 'Honorsprogram@Lhup.edu', 'Participating in the Morning Session of the open house with A-Team', '2017-02-25 08:30:00', '1.0', 2),
(378, 125, 'Youth Group Leading', 'Ashley Stensland', 'joyhopefaithlove@comcast.net', 'I helped lead at my youth church\'s group on Sunday evening.', '2017-03-19 17:30:00', '2.0', 2),
(379, 10, 'Open House', 'Shelby Helwig', '717-650-8904', 'A-team', '2017-03-04 08:00:00', '2.0', 2),
(380, 12, 'Big Brothers Big Sisters Training', 'Clarissa Shirk', 'BBBS@ClintonCountyPA.com', 'watched a training video and filled out a packet, learning about how to handle certain situations with your Little', '2017-03-21 17:30:00', '2.0', 2),
(381, 21, 'Alternative Spring Break Trip', 'Sarah Landro', 'sml4019@lockhaven.edu', 'We spent spring break in Roanoke, Virginia, working with various organizations in the community, for example, after-school programs, animal shelters, construction sites, etc.', '2017-03-12 08:00:00', '40.0', 2),
(382, 13, 'Shoe Bank', 'Carla Bailey', 'nto10@outlook.com', 'helped in the behind the scenes portion of the Mansfield Area Shoe Bank', '2017-03-13 13:00:00', '5.0', 2),
(383, 98, 'Phi Beta Delta Salvation Army Soup Kitchen Vol.', 'Sam Gilbert', 'sjg9378@lhup.edu', 'Volunteered as a member of Phi Beta Delta to help run a soup kitchen at the Salvation Army in Lock Haven.', '2017-03-22 23:30:00', '2.0', 2),
(384, 151, 'Relay for Life', 'Rachael Metzinger', 'rxm2509@lockhaven.edu', 'I went to Relay for Life.', '2017-03-31 18:00:00', '4.0', 2),
(385, 116, 'Relay for Life', 'Rachael Metzinger', '717-649-1681', 'Helped set up and participated in activities of the night', '2017-03-31 17:00:00', '4.0', 2),
(386, 31, 'Relay for Life', 'Rachael Metzinger', 'Rachael Metzinger', 'Hanging out at relay for life at the GHP table', '2017-03-31 18:00:00', '4.0', 2),
(387, 165, 'Glenn Road Cleanup', 'Robert Myers', 'rmyers3@lhup.edu', 'Walked the length of Glenn Road picking up any trash found alongside the road', '2017-03-27 17:30:00', '1.0', 2),
(388, 165, 'Park Day', 'Dave Wallace', 'davewallace@verizon.net', 'Reset headstones at the Highland Cemetery behind Bentley Hall.', '2017-04-01 09:00:00', '4.0', 2),
(389, 85, 'Highland Cemetery Clean-Up', 'Dave Wallace', 'davewallace56@verizon.net', 'During my volunteer hours at the Highland cemetery, I helped clear away leaves and trash from tombstones.', '2017-04-01 09:00:00', '5.0', 2),
(390, 36, 'Relay for Life', 'Rachael Metzinger', 'Rachael Metzinger', 'Attended relay for life and participated in the events being held to raise money for cancer.', '2017-03-31 18:00:00', '4.0', 2),
(391, 28, 'Relay for Life', 'Robert Pietrzyc', 'rxp1756@lhup.edu', '4 hours at Relay for life, walking,', '2017-03-31 18:00:00', '4.0', 2),
(392, 32, 'Relay for Life', 'Rachael Metzinger', 'honors_program@lockhaven.edu', 'participated as part of the Global Honors Team', '2017-03-31 18:00:00', '4.0', 2),
(393, 28, 'Boxing Set up', 'Johhny Fiorill', 'jaf6055@lhup.edu', 'Set up intramural boxing wring with Alpha sigma Phi', '2017-03-24 18:00:00', '3.0', 2),
(394, 122, 'Relay For Life', 'Rachael Metzinger', 'honors_program@lockhaven.edu', 'Participated in the Global Honors Program group during Relay for Life and helped to raise money towards cancer research.', '2017-03-31 18:00:00', '4.0', 2),
(395, 122, 'Highland Cemetery\'s Park Day Clean up 2017', 'Dave Wallace', 'davewallace56@verizon.net', 'Assisted in the clean up of the cemetery behind Bentley Hall (reset tombstones, rake, pick up sticks, etc.)', '2017-04-01 09:00:00', '7.0', 2),
(396, 143, 'Relay for Life', 'Colleges Against Cancer Member Hannah Zerbe', 'hlz142@lhup.edu', 'Participated in Lock Haven University\'s Relay for Life', '2017-03-31 18:00:00', '4.0', 2),
(397, 43, 'Relay for life', 'Rachael metzinger', 'honors_program@lockhaven.edu', 'worked at the pre-med game table', '2017-03-31 18:00:00', '4.0', 2),
(398, 24, 'Relay For Life', 'Olivia Bellomo', 'otb1090@lhup.edu', 'I volunteered at the American Red Cross table at the Relay for Life event on March 31st into April 1st.', '2017-03-31 18:00:00', '7.0', 2),
(399, 46, 'Relay for Life', 'Rachael Metzinger', 'rxm2509@lockhaven.edu', 'I attended Relay under the Honors team and was present at the table as well as helped walk the track.', '2017-03-31 18:00:00', '4.0', 2),
(400, 44, 'Relay for Life', 'Rachael Metzinger', 'rxm2509@lhup.edu', 'Relay for Life was an all night event that helped raise money for cancer research.', '2017-03-31 18:00:00', '4.0', 2),
(401, 142, 'Hoof Beats 4-H Tack Sale', 'Lisa Snavely', '(570) 484-1907', 'A tack and food sale/auction sponsored by the Hoof Beats 4-H club where it is open to the community to gather tack and accessories for their horse(s) as well as a food auction ranging from bread, pie crusts, and chips. My job was to help load and unload the merchandise and keep things organized.', '2017-03-11 10:00:00', '6.0', 2),
(402, 91, 'Relay for Life', 'Rachael Metzinger', 'rxm2509@lockhaven.edu', 'I went to relay for life to raise money for cancer', '2017-03-31 18:00:00', '4.0', 2),
(403, 73, 'Relay', 'Rachael Metzinger', 'rxm2509@lhup.edu', 'Relay for Life helps raise money for the American Cancer Society. Throughout the night I helped donate to the organization and helped those who have lost someone to cancer.', '2017-03-03 18:00:00', '4.0', 2),
(404, 72, 'Relay For Life', 'Rachael  Metzinger', 'Rachael Metzinger', 'Helped out with relay for life at Lock Haven University', '2017-03-31 19:29:00', '2.0', 2),
(405, 58, 'Relay For Life', 'Rachael Metzinger', 'rxm2509@lockhaven.edu', 'Helped raise money for cancer as part of the Global Honors Program Relay team.', '2017-03-31 18:00:00', '4.0', 2),
(406, 180, 'Relay For Life', 'Rachel Metzinger', 'rxm2509@lockhaven.edu', 'I attended Relay for Life, as I do every year, because it is a fun way to commemorate those who have passed, or are battling cancer, and support future research/events at LHU. I took my roommate\'s spot because she ended up not being able to attend, so I got to spend some time at Love Your Melon\'s Table, which supports pediatric cancer. I then walked around the track (3 miles according to my FitBit!) with friends, played games, watched girls donate their hair, and had an overall great time!', '2017-03-31 18:30:00', '4.0', 2),
(407, 63, 'Realy for Life', 'Mary Beth Ruggerio, Team Captain', 'mbr6609@lockhaven.edu', 'I attended relay for life with University Players starting at the beginning of the relay and staying until four in the morning.', '2017-03-31 18:00:00', '4.0', 2),
(408, 63, 'Helping in the scene shop', 'Ramona Broomer', 'rbroomer@lockhaven.edu', 'I helped build the set for University Player\'s upcoming production One Slight Hitch. This consisted of painting, spackling, etc.', '2017-03-26 14:00:00', '3.0', 2),
(409, 45, 'Relay for Life', 'Rachael Metzinger', 'rxm2509@lhup.edu', 'I helped sell temporary tattoos at the table for money going towards the American Cancer Society.', '2017-03-31 18:00:00', '4.0', 2),
(410, 61, 'Endometriosis Walk', 'Jenn Meanor', '570 660 7744', 'I had helped a member of my church set up for, and I worked the face painting booth at an End Endometriosis Walk that she organized.', '2017-04-01 10:00:00', '4.0', 2),
(411, 205, 'Relay for Life', 'Jaimie Holsinger', '814-321-4887', 'Attended Relay for Life and volunteered with the \"Love Your Melon\" crew', '2017-03-31 18:00:00', '4.0', 2),
(412, 12, 'Relay for Life', 'Justin Silverstrim (?)', '(570) 447-9395', 'Spent hours kicking cancer\'s butt.', '2017-03-31 18:00:00', '4.0', 2),
(413, 9, 'Blood Donation', 'Olivia Bellomo', 'otb1050@lockhaven.edu', 'I donated blood during the Blood Drive in September', '2016-09-14 00:00:00', '1.0', 2),
(414, 9, 'Blood Donation', 'Olivia Bellomo', 'otb1050@lockhaven.edu', 'I donated blood during the Blood Drive in December', '2016-12-01 00:00:00', '1.0', 2),
(415, 206, 'CIU Development Center for Adults', 'Theresa Miller', 'tmiller@ciu10.org', 'I acted as a tutor for adults pursuing their GEDs. Various subjects were covered as needed. Performed 2 hours of service per week every Wednesday since mid-February to today with the exception of Spring Break.', '2017-02-15 00:00:00', '10.0', 2),
(416, 9, 'Canned Food Drive', 'Chadd Miller', 'cwm4143@lockhaven.edu', 'We donated food cans and earned community service hours', '2016-11-21 00:00:00', '2.0', 2),
(417, 9, 'Smoke Alarm Installation', 'Olivia Bellomo', 'otb1050@lockhaven.edu', 'I when and travelled with the American Red Cross Club around town and installed smoke alarms in peoples houses', '2016-10-14 00:00:00', '5.0', 2),
(418, 9, 'Relay for Life', 'Rachael Metzinger', 'honors_program@lockhaven.edu', 'I participated in relay for life', '2017-03-31 00:00:00', '2.0', 2),
(419, 18, 'Relay For Life', 'Shelby', 'honors@lhup.edu', 'Participated in Relay for Life with the Recreation Therapy Team.', '2017-03-31 19:00:00', '4.0', 2),
(420, 30, 'Relay For Life', 'Landon Allen', '717-466-4539', 'Volunteered at the Pre-Med Table and the Dance Consort Table helping with the games and activities and taking money which we then turned in to the Relay helpers.', '2017-03-31 18:00:00', '12.0', 2),
(421, 155, 'Circle K Interational', 'Jessica Tressa', '5708810748', 'Throughout four days, I completed over thirty hours of community service. CKI is the largest student led collegiate service organization, and this weekend\'s convention was  dedicated to service. We all worked together to put activities for kids to do in the hospital, and also put together dog toys for near by animal shelters. These activities for the convention totaled around 400 individual community service projects for the weekend.', '2017-03-23 18:00:00', '20.0', 2),
(422, 119, 'Northeast Region Order of the Arrow (BSA)', 'Bob Black', 'cyberkdet', 'Over the past year, I have served during a number of national and regional events with the BSA. Including travelling as a trainer to various leadership seminars, one of which was even held in Munich, Germany.', '2016-09-01 12:00:00', '10.0', 2),
(423, 100, 'Open House', 'Shelby Helwig', 'honors_program@lockhaven.edu', 'At the open house on 3/8/17, I talked to several students interested in attending LHU about the middle-level education major, as well as the global honors program. Having some GHP students seated at their major\'s table was a new idea formed by the GHP\'s A-Team and it turned out to work very well!', '2017-04-08 08:00:00', '2.0', 2),
(424, 69, 'CleanScape Cleanup', 'Morgan Capobianco', 'mpc7999@lockhaven.edu', 'Cleaned up trash along Young Woman\'s Creek', '2017-04-08 09:15:00', '3.0', 2),
(425, 23, 'Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'I worked the spring open house on April 8, 2017.', '2017-04-08 09:00:00', '2.0', 2),
(426, 54, 'Bunny Hop', 'Katie Krasinski', '570-789-0374', 'I helped work the registration and then help run the race by directing runners.', '2017-04-09 10:00:00', '2.0', 2),
(427, 28, 'Open House Tour Guide', 'Caitlyn Kovach', 'cmk7844@lhup.edu', 'Volunteer Tour Guide', '2017-04-08 10:00:00', '4.0', 2),
(428, 50, 'Stars & Stripes Conference', 'Taylor Landis- Project Manager', '570-428-4826', 'Helped set up for the event, and assisted in taking photos.', '2017-04-08 08:00:00', '3.0', 2),
(429, 50, 'Celtic Canter Race', 'Shelly Fulton', 'westminstermimi@gmail.com', 'Served as a road assistant for the race, and helped clean up the event.', '2017-03-11 09:00:00', '1.0', 2),
(430, 25, 'Open House', 'Shelby Helwig', 'sth1064@lockhaven.edu', 'Worked with the admissions team at the open house', '2017-04-08 08:15:00', '1.0', 2),
(431, 53, 'open house', 'Rachel Metzinger', 'Rachel', 'attended the second part of the open house for interviews', '2017-04-08 00:00:00', '1.0', 2),
(432, 40, 'LHU Girls LAX Ballgirl', 'Pat Rudy', 'prudy@lhup.edu', 'Helped the lacrosse game run smoothly by providing balls to the teams', '2017-03-23 16:00:00', '2.0', 2),
(433, 102, 'Open House', 'Rachael Metzinger', 'honors_program@lhup.edu', 'I attended the morning session of the Open House, handed out fliers and talked to prospective students about the GHP.', '2017-04-08 08:00:00', '1.0', 2),
(434, 59, 'A-Team Open House', 'Shelby Helwig', 'honors@lhup.edu', 'I helped out at the open house. I sat at the Biology table and informed students about the honors program and also gave them information about the Biology department. I also conducted interviews in the afternoon session.', '2017-04-08 08:00:00', '2.0', 2),
(435, 80, 'Feeding at Horses of Hope', 'Esther Duck', '(570) 502-4164', 'Tuesdays at horses of hope I help a fellow volunteer feed and water the horses, along with other tasks such as mucking the stalls and pastures, reading each horses feed for the next feeder, and occasionally exercising the horses. (the hours were completed over two Tuesdays 3/28 and 4/4 from 4:00pm to 6:30pm)', '2017-03-28 16:00:00', '5.0', 2),
(436, 163, 'Relay for Life', 'Jaimie Holsinger', 'jlh8167@lockhaven.edu', 'Participated in raising money and awareness for cancer victims/survivors by being part of the Health Science Club/Love Your Melon team at Relay for Life.', '2017-03-31 19:00:00', '1.0', 2),
(437, 120, 'Children\'s Christmas Party', 'Sheila Kyle', '814-359-3441', 'For the Christmas party I gathered 10 Christmas books and set up in a small office. I dressed up as Mrs. Claus and would read stories to the children and their families as they were rotating throughout the different stations. I had a great time with this event as it kept me involved with the children allowed me to work with them which is also related to my major. It was so much fun interacting with the children about the stories and answering their questions related to Santa Claus.', '2016-12-10 10:00:00', '4.0', 2),
(438, 10, 'Relay for Life', 'Olivia Bellomo', '570-419-9026', 'I attended LHU\'s Relay for Life as a member of the Red Cross club. We raised money for the American Cancer Society for cancer research. At the Red Cross table, we painted faces.', '2017-03-31 18:00:00', '4.0', 2),
(439, 10, 'Open House', 'Rachael Metzinger', 'honors_program@lockhaven.edu', 'I attended the Open house as a member of A-team.', '2017-04-08 00:00:00', '2.0', 2),
(440, 24, 'American Red Cross Blood Drive', 'Olivia Bellomo', 'otb1090@lhp.edu', 'I volunteered at the food and rink table during the blood drive.', '2017-04-11 04:15:00', '2.0', 2),
(441, 69, 'American Red Cross Blood drive', 'Olivia Bellomo', 'otb1090@lhup.edu', 'served donors and restocked the food table', '2017-04-11 13:15:00', '2.0', 2),
(442, 113, 'Relay for Life', 'Rachael Metzinger', 'rxm2509@lhup.edu', 'I participated in Relay for Life with the Alpha Rho chapter of Sigma Sigma Sigma at Lock Haven University. I helped to raise money and I participated in the activities of the evening. I walked for an hour on the track as well.', '2017-03-31 18:00:00', '4.0', 2),
(443, 177, 'Canine Area of Central PA', 'Connie, Doris', 'wonder.connie@gmail.com , mllrkandd@aol.com , (717) 232-1644', 'On Saturday, April 8th, I volunteered at the Canine Area of Central PA from 8:00 AM to 3:00 PM where I was responsible for taking the dogs for walks, feeding the dogs, and cleaning out the runs.  The dogs loved the company I gave them, but the workers here appreciated my work much more.  I enjoyed meeting all the adorable rescue dogs, but I also enjoyed helping out in the community and volunteering my time to a place that desperately needed it.', '2017-04-08 08:00:00', '7.0', 2),
(444, 60, 'Relay for Life', 'Joe Visceglia', '+1 (570) 807-4032', 'Stayed the full 12 hours at relay for life running the GHP table and running a Zumba session.', '2017-03-31 00:00:00', '4.0', 2),
(445, 100, 'LHU Math Competition', 'Dr. Denine Simin', 'dcs719@lhup.edu', 'This was the 9th annual math competition held by LHU for various high school students. At this competition I aided in the registration of teams, the proctoring of the group exams and the individual exams, as well as helped things run smoothly during the awards ceremony', '2017-04-11 08:00:00', '5.0', 2),
(446, 102, 'Math Competition', 'Dr. Denine Simin', 'dcs719@lhup.edu', 'I helped run the Math Competition for high school students at the PUB. I helped in registering students, giving the tests, and ensuring the students had an enjoyable experience.', '2017-04-11 08:00:00', '5.0', 2),
(447, 203, 'Relay for Life', 'McKinley Lingham', 'mlingham@lockhaven.edu', 'Dance Consort team had a \"Just Dance\" booth to raise money towards cancer research', '2017-03-31 18:00:00', '4.0', 2),
(448, 217, 'A-Team Open House, Morning session', 'Shelby Helwig', 'Honors@lhup.edu', '--', '2017-04-08 08:15:00', '1.0', 2),
(449, 183, 'Salvation Army', 'Deb Shmeltz', '570-748-8854', 'Over the past two weeks, I have been volunteering at the  Salvation Army downtown. My primary job is to help sort clothing donations, but I also assist with pricing and placing items on the floor for sale. I\'m having trouble getting the date/time function to work on this site. I volunteered 4/3, 4/5, and 4/12 for 2 hours each day.', '2017-04-03 00:00:00', '6.0', 2),
(450, 176, 'Salvation Army', 'Deb Smeltz', '(570) 748-2951', 'Helped sort through donated clothes.', '2017-04-12 13:00:00', '2.0', 2),
(451, 95, 'Relay for Life', 'Colleen Eccles', 'cge8305@lhup.edu', 'I participated in Relay for Life as a part of the staff from Colleges Against Cancer.', '2017-03-31 18:00:00', '4.0', 2),
(452, 95, 'Colleges Against Cancer', 'Colleen Eccles', 'cge8305@lhup.edu', 'I tabled to raise money for and support the American Cancer Society in preparation for our yearly Relay for Life event.', '2017-03-28 11:00:00', '2.0', 2),
(453, 205, 'Student Government Campus Cleanup', 'Morgan Bailey', 'mab4793@lockhaven.edu', 'Organized and set-up the campus wide clean-up as the Vice President of Student Government.', '2017-04-13 16:00:00', '2.0', 2),
(454, 44, 'Campus Clean Up', 'Morgan Beatty', 'mrb8018@lockhaven.edu', 'Walk around the campus and pick up any trash lying on the ground.', '2017-04-13 16:00:00', '2.0', 2),
(455, 150, 'Campus Clean-up', 'Courtney Chamberlin', '814-935-8684', 'Walked around campus and picked up trash.', '2017-04-13 16:00:00', '2.0', 2),
(456, 126, 'Red Cross Blood Drive', 'Red Cross', '(570) 326-9131', 'I donated blood to help up to three people!', '2017-04-12 12:30:00', '1.0', 2),
(457, 151, 'Mental Health Awareness Walk', 'Rachael Metzinger', 'rxm2509@lockhaven.edu', 'I attended a Mental Health Awareness Walk that was run by LHU Psych Club.', '2017-04-13 00:00:00', '2.0', 2),
(458, 156, 'REACH Alternative Spring Break with Outreach Club', 'Sarah Landro', 'sml4019@lhup.edu', 'This spring break, I traveled with 17 other LHU students to Roanoke, VA to work the the REACH program in there community service efforts for community members and the city in general. We worked on demolishing an abandoned house so that it could be built back up for later use. We also helped out at 2 after-school programs, volunteered at an animal shelter and a food bank, and helped serve meals at the community center, as well as much more. It was a tremendously powerful & eye-opening experience!', '2017-03-12 16:00:00', '45.0', 2),
(459, 122, 'Campus Clean-up', 'Morgan Bailey', 'mab4793@lhup.edu', 'Student Government planned a Campus Clean-up which involved picking up trash around campus.', '2017-04-13 16:00:00', '2.0', 2);
INSERT INTO `SP17_com_serv` (`com_id`, `pstu_id`, `com_title`, `com_advisor`, `com_advisor_contact`, `com_description`, `com_date`, `com_hours`, `com_verified`) VALUES
(460, 201, 'PSSA Imovie', 'Kim Walter', 'kwalter@wasd.org', 'I attended an in-service at Williamsport School District at Stevens Elementary school. While at the in-service I recorded the faculty of the school singing a song and performing a dance to the song Uptown Funk. After organizing the teachers and filming I then uploaded the videos to create a iMovie for the third grade class to excite them for the PSSA\'s. There was then an assembly inviting the entire school where the video was displayed for them to watch.', '2017-04-13 08:00:00', '2.0', 2),
(461, 45, 'Mental Health Walk', 'Shelby Helwig', 'sth1064@lhup.edu', 'We walked in support of fundraising for mental health awareness on the dike.', '2017-04-13 17:30:00', '1.0', 2),
(462, 35, 'Math Competition Service', 'Denine Simin', 'dcs719@lockhaven.edu', 'Volunteered to help check in/ run/ administer the 9th annual math competition done by our math department.', '2017-04-11 08:00:00', '6.0', 2),
(463, 163, 'Student Government Board Campus Clean Up', 'Jodi Smith', 'jsmith11@lockhaven.edu', 'Organized, set up, and participated in a campus clean up picking trash off the ground outside as an officer of Student Government Board.', '2017-04-13 16:00:00', '2.0', 2),
(464, 211, 'Teaching Volunteer', 'Candy Wagner', 'cwagner@embarqmail.com', 'I participated and aided in the education of fourth grade students at Fairfield Elementary School (focusing on editing and revising writing).', '2017-03-14 08:00:00', '7.0', 2),
(465, 33, 'Blood Drive', 'Olivia Bellomo', 'otb1090@lhup.edu', 'volunteer at the blood drive for RCC.', '2017-04-11 15:00:00', '4.0', 2),
(466, 207, 'Relay For Life', 'Jaimie Holsinger', 'kmk5425@lockhaven.edu', 'Attended Relay for Life with LHU\'s LYM crew. Took part in the Relay for Life event, as well as raising money for Relay.', '2017-03-31 17:30:00', '4.0', 2),
(467, 125, 'Heartworks', 'Linda Bryant', 'bryant.linda@comcast.net', 'I work with other volunteers to help a small group of kindergarteners/first graders who have lost a parent build friendships with each other. It\'s a peer support group for them. We plan activities around helping them to process how their feeling about their loss.', '2017-04-11 17:00:00', '3.0', 2),
(468, 97, 'SPCA work', 'Howell', 'chowell@lhup.edu', 'I walk and socialize the dogs at the SPCA for about 2-3 hours a week throughout the whole semester', '2017-01-23 00:00:00', '30.0', 2),
(469, 83, 'Women in sports day', 'Shannon Gerencir', 'slg945@lhup.edu', 'Helped teach young girls about volleyball and how to play it to promote their participation in athletics', '2017-03-22 15:30:00', '2.0', 2),
(470, 83, 'Soup kitchen', 'Sam Gilbert', 'sjg9378@lhup.edu', 'Helped prepare and serve food to Lock Haven community members in need for Phi Beta Delta', '2017-03-22 11:30:00', '3.0', 2),
(471, 83, 'Band competition concessions', 'Shannon Gerencir', 'slg945@lhup.edu', 'Served food at Thomas Field house for a local band competition for the volleyball team', '2017-03-25 12:00:00', '4.0', 2),
(472, 83, 'Lock Haven men\'s volleyball tournament', 'Shannon Gerencir', 'slg945@lhup.edu', 'Was a line judge for the men\'s club team in their tournament.', '2017-04-01 12:00:00', '3.0', 2),
(473, 124, 'Research Assistant', 'Sara Galbrath', '814-221-6123', 'I volunteered to help Sara Galbraith complete her research for her Environmental Studies capstone. The research was measuring individuals heart rates and perceived exertion and mood while running inside and out in the woods. I stood out in the woods and recorded the participants stats.', '2017-03-27 12:00:00', '10.0', 2),
(474, 112, 'Bench Making at the Sieg Center', 'Daniel Hackmeister', 'drh202@lhup.edu', 'Campfire benches were made by hand from a tree that had fallen across the driveway at the Seig center. The benches will be used by any club that goes to the Sieg center.', '2017-02-18 09:00:00', '10.0', 2),
(475, 180, 'Campus Cleanup', 'Abby Shaffer and Morgan Bailey (SG Co-Presidents)', '(814) 421-8488; (814) 227-9929', 'I attended the campus cleanup hosted by Student Government on Thursday, April 13th. We walked around campus in groups and cleaned up trash in the grass, and along the sidewalks. Keeping LHU beautiful! :)', '2017-04-13 16:00:00', '2.0', 2),
(476, 36, 'Bunny Dash Race', 'Darla Biauce', '8147368517', 'I volunteered to help out with the Annual Bunny Dash Race back at home the day before Easter. I ensured the runners were going in the right direction and assisted the coordinators in anything else that they needed.', '2017-04-15 08:00:00', '1.0', 2),
(477, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Kathy Deavor', '(570) 295-7109', 'I teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2017-02-22 17:30:00', '2.0', 2),
(478, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Kathy Deavor', '(570) 295-7109', 'I teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2017-03-01 17:30:00', '2.0', 2),
(479, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Kathy Deavor', '(570) 295-7109', 'I teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2017-03-08 17:30:00', '2.0', 2),
(480, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Kathy Deavor', '(570) 295-7109', 'I teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2017-03-29 17:30:00', '2.0', 2),
(481, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Kathy Deavor', '(570) 295-7109', 'I teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2017-04-05 17:30:00', '2.0', 2),
(482, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Kathy Deavor', '(570) 295-7109', 'I teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2017-04-12 17:30:00', '2.0', 2),
(483, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Kathy Deavor', '(570) 295-7109', 'I teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2017-04-19 17:30:00', '2.0', 2),
(484, 222, '5k race prep', 'Felicity Cowfer', '814-577-3712', 'Preparation for an upcoming 5k race that benefits a nonprofit organization.', '2017-04-10 08:00:00', '1.0', 2),
(485, 222, '5k race prep', 'Felicity Cowfer', '814-577-3712', 'Preparation for an upcoming 5k race that benefits a nonprofit organization.', '2017-04-15 13:00:00', '3.0', 2),
(486, 165, 'Earth Day Festival', 'Heather Porter', 'hjp9573@lhup.edu', 'Event celebrating Earth Day held in one of the pavilions on the campus green space near the library with themed gifts and events for people who stopped by', '2017-04-20 12:00:00', '3.0', 2),
(487, 96, 'SPSEA Egg Hunt Preparation', 'Abigail Storrs', 'ams4900@lhup.edu', 'Helped stuff eggs for the SPSEA Egg Hunt for local children.', '2017-04-11 18:00:00', '1.0', 2),
(488, 17, 'Mill Hall AYSO Youth Clinic', 'Patrick Long', '570-660-2093', 'Helped run a soccer station at the free clinic for Mill Hall AYSO kids', '2017-04-19 16:45:00', '3.0', 2),
(489, 24, 'American Red Cross Blood Drive', 'Lauren Wright', 'law3363@lhup.edu', 'I volunteered at the Red Cross Blood Drive working the refreshments table and the registration table.', '2017-04-12 14:00:00', '5.0', 2),
(490, 23, 'Children\'s Festival', 'Lauren Wright', 'law3363@lockhaven.edu', 'I helped set up at the Children\'s Festival at the Rec Center.', '2017-04-23 10:30:00', '2.0', 2),
(491, 106, 'Lock Haven SPCA', 'Christi', '570-748-4756', 'spent time playing with the dogs and the cats at the animal shelter', '2017-04-08 13:00:00', '3.0', 2),
(492, 106, 'Lock Haven SPCA', 'Christi', '570-748-4756', 'played with the dogs and cats at the shelter', '2017-04-23 00:00:00', '2.0', 2),
(493, 85, 'LHU Children\'s Festival', 'Lauren Wright', 'law3363@lhup.edu', 'At the LHU Children\'s Festival, I worked at our local recreation center to set up for the festival and helped out with the various stands including first aid, face painting, and greeting/directing', '2017-04-23 10:30:00', '4.0', 2),
(494, 150, 'Greenhouse Clean-up', 'Dr. Calabrese', 'JCalabre@lockhaven.edu', 'Helped clean out Dr. Calabrese\'s greenhouse.', '2017-04-23 12:30:00', '3.0', 2),
(495, 165, 'Children\'s Festival/Biology Club\'s Earth Day', 'Dr. Heather Bechtold', 'hab206@lhup.edu', 'I manned one of the tables for the biology club and monitored kids who came to play in the \"oobleck\" pool at the table to make sure they didn\'t hurt themselves or someone else and to try to keep the mess to a minimum', '2017-04-23 10:30:00', '5.0', 2),
(496, 24, 'Children\'s Festival', 'Lauren Wright', 'law3363@lockhaven.edu', 'I helped set up and tear down for the Children\'s Fesitval.', '2017-04-23 10:25:00', '6.0', 2),
(497, 24, 'Accepted Student\'s Day', 'Olivia Bellomo', 'otb1090@lockhaven.edu', 'I help run the Red Cross activity on Accepted Student Day', '2017-04-22 11:30:00', '2.0', 2),
(498, 46, 'Children\'s Festival', 'Lauren Wright', 'law3363@lhup.edu', 'I helped with the setup of the tables in the rec center, then helped sit a table and engage children in board games, and finally helped tear down at the end of the event.', '2017-04-23 10:30:00', '5.0', 2),
(499, 163, 'Children\'s Carnival Volunteer', 'Lauren Wright', 'law3363@lockhaven.eduÂ ', 'I volunteered at a cotton candy booth for the kids, where we also gave them the opportunity to learn their names in sign language.  I also helped tear down all the tables and chairs after the carnival was over.', '2017-04-23 15:15:00', '1.0', 2),
(500, 207, 'Raising money for Local teen battling cancer', 'Kierstan Kerstetter', 'kmk5425@lhup.edu', 'LHU\'s LYM crew was raising money for a local teen that has been battling cancer and has acquired a large amount of medical expenses. She recently got the news that she is cancer free, and will be attending LHU next year. Our crew raised about $1,700 for her family', '2017-04-12 12:00:00', '3.0', 2),
(501, 209, 'Children\'s festival', 'Lauren Wright', 'lau3363@lockhaven.edu', 'Helped write thank you notes, set up and did face painting for the kids during the event. Was also there early to help set up.', '2017-04-23 10:30:00', '5.0', 2),
(502, 50, 'LHU women\'s softball game', 'Danielle Barney', 'dbarney@lhup.edu', 'Helped collect fly balls throughout the course of the game, and was responsible for distributing prizes each time the team recorded a hit.', '2017-04-21 14:15:00', '2.0', 2),
(503, 18, 'Lock Haven Track and Field High School Meet', 'Aaron Russell', 'arussell@lhup.edu', 'I worked/volunteered at the High School track meet at Lock Haven.', '2017-04-21 15:00:00', '5.0', 2),
(504, 30, 'American Red Cross Blood Drive', 'Olivia Bellomo', 'otb1090@lockhaven.edu', 'I helped to hand out snacks and drinks to the people who had just given blood, along with helping set up and as needed throughout the time I spent there.', '2017-04-11 00:00:00', '2.0', 2),
(505, 58, 'Childrens Fair', 'Lauren Wright', 'law3363@lockhaven.edu', 'I helped set up for the children\'s fair, which included arranging tables/ chairs, organizing activities, and making signs. I also stayed at the fair all day and worked the snack/ first aid table.', '2017-04-23 10:00:00', '6.0', 2),
(506, 168, 'Relay for Life', 'Elizabeth Youshock', 'ejy973@lhup.edu', 'As a band, we participated in the University\'s annual Relay for Life. We give up a night of our time to support those who are still fighting or who have lost their lives to cancer.', '2017-04-08 18:00:00', '4.0', 2),
(507, 168, 'TIA Competition', 'Seth Wollam', 'sfw332@lhup.edu', 'The University band hosted a TIA indoor competition for area competition groups. We were required that all groups knew where they needed to be.', '2017-04-01 09:00:00', '6.0', 2),
(508, 110, 'Children\'s Fest', 'John Gradel', 'jrg5874@lockhaven.edu', 'My club had a table at the Children\'s Fest where we helped kids make paper hats, origami hearts and origami ninja stars.', '2017-04-23 13:00:00', '3.0', 2),
(509, 135, 'Salvation Army Thrift Store', 'Deb Smeltz', 'smeltz4@comcast.net', 'This was my first time volunteering with the Salvation Army. The store manager showed me around then had me help straighten up the store, and put new incoming merchandise away.', '2017-04-19 11:00:00', '3.0', 2),
(510, 135, 'Salvation Army Thrift Store', 'Deb Smeltz', 'smeltz4@comcast.net', 'First I came in and helped straighten up the store, rehanging disheveled clothes, straightening racks, and organizing toys, books, dvds, etc. Then I did some light cleaning while the store was not busy. When costumers picked up I assisted staff to wrap, and bag merchandise.', '2017-04-21 11:00:00', '2.0', 2),
(511, 135, 'Salvation Army Thrift Store', 'Deb Smeltz', 'smeltz4@comcast.net', 'Today I mainly helped straighten the store up for the first hour or so. Then I went to the back to sweep and vacuum their storage and sorting area. Then for the last hour myself and other volunteers put away new merchandise the store received.', '2017-04-26 11:00:00', '3.0', 2),
(512, 182, 'SAS Board of Directors Secretary/Treasurer', 'Jodi Smith', 'jsmith11@lhup.edu', 'During the 2016-2017 year, I served as a student volunteer on the SAS Board of directors. I spent 30 minutes each week reviewing the budget of clubs and organizations and approving funding requests (working closely with Stacey Davis and Jodi Smith). The SAS office works hard to fairly distribute and approve budgets and they like to have students involved. I also represented LHU student body at 8 board meetings this year: August, September, October, November, January, February, March, and April.', '2016-08-30 14:00:00', '24.0', 2),
(513, 13, 'Relay for Life', 'Jacob Spickler', 'jbs5704@lhup.edu', 'For the American Red Cross Club, I helped run a face painting station.', '2017-03-31 17:30:00', '5.0', 2),
(514, 121, 'Church Clean Up', 'Ebunoluwa Adewumi', '814-404-6524', 'I assisted with an all-day church clean up on a Saturday doing various things like cleaning up the yard, picking up trash, painting, etc.', '2017-04-15 08:00:00', '10.0', 2),
(515, 222, '5k Race', 'Felicity Cowfer', '814-577-3712', 'Conducted a 5k, helped runners and walkers register for the race and set up/clean up', '2017-04-22 08:30:00', '3.0', 2),
(516, 127, 'Relay For Life', 'Rachael Metzinger', 'honors@lhup.edu', 'Participated as part of the Honors Relay for Life Team', '2017-03-31 18:00:00', '4.0', 2),
(517, 127, 'Open House', 'Shelby', 'honors@lhup.edu', 'Worked as part of A-team for Honors', '2017-03-04 08:00:00', '3.0', 2),
(518, 127, 'Open House', 'Shelby', 'honors@lhup.edu', 'Worked on A-team at open house', '2017-04-08 08:00:00', '3.0', 2),
(519, 127, 'Luncheon', 'Shelby', 'honors@lhup.edu', 'Worked on A-team at recruitment luncheon', '2017-02-25 09:00:00', '3.0', 2),
(520, 127, 'Tutoring', 'Teresa Lombardi', 'lombo21@comcast.net', 'Tutored students in math and reading over spring break (please note, these hours are not specifically for honors but also for the Board of Governor\'s scholarship community service requirements)', '2017-04-13 09:00:00', '8.0', 2),
(521, 12, 'River Cleanup', 'CleanSpace', 'conserve@clintoncountypa.com', 'worked with cleanspace for 2 hours and cleared garbage, tires, mattresses, and dirty diapers off the roadside and river area.', '2017-04-29 09:32:00', '2.0', 2),
(522, 49, 'Riverside Cleanup', 'Alumi', 'CleanScapes', 'Met alumni at the black iron bridge and cleaned up trash along the riverside of the road.', '2017-04-29 09:00:00', '2.0', 2),
(523, 120, 'Kid Connection', 'Kenny Varner', '814-441-8962', 'Kid Connection is a craft show type set up in Lewistown, PA where different businesses and organizations set up booths full of fun, free activities for children to participate in. I volunteered with the organization all day, working closely with a local sports business from the area. They asked me to come up with a fun craft children could complete and so to go along with the sports theme I had supplies and materials to allow for children to make their own foam fingers. It was a great experience', '2017-04-29 08:00:00', '6.0', 2),
(524, 47, 'Soccer Sweep', 'Kathy Brown (Coach)', '7068970596', 'Women\'s soccer team walked around downtown and swept the sidewalks and picked up trash.', '2017-04-29 10:30:00', '1.0', 2),
(525, 47, 'Kids Clinic', 'Kathy Brown (Coach)', '7068970596', 'Men\'s and women\'s soccer held a soccer clinic for the local AYSO teams where we ran fun drills and taught them about soccer.', '2017-04-19 17:30:00', '2.0', 2),
(526, 131, 'Salvation Army Store', 'Kim', '570-748-8854', 'I worked in the front sorting clothes and putting items on shelves, priced clothing, and sorted through donated items. I started volunteering at 9:30am. It wouldn\'t let me put that for the start date.', '2017-04-28 00:00:00', '4.0', 2),
(527, 6, 'Canned Food Drive', 'Chadd Miller', '570-367-1478', 'This was a food drive that the honors program had in the fall. I donated over 10 canned food items individually. Our FDG went as a group.', '2016-10-12 00:00:00', '2.0', 2),
(528, 6, 'Alter Serving/Lectoring', 'Mary Watts', '860-941-1239', 'I alter served and lectored at my church in CT, where I currently live. I did this over Thanksgiving break and winter break.', '2016-11-20 08:00:00', '5.0', 2),
(529, 6, 'Relay for Life', 'Joe Visceglia', '570-807-4032', 'Relay for Life is a cancer awareness event where people all across the united states come to their local area and support to raise money towards the cure for cancer.', '2017-03-31 18:00:00', '4.0', 2),
(530, 40, 'LHU Girls LAX Ball Girl', 'Pat Rudy', 'prudy@lhup.edu', 'provided the team with balls when they needed them', '2017-04-26 16:00:00', '2.0', 2),
(531, 40, 'LHU Girl LAX Ball Girl', 'Pat Rudy', 'prudy@lhup.edu', 'provided the lacrosse team with balls when they needed them', '2017-04-12 16:00:00', '2.0', 2),
(532, 40, 'LHU Field Hockey Clinic', 'Pat Rudy', 'prudy@lhup.edu', 'Helped set up and run a clinic for high school field hockey players', '2017-04-23 12:00:00', '4.0', 2),
(533, 183, 'Salvation Army', 'Deb Smeltz', '570-748-8854', 'I helped to hang and sort through donations that were given to Salvation Army. Salvation always has a ton of donations to sort through, and I helped get through a lot of bags in my time there.', '2017-05-01 00:00:00', '2.0', 2),
(534, 51, 'Relay For Life', 'Rachel/Joe', 'honorsprogram@lockhaven.edu', 'I volunteered my time to raise money to fight cancer for 12 hours straight.', '2017-03-31 18:00:00', '12.0', 2),
(535, 51, 'Children\'s Carnival', 'Marissa Umble', 'mcu9991@lhup.edu', 'I volunteered my time to raise money for play therapy and March of Time. I ran a booth at the carnival and helped the children play and win prizes!', '2017-04-29 12:00:00', '3.0', 2),
(536, 51, 'Rock For Robbie', 'Marissa Umble', 'mcu9991@lhup.edu', 'I volunteered my time to help raise awareness and money for play therapy.', '2017-04-28 18:00:00', '3.0', 2),
(537, 176, 'Salvation Army', 'Deb Smeltz', '5707488854', 'Sorted and hung clothes', '2017-05-01 12:15:00', '2.0', 2),
(538, 116, 'Church Daycare Center Geyers Church', 'Dana Barry', '7176491681', 'Helped advise and entertain children during church services', '2017-03-12 09:00:00', '2.0', 2),
(539, 207, 'Princess Party for Child with cancer', 'Kierstan Kerstetter', 'kmk5425@lhup.edu', 'We put on a princess themed party for a local little girl who is battling cancer. We made cookies, she dressed up and sang songs from her favorite Disney movie, Frozen.', '2017-04-27 17:00:00', '4.0', 2),
(540, 226, 'AAUW Book Sale', 'Kim Emery', 'kfe@comcast.net', 'I have registered to do my community service at the AAUW book sale this Thursday (May 4)', '2017-05-04 15:00:00', '5.0', 2),
(541, 183, 'Salvation Army-Edit from Prior Submission', 'Deb Smeltz', '570-748-8854', 'I helped to sort and hang clothing donations at the Salvation Army in downtown Lock Haven. I forgot to adjust the time when I submitted it yesterday. 12:15-2:15.', '2017-05-01 12:15:00', '2.0', 2),
(542, 135, 'Salvation Army Thift Store', 'Deb Smeltz', 'smeltz4@comcast.net', 'First I helped to straighten up the store. Then I performed light cleaning, dusting, sweeping, and vacuuming. For my last hour i rearranged a display case and helped put out new merchandise.', '2017-04-28 11:00:00', '2.0', 2),
(543, 32, 'Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'A-Team open house', '2017-04-08 08:20:00', '2.0', 2),
(544, 32, 'Open House', 'Shelby Helwig', 'sth1064@lhup.edu', 'A-team open house', '2016-10-29 08:20:00', '2.0', 2),
(545, 205, 'Love Your Melon Superhero Day', 'Jaimie Holsinger', '814-321-4887', 'Helped decorate for a \"Princess Tea Party\" for a young girl in the community who is suffering from childhood cancer. This was organized by the Lock Haven University Love Your Melon Crew.', '2017-04-27 16:00:00', '1.0', 2),
(546, 96, 'AAUW Booksale', 'Kim Emery', 'kfe@comcast.com', 'Helped organize books for the book sale.', '2017-05-02 13:00:00', '3.0', 2),
(547, 96, 'CKI Meetings', 'Megan McKenna', 'mem271@lhup.edu', 'Helped prepare doggie treats for the local animal shelter.', '2017-04-13 16:30:00', '1.0', 2),
(548, 125, 'Cleaning the Greenhouse', 'Dr. Calabrese', 'JCalabre@lockhaven.edu', 'Emma Scheick and I pulled weeds out of Dr. C\'s greenhouse and cleaned it out.', '2017-04-23 12:30:00', '3.0', 2),
(549, 96, 'AAUW Booksale', 'Kim Emery', 'kfe@comcast.net', 'Helped organize and set up the books for the book sale tomorrow.', '2017-05-03 09:00:00', '2.0', 2),
(550, 88, 'Activity Group Leader', 'Maaz Mansori', '412-576-8446', 'When I went home over spring break, I stopped over at the Forest Hills Personal Care Home and helped the residents participate in dances and mind-oriented activities. The goal of this time with them is get them off the couches and enjoy their time with the other residents.', '2017-03-18 10:00:00', '1.0', 2),
(551, 90, 'Swim lessons and Timing a swim meet', 'Joel Blesh', '570-295-6160', 'I taught swim lessons to children in the community with the Lock Haven University swim team. We did this two days a week for 4 weeks from September into October. (8 hours). We also volunteered to time for a swim meet for the Lock Haven YMCA team in zimmerli pool (1/27/17) (2 hours).', '2016-09-20 00:00:00', '10.0', 2),
(552, 171, 'Track & Field Meet Clerk', 'Aaron Russell', 'ARussell@lockhaven.edu', 'Worked to help high school athletes check into their events and escort them to their respective starting positions.', '2017-04-21 13:30:00', '7.0', 2),
(553, 171, 'Track & Field Meet Clerk', 'Aaron Russell', 'ARussell@lockhaven.edu', 'Work to help high school students check in for their events and take them to their respective starting positions.', '2017-04-29 12:30:00', '8.0', 2),
(554, 88, 'Office Cleaner', 'Tom Squashic', '8148866021', 'I volunteer my time when I am home to clean the offices of JennMar. Some of the things I participate in are cleaning desks, vacuuming the rugs, cleaning windows, and sweeping up the floors. I do it on the weekends that way when the employees get back on Monday, they are back to a clean office.', '2017-03-19 11:00:00', '4.0', 2),
(555, 109, 'Christmas Presents for Elementary School Children', 'Christina Williams', 'Phone Number: 570-295-0627', 'On November 25, 2016 I shopped for under-privileged children at an elementary school in State College, Pa. Throughout the day, I bought, organized, sorted, and wrapped the presents for the children. They were then taken to the children and given to them before their Christmas break. The whole thing took a little over six hours. I felt a great sense of joy knowing that I was putting a smile on a child\'s face. The experience was very beneficial to me.', '2016-11-25 11:00:00', '6.0', 2),
(556, 110, 'AAUW Book Sale', 'Kim Emery', 'kfe@comcast.net', 'I helped with preparation for the AAUW Book Sale by organizing books.', '2017-05-02 15:45:00', '2.0', 2),
(557, 110, 'AAUW Book Sale', 'Kim Emery', 'kfe@comcast.net', 'I helped with preparation for the AAUW Book Sale by organizing books.', '2017-05-03 09:00:00', '2.0', 2),
(558, 91, 'Book Sale', 'Kim Emery', 'kfe@comcast.net', 'I helped set up the book sale for AAUW.', '2017-05-03 14:30:00', '2.0', 2),
(559, 222, 'Salvation Army Thrift Store', 'Deb Smetlz', '570-660-5737', 'Helped unload a truck with donated items and organized clothing on hangers.', '2017-05-03 15:00:00', '1.5', 2),
(560, 205, 'AAUW Book Sale', 'Kim Emery', 'kfe@comcast.net', 'Sorted through books and organized them by author.', '2017-05-03 14:00:00', '3.0', 2),
(561, 183, 'Salvation Army Thrift Store', 'Deb Smeltz', '570-748-8854', 'I helped put priced clothes out on the floor for sale. I also helped straighten up the overall appearance of the floor, and organized the various sections of clothing from 1pm to 3pm.', '2017-05-03 13:00:00', '2.0', 2),
(562, 105, 'Susquehanna River clean up', 'Aaron Russel', 'ARussell@lockhaven.edu', 'remove tires from the river', '2016-09-03 00:00:00', '4.0', 2),
(563, 105, 'LHU Bald Eagle Invite', 'Aaron Russel', 'ARussell@lockhaven.edu', 'Worked the High school track meet. My job was writing up the field events', '2017-04-29 00:00:00', '8.0', 2),
(564, 143, 'Helped with a Fundraiser', 'Erica Fanning', 'elf1740@lhup.edu', 'I helped my close friend Erica make cupcakes to sell for a fundraiser for a family in Lock Haven.', '2017-04-30 15:00:00', '2.0', 2),
(565, 180, 'AAUW Book Sale Volunteer', 'Kim Emery', 'kfe@comcast.net', 'On May 3, I volunteered at the AAUW book sale from 2-6 PM. It is a great cause and raises money each year for scholarships for women. I helped arrange and organize the books, as well as made signs.', '2017-05-03 14:00:00', '4.0', 2),
(566, 148, 'Movers and Shakers', 'Rachael Metzinger', '5709854764', 'I helped to move in new Honors Freshman during opening weekend.', '2016-08-19 10:00:00', '3.0', 2),
(567, 148, 'Relay for life', 'Hannah Zerbe', '610-780-4580', 'Stayed overnight at a fundraising event to raise money for cancer patients and their families', '2017-03-31 00:00:00', '4.0', 2),
(568, 148, 'Baking', 'Erica Fanning', '570-295-6840', 'Helped to bake and transport cupcakes for a fundraising benefit.', '2017-04-30 15:00:00', '3.0', 2),
(569, 222, 'Salvation Army Store', 'Deb Smeltz', '570-660-5737', 'Helped unload boxes of DVDs and put them on display shelves and assisted customers.', '2017-05-04 11:00:00', '1.5', 2),
(570, 45, 'American Association of University Women Book Fair', 'Kim Emery', 'kfe@comcast.net', 'I helped re-organize books along the shelves at the book fair.', '2017-05-04 12:00:00', '2.0', 2),
(571, 122, 'AAUW Book Sale', 'Kim Emery', 'kfe@comcast.net', 'Helped organize books for the AAUW book sale.', '2017-05-04 00:00:00', '2.0', 2),
(572, 96, 'AAUW Booksale', 'Kim Emery', 'kfe@comcast.net', 'Helped organize, re-straighten books, carry the books to customers care and help them find books if needed.', '2017-05-04 11:00:00', '2.0', 2),
(573, 176, 'Salvation Army', 'Deb Smeltz', '5707488854', 'Hung clothes and straightened items on shelves.', '2017-05-03 00:00:00', '3.0', 2),
(574, 89, 'AAUW book sale', 'Kim Emery', 'kfe@comcast.net', 'I worked at the book sale in East Campus.', '2017-05-04 16:00:00', '1.0', 2),
(575, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Kathy Deavor', '(570) 295-7109', 'I teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2017-04-26 17:30:00', '2.0', 2),
(576, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Kathy Deavor', '(570) 295-7109', 'I teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2017-05-03 17:30:00', '3.0', 2),
(577, 18, 'Lock Haven High School Track Meet', 'Coach Aaron Russell', '5709165716', 'Volunteered my time to help work the Lock Haven High School Track Meet.', '2017-04-29 13:00:00', '6.0', 2),
(578, 176, 'Salvation Army', 'Deb Smeltz', '(570) 748-2951', 'Sorted/Hung Clothes', '2017-05-05 00:00:00', '2.0', 2),
(579, 44, 'AAUW Book Sale', 'Kim Emery', 'kfe@comcast.net', 'Helped keep the isles clean and assist customers with any needs.', '2017-05-05 15:00:00', '4.0', 2),
(580, 147, 'Community Service: Orchestra', 'Seth Wollam', 'sfw332@lhup.edu', 'I participated in the Community Orchestra by practicing and performing concert.', '2017-04-25 20:00:00', '10.0', 2),
(581, 178, 'Boxing training lessons', 'Dr. Brian Wilt and boxing coach Kenneth Cooper', 'bwilt@lockhaven.edu', 'October 2016-November 2016\r\nEvery Wednesday for one hour during the fall semester for the span of 8 weeks. I volunteered my time and efforts to training and mentoring Dr. Brian Wilts son. We did workouts and overall stamina building exercises. I also talked with him about school & other things building a rapport between the three of us.', '2016-10-05 00:00:00', '8.0', 2),
(582, 142, 'AAUW Book Sale', 'Kim Emery', 'kfe@comcast.net', 'I helped the AAUW Book Sale by taking the books out of the boxes and place them in the proper section. I also helped maintain organization of the books during the sale and grabbed boxes for customers who bought large quantities of books and other items. The days and times I helped were; Tuesday 5/2 from 9-10:30 am  (1 1/2 hours) and 12:40-1:40 pm (1 hour); and Friday from 1-2:30 pm (1 1/2 hours).', '2017-05-02 09:00:00', '4.0', 2),
(583, 89, 'Volunteering at the AAUW book sale', 'Kim', 'kfe@comcast.net', 'I once again volunteered at the book sale at East Campus.', '2017-05-05 16:00:00', '3.0', 2),
(584, 61, 'United Way Serving', 'Coach Brown', 'kji58@lockhaven.edu', 'I helped serve hors d\'oeurvres at the United Way sports auction. My coach had asked for volunteers from the team to help out, and I was able to help from 5:30 to 7:15 when my other teammates got there. My coach would have further contact info if needed.', '2017-05-05 17:30:00', '1.0', 2),
(585, 61, 'AAUW Book Sale', 'Kim Emery', 'kfe@comcast.net', 'I helped set up for the AAUW Used Book sale at East Campus on Tuesday from 6:00-8:00 when we left that night. And then I helped on Saturday from 9:00-2:00 doing miscellaneous tasks such as giving people a paper bag for the $5 Bag day, setting boxes under tables for clean up later, putting a few tables away after all the books had been purchased, etc.', '2017-05-02 18:00:00', '7.0', 2),
(586, 64, 'Centre County PAWS', 'Megan Tomkiel', '(814) 237-8722', 'I volunteered over the winter break and spring semester at PAWS. I assisted in cat care, which consisted of cleaning cages and feeding, as well as driving cats to and from their vet appointments.', '2016-12-08 16:00:00', '11.0', 2),
(587, 64, 'Centre County PAWS', 'Megan Tomkiel', '(814) 237-8722', 'I volunteered in cat car, assisting in cleaning cages, feeding, and transporting to and from vet appointments.', '2016-12-08 16:00:00', '2.0', 2),
(588, 64, 'Centre County PAWS', 'Megan Tomkiel', '(814) 237-8722', 'I volunteered in cat car, assisting in cleaning cages, feeding, and transporting to and from vet appointments.', '2016-12-17 16:00:00', '2.0', 2),
(589, 64, 'Centre County PAWS', 'Megan Tomkiel', '(814) 237-8722', 'I volunteered in cat car, assisting in cleaning cages, feeding, and transporting to and from vet appointments.', '2016-12-22 17:00:00', '2.0', 2),
(590, 64, 'Centre County PAWS', 'Megan Tomkiel', '(814) 237-8722', 'I volunteered in cat care which included cleaning cages and feeding.', '2017-06-07 17:00:00', '2.0', 2),
(591, 64, 'Centre County PAWS', 'Megan Tomkiel', '(814) 237-8722', 'I transported cats to and from their vet appointments.', '2017-01-25 15:00:00', '1.0', 2),
(592, 64, 'Centre County PAWS', 'Megan Tomkiel', '(814) 237-8722', 'I transported cats to and from their vet appointments.', '2017-02-20 14:00:00', '1.0', 2),
(593, 172, 'Newman Center', 'Chris Klopp', '(615)854-5616', 'I completed office work including file organizing, budget input, annual budgetary report organizing, and condensing of monetary information.', '2017-05-01 15:00:00', '10.0', 2),
(594, 110, 'AAUW Book Sale', 'Kim Emery', 'kfe@comcast.net', 'I helped organize books throughout the sale and helped in anyway Kim asked me to.', '2017-05-05 16:00:00', '3.0', 2),
(595, 111, 'Honors Movers and Shakers', 'Raechel Metzinger', '5709854764', 'Helped new honors freshman move into their dorms and get acclimated to the univeristy', '2016-08-25 10:00:00', '3.0', 2),
(596, 111, 'Relay for Life', 'Hannah Zerbe', '6107804580', 'Stayed up for 12 hours raising money for cancer patients, their families, and those who have passed due to the disease.', '2017-03-31 18:00:00', '4.0', 2),
(597, 111, 'Cupcake and cake baking and decorating', 'Erica Fanning', '5702956840', 'Helped decorate cupcakes and cakes from scratch for a children\'s benefit and transport them to the location. Helped serve and give out the cupcakes and cakes as well.', '2017-04-30 10:00:00', '4.0', 2),
(598, 108, 'opening weekend volunteer', 'Ashley Spencer', 'aspencer@lockhaven.edu', 'Volunteered through the center for excellence and inclusion', '2016-08-25 00:00:00', '13.0', 2),
(599, 148, 'Activity Group', 'Rachael Metzinger', '570-985-4764', 'These hours are to be forwarded to Kenny Hall in the Center of Excellence and Inclusion for my Board of Governors scholarship! I can use my spa day activity group hours as community service for that as well as the rest of my hours! Thank you!', '2016-08-29 17:00:00', '13.0', 2),
(600, 151, 'Women\'s Center', 'Dawn Barner', 'volunteer@ccwcsafe.org', 'I made food for the Women\'s Center.', '2017-05-10 00:00:00', '2.0', 2),
(601, 173, 'Blood Drive', 'Red Cross', 'Red Cross', 'I donated blood to the American Red Cross.', '2016-12-01 16:00:00', '1.0', 2),
(602, 173, 'Blood Drive Recovery Table', 'Red Cross', 'Red Cross', 'I helped out at the recovery table at the blood drive giving snacks and helping people who were not feeling well', '2016-11-30 16:00:00', '2.0', 2),
(603, 173, 'Can Drive', 'Bethy Wells', 'ejw4272', 'I donated 10 cans to the Hunger Bowl', '2016-11-02 16:00:00', '2.0', 2),
(604, 173, 'Blood Drive', 'Red Cross', 'Red Cross', 'I donated blood to the American Red Cross', '2017-03-11 15:00:00', '1.0', 2),
(605, 173, 'Phi Sigma Pi Material Drive for Womens Center', 'Travis Mosier', 'tam7838@lhup.edu', 'I donated assorted materials to the local women\'s center that they were in need of', '2017-03-30 15:00:00', '1.0', 2),
(606, 173, 'Camp Bucoco Service Work', 'Andrew Brock', '4125593970', 'I volunteered as a service worker to improve various things around Camp Bucoco including latrines and painting as well as other tasks.', '2016-10-22 09:00:00', '5.0', 2),
(607, 55, 'SPCA', 'Jonyull Kosinski', '215-499-0225', 'I brushed the cats and walked the dogs at the SPCA.', '2017-04-24 00:00:00', '12.0', 2),
(608, 128, 'PSP Initiate Tripod', 'Kylie Bechdel', 'kmb8768@lhup.edu', 'Our initiate, Kylie Bechdel, held an educational event where brothers painted pictures and donated art supplies to a local art program', '2017-04-19 19:00:00', '2.0', 2),
(609, 128, 'HOBY Hugs', 'Brittney Zeller', 'bsz5582@lhup.edu', 'People came together to create cards for those involved in the Hugh O Brian Youth Leadership Program', '2017-03-23 19:00:00', '1.0', 2),
(610, 128, 'Wendy\'s Night', 'Greg Segarra', 'gas5669@lhup.edu', 'We hosted a Wendy\'s night event that then donated proceeds to AIDS Resource in Williamsport', '2016-11-07 19:00:00', '3.0', 2),
(611, 128, 'Initiate Tripod', 'Travis Mosier', 'tam7838', 'Initiates raised money/goods to donate as well as educated brothers', '2016-11-11 19:00:00', '1.0', 2),
(612, 128, 'Condom Bingo', 'Greg Segarra', 'gas5669@lhup.edu', 'Brothers held an event to educate the public on safe sex and raise money for AIDS Resource', '2016-11-01 19:00:00', '2.0', 2),
(613, 128, 'PSP Tripod', 'Brittney Zeller, Josh Henry, Will Grove', 'wcg4229@lhup.edu, bsz5582@lhup.edu, jdh7535@lhup.edu', 'PSP brothers held a jeopardy game and collected can tabs to donate to the Ronald McDonald house', '2016-10-27 19:00:00', '1.0', 2),
(614, 128, 'Salvation Army/Goodwill Donation', 'Josh Henry', 'jdh7535@lhup.edu', 'I collected items to donate to the Salvation Army/Goodwill and helped coordinate the effort with other people', '2016-11-16 19:00:00', '2.0', 2),
(615, 57, 'Move-In Day', 'Shelby Helwig', 'Shelby Helwig\'s email', 'Volunteered as a mover and shaker, helping new honors students move in all their stuff into their dorms.', '2016-08-26 10:00:00', '3.0', 2),
(616, 57, 'Career Fair', 'Courtney Force', 'Cforce@lhup.edu', 'Volunteered as a student greeter for the spring career fair. Helped students find different stands and gave them directions to bathroom and food.', '2017-02-16 11:00:00', '3.0', 2),
(617, 57, 'Spring Blood Drive', 'Olivia Bellomo', 'Olivia Bellomo\'s email', 'Assisted students by providing them with snacks and making sure they were good to go before leaving.', '2017-03-04 11:00:00', '3.0', 2),
(618, 57, 'Practice GRE test', 'Courtney Force', 'Cforce@lhup.edu', 'Volunteered as a test proctor for the practice GRE test sponsored by the Center for Career Development.', '2017-03-04 10:00:00', '6.0', 2);

-- --------------------------------------------------------

--
-- Table structure for table `SP17_currentstudents`
--

CREATE TABLE `SP17_currentstudents` (
  `pstu_id` int(11) NOT NULL,
  `pstu_in_fdg` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SP17_currentstudents`
--

INSERT INTO `SP17_currentstudents` (`pstu_id`, `pstu_in_fdg`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(18, 0),
(21, 0),
(22, 0),
(23, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(37, 0),
(38, 0),
(39, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0),
(50, 0),
(51, 0),
(53, 0),
(54, 0),
(55, 0),
(56, 0),
(57, 0),
(58, 0),
(59, 0),
(60, 0),
(61, 0),
(62, 0),
(63, 0),
(64, 0),
(65, 0),
(66, 0),
(67, 0),
(68, 0),
(69, 0),
(70, 0),
(72, 0),
(73, 0),
(74, 0),
(75, 0),
(76, 0),
(78, 0),
(79, 0),
(80, 0),
(81, 0),
(82, 0),
(83, 0),
(84, 0),
(85, 0),
(86, 0),
(88, 0),
(89, 0),
(90, 0),
(91, 0),
(95, 0),
(96, 0),
(97, 0),
(98, 0),
(100, 0),
(101, 0),
(102, 0),
(103, 0),
(104, 0),
(105, 0),
(106, 0),
(107, 0),
(108, 0),
(109, 0),
(110, 0),
(111, 0),
(112, 0),
(113, 0),
(114, 0),
(115, 0),
(116, 0),
(117, 0),
(118, 0),
(119, 0),
(120, 0),
(121, 0),
(122, 0),
(123, 0),
(124, 0),
(125, 0),
(126, 0),
(127, 0),
(128, 0),
(130, 0),
(131, 0),
(132, 0),
(133, 0),
(134, 0),
(135, 0),
(137, 0),
(138, 0),
(139, 0),
(140, 0),
(141, 0),
(142, 0),
(143, 0),
(144, 0),
(145, 0),
(146, 0),
(147, 0),
(148, 0),
(149, 0),
(150, 0),
(151, 0),
(152, 0),
(153, 0),
(154, 0),
(155, 0),
(156, 0),
(158, 0),
(159, 0),
(160, 0),
(161, 0),
(162, 0),
(163, 0),
(165, 0),
(167, 0),
(168, 0),
(169, 0),
(170, 0),
(171, 0),
(172, 0),
(173, 0),
(176, 0),
(177, 0),
(178, 0),
(180, 0),
(181, 0),
(182, 0),
(183, 0),
(185, 0),
(187, 0),
(188, 0),
(190, 0),
(191, 0),
(192, 0),
(196, 0),
(197, 0),
(198, 0),
(201, 0),
(202, 0),
(203, 0),
(204, 0),
(205, 0),
(206, 0),
(207, 0),
(208, 0),
(209, 0),
(211, 0),
(213, 0),
(214, 0),
(217, 0),
(222, 0),
(226, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `SP17_dates`
-- (See below for the actual view)
--
CREATE TABLE `SP17_dates` (
`start` datetime
,`end` datetime
,`title` varchar(60)
,`event_id` bigint(20)
,`group` int(11)
,`back_color` varchar(7)
,`font_color` varchar(7)
,'freshman' number(1)
);

-- --------------------------------------------------------

--
-- Table structure for table `SP17_events`
--

CREATE TABLE `SP17_events` (
  `event_id` int(11) NOT NULL,
  `event_title` varchar(60) NOT NULL,
  `event_description` varchar(200) NOT NULL,
  `event_start_date` datetime NOT NULL,
  `event_end_date` datetime NOT NULL,
  `event_bg_color` varchar(7) DEFAULT '#0000ff',
  `event_ft_color` varchar(7) DEFAULT '#ffffff'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SP17_events`
--

INSERT INTO `SP17_events` (`event_id`, `event_title`, `event_description`, `event_start_date`, `event_end_date`, `event_bg_color`, `event_ft_color`) VALUES
(1, 'Valentine\'s Day Party', 'Come on out to the Honors House to find your true match!', '2017-02-13 19:00:00', '2017-02-13 20:00:00', '#0000ff', '#ffffff'),
(2, 'FDG Newlywed Game', 'How well do you know your fellow FDG members!\r\nLocation: Pub Room 2', '2017-02-16 18:30:00', '2017-02-16 19:30:00', '#0000ff', '#ffffff'),
(3, 'Clash of the classes', 'Come show which class is best class! Locations vary', '2017-02-27 18:30:00', '2017-03-01 20:00:00', '#0000ff', '#ffffff'),
(4, 'Game Show Extravaganza', 'Come one come all to the wackiest night of minute to win it games that honors has ever seen! Location: PUB MPR', '2017-03-02 18:30:00', '2017-03-02 19:30:00', '#0000ff', '#ffffff'),
(5, 'Egg Hunt', 'Come out to survive on Survivor: The Eggspidition.\r\nLocation: Honors House', '2017-03-29 16:30:00', '2017-03-29 18:00:00', '#0000ff', '#ffffff'),
(6, 'Annual Honor\'s Banquet', 'Come out to eat some great food and spend time with great friends as we honor those people who have contributed so much to the program over the last academic year.', '2017-04-29 18:00:00', '2017-04-29 19:00:00', '#0000ff', '#ffffff'),
(7, 'FDG Wars', 'This is it! The moment you have all been waiting for!\r\nFDG WARSSSS! Come see which FDG is best FDG!!!', '2017-05-06 18:00:00', '2017-05-06 19:00:00', '#0000ff', '#ffffff'),
(8, 'Graduation Ceremonies', 'Best wishes to all our GHP grads. We will miss you!', '2017-05-13 10:00:00', '2017-05-13 13:00:00', '#0000ff', '#ffffff');

-- --------------------------------------------------------

--
-- Table structure for table `SP17_exceptions`
--

CREATE TABLE `SP17_exceptions` (
  `excptn_id` int(11) NOT NULL,
  `excptn_name` varchar(60) NOT NULL,
  `excptn_type` int(11) NOT NULL,
  `excptn_value` decimal(5,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SP17_exceptions`
--

INSERT INTO `SP17_exceptions` (`excptn_id`, `excptn_name`, `excptn_type`, `excptn_value`) VALUES
(1, 'Capstone Research', 1, '10.00'),
(2, 'Capstone Research 1/2 AE', 2, '1.00'),
(3, 'Other Full AG', 1, '10.00'),
(4, 'Other Full AE', 2, '2.00'),
(5, 'Other 1/2 AG', 1, '5.00'),
(6, 'Other 1/2 AE', 2, '1.00'),
(7, 'AG_definite', 1, '10.00'),
(8, 'AG Half_Definite', 1, '5.00'),
(10, 'AE_Definite', 2, '2.00');

-- --------------------------------------------------------

--
-- Table structure for table `SP17_exception_grants`
--

CREATE TABLE `SP17_exception_grants` (
  `grant_id` int(11) NOT NULL,
  `excptn_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SP17_exception_grants`
--

INSERT INTO `SP17_exception_grants` (`grant_id`, `excptn_id`, `pstu_id`) VALUES
(2, 1, 116),
(1, 1, 163),
(3, 1, 169),
(93, 1, 172),
(97, 1, 173),
(7, 1, 176),
(94, 1, 177),
(8, 1, 180),
(9, 1, 182),
(10, 1, 183),
(95, 1, 192),
(11, 1, 196),
(13, 1, 197),
(96, 1, 202),
(14, 1, 205),
(15, 2, 205),
(17, 3, 63),
(18, 3, 67),
(19, 3, 68),
(24, 3, 84),
(30, 3, 121),
(21, 3, 124),
(33, 3, 128),
(34, 3, 142),
(25, 3, 148),
(26, 3, 151),
(27, 3, 154),
(28, 3, 156),
(29, 3, 159),
(16, 3, 162),
(37, 3, 191),
(38, 3, 203),
(41, 3, 204),
(31, 4, 121),
(35, 4, 142),
(36, 4, 191),
(39, 4, 203),
(40, 4, 204),
(20, 5, 124),
(32, 6, 128),
(99, 6, 130),
(75, 7, 15),
(70, 7, 18),
(76, 7, 26),
(60, 7, 48),
(73, 7, 53),
(65, 7, 54),
(80, 7, 55),
(74, 7, 57),
(79, 7, 66),
(56, 7, 79),
(69, 7, 82),
(62, 7, 89),
(72, 7, 90),
(66, 7, 91),
(68, 7, 96),
(71, 7, 98),
(58, 7, 102),
(63, 7, 103),
(67, 7, 105),
(78, 7, 106),
(81, 7, 110),
(52, 7, 112),
(59, 7, 123),
(98, 7, 130),
(64, 7, 132),
(50, 7, 168),
(61, 7, 171),
(46, 7, 188),
(48, 7, 198),
(43, 7, 201),
(54, 7, 211),
(77, 7, 214),
(87, 8, 17),
(85, 8, 29),
(89, 8, 37),
(91, 8, 40),
(90, 8, 47),
(86, 8, 50),
(84, 8, 61),
(83, 8, 72),
(92, 8, 86),
(88, 8, 104),
(55, 10, 79),
(51, 10, 112),
(49, 10, 168),
(45, 10, 188),
(47, 10, 198),
(44, 10, 201),
(53, 10, 211);

-- --------------------------------------------------------

--
-- Table structure for table `SP17_fdg`
--

CREATE TABLE `SP17_fdg` (
  `pfdg_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SP17_fdg`
--

INSERT INTO `SP17_fdg` (`pfdg_id`) VALUES
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

-- --------------------------------------------------------

--
-- Table structure for table `SP17_fdg_attendence`
--

CREATE TABLE `SP17_fdg_attendence` (
  `pfdg_att_id` int(11) NOT NULL,
  `pfdg_report_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SP17_fdg_attendence`
--

INSERT INTO `SP17_fdg_attendence` (`pfdg_att_id`, `pfdg_report_id`, `pstu_id`) VALUES
(10, 2, 5),
(13, 2, 14),
(12, 2, 22),
(9, 2, 42),
(14, 2, 46),
(11, 2, 51),
(45, 3, 5),
(46, 3, 14),
(42, 3, 22),
(43, 3, 42),
(44, 3, 46),
(91, 4, 5),
(89, 4, 14),
(88, 4, 22),
(92, 4, 42),
(90, 4, 46),
(87, 4, 51),
(144, 5, 5),
(142, 5, 14),
(147, 5, 22),
(145, 5, 42),
(143, 5, 46),
(146, 5, 51),
(175, 7, 5),
(179, 7, 14),
(176, 7, 22),
(177, 7, 42),
(178, 7, 46),
(174, 7, 51),
(218, 8, 5),
(223, 8, 14),
(221, 8, 22),
(219, 8, 42),
(222, 8, 46),
(220, 8, 51),
(278, 9, 5),
(275, 9, 14),
(274, 9, 22),
(277, 9, 42),
(276, 9, 46),
(315, 11, 5),
(318, 11, 14),
(320, 11, 22),
(317, 11, 42),
(319, 11, 46),
(321, 11, 51),
(370, 12, 5),
(375, 12, 14),
(372, 12, 22),
(371, 12, 42),
(374, 12, 46),
(373, 12, 51),
(405, 13, 5),
(410, 13, 14),
(408, 13, 22),
(406, 13, 42),
(409, 13, 46),
(407, 13, 51),
(449, 14, 5),
(453, 14, 14),
(451, 14, 22),
(450, 14, 42),
(452, 14, 46),
(448, 14, 51),
(4, 15, 17),
(1, 15, 18),
(7, 15, 32),
(6, 15, 34),
(2, 15, 45),
(8, 15, 47),
(3, 15, 48),
(5, 15, 50),
(16, 16, 15),
(18, 16, 25),
(15, 16, 26),
(17, 16, 35),
(38, 17, 15),
(39, 17, 25),
(41, 17, 26),
(40, 17, 35),
(167, 19, 15),
(168, 19, 25),
(170, 19, 26),
(169, 19, 35),
(171, 20, 25),
(173, 20, 26),
(172, 20, 35),
(210, 21, 15),
(211, 21, 25),
(212, 21, 35),
(322, 24, 25),
(323, 24, 35),
(24, 27, 17),
(19, 27, 18),
(25, 27, 32),
(21, 27, 34),
(26, 27, 45),
(20, 27, 47),
(23, 27, 48),
(22, 27, 50),
(30, 28, 7),
(29, 28, 10),
(28, 28, 28),
(31, 28, 43),
(27, 28, 217),
(37, 29, 7),
(35, 29, 10),
(34, 29, 28),
(36, 29, 43),
(33, 29, 217),
(51, 30, 16),
(52, 30, 21),
(50, 30, 24),
(47, 30, 30),
(49, 30, 31),
(122, 31, 16),
(119, 31, 21),
(121, 31, 24),
(123, 31, 30),
(118, 31, 31),
(120, 31, 226),
(57, 32, 16),
(54, 32, 21),
(59, 32, 24),
(56, 32, 30),
(58, 32, 31),
(55, 32, 226),
(129, 33, 16),
(124, 33, 21),
(128, 33, 24),
(126, 33, 30),
(127, 33, 31),
(125, 33, 226),
(159, 38, 21),
(161, 38, 24),
(156, 38, 30),
(158, 38, 31),
(160, 38, 226),
(65, 44, 17),
(67, 44, 18),
(61, 44, 32),
(62, 44, 34),
(60, 44, 45),
(66, 44, 47),
(63, 44, 48),
(64, 44, 50),
(69, 45, 27),
(70, 45, 36),
(71, 45, 37),
(72, 45, 40),
(68, 45, 44),
(74, 46, 27),
(73, 46, 36),
(75, 46, 44),
(77, 47, 27),
(80, 47, 36),
(76, 47, 37),
(78, 47, 40),
(79, 47, 44),
(115, 48, 27),
(117, 48, 36),
(116, 48, 37),
(113, 48, 40),
(114, 48, 44),
(163, 49, 27),
(164, 49, 36),
(162, 49, 37),
(166, 49, 40),
(165, 49, 44),
(201, 50, 27),
(202, 50, 36),
(200, 50, 37),
(204, 50, 40),
(203, 50, 44),
(214, 51, 27),
(216, 51, 36),
(213, 51, 37),
(217, 51, 40),
(215, 51, 44),
(356, 54, 27),
(358, 54, 36),
(355, 54, 37),
(359, 54, 40),
(357, 54, 44),
(412, 55, 27),
(413, 55, 36),
(411, 55, 37),
(415, 55, 40),
(414, 55, 44),
(417, 56, 27),
(418, 56, 36),
(416, 56, 37),
(420, 56, 40),
(419, 56, 44),
(469, 57, 36),
(468, 57, 37),
(471, 57, 40),
(470, 57, 44),
(85, 60, 7),
(83, 60, 10),
(82, 60, 28),
(84, 60, 43),
(81, 60, 217),
(99, 61, 8),
(102, 61, 12),
(100, 61, 29),
(98, 61, 41),
(101, 61, 49),
(107, 63, 8),
(104, 63, 12),
(106, 63, 29),
(103, 63, 41),
(105, 63, 49),
(97, 65, 8),
(95, 65, 12),
(96, 65, 29),
(93, 65, 41),
(94, 65, 49),
(112, 66, 8),
(110, 66, 12),
(109, 66, 29),
(108, 66, 41),
(111, 66, 49),
(135, 67, 18),
(134, 67, 32),
(133, 67, 34),
(136, 67, 45),
(131, 67, 47),
(130, 67, 48),
(132, 67, 50),
(139, 69, 7),
(137, 69, 10),
(141, 69, 28),
(138, 69, 43),
(140, 69, 217),
(150, 70, 17),
(148, 70, 18),
(155, 70, 32),
(151, 70, 34),
(153, 70, 45),
(154, 70, 47),
(149, 70, 48),
(152, 70, 50),
(350, 71, 8),
(351, 71, 12),
(352, 71, 29),
(349, 71, 49),
(180, 72, 17),
(184, 72, 18),
(181, 72, 32),
(183, 72, 34),
(185, 72, 45),
(190, 72, 47),
(182, 72, 50),
(348, 73, 8),
(347, 73, 12),
(338, 73, 29),
(346, 73, 41),
(339, 73, 49),
(297, 74, 7),
(295, 74, 10),
(298, 74, 28),
(293, 74, 43),
(296, 74, 217),
(195, 75, 7),
(194, 75, 10),
(192, 75, 28),
(193, 75, 43),
(191, 75, 217),
(196, 76, 7),
(197, 76, 10),
(198, 76, 43),
(199, 76, 217),
(206, 77, 21),
(205, 77, 24),
(209, 77, 30),
(208, 77, 31),
(207, 77, 226),
(300, 78, 24),
(299, 78, 30),
(303, 78, 31),
(302, 78, 226),
(224, 79, 17),
(229, 79, 18),
(225, 79, 32),
(226, 79, 34),
(228, 79, 45),
(231, 79, 47),
(230, 79, 48),
(227, 79, 50),
(336, 80, 8),
(333, 80, 12),
(337, 80, 29),
(334, 80, 41),
(335, 80, 49),
(238, 81, 6),
(237, 81, 9),
(234, 81, 11),
(233, 81, 13),
(235, 81, 23),
(236, 81, 33),
(232, 81, 39),
(273, 82, 6),
(272, 82, 9),
(269, 82, 11),
(268, 82, 13),
(270, 82, 23),
(271, 82, 33),
(267, 82, 39),
(266, 83, 6),
(265, 83, 9),
(262, 83, 11),
(261, 83, 13),
(263, 83, 23),
(264, 83, 33),
(260, 83, 39),
(259, 84, 6),
(258, 84, 9),
(255, 84, 11),
(254, 84, 13),
(256, 84, 23),
(257, 84, 33),
(253, 84, 39),
(252, 86, 6),
(251, 86, 9),
(248, 86, 11),
(247, 86, 13),
(249, 86, 23),
(250, 86, 33),
(246, 86, 39),
(245, 87, 6),
(244, 87, 9),
(241, 87, 11),
(240, 87, 13),
(242, 87, 23),
(243, 87, 33),
(239, 87, 39),
(280, 88, 32),
(282, 88, 34),
(279, 88, 45),
(284, 89, 7),
(285, 89, 10),
(283, 89, 28),
(287, 89, 43),
(286, 89, 217),
(304, 91, 21),
(310, 91, 24),
(309, 91, 30),
(307, 91, 31),
(305, 91, 226),
(312, 92, 21),
(314, 92, 30),
(311, 92, 31),
(313, 92, 226),
(353, 93, 15),
(354, 93, 25),
(332, 94, 8),
(331, 94, 29),
(329, 94, 49),
(324, 95, 8),
(325, 95, 12),
(327, 95, 29),
(326, 95, 49),
(360, 96, 7),
(364, 96, 10),
(361, 96, 28),
(362, 96, 43),
(363, 96, 217),
(403, 97, 10),
(402, 97, 28),
(404, 97, 43),
(401, 97, 217),
(366, 98, 21),
(369, 98, 24),
(365, 98, 30),
(368, 98, 31),
(367, 98, 226),
(399, 99, 17),
(398, 99, 18),
(383, 99, 32),
(382, 99, 34),
(384, 99, 47),
(385, 99, 48),
(386, 99, 50),
(381, 100, 18),
(377, 100, 32),
(376, 100, 34),
(378, 100, 47),
(379, 100, 48),
(380, 100, 50),
(421, 102, 21),
(424, 102, 24),
(423, 102, 30),
(425, 102, 31),
(422, 102, 226),
(430, 103, 32),
(431, 103, 34),
(428, 103, 45),
(429, 103, 47),
(427, 103, 48),
(426, 103, 50),
(434, 105, 15),
(433, 105, 25),
(432, 105, 35),
(435, 106, 7),
(436, 106, 10),
(439, 106, 28),
(438, 106, 43),
(437, 106, 217),
(440, 107, 12),
(441, 107, 29),
(443, 107, 41),
(442, 107, 49),
(445, 108, 8),
(444, 108, 12),
(446, 108, 29),
(447, 108, 49),
(457, 109, 8),
(454, 109, 12),
(456, 109, 29),
(455, 109, 49),
(462, 110, 17),
(464, 110, 18),
(460, 110, 32),
(458, 110, 34),
(461, 110, 45),
(463, 110, 47),
(459, 110, 48),
(465, 110, 50),
(495, 111, 21),
(497, 111, 24),
(494, 111, 30),
(498, 111, 31),
(496, 111, 226),
(499, 112, 21),
(502, 112, 24),
(503, 112, 30),
(501, 112, 31),
(500, 112, 226),
(466, 113, 25),
(467, 113, 35),
(477, 114, 5),
(473, 114, 14),
(474, 114, 22),
(476, 114, 42),
(475, 114, 46),
(472, 114, 51),
(484, 115, 18),
(478, 115, 32),
(479, 115, 34),
(483, 115, 45),
(482, 115, 47),
(481, 115, 48),
(480, 115, 50),
(488, 116, 7),
(487, 116, 10),
(486, 116, 28),
(489, 116, 43),
(485, 116, 217),
(493, 117, 7),
(490, 117, 10),
(491, 117, 43),
(492, 117, 217),
(510, 120, 6),
(509, 120, 9),
(506, 120, 11),
(505, 120, 13),
(507, 120, 23),
(508, 120, 33),
(504, 120, 39),
(516, 121, 6),
(515, 121, 9),
(512, 121, 11),
(511, 121, 13),
(513, 121, 23),
(514, 121, 33),
(523, 122, 6),
(522, 122, 9),
(519, 122, 11),
(518, 122, 13),
(520, 122, 23),
(521, 122, 33),
(517, 122, 39),
(530, 123, 6),
(529, 123, 9),
(526, 123, 11),
(525, 123, 13),
(527, 123, 23),
(528, 123, 33),
(524, 123, 39),
(537, 124, 6),
(536, 124, 9),
(533, 124, 11),
(532, 124, 13),
(534, 124, 23),
(535, 124, 33),
(531, 124, 39),
(544, 125, 6),
(543, 125, 9),
(540, 125, 11),
(539, 125, 13),
(541, 125, 23),
(542, 125, 33),
(538, 125, 39),
(555, 126, 5),
(553, 126, 14),
(552, 126, 22),
(554, 126, 42),
(556, 126, 46),
(545, 126, 51),
(557, 127, 17),
(560, 127, 18),
(562, 127, 32),
(559, 127, 34),
(563, 127, 45),
(561, 127, 47),
(558, 127, 50),
(565, 129, 15),
(564, 129, 25),
(566, 129, 35),
(573, 130, 6),
(572, 130, 9),
(569, 130, 11),
(568, 130, 13),
(570, 130, 23),
(571, 130, 33),
(567, 130, 39),
(577, 131, 8),
(574, 131, 12),
(576, 131, 29),
(578, 131, 41),
(575, 131, 49),
(581, 132, 8),
(579, 132, 12),
(582, 132, 29),
(583, 132, 41),
(580, 132, 49),
(588, 133, 7),
(587, 133, 10),
(585, 133, 28),
(586, 133, 43),
(584, 133, 217);

-- --------------------------------------------------------

--
-- Table structure for table `SP17_fdg_event`
--

CREATE TABLE `SP17_fdg_event` (
  `pfdg_event_id` int(11) NOT NULL,
  `pfdg_event_name` varchar(60) NOT NULL,
  `pfdg_event_description` varchar(500) DEFAULT NULL,
  `pfdg_start_date` datetime NOT NULL,
  `pfdg_end_date` datetime NOT NULL,
  `pfdg_event_bg_color` varchar(7) DEFAULT '#0000ff',
  `pfdg_event_ft_color` varchar(7) DEFAULT '#ffffff'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `SP17_fdg_event_attendence`
--

CREATE TABLE `SP17_fdg_event_attendence` (
  `pfdg_eve_att_id` int(11) NOT NULL,
  `pfdg_event_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `SP17_fdg_leaders`
--

CREATE TABLE `SP17_fdg_leaders` (
  `pfdg_leader_id` int(11) NOT NULL,
  `pfdg_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SP17_fdg_leaders`
--

INSERT INTO `SP17_fdg_leaders` (`pfdg_leader_id`, `pfdg_id`, `pstu_id`) VALUES
(1, 2, 105),
(2, 2, 102),
(3, 3, 106),
(4, 3, 57),
(6, 4, 98),
(7, 5, 53),
(8, 5, 55),
(9, 6, 96),
(10, 6, 110),
(11, 7, 103),
(12, 7, 91),
(13, 8, 79),
(14, 8, 89),
(15, 9, 66),
(16, 9, 54),
(18, 9, 146);

-- --------------------------------------------------------

--
-- Table structure for table `SP17_fdg_members`
--

CREATE TABLE `SP17_fdg_members` (
  `pfdg_member_id` int(11) NOT NULL,
  `pfdg_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SP17_fdg_members`
--

INSERT INTO `SP17_fdg_members` (`pfdg_member_id`, `pfdg_id`, `pstu_id`) VALUES
(10, 6, 21),
(11, 6, 24),
(12, 6, 16),
(13, 6, 31),
(14, 6, 30),
(15, 8, 39),
(16, 8, 13),
(17, 8, 11),
(18, 8, 23),
(19, 8, 33),
(20, 8, 9),
(21, 8, 6),
(22, 5, 10),
(25, 5, 43),
(26, 5, 217),
(27, 5, 28),
(28, 5, 7),
(29, 2, 17),
(30, 2, 50),
(31, 2, 45),
(32, 2, 32),
(33, 2, 34),
(34, 2, 48),
(35, 2, 161),
(39, 3, 25),
(40, 3, 35),
(41, 3, 15),
(42, 3, 26),
(43, 7, 14),
(44, 7, 51),
(45, 7, 22),
(46, 7, 42),
(47, 7, 5),
(48, 4, 8),
(49, 4, 49),
(50, 4, 29),
(51, 4, 41),
(52, 4, 12),
(58, 9, 37),
(59, 9, 27),
(60, 9, 36),
(61, 9, 44),
(62, 9, 40),
(63, 7, 46),
(64, 2, 18),
(65, 9, 38),
(66, 2, 47),
(68, 6, 226);

-- --------------------------------------------------------

--
-- Table structure for table `SP17_fdg_points`
--

CREATE TABLE `SP17_fdg_points` (
  `pfdg_points_id` int(11) NOT NULL,
  `pfdg_id` int(11) NOT NULL,
  `pfdg_event_id` int(11) NOT NULL,
  `pfdg_points_points` decimal(5,1) NOT NULL DEFAULT 0.0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `SP17_fdg_reports`
--

CREATE TABLE `SP17_fdg_reports` (
  `pfdg_report_id` int(11) NOT NULL,
  `pfdg_id` int(11) NOT NULL,
  `pfdg_report_start_date` datetime NOT NULL,
  `pfdg_report_end_date` datetime NOT NULL,
  `pfdg_report_hours` decimal(5,1) DEFAULT NULL,
  `pfdg_report_description` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SP17_fdg_reports`
--

INSERT INTO `SP17_fdg_reports` (`pfdg_report_id`, `pfdg_id`, `pfdg_report_start_date`, `pfdg_report_end_date`, `pfdg_report_hours`, `pfdg_report_description`) VALUES
(1, 7, '2017-01-23 18:00:00', '2017-01-23 19:00:00', '1.0', 'We talked and watched friends'),
(2, 7, '2017-01-30 18:00:00', '2017-01-30 19:00:00', '1.0', 'We went to avenue 209 and talked about our first week of classes'),
(3, 7, '2017-02-06 18:00:00', '2017-02-06 19:00:00', '1.0', 'We played board games in Fairview Suites.'),
(4, 7, '2017-02-13 18:00:00', '2017-02-13 19:00:00', '1.0', 'We decorated cookies for valentines day'),
(5, 7, '2017-02-20 18:00:00', '2017-02-20 19:00:00', '1.0', 'We met in fairview and discussed the egg hunt and ideas for the dance for fdg wars'),
(7, 7, '2017-02-27 18:00:00', '2017-02-27 19:00:00', '1.0', 'We watched a movie in Fairview.'),
(8, 7, '2017-03-06 18:00:00', '2017-03-06 19:00:00', '1.0', 'We finished watching our movie from last week.'),
(9, 7, '2017-03-20 18:00:00', '2017-03-20 19:00:00', '1.0', 'We did not meet yet'),
(10, 7, '2017-03-20 18:00:00', '2017-03-20 19:00:00', '1.0', 'We went to the ice shack to talk about spring break.'),
(11, 7, '2017-03-27 18:00:00', '2017-03-27 19:00:00', '1.0', 'We met in Fairview to discuss our dance for the end of the year.'),
(12, 7, '2017-04-03 18:00:00', '2017-04-03 19:00:00', '1.0', 'We went to Creekside for dinner together'),
(13, 7, '2017-04-10 18:00:00', '2017-04-10 19:00:00', '1.0', 'We met and planned our dance for fdg wars.'),
(14, 7, '2017-04-17 17:00:00', '2017-04-17 18:00:00', '1.0', 'We started to learn our dance for FDG wars at the honors house'),
(15, 2, '2017-01-25 19:00:00', '2017-01-25 20:00:00', '1.0', 'We played games at Melissa\'s apartment'),
(16, 3, '2017-01-26 19:00:00', '2017-01-26 20:00:00', '1.0', 'Met at fairview. Played pool and discussed the rest of the semester.'),
(17, 3, '2017-02-02 19:00:00', '2017-02-02 20:00:00', '1.0', 'Met at Lower Bentley for dinner'),
(18, 3, '2017-02-09 19:00:00', '2017-02-09 20:00:00', '1.0', ''),
(19, 3, '2017-02-16 19:00:00', '2017-02-16 20:00:00', '1.0', ''),
(20, 3, '2017-02-23 19:00:00', '2017-02-23 20:00:00', '1.0', ''),
(21, 3, '2017-03-02 19:00:00', '2017-03-02 20:00:00', '1.0', ''),
(22, 3, '2017-02-09 19:00:00', '2017-02-09 20:00:00', '1.0', ''),
(23, 3, '2017-03-09 00:00:00', '2017-03-09 01:00:00', '1.0', ''),
(24, 3, '2017-03-23 00:00:00', '2017-03-23 01:00:00', '1.0', ''),
(25, 3, '2017-03-30 19:00:00', '2017-03-30 20:00:00', '1.0', ''),
(27, 2, '2017-02-01 18:45:00', '2017-02-01 19:45:00', '1.0', 'we ate dinner at lower bentley'),
(28, 5, '2017-01-26 00:00:00', '2017-01-26 01:00:00', '1.0', ''),
(29, 5, '2017-02-02 00:00:00', '2017-02-02 01:00:00', '1.0', ''),
(30, 6, '2017-01-24 17:30:00', '2017-01-24 18:30:00', '1.0', 'Met in Fairview to catch up with each other after break and relax from the stressful first week'),
(31, 6, '2017-02-14 17:30:00', '2017-02-14 18:30:00', '1.0', 'Met in the fireplace lounge and discussed our dance and played cards. Also discussed meeting time changes.'),
(32, 6, '2017-01-31 17:30:00', '2017-01-31 18:30:00', '1.0', 'Went down to avenue 209 for coffee'),
(33, 6, '2017-02-07 17:30:00', '2017-02-07 18:30:00', '1.0', 'Ate dinner at Bentley as a group.'),
(38, 6, '2017-02-20 17:30:00', '2017-02-20 18:30:00', '1.0', 'Meeting in fairview kitchen to bake chocolate chip cookies.'),
(44, 2, '2017-02-08 18:45:00', '2017-02-08 19:45:00', '1.0', 'We played games'),
(45, 9, '2017-01-25 18:30:00', '2017-01-25 19:30:00', '1.0', 'We went to Upper Bentley for dinner and caught up after a long and eventful winter break!'),
(46, 9, '2017-02-01 18:30:00', '2017-02-01 19:30:00', '1.0', 'We met in the Honors House to work out our group scheduling issues and then had a rousing debate regarding whether or not BeyoncÃ© actually gave birth to Blue Ivy or had a surrogate and faked it all. #itsaconspiracy'),
(47, 9, '2017-02-07 18:30:00', '2017-02-07 19:30:00', '1.0', 'We did something....forgot to put this one in. But we definitely met that day because I have a picture in my phone of Taylor\'s shoe which broke and the picture is from 2/7.'),
(48, 9, '2017-02-14 18:30:00', '2017-02-14 19:30:00', '1.0', 'We achieved our year-long dream of playing hide and seek in Walmart.'),
(49, 9, '2017-02-21 18:30:00', '2017-02-21 19:30:00', '1.0', 'We \"Netflix and chilled\" in the Honors House and watched a couple of Parks and Recreation episodes'),
(50, 9, '2017-02-28 18:30:00', '2017-02-28 19:30:00', '1.0', 'We played Clue and despite Spencer having an extremely complex and detailed system for how to win, Hannah still won.'),
(51, 9, '2017-03-07 18:30:00', '2017-03-07 19:30:00', '1.0', 'We played Clue again and this time some devious cheating happened resulting in suspension of the game, but don\'t worry we all had a good laugh about it.'),
(54, 9, '2017-03-28 18:30:00', '2017-03-28 19:30:00', '1.0', 'We went to Ice Shack!'),
(55, 9, '2017-04-04 18:30:00', '2017-04-04 19:30:00', '1.0', 'We harvested rocks from the dike and painted them out on the porch of the Honors House!'),
(56, 9, '2017-04-11 18:00:00', '2017-04-11 19:00:00', '1.0', 'We met at the Honors House to discuss ideas for our FDG Wars shirts and dance.'),
(57, 9, '2017-04-18 18:30:00', '2017-04-18 19:30:00', '1.0', 'We began planning for our FDG Wars dance.'),
(58, 9, '2017-04-25 18:30:00', '2017-04-25 19:30:00', '1.0', 'This meeting did not happen yet'),
(59, 9, '2017-05-02 18:30:00', '2017-05-02 19:30:00', '1.0', 'This meeting did not happen yet'),
(60, 5, '2017-02-09 05:30:00', '2017-02-09 06:30:00', '1.0', 'made slime at Regina\'s apartment'),
(61, 4, '2017-01-24 00:00:00', '2017-01-24 01:00:00', '1.0', 'Today we made some cookies at justin apartment and went over our winter breaks!'),
(63, 4, '2017-01-31 17:00:00', '2017-01-31 18:00:00', '1.0', 'Today we got dinner as an FDG!'),
(64, 4, '2017-02-28 17:00:00', '2017-02-28 18:00:00', '1.0', ''),
(65, 4, '2017-02-07 17:00:00', '2017-02-07 18:00:00', '1.0', 'Today we went to the SPCA'),
(66, 4, '2017-02-14 14:00:00', '2017-02-14 15:00:00', '1.0', 'today we celebrated valentines day with some brownies and cookies!'),
(67, 2, '2017-02-15 18:30:00', '2017-02-15 19:30:00', '1.0', 'We attended parts of the boys and girls basketball games.'),
(68, 5, '2017-02-09 00:00:00', '2017-02-09 01:00:00', '1.0', ''),
(69, 5, '2017-02-16 00:00:00', '2017-02-16 01:00:00', '1.0', ''),
(70, 2, '2017-02-22 18:45:00', '2017-02-22 19:45:00', '1.0', 'We went to the PUB game room and played games'),
(71, 4, '2017-02-21 17:30:00', '2017-02-21 18:30:00', '1.0', 'Played cards against humanity with my FDG. All students were in attendance and there were no conflicts.'),
(72, 2, '2017-03-01 18:30:00', '2017-03-01 19:30:00', '1.0', 'we played Mario Kart'),
(73, 4, '2017-02-28 17:00:00', '2017-02-28 18:00:00', '1.0', 'This week my FDG went to Texas Restaurant for a group dinner.'),
(74, 5, '2017-03-23 00:00:00', '2017-03-23 01:00:00', '1.0', ''),
(75, 5, '2017-02-23 00:00:00', '2017-02-23 01:00:00', '1.0', ''),
(76, 5, '2017-03-02 00:00:00', '2017-03-02 01:00:00', '1.0', ''),
(77, 6, '2017-02-27 17:30:00', '2017-02-27 18:30:00', '1.0', 'Played card games in Fairview fireplace lounge.'),
(78, 6, '2017-03-06 17:30:00', '2017-03-06 18:30:00', '1.0', 'Drove over to the SPCA to see all the animals.'),
(79, 2, '2017-03-08 18:45:00', '2017-03-08 19:45:00', '1.0', 'We had a study session at the library'),
(80, 4, '2017-03-07 17:00:00', '2017-03-07 18:00:00', '1.0', 'This week we went to Ice Shack for some good food and fun conversation!'),
(81, 8, '2017-03-09 17:00:00', '2017-03-09 18:00:00', '1.0', 'We went to Avenue 209 for coffee'),
(82, 8, '2017-03-02 17:00:00', '2017-03-02 18:00:00', '1.0', 'We had a very relaxed meeting where we talked about Game Show Extravaganza and had food.'),
(83, 8, '2017-02-23 17:00:00', '2017-02-23 18:00:00', '1.0', 'We went for a walk on the dike with Chadd\'s dogs.'),
(84, 8, '2017-02-16 17:00:00', '2017-02-16 18:00:00', '1.0', 'We met at Chadd\'s house and had a tour before talking about Newly wed game.'),
(85, 8, '2017-02-09 17:00:00', '2017-02-09 18:00:00', '1.0', 'No meeting because of snow day.'),
(86, 8, '2017-02-02 17:00:00', '2017-02-02 18:00:00', '1.0', 'We met at the honor\'s house and played cards.'),
(87, 8, '2017-01-26 17:00:00', '2017-01-26 18:00:00', '1.0', 'We met at the OIP and had dinner to talk about everyone\'s winter break.'),
(88, 2, '2017-03-22 18:30:00', '2017-03-22 19:30:00', '1.0', 'we played speak out in the Honors House'),
(89, 5, '2017-03-09 00:00:00', '2017-03-09 01:00:00', '1.0', ''),
(90, 6, '2017-03-13 17:30:00', '2017-03-13 18:30:00', '1.0', 'Spring Break Week'),
(91, 6, '2017-03-20 17:30:00', '2017-03-20 18:30:00', '1.0', 'Drove over to Ice Shack for ice cream'),
(92, 6, '2017-03-27 17:30:00', '2017-03-27 18:30:00', '1.0', 'Had a study session in Fairview'),
(93, 3, '2017-03-30 19:00:00', '2017-03-30 20:00:00', '1.0', 'Going to Ice Shack'),
(94, 4, '2017-03-21 17:00:00', '2017-03-21 18:00:00', '1.0', 'We met at the honors house to play games and talk about our spring breaks!'),
(95, 4, '2017-03-28 17:00:00', '2017-03-28 18:00:00', '1.0', 'We went to dunkin donuts for food and discussed our egg hunt strategy!'),
(96, 5, '2017-03-30 17:00:00', '2017-03-30 18:00:00', '1.0', ''),
(97, 5, '2017-04-06 17:00:00', '2017-04-06 18:00:00', '1.0', ''),
(98, 6, '2017-04-03 17:30:00', '2017-04-03 18:30:00', '1.0', 'Ate dinner at Bentley and discussed our dance for FDG Wars'),
(99, 2, '2017-04-05 18:45:00', '2017-04-05 19:45:00', '1.0', 'We had a pot luck dinner at Melissa\'s apartment'),
(100, 2, '2017-03-29 18:45:00', '2017-03-29 19:45:00', '1.0', 'We had a pot luck at Melissa\'s house'),
(101, 5, '2017-04-06 00:00:00', '2017-04-06 01:00:00', '1.0', ''),
(102, 6, '2017-04-10 17:30:00', '2017-04-10 18:30:00', '1.0', 'Went to the Honors House to tie dye our tshirts for FDG Wars.'),
(103, 2, '2017-04-12 18:45:00', '2017-04-12 19:45:00', '1.0', 'We started our dance and discussed our shirts'),
(104, 3, '2017-04-06 19:00:00', '2017-04-06 20:00:00', '1.0', 'No meeting, Andy I both had prior obligations'),
(105, 3, '2017-04-13 19:00:00', '2017-04-13 20:00:00', '1.0', 'Meeting at fairview to discuss ideas for the dance and the shirts'),
(106, 5, '2017-04-13 00:00:00', '2017-04-13 01:00:00', '1.0', ''),
(107, 4, '2017-04-11 17:00:00', '2017-04-11 18:00:00', '1.0', 'This week we went hiking and explored some LHU nature.'),
(108, 4, '2017-04-04 17:00:00', '2017-04-04 18:00:00', '1.0', 'This week we watched Mulan as an FDG.'),
(109, 4, '2017-04-18 17:00:00', '2017-04-18 18:00:00', '1.0', 'This meeting we worked on our Dance for FDG wars!!'),
(110, 2, '2017-04-19 20:30:00', '2017-04-19 21:30:00', '1.0', 'We continued working on our dance and started tee shirt making'),
(111, 6, '2017-04-17 17:30:00', '2017-04-17 18:30:00', '1.0', 'Did not meet will have two hour meeting next week.'),
(112, 6, '2017-04-24 17:30:00', '2017-04-24 18:30:00', '1.0', 'Had a two hour meeting in fairview and worked on our dance.'),
(113, 3, '2017-04-20 19:00:00', '2017-04-20 20:00:00', '1.0', 'Went to the Rec to play some games'),
(114, 7, '2017-04-24 18:00:00', '2017-04-24 19:00:00', '1.0', 'We met at the Honors house to work on our dance for FDG wars'),
(115, 2, '2017-04-26 17:45:00', '2017-04-26 18:45:00', '1.0', 'We worked on our dance at the honors'),
(116, 5, '2017-04-20 00:00:00', '2017-04-20 01:00:00', '1.0', ''),
(117, 5, '2017-04-27 00:00:00', '2017-04-27 01:00:00', '1.0', ''),
(118, 5, '2017-05-04 00:00:00', '2017-05-04 01:00:00', '1.0', ''),
(119, 6, '2017-05-01 17:30:00', '2017-05-01 18:30:00', '1.0', 'Worked on our dance in Fairview.'),
(120, 8, '2017-03-23 17:00:00', '2017-03-23 18:00:00', '1.0', 'We started talking about our dance for FDG wars and deciding what we wanted our shirts to look like.'),
(121, 8, '2017-03-30 17:00:00', '2017-03-30 18:00:00', '1.0', 'We discussed our dance for FDG wars.'),
(122, 8, '2017-04-06 17:00:00', '2017-04-06 18:00:00', '1.0', 'We went to Ice Shack and discussed ideas for songs for the dance.'),
(123, 8, '2017-04-13 17:00:00', '2017-04-13 18:00:00', '1.0', 'We discussed our shirts and ordered them for FDG wars.'),
(124, 8, '2017-04-20 17:00:00', '2017-04-20 18:00:00', '1.0', 'We worked on our dance for FDG wars.'),
(125, 8, '2017-04-27 17:00:00', '2017-04-27 18:00:00', '1.0', 'We worked on our dance for FDG wars.'),
(126, 7, '2017-05-01 18:00:00', '2017-05-01 19:00:00', '1.0', 'We met at the honors house to practice our dance for FDG wars.'),
(127, 2, '2017-05-03 18:45:00', '2017-05-03 20:45:00', '2.0', 'We finished our dance'),
(128, 3, '2017-05-04 19:00:00', '2017-05-04 20:00:00', '1.0', 'Meeting at the honors house to film our dance'),
(129, 3, '2017-04-27 19:00:00', '2017-04-27 20:00:00', '1.0', 'Met at the Rec to practice our dance'),
(130, 8, '2017-05-04 17:00:00', '2017-05-04 18:00:00', '1.0', 'We finalized our dance and prepared for FDG wars on Saturday.'),
(131, 4, '2017-05-02 17:00:00', '2017-05-02 18:00:00', '1.0', ''),
(132, 4, '2017-04-25 17:00:00', '2017-04-25 18:00:00', '1.0', ''),
(133, 5, '2017-05-04 00:00:00', '2017-05-04 01:00:00', '1.0', '');

-- --------------------------------------------------------

--
-- Table structure for table `SP17_pif`
--

CREATE TABLE `SP17_pif` (
  `pif_id` int(11) NOT NULL,
  `pif_start_date` datetime NOT NULL,
  `pif_end_date` datetime NOT NULL,
  `pif_title` varchar(60) NOT NULL,
  `pif_description` varchar(250) DEFAULT NULL,
  `pif_bg_color` varchar(7) DEFAULT '#0000ff',
  `pif_ft_color` varchar(7) DEFAULT '#ffffff'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SP17_pif`
--

INSERT INTO `SP17_pif` (`pif_id`, `pif_start_date`, `pif_end_date`, `pif_title`, `pif_description`, `pif_bg_color`, `pif_ft_color`) VALUES
(1, '2017-02-16 19:00:00', '2017-02-16 20:00:00', 'Our Nations Crises', 'Topics in Sex trafficking, animal cruelty, socioeconomic status, drugs and environment', '#0000ff', '#ffffff'),
(2, '2017-03-23 19:00:00', '2017-03-23 20:30:00', 'PIF #2', 'The second PIF of the Spring17', '#0000ff', '#ffffff');

-- --------------------------------------------------------

--
-- Table structure for table `SP17_pif_stats`
--

CREATE TABLE `SP17_pif_stats` (
  `pifstat_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL,
  `pif_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SP17_pif_stats`
--

INSERT INTO `SP17_pif_stats` (`pifstat_id`, `pstu_id`, `pif_id`) VALUES
(25, 5, 1),
(26, 6, 1),
(27, 8, 1),
(28, 9, 1),
(86, 9, 2),
(29, 10, 1),
(87, 10, 2),
(30, 11, 1),
(88, 12, 2),
(31, 13, 1),
(89, 13, 2),
(90, 14, 2),
(32, 17, 1),
(33, 18, 1),
(91, 18, 2),
(34, 21, 1),
(35, 22, 1),
(36, 23, 1),
(37, 24, 1),
(92, 24, 2),
(38, 25, 1),
(93, 25, 2),
(94, 27, 2),
(39, 28, 1),
(95, 28, 2),
(96, 29, 2),
(40, 30, 1),
(41, 31, 1),
(42, 32, 1),
(97, 33, 2),
(98, 34, 2),
(99, 35, 2),
(100, 36, 2),
(102, 37, 2),
(43, 39, 1),
(103, 40, 2),
(104, 42, 2),
(44, 43, 1),
(105, 44, 2),
(108, 45, 2),
(109, 46, 2),
(45, 47, 1),
(46, 48, 1),
(106, 49, 2),
(47, 50, 1),
(107, 51, 2),
(19, 53, 1),
(58, 53, 2),
(59, 54, 2),
(60, 55, 2),
(61, 56, 2),
(62, 57, 2),
(63, 58, 2),
(65, 60, 2),
(20, 61, 1),
(21, 62, 1),
(66, 62, 2),
(67, 65, 2),
(68, 66, 2),
(69, 72, 2),
(70, 76, 2),
(22, 78, 1),
(71, 78, 2),
(72, 83, 2),
(73, 85, 2),
(74, 86, 2),
(75, 88, 2),
(76, 90, 2),
(77, 95, 2),
(111, 97, 1),
(78, 97, 2),
(79, 98, 2),
(80, 100, 2),
(81, 102, 2),
(23, 103, 1),
(82, 103, 2),
(83, 106, 2),
(84, 107, 2),
(85, 109, 2),
(48, 111, 2),
(8, 113, 1),
(49, 113, 2),
(9, 115, 1),
(10, 124, 1),
(11, 133, 1),
(50, 133, 2),
(12, 137, 1),
(51, 137, 2),
(53, 143, 2),
(14, 145, 1),
(54, 145, 2),
(16, 146, 1),
(15, 149, 1),
(55, 149, 2),
(17, 152, 1),
(56, 154, 2),
(18, 160, 1),
(57, 160, 2),
(1, 169, 1),
(2, 171, 1),
(3, 187, 1),
(6, 197, 1),
(7, 209, 1),
(4, 214, 1),
(24, 217, 1),
(110, 217, 2),
(13, 222, 1),
(101, 226, 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `SP17_stats`
-- (See below for the actual view)
--
CREATE TABLE `SP17_stats` (
`usr_fname` varchar(20)
,`usr_lname` varchar(35)
,`usr_school_id` varchar(4)
,`usr_id` int(11)
,`acad_events` decimal(29,2)
,`ags` decimal(29,2)
,`com_hours` decimal(30,2)
,`pifs` bigint(21)
,`fdg` decimal(28,2)
,`capstone` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `SP18_academicevents`
--

CREATE TABLE `SP18_academicevents` (
  `acad_id` int(11) NOT NULL,
  `acad_title` varchar(60) NOT NULL,
  `acad_description` varchar(200) NOT NULL,
  `acad_start_date` datetime NOT NULL,
  `acad_end_date` datetime NOT NULL,
  `acad_bg_color` varchar(7) DEFAULT '#0000ff',
  `acad_ft_color` varchar(7) DEFAULT '#ffffff'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `SP18_academicevent_attendence`
--

CREATE TABLE `SP18_academicevent_attendence` (
  `acad_att_id` int(11) NOT NULL,
  `acad_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `SP18_activitygroup`
--

CREATE TABLE `SP18_activitygroup` (
  `ag_id` int(11) NOT NULL,
  `ag_title` varchar(40) NOT NULL,
  `ag_description` varchar(500) NOT NULL,
  `ag_imagepath` varchar(30) DEFAULT NULL,
  `ag_bg_color` varchar(7) DEFAULT '#0000ff',
  `ag_ft_color` varchar(7) DEFAULT '#ffffff'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `SP18_activitygroupleaders`
--

CREATE TABLE `SP18_activitygroupleaders` (
  `ag_leaders` int(11) NOT NULL,
  `ag_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `SP18_activitygroupsession`
--

CREATE TABLE `SP18_activitygroupsession` (
  `agses_id` int(11) NOT NULL,
  `ag_id` int(11) NOT NULL,
  `agses_start_time` datetime NOT NULL,
  `agses_end_time` datetime NOT NULL,
  `agses_description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `SP18_activitygroupstats`
--

CREATE TABLE `SP18_activitygroupstats` (
  `agstat_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL,
  `agses_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `SP18_com_serv`
--

CREATE TABLE `SP18_com_serv` (
  `com_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL,
  `com_title` varchar(50) NOT NULL,
  `com_advisor` varchar(60) NOT NULL,
  `com_advisor_contact` varchar(60) NOT NULL,
  `com_description` varchar(500) NOT NULL,
  `com_date` datetime NOT NULL,
  `com_hours` decimal(5,1) NOT NULL,
  `com_verified` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SP18_com_serv`
--

INSERT INTO `SP18_com_serv` (`com_id`, `pstu_id`, `com_title`, `com_advisor`, `com_advisor_contact`, `com_description`, `com_date`, `com_hours`, `com_verified`) VALUES
(1, 50, 'Jazz Ensemble Valet Parking', 'Kathy Brown', '7068970596', 'The Lock Haven women\'s soccer team assisted in parking for the Jazz Ensemble at the Durrwachter Alumni Conference Center.', '2017-08-18 20:00:00', '2.0', 2),
(2, 50, 'Movers & Shakers', 'Kathy Brown', '7068970596', 'The Lock Haven Women\'s soccer team assisted in move-in for the second floor at Fairview Suites.', '2017-08-23 09:00:00', '1.0', 2),
(3, 50, 'Convocation', 'Lynn Maggs', 'lmm177@lockhaven.edu', 'Held the banner for faculty that were speaking during the event.', '2017-08-27 00:00:00', '1.0', 2),
(4, 44, 'Move and Shake', 'Allison Reed', 'amr794@lockhaven.edu', 'Helped incoming Honors freshmen move into fairview.', '2017-08-22 11:30:00', '3.0', 2),
(5, 34, 'moving and shaking', 'Allison Reed', 'honors@lockhaven.edu', 'spent the day moving in honors freshman', '2017-08-22 12:00:00', '2.0', 2),
(6, 28, 'Movers and shakers', 'Ashley Spencer', 'aspencer@lockhaven.edu', 'New student move in', '2017-08-23 08:00:00', '8.0', 2),
(7, 28, 'Movers/shakers', 'Ashley Spencer', 'aspencer@lockhaven.edu', 'New Student Move in', '2017-08-24 07:30:00', '6.0', 2),
(8, 59, 'Mover and Shakers', 'Honors Program', 'honors@lockhaven.edu', 'I helped the freshman honors students move into the dorms and assisted them by answering any questions they had.', '2017-08-22 11:30:00', '2.0', 2),
(9, 31, 'Movers and Shakers', 'Rachael Metzinger', 'rxm2509@lockhaven.edu', 'Moving students into fairview', '2017-08-21 12:30:00', '2.0', 2),
(10, 31, 'Movers and Shakers', 'Rachael Metzinger', 'rxm2509@lockhaven.edu', 'Moving students into Fairview', '2017-08-23 12:30:00', '2.0', 2),
(11, 31, 'Movers and Shakers', 'Micheal Heck', 'Resident Director at Fairview Suites', 'Moving Students into Fairview', '2017-08-24 11:30:00', '3.0', 2),
(12, 31, 'Movers and Shakers', 'Micheal Heck', 'Resident Director at Fairview Suites', 'Moving Students into Fairview', '2017-08-24 11:30:00', '3.0', 2),
(13, 31, 'Movers and Shakers', 'Micheal Heck', 'Resident Director at Fairview Suites', 'Moving Students into Fairview', '2017-08-24 11:30:00', '3.0', 2),
(14, 47, 'BINGO', 'Kathy Brown (Coach)', '7068970596', 'Worked the bingo event with Volleyball team', '2017-09-04 02:00:00', '1.0', 2),
(15, 47, 'Valet Parking', 'Kathy Brown (Coach)', '7068970596', 'Valet parked for the guests attending the Jazz Concert', '2017-08-18 18:00:00', '2.0', 2),
(16, 50, 'LHU Bingo', 'Kathy Brown', '7068970596', 'The women\'s soccer team and volleyball team hosted a Bingo at Sloan Auditorium. Players helped run event by setting up, calling numbers and handing out prizes.', '2017-09-04 14:00:00', '1.0', 2),
(17, 47, 'LHU student move in', 'kathy Brown (Coach)', '7068970596', 'helped move new students into their dorms', '2017-08-24 10:00:00', '2.0', 2),
(18, 22, 'Honors Movers and Shakers 2017', 'Rachael Metzinger', 'rxm2509@lockhaven.edu', 'Helped students move and shake in both Woolridge and Smith Halls.', '2017-08-22 00:00:00', '2.0', 2),
(19, 110, 'International Orientation Week', 'John Gradel', 'jrg5874@lockhaven.edu', 'I volunteered from August 24th until August 27th to accompany international students to various information sessions and events. Our goal was to give them valuable knowledge that they will need for their time here, as well as get them acclimated to campus and show them what Lock Haven University has to offer.', '2017-08-24 12:00:00', '20.0', 2),
(20, 217, 'Honors movers and shakers', 'Allison', 'Honors@lockhaven.edu', 'Help incoming freshmen move in', '2017-08-22 11:30:00', '2.0', 2),
(21, 231, 'Red cross Blood drive', 'Lauren A. Wright', 'law3363@lockhaven.edu', 'I will be volunteering as staff at the blood drive', '2017-09-12 16:00:00', '3.0', 2),
(22, 231, 'Academic Majors Fair', 'Kelly Hibbler', 'KHibbler@lockhaven.edu / 570-502-2374', 'Helping do the raffle at the Academic Majors fair', '2017-09-07 17:30:00', '2.0', 2),
(23, 103, 'Cleanscapes River Clean Up', 'Sara Galbraith', 'sng565@lockhaven.edu', 'We went into the Susquehanna River and removed garbage and tires.', '2017-09-09 09:00:00', '4.0', 2),
(24, 34, 'River Clean-up', 'Sara Galbraith', 'sng565@lockhaven.edu', 'I spent the morning wading through susquehanna river with the Clinton County Cleanscapes association clearing debris out of the river.', '2017-09-09 09:00:00', '3.0', 2),
(25, 84, 'River Cleanup', 'Sara Galbraith', 'sng565@lockhaven.edu', 'Helped pull tires and trash out of the Susquehanna', '2017-09-09 09:00:00', '4.0', 2),
(26, 22, 'Clinton County Clean Scapes River Clean Up', 'Sara Galbraith', 'sng565@lockhaven.edu', 'Our group waded through the water pulling out tires and pieces of trash stuck on the the bottom of the river.', '2017-09-09 00:00:00', '3.0', 2),
(27, 10, 'Convocation', 'Rachael Metzinger', '570-985-4764', 'I assisted with Convocation', '2017-08-27 12:00:00', '1.0', 2),
(28, 12, 'Academic Majors Fair', 'Kelly Hibbler', 'KHibbler@lockhaven.edu', 'I scanned people in, and gave newcomers direction around the fair.', '2017-09-07 17:30:00', '2.0', 2),
(29, 107, 'Susquehanna River Cleanup', 'Sara Galbraith', 'sng565@lockhaven.edu', 'Assisted Clinton County Cleanscapes in pulling tires  and junk out of part of the Susquehanna River to  improve the local environment and the community.', '2017-09-09 09:00:00', '5.0', 2),
(30, 159, '9/11 Moving Tribute', 'Jonathan Britton', 'jmb946@lockhaven.edu', 'Keeping the American Flag in constant motion to honor and remember those involved on 9/11.', '2017-09-11 06:00:00', '1.0', 2),
(31, 91, 'FROSH tutor', 'Amy Downes', '570-932-0850', 'tutor for the FROSH program in Fairview Suites', '2017-09-06 21:00:00', '1.0', 2),
(32, 69, 'CleanScape Cleanup', 'Sara Galbraith', 'sng565@lockhaven.edu', 'Cleaned up trash/removed tires from the Susquehanna River.', '2017-09-09 09:00:00', '4.0', 2),
(33, 48, 'Movers and Shakers', 'Aaron Russell', 'arussell@lockhaven.edu', 'Helped freshman move into Smith, Woolridge, and Fairview residence halls', '2017-08-31 12:00:00', '4.0', 2),
(34, 48, 'Whelan Event Services', 'Aaron Russell', 'arussell@lockhaven.edu', 'Working PSU games as member of on-field security staff or gate-entrance security staff', '2017-09-09 11:00:00', '0.0', 3),
(35, 48, 'Whelan Event Services', 'aaron russell', 'arussell@lockhaven.edu', 'worked as member of on-field security and gate-entrance security', '2017-09-09 11:00:00', '7.0', 2),
(36, 24, 'River Clean Up', 'Sara Galbraith', 'sng565@lockhaven.edu', 'I helped pull tires out of the river for Clinton County Cleanscapes.', '2017-09-09 09:00:00', '5.0', 2),
(37, 234, 'River Clean Up', 'Sara Galbraith', 'sng565@lockhaven.edu', 'Cleaning up the Susquehanna.', '2017-09-09 00:00:00', '4.0', 2),
(38, 258, 'Blood Drive Donation', 'Marge Smith', '18662363276', 'I donated a bag of blood for the Red Cross Blood Drive on 9/12/17', '2017-09-12 12:00:00', '1.0', 2),
(39, 24, 'Red Cross Blood Drive', 'Lauren Wright', 'law3363@lockhaven.edu', 'I helped out at the canteen table giving people food and water.', '2017-09-12 03:15:00', '4.0', 2),
(40, 46, 'Red Cross Blood Drive', 'Lauren Wright', 'law3363@lockhaven.edu', 'I worked the service table and watched after donors after they finished donating.', '2017-09-12 13:00:00', '6.0', 2),
(41, 269, 'Blood Drive', 'Lauren Wright', 'law3363@lockhaven.edu', 'I helped set up the refreshment table and then stayed to work it.', '2017-09-12 11:30:00', '2.0', 2),
(42, 48, 'Whelan Event Services', 'Aaron Russell', 'arussell@lockhaven.edu', 'Member of the on-field and hate-entry security staff at Penn State University\'s Beaver Stadium', '2017-09-09 10:00:00', '6.0', 2),
(43, 46, 'Red Cross Blood Drive', 'Lauren Wright', 'law3363@lockhaven.edu', 'I worked at the recovery table and helped donors eat and drink after they had donated.', '2017-09-13 16:30:00', '3.0', 2),
(44, 60, 'CCC River Clean Up', 'Lauren Wright', 'law3363@lockhaven.edu', 'Went with Clinton County Cleanscapes to do a river cleanup.  Pulled trash out of the river', '2017-09-09 09:00:00', '5.0', 2),
(45, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Major Sharon Cupp', '570-748-2951', 'I teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2017-09-13 17:15:00', '2.0', 2),
(46, 28, 'Blood Donation', 'N/A', 'N/A', '! hour, blood donation.', '2017-09-12 13:00:00', '1.0', 2),
(47, 28, '9/11 Memorial Run', 'Mathew Henry', 'mjh7610@lockhaven.edu', 'Memorial flag run for 9/11 tribute.', '2017-09-11 13:00:00', '1.0', 2),
(48, 103, 'Honors Freshmen Move in and BBQ', 'Rachael Metzinger', 'rxm2509@lockhaven.edu', 'We helped move the new honors freshmen in and helped out at the orientation BBQ', '2017-08-22 12:00:00', '3.0', 2),
(49, 103, 'House clean up', 'Rachael Metzinger', 'rxm2509@lockhaven.edu', 'We cleaned up the basement and other parts of the Honor\'s House.', '2017-09-14 19:00:00', '1.0', 2),
(50, 103, 'Blood Drive', 'Rachael Metzinger', 'rxm2509@lockhaven.edu', 'I gave blood to save lives.', '2017-09-13 16:30:00', '1.0', 2),
(51, 24, 'Red Cross Blood Drive', 'Lauren Wright', 'law3363@lockhaven.edu', 'I helped out at the canteen table.', '2017-09-13 16:30:00', '3.0', 2),
(52, 69, 'Red Cross Blood Drive', 'Lauren Wright', 'law3363@lockhaven.edu', 'Served refreshments and snacks to donors, walked around campus passing out flyers for the blood drive', '2017-09-12 13:30:00', '3.0', 2),
(53, 243, 'River Clean Up', 'Sara Galbraith', 'sng565@lockhaven.edu', 'Land Crew River Clean Up. Pulling tires out of the river.', '2017-09-09 09:00:00', '5.0', 2),
(54, 34, 'Red Cross Blood Drive', 'The Red Cross', 'redcross.org', 'I donated Blood on 9/12/17.', '2017-09-12 15:45:00', '1.0', 2),
(55, 126, 'Blood Drive', 'Red Cross', '5703269131', 'I donated a pint of blood to the red cross', '2017-09-12 00:00:00', '1.0', 2),
(56, 8, 'Lock Haven Shoe Bank', 'Wendy Stiver', 'Wstiver@lockhaven.com', 'Help kids find and try on new shoes.', '2017-09-16 00:00:00', '4.0', 2),
(57, 91, 'FROSH tutor', 'Amy Downes', '5709320850', 'I tutor for the FROSH program in Fairview Suites', '2017-09-13 21:00:00', '1.0', 2),
(58, 17, 'Convocation Volunteer', 'Stacey Masorti', 'sjm1038@lockhaven.edu', 'Scanned student Id\'s and handed out programs for the convocation', '2017-08-27 12:00:00', '2.0', 2),
(59, 248, 'Release the Beasts', 'Eric Shuffelbottom', '7179688115', 'Went to the Lock Haven SPCA and played with the dogs and cats', '2017-09-19 12:30:00', '1.0', 2),
(60, 255, 'Clinton County CleanScapes River Clean Up', 'Sara Galbraith', 'sng565@lockhaven.edu', 'I helped clean out the Susquehanna River by taking tires out of the river.', '2017-09-09 09:00:00', '5.0', 2),
(61, 255, 'Red Cross Blood Drive', 'Lauren Wright', 'law3363@lockhaven.edu', 'I wore a blood drop costume and provided the campus with information about the Blood drive.', '2017-09-12 13:00:00', '3.0', 2),
(62, 243, 'Red Cross Blood Bank', 'Lauren Wright', 'law3363@lockhaven.edu', 'Wore red blood drop outfit as well as making sure that students and community members receive food and snacks after they donated blood.', '2017-09-12 13:00:00', '4.0', 2),
(63, 64, 'PAWS', 'Kelsey Shampoe', 'med_asst@centrecountypaws.org', 'Transported cats to and from their vet appointments.', '2017-08-24 09:00:00', '2.0', 2),
(64, 64, 'Centre County PAWS', 'Kelsey Shampoe', 'med_asst@centrecountypaws.org', 'Transported cats to and from vet appointments', '2017-08-25 12:00:00', '2.0', 2),
(65, 91, 'FROHS tutor', 'Amy Downes', '570-932-0850', 'I tutor for the FROSH program at Fairview Suites', '2017-09-20 21:00:00', '1.0', 2),
(66, 227, 'Clinton County CleanScapes River Clean Up', 'Lauren Wright', 'law3363@lockhaven.edu', 'We went to the river and took tires out of the water', '2017-09-09 08:00:00', '4.0', 2),
(67, 227, 'Trail Clean Up', 'Jared Brandt', 'jdb5820@lockhaven.edu', 'The environmental club went on the lock haven nature trail and picked up trash along our way, filling up about 5 bags.', '2017-09-20 17:00:00', '1.0', 2),
(68, 31, 'Golf cart clean up', 'Tom bates', 'Sad', 'Took down honors cart', '2017-09-21 19:00:00', '1.0', 2),
(69, 8, 'Farm city family fun fest', 'Susie Peters', 'speters@clintoncountypa.com', 'Worked art station', '2017-09-23 00:00:00', '4.0', 2),
(70, 227, 'Farm-City Festival', 'Susie Peters', 'speters@clintoncountypa.com', 'We went to the far and did whatever they needed us to do, such as work the registration table, put up signs, clean up and set up, and work at the kids\' crafts table', '2017-09-23 08:00:00', '7.0', 2),
(71, 242, 'River Clean Up', 'Sara Galbraith', 'sng565@lockhaven.edu', 'Cleaned up tires stuck in the Susquehanna river.', '2017-09-09 09:15:00', '4.0', 2),
(72, 233, '2017 River Cleanup', 'Sara Galbraith', 'sng565@lockhaven.edu', 'Pulling tires out of the Susquehanna all day', '2017-09-09 09:00:00', '4.0', 2),
(73, 151, 'Out of The Darkness Suicide Awareness Walk', 'Heather Garbrick', 'gidget8472@gmail.com', 'We walked in memory of those who have committed suicide, and to draw attention to this issue.', '2017-09-24 12:00:00', '3.0', 2),
(74, 160, 'CAC- Block Party Table', 'Alyssa Henry', '717-348-7816', 'I volunteered at the College\'s Against Cancer table at the homecoming block party. During the block party we spread awareness for child cancer by giving out free yellow lollipops with facts about childhood cancer attached to them. We also spread the word to the community about the mission of our club and collected donations for the American Cancer Society.', '2017-09-23 17:30:00', '3.0', 2),
(75, 103, 'Greenhouse Clean-Up', 'Dr. Joseph Calabrese', 'jcalabre@lockhaven.edu', 'Helped Professor Calabrese clean the greenhouse on campus near the rec center.', '2017-09-24 10:30:00', '1.0', 2),
(76, 43, 'Farm-City Family Festival', 'Susie Peters', 'speters@clintoncountypa.com', 'I helped with crafts at the festival', '2017-09-23 08:30:00', '6.0', 2),
(77, 115, '9/11 Memorial Ride', 'Todd Winder', '570-971-2685', 'My volunteer fire department holds an event every year to honor the fallen Americans of the 9/11 tragedy. This year I assisted with the memorial throughout the whole day worth of events. This included setting up the ride, volunteering on the ambulance as an EMT, and doing any odd jobs around the station that needed my help. This is a county wide event that has a large impact in our community.', '2017-09-11 07:00:00', '12.0', 2),
(78, 248, 'Release the Beasts', 'Eric Shuffelbottom', '7179688115', 'Went to Lock Haven SPCA and washed and played with cats and dogs', '2017-09-26 12:30:00', '1.0', 2),
(79, 159, 'Red Cross Blood Donation', 'Marge Smith', 'marge.smith@redcross.org', 'I donated blood with Red Cross when they came to campus', '2017-09-13 18:00:00', '1.0', 2),
(80, 272, 'Movers and Shakers', 'Rachael Metzinger', 'honors_program@lockhaven.edu', 'Helped University Move-in', '2017-08-24 00:00:00', '14.0', 2),
(81, 72, 'Cleaning the Honors House', 'Tom', 'twb9017@lockhaven.edu', 'I helped the Special Events Committee clean up the honors house', '2017-09-28 00:00:00', '1.0', 2),
(82, 248, 'Release the Beasts', 'Eric Shuffelbottom', '7179688115', 'Helped decorate the lobby for fall', '2017-10-03 12:30:00', '1.0', 2),
(83, 243, 'Release the Beasts', 'Eric', 'All I know is he is in honors, couldn\'t find contact info', 'Volunteering as the SPCA to walk and play with both cats and dogs that do not have permanent homes or owners. We give them love.', '2017-09-19 12:30:00', '1.0', 2),
(84, 98, 'Cleanscapes River Clean up', 'LHU mountain serve', '570-484-2495', 'Worked to help remove tires and other trash from the river.', '2017-09-09 09:00:00', '4.0', 2),
(85, 98, 'LHU Movers and Shakers', 'Allison Reed', '570-484-2053', 'Helped move freshmen into the residence halls during orientation.', '2017-08-23 09:00:00', '2.0', 2),
(86, 98, 'Green House Clean Up', 'Dr. Calabrese', 'jcalabrese@lockhaven.edu', 'Helped to clean up and weed the Lock Haven Green House.', '2017-09-23 09:00:00', '1.0', 2),
(87, 123, 'Field Hockey Ball Girl', 'Lindsay Reese', 'lreese@lockhaven.edu', 'Volunteer as a ball girl for the women\'s field hockey team on 9/22.', '2017-09-22 14:45:00', '2.0', 2),
(88, 123, 'Penn State Football Volunteer', 'Lindsay Reese', 'lreese@lockhaven.edu', 'Volunteer with women\'s lacrosse team to provide services during Penn State Football game at entrances to stadium seating.', '2017-09-09 09:30:00', '9.0', 2),
(89, 88, 'Honors Mover and Shaker', 'Elizabeth Gruber', 'egruber@lhup.edu', 'I and several other honors students spent approximately 2 hours of our time to help move in the new global honors freshman. The duties included unpacking their vehicles, unpacking bins in their rooms, and directing them what they should do next.', '2017-08-22 12:00:00', '2.0', 2),
(90, 103, 'Domino\'s 20th Anniversary', 'Leah Frederick', 'leahf9@outlook.com', 'We held up signs outside of Domino\'s to bring in customers and played games with children while patrons waited for their food.', '2017-10-06 16:00:00', '3.0', 2),
(91, 43, 'Dominos 20th Aniversary celebration', 'Leah Frederick', 'leahf9@outlook.com', 'I helped with childrens games and handed out prizes.', '2017-10-06 15:45:00', '3.0', 2),
(92, 248, 'Decorating for SPCA', 'Marissa Henry', '5707484756', 'Helped make fall decorations for the SPCA lobby', '2017-10-06 13:30:00', '2.0', 2),
(93, 231, 'Highland Cemetery- Historical Lantern Light Tour', 'Sarah Greenzweig', 'sbg1868@lockhaven.edu, (302) 544-0002', 'Portrayed a historical character along the tour', '2017-10-06 17:00:00', '4.0', 2),
(94, 231, 'Highland Cemetery-Historical Lantern Light Tour', 'Sarah Greenzweig', 'sbg1868@lockhaven.edu, (302) 544-0002', 'Portrayed a historical character along tour- Did this for Friday and Saturday', '2017-10-07 17:00:00', '4.0', 2),
(95, 72, 'LHU Mens Soccer ID Clinic', 'Patrick Long', '15706602093', 'Helped coach with a day full of training sessions with hopeful recruits', '2017-10-08 11:30:00', '2.0', 2),
(96, 137, 'Awareness Table for ACS', 'Alyssa Henry', '717-348-7816', 'I handed out lollipops and educated people on childhood cancer. I gave them facts and statistics about childhood cancer in the United States. I also collected donations and sold t-shirts that would benefit the American Cancer Society.', '2017-09-22 00:00:00', '3.0', 2),
(97, 137, 'Breast Cancer Awareness', 'Alyssa Henry', '717348-7816', 'I sat at a table on campus handing out candy and pamphlets about breast cancer and self breast exams. I also encouraged people to decorate a bra for free so that they could be hung around campus to raise awareness for breast cancer month.', '2017-10-04 00:00:00', '2.0', 2),
(98, 120, 'Band Booster Concession Worker', 'Jenny Leuth', '814-222-0351', 'I worked in the band booster\'s concession stand at Bellefonte High School\'s football game to help support the band and their upcoming trip to Disney in November. I served as a cashier and runner during the game, taking orders and delivering the food. I also helped with set up and tear down after the game by prepping the food and helping to clean all the dishes and materials.', '2017-10-06 17:00:00', '5.0', 2),
(99, 67, 'Mentoring', 'Dr. Bruner', 'lbruner@lockhaven.edu', 'I am a mentor for the Psychology department and meet with different mentees. I talk to them about different things they may need help with throughout the semester.', '0000-00-00 00:00:00', '3.0', 2),
(100, 91, 'FROSH tutor', 'Amy Downes', '570-932-0850', 'I tutor for the FROSH program at Fairview suites', '2017-10-04 21:00:00', '1.0', 2),
(101, 91, 'FROSH tutor', 'Amy Downes', '570-932-0850', 'I tutor for the FROSH program at Fairview Suites', '2017-09-27 21:00:00', '1.0', 2),
(102, 23, 'Open House', 'Allison Reed', 'amr794@lockhaven.edu', 'I worked the open house with A-Team on 10/14', '2017-10-14 08:30:00', '2.0', 2),
(103, 34, 'Steamtown Marathon', 'Cynthia Weiss', 'cweiss@fcrsd.org', 'I went home and volunteered to help direct runners through my high school prior to the beginning of the steamtown marathon', '2017-10-08 05:30:00', '3.0', 2),
(104, 234, 'Release the Beasts', 'Eric Shufflebottom', '717-968-8115', 'Played with cats', '2017-09-19 00:30:00', '1.0', 2),
(105, 234, 'SPCA', 'Melissa Henry', '570-748-4756', 'Decorated the lobby, walked dogs', '2017-10-06 01:26:00', '2.0', 2),
(106, 23, 'Open House-Afternoon Session', 'Allison Reed', 'amr794@lockhaven.edu', 'I worked the afternoon session of the Open House with A-Team on 10/14.', '2017-10-14 13:00:00', '1.0', 2),
(107, 102, 'Open House', 'Allison Reed', 'honors@lockhaven.edu', 'I worked at the morning session of the OH. I talked to incoming students about the Honors Program and welcomed them to the University', '2017-10-14 08:00:00', '2.0', 2),
(108, 227, 'Open House', 'Allison Reed', 'amr794@lockhaven.edu', 'For the A-Team we informed and recruited prospective students into the GHP.', '2017-10-14 00:00:00', '3.0', 2),
(109, 234, 'Open House', 'Allison Reed', 'honors_program@lockhaven.edu', 'Worked the open house and interviewed.', '2017-10-14 00:00:00', '3.0', 2),
(110, 149, 'Open House', 'Allison Reed', 'honors@lhup.edu', 'I went to the open house with the Honors Admissions Team and talked to high school students about potentially joining the Honors Program. I also trained a freshman during the morning portion of the open house and trained two freshman in the afternoon when I conducted an interview with a prospective student.', '2017-10-14 08:00:00', '3.0', 2),
(111, 243, 'Open House', 'Alison Reed', 'amr794@lockhaven.edu', 'Member of the A-team. Attending open houses and talking to high school students and their parents about the honors program as well as taking part in the interviews in the afternoon session of the open house.', '2017-10-14 08:00:00', '3.0', 2),
(112, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Major Sharon Cupp', '570-748-2951', 'I teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2017-09-20 17:30:00', '2.0', 2),
(113, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Major Sharon Cupp', '570-748-2951', 'I teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2017-09-27 17:30:00', '2.0', 2),
(114, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Major Sharon Cupp', '570-748-2951', 'I teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2017-10-04 17:30:00', '2.0', 2),
(115, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Major Sharon Cupp', '570-748-2951', 'I teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2017-10-11 17:30:00', '2.0', 2),
(116, 34, 'Open House', 'Allison Reed', 'honors@lockhaven.edu', 'I participated in the open house as an Honors admissions team member in both the morning and afternoon sessions.', '2017-10-14 08:15:00', '3.0', 2),
(117, 28, 'Domestic Violence Vigil', 'Mathew Henry', 'mjh7610@lockhaven.edu', 'set up, usher attendess, and take down materials for the vigil.', '2017-10-18 17:30:00', '2.0', 2),
(118, 217, 'Pumpkin chunking festival', 'Mark Ott', 'chunkinvolunteers@gmail.com', 'Orignally assinged to direct traffic, ended up loading a mini trebuchet for  5.5 hours.', '2017-10-21 09:00:00', '5.0', 2),
(119, 66, 'HOPE Center Domestic Violence Vigil', 'Kyle McCarthy', '570-982-4940', 'Volunteered with Alpha Sigma Phi to set up, usher, and clean up Domestic Violence Vigil', '2017-10-18 17:30:00', '2.0', 2),
(120, 232, 'Jazz Jam with LHUWS', 'Kathy Brown', '706-897-0596', 'I parked cars and greeted people at the Jazz Jam which was located at the Durrwachter Center.', '2017-08-19 18:00:00', '2.0', 2),
(121, 232, 'Clinton County SPCA', 'Makenzie David', '570-404-4852', 'With my FDG group, I went to the Clinton County SPCA. While I was there I helped with the dogs and cats by giving them attention and making sure they were taken care of.', '2017-09-12 12:30:00', '1.0', 2),
(122, 142, 'Helping Hand', 'Janet Klinefelter', '(814) 777-4738', 'The Donald P. Bellisario College of Communications at Penn State University was having a banquet in honor of the donor\'s who donated scholarship money for student\'s with excellent academic standing and financial need. I helped set up tables and distribute name tags as well as directing students and donors to their designated tables.', '2017-10-22 11:00:00', '10.0', 2),
(123, 22, 'Honors A-Team Open House', 'Rachael Metzinger', 'rxm2509@lockhaven.edu', 'The Honors A-Team talked with a variety of students at the open house, making sure to tell them how great the honors program is!', '2017-10-14 00:00:00', '2.0', 2),
(124, 65, 'Socktober Donations', 'Erica Berkowitz', 'elp6665@lockhaven.edu', 'Donated 12 pairs of new socks for families in need in the Lock Haven Area', '2017-10-23 00:00:00', '2.0', 2),
(125, 65, 'HungerBowl Donations', 'Lauren Wright', 'law3363@lockhaven.edu', 'Donated 8 non-perishable food items to be given to families in need in the Lock Haven area', '2017-10-23 00:00:00', '2.0', 2),
(126, 137, 'Breast Cancer Awareness Table', 'Alyssa Henry', '717-348-7816', 'I participated in the Pink out football game and handed out flyers about breast cancer. I also gave out pink flowers and candy to people attending the game. We educated people about breast cancer and handed out informational pamphlets. This table was to raise awareness for breast cancer and honor those who are fighting breast cancer and who have beaten it.', '2017-10-21 12:00:00', '4.0', 2),
(127, 160, 'CAC-Fountain Dyeing', 'Alyssa Henry', '7173487816', 'I co-organized and ran Lock Haven University\'s annual fountain dyeing. On Ivy Lane, we had a table set up handing out cups of pink water for LHU students and facility to dump into the fountain. The event was geared to raise awareness and money for breast cancer. In addition to handing out cups of dye, we also gave out lollipops with breast cancer facts, pink ribbons, and educational brochures.', '2017-10-13 11:00:00', '2.0', 2),
(128, 160, 'CAC- October Awareness Table', 'Alyssa Henry', '7173487816', 'I co-organized and ran an awareness table outside of Bentley during the open house hours. During this time, we talked to current LHU students and prospective students and their families about breast cancer. We handed out lollipops with facts about breast cancer, pink ribbons, and educational brochures.', '2017-10-14 11:00:00', '3.0', 2),
(129, 160, 'CAC- Pink Out Football Game', 'Alyssa Henry', '7173487816', 'CAC partnered with ZTA to raise awareness for breast cancer at the home football game this past weekend. At the event, we spoke with families and students about breast cancer and handed out free goodies to spread awareness. Some items we handed out were mini footballs with pink ribbons, pink Hershey kisses, pink carnations with facts about breast cancer, and education brochures. We also collected donations at this event.', '2017-10-21 11:00:00', '4.0', 2),
(130, 68, 'Domestic Violence Vigil Set Up/Clean Up', 'Kyle McCarthy', 'kmj2080@lockhaven.edu', 'Set up and Clean up at the Domestic Violence Vigil. This was through Alpha Sigma Phi', '2017-10-18 17:30:00', '2.0', 2),
(131, 248, 'Release the Beasts', 'Eric Shuffelbottom', '7179688115', 'Walked a dog around town and socialized with her.', '2017-10-24 12:30:00', '1.0', 2),
(132, 228, 'SPCA', 'MacKenzie David', 'mkd9008@lockhaven.edu', 'Went and played with cats (my favorite was Stella)', '2017-09-12 12:30:00', '1.0', 2),
(133, 273, 'River Cleanup', 'Lauren Wright', 'Lauren Wright', 'I took pictures of everyone during the river cleanup.', '2017-09-09 09:00:00', '4.0', 2),
(134, 273, 'First Church of Christ Fall Fest', 'Steve Salmon', '570-748-3519', 'I helped run children\'s games at a fall fest for a local church.', '2017-10-14 11:00:00', '4.0', 2),
(135, 273, 'Volleyball Statistician', 'Shannon Gerencir', 'slg945@lockhaven.edu', 'I voluntarily take stats for the volleyball team during each home game.', '2017-09-22 19:00:00', '3.0', 2),
(136, 273, 'Volleyball Statistician', 'Shannon Gerencir', 'slg945@lockhaven.edu', 'I voluntarily take stats for the volleyball team during each home game.', '2017-09-23 13:00:00', '2.0', 2),
(137, 273, 'Volleyball Statistician', 'Shannon Gerencir', 'slg945@lockhaven.edu', 'I voluntarily take stats for the volleyball team during each home game.', '2017-10-06 19:00:00', '2.0', 2),
(138, 273, 'Volleyball Statistician', 'Shannon Gerencir', 'slg945@lockhaven.edu', 'I voluntarily take stats for the volleyball team during each home game.', '2017-10-07 13:00:00', '1.0', 2),
(139, 273, 'Volleyball Statistician', 'Shannon Gerencir', 'slg945@lockhaven.edu', 'I voluntarily take stats for the volleyball team during each home game.', '2017-10-10 19:00:00', '2.0', 2),
(140, 100, 'Open House A-Team', 'Allison Reed', 'honors@lockhaven.edu', 'On October 14th I volunteered through A-Team by talking to prospective LHU honors students at the open house.', '2017-10-14 08:00:00', '2.0', 2),
(141, 63, 'Scene shop volunteer', 'Ramona Broomer', 'rbroomer@lockhaven.edu', 'I helped out in the scene shop for a work call and set up lights and gathered props for the upcoming mainstage productions in Sloan Auditorium.', '2017-10-14 12:00:00', '7.0', 2),
(142, 17, 'Volunteer for soccer clinic', 'Patrick Long', '5706602093', 'Helped at soccer clinic with refereeing and water supply', '2017-10-08 11:00:00', '2.0', 2),
(143, 10, 'Open house', 'Allison Reed', '415-7022', 'I\'m on A-team', '2017-10-14 00:00:00', '1.0', 2),
(144, 135, 'Storm Runners- 3k Run/Walk for Hurricane Relief', 'Heaven Martin', 'hlm8156@lockhaven.edu', 'I assisted in set up for the run. Then during the run I directed runners and supplied prizes.', '2017-10-29 00:00:00', '4.0', 2),
(145, 100, 'CEC Halloween Party', 'Dr. Johnathan Stout', 'jstout1@lockhaven.edu', 'On October 26th I helped CEC, a club on campus, and the ASL club throw a Halloween party for children and adults with disabilities. At the party, I was in charge of an activity table and interacted with the attendees.', '2017-10-26 17:30:00', '1.0', 2),
(146, 103, 'Open House', 'Dr. Elizabeth Gruber', 'egruber@lockhaven.edu', 'Talked to prospective students about the Global Honors Program and interviewed interested students.', '2017-10-28 08:30:00', '3.0', 2),
(147, 66, 'Big Brothers Big Sisters Canning Fundraiser', 'Zack Coccio', '201-563-3661', 'Collecting donations from passing cars in town with Alpha Sigma Phi to support Big Brothers Big Sisters Foundation', '2017-10-28 00:00:00', '5.0', 2),
(148, 269, '5K at SusqueView Home', 'Susan Triponey', 'striponey@susqueviewhome.com', 'I helped set up and register the runners for the 5K that took place on October 28th.', '2017-10-28 08:00:00', '2.0', 2),
(149, 32, 'Open House', 'Allison', 'amr794@lockhaven.edu', 'A-Team-morning and afternoon session', '2017-10-28 08:15:00', '3.0', 2),
(150, 32, 'Open House', 'Allison', 'amr794@lockhaven.edu', 'A-Team-morning and afternoon session', '2017-10-14 08:15:00', '3.0', 2),
(151, 32, 'Orientation Weekend', 'Rachael', 'rxm2509@lockhaven.edu', 'Honors Movers and Shakers and Welcome Back BBQ', '2017-08-22 11:00:00', '3.0', 2),
(152, 23, 'Open House', 'Allison Reed', 'amr794@lockhaven.edu', 'I worked the open house on October 28', '2017-10-28 08:00:00', '3.0', 2),
(153, 149, 'Honors Admissions Open House', 'Allison Reed', 'honors@lockhaven.edu', 'I went to the university\'s open house with the Honors Admissions Team and talked to high school students and their families about the Honors Program. During the morning session, I passed out fliers about the program and directed students and their families to our table. In the afternoon, I helped to conduct interviews of some prospective students.', '2017-10-28 08:00:00', '3.0', 2),
(154, 149, 'SPSEA Halloween Party', 'Abigail Storrs', 'ams4900@lockhaven.edu', 'SPSEA, the Student Pennsylvania State Education Association, hosted a Halloween party at Ross Library for kids who go to the local elementary and middle schools. We dressed in costumes and planned and organized several games and activities for the kids to participate in at the party.', '2017-10-24 18:00:00', '2.0', 2),
(155, 240, 'Rails To Trails Cleanup', 'Sara Galbraith', 'sng565@lockhaven.edu', 'I helped to rid Youngdale Road of debris that people threw over the guardrail by cleaning said debris by placing it in garbage bags and using proper disposal methods.', '2017-10-28 09:30:00', '3.0', 2),
(156, 240, 'American Red Cross Blood Drive', 'Lauren Wright', 'law3363@lockhaven.edu', 'Volunteered to help people who got their blood drawn to regain energy by giving them drinks and food and a warm conversation.', '2017-09-13 15:30:00', '2.0', 2),
(157, 248, 'Release the Beasts', 'Eric Shuffelbottom', '7179688115', 'Socialized cats and walked one of the dogs around town', '2017-10-31 12:30:00', '1.0', 2),
(158, 45, 'Phoenixville Hospital Fall Fest', 'Barbara O\' Connor', 'BarbaraM.Oconnor@towerhealth.org; 610-983-1295', 'I helped sliced bags of bread in order to help make the sloppy joe\'s that were being sold in the prep kitchen. I also stood in a carrot costume and handed out carrots and apples to people walking in and out of the festival at the nutrition information table. Then, I helped with clean up.', '2017-10-28 07:00:00', '10.0', 2),
(159, 151, 'Hunger Bowl', 'LHU Psychological Association', 'rxm2509@lockhaven.edu', 'I donated six items to the Hunger Bowl.', '2017-10-25 00:00:00', '2.0', 2),
(160, 54, 'Hustling for Houston', 'Katie Krasinski', '570-789-0374', 'I helped run the 5k the Strength, Conditioning and Fitness club did. The proceeds went to the Red Cross of the Greater Houston area. I helped with registration and signing runners in. After that I helped film the video of the runners running and then I helped give away the door prizes and clean up the event.', '2017-10-18 17:00:00', '2.0', 2),
(161, 54, 'Trick or Treating at Susqueview Nursing Home', 'Cassidy Barshinger', '717-825-6947', 'Susqueview started Trick or Treating at 7pm, and before that they ran games and activities for the kids to participate in. I helped set up, run and tear down the games. I ran the one game (spider race) and interacted with the parents and kids as they came to my station to play the games. After the event, we had to tear down all of the games and also talked with some of the residents and visited with them.', '2017-10-25 17:30:00', '2.0', 2),
(162, 69, 'Susque-View 5K/Craft and Vendor Show', 'Teresa Fortney', 'tfortney@susqueviewhome.com', 'I assisted residents around the Craft and Vendor Show', '2017-10-28 09:00:00', '3.0', 2),
(163, 25, 'Open House', 'Allison Reed', 'honors@lockhaven.edu', 'attended the open house with admissions team', '2017-10-28 08:15:00', '3.0', 2),
(164, 262, 'Fresh Express', 'Lindsay Caprio (Assistant Coach)', 'lac40@lockhaven.edu', 'Volunteered (with the LHU lacrosse team) at a food bank held at Lenovo Elementary School.', '2017-11-02 15:30:00', '2.0', 2),
(165, 116, 'Clinton County SPCA', 'Marissa Henry', 'ccspcaOutreach@gmail.com', 'Volunteer dog P.A.L. and walker', '2017-10-20 13:00:00', '2.0', 2),
(166, 85, 'Adopt a Family Tags', 'Skylar Hetrick', 'slh6276@lockhaven.edu', 'I worked at the Mountain Serve office to help fill out the tags that will be hung on trees for the \"Adopt a Family\" Program', '2017-11-03 14:30:00', '1.0', 2),
(167, 91, 'FROSH tutor', 'Amy Downes', '5709320850', 'tutor for the FROSH program in Fairview Suites', '2017-11-01 21:00:00', '1.0', 2),
(168, 80, 'Horses of Hope', 'Esther Duck', '(570) 502-4164', 'These hours include those for both October 26 and November 2, where I attended Horses of Hope with my advisor and friend, Esther Duck, where we spend from 5-8:00pm exercising, mucking stalls and pastures, and feeding the horses under the program\'s care.', '2017-10-26 17:00:00', '6.0', 2),
(169, 97, 'Help at SPCA', 'Carina Howell', 'chowell@lockhaven.edu', 'Help socialize dogs and cats along with preparing and decorating the SPCA building', '2017-12-11 00:00:00', '40.0', 2),
(170, 84, 'Punkin Chunkin Festival', 'Mark Ott', 'chunkinvolunteers@gmail.com', 'Helped park cars at the punkin chunkin festival', '2017-10-21 09:00:00', '2.0', 2),
(171, 22, 'A-Team Open House', 'Rachael Metzinger', 'rxm2509@lockhaven.edu', 'In the afternoon session the Honors A-Team talked to many families and gave interviews to prospective students.', '2017-10-28 00:00:00', '1.0', 2),
(172, 235, 'Trunk or Treat', 'Pastor Tim Boger', '570-893-8274', 'Passed out candy to kids at Big Woods Bible church on Halloween.', '2017-10-31 17:00:00', '2.0', 2),
(173, 98, 'Global Honors Matriculated Open House', 'Allison Reed', 'honors@lockhaven.edu', 'Volunteered to meet with current Lock Haven Students to encourage them to join the global honors program.', '2017-11-06 00:00:00', '1.0', 2),
(174, 30, 'Biology Peer Mentoring', 'Dr. Amy Kutay', 'akutay@lockhaven.edu', 'Every week I meet with my Biology Peer Mentor Student for an hour and discuss assigned topics for the week. I also help them with any problems or concerns that they have had throughout the semester such as scheduling, exams, midterms, etc.', '2017-09-01 13:00:00', '11.0', 2),
(175, 30, 'Helping at the Biology Convocation', 'Dr. Carina Howell', 'chowell@lockhaven.edu', 'I helped to greet incoming family members, students and faculty by inviting them in, helping with parking and their coats. I also handed out programs and directed people to the bathroom and into the main ceremony room.', '2017-11-03 13:00:00', '1.0', 2),
(176, 267, 'Biology Department Mentor', 'Dr. Hunter & Dr. Kutay', 'shunter@lockhaven.edu', 'I meet with two mentees once a week for an hour to discuss topics of biology and how classes are going.', '2017-09-04 12:15:00', '12.0', 2),
(177, 248, 'Release the Beasts', 'Eric Shufflebottom', '7179688115', 'Socialized cats', '2017-11-07 12:30:00', '1.0', 2),
(178, 248, 'SPCA', 'Marissa Henry', '5707484756', 'Walked dogs, played with cats', '2017-11-09 14:00:00', '2.0', 2),
(179, 273, 'Volleyball Statistician', 'Shannon Gerencir', 'slg945@lockhaven.edu', 'I am the official statistician for home games', '2017-11-10 19:00:00', '2.0', 2),
(180, 100, 'GHP Luncheon', 'Allison Reed', 'honors@lockhaven.edu', 'At the honors luncheon, I talked to prospective LHU honors students. While at lunch we discussed the university, classes, etc. The high school students were then walked to the Alumni building for a short presentation. Following the presentation, I conducted interviews.', '2017-10-31 11:00:00', '2.0', 2),
(181, 103, 'Matriculated Open House', 'Dr. Elizabeth Gruber', 'egruber@lockhaven.edu', 'Talked with prospective Honor\'s Students that currently go to Lock Haven.', '2017-11-06 19:00:00', '1.0', 2),
(182, 109, 'Sock Donation', 'Rachael Metzinger', 'rxm2509@lockhaven.edu', 'I dropped off six pairs of socks to the honors house. There were three pairs of boy socks and three pairs of girl socks for a fundraising event.', '2017-10-30 19:00:00', '2.0', 2),
(183, 109, 'Canned Goods Donation', 'Rachael Metzinger', 'rxm2509@lockhaven.edu', 'I dropped off 6 cans of non-perishable items to the box in the honors house for a fundraising event.', '2017-10-30 19:00:00', '2.0', 2),
(184, 102, 'GHP Luncheon', 'Alison Reed', 'honors@lockhaven.edu', 'I attended the luncheon, had lunch with prospective honors students, played a get-to-know you game with them, and conducted an interview.', '2017-10-31 11:00:00', '2.0', 2),
(185, 23, 'Luncheon', 'Allison Reed', 'amr794@lockhaven.edu', 'I worked the admissions luncheon with A-Team!', '2017-10-31 12:30:00', '1.0', 2),
(186, 235, 'Open House', 'Allison Reed', 'amr794@lockhaven.edu', 'I helped with the Open House with A team', '2017-10-14 00:00:00', '3.0', 2),
(187, 235, 'Open House', 'Allison Reed', 'amr794@lockhaven.edu', 'I helped with Open House with A team.', '2017-10-28 00:00:00', '2.0', 2),
(188, 235, 'Honors Luncheon', 'Allison Reed', 'amr794@lockhaven.edu', 'I conducted interviews on behalf of the A team.', '2017-10-31 00:00:00', '1.0', 2),
(189, 140, 'Operation Christmas Child', 'Sarah Snyder', '570-660-1919', 'Packing shoebox gifts into shipping boxes to send out to under-privileged children', '2017-11-15 09:00:00', '4.0', 2),
(190, 21, 'Nature Trail Cleanup', 'Allison Spielman', 'ans1047@lockhaven.edu', 'I did a trail cleanup with environmental club', '2017-09-20 16:30:00', '1.0', 2),
(191, 21, 'Environmental Club', 'Allison Spielman', 'ans1047@lockhaven.edu', 'I did a cleanup on the river', '2017-10-04 16:30:00', '1.0', 2),
(192, 21, 'Wrestling tournament', 'Victoria Moses', 'vcm8480@lockhaven.edu', 'I volunteered at the wrestling tournament', '2017-10-21 08:00:00', '2.0', 2),
(193, 103, 'Open House', 'Dr. Elizabeth Gruber', 'egruber@lockhaven.edu', 'We talked to prospective students in the morning about the GHP and interviewed possible members for the program.', '2017-11-19 08:30:00', '2.0', 2),
(194, 43, 'Lock Haven Shoe Bank', 'Wendy Stiver', 'wstiver@lockhaven.com', 'I help at the shoe bank by helping the children try on shoes.', '2017-11-18 11:00:00', '3.0', 2),
(195, 22, 'Susqueview Thanksgiving Dinner', 'tfortney@susqueview.com', 'Teresa Fortney', 'Last Friday a group of students and I served Thanksgiving dinner to the residents and their families. Over 400 people attended the event.', '2017-11-17 00:00:00', '2.0', 2),
(196, 25, 'Susqueview Thanksgiving Dinner', 'Teresa Fortney', 'tfortney@susqueviewhome.com', 'Helped serve thanksgiving dinner to the residents and their families', '2017-11-17 17:30:00', '2.0', 2),
(197, 25, 'Honors Open House', 'Allison Reed', 'honors@lockhaven.edu', 'Worked the open house with admissions team', '2017-11-18 08:15:00', '3.0', 2),
(198, 22, 'Honors Admissions Team- Open House', 'Allison Reed', 'amr794@lockhaven.edu', 'On Saturday the Honors Admissions Team talked to prospective students and their families during the morning session. During the afternoon portion we gave interviews to students.', '2017-11-18 00:00:00', '3.0', 2),
(199, 235, 'Open House', 'Allison Reed', 'amr794@lockhaven.edu', 'Told prospective students about GHP with Honors A Team at Open House', '2017-11-18 08:00:00', '2.0', 2),
(200, 222, 'Thanksgiving Dinner distribution', 'Dr. Jessica Hosley', 'jhosley@lockhaven.edu', 'I, with my other club members on campus, distributed turkeys, and other food to families in need, for the Thanksgiving holiday. We went to a local elementary school to distribute them and drove to the Beech Creek area to hand them out.', '2017-11-20 12:00:00', '2.0', 2),
(201, 243, 'Open House', 'Allison Reed', 'amr794@lockhaven.deu', 'A-Team for honors and interviewing that followed', '2017-10-28 08:00:00', '3.0', 2),
(202, 243, 'Open House', 'Allison Reed', 'amr794@lockhaven.edu', 'A-team', '2017-11-18 08:00:00', '2.0', 2),
(203, 64, 'Centre County PAWS', 'Kelsey Shampoe', 'med_asst@centrecountypaws.org', 'Transported cats to and from their vet appointments.', '2017-11-24 11:30:00', '2.0', 2),
(204, 23, 'Open House', 'Allison Reed', 'amr794@lockhaven.edu', 'I worked the open house with A-Team on 11/18.', '2017-11-18 09:00:00', '3.0', 2),
(205, 102, 'Open House', 'Allison Reed', 'honors@lockhaven.edu', 'I talked to prospective students in the morning, and conducted an interview in the afternoon!', '2017-11-18 08:00:00', '3.0', 2),
(206, 149, 'Honors Admissions Team Open House', 'Allison Reed', 'honors@lockhaven.edu', 'I went to the university\'s open house with the Honors admissions team and talked to high school students about potentially joining the Honors Program. I passed out flyers about the program during the morning session at the rec center. In the afternoon, I directed students to get their interviews done and also gave more information about the program to some other students who were interested.', '2017-11-18 08:00:00', '3.0', 2),
(207, 149, 'Honors Admissions Team Open House', 'Allison Reed', 'honors@lockhaven.edu', 'I went to the university\'s open house with the Honors admissions team and talked to high school students about potentially joining the Honors Program. I passed out flyers about the program during the morning session at the rec center. In the afternoon, I directed students to get their interviews done and also gave more information about the program to some other students who were interested.', '2017-11-18 08:00:00', '3.0', 2),
(208, 262, 'LHU Lacrosse Clinic', 'Lindsay Caprio', 'lac40@lockhaven.edu', 'Demonstrated drills; assisted clinic participants with skills', '2017-10-15 08:00:00', '4.0', 2),
(209, 91, 'Storm runners 3k run/walk', 'Matt Girton', 'mgirton@lockhaven.edu', 'I helped coordinate and plan the 3k run/walk for hurricane relief. We raised 160 dollars for Operation USA.', '2017-10-29 10:00:00', '3.0', 2),
(210, 116, 'Clinton County SPCA', 'Marissa Henry (community outreach coordinator)', 'Â ccspcaoutreach@gmail.com', 'Dog walker', '2017-11-16 12:00:00', '2.0', 2),
(211, 21, 'Susqueview Family Thanksgiving', 'Teresa Fortney', 'tfortney@susqueviewhome.com 570-893-59', 'I volunteered at the nursing home to help serve the residents and their families thanksgiving dinner', '2017-11-17 17:30:00', '2.0', 2),
(212, 258, 'Susque View Thanksgiving Dinner', 'Ed Gately', '5707489377', 'I helped serve the residents of Susque View and their family\'s a Thanksgiving dinner.', '2017-11-17 17:30:00', '2.0', 2),
(213, 67, 'Blood Drive', 'Mountain Serve', '?', 'Donated blood at the last blood drive.', '0000-00-00 00:00:00', '1.0', 2),
(214, 81, 'University Players', 'Ramona Broomer', 'rbroomer@lockhaven.edu', 'I assisted in taking down the set for our show', '2017-10-22 15:30:00', '2.0', 2),
(215, 81, 'UP Haunted Studio', 'Ramona Broomer', 'rbroomer@lockhaven.edu', 'Set up for our Haunted Studio fundraiser', '2017-10-27 16:00:00', '2.0', 2),
(216, 159, 'Veterans Expo', 'Major Jonathon Britton', 'jmb946@lockhaven.edu', 'Helped assisted vendors and elderly carrying in and setting up their booths. Also helped with the tear down/clean-up.', '2017-11-09 16:30:00', '3.0', 2),
(217, 100, 'Honors Open House', 'Allison Reed', 'honors@lockhaven.edu', 'On 11/18 I helped with the GHP A-Team open house. During the morning session I spoke to high school students about the GHP and in the afternoon I conducted interviews of prospective LHU GHP students.', '2017-11-18 08:00:00', '3.0', 2),
(218, 251, 'Volunteering Lunch Program - Salvation Army', 'Tabitha Hayes', 'tabitha.hayes@use.salvationarmy.org', 'I helped prepare the meals for the lunch as well as served them with the other kitchen volunteers.  After lunch, I helped do the dishes and clean up. During downtime, Tabitha provided me with work to do towards the fundraiser for the Soup Off. This work involved labeling cups with stickers and also stapling pamphlets.', '2017-11-02 08:00:00', '4.0', 2),
(219, 251, 'Susquehanna River Clean-Up', 'Sara Galbraith', 'sng565@lockhaven.edu', 'I helped in the river by walking up and down the Susquehanna pulling out tires and other trash.  My partner and I only pulled out four tires but we also pulled out lots of cans and bottles.', '2017-09-09 00:00:00', '4.0', 2),
(220, 260, 'SPCA pet therapy', 'Lizzie Laatsch', 'lizzielaatsch11@gmail.com', 'we entertained cats and dogs at the spca', '2017-09-26 12:30:00', '1.0', 2),
(221, 79, 'A-Team Open House', 'Allison Reed', 'amr794@lockhaven.edu', 'With the A-Team, I helped the GHP try to recruit new members at an admissions Open House.  I also trained Maggie at the morning session, and was an honors program representative at the physics academic table for about half the morning as well.  Unfortunately, I couldn\'t help with the afternoon interviews this time.', '2017-10-14 08:15:00', '2.0', 2),
(222, 79, 'A-Team Open House', 'Allison Reed', 'amr794@lockhaven.edu', 'With the A-Team, I helped the GHP try to recruit new members at the admissions Open House.  I was an honors program representative at the physics academic table this morning, and talked to one person about joining the honors program.  In the afternoon, I gave an interview to an exceptionally bright and involved student.  He was very excited about the program, and came in well-informed.', '2017-10-28 08:15:00', '3.0', 2),
(223, 79, 'A-Team Open House', 'Allison Reed', 'amr794@lockhaven.edu', 'With the A-Team, I helped the GHP try to recruit new members at the admissions Open House.  I was an honors program representative at the physics academic table this morning, and talked to one person about joining the honors program.  In the afternoon, Adam Richards and I welcomed students into the Great Room for interviews.  We talked to at least 5 new students about the program, and 2 of whom went immediately for an interview.  I also got to meet some Honors Alumni from the class of 2014.', '2017-11-18 08:15:00', '3.0', 2);
INSERT INTO `SP18_com_serv` (`com_id`, `pstu_id`, `com_title`, `com_advisor`, `com_advisor_contact`, `com_description`, `com_date`, `com_hours`, `com_verified`) VALUES
(224, 79, 'A-Team Open House', 'Allison Reed', 'amr794@lockhaven.edu', 'With the A-Team, I helped the GHP try to recruit new members at the admissions Open House.  I was an honors program representative at the physics academic table this morning, and talked to one person about joining the honors program.  In the afternoon, Adam Richards and I welcomed students into the Great Room for interviews.  We talked to at least 5 new students about the program, and 2 of whom went immediately for an interview.  I also got to meet some Honors Alumni from the class of 2014.', '2017-11-18 08:15:00', '3.0', 2),
(225, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Major Sharon Cupp', '570-748-2951', 'I teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2017-10-18 17:30:00', '2.0', 2),
(226, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Major Sharon Cupp', '570-748-2951', 'I teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2017-11-29 16:30:00', '4.0', 2),
(227, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Major Sharon Cupp', '570-748-2951', 'I teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2017-11-01 17:30:00', '2.0', 2),
(228, 101, 'Salvation Army Lock Haven: \"Moonbeams\"', 'Major Sharon Cupp', '570-748-2951', 'I teach a children\'s class (5-6 year olds) every Wednesday night at the local Salvation Army. We generally do a craft, teach/read a bible story, sing songs, provide snack, and play appropriate games with the children. I prep for each lesson the week before (not included in the hours listed.)', '2017-11-15 17:30:00', '2.0', 2),
(229, 106, 'Lock Haven Food Drive', 'N/A', 'N/A', 'Donated 4 canned items to the food drive', '2017-10-18 00:00:00', '1.0', 2),
(230, 106, 'Adopt a Family', 'N/A', 'N/A', 'Picked a family who wanted a Walmart gift card and donated a $50 gift card', '2017-11-29 00:00:00', '1.0', 2),
(231, 234, 'Open House', 'Alison Reed', 'honors_program@lockhaven.edu', 'Worked the Open House and did interviews.', '2017-10-28 08:00:00', '3.0', 2),
(232, 234, 'Open House', 'Alison Reed', 'honors_program@lockhaven.edu', 'Worked the open house and did interviews', '2017-11-18 08:00:00', '3.0', 2),
(233, 234, 'SPCA', 'Marissa Henry', 'ccspcaoutreach@gmail.com', 'Walked dogs and played with cats', '2017-11-09 14:00:00', '2.0', 2),
(234, 234, 'SPCA', 'Marissa Henry', 'ccspcaoutreach@gmail.com', 'Walked dogs, played with dogs, played/socialized cats', '2017-11-17 14:00:00', '2.0', 2),
(235, 46, 'Blood Drive', 'Morgan Capobianco', 'mpc7999@lockhaven.edu', 'I worked at the canteen table to look after those who donated', '2017-11-29 12:00:00', '2.0', 2),
(236, 103, 'Blood Drive', 'Elizabeth Gruber', 'egruber@lockhaven.edu', 'I gave blood at the blood drive.', '2017-11-29 16:30:00', '1.0', 2),
(237, 28, 'Blood Donation', 'n/a', 'n/a', 'Blood Donation', '2017-11-29 15:30:00', '1.0', 2),
(238, 258, 'Blood Drive Donation', 'Marge Smith', '5705602840      marge.smith@redcross.org', 'I made a donation of blood for the American Red Cross.', '2017-11-30 12:30:00', '5.0', 2),
(239, 258, 'Red Cross Blood Drive Donation', 'Marge Smith', '5705602840    marge.smith@redcross.org', 'I donated blood for the Red Cross. On my last submission I accidentally wrote in 5 hours for this event instead of 1. This submission is accurate and I am sorry for the inconvenience that my last submission may have caused.', '2017-11-30 12:30:00', '1.0', 2),
(240, 258, 'Red Cross Blood Drive Event Volunteering', 'Sierra Laughead', '7178853252     shl3496@lockhaven.edu', 'I helped the Red Cross Club during the blood drive by giving blood donors refreshments and making sure that they recovered after making their donations.', '2017-11-30 13:30:00', '5.0', 2),
(241, 60, 'Red Cross Blood Drive', 'Red Cross', '1 (800) 733-2767', 'I donated blood today at the SRC during the Red Cross Blood Drive', '2017-11-30 00:00:00', '1.0', 2),
(242, 46, 'Blood Drive', 'Olivia Bellomo', 'otb1090@lockhaven.edu', 'I worked the canteen table and made sure donors were taken care of after donation.', '2017-11-30 12:00:00', '6.0', 2),
(243, 31, 'Red Cross Blood Donation', 'Rachael Metzinger', 'SAD', 'Donated blood for red cross', '2017-11-30 16:00:00', '1.0', 2),
(244, 65, 'Adopt-A-Family', 'Skylar Herrick', 'slh6276@lockhaven.edu', 'Donated books and gifts for Nevaeh, a boy in one of the Adopt-A-Family families for this years holiday gift drive.', '0000-00-00 00:00:00', '2.0', 2),
(245, 250, 'SPCA', 'Elizabeth Laatsch', 'ejl2251@lockhaven.edu', 'Went to the SPCA to volunteer by petting/playing with the animals', '2017-10-10 12:00:00', '1.0', 2),
(246, 250, 'SPCA', 'Marissa Henry', 'ccspcaoutreach@gmail.com', 'Went to the SPCA to volunteer by petting the cats.', '2017-10-12 12:00:00', '1.0', 2),
(247, 250, 'Blood Drive', 'Morgan Capobianco', 'mpc7999@lockhaven.edu', 'Volunteered to help clean up the blood drive.', '2017-11-30 18:00:00', '1.0', 2),
(248, 250, 'Adopt a Family', 'Elizabeth Laatsch', 'ejl2251@lockhaven.edu', 'My FDG and I adopted a family and went shopping for the two children we got.', '2017-11-28 12:30:00', '1.0', 2),
(249, 128, 'Phi Sigma Pi Initiate Advising (Community Aspect)', 'Bethy Wells', 'ejw4272@lockhaven.edu', 'Throughout the semester, I spent a minimum of 1 hour a week with the 10 new initiates of Phi Sigma Pi, educating them on fraternity practices and supervising their projects. I advised and supervised them on their community service education and projects, including their creation of a collection program to benefit the Women\'s Center. I provided them with supplies, contacts, advice, and assisted in their fundraising. They are still currently collecting supplies that will go to benefit women.', '2017-09-24 19:00:00', '11.0', 2),
(250, 229, 'Storm Runners 3K', 'Kimberly Rogers', 'kfr6225@lockhaven.edu', 'I helped set up for the events, and then stood as a marker along the running path to point people in the right direction and hand out candy.', '2017-10-29 10:00:00', '3.0', 2),
(251, 229, 'Susque-View \"Thanksgiving Dinner\"', 'Theresa Fortney', 'tfortney@susqueviewhome.com', 'I helped serve the residents at the assisted living facility and their families with a Thanksgiving meal, and also helped to set up and clean up.', '2017-11-17 17:00:00', '3.0', 2),
(252, 229, 'Susque-View \"Deck the Halls\"', 'Theresa Fortney', 'tfortney@susqueviewhome.com', 'I helped to make decorations for the assisted living facility and decorated the building for Christmas!', '2017-12-01 14:30:00', '2.0', 2),
(253, 253, 'SPCA', 'Lizzie Laatsch', 'lizzielaatsch11@gmail.com', 'My FDG visited the Clinton County SPCA to socialize the animals there.', '2017-09-26 12:30:00', '1.0', 2),
(254, 253, 'Susque View Nursing Home', 'Teresa Fortney', 'tfortney@susqueviewhome.com', 'I helped set up Christmas decorations at the local nursing home', '2017-12-01 15:00:00', '1.0', 2),
(255, 76, 'Red Cross Blood Drive', 'Red Cross Club', 'law3363@lockhaven.edu', 'assisted blood donors to the recovery table', '2017-11-30 12:30:00', '2.0', 2),
(256, 17, 'SPCA Volunteer', 'Lizzie Laatsch', '2672222353', 'Volunteered at the animal shelter, played with the dogs and cats', '2017-09-26 12:30:00', '1.0', 2),
(257, 85, 'Adopt-A-Family Gifts', 'Skylar Hetrick', 'slh6276@lockhaven.edu', 'Donated two gifts to Adopt-A-Family.\r\nGift 1:  2 yo-yos and a cardgame\r\nGift 2:  Action figures', '2017-12-04 08:00:00', '2.0', 2),
(258, 116, 'Clinton County SPCA', 'Marissa Henry', 'Â ccspcaoutreach@gmail.com', 'Dog Walker', '2017-11-30 00:00:00', '2.0', 2),
(259, 10, 'Open House', 'Allison Reed', '585-415-7022', 'A-team', '2017-10-28 09:00:00', '3.0', 2),
(260, 85, 'Adopt-A-Family gift wrapping', 'Lauren Wright', 'law3363@lockhaven.edu', 'Helped wrapped gifts for Adopt-a-Family', '2017-12-05 13:00:00', '3.0', 2),
(261, 158, 'Troop Climbing Merit Badge Weekend', 'LaRue Reedy', '570-768-8769', 'A full weekend helping scouts to earn their climbing merit badge at Camp Brule. I helped out by setting up the climbing tower and instructing scouts on how to belay, tie knots, and some basic climbing knowledge. The weekend was also completed with a night climb where scouts were able to climb the tower in the dark as well as any other participants.', '2017-10-13 19:00:00', '18.0', 2),
(262, 116, 'Adopt A Family', 'Lauren Wright', '570-484-2499', 'gift wrapping', '2017-12-05 00:00:00', '2.0', 2),
(263, 132, 'Fresh Express', 'Lindsey Caprio', '267-474-8421', 'Helped with Fresh Express food drive at Renovo Elementary School with my lacrosse team (Lock Haven Women\'s Lacrosse). We sorted food and helped deliver boxes of food to community member\'s cars.', '2017-11-02 15:00:00', '4.0', 2),
(264, 132, 'Field Hockey Game', 'Lindsay Caprio', '267-474-8421', 'Worked as a ball girl for the Lock Haven Field Hockey team for their game against Sacred Heart.', '2017-08-25 16:00:00', '2.0', 2),
(265, 88, 'Personal Care Home volunteer', 'Christine Weaver', '2163236972', 'I volunteered my time at the Forest Hills Personal Care Home to help with handing out dinner, keeping the residents entertained, and lastly, helping them find an activity to participate in before they\'re bed time.', '2017-11-21 16:00:00', '3.0', 2),
(266, 23, 'Open House', 'Allison Reed', 'amr794@lockhaven.edu', 'I worked the open house on November 18 with A-Team.', '2017-11-18 08:00:00', '3.0', 2),
(267, 227, 'SPCA Volunteering', 'Eric Shufflebottom', 'ecs8241@lockhaven.edu', 'We would go to the SPCA and help with whatever they needed, from brushing animals to playing with them, to cleaning up, etc. We did this as an activity group. I went 6 times for an hour each, so I used the last day we went as the \"start date\".', '2017-12-05 12:30:00', '6.0', 2),
(268, 18, 'Halloween Program', 'Teresa Fortney', '(570) 893-5941', 'Planned and coordinated games and activities at a Halloween function at Susque View Nursing Home and Rehabilitation Center.', '2017-10-25 16:00:00', '5.0', 2),
(269, 18, 'Bear Mountain River Run Invitational', 'Aaron Russell', 'arussel@lockhaven.edu', 'Volunteered to help work the cross country meet Lock Haven hosted for high school and middle school teams.', '2017-09-02 09:00:00', '3.0', 2),
(270, 116, 'Limited Days Boot Camp', 'Jeremy Cornelius', '717-635-0426', 'Assisted with training camp operations', '2017-12-09 11:00:00', '2.0', 2),
(271, 132, 'Fresh Express', 'Lindsay Caprio', '267-474-8421', 'Volunteered at Renovo Elementary School with a food drive. We participated in building new shelves to store the food for upcoming month\'s food drives as well as sorting food and helping families pick out items.', '2017-12-07 15:00:00', '4.0', 2),
(272, 28, 'CEI Video Shoot', 'Ashley Spencer', 'Ulmer 139', 'Volunteered to be Talon for a Holiday video shoot for LHU', '2017-12-11 12:00:00', '3.0', 2),
(273, 226, 'community service', 'doug buckwalter', 'mporter@lockhaven.edu', 'worked the king of the mountain tournament', '2017-12-15 16:00:00', '5.0', 2),
(274, 159, 'SEC Basement Cleaning', 'Thomas Bates', 'twb9017@lockhaven.edu', 'Spent the time during one of the SEC meetings to clean and organize the Honors House basement.', '2017-09-14 19:00:00', '2.0', 2),
(275, 54, 'Recreation Management Mentoring', 'Julie Lammel', '(570) 484-2826', 'I have a mentee who is a freshman in the Recreation Management Department and we have met four times over the course of the fall semester to help him adjust to campus life and to college itself in general.', '2017-12-05 00:00:00', '4.0', 2),
(276, 257, 'Susqueview Family Dinner', 'Teresa Fortney', 'tfortney@susqueviewhome.com', 'Volunteered at the nursing homes Thanksgiving dinner. Helped by serving the residents and cleaning up.', '2017-11-17 17:30:00', '2.0', 2),
(277, 257, 'susqueview decorating', 'Teresa Fortney', 'tfortney@susqueviewhome.com', 'Make decorations for Christmas at the nursing home and helped to put them up', '2017-12-01 16:00:00', '2.0', 2),
(278, 27, 'Helping Hands Food Pantry', 'Peg Huyck', '570-746-1384   helpinghandsfoodpantry233@gmail.com', 'Stocked shelves, sorted donated food, filled backpacks for students in need with donated food, unloaded food delivery truck, cleaned donated items, broke down many cardboard boxes to be recycled.', '2017-12-19 09:00:00', '3.0', 2),
(279, 27, 'Helping Hands Food Pantry', 'Peg Huyck', '570-746-1384   helpinghandsfoodpantry233@gmail.com', 'Stocked shelves, sorted donated food, filled backpacks for students in need with donated food, unloaded food delivery truck, cleaned donated items, broke down many cardboard boxes to be recycled.', '2018-01-03 09:00:00', '3.0', 2),
(280, 27, 'Helping Hands Food Pantry', 'Peg Huyck', '570-746-1384   helpinghandsfoodpantry233@gmail.com', 'Stocked shelves, sorted donated food, filled backpacks for students in need with donated food, unloaded food delivery truck, cleaned donated items, broke down many cardboard boxes to be recycled.', '2018-01-04 09:00:00', '3.0', 2),
(281, 27, 'Helping Hands Food Pantry', 'Peg Huyck', '570-746-1384   helpinghandsfoodpantry233@gmail.com', 'Stocked shelves, sorted donated food, filled backpacks for students in need with donated food, unloaded food delivery truck, cleaned donated items, broke down many cardboard boxes to be recycled.', '2018-01-10 09:00:00', '5.0', 2),
(282, 27, 'Helping Hands Food Pantry', 'Peg Huyck', '570-746-1384   helpinghandsfoodpantry233@gmail.com', 'Stocked shelves, sorted donated food, filled backpacks for students in need with donated food, unloaded food delivery truck, cleaned donated items, broke down many cardboard boxes to be recycled.', '2018-01-17 09:30:00', '5.0', 2),
(283, 78, 'Chaperone', 'Andrew Merritt', '8148808473', 'I volunteered my credentials to supervise a field trip for the school district I work for without pay.', '2018-01-11 08:00:00', '7.0', 2),
(284, 17, 'Volunteer at Women\'s Board of MMMC Thrift Shop', 'Dee Hawkins', 'deehawkins68@gmail.com', 'I helped organize items in the thrift shop, carrying donation boxes from the basement upstairs into the store, and helped with anything else the manager asked me to do.', '2018-01-10 10:00:00', '3.0', 2),
(285, 17, 'Thrift Shop', 'Dee Hawkins', 'deehawkins68@gmail.com', 'I helped organize items in the thrift shop, carrying donation boxes from the basement upstairs into the store, and helped with anything else the manager asked me to do.', '2018-01-13 10:00:00', '3.0', 2),
(286, 17, 'LHU Wrestling ticket sales', 'Patrick Long', '570-660-2093', 'Sold tickets to people attending the wrestling match against Brown University', '2018-01-21 11:45:00', '1.0', 2),
(287, 151, 'Angel Tree', 'Brittney Muthler', 'saleslockhaven@edrtrust.com', 'I bought items for a young boy.', '2017-12-12 00:00:00', '3.0', 2),
(288, 29, 'Work the Wrestling Meet', 'Shannon Gerencir', 'Phone: 304-543-0036', 'We help work the snack stand at the wrestling meet to make sure that everything is going smoothly.', '2018-02-01 18:30:00', '3.0', 1),
(289, 29, 'Working the Wrestling Meet', 'Shannon Gerencir', 'phone number 304-543-0036', 'We worked the snack stand, and helped sell t-shirts from it.', '2017-12-01 16:00:00', '2.0', 1),
(290, 29, 'Work Wrestling Meet', 'Shannon Gerencir', 'Phone Number : 304-543-0036', 'We worked the snack stand in order to help it go smoothly', '2018-02-03 14:00:00', '1.0', 1),
(291, 29, 'Worked Senior Day Wrestling meet', 'shannon Gerencir', 'Cell Phone: 304-543-0036', 'We helped set up and work the snack stand.', '2018-02-05 12:00:00', '1.0', 1),
(292, 266, 'Volunteer Football Coach', 'Justin Van Fleet - Head High School Football Coach', '(570) 220 - 0891', 'During the fall semester, I was a volunteer middle school linebacker and running back coach at Loyalsock Township Middle School.  This experience gave me the opportunity to help young athletes develop the skills necessary to be productive members of a team, learn leadership skills, and participate in upper level sports with the proper techniques to maintain personal and team safety.', '2017-07-19 00:00:00', '300.0', 1),
(293, 244, 'The Lock Haven Farm-City Family Festival', 'Ally Spielman', 'ans1047@lockhaven.edu', 'I found the The Lock Haven Farm-City Family Festival from MountainServe and I was not doing anything that Saturday, so I decided to go. At the festival, we ran the craft table and kids activities. I also helped at the sign in booth for raffle tickets.', '2017-09-23 08:00:00', '7.0', 1),
(294, 244, 'Admissions Team Open House', 'Allison Reed', 'amr794@lockhaven.edu', 'I have been at a lot of the the open houses for A-Team, but I will only log one here because it is all I need to log for ten hours. At the open house we recruit new members with a spiel about Lock Haven and the GHP and gave interview afterwards.', '2017-10-14 08:15:00', '3.0', 1),
(295, 37, 'Bingo', 'Pat Rudy', 'prudy@lhup.edu', 'Helped set up, run concessions, and tear down', '2018-01-27 08:00:00', '7.0', 1),
(296, 68, 'Odyssey of the Mind Judges Training', 'Karyl Otruba', 'mtnbooks@epix.net', 'A day spent training to be a Judge of the Odyssey of the Mind creative problem solving competition. I serve on the state board of directors for this organization that serves over 50,000 youth in the state. The training was to update members of the region in order to properly have a tournament in the future (March 3rd, 2018). The local schools of the \"North Central Region\" will be attending the tournament, this is a great feeder of some of our students here at LHU.', '2018-02-10 07:30:00', '6.5', 1),
(297, 145, 'Mill Hall Kiwanis Chicken Barbeque', 'Jessica Tressa', 'jmt9097@lockhaven.edu', 'While there, I helped to direct traffic, take orders, and deliver food to members of the Mill Hall community that were participating in the chicken barbecue and had come to eat.', '2018-02-10 00:00:00', '4.0', 1),
(298, 145, 'Circle K Spring Fling', 'Jessica Tressa', 'jmt9097@lockhaven.edu', 'While here, I made sewn cards that have messages of positivity notes written inside of them. These are for elderly people that live in nursing homes so that they know that there are still people thinking about them and making sure that they are getting messages of kindness in their residence.', '2018-02-11 00:00:00', '2.0', 1),
(299, 61, 'National Girls and Women in Sports Day Celebration', 'Coach Brown', 'kji58@lockhaven.edu', 'I helped my team with our soccer station at Lock Haven University\'s National Girls and Women in Sports Day Celebration. We played soccer with the kids that came.', '2018-02-10 12:00:00', '1.0', 1),
(300, 49, 'Odyssey of the Mind Judges Training', 'Matt Henry', '570-369-2368 mjh7610@lockhaven.edu', 'I learned what Odyssey of the Mind is and how to judge it. I will be judging March 3 at the regional competition.', '2018-02-10 08:00:00', '5.0', 1),
(301, 61, 'YMCA Black and White Ball', 'Coach Brown', 'kji58@lockhaven.edu', 'My team, the LHU Women\'s Soccer team, helped work the YMCA Black and White Ball. throughout the night I worked as a valet, in the coat check room, and was a runner for different raffle baskets.', '2018-02-17 16:00:00', '7.0', 1),
(302, 29, 'Women in Sports Day', 'Shannon Gerencir', '304-543-0036', 'I taught little girls in the community how to do the basics of volleyball. I had them do some ball handling as well as some ladders.', '2018-02-10 11:00:00', '2.0', 1),
(303, 21, 'Highway Cleanup', 'Hilary Abraham', 'hilaryjane20@gmail.com', 'I worked with my sorority to clean up a part of the highway', '2018-02-17 10:00:00', '1.0', 1),
(304, 21, 'Service Canning', 'Hilary Abraham', 'hilaryjane20@gmail.com', 'I canned outside of Dunkin\' Donuts to raise money for breast cancer education and awareness', '2018-02-17 11:00:00', '3.0', 1),
(305, 67, 'B+ KDR Cookout', 'Jared Fryberger', 'jrf735@lockhaven.edu', 'Raising money for Kappa Delta Rho\'s philanthropy through a cookout and music.', '2017-09-29 16:00:00', '3.0', 1),
(306, 67, 'Connect LHU', 'Dr. Schillig', 'lschilli@lockhaven.edu', 'Leadership Retreat Leader on a weekend at Camp Krisland helping students learn different skills and connections they have on campus.', '2017-11-19 19:00:00', '30.0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `SP18_currentstudents`
--

CREATE TABLE `SP18_currentstudents` (
  `pstu_id` int(11) NOT NULL,
  `pstu_in_fdg` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SP18_currentstudents`
--

INSERT INTO `SP18_currentstudents` (`pstu_id`, `pstu_in_fdg`) VALUES
(5, 0),
(6, 0),
(8, 0),
(9, 0),
(10, 0),
(12, 0),
(13, 0),
(17, 0),
(18, 0),
(21, 0),
(22, 0),
(23, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(37, 0),
(39, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0),
(50, 0),
(53, 0),
(54, 0),
(55, 0),
(56, 0),
(57, 0),
(58, 0),
(59, 0),
(60, 0),
(61, 0),
(62, 0),
(63, 0),
(64, 0),
(65, 0),
(66, 0),
(67, 0),
(68, 0),
(69, 0),
(70, 0),
(72, 0),
(73, 0),
(75, 0),
(76, 0),
(78, 0),
(79, 0),
(80, 0),
(81, 0),
(82, 0),
(83, 0),
(84, 0),
(85, 0),
(86, 0),
(88, 0),
(89, 0),
(90, 0),
(91, 0),
(95, 0),
(96, 0),
(97, 0),
(98, 0),
(100, 0),
(101, 0),
(102, 0),
(103, 0),
(105, 0),
(106, 0),
(107, 0),
(108, 0),
(109, 0),
(110, 0),
(111, 0),
(112, 0),
(113, 0),
(115, 0),
(116, 0),
(117, 0),
(118, 0),
(119, 0),
(120, 0),
(121, 0),
(123, 0),
(126, 0),
(127, 0),
(128, 0),
(130, 0),
(131, 0),
(132, 0),
(133, 0),
(135, 0),
(137, 0),
(140, 0),
(142, 0),
(143, 0),
(144, 0),
(145, 0),
(146, 0),
(147, 0),
(148, 0),
(149, 0),
(151, 0),
(152, 0),
(154, 0),
(156, 0),
(158, 0),
(159, 0),
(160, 0),
(162, 0),
(197, 0),
(217, 0),
(222, 0),
(226, 0),
(227, 1),
(228, 1),
(229, 1),
(230, 1),
(231, 1),
(232, 1),
(233, 1),
(234, 1),
(235, 1),
(236, 1),
(237, 1),
(239, 1),
(240, 1),
(241, 1),
(242, 1),
(243, 1),
(244, 1),
(245, 1),
(246, 1),
(247, 1),
(248, 1),
(249, 1),
(250, 1),
(251, 1),
(252, 1),
(253, 1),
(254, 1),
(255, 1),
(256, 1),
(257, 1),
(258, 1),
(259, 1),
(260, 1),
(261, 1),
(262, 1),
(263, 1),
(264, 1),
(265, 1),
(266, 0),
(267, 0),
(268, 0),
(269, 0),
(270, 0),
(271, 0),
(272, 0),
(273, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `SP18_dates`
-- (See below for the actual view)
--
CREATE TABLE `SP18_dates` (
`start` datetime
,`end` datetime
,`title` varchar(60)
,`event_id` bigint(20)
,`group` int(11)
,`back_color` varchar(7)
,`font_color` varchar(7)
);

-- --------------------------------------------------------

--
-- Table structure for table `SP18_events`
--

CREATE TABLE `SP18_events` (
  `event_id` int(11) NOT NULL,
  `event_title` varchar(60) NOT NULL,
  `event_description` varchar(200) NOT NULL,
  `event_start_date` datetime NOT NULL,
  `event_end_date` datetime NOT NULL,
  `event_bg_color` varchar(7) DEFAULT '#0000ff',
  `event_ft_color` varchar(7) DEFAULT '#ffffff'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SP18_events`
--

INSERT INTO `SP18_events` (`event_id`, `event_title`, `event_description`, `event_start_date`, `event_end_date`, `event_bg_color`, `event_ft_color`) VALUES
(1, 'FDG', 'Played Games', '2018-02-26 00:00:00', '2018-02-26 01:00:00', '#0000ff', '#ffffff');

-- --------------------------------------------------------

--
-- Table structure for table `SP18_exceptions`
--

CREATE TABLE `SP18_exceptions` (
  `excptn_id` int(11) NOT NULL,
  `excptn_name` varchar(60) NOT NULL,
  `excptn_type` int(11) NOT NULL,
  `excptn_value` decimal(5,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SP18_exceptions`
--

INSERT INTO `SP18_exceptions` (`excptn_id`, `excptn_name`, `excptn_type`, `excptn_value`) VALUES
(1, 'CCE Two Credit Exemption', 2, '2.00'),
(3, 'CCE Full Exemption', 2, '5.00');

-- --------------------------------------------------------

--
-- Table structure for table `SP18_exception_grants`
--

CREATE TABLE `SP18_exception_grants` (
  `grant_id` int(11) NOT NULL,
  `excptn_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SP18_exception_grants`
--

INSERT INTO `SP18_exception_grants` (`grant_id`, `excptn_id`, `pstu_id`) VALUES
(60, 1, 5),
(24, 1, 13),
(22, 1, 17),
(7, 1, 18),
(6, 1, 22),
(21, 1, 23),
(18, 1, 26),
(25, 1, 29),
(30, 1, 30),
(33, 1, 33),
(8, 1, 34),
(20, 1, 37),
(11, 1, 40),
(4, 1, 43),
(59, 1, 47),
(1, 1, 50),
(45, 1, 54),
(28, 1, 59),
(19, 1, 61),
(31, 1, 63),
(27, 1, 66),
(44, 1, 67),
(16, 1, 72),
(46, 1, 78),
(12, 1, 80),
(14, 1, 83),
(61, 1, 105),
(34, 1, 107),
(56, 1, 111),
(47, 1, 113),
(43, 1, 123),
(58, 1, 132),
(51, 1, 135),
(57, 1, 140),
(29, 1, 143),
(48, 1, 147),
(55, 1, 148),
(49, 1, 156),
(50, 1, 158),
(26, 1, 159),
(10, 1, 232),
(17, 1, 237),
(23, 1, 247),
(15, 1, 253),
(9, 1, 256),
(13, 1, 262),
(32, 1, 266),
(39, 3, 31),
(41, 3, 68),
(62, 3, 112),
(38, 3, 120),
(42, 3, 123),
(36, 3, 145),
(3, 3, 146),
(35, 3, 149),
(40, 3, 151),
(37, 3, 217);

-- --------------------------------------------------------

--
-- Table structure for table `SP18_fdg`
--

CREATE TABLE `SP18_fdg` (
  `pfdg_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SP18_fdg`
--

INSERT INTO `SP18_fdg` (`pfdg_id`) VALUES
(2),
(5),
(6),
(7),
(8),
(9),
(11);

-- --------------------------------------------------------

--
-- Table structure for table `SP18_fdg_attendence`
--

CREATE TABLE `SP18_fdg_attendence` (
  `pfdg_att_id` int(11) NOT NULL,
  `pfdg_report_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SP18_fdg_attendence`
--

INSERT INTO `SP18_fdg_attendence` (`pfdg_att_id`, `pfdg_report_id`, `pstu_id`) VALUES
(63, 2, 230),
(60, 2, 232),
(62, 2, 236),
(61, 2, 239),
(59, 2, 254),
(67, 3, 230),
(66, 3, 236),
(65, 3, 239),
(64, 3, 254),
(3, 14, 227),
(5, 14, 237),
(2, 14, 246),
(1, 14, 263),
(4, 14, 264),
(31, 15, 227),
(29, 15, 243),
(30, 15, 246),
(28, 15, 263),
(32, 15, 264),
(79, 16, 227),
(76, 16, 237),
(75, 16, 243),
(77, 16, 246),
(74, 16, 263),
(78, 16, 264),
(8, 28, 235),
(11, 28, 247),
(10, 28, 250),
(7, 28, 253),
(9, 28, 256),
(6, 28, 260),
(14, 29, 230),
(16, 29, 232),
(13, 29, 236),
(12, 29, 239),
(15, 29, 254),
(19, 30, 233),
(21, 30, 242),
(17, 30, 244),
(18, 30, 251),
(20, 30, 257),
(24, 31, 233),
(27, 31, 242),
(22, 31, 244),
(23, 31, 251),
(25, 31, 257),
(35, 32, 235),
(33, 32, 247),
(34, 32, 250),
(37, 32, 253),
(36, 32, 260),
(69, 33, 235),
(73, 33, 247),
(72, 33, 250),
(71, 33, 253),
(70, 33, 256),
(68, 33, 260),
(91, 34, 235),
(92, 34, 250),
(88, 34, 253),
(89, 34, 256),
(90, 34, 260),
(39, 45, 229),
(44, 45, 240),
(45, 45, 252),
(43, 45, 255),
(38, 45, 259),
(40, 45, 262),
(41, 45, 265),
(50, 46, 229),
(51, 46, 240),
(52, 46, 252),
(48, 46, 255),
(49, 46, 259),
(47, 46, 262),
(46, 46, 265),
(55, 47, 229),
(57, 47, 252),
(53, 47, 255),
(54, 47, 259),
(58, 47, 262),
(56, 47, 265),
(80, 48, 233),
(81, 48, 242),
(82, 48, 244),
(84, 48, 251),
(83, 48, 257),
(87, 49, 233),
(85, 49, 242),
(86, 49, 251),
(96, 50, 231),
(94, 50, 234),
(93, 50, 241),
(97, 50, 245),
(95, 50, 248),
(98, 50, 258),
(103, 51, 231),
(104, 51, 234),
(102, 51, 241),
(101, 51, 245),
(99, 51, 248),
(100, 51, 258),
(109, 52, 231),
(110, 52, 234),
(108, 52, 241),
(106, 52, 245),
(105, 52, 248),
(107, 52, 258),
(114, 53, 231),
(113, 53, 234),
(111, 53, 248),
(112, 53, 258),
(118, 54, 229),
(119, 54, 240),
(121, 54, 252),
(120, 54, 255),
(117, 54, 259),
(116, 54, 262),
(115, 54, 265);

-- --------------------------------------------------------

--
-- Table structure for table `SP18_fdg_event`
--

CREATE TABLE `SP18_fdg_event` (
  `pfdg_event_id` int(11) NOT NULL,
  `pfdg_event_name` varchar(60) NOT NULL,
  `pfdg_event_description` varchar(500) DEFAULT NULL,
  `pfdg_start_date` datetime NOT NULL,
  `pfdg_end_date` datetime NOT NULL,
  `pfdg_event_bg_color` varchar(7) DEFAULT '#0000ff',
  `pfdg_event_ft_color` varchar(7) DEFAULT '#ffffff'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SP18_fdg_event`
--

INSERT INTO `SP18_fdg_event` (`pfdg_event_id`, `pfdg_event_name`, `pfdg_event_description`, `pfdg_start_date`, `pfdg_end_date`, `pfdg_event_bg_color`, `pfdg_event_ft_color`) VALUES
(1, 'TEST', 'TEST', '2017-08-14 00:00:00', '2017-08-14 01:00:00', '#0000ff', '#ffffff');

-- --------------------------------------------------------

--
-- Table structure for table `SP18_fdg_event_attendence`
--

CREATE TABLE `SP18_fdg_event_attendence` (
  `pfdg_eve_att_id` int(11) NOT NULL,
  `pfdg_event_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `SP18_fdg_leaders`
--

CREATE TABLE `SP18_fdg_leaders` (
  `pfdg_leader_id` int(11) NOT NULL,
  `pfdg_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SP18_fdg_leaders`
--

INSERT INTO `SP18_fdg_leaders` (`pfdg_leader_id`, `pfdg_id`, `pstu_id`) VALUES
(1, 2, 17),
(2, 2, 23),
(3, 5, 34),
(4, 5, 43),
(5, 6, 18),
(6, 6, 31),
(10, 8, 9),
(11, 8, 10),
(12, 9, 21),
(13, 9, 44),
(14, 7, 22),
(15, 7, 13);

-- --------------------------------------------------------

--
-- Table structure for table `SP18_fdg_members`
--

CREATE TABLE `SP18_fdg_members` (
  `pfdg_member_id` int(11) NOT NULL,
  `pfdg_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SP18_fdg_members`
--

INSERT INTO `SP18_fdg_members` (`pfdg_member_id`, `pfdg_id`, `pstu_id`) VALUES
(2, 7, 254),
(4, 7, 239),
(5, 7, 228),
(6, 7, 236),
(7, 7, 230),
(8, 7, 232),
(9, 8, 248),
(10, 8, 241),
(11, 8, 258),
(12, 8, 245),
(13, 8, 234),
(14, 8, 231),
(15, 5, 251),
(16, 5, 249),
(17, 5, 257),
(18, 5, 244),
(19, 5, 233),
(20, 5, 242),
(21, 5, 261),
(22, 2, 253),
(23, 2, 247),
(24, 2, 250),
(25, 2, 260),
(26, 2, 235),
(27, 2, 256),
(28, 6, 263),
(29, 6, 227),
(33, 6, 237),
(34, 6, 243),
(35, 6, 246),
(36, 9, 259),
(37, 9, 265),
(38, 9, 255),
(39, 9, 240),
(40, 9, 229),
(41, 9, 252),
(42, 6, 264),
(43, 9, 262);

-- --------------------------------------------------------

--
-- Table structure for table `SP18_fdg_points`
--

CREATE TABLE `SP18_fdg_points` (
  `pfdg_points_id` int(11) NOT NULL,
  `pfdg_id` int(11) NOT NULL,
  `pfdg_event_id` int(11) NOT NULL,
  `pfdg_points_points` decimal(5,1) NOT NULL DEFAULT 0.0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `SP18_fdg_reports`
--

CREATE TABLE `SP18_fdg_reports` (
  `pfdg_report_id` int(11) NOT NULL,
  `pfdg_id` int(11) NOT NULL,
  `pfdg_report_start_date` datetime NOT NULL,
  `pfdg_report_end_date` datetime NOT NULL,
  `pfdg_report_hours` decimal(5,1) DEFAULT NULL,
  `pfdg_report_description` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SP18_fdg_reports`
--

INSERT INTO `SP18_fdg_reports` (`pfdg_report_id`, `pfdg_id`, `pfdg_report_start_date`, `pfdg_report_end_date`, `pfdg_report_hours`, `pfdg_report_description`) VALUES
(1, 7, '2018-01-29 17:30:00', '2018-01-29 18:30:00', '1.0', 'Today we played a funny meme game'),
(2, 7, '2018-02-05 18:15:00', '2018-02-05 19:15:00', '1.0', 'This session we had dinner together.'),
(3, 7, '2018-02-07 17:30:00', '2018-02-07 18:30:00', '1.0', 'This meeting we attended structure construction.'),
(4, 7, '2018-02-19 17:00:00', '2018-02-19 18:00:00', '1.0', 'Session Not Complete'),
(5, 7, '2018-02-26 17:00:00', '2018-02-26 18:00:00', '1.0', 'Session Not Complete'),
(6, 7, '2018-03-05 17:00:00', '2018-03-05 18:00:00', '1.0', 'Session Not Complete'),
(7, 7, '2018-03-19 17:00:00', '2018-03-19 18:00:00', '1.0', 'Session Not Complete'),
(8, 7, '2018-03-26 17:00:00', '2018-03-26 18:00:00', '1.0', 'Session Not Complete'),
(9, 7, '2018-04-02 17:00:00', '2018-04-02 18:00:00', '1.0', 'Session Not Complete'),
(10, 7, '2018-04-09 17:00:00', '2018-04-09 18:00:00', '1.0', 'Session Not Complete'),
(11, 7, '2018-04-16 17:00:00', '2018-04-16 18:00:00', '1.0', 'Session Not Complete'),
(12, 7, '2018-04-23 17:00:00', '2018-04-23 18:00:00', '1.0', 'Session Not Complete'),
(13, 7, '2018-04-30 17:00:00', '2018-04-30 18:00:00', '1.0', 'Session Not Complete'),
(14, 6, '2018-01-23 18:00:00', '2018-01-23 19:00:00', '1.0', 'We all hung out at Fairview and talked about what we did over break'),
(15, 6, '2018-01-30 18:00:00', '2018-01-30 19:00:00', '1.0', 'Went to Fairview and played board games and pool'),
(16, 6, '2018-02-06 18:00:00', '2018-02-06 19:00:00', '1.0', 'Went to dinner as an fdg'),
(17, 6, '2018-02-13 18:00:00', '2018-02-13 19:00:00', '1.0', 'Structure Construction counted as our FDG'),
(18, 6, '2018-02-20 18:00:00', '2018-02-20 19:00:00', '1.0', 'N/A'),
(19, 6, '2018-02-27 18:00:00', '2018-02-27 19:00:00', '1.0', 'N/A'),
(20, 6, '2018-03-06 18:00:00', '2018-03-06 19:00:00', '1.0', 'N/A'),
(21, 6, '2018-03-20 18:00:00', '2018-03-20 19:00:00', '1.0', 'N/A'),
(22, 6, '2018-03-27 18:00:00', '2018-03-27 19:00:00', '1.0', 'N/A'),
(23, 6, '2018-04-03 18:00:00', '2018-04-03 19:00:00', '1.0', 'N/A'),
(24, 6, '2018-04-10 18:00:00', '2018-04-10 19:00:00', '1.0', 'N/A'),
(25, 6, '2018-04-17 18:00:00', '2018-04-17 19:00:00', '1.0', 'N/A'),
(26, 6, '2018-04-24 18:00:00', '2018-04-24 19:00:00', '1.0', 'N/A'),
(27, 6, '2018-05-01 18:00:00', '2018-05-01 19:00:00', '1.0', 'N/A'),
(28, 2, '2018-01-23 16:00:00', '2018-01-23 17:00:00', '1.0', 'We had our first meeting of the spring semester and just talked about our breaks!'),
(29, 7, '2018-01-22 17:30:00', '2018-01-22 18:30:00', '1.0', 'This meeting we had dinner in lower Bentley.'),
(30, 5, '2018-01-24 17:30:00', '2018-01-24 18:30:00', '1.0', 'watched a movie in Haley\'s apartment'),
(31, 5, '2018-01-30 17:30:00', '2018-01-30 18:30:00', '1.0', 'played games in fairview'),
(32, 2, '2018-02-01 19:00:00', '2018-02-01 20:00:00', '1.0', 'We went to Avenue 209'),
(33, 2, '2018-02-08 19:00:00', '2018-02-08 20:00:00', '1.0', 'We went to Structure Construction as our FDG!'),
(34, 2, '2018-02-15 19:00:00', '2018-02-15 20:00:00', '1.0', 'We went to the Paint & Sip as our FDG!'),
(35, 2, '2018-02-22 19:00:00', '2018-02-22 20:00:00', '1.0', 'This session has not occurred yet'),
(36, 2, '2018-03-01 19:00:00', '2018-03-01 20:00:00', '1.0', 'This session has not occurred yet'),
(37, 2, '2018-03-08 19:00:00', '2018-03-08 20:00:00', '1.0', 'This session has not occurred yet'),
(38, 2, '2018-03-22 19:00:00', '2018-03-22 20:00:00', '1.0', 'This session has not occurred yet'),
(39, 2, '2018-03-29 19:00:00', '2018-03-29 20:00:00', '1.0', 'This session has not occurred yet'),
(40, 2, '2018-04-05 19:00:00', '2018-04-05 20:00:00', '1.0', 'This session has not occurred yet'),
(41, 2, '2018-04-12 19:00:00', '2018-04-12 20:00:00', '1.0', 'This session has not occurred yet'),
(42, 2, '2018-04-19 19:00:00', '2018-04-19 20:00:00', '1.0', 'This session has not occurred yet'),
(43, 2, '2018-04-26 19:00:00', '2018-04-26 20:00:00', '1.0', 'This session has not occurred yet'),
(44, 2, '2018-05-03 19:00:00', '2018-05-03 20:00:00', '1.0', 'This session has not occurred yet'),
(45, 9, '2018-01-23 19:00:00', '2018-01-23 20:00:00', '1.0', 'We went to Avenue 209!'),
(46, 9, '2018-01-30 19:00:00', '2018-01-30 20:00:00', '1.0', 'We went to get dinner at Bentley'),
(47, 9, '2018-02-06 19:00:00', '2018-02-06 20:00:00', '1.0', 'We had a study session'),
(48, 5, '2018-02-07 17:30:00', '2018-02-07 18:30:00', '1.0', 'We built snow people'),
(49, 5, '2018-02-14 17:30:00', '2018-02-14 18:30:00', '1.0', 'we studied together at the library'),
(50, 8, '2018-01-23 18:15:00', '2018-01-23 19:15:00', '1.0', 'Meeting completed'),
(51, 8, '2018-02-01 18:30:00', '2018-02-01 19:30:00', '1.0', 'Meeting completed'),
(52, 8, '2018-02-07 17:30:00', '2018-02-07 18:30:00', '1.0', 'Meeting completed'),
(53, 8, '2018-02-13 19:00:00', '2018-02-13 20:00:00', '1.0', 'Meeting Completed'),
(54, 9, '2018-02-13 19:00:00', '2018-02-13 20:00:00', '1.0', 'We went to the Valentine\'s Day party');

-- --------------------------------------------------------

--
-- Table structure for table `SP18_pif`
--

CREATE TABLE `SP18_pif` (
  `pif_id` int(11) NOT NULL,
  `pif_start_date` datetime NOT NULL,
  `pif_end_date` datetime NOT NULL,
  `pif_title` varchar(60) NOT NULL,
  `pif_description` varchar(250) DEFAULT NULL,
  `pif_bg_color` varchar(7) DEFAULT '#0000ff',
  `pif_ft_color` varchar(7) DEFAULT '#ffffff'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `SP18_pif_stats`
--

CREATE TABLE `SP18_pif_stats` (
  `pifstat_id` int(11) NOT NULL,
  `pstu_id` int(11) NOT NULL,
  `pif_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `SP18_stats`
-- (See below for the actual view)
--
CREATE TABLE `SP18_stats` (
`usr_fname` varchar(20)
,`usr_lname` varchar(35)
,`usr_school_id` varchar(4)
,`usr_id` int(11)
,`acad_events` decimal(29,2)
,`ags` decimal(29,2)
,`com_hours` decimal(30,2)
,`pifs` bigint(21)
,`fdg` decimal(28,2)
,`capstone` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `usr_id` int(11) NOT NULL,
  `usr_username` varchar(15) NOT NULL,
  `usr_fname` varchar(20) NOT NULL,
  `usr_lname` varchar(35) NOT NULL,
  `usr_school_id` varchar(4) DEFAULT NULL,
  `usr_school_email` varchar(60) NOT NULL,
  `usr_perm_email` varchar(60) DEFAULT NULL,
  `usr_status` int(11) NOT NULL,
  `usr_education` int(11) NOT NULL,
  `usr_imagepath` varchar(30) DEFAULT NULL,
  `usr_password` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`usr_id`, `usr_username`, `usr_fname`, `usr_lname`, `usr_school_id`, `usr_school_email`, `usr_perm_email`, `usr_status`, `usr_education`, `usr_imagepath`, `usr_password`) VALUES
(1, 'admin', 'Admin', 'Admin', '-1', 'admin@lhup.edu', 'admin@gmail.com', 1, 6, '', '$2a$10$leskfiqamdhjthrjwsksdesAQjvwA0LqCxJ3Rwe1GINOHEoeV31xK'),
(5, 'otb1090', 'Olivia', 'Bellomo', '7904', 'otb1090@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksdeF89vkKMkxA.q8tBAX6xu3M8wV9Je0NO'),
(6, 'jtb2345', 'Jason', 'Berlin', '7246', 'jtb2345@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksde8HxsC3HUoAq1VjtLiJ1hHiHplvCZNNW'),
(7, 'klb4200', 'Kania', 'Brown', '8256', 'klb4200@lhup.edu', '', 6, 1, '', '$2a$10$leskfiqamdhjthrjwsksdemQ5UwekOoGrTn/JlXm7o4jhro2RUJw.'),
(8, 'kjb2796', 'Krystjana', 'Bruce', '6899', 'kjb2796@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksdeUkChXpA6F9NaE1iQ9cBUB/coeJ0wr/.'),
(9, 'cec4172', 'Cole', 'Chilcote', '4880', 'cec4172@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksde.eq6c9fhM2d4OgRBYZmNjdwaohQ7bJe'),
(10, 'jmc6590', 'Jessica', 'Cover', '8309', 'jmc6590@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksde6bMj.7Ky.HwWOiFPCl5vLtnp1PwxH0W'),
(11, 'ejc5844', 'Emily', 'Coyner', '0368', 'ejc5844@lhup.edu', '', 6, 1, '', '$2a$10$leskfiqamdhjthrjwsksde6hzrb6iNVhfBsTGNqxq1CrWMMqqHtwO'),
(12, 'qac5836', 'Quinn', 'Cummings', '4585', 'qac5836@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksdeSQ11AyfRTwQPhHfUq1F9AZKE.ZsLHB2'),
(13, 'mkd9008', 'Mackenzie', 'David', '4139', 'mkd9008@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksdewnjgnq/GmJGn0CevbM.i9GCT103Hu0K'),
(14, 'and673', 'Allison', 'Downs', '9665', 'and673@lhup.edu', '', 6, 1, '', '$2a$10$leskfiqamdhjthrjwsksdenUGXu4LMhBLFG3bHW4KkUzC.Fp5az6K'),
(15, 'ate5901', 'Avery', 'Eddy', '4740', 'ate5901@lhup.edu', '', 6, 1, '', '$2a$10$leskfiqamdhjthrjwsksdePsfIsamYx0x.TF9Ec85Fi0Tu7dky9JO'),
(16, 'nce960', 'Noah', 'Ellison', '3018', 'nce960@lhup.edu', '', 6, 1, '', '$2a$10$leskfiqamdhjthrjwsksdemIAODuHAYzFfOTcsBtIlcxO8DP.LJKO'),
(17, 'bcf5550', 'Brian', 'Flatter', '0831', 'bcf5550@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksdevvvrhOYHP2/29/opJ1c7eulfM1Twa8u'),
(18, 'rog9823', 'Rachel', 'Grow', '2554', 'rog9823@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksde76Db9hb47DVSbKUJCkN05kLybPf9RgS'),
(20, 'ejh1960', 'Emily', 'Hurlburt', '9041', 'ejh1960@lhup.edu', '', 6, 1, '', '$2a$10$leskfiqamdhjthrjwsksde5KOOtY4ByURd4attizCHOZbPNsd6P9a'),
(21, 'alj7679', 'Annie', 'Jones', '4678', 'alj7679@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksdeDZ96ON39bCaaeKMrioX3cNOj3mwd2IK'),
(22, 'sek6808', 'Sarah', 'Kozlowski', '0788', 'sek6808@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksderrQsSwnoSpE1qdrqlwphCwE2TzTIx..'),
(23, 'ejl2251', 'Elizabeth', 'Laatsch', '6539', 'ejl2251@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksdepwjXfYWOTVv68rBoS81h8g2Tl.hf.GS'),
(24, 'shl3496', 'Sierra', 'Laughead', '8189', 'shl3496@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksdeG/KPWN3MKFgMCz2.JxBxbEFi.Hlqbxm'),
(25, 'cjl7003', 'Casey', 'Lello', '7729', 'cjl7003@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksdeY72SqEgSEieL4CtFay5uabG5IFZIPgW'),
(26, 'lvl3748', 'Loren', 'Librizzi', '9919', 'lvl3748@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksdehU.TUmXYvOGC.Y3I6CV6tN7j6AokJoC'),
(27, 'amm2351', 'Abigail', 'Markish', '6071', 'amm2351@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksde3Q3PxQ1XJqZtp1hIHelvqcGjqJZAY3u'),
(28, 'kjm2080', 'Kyle', 'McCarthy', '0419', 'kjm2080@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksdeyOUqBhQhgqClB5IEiRqXqtm5GElhJw.'),
(29, 'bmm1490', 'Breanna', 'McDonald', '6801', 'bmm1490@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksdeXpGse9JYKoKORa1lLYZTbSdouZP.gpS'),
(30, 'rem3861', 'Rachael', 'Meckley', '5360', 'rem3861@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksdes7gx6joJsoIHFpoPKsu3E0J8f3.uRmW'),
(31, 'bhm1023', 'Blake', 'Miller', '2246', 'bhm1023@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksdec33YwwoFoMOYLroLaq/yK8TPajTecMG'),
(32, 'bam388', 'Brooke', 'Miller', '2875', 'bam388@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksde8zHxgRF6QgBg5f685HeAXgP/t.OIg0.'),
(33, 'emm7744', 'Eva', 'Miller', '7655', 'emm7744@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksde7kKBMUEqMKzTyz4uohKMpqGCUXE62Ha'),
(34, 'hlm5009', 'Haley', 'Moyer', '3980', 'hlm5009@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksdeGnUSiA2SEOX43RU.SfIH1N.eFXbLfb2'),
(35, 'btn3955', 'Brittany', 'Naculich', '8013', 'btn3955@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksde4Ny/nid7omZZa4ZgUmqy24TRvNNQIGi'),
(36, 'mlp7221', 'Michaela', 'Pesta', '8661', 'mlp7221@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksdegymaIL38na4ogd9MZSgRIgTAFiB7LlO'),
(37, 'tlp653', 'Taylor', 'Plouse', '5393', 'tlp653@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksdeGL5w96Y1fE8t7hixYasmfHmMzFXDPZa'),
(38, 'njr708', 'Noah', 'Rainbow-Douglas', '0521', 'njr708@lhup.edu', '', 6, 1, '', '$2a$10$leskfiqamdhjthrjwsksdeQ9AlAPn5MkQYQEc.RX.FHNw3HOBUwq2'),
(39, 'amr794', 'Allison', 'Reed', '2033', 'amr794@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksdefiBxj1fHkvDiVrSMCbDmNBhxGrrsajK'),
(40, 'ecr2118', 'Emily', 'Robb', '5879', 'ecr2118@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksdeoOv0X4qHhEZF7FqwfzOiEKAEpqij8iC'),
(41, 'jar228', 'Jonathan', 'Ross', '9060', 'jar228@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksdefeI5yBA/pV8vsjcwxAOgNf3ukSkDxL2'),
(42, 'clr2027', 'Caroline', 'Rublein', '6748', 'clr2027@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksdeOGdJVMYjR6PiCPJTXX1j8ErJG11U3Bi'),
(43, 'ckr8523', 'Cheyenne', 'Ryan', '9862', 'ckr8523@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksdeF9NFhLVBcF/QHJPT8pRXvFtck0Pixw2'),
(44, 'gis7617', 'Grier', 'Sayers', '8145', 'gis7617@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksde5zM/VvQ58SCXOhrxcaAktwwabeU6tw2'),
(45, 'ess1906', 'Elisa', 'Seip', '3275', 'ess1906@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksdeZIO8VUuEb4r9.c1nQwKcOaMeU1U1Gcq'),
(46, 'jms2505', 'Jenna', 'Shank', '8912', 'jms2505@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksdecINyIaCHXsGmBDBaVcg4Zwk8uO4Lr4m'),
(47, 'zms6662', 'Zoe', 'Shelly', '9910', 'zms6662@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksde6W8uzky8NAgqXaC3YESrC0NzTeMyqJa'),
(48, 'mss4844', 'Michael', 'Signor', '0898', 'mss4844@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksdemeCiMs.dlgF10B.R5/mYDH5kD5q9AGi'),
(49, 'dhs6850', 'Danielle', 'Steiner', '7928', 'dhs6850@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksdemJsfKOLo0i8caf3hjGhtIb9ViefVzu6'),
(50, 'hes1733', 'Haleigh', 'Swam', '5587', 'hes1733@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksdesAQjvwA0LqCxJ3Rwe1GINOHEoeV31xK'),
(51, 'kms6593', 'Kalista', 'Swartz', '8162', 'kms6593@lhup.edu', '', 6, 1, '', '$2a$10$leskfiqamdhjthrjwsksdegXeUDvQAqzp82Iz0LlfKeMxqj4oPury'),
(52, 'dmw6337', 'Danielle', 'Walsh', '1625', 'dmw6337@lhup.edu', '', 6, 1, '', '$2a$10$leskfiqamdhjthrjwsksdedxQnUDFvQriyknyzu72.sBP8Yo0anHy'),
(53, 'rmb7359', 'Regina', 'Beers', '5339', 'rmb7359@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeWd2PzFiFvi6NLcJg6.6a3dgVEF2Mu.G'),
(54, 'heb768', 'Hannah', 'Bell', '4874', 'heb768@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeU0/DEb01b3pCaXsEPqfZ2UJEhbLuZcy'),
(55, 'rab484', 'Roxanne', 'Bell', '0477', 'rab484@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdehz10KkVLe7V7kYJ.u73B8OKTJmaCq1C'),
(56, 'elb6665', 'Erica', 'Berkowitz', '7701', 'elb6665@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksden0FjpVonSeNgtYc.rEfUCEnv.yhTviy'),
(57, 'jab4806', 'Juan', 'Brubaker', '4356', 'jab4806@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdefQlDIcbSn2YHmnhm3g.KeOT/p82Wye.'),
(58, 'mac4613', 'Madeline', 'Cingle', '4073', 'mac4613@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeJV2bsToWz9yORkDJtfYNHyZfVxAE9vG'),
(59, 'src2134', 'Samantha', 'Clark', '7143', 'src2134@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeiqg2iDLAPS8DopfgbIBFTvLampH2xvW'),
(60, 'tmc2302', 'Taryn', 'Crone', '2724', 'tmc2302@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeNndgA.P0/YvtmZvhurqVUpVbI/7OzRe'),
(61, 'mjd681', 'Makayla', 'Dickey', '4726', 'mjd681@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeIGB8fc3hWV/GvkYF.gw8PHBa9Ex5igG'),
(62, 'lad9460', 'Lindsey', 'Dry', '5835', 'lad9460@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdez.srJ0QW7drHT5cEatMV6dmojvfmN/2'),
(63, 'kef8437', 'Katie', 'Fitzgerald', '7617', 'kef8437@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksde.2ZSvsHB1fbvR2/QEpuhj1rEDX4CdUy'),
(64, 'arg9526', 'Ashlea', 'Ghaner', '1779', 'arg9526@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdev3ifH48OuN.JVZ1Y4XpJwh80FooK5Bu'),
(65, 'sjg9378', 'Samantha', 'Gilbert', '6768', 'sjg9378@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeXvzKgbW1szMjRDiqrjGESFgQWqRtTtS'),
(66, 'spg5331', 'Spencer', 'Gogol', '1955', 'spg5331@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdemY.6DF3VnMBAKgQm0SUCiMN1FYcvjUm'),
(67, 'ath9888', 'Alyson', 'Harden', '7035', 'ath9888@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeciH4IBfoYcPAkaNuLhEZ9z4ftEbibBO'),
(68, 'mjh7610', 'Matthew', 'Henry', '6461', 'mjh7610@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeL7/Zem.r7x.NqdTAGVMZLDJG1rDFH7K'),
(69, 'pmh2622', 'Phaedra', 'Hockman', '0282', 'pmh2622@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeyzPNgLRZMNsqalfeiMout3RoCRoSJi6'),
(70, 'jth6076', 'Jacob', 'Hohman', '4555', 'jth6076@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdelWQ4a.Kueou.w5QLoTc0b.EO5t8VYCi'),
(72, 'njk4553', 'Nicholas', 'Kuster', '9446', 'njk4553@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeisVLfkOXrAEkhIsLUy1dTQN31l.uXx.'),
(73, 'enl4823', 'Emily', 'Livezey', '9058', 'enl4823@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeCQy6UXbhkEpNNcKiVUuvexpQ/mAEyRK'),
(74, 'jal6893', 'Julia', 'Locy', '3321', 'jal6893@lhup.edu', '', 6, 2, '', '$2a$10$leskfiqamdhjthrjwsksde5R.zH50CVWq57850/HBWqo.C9fJ5W7q'),
(75, 'rrm2605', 'Rhiannon', 'McGlone', '6186', 'rrm2605@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksde6cr.k6qVG2l50EzVdJ06YcsBCRXLpQq'),
(76, 'acm8111', 'Aimee', 'Mehta', '7063', 'acm8111@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeYNYoxYh/TLknQlXY4uVANr9hnKmRK4y'),
(77, 'mem918', 'Michael', 'Menafro', '8666', 'mem918@lhup.edu', '', 6, 2, '', '$2a$10$leskfiqamdhjthrjwsksdeTnNxuaT7QXXBXwp8ejrcjIKR6C34ZUC'),
(78, 'kam5529', 'Katie', 'Merritt', '9215', 'kam5529@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksderXQrNjq6vUtvJJqjTw5/Oq3GT7i5UzW'),
(79, 'cwm4143', 'Chadd', 'Miller', '4632', 'cwm4143@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeFFguoHAtRqy/YdWETsE8KxGk0d1jfqm'),
(80, 'cmm1134', 'Chelsie', 'Miller', '2901', 'cmm1134@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeCQ14Dec7cLbqJg6OpbtWuQENvFb2ZgO'),
(81, 'grm4926', 'Grace', 'Monroe', '5095', 'grm4926@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksder7BzjH9I7lNvrDYtupe7L/7KfIhPb36'),
(82, 'mem8191', 'Madison', 'Morris', '2022', 'mem8191@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeD14NwxoLVI3y.0G6zoUfMFJGJf65Kr2'),
(83, 'vlm4554', 'Veronica', 'Morrison', '0943', 'vlm4554@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeLWoMI8RqYJpXUHhUsJD5LToAg.4RsLe'),
(84, 'cbn5435', 'Cassandra', 'Nading', '3146', 'cbn5435@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksderVa9Fq0hN.1o7usUGW0rttG1p40IOTq'),
(85, 'hso6066', 'Hannah', 'Ostrander', '0292', 'hso6066@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeMzR5kUqGZXmAKsdSNFgMkBhCXkCZ7Fm'),
(86, 'vkp6672', 'Veronica', 'Pham', '8705', 'vkp6672@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeQrSawulYU33sZC5IEZyf8hP18py1OfG'),
(87, 'amp4887', 'Ashlee', 'Power', '1015', 'amp4887@lhup.edu', '', 6, 2, '', '$2a$10$leskfiqamdhjthrjwsksdeXq0eBVOfRI9JE9r/gwlDrbFw9zXSFP2'),
(88, 'tpp5093', 'Taylor', 'Price', '4640', 'tpp5093@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeLA1NF8nOPuxWtVX02lp7rbck4X4ntyC'),
(89, 'mbr7892', 'Morgan', 'Rager', '1037', 'mbr7892@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeE38.lghZZb2cRbWWJVlSHut0DJsX1Nq'),
(90, 'rnr8489', 'Raechel', 'Rodriguez', '6678', 'rnr8489@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdecputSzYdzNdRXnJuEboUWuYN5Soy9Fi'),
(91, 'kfr6225', 'Kimberly', 'Rogers', '8201', 'kfr6225@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeKqExFkk//cpgEdoxvuT/uJx5iuAJbNi'),
(92, 'sjr5895', 'Spencer', 'Ross', '7264', 'sjr5895@lhup.edu', '', 6, 2, '', '$2a$10$leskfiqamdhjthrjwsksdevBFfEZs9sWZcNBMJ6L4bpaLEADPoB.q'),
(93, 'bas354', 'Brooke', 'Saporito', '8196', 'bas354@lhup.edu', '', 4, 2, '', '$2a$10$leskfiqamdhjthrjwsksdez5HmvRZqDzCZ2fLLqdfLtCWtVXDymx6'),
(94, 'srs48', 'Samantha', 'Savage', '5950', 'srs48@lhup.edu', '', 6, 2, '', '$2a$10$leskfiqamdhjthrjwsksdetykL9jEFctbmXTXWB.3XaOIUdwv/mgy'),
(95, 'trs9407', 'Tabitha', 'Schappell', '8411', 'trs9407@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeEK7zTp4eB7jf2y2ue4Ot21zOql5x6uS'),
(96, 'mms6886', 'Morgan', 'Scott', '1986', 'mms6886@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdevqrJZ.9hZ0v2LnKW/0mudaKYbpZqbp2'),
(97, 'ecs8241', 'Eric', 'Shuffelbottom', '9769', 'ecs8241@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdexGxa57brK6FV.4YMKbGa2rEcmMN274a'),
(98, 'jas632', 'Justin', 'Silverstrim', '8085', 'jas632@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeznwEE7zfYRF2o1sQkYXBoGzLzlgjRYC'),
(99, 'mes1719', 'Mallory', 'Simonton', '0785', 'mes1719@lhup.edu', '', 6, 2, '', '$2a$10$leskfiqamdhjthrjwsksdevm5hpsLgeXrRPtP8EfX1oTrSU/txK0q'),
(100, 'mls6681', 'Mackenzie', 'Sullivan', '5543', 'mls6681@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeDAqo9aroArwBqVRzcl4xW7owGz.n6.O'),
(101, 'sjv1062', 'Sharon', 'Valerio', '7966', 'sjv1062@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksde4JB6TmfIkzPIa/3dh2MzEj5shCTGoZW'),
(102, 'mmv3924', 'Melissa', 'Velardi', '5457', 'mmv3924@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeoRgKkDZ6nuMTNNNOGXwtfwRWc9yBHZ2'),
(103, 'jvv3885', 'Joseph', 'Visceglia', '9079', 'jvv3885@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdetPANd2C2RYz3P82tEjBLHirKuYACsZ6'),
(104, 'klw8340', 'Kara', 'Wasiewicz', '3168', 'klw8340@lhup.edu', '', 6, 2, '', '$2a$10$leskfiqamdhjthrjwsksdenPXhgUitG0pyt5IZ.Ue/huzgBVQvlDi'),
(105, 'adw560', 'Anson', 'Weidner', '3883', 'adw560@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksde.50YCSVDZoZw78izEw1sYtkskagZiaq'),
(106, 'klw5240', 'Kara', 'Wendling', '0260', 'klw5240@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeMWYmh81TYXe2PaHKb/NQkILoqNGNV5i'),
(107, 'jaw3939', 'Joseph', 'White', '2739', 'jaw3939@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdexTmGl.6jqKw50xy7X0x66L0GJrfiyIq'),
(108, 'txw7233', 'Tyra', 'Wiggins', '7489', 'txw7233@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeqY39/ZT6hEjYc2pCMr.QCMN22Vs/pwm'),
(109, 'lew6029', 'Lauren', 'Williams', '8253', 'lew6029@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdefu6cWNm5v9AHh1vV1BL3bADUNwu5fki'),
(110, 'hmy19', 'Haylee', 'Young', '9046', 'hmy19@lhup.edu', '', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeg8TcydLCvJWK4j46bAZvjzKOQLVqzF.'),
(111, 'zma38', 'Zobaku', 'Acholonu', '2497', 'zma38@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksdeL.R7g12EwMxDwPdaGDAhEsJnAlWgyZa'),
(112, 'tja6546', 'Tyler', 'Adams', '9646', 'tja6546@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksde7G8v7vyuz0xgriVX0/VI7pKuBqTVXjm'),
(113, 'cla5195', 'Chelsea', 'Allen', '9000', 'cla5195@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksdey.DkTdVpWQS8S15ZW//i/6NMNjGoMDW'),
(114, 'naa3997', 'Nicole', 'Allen', '4234', 'naa3997@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksdejZczP5nMlpBkx2HBad6jZvxdDrbJMja'),
(115, 'mka4412', 'Mary', 'Arnold', '1350', 'mka4412@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksdemLMLDobaYHyGoBh68RLvJbxSk9tYsFK'),
(116, 'dqb3306', 'Devyn', 'Barry', '4366', 'dqb3306@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksde76Db9hb47DVSbKUJCkN05kLybPf9RgS'),
(117, 'twb9017', 'Thomas', 'Bates', '0093', 'twb9017@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksdec9QOdCGNADrtA4HpXkx96COhNiUm5FW'),
(118, 'jmb7336', 'Joshua', 'Bechdel', '6926', 'jmb7336@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksderOrH66MPamUEjkvOZiJ5i3x.nPhocdK'),
(119, 'mlb5440', 'Matthew', 'Bell', '0715', 'mlb5440@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksde.T361AMP331bKzT8OlDaHlHzpOsC/06'),
(120, 'jmb4300', 'Justina', 'Blood', '9747', 'jmb4300@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksde2n1pCzy9k2SesXjyqK9pSOfRpzvi4GK'),
(121, 'rlb1614', 'Rebecca', 'Bowling', '1254', 'rlb1614@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksdeGUXH5IufWaYtJxrsGfK8g8cOlK80V5O'),
(122, 'ctc8881', 'Courtney', 'Chamberlain', '6299', 'ctc8881@lhup.edu', '', 3, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeXk3QVKRIEVF5UIY3qYlmcpqMRi7.m6q'),
(123, 'kxc401', 'Katelyn', 'Costanza', '6401', 'kxc401@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksdeKWMv3RbY6mYYxDvMqHLc14TmYR4arV6'),
(124, 'mrc1367', 'Morgan', 'Costello', '9802', 'mrc1367@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksde1Bx1jbX0vJyLBcmcECfTIbyq8oSdCZ6'),
(125, 'msc4915', 'Melissa', 'Covert', '2821', 'msc4915@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksdehBLcltS4GUHpxrrsCRprxa48YeXEvlu'),
(126, 'ksf4582', 'Kara', 'Fernald', '7773', 'ksf4582@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksde9xhytJP0C6DwKPjvVtjqYihXJl9MvxO'),
(127, 'ccf2591', 'Cassandra', 'Fiorino', '7713', 'ccf2591@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksdeJOrNq.LXP0pZDUgeV1Te8V5EXozbne.'),
(128, 'tdf3859', 'Tabitha', 'Fisher', '9843', 'tdf3859@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksdeT/P5Bv7lO9IvNQsbIxGf/ecZlSDQxaq'),
(129, 'gef7337', 'Gabrielle', 'Freeman', '4038', 'gef7337@lhup.edu', '', 6, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeNmkqBX/qqI2RaSzQ32tqDjmg84lHe52'),
(130, 'jdf85', 'Julie', 'Fryer', '8448', 'jdf85@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksdebAIDB0Ooul5UZUzhrXd4lxLjWW0sc4i'),
(131, 'mlg8475', 'Michaela', 'Gawrys', '5970', 'mlg8475@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksdeCiAu2gKjU3MYGLxLMd/iFV1DUl1657.'),
(132, 'ang8088', 'Ashley', 'Gochenaur', '3455', 'ang8088@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksdeNiY176uUfj8T/Vq82ac4VgATyRYMZ6e'),
(133, 'aeh4694', 'Arianne', 'Hamilton', '9113', 'aeh4694@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksdewFFVjKrk.URoazRBcXd3o8HrzpSiuO.'),
(134, 'anh6378', 'Alexandra', 'Hartz', '9362', 'anh6378@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksdepi82UGWwHN8ZTkB7I9t6r2XGtxQn7Ra'),
(135, 'cjh7902', 'Colby', 'Heintzelman', '5629', 'cjh7902@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksde2EUPSz3FXgP248ab9rIvIH/akpMZh36'),
(137, 'kjh6102', 'Kaila', 'Hunter', '7076', 'kjh6102@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksde9847I2sHR5kUVK/HfdOrm2xFobUzU8.'),
(138, 'smk6569', 'Sierra', 'Kirsch', '4751', 'smk6569@lhup.edu', '', 3, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeR2NQuxp77Om1PyM5UHARDofbELMWB4C'),
(139, 'nak6219', 'Nathan', 'Kreider', '4940', 'nak6219@lhup.edu', '', 6, 3, '', '$2a$10$leskfiqamdhjthrjwsksdelbK1lPkwSlfo1tOH9T6NwUwjWRYAlRC'),
(140, 'sxl8405', 'Stephanie', 'Lanigan', '5602', 'sxl8405@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksderdCQk6E2bwCbeFwDB2XhIbsOD0vO2X2'),
(141, 'dcl6617', 'Daniel', 'Lorah', '4474', 'dcl6617@lhup.edu', '', 6, 3, '', '$2a$10$leskfiqamdhjthrjwsksderoffSzKfMILV600EBXmZsn5zfHKMTdK'),
(142, 'rkl909', 'Rachel', 'Lyons', '1792', 'rkl909@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksdeOy3CTkFyCyY/4cucA8K0.A9bKOEDhdW'),
(143, 'hlm8156', 'Heaven', 'Martin', '7409', 'hlm8156@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksdeAE8e.yUVoTZQ5QFKCAZVO6al8oRGxh6'),
(144, 'zdm4222', 'Zachary', 'Martin', '6585', 'zdm4222@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksdel0kYRrf5NnWqO02htLBPo9pR1qLRj2y'),
(145, 'mem271', 'Megan', 'McKenna', '3118', 'mem271@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksdecyV/Ig68kC33AkPSS798eoaPVKlr8R6'),
(146, 'rxm2509', 'Rachael', 'Metzinger', '7516', 'rxm2509@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksdegMXobAr5VO05Jj.DsyHfhf7xbAysWfS'),
(147, 'mtm1270', 'Mitchel', 'Myers', '4708', 'mtm1270@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksdejuZZsnWzDueLr42AxjYK9wtZlvD.4uS'),
(148, 'qjo6192', 'Quaadir', 'Otto-Smallwood', '6432', 'qjo6192@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksdeQkVohdHiPckZLD.0THciQ2afnReVxz2'),
(149, 'apr6888', 'Adam', 'Richards', '0109', 'apr6888@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksdeOsH8OJBi/Mda5Ej84F9d0IR3OGmtIhW'),
(150, 'ers8514', 'Emma', 'Scheick', '5485', 'ers8514@lhup.edu', '', 3, 3, '', '$2a$10$leskfiqamdhjthrjwsksdewfS/R6fhSRPw8Jr7oz05l6dVOuvodsq'),
(151, 'kmt6296', 'Kaitlynn', 'Timko', '3288', 'kmt6296@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksdeNwuLQQMABYtZ1hitlSP9gsnwLPia1ky'),
(152, 'sat7034', 'Steven', 'Tyson', '0760', 'sat7034@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksde/Ap71PoGOjwFUpsMfuOXTU8kcE7mtdS'),
(153, 'ndu2784', 'Nathan', 'Ulmer', '7845', 'ndu2784@lhup.edu', '', 6, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeJDzcOFqwFG/Aq3jxcvFTfOtqnw8qFAm'),
(154, 'mcu9991', 'Marissa', 'Umble', '6902', 'mcu9991@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksdewhystWju9Cj9oLGecaOsNwaZ6sOqDH6'),
(155, 'bxw3160', 'Brook', 'Wampole', '2032', 'bxw3160@lhup.edu', '', 3, 3, '', '$2a$10$leskfiqamdhjthrjwsksded2RUwPmPOMJviqooMQjf6fKcKjvIk1m'),
(156, 'ejw4272', 'Elizabeth', 'Wells', '1176', 'ejw4272@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksdeNO7HqgA29cAHTDAPHlZnnMdbz75g.ku'),
(157, 'stw6356', 'Seamus', 'Winters', '4891', 'stw6356@lhup.edu', '', 6, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeKcO0nFWVR.QRfraCKbdfzCvTLzaZXDG'),
(158, 'sey1106', 'Sarah', 'Yarger', '1719', 'sey1106@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksdepoHVcXvPzzrnrT.H8Khr3uccc2dYLY6'),
(159, 'mmy4844', 'Marlene', 'Yi', '4459', 'mmy4844@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksdeNOYXDL/0wf8LE.s2Ma2XFZF9rPQUGoy'),
(160, 'hlz142', 'Hannah', 'Zerbe', '1498', 'hlz142@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksde5CFOQxYAbLm57dON5TEiz9UxIm82vyO'),
(161, 'mma9709', 'Maranda', 'Albin', '7830', 'mma9709@lhup.edu', '', 6, 1, '', '$2a$10$leskfiqamdhjthrjwsksdeXpz3WtHAx0w2wK6QGi64gc.NOwFUFqu'),
(162, 'sra5444', 'Sierra', 'Aichner', '4756', 'sra5444@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksde7Lihf1Kpn.hqlrMg/2WKP2zLaQWoZl6'),
(163, 'mab4793', 'Morgan', 'Bailey', '2880', 'mab4793@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksde9JbtjbK7mXmg3UNIYy/lzHZ1G82DOVq'),
(164, 'emb8359', 'Elizabeth', 'Barney', '7150', 'emb8359@lhup.edu', '', 6, 4, '', '$2a$10$leskfiqamdhjthrjwsksdeprQomyYiHZndp0djOh/PCWhyyDYfDLq'),
(165, 'gdb5673', 'Gregory', 'Belson', '2447', 'gdb5673@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksde6g9vr2ybpNIuB2zzEzJuvcldRWgYKma'),
(166, 'mab4259', 'Megan', 'Bonomo', '7061', 'mab4259@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksde97jcMfzc43rrS7mJsngVkypvUSGqvI.'),
(167, 'cvb4456', 'Cydney', 'Branch', '7156', 'cvb4456@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksdecJRUG2bOUUOqTr8cSSZ6fRCRdB.Qo82'),
(168, 'cab5486', 'Courtney', 'Brown', '3166', 'cab5486@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksdedNhTHT44MOM0Ht4WVC5OC6AOnvKnA6a'),
(169, 'mac5019', 'Mariah', 'Cardoza', '7608', 'mac5019@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksde29IBpNkkWxm72k5ZmStTpBzIN4Jy412'),
(170, 'adc4114', 'Austin', 'Clinger', '7587', 'adc4114@lhup.edu', '', 6, 4, '', '$2a$10$leskfiqamdhjthrjwsksdeZHzybj0/6xHtvnBr9wQFtPXERPRYbKC'),
(171, 'hjc4845', 'Henry', 'Colby', '1610', 'hjc4845@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksdekGApZgs4XTL2Ow0ftglZ6S6.37GoZhW'),
(172, 'kmc7216', 'Katelynn', 'Cover', '7109', 'kmc7216@lhup.edu', '', 3, 4, '', '$2a$10$leskfiqamdhjthrjwsksdeq/kebZh3G81sAE3FjbCVez9f0SjKhme'),
(173, 'mvc9053', 'Max', 'Cravener', '1468', 'mvc9053@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksdeqAqpkJ8CGzHMXuurB6be7yqzHyHfpGK'),
(174, 'cee9535', 'Courtney', 'Ebner', '8319', 'cee9535@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksdeLR9qBWiYJXC.XsOccJeIaQrveSx6QGW'),
(175, 'raf5200', 'Rashad', 'Farrakhan', '5700', 'raf5200@lhup.edu', '', 6, 4, '', '$2a$10$leskfiqamdhjthrjwsksde679ICnfMW/b0d.XP9LvNmTEMSpunU7a'),
(176, 'aaf1102', 'Aaron', 'Ford', '2491', 'aaf1102@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksdetg22WED4azpAMkavaWPPD8qWiO/iv4C'),
(177, 'zrg2672', 'Zachary', 'Gardner', '2991', 'zrg2672@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksdeYrHu4bAe41zcuTF8P/fsD5UhmG0MdYy'),
(178, 'tig6729', 'Tafari', 'Gravesande', '8841', 'tig6729@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksde395Kknz5g3lI7myok4NO53DuyZwRj3.'),
(179, 'wcg4229', 'William', 'Grove', '7182', 'wcg4229@lhup.edu', 'wgrove721@gmail.com', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksdeiZLLbolxIgY/n91/pI.sQet9DncR4Cy'),
(180, 'snh9197', 'Sydney', 'Harteis', '8733', 'snh9197@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksdewx2wto5tcNRzwDWy0QnfB4kUiTzNhyC'),
(181, 'sth1064', 'Shelby', 'Helwig', '3067', 'sth1064@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksdegQbIT0bprJwhEqhHUyZy45C6h7gM6f2'),
(182, 'rmh3947', 'Rebekah', 'Hershey', '2663', 'rmh3947@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksdeUMINF6kG2L5ZDsW7hc5ekh71l.Uz0Om'),
(183, 'alh7846', 'Aubrey', 'Hileman', '2513', 'alh7846@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksdeK9lK36FzdLRiRbJwTpNb8nouGjamEvG'),
(184, 'tmj5280', 'Theresa', 'Johnson', '9183', 'tmj5280@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksdeVjSQKHUEyneBs4i5UFQfQLiMv/KGX8C'),
(185, 'jcj5436', 'Jared', 'Jones', '7273', 'jcj5436@lhup.edu', '', 6, 4, '', '$2a$10$leskfiqamdhjthrjwsksdeXKqLahfUO/QYJ6RG9DHJ2sQpgD39h/y'),
(187, 'cjk5836', 'Conor', 'Kyser', '8425', 'cjk5836@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksdeKlEQ4tdX6/nrKeNBh1821U3oyYthkKO'),
(188, 'adl1863', 'Aaron', 'Lagana', '5937', 'adl1863@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksde1exh7v3gcJJiiTQ/wXsCW/UJaq9CxVK'),
(189, 'asm3214', 'Avery', 'Magill', '8834', 'asm3214@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksdePICCXI/5OgAEwbE7.0kjcb8TKZ58Tnq'),
(190, 'ram8808', 'Roman', 'Marijczuk', '1405', 'ram8808@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksdetcAkqyAjW7aw/3KGVTJD/n4eOvwDf3a'),
(191, 'mlm6713', 'Meghan', 'Mausteller', '9081', 'mlm6713@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksdeeCqwjUEzkzQbm6QbJrOIAcsI8oYqq0u'),
(192, 'aap5264', 'Amanda', 'Pease', '8703', 'aap5264@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksdexhCSJY.NNjydaX0r262.i2ki3VxlG9m'),
(193, 'srp3169', 'Seth', 'Peeler', '1656', 'srp3169@lhup.edu', '', 6, 4, '', '$2a$10$leskfiqamdhjthrjwsksdeld0wrOvUyx7DV9vCymwW/k3vTXV54.u'),
(194, 'cmp3279', 'Christina', 'Perry', '0305', 'cmp3279@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksden.UJezPqa7sURejVnnqy09lVk1/sOqS'),
(195, 'mfp6160', 'Madeline', 'Piersol', '2255', 'mfp6160@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksde0XuNRpEuaKefhMoQ7Rzr5DPbf5Uitia'),
(196, 'hjp9573', 'Heather', 'Porter', '0757', 'hjp9573@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksde3DbEkqvUVHXMeNUdNT2MGYPX91oZrza'),
(197, 'bjp5911', 'Brett', 'Powell', '7007', 'bjp5911@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksdend40OV3XAkVOJ2rgQIGJ031.OReI44y'),
(198, 'dkr6862', 'Diosanny', 'Rivera-Placido', '5580', 'dkr6862@lhup.edu', '', 4, 4, '', '$2a$10$leskfiqamdhjthrjwsksde4rWdpZdbEBo4YwyB9txJ8yGgZ2PJ9Ya'),
(199, 'has2291', 'Holly', 'Saraka', '6570', 'has2291@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksdeC2SjWIMHYwkqgPo7qNmuAGq7SA63DJ.'),
(200, 'kjs1106', 'Kali Jo', 'Savercool', '8544', 'kjs1106@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksdeEQZ3bFfcJxdrso8k1l/GMIA.ueO2HMC'),
(201, 'kns8213', 'Katie', 'Scarborough', '4469', 'kns8213@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksded6VFE5eA9JyYa7cOmyag4InbC2fOpg.'),
(202, 'kls3632', 'Kelsey', 'Schmader', '7988', 'kls3632@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksde3Y3i0uDXeT0mNfBEuAdv0HAtQm8jYBC'),
(203, 'ges6289', 'Gabrielle', 'Schock', '4899', 'ges6289@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksdeLBfE0Bko9mjiwopZlmNy9hgLPeRVrgS'),
(204, 'sas140', 'Sarabeth', 'Seagreaves', '6628', 'sas140@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksdeEuEQr1I/WsytsRovJ0X3MUFXN0PLjXS'),
(205, 'ars694', 'Abigail', 'Shaffer', '6452', 'ars694@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksdeIBChqteFVPYlg.a1VGcgFFajeKu7gpC'),
(206, 'cds8410', 'Collin', 'Snyder', '4480', 'cds8410@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksdeJ2NrxKKIyn9QqUTfnTN2UfZWcu5kK0W'),
(207, 'tav4794', 'Trent', 'Van Dyke', '8802', 'tav4794@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksdecjAZtC7Y4iMI20dCLURdpyhBCQ4rDRG'),
(208, 'jaw7232', 'Jacob', 'Warefield', '2505', 'jaw7232@lhup.edu', '', 6, 4, '', '$2a$10$leskfiqamdhjthrjwsksdeZPmfo.5sLHYYxwPcOHvG0x52/4bh1KW'),
(209, 'sxw2693', 'Samantha', 'Wesnak', '9120', 'sxw2693@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksdevlo3WeDsXiZrA4vbCTKbMz/PAsRuHOG'),
(210, 'jtw6055', 'John', 'Wilkinson', '9086', 'jtw6055@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksdeeGmAAkS6n2P3Vqhx.PyutyLDm1fZ7T.'),
(211, 'tlw1197', 'Trent', 'Wisler', '2624', 'tlw1197@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksdey/iNyRd3iKuY7bxYBe2GGRuw18Cfupe'),
(212, 'kay3569', 'Kelsey', 'Young', '0601', 'kay3569@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksdemgfVccBGgRR1JuLdxFDp/7cdk1iyte6'),
(213, 'bsz5582', 'Brittney', 'Zeller', '9114', 'bsz5582@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksdeeeT8esFoWARJQzFmmT1TImYFu3LKyda'),
(214, 'cam31', 'Casey', 'Morean', '9084', 'cam31@lhup.edu', '', 3, 5, '', '$2a$10$leskfiqamdhjthrjwsksde1/DhYtlEQgTyBcX.AkfQdFyq8smhHU2'),
(216, 'bmb6080', 'Breanna', 'Balliet', '5804', 'bmb6080@lhup.edu', '', 6, 1, '', '$2a$10$leskfiqamdhjthrjwsksdeSp2Dl210ZU1iAp73EBCWVaynClwtRZO'),
(217, 'mcb5126', 'Matthew', 'Behrens', '0458', 'mcb5126@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksdemshwKkkKHgO66i3UMmzm5sUrDzUGjeC'),
(218, 'jwhitlin', 'Jacqueline', 'Dumm', '8465', 'jwhitlin@lhup.edu', '', 5, 6, '', '$2a$10$leskfiqamdhjthrjwsksde7CAt9vXs4eHyg50a1TGDRrL60jdtr4G'),
(219, 'sodell', 'Shawn', 'ODell', '5647', 'sodell@lhup.edu', '', 5, 6, '', '$2a$10$leskfiqamdhjthrjwsksde2FrpQFZk/UsTcdo2J6k5RRPEgp7UAWC'),
(222, 'dpk318', 'Dallas', 'Kephart', '4627', 'dpk318@lhup.edu', '', 2, 4, '', '$2a$10$leskfiqamdhjthrjwsksdeHgdxeVLNY7GBL1/sn7Tv8elHRQMTsiy'),
(226, 'awp4399', 'Andrew', 'Petruzzi', '8048', 'awp4399@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksde610f/zMPWujGqByj9m.50tYl9dwz9sa'),
(227, 'knb3808', 'Kayla', 'Barnes', '9210', 'knb3808@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksde2bBAJ/aug/5DkeXpddL86ag2FAWtK.G'),
(228, 'kib796', 'Kayleigh', 'Beato', '2958', 'kib796@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksdeDSoNboPJd3VvuLkw5jVT0Kpu2qxmFE.'),
(229, 'smb523', 'Sam', 'Bohn', '4592', 'smb523@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksdeU0SmXycUnt71pLQd3QVnEsAekezBYdG'),
(230, 'cab3757', 'Caleb', 'Bookhammer', '7317', 'cab3757@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksdeaKfDKZVZg4pe9LQx7TRt2MoDphYY9yi'),
(231, 'jpb7874', 'Jordan', 'Bowes', '2888', 'jpb7874@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksdeS4Bgnw5TxbhZgQNQOCCDSlelvyWH7u2'),
(232, 'kmb695', 'Kelsey', 'Brown', '5270', 'kmb695@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksdefux4qtPYiPTEo7XHK22PdT6GDt8ZDGK'),
(233, 'scc397', 'Sarah', 'Camp', '7075', 'scc397@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksded/zIGLcmQGipBe2cMxeVA3JmGunmRzi'),
(234, 'mec5503', 'Maggie', 'Campbell', '3554', 'mec5503@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksde6Kw.72rfbYlJpu6yOidmBd0mMGLlWEK'),
(235, 'kjc1742', 'Kasey', 'Cole', '4222', 'kjc1742@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksde.o0cR7pmCEV54AOdwoV/5v5Utdzvyu2'),
(236, 'cfd4145', 'Colton', 'Dellinger', '5157', 'cfd4145@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksde8BCVZTkoJVUBJZz6E090ZC6LXAlrq.W'),
(237, 'tmd7504', 'Theresa', 'Dempsey', '0677', 'tmd7504@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksdete6X9Kx/So77o/b2QZWzb16NaqJAXSi'),
(239, 'ccd9401', 'Courtney', 'Devens', '9234', 'ccd9401@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksde76Db9hb47DVSbKUJCkN05kLybPf9RgS'),
(240, 'tle7040', 'Troyanna', 'Egan', '4766', 'tle7040@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksder7fwQjxi.Qt2ViWnvUD5twkBvPOXmPC'),
(241, 'lef1184', 'Lauren', 'Fenner', '2748', 'lef1184@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksde.g44k9J8Ib2xyjK5LwetdPvjl9tSRhi'),
(242, 'lef430', 'Louis', 'Fries', '4217', 'lef430@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksderfyusbqyE2.bi6o.gVwWGzh1hpJZxHC'),
(243, 'amf4585', 'Annamay', 'Fry', '8467', 'amf4585@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksde/ODG9Gb.ylP1jOvX44bwhqGFI7OX0D6'),
(244, 'gxg5575', 'Gabrielle', 'Gallo', '1272', 'gxg5575@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksdeCjRsujstz2SSIj42chTyyRU9zTFU.0.'),
(245, 'ceg2067', 'Claire', 'Garverick', '7968', 'ceg2067@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksdeC8bUbKn13AcXVTJvjPWUb/jBola8rcq'),
(246, 'rwg3505', 'Robert', 'George', '2779', 'rwg3505@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksdehtnNzpzul5U9qjV.iaGddx7vh9XBe8y'),
(247, 'adg5306', 'Austin', 'Gilpin', '4407', 'adg5306@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksdeELVfUmlcBM2Lia40RhRJBwrAfI3ILfW'),
(248, 'alh7473', 'Amanda', 'Hall', '2677', 'alh7473@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksdenFlkqFWWLImp6f2WRUyE1P63qVghs/i'),
(249, 'eah124', 'Elisa', 'Hamilton', '7395', 'eah124@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksde1A3bY6g5s4h9uWsBAZF3fti0vwJy2W6'),
(250, 'elh7374', 'Elizabeth', 'Haubrick', '7757', 'elh7374@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksde7yGJfqphvoY4PCpKFP5HnZPlURTt2p2'),
(251, 'amh838', 'Ashley', 'Herceg', '1304', 'amh838@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksde8eDWz3wBWOIqvDInpZPrD9vWs9X38/e'),
(252, 'jmh9171', 'Jacob', 'Heylek', '3996', 'jmh9171@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksdeujyyoeQ1IZ64KKLW8357PGOf1x0EJIK'),
(253, 'tlj7470', 'Tia', 'Judy', '7824', 'tlj7470@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksde76Db9hb47DVSbKUJCkN05kLybPf9RgS'),
(254, 'krk6692', 'Kelly', 'Kratzer', '3819', 'krk6692@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksdefsxXf0okqrWsS5Y61MAYaQoDqYas/eW'),
(255, 'hll9809', 'Hannah', 'Lorf', '1951', 'hll9809@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksdeK7NY2eoQg35BdrykCFj2Y2YsmRJzfFW'),
(256, 'ntm4380', 'Noah', 'McGovern', '2471', 'ntm4380@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksde3QpWjbXc5GipN/K1xsMpGZGpaepv1ey'),
(257, 'hmm8933', 'Heather', 'Mitchell', '0728', 'hmm8933@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksde76Db9hb47DVSbKUJCkN05kLybPf9RgS'),
(258, 'eam8738', 'Elizabeth', 'Morrow', '4776', 'eam8738@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksde76Db9hb47DVSbKUJCkN05kLybPf9RgS'),
(259, 'sjo4503', 'Samantha', 'Orren', '2810', 'sjo4503@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksde.vP/avBmMU1a8jEjIW22XMgY8QSS9YW'),
(260, 'aer9902', 'Abigail', 'Rea', '3248', 'aer9902@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksdeK90amvlVueLJXYL3KmrnD2p.5UdqdB6'),
(261, 'cls2647', 'Connor', 'Schall', '3102', 'cls2647@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksdePrgqAi6VnIzXpNtOMwgG/vQqK4gOCyy'),
(262, 'ers8544', 'Emily', 'Solak', '9986', 'ers8544@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksdekJmetkKgboIOAUSNuaBK4wHrJ5KpdDy'),
(263, 'ars686', 'Addison', 'Storr', '5608', 'ars686@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksde7v8zGyibMFWbaPzCLeCkfFa.3/27LUi'),
(264, 'jlw5386', 'Jasmine', 'Wei', '3201', 'jlw5386@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksdevu5hu.OcrBlygzcisAyjqF0/nCQtR0W'),
(265, 'elw8309', 'Emily', 'Wittig', '3160', 'elw8309@lhup.edu', '', 2, 1, '', '$2a$10$leskfiqamdhjthrjwsksdeodlH/Tfzmb3WWsDjMnpMvr9tgzDGQxC'),
(266, 'hnr3475', 'Howard (Nate)', 'Rainey', '9382', 'hnr3475@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksdepQqYL77emokc/JIDPYiyfthFSNc8Nfq'),
(267, 'sar2593', 'Sierra', 'Rider', '0183', 'sar2593@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksde0sM2ih9Lvz5xrlcNNOJLvmQBE.yD/Ga'),
(268, 'cxd140', 'Charlique', 'Dobney', '3848', 'cxd140@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksdegrKFnJTSFDSWSSaiY5CeFfE0X8tcqg6'),
(269, 'rlr4785', 'Rachel', 'Robenolt', '4324', 'rlr4785@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksde8chyduZXpuaeOcwIsqH7xn/i1BloDmy'),
(270, 'mmf362', 'Marissa', 'Faranda', '4945', 'mmf362@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksdeErFZ3iIj4AOZUpJLLRIW1NMaivpdmiS'),
(271, 'dar5265', 'David', 'Rodriguez', '5667', 'dar5265@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksdeWlIhMgDUkmOYY8xqQ8K6HDEKbEYkffi'),
(272, 'lmw984', 'Lindsey', 'Walsh', '3286', 'lmw984@lhup.edu', '', 2, 2, '', '$2a$10$leskfiqamdhjthrjwsksdejfWIkY6b9G8iu94JndUF3mF0Iyd1V8W'),
(273, 'kld8928', 'Kylee', 'Doyle', '7778', 'kld8928@lhup.edu', 'kld8928@lhup.edu', 2, 3, '', '$2a$10$leskfiqamdhjthrjwsksdeAyvX6wabWuq0lr0eLz.KkeRk0cnu2US');

-- --------------------------------------------------------

--
-- Structure for view `FA17_dates`
--
DROP TABLE IF EXISTS `FA17_dates`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ghpcoc5_butler`@`localhost` SQL SECURITY DEFINER VIEW `FA17_dates`  AS  select `FA17_pif`.`pif_start_date` AS `start`,`FA17_pif`.`pif_end_date` AS `end`,`FA17_pif`.`pif_title` AS `title`,1 AS `event_id`,`FA17_pif`.`pif_id` AS `group`,`FA17_pif`.`pif_bg_color` AS `back_color`,`FA17_pif`.`pif_ft_color` AS `font_color` from `FA17_pif` union all select `FA17_fdg_reports`.`pfdg_report_start_date` AS `start`,`FA17_fdg_reports`.`pfdg_report_end_date` AS `end`,`fdg`.`fdg_name` AS `title`,2 AS `event_id`,`fdg`.`fdg_id` AS `group`,`fdg`.`fdg_bg_color` AS `back_color`,`fdg`.`fdg_ft_color` AS `font_color` from (`FA17_fdg_reports` join `fdg` on(`FA17_fdg_reports`.`pfdg_id` = `fdg`.`fdg_id`)) union all select `FA17_activitygroupsession`.`agses_start_time` AS `start`,`FA17_activitygroupsession`.`agses_end_time` AS `end`,`FA17_activitygroup`.`ag_title` AS `title`,3 AS `event_id`,`FA17_activitygroupsession`.`ag_id` AS `group`,`FA17_activitygroup`.`ag_bg_color` AS `back_color`,`FA17_activitygroup`.`ag_ft_color` AS `font_color` from (`FA17_activitygroupsession` join `FA17_activitygroup` on(`FA17_activitygroupsession`.`ag_id` = `FA17_activitygroup`.`ag_id`)) union all select `FA17_events`.`event_start_date` AS `start`,`FA17_events`.`event_end_date` AS `end`,`FA17_events`.`event_title` AS `title`,4 AS `event_id`,`FA17_events`.`event_id` AS `group`,`FA17_events`.`event_bg_color` AS `back_color`,`FA17_events`.`event_ft_color` AS `font_color` from `FA17_events` union all select `FA17_academicevents`.`acad_start_date` AS `start`,`FA17_academicevents`.`acad_end_date` AS `end`,`FA17_academicevents`.`acad_title` AS `title`,5 AS `event_id`,`FA17_academicevents`.`acad_id` AS `group`,`FA17_academicevents`.`acad_bg_color` AS `back_color`,`FA17_academicevents`.`acad_ft_color` AS `font_color` from `FA17_academicevents` union all select `FA17_fdg_event`.`pfdg_start_date` AS `start`,`FA17_fdg_event`.`pfdg_end_date` AS `end`,`FA17_fdg_event`.`pfdg_event_name` AS `title`,6 AS `event_id`,`FA17_fdg_event`.`pfdg_event_id` AS `group`,`FA17_fdg_event`.`pfdg_event_bg_color` AS `back_color`,`FA17_fdg_event`.`pfdg_event_ft_color` AS `font_color` from `FA17_fdg_event` ;

-- --------------------------------------------------------

--
-- Structure for view `FA17_stats`
--
DROP TABLE IF EXISTS `FA17_stats`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ghpcoc5_butler`@`localhost` SQL SECURITY DEFINER VIEW `FA17_stats`  AS  select `a`.`usr_fname` AS `usr_fname`,`a`.`usr_lname` AS `usr_lname`,`a`.`usr_school_id` AS `usr_school_id`,`a`.`usr_id` AS `usr_id`,(select count(`FA17_pif_stats`.`pifstat_id`) from `FA17_pif_stats` where `FA17_pif_stats`.`pstu_id` = `a`.`usr_id`) + (select count(`FA17_academicevent_attendence`.`acad_att_id`) from `FA17_academicevent_attendence` where `FA17_academicevent_attendence`.`pstu_id` = `a`.`usr_id`) + ifnull((select sum(`FA17_exceptions`.`excptn_value`) from (`FA17_exceptions` join `FA17_exception_grants` on(`FA17_exceptions`.`excptn_id` = `FA17_exception_grants`.`excptn_id`)) where `FA17_exception_grants`.`pstu_id` = `a`.`usr_id` and `FA17_exceptions`.`excptn_type` = 2),0) - ifnull((select sum(`probation_grants`.`probation_grant_requirement`) from (`probation_grants` join `probations` on(`probation_grants`.`probation_id` = `probations`.`probation_id`)) where `probations`.`probation_type` = 1 and `probation_grants`.`usr_id` = `a`.`usr_id`),0) AS `acad_events`,(select count(`FA17_activitygroupstats`.`agstat_id`) from `FA17_activitygroupstats` where `FA17_activitygroupstats`.`pstu_id` = `a`.`usr_id`) + ifnull((select sum(`FA17_exceptions`.`excptn_value`) from (`FA17_exceptions` join `FA17_exception_grants` on(`FA17_exceptions`.`excptn_id` = `FA17_exception_grants`.`excptn_id`)) where `FA17_exception_grants`.`pstu_id` = `a`.`usr_id` and `FA17_exceptions`.`excptn_type` = 1),0) - ifnull((select sum(`probation_grants`.`probation_grant_requirement`) from (`probation_grants` join `probations` on(`probation_grants`.`probation_id` = `probations`.`probation_id`)) where `probations`.`probation_type` = 0 and `probation_grants`.`usr_id` = `a`.`usr_id`),0) AS `ags`,ifnull((select sum(`FA17_com_serv`.`com_hours`) from `FA17_com_serv` where `FA17_com_serv`.`pstu_id` = `a`.`usr_id` and `FA17_com_serv`.`com_verified` = 2),0) + ifnull((select sum(`FA17_exceptions`.`excptn_value`) from (`FA17_exceptions` join `FA17_exception_grants` on(`FA17_exceptions`.`excptn_id` = `FA17_exception_grants`.`excptn_id`)) where `FA17_exception_grants`.`pstu_id` = `a`.`usr_id` and `FA17_exceptions`.`excptn_type` = 3),0) - ifnull((select sum(`probation_grants`.`probation_grant_requirement`) from (`probation_grants` join `probations` on(`probation_grants`.`probation_id` = `probations`.`probation_id`)) where `probations`.`probation_type` = 2 and `probation_grants`.`usr_id` = `a`.`usr_id`),0) AS `com_hours`,(select count(`FA17_pif_stats`.`pifstat_id`) from `FA17_pif_stats` where `FA17_pif_stats`.`pstu_id` = `a`.`usr_id`) AS `pifs`,(select count(`FA17_fdg_attendence`.`pfdg_att_id`) from `FA17_fdg_attendence` where `FA17_fdg_attendence`.`pstu_id` = `a`.`usr_id`) + ifnull((select sum(`FA17_exceptions`.`excptn_value`) from (`FA17_exceptions` join `FA17_exception_grants` on(`FA17_exceptions`.`excptn_id` = `FA17_exception_grants`.`excptn_id`)) where `FA17_exception_grants`.`pstu_id` = `a`.`usr_id` and `FA17_exceptions`.`excptn_type` = 4),0) AS `fdg`,(select count(`capstone`.`capstone_id`) from `capstone` where `capstone`.`usr_id` = `a`.`usr_id` and `capstone`.`capstone_complete` = 1) AS `capstone` from `users` `a` ;

-- --------------------------------------------------------

--
-- Structure for view `fa2016_dates`
--
DROP TABLE IF EXISTS `fa2016_dates`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ghpcoc5_butler`@`localhost` SQL SECURITY DEFINER VIEW `fa2016_dates`  AS  select `fa2016_pif`.`pif_start_date` AS `start`,`fa2016_pif`.`pif_end_date` AS `end`,`fa2016_pif`.`pif_title` AS `title`,1 AS `event_id`,`fa2016_pif`.`pif_id` AS `group`,`fa2016_pif`.`pif_bg_color` AS `back_color`,`fa2016_pif`.`pif_ft_color` AS `font_color` from `fa2016_pif` union all select `fa2016_fdg_reports`.`pfdg_report_start_date` AS `start`,`fa2016_fdg_reports`.`pfdg_report_end_date` AS `end`,`fdg`.`fdg_name` AS `title`,2 AS `event_id`,`fdg`.`fdg_id` AS `group`,`fdg`.`fdg_bg_color` AS `back_color`,`fdg`.`fdg_ft_color` AS `font_color` from (`fa2016_fdg_reports` join `fdg` on(`fa2016_fdg_reports`.`pfdg_id` = `fdg`.`fdg_id`)) union all select `fa2016_activitygroupsession`.`agses_start_time` AS `start`,`fa2016_activitygroupsession`.`agses_end_time` AS `end`,`fa2016_activitygroup`.`ag_title` AS `title`,3 AS `event_id`,`fa2016_activitygroupsession`.`ag_id` AS `group`,`fa2016_activitygroup`.`ag_bg_color` AS `back_color`,`fa2016_activitygroup`.`ag_ft_color` AS `font_color` from (`fa2016_activitygroupsession` join `fa2016_activitygroup` on(`fa2016_activitygroupsession`.`ag_id` = `fa2016_activitygroup`.`ag_id`)) union all select `fa2016_events`.`event_start_date` AS `start`,`fa2016_events`.`event_end_date` AS `end`,`fa2016_events`.`event_title` AS `title`,4 AS `event_id`,`fa2016_events`.`event_id` AS `group`,`fa2016_events`.`event_bg_color` AS `back_color`,`fa2016_events`.`event_ft_color` AS `font_color` from `fa2016_events` union all select `fa2016_academicevents`.`acad_start_date` AS `start`,`fa2016_academicevents`.`acad_end_date` AS `end`,`fa2016_academicevents`.`acad_title` AS `title`,5 AS `event_id`,`fa2016_academicevents`.`acad_id` AS `group`,`fa2016_academicevents`.`acad_bg_color` AS `back_color`,`fa2016_academicevents`.`acad_ft_color` AS `font_color` from `fa2016_academicevents` union all select `fa2016_fdg_event`.`pfdg_start_date` AS `start`,`fa2016_fdg_event`.`pfdg_end_date` AS `end`,`fa2016_fdg_event`.`pfdg_event_name` AS `title`,6 AS `event_id`,`fa2016_fdg_event`.`pfdg_event_id` AS `group`,`fa2016_fdg_event`.`pfdg_event_bg_color` AS `back_color`,`fa2016_fdg_event`.`pfdg_event_ft_color` AS `font_color` from `fa2016_fdg_event` ;

-- --------------------------------------------------------

--
-- Structure for view `fa2016_stats`
--
DROP TABLE IF EXISTS `fa2016_stats`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ghpcoc5_butler`@`localhost` SQL SECURITY DEFINER VIEW `fa2016_stats`  AS  select `a`.`usr_fname` AS `usr_fname`,`a`.`usr_lname` AS `usr_lname`,`a`.`usr_school_id` AS `usr_school_id`,`a`.`usr_id` AS `usr_id`,(select count(`fa2016_pif_stats`.`pifstat_id`) from `fa2016_pif_stats` where `fa2016_pif_stats`.`pstu_id` = `a`.`usr_id`) + (select count(`fa2016_academicevent_attendence`.`acad_att_id`) from `fa2016_academicevent_attendence` where `fa2016_academicevent_attendence`.`pstu_id` = `a`.`usr_id`) + ifnull((select sum(`fa2016_exceptions`.`excptn_value`) from (`fa2016_exceptions` join `fa2016_exception_grants` on(`fa2016_exceptions`.`excptn_id` = `fa2016_exception_grants`.`excptn_id`)) where `fa2016_exception_grants`.`pstu_id` = `a`.`usr_id` and `fa2016_exceptions`.`excptn_type` = 2),0) - ifnull((select sum(`probation_grants`.`probation_grant_requirement`) from (`probation_grants` join `probations` on(`probation_grants`.`probation_id` = `probations`.`probation_id`)) where `probations`.`probation_type` = 1 and `probation_grants`.`usr_id` = `a`.`usr_id`),0) AS `acad_events`,(select count(`fa2016_activitygroupstats`.`agstat_id`) from `fa2016_activitygroupstats` where `fa2016_activitygroupstats`.`pstu_id` = `a`.`usr_id`) + ifnull((select sum(`fa2016_exceptions`.`excptn_value`) from (`fa2016_exceptions` join `fa2016_exception_grants` on(`fa2016_exceptions`.`excptn_id` = `fa2016_exception_grants`.`excptn_id`)) where `fa2016_exception_grants`.`pstu_id` = `a`.`usr_id` and `fa2016_exceptions`.`excptn_type` = 1),0) - ifnull((select sum(`probation_grants`.`probation_grant_requirement`) from (`probation_grants` join `probations` on(`probation_grants`.`probation_id` = `probations`.`probation_id`)) where `probations`.`probation_type` = 0 and `probation_grants`.`usr_id` = `a`.`usr_id`),0) AS `ags`,ifnull((select sum(`fa2016_com_serv`.`com_hours`) from `fa2016_com_serv` where `fa2016_com_serv`.`pstu_id` = `a`.`usr_id` and `fa2016_com_serv`.`com_verified` = 2),0) + ifnull((select sum(`fa2016_exceptions`.`excptn_value`) from (`fa2016_exceptions` join `fa2016_exception_grants` on(`fa2016_exceptions`.`excptn_id` = `fa2016_exception_grants`.`excptn_id`)) where `fa2016_exception_grants`.`pstu_id` = `a`.`usr_id` and `fa2016_exceptions`.`excptn_type` = 3),0) - ifnull((select sum(`probation_grants`.`probation_grant_requirement`) from (`probation_grants` join `probations` on(`probation_grants`.`probation_id` = `probations`.`probation_id`)) where `probations`.`probation_type` = 2 and `probation_grants`.`usr_id` = `a`.`usr_id`),0) AS `com_hours`,(select count(`fa2016_pif_stats`.`pifstat_id`) from `fa2016_pif_stats` where `fa2016_pif_stats`.`pstu_id` = `a`.`usr_id`) AS `pifs`,(select count(`fa2016_fdg_attendence`.`pfdg_att_id`) from `fa2016_fdg_attendence` where `fa2016_fdg_attendence`.`pstu_id` = `a`.`usr_id`) + ifnull((select sum(`fa2016_exceptions`.`excptn_value`) from (`fa2016_exceptions` join `fa2016_exception_grants` on(`fa2016_exceptions`.`excptn_id` = `fa2016_exception_grants`.`excptn_id`)) where `fa2016_exception_grants`.`pstu_id` = `a`.`usr_id` and `fa2016_exceptions`.`excptn_type` = 4),0) AS `fdg`,(select count(`capstone`.`capstone_id`) from `capstone` where `capstone`.`usr_id` = `a`.`usr_id` and `capstone`.`capstone_complete` = 1) AS `capstone` from `users` `a` ;

-- --------------------------------------------------------

--
-- Structure for view `SP17_dates`
--
DROP TABLE IF EXISTS `SP17_dates`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ghpcoc5_butler`@`localhost` SQL SECURITY DEFINER VIEW `SP17_dates`  AS  select `SP17_pif`.`pif_start_date` AS `start`,`SP17_pif`.`pif_end_date` AS `end`,`SP17_pif`.`pif_title` AS `title`,1 AS `event_id`,`SP17_pif`.`pif_id` AS `group`,`SP17_pif`.`pif_bg_color` AS `back_color`,`SP17_pif`.`pif_ft_color` AS `font_color` from `SP17_pif` union all select `SP17_fdg_reports`.`pfdg_report_start_date` AS `start`,`SP17_fdg_reports`.`pfdg_report_end_date` AS `end`,`fdg`.`fdg_name` AS `title`,2 AS `event_id`,`fdg`.`fdg_id` AS `group`,`fdg`.`fdg_bg_color` AS `back_color`,`fdg`.`fdg_ft_color` AS `font_color` from (`SP17_fdg_reports` join `fdg` on(`SP17_fdg_reports`.`pfdg_id` = `fdg`.`fdg_id`)) union all select `SP17_activitygroupsession`.`agses_start_time` AS `start`,`SP17_activitygroupsession`.`agses_end_time` AS `end`,`SP17_activitygroup`.`ag_title` AS `title`,3 AS `event_id`,`SP17_activitygroupsession`.`ag_id` AS `group`,`SP17_activitygroup`.`ag_bg_color` AS `back_color`,`SP17_activitygroup`.`ag_ft_color` AS `font_color` from (`SP17_activitygroupsession` join `SP17_activitygroup` on(`SP17_activitygroupsession`.`ag_id` = `SP17_activitygroup`.`ag_id`)) union all select `SP17_events`.`event_start_date` AS `start`,`SP17_events`.`event_end_date` AS `end`,`SP17_events`.`event_title` AS `title`,4 AS `event_id`,`SP17_events`.`event_id` AS `group`,`SP17_events`.`event_bg_color` AS `back_color`,`SP17_events`.`event_ft_color` AS `font_color` from `SP17_events` union all select `SP17_academicevents`.`acad_start_date` AS `start`,`SP17_academicevents`.`acad_end_date` AS `end`,`SP17_academicevents`.`acad_title` AS `title`,5 AS `event_id`,`SP17_academicevents`.`acad_id` AS `group`,`SP17_academicevents`.`acad_bg_color` AS `back_color`,`SP17_academicevents`.`acad_ft_color` AS `font_color` from `SP17_academicevents` union all select `SP17_fdg_event`.`pfdg_start_date` AS `start`,`SP17_fdg_event`.`pfdg_end_date` AS `end`,`SP17_fdg_event`.`pfdg_event_name` AS `title`,6 AS `event_id`,`SP17_fdg_event`.`pfdg_event_id` AS `group`,`SP17_fdg_event`.`pfdg_event_bg_color` AS `back_color`,`SP17_fdg_event`.`pfdg_event_ft_color` AS `font_color` from `SP17_fdg_event` ;

-- --------------------------------------------------------

--
-- Structure for view `SP17_stats`
--
DROP TABLE IF EXISTS `SP17_stats`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ghpcoc5_butler`@`localhost` SQL SECURITY DEFINER VIEW `SP17_stats`  AS  select `a`.`usr_fname` AS `usr_fname`,`a`.`usr_lname` AS `usr_lname`,`a`.`usr_school_id` AS `usr_school_id`,`a`.`usr_id` AS `usr_id`,(select count(`SP17_pif_stats`.`pifstat_id`) from `SP17_pif_stats` where `SP17_pif_stats`.`pstu_id` = `a`.`usr_id`) + (select count(`SP17_academicevent_attendence`.`acad_att_id`) from `SP17_academicevent_attendence` where `SP17_academicevent_attendence`.`pstu_id` = `a`.`usr_id`) + ifnull((select sum(`SP17_exceptions`.`excptn_value`) from (`SP17_exceptions` join `SP17_exception_grants` on(`SP17_exceptions`.`excptn_id` = `SP17_exception_grants`.`excptn_id`)) where `SP17_exception_grants`.`pstu_id` = `a`.`usr_id` and `SP17_exceptions`.`excptn_type` = 2),0) - ifnull((select sum(`probation_grants`.`probation_grant_requirement`) from (`probation_grants` join `probations` on(`probation_grants`.`probation_id` = `probations`.`probation_id`)) where `probations`.`probation_type` = 1 and `probation_grants`.`usr_id` = `a`.`usr_id`),0) AS `acad_events`,(select count(`SP17_activitygroupstats`.`agstat_id`) from `SP17_activitygroupstats` where `SP17_activitygroupstats`.`pstu_id` = `a`.`usr_id`) + ifnull((select sum(`SP17_exceptions`.`excptn_value`) from (`SP17_exceptions` join `SP17_exception_grants` on(`SP17_exceptions`.`excptn_id` = `SP17_exception_grants`.`excptn_id`)) where `SP17_exception_grants`.`pstu_id` = `a`.`usr_id` and `SP17_exceptions`.`excptn_type` = 1),0) - ifnull((select sum(`probation_grants`.`probation_grant_requirement`) from (`probation_grants` join `probations` on(`probation_grants`.`probation_id` = `probations`.`probation_id`)) where `probations`.`probation_type` = 0 and `probation_grants`.`usr_id` = `a`.`usr_id`),0) AS `ags`,ifnull((select sum(`SP17_com_serv`.`com_hours`) from `SP17_com_serv` where `SP17_com_serv`.`pstu_id` = `a`.`usr_id` and `SP17_com_serv`.`com_verified` = 2),0) + ifnull((select sum(`SP17_exceptions`.`excptn_value`) from (`SP17_exceptions` join `SP17_exception_grants` on(`SP17_exceptions`.`excptn_id` = `SP17_exception_grants`.`excptn_id`)) where `SP17_exception_grants`.`pstu_id` = `a`.`usr_id` and `SP17_exceptions`.`excptn_type` = 3),0) - ifnull((select sum(`probation_grants`.`probation_grant_requirement`) from (`probation_grants` join `probations` on(`probation_grants`.`probation_id` = `probations`.`probation_id`)) where `probations`.`probation_type` = 2 and `probation_grants`.`usr_id` = `a`.`usr_id`),0) AS `com_hours`,(select count(`SP17_pif_stats`.`pifstat_id`) from `SP17_pif_stats` where `SP17_pif_stats`.`pstu_id` = `a`.`usr_id`) AS `pifs`,(select count(`SP17_fdg_attendence`.`pfdg_att_id`) from `SP17_fdg_attendence` where `SP17_fdg_attendence`.`pstu_id` = `a`.`usr_id`) + ifnull((select sum(`SP17_exceptions`.`excptn_value`) from (`SP17_exceptions` join `SP17_exception_grants` on(`SP17_exceptions`.`excptn_id` = `SP17_exception_grants`.`excptn_id`)) where `SP17_exception_grants`.`pstu_id` = `a`.`usr_id` and `SP17_exceptions`.`excptn_type` = 4),0) AS `fdg`,(select count(`capstone`.`capstone_id`) from `capstone` where `capstone`.`usr_id` = `a`.`usr_id` and `capstone`.`capstone_complete` = 1) AS `capstone` from `users` `a` ;

-- --------------------------------------------------------

--
-- Structure for view `SP18_dates`
--
DROP TABLE IF EXISTS `SP18_dates`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ghpcoc5_butler`@`localhost` SQL SECURITY DEFINER VIEW `SP18_dates`  AS  select `SP18_pif`.`pif_start_date` AS `start`,`SP18_pif`.`pif_end_date` AS `end`,`SP18_pif`.`pif_title` AS `title`,1 AS `event_id`,`SP18_pif`.`pif_id` AS `group`,`SP18_pif`.`pif_bg_color` AS `back_color`,`SP18_pif`.`pif_ft_color` AS `font_color` from `SP18_pif` union all select `SP18_fdg_reports`.`pfdg_report_start_date` AS `start`,`SP18_fdg_reports`.`pfdg_report_end_date` AS `end`,`fdg`.`fdg_name` AS `title`,2 AS `event_id`,`fdg`.`fdg_id` AS `group`,`fdg`.`fdg_bg_color` AS `back_color`,`fdg`.`fdg_ft_color` AS `font_color` from (`SP18_fdg_reports` join `fdg` on(`SP18_fdg_reports`.`pfdg_id` = `fdg`.`fdg_id`)) union all select `SP18_activitygroupsession`.`agses_start_time` AS `start`,`SP18_activitygroupsession`.`agses_end_time` AS `end`,`SP18_activitygroup`.`ag_title` AS `title`,3 AS `event_id`,`SP18_activitygroupsession`.`ag_id` AS `group`,`SP18_activitygroup`.`ag_bg_color` AS `back_color`,`SP18_activitygroup`.`ag_ft_color` AS `font_color` from (`SP18_activitygroupsession` join `SP18_activitygroup` on(`SP18_activitygroupsession`.`ag_id` = `SP18_activitygroup`.`ag_id`)) union all select `SP18_events`.`event_start_date` AS `start`,`SP18_events`.`event_end_date` AS `end`,`SP18_events`.`event_title` AS `title`,4 AS `event_id`,`SP18_events`.`event_id` AS `group`,`SP18_events`.`event_bg_color` AS `back_color`,`SP18_events`.`event_ft_color` AS `font_color` from `SP18_events` union all select `SP18_academicevents`.`acad_start_date` AS `start`,`SP18_academicevents`.`acad_end_date` AS `end`,`SP18_academicevents`.`acad_title` AS `title`,5 AS `event_id`,`SP18_academicevents`.`acad_id` AS `group`,`SP18_academicevents`.`acad_bg_color` AS `back_color`,`SP18_academicevents`.`acad_ft_color` AS `font_color` from `SP18_academicevents` union all select `SP18_fdg_event`.`pfdg_start_date` AS `start`,`SP18_fdg_event`.`pfdg_end_date` AS `end`,`SP18_fdg_event`.`pfdg_event_name` AS `title`,6 AS `event_id`,`SP18_fdg_event`.`pfdg_event_id` AS `group`,`SP18_fdg_event`.`pfdg_event_bg_color` AS `back_color`,`SP18_fdg_event`.`pfdg_event_ft_color` AS `font_color` from `SP18_fdg_event` ;

-- --------------------------------------------------------

--
-- Structure for view `SP18_stats`
--
DROP TABLE IF EXISTS `SP18_stats`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ghpcoc5_butler`@`localhost` SQL SECURITY DEFINER VIEW `SP18_stats`  AS  select `a`.`usr_fname` AS `usr_fname`,`a`.`usr_lname` AS `usr_lname`,`a`.`usr_school_id` AS `usr_school_id`,`a`.`usr_id` AS `usr_id`,(select count(`SP18_pif_stats`.`pifstat_id`) from `SP18_pif_stats` where `SP18_pif_stats`.`pstu_id` = `a`.`usr_id`) + (select count(`SP18_academicevent_attendence`.`acad_att_id`) from `SP18_academicevent_attendence` where `SP18_academicevent_attendence`.`pstu_id` = `a`.`usr_id`) + ifnull((select sum(`SP18_exceptions`.`excptn_value`) from (`SP18_exceptions` join `SP18_exception_grants` on(`SP18_exceptions`.`excptn_id` = `SP18_exception_grants`.`excptn_id`)) where `SP18_exception_grants`.`pstu_id` = `a`.`usr_id` and `SP18_exceptions`.`excptn_type` = 2),0) - ifnull((select sum(`probation_grants`.`probation_grant_requirement`) from (`probation_grants` join `probations` on(`probation_grants`.`probation_id` = `probations`.`probation_id`)) where `probations`.`probation_type` = 1 and `probation_grants`.`usr_id` = `a`.`usr_id`),0) AS `acad_events`,(select count(`SP18_activitygroupstats`.`agstat_id`) from `SP18_activitygroupstats` where `SP18_activitygroupstats`.`pstu_id` = `a`.`usr_id`) + ifnull((select sum(`SP18_exceptions`.`excptn_value`) from (`SP18_exceptions` join `SP18_exception_grants` on(`SP18_exceptions`.`excptn_id` = `SP18_exception_grants`.`excptn_id`)) where `SP18_exception_grants`.`pstu_id` = `a`.`usr_id` and `SP18_exceptions`.`excptn_type` = 1),0) - ifnull((select sum(`probation_grants`.`probation_grant_requirement`) from (`probation_grants` join `probations` on(`probation_grants`.`probation_id` = `probations`.`probation_id`)) where `probations`.`probation_type` = 0 and `probation_grants`.`usr_id` = `a`.`usr_id`),0) AS `ags`,ifnull((select sum(`SP18_com_serv`.`com_hours`) from `SP18_com_serv` where `SP18_com_serv`.`pstu_id` = `a`.`usr_id` and `SP18_com_serv`.`com_verified` = 2),0) + ifnull((select sum(`SP18_exceptions`.`excptn_value`) from (`SP18_exceptions` join `SP18_exception_grants` on(`SP18_exceptions`.`excptn_id` = `SP18_exception_grants`.`excptn_id`)) where `SP18_exception_grants`.`pstu_id` = `a`.`usr_id` and `SP18_exceptions`.`excptn_type` = 3),0) - ifnull((select sum(`probation_grants`.`probation_grant_requirement`) from (`probation_grants` join `probations` on(`probation_grants`.`probation_id` = `probations`.`probation_id`)) where `probations`.`probation_type` = 2 and `probation_grants`.`usr_id` = `a`.`usr_id`),0) AS `com_hours`,(select count(`SP18_pif_stats`.`pifstat_id`) from `SP18_pif_stats` where `SP18_pif_stats`.`pstu_id` = `a`.`usr_id`) AS `pifs`,(select count(`SP18_fdg_attendence`.`pfdg_att_id`) from `SP18_fdg_attendence` where `SP18_fdg_attendence`.`pstu_id` = `a`.`usr_id`) + ifnull((select sum(`SP18_exceptions`.`excptn_value`) from (`SP18_exceptions` join `SP18_exception_grants` on(`SP18_exceptions`.`excptn_id` = `SP18_exception_grants`.`excptn_id`)) where `SP18_exception_grants`.`pstu_id` = `a`.`usr_id` and `SP18_exceptions`.`excptn_type` = 4),0) AS `fdg`,(select count(`capstone`.`capstone_id`) from `capstone` where `capstone`.`usr_id` = `a`.`usr_id` and `capstone`.`capstone_complete` = 1) AS `capstone` from `users` `a` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `capstone`
--
ALTER TABLE `capstone`
  ADD PRIMARY KEY (`capstone_id`),
  ADD KEY `usr_id` (`usr_id`);

--
-- Indexes for table `FA17_academicevents`
--
ALTER TABLE `FA17_academicevents`
  ADD PRIMARY KEY (`acad_id`);

--
-- Indexes for table `FA17_academicevent_attendence`
--
ALTER TABLE `FA17_academicevent_attendence`
  ADD PRIMARY KEY (`acad_att_id`),
  ADD UNIQUE KEY `one_acad_event` (`acad_id`,`pstu_id`),
  ADD KEY `pstu_id` (`pstu_id`);

--
-- Indexes for table `FA17_activitygroup`
--
ALTER TABLE `FA17_activitygroup`
  ADD PRIMARY KEY (`ag_id`),
  ADD UNIQUE KEY `ag_title` (`ag_title`);

--
-- Indexes for table `FA17_activitygroupleaders`
--
ALTER TABLE `FA17_activitygroupleaders`
  ADD PRIMARY KEY (`ag_leaders`),
  ADD UNIQUE KEY `one_leader` (`ag_id`,`pstu_id`),
  ADD KEY `pstu_id` (`pstu_id`);

--
-- Indexes for table `FA17_activitygroupsession`
--
ALTER TABLE `FA17_activitygroupsession`
  ADD PRIMARY KEY (`agses_id`),
  ADD KEY `ag_id` (`ag_id`);

--
-- Indexes for table `FA17_activitygroupstats`
--
ALTER TABLE `FA17_activitygroupstats`
  ADD PRIMARY KEY (`agstat_id`),
  ADD UNIQUE KEY `one_stat_per_agses` (`pstu_id`,`agses_id`),
  ADD KEY `agses_id` (`agses_id`);

--
-- Indexes for table `FA17_com_serv`
--
ALTER TABLE `FA17_com_serv`
  ADD PRIMARY KEY (`com_id`),
  ADD KEY `pstu_id` (`pstu_id`);

--
-- Indexes for table `FA17_currentstudents`
--
ALTER TABLE `FA17_currentstudents`
  ADD PRIMARY KEY (`pstu_id`);

--
-- Indexes for table `FA17_events`
--
ALTER TABLE `FA17_events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `FA17_exceptions`
--
ALTER TABLE `FA17_exceptions`
  ADD PRIMARY KEY (`excptn_id`),
  ADD UNIQUE KEY `excptn_name` (`excptn_name`);

--
-- Indexes for table `FA17_exception_grants`
--
ALTER TABLE `FA17_exception_grants`
  ADD PRIMARY KEY (`grant_id`),
  ADD UNIQUE KEY `only_grant_each_exception_once_per_student` (`excptn_id`,`pstu_id`),
  ADD KEY `pstu_id` (`pstu_id`);

--
-- Indexes for table `FA17_fdg`
--
ALTER TABLE `FA17_fdg`
  ADD PRIMARY KEY (`pfdg_id`);

--
-- Indexes for table `FA17_fdg_attendence`
--
ALTER TABLE `FA17_fdg_attendence`
  ADD PRIMARY KEY (`pfdg_att_id`),
  ADD UNIQUE KEY `one_att_per_fdg_member` (`pfdg_report_id`,`pstu_id`),
  ADD KEY `pstu_id` (`pstu_id`);

--
-- Indexes for table `FA17_fdg_event`
--
ALTER TABLE `FA17_fdg_event`
  ADD PRIMARY KEY (`pfdg_event_id`);

--
-- Indexes for table `FA17_fdg_event_attendence`
--
ALTER TABLE `FA17_fdg_event_attendence`
  ADD PRIMARY KEY (`pfdg_eve_att_id`),
  ADD UNIQUE KEY `one_event_att_per_stu` (`pfdg_event_id`,`pstu_id`),
  ADD KEY `pstu_id` (`pstu_id`);

--
-- Indexes for table `FA17_fdg_leaders`
--
ALTER TABLE `FA17_fdg_leaders`
  ADD PRIMARY KEY (`pfdg_leader_id`),
  ADD UNIQUE KEY `pstu_id` (`pstu_id`),
  ADD KEY `pfdg_id` (`pfdg_id`);

--
-- Indexes for table `FA17_fdg_members`
--
ALTER TABLE `FA17_fdg_members`
  ADD PRIMARY KEY (`pfdg_member_id`),
  ADD UNIQUE KEY `pstu_id` (`pstu_id`),
  ADD KEY `pfdg_id` (`pfdg_id`);

--
-- Indexes for table `FA17_fdg_points`
--
ALTER TABLE `FA17_fdg_points`
  ADD PRIMARY KEY (`pfdg_points_id`),
  ADD UNIQUE KEY `one_assign_per_event` (`pfdg_id`,`pfdg_event_id`),
  ADD KEY `pfdg_event_id` (`pfdg_event_id`);

--
-- Indexes for table `FA17_fdg_reports`
--
ALTER TABLE `FA17_fdg_reports`
  ADD PRIMARY KEY (`pfdg_report_id`),
  ADD KEY `pfdg_id` (`pfdg_id`);

--
-- Indexes for table `FA17_pif`
--
ALTER TABLE `FA17_pif`
  ADD PRIMARY KEY (`pif_id`);

--
-- Indexes for table `FA17_pif_stats`
--
ALTER TABLE `FA17_pif_stats`
  ADD PRIMARY KEY (`pifstat_id`),
  ADD UNIQUE KEY `one_pif_count_per_stu` (`pstu_id`,`pif_id`),
  ADD KEY `pif_id` (`pif_id`);

--
-- Indexes for table `fa2016_academicevents`
--
ALTER TABLE `fa2016_academicevents`
  ADD PRIMARY KEY (`acad_id`);

--
-- Indexes for table `fa2016_academicevent_attendence`
--
ALTER TABLE `fa2016_academicevent_attendence`
  ADD PRIMARY KEY (`acad_att_id`),
  ADD UNIQUE KEY `one_acad_event` (`acad_id`,`pstu_id`),
  ADD KEY `pstu_id` (`pstu_id`);

--
-- Indexes for table `fa2016_activitygroup`
--
ALTER TABLE `fa2016_activitygroup`
  ADD PRIMARY KEY (`ag_id`),
  ADD UNIQUE KEY `ag_title` (`ag_title`);

--
-- Indexes for table `fa2016_activitygroupleaders`
--
ALTER TABLE `fa2016_activitygroupleaders`
  ADD PRIMARY KEY (`ag_leaders`),
  ADD UNIQUE KEY `one_leader` (`ag_id`,`pstu_id`),
  ADD KEY `pstu_id` (`pstu_id`);

--
-- Indexes for table `fa2016_activitygroupsession`
--
ALTER TABLE `fa2016_activitygroupsession`
  ADD PRIMARY KEY (`agses_id`),
  ADD KEY `ag_id` (`ag_id`);

--
-- Indexes for table `fa2016_activitygroupstats`
--
ALTER TABLE `fa2016_activitygroupstats`
  ADD PRIMARY KEY (`agstat_id`),
  ADD UNIQUE KEY `one_stat_per_agses` (`pstu_id`,`agses_id`),
  ADD KEY `agses_id` (`agses_id`);

--
-- Indexes for table `fa2016_com_serv`
--
ALTER TABLE `fa2016_com_serv`
  ADD PRIMARY KEY (`com_id`),
  ADD KEY `pstu_id` (`pstu_id`);

--
-- Indexes for table `fa2016_currentstudents`
--
ALTER TABLE `fa2016_currentstudents`
  ADD PRIMARY KEY (`pstu_id`);

--
-- Indexes for table `fa2016_events`
--
ALTER TABLE `fa2016_events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `fa2016_exceptions`
--
ALTER TABLE `fa2016_exceptions`
  ADD PRIMARY KEY (`excptn_id`),
  ADD UNIQUE KEY `excptn_name` (`excptn_name`);

--
-- Indexes for table `fa2016_exception_grants`
--
ALTER TABLE `fa2016_exception_grants`
  ADD PRIMARY KEY (`grant_id`),
  ADD UNIQUE KEY `only_grant_each_exception_once_per_student` (`excptn_id`,`pstu_id`),
  ADD KEY `pstu_id` (`pstu_id`);

--
-- Indexes for table `fa2016_fdg`
--
ALTER TABLE `fa2016_fdg`
  ADD PRIMARY KEY (`pfdg_id`);

--
-- Indexes for table `fa2016_fdg_attendence`
--
ALTER TABLE `fa2016_fdg_attendence`
  ADD PRIMARY KEY (`pfdg_att_id`),
  ADD UNIQUE KEY `one_att_per_fdg_member` (`pfdg_report_id`,`pstu_id`),
  ADD KEY `pstu_id` (`pstu_id`);

--
-- Indexes for table `fa2016_fdg_event`
--
ALTER TABLE `fa2016_fdg_event`
  ADD PRIMARY KEY (`pfdg_event_id`);

--
-- Indexes for table `fa2016_fdg_event_attendence`
--
ALTER TABLE `fa2016_fdg_event_attendence`
  ADD PRIMARY KEY (`pfdg_eve_att_id`),
  ADD UNIQUE KEY `one_event_att_per_stu` (`pfdg_event_id`,`pstu_id`),
  ADD KEY `pstu_id` (`pstu_id`);

--
-- Indexes for table `fa2016_fdg_leaders`
--
ALTER TABLE `fa2016_fdg_leaders`
  ADD PRIMARY KEY (`pfdg_leader_id`),
  ADD UNIQUE KEY `pstu_id` (`pstu_id`),
  ADD KEY `pfdg_id` (`pfdg_id`);

--
-- Indexes for table `fa2016_fdg_members`
--
ALTER TABLE `fa2016_fdg_members`
  ADD PRIMARY KEY (`pfdg_member_id`),
  ADD UNIQUE KEY `pstu_id` (`pstu_id`),
  ADD KEY `pfdg_id` (`pfdg_id`);

--
-- Indexes for table `fa2016_fdg_points`
--
ALTER TABLE `fa2016_fdg_points`
  ADD PRIMARY KEY (`pfdg_points_id`),
  ADD UNIQUE KEY `one_assign_per_event` (`pfdg_id`,`pfdg_event_id`),
  ADD KEY `pfdg_event_id` (`pfdg_event_id`);

--
-- Indexes for table `fa2016_fdg_reports`
--
ALTER TABLE `fa2016_fdg_reports`
  ADD PRIMARY KEY (`pfdg_report_id`),
  ADD KEY `pfdg_id` (`pfdg_id`);

--
-- Indexes for table `fa2016_pif`
--
ALTER TABLE `fa2016_pif`
  ADD PRIMARY KEY (`pif_id`);

--
-- Indexes for table `fa2016_pif_stats`
--
ALTER TABLE `fa2016_pif_stats`
  ADD PRIMARY KEY (`pifstat_id`),
  ADD UNIQUE KEY `one_pif_count_per_stu` (`pstu_id`,`pif_id`),
  ADD KEY `pif_id` (`pif_id`);

--
-- Indexes for table `fdg`
--
ALTER TABLE `fdg`
  ADD PRIMARY KEY (`fdg_id`),
  ADD UNIQUE KEY `fdg_name` (`fdg_name`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`group_id`),
  ADD UNIQUE KEY `group_name` (`group_name`),
  ADD KEY `group_admin` (`group_admin`);

--
-- Indexes for table `image_slide`
--
ALTER TABLE `image_slide`
  ADD PRIMARY KEY (`slide_id`),
  ADD UNIQUE KEY `slide_imagename` (`slide_imagename`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`perm_id`),
  ADD UNIQUE KEY `usr_id` (`usr_id`);

--
-- Indexes for table `probations`
--
ALTER TABLE `probations`
  ADD PRIMARY KEY (`probation_id`),
  ADD UNIQUE KEY `probation_name` (`probation_name`);

--
-- Indexes for table `probation_grants`
--
ALTER TABLE `probation_grants`
  ADD PRIMARY KEY (`probation_grant_id`),
  ADD UNIQUE KEY `one_probation` (`probation_id`,`usr_id`),
  ADD KEY `usr_id` (`usr_id`);

--
-- Indexes for table `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`sem_id`),
  ADD UNIQUE KEY `sem_prefix` (`sem_prefix`),
  ADD UNIQUE KEY `sem_name` (`sem_name`);

--
-- Indexes for table `SP17_academicevents`
--
ALTER TABLE `SP17_academicevents`
  ADD PRIMARY KEY (`acad_id`);

--
-- Indexes for table `SP17_academicevent_attendence`
--
ALTER TABLE `SP17_academicevent_attendence`
  ADD PRIMARY KEY (`acad_att_id`),
  ADD UNIQUE KEY `one_acad_event` (`acad_id`,`pstu_id`),
  ADD KEY `pstu_id` (`pstu_id`);

--
-- Indexes for table `SP17_activitygroup`
--
ALTER TABLE `SP17_activitygroup`
  ADD PRIMARY KEY (`ag_id`),
  ADD UNIQUE KEY `ag_title` (`ag_title`);

--
-- Indexes for table `SP17_activitygroupleaders`
--
ALTER TABLE `SP17_activitygroupleaders`
  ADD PRIMARY KEY (`ag_leaders`),
  ADD UNIQUE KEY `one_leader` (`ag_id`,`pstu_id`),
  ADD KEY `pstu_id` (`pstu_id`);

--
-- Indexes for table `SP17_activitygroupsession`
--
ALTER TABLE `SP17_activitygroupsession`
  ADD PRIMARY KEY (`agses_id`),
  ADD KEY `ag_id` (`ag_id`);

--
-- Indexes for table `SP17_activitygroupstats`
--
ALTER TABLE `SP17_activitygroupstats`
  ADD PRIMARY KEY (`agstat_id`),
  ADD UNIQUE KEY `one_stat_per_agses` (`pstu_id`,`agses_id`),
  ADD KEY `agses_id` (`agses_id`);

--
-- Indexes for table `SP17_com_serv`
--
ALTER TABLE `SP17_com_serv`
  ADD PRIMARY KEY (`com_id`),
  ADD KEY `pstu_id` (`pstu_id`);

--
-- Indexes for table `SP17_currentstudents`
--
ALTER TABLE `SP17_currentstudents`
  ADD PRIMARY KEY (`pstu_id`);

--
-- Indexes for table `SP17_events`
--
ALTER TABLE `SP17_events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `SP17_exceptions`
--
ALTER TABLE `SP17_exceptions`
  ADD PRIMARY KEY (`excptn_id`),
  ADD UNIQUE KEY `excptn_name` (`excptn_name`);

--
-- Indexes for table `SP17_exception_grants`
--
ALTER TABLE `SP17_exception_grants`
  ADD PRIMARY KEY (`grant_id`),
  ADD UNIQUE KEY `only_grant_each_exception_once_per_student` (`excptn_id`,`pstu_id`),
  ADD KEY `pstu_id` (`pstu_id`);

--
-- Indexes for table `SP17_fdg`
--
ALTER TABLE `SP17_fdg`
  ADD PRIMARY KEY (`pfdg_id`);

--
-- Indexes for table `SP17_fdg_attendence`
--
ALTER TABLE `SP17_fdg_attendence`
  ADD PRIMARY KEY (`pfdg_att_id`),
  ADD UNIQUE KEY `one_att_per_fdg_member` (`pfdg_report_id`,`pstu_id`),
  ADD KEY `pstu_id` (`pstu_id`);

--
-- Indexes for table `SP17_fdg_event`
--
ALTER TABLE `SP17_fdg_event`
  ADD PRIMARY KEY (`pfdg_event_id`);

--
-- Indexes for table `SP17_fdg_event_attendence`
--
ALTER TABLE `SP17_fdg_event_attendence`
  ADD PRIMARY KEY (`pfdg_eve_att_id`),
  ADD UNIQUE KEY `one_event_att_per_stu` (`pfdg_event_id`,`pstu_id`),
  ADD KEY `pstu_id` (`pstu_id`);

--
-- Indexes for table `SP17_fdg_leaders`
--
ALTER TABLE `SP17_fdg_leaders`
  ADD PRIMARY KEY (`pfdg_leader_id`),
  ADD UNIQUE KEY `pstu_id` (`pstu_id`),
  ADD KEY `pfdg_id` (`pfdg_id`);

--
-- Indexes for table `SP17_fdg_members`
--
ALTER TABLE `SP17_fdg_members`
  ADD PRIMARY KEY (`pfdg_member_id`),
  ADD UNIQUE KEY `pstu_id` (`pstu_id`),
  ADD KEY `pfdg_id` (`pfdg_id`);

--
-- Indexes for table `SP17_fdg_points`
--
ALTER TABLE `SP17_fdg_points`
  ADD PRIMARY KEY (`pfdg_points_id`),
  ADD UNIQUE KEY `one_assign_per_event` (`pfdg_id`,`pfdg_event_id`),
  ADD KEY `pfdg_event_id` (`pfdg_event_id`);

--
-- Indexes for table `SP17_fdg_reports`
--
ALTER TABLE `SP17_fdg_reports`
  ADD PRIMARY KEY (`pfdg_report_id`),
  ADD KEY `pfdg_id` (`pfdg_id`);

--
-- Indexes for table `SP17_pif`
--
ALTER TABLE `SP17_pif`
  ADD PRIMARY KEY (`pif_id`);

--
-- Indexes for table `SP17_pif_stats`
--
ALTER TABLE `SP17_pif_stats`
  ADD PRIMARY KEY (`pifstat_id`),
  ADD UNIQUE KEY `one_pif_count_per_stu` (`pstu_id`,`pif_id`),
  ADD KEY `pif_id` (`pif_id`);

--
-- Indexes for table `SP18_academicevents`
--
ALTER TABLE `SP18_academicevents`
  ADD PRIMARY KEY (`acad_id`);

--
-- Indexes for table `SP18_academicevent_attendence`
--
ALTER TABLE `SP18_academicevent_attendence`
  ADD PRIMARY KEY (`acad_att_id`),
  ADD UNIQUE KEY `one_acad_event` (`acad_id`,`pstu_id`),
  ADD KEY `pstu_id` (`pstu_id`);

--
-- Indexes for table `SP18_activitygroup`
--
ALTER TABLE `SP18_activitygroup`
  ADD PRIMARY KEY (`ag_id`),
  ADD UNIQUE KEY `ag_title` (`ag_title`);

--
-- Indexes for table `SP18_activitygroupleaders`
--
ALTER TABLE `SP18_activitygroupleaders`
  ADD PRIMARY KEY (`ag_leaders`),
  ADD UNIQUE KEY `one_leader` (`ag_id`,`pstu_id`),
  ADD KEY `pstu_id` (`pstu_id`);

--
-- Indexes for table `SP18_activitygroupsession`
--
ALTER TABLE `SP18_activitygroupsession`
  ADD PRIMARY KEY (`agses_id`),
  ADD KEY `ag_id` (`ag_id`);

--
-- Indexes for table `SP18_activitygroupstats`
--
ALTER TABLE `SP18_activitygroupstats`
  ADD PRIMARY KEY (`agstat_id`),
  ADD UNIQUE KEY `one_stat_per_agses` (`pstu_id`,`agses_id`),
  ADD KEY `agses_id` (`agses_id`);

--
-- Indexes for table `SP18_com_serv`
--
ALTER TABLE `SP18_com_serv`
  ADD PRIMARY KEY (`com_id`),
  ADD KEY `pstu_id` (`pstu_id`);

--
-- Indexes for table `SP18_currentstudents`
--
ALTER TABLE `SP18_currentstudents`
  ADD PRIMARY KEY (`pstu_id`);

--
-- Indexes for table `SP18_events`
--
ALTER TABLE `SP18_events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `SP18_exceptions`
--
ALTER TABLE `SP18_exceptions`
  ADD PRIMARY KEY (`excptn_id`),
  ADD UNIQUE KEY `excptn_name` (`excptn_name`);

--
-- Indexes for table `SP18_exception_grants`
--
ALTER TABLE `SP18_exception_grants`
  ADD PRIMARY KEY (`grant_id`),
  ADD UNIQUE KEY `only_grant_each_exception_once_per_student` (`excptn_id`,`pstu_id`),
  ADD KEY `pstu_id` (`pstu_id`);

--
-- Indexes for table `SP18_fdg`
--
ALTER TABLE `SP18_fdg`
  ADD PRIMARY KEY (`pfdg_id`);

--
-- Indexes for table `SP18_fdg_attendence`
--
ALTER TABLE `SP18_fdg_attendence`
  ADD PRIMARY KEY (`pfdg_att_id`),
  ADD UNIQUE KEY `one_att_per_fdg_member` (`pfdg_report_id`,`pstu_id`),
  ADD KEY `pstu_id` (`pstu_id`);

--
-- Indexes for table `SP18_fdg_event`
--
ALTER TABLE `SP18_fdg_event`
  ADD PRIMARY KEY (`pfdg_event_id`);

--
-- Indexes for table `SP18_fdg_event_attendence`
--
ALTER TABLE `SP18_fdg_event_attendence`
  ADD PRIMARY KEY (`pfdg_eve_att_id`),
  ADD UNIQUE KEY `one_event_att_per_stu` (`pfdg_event_id`,`pstu_id`),
  ADD KEY `pstu_id` (`pstu_id`);

--
-- Indexes for table `SP18_fdg_leaders`
--
ALTER TABLE `SP18_fdg_leaders`
  ADD PRIMARY KEY (`pfdg_leader_id`),
  ADD UNIQUE KEY `pstu_id` (`pstu_id`),
  ADD KEY `pfdg_id` (`pfdg_id`);

--
-- Indexes for table `SP18_fdg_members`
--
ALTER TABLE `SP18_fdg_members`
  ADD PRIMARY KEY (`pfdg_member_id`),
  ADD UNIQUE KEY `pstu_id` (`pstu_id`),
  ADD KEY `pfdg_id` (`pfdg_id`);

--
-- Indexes for table `SP18_fdg_points`
--
ALTER TABLE `SP18_fdg_points`
  ADD PRIMARY KEY (`pfdg_points_id`),
  ADD UNIQUE KEY `one_assign_per_event` (`pfdg_id`,`pfdg_event_id`),
  ADD KEY `pfdg_event_id` (`pfdg_event_id`);

--
-- Indexes for table `SP18_fdg_reports`
--
ALTER TABLE `SP18_fdg_reports`
  ADD PRIMARY KEY (`pfdg_report_id`),
  ADD KEY `pfdg_id` (`pfdg_id`);

--
-- Indexes for table `SP18_pif`
--
ALTER TABLE `SP18_pif`
  ADD PRIMARY KEY (`pif_id`);

--
-- Indexes for table `SP18_pif_stats`
--
ALTER TABLE `SP18_pif_stats`
  ADD PRIMARY KEY (`pifstat_id`),
  ADD UNIQUE KEY `one_pif_count_per_stu` (`pstu_id`,`pif_id`),
  ADD KEY `pif_id` (`pif_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`usr_id`),
  ADD UNIQUE KEY `usr_username` (`usr_username`),
  ADD UNIQUE KEY `usr_school_email` (`usr_school_email`),
  ADD UNIQUE KEY `usr_school_id` (`usr_school_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `capstone`
--
ALTER TABLE `capstone`
  MODIFY `capstone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `FA17_academicevents`
--
ALTER TABLE `FA17_academicevents`
  MODIFY `acad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `FA17_academicevent_attendence`
--
ALTER TABLE `FA17_academicevent_attendence`
  MODIFY `acad_att_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=270;
--
-- AUTO_INCREMENT for table `FA17_activitygroup`
--
ALTER TABLE `FA17_activitygroup`
  MODIFY `ag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `FA17_activitygroupleaders`
--
ALTER TABLE `FA17_activitygroupleaders`
  MODIFY `ag_leaders` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `FA17_activitygroupsession`
--
ALTER TABLE `FA17_activitygroupsession`
  MODIFY `agses_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;
--
-- AUTO_INCREMENT for table `FA17_activitygroupstats`
--
ALTER TABLE `FA17_activitygroupstats`
  MODIFY `agstat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1174;
--
-- AUTO_INCREMENT for table `FA17_com_serv`
--
ALTER TABLE `FA17_com_serv`
  MODIFY `com_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=278;
--
-- AUTO_INCREMENT for table `FA17_events`
--
ALTER TABLE `FA17_events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `FA17_exceptions`
--
ALTER TABLE `FA17_exceptions`
  MODIFY `excptn_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `FA17_exception_grants`
--
ALTER TABLE `FA17_exception_grants`
  MODIFY `grant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;
--
-- AUTO_INCREMENT for table `FA17_fdg_attendence`
--
ALTER TABLE `FA17_fdg_attendence`
  MODIFY `pfdg_att_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=934;
--
-- AUTO_INCREMENT for table `FA17_fdg_event`
--
ALTER TABLE `FA17_fdg_event`
  MODIFY `pfdg_event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `FA17_fdg_event_attendence`
--
ALTER TABLE `FA17_fdg_event_attendence`
  MODIFY `pfdg_eve_att_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `FA17_fdg_leaders`
--
ALTER TABLE `FA17_fdg_leaders`
  MODIFY `pfdg_leader_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `FA17_fdg_members`
--
ALTER TABLE `FA17_fdg_members`
  MODIFY `pfdg_member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `FA17_fdg_points`
--
ALTER TABLE `FA17_fdg_points`
  MODIFY `pfdg_points_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `FA17_fdg_reports`
--
ALTER TABLE `FA17_fdg_reports`
  MODIFY `pfdg_report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;
--
-- AUTO_INCREMENT for table `FA17_pif`
--
ALTER TABLE `FA17_pif`
  MODIFY `pif_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `FA17_pif_stats`
--
ALTER TABLE `FA17_pif_stats`
  MODIFY `pifstat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;
--
-- AUTO_INCREMENT for table `fa2016_academicevents`
--
ALTER TABLE `fa2016_academicevents`
  MODIFY `acad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `fa2016_academicevent_attendence`
--
ALTER TABLE `fa2016_academicevent_attendence`
  MODIFY `acad_att_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=293;
--
-- AUTO_INCREMENT for table `fa2016_activitygroup`
--
ALTER TABLE `fa2016_activitygroup`
  MODIFY `ag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `fa2016_activitygroupleaders`
--
ALTER TABLE `fa2016_activitygroupleaders`
  MODIFY `ag_leaders` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `fa2016_activitygroupsession`
--
ALTER TABLE `fa2016_activitygroupsession`
  MODIFY `agses_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=257;
--
-- AUTO_INCREMENT for table `fa2016_activitygroupstats`
--
ALTER TABLE `fa2016_activitygroupstats`
  MODIFY `agstat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1160;
--
-- AUTO_INCREMENT for table `fa2016_com_serv`
--
ALTER TABLE `fa2016_com_serv`
  MODIFY `com_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=320;
--
-- AUTO_INCREMENT for table `fa2016_events`
--
ALTER TABLE `fa2016_events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `fa2016_exceptions`
--
ALTER TABLE `fa2016_exceptions`
  MODIFY `excptn_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `fa2016_exception_grants`
--
ALTER TABLE `fa2016_exception_grants`
  MODIFY `grant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;
--
-- AUTO_INCREMENT for table `fa2016_fdg_attendence`
--
ALTER TABLE `fa2016_fdg_attendence`
  MODIFY `pfdg_att_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1330;
--
-- AUTO_INCREMENT for table `fa2016_fdg_event`
--
ALTER TABLE `fa2016_fdg_event`
  MODIFY `pfdg_event_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fa2016_fdg_event_attendence`
--
ALTER TABLE `fa2016_fdg_event_attendence`
  MODIFY `pfdg_eve_att_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fa2016_fdg_leaders`
--
ALTER TABLE `fa2016_fdg_leaders`
  MODIFY `pfdg_leader_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `fa2016_fdg_members`
--
ALTER TABLE `fa2016_fdg_members`
  MODIFY `pfdg_member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
--
-- AUTO_INCREMENT for table `fa2016_fdg_points`
--
ALTER TABLE `fa2016_fdg_points`
  MODIFY `pfdg_points_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fa2016_fdg_reports`
--
ALTER TABLE `fa2016_fdg_reports`
  MODIFY `pfdg_report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=287;
--
-- AUTO_INCREMENT for table `fa2016_pif`
--
ALTER TABLE `fa2016_pif`
  MODIFY `pif_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `fa2016_pif_stats`
--
ALTER TABLE `fa2016_pif_stats`
  MODIFY `pifstat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;
--
-- AUTO_INCREMENT for table `fdg`
--
ALTER TABLE `fdg`
  MODIFY `fdg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `image_slide`
--
ALTER TABLE `image_slide`
  MODIFY `slide_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `perm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=272;
--
-- AUTO_INCREMENT for table `probations`
--
ALTER TABLE `probations`
  MODIFY `probation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `probation_grants`
--
ALTER TABLE `probation_grants`
  MODIFY `probation_grant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `semesters`
--
ALTER TABLE `semesters`
  MODIFY `sem_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `SP17_academicevents`
--
ALTER TABLE `SP17_academicevents`
  MODIFY `acad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `SP17_academicevent_attendence`
--
ALTER TABLE `SP17_academicevent_attendence`
  MODIFY `acad_att_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=319;
--
-- AUTO_INCREMENT for table `SP17_activitygroup`
--
ALTER TABLE `SP17_activitygroup`
  MODIFY `ag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `SP17_activitygroupleaders`
--
ALTER TABLE `SP17_activitygroupleaders`
  MODIFY `ag_leaders` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `SP17_activitygroupsession`
--
ALTER TABLE `SP17_activitygroupsession`
  MODIFY `agses_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;
--
-- AUTO_INCREMENT for table `SP17_activitygroupstats`
--
ALTER TABLE `SP17_activitygroupstats`
  MODIFY `agstat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1076;
--
-- AUTO_INCREMENT for table `SP17_com_serv`
--
ALTER TABLE `SP17_com_serv`
  MODIFY `com_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=619;
--
-- AUTO_INCREMENT for table `SP17_events`
--
ALTER TABLE `SP17_events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `SP17_exceptions`
--
ALTER TABLE `SP17_exceptions`
  MODIFY `excptn_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `SP17_exception_grants`
--
ALTER TABLE `SP17_exception_grants`
  MODIFY `grant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;
--
-- AUTO_INCREMENT for table `SP17_fdg_attendence`
--
ALTER TABLE `SP17_fdg_attendence`
  MODIFY `pfdg_att_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=589;
--
-- AUTO_INCREMENT for table `SP17_fdg_event`
--
ALTER TABLE `SP17_fdg_event`
  MODIFY `pfdg_event_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `SP17_fdg_event_attendence`
--
ALTER TABLE `SP17_fdg_event_attendence`
  MODIFY `pfdg_eve_att_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `SP17_fdg_leaders`
--
ALTER TABLE `SP17_fdg_leaders`
  MODIFY `pfdg_leader_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `SP17_fdg_members`
--
ALTER TABLE `SP17_fdg_members`
  MODIFY `pfdg_member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT for table `SP17_fdg_points`
--
ALTER TABLE `SP17_fdg_points`
  MODIFY `pfdg_points_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `SP17_fdg_reports`
--
ALTER TABLE `SP17_fdg_reports`
  MODIFY `pfdg_report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;
--
-- AUTO_INCREMENT for table `SP17_pif`
--
ALTER TABLE `SP17_pif`
  MODIFY `pif_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `SP17_pif_stats`
--
ALTER TABLE `SP17_pif_stats`
  MODIFY `pifstat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;
--
-- AUTO_INCREMENT for table `SP18_academicevents`
--
ALTER TABLE `SP18_academicevents`
  MODIFY `acad_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `SP18_academicevent_attendence`
--
ALTER TABLE `SP18_academicevent_attendence`
  MODIFY `acad_att_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `SP18_activitygroup`
--
ALTER TABLE `SP18_activitygroup`
  MODIFY `ag_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `SP18_activitygroupleaders`
--
ALTER TABLE `SP18_activitygroupleaders`
  MODIFY `ag_leaders` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `SP18_activitygroupsession`
--
ALTER TABLE `SP18_activitygroupsession`
  MODIFY `agses_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `SP18_activitygroupstats`
--
ALTER TABLE `SP18_activitygroupstats`
  MODIFY `agstat_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `SP18_com_serv`
--
ALTER TABLE `SP18_com_serv`
  MODIFY `com_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;
--
-- AUTO_INCREMENT for table `SP18_events`
--
ALTER TABLE `SP18_events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `SP18_exceptions`
--
ALTER TABLE `SP18_exceptions`
  MODIFY `excptn_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `SP18_exception_grants`
--
ALTER TABLE `SP18_exception_grants`
  MODIFY `grant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `SP18_fdg_attendence`
--
ALTER TABLE `SP18_fdg_attendence`
  MODIFY `pfdg_att_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;
--
-- AUTO_INCREMENT for table `SP18_fdg_event`
--
ALTER TABLE `SP18_fdg_event`
  MODIFY `pfdg_event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `SP18_fdg_event_attendence`
--
ALTER TABLE `SP18_fdg_event_attendence`
  MODIFY `pfdg_eve_att_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `SP18_fdg_leaders`
--
ALTER TABLE `SP18_fdg_leaders`
  MODIFY `pfdg_leader_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `SP18_fdg_members`
--
ALTER TABLE `SP18_fdg_members`
  MODIFY `pfdg_member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `SP18_fdg_points`
--
ALTER TABLE `SP18_fdg_points`
  MODIFY `pfdg_points_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `SP18_fdg_reports`
--
ALTER TABLE `SP18_fdg_reports`
  MODIFY `pfdg_report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `SP18_pif`
--
ALTER TABLE `SP18_pif`
  MODIFY `pif_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `SP18_pif_stats`
--
ALTER TABLE `SP18_pif_stats`
  MODIFY `pifstat_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `usr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=274;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `FA17_academicevent_attendence`
--
ALTER TABLE `FA17_academicevent_attendence`
  ADD CONSTRAINT `FA17_academicevent_attendence_ibfk_1` FOREIGN KEY (`pstu_id`) REFERENCES `FA17_currentstudents` (`pstu_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FA17_academicevent_attendence_ibfk_2` FOREIGN KEY (`acad_id`) REFERENCES `FA17_academicevents` (`acad_id`) ON DELETE CASCADE;

--
-- Constraints for table `FA17_activitygroupleaders`
--
ALTER TABLE `FA17_activitygroupleaders`
  ADD CONSTRAINT `FA17_activitygroupleaders_ibfk_1` FOREIGN KEY (`ag_id`) REFERENCES `FA17_activitygroup` (`ag_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FA17_activitygroupleaders_ibfk_2` FOREIGN KEY (`pstu_id`) REFERENCES `FA17_currentstudents` (`pstu_id`) ON DELETE CASCADE;

--
-- Constraints for table `FA17_activitygroupsession`
--
ALTER TABLE `FA17_activitygroupsession`
  ADD CONSTRAINT `FA17_activitygroupsession_ibfk_1` FOREIGN KEY (`ag_id`) REFERENCES `FA17_activitygroup` (`ag_id`) ON DELETE CASCADE;

--
-- Constraints for table `FA17_activitygroupstats`
--
ALTER TABLE `FA17_activitygroupstats`
  ADD CONSTRAINT `FA17_activitygroupstats_ibfk_1` FOREIGN KEY (`pstu_id`) REFERENCES `FA17_currentstudents` (`pstu_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FA17_activitygroupstats_ibfk_2` FOREIGN KEY (`agses_id`) REFERENCES `FA17_activitygroupsession` (`agses_id`) ON DELETE CASCADE;

--
-- Constraints for table `FA17_com_serv`
--
ALTER TABLE `FA17_com_serv`
  ADD CONSTRAINT `FA17_com_serv_ibfk_1` FOREIGN KEY (`pstu_id`) REFERENCES `FA17_currentstudents` (`pstu_id`) ON DELETE CASCADE;

--
-- Constraints for table `FA17_currentstudents`
--
ALTER TABLE `FA17_currentstudents`
  ADD CONSTRAINT `FA17_currentstudents_ibfk_1` FOREIGN KEY (`pstu_id`) REFERENCES `users` (`usr_id`) ON DELETE CASCADE;

--
-- Constraints for table `FA17_exception_grants`
--
ALTER TABLE `FA17_exception_grants`
  ADD CONSTRAINT `FA17_exception_grants_ibfk_1` FOREIGN KEY (`pstu_id`) REFERENCES `FA17_currentstudents` (`pstu_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FA17_exception_grants_ibfk_2` FOREIGN KEY (`excptn_id`) REFERENCES `FA17_exceptions` (`excptn_id`) ON DELETE CASCADE;

--
-- Constraints for table `FA17_fdg`
--
ALTER TABLE `FA17_fdg`
  ADD CONSTRAINT `FA17_fdg_ibfk_1` FOREIGN KEY (`pfdg_id`) REFERENCES `fdg` (`fdg_id`) ON DELETE CASCADE;

--
-- Constraints for table `FA17_fdg_attendence`
--
ALTER TABLE `FA17_fdg_attendence`
  ADD CONSTRAINT `FA17_fdg_attendence_ibfk_1` FOREIGN KEY (`pfdg_report_id`) REFERENCES `FA17_fdg_reports` (`pfdg_report_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FA17_fdg_attendence_ibfk_2` FOREIGN KEY (`pstu_id`) REFERENCES `FA17_currentstudents` (`pstu_id`) ON DELETE CASCADE;

--
-- Constraints for table `FA17_fdg_event_attendence`
--
ALTER TABLE `FA17_fdg_event_attendence`
  ADD CONSTRAINT `FA17_fdg_event_attendence_ibfk_1` FOREIGN KEY (`pfdg_event_id`) REFERENCES `FA17_fdg_event` (`pfdg_event_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FA17_fdg_event_attendence_ibfk_2` FOREIGN KEY (`pstu_id`) REFERENCES `FA17_currentstudents` (`pstu_id`) ON DELETE CASCADE;

--
-- Constraints for table `FA17_fdg_leaders`
--
ALTER TABLE `FA17_fdg_leaders`
  ADD CONSTRAINT `FA17_fdg_leaders_ibfk_1` FOREIGN KEY (`pfdg_id`) REFERENCES `FA17_fdg` (`pfdg_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FA17_fdg_leaders_ibfk_2` FOREIGN KEY (`pstu_id`) REFERENCES `FA17_currentstudents` (`pstu_id`) ON DELETE CASCADE;

--
-- Constraints for table `FA17_fdg_members`
--
ALTER TABLE `FA17_fdg_members`
  ADD CONSTRAINT `FA17_fdg_members_ibfk_1` FOREIGN KEY (`pfdg_id`) REFERENCES `FA17_fdg` (`pfdg_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FA17_fdg_members_ibfk_2` FOREIGN KEY (`pstu_id`) REFERENCES `FA17_currentstudents` (`pstu_id`) ON DELETE CASCADE;

--
-- Constraints for table `FA17_fdg_points`
--
ALTER TABLE `FA17_fdg_points`
  ADD CONSTRAINT `FA17_fdg_points_ibfk_1` FOREIGN KEY (`pfdg_id`) REFERENCES `FA17_fdg` (`pfdg_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FA17_fdg_points_ibfk_2` FOREIGN KEY (`pfdg_event_id`) REFERENCES `FA17_fdg_event` (`pfdg_event_id`) ON DELETE CASCADE;

--
-- Constraints for table `FA17_fdg_reports`
--
ALTER TABLE `FA17_fdg_reports`
  ADD CONSTRAINT `FA17_fdg_reports_ibfk_1` FOREIGN KEY (`pfdg_id`) REFERENCES `FA17_fdg` (`pfdg_id`) ON DELETE CASCADE;

--
-- Constraints for table `FA17_pif_stats`
--
ALTER TABLE `FA17_pif_stats`
  ADD CONSTRAINT `FA17_pif_stats_ibfk_1` FOREIGN KEY (`pstu_id`) REFERENCES `FA17_currentstudents` (`pstu_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FA17_pif_stats_ibfk_2` FOREIGN KEY (`pif_id`) REFERENCES `FA17_pif` (`pif_id`) ON DELETE CASCADE;

--
-- Constraints for table `fa2016_academicevent_attendence`
--
ALTER TABLE `fa2016_academicevent_attendence`
  ADD CONSTRAINT `fa2016_academicevent_attendence_ibfk_1` FOREIGN KEY (`pstu_id`) REFERENCES `fa2016_currentstudents` (`pstu_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fa2016_academicevent_attendence_ibfk_2` FOREIGN KEY (`acad_id`) REFERENCES `fa2016_academicevents` (`acad_id`) ON DELETE CASCADE;

--
-- Constraints for table `fa2016_activitygroupleaders`
--
ALTER TABLE `fa2016_activitygroupleaders`
  ADD CONSTRAINT `fa2016_activitygroupleaders_ibfk_1` FOREIGN KEY (`ag_id`) REFERENCES `fa2016_activitygroup` (`ag_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fa2016_activitygroupleaders_ibfk_2` FOREIGN KEY (`pstu_id`) REFERENCES `fa2016_currentstudents` (`pstu_id`) ON DELETE CASCADE;

--
-- Constraints for table `fa2016_activitygroupsession`
--
ALTER TABLE `fa2016_activitygroupsession`
  ADD CONSTRAINT `fa2016_activitygroupsession_ibfk_1` FOREIGN KEY (`ag_id`) REFERENCES `fa2016_activitygroup` (`ag_id`) ON DELETE CASCADE;

--
-- Constraints for table `fa2016_activitygroupstats`
--
ALTER TABLE `fa2016_activitygroupstats`
  ADD CONSTRAINT `fa2016_activitygroupstats_ibfk_1` FOREIGN KEY (`pstu_id`) REFERENCES `fa2016_currentstudents` (`pstu_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fa2016_activitygroupstats_ibfk_2` FOREIGN KEY (`agses_id`) REFERENCES `fa2016_activitygroupsession` (`agses_id`) ON DELETE CASCADE;

--
-- Constraints for table `fa2016_com_serv`
--
ALTER TABLE `fa2016_com_serv`
  ADD CONSTRAINT `fa2016_com_serv_ibfk_1` FOREIGN KEY (`pstu_id`) REFERENCES `fa2016_currentstudents` (`pstu_id`) ON DELETE CASCADE;

--
-- Constraints for table `fa2016_currentstudents`
--
ALTER TABLE `fa2016_currentstudents`
  ADD CONSTRAINT `fa2016_currentstudents_ibfk_1` FOREIGN KEY (`pstu_id`) REFERENCES `users` (`usr_id`) ON DELETE CASCADE;

--
-- Constraints for table `fa2016_exception_grants`
--
ALTER TABLE `fa2016_exception_grants`
  ADD CONSTRAINT `fa2016_exception_grants_ibfk_1` FOREIGN KEY (`pstu_id`) REFERENCES `fa2016_currentstudents` (`pstu_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fa2016_exception_grants_ibfk_2` FOREIGN KEY (`excptn_id`) REFERENCES `fa2016_exceptions` (`excptn_id`) ON DELETE CASCADE;

--
-- Constraints for table `fa2016_fdg`
--
ALTER TABLE `fa2016_fdg`
  ADD CONSTRAINT `fa2016_fdg_ibfk_1` FOREIGN KEY (`pfdg_id`) REFERENCES `fdg` (`fdg_id`) ON DELETE CASCADE;

--
-- Constraints for table `fa2016_fdg_attendence`
--
ALTER TABLE `fa2016_fdg_attendence`
  ADD CONSTRAINT `fa2016_fdg_attendence_ibfk_1` FOREIGN KEY (`pfdg_report_id`) REFERENCES `fa2016_fdg_reports` (`pfdg_report_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fa2016_fdg_attendence_ibfk_2` FOREIGN KEY (`pstu_id`) REFERENCES `fa2016_currentstudents` (`pstu_id`) ON DELETE CASCADE;

--
-- Constraints for table `fa2016_fdg_event_attendence`
--
ALTER TABLE `fa2016_fdg_event_attendence`
  ADD CONSTRAINT `fa2016_fdg_event_attendence_ibfk_1` FOREIGN KEY (`pfdg_event_id`) REFERENCES `fa2016_fdg_event` (`pfdg_event_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fa2016_fdg_event_attendence_ibfk_2` FOREIGN KEY (`pstu_id`) REFERENCES `fa2016_currentstudents` (`pstu_id`) ON DELETE CASCADE;

--
-- Constraints for table `fa2016_fdg_leaders`
--
ALTER TABLE `fa2016_fdg_leaders`
  ADD CONSTRAINT `fa2016_fdg_leaders_ibfk_1` FOREIGN KEY (`pfdg_id`) REFERENCES `fa2016_fdg` (`pfdg_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fa2016_fdg_leaders_ibfk_2` FOREIGN KEY (`pstu_id`) REFERENCES `fa2016_currentstudents` (`pstu_id`) ON DELETE CASCADE;

--
-- Constraints for table `fa2016_fdg_members`
--
ALTER TABLE `fa2016_fdg_members`
  ADD CONSTRAINT `fa2016_fdg_members_ibfk_1` FOREIGN KEY (`pfdg_id`) REFERENCES `fa2016_fdg` (`pfdg_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fa2016_fdg_members_ibfk_2` FOREIGN KEY (`pstu_id`) REFERENCES `fa2016_currentstudents` (`pstu_id`) ON DELETE CASCADE;

--
-- Constraints for table `fa2016_fdg_points`
--
ALTER TABLE `fa2016_fdg_points`
  ADD CONSTRAINT `fa2016_fdg_points_ibfk_1` FOREIGN KEY (`pfdg_id`) REFERENCES `fa2016_fdg` (`pfdg_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fa2016_fdg_points_ibfk_2` FOREIGN KEY (`pfdg_event_id`) REFERENCES `fa2016_fdg_event` (`pfdg_event_id`) ON DELETE CASCADE;

--
-- Constraints for table `fa2016_fdg_reports`
--
ALTER TABLE `fa2016_fdg_reports`
  ADD CONSTRAINT `fa2016_fdg_reports_ibfk_1` FOREIGN KEY (`pfdg_id`) REFERENCES `fa2016_fdg` (`pfdg_id`) ON DELETE CASCADE;

--
-- Constraints for table `fa2016_pif_stats`
--
ALTER TABLE `fa2016_pif_stats`
  ADD CONSTRAINT `fa2016_pif_stats_ibfk_1` FOREIGN KEY (`pstu_id`) REFERENCES `fa2016_currentstudents` (`pstu_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fa2016_pif_stats_ibfk_2` FOREIGN KEY (`pif_id`) REFERENCES `fa2016_pif` (`pif_id`) ON DELETE CASCADE;

--
-- Constraints for table `SP17_academicevent_attendence`
--
ALTER TABLE `SP17_academicevent_attendence`
  ADD CONSTRAINT `SP17_academicevent_attendence_ibfk_1` FOREIGN KEY (`pstu_id`) REFERENCES `SP17_currentstudents` (`pstu_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SP17_academicevent_attendence_ibfk_2` FOREIGN KEY (`acad_id`) REFERENCES `SP17_academicevents` (`acad_id`) ON DELETE CASCADE;

--
-- Constraints for table `SP17_activitygroupleaders`
--
ALTER TABLE `SP17_activitygroupleaders`
  ADD CONSTRAINT `SP17_activitygroupleaders_ibfk_1` FOREIGN KEY (`ag_id`) REFERENCES `SP17_activitygroup` (`ag_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SP17_activitygroupleaders_ibfk_2` FOREIGN KEY (`pstu_id`) REFERENCES `SP17_currentstudents` (`pstu_id`) ON DELETE CASCADE;

--
-- Constraints for table `SP17_activitygroupsession`
--
ALTER TABLE `SP17_activitygroupsession`
  ADD CONSTRAINT `SP17_activitygroupsession_ibfk_1` FOREIGN KEY (`ag_id`) REFERENCES `SP17_activitygroup` (`ag_id`) ON DELETE CASCADE;

--
-- Constraints for table `SP17_activitygroupstats`
--
ALTER TABLE `SP17_activitygroupstats`
  ADD CONSTRAINT `SP17_activitygroupstats_ibfk_1` FOREIGN KEY (`pstu_id`) REFERENCES `SP17_currentstudents` (`pstu_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SP17_activitygroupstats_ibfk_2` FOREIGN KEY (`agses_id`) REFERENCES `SP17_activitygroupsession` (`agses_id`) ON DELETE CASCADE;

--
-- Constraints for table `SP17_com_serv`
--
ALTER TABLE `SP17_com_serv`
  ADD CONSTRAINT `SP17_com_serv_ibfk_1` FOREIGN KEY (`pstu_id`) REFERENCES `SP17_currentstudents` (`pstu_id`) ON DELETE CASCADE;

--
-- Constraints for table `SP17_currentstudents`
--
ALTER TABLE `SP17_currentstudents`
  ADD CONSTRAINT `SP17_currentstudents_ibfk_1` FOREIGN KEY (`pstu_id`) REFERENCES `users` (`usr_id`) ON DELETE CASCADE;

--
-- Constraints for table `SP17_exception_grants`
--
ALTER TABLE `SP17_exception_grants`
  ADD CONSTRAINT `SP17_exception_grants_ibfk_1` FOREIGN KEY (`pstu_id`) REFERENCES `SP17_currentstudents` (`pstu_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SP17_exception_grants_ibfk_2` FOREIGN KEY (`excptn_id`) REFERENCES `SP17_exceptions` (`excptn_id`) ON DELETE CASCADE;

--
-- Constraints for table `SP17_fdg`
--
ALTER TABLE `SP17_fdg`
  ADD CONSTRAINT `SP17_fdg_ibfk_1` FOREIGN KEY (`pfdg_id`) REFERENCES `fdg` (`fdg_id`) ON DELETE CASCADE;

--
-- Constraints for table `SP17_fdg_attendence`
--
ALTER TABLE `SP17_fdg_attendence`
  ADD CONSTRAINT `SP17_fdg_attendence_ibfk_1` FOREIGN KEY (`pfdg_report_id`) REFERENCES `SP17_fdg_reports` (`pfdg_report_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SP17_fdg_attendence_ibfk_2` FOREIGN KEY (`pstu_id`) REFERENCES `SP17_currentstudents` (`pstu_id`) ON DELETE CASCADE;

--
-- Constraints for table `SP17_fdg_event_attendence`
--
ALTER TABLE `SP17_fdg_event_attendence`
  ADD CONSTRAINT `SP17_fdg_event_attendence_ibfk_1` FOREIGN KEY (`pfdg_event_id`) REFERENCES `SP17_fdg_event` (`pfdg_event_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SP17_fdg_event_attendence_ibfk_2` FOREIGN KEY (`pstu_id`) REFERENCES `SP17_currentstudents` (`pstu_id`) ON DELETE CASCADE;

--
-- Constraints for table `SP17_fdg_leaders`
--
ALTER TABLE `SP17_fdg_leaders`
  ADD CONSTRAINT `SP17_fdg_leaders_ibfk_1` FOREIGN KEY (`pfdg_id`) REFERENCES `SP17_fdg` (`pfdg_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SP17_fdg_leaders_ibfk_2` FOREIGN KEY (`pstu_id`) REFERENCES `SP17_currentstudents` (`pstu_id`) ON DELETE CASCADE;

--
-- Constraints for table `SP17_fdg_members`
--
ALTER TABLE `SP17_fdg_members`
  ADD CONSTRAINT `SP17_fdg_members_ibfk_1` FOREIGN KEY (`pfdg_id`) REFERENCES `SP17_fdg` (`pfdg_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SP17_fdg_members_ibfk_2` FOREIGN KEY (`pstu_id`) REFERENCES `SP17_currentstudents` (`pstu_id`) ON DELETE CASCADE;

--
-- Constraints for table `SP17_fdg_points`
--
ALTER TABLE `SP17_fdg_points`
  ADD CONSTRAINT `SP17_fdg_points_ibfk_1` FOREIGN KEY (`pfdg_id`) REFERENCES `SP17_fdg` (`pfdg_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SP17_fdg_points_ibfk_2` FOREIGN KEY (`pfdg_event_id`) REFERENCES `SP17_fdg_event` (`pfdg_event_id`) ON DELETE CASCADE;

--
-- Constraints for table `SP17_fdg_reports`
--
ALTER TABLE `SP17_fdg_reports`
  ADD CONSTRAINT `SP17_fdg_reports_ibfk_1` FOREIGN KEY (`pfdg_id`) REFERENCES `SP17_fdg` (`pfdg_id`) ON DELETE CASCADE;

--
-- Constraints for table `SP17_pif_stats`
--
ALTER TABLE `SP17_pif_stats`
  ADD CONSTRAINT `SP17_pif_stats_ibfk_1` FOREIGN KEY (`pstu_id`) REFERENCES `SP17_currentstudents` (`pstu_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SP17_pif_stats_ibfk_2` FOREIGN KEY (`pif_id`) REFERENCES `SP17_pif` (`pif_id`) ON DELETE CASCADE;

--
-- Constraints for table `SP18_academicevent_attendence`
--
ALTER TABLE `SP18_academicevent_attendence`
  ADD CONSTRAINT `SP18_academicevent_attendence_ibfk_1` FOREIGN KEY (`pstu_id`) REFERENCES `SP18_currentstudents` (`pstu_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SP18_academicevent_attendence_ibfk_2` FOREIGN KEY (`acad_id`) REFERENCES `SP18_academicevents` (`acad_id`) ON DELETE CASCADE;

--
-- Constraints for table `SP18_activitygroupleaders`
--
ALTER TABLE `SP18_activitygroupleaders`
  ADD CONSTRAINT `SP18_activitygroupleaders_ibfk_1` FOREIGN KEY (`ag_id`) REFERENCES `SP18_activitygroup` (`ag_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SP18_activitygroupleaders_ibfk_2` FOREIGN KEY (`pstu_id`) REFERENCES `SP18_currentstudents` (`pstu_id`) ON DELETE CASCADE;

--
-- Constraints for table `SP18_activitygroupsession`
--
ALTER TABLE `SP18_activitygroupsession`
  ADD CONSTRAINT `SP18_activitygroupsession_ibfk_1` FOREIGN KEY (`ag_id`) REFERENCES `SP18_activitygroup` (`ag_id`) ON DELETE CASCADE;

--
-- Constraints for table `SP18_activitygroupstats`
--
ALTER TABLE `SP18_activitygroupstats`
  ADD CONSTRAINT `SP18_activitygroupstats_ibfk_1` FOREIGN KEY (`pstu_id`) REFERENCES `SP18_currentstudents` (`pstu_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SP18_activitygroupstats_ibfk_2` FOREIGN KEY (`agses_id`) REFERENCES `SP18_activitygroupsession` (`agses_id`) ON DELETE CASCADE;

--
-- Constraints for table `SP18_com_serv`
--
ALTER TABLE `SP18_com_serv`
  ADD CONSTRAINT `SP18_com_serv_ibfk_1` FOREIGN KEY (`pstu_id`) REFERENCES `SP18_currentstudents` (`pstu_id`) ON DELETE CASCADE;

--
-- Constraints for table `SP18_currentstudents`
--
ALTER TABLE `SP18_currentstudents`
  ADD CONSTRAINT `SP18_currentstudents_ibfk_1` FOREIGN KEY (`pstu_id`) REFERENCES `users` (`usr_id`) ON DELETE CASCADE;

--
-- Constraints for table `SP18_exception_grants`
--
ALTER TABLE `SP18_exception_grants`
  ADD CONSTRAINT `SP18_exception_grants_ibfk_1` FOREIGN KEY (`pstu_id`) REFERENCES `SP18_currentstudents` (`pstu_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SP18_exception_grants_ibfk_2` FOREIGN KEY (`excptn_id`) REFERENCES `SP18_exceptions` (`excptn_id`) ON DELETE CASCADE;

--
-- Constraints for table `SP18_fdg`
--
ALTER TABLE `SP18_fdg`
  ADD CONSTRAINT `SP18_fdg_ibfk_1` FOREIGN KEY (`pfdg_id`) REFERENCES `fdg` (`fdg_id`) ON DELETE CASCADE;

--
-- Constraints for table `SP18_fdg_attendence`
--
ALTER TABLE `SP18_fdg_attendence`
  ADD CONSTRAINT `SP18_fdg_attendence_ibfk_1` FOREIGN KEY (`pfdg_report_id`) REFERENCES `SP18_fdg_reports` (`pfdg_report_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SP18_fdg_attendence_ibfk_2` FOREIGN KEY (`pstu_id`) REFERENCES `SP18_currentstudents` (`pstu_id`) ON DELETE CASCADE;

--
-- Constraints for table `SP18_fdg_event_attendence`
--
ALTER TABLE `SP18_fdg_event_attendence`
  ADD CONSTRAINT `SP18_fdg_event_attendence_ibfk_1` FOREIGN KEY (`pfdg_event_id`) REFERENCES `SP18_fdg_event` (`pfdg_event_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SP18_fdg_event_attendence_ibfk_2` FOREIGN KEY (`pstu_id`) REFERENCES `SP18_currentstudents` (`pstu_id`) ON DELETE CASCADE;

--
-- Constraints for table `SP18_fdg_leaders`
--
ALTER TABLE `SP18_fdg_leaders`
  ADD CONSTRAINT `SP18_fdg_leaders_ibfk_1` FOREIGN KEY (`pfdg_id`) REFERENCES `SP18_fdg` (`pfdg_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SP18_fdg_leaders_ibfk_2` FOREIGN KEY (`pstu_id`) REFERENCES `SP18_currentstudents` (`pstu_id`) ON DELETE CASCADE;

--
-- Constraints for table `SP18_fdg_members`
--
ALTER TABLE `SP18_fdg_members`
  ADD CONSTRAINT `SP18_fdg_members_ibfk_1` FOREIGN KEY (`pfdg_id`) REFERENCES `SP18_fdg` (`pfdg_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SP18_fdg_members_ibfk_2` FOREIGN KEY (`pstu_id`) REFERENCES `SP18_currentstudents` (`pstu_id`) ON DELETE CASCADE;

--
-- Constraints for table `SP18_fdg_points`
--
ALTER TABLE `SP18_fdg_points`
  ADD CONSTRAINT `SP18_fdg_points_ibfk_1` FOREIGN KEY (`pfdg_id`) REFERENCES `SP18_fdg` (`pfdg_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SP18_fdg_points_ibfk_2` FOREIGN KEY (`pfdg_event_id`) REFERENCES `SP18_fdg_event` (`pfdg_event_id`) ON DELETE CASCADE;

--
-- Constraints for table `SP18_fdg_reports`
--
ALTER TABLE `SP18_fdg_reports`
  ADD CONSTRAINT `SP18_fdg_reports_ibfk_1` FOREIGN KEY (`pfdg_id`) REFERENCES `SP18_fdg` (`pfdg_id`) ON DELETE CASCADE;

--
-- Constraints for table `SP18_pif_stats`
--
ALTER TABLE `SP18_pif_stats`
  ADD CONSTRAINT `SP18_pif_stats_ibfk_1` FOREIGN KEY (`pstu_id`) REFERENCES `SP18_currentstudents` (`pstu_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `SP18_pif_stats_ibfk_2` FOREIGN KEY (`pif_id`) REFERENCES `SP18_pif` (`pif_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
