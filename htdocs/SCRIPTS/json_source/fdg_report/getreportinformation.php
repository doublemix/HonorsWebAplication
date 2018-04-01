<?php


require_once "../send_json.inc";
require_once "../../db_connect.inc";



if(isset($_GET["prefix"]) && isset($_GET["pfdg_report_id"])){
 
$conn = DBConnect();	
	
$prefix = removeslashes($_GET["prefix"]);
$pfdg_report_id  =  removeslashes($_GET["pfdg_report_id"]);

$result = mysqli_query($conn, "SELECT pfdg_report_start_date, pfdg_report_end_date, pfdg_report_hours, pfdg_report_description FROM " . $prefix . "_fdg_reports WHERE pfdg_report_id = " . $pfdg_report_id);

	$res_array = array();

	while ( $this_row = mysqli_fetch_assoc ( $result ) ) {
		$res_array[] = $this_row;
	}

	$json =  json_encode($res_array);

	echo "{ \"rows\" : " . $json . " }";
	
	die();
}
?>