<?php
/*
 * modify_pif.inc
 *
 * Created By: William Grove
 *
 * Date: 6/18/2016
 *
 *
 * Adds/Delete/Modify values to the
 * (prefix)_pif
 *
 *
 */

require_once '../get_permissions.inc';

function addPif($pif_start_date, $pif_end_date, $pif_title, $pif_description, $conn, $prefix){
	
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][8] == 1) == false){
		return "You do not have permission to add Pifs";
	}
	
	$sql = "INSERT INTO " . $prefix . "_pif VALUES(null, STR_TO_DATE('$pif_start_date', '%m/%d/%Y %I:%i %p' ), STR_TO_DATE('$pif_end_date', '%m/%d/%Y %I:%i %p' ), '$pif_title', '$pif_description', '#0000ff', '#ffffff')";
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to add PIF.";
	} else {
		return true;
	}
}

function deletePif($pif_id, $conn, $prefix){
	
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][8] == 1) == false){
		return "You do not have permission to delete Pifs";
	}
	
	$sql = "DELETE FROM " . $prefix . "_pif where pif_id = " . $pif_id;
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to add PIF.";
	} else {
		return true;
	}
	
}

