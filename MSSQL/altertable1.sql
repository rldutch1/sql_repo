/*
SQL Server: ALTER TABLE Statement
This SQL Server tutorial explains how to use the ALTER TABLE statement in SQL Server (Transact-SQL) to add a column, modify a column, drop a column, rename a column or rename a table with syntax and examples.

Description

The SQL Server (Transact-SQL) ALTER TABLE statement is used to add, modify, or drop columns in a table.
*/

--Add column in table
--You can use the ALTER TABLE statement in SQL Server to add a column to a table.
--Syntax
--The syntax to add a column in a table in SQL Server (Transact-SQL) is:

	ALTER TABLE table_name ADD column_name column-definition;
--Example
--Let's look at an example that shows how to add a column in an SQL Server table using the ALTER TABLE statement.

--For example:
	ALTER TABLE employees ADD last_name VARCHAR(50);
--This SQL Server ALTER TABLE example will add a column to the employees table called last_name.

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

	ALTER TABLE employees
  ADD last_name VARCHAR(50),
      first_name VARCHAR(40);
--This SQL Server ALTER TABLE example will add two columns, last_name as a VARCHAR(50) field and first_name as a VARCHAR(40) field to the employees table.

--Modify column in table
--You can use the ALTER TABLE statement in SQL Server to modify a column in a table.
--Syntax
--The syntax to modify a column in an existing table in SQL Server (Transact-SQL) is:

	ALTER TABLE table_name ALTER COLUMN column_name column_type;

--Example
--Let's look at an example that shows how to modify a column in a table in SQL Server using the ALTER TABLE statement.
--For example:

	ALTER TABLE employees ALTER COLUMN last_name VARCHAR(75) NOT NULL;
--This SQL Server ALTER TABLE example will modify the column called last_name to be a data type of VARCHAR(75) and force the column to not allow null values.

--Drop column in table
--You can use the ALTER TABLE statement in SQL Server to drop a column in a table.
--Syntax

--The syntax to drop a column in an existing table in SQL Server (Transact-SQL) is:

	ALTER TABLE table_name DROP COLUMN column_name;

--Example
--Let's look at an example that shows how to drop a column in a table in SQL Server using the ALTER TABLE statement.
--For example:

	ALTER TABLE employees DROP COLUMN last_name;
--This SQL Server ALTER TABLE example will drop the column called last_name from the table called employees.

--Rename column in table
--You can not use the ALTER TABLE statement in SQL Server to rename a column in a table. However, you can use sp_rename, though Microsoft recommends that you drop and recreate the table so that scripts and stored procedures are not broken.
--Syntax
--The syntax to rename a column in an existing table in SQL Server (Transact-SQL) is:

	sp_rename 'table_name.old_column_name', 'new_column_name', 'COLUMN';

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