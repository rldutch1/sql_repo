#<a href='https://technet.microsoft.com/en-us/library/ms190273(v=sql.105).aspx'>Source</a>

-- Change datatype:
	alter table tablename alter column columnname varchar(100) not null;

-- Dropping a column:
	alter table tablename drop column columnname;

-- Adding a column:
alter table tablename add columnname varchar(20) null;

-- Adding a column with a constraint:
	alter table tablename add columnname varchar(20) null
    constraint constraintname unique;

-- Adding an unverified CHECK constraint to an existing column
	The following example adds a constraint to an existing column in the table.
	The column has a value that violates the constraint.
	Therefore, WITH NOCHECK is used to prevent the constraint from being validated
	against existing rows, and to allow for the constraint to be added.

	alter table tablename with nocheck
	add constraint constraintname check (columnname > 1);

-- Adding a default value or constraint to an existing column:
	alter table tablename
	add constraint constraintname
	default 50 for columnname;

-- Adding several columns with constraints
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

