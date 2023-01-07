CREATE USER 'monty'@'localhost' IDENTIFIED BY 'some_pass';

GRANT ALL PRIVILEGES ON *.* TO 'monty'@'localhost'
WITH GRANT OPTION;

CREATE USER 'monty'@'%' IDENTIFIED BY 'some_pass';
GRANT ALL PRIVILEGES ON *.* TO 'monty'@'%'
WITH GRANT OPTION;

CREATE USER 'admin'@'localhost';

GRANT RELOAD,PROCESS ON *.* TO 'admin'@'localhost';

CREATE USER 'dummy'@'localhost';

MySQL 8.0.X.X. Grant superuser privileges:
use mysql;
UPDATE `user` SET `Select_priv` = 'Y', `Insert_priv` = 'Y', `Update_priv` = 'Y', `Delete_priv` = 'Y', `Create_priv` = 'Y', `Drop_priv` = 'Y', `Reload_priv` = 'Y', `Shutdown_priv` = 'Y', `Process_priv` = 'Y', `File_priv` = 'Y', `Grant_priv` = 'Y', `References_priv` = 'Y', `Index_priv` = 'Y', `Alter_priv` = 'Y', `Show_db_priv` = 'Y', `Super_priv` = 'Y', `Create_tmp_table_priv` = 'Y', `Lock_tables_priv` = 'Y', `Execute_priv` = 'Y', `Repl_slave_priv` = 'Y', `Repl_client_priv` = 'Y', `Create_view_priv` = 'Y', `Show_view_priv` = 'Y', `Create_routine_priv` = 'Y', `Alter_routine_priv` = 'Y', `Create_user_priv` = 'Y', `Event_priv` = 'Y', `Trigger_priv` = 'Y', `Create_tablespace_priv` = 'Y', `Create_role_priv` = 'Y', `Drop_role_priv` = 'Y' WHERE `user`.`Host` = '%' AND `user`.`User` = 'rob';

MySQL 8.0.X.X. Create user with mysql_native_password authentication;
CREATE USER username@localhost identified with mysql_native_password by 'password';

https://lefred.be/content/how-to-grant-privileges-to-users-in-mysql-8-0/
Grant Privileges for a user to a database;
grant alter,create,delete,drop,index,insert,select,update,trigger,alter routine,
create routine, execute, create temporary tables on user1.* to 'user1';

grant alter,create,delete,drop,index,insert,select,update,trigger,alter routine,
create routine, execute, create temporary tables on hillc1.* to 'robdba5';