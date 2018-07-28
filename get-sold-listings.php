<?php
require 'Model/Init.php';
require 'Model/Scraper.php';
require 'simple_html_dom.php';
$scraper = new Scraper();
$listings = $scraper->getListings();
$dateNow = date('Y-m-d', strtotime('-1 days'));
$date = date('Y-m-d');
foreach($listings as $row){
    $pgn = 1;
    $category = $row['category'];
    $hasListing = true;
    $endDateCount = 0;
    while($hasListing == true){
        // remove this on production
        /*
        if($pgn == 20){
            $hasListing = false;
            break;
        }
        */


        $id = $row['id'];
        $url = $row['url'].'?LH_ItemCondition=1000&LH_Sold=1&listingOnly=1&rt=nc&_dmd=2&_sop=13&_pgn='.$pgn;
        $htmlData = $scraper->curlToEbay($url, null);
        if($htmlData['html']){

            $html = str_get_html($htmlData['html']);
            $listings = $html->find('.s-item');
            if(count($listings) > 0){
                $insertData = array();
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

                        if($endDate >= $dateNow){
                            if($endDate == $dateNow){
                                $insertData[] = array($id, $prodLink, 0, $endDate);
                                //$scraper->insertProductListingLinks($id, $prodLink, 0, $endDate);
                            }
                        }else{
                            $endDateCount++;
                            if($endDateCount >= 5){
                                $hasListing = false;
                            }

                        }
                    }
                }

                // insert bulk
                if(count($insertData) > 0){
                    $scraper->insertProductListingLinksBulk($insertData);
                }
            }else{
                $hasListing = false;
            }
        }else{
            $hasListing = false;
            mail('jeraldfeller@gmail.com', 'Scrape Alert | get-sold-listings', $url . "\r\n".$date);
        }
        $pgn++;
        if($pgn == 1000){
            mail('jeraldfeller@gmail.com', 'Scrape Alert | get-sold-listings pgn > 1000', $url . "\r\n".$endDateCount);
        }
    }



}
