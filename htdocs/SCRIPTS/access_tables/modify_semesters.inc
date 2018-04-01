<?php
/*
 * modify_semester.inc
 *
 * Created By: William Grove
 *
 * Date: 6/16/2016
 *
 *
 * Adds/Deletes values from the Semesters table
 *
 */

require_once '../get_permissions.inc';

function startSemester ($sem_prefix, $sem_name, $conn){
	
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1) == false){
		return "User Not Permitted to Create Semester";
	}
	
	$sql = "SELECT * FROM semesters WHERE sem_active = 1";
	
	$result = mysqli_query($conn, $sql);
	
	if(mysqli_num_rows($result) > 0){
		return "Cannot start new semester while another is active.";
	}
	
	$sql = "INSERT INTO semesters VALUES(null, '$sem_prefix', '$sem_name', 1, NOW(), NULL, 0, 0)";
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to create semester.";
	} else {
		return true;
	}
	
}

function endSemester ($conn, $increase_edu) {
	
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1) == false){
		return "User Not Permitted to End Semester";
	}
	
	$sql = "UPDATE semesters SET sem_end_date = NOW(), sem_active = 0 WHERE sem_active = 1";
	
	$result = mysqli_query($conn, $sql);
	
	if($result === false){
		return "Failed to end semester.";
	} else {
		
		if($increase_edu == 1){
			$result = mysqli_query($conn, "UPDATE users SET usr_education = usr_education + 1 WHERE usr_education BETWEEN 1 AND 3 AND usr_status = 2");
			
			if($result === false){
				return "Failed to update users education.";
			} else {
				return true;
			}
		}
		
		
		return true;
	}
	
	
	
}
?>

