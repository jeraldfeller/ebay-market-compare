<?php
set_time_limit(-1); //
/*
error_reporting(E_ALL);
ini_set('display_errors', 1);
*/
ob_start();
session_start();
define('DB_USER', 'root');
define('DB_PWD', 'dfab7c358bb163');
define('DB_NAME','eby_db');
define('DB_HOST','localhost');
define('DB_DSN','mysql:host=' . DB_HOST . ';dbname=' . DB_NAME);

define('EBAY_URL_PARAM', '?LH_ItemCondition=1000&LH_Sold=1&listingOnly=1&rt=nc&_dmd=1&_pgn=1&_sop=13');

define('ROOT_DIR', '');
define('NO_REPLY_EMAIL', 'noreply@ec2-18-216-85-12.us-east-2.compute.amazonaws.com');
define('ADMIN_EMAIL', 'JamilyFam5@gmail.com');
define('ROOT_DOMAIN', 'http://ec2-18-216-85-12.us-east-2.compute.amazonaws.com/ebay-market-compare/');
define('MARKET_LIMIT_COUNT', 250); // rows25 of data fetched per execution
define('PERCENTAGE_TARGET', 20);
define('CSV_ROOT', '/var/www/html/ebay-market-compare/');
require '/var/www/html/ebay-market-compare/vendor/autoload.php';


$letters=array('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'X', 'Y', 'Z', '$', ',', ' ');