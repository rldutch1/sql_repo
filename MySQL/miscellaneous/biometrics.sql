-- phpMyAdmin SQL Dump
-- version 3.5.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 17, 2012 at 04:17 PM
-- Server version: 5.5.28
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `biometrics`
--

-- --------------------------------------------------------

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
CREATE TABLE IF NOT EXISTS `device` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `serial` varchar(15) NOT NULL,
  `device` varchar(50) NOT NULL,
  `loc_id` int(11) NOT NULL,
  `subloc_id` int(11) NOT NULL,
  `operable_id` int(11) NOT NULL,
  `inv_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serial` (`serial`),
  KEY `loc_id_to_location` (`loc_id`),
  KEY `subloc_id_to_sublocation` (`subloc_id`),
  KEY `operable_id_to_operable` (`operable_id`),
  KEY `inv_id_to_inventory` (`inv_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=119 ;

--
-- Dumping data for table `device`
--

INSERT INTO `device` (`id`, `serial`, `device`, `loc_id`, `subloc_id`, `operable_id`, `inv_id`) VALUES
(1, '10126', 'IRIS READER 2.4 PIER', 1, 9, 3, 1),
(2, '11003', 'IRIS READER 2.4 PIER', 3, 4, 2, 6),
(3, '11220', 'IRIS READER 2.4 PIER', 3, 6, 3, 6),
(4, '12122', 'IRIS READER 2.4 PIER', 3, 4, 2, 6),
(5, '13029', 'IRIS READER 2.4 PIER', 3, 4, 2, 6),
(6, '13753', 'IRIS READER 2.4 PIER', 3, 4, 2, 6),
(7, '14196', 'IRIS READER 2.4 PIER', 3, 4, 2, 6),
(8, '14377', 'IRIS READER 2.4 PIER', 3, 6, 3, 6),
(9, '20237', 'IRIS READER 2.4 PIER', 3, 5, 2, 1),
(10, '20400', 'IRIS READER 2.4 PIER', 3, 5, 2, 1),
(11, '20721', 'IRIS READER 2.4 PIER', 3, 5, 2, 1),
(12, '22936', 'IRIS READER 2.4 PIER', 1, 9, 3, 1),
(13, '23645', 'IRIS READER 2.4 PIER', 3, 6, 2, 1),
(14, '23719', 'IRIS READER 2.4 PIER', 3, 6, 2, 1),
(15, '23910', 'IRIS READER 2.4 PIER', 3, 6, 2, 1),
(16, '24120', 'IRIS READER 2.4 PIER', 3, 6, 3, 6),
(17, '24269', 'IRIS READER 2.4 PIER', 1, 9, 3, 1),
(18, '24507', 'IRIS READER 2.4 PIER', 3, 6, 2, 1),
(19, '6XGNGH1', 'DELL OPTIPLEX 760 (NIPR ARMY STATION)', 1, 9, 3, 1),
(20, '7BKSA23717', 'BIOMETRIC AUTOMATED TOOLKIT BAT (COMPAC LAPTOP)', 3, 4, 2, 1),
(21, '7BKSA23760', 'BIOMETRIC AUTOMATED TOOLKIT BAT (COMPAC LAPTOP)', 3, 5, 2, 1),
(22, '7BKSA24627', 'BIOMETRIC AUTOMATED TOOLKIT BAT (COMPAC LAPTOP)', 3, 4, 2, 1),
(23, '7GKSA53790', 'BISA TIER II ENROLLMENT STATION', 3, 6, 2, 1),
(24, '7KKSA42952', 'BIOMETRIC AUTOMATED TOOLKIT BAT (COMPAC LAPTOP)', 3, 4, 2, 1),
(25, '8DKSA21881', 'BISA TIER II ENROLLMENT STATION', 3, 6, 2, 1),
(26, '8DKSA22090', 'BISA TIER II ENROLLMENT STATION', 3, 6, 2, 1),
(27, '8DKSA23326', 'BIOMETRIC TIER II ISSUANCE STATION (COMPAC LAPTOP)', 3, 6, 2, 1),
(28, '8JKSB99858', 'BISA TIER II ENROLLMENT STATION', 3, 6, 2, 1),
(29, '8JKSB99874', 'BIOMETRIC TIER II ISSUANCE STATION (COMPAC LAPTOP)', 3, 6, 2, 1),
(30, '8KKSB08071', 'BISA TIER II ENROLLMENT STATION', 3, 6, 2, 1),
(31, '8KKSB08107', 'BISA TIER II ENROLLMENT STATION', 3, 6, 2, 1),
(32, '8KKSB08206', 'BISA TIER II ENROLLMENT STATION', 3, 6, 2, 1),
(33, '95MJTK1', 'DELL OPTIPLEX 760', 3, 6, 3, 1),
(34, '9BR1PN1', 'DELL OPTIPLEX 760', 2, 1, 2, 1),
(35, '9DKYA49822', 'BIOMETRIC TIER II ISSUANCE STATION (COMPAC LAPTOP)', 3, 6, 2, 1),
(36, '9DKYA51306', 'BISA TIER II ENROLLMENT STATION', 3, 6, 2, 1),
(37, '9DKYA51375', 'BISA TIER II ENROLLMENT STATION', 3, 6, 2, 1),
(38, '9DMJTK1', 'DELL OPTIPLEX 760', 3, 11, 2, 1),
(39, '9HKSA65886', 'BIOMETRIC AUTOMATED TOOLKIT BAT (COMPAC LAPTOP)', 3, 4, 2, 1),
(40, '9IKSA66213', 'BIOMETRIC AUTOMATED TOOLKIT BAT (COMPAC LAPTOP)', 3, 6, 2, 1),
(41, 'HD40354', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 2, 1, 2, 1),
(42, 'HD41723', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 1, 1),
(43, 'HD43170', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 2, 1),
(44, 'HD45444', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 2, 2, 2, 1),
(45, 'HD45478', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 2, 1),
(46, 'HD45495', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 1, 1),
(47, 'HD45508', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 2, 1, 2, 1),
(48, 'HD45528', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 2, 3, 2, 1),
(49, 'HD45560', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 2, 1, 2, 1),
(50, 'HD48506', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 3, 1),
(51, 'HD48520', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 2, 3, 2, 1),
(52, 'HD48540', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 2, 1),
(53, 'HD48542', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 1, 1),
(54, 'HD48543', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 2, 1, 2, 1),
(55, 'HD48567', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 1, 1),
(56, 'HD48568', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 2, 1),
(57, 'HD48571', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 3, 1),
(58, 'HD48619', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 1, 1),
(59, 'HD48626', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 2, 1),
(60, 'HD48627', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 2, 1),
(61, 'HD48641', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 1, 1),
(62, 'HD48652', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 2, 12, 2, 1),
(63, 'HD48653', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 11, 2, 1),
(64, 'HD48660', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 2, 13, 2, 1),
(65, 'HD48696', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 1, 1),
(66, 'HD48712', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 7, 2, 1),
(67, 'HD48722', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 2, 2, 2, 1),
(68, 'HD48724', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 1, 1),
(69, 'HD48725', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 2, 1, 2, 1),
(70, 'HD48728', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 1, 1),
(71, 'HD48731', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 1, 1),
(72, 'HD48735', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 7, 2, 1),
(73, 'HD48738', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 2, 1, 2, 1),
(74, 'HD49362', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 1, 9, 3, 1),
(75, 'HD49556', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 2, 1),
(76, 'HD49558', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 2, 1, 2, 1),
(77, 'HD49867', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 1, 1),
(78, 'HD49907', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 11, 2, 1),
(79, 'HD49920', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 2, 1),
(80, 'HD49936', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 3, 1),
(81, 'HD49978', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 1, 1),
(82, 'HD50205', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 1, 1),
(83, 'HD50209', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 2, 12, 2, 1),
(84, 'HD50215', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 1, 1),
(85, 'HD50225', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 2, 13, 2, 1),
(86, 'HD50239', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 1, 1),
(87, 'HD50246', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 1, 1),
(88, 'HD50254', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 2, 1),
(89, 'HD50261', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 1, 1),
(90, 'HD50266', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 1, 1),
(91, 'HD50301', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 1, 1),
(92, 'HD50312', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 2, 10, 2, 1),
(93, 'HD50316', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 7, 2, 1),
(94, 'HD50329', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 1, 9, 3, 1),
(95, 'HD50336', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 1, 1),
(96, 'HD50377', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 1, 1),
(97, 'HD54630', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 2, 10, 2, 1),
(98, 'HD55002', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 2, 8, 2, 1),
(99, 'HD55143', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 1, 1),
(100, 'HD55168', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 2, 1),
(101, 'HD55225', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 2, 8, 2, 1),
(102, 'HD55289', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 2, 1, 2, 6),
(103, 'HD55336', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 1, 1),
(104, 'HD55337', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 11, 2, 1),
(105, 'HD55343', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 1, 1),
(106, 'HD55344', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 7, 2, 1),
(107, 'HD55431', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 1, 1),
(108, 'HD55467', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 2, 1),
(109, 'HD55473', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 2, 1),
(110, 'HD55505', 'MULTI-MODAL BIOMETRIC COLLECTION (IRIS READER)', 3, 6, 1, 1),
(111, 'NO SERIAL1', 'IRIS READER 2.4 PIER', 3, 6, 3, 6),
(114, 'P70162', 'CP80 DATACARD PRINTER', 3, 6, 2, 1),
(115, 'P70170', 'CP80 DATACARD PRINTER', 3, 6, 2, 1),
(116, 'P91480', 'CP80 DATACARD PRINTER', 3, 6, 2, 1),
(117, 'P92181', 'CP80 DATACARD PRINTER', 3, 6, 2, 1),
(118, 'P92369', 'CP80 DATACARD PRINTER', 3, 6, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE IF NOT EXISTS `inventory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `name`) VALUES
(1, 'DoS'),
(2, 'OSC-I'),
(3, 'ARMY'),
(4, 'USAID'),
(5, 'OTHER'),
(6, 'UNKNOWN');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
CREATE TABLE IF NOT EXISTS `location` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pri_location` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `pri_location`) VALUES
(1, 'MISSING'),
(2, 'NEC'),
(3, 'PROSPERITY');

-- --------------------------------------------------------

--
-- Table structure for table `operable`
--

DROP TABLE IF EXISTS `operable`;
CREATE TABLE IF NOT EXISTS `operable` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `operable`
--

INSERT INTO `operable` (`id`, `status`) VALUES
(1, 'BAD'),
(2, 'GOOD'),
(3, 'UNKNOWN');

-- --------------------------------------------------------

--
-- Table structure for table `sublocation`
--

DROP TABLE IF EXISTS `sublocation`;
CREATE TABLE IF NOT EXISTS `sublocation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sub_location` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `sublocation`
--

INSERT INTO `sublocation` (`id`, `sub_location`) VALUES
(1, 'ANNEX I'),
(2, 'BLACK CAC'),
(3, 'BLUE CAC'),
(4, 'BUILDING 76'),
(5, 'BUILDING 92'),
(6, 'BUILDING 94'),
(7, 'CP4'),
(8, 'GREEN CAC'),
(9, 'MISSING'),
(10, 'RED CAC'),
(11, 'TOWER 9'),
(12, 'WHITE CAC'),
(13, 'YELLOW CAC');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwBiometrics`
--
DROP VIEW IF EXISTS `vwBiometrics`;
CREATE TABLE IF NOT EXISTS `vwBiometrics` (
`serial` varchar(15)
,`device` varchar(50)
,`pri_location` varchar(30)
,`sub_location` varchar(30)
,`status` varchar(10)
,`name` varchar(20)
);
-- --------------------------------------------------------

--
-- Structure for view `vwBiometrics`
--
DROP TABLE IF EXISTS `vwBiometrics`;

CREATE ALGORITHM=UNDEFINED DEFINER=`rob`@`localhost` SQL SECURITY DEFINER VIEW `vwBiometrics` AS select `d`.`serial` AS `serial`,`d`.`device` AS `device`,`l`.`pri_location` AS `pri_location`,`s`.`sub_location` AS `sub_location`,`o`.`status` AS `status`,`i`.`name` AS `name` from ((((`device` `d` join `location` `l` on((`d`.`loc_id` = `l`.`id`))) join `sublocation` `s` on((`d`.`subloc_id` = `s`.`id`))) join `operable` `o` on((`d`.`operable_id` = `o`.`id`))) join `inventory` `i` on((`d`.`inv_id` = `i`.`id`))) order by `d`.`serial` limit 0,200;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
