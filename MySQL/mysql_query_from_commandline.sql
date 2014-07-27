/*
You will be prompted for your credentials after each command.
Generate tab delimited output (Default):
*/

mysql databasename -u username -p < test.sql > output.tab

-- Generate XML Output:

mysql databasename -u username -p --xml < test.sql > output.xml

-- This method puts all the commands on one line.

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

-- Connect to remote database.
mysql -h mysql.example.com -u root -p

-- Connect to a remote database server and directly to a database on that server.
mysql -h databaseserver -u databaseuser -p -D databasename

