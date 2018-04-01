<?php


require_once "../send_json.inc";
require_once "../../db_connect.inc";



if(isset($_GET["prefix"]) && isset($_GET["pfdg_id"])){
 
$prefix = removeslashes($_GET["prefix"]);
$pfdg_id =  removeslashes($_GET["pfdg_id"]);

$conn = DBConnect();

$result = mysqli_query($conn, "SELECT pfdg_report_start_date as \"fdate\", pfdg_report_id FROM " . $prefix . "_fdg_reports WHERE pfdg_id = $pfdg_id order by pfdg_report_start_date");

	$res_array = array();

	while ( $this_row = mysqli_fetch_assoc ( $result ) ) {
		$res_array[] = $this_row;
	}

	$json =  json_encode($res_array);

	echo "{ \"rows\" : " . $json . " }";
	
	die();
}
?>