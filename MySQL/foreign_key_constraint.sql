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

NOTE: The column data types have to be the same before you can add a foreign key constraint. I had a problem creating a constraint on an int(11) unsigned because one of the columns did not have the "Unsigned" attribute.

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

ALTER TABLE hserials DROP FOREIGN KEY `hw_serial1`;

To display a detailed explanation of the most recent InnoDB foreign key error in the server, issue SHOW ENGINE INNODB STATUS.

select h.mfg_id, m.id from hserials h left join mfg m on (h.mfg_id=m.id) where h.mfg_id = m.id;

To add an index to a column:
	alter table tablename add index (columnname);

To add multi-column unique constraint: 
	create table testnames (
	id int(11) unsigned auto_increment primary key, 
	firstname varchar(100) not null, 
	lastname varchar(100) not null
	) engine=innodb;
Then type:
	alter table testnames add unique fname_lname_index(firstname, lastname);

Or you can add the unique constraint when you create the table:
	create table testnames (
	id int(11) unsigned auto_increment primary key, 
	firstname varchar(100) not null, 
	lastname varchar(100) not null
	unique key fname_lname_index(firstname, lastname)
	) engine=innodb;
