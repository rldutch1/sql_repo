<?php
/*
*Program Author: Robert Holland
*Program Name: database1_b.accdb.php
*Creation Date:  Wednesday, March 29, 2017  17:06:37
*Last Modified:
*Copyright: (c)  Wednesday, March 29, 2017
*Purpose: Connect to Microsoft Access database using PHP PDO.
*Source: http://stackoverflow.com/questions/13787686/accdb-and-pdo-php-connection-error
*/

try {
   // Connect
   //$handler = new PDO("odbc:Driver={Microsoft Access Driver (*.mdb, *.accdb)};Dbq=.\db\icr.accdb;Uid=Admin");
   //$handler = new PDO("odbc:Driver={Microsoft Access Driver (*.mdb, *.accdb)};Dbq=C:/Users/rlholland/Desktop/Github/sql_repo/MSSQL/access/Database1.accdb;Uid=rlholland");
   //$handler = new PDO("odbc:Driver={Microsoft Access Driver (*.mdb, *.accdb)};Dbq=C:/Users/rlholland/Desktop/Github/sql_repo/MSSQL/access/Database1.accdb;");
   //$handler = new PDO("odbc:Driver={Microsoft Access Driver (*.mdb, *.accdb)};Dbq=//Phx07555/d$/Download/CIDB/CIDB.MDB;");
   $handler = new PDO("odbc:Driver={Microsoft Access Driver (*.mdb, *.accdb)};Dbq=//phx00027/unix/CSM/Database Management/CIDB.MDB;");
   /*** The SQL SELECT statement ***/
   //$sql=$handler->query("SELECT * FROM person;");
   //$sql=$handler->query("select pkgNum, pkgversion, pkgname, updt_dt_tm from euc_pkgdefinition where pkgname = 'Nexus -- Orders: Privilege Exceptions Correction';");

   //The joins do not seem to be working:
   $static_content_url=$handler->query("select ev.StaticContentServiceURL, ev.EnvName from euc_env ev order by ev.StaticContentServiceURL;");
   //$package_num_lookup=$handler->query("select evp.PkgNum, ev.EnvName, evp.InstallDate, epd.PkgName from euc_env ev join euc_envpkg evp on (ev.env_id = evp.env_id) join euc_pkgdefinition epd on (evp.pkgnum = epd.pkgnum) where evp.PkgNum = 78242 order by evp.PkgNum, ev.EnvName;");

//ONE: Output each column as row of data.
//	while($r = $sql->fetch()) {
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
//	$r = $sql->fetch(PDO::FETCH_ASSOC); //Will fetch the associative array only.
//	echo '<pre>', print_r($r), '</pre>';

//THREE: Column 1 followed by dashes.
//	foreach($sql as $r){
//		echo $r[0] . "-----";
//
//	}

//FOUR: Not sure what I was doing here.
//	foreach($sql as $key => $r){
//		$out = array_values($r);
//		echo json_encode($out);
//}

//FIVE: Proper JSON.
//	$r = $sql->fetchAll(PDO::FETCH_ASSOC);
//	//echo '<pre>', print_r($r), '</pre>';
//	echo json_encode($r);


//static_content_url: This works.
	$r = $static_content_url->fetchAll(PDO::FETCH_ASSOC);
	//echo '<pre>', print_r($r), '</pre>';
	echo json_encode($r);

//package_num_lookup: The joins do not seem to be working:
//	$r = $package_num_lookup->fetchAll(PDO::FETCH_ASSOC);
//	//echo '<pre>', print_r($r), '</pre>';
//	echo json_encode($r);

/*** close the database connection ***/
    $handler = null;
}

catch(PDOException $e)
    {
    echo $e->getMessage();
    }

?>
