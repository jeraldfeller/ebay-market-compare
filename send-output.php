<?php
require '/var/www/html/ebay-market-compare/Model/Init.php';
require '/var/www/html/ebay-market-compare/Model/Scraper.php';
$scraper = new Scraper();
$isReady = $scraper->isReadyToSendOutput();
$date = date('Y-m-d');
if($isReady){
//    $products = $scraper->getNoMatchProducts();
//    $csv = CSV_ROOT.'exports/no_match_product_list_'.$date.'.csv';
//    foreach ($products as $row){
//        $data[] = implode('","', array(
//                $row['product_upc'],
//                $row['product_price'],
//                html_entity_decode($row['product_name']),
//                $row['product_url']
//            )
//        );
//    }
//    $file = fopen($csv,"a");
//    foreach ($data as $line){
//        fputcsv($file, explode('","',$line));
//    }
//    fclose($file);


    $response = $scraper->sendOutPut();

    echo $response;
}
