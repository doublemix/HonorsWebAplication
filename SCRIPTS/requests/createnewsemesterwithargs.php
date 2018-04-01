<?php

session_start();

require_once '../access_tables/modify_news.inc';
require_once '../get_permissions.inc';
require_once '../db_connect.inc';
require_once '../update_factory/update_factory.inc';

if(isset($_POST["accessnewsrequest"])){

	$conn = DBConnect();

	if($conn == false){
		echo "Unable to Connect to Database.";
		return;
	}

	if(getPermissions($conn) == false){
		echo "Unable to retrieve permissions.";
		DBClose($conn);
		return;
	}
	
	if($_SESSION["permissions"][0] != 1){
		echo "You are not allowed to start a new semester. You have been reported.";
		die();
	}

	$opcode = 0;

	if(isset($_POST["opcode"])){
		$opcode = intval(removeslashes($_POST["opcode"]));

		if($opcode == 0){
			echo "Malformed Operation.";
			DBClose($conn);
			return;
		}
	} else {
		echo "Opcode not set.";
		DBClose($conn);
		return;
	}
	
	//Add
	if($opcode == 1)
	{
		
		$news_title = "";
		$news_text = "";
		$news_date = "";
		
		if(isset($_POST["news_title"])){
			$news_title = removeslashes($_POST["news_title"]);
		} else {
			echo "News Title Not Set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["news_text"])){
			$news_text = removeslashes($_POST["news_text"]);
		} else {
			echo "News Text not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["news_date"])){
			$news_date = removeslashes($_POST["news_date"]);
		} else {
			echo "News Date not set.";
			DBClose($conn);
			return;
		}
		
		$result = addNewsEntry($news_title, $news_text, $news_date, $conn);
		
		if($result === true){
			echo "success";
			DBClose($conn);
			return;
		} else {
			echo $result;
			DBClose($conn);
			return;
		}
	}
	
	//Delete
	if($opcode == 2)
	{
	
		$news_id = 0;
		
		if(isset($_POST["news_id"])){
			$news_id = intval(removeslashes($_POST["news_id"]));
		
			if($news_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "News ID Not Set";
			DBClose($conn);
			return;
		}
		
		$result = deleteNewsEntry($news_id, $conn);
		
		if($result === true){
			echo "success";
			DBClose($conn);
			return;
		} else {
			echo $result;
			DBClose($conn);
			return;
		}
	}
	
	//Update
	if($opcode == 3)
	{
	
		$news_title = "";
		$news_text = "";
		$news_date = "";
		$news_id = 0;
		
		$sets = array();
		$where = "news_id = ";
		
		if(isset($_POST["news_id"])){
			$news_id = intval(removeslashes($_POST["news_id"]));
		
			if($news_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
			
			$where = $where . $news_id;
			
		} else {
			echo "News ID Not Set";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["news_title"])){
			$news_title = removeslashes($_POST["news_title"]);
			
			$sets[] = "news_title = " . $news_title;
		} 
		
		if(isset($_POST["news_text"])){
			$news_text = removeslashes($_POST["news_text"]);
			
			$sets[] = "news_text = " . $news_text;
		} 
		
		if(isset($_POST["news_date"])){
			$news_date = removeslashes($_POST["news_date"]);
			
			$sets[] = "news_date = " . $news_date;
		}
		
		if(count($sets) < 1){
			echo "Nothing to update";
			DBClose($conn);
			return;
		}
		
		$result = update("news", $sets, $where, 2, $conn);
		
		if($result === true){
			echo "success";
			DBClose($conn);
			return;
		} else {
			echo $result;
			DBClose($conn);
			return;
		}
	}

	echo "Opcode not matched";
	DBClose($conn);
	return;
	
} else {
	echo "Invalid request";
	return;
}

?>