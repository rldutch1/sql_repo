-- Locate MySQL databse files.
-- Typically the MySQL database files are located in /usr/local/mysql/data/databasename/

select @@datadir, @@innodb_data_home_dir;
