/*
INSERT INTO ANOTHER TABLE FROM CURRENT TABLE
You can make an empty version (copy) of a table by using CREATE TABLE.
Example:
*/
CREATE TABLE secondtable LIKE firsttable;

-- This example inserts two columns into the secondtable table from the firsttable table.

insert into secondtable (column1, column2) select column1, column2 from firsttable;

