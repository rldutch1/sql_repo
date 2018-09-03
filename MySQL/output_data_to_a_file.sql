
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
mysql databasename -u username -p < test.sql > output.tab

-- XML output format:
mysql databasename -u username -p --xml < test.sql > output.xml

-- If you don't want to create the test.sql file and just want to run everything from one commandline statement and get XML output:
mysql -u username -p --xml -e 'use databasename; select * from tablename' > output.xml

-- You can also put the db_name in your script to avoid typing it on the command line (see below).
mysql -u username -p --xml < test.sql > output.xml

-- You can create a bash script named getdata and put the following in it.
mysql -u username -p < test.sql > test.tab
-- Then chmod +x getdata. then run it from the commandline: sh getdata.
-- You will be prompted for your password and the data will get dumped to test.tab.

-- Connect to a remote database server and directly to a database on that server.
mysql -h hostname -u databaseuser -p -D databasename

-- To Dump a database to a file and generate full insert statments:
mysqldump -p -c -e databasename > DatabaseName.sql

-- To dump a table from a database and generate full insert statements:
mysqldump -p -c -e databasename tablename > TableName.sql

-- To dump all databases on the database server:
mysqldump -p -c -e --all-databases > AllDatabases.sql

-- To dump all databases on the database server without the data (just a skeleton).
mysqldump -p -c -e --no-data --all-databases > AllDatabases_Skeleton.sql

-- To dump a database from a remote server:
mysqldump -h hostname -u username -p -c -e databasename > NameOfDatabaseDumpFile.sql

-- To dump a table from a database on a remote server:
mysqldump -h hostname -u username -p -c -e databasename tablename > NameOfTableDumpFile.sql

-- To dump all databases on a remote server:
mysqldump -h hostname -u username -p -c -e --all-databases > NameOfEntireDatabaseDumpFile.sql

-- The contents of test.sql without the database name.
select * from tablename order by columnName;

-- The contents of test.sql with the database name.
use database;
select * from tablename order by columnName;

-- Check and Repair Database
systemctl stop mariadb
myisamchk -r -q database.frm
myisamchk -r -q database.MYI
myisamchk -r -q database.MYD
systemctl start mariadb
