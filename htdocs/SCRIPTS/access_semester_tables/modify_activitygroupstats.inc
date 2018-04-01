<?php
/*
 * modify_activitygroupstats.inc
*
* Created By: William Grove, at 12:00 am!
*
* Date: 6/18/2016
*
*
* Adds/Deletes values from the
* (prefix)_activitygroupstats table
*
*
*/

require_once '../get_permissions.inc';

 function addActivityGroupStat($pstu_id, $agses_id, $conn, $prefix){
 	
 getPermissions($conn);
	
	$is_leader = false;
	
	$result = mysqli_query($conn, "Select * from " . $prefix . "_activitygroupleaders where pstu_id = " . $_SESSION["userid"]);
	
	if(mysqli_num_rows($result) > 0){
		$is_leader = true;
	}
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 ||  $_SESSION["permissions"][6] == 1 || $is_leader == true) == false){
		return "User Not Permitted to Add, Modify, or Delete Activity Group Stats.";
	}
 	
 	$sql = "INSERT INTO " . $prefix . "_activitygroupstats VALUES(null, $pstu_id, $agses_id)";

 	$result = mysqli_query($conn, $sql);
 	
 	if($result == false){
 		return "Failed to insert Activity Group Stat.";
 	} else {
 		return true;
 	}
 }

 function deleteActivityGroupStat($conn, $prefix, $agstat_id){
 	
 	getPermissions($conn);
	
	$is_leader = false;
	
	$result = mysqli_query($conn, "Select * from " . $prefix . "_activitygroupleaders where pstu_id = " . $_SESSION["userid"]);
	
	if(mysqli_num_rows($result) > 0){
		$is_leader = true;
	}
	
 if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 ||  $_SESSION["permissions"][6] == 1 || $is_leader == true) == false){
		return "User Not Permitted to Add, Modify, or Delete Activity Group Stats.";
	}
 	
 	$sql = "DELETE FROM " . $prefix . "_activitygroupstats where agstat_id = " . $agstat_id;
 	
 	$result = mysqli_query($conn, $sql);
 	
 	if($result == false){
 		return "Failed to delete Activity Group Stat.";
 	} else {
 		return true;
 	}
 	
 }

?>