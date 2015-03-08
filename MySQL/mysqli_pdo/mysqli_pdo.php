<!DOCTYPE html>
<html>
<head>
PDO Method <br /><br />
Usernames are: aaa, bbb, ccc, ddd. <br />
Passwords are: bbb, bbb, ccc, ddd. <br />
</head>
<body>

<form name='form1' method='post' action='mysqli_pdo.php'>
	Name:<input type='text' name='name' id='name'><br />
	Pass:<input type='text' name='password' id='password'><br />
	<input type='submit' name='submit' id='submit' value='submit'>
</form>
<br />
<?php
// ' or '1'='1 <-- mysqli injection trick for the password field.
if(isset($_POST['submit'])){
//Old connect method:
//	$connect = mysqli_connect('localhost','mysqlitest','mysqlitest','mysqlitest');

//PDO connect method:
		$connect = new mysqli('localhost','mysqlitest','mysqlitest','mysqlitest');

//Old query methd:
//	$sql = "select id, name, pass from blah where name = '$_POST[name]' and pass = '$_POST[password]';";

//PDO query method using questionmarks:
	$sql = 'select id, name, pass from blah where name=? and pass=?';
	$stmt = $connect->prepare($sql);
	$stmt->bind_param('ss',$_POST['name'],$_POST['password']);
	//http://www.php.net/manual/en/mysqli-stmt.bind-param.php
	// i - type integer
	// d - type double
	// s - type string
	// b - type blob

/*
https://www.youtube.com/watch?v=dyienQE-UCU
Explaining the line: $stmt->bind_param('ss',$_POST['name'],$_POST['password']);
The ss in the bind statement means that the two data types following the comma will be strings.
They correspond to the two questionmarks in the select statement. The first questionmark is the first 's'
and the second questionmark is the second 's'. The $_POST['name'] is being binded to the first 's' and
$_POST['password'] is being binded to the second 's'.

The binding method prevents mysql injection but I don't
know how it does it.

*/

//Executing the PDO statement:
	$stmt->execute();
//Binding the results of the query.
	$stmt->bind_result($id, $name, $pass);

	if($stmt->fetch()){
		echo 'id - '.$id.'<br />';
		echo 'name - '.$name.'<br />';
		echo 'pass - '.$pass.'<br />';
	}
	else {
		echo 'Invalid';
	}
}

?>

</body>
</html>
