/*
drop database lastinsert_id;
create database lastinsert_id;
use lastinsert_id;
create table foo (id int(11) auto_increment primary key
, text varchar(50) not null)engine=innodb;

create table foo2 (id int(11) auto_increment primary key
, foo_id int(11) not null, text varchar(50) not null)engine=innodb;
*/

-- https://dev.mysql.com/doc/c-api/5.6/en/getting-unique-id.html

INSERT INTO foo (id,text)
    VALUES(NULL,'filename');         # generate ID by inserting NULL
INSERT INTO foo2 (id,foo_id,text)
    VALUES(NULL,LAST_INSERT_ID(),'last_insert_id.sql');  # use ID in second table


-- Using PDO:
-- https://stackoverflow.com/questions/10680943/pdo-get-the-last-id-inserted
$stmt = $db->prepare("...");
$stmt->execute();
$id = $db->lastInsertId();
If you want to do it with SQL instead of the PDO API, you would do it like a normal select query:

$stmt = $db->query("SELECT LAST_INSERT_ID()");
$lastId = $stmt->fetchColumn();
