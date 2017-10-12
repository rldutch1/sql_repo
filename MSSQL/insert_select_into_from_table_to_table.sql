-- If the table already exists:
insert into deleteme1 select * from TableThatHasData;
insert into deleteme1 select column1 as one, column2 as two, column3 as three from TableThatHasData;

-- If the table does not exist, you can create it on the fly:
select into NewTable from TableThatHasData;
select column1 as one, column2 as two, column3 as three into NewTable from TableThatHasData;
