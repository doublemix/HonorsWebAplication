<?php

session_start();

require_once '../access_tables/modify_capstone.inc';
require_once '../get_permissions.inc';
require_once '../db_connect.inc';
require_once '../update_factory/update_factory.inc';

if(isset($_POST["capstonechangerequest"])){

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

	//Add
	if($opcode == 1){
		
		
		
		$usr_id = 0;
		$capstone_description = ""; 
		$capstone_advisor = "";
		$capstone_requirements = ""; 
		$capstone_startdate = "";
		$capstone_enddate = "";
		
		$capstone_name = "";
		
		//capstone_complete set to 0 automatically.
		
		$usr_id = 0;
		$usr_school_id = 0;
		
		if(isset($_POST["usr_school_id"])){
			$usr_school_id = intval(removeslashes($_POST["usr_school_id"]));
		
			if($usr_school_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
			
			$result = mysqli_query($conn, "SELECT usr_id FROM users WHERE usr_school_id = " . $usr_school_id);
			if(mysqli_num_rows($result) > 0){
			
				$row = mysqli_fetch_row($result);
			
				$usr_id = intval($row[0]);
				
		} else {
			echo "User does not exist.";
			DBClose($conn);
			return;
		}
		
		} else {
			echo "User School ID not set not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["capstone_name"])){
			$capstone_name = mysqli_real_escape_string($conn, removeslashes($_POST["capstone_name"]));
			
			if(strlen(trim($capstone_name)) < 1){
				echo "Capstone Title is Blank.";
				DBClose($conn);
				die();
			}
			
		} else {
			echo "Capstone Name not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["capstone_description"])){
			$capstone_description = mysqli_real_escape_string($conn, removeslashes($_POST["capstone_description"]));
			
			if(strlen(trim($capstone_description)) < 1){
				echo "Capstone Description is Blank.";
				DBClose($conn);
				die();
			}
			
		} else {
			echo "Capstone Description not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["capstone_advisor"])){
			$capstone_advisor = mysqli_real_escape_string($conn, removeslashes($_POST["capstone_advisor"]));
			
			if(strlen(trim($capstone_advisor)) < 1){
				echo "Capstone Advisor is Blank.";
				DBClose($conn);
				die();
			}
			
		} else {
			echo "Capstone Advisor Not Set not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["capstone_requirements"])){
			$capstone_requirements = mysqli_real_escape_string($conn, removeslashes($_POST["capstone_requirements"]));
			
			if(strlen(trim($capstone_requirements)) < 1){
				echo "Capstone Requirements is Blank.";
				DBClose($conn);
				die();
			}
			
		} else {
			echo "Capstone Requirements not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["capstone_startdate"])){
			$capstone_startdate = mysqli_real_escape_string($conn, removeslashes($_POST["capstone_startdate"]));
		} else {
			echo "Capstone Start Date not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["capstone_enddate"])){
			$capstone_enddate = mysqli_real_escape_string($conn, removeslashes($_POST["capstone_enddate"]));
		} else {
			echo "Capstone end Date not set.";
			DBClose($conn);
			return;
		}
		
		$result = addCapstone($usr_id, $capstone_name, $capstone_description, $capstone_advisor, $capstone_requirements, $capstone_startdate, $capstone_enddate, $conn);
		
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
		
		$capstone_id = 0;
		
		if(isset($_POST["capstone_id"])){
			$capstone_id = intval(removeslashes($_POST["capstone_id"]));
		
			if($capstone_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Capstone ID not set.";
			DBClose($conn);
			return;
		}
		
		
		$result = deleteCapstone($capstone_id, $conn);
		
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
		
		$capstone_id = 0;
		
		if(isset($_POST["capstone_id"])){
			$capstone_id = intval(removeslashes($_POST["capstone_id"]));
		
			if($capstone_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Capstone ID not set.";
			DBClose($conn);
			return;
		}
		
		
		$result = acceptCapstone($capstone_id, $conn);
		
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
		
		$capstone_id = 0;
		
		if(isset($_POST["capstone_id"])){
			$capstone_id = intval(removeslashes($_POST["capstone_id"]));
		
			if($capstone_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Capstone ID not set.";
			DBClose($conn);
			return;
		}
		
		
		$result = rejectCapstone($capstone_id, $conn);
		
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
		
		if(($_SESSION["permissions"][0] == 1) == false){
			echo "You do not have permission to update Capstones.";
		}
		
		$capstone_id = 0;
		$usr_id = 0;
		$capstone_description = "";
		$capstone_advisor = "";
		$capstone_requirements = "";
		$capstone_startdate = "";
		$capstone_enddate = "";
		$capstone_complete = 0;
		$capstone_name = "";
		
		$where = "capstone_id = ";
		$sets = array();
		
		if(isset($_POST["capstone_id"])){
			$capstone_id = intval(removeslashes($_POST["capstone_id"]));
		
			if($capstone_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
			
			$where = $where . $capstone_id;
			
		} else {
			echo "Capstone ID not set.";
			DBClose($conn);
			return;
		}
		
		
		if(isset($_POST["usr_id"])){
			$usr_id = intval(removeslashes($_POST["usr_id"]));
		
			if($usr_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
				
				$sets[] = "usr_id = " . $usr_id;
				
			}
		} 
		
		if(isset($_POST["capstone_description"])){
			$capstone_description = mysqli_real_escape_string($conn, removeslashes($_POST["capstone_description"]));
			
			if(strlen(trim($capstone_description)) < 1){
				echo "Capstone Description is Blank.";
				DBClose($conn);
				die();
			}
			
			$sets[] = "capstone_description = '" . $capstone_description . "'";
			
		} 
		
		if(isset($_POST["capstone_name"])){
			$capstone_name = mysqli_real_escape_string($conn, removeslashes($_POST["capstone_name"]));
				
			if(strlen(trim($capstone_name)) < 1){
				echo "Capstone Title is Blank.";
				DBClose($conn);
				die();
			}
			
			$sets[] = "capstone_name = '" . $capstone_name . "'";
				
		}
		
		if(isset($_POST["capstone_advisor"])){
			$capstone_advisor = mysqli_real_escape_string($conn, removeslashes($_POST["capstone_advisor"]));
			
			if(strlen(trim($capstone_advisor)) < 1){
				echo "Capstone Advisor is Blank.";
				DBClose($conn);
				die();
			}
			
			$sets[] = "capstone_advisor = '" . $capstone_advisor . "'";
		} 
		
		if(isset($_POST["capstone_requirements"])){
			$capstone_requirements = mysqli_real_escape_string($conn, removeslashes($_POST["capstone_requirements"]));
			
			if(strlen(trim($capstone_requirements)) < 1){
				echo "Capstone Requirements is Blank.";
				DBClose($conn);
				die();
			}
			
			$sets[] = "capstone_requirements = '" . $capstone_requirements . "'";
		} 
		
		if(isset($_POST["capstone_startdate"])){
			$capstone_startdate = removeslashes($_POST["capstone_startdate"]);
			
			$sets[] = "capstone_startdate = STR_TO_DATE('$capstone_startdate', '%m/%d/%Y %l:%i %p' )";
		} 
		
		if(isset($_POST["capstone_enddate"])){
			$capstone_enddate = removeslashes($_POST["capstone_enddate"]);
			
			$sets[] = "capstone_enddate = STR_TO_DATE('$capstone_enddate', '%m/%d/%Y %l:%i %p' )";
		} 
		
		
		if(isset($_POST["capstone_complete"])){
			$capstone_complete = intval(removeslashes($_POST["capstone_complete"]));
		
			
		
				$sets[] = "capstone_complete = " . $capstone_complete;
		
			
		}
		
		if(count($sets) < 1){
			echo "Nothing to update";
			DBClose($conn);
			return;
		}
		
		$result = update("capstone", $sets, $where, 2, $conn);
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		
		DBClose($conn);
		return;
		
	}
	
} else {
	echo "Invalid request";
	return;
}