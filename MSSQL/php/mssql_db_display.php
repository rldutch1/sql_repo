<?php
// ----------------------------------------------------------------------------
// Script Author: Robert Holland
// Script Name: mssql_db_display.php
// Creation Date: Sun Nov 19 2017 18:10:40 GMT-0700 (US Mountain Standard Time)
// Last Modified:
// Copyright (c)2017
// Version: 1.0.0
// Purpose: Display the databases on MSSQL Server.
// ----------------------------------------------------------------------------

$handler = new PDO("sqlsrv:server=backup; Database=master", "sa", "Holland");

	if($handler) {
		echo "Connection established.<br />";
	}
	else {
		echo "Connection failed.<br />";
		die(print_r(sqlsrv_errors(), true));
	}

$statement = $handler->prepare("SELECT name, crdate, filename from sysdatabases;");
$statement->execute(); //Run the prepared query. Prevents MySQL injection.
echo "<table><caption><b><h3>fetch(PDO::FETCH_OBJ)</h3></b></caption>";
echo "<tr><th>Database Name</th><th>Creation Date</th><th>Filename and Path</th></tr>";
			while($r = $statement->fetch(PDO::FETCH_OBJ)){
//			$name = $r->name;
//			$crdate = $r->crdate;
//			$filename = $r->filename;
			echo "<tr><td><b>" . $r->name . '</b></td><td>' . $r->crdate . '</td><td>' . $r->filename . '</td></tr>';
			}
echo "</table>";

echo "<br /><hr /><br />";

$statement1 = $handler->prepare("SELECT name, crdate, filename from sysdatabases;");
$statement1->execute(); //Run the prepared query. Prevents MySQL injection.
echo "<table><caption><b><h3>fetch(PDO::FETCH_NUM)</h3></b></caption>";
echo "<tr><th>Database Name</th><th>Creation Date</th><th>Filename and Path</th></tr>";
			while($r = $statement1->fetch(PDO::FETCH_NUM)){
			echo "<tr><td><b>" . $r[0] . '</b></td><td>' . $r[1] . '</td><td>' . $r[2] . '</td></tr>';
			}
echo "</table>";

echo "<br /><hr /><br />";

$statement2 = $handler->prepare("SELECT name, crdate, filename from sysdatabases;");
$statement2->execute(); //Run the prepared query. Prevents MySQL injection.
echo "<table><caption><b><h3>fetch(PDO::FETCH_ASSOC)</h3></b></caption>";
echo "<tr><th>Database Name</th><th>Creation Date</th><th>Filename and Path</th></tr>";
			while($r = $statement2->fetch(PDO::FETCH_ASSOC)){
			echo "<tr><td><b>" . $r[name] . '</b></td><td>' . $r[crdate] . '</td><td>' . $r[filename] . '</td></tr>';
			}
echo "</table>";

echo "<br /><hr /><br />";

$statement3 = $handler->prepare("SELECT name, crdate, filename from sysdatabases;");
$statement3->execute(); //Run the prepared query. Prevents MySQL injection.
echo "<table><caption><b><h3>fetch(PDO::FETCH_BOTH)</h3><br />Returns twice as much data but is more flexible.</b></caption>";
echo "<tr><th>Database Name</th><th>Creation Date</th><th>Filename and Path</th></tr>";
			while($r = $statement3->fetch(PDO::FETCH_BOTH)){
			echo "<tr><td><b>" . $r[0] . '</b></td><td>' . $r[crdate] . '</td><td>' . $r[2] . '</td></tr>';
			echo "<tr><td><b>" . $r[name] . '</b></td><td>' . $r[1] . '</td><td>' . $r[filename] . '</td></tr>';
			}
echo "</table>";

echo "<br /><hr /><br />";

echo "<table><caption><b><h3>fetchAll(PDO::FETCH_BOTH) returns an array.</h3><br /></b></caption><tr><td><pre>";
$statement4 = $handler->prepare("SELECT name, crdate, filename from sysdatabases;");
$statement4->execute(); //Run the prepared query. Prevents MySQL injection.
//echo "<tr><th>Database Name</th><th>Creation Date</th><th>Filename and Path</th></tr>";
				$r=$statement4->fetchAll(PDO::FETCH_BOTH);
//				echo "<tr><td><pre>" . print_r($r[0]) . "</pre></td></tr>";
				echo print_r($r);
echo "</pre></td></tr></table>";

echo "<br /><hr /><br />";

$statement5 = $handler->prepare("SELECT name, crdate, filename from sysdatabases;");
$statement5->execute(); //Run the prepared query. Prevents MySQL injection.
echo "<table><caption><b><h3>fetchAll(PDO::FETCH_BOTH) returns an array that can be JSON encoded.</h3><br />json_encode(array) puts array in JSON format.</b></caption>";
//echo "<tr><th>Database Name</th><th>Creation Date</th><th>Filename and Path</th></tr>";
				$r=$statement5->fetchAll(PDO::FETCH_BOTH);
				$json=json_encode($r);
				echo "<tr><td>" . $json . "</td></tr>";
echo "</table>";

echo "<br />";
?>