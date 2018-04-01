<?php

session_start();

require_once '../access_semester_tables/modify_currentstudents.inc';
require_once '../get_permissions.inc';
require_once '../db_connect.inc';
require_once '../update_factory/update_factory.inc';


if(isset($_POST["currentstudentsrequest"])){
	
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
		$pstu_in_fdg = 0;
		
		if(isset($_POST["pstu_id"])){
			$pstu_id = intval(removeslashes($_POST["pstu_id"]));
		
			if($pstu_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Current Students not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["pstu_in_fdg"])){
			$pstu_in_fdg = intval(removeslashes($_POST["pstu_in_fdg"]));
		
			if($pstu_in_fdg == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "IN FDG? not set.";
			DBClose($conn);
			return;
		}
		
		if($pstu_in_fdg != 1){
			$pstu_in_fdg = 0;
		}
		
		$result = addCurrentStudentWithFDGOption($pstu_id, $conn, $prefix, $pstu_in_fdg);
		
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
		
		$pstu_id = 0;
		
		if(isset($_POST["pstu_id"])){
			$pstu_id = intval(removeslashes($_POST["pstu_id"]));
		
			if($pstu_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Current Students not set.";
			DBClose($conn);
			return;
		}
		
		$result = removeCurrentStudent($pstu_id, $conn, $prefix);
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		DBClose($conn);
		return;
	}
	
	//Add/remove student to FDG
	if($opcode == 3 ){
		
		$pstu_id = 0;
		$pstu_in_fdg = 0;
		
		if(isset($_POST["pstu_id"])){
			$pstu_id = intval(removeslashes($_POST["pstu_id"]));
		
			if($pstu_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Current Students not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["pstu_in_fdg"])){
			$pstu_in_fdg = intval(removeslashes($_POST["pstu_in_fdg"]));
		
			if($pstu_in_fdg == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "IN FDG? not set.";
			DBClose($conn);
			return;
		}
		
		$result = "";
		
		if($pstu_in_fdg == 1){
		$result = inFDG($pstu_id, $conn, $prefix);
		} else {
		$result = removeFromFDG($pstu_id, $conn, $prefix);
		}
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		DBClose($conn);
		return;
	}
	
	
	
	/*This is where the update would go...
	 * IF IT HAD ONE.
	if($opcode == 5){
		
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