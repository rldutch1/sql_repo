-- The_Basics_of_MySQL_Stored_Procedures.pdf
-- https://www.sqlshack.com/learn-mysql-the-basics-of-mysql-stored-procedures/
-- https://phoenixnap.com/kb/mysql-stored-procedure#:~:text=MySQL%20stored%20procedures%20are%20pre,any%20additional%20runtime%2Denvironment%20packages.

-- http://dev.mysql.com/doc/connector-net/en/connector-net-tutorials-stored-procedures.html

-- To view all procedures.
	show procedure status;

-- Create view to show all procedures in a database:
    create view vw_showprocedures as 
    SELECT 
        routine_name
    FROM
        information_schema.routines
    WHERE
        routine_type = 'PROCEDURE'
    AND routine_schema = 'test';

-- Stored procedure with parameter.
DELIMITER //
CREATE PROCEDURE sersearch
(IN sese CHAR(200)) /* The sese is the parameter. Make it the same data type as the field it represents.*/
BEGIN
  SELECT software, license, ownername FROM serials
  WHERE software like sese;
END //
DELIMITER ;

-- To execute the stored procedure use the following syntax:
	call procedurename ('parametername');

-- Example, type:
	call sersearch ('Adobe%'); -- Can use the wildcard in the datafield when searching.

-- Stored procedure with no parameter.
DELIMITER //
CREATE PROCEDURE sersearch
() /* The parenthesis must be present but empty for no parameter.*/
BEGIN
  SELECT software, license, ownername FROM serials;
END //
DELIMITER ;

-- To execute the stored procedure use the following syntax:
	call procedurename;

-- Example, type:
	call sersearch; -- No parameter.

-- Troubleshooting:
	I made a mistake creating a procedure because I forgot to make the parameter that I used in the query the same name as I defined it.

-- Create procedure with multiple parameters.
DELIMITER //
DROP PROCEDURE IF EXISTS updtjournal//
CREATE PROCEDURE updtjournal
(
in udj mediumtext
,in upid int(11)
)
BEGIN
	UPDATE robdba5.journal4 SET entry = udj WHERE journal4.id = upid;
END //
DELIMITER ;

-- Call procedure with multiple parameters.
	call updtjournal ('Hello Robert Holland',3879);
