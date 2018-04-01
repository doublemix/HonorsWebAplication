<?php
/*
 * modify_activitygroupsession.inc
*
* Created By: William Grove, at 12:00 am!
*
* Date: 6/18/2016
*
*
* Adds/Deletes values from the
* (prefix)_activitygroupsession table
*
*
*/

require_once '../get_permissions.inc';

function addActivityGroupSession($ag_id, $agses_start_time, $agses_end_time, $agses_description, $conn, $prefix){

	getPermissions($conn);
	
	$is_leader = false;
	
	$result = mysqli_query($conn, "Select * from " . $prefix . "_activitygroupleaders where pstu_id = " . $_SESSION["userid"]);
	
	if(mysqli_num_rows($result) > 0){
		$is_leader = true;
	}
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][6] == 1  || $is_leader == true) == false){
		return "User Not Permitted to Add, Modify, or Delete Activity Group Leaders";
	}
	
	$sql = "INSERT INTO " . $prefix . "_activitygroupsession VALUES(null, $ag_id, STR_TO_DATE('$agses_start_time', '%m/%d/%Y %I:%i %p' ), STR_TO_DATE('$agses_end_time', '%m/%d/%Y %I:%i %p' ), '$agses_description')";
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to insert Activity Group Session.";
	} else {
		return true;
	}
	
}

function deleteActivityGroupSession($conn, $prefix, $agses_id){

getPermissions($conn);
	
	$is_leader = false;
	
	$result = mysqli_query($conn, "Select * from " . $prefix . "_activitygroupleaders where pstu_id = " . $_SESSION["userid"]);
	
	if(mysqli_num_rows($result) > 0){
		$is_leader = true;
	}
	
if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][6] == 1  || $is_leader == true) == false){
		return "User Not Permitted to Add, Modify, or Delete Activity Group Leaders";
	}
	
	$sql = "DELETE FROM " . $prefix . "_activitygroupsession where agses_id = " . $agses_id;
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to delete Activity Group Session.";
	} else {
		return true;
	}
	
	
}

?>