
/*
-- Change user password.
-- Find current user: SELECT CURRENT_USER();
//Database Username: root
//Database Password: thepassword
//----------------------------------------------------------------------------
*/

use mysql;
-- Method 1 (Deprecated):
update mysql.user set password('thepassword') where user = 'root';
FLUSH PRIVILEGES;

-- Method 2 (MySQL 5.7+):
update mysql.user set authentication_string=PASSWORD('thepassword') where user='root';
FLUSH PRIVILEGES;

-- Method 3 (Preferred method for current user.):
alter user set password = 'thepassword';
FLUSH PRIVILEGES;

-- MySQL 5.7:
alter user 'root'@'localhost' identified by 'thepassword';
alter user 'root'@'%' identified by 'thepassword';

-- Method 4 (Preferred method for another user.):
alter user set password for 'root'@'localhost' = 'thepassword';
FLUSH PRIVILEGES;

-- Remote user password change:
alter user set password for 'root'@'%' = 'thepassword';
FLUSH PRIVILEGES;
