/*
https://technet.microsoft.com/en-us/library/ms189612(v=sql.105).aspx

	db_owner - Members of the db_owner fixed database role can perform all configuration and maintenance activities on the database, and can also drop the database.
	db_securityadmin - Members of the db_securityadmin fixed database role can modify role membership and manage permissions. Adding principals to this role could enable unintended privilege escalation.
	db_accessadmin - Members of the db_accessadmin fixed database role can add or remove access to the database for Windows logins, Windows groups, and SQL Server logins.
	db_backupoperator - Members of the db_backupoperator fixed database role can back up the database.
	db_ddladmin - Members of the db_ddladmin fixed database role can run any Data Definition Language (DDL) command in a database.
	db_datawriter - Members of the db_datawriter fixed database role can add, delete, or change data in all user tables.
	db_datareader - Members of the db_datareader fixed database role can read all data from all user tables.
	db_denydatawriter - Members of the db_denydatawriter fixed database role cannot add, modify, or delete any data in the user tables within a database.
	db_denydatareader - Members of the db_denydatareader fixed database role cannot read any data in the user tables within a database.
*/

/*Create login information: https:msdn.microsoft.com/en-us/library/ms173463.aspx*/
create login greaseboard with password = 'greaseboard'
use AutoIT;
create user greaseboard for login greaseboard
with default_schema = AutoIT;

/*I used the greaseboard user and logged in using Excel and I could not see the tables until I added db_datareader and db_datawriter.*/
use autoit;
exec sp_addrolemember 'db_datareader', greaseboard;
exec sp_addrolemember 'db_datawriter', greaseboard;

