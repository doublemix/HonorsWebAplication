<?php

session_start();

require_once '../access_semester_tables/modify_fdg_event.inc';
require_once '../get_permissions.inc';
require_once '../db_connect.inc';
require_once '../update_factory/update_factory.inc';


if(isset($_POST["fdgeventrequest"])){
	
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
		
		$pfdg_event_name = ""; 
		$pfdg_event_description = "";
		$pfdg_start_date = "";
		$pfdg_end_date = "";
		
		if(isset($_POST["pfdg_event_name"])){
			$pfdg_event_name = mysqli_real_escape_string($conn, removeslashes($_POST["pfdg_event_name"]));
		
			if(strlen(trim($pfdg_event_name)) < 1){
				echo "FDG Event Name is Blank.";
				DBClose($conn);
				die();
			}
			
		} else {
			echo "Event name not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["pfdg_event_description"])){
			$pfdg_event_description = mysqli_real_escape_string($conn, removeslashes($_POST["pfdg_event_description"]));
		
			if(strlen(trim($pfdg_event_description)) < 1){
				echo "FDG Event Description is Blank.";
				DBClose($conn);
				die();
			}
		} else {
			echo "Event description not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["pfdg_start_date"])){
			$pfdg_start_date = removeslashes($_POST["pfdg_start_date"]);
		
		} else {
			echo "Event Start Date not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["pfdg_end_date"])){
			$pfdg_end_date = removeslashes($_POST["pfdg_end_date"]);
		
		} else {
			echo "Event End Date not set.";
			DBClose($conn);
			return;
		}
		
		$result = addFDGEvent($pfdg_event_name, $pfdg_event_description, $pfdg_start_date, $pfdg_end_date, $conn, $prefix);
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		DBClose($conn);
		return;
		
	}
	
	//Delete
	if($opcode == 2){
		
		$pfdg_event_id = 0;
		
		if(isset($_POST["pfdg_event_id"])){
			$pfdg_event_id = intval(removeslashes($_POST["pfdg_event_id"]));
		
			if($pfdg_event_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Event ID not set.";
			DBClose($conn);
			return;
		}
		
		$result = deleteFDGEvent($pfdg_event_id, $conn, $prefix );
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		DBClose($conn);
		return;
	}
	
	//Update
	if($opcode == 3){
		
		if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][3] == 1) == false){
			echo "You do not have permission to add FDG events.";
			DBClose($conn);
			die();
		}
		
		$pfdg_event_name = "";
		$pfdg_event_description = "";
		$pfdg_start_date = "";
		$pfdg_end_date = "";
		$pfdg_event_id = 0;
		$pfdg_event_bg_color = "";
		$pfdg_event_ft_color = "";
		
		$sets = array();
		$where = "pfdg_event_id = ";
		
		if(isset($_POST["pfdg_event_id"])){
			$pfdg_event_id = intval(removeslashes($_POST["pfdg_event_id"]));
		
			if($pfdg_event_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
			
			$where = $where . $pfdg_event_id;
			
		} else {
			echo "Event ID not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["pfdg_event_name"])){
			$pfdg_event_name = mysqli_real_escape_string($conn, removeslashes($_POST["pfdg_event_name"]));
			
			if(strlen(trim($pfdg_event_name)) < 1){
				echo "FDG Event Name is Blank.";
				DBClose($conn);
				die();
			}
			
			$sets[] = "pfdg_event_name = '" . $pfdg_event_name . "'";
		
		} 
		
		if(isset($_POST["pfdg_event_description"])){
			$pfdg_event_description = mysqli_real_escape_string($conn, removeslashes($_POST["pfdg_event_description"]));
			
			if(strlen(trim($pfdg_event_description)) < 1){
				echo "FDG Event Description is Blank.";
				DBClose($conn);
				die();
			}
			
			$sets[] = "pfdg_event_description = '" . $pfdg_event_description . "'";
		
		} 
		
		if(isset($_POST["pfdg_start_date"])){
			$pfdg_start_date = removeslashes($_POST["pfdg_start_date"]);
		
			$sets[] = "pfdg_start_date =  STR_TO_DATE('$pfdg_start_date', '%m/%d/%Y %l:%i %p' )";
		} 
		
		if(isset($_POST["pfdg_end_date"])){
			$pfdg_end_date = removeslashes($_POST["pfdg_end_date"]);
		
			$sets[] = "pfdg_end_date = STR_TO_DATE('$pfdg_end_date', '%m/%d/%Y %l:%i %p' )";
		} 
		
		if(isset($_POST["pfdg_event_bg_color"])){
			$pfdg_event_bg_color = removeslashes($_POST["pfdg_event_bg_color"]);
				
			if(!preg_match('/^#[a-f0-9]{6}$/i', $pfdg_event_bg_color))
			{
				echo "Invalid Font color code.";
				die();
			}
			
			$sets[] = "pfdg_event_bg_color = '" . $pfdg_event_bg_color . "'";
		
		}
		
		if(isset($_POST["pfdg_event_ft_color"])){
			$pfdg_event_ft_color = removeslashes($_POST["pfdg_event_ft_color"]);
				
			if(!preg_match('/^#[a-f0-9]{6}$/i', $pfdg_event_ft_color))
			{
				echo "Invalid Font color code.";
				die();
			}
			
			$sets[] = "pfdg_event_ft_color = '" . $pfdg_event_ft_color . "'";
		
		}
		
		if(count($sets) < 1){
			echo "Nothing to update";
			DBClose($conn);
			return;
		}
		
		$result = update($prefix . "_fdg_event", $sets, $where, 2, $conn);
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		DBClose($conn);
		return;
		
	}
	
	echo "Opcode not found";
	DBClose($conn);
	return;
	
} else {
	echo "bad request";
	return;
}
?>