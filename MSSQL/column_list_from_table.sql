-- Stored Procedure (this does not give primary key information).
	exec sp_columns YourTableNameHere;

-- Works on SQL 2008 and above. You will have to change the column names for SQL 2000.
	SELECT
	    c.name 'Column Name',
	    t.Name 'Data type',
	    c.max_length 'Max Length',
	    c.precision ,
	    c.scale ,
	    c.is_nullable,
	    ISNULL(i.is_primary_key, 0) 'Primary Key'
	FROM
	    sys.columns c
	INNER JOIN
	    sys.types t ON c.user_type_id = t.user_type_id
	LEFT OUTER JOIN
	    sys.index_columns ic ON ic.object_id = c.object_id AND ic.column_id = c.column_id
	LEFT OUTER JOIN
	    sys.indexes i ON ic.object_id = i.object_id AND ic.index_id = i.index_id
	WHERE
	    c.object_id = OBJECT_ID('YourTableNameHere')
