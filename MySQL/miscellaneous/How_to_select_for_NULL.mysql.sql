Show what IS NOT NULL:
SELECT * 
FROM table 
WHERE YourColumn IS NOT NULL;

This seems to show what IS NULL:
SELECT *
FROM table 
WHERE NOT (YourColumn <=> NULL);

<a href="http://stackoverflow.com/questions/5285448/mysql-select-only-not-null-values">Source</a>

