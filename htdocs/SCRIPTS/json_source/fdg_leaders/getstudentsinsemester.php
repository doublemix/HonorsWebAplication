<?php
session_start();

include_once '../../db_connect.inc';
include_once '../../get_permissions.inc';

if(isset($_SESSION["userid"])){
	
	$conn = DBConnect();
	
	getPermissions($conn);
	
	
	
	if($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][3] == 1){
		
		$prefix = removeslashes($_GET["prefix"]);
		
		$term = removeslashes($_GET["term"]);
		
		
		
		$studentCheck = "SELECT pstu_id FROM " . $prefix . "_currentstudents where pstu_in_fdg = 0";
		
		$result = mysqli_query($conn, "SELECT CONCAT_WS(' ', usr_fname, usr_lname) AS \"name\", usr_id FROM users where (CONCAT_WS(' ', usr_fname, usr_lname) like('$term%') OR usr_school_id like('$term%')) AND usr_status = 2 AND usr_id IN ($studentCheck)");
		
		if(mysqli_num_rows($result) > 0){
		
		$json = "[";	
		$count = 0;
		$limit = mysqli_num_rows($result);
		while($row = mysqli_fetch_row($result)) {
            $json.= "{ \"value\" : \"" . $row[0] . "\", \"id\" : \"" . $row[1] . "\" }";
            $count++;
            
            if($count < $limit){
            	$json.=",";
            }
    	}
	
    	$json.= "]";
			//$json = json_encode ( $res_array );
			echo $json;
		}
		
	}
	
}






?>