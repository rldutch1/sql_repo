#<a href='https://technet.microsoft.com/en-us/library/ms190273(v=sql.105).aspx'>Source</a>

--* Change datatype:
	alter table tablename alter column columnname varchar(100) not null;

--* Dropping a column:
	alter table tablename drop column columnname;

--* Adding a column:
	alter table tablename add columnname varchar(20) null;

--* Adding a column with a constraint:
	alter table tablename add columnname varchar(20) null
    constraint constraintname unique;

--* Adding a unique constraint to an existing column.
	alter table tablename add constraint constraintname unique([column name]);
	Examples:
		alter table dbo.MasterMedlist_20170929_A add constraint ordmed_id unique([order med id]);
		alter table ecoach add constraint rh_updt_dt_tm default getdate() for updt_dt_tm; --Column has to be datetime, cannot be timestamp.
		alter table domain add constraint domainunique unique (domain_name);

--* Dropping a contraint:
	alter table tablename drop constraint constraintname;

--Add multiple columns in table
--You can use the ALTER TABLE statement in SQL Server to add multiple columns to a table.
--Syntax
--The syntax to add multiple columns to an existing table in SQL Server (Transact-SQL) is:

	ALTER TABLE table_name
  	ADD column_1 column-definition,
    column_2 column-definition,
    ...
    column_n column_definition;

--Example
--Let's look at an example that shows how to add multiple columns to a table in SQL Server using the ALTER TABLE statement.
--For example:

	ALTER TABLE employees ADD last_name VARCHAR(50), first_name VARCHAR(40);
--This SQL Server ALTER TABLE example will add two columns, last_name as a VARCHAR(50) field and first_name as a VARCHAR(40) field to the employees table.

--* Adding an unverified CHECK constraint to an existing column
	The following example adds a constraint to an existing column in the table.
	The column has a value that violates the constraint.
	Therefore, WITH NOCHECK is used to prevent the constraint from being validated
	against existing rows, and to allow for the constraint to be added.

	alter table tablename with nocheck
	add constraint constraintname check (columnname > 1);

--* Adding a default value or constraint to an existing column:
	alter table tablename
	add constraint constraintname
	default 50 for columnname;

--* Adding several columns with constraints
	The following example adds several columns with constraints defined with the new column.
	The first new column has an IDENTITY property.
	Each row in the table has new incremental values in the identity column.

	CREATE TABLE tablename ( columnname INT CONSTRAINT constraintname UNIQUE) ;
	GO

--* Add a PRIMARY KEY identity column.
	ALTER TABLE tablename ADD
	newcolumn INT IDENTITY
	CONSTRAINT newcolumn_pk PRIMARY KEY,

--* Add a column that references another column in the same table.
	ALTER TABLE tablename ADD
	newcolumn INT NULL
	CONSTRAINT newcolumn_fk
	REFERENCES tablename(columnname),

--* Add a column that references another column in another table.
alter table this_tablename add constraint FK_Name foreign key (this_tablename_column)
references another_table (another_table_column) on delete cascade on update cascade

--* Add a column with a constraint to enforce that
--* nonnull data is in a valid telephone number format.
	ALTER TABLE tablename ADD
	newcolumn VARCHAR(16) NULL
	CONSTRAINT newcolumn_chk
	CHECK
	(newcolumn LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]' OR
	newcolumn LIKE
	'([0-9][0-9][0-9]) [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),

--* Add a nonnull column with a default.
	ALTER TABLE tablename ADD
	newcolumn DECIMAL(3,3)
	CONSTRAINT newcolumn_default
	DEFAULT .081 ;
	GO
	EXEC sp_help tablename ;
	GO
	DROP TABLE tablename ;
	GO

--Rename column in table
--You can not use the ALTER TABLE statement in SQL Server to rename a column in a table. However, you can use sp_rename, though Microsoft recommends that you drop and recreate the table so that scripts and stored procedures are not broken.
--Syntax
--The syntax to rename a column in an existing table in SQL Server (Transact-SQL) is:

	exec sp_rename 'table_name.old_column_name', 'new_column_name', 'COLUMN';
	--You will probably see a warning message that renaming a table can break scripts and stored procedures.

--Example
--Let's look at an example that shows how to rename a column in a table in SQL Server using sp_rename.
--For example:

	sp_rename 'employees.last_name', 'lname', 'COLUMN';
--This SQL Server example will use sp_rename to rename the column in the employees table from last_name to lname.

--Rename table
--You can not use the ALTER TABLE statement in SQL Server to rename a table. However, you can use sp_rename, though Microsoft recommends that you drop and recreate the table so that scripts and stored procedures are not broken.
--Syntax
--The syntax to rename a table in SQL Server (Transact-SQL) is:

	sp_rename 'old_table_name', 'new_table_name';

--Example
--Let's look at an example that shows how to rename a table in SQL Server using sp_rename.
--For example:

	sp_rename 'employees', 'emps';
--This SQL Server example will use sp_rename to rename the employees table to emps.

--Source: https://www.techonthenet.com/sql_server/tables/alter_table.php

--View "Describe" type information about the table.
	exec sp_columns tablename;
