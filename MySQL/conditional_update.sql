create table test (
id int not null auto_increment primary key,
name varchar(50),
age tinyint
) engine = myisam;

insert into test (name) values (‘jim’),(‘john’),(‘paul’),(‘mike’);

– The age field is now NULL.
select * from test;

update test
set age =
case
when name = ‘jim’ then 10
when name = ‘paul’ then 20
else 30
end;

– The age field now has data.
select * from test;
