<?php
/*
 * modify_pif_stats.inc
 *
 * Created By: William Grove
 *
 * Date: 6/18/2016
 *
 *
 * Adds/Delete/Modify values to the
 * (prefix)_pif_stats
 *
 *
 */

require_once '../get_permissions.inc';

function addPifStat($pstu_id, $pif_id, $conn, $prefix){
	
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][8] == 1) == false){
		return "You do not have permission to add PIF stats.";
	}
	
	$sql = "INSERT INTO " . $prefix . "_pif_stats VALUES(null, $pstu_id, $pif_id)";
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to add piff stat.";
	} else {
		return true;
	}
	
	
}

function deletePifStat($pifstat_id, $conn, $prefix ){
	
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][8] == 1) == false){
		return "You do not have permission to add PIF stats.";
	}
	
	$sql = "DELETE FROM " . $prefix . "_pif_stats where pifstat_id = " . $pifstat_id;
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to delete piff stat.";
	} else {
		return true;
	}
}