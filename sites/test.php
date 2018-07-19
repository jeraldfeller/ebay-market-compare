<?php
/**
 * @author apesaru
 * The below program is an example for Product Search based on Keyword
 */
$apiKey = 'aA0NvvAIrVJY0vXTc99mQQ==';
$customData = ''; //This is an optional parameter which adds additional filtering to the result set
$keyword = '010343936713';

if((($apiKey != null && !empty($apiKey)) && ($keyword != null && !empty($keyword))))
    querySearsAPI($apiKey, $customData, $keyword);
else
    echo 'Your request is missing required parameters';

function querySearsAPI($apiKey, $customData, $keyword){
    //Production URL link which is same for all the APIs
    $baseURL = 'http://api.developer.sears.com/';

    /*
     * This is the URL path which varies with the type of search we want to do
     * search -> Variable, changes based on type of search
     * Sears -> Search can be done in 3 stores - Sears, Kmart or MyGofer
     * xml -> 2 response types are supported (xml and json)
     * keyword -> As this search is based on keyword
     */
    $pathURI = 'v2.1/products/search/Sears/xml/keyword/';

    //Appending the parameters
    $parameters = $keyword . '?customData=' . $customData . '&apikey=' . $apiKey;

    //Actual URL which hits Sears API
    $completeUrl = $baseURL . $pathURI . $parameters;
    echo 'Actual URL formed is : ' , $completeUrl;

    $response = sendGetRequest($completeUrl);
    echo $response;
}

function sendGetRequest($completeUrl){
    //Initialise a new cURL resource
    $con = curl_init();

    //Sets the URL to fetch. This can also be set when initializing a session with curl_init()
    curl_setopt($con, CURLOPT_URL, $completeUrl);

    //Return the transfer as a string of the return value of curl_exec() instead of outputting it out directly
    curl_setopt($con, CURLOPT_RETURNTRANSFER, 1);

    //Grab URL and pass it to the browser
    $result = curl_exec($con);

    echo "\r\n" . 'The final output is : ' . $result;

    //Close cURL resource, and free up system resources
    curl_close($con);
}
?>