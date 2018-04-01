<?php

session_start();

require_once '../access_tables/modify_image_slide.inc';
require_once '../get_permissions.inc';
require_once '../db_connect.inc';

$conn = DBConnect();
getPermissions($conn);

if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][9] == 1 ) == false){
	echo "You do not have permission to modify the image slide.";
	DBClose($conn);
	die();
}


if (isset ( $_FILES ["file"] ["type"] )) {
	$validextensions = array (
			"jpeg",
			"jpg",
			"png" 
	);
	
	$temporary = explode ( ".", $_FILES ["file"] ["name"] );
	$file_extension = end ( $temporary );

	if ((($_FILES ["file"] ["type"] == "image/png") || ($_FILES ["file"] ["type"] == "image/jpg") || ($_FILES ["file"] ["type"] == "image/jpeg")) && ($_FILES ["file"] ["size"] < 500000) && // Approx. 100kb files can be uploaded.
in_array ( $file_extension, $validextensions )) {
	
		if ($_FILES ["file"] ["error"] > 0) {
			
		} else {
			if (file_exists ( "../../IMG/slides/" . $_FILES ["file"] ["name"] )) {
				echo "File already exists.";
				die();
			} else {
				$sourcePath = $_FILES ['file'] ['tmp_name']; // Storing source path of the file in a variable
				$targetPath = "../../IMG/slides/" . $_FILES ['file'] ['name']; // Target path where file is to be stored
			
				if(strlen($_FILES ['file'] ['name']) > 50){
					echo "Filename is too long. Limit 50 characters.";
					die();
				}
				
				
				
				$query = "INSERT INTO image_slide VALUES(null, 'Name', 'text', '" . $_FILES["file"]["name"] . "', 2, 0)";
				
				$result = mysqli_query($conn, $query);
				
				if($result === false){
					echo "File name blank or already used.";
					die();
				}
				
				move_uploaded_file ( $sourcePath, $targetPath ); // Moving Uploaded file
				
				echo "success";
			}
		}
	} else {
		echo "Invalid File Size or Type";
	}
}
?>