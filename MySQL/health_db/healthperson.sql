REATE TABLE `healthperson` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `middlename` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) NOT NULL,
  `birth_date` datetime NOT NULL,
  `birth_city` varchar(100) DEFAULT NULL,
  `birth_state` varchar(100) DEFAULT NULL,
  `birth_place` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM;

