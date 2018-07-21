<?php
require '/var/www/html/ebay-market-compare/Model/Init.php';
require '/var/www/html/ebay-market-compare/Model/Scraper.php';
require '/var/www/html/ebay-market-compare/simple_html_dom.php';
$searchUrl = 'https://www.google.com/search?newwindow=1&hl=en&tbm=shop&ei=HLRSW8ezM6PD0PEP45-1wAI&btnG=Search&q=';
$scraper = new Scraper();
$marketData = $scraper->getMarketData('google-shopping');
$mainUrl = $marketData['url'];
$id = $marketData['id'];

$offset = $marketData['offset'];
$upcList = $scraper->getProducts($offset, MARKET_LIMIT_COUNT);


foreach ($upcList as $row){
    $upc = $row['product_upc'];
    $prodId = $row['id'];
    $ebayPrice = $row['product_price'];
    $url = $searchUrl.$upc;
    $htmlData = $scraper->curlToGoogle($url);
    if($htmlData['html']){
        $html = str_get_html($htmlData['html']);
        $g = $html->find('.g');
        if($g){
            for($x = 0; $x < count($g); $x++){
                $a = $g[$x]->find('a', 0);
                if($a){
                    $prodName = $a->plaintext;
                    $link = $a->getAttribute('href');
                    $priceStore = $g[$x]->find('.A8OWCb', 0);
                    $price = $priceStore->find('b', 0)->plaintext;
                    $store = $priceStore->find('div', 1)->plaintext;
                    $percentage = $ebayPrice - $price;
                    $percentage = $percentage / $ebayPrice;
                    $percentage = $percentage * 100;
                    if ($percentage >= 15) {
                        $scraper->sendMailGoogle($prodId, $price, $directLink, $store);
                    }
                    echo $prodName.'<br>';
                    echo $link.'<br>';
                    echo $price.'<br>';
                    echo $store.'<br>';
                    echo '<hr>';
                }
            }
        }

    }
}


if(count($upcList) > 0){
    $scraper->updateMarketOffset($id, count($upcList));
}



