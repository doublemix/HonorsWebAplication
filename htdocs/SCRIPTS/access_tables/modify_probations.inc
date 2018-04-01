<?php
/*
 * modify_probations.inc
 *
 * Created By: William Grove
 *
 * Date: 6/16/2016
 *
 *
 * Adds/Deletes values from the probations table
 *
 */

require_once '../get_permissions.inc';



/*
 * 
 * Probation Types:
 * 
 * 0 - Activity Groups
 * 1 - Academic Events
 * 2 - Community Service
 * 3 - Academic Probation
 * 4 - Honors Credits Probation
 * 5 - Behavioral
 * 
 */


function addProbation($name, $type, $conn){
	
	if(($_SESSION["permissions"][0] == 1 ) == false){
		return "User Not Permitted to Add, Modify, or Delete Probations";
	}
	
	$result = mysqli_query($conn, "INSERT into probations VALUES (null, '$name', $type)");
	
	if($result == false){
		return "Cannot create probation.";
	} else {
		return true;
	}
	
}

function deleteProbation($probation_id) {
	
	if(($_SESSION["permissions"][0] == 1 ) == false){
		return "User Not Permitted to Add, Modify, or Delete Probations";
	}
	
	$result = mysqli_query($conn, "DELETE FROM probations WHERE probation_id = $probation_id");
	
	if ($result == false){
		return "Failed to delete probation entry.";
	} else {
		return true;
	}
	
	
	
}