<?php
/*
 * modify_fdg_attendence.inc
 *
 * Created By: William Grove
 *
 * Date: 6/18/2016
 *
 *
 * Adds/Delete/Modify values to the
 * (prefix)_fdg_attendence
 *
 *
 */

require_once '../get_permissions.inc';

function addFDGAttendence($pfdg_report_id, $pstu_id, $prefix, $conn){
	
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][3] == 1) == false){
		
		$sql = "SELECT * FROM " . $prefix . "_fdg_leaders where pstu_id = " . $_SESSION["userid"];
		
		$result = mysqli_query($conn, $sql);
		
		if(mysqli_num_rows($result) < 1){
			return "You do not have permission to add FDG Attendence records.";
		}
		
	}
	
	$sql = "INSERT INTO " . $prefix . "_fdg_attendence VALUES(null, $pfdg_report_id, $pstu_id)";
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to add attendence.";
	} else {
		return true;
	}
	
}

function deleteFDGAttendence($pfdg_att_id, $conn, $prefix){
	
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][3] == 1) == false){
	
		$sql = "SELECT * FROM " . $prefix . "_fdg_leaders where pstu_id = " . $_SESSION["userid"];
	
		$result = mysqli_query($conn, $sql);
	
		if(mysqli_num_rows($result) < 1){
			return "You do not have permission to delete FDG Attendence records.";
		}
	
	}
	
	$sql = "DELETE FROM " . $prefix . "_fdg_attendence where pfdg_att_id = " . $pfdg_att_id;
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to delete attendence.";
	} else {
		return true;
	}
	
}