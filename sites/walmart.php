<?php
require '/var/www/html/ebay-market-compare/Model/Init.php';
require '/var/www/html/ebay-market-compare/Model/Scraper.php';
require '/var/www/html/ebay-market-compare/simple_html_dom.php';
$searchUrl = 'https://www.walmart.com/search/?query=';
$scraper = new Scraper();
$isReady = $scraper->sitesExecutionReady();
if($isReady == 0) {
    $marketData = $scraper->getMarketData('walmart');
    $mainUrl = $marketData['url'];
    $id = $marketData['id'];

    $offset = $marketData['offset'];
    $upcList = $scraper->getProducts($offset, MARKET_LIMIT_COUNT);

    foreach ($upcList as $row) {
        $upc = $row['product_upc'];
        $prodId = $row['id'];
        $ebayPrice = $row['product_price'];
        $url = $searchUrl . $upc;
        $htmlData = $scraper->curlTo($url, null);
        if ($htmlData['html']) {
            $html = str_get_html($htmlData['html']);
            $match = $html->find('.search-result-product-title', 0);
            if ($match) {
                $directUrl = $mainUrl . $match->find('.product-title-link', 0)->getAttribute('href');
                $price = $html->find('.price-group', 0);
                if ($price) {
                    $price = trim(str_replace($letters, '', $price->plaintext));
                    $scraper->recordProductMarketMatch($id, $prodId, $upc, $price, $ebayPrice, $directUrl);
                }

            }
        }else{
            mail('jeraldfeller@gmail.com', 'Scrape Alert | walmart', $url);
        }
    }

    if (count($upcList) > 0) {
        $scraper->updateMarketOffset($id, count($upcList));
    }
}


