<?php
require 'Model/Init.php';
require 'Model/Scraper.php';
require 'simple_html_dom.php';
$scraper = new Scraper();
$listings = $scraper->getListings();
$dateNow = date('Y-m-d', strtotime('-1 days'));
echo $dateNow;
$endDateCount = 0;
foreach($listings as $row){
    $pgn = 1;
    $category = $row['category'];
    $hasListing = true;
    while($hasListing == true){
        // remove this on production
        /*
        if($pgn == 10){
            $hasListing = false;
            break;
        }
        */
        if($endDateCount == 5){
            $hasListing = false;
        }
        $id = $row['id'];
        $url = $row['url'].'?LH_ItemCondition=1000&LH_Sold=1&listingOnly=1&rt=nc&_dmd=2&_sop=13&_pgn='.$pgn;
        echo $category .'<br>';
        echo $url .'<br>';

        $htmlData = $scraper->curlTo($url, null);
        if($htmlData['html']){
            echo '*<br>';
            $html = str_get_html($htmlData['html']);
            $listings = $html->find('.s-item');
            if(count($listings) > 0){
                for($x = 0; $x < count($listings); $x++){
                    $itemLink = $listings[$x]->find('.s-item__link', 0);
                    if($itemLink){
                        $prod = $itemLink->plaintext;
                        $prodLink = $itemLink->getAttribute('href');
                        $endedDate = $listings[$x]->find('.s-item__ended-date', 0);
                        if($endedDate){
                            $endDate = date('Y-m-d', strtotime($endedDate->plaintext));
                        }else{
                            $endDate = 0;
                        }
                        echo $endDate . '<br>';
                        if($endDate >= $dateNow){
                            if($endDate == $dateNow){
                                echo '-Name :'.$prod.'<br>';
                                echo '-Link :'.$prodLink.'<br>';
                                echo '-Ended Date :'.$endDate.'<br>';
                                $scraper->insertProductListingLinks($id, $prodLink, 0, $endDate);
                            }
                        }else{
                            $endDateCount++;
                        }

                    }
                }
            }
        }
        $pgn++;
    }
}
