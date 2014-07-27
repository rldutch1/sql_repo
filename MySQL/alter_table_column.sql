-- Rename a table column named tasklist to entry.
ALTER TABLE tablename CHANGE column1 column1newname MEDIUMTEXT NOT NULL

-- ALTER THE COLUMN DEFINITION
alter table tablename modify column1 timestamp not null default current_timestamp on update current_timestamp

/*
		Note: Everything after the column name is ths same as
		creating a column.
		Also you can use "change" instead of modify.
*/

-- Making a column unique:
ALTER TABLE tablename add unique (column1);

-- Giving the unique index a name:
ALTER TABLE tablename add unique uniquename (column1);

/*
Also you might get ERROR 1062 Duplicate entry '' for key ??? if
the column you are trying to make unique, already has duplicate data. This includes
NULL and spaces.
*/

-- Removing the unique index:
ALTER TABLE tablename drop index column1; /* <-- Notice the missing parenthesis. */
