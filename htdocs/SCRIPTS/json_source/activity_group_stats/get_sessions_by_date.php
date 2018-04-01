<?php


require_once "../send_json.inc";
require_once "../../db_connect.inc";



if(isset($_GET["prefix"]) && isset($_GET["ag_id"])){
 
$prefix = removeslashes($_GET["prefix"]);
$ag_id =  removeslashes($_GET["ag_id"]);

$conn = DBConnect();

$result = mysqli_query($conn, "SELECT DATE_FORMAT(agses_start_time, '%m/%d/%Y %l:%i %p' ) as \"fdate\", agses_id FROM " . $prefix . "_activitygroupsession WHERE ag_id = $ag_id AND agses_start_time < NOW() order by agses_start_time desc");

	$res_array = array();

	while ( $this_row = mysqli_fetch_assoc ( $result ) ) {
		$res_array[] = $this_row;
	}

	$json =  json_encode($res_array);

	echo "{ \"rows\" : " . $json . " }";
	
	die();
}
?>

