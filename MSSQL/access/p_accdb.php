<?php
/*
*Program Author: Robert Holland
*Program Name: p_accdb.php
*Creation Date:  Wednesday, March 29, 2017  17:06:37
*Last Modified:
*Copyright: (c)  Wednesday, March 29, 2017
*Purpose:
*Request #:
*/

try {
   // Connect
   //$handler = new PDO("odbc:Driver={Microsoft Access Driver (*.mdb)};Dbq=.\db\icr.accdb;Uid=Admin");
   $handler = new PDO("odbc:Driver={Microsoft Access Driver (*.mdb, *.accdb)};Dbq=C:/Users/rlholland/Downloads/__DBTesting/Database1.accdb;Uid=rlholland");
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

catch(PDOException $e)
    {
    echo $e->getMessage();
    }
?>
