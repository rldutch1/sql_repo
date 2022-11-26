-- Drop object from database examples.

Drop Foreign Key:
To find out the symbol value when you want to drop a foreign key, use the SHOW CREATE TABLE statement. For example:
	show create table hserials\G;

	alter table hserials drop foreign key `hw_serial1`;

Drop Index:
You can also drop the unique constraint. To find the constraint/index name, type show create table.
	alter table thetablename drop index constraint_indexname;

Drop Column:
	alter table thetablename drop thecolumnname;

Drop Table:
	drop thetablename;

Drop Database:
	drop thedatabasename;
