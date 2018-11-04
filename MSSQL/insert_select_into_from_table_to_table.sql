-- If the table already exists:
insert into deleteme1 select * from TableThatHasData;
insert into deleteme1 select column1 as one, column2 as two, column3 as three from TableThatHasData;

-- If the table does not exist, you can create it on the fly:
select into NewTable from TableThatHasData;
select column1 as one, column2 as two, column3 as three into NewTable from TableThatHasData;

-- Select one row from the table if you just want to see the column names (top 0 works too):
select top 1 * from databasename.[dbo].tablename;
or
use databasename;
select top 1 from tablename;

