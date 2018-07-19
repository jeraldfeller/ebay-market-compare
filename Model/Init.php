<?php
set_time_limit(-1); //
error_reporting(E_ALL);
ini_set('display_errors', 1);
ob_start();
session_start();
define('DB_USER', 'root');
define('DB_PWD', '');
define('DB_NAME','eby_db');
define('DB_HOST','localhost');
define('DB_DSN','mysql:host=' . DB_HOST . ';dbname=' . DB_NAME);

define('EBAY_URL_PARAM', '?LH_ItemCondition=1000&LH_Sold=1&listingOnly=1&rt=nc&_dmd=1&_pgn=1&_sop=13');

define('ROOT_DIR', '');
define('NO_REPLY_EMAIL', 'noreply@149.28.204.93.com');
define('ADMIN_EMAIL', 'jeraldfeller@gmail.com');

define('MARKET_LIMIT_COUNT', 20); // rows of data fetched per execution


require $_SERVER['DOCUMENT_ROOT'].'/vendor/autoload.php';


$letters=array('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'X', 'Y', 'Z', '$', ',', ' ');