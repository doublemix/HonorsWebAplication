<?php

session_start();

require_once '../access_semester_tables/modify_com_serv.inc';
require_once '../get_permissions.inc';
require_once '../db_connect.inc';
require_once '../update_factory/update_factory.inc';

if(isset($_POST["communityservicerequest"])){

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
		
		$pstu_id = 0;
		$com_title = "";
		$com_advisor = "";
		$com_advisor_contact = ""; 
		$com_date = "";
		$com_hours = 0;
		$com_description = "";
		
		if(isset($_POST["pstu_id"])){
			$pstu_id = mysqli_real_escape_string($conn, intval(removeslashes($_POST["pstu_id"])));
		
			if($pstu_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Student ID not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["com_title"])){
			$com_title = mysqli_real_escape_string($conn, removeslashes($_POST["com_title"]));
			
			if(strlen(trim($com_title)) < 1){
				echo "Community Service Title is Blank.";
				DBClose($conn);
				die();
			}
			
		} else {
			echo "Community Service Title not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["com_advisor"])){
			$com_advisor = mysqli_real_escape_string($conn, removeslashes($_POST["com_advisor"]));
			
			if(strlen(trim($com_advisor)) < 1){
				echo "Community Service Advisor is Blank.";
				DBClose($conn);
				die();
			}
			
		} else {
			echo "Advisor not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["com_advisor_contact"])){
			$com_advisor_contact = mysqli_real_escape_string($conn, removeslashes($_POST["com_advisor_contact"]));
			
			if(strlen(trim($com_advisor_contact)) < 1){
				echo "Comunity Service Advisor contact is Blank.";
				DBClose($conn);
				die();
			}
			
		} else {
			echo "Community Advisor Contact Info not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["com_description"])){
			$com_description = mysqli_real_escape_string($conn, removeslashes($_POST["com_description"]));
			
			if(strlen(trim($com_description)) < 1){
				echo "Community Service Advisor contact is Blank.";
				DBClose($conn);
				die();
			}
			
		} else {
			echo "Service description not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["com_date"])){
			$com_date = mysqli_real_escape_string($conn, removeslashes($_POST["com_date"]));
		} else {
			echo "Community Service Date not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["com_hours"])){
			$com_hours = floatval(removeslashes($_POST["com_hours"]));
		} else {
			echo "Community Service Hours not set.";
			DBClose($conn);
			return;
		}
		
		$result = addComServ($pstu_id, $com_title, $com_advisor, $com_advisor_contact, $com_date,
				$com_hours, $com_description, $conn, $prefix);
		
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
	
		$com_id = 0;
		
		if(isset($_POST["com_id"])){
			$com_id = intval(removeslashes($_POST["com_id"]));
		
			if($com_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Community Servie ID not set.";
			DBClose($conn);
			return;
		}
		
		$result = deleteComServ($conn, $prefix, $com_id);
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		DBClose($conn);
		return;
	}
	
	//Accept
	if($opcode == 3){
		
		$com_id = 0;
		$com_hours = 0;
		
		if(isset($_POST["com_id"])){
			$com_id = intval(removeslashes($_POST["com_id"]));
		
			if($com_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Community Servie ID not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["com_hours"])){
			$com_hours = mysqli_real_escape_string($conn, intval(removeslashes($_POST["com_hours"])));
		
			if($com_id == 0){
				echo "Must be more than 0 hours.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Community Servie Hours not set.";
			DBClose($conn);
			return;
		}
		
		$result = ApproveComServ($conn, $prefix, $com_id, $com_hours);
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		DBClose($conn);
		return;
	}
	
	//Deny
	if($opcode == 4){
	
		$com_id = 0;
		
		if(isset($_POST["com_id"])){
			$com_id = intval(removeslashes($_POST["com_id"]));
		
			if($com_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Community Servie ID not set.";
			DBClose($conn);
			return;
		}
		
		$result = rejectComServ($conn, $prefix, $com_id);
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		DBClose($conn);
		return;
	}
	
	//Update
	if($opcode == 5){
	
		if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][7] == 1 ) == false ){
			echo "You do not have permission to update Community Service.";
			die();
		}
		
		$pstu_id = 0;
		$com_title = "";
		$com_advisor = "";
		$com_advisor_contact = "";
		$com_date = "";
		$com_hours = 0;
		$com_id = 0;
		$com_verified = 0;
		$com_description = "";
		
		$where = "com_id = ";
		$sets = array();
		
		if(isset($_POST["com_id"])){
			$com_id = intval(removeslashes($_POST["com_id"]));
		
			if($com_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
			
			$where = $where . $com_id;
			
		} else {
			echo "Community Servie ID not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["pstu_id"])){
			$pstu_id = intval(removeslashes($_POST["pstu_id"]));
		
			if($pstu_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
			
			$sets[] = "pstu_id = " . $pstu_id;
			
		} 
		
		if(isset($_POST["com_title"])){
			$com_title = mysqli_real_escape_string($conn, removeslashes($_POST["com_title"]));
			
			if(strlen(trim($com_title)) < 1){
				echo "Community Service Title is Blank.";
				DBClose($conn);
				die();
			}
			
			$sets[] = "com_title = '" . $com_title . "'";
		} 
		
		if(isset($_POST["com_advisor"])){
			$com_advisor = mysqli_real_escape_string($conn, removeslashes($_POST["com_advisor"]));
			
			if(strlen(trim($com_advisor)) < 1){
				echo "Community Service Advisor is Blank.";
				DBClose($conn);
				die();
			}
			
			$sets[] = "com_advisor = '" . $com_advisor . "'";
		} 
		
		if(isset($_POST["com_advisor_contact"])){
			$com_advisor_contact = mysqli_real_escape_string($conn, removeslashes($_POST["com_advisor_contact"]));
			
			if(strlen(trim($com_advisor_contact)) < 1){
				echo "Comunity Service Advisor contact is Blank.";
				DBClose($conn);
				die();
			}
			
			$sets[] = "com_advisor_contact = '" . $com_advisor_contact . "'";
		} 
		
		if(isset($_POST["com_description"])){
			$com_description = mysqli_real_escape_string($conn, removeslashes($_POST["com_description"]));
				
			if(strlen(trim($com_description)) < 1){
				echo "Community Service Advisor contact is Blank.";
				DBClose($conn);
				die();
			}
			
			$sets[] = "com_description = '" . $com_description . "'";
		}
		
		if(isset($_POST["com_date"])){
			$com_date = mysqli_real_escape_string($conn, removeslashes($_POST["com_date"]));
			
			$sets[] = "com_date = " . $com_date;
		} 
		
		if(isset($_POST["com_hours"])){
			$com_hours = mysqli_real_escape_string($conn, floatval(removeslashes($_POST["com_hours"])));
			
			$sets[] = "com_hours = " . $com_hours;
		} 
		
		if(isset($_POST["com_verified"])){
			$com_verified = mysqli_real_escape_string($conn, intval(removeslashes($_POST["com_verified"])));
		
			if($com_verified == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
				
			$sets[] = "com_verified = " . $com_verified;
				
		}
		
		
		if(count($sets) <  1){
			echo "Nothing to update";
			DBClose($conn);
			return;
		}
		
		$result = update($prefix . "_com_serv", $sets, $where, 2, $conn);
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		DBClose($conn);
		return;
	}
	
	echo "Opcode Invalid";
	DBClose($conn);
	return;
	
} else {
	echo "Invalid request";
	return;
}