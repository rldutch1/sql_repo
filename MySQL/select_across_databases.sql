
-- Select across databases;
	select mysql.user.user from mysql.user;

-- Example on https://stackoverflow.com/questions/674115/select-columns-across-different-databases
SELECT
    mydatabase1.tblUsers.UserID,
    mydatabse2.tblUsers.UserID
FROM
   mydatabase1.tblUsers
   INNER JOIN mydatabase2.tblUsers
   	ON mydatabase1.tblUsers.UserID = mydatabase2.tblUsers.UserID
