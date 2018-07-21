<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

class Scraper
{
    public $debug = TRUE;
    protected $db_pdo;

    public function curlToGoogle($url){
        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => $url,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "GET",
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

        $proxy = null;

        if($proxy != null){
            $option = array(
                CURLOPT_PROXY => $proxy[mt_rand(0,count($proxy) - 1)],
                CURLOPT_URL => $url,
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => "",
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 30,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => "GET",
                CURLOPT_HTTPHEADER => array(
                    "Cache-Control: no-cache",
                    "Postman-Token: ab7aa588-080d-49a1-bae4-03ed5b7517c4"
                )
            );
        }else{
            $option = array(
                CURLOPT_URL => $url,
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => "",
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 30,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => "GET",
                CURLOPT_HTTPHEADER => array(
                    "Cache-Control: no-cache",
                    "Postman-Token: ab7aa588-080d-49a1-bae4-03ed5b7517c4"
                )
            );
        }
        $curl = curl_init();
        curl_setopt_array($curl, $option
        );

        $response = curl_exec($curl);
        $err = curl_error($curl);

        curl_close($curl);

        if ($err) {
            return array('html' => $err);
        } else {
            return array('html' => $response);
        }
    }
    public function curlTo($url, $proxy){

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

        return $content;
    }

    public function getListings(){
        $pdo = $this->getPdo();
        $sql = 'SELECT *
                  FROM `sub_categories` WHERE `status` = 0 LIMIT 1
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
        return $content;
    }

    public function insertProductListingLinks($id, $url, $status, $endDate){
        $pdo = $this->getPdo();
        $sql = 'INSERT INTO `product_sold_links`
               SET `sub_category_id` = '.$id.',  `url` = "'.$url.'", `status` = "'.$status.'", `date_sold` = "'.$endDate.'"';
        $stmt = $pdo->prepare($sql);
        $stmt->execute();

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
        return $content;
    }

    public function getMarketData($market){
        $pdo = $this->getPdo();
        $sql = 'SELECT * FROM `market_sites` WHERE `name` = "'.$market.'"
                  ';
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
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
        return $content;
    }

    public function recordProductMarketMatch($id, $prodId, $upc, $price, $ebayPrice, $directLink){
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

        $percentage = $ebayPrice - $price;
        $percentage = $percentage / $ebayPrice;
        $percentage = $percentage * 100;
        if($percentage >= 15){
            // send mail notification
            $this->sendMail($id, $prodId, $price, $directLink);
        }
        return true;
    }

    public function getProductById($id){
        $pdo = $this->getPdo();
        $sql = 'SELECT *
                  FROM `products` WHERE `id` = "'.$id.'"
                  ';
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function getMarketById($id){
        $pdo = $this->getPdo();
        $sql = 'SELECT *
                  FROM `market_sites` WHERE `id` = "'.$id.'"
                  ';
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
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

    public function updateMarketOffset($id, $limit){
        $pdo = $this->getPdo();
        $sql = 'UPDATE `market_sites` SET `offset` = (`offset` + '.$limit.') WHERE `id` = '.$id;
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
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