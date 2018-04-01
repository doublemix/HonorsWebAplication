<?php
/*
 * modify_groups.inc
 *
 * Created By: William Grove
 *
 * Date: 6/16/2016
 *
 *
 * Adds/Deletes values from the groups table
 *
 */

/*
 * Group Types
 * 
 * 3 - Cannot Delete (SEC/PIF TEAM/ect.)
 * 1 - Invite Only
 * 2 - Open for everyone
 */

require_once '../get_permissions.inc';

function addGroup($name, $description, $admin, $imagename, $grouptype, $conn){
	
	get_permissions($conn);
	
	if($grouptype == 3){
		if (($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][4] == 1) == false){
			return "You do not have permission to make a permanent group.";
		} 
	}
	
	$sql = "Insert into groups values (null, '$name', '$description', $admin, '$imagename', $grouptype)";
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to create group.";
	} else {
		return true;
	}
	
}

function deleteGroup($group_id, $conn){
	
	get_permissions($conn);
	
	$result = mysqli_query($conn, "SELECT group_type, group_admin FROM groups where group_id = " . $group_id);
	
	$group_type = "";
	$group_admin = "";
	
	while ($row = mysqli_fetch_row($result)){
		$group_type = intval($row[0]);
		$group_admin = $row[2];
	}
	
	if($group_type == 3){
		if (($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][4] == 1) == false){
			return "You do not have permission to delete a permanent group.";
		}
	}
	
	if ($group_type != 3 ){
		if (($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][4] == 1) == false){
			if ($_SESSION["userid"] != $group_admin){
				return "You do not have permission to delete this table!";
			}
		}
	}
	
	$result = mysqli_query($conn, "DELETE FROM groups WHERE group_id = $group_id");
	
	if($result == false){
		return "Failed to delete group.";
	} else {
		return true;
	}
	
}


?>