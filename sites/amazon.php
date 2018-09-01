<?php
require '/var/www/html/ebay-market-compare/Model/Init.php';
require '/var/www/html/ebay-market-compare/Model/Scraper.php';
require '/var/www/html/ebay-market-compare/simple_html_dom.php';

$searchUrl = 'https://www.amazon.com/s/ref=nb_sb_noss?field-keywords=';
$scraper = new Scraper();
$isReady = $scraper->sitesExecutionReady();
if($isReady == 0){
    $marketData = $scraper->getMarketData('amazon');
    $mainUrl = $marketData['url'];
    $id = $marketData['id'];
    $offset = $marketData['offset'];
    $upcList = $scraper->getProducts($offset, MARKET_LIMIT_COUNT);
    if(count($upcList) > 0){
        $scraper->updateMarketOffset($id, count($upcList));
    }
    foreach ($upcList as $row){
        $upc = $row['product_upc'];
        $prodId = $row['id'];
        $ebayPrice = $row['product_price'];
        $url = $searchUrl.$upc;
        $htmlData = $scraper->curlToAmazon($url);
        if($htmlData['html']) {
            $html = str_get_html($htmlData['html']);
            $match = $html->find('.a-fixed-left-grid', 0);
            if($match){
                $directUrl = $match->find('a', 0)->getAttribute('href');
                $price1 = $match->find('.sx-price-whole', 0);
                if(!$price1){
                    $price1 = $match->find('.a-size-base', 0);
                    if(trim(str_replace($letters, '', $price1->plaintext)) == ''){
                        $price1 = $match->find('.a-normal', 0);
                    }
                }
                if($price1){
                    $price2 = $html->find('.sx-price-fractional', 0);
                    $price = $price1->plaintext;
                    $price = trim(str_replace($letters, '', $price));
                    sleep(mt_rand(1, 3));
                    $htmlDataNew = $scraper->curlToAmazon($directUrl);
                    if($htmlDataNew['html']) {
                        $htmlNew = str_get_html($htmlDataNew['html']);
                        $aTable = $htmlNew->find('#productDetails_detailBullets_sections1', 0);
                        if($aTable){
                            $aRow = $aTable->find('tr');
                            for($a = 0; $a < count($aRow); $a++){
                                $aThTitle = trim($aRow[$a]->find('th', 0)->plaintext);
                                if($aThTitle == 'ASIN'){
                                    $asin = trim($aRow[$a]->find('td', 0)->plaintext);
                                }
                            }
                        }else{
                            $asin = 0;
                      //      $scraper->sendNotification($htmlDataNew['ip'], $directUrl, $htmlDataNew['html']);
                        }
                    }else{

                        $asin = 0;
                    }
                    $scraper->recordProductMarketMatch($id, $prodId, $upc, $price, $ebayPrice, $directUrl, $asin);
                }

            }
        }else{
          //  mail('jeraldfeller@gmail.com', 'Scrape Alert | amazon', $url);
        }
        sleep(mt_rand(1, 3));
    }





}
