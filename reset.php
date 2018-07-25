<?php
require '/var/www/html/ebay-market-compare/Model/Init.php';
require '/var/www/html/ebay-market-compare/Model/Scraper.php';

$scraper = new Scraper();
$return = $scraper->reset();

echo $return;