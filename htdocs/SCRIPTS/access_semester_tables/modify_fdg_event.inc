<?php 
/*
 * modify_fdg_event.inc
 *
 * Created By: William Grove
 *
 * Date: 6/18/2016
 *
 *
 * Adds/Delete/Modify values to the
 * (prefix)_fdg_event
 *
 *
 */

require_once '../get_permissions.inc';

function addFDGEvent($pfdg_event_name, $pfdg_event_description, $pfdg_start_date, $pfdg_end_date, $conn, $prefix){
	
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][3] == 1) == false){
	return "You do not have permission to add FDG event attendence.";
	}
	
	$sql = "INSERT INTO " . $prefix . "_fdg_event VALUES(null, '$pfdg_event_name', '$pfdg_event_description', STR_TO_DATE('$pfdg_start_date', '%m/%d/%Y %l:%i %p' ), STR_TO_DATE('$pfdg_end_date', '%m/%d/%Y %l:%i %p' ),'#0000ff' ,'#ffffff')";
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to add fdg event.";
	} else {
		return true;
	}
}

function deleteFDGEvent($pfdg_event_id, $conn, $prefix ){
	
	getPermissions($conn);
	
if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][3] == 1) == false){
	return "You do not have permission to delete FDG event attendence.";
	}
	
	$sql = "DELETE FROM " . $prefix . "_fdg_event where pfdg_event_id = " . $pfdg_event_id; 
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to delete event.";
	} else {
		return true;
	}
}


?>