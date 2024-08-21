<?php
use Dompdf\Dompdf;

require_once '../vendor/autoload.php';

// instantiate and use the dompdf class
$dompdf = new Dompdf();

ob_start();
require "pdf-content.php";
$html = ob_get_clean();

$dompdf->loadHtml($html);

// (Optional) Setup the paper size and orientation
$dompdf->setPaper('A4');

// Render the HTML as PDF
$dompdf->render();

// Output the generated PDF to Browser
$dompdf->stream();