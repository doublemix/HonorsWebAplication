<?php

/*
 * modify_fdg_points.inc
*
* Created By: William Grove
*
* Date: 6/18/2016
*
*
* Adds/Delete/Modify values to the
* (prefix)_fdg_members
*
*
*/

require_once '../get_permissions.inc';

function addFDGReport($pfdg_id, $pfdg_report_start_date, $pfdg_report_end_date, $pfdg_report_hours, $pfdg_report_description, $conn, $prefix){
	
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][3] == 1) == false){
	
		$sql = "SELECT * FROM " . $prefix . "_fdg_leaders where pstu_id = " . $_SESSION["userid"];
	
		$result = mysqli_query($conn, $sql);
	
		if(mysqli_num_rows($result) < 1){
			return "You do not have permission to add FDG reports.";
		}
	
	}
	
	$sql = "INSERT INTO " . $prefix . "_fdg_reports VALUES(null, $pfdg_id, STR_TO_DATE('$pfdg_report_start_date', '%m/%d/%Y %I:%i %p' ), STR_TO_DATE('$pfdg_report_end_date', '%m/%d/%Y %I:%i %p' ), $pfdg_report_hours, '$pfdg_report_description')";
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to create fdg report.";
	} else {
		return true;
	}
}

function deleteFDGReport($pfdg_report_id, $conn, $prefix){
	
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][3] == 1) == false){
	
		$sql = "SELECT * FROM " . $prefix . "_fdg_leaders where pstu_id = " . $_SESSION["userid"];
	
		$result = mysqli_query($conn, $sql);
	
		if(mysqli_num_rows($result) < 1){
			return "You do not have permission to delete FDG reports.";
		}
	}
	
	$sql = "DELETE FROM " . $prefix . "_fdg_reports where pfdg_report_id = " . $pfdg_report_id;
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to delete fdg report.";
	} else {
		return true;
	}
	
}