<?php

session_start();

require_once '../access_semester_tables/modify_events.inc';
require_once '../get_permissions.inc';
require_once '../db_connect.inc';
require_once '../update_factory/update_factory.inc';

if(isset($_POST["eventsrequest"])){

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

	$prefix = "";

	if(isset($_POST["prefix"])){
		$prefix = removeslashes($_POST["prefix"]);
	} else {
		echo "Prefix not set.";
		DBClose($conn);
		return;
	}
	
	//Add
	if($opcode == 1){
		
		$event_title = "";
		$event_description = "";
		$event_start_date = "";
		$event_end_date = "";	 
		$event_bg_color = "";
		$event_ft_color = "";
		
		if(isset($_POST["event_title"])){
			$event_title = mysqli_real_escape_string($conn, removeslashes($_POST["event_title"]));
			
			if(strlen(trim($event_title)) < 1){
				echo "Event Title contact is Blank.";
				DBClose($conn);
				die();
			}
			
		} else {
			echo "Event Name not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["event_description"])){
			$event_description = mysqli_real_escape_string($conn, removeslashes($_POST["event_description"]));
			
			if(strlen(trim($event_description)) < 1){
				echo "Event Description is Blank.";
				DBClose($conn);
				die();
			}
			
		} else {
			echo "Event Description not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["event_start_date"])){
			$event_start_date = removeslashes($_POST["event_start_date"]);
		} else {
			echo "Event Start Date not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["event_end_date"])){
			$event_end_date = removeslashes($_POST["event_end_date"]);
		} else {
			echo "Event End Date not set.";
			DBClose($conn);
			return;
		}
		
		
		
		$result = addEvent($event_title, $event_description, $event_start_date, $event_end_date,
				$conn, $prefix);
		
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
	if($opcode == 2){
		
		$event_id = 0;
		
		if(isset($_POST["event_id"])){
			$event_id = intval(removeslashes($_POST["event_id"]));
		
			if($event_id == 0){
				echo "Event ID Malformed.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Event event id not set";
			DBClose($conn);
			return;
		}
		
		$result = deleteEvent($event_id, $conn, $prefix);
		
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
	if($opcode == 3){
		
		if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][10] == 1 ) == false){
			echo "You do not have permission to modify events.";
			die();
		}
		
		
		$sets = array();
		$where = "event_id = ";
		
		$event_id = 0;
		$event_title = "";
		$event_description = "";
		$event_start_date = "";
		$event_end_date = "";
		
		if(isset($_POST["event_id"])){
			$event_id = intval(removeslashes($_POST["event_id"]));
		
			if($event_id == 0){
				echo "Event ID Malformed.";
				DBClose($conn);
				return;
			}
			
			$where = $where . $event_id;
			
		} else {
			echo "Event id not set";
			DBClose($conn);
			return;
		}
		
		
		if(isset($_POST["event_title"])){
			$event_title = mysqli_real_escape_string($conn, removeslashes($_POST["event_title"]));
			
			if(strlen(trim($event_title)) < 1){
				echo "Event Title contact is Blank.";
				DBClose($conn);
				die();
			}
			
			$sets[] = "event_title = '" . $event_title . "'";
		} 
		
		if(isset($_POST["event_description"])){
			$event_description = mysqli_real_escape_string($conn, removeslashes($_POST["event_description"]));
			
			if(strlen(trim($event_description)) < 1){
				echo "Event Description is Blank.";
				DBClose($conn);
				die();
			}
			
			$sets[] = "event_description = '" . $event_description . "'";
		} 
		
		if(isset($_POST["event_start_date"])){
			$event_start_date = removeslashes($_POST["event_start_date"]);
			
			$sets[] = "event_start_date = STR_TO_DATE('$event_start_date', '%m/%d/%Y %l:%i %p' )";
		} 
				
		if(isset($_POST["event_end_date"])){
			$event_end_date = removeslashes($_POST["event_end_date"]);
			
			$sets[] = "event_end_date = STR_TO_DATE('$event_end_date', '%m/%d/%Y %l:%i %p' )";
				
		} 
		
		
		if(isset($_POST["event_ft_color"])){
			$event_ft_color = removeslashes($_POST["event_ft_color"]);
			
			if(!preg_match('/^#[a-f0-9]{6}$/i', $event_ft_color))
			{
				echo "Invalid Font color code.";
				die();
			}
			
			$sets[] = "event_ft_color = '$event_ft_color'";
		} 
		
		if(isset($_POST["event_bg_color"])){
			$event_bg_color = removeslashes($_POST["event_bg_color"]);
			
			if(!preg_match('/^#[a-f0-9]{6}$/i', $event_bg_color))
			{
				echo "Invalid Font color code.";
				die();
			}
			
			$sets[] = "event_bg_color = '$event_bg_color'";
			
		} 
		
		
		if(count($sets) < 1){
			echo "Nothing to update";
			DBClose($conn);
			return;
		}
		
		$result = update($prefix . "_events", $sets, $where, 2, $conn);
		
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
	
	echo "Opcode not valid";
	DBClose($conn);
	return;
} else {
	echo "Invalid request";
	return;
}