<?php
/*
*Program Author: Robert Holland
*Program Name: areacodes.mdb.php
*Creation Date:  Tuesday, March 28, 2017  16:51:03
*Last Modified:
*Copyright: (c)  Tuesday, March 28, 2017
*Purpose: Testing connection to older Microsoft Access database (.mdb).
*Source: http://stackoverflow.com/questions/13787686/accdb-and-pdo-php-connection-error
*/

$query = 'SELECT * FROM "Area Codes"';
//$mdb_file = 'prefs.mdb';
$mdb_file = './areacodes.mdb';
$uname = explode(" ",php_uname());
$os = $uname[0];
switch ($os){
  case 'Windows':
    $driver = '{Microsoft Access Driver (*.mdb, *.accdb)}';
    break;
  case 'Linux':
    $driver = 'MDBTools';
    break;
  default:
    exit("Don't know about this OS");
}
$connection = new PDO("odbc:Driver={Microsoft Access Driver (*.mdb, *.accdb)};Dbq=$mdb_file");
$result = $connection->query($query)->fetchAll(PDO::FETCH_ASSOC);
//print_r($result);
//	echo '<pre>', print_r($result), '</pre>';
$json=json_encode($result);
echo $json;
?>