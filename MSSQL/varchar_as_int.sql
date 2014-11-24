/* Shows how to select a varchar as an integer and vise-versa.

Code Snippet
SELECT (CAST Col1 AS int) AS Col1

and if you need it to be back into character format....

Code Snippet
SELECT (CAST(CAST Col1 AS int) AS varchar(length)) AS Col1

