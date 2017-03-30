<?php
/*
*Program Author: Robert Holland
*Program Name: p_accdb1.php
*Creation Date:  Wednesday, March 29, 2017  17:06:37
*Last Modified:
*Copyright: (c)  Wednesday, March 29, 2017
*Purpose: Connect to Mircosoft Access Database using PHP PDO.
*Source: http://stackoverflow.com/questions/13787686/accdb-and-pdo-php-connection-error
*/
try{
   // Connect
   //$handler = new PDO("odbc:Driver={Microsoft Access Driver (*.mdb)};Dbq=.\db\icr.accdb;Uid=Admin");
//   $handler = new PDO("odbc:Driver={Microsoft Access Driver (*.mdb, *.accdb)};Dbq=C:/Users/rlholland/Downloads/__DBTesting/Database1.accdb;Uid=rlholland");
   $handler = new PDO("odbc:Driver={Microsoft Access Driver (*.mdb, *.accdb)};Dbq=./Database1.accdb");
    /*** The SQL SELECT statement ***/
    $sql = "SELECT * FROM person";
    foreach ($handler->query($sql) as $row)
        {
//        print $row['firstname'] .' - '. $row['lastname'] .' - '. $row['zipcode'] . '
//';
        print $row[1] .' - '. $row[1] .' - '. $row[2] . '
';
        }

    /*** close the database connection ***/
    $handler = null;
}
catch(PDOException $e)
    {
    echo $e->getMessage();
    }
?>