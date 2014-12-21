/*
From the mysql command prompt you can create an output file formatted with comma delimiters and fields enclosed by quotes.

select * into outfile 'outputfilename.txt' fields terminated by ',' optionally enclosed by '"' lines terminated by '\n' from yourtablename where columnname = 'whatever';

The file will be located in the database folder. In my case (Fedora 12) it was located in /var/lib/mysql/play/nfaweapons.txt.

From outside of the mysql command prompt (ie. the command line) you can also run a query and create an output file with the results of that query.

Create a query that you want to run and save it as an .sql file. This example uses macaddress.sql.

The content of the test.sql file looks like this:
	select * from tablename;

To run test.sql type one of the following:

-- Tab delimited output format (default):
mysql databasename -u username -p < test.sql > output.tab

-- XML output format:
mysql databasename -u username -p --xml < test.sql > output.xml

-- If you don't want to create the test.sql file and just want to run everything from one commandline statement and get XML output:
mysql -u username -p --xml -e 'use databasename; select * from tablename' > output.xml

-- You can also put the db_name in your script to avoid typing it on the command line.
mysql -u username -p --xml < test.sql > output.xml

-- To Dump a database to a file and generate full insert statments:
mysqldump -p -c -e databasename > DatabaseName.sql

-- To dump a table from a database and generate full insert statements:
mysqldump -p -c -e databasename tablename > TableName.sql

-- To dump all databases on the database server:
mysqldump -p -c -e --all-databases > AllDatabases.sql

-- The contents of test.sql without the database name.
select * from tablename order by columnName;

-- The contents of test.sql with the database name.
use database;
select * from tablename order by columnName;

*/