
Show foreign key constraints for a table:
http://stackoverflow.com/questions/4004205/mysql-show-constraints-on-tables-command

show create table xxxxx;

show create table xxxxx\G

All tables foreign key query:
	use INFORMATION_SCHEMA;
	select concat(TABLE_SCHEMA,'.',TABLE_NAME,'.',COLUMN_NAME) as This_DB_Table_and_Column, concat(TABLE_SCHEMA,'.',REFERENCED_TABLE_NAME,'.',REFERENCED_COLUMN_NAME) as References_DB_Table_and_Column,CONSTRAINT_NAME from KEY_COLUMN_USAGE where referenced_table_name is not NULL;

Specific database and table foreign key query:
	use INFORMATION_SCHEMA;
	select concat(TABLE_NAME,'.',COLUMN_NAME) as This_Table_and_Column,CONSTRAINT_NAME, concat(REFERENCED_TABLE_NAME,'.',REFERENCED_COLUMN_NAME) as References_This_Table_and_Column from KEY_COLUMN_USAGE 
	where TABLE_SCHEMA = "videos" and TABLE_NAME = "testnames1" 
	and referenced_column_name is not NULL;

use information_schema;
	select concat(table_name,'.',column_name) as
	This_DB_Table_and_Column, constraint_name, concat(referenced_table_name,'.',referenced_column_name) as References_This_Table_and_Column from key_column_usage where referenced_column_name is not NULL
	order by This_DB_Table_and_Column;

alter table TableName add constraint TheConstraintName foreign key (TableNameID) references ForeignTable(id) on update cascade on delete restrict;

Casecade only works if foreign_key_checks is ON. To see this information type:
	show variables like 'foreign_key_checks';
	
	If you want to see all variables type:
	show variables;

http://www.mysqltutorial.org/mysql-foreign-key/
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

To make it easier to reload dump files for tables that have foreign key relationships, mysqldump automatically includes a statement in the dump output to set foreign_key_checks to 0. This avoids problems with tables having to be reloaded in a particular order when the dump is reloaded. It is also possible to set this variable manually:

	mysql> SET foreign_key_checks = 0;
	mysql> SOURCE dump_file_name;
	mysql> SET foreign_key_checks = 1;

This enables you to import the tables in any order if the dump file contains tables that are not correctly ordered for foreign keys. 

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


Simple foreign key constraint exercise:
Source: (https://www.youtube.com/watch?v=eTK9TLciRpU) 

First table is created here:
	create table student(
	stud_id int auto_increment,
	name varchar(100) not null,
	age int not null,
	primary key(stud_id));

Second table is created and references a column in the first table:
	create table enrol(
	rol_no int not null,
	stud_id int not null,
	primary key(rol_no),
	foreign key(stud_id) references student(stud_id));

The foreign key can also be added after the table has been created:
The constraint name will be automatically created.
	alter table enrol add foreign key(stud_id) references student(stud_id);
	
