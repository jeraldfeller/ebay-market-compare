<?php
$date = date('Y-m-d_H-i');
require 'Model/Init.php';
require 'Model/Scraper.php';
require 'simple_html_dom.php';

$scraper = new Scraper();

$products = $scraper->getNoMatchProducts();
$csv = 'products_'.$date.'.csv';
$data[] = implode('","', array(
    'UPC',
    'TITLE',
    'PRICE',
    'URL'
));
foreach($products as $row){
    $data[] = implode('","', array(
            $row['product_upc'],
            $row['product_name'],
            $row['product_price'],
            $row['product_url']
        )
    );
}

$file = fopen($csv,"w");
foreach ($data as $line){
    fputcsv($file, explode('","',$line));
}
fclose($file);



// Output CSV-specific headers

header('Content-Type: text/csv; charset=utf-8');
header("Content-Transfer-Encoding: Binary");
header("Content-disposition: attachment; filename=\"" . basename($csv) . "\"");
readfile($csv);