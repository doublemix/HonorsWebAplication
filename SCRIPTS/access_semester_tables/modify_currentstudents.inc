<?php
/*
 * modify_currentstudents.inc
 *
 * Created By: William Grove
 *
 * Date: 6/18/2016
 *
 *
 * Adds/Delete/Modify values to the
 * (prefix)_currentstudents table
 *
 *
 */

require_once '../get_permissions.inc';

function addCurrentStudent($pstu_id, $conn, $prefix){
	
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][2] == 1) == false){
		return "You do not have permissions to add Current Students.";
	}
	
	$sql = "INSERT INTO " . $prefix . "_currentstudents VALUES($pstu_id, 0)";
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to add Student.";
	} else {
		return true;
	}
}

function addCurrentStudentWithFDGOption($pstu_id, $conn, $prefix, $pstu_in_fdg){
	getPermissions($conn);
	
if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][2] == 1) == false){
		return "You do not have permissions to add Current Students.";
	}
	
	$sql = "INSERT INTO " . $prefix . "_currentstudents VALUES($pstu_id, $pstu_in_fdg)";
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to add Current FDG.";
	} else {
		return true;
	}
}

/**
 * 
 * Accidently calling this could cause data loss, be cautious.
 */
function removeCurrentStudent($pstu_id, $conn, $prefix){
	
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1) == false){
		return "You do not have permissions to delete Current Students.";
	}
	
	$sql = "DELETE FROM " . $prefix . "_currentstudents where pstu_id = " . $pstu_id;
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to delete Current student.";
	} else {
		return true;
	}
}

function inFDG($pstu_id, $conn, $prefix){
	
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1) == false){
		return "You do not have permissions to edit Current Students.";
	}
	
	$sql = "UPDATE " . $prefix . "_currentstudents SET pstu_in_fdg = 1 where pstu_id = " . $pstu_id;
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to delete Current student.";
	} else {
		return true;
	}
}

function removeFromFDG($pstu_id, $conn, $prefix){
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1) == false){
		return "You do not have permissions to edit Current Students.";
	}
	
	$sql = "UPDATE " . $prefix . "_currentstudents SET pstu_in_fdg = 0 where pstu_id = " . $pstu_id;
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to delete Current student.";
	} else {
		return true;
	}
	
}



?>