<?php
require 'Model/Init.php';
require 'Model/Scraper.php';
require 'simple_html_dom.php';
$scraper = new Scraper();
$productLinks = $scraper->getProductSoldLinks();
foreach($productLinks as $row){
    $url = $row['url'];
    $id = $row['id'];
    $htmlData = $scraper->curlToEbay($url, null);
    if($htmlData['html']){
        $html = str_get_html($htmlData['html']);
        $productName = $html->find('#itemTitle', 0);
        if($productName){
            $productName = addslashes($productName->plaintext);
            $price = $html->find('#prcIsum', 0);
            if(!$price){
                $price = $html->find('#mm-saleDscPrc', 0);
                if(!$price){
                    $price = $html->find('.vi-VR-cvipPrice', 0);
                }
            }
            $price = trim(str_replace($letters, '', $price->plaintext));

            $attrTbl = $html->find('.itemAttr', 0);
            if($attrTbl){
                $tbl = $attrTbl->find('table', 0);
                if($tbl){
                    $h2 = $tbl->find('h2');
                    if(count($h2) > 0){
                        for($x = 0; $x < count($h2); $x++){
                            $itemProp = $h2[$x]->getAttribute('itemprop');
                            if($itemProp){
                                if($itemProp == 'gtin13'){
                                    $upc = strtolower(trim($h2[$x]->plaintext));
                                    echo $upc . '<br>';
                                    if(!preg_match("/[a-z]/i", $upc)){
                                        $scraper->recordProductInfo($id, $productName, $url, $upc, $price);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

    }

}