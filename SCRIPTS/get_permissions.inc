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

require_once 'constants.php';

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

    if (!isset($_SESSION['userid'])) {
        return false;
    }
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

/**
 * Check if a user has permissions set. The function returns true if the user has the given permission.
 * If an array is passed, the function only returns true if all of the permissions are granted.
 * @param int|array $permission
 */
function hasPermission($permission) {
    if (!isset($_SESSION["permissions"])) {
        return false;
    } else if (is_array($permission)) {
        foreach ($permission as $indPermission) {
            if (!hasPermission($indPermission)) {
                return false;
            }
        }
        return true;
    } else {
        return $_SESSION["permissions"][$permission] == 1;
    }
}


?>