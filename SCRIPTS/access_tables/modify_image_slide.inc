<?php
/*
 * modify_image_slide.inc
 *
 * Created By: William Grove
 *
 * Date: 6/17/2016
 *
 *
 * Adds/Deletes values from the groups table
 *
 */



require_once '../get_permissions.inc';

function addImageSlide($slide_name, $slide_text, $slide_imagename, $conn){
	
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][9] == 1) == false){
		return "You do not have permission to add or set images.";
	}
	
	$sql = "Insert into image_slide VALUES (null, '$slide_name', '$slide_text', '$slide_imagename', 2, 0)";
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		return "Failed to add slide image.";
	} else {
		return true;
	}
}

function deleteImageSlide($slide_id, $conn){
	
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][9] == 1) == false){
		return "You do not have permission to delete slide images.";
	}
	
	$sql = "SELECT slide_imagename from image_slide where slide_id = " . $slide_id;
	
	$result = mysqli_query($conn, $sql);
	
	$row = mysqli_fetch_row($result);
	
	$file_name = $row[0];
	
	$sql = "DELETE FROM image_slide WHERE slide_id = $slide_id";
	
	$result = mysqli_query($conn, $sql);
	
	if($result === false){
		return "Failed to delete slide image.";
	} else {
		
		$del = unlink("../../IMG/slides/" . $file_name);
		
		if(del == true){
			return true;
		} else {
			return "Failed to remove image from the server.";
		}
	}
}

?>