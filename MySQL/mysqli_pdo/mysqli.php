<!DOCTYPE html>
<html>
<head>
</head>
<body>

<form name='form1' method='post' action='mysqli.php'>
	Name:<input type='text' name='name' id='name'><br />
	Pass:<input type='text' name='password' id='password'><br />
	<input type='submit' name='submit' id='submit' value='submit'>
</form>
<br />
<?php
// ' or '1'='1 <-- mysqli injection trick for the password field.
if(isset($_POST['submit'])){
	$connect = mysqli_connect('localhost','mysqlitest','mysqlitest','mysqlitest');
	$sql = "select id, name, pass from blah where name = '$_POST[name]' and pass = '$_POST[password]';";
	$query = mysqli_query($connect, $sql);
	$quick_check = mysqli_num_rows($query);
	if ($quick_check != 0){
		//echo $quick_check." ".$postname." ".$postpass;
		while ($row = mysqli_fetch_array($query, MYSQLI_ASSOC)){
			$id = $row['id'];
			$name = $row['name'];
			$pass = $row['pass'];
			echo ' id - '.$id.'<br />';
			echo ' name - '.$name.'<br />';
			echo ' pass - '.$pass.'<br />';
			//print_r(PDO::getAvailableDrivers());
		}
	} else {
		echo "Invalid";
		//echo $quick_check . " Invalid";
		//echo $sql;
	}
}

?>

</body>
</html>
