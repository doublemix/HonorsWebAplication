<?php
/*
 * modify_probation_grants.inc
 *
 * Created By: William Grove
 *
 * Date: 6/16/2016
 *
 *
 * Adds/Deletes values from the probation_grants table
 *
 */

require_once '../get_permissions.inc';

function addProbationGrant($probation_id, $usr_id, $probation_grant_requirement, $conn){
	
	if(($_SESSION["permissions"][0] == 1) == false){
		return "User Not Permitted to Add, Modify, or Delete Probations";
	}
	
	$result = mysqli_query($conn, "INSERT INTO probation_grants VALUES (null, $probation_id, $usr_id, $probation_grant_requirement)");
	
	if($result == false){
		return "Was not able to add probation to user";
	} else {
		return true;
	}
	
}

function deleteProbationGrant($probation_grant_id, $conn){

	if(($_SESSION["permissions"][0] == 1) == false){
		return "User Not Permitted to Add, Modify, or Delete Probations";
	}

	$result = mysqli_query($conn, "DELETE FROM probation_grants where probation_grant_id = $probation_grant_id");
	
	if($result == false){
		return "Could not delete probation grant.";
	} else {
		return true;
	}
}
