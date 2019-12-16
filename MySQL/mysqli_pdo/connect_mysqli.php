<?php
//MySQLi OOP Connect Method:
$mysqli = new mysqli("localhost","my_user","my_password","my_db");

// Check connection:
if ($mysqli -> connect_errno) {
  echo "Failed to connect to MySQL: " . $mysqli -> connect_error;
  exit();
}

//MySQLi Procedural Method Works Too.
//$con = mysqli_connect("localhost","my_user","my_password","my_db");
//
//// Check connection
//if (mysqli_connect_errno()) {
//  echo "Failed to connect to MySQL: " . mysqli_connect_error();
//  exit();
//}

?>