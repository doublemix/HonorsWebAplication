<?php
/*
 * modify_com_serv.inc
 *
 * Created By: William Grove, at 12:00 am!
 *
 * Date: 6/18/2016
 *
 *
 * Adds/Delete/Modify values to the
 * (prefix)_com_serv table
 *
 *	
 */

require_once '../get_permissions.inc';

function addComServ($pstu_id, $com_title, $com_advisor, $com_advisor_contact, $com_date, 
		            $com_hours, $com_description, $conn, $prefix){
	
		$sql = "INSERT into " . $prefix  ."_com_serv VALUES(0, $pstu_id, '$com_title', '$com_advisor', '$com_advisor_contact', '$com_description', STR_TO_DATE('$com_date', '%m/%d/%Y %I:%i %p' ), $com_hours, 1 )";

		$result = mysqli_query($conn, $sql);
		
		if($result == false){
			return "Failed to insert Community Service.";
		} else {
			return true;
		}
}

function deleteComServ($conn, $prefix, $com_id) {
	
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][7] == 1) == false){
		return "You do not have permissions to delete Community Service Records.";
	}
	
	$sql = "DELETE FROM " . $prefix . "_com_serv where com_id = " . $com_id;
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to delete Community Service.";
	} else {
		return true;
	}
	
}

function ApproveComServ($conn, $prefix, $com_id, $com_hours) {
	
	getPermissions($conn);
	
if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][7] == 1) == false){
		return "You do not have permissions to delete Community Service Records.";
	}
	
	$sql = "UPDATE " . $prefix . "_com_serv set com_verified = 2, com_hours = $com_hours where com_id = " . $com_id;
	
			$result = mysqli_query($conn, $sql);
				
			if($result == false){
				return "Failed to approve Community Service.";
			} else {
				return true;
			}
}

function rejectComServ($conn, $prefix, $com_id) {
	
	getPermissions($conn);
	
if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][7] == 1) == false){
		return "You do not have permissions to delete Community Service Records.";
	}
	
	$sql = "UPDATE " . $prefix . "_com_serv set com_verified = 3 where com_id = " . $com_id;
	
			$result = mysqli_query($conn, $sql);
	
			if($result == false){
				return "Failed to reject Community Service.";
			} else {
				return true;
			}
}

?>