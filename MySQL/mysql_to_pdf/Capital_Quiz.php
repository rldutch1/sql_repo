<?php
require('sql_to_pdf/fpdf.php');

//PDO connect method:
try {
	$handler = new PDO('mysql:host=localhost;dbname=us', 'states', 'statesp'); //Setting the handler. See next line if this line fails.
	$handler->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); //Setting the attributes for the handler that we want to see if exception error.
}
catch(PDOException $e) { //Return the PDO exception and naming it $e.
//	echo 'Caught';
//	die('Sorry database problem.'); //Production message.
	echo $e->getMessage(); //Show specific error message. Development.
}

$statement = $handler->prepare("select state from states order by state;");
$statement1 = $handler->prepare("select capital from states order by capital;");
$statement->execute();
$statement1->execute();
$number_of_products = $statement->rowCount();

$pdf = new FPDF();
$pdf->AddPage();
$pdf->SetFont('Arial','B',12);
			$pdf->Cell(110);
			$pdf->Cell(10,10, 'NAME: ___________________',0,1);
			$pdf->Cell(10,10, 'Write the capital for each state in the line provided.',0,1);
			while($r = $statement->fetch(PDO::FETCH_OBJ)){
			$statename = $r->state;
			$pdf->Cell(40,10, $statename,0,0);
			$pdf->Cell(60,10,'','B',1);
			}
$pdf->Output();
?>