
-- From the mysql command prompt you can create an output file formatted with comma delimiters and fields enclosed by quotes. The mysql user must have privileges to the output file location.
select * into
outfile 'outputfilename.txt'
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\n'
from yourtablename
where columnname = 'whatever';

-- If no path is specified, the file will be located in the default database folder. In my case (Fedora 12) it was located in /var/lib/mysql/play/filename.txt.

-- You can specify where the output file will go:
SELECT id,
   client,
   project,
   task,
   description,
   time,
   date
  INTO OUTFILE '/path/to/file.csv' --mysql user must have privileges to the location.
  FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
  LINES TERMINATED BY '\n'
  FROM ts


-- From outside of the mysql command prompt (ie. the command line) you can also run a query and create an output file with the results of that query.

-- Create a query that you want to run and save it as an .sql file.

-- The content of the test.sql file looks like this:
select * from tablename;

-- To run test.sql type one of the following:

-- Tab delimited output format (default):
mysql thedatabasename -u theusername -p < test.sql > output.tab

-- XML output format:
mysql thedatabasename -u theusername -p --xml < test.sql > output.xml

-- If you don't want to create the test.sql file and just want to run everything from one commandline statement and get XML output:
mysql -u theusername -p --xml -e 'use databasename; select * from tablename' > output.xml

-- You can also put the db_name in your script to avoid typing it on the command line (see below).
mysql -u theusername -p --xml < test.sql > output.xml

-- You can create a bash script named getdata and put the following in it.
mysql -u theusername -p < test.sql > test.tab
-- Then chmod +x getdata. then run it from the commandline: sh getdata.
-- You will be prompted for your password and the data will get dumped to test.tab.

-- Connect to a remote database server and directly to a database on that server.
mysql -h thehostname -u thedatabaseuser -p -D thedatabasename

-- To Dump a database to a file and generate full insert statments:
mysqldump -p -c -e thedatabasename > DatabaseName.sql

-- To dump a table from a database and generate full insert statements:
mysqldump -p -c -e thedatabasename thetablename > TableName.sql

-- To dump all databases on the database server:
mysqldump -p -c -e --all-databases > AllDatabases.sql

-- To dump all databases on the database server without the data (just a skeleton).
mysqldump -p -c -e --no-data --all-databases > AllDatabases_Skeleton.sql

-- To dump a database from a remote server:
mysqldump -h thehostname -u theusername -p -c -e thedatabasename > NameOfDatabaseDumpFile.sql

-- To dump a table from a database on a remote server:
mysqldump -h thehostname -u theusername -p -c -e thedatabasename thetablename > NameOfTableDumpFile.sql

-- To dump all databases on a remote server:
mysqldump -h thehostname -u theusername -p -c -e --all-databases > NameOfEntireDatabaseDumpFile.sql

-- The contents of test.sql without the database name.
select * from thetablename order by columnName;

-- The contents of test.sql with the database name.
use database;
select * from thetablename order by columnName;

-- Check and Repair Database
systemctl stop mariadb
myisamchk -r -q database.frm
myisamchk -r -q database.MYI
myisamchk -r -q database.MYD
systemctl start mariadb

Sometimes you will get an error when trying to create a data file:
ERROR 1290 (HY000): The MySQL server is running with the "--secure-file-priv" option so it cannot execute this statement
  
  Run the following statement to show where you are allowed to save data:
  SHOW VARIABLES LIKE "secure_file_priv";
  
  This is the path that showed when I typed the query:
  rob@localhost [stibbard]> SHOW VARIABLES LIKE "secure_file_priv";
  +------------------+-----------------------+
  | Variable_name    | Value                 |
  +------------------+-----------------------+
  | secure_file_priv | /var/lib/mysql-files/ |
  +------------------+-----------------------+
  1 row in set (0.06 sec)
  
  I adjusted my query to include the file path that was shown:
  select data into outfile '/var/lib/mysql-files/website_files.tar.gz.asc' fields terminated by ',' optionally enclosed by '"' lines terminated by '\n' from website_files where id = 1;
  
  The path was owned by the mysql user and group.
