-- LOAD XML LOCAL INFILE '/pathtofile/file.xml' 
-- INTO TABLE my_tablename(personal_number, firstname, lastname, email, start_time, end_time, employee_category); 


LOAD XML LOCAL INFILE 'xml_db.xml' 
INTO TABLE xmlimport(personal_number, firstname, lastname, email, start_time, end_time, employee_category); 

/*
create table xmlimport (id int(11) unsigned auto_increment primary key
,personal_number varchar(5) not null
,firstname varchar(100) not null
,lastname varchar(100) not null
,email varchar(100) not null
,start_time varchar(15) not null
,end_time varchar(15) not null
,employee_category varchar(100)
) engine=myisam;
*/