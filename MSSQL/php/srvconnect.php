<?php
// ----------------------------------------------------------------------------
// Script Author: Robert Holland
// Script Name: srvconnect.php
// Creation Date: Sun Nov 19 2017 14:33:23 GMT-0700 (US Mountain Standard Time)
// Last Modified:
// Copyright (c)2017
// Version: 1.0.0
// Purpose: PDO connect to MSSQL Database Server from the server (not client).
// ----------------------------------------------------------------------------

$serverName = "backup"; //Servername/Instancename

//Since UID and password are not specified the connection will attempt using the Windows authentication.

$handler = new PDO("sqlsrv:server=$serverName; Database=bakbone", "bakbone", "Bakbone1");

	if($handler) {
		echo "Connection established.<br />";
	}
	else {
		echo "Connection failed.<br />";
		die(print_r(sqlsrv_errors(), true));
	}

//Print the contents of the table.

/* This works too! */
//	$sql = 'select * from backups1x1;';
//	foreach ($handler -> query($sql) as $col) {
//		print $col[0] . " ";
//		print $col[1] . " ";
//		print $col[2] . " ";
//		print $col[3] . "<br />";
//	}
/*This works too!*/

/*This works too!*/
//$statement = $handler->prepare("select * from backups1x1;");
//$statement->execute(); //Run the prepared query. Prevents MySQL injection.
//			while($r = $statement->fetch(PDO::FETCH_OBJ)){
//			$id_column = $r->id;
//			$tid = $r->tape_id;
//			$lid = $r->log_id;
//			$tpath = $r->path;
//			echo $id_column . ' ' . $tid . ' ' . $lid . ' ' . $tpath . '<br />';
//			}
/*This works too!*/

/*This works too!*/
$statement = $handler->prepare("select name, crdate from sysobjects where xtype = 'u';");
$statement->execute(); //Run the prepared query. Prevents MySQL injection.
			while($r = $statement->fetch(PDO::FETCH_OBJ)){
			$id_column = $r->name;
			$tid = $r->crdate;
			echo $id_column . ' ' . $tid . '<br />';
			}
/*This works too!*/
?>