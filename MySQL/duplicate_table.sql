--Create a duplicate or copy of a table from an original table.
	CREATE TABLE new_table AS SELECT * FROM original_table;

or 

--This will create an empty skeleton of the original table.
	CREATE TABLE new_table LIKE original_table; 
then

--This will insert data into the new table from the original table.
	INSERT INTO new_table SELECT * FROM original_table; 
