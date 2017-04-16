-- Create a database, create database user, and enable remote connections for that user from a specific IP address.
-- Example:
/*
    DB_NAME = webdb
    USER_NAME = webdb_user
    REMOTE_IP = 10.0.15.25
    PASSWORD = password123
    PERMISSIONS = ALL
*/

-- CREATE DATABASE ##
-- MariaDB [(none)]>
	CREATE DATABASE webdb;

-- CREATE USER ##
-- MariaDB [(none)]>
	CREATE USER 'webdb_user'@'10.0.15.25' IDENTIFIED BY 'password123';

-- GRANT PERMISSIONS ##
-- MariaDB [(none)]>
	GRANT ALL ON webdb.* TO 'webdb_user'@'10.0.15.25';

-- FLUSH PRIVILEGES, Tell the server to reload the grant tables  ##
-- MariaDB [(none)]>
	FLUSH PRIVILEGES;
