<?php

session_start();

require_once '../access_semester_tables/modify_current_fdg.inc';
require_once '../get_permissions.inc';
require_once '../db_connect.inc';
require_once '../update_factory/update_factory.inc';


if(isset($_POST["currentfdgrequest"])){
	
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
	
	if($opcode == 1){
		
		$fdg_id = 0;
		
		if(isset($_POST["fdg_id"])){
			$fdg_id = intval(removeslashes($_POST["fdg_id"]));
		
			if($fdg_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "FDG ID not set.";
			DBClose($conn);
			return;
		}
		
		$result = addCurrentFDG($fdg_id, $conn, $prefix);
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		DBClose($conn);
		return;
	}
	
	if($opcode == 2){
		
		$fdg_id = 0;
		
		if(isset($_POST["fdg_id"])){
			$fdg_id = intval(removeslashes($_POST["fdg_id"]));
		
			if($fdg_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "FDG ID not set.";
			DBClose($conn);
			return;
		}
		
		$result = deleteCurrentFDG($fdg_id, $conn, $prefix);
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		DBClose($conn);
		return;
	}
	
	/*
	 * This is where update would go...|
	 * IF IT HAD ONE!
	if($opcode == 3){
		
	}
	*/
	
	echo "Opcode not matched";
	DBClose($conn);
	return;
	
} else {
	echo "bad request";
	return;
}
