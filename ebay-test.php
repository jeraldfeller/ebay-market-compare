<?php
require 'Model/Init.php';
require 'Model/Scraper.php';
require 'simple_html_dom.php';
$scraper = new Scraper();

$url = 'https://www.ebay.com/itm/Black-Speedo-Silicone-Swimming-Cap-Ear-Wrap-Long-Hair-Waterproof-Hat-Women-Men/232605521152';
$html = file_get_html($url);
if($html){
    $iframe = $html->find('#desc_ifr',0);
    if($iframe){
        $iframeSrc = $iframe->getAttribute('src');
        if($iframeSrc){
            echo $iframeSrc . '<br>';
            $ihtml = file_get_html($iframeSrc);
            if($ihtml){
                $h1 = $ihtml->find('h1');
                $img = $ihtml->find('img');
                if($h1){
                    for($h = 0; $h < count($h1); $h++){
                        $t = trim($h1[$h]->plaintext);
                        if($t == 'Thank You For Your Business!'){

                        }
                    }
                }

                if($img){
                    for($im = 0; $im < count($img); $im++){
                        $imSrc = trim($img[$im]->getAttribute('src'));
                        if(strpos($imSrc, 'salefreaks') != -1){
                            echo $imSrc . '<br>';
                        }
                    }
                }
            }
        }

    }
}
