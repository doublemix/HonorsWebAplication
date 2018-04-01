<?php
/*
 * modify_exception_grants.inc
 *
 * Created By: William Grove
 *
 * Date: 6/18/2016
 *
 *
 * Adds/Delete/Modify values to the
 * (prefix)_exception_grants table
 *
 *
 */

require_once '../get_permissions.inc';

function assignException($excptn_id, $pstu_id, $prefix, $conn){
	
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][4] == 1) == false){
		return "You do not have permissions to create grant exemptions.";
	}
	
	$sql = "INSERT INTO " . $prefix . "_exception_grants VALUES(null, $excptn_id, $pstu_id)"; 
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to grant exception.";
	} else {
		return true;
	}
	
}

function revokeException($grant_id, $conn, $prefix){
	
	getPermissions($conn);
	
if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][4] == 1) == false){
		return "You do not have permissions to revoke exemptions.";
	}
	
	$sql = "DELETE FROM " . $prefix . "_exception_grants where grant_id = " . $grant_id;
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to revoke exception.";
	} else {
		return true;
	}
	
}