<?php

session_start();

require_once '../access_semester_tables/modify_fdg_event_attendence.inc';
require_once '../get_permissions.inc';
require_once '../db_connect.inc';
require_once '../update_factory/update_factory.inc';


if(isset($_POST["fdgeventattendencerequest"])){
	
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
		
		$pfdg_event_id = 0;
		$pstu_id = 0;
		
		
		if(isset($_POST["pfdg_event_id"])){
			$pfdg_event_id = intval(removeslashes($_POST["pfdg_event_id"]));
		
			if($pfdg_event_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "FDG EVENT not set.";
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
			echo "Student ID not set.";
			DBClose($conn);
			return;
		}
		
		$result = addFDGEventAttendence($pfdg_event_id, $pstu_id, $conn, $prefix);
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		DBClose($conn);
		return;
		
	}
	
	if($opcode == 2){
		
		$pfdg_eve_att_id = 0;
		
		
		if(isset($_POST["pfdg_eve_att_id"])){
			$pfdg_eve_att_id = intval(removeslashes($_POST["pfdg_eve_att_id"]));
		
			if($pfdg_eve_att_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "FDG EVENT Attendence ID not set.";
			DBClose($conn);
			return;
		}
		
		$result = deleteFDGEventAttendence($pfdg_eve_att_id, $conn, $prefix );
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		DBClose($conn);
		return;
		
	}
	
	/*
	 * This is where update would go...
	 * IF IT HAD ONE /.O./
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