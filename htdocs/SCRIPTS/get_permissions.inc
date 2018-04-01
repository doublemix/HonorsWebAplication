<?php
/*
 * get_permissions.inc
 * 
 * Created By: William Grove
 * 
 * Date: 6/16/2016
 * 
 * Sets the permissions of the current user.
 * 
 */

function getPermissions($conn){
	
	$sql = "Select perm_admin, perm_worker, perm_users, perm_fdg, perm_exemptions, perm_academic_events, perm_activity_groups, perm_comm_serv, perm_pif, perm_image_slides, perm_events, perm_news, perm_stats FROM permissions WHERE usr_id =" .  $_SESSION["userid"];
	
	$permissions = array();
	
	$query = mysqli_query($conn, $sql);
	
	if($query == false){
		
		return false;
	}
	
	while ($row = mysqli_fetch_row($query)){
		for ($r = 0; $r < count($row); $r++){
			$permissions[] = $row[$r];
		}
	}
	
	$_SESSION["permissions"] = $permissions;
	
	return true;
}


?>