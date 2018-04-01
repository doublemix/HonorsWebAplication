<?php


require_once "../send_json.inc";
require_once "../../db_connect.inc";



if(isset($_GET["prefix"]) && isset($_GET["ag_id"])){
 
$prefix = removeslashes($_GET["prefix"]);
$ag_id =  removeslashes($_GET["ag_id"]);

$conn = DBConnect();

$result = mysqli_query($conn, "SELECT agses_start_time as \"fdate\", agses_id FROM " . $prefix . "_activitygroupsession WHERE ag_id = $ag_id order by agses_start_time");

	$res_array = array();

	while ( $this_row = mysqli_fetch_assoc ( $result ) ) {
		$res_array[] = $this_row;
	}

	$json =  json_encode($res_array);

	echo "{ \"rows\" : " . $json . " }";
	
	die();
}
?>
