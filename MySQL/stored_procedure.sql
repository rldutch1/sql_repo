-- http://dev.mysql.com/doc/connector-net/en/connector-net-tutorials-stored-procedures.html

DELIMITER //
CREATE PROCEDURE sersearch
(IN sese CHAR(200))
BEGIN
  SELECT software, license, ownername FROM serials
  WHERE software like sese;
END //
DELIMITER ;

-- To execute the stored procedure use the following syntax:
	call procedurename ('parametername');

-- Example, type:
	call sersearch ('Adobe%'); -- Can use the wildcard in the datafield when searching.