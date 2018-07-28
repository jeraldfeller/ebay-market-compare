<?php
require 'Model/Scraper.php';
require 'simple_html_dom.php';
//$url  = 'https://www.ebay.com/itm/BMW-Stainless-Steel-Gripper-Travel-Mug-Silver-15oz/302809923977?hash=item4680e0c189:g:SLQAAOSw6lJbT23m';
$url = 'https://www.ebay.com/itm/BRP-Can-Am-Offroad-Curved-Stainless-Steel-Travel-Mug-16-oz-/401566416471?oid=302809923977';
$html = curlTo($url);
//var_dump($html);
echo $html;
function curlTo($url){
    $curl = curl_init();

    curl_setopt_array($curl, array(
        CURLOPT_URL => $url,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => "",
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 30,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => "GET",
        CURLOPT_HTTPHEADER => array(
            "Cache-Control: no-cache",
            "Postman-Token: ca45fcc9-3173-4a58-aa13-1c9b58315940"
        ),
    ));

    $response = curl_exec($curl);
    $err = curl_error($curl);

    curl_close($curl);

    if ($err) {
        echo "cURL Error #:" . $err;
    } else {
        echo $response;
    }
}