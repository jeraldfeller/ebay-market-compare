<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

class Scraper
{
    public $debug = TRUE;
    protected $db_pdo;

    public function curlToGoogle($url){
        $port = '47647';
        $proxy = array(
            '173.208.9.179',
            '167.160.106.67',
            '108.62.246.94',
            '8.29.122.241',
            '196.19.251.19',
            '213.184.115.210',
        );
        $ip = $proxy[mt_rand(0,count($proxy) - 1)];
        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => $url,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "GET",
            CURLOPT_PROXYTYPE => CURLPROXY_HTTP,
            CURLOPT_PROXY => $ip,
            CURLOPT_PROXYPORT => '47647',
            CURLOPT_PROXYUSERPWD => 'ebymarket:dfab7c358',
            CURLOPT_HTTPHEADER => array(
                "Cache-Control: no-cache",
                "Postman-Token: 85969a77-227f-4da2-ab22-81feaa26c0c4"
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


    public function curlToAmazon($url){

        $port = '47647';
        $proxy = array(
            '173.208.9.179',
            '167.160.106.67',
            '108.62.246.94',
            '8.29.122.241',
            '196.19.251.19',
            '213.184.115.210',
        );
        $ip = $proxy[mt_rand(0,count($proxy) - 1)];
        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => $url,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "GET",
            CURLOPT_PROXYTYPE => CURLPROXY_HTTP,
            CURLOPT_PROXY => $ip,
            CURLOPT_PROXYPORT => '47647',
            CURLOPT_PROXYUSERPWD => 'ebymarket:dfab7c358',
            CURLOPT_HTTPHEADER => array(
                "Cache-Control: no-cache",
                "Postman-Token: 85969a77-227f-4da2-ab22-81feaa26c0c4"
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
    public function curlToEbay($url, $proxy){
        $proxy = null;
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        if ($proxy != NULL) {
            curl_setopt($curl, CURLOPT_PROXY, $proxy[mt_rand(0,count($proxy) - 1)]);
        }
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
        $contents = curl_exec($curl);
        curl_close($curl);
        return array('html' => $contents);
    }
    public function curlTo($url, $proxy){

        $port = '47647';
        $proxy = array(
            '173.208.9.179',
            '167.160.106.67',
            '108.62.246.94',
            '8.29.122.241',
            '196.19.251.19',
            '213.184.115.210',
        );
        $ip = $proxy[mt_rand(0,count($proxy) - 1)];
        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => $url,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "GET",
            CURLOPT_PROXYTYPE => CURLPROXY_HTTP,
            CURLOPT_PROXY => $ip,
            CURLOPT_PROXYPORT => '47647',
            CURLOPT_PROXYUSERPWD => 'ebymarket:dfab7c358',
            CURLOPT_HTTPHEADER => array(
                "Cache-Control: no-cache",
                "Postman-Token: 85969a77-227f-4da2-ab22-81feaa26c0c4"
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

    public function delete_all_between($beginning, $end, $string) {
        $beginningPos = strpos($string, $beginning);
        $endPos = strpos($string, $end);
        if ($beginningPos === false || $endPos === false) {
            return $string;
        }

        $textToDelete = substr($string, $beginningPos, ($endPos + strlen($end)) - $beginningPos);

        return str_replace($textToDelete, '', $string);
    }

    public function addCategories($category, $link){
        $pdo = $this->getPdo();
        $sql = 'INSERT INTO `categories`
               SET `category` = "'.$category.'", `url` = "'.$link.'"';
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        $pdo = null;
    }

    public function addSubCategories($id, $category, $link, $hasListings){
        $pdo = $this->getPdo();
        $sql = 'SELECT * FROM `sub_categories` WHERE `category_id` = '.$id.' AND `category` = "'. $category .'"';
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        if(!$stmt->fetch(PDO::FETCH_ASSOC)){
            $sql = 'INSERT INTO `sub_categories`
               SET `category_id` = '.$id.',  `category` = "'.$category.'", `url` = "'.$link.'", `has_listings` = '.$hasListings;
            $stmt = $pdo->prepare($sql);
            $stmt->execute();


            $sql = 'UPDATE `categories` SET `complete` = 1 WHERE `id` = '.$id;
            $stmt = $pdo->prepare($sql);
            $stmt->execute();
        }

        $pdo = null;
    }

    public function addThirdLevelCategories($id, $category, $link){
        $pdo = $this->getPdo();
        $sql = 'SELECT * FROM `third_level_categories` WHERE `category_id` = '.$id.' AND `category` = "'. $category .'"';
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        if(!$stmt->fetch(PDO::FETCH_ASSOC)){
            $sql = 'INSERT INTO `third_level_categories`
               SET `category_id` = '.$id.',  `category` = "'.$category.'", `url` = "'.$link.'"';
            $stmt = $pdo->prepare($sql);
            $stmt->execute();
        }
        $pdo = null;
    }
    public function getCategories(){
        $pdo = $this->getPdo();
        $sql = 'SELECT *
                  FROM `categories` WHERE `complete` = 0
                  ';
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        $content = array();
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $content[] = $row;
        }

        $pdo = null;
        return $content;
    }

    public function getListings(){
        $pdo = $this->getPdo();
        $sql = 'SELECT *
                  FROM `sub_categories` WHERE `status` = 0 LIMIT 2
                  ';
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        $content = array();
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $content[] = $row;
            $sqlUpdate = 'UPDATE `sub_categories` SET `status` = 1 WHERE `id` = '.$row['id'];
            $stmtUpdate = $pdo->prepare($sqlUpdate);
            $stmtUpdate->execute();
        }
        $pdo = null;
        return $content;
    }

    public function insertProductListingLinks($id, $url, $status, $endDate){
        $pdo = $this->getPdo();
        $sql = 'INSERT INTO `product_sold_links`
               SET `sub_category_id` = '.$id.',  `url` = "'.$url.'", `status` = "'.$status.'", `date_sold` = "'.$endDate.'"';
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        $pdo = null;
        return true;
    }

    public function getProductSoldLinks(){
        $pdo = $this->getPdo();
        $sql = 'SELECT DISTINCT url, id
                  FROM `product_sold_links` WHERE `status` = 0 LIMIT 50
                  ';
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        $content = array();
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $content[] = $row;
            $sqlUpdate = 'UPDATE `product_sold_links` SET `status` = 1 WHERE `id` = '.$row['id'];
            $stmtUpdate = $pdo->prepare($sqlUpdate);
            $stmtUpdate->execute();
        }
        $pdo = null;
        return $content;
    }

    public function recordProductInfo($subId, $name, $url, $upc, $price){
        $dateTime = date('Y-m-d H:i:s');
        $pdo = $this->getPdo();
        $sql = 'INSERT INTO `products`
               SET `sub_category_id` = '.$subId.',  
               `product_name` = "'.$name.'",
               `product_url` = "'.$url.'", 
               `product_upc` = "'.$upc.'",
               `product_price` = "'.$price.'",
               `date_executed` = "'.$dateTime.'"
               ';
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        $pdo = null;
        return true;
    }


    public function getCategoriesByName($catName){
        $pdo = $this->getPdo();
        $sql = 'SELECT *
                  FROM `categories` WHERE `category` = "'.$catName.'"
                  ';
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        $content = array();
        if(!$row = $stmt->fetch(PDO::FETCH_ASSOC)){
            $content[] = $row;
        }
        $pdo = null;
        return $content;
    }

    public function getMarketData($market){
        $pdo = $this->getPdo();
        $sql = 'SELECT * FROM `market_sites` WHERE `name` = "'.$market.'"
                  ';
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        $pdo = null;
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function getProducts($offset, $limit){
        $pdo = $this->getPdo();
        $sql = 'SELECT *
                  FROM `products` LIMIT '.$offset.','.$limit;
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        $content = array();
        while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
            $content[] = $row;
        }
        $pdo = null;
        return $content;
    }

    public function recordProductMarketMatch($id, $prodId, $upc, $price, $ebayPrice, $directLink){

        $percentage = $ebayPrice - $price;
        $percentage = $percentage / $ebayPrice;
        $percentage = $percentage * 100;
        if($percentage >= PERCENTAGE_TARGET){
            // send mail notification
            //$this->sendMail($id, $prodId, $price, $directLink);
            $pdo = $this->getPdo();
            $sql = 'INSERT INTO `market_product_match`
               SET `market_site_id` = '.$id.',
               `product_id` = '.$prodId.',
               `upc` = "'.$upc.'",
               `market_price` = '.$price.',
               `ebay_price` = '.$ebayPrice.',
               `market_url` = "'.$directLink.'"
               ';
            $stmt = $pdo->prepare($sql);
            $stmt->execute();

            $sql = 'UPDATE `products` SET `has_match` = 1 WHERE `id` = '.$prodId;
            $stmt = $pdo->prepare($sql);
            $stmt->execute();


            $this->recordToCsv($id, $prodId, $price, $directLink);

        }
        $pdo = null;
        return true;
    }

    public function getProductById($id){
        $pdo = $this->getPdo();
        $sql = 'SELECT *
                  FROM `products` WHERE `id` = "'.$id.'"
                  ';
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        $return = $stmt->fetch(PDO::FETCH_ASSOC);
        $pdo = null;
        return $return;
    }

    public function getMarketById($id){
        $pdo = $this->getPdo();
        $sql = 'SELECT *
                  FROM `market_sites` WHERE `id` = "'.$id.'"
                  ';
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        $return = $stmt->fetch(PDO::FETCH_ASSOC);
        $pdo = null;
        return $return;
    }
    public function recordToCsv($marketId, $prodId, $price, $directLink, $isCsv = false, $csvData = array()){
        $ebayItem = $this->getProductById($prodId);
        $ebayPrice = $ebayItem['product_price'];
        $ebayUrl = $ebayItem['product_url'];
        $ebayUpc = $ebayItem['product_upc'];
        $ebayProductName = $ebayItem['product_name'];
        $message ='';
        if($isCsv){
            $csv = 'google_sheets.csv';
            $data[] = implode('","', array(
                    $csvData[0],
                    $csvData[1],
                    $csvData[2],
                    $ebayPrice,
                    $ebayUrl
                )
            );
        }else{
            $csv = 'product_list.csv';
            $marketData = $this->getMarketById($marketId);
            $data[] = implode('","', array(
                    $ebayUpc,
                    $ebayPrice,
                    $ebayProductName,
                    $ebayUrl,
                    $marketData['name'],
                    $price,
                    $directLink
                )
            );
        }

        $file = fopen($csv,"a");
        foreach ($data as $line){
            fputcsv($file, explode('","',$line));
        }
        fclose($file);

        return true;
    }


    public function recordCsvToGoogle($prodId, $price, $directLink, $store){
        $ebayItem = $this->getProductById($prodId);
        $ebayPrice = $ebayItem['product_price'];
        $ebayUrl = $ebayItem['product_url'];
        $ebayUpc = $ebayItem['product_upc'];
        $ebayProductName = $ebayItem['product_name'];
        $csv = 'google_shopping.csv';
        $data[] = implode('","', array(
                $ebayUpc,
                $price,
                $ebayProductName,
                $store,
                $directLink,
                $ebayPrice,
                $ebayUrl
            )
        );
        $file = fopen($csv,"a");
        foreach ($data as $line){
            fputcsv($file, explode('","',$line));
        }
        fclose($file);
        return true;
    }

    public function sendMail($marketId = false, $prodId, $price, $directLink, $isCsv = false, $csvData = array()){
        $ebayItem = $this->getProductById($prodId);
        $ebayPrice = $ebayItem['product_price'];
        $ebayUrl = $ebayItem['product_url'];
        $ebayUpc = $ebayItem['product_upc'];
        $ebayProductName = $ebayItem['product_name'];
        $message ='';
        if($isCsv){
            $message .= "<table border='1'>
                          <tr>
                            <td>Upc</td>
                            <td>Price</td>
                            <td>Product Title</td>
                            <td>Store</td>
                            <td>Ebay Price</td>
                            <td>Ebay Product Link</td>
                          </tr>
                          <tr>
                            <td>$csvData[0]</td>
                            <td>$csvData[1]</td>
                            <td>$csvData[2]</td>
                            <td>$csvData[3]</td>
                            <td>$ebayPrice</td>
                            <td><a href='$ebayUrl'>$ebayUrl</a></td>
                          </tr>
                        </table>";
        }else{
            $marketData = $this->getMarketById($marketId);
            $message .= "<table border='1'>
                          <tr>
                            <td>Upc</td>
                            <td>Ebay Price</td>
                            <td>Product Name</td>
                            <td>Ebay Product Link</td>
                            <td>Store</td>
                            <td>Store Price</td>
                            <td>Store Product Link</td>
                          </tr>
                          <tr>
                            <td>$ebayUpc</td>
                            <td>$ebayPrice</td>
                            <td>$ebayProductName</td>
                            <td><a href='$ebayUrl'>$ebayUrl</a></td>
                            <td>".$marketData['name']."</td>
                            <td>$price</td>
                            <td><a href='$directLink'>$directLink</a></td>
                          </tr>
                        </table>";
        }
        $email = new PHPMailer();
        //$email->isSMTP(false);
        $email->From      = NO_REPLY_EMAIL;
        $email->FromName      = NO_REPLY_EMAIL;
        $email->Subject   = 'Ebay Product Price Alert';
        $email->Body      = $message;
        $email->IsHTML(true);
        $email->AddAddress( 'jeraldfeller@gmail.com' );
        $email->AddAddress( ADMIN_EMAIL );

        $return = $email->Send();
        return $return;
    }


    public function sendMailGoogle($prodId, $price, $directLink, $store){
        $ebayItem = $this->getProductById($prodId);
        $ebayPrice = $ebayItem['product_price'];
        $ebayUrl = $ebayItem['product_url'];
        $ebayUpc = $ebayItem['product_upc'];
        $ebayProductName = $ebayItem['product_name'];
        $message ='';
        $message .= "<table border='1'>
                          <tr>
                            <td>Upc</td>
                            <td>Price</td>
                            <td>Product Title</td>
                            <td>Store</td>
                            <td>Product Link</td>
                            <td>Ebay Price</td>
                            <td>Ebay Product Link</td>
                          </tr>
                          <tr>
                            <td>$ebayUpc</td>
                            <td>$price</td>
                            <td>$ebayProductName</td>
                            <td>$store</td>
                            <td>$directLink</td>
                            <td>$ebayPrice</td>
                            <td><a href='$ebayUrl'>$ebayUrl</a></td>
                          </tr>
                        </table>";
        $email = new PHPMailer();
        //$email->isSMTP(false);
        $email->From      = NO_REPLY_EMAIL;
        $email->FromName      = NO_REPLY_EMAIL;
        $email->Subject   = 'Ebay Product Price Alert';
        $email->Body      = $message;
        $email->IsHTML(true);
        $email->AddAddress( 'jeraldfeller@gmail.com' );
        $email->AddAddress( ADMIN_EMAIL );

        $return = $email->Send();
        return $return;
    }

    public function sendOutPut(){
        $email = new PHPMailer();
        $email->From      = NO_REPLY_EMAIL;
        $email->FromName      = NO_REPLY_EMAIL;
        $email->Subject   = 'Ebay Product Reports';
        $email->Body      = 'Please see file attached';
        $email->AddAttachment( CSV_ROOT.'product_list.csv' , 'product_list' );
        $email->AddAttachment( CSV_ROOT.'google_sheets.csv' , 'google_sheets' );
        $email->AddAttachment( CSV_ROOT.'google_shopping.csv' , 'google_shopping' );
        $email->IsHTML(true);
        $email->AddAddress( 'jeraldfeller@gmail.com' );
     //   $email->AddAddress( ADMIN_EMAIL );

        $return = $email->Send();

        return $return;
    }

    public function updateMarketOffset($id, $limit){
        $pdo = $this->getPdo();
        $sql = 'UPDATE `market_sites` SET `offset` = (`offset` + '.$limit.') WHERE `id` = '.$id;
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        $pdo = null;
    }

    public function reset(){
        $pdo = $this->getPdo();
        $sql = array(
            'UPDATE `market_sites` SET `offset` = 0',
            'DELETE FROM `market_product_match`',
            'DELETE FROM `products`',
            'DELETE FROM `product_sold_links`'
        );

        for($x = 0; $x < count($sql); $x++){
            $stmt = $pdo->prepare($sql[$x]);
            $stmt->execute();
        }

        $pdo = null;
    }

    public function getNoMatchProducts(){
        $pdo = $this->getPdo();
        $sql = 'SELECT *
                  FROM `products` WHERE `has_match` = 0
                  ';
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        $contents = array();
        while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
            $contents[] = $row;
        }
        $return = $contents;
        $pdo = null;

        return $return;
    }

    public function getPdo()
    {
        if (!$this->db_pdo)
        {
            if ($this->debug)
            {
                $this->db_pdo = new PDO(DB_DSN, DB_USER, DB_PWD, array(PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING));
            }
            else
            {
                $this->db_pdo = new PDO(DB_DSN, DB_USER, DB_PWD);
            }
        }
        return $this->db_pdo;
    }
}