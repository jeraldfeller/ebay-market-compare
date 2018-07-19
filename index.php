<?php
set_time_limit(-1); //
require 'Model/Init.php';
require 'Model/Scraper.php';
require 'simple_html_dom.php';
$scraper = new Scraper();

$categories = $scraper->getCategories();

foreach($categories as $row){
    $id = $row['id'];
    $url = $row['url'];
    $category = $row['category'];
    echo 'CAT: '. $id . ' '  . $category . '  - ' . $url . '<br>';

    $htmlData = $scraper->curlTo($url, null);

    if($htmlData['html']){
        echo '*<br>';
        $html = str_get_html($htmlData['html']);
           // $subCategories = $html->find('.b-visualnav__tile');
            $subCategories = $html->find('.visual-category-card');
            for($x = 0; $x < count($subCategories); $x++){
               // $subCat = addslashes($subCategories[$x]->plaintext);
               // $subUrl = $subCategories[$x]->getAttribute('href');
                $subCat = addslashes($subCategories[$x]->find('a', 0)->plaintext);
                $subUrl = $subCategories[$x]->find('a', 0)->getAttribute('href');
                echo $subCat . ' - ' . $subUrl . '<br>';
                echo '-<br>';
                $htmSubData = $scraper->curlTo($subUrl, null);
                if($htmSubData['html']){
                    echo '**<br>';
                    $htmlSub = str_get_html($htmSubData['html']);
                    $listingCount = $htmlSub->find('.srp-controls__count-heading', 0);
                    if($listingCount != null){
                        echo '-has listings<br>';
                        $scraper->addSubCategories($id, $subCat, $subUrl, true);
                    }else{
                        $level2Sub = $htmlSub->find('.b-visualnav__tile');
                        for($y = 0; $y < count($level2Sub); $y++){
                            $level2Cat = addslashes($level2Sub[$y]->plaintext);
                            $leve2Url = $level2Sub[$y]->getAttribute('href');
                            echo $level2Cat . '<br>';
                            echo $leve2Url . '<br>';
                            echo '--<br>';
                            $htmSub2Data = $scraper->curlTo($leve2Url, null);

                            if($htmSub2Data['html']){
                                $htmlSub2 = str_get_html($htmSub2Data['html']);
                                $listingCount2 = $htmlSub2->find('.srp-controls__count-heading', 0);
                                if($listingCount2 != null){
                                    echo '--has listings<br>';
                                    $scraper->addSubCategories($id, $level2Cat, $leve2Url, true);
                                }
                            }else{
                                echo '---third level<br>';
                                $scraper->addThirdLevelCategories($id, $level2Cat, $leve2Url);
                            }
                        }
                    }
                }

            }
    }

    echo '<hr>';

}