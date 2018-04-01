<?php
/*
 * modify_permissions.inc
 * 
 * Created By: William Grove
 * 
 * Date: 6/16/2016
 * 
 * 
 * Adds/Deletes values from the permissions table
 * 
*/

require_once '../get_permissions.inc';

function addPermissions($perms, $usr_id, $conn, $is_add_user){
	
	getPermissions($conn);
	
	if($_SESSION["permissions"][0] != 1){
		return "You do not have permission to add permissions (Irony).";
	}
	
	$sql = "";
	
	if($_SESSION["permissions"][0] = 1){
		$sql = "insert into permissions values (null, $usr_id, " . "0" . ", ". $perms[1] . ", ". $perms[2] . ", ". $perms[3] . ", ". $perms[4] . ", ". $perms[5] . ", ". $perms[6] . ", ". $perms[7] . ", ". $perms[8] . ", " . $perms[9] . ", " . $perms[10] . ", " . $perms[11] . ", " . $perms[12] . ")";
	} else {
		if($_SESSION["permissions"][3] == 1 && $is_add_user == true){
			$sql = "insert into permissions values (null, $user_id, 0,0,0,0,0,0,0,0,0,0,0,0)";
		} else {
			return "Insufficient permissions to add permissions. (Irony)";
		}
	}
	
	$query = mysqli_query($conn, $sql);
	
	if($query == false){
	
		return "Unable to add permissions";
	} else {
		return true;
	}
	
}

function deletePermissions(){
	
}



?>