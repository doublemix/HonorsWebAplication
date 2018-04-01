<?php 
/*
 * modify_fdg_event_attendence.inc
 *
 * Created By: William Grove
 *
 * Date: 6/18/2016
 *
 *
 * Adds/Delete/Modify values to the
 * (prefix)_fdg_event_attendence
 *
 *
 */

require_once '../get_permissions.inc';

function addFDGEventAttendence($pfdg_event_id, $pstu_id, $conn, $prefix){
	
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][3] == 1) == false){
	return "You do not have permission to add FDG event attendence.";
	}
	
	$sql = "INSERT INTO " . $prefix . "_fdg_event_attendence VALUES(null, $pfdg_event_id, $pstu_id)";
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to add event attendence.";
	} else {
		return true;
	}
}

function deleteFDGEventAttendence($pfdg_eve_att_id, $conn, $prefix ){
	
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][3] == 1) == false){
		return "You do not have permission to add FDG event attendence.";
	}
	
	$sql = "DELETE FROM " . $prefix . "_fdg_event_attendence where pfdg_eve_att_id = " . $pfdg_eve_att_id; 
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to delete event attendence.";
	} else {
		return true;
	}
}
