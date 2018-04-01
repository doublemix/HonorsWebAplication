<?php
session_start();

include_once '../../db_connect.inc';
include_once '../../get_permissions.inc';

if(isset($_SESSION["userid"])){
	
	$conn = DBConnect();
	
	getPermissions($conn);
		
		$prefix = removeslashes($_POST["prefix"]);
		
		$query = "SELECT usr_fname, usr_lname, usr_school_id, com_title, com_description, com_advisor, com_advisor_contact, com_date, com_id, com_hours ";
		$query .= " FROM "  . $prefix . "_com_serv Join users ON (pstu_id = usr_id) WHERE com_verified = 1 ORDER BY com_date LIMIT 1";
		$result = mysqli_query($conn, $query);		
		
		file_put_contents("log.txt", mysqli_error($conn));
		
		
		$row = mysqli_fetch_assoc($result);
		
		
		
		
		
    			
			//$json = json_encode ( $res_array );
			echo json_encode($row);
		
		
	
	
}

die();




?>
