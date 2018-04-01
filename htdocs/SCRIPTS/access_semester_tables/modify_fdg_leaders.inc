<?php 
/*
 * modify_fdg_leaders.inc
 *
 * Created By: William Grove
 *
 * Date: 6/18/2016
 *
 *
 * Adds/Delete/Modify values to the
 * (prefix)_fdg_leaders
 *
 *
 */

require_once '../get_permissions.inc';

function addFDGLeader($pfdg_id, $pstu_id, $conn, $prefix){
	
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][3] == 1) == false){
		return "You do not have permission to modify FDG events.";
	}
	
	$sql = "INSERT INTO " . $prefix . "_fdg_leaders VALUES(null, $pfdg_id, $pstu_id)";

	$result = mysqli_query($conn, $sql);
	file_put_contents("log.txt", "Error: " . mysqli_error($conn));
	
	if($result === false){
		return "Failed to add fdg leader.";
	} else {
		return true;
	}
}

function deleteFDGLeader($pfdg_leader_id, $conn, $prefix){
	
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][3] == 1) == false){
		return "You do not have permission to modify FDG events.";
	}
	
	$sql = "DELETE FROM " . $prefix . "_fdg_leaders where pfdg_leader_id = " . $pfdg_leader_id;
	
	$result = mysqli_query($conn, $sql);
	
	if($result === false){
		return "Failed to remove fdg leader.";
	} else {
		return true;
	}
}