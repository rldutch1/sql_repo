-- Create Index (https://msdn.microsoft.com/en-us/library/ms188783.aspx):
-- Create a nonclustered index on a table or view
	CREATE INDEX i1 ON t1 (col1);

--Create a clustered index on a table and use a 3-part name for the table
	CREATE CLUSTERED INDEX i1 ON d1.s1.t1 (col1);

-- Create a nonclustered index with a unique constraint on 3 columns and specify the sort order for each column
	CREATE UNIQUE INDEX i1 ON t1 (col1 DESC, col2 ASC, col3 DESC);

-- Create default value constraint:
	alter table tablename add column_name int null constraint constraint_name default '1';
	--Example:
	alter table domain add active_ind int null constraint active_ind_dom default '1';

