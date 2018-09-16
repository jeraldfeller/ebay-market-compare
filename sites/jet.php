<?php
require '/var/www/html/ebay-market-compare/Model/Init.php';
require '/var/www/html/ebay-market-compare/Model/Scraper.php';
require '/var/www/html/ebay-market-compare/simple_html_dom.php';


$searchUrl = 'https://jet.com/search?term=';
$scraper = new Scraper();
$isReady = $scraper->sitesExecutionReady();
if($isReady == 0) {
    $marketData = $scraper->getMarketData('jet');
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
        $htmlData = $scraper->curlToJet($url, null);
        if ($htmlData['html']) {
            $html = str_get_html($htmlData['html']);
            if($html){
                $scripts = $html->find('script');
                if(count($scripts) > 0) {
                    for ($s = 0; $s < count($scripts); $s++) {
                        $t = $scripts[$s]->getAttribute('type');
                        $src = $scripts[$s]->getAttribute('src');
                        if($t == false && $src == false){
                            $scriptInner = $scripts[$s]->innertext;
                            if(strpos($scriptInner, '__NEXT_DATA__') > 0 ){
                                $contentsJson = trim(str_replace('__NEXT_DATA__ =', '', $scripts[$s]->innertext));
                                $contentsJson = substr($contentsJson, 0, strpos($contentsJson, "module={}"));
                                $contents = json_decode($contentsJson, true);
                                //var_dump($contents);
                                if($contents){
                                    $entity = $contents['props']['initialState']['entities']['collections'];
                                    $product = $entity['product']['entities'];
                                    if(count($product) > 0){
                                        $productPrice = $entity['productPrice']['entities'];
                                        foreach($product as $key => $info){
                                            $productIdentification = $key;
                                        }
                                        foreach($productPrice as $key => $info){
                                            $price = $info['price']['effective'];
                                        }
                                        $scraper->recordProductMarketMatch($id, $prodId, $upc, $price, $ebayPrice, $url, $productIdentification);
                                    }
                                }
                            }
                        }
                    }
                }
            }

        }else{
            //    mail('jeraldfeller@gmail.com', 'Scrape Alert | newegg', $url);
        }
    }


}