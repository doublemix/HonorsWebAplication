<?php
/*
 * modify_fdg_members.inc
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



function addFDGMembers($pfdg_id, $pstu_id, $conn, $prefix){
	
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][3] == 1) == false){
		return "You do not have permission to modify FDG members.";
	}
	
	$sql = "INSERT INTO " . $prefix . "_fdg_members VALUES(null, $pfdg_id, $pstu_id)";
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to add fdg member.";
	} else {
		return true;
	}
	
}

function deleteFDGMembers($pfdg_member_id, $conn, $prefix){
	
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][3] == 1) == false){
		return "You do not have permission to modify FDG members.";
	}
	
	$sql = "DELETE FROM " . $prefix . "_fdg_members where pfdg_member_id = " . $pfdg_member_id;
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to add fdg member.";
	} else {
		return true;
	}
}