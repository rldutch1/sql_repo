--The timestamp data type has a limitation between the years 1970 and 2038.
--Use datetime instead. If you need a timestamp you can set the default to current_timestamp.
--See the updt_dt_tm and cr_date fields in the table below.

CREATE TABLE `test1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `updt_dt_tm` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `cr_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--Date Format:
	http://www.mysqltutorial.org/mysql-date/
