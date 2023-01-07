-- Find duplicate data in a column.

SELECT column1, COUNT(*) c FROM tablename GROUP BY column1 HAVING c > 1;

