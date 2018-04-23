<?php
/*
 * modify_exceptions.inc
 *
 * Created By: William Grove
 *
 * Date: 6/18/2016
 *
 *
 * Adds/Delete/Modify values to the
 * (prefix)_exceptions table
 *
 *
 */

/*
 * Types
 *
 * 1 - Activity Group
 * 4 - FDG Group
 * 3 - Community Service
 * 2 - CCE (prev. Academic Events)
 *
 */

require_once '../get_permissions.inc';

function createException($excptn_name, $excptn_type, $excptn_value, $conn, $prefix){

	getPermissions($conn);

if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][4] == 1) == false){
		return "You do not have permissions to create Exemptions.";
	}

	$sql = "INSERT INTO " . $prefix . "_exceptions VALUES(null, '$excptn_name', $excptn_type, $excptn_value)";

	$result = mysqli_query($conn, $sql);

	if($result == false){
		return "Failed to create exception.";
	} else {
		return true;
	}
}

function deleteException($excptn_id, $conn, $prefix){

	getPermissions($conn);

if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][4] == 1) == false){
		return "You do not have permissions to delete Exemptions.";
	}

	$sql = "DELETE FROM " . $prefix . "_exceptions where excptn_id = " . $excptn_id;

	$result = mysqli_query($conn, $sql);

	if($result == false){
		return "Failed to remove exception.";
	} else {
		return true;
	}

}