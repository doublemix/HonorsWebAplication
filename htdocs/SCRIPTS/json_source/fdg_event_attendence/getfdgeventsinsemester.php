<?php


require_once "../send_json.inc";
require_once "../../db_connect.inc";



if(isset($_GET["prefix"])){
 
$prefix = removeslashes($_GET["prefix"]);

$conn = DBConnect();

$result = mysqli_query($conn, "SELECT pfdg_event_name, pfdg_event_id FROM " . $prefix . "_fdg_event WHERE pfdg_start_date <= NOW() ORDER BY pfdg_start_date desc" );

	$res_array = array();

	while ( $this_row = mysqli_fetch_assoc ( $result ) ) {
		$res_array[] = $this_row;
	}

	mysqli_free_result($result);
	DBClose($conn);
	
	
	$json =  json_encode($res_array);

	
	
	
	echo "{ \"rows\" : " . $json . " }";
	
	die();
}
?>
