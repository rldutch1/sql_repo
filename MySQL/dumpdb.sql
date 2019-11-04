https://dev.mysql.com/doc/refman/5.5/en/mysqldump.html

create database newdb;
mysqldump -u user -ppass -d olddb | mysql -u user -ppass -D newdb
The new database must already exist. The -d flag in the mysqldump command prevents copying of data.

Copying data from one MySQL server to another:
	mysqldump --opt thenameofthedatabase | mysql --host=remote_host -C thenameofthedatabase

Dump a skeleton of the database to a file (Auto increment will still exist). Example: AUTO_INCREMENT=420. Search for "AUTO_INCREMENT=".
	mysqldump -u rob -p --routines --no-data thedatabasename > thedatabasefilename.sql

dumpDB
	mysqldump -p -c -e thenameofthedatabase  > thenameofthedatabasedumpfile.sql

dumpTB
	mysqldump -p -c -e thenameofthedatabase thenameofthetable > thenameofthe.DB.tablefilename.sql

dumpAll
	mysqldump -p -c -e --all-databases > thenameofthe.DB.Server.AllDatabases.sql

Dump several databases with one command:
	mysqldump --databases db_name1 [db_name2 ...] > my_databases.sql

Dump database from a DB server using a different port:
mysqldump -uroot -ppassword -hthenameofthe.DB.Server -P3307 thenameofthedatabase > thenameofthedatabasedumpfile.sql

You can load the dump file back into the server like this:
	mysql thenameofthedatabase < thenameofthedatabasedumpfile.sql

	or like this
	mysql -e "source /path-to-backup/thenameofthedatabasedumpfile.sql" thenameofthedatabase

For InnoDB tables, mysqldump provides a way of making an online backup:
	mysqldump --all-databases --master-data --single-transaction > all_databases.sql

MySQL 8.0 https://dev.mysql.com/doc/refman/8.0/en/mysqldump.html
Note
A dump made using PowerShell on Windows with output redirection creates a file that has UTF-16 encoding:

	mysqldump [options] > dump.sql
However, UTF-16 is not permitted as a connection character set (see Impermissible Client Character Sets), so the dump file will not load correctly. To work around this issue, use the --result-file option, which creates the output in ASCII format:

	mysqldump [options] --result-file=dump.sql
	
