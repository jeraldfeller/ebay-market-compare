#!/bin/bash
for(( c=1; c<=10; c++))
do
        php /var/www/html/ebay-market-compare/get-sold-listings.php
done
