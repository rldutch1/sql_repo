-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2013 at 02:24 PM
-- Server version: 5.5.25
-- PHP Version: 5.3.15

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `play`
--

-- --------------------------------------------------------

--
-- Table structure for table `mac_addresses`
--

CREATE TABLE IF NOT EXISTS `mac_addresses` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mac` varchar(17) NOT NULL,
  `device` varchar(100) DEFAULT NULL,
  `example` varchar(50) NOT NULL DEFAULT 'ifconfig en# ether',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mac` (`mac`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=71 ;

--
-- Dumping data for table `mac_addresses`
--

INSERT INTO `mac_addresses` (`id`, `mac`, `device`, `example`) VALUES
(1, '00:00:85:37:31:10', NULL, 'ifconfig en# ether 00:00:85:37:31:10'),
(2, '00:02:a6:ea:22:de', NULL, 'ifconfig en# ether 00:02:a6:ea:22:de'),
(3, '00:07:E9:66:FA:CC', NULL, 'ifconfig en# ether 00:07:E9:66:FA:CC'),
(4, '00:09:04:B2:F0:AA', NULL, 'ifconfig en# ether 00:09:04:B2:F0:AA'),
(5, '00:09:f8:ae:70:88', NULL, 'ifconfig en# ether 00:09:f8:ae:70:88'),
(6, '00:0C:41:83:C0:2D', NULL, 'ifconfig en# ether 00:0C:41:83:C0:2D'),
(7, '00:0d:9d:51:d2:7b', NULL, 'ifconfig en# ether 00:0d:9d:51:d2:7b'),
(8, '00:10:DC:C1:18:E7', NULL, 'ifconfig en# ether 00:10:DC:C1:18:E7'),
(9, '00:11:11:01:2F:C3', NULL, 'ifconfig en# ether 00:11:11:01:2F:C3'),
(10, '00:11:11:01:2F:E8', NULL, 'ifconfig en# ether 00:11:11:01:2F:E8'),
(11, '00:11:5F:00:FB:C4', NULL, 'ifconfig en# ether 00:11:5F:00:FB:C4'),
(12, '00:1B:5B:04:37:11', NULL, 'ifconfig en# ether 00:1B:5B:04:37:11'),
(13, '00:1B:9E:87:7E:82', NULL, 'ifconfig en# ether 00:1B:9E:87:7E:82'),
(14, '00:1B:FC:E0:15:65', NULL, 'ifconfig en# ether 00:1B:FC:E0:15:65'),
(15, '00:1E:8C:C5:44:BD', NULL, 'ifconfig en# ether 00:1E:8C:C5:44:BD'),
(16, '00:1F:E1:53:30:46', NULL, 'ifconfig en# ether 00:1F:E1:53:30:46'),
(17, '00:1a:b3:51:9b:67', NULL, 'ifconfig en# ether 00:1a:b3:51:9b:67'),
(18, '00:22:2b:f5:bf:92', NULL, 'ifconfig en# ether 00:22:2b:f5:bf:92'),
(19, '00:22:69:66:5F:1A', NULL, 'ifconfig en# ether 00:22:69:66:5F:1A'),
(20, '00:23:69:09:C8:ED', NULL, 'ifconfig en# ether 00:23:69:09:C8:ED'),
(21, '00:23:69:09:CF:59', NULL, 'ifconfig en# ether 00:23:69:09:CF:59'),
(22, '00:23:f5:19:66:13', NULL, 'ifconfig en# ether 00:23:f5:19:66:13'),
(23, '00:24:11:7e:0d:e6', NULL, 'ifconfig en# ether 00:24:11:7e:0d:e6'),
(24, '00:25:00:4B:78:52', NULL, 'ifconfig en# ether 00:25:00:4B:78:52'),
(25, '00:26:63:5c:b1:47', NULL, 'ifconfig en# ether 00:26:63:5c:b1:47'),
(26, '00:26:92:03:bc:95', NULL, 'ifconfig en# ether 00:26:92:03:bc:95'),
(27, '00:29:ef:f8:11:da', NULL, 'ifconfig en# ether 00:29:ef:f8:11:da'),
(28, '00:2a:3c:cd:36:12', NULL, 'ifconfig en# ether 00:2a:3c:cd:36:12'),
(29, '00:30:d3:9c:57:8a', NULL, 'ifconfig en# ether 00:30:d3:9c:57:8a'),
(30, '00:31:76:ce:76:9b', NULL, 'ifconfig en# ether 00:31:76:ce:76:9b'),
(31, '00:35:76:b8:0e:a0', NULL, 'ifconfig en# ether 00:35:76:b8:0e:a0'),
(32, '00:35:7a:0d:67:a5', NULL, 'ifconfig en# ether 00:35:7a:0d:67:a5'),
(33, '00:3f:fa:7b:37:94', NULL, 'ifconfig en# ether 00:3f:fa:7b:37:94'),
(34, '00:41:84:50:0d:07', NULL, 'ifconfig en# ether 00:41:84:50:0d:07'),
(35, '00:44:05:5a:86:f9', NULL, 'ifconfig en# ether 00:44:05:5a:86:f9'),
(36, '00:47:72:e9:6b:6e', NULL, 'ifconfig en# ether 00:47:72:e9:6b:6e'),
(37, '00:4c:7e:fb:bb:80', NULL, 'ifconfig en# ether 00:4c:7e:fb:bb:80'),
(38, '00:60:bf:9e:35:35', NULL, 'ifconfig en# ether 00:60:bf:9e:35:35'),
(39, '00:67:53:2b:b5:77', NULL, 'ifconfig en# ether 00:67:53:2b:b5:77'),
(40, '00:69:79:08:b3:9a', NULL, 'ifconfig en# ether 00:69:79:08:b3:9a'),
(41, '00:6e:8f:85:bd:2b', NULL, 'ifconfig en# ether 00:6e:8f:85:bd:2b'),
(42, '00:73:ca:62:6c:cb', NULL, 'ifconfig en# ether 00:73:ca:62:6c:cb'),
(43, '00:78:3e:0c:62:b4', NULL, 'ifconfig en# ether 00:78:3e:0c:62:b4'),
(44, '00:79:6c:18:8b:76', NULL, 'ifconfig en# ether 00:79:6c:18:8b:76'),
(45, '00:7e:0a:19:38:1e', NULL, 'ifconfig en# ether 00:7e:0a:19:38:1e'),
(46, '00:7e:4b:0a:3b:9b', NULL, 'ifconfig en# ether 00:7e:4b:0a:3b:9b'),
(47, '00:85:90:de:6a:75', NULL, 'ifconfig en# ether 00:85:90:de:6a:75'),
(48, '00:8c:7e:d1:6b:89', NULL, 'ifconfig en# ether 00:8c:7e:d1:6b:89'),
(49, '00:a9:b4:b8:59:6b', NULL, 'ifconfig en# ether 00:a9:b4:b8:59:6b'),
(50, '00:ad:d7:b2:92:c4', NULL, 'ifconfig en# ether 00:ad:d7:b2:92:c4'),
(51, '00:b9:b3:25:ae:95', NULL, 'ifconfig en# ether 00:b9:b3:25:ae:95'),
(52, '00:bd:40:ac:22:84', NULL, 'ifconfig en# ether 00:bd:40:ac:22:84'),
(53, '00:c2:d2:7e:83:3d', NULL, 'ifconfig en# ether 00:c2:d2:7e:83:3d'),
(54, '00:c5:c1:a7:f2:65', NULL, 'ifconfig en# ether 00:c5:c1:a7:f2:65'),
(55, '00:c6:aa:1d:d8:28', NULL, 'ifconfig en# ether 00:c6:aa:1d:d8:28'),
(56, '00:c7:46:dd:15:10', NULL, 'ifconfig en# ether 00:c7:46:dd:15:10'),
(57, '00:c7:d7:79:c6:78', NULL, 'ifconfig en# ether 00:c7:d7:79:c6:78'),
(58, '00:cf:fe:cb:a4:8f', NULL, 'ifconfig en# ether 00:cf:fe:cb:a4:8f'),
(59, '00:d1:74:8f:1f:50', NULL, 'ifconfig en# ether 00:d1:74:8f:1f:50'),
(60, '00:db:ad:67:40:99', NULL, 'ifconfig en# ether 00:db:ad:67:40:99'),
(61, '00:e2:ea:9c:44:62', NULL, 'ifconfig en# ether 00:e2:ea:9c:44:62'),
(62, '00:f4:5b:4a:35:7d', NULL, 'ifconfig en# ether 00:f4:5b:4a:35:7d'),
(63, '00:f6:50:76:8a:31', NULL, 'ifconfig en# ether 00:f6:50:76:8a:31'),
(64, '00:fb:19:8d:7f:f7', NULL, 'ifconfig en# ether 00:fb:19:8d:7f:f7'),
(65, '00:fb:f2:62:9f:87', NULL, 'ifconfig en# ether 00:fb:f2:62:9f:87'),
(66, '68:B5:99:4F:F4:71', NULL, 'ifconfig en# ether 68:B5:99:4F:F4:71'),
(67, '6e:3e:b6:f9:d7:b3', NULL, 'ifconfig en# ether 6e:3e:b6:f9:d7:b3'),
(68, '10:40:f3:a2:9d:c4', 'My Macbook Pro en1', 'ifconfig en# ether 10:40:f3:a2:9d:c4'),
(69, '40:6c:8f:0c:2f:61', 'My MacBook Pro en0', 'ifconfig en# ether 40:6c:8f:0c:2f:61'),
(70, '02:40:f3:a2:9d:c4', 'My MacBook Pro p2p0', 'ifconfig en# ether 02:40:f3:a2:9d:c4');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
