MySQL 8.0 has the load data local_infile option off by default. You can enable it by logging into the MySQL server and running:
mysql> show global variables like 'local_infile';
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| local_infile  | OFF   |
+---------------+-------+
1 row in set (0.01 sec)

mysql> set global local_infile = true;
Query OK, 0 rows affected (0.00 sec)

mysql> show global variables like 'local_infile';
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| local_infile  | ON    |
+---------------+-------+
1 row in set (0.00 sec)

Afterward, you will have to start the MySQL client with:
/usr/local/mysql/bin/mysql -u USERNAME -p --local-infile DATABASENAME
Source: https://stackoverflow.com/questions/10762239/mysql-enable-load-data-local-infile

-- From the MySQL command prompt.
-- It is easier to have the file you want to import located in the same directory where you start mysql. Then run load data local infile once you log in.
-- I loaded the exported Bedrock .csv files into a database using the following:

/* The database and table.
create database bedrock;
use bedrock;
if exist drop table bedrock_csv;
create table bedrock_csv (id int(11) unsigned auto_increment primary key,
audit_type varchar(500) null,
topic_name varchar(500) null,
filter_sequence varchar(500) null,
filter_meaning varchar(500) null,
filter_type_meaning varchar(500) null,
filter_name varchar(500) null,
flex_display varchar(500) null,
saved_value varchar(500) null,
description varchar(500) null,
event_set_name varchar(500) null,
code_value_id varchar(500) null,
value_type varchar(500) null,
value_sequence varchar(500) null,
value_group_sequence varchar(500) null,
qualifier varchar(500) null,
map_type varchar(500) null,
mapped_to_code_1 varchar(500) null,
mapped_to_description_1 varchar(500) null,
mapped_to_code_2 varchar(500) null,
mapped_to_description_2 varchar(500) null,
last_update_date_time varchar(500) null,
last_update_by varchar(500) null
) engine=innodb;
*/

-- I combined all of the exported Bedrock .csv files into one large file called allfiles.dat by using sed to remove the first header row.
-- Example: sed '1d' Exported_CSV_FILE.csv >> allfiles.dat
-- http://unix.stackexchange.com/questions/96226/delete-first-line-of-a-file

load data local infile 'allfiles.dat' into table bedrock_csv fields terminated by ',' enclosed by '"' lines terminated by '\n' (audit_type, topic_name, filter_sequence, filter_meaning, filter_type_meaning, filter_name, flex_display, saved_value, description, event_set_name, code_value_id, value_type, value_sequence, value_group_sequence, qualifier,  map_type, mapped_to_code_1, mapped_to_description_1, mapped_to_code_2, mapped_to_description_2, last_update_date_time, last_update_by);

load data infile 'allfiles.dat' replace into table bedrock_csv;

-- Using the local keyword helped me get past the error message: "The MySQL server is running with the --secure-file-priv option so it cannot execute this statement".
-- https://stackoverflow.com/questions/32737478/how-should-i-tackle-secure-file-priv-in-mysql
load data local infile 'US_States.csv' into table us_states fields terminated by '|' lines terminated by '\n' (state,abbreviation,capital,largest_city,established,population,sq_mi,sq_km,land_area_mi,land_area_km,water_area_mi,water_area_km,representatives);

/*Another example:
I was stuck on a problem where the ImportXML3.xml file would not get imported into the database because
the XML tag names were in different case on some of the lines. Once I made them the same case it was imported.
--
This online link was helpful. http://dev.mysql.com/doc/refman/5.5/en/load-xml.html
This statement supports three different XML formats:

Column names as attributes and column values as attribute values:
  <row column1="value1" column2="value2" .../>

Column names as tags and column values as the content of these tags:
  <row>
    <column1>value1</column1>
    <column2>value2</column2>
    </row>

Column names are the name attributes of <field> tags, and values are the contents of these tags:
  <row>
    <field name='column1'>value1</field>
    <field name='column2'>value2</field>
    </row>
This is the format used by other MySQL tools, such as mysqldump.

All three formats can be used in the same XML file; the import routine automatically detects the format for each row and interprets it correctly. Tags are matched based on the tag or attribute name and the column name.
*/

LOAD XML LOCAL INFILE 'ImportXML3.xml'
INTO TABLE xmlimport3
ROWS IDENTIFIED BY '<myfields>';

/*The ImportXML3.xml file looks like this:
<rlh>
<myfields><lastname>firstname01</lastname><firstname>lastname01</firstname></myfields>
<myfields><lastname>firstname02</lastname><firstname>lastname02</firstname></myfields>
<myfields><lastname>firstname03</lastname><firstname>lastname03</firstname></myfields>
<myfields><lastname>firstname04</lastname><firstname>lastname04</firstname></myfields>
<myfields><lastname>firstname05</lastname><firstname>lastname05</firstname></myfields>
<myfields><lastname>firstname06</lastname><firstname>lastname06</firstname></myfields>
<myfields><lastname>firstname07</lastname><firstname>lastname07</firstname></myfields>
<myfields><lastname>firstname08</lastname><firstname>lastname08</firstname></myfields>
<myfields><lastname>firstname09</lastname><firstname>lastname09</firstname></myfields>
<myfields><lastname>firstname10</lastname><firstname>lastname10</firstname></myfields>
<myfields><lastname>firstname11</lastname><firstname>lastname11</firstname></myfields>
<myfields><lastname>firstname12</lastname><firstname>lastname12</firstname></myfields>
<myfields><lastname>firstname13</lastname><firstname>lastname13</firstname></myfields>
<myfields><lastname>firstname14</lastname><firstname>lastname14</firstname></myfields>
<myfields><lastname>firstname15</lastname><firstname>lastname15</firstname></myfields>
<myfields><lastname>firstname16</lastname><firstname>lastname16</firstname></myfields>
<myfields><lastname>firstname17</lastname><firstname>lastname17</firstname></myfields>
</rlh>
*/
