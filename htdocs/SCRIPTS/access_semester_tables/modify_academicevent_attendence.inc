<?php
/*
 * modify_academicevent_attendence.inc
 *
 * Created By: William Grove
 *
 * Date: 6/16/2016
 *
 *
 * Adds/Deletes values from the  
 * (prefix)_academicevent_attendence table
 *
 *
 */

require_once '../get_permissions.inc';

function addAcademicEventAttendenceRecord($acad_id, $pstu_id, $conn, $prefix){
	
getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][5] == 1) == false){
		return "User Not Permitted to Add, Modify, or Delete Academic Event Attendence Records.";
	}
	
	$sql = "INSERT INTO " . $prefix . "_academicevent_attendence VALUES(null, $acad_id, $pstu_id)";
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to insert Academic Event Attendence Record.";
	} else {
		return true;
	}
	
}

function deleteAcademicEventAttendenceRecord($acad_att_id, $conn, $prefix){
	
	getPermissions($conn);
	
if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][5] == 1) == false){
		return "User Not Permitted to Add, Modify, or Delete Academic Event Attendence Records.";
	}
	
	$sql = "DELETE FROM " . $prefix . "_academicevent_attendence WHERE acad_att_id = " . $acad_att_id;
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to delete Academic Event Attendence Record.";
	} else {
		return true;
	}
	
}

?>