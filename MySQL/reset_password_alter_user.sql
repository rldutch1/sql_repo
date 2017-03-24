ERROR 1820 (HY000): You must reset your password using ALTER USER statement before executing this statement.

-- This worked for me from the MySQL DB prompt:
	SET PASSWORD = PASSWORD('your_new_password');

-- Source: http://stackoverflow.com/questions/33467337/reset-mysql-root-password-using-alter-user-statement-after-install-on-mac

-- This syntax enables changing your own password without naming your account literally.
	ALTER USER USER() IDENTIFIED BY 'auth_string';

-- This statement changes the password for jeffrey but leaves that for jeanne unchanged. For both accounts, connections are required to use SSL and -- each account can be used for a maximum of two simultaneous connections:
	ALTER USER
  	'jeffrey'@'localhost' IDENTIFIED BY 'new_password',
  	'jeanne'@'localhost'
  	REQUIRE SSL WITH MAX_USER_CONNECTIONS 2;

-- Example 1: Change an account's password and expire it. As a result, the user must connect with the named password and choose a new one at the next connection:
	ALTER USER 'jeffrey'@'localhost'
  	IDENTIFIED BY 'new_password' PASSWORD EXPIRE;

-- Example 2: Modify an account to use the sha256_password authentication plugin and the given password. Require that a new password be chosen every 180 days:
	ALTER USER 'jeffrey'@'localhost'
  	IDENTIFIED WITH sha256_password BY 'new_password'  (SHA256 may require an SSL connection on some systems)
  	PASSWORD EXPIRE INTERVAL 180 DAY;

-- Example 3: Lock or unlock an account:
	ALTER USER 'jeffrey'@'localhost' ACCOUNT LOCK;
		ALTER USER 'jeffrey'@'localhost' ACCOUNT UNLOCK;

-- Example 4: Require an account to connect using SSL and establish a limit of 20 connections per hour:
	ALTER USER 'jeffrey'@'localhost'
  	REQUIRE SSL WITH MAX_CONNECTIONS_PER_HOUR 20;

-- http://dev.mysql.com/doc/refman/5.7/en/alter-user.html
