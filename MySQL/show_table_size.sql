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
