<?php
/*
 * modify_activitygroupleaders.inc
*
* Created By: William Grove, at 12:00 am!
*
* Date: 6/18/2016
*
*
* Adds/Deletes values from the
* (prefix)_activitygroupleaders table
*
*
*/

require_once '../get_permissions.inc';

function addActivityGroupLeader($ag_id, $pstu_id, $conn, $prefix){
	
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][6] == 1) == false){
		return "User Not Permitted to Add, Modify, or Delete Activity Group Leaders";
	}
	
	$sql = "INSERT INTO " . $prefix . "_activitygroupleaders VALUES(null, $ag_id, $pstu_id)";
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to insert Activity Group Leader.";
	} else {
		return true;
	}
}

function deleteActivityGroupLeader($conn, $prefix, $ag_leaders){
	
	getPermissions($conn);
	
if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][6] == 1) == false){
		return "User Not Permitted to Add, Modify, or Delete Activity Group Leaders";
	}
	
	$sql = "DELETE FROM " . $prefix . "_activitygroupleaders WHERE ag_leaders = " . $ag_leaders;
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to delete Activity Group Leader.";
	} else {
		return true;
	}
}

?>