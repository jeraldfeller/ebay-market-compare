<?php
require '../Model/Init.php';
require '../Model/Scraper.php';
require '../simple_html_dom.php';
$searchUrl = 'https://www.amazon.com/s/ref=nb_sb_noss?field-keywords=';
$scraper = new Scraper();
$marketData = $scraper->getMarketData('csv');
$id = $marketData['id'];
$offset = $marketData['offset'];
$upcList = $scraper->getProducts($offset, MARKET_LIMIT_COUNT);

$flag = true;
$fileHandle = fopen('csv/price_guide_1.csv', "r");


while (($data = fgetcsv($fileHandle, 10000, ",")) !== FALSE) {
    if ($flag) {
        $flag = false;
        continue;
    }
    $upc = trim($data[0]);
    $price = trim($data[1]);
    $title = trim($data[2]);
    $store = trim($data[3]);
    foreach($upcList as $row){
        $ebayUpc = $row['product_upc'];
        $prodId = $row['id'];
        $ebayPrice = $row['product_price'];
        if($ebayUpc == $upc) {
            $percentage = $ebayPrice - $price;
            $percentage = $percentage / $ebayPrice;
            $percentage = $percentage * 100;
            if ($percentage >= 15) {
                echo $percentage;
                $scraper->sendMail(false, $prodId, $price, '', true, $data);
            }
        }

    }
}

if(count($upcList) > 0){
    $scraper->updateMarketOffset($id, count($upcList));
}
