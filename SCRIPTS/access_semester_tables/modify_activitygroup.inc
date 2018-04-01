<?php
/*
 * modify_activitygroup.inc
*
* Created By: William Grove
*
* Date: 6/17/2016
*
*
* Adds/Deletes values from the
* (prefix)_activitygroup table
*
*
*/

require_once '../get_permissions.inc';

function addActivityGroup($ag_title, $ag_description, $ag_imagepath, $conn, $prefix){
	
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][6] == 1) == false){
		return "User Not Permitted to Add, Modify, or Delete Activity Groups";
	}
	
	$sql = "INSERT INTO " . $prefix . "_activitygroup VALUES(null, '$ag_title', '$ag_description', '$ag_imagepath', '#0000ff', '#ffffff')";
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to insert Activity Group.";
	} else {
		return true;
	}
	
}

function deleteActivityGroup($conn, $prefix, $ag_id){
	
	getPermissions($conn);
	
if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][6] == 1) == false){
		return "User Not Permitted to Add, Modify, or Delete Activity Groups";
	}
	
	$sql = "DELETE FROM " . $prefix . "_activitygroup where ag_id = " . $ag_id;
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to delete Activity Group.";
	} else {
		return true;
	}
	
}

?>