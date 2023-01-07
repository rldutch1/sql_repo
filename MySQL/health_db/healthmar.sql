CREATE TABLE `healthmar` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `medication` varchar(100) NOT NULL,
  `dose` varchar(100) NOT NULL,
  `unit` varchar(10) NOT NULL,
  `admin_dttm` datetime NOT NULL,
  `active_ind` int(1) NOT NULL DEFAULT '1' COMMENT '1 if row is active, 0 if in error or incorrect.',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM;

