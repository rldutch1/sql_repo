<?php
/*
*Program Author: Robert Holland
*Program Name: connect.pdo
*Creation Date:  Saturday, November 18, 2017  11:10:14 PM
*Last Modified:
*Copyright (c)2017
*Purpose:
*Request #:
*/
$serverName = "192.168.11.8";

try {
	$handler = new PDO("sqlsrv:server=$serverName; Database=bakbone", "bakbone", "Bakbone1");
	$handler->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); //Setting the attributes for the handler that we want to see if exception error.
}
catch(PDOException $e) { //Return the PDO exception and naming it $e.
//	echo 'Caught';
//	die('Sorry database problem.'); //Production message.
	echo $e->getMessage(); //Show specific error message. Development.
}

$query0 = $handler->query('select * from bakbone');
//ONE: Output each column as row of data.
//	while($r = $query0->fetch()) {
//		echo $r[1]
//		, ' ', $r[2]
//		, ' ', $r[3]
//		, ' ', $r[4]
//		, ' ', $r[5]
//		, ' ', $r[6]
//		, ' ', $r[7]
//		, ' ', $r[8]
//		, ' ', $r[9]
//		, ' ', $r[10]
//		, ' ', $r[11]
//		, ' ', $r[12]
//		, ' ', $r[13]
//		, ' ', $r[14]
//		, ' ', $r[15]
//		, ' ', $r[16]
//		, ' ', $r[17]
//		, ' ', $r[18]
//		, ' ', $r[19]
//		, ' ', $r[20]
//		, ' ', $r[21]
//		, '\r\n';
//	}

//TWO: Prints one array.
//	$r = $query0->fetch(PDO::FETCH_ASSOC); //Will fetch the associative array only.
//	echo '<pre>', print_r($r), '</pre>';

//THREE: Column 1 followed by dashes.
//	foreach($query0 as $r){
//		echo $r[0] . "-----";
//
//	}

//FOUR: Not sure what I was doing here.
//	foreach($query0 as $key => $r){
//		$out = array_values($r);
//		echo json_encode($out);
//}

//FIVE: Proper JSON.
	$r = $query0->fetchAll(PDO::FETCH_ASSOC);
	//echo '<pre>', print_r($r), '</pre>';
	echo json_encode($r);

?>