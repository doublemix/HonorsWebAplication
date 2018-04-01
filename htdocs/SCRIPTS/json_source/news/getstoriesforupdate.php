<?php
require_once "../send_json.inc";
require_once "../../db_connect.inc";

$rows = 25;
$current = 1;
$limit_l = ($current * $rows) - ($rows);
$limit_h = $limit_l + $rows;
$limit = "";
$order = "";

$conn = DBConnect();

if ($conn != false) {
	
	$json = array();
	$searchPhrase = "";
	
	if (isset ( $_POST ["rowCount"] )) {
		$rows = removeslashes ( $_POST ["rowCount"] );
	}
	
	if (isset ( $_POST ["current"] )) {
		$current = removeslashes ( $_POST ["current"] );
		
		$limit_l = ($current * $rows) - ($rows);
		$limit_h = $rows;
	}
	
	if (isset ( $_POST ["searchPhrase"] )) {
		$searchPhrase = removeslashes ( $_POST ["searchPhrase"] );
	}
	
	if (isset ( $_POST ['sort'] ) && is_array ( $_POST ['sort'] )) {
		$order = "";
		foreach ( $_POST ['sort'] as $key => $value ) {
			$order .= " $key $value";
		}
		$order = " ORDER BY" . $order;
	}
	
	if ($rows == -1) {
		$limit = "";
	} else {
		$limit = " LIMIT $limit_l,$limit_h ";
	}
	
	$query = "SELECT news_id, news_title, news_text, DATE_FORMAT(news_date,'%m/%d/%Y') as \"news_date\" FROM news WHERE (news_title LIKE('$searchPhrase%') OR news_text LIKE('$searchPhrase%')) $order $limit";
	
	
	$result = mysqli_query ( $conn, $query );
	
	$res_array = array();
	
	while ( $this_row = mysqli_fetch_assoc ( $result ) ) {
		$res_array [] = $this_row;
	}
	
	$json = json_encode ( $res_array );	
	
	$result = mysqli_query ( $conn, "SELECT news_id, news_title, news_text, DATE_FORMAT(news_date,'%m/%d/%Y') as \"news_date\" FROM news WHERE (news_title LIKE('$searchPhrase%') OR news_text LIKE('$searchPhrase%'))" );
	
	$trows = mysqli_num_rows($result);
	
	/*
	$trows = 0;
	
	$tots_rows = mysqli_fetch_row ( $total_rows );
	
	$trows = intval ( $tots_rows [0] );
	
	*/
	
	echo "{ \"current\": $current, \"rowCount\":$rows, \"rows\": " . $json . ", \"total\": $trows }";
	$season = json_decode ( $str, true );
}
die ();

?>