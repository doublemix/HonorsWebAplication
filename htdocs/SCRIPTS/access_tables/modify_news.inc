<?php
/*
 * modify_news.inc
 *
 * Created By: William Grove
 *
 * Date: 6/17/2016
 *
 *
 * Adds/Deletes values from the news table
 *
 */



require_once '../get_permissions.inc';

	

function addNewsEntry($news_title, $news_text, $conn){
	
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][11] == 1) == false){
		echo "You do not have permission to add or delete news stories.";
	}
	
	$sql = "Insert into news VALUES (null, '$news_title', '$news_text', NOW())";
	
	file_put_contents("log.txt", "Before query - " . $sql . "\n");
	$result = mysqli_query($conn, $sql);
	
	if($result === false){
		echo "Failed to add news story.";
	} else {
		return true;
	}
}

function deleteNewsEntry($news_id, $conn){
	
	getPermissions($conn);
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][11] == 1) == false){
		echo "You do not have permission to delete slide images.";
	}
	
	$sql = "DELETE FROM news WHERE news_id = $news_id";
	
	$result = mysqli_query($conn, $sql);
	
	if($result == false){
		echo "Failed to delete news story.";
	} else {
		return true;
	}
}

?>