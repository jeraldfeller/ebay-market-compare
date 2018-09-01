<?php
require '/var/www/html/ebay-market-compare/Model/Init.php';
require '/var/www/html/ebay-market-compare/Model/Scraper.php';
require '/var/www/html/ebay-market-compare/simple_html_dom.php';

$searchUrl = 'https://www.homedepot.com/s/';
$scraper = new Scraper();
$isReady = $scraper->sitesExecutionReady();
if($isReady == 0) {
    $marketData = $scraper->getMarketData('homedepot');
    $mainUrl = $marketData['url'];
    $id = $marketData['id'];

    $offset = $marketData['offset'];
    $upcList = $scraper->getProducts($offset, MARKET_LIMIT_COUNT);
    if (count($upcList) > 0) {
        $scraper->updateMarketOffset($id, count($upcList));
    }
    foreach ($upcList as $row) {
        $upc = $row['product_upc'];;
        $prodId = $row['id'];
        $ebayPrice = $row['product_price'];
        $url = $searchUrl . $upc;
        $htmlData = $scraper->curlTo($url, null);
        if ($htmlData['html']) {
            $html = str_get_html($htmlData['html']);
            $match = $html->find('.pod-inner', 0);
            if ($match) {
                $directUrl = $mainUrl . $match->find('a', 0)->getAttribute('href');
                $path = explode('/', parse_url($directUrl)['path']);
                $productIdentification = $path[count($path)-1];
                $price = $match->find('.checkbox-btn__input', 0);
                if ($price) {
                    $price = trim(str_replace($letters, '', $price->getAttribute('data-price')));
                    if($price != ''){
                        $scraper->recordProductMarketMatch($id, $prodId, $upc, $price, $ebayPrice, $directUrl, $productIdentification);
                    }
                }

            }
        }else{
            //   mail('jeraldfeller@gmail.com', 'Scrape Alert | homedepot', $url);
        }
    }

}