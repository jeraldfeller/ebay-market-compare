<?php
require '../Model/Init.php';
require '../Model/Scraper.php';
require '../simple_html_dom.php';
$scraper = new Scraper();
$mainUrl = 'http://target.com/';
$id = 11;
$upc = '814855023271';
$prodId = 1;
$ebayPrice = 4;
$url = 'https://www.homedepot.com/s/810841011628';
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
            var_dump($price);
            if($price != ''){
                $scraper->recordProductMarketMatch($id, $prodId, $upc, $price, $ebayPrice, $directUrl, $productIdentification);
            }
        }

    }
}else{
    //   mail('jeraldfeller@gmail.com', 'Scrape Alert | homedepot', $url);
}