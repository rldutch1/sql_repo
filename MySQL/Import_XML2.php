<?php

$xml = simplexml_load_file('Import_XML2.xml');
$data = $fields = array();
foreach ($xml->xpath('unit') as $unit) {
    $fields = array_keys((array)($unit));
    $data[] = '(' . join(', ', (array)$unit) . ')';
}

$sql = "INSERT INTO businfo (" . join(', ', $fields) . ") VALUES\n" ;
$sql .= join (",\n", $data);

echo "<pre>$sql</pre>";

/*
RESULT

INSERT INTO businfo (iterator, route, rt_name, name, lat, lng, bearing, car_type, speed, GMT) VALUES
(0, 2, 'Riverfront Streetcar', 457, 2956.21014, -9004.62839, 2.14501, 'RTA Street Cars', 16.57122, 043432),
(1, 10, 'Tchoupitoulas', 250, 2958.0927, -9005.28724, 1.532399, 'RTA Buses', 0.6904677, 104620)


Correction to code above ("check for no value" was added):
<?php

$xml = simplexml_load_file('units.xml');
$data = $fields = array();
foreach ($xml->xpath('unit') as $unit) {
	 $fields = array_keys((array)($unit));
	 if ($unit->GMT == '') $unit->GMT = 0;			 // check for no value
	 $data[] = '(' . join(', ', (array)$unit) . ')';
}

$sql = "INSERT INTO businfo (" . join(', ', $fields) . ") VALUES\n" ;
$sql .= join (",\n", $data);

echo "<pre>$sql</pre>";
?>


Source: http://forums.phpfreaks.com/topic/273301-simplexml-to-mysql/
*/
?>