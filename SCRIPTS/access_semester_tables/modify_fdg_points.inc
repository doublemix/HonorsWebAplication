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

function addFDGPoints($pfdg_id, $pfdg_event_id, $pfdg_points_points, $conn, $prefix){
	
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][3] == 1) == false){
		return "You do not have permission to modify FDG Points.";
	}
	
	$sql = "INSERT INTO " . $prefix . "_fdg_points VALUES(null, $pfdg_id, $pfdg_event_id, $pfdg_points_points)";
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to add fdg points.";
	} else {
		return true;
	}
}

function deleteFDGPoints($pfdg_points_id, $conn, $prefix){
	
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][3] == 1) == false){
		return "You do not have permission to modify FDG Points.";
	}
	
	$sql = "DELETE FROM " . $prefix . "_fdg_points where pfdg_points_id = " . $pfdg_points_id;
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to delete fdg points.";
	} else {
		return true;
	}
}