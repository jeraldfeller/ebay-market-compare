<?php
/**
 * Note: the method to scrape products is thru target api
 */
require '/var/www/html/ebay-market-compare/Model/Init.php';
require '/var/www/html/ebay-market-compare/Model/Scraper.php';
require '/var/www/html/ebay-market-compare/simple_html_dom.php';
$searchUrl = 'https://redsky.target.com/v1/plp/search/?count=1&offset=0&keyword=';
$scraper = new Scraper();
$isReady = $scraper->sitesExecutionReady();
if($isReady == 0) {
    $marketData = $scraper->getMarketData('target');
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
            $data = json_decode($htmlData['html'], true);
            if (count($data['search_response']['items']['Item']) > 0) {
                $price = $data['search_response']['items']['Item'][0]['list_price']['price'];
                $directUrl = $mainUrl . $data['search_response']['items']['Item'][0]['url'];
                echo $price . '<br>';
                echo $directUrl;
                $scraper->recordProductMarketMatch($id, $prodId, $upc, $price, $ebayPrice, $directUrl);
            }
        }else{
            mail('jeraldfeller@gmail.com', 'Scrape Alert | target', $url);
        }
    }

    if (count($upcList) > 0) {
        $scraper->updateMarketOffset($id, count($upcList));
    }
}
