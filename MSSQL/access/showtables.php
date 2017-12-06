<?php
// https://gist.github.com/remoharsono/8ef943bedab437e3fb2b/53895151268d5c2f43b14cf3a513fd4d7a21bd5b
// get table names
$username = 'Admin';
$password = 'blablabla';
//$db = odbc_connect("Driver={Microsoft Access Driver (*.mdb)};Dbq=c:\\xampp\htdocs\pblablabla.mdb;", $username, $password);
$db = odbc_connect("Driver={Microsoft Access Driver (*.mdb)};Dbq=./areacodes.mdb");
$result = odbc_tables($db);
echo '<div id="top">..</div><table border="1" cellpadding="5"><tr>';
$tblRow = 1;
while (odbc_fetch_row($result)){
  if(odbc_result($result,"TABLE_TYPE")=="TABLE"){
    $tableName = odbc_result($result,"TABLE_NAME");
    echo '<tr><td>' . $tblRow . '</td><td><a href="#' . $tableName . '">' . $tableName . '</a></td></tr>';
    $tblRow++;
  }  
}
echo '</table><hr>';
$result = odbc_tables($db);
while (odbc_fetch_row($result)){
  if(odbc_result($result,"TABLE_TYPE")=="TABLE"){
    $tableName = odbc_result($result,"TABLE_NAME");
    
    echo '<div id="' . $tableName . '"> *** ' . $tableName . ' *** <a href="#top">top</a></div>';
    
    $cols = odbc_exec($db, "SELECT * FROM $tableName WHERE 1=2");
    $ncols = odbc_num_fields($cols);
    for ($n=1; $n<=$ncols; $n++) {
      $field_name = odbc_field_name($cols, $n);
      echo $field_name . "<br>";
    }
    
    echo '<hr>';
  }
}
?>