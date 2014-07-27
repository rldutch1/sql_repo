/*
drop database lastinsert_id;
create database lastinsert_id;
use lastinsert_id;
create table foo (id int(11) auto_increment primary key
, text varchar(50) not null)engine=myisam;

create table foo2 (id int(11) auto_increment primary key
, foo_id int(11) not null, text varchar(50) not null)engine=myisam;
*/

-- http://dev.mysql.com/doc/refman/5.0/en/getting-unique-id.html

INSERT INTO foo (id,text)
    VALUES(NULL,'filename');         # generate ID by inserting NULL
INSERT INTO foo2 (id,foo_id,text)
    VALUES(NULL,LAST_INSERT_ID(),'last_insert_id.sql');  # use ID in second table
