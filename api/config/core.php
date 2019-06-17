<?php

ini_set('display_errors', 1);
error_reporting(E_ALL);

$home_url="http://testdoitsoftware.local/api/";

$page = isset($_GET['page']) ? $_GET['page'] : 1;
$records_per_page = 5;

$from_record_num = ($records_per_page * $page) - $records_per_page;
date_default_timezone_set('Europe/Kiev');

$key = "example_key";
$iss = "http://testdoitsoftware.local";
$aud = "http://testdoitsoftware.local";
$iat = 1356999524;
$nbf = 1357000000;
