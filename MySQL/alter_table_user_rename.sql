-- Rename a table column named tasklist to entry.
ALTER TABLE tablename CHANGE column1 column1newname MEDIUMTEXT NOT NULL

-- ALTER THE COLUMN DEFINITION
alter table tablename modify column1 timestamp not null default current_timestamp on update current_timestamp

-- ALTER TABLE COMMENT
ALTER TABLE  `weapons` CHANGE  `active_ind`  `active_ind` TINYINT( 1 ) UNSIGNED NOT NULL DEFAULT  '0' COMMENT  '1 Disposed, 0 Not Disposed'

/*
		Note: Everything after the column name is ths same as
		creating a column.
		Also you can use "change" instead of modify.
*/
-- Adding a colum to a table:
ALTER TABLE tablename add column columnname varchar(100) not null after id;

-- Making a column unique:
ALTER TABLE tablename add unique (column1);

-- Giving the unique index a name:
ALTER TABLE tablename add unique uniquename (column1);

/*
Also you might get ERROR 1062 Duplicate entry '' for key ??? if
the column you are trying to make unique, already has duplicate data. This includes
NULL and spaces.
*/

-- Removing the unique index:
ALTER TABLE tablename drop index column1; /* <-- Notice the missing parenthesis. */

-- Rename a MySQL table. The "to" keyword is part of the command.
rename table oldtable to newtable;

-- Rename a Database;
For InnoDB, the following seems to work: create the new empty database, then rename each table in turn into the new database:

RENAME TABLE old_db.table TO new_db.table;
You will need to adjust the permissions after that.

For scripting in a shell, you can use either of the following:

mysql -u username -ppassword old_db -sNe 'show tables' | while read table; \
    do mysql -u username -ppassword -sNe "rename table old_db.$table to new_db.$table"; done
Or

for table in `mysql -u root -s -N -e "show tables from old_db"\`; do mysql -u root -s -N -e "rename table old_db.$table to new_db.$table"; done;`
Notes: there is no space between the option -p and the password. If your database has no password, remove the -u username -ppassword part.

Also, if you have stored procedures, you can copy them afterwards:

mysqldump -R old_db | mysql new_db

-- Remove the primary key:
-- Without an index, maintaining an autoincrement column becomes too expensive, that's why MySQL requires an autoincrement column to be a leftmost part of an index.
-- You should remove the autoincrement property before dropping the key:

ALTER TABLE tablename MODIFY id INT NOT NULL;
ALTER TABLE tablename DROP PRIMARY KEY;

-- ALTER USER ==
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
