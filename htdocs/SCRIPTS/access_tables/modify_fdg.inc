<?php
/*
 * modify_fdg.inc
*
* Created By: William Grove
*
* Date: 6/16/2016
*
*
* Adds/Deletes values from the fdg table
*
*/

require_once '../get_permissions.inc';

function createFDG ($name, $image, $conn){

	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][3] == 1) == false){
		return "User Not Permitted to Add, Modify, or Delete FDG's";
	}
	
	$sql = "Insert into fdg values (null, '$name', '$image', '#0000ff', '#ffffff')";

	$query = mysqli_query($conn, $sql);
	
	file_put_contents("log.txt", mysqli_error($conn));
	
	if($query == false){
	
		return "Unable to add fdg";
	} else {
		return true;
	}
	
}

function removeFDG ($fdg_id, $conn) {

	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][3] == 1) == false){
		return "User Not Permitted to Add, Modify, or Delete FDG's";
	}
	
	$query = mysqli_query($conn, "Select max(sem_id) from semesters");
	
	
	$semester_id = "";
	
	while ($row = mysqli_fetch_row($query)){
		$semester_id = intval($row[0]);
	}
	
	$query = mysqli_query($conn, "Select IFNULL(sem_end_date, 0) from  where sem_id = $semester_id");
	
	
	
	while ($row = mysqli_fetch_row($query)){
		$check = $row[0] . "";
		if (strcmp($check, "0") == 0){
			return "Cannot delete FDG's until after the semester has ended. Data loss possible.";
		}
	}
	
	
	$result = mysqli_query($conn, "DELETE FROM fdg WHERE fdg_id = $fdg_id");
	
	if($result == false){
		return "Failed to remove FDG from database. Check to see if FDG exists.";
	} else {
		return true;
	}
	
	
}

?>