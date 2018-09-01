<?php
require '/var/www/html/ebay-market-compare/Model/Init.php';
require '/var/www/html/ebay-market-compare/Model/Scraper.php';
require '/var/www/html/ebay-market-compare/simple_html_dom.php';

$searchUrl = 'https://www.newegg.com/Product/ProductList.aspx?Submit=ENE&DEPA=0&Order=BESTMATCH&N=-1&isNodeId=1&Description=';
$scraper = new Scraper();
$isReady = $scraper->sitesExecutionReady();
if($isReady == 0) {
    $marketData = $scraper->getMarketData('newegg');
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
            $match = $html->find('.item-container', 0);
            if ($match) {
                $directUrl = $match->find('.item-title', 0)->getAttribute('href');
                $productIdentification = parse_url($directUrl);
                parse_str($productIdentification['query'], $productIdentification);
                if(isset($productIdentification['Item'])){
                    $productIdentification = $productIdentification['Item'];
                }else{
                    $productIdentification = 0;
                }
                $price = $html->find('.price-current', 0)->find('strong', 0);
                if ($price) {
                    $price = trim(str_replace($letters, '', $price->plaintext));
                    $scraper->recordProductMarketMatch($id, $prodId, $upc, $price, $ebayPrice, $directUrl, $productIdentification);
                }

            }
        }else{
        //    mail('jeraldfeller@gmail.com', 'Scrape Alert | newegg', $url);
        }
    }


}