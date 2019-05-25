-- Locate MySQL databse files.
-- Typically the MySQL database files are located in /usr/local/mysql/data/databasename/

select @@datadir, @@innodb_data_home_dir;

-- File locations:
SELECT TABLESPACE_NAME, FILE_NAME FROM INFORMATION_SCHEMA.FILES \G
