<?php

session_start();

require_once '../access_semester_tables/modify_exception_grants.inc';
require_once '../get_permissions.inc';
require_once '../db_connect.inc';
require_once '../update_factory/update_factory.inc';


if(isset($_POST["exceptiongrantrequest"])){
	
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
	if ($opcode == 1){
		
		$excptn_id = 0;
		$pstu_id = 0;
		
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
		
		if(isset($_POST["pstu_id"])){
			$pstu_id = intval(removeslashes($_POST["pstu_id"]));
		
			if($pstu_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Student ID Not Set.";
			DBClose($conn);
			return;
		}
		
		$result = assignException($excptn_id, $pstu_id, $prefix, $conn);
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		DBClose($conn);
		return;
		
	}
	
	//Delete
	if ($opcode == 2){
		
		$grant_id = 0;
		
		if(isset($_POST["grant_id"])){
			$grant_id = intval(removeslashes($_POST["grant_id"]));
		
			if($grant_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Grant ID not set.";
			DBClose($conn);
			return;
		}
		
		$result = revokeException($grant_id, $conn, $prefix);
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		DBClose($conn);
		return;
	}
	
	/*
	 * This is where the update would be
	 * IF IT HAD ONE
	if($opcode == 3){
		
	}
	*/
	
	echo "Opcode not found";
	DBClose($conn);
	return;
	
} else {
	echo "bad request";
	return;
}


	?>