/* Shows how to select a varchar as an integer and vice-versa.*/

-- Code Snippet
SELECT (CAST Col1 AS int) AS Col1

and if you need it to be back into character format....

-- Code Snippet
SELECT (CAST(CAST Col1 AS int) AS varchar(length)) AS Col1

-- In this example, the ID column is an integer and I needed it to be a string before I concatinated the two columns.
-- There is no "Concat" feature in MSSQL before version 2012. Below is how to concatinate two columns.
select (cast(id as varchar(200)) + ' - ' + dta) as "Concatinated" from dta_search;


-- This method uses the plus sign without casting. It is the old school way that I did it many moons ago:
select [columnname], 'blah', 'blah', 'blah', [columnname] from vw_tablename order by columnname;
