<?php
require '/var/www/html/ebay-market-compare/Model/Init.php';
require '/var/www/html/ebay-market-compare/Model/Scraper.php';
require '/var/www/html/ebay-market-compare/simple_html_dom.php';

$searchUrl = 'https://www.google.com/search?newwindow=1&hl=en&tbm=shop&ei=HLRSW8ezM6PD0PEP45-1wAI&btnG=Search&q=';
$scraper = new Scraper();
$isReady = $scraper->sitesExecutionReady();
$isReady = 0;
if($isReady == 0) {

    $marketData = $scraper->getMarketData('google-shopping');
    $mainUrl = $marketData['url'];
    $id = $marketData['id'];

    $offset = $marketData['offset'];
    $upcList = $scraper->getProducts($offset, MARKET_LIMIT_COUNT);

    if (count($upcList) > 0) {
        $scraper->updateMarketOffset($id, count($upcList));
    }
    foreach ($upcList as $row) {
        $upc = $row['product_upc'];
        $prodId = $row['id'];
        $ebayPrice = $row['product_price'];
        $url = $searchUrl . $upc;
        //$url = 'https://www.google.com/search?newwindow=1&hl=en&tbm=shop&ei=HLRSW8ezM6PD0PEP45-1wAI&btnG=Search&q=Epson%20L360%20All-in-One%20Ink%20Tank%20Printer';
        $htmlData = $scraper->curlToGoogle($url);
        if ($htmlData['html']) {
            $html = str_get_html($htmlData['html']);
            $g = $html->find('.g');
            if ($g) {
                for ($x = 0; $x < count($g); $x++) {
                    $a = $g[$x]->find('a', 0);
                    if ($a) {
                        $prodName = $a->plaintext;
                        $directLink = $a->getAttribute('href');
                        $priceStore = $g[$x]->find('.A8OWCb', 0);
                        $price = str_replace($letters, '', $priceStore->find('b', 0)->plaintext);
                        $store = $priceStore->find('div', 1)->plaintext;
                        $percentage = $ebayPrice - $price;
                        $percentage = $percentage / $ebayPrice;
                        $percentage = $percentage * 100;
                        if ($percentage >= PERCENTAGE_TARGET) {
                            $scraper->recordToCsvGoogle($prodId, $price, $directLink, $store);
                        }
                    }
                }
            }

        }else{
         //   mail('jeraldfeller@gmail.com', 'Scrape Alert | google', $url);
        }
    }




}
