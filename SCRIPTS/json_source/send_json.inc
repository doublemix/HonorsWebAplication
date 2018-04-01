<?php

require_once "../../db_connect.inc";
require_once "../../get_permissions.inc";

function send_json($query){
	
	
	
	$conn = DBConnect();
	
	if($conn != false){
	
	$json = array();
	
	$result = mysqli_query($conn, $query);
	
	if($result != false) {
	
	while($row = mysqli_fetch_assoc($result)){
		$json = $row;
	}
	
	mysqli_free_result($result);
	
	echo json_encode($json);
	
	}
	
	DBClose($conn);
	
	}
	
}

?>