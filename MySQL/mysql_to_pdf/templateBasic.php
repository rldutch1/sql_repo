<?php
//Source: http://stackoverflow.com/questions/28827399/how-to-generate-a-pdf-file-with-get-content-from-sql-query
//Official Site: http://www.fpdf.org/

require('fpdf.php');

$pdf = new FPDF();
$pdf->AddPage();
$pdf->SetFont('Arial','B',16);
$pdf->Cell(40,10,'Hello World!');
$pdf->Output();

//Above code will generate a pdf with "Hello World!" text in it, with font arial, size 16 and bold style. You can enter your sql query result in place of Hello World.
?>