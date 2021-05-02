Show database server version:
SELECT @@version;

Show database server status:
\s

Show select set of variables:
SHOW VARIABLES LIKE 'char%';

Show columns:
-- http://stackoverflow.com/questions/5941809/include-headers-when-using-select-into-outfile
-- Show columns
select column_name
    from information_schema.columns
    where table_name = 'my_table'
    and table_schema = 'my_schema'
    order by ordinal_position;

-- "describe tablename" also works.

SELECT `COLUMN_NAME`
FROM `INFORMATION_SCHEMA`.`COLUMNS`
WHERE `TABLE_SCHEMA`='hillc1'
AND `TABLE_NAME`='ffl_book1';

Show table size:
/*
NOTES:
MACs use the decimal system, 1000kb = 1 MB. So divide by / 1000 / 1000 to get MB.
*/

-- Show the database name:
	select database();

-- Show the size of one table (largest first).
SELECT 
table_name AS `Table`, 
round(((data_length + index_length) / 1024 / 1024), 2) `Size in MB` 
FROM information_schema.TABLES 
WHERE table_schema = "bakbone"
AND table_name in "backups";

-- Show the size of a couple of tables (largest first);
SELECT 
table_name AS `Table`, 
round(((data_length + index_length) / 1024 / 1024), 2) `Size in MB` 
FROM information_schema.TABLES 
WHERE table_schema = "bakbone"
AND table_name in ("backups","logfiles");

-- Show the size of all tables in the database (largest first).
SELECT 
table_name AS `Table`, 
round(((data_length + index_length) / 1024 / 1024), 2) `Size in MB` 
FROM information_schema.TABLES 
WHERE table_schema = "bakbone";

-- Show the size of all tables on the database server (largest first).
SELECT 
table_schema as `Database`, 
table_name AS `Table`, 
round(((data_length + index_length) / 1024 / 1024), 2) `Size in MB` 
FROM information_schema.TABLES 
ORDER BY (data_length + index_length) DESC;

-- Create a view that displays the tablesize in the current database:
create view vw_tablesize as SELECT 
table_name AS `Table`, 
round(((data_length + index_length) / 1024 / 1024), 2) `Size_in_MB` 
FROM information_schema.TABLES 
WHERE table_schema = (select database() from dual)
ORDER BY (data_length + index_length) DESC;


Source: https://stackoverflow.com/questions/9620198/how-to-get-the-sizes-of-the-tables-of-a-mysql-database?rq=1



-- Show the status of all of the tables (size, columns, etc).

show status;
show table status;
show table status from databasename;
SHOW STATUS LIKE 'My%'; 
SHOW WARNINGS
Can also type the word "status"

/*
NOTES:
MACs use the decimal system, 1000kb = 1 MB. So divide by / 1000 / 1000 to get MB.
*/

-- Show the database name:
	select database();

-- Show the size of one table (largest first).
SELECT 
table_name AS `Table`, 
round(((data_length + index_length) / 1024 / 1024), 2) `Size in MB` 
FROM information_schema.TABLES 
WHERE table_schema = "bakbone"
AND table_name in "backups";

-- Show the size of a couple of tables (largest first);
SELECT 
table_name AS `Table`, 
round(((data_length + index_length) / 1024 / 1024), 2) `Size in MB` 
FROM information_schema.TABLES 
WHERE table_schema = "bakbone"
AND table_name in ("backups","logfiles");

-- Show the size of all tables in the database (largest first).
SELECT 
table_name AS `Table`, 
round(((data_length + index_length) / 1024 / 1024), 2) `Size in MB` 
FROM information_schema.TABLES 
WHERE table_schema = "bakbone";

-- Show the size of all tables on the database server (largest first).
SELECT 
table_schema as `Database`, 
table_name AS `Table`, 
round(((data_length + index_length) / 1024 / 1024), 2) `Size in MB` 
FROM information_schema.TABLES 
ORDER BY (data_length + index_length) DESC;

Source: https://stackoverflow.com/questions/9620198/how-to-get-the-sizes-of-the-tables-of-a-mysql-database?rq=1


Show Views:
-- Show user created views in MySQL (exclude sys database):
select table_schema, table_name, definer from views where table_schema != 'sys' order by table_schema;

-- If you want to see the create statement, include the "view_definition" column:
select table_schema, table_name, definer, view_definition from views where table_schema != 'sys' order by table_schema;

