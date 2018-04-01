<?php

session_start();

require_once '../access_semester_tables/modify_fdg_attendence.inc';
require_once '../get_permissions.inc';
require_once '../db_connect.inc';
require_once '../update_factory/update_factory.inc';


if(isset($_POST["fdgattendencerequest"])){
	
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
	
		$pfdg_report_id = 0;
		$pstu_id = 0;
		
		if(isset($_POST["pfdg_report_id"])){
			$pfdg_report_id = intval(removeslashes($_POST["pfdg_report_id"]));
		
			if($pfdg_report_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "FDG Report ID not set.";
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
		
		$result = addFDGAttendence($pfdg_report_id, $pstu_id, $prefix, $conn);
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
		
		$pfdg_att_id = 0;
		
		if(isset($_POST["pfdg_att_id"])){
			$pfdg_att_id = intval(removeslashes($_POST["pfdg_att_id"]));
		
			if($pfdg_att_id == 0){
				echo "Report Attendence ID Malformed.";
				DBClose($conn);
				return;
			}
		} else {
			echo "FDG Attendence ID not set.";
			DBClose($conn);
			return;
		}
		
		$result = deleteFDGAttendence($pfdg_att_id, $conn, $prefix);
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		DBClose($conn);
		return;
	}
	
	/*This is where
	 * update would go...
	 * IF IT HAD ONE!!!!!1!
	 */
	
	echo "OPCODE NOT FOUND";
	DBClose($conn);
	return;
	
} else {
	echo "bad request";
	return;
}
?>