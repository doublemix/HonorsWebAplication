<?php
/*
 * modify_capstone.inc
 *
 * Created By: William Grove
 *
 * Date: 6/16/2016
 *
 *
 * Adds/Deletes values from the capstone table
 *
 *
 *
 */
require_once '../get_permissions.inc';

function addCapstone($usr_id, $capstone_name, $capstone_description, $capstone_advisor, $capstone_requirements, $capstone_startdate, $capstone_enddate, $conn) {
	if (getPermissions ( $conn ) == false) {
		return "Unable to access permissions.";
	}
	
	if ($_SESSION ["permissions"] [0] != 1) {
		echo "You do not have permission to add capstones.";
	}
	
	$sql  = "SELECT capstone_id FROM capstone WHERE capstone_complete = 0 AND usr_id = " . $usr_id;
	
	$result = mysqli_query ( $conn, $sql );
	
	if(mysqli_num_rows($result) > 0){
		return "User already has active capstone.";
	}
	
	$sql = "INSERT INTO capstone VALUES (null, $usr_id, '$capstone_name', '$capstone_description', '$capstone_advisor', '$capstone_requirements', STR_TO_DATE('$capstone_startdate', '%m/%d/%Y %I:%i %p' ), STR_TO_DATE('$capstone_enddate', '%m/%d/%Y %I:%i %p' ), 0)";
	
	
	
	
	$result = mysqli_query ( $conn, $sql );
	
	if ($result == false) {
		return "Failed to add capstone project.";
	} else {
		return true;
	}
}
function deleteCapstone($capstone_id, $conn) {
	if (getPermissions ( $conn ) == false) {
		return "Unable to access permissions.";
	}
	
	if ($_SESSION ["permissions"] [0] != 1) {
		echo "You do not have permission to remove capstones.";
	}
	
	$result = mysqli_query ( $conn, "DELETE FROM capstone WHERE capstone_id = " . $capstone_id );
	
	if (result == false) {
		return "Failed to delete capstone.";
	} else {
		return true;
	}
}
function acceptCapstone($capstone_id, $conn) {
if (getPermissions ( $conn ) == false) {
		return "Unable to access permissions.";
	}
	
	if ($_SESSION ["permissions"] [0] != 1) {
		echo "You do not have permission to accept capstones.";
	}
	
	$result = mysqli_query($conn, "UPDATE capstone SET capstone_complete = 1 WHERE capstone_id = " . $capstone_id);
	
	if(result == false){
		return "Capstone reject failed.";
	} else {
		return true;
	}
}
function rejectCapstone($capstone_id, $conn) {
	if (getPermissions ( $conn ) == false) {
		return "Unable to access permissions.";
	}
	
	if ($_SESSION ["permissions"] [0] != 1) {
		echo "You do not have permission to reject capstones.";
	}
	
	$result = mysqli_query($conn, "UPDATE capstone SET capstone_complete = 2 WHERE capstone_id = " . $capstone_id);
	
	if(result == false){
		return "Capstone reject failed.";
	} else {
		return true;
	}
	
}

?>