use iviewphase4;
select * from searchterms where term like '%meal%';
select * from searchterms where term like '%[%]%'; -- Searching for the %.
select * from searchterms where code_snippet like '%\\\%'; -- Searching for a "\" in MySQL.

-- insert into test (col1, col2) values ('%','H%');
select * from test where col1 like '%[%]';

select top(10)* from code_snippet where term like '%[%]%';


chalk on the driveway.
washing the car - play
bicycles to brother-in-laws - croquet.
