<?php
require '/var/www/html/ebay-market-compare/Model/Init.php';
require '/var/www/html/ebay-market-compare/Model/Scraper.php';
require '/var/www/html/ebay-market-compare/simple_html_dom.php';
$searchUrl = 'http://www.tigerdirect.com/applications/SearchTools/search.asp?keywords=';
$scraper = new Scraper();
$isReady = $scraper->sitesExecutionReady();
if($isReady == 0) {
    $marketData = $scraper->getMarketData('tigerdirect');
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
            $match = $html->find('.product', 0);
            if ($match) {
                $directUrl = $mainUrl . $match->find('.itemImage', 0)->getAttribute('href');
                $price = $match->find('.salePrice', 0);
                if ($price) {
                    $price = trim(str_replace($letters, '', $price->plaintext));
                    echo $directUrl . '<br>';
                    echo $price;
                    $scraper->recordProductMarketMatch($id, $prodId, $upc, $price, $ebayPrice, $directUrl);
                }

            }
        }else{
            mail('jeraldfeller@gmail.com', 'Scrape Alert | tigerdirect', $url);
        }
    }

    if (count($upcList) > 0) {
        $scraper->updateMarketOffset($id, count($upcList));
    }
}
