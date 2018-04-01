<?php

require_once "../../db_connect.inc";

if(isset($_POST["capstonereviewdata"])){
	
	$usr_id = "";
	
	
	if(isset($_POST["usr_id"])){
		$usr_id = removeslashes($_POST["usr_id"]);
	}
	
	
	$conn = DBConnect();
	
	$result = mysqli_query($conn, "SELECT capstone_id, capstone_name, capstone_description, capstone_requirements, capstone_advisor  From capstone JOIN users USING(usr_id) where usr_id = $usr_id AND capstone_complete = 0");
		 
	if(mysqli_num_rows($result) < 1){
		exit;
	}
	
	echo json_encode(mysqli_fetch_row($result));
	
	
	
	
} else {
	
}