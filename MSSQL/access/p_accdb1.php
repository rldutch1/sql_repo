<?php
try{
   // Connect
   //$handler = new PDO("odbc:Driver={Microsoft Access Driver (*.mdb)};Dbq=.\db\icr.accdb;Uid=Admin");
//   $handler = new PDO("odbc:Driver={Microsoft Access Driver (*.mdb, *.accdb)};Dbq=C:/Users/rlholland/Downloads/__DBTesting/Database1.accdb;Uid=rlholland");
   $handler = new PDO("odbc:Driver={Microsoft Access Driver (*.mdb, *.accdb)};Dbq=./Database1.accdb");
    /*** The SQL SELECT statement ***/
    $sql = "SELECT * FROM person";
    foreach ($handler->query($sql) as $row)
        {
        print $row['firstname'] .' - '. $row['lastname'] .' - '. $row['zipcode'] . '
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