<?php


require_once "../send_json.inc";
require_once "../../db_connect.inc";



if(isset($_GET["prefix"]) && isset($_GET["agses_id"])){
 
$conn = DBConnect();	
	
$prefix = removeslashes($_GET["prefix"]);
$agses_id  =  removeslashes($_GET["agses_id"]);

$result = mysqli_query($conn, "SELECT agses_start_time, agses_end_time, agses_description FROM " . $prefix . "_activitygroupsession WHERE agses_id = " . $agses_id);

	$res_array = array();

	while ( $this_row = mysqli_fetch_assoc ( $result ) ) {
		$res_array[] = $this_row;
	}

	$json =  json_encode($res_array);

	echo "{ \"rows\" : " . $json . " }";
	
	die();
}
?>
