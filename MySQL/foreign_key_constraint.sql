
Show foreign key constraints for a table:
http://stackoverflow.com/questions/4004205/mysql-show-constraints-on-tables-command

show create table xxxxx;

show create table xxxxx\G

-- All databases and tables foreign key constraints:
	use information_schema;
	select concat(kcu.TABLE_SCHEMA,'.',kcu.TABLE_NAME,'.',kcu.COLUMN_NAME) as This_DB_Table_and_Column, concat(kcu.TABLE_SCHEMA,'.',kcu.REFERENCED_TABLE_NAME,'.',kcu.REFERENCED_COLUMN_NAME) as References_This_DB_Table_and_Column, kcu.CONSTRAINT_NAME from KEY_COLUMN_USAGE kcu where kcu.referenced_table_name is not NULL;

-- Specific database and specific table foreign key constraints:
	use information_schema;
	select concat(kcu.TABLE_NAME,'.',kcu.COLUMN_NAME) as This_Table_and_Column, concat(kcu.REFERENCED_TABLE_NAME,'.',kcu.REFERENCED_COLUMN_NAME) as References_This_Table_and_Column, kcu.CONSTRAINT_NAME from KEY_COLUMN_USAGE kcu where kcu.TABLE_SCHEMA = "hillc1_test" and kcu.TABLE_NAME = "ffl_book1" and kcu.referenced_column_name is not NULL;

-- Specific database foreign key constraints:
	use information_schema;
	select concat(kcu.table_schema,'.',kcu.table_name,'.',kcu.column_name) as This_DB_Table_and_column, concat(kcu.table_schema,'.',kcu.referenced_table_name,'.',kcu.referenced_column_name) as References_This_DB_Table_and_Column, kcu.constraint_name from key_column_usage kcu where kcu.referenced_table_name is not NULL and kcu.table_schema = "hillc1_test";

-- This works but I want to modify it so that I can select specific databases/tables. BEGIN:
use information_schema;
select
	concat(kcu.table_schema,'.',kcu.table_name,'.',kcu.column_name) as this_db_table_and_column,
	concat(kcu.table_schema,'.',kcu.referenced_table_name,'.',kcu.referenced_column_name) as references_this_db_table_and_column,
	kcu.constraint_name,
	rc.update_rule,
	rc.delete_rule
from
	key_column_usage kcu
join referential_constraints rc on (rc.constraint_name= kcu.constraint_name)
where kcu.referenced_table_name is not null order by this_db_table_and_column;
-- This works but I want to modify it so that I can select specific databases/tables. END:

-- Not using the "USE INFORMATION_SCHEMA" command:
-- All databases and tables foreign key constraints:
	select concat(kcu.TABLE_SCHEMA,'.',kcu.TABLE_NAME,'.',kcu.COLUMN_NAME) as This_DB_Table_and_Column, concat(kcu.TABLE_SCHEMA,'.',kcu.REFERENCED_TABLE_NAME,'.',kcu.REFERENCED_COLUMN_NAME) as References_This_DB_Table_and_Column, kcu.CONSTRAINT_NAME from INFORMATION_SCHEMA.KEY_COLUMN_USAGE kcu where kcu.referenced_table_name is not NULL;

-- Not using the "USE INFORMATION_SCHEMA" command:
-- Specific database and specific table foreign key constraints:
	select concat(kcu.TABLE_NAME,'.',kcu.COLUMN_NAME) as This_Table_and_Column, concat(kcu.REFERENCED_TABLE_NAME,'.',kcu.REFERENCED_COLUMN_NAME) as References_This_Table_and_Column, kcu.CONSTRAINT_NAME from INFORMATION_SCHEMA.KEY_COLUMN_USAGE kcu where kcu.TABLE_SCHEMA = "hillc1_test" and kcu.TABLE_NAME = "ffl_book1" and kcu.referenced_column_name is not NULL;

-- Not using the "USE INFORMATION_SCHEMA" command:
-- Specific database foreign key constraints:
	select concat(kcu.table_schema,'.',kcu.table_name,'.',kcu.column_name) as This_DB_Table_and_column, concat(kcu.table_schema,'.',kcu.referenced_table_name,'.',kcu.referenced_column_name) as References_This_DB_Table_and_Column, kcu.constraint_name from information_schema.key_column_usage kcu where kcu.referenced_table_name is not NULL and kcu.table_schema = "hillc1_test";

-- This is a quick way to view all of the contraints:
select * from information_schema.referential_constraints;

-- This is a quick way to view constraints from a specific database:
select * from information_schema.referential_constraints where constraint_schema = 'thedatabasename';

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

You can also drop the unique constraint. To find the constraint/index name, type show create table.
alter table thetablename drop index constraint_indexname;

Simple foreign key constraint exercise:
Source: (https://www.youtube.com/watch?v=eTK9TLciRpU) 

-- First table is created here:
	create table student(
	stud_id int auto_increment,
	name varchar(100) not null,
	age int not null,
	primary key(stud_id));

-- Second table is created and references a column in the first table:
	create table enrol(
	rol_no int not null,
	stud_id int not null,
	primary key(rol_no),
	foreign key(stud_id) references student(stud_id));

-- The foreign key can also be added after the table has been created:
-- The constraint name will be automatically created.
	alter table enrol add foreign key(stud_id) references student(stud_id);
	
USE information_schema;
 
SELECT table_name
FROM referential_constraints
WHERE constraint_schema = 'database_name' AND
      referenced_table_name = 'parent_table' AND
      delete_rule = 'CASCADE';
      
USE information_schema;
 
SELECT table_name
FROM referential_constraints
WHERE constraint_schema = 'fk_test' AND
      referenced_table_name = 'buildings' AND
      delete_rule = 'CASCADE';


MySQL on Delete Cascade deletes data from Multiple Tables
	http://www.mysqltutorial.org/mysql-on-delete-cascade/
