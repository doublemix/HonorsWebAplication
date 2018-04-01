<?php
session_start();

include_once '../../db_connect.inc';
include_once '../../get_permissions.inc';

if(isset($_SESSION["userid"])){
	
	$conn = DBConnect();
	
	getPermissions($conn);
	
		$prefix = removeslashes($_GET["prefix"]);
		
		$term = removeslashes($_GET["term"]);
		
		$pfdg_report_id = removeslashes($_GET["pfdg_report_id"]);
		
		$pfdg_id = removeslashes($_GET["pfdg_id"]);
		
		$inner = "SELECT pstu_id from " . $prefix . "_fdg_members where pfdg_id = " . $pfdg_id;
		
		$innertwo = "SELECT pstu_id from " . $prefix . "_fdg_attendence where pfdg_report_id = " . $pfdg_report_id;
		
		$result = mysqli_query($conn, "SELECT CONCAT_WS(' ', usr_fname, usr_lname) AS \"name\", usr_id FROM users where (CONCAT_WS(' ', usr_fname, usr_lname) like('$term%') OR usr_school_id like('$term%')) AND usr_status = 2 AND usr_id NOT IN($innertwo) AND usr_id IN ($inner)");
		
		
		
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
?>