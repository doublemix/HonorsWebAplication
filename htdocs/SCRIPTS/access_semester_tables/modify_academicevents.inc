<?php
/*
 * modify_academicevents.inc
*
* Created By: William Grove
*
* Date: 6/17/2016
*
*
* Adds/Deletes values from the
* (prefix)_academicevents table
*
*
*/

require_once '../get_permissions.inc';


function addAcademicEvent($acad_title, $acad_description, $acad_start_date, $acad_end_date,
						  $conn, $prefix){
						  	
	getPermissions($conn);
						  	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][5] == 1 ) == false){
		return "User Not Permitted to Add, Modify, or Delete Academic Events.";
	}
	
	$sql = "INSERT INTO " . $prefix ."_academicevents VALUES(null, '$acad_title', '$acad_description', STR_TO_DATE('$acad_start_date', '%m/%d/%Y %I:%i %p' ), STR_TO_DATE('$acad_end_date', '%m/%d/%Y %I:%i %p' ), '#0000ff', '#ffffff')";
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to insert Academic Event Record.";
	} else {
		return true;
	}
}

function deleteAcademicEvent($acad_id, $conn, $prefix){

	getPermissions($conn);
		
if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][5] == 1 ) == false){
		return "User Not Permitted to Add, Modify, or Delete Academic Events.";
	}
	
	$sql = "DELETE FROM " . $prefix . "_academicevents where acad_id = " . $acad_id;
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to delete Academic Event Record.";
	} else {
		return true;
	}
	
}

?>