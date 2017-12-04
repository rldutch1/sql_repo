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
