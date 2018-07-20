<?php
require '../Model/Init.php';
require '../Model/Scraper.php';
require '../simple_html_dom.php';
$searchUrl = 'https://www.kohls.com/search.jsp?search=';
$scraper = new Scraper();
$marketData = $scraper->getMarketData('amazon');
$mainUrl = $marketData['url'];
$id = $marketData['id'];

$offset = $marketData['offset'];
$upcList = $scraper->getProducts($offset, MARKET_LIMIT_COUNT);


$upc = 611247369425;
$prodId = 1;
$ebayPrice = 4;
$url = $searchUrl.$upc;
$htmlData = curlTo($url);
var_dump($htmlData);
if($htmlData['html']) {
    $html = str_get_html($htmlData['html']);
    $match = $html->find('.pdp-product-title', 0);
    if($match){
        //$directUrl = $match->find('a', 0)->getAttribute('href');
        $title = $match->plaintext;
        $price = $match->find('.main-price', 0);
        if($price){
            $price = trim(str_replace($letters, '', $price->plaintext));
            echo $title .'<br>';
            echo $price;
        }

    }
}

function curlTo($url){
    $curl = curl_init();

    curl_setopt_array($curl, array(
        CURLOPT_URL => "https://www.kohls.com/search.jsp?submit-search=web-recentsearch&search=086279116710&kls_sbp=55176940255707000490291389426280349224",
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => "",
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 30,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => "GET",
        CURLOPT_SSL_VERIFYPEER => FALSE,
        CURLOPT_SSL_VERIFYHOST => FALSE,
        CURLOPT_POSTFIELDS => "------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"submit-search\"\r\n\r\n086279116710\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW--",
        CURLOPT_HTTPHEADER => array(
            "Cache-Control: no-cache",
            "Postman-Token: 8f427c04-cb26-42fa-9e74-5dcbf86bedd9",
            "content-type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW"
        ),
    ));

    $response = curl_exec($curl);
    $err = curl_error($curl);
    curl_close($curl);

    if ($err) {
        return array('html' => $err);
    } else {
        return array('html' => $response);
    }
}