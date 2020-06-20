/*
-- Change user password.
-- Find current user: SELECT CURRENT_USER();
//Database Username: hillc
//Database Password: thepassword123
//----------------------------------------------------------------------------
*/

use mysql;
-- Method 1 (Deprecated):
update mysql.user set password("thepassword123") where user = 'hillc';
FLUSH PRIVILEGES;

-- Method 2 (MySQL 5.7+):
update mysql.user set authentication_string=PASSWORD("thepassword123") where user='hillc';
FLUSH PRIVILEGES;

-- Method 3 (Preferred method for current user.):
alter user set password = "thepassword123";
FLUSH PRIVILEGES;

-- MySQL 5.7:
alter user 'hillc'@'localhost' identified by "thepassword123";
alter user 'hillc'@'%' identified by "thepassword123";

-- Method 4 (Preferred method for another user.):
alter user set password for 'hillc'@'localhost' = "thepassword123";
FLUSH PRIVILEGES;

-- Remote user password change:
alter user set password for 'hillc'@'%' = "thepassword123";
FLUSH PRIVILEGES;


-- ALTER USER ==
ERROR 1820 (HY000): You must reset your password using ALTER USER statement before executing this statement.

--If you started MySQL using "mysql -u root -p" use this method to reset your password:
	ALTER USER 'root'@'localhost' IDENTIFIED BY 'Your New Password';

-- This worked for me from the MySQL DB prompt:
	SET PASSWORD = PASSWORD("your_new_password");

-- Source: http://stackoverflow.com/questions/33467337/reset-mysql-root-password-using-alter-user-statement-after-install-on-mac

-- This syntax enables changing your own password without naming your account literally.
	ALTER USER USER() IDENTIFIED BY "auth_string";

-- This statement changes the password for jeffrey but leaves that for jeanne unchanged. For both accounts, connections are required to use SSL and -- each account can be used for a maximum of two simultaneous connections:
	ALTER USER
  	'jeffrey'@'localhost' IDENTIFIED BY "new_password",
  	'jeanne'@'localhost'
  	REQUIRE SSL WITH MAX_USER_CONNECTIONS 2;

-- Example 1: Change an account's password and expire it. As a result, the user must connect with the named password and choose a new one at the next connection:
	ALTER USER 'jeffrey'@'localhost'
  	IDENTIFIED BY "new_password" PASSWORD EXPIRE;

-- Example 2: Modify an account to use the sha256_password authentication plugin and the given password. Require that a new password be chosen every 180 days:
	ALTER USER 'jeffrey'@'localhost'
  	IDENTIFIED WITH sha256_password BY "new_password"  (SHA256 may require an SSL connection on some systems)
  	PASSWORD EXPIRE INTERVAL 180 DAY;

-- Example 3: Lock or unlock an account:
	ALTER USER 'jeffrey'@'localhost' ACCOUNT LOCK;
		ALTER USER 'jeffrey'@'localhost' ACCOUNT UNLOCK;

-- Example 4: Require an account to connect using SSL and establish a limit of 20 connections per hour:
	ALTER USER 'jeffrey'@'localhost'
  	REQUIRE SSL WITH MAX_CONNECTIONS_PER_HOUR 20;

-- http://dev.mysql.com/doc/refman/5.7/en/alter-user.html

-- Lock User Account on MySQL 8.0.x.x.:
UPDATE `user` SET `account_locked` = 'Y' WHERE `user`.`Host` = 'localhost' AND `user`.`User` = 'robdba5';

-- Solution for - Connect Error: SQLSTATE[HY000] [2054] The server requested authentication method unknown to the client.
-- Change the authentication method from auth_socket to mysql_native_password:
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY "password";

--  Switch to caching_sha2_password authentication for MySQL 8 upgrades:
  ALTER USER 'umptyfratz'@'%'
    IDENTIFIED WITH caching_sha2_password
    BY "password";

  ALTER USER 'root'@'localhost'
    IDENTIFIED WITH mysql_native_password
    BY "password";

