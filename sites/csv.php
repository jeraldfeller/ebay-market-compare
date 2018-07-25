<?php
require '/var/www/html/ebay-market-compare/Model/Init.php';
require '/var/www/html/ebay-market-compare/Model/Scraper.php';
require '/var/www/html/ebay-market-compare/simple_html_dom.php';
$searchUrl = 'https://www.amazon.com/s/ref=nb_sb_noss?field-keywords=';
$scraper = new Scraper();
$isReady = $scraper->sitesExecutionReady();
if($isReady == 0) {
    $marketData = $scraper->getMarketData('csv');
    $id = $marketData['id'];
    $offset = $marketData['offset'];
    $upcList = $scraper->getProducts($offset, MARKET_LIMIT_COUNT);

    $flag = true;
    $fileHandle = fopen(CSV_ROOT . 'sites/csv/price_guide_1.csv', "r");


    while (($data = fgetcsv($fileHandle, 10000, ",")) !== FALSE) {
        if ($flag) {
            $flag = false;
            continue;
        }
        $upc = trim($data[0]);
        $price = trim($data[1]);
        $title = trim($data[2]);
        $store = trim($data[3]);
        foreach ($upcList as $row) {
            $ebayUpc = $row['product_upc'];
            $prodId = $row['id'];
            $ebayPrice = $row['product_price'];
            $directLink = $row['product_url'];
            if ($ebayUpc == $upc) {
                $percentage = $ebayPrice - $price;
                $percentage = $percentage / $ebayPrice;
                $percentage = $percentage * 100;
                if ($percentage >= PERCENTAGE_TARGET) {
                    $scraper->recordToCsv(false, $prodId, $price, '', true, $data);
                }
            }

        }
    }

    if (count($upcList) > 0) {
        $scraper->updateMarketOffset($id, count($upcList));
    }
}
