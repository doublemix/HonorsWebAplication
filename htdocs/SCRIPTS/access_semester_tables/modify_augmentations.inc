<?php
/*
 * modify_augmentations.inc
 *
 * Created By: William Grove, at 12:00 am!
 *
 * Date: 6/18/2016
 *
 *
 * Adds/Delete/Modify values to the
 * (prefix)_augmentations table
 *
 *	
 */

/*
 * 
 * aug_complete
 * 
 * 0 - Not reviewed
 * 
 * 1 - Approved
 * 
 * 2 - Rejected
 * 
 */

require_once '../get_permissions.inc';

function addAugmentation($pstu_id, $aug_title, $aug_short_description, $conn, $prefix ){
	
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1) == false){
		return "User Not Permitted to Add or Modify Activity Augmentation Info.";
	}
	
	$sql = "INSERT INTO " . $prefix . "_augmentations VALUES(null, $pstu_id, '$aug_title', '$aug_short_description', 0)";
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to insert Augmentation.";
	} else {
		return true;
	}
}

function deleteAugmentation($conn, $prefix, $aug_id){
	
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1) == false){
		return "User Not Permitted to Add or Modify Activity Augmentation Info.";
	}
	
	$sql = "DELETE FROM " . $prefix . "_augmentations where aug_id = " . $aug_id;
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to delete Augmentation.";
	} else {
		return true;
	}
}

function confirmAugmentation($conn, $prefix, $aug_id){
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1) == false){
		return "User Not Permitted to Add or Modify Activity Augmentation Info.";
	}
	
	$sql = "UPDATE " . $prefix . "_augmentations set aug_complete = 1, aug_reviewer = " .
			$_SESSION["userid"] . " where aug_id = " . $aug_id;
	
	$result = mysqli_query($conn, $sql);
			
	if($result == false){
		return "Failed to update Augmentation.";
	} else {
		return true;
	}
}

function denyAugmentation($conn, $prefix, $aug_id){
	getPermissions($conn);

	if(($_SESSION["permissions"][0] == 1) == false){
		return "User Not Permitted to Add or Modify Activity Augmentation Info.";
	}

	$sql = "UPDATE " . $prefix . "_augmentations set aug_complete = 2, aug_reviewer = " .
			$_SESSION["userid"] . " where aug_id = " . $aug_id;

			$result = mysqli_query($conn, $sql);
				
			if($result == false){
				return "Failed to update Augmentation.";
			} else {
				return true;
			}
}