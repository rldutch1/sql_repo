CREATE TABLE `healthtemperature` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `temp_f` float NOT NULL,
  `person_id` int(11) NOT NULL,
  `temp_dttm` datetime NOT NULL,
  `active_ind` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM:

