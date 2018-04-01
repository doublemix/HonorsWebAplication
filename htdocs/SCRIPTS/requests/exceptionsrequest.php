<?php

session_start();

require_once '../access_semester_tables/modify_exceptions.inc';
require_once '../get_permissions.inc';
require_once '../db_connect.inc';
require_once '../update_factory/update_factory.inc';


if(isset($_POST["exceptiongrantsrequest"])){
	
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
		
		$excptn_name = "";
		$excptn_type = 0;
		$excptn_value = 0;
		
		if(isset($_POST["excptn_type"])){
			$excptn_type = intval(removeslashes($_POST["excptn_type"]));
		
			if($excptn_type == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Exception Type not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["excptn_value"])){
			$excptn_value = floatval(removeslashes($_POST["excptn_value"]));
		
		} else {
			echo "Exception Value not set";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["excptn_name"])){
			$excptn_name = mysqli_real_escape_string($conn, removeslashes($_POST["excptn_name"]));
		
			if(strlen(trim($excptn_name)) < 1){
				echo "Exemption Name is Blank.";
				DBClose($conn);
				die();
			}
		} else {
			echo "Exception Name not set";
			DBClose($conn);
			return;
		}
		
		$result = createException($excptn_name, $excptn_type, $excptn_value, $conn, $prefix);
		
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
	
		$excptn_id = 0;
		
		if(isset($_POST["excptn_id"])){
			$excptn_id = intval(removeslashes($_POST["excptn_id"]));
		
			if($excptn_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Exception ID not set.";
			DBClose($conn);
			return;
		}
		
		$result = deleteException($excptn_id, $conn, $prefix);
		
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
	
		getPermissions($conn);
		
		if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][4] == 1) == false){
			echo "You do not have permissions to update exceptions.";
			die();
		}
		
		$excptn_name = "";
		$excptn_type = 0;
		$excptn_value = 0;
		$excptn_id = 0;
		
		$sets = array();
		$where = "excptn_id = " . $excptn_id;
		
		if(isset($_POST["excptn_id"])){
			$excptn_id = intval(removeslashes($_POST["excptn_id"]));
		
			if($excptn_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
			
			$where = $where . $excptn_id;
			
		} else {
			echo "Exception ID not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["excptn_type"])){
			$excptn_type = intval(removeslashes($_POST["excptn_type"]));
		
			if($excptn_type == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
				
			$sets[] = "excptn_type = " . $excptn_type;
				
			}
		} 
		
		if(isset($_POST["excptn_value"])){
			$excptn_value = floatval(removeslashes($_POST["excptn_value"]));
		
			$sets[] = "excptn_value = " . $excptn_value;
		} 
		
		if(isset($_POST["excptn_name"])){
			$excptn_name = mysqli_real_escape_string($conn, removeslashes($_POST["excptn_name"]));
		
			if(strlen(trim($excptn_name)) < 1){
				echo "Exemption Name is Blank.";
				DBClose($conn);
				die();
			}
			
			$sets[] = "excptn_name = '" . $excptn_name . "'";
		} 
		
		if(count($sets) < 1){
			echo "nothing to update";
			DBClose($conn);
			return;
		}
		
		$result = update($prefix . "_exceptions", $sets, $where, 2, $conn);
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		DBClose($conn);
		return;
	}
	
	
} else {
	echo "bad request";
	return;
}
?>