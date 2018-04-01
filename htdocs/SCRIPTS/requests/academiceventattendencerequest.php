<?php

session_start();

require_once '../access_semester_tables/modify_academicevent_attendence.inc';
require_once '../get_permissions.inc';
require_once '../db_connect.inc';
require_once '../update_factory/update_factory.inc';


if(isset($_POST["academiceventattendencerequest"])){
	
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
		if(strlen($prefix) < 1){
			echo "Prefix must be at least one character.";
			DBClose($conn);
			die();
		}
	} else {
		echo "Prefix not set.";
		DBClose($conn);
		return;
	}
	
	
	
	//Add
	if($opcode == 1){
		
		$acad_id = 0;
		
		$pstu_id = 0;
		
		if(isset($_POST["acad_id"])){
			$acad_id = intval(removeslashes($_POST["acad_id"]));
		
			if($acad_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Academic Event ID not set.";
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
			echo "Current Student ID not set.";
			DBClose($conn);
			return;
		}
		
		$result = addAcademicEventAttendenceRecord($acad_id, $pstu_id, $conn, $prefix);
		
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
		
		$acad_att_id = 0;
		
		if(isset($_POST["acad_att_id"])){
			$acad_att_id = intval(removeslashes($_POST["acad_att_id"]));
		
			if($acad_att_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Academic Event Attendence ID not set.";
			DBClose($conn);
			return;
		}
		
		$result = deleteAcademicEventAttendenceRecord($acad_att_id, $conn, $prefix);
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		DBClose($conn);
		return;
		
	}
	
	//Update
	/*Not Necessary, since students
	 * Are either present, or not.
	 * Hence, add/delete should be
	 * functional enough.
	 * 
	 * 
	if($opcode == 3){
		
	}
	*/
	
	echo "Opcode not present.";
	DBClose($conn);
	return;
	
} else {
	echo "bad request";
	return;
}
?>