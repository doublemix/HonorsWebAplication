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

const PERM_ADMIN = 0;
const PERM_WORKER = 1;
const PERM_USERS = 2;
const PERM_FDG = 3;
const PERM_EXEMPTIONS = 4;
const PERM_ACADEMIC_EVENTS = 5;
const PERM_ACTIVITY_GROUPS = 6;
const PERM_COMM_SERV = 7;
const PERM_PIF = 8;
const PERM_IMAGE_SLIDES = 9;
const PERM_EVENTS = 10;
const PERM_NEWS = 11;
const PERM_STATS = 12;

/**
 * Permissions Array:
 *  - PERM_ADMIN
 *  - PERM_WORKER
 *  - PERM_USERS
 *  - PERM_FDG
 *  - PERM_EXEMPTIONS
 *  - PERM_ACADEMIC_EVENTS
 *  - PERM_ACTIVITY_GROUPS
 *  - PERM_COMM_SERV
 *  - PERM_PIF
 *  - PERM_IMAGE_SLIDES
 *  - PERM_EVENTS
 *  - PERM_NEWS
 *  - PERM_STATS
 * @param type $conn
 * @return boolean
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