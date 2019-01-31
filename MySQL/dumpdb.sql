create database newdb;
mysqldump -u user -ppass -d olddb | mysql -u user -ppass -D newdb
The new database must already exist. The -d flag in the mysqldump command prevents copying of data.

Dump a skeleton of the database to a file (Auto increment will still exist). Example: AUTO_INCREMENT=420. Search for "AUTO_INCREMENT=".
	mysqldump -u rob -p --routines --no-data thedatabasename > thedatabasefilename.sql

dumpDB
	mysqldump -p -c -e thenameofthedatabase  > thenameofthedatabasedumpfile.sql

dumpTB
	mysqldump -p -c -e thenameofthedatabase thenameofthetable > thenameofthe.DB.tablefilename.sql

dumpAll
	mysqldump -p -c -e --all-databases > thenameofthe.DB.Server.AllDatabases.sql

