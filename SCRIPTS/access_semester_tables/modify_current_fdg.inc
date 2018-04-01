<?php
/*
 * modify_current_fdg.inc
 *
 * Created By: William Grove, at 12:00 am!
 *
 * Date: 6/18/2016
 *
 *
 * Adds/Delete/Modify values to the
 * (prefix)_current_fdg table
 *
 *	
 */

require_once '../get_permissions.inc';

function addCurrentFDG($fdg_id, $conn, $prefix){
	
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][3] == 1) == false){
		return "You do not have permissions to add Current FDG's.";
	}
	
	$sql = "INSERT INTO " . $prefix . "_fdg VALUES($fdg_id)";
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to add Current FDG.";
	} else {
		return true;
	}
	
}

function deleteCurrentFDG($fdg_id, $conn, $prefix) {
	
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][3] == 1) == false){
		return "You do not have permissions to add Current FDG's.";
	}
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1) == false){
		return "You do not have permissions to remove Current FDG's.";
	}
	
	$rows = mysqli_query($conn, "SELECT * FROM " . $prefix . "_fdg_members where pfdg_id = $fdg_id");
	
	if(mysqli_num_rows($rows) > 0){
		return "Do not delete Current FDG with members. Data loss will occur.";
	}
	
	$sql = "DELETE FROM " . $prefix . "_fdg where pfdg_id = " . $fdg_id;
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to delete Current FDG.";
	} else {
		return true;
	}
}
?>