-- User Stored Procedure - usp_
create procedure usp_procedurename1
as
select
	column1
	, column2
	, column3
from
	tablename t
where
	t.column2 = 'blah'
order by
	t.column1

-- To run the procedure type:
	exec usp_procedurename1;


-- User Stored Procedure with parameter.
-- Use @parametername for the parameter.
create procedure usp_procedurename2 @column2 varchar(100)
as
select
	column1
	, column2
	, column3
from
	tablename t
where
	t.column2 = @column2
order by
	t.column1

-- To run the procedure type:
	exec usp_procedurename2 @column2 = 'Jinglebells';


-- User Stored Procedure with wildcard parameter.
-- Use @parametername for the parameter.
create procedure usp_procedurename2 @column2 varchar(100)
as
select
	column1
	, column2
	, column3
from
	tablename t
where
	t.column2 like '%' + @column2 + '%'
order by
	t.column1

-- To run the procedure type:
	exec usp_procedurename2 @column2 = 'Jingle';

/*
You have to explicitly specify parameter names when executing
stored procedure and pass in null for those you want to leave out.

Example:
	If I had a stored procedure with multiple (3) parmeters and I only wanted
	to update one of the parmeters, I would still have to put the parameters
	in my execution statement and enter NULL for the value.
*/

exec usp_CoolStoredProcedure @column1 = 'data', @column2 = NULL, @column3 = NULL;
