-- MySQL Triggers Tutorial

-- #1075 - Incorrect table definition; there can be only one auto column and it must be defined as a key.

/*
create table employees_inserted (id int(11) unsigned auto_increment primary key
, last_inserted timestamp not null
);

*/

-- alter table employees_inserted add column e_id int(11) not null after id;

drop trigger insert_attempt;
create trigger insert_attempt after insert on employees
for each row 
	insert into employees_inserted (e_id, last_inserted) values ((last_insert_id()+1),default);
	
insert into test (firstname, lastname) values ('Joe','Mamma');insert into test1 (t_id) values (last_insert_id());
insert into test (firstname, lastname) values ('Ho','Mamma');insert into test1 (t_id) values (last_insert_id());
insert into test (firstname, lastname) values ('Blow','Mamma');insert into test1 (t_id) values (last_insert_id());
insert into test (firstname, lastname) values ('No','Mamma');insert into test1 (t_id) values (last_insert_id());
insert into test (firstname, lastname) values ('Know','Mamma');insert into test1 (t_id) values (last_insert_id());
insert into test (firstname, lastname) values ('Go','Mamma');insert into test1 (t_id) values (last_insert_id());
insert into test (firstname, lastname) values ('So','Mamma');insert into test1 (t_id) values (last_insert_id());
insert into test (firstname, lastname) values ('Grow','Mamma');insert into test1 (t_id) values (last_insert_id());
insert into test (firstname, lastname) values ('Bow','Mamma');insert into test1 (t_id) values (last_insert_id());
insert into test (firstname, lastname) values ('Doe','Mamma');insert into test1 (t_id) values (last_insert_id());
insert into test (firstname, lastname) values ('Dough','Mamma');insert into test1 (t_id) values (last_insert_id());
insert into test (firstname, lastname) values ('Faux','Mamma');insert into test1 (t_id) values (last_insert_id());
insert into test (firstname, lastname) values ('Throw','Mamma');insert into test1 (t_id) values (last_insert_id());

drop trigger insert_into_test1;

drop table if exists test;
CREATE TABLE `test` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=myisam;

drop table if exists test1;
CREATE TABLE `test1` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `t_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=myisam;

create trigger insert_into_test1 after insert on test
for each row
insert into test1 (t_id) values ((last_insert_id())+1);


insert into test (firstname, lastname) values ('One','One');
insert into test (firstname, lastname) values ('Two','One');
insert into test (firstname, lastname) values ('Three','One');
insert into test (firstname, lastname) values ('Four','One');
insert into test (firstname, lastname) values ('Five','One');
insert into test (firstname, lastname) values ('Six','One');
