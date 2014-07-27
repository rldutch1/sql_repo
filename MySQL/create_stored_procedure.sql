-- Create a stored procedure that inserts 10 rows

DELIMITER $$

DROP PROCEDURE IF EXISTS insert_ten_rows $$

CREATE PROCEDURE insert_ten_rows ()
BEGIN
DECLARE crs INT DEFAULT 0;

WHILE crs < 10 DO
INSERT INTO `continent`(`name`) VALUES (‘cont’+crs);
SET crs = crs + 1;
END WHILE;
END $$

DELIMITER ;Invoke the procedure:

CALL insert_ten_rows();