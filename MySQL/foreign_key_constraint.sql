mfg Table (from show create table mfg):
CREATE TABLE `mfg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address1` varchar(100) NOT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `city` char(100) NOT NULL,
  `state` char(100) NOT NULL,
  `country` char(100) DEFAULT NULL,
  `zipcode` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `zipcode` (`zipcode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1

I added this FK constraint later:
alter table hserials add constraint mfg_id2hser_mfg_id foreign key (mfg_id) references mfg(id) on update cascade on delete restrict;

hserials Table (from show create table mfg): 
CREATE TABLE `hserials` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hw_name` varchar(100) NOT NULL,
  `hw_serial1` varchar(100) NOT NULL,
  `hw_serial2` varchar(100) DEFAULT NULL,
  `hw_serial3` varchar(100) DEFAULT NULL,
  `mfg_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hw_serial1` (`hw_serial1`),
  KEY `hser_mfg_id` (`mfg_id`),
  CONSTRAINT `mfg_id2hser_mfg_id` FOREIGN KEY (`mfg_id`) REFERENCES `mfg` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1

To find out the symbol value when you want to drop a foreign key, use the SHOW CREATE TABLE statement. For example:
show create table hserials\G;

To display a detailed explanation of the most recent InnoDB foreign key error in the server, issue SHOW ENGINE INNODB STATUS.

select h.mfg_id, m.id from hserials h left join mfg m on (h.mfg_id=m.id) where h.mfg_id = m.id;


