<?php


require_once "../send_json.inc";
require_once "../../db_connect.inc";



if(isset($_GET["prefix"])){
 
$prefix = removeslashes($_GET["prefix"]);

$conn = DBConnect();

$result = mysqli_query($conn, "SELECT pif_title, pif_id FROM " . $prefix . "_pif WHERE pif_start_date < NOW() order by pif_start_date desc");

	$res_array = array();

	while ( $this_row = mysqli_fetch_assoc ( $result ) ) {
		$res_array[] = $this_row;
	}

	$json =  json_encode($res_array);

	echo "{ \"rows\" : " . $json . " }";
	
	die();
}
?>

