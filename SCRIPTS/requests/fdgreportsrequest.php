<?php

session_start();

require_once '../access_semester_tables/modify_fdg_reports.inc';
require_once '../get_permissions.inc';
require_once '../db_connect.inc';
require_once '../update_factory/update_factory.inc';


if(isset($_POST["fdgreportrequest"])){
	
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
	
		$pfdg_id = 0;
		$pfdg_report_start_date = "";
		$pfdg_report_end_date = "";
		$pfdg_report_hours = 0;
		$pfdg_report_description = "";
		
		
		if(isset($_POST["pfdg_id"])){
			$pfdg_id = intval(removeslashes($_POST["pfdg_id"]));
		
			if($pfdg_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "FDG ID not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["pfdg_report_start_date"])){
			$pfdg_report_start_date = removeslashes($_POST["pfdg_report_start_date"]);
		
		} else {
			echo "FDG Start Date not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["pfdg_report_end_date"])){
			$pfdg_report_end_date = removeslashes($_POST["pfdg_report_end_date"]);
		
		} else {
			echo "FDG Report End Date not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["pfdg_report_hours"])){
			$pfdg_report_hours = intval(removeslashes($_POST["pfdg_report_hours"]));
		
			if($pfdg_report_hours == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} 
		
		if(isset($_POST["pfdg_report_description"])){
			$pfdg_report_description = mysqli_real_escape_string($conn, removeslashes($_POST["pfdg_report_description"]));
			
			
		} 
		
		$result = addFDGReport($pfdg_id, $pfdg_report_start_date, $pfdg_report_end_date, $pfdg_report_hours, $pfdg_report_description, $conn, $prefix);
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		DBClose($conn);
		return;
		
	}
	
	if($opcode == 2){
		
		$pfdg_report_id = 0;
		
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
		
		$result = deleteFDGReport($pfdg_report_id, $conn, $prefix);
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		DBClose($conn);
		return;
	}
	
	if($opcode == 3){
		
		if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][3] == 1) == false){
		
			$sql = "SELECT * FROM " . $prefix . "_fdg_leaders where pstu_id = " . $_SESSION["userid"];
		
			$result = mysqli_query($conn, $sql);
		
			if(mysqli_num_rows($result) < 1){
				echo "You do not have permission to update FDG reports.";
				DBClose($conn);
				die();
			}
		
		}
		
		file_put_contents("log.txt", "Inside opcode 3\n");
		$pfdg_report_id = 0;
		$pfdg_id = 0;
		$pfdg_report_start_date = "";
		$pfdg_report_end_date = "";
		$pfdg_report_hours = 0;
		$pfdg_report_description = "";
		
		$sets = array();
		$where = "pfdg_report_id = ";
		
		if(isset($_POST["pfdg_report_id"])){
			$pfdg_report_id = intval(removeslashes($_POST["pfdg_report_id"]));
		
			if($pfdg_report_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
			
			$where = $where . $pfdg_report_id;
			
		} else {
			echo "FDG Report ID not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["pfdg_id"])){
			$pfdg_id = intval(removeslashes($_POST["pfdg_id"]));
		
			if($pfdg_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
			
			$sets[] = "pfdg_id = " . $pfdg_id;
		} 
		
		if(isset($_POST["pfdg_report_start_date"])){
			$pfdg_report_start_date = removeslashes($_POST["pfdg_report_start_date"]);
		
			$sets[] = "pfdg_report_start_date = STR_TO_DATE('$pfdg_report_start_date', '%m/%d/%Y %l:%i %p' )";
			
		} 
		
		
		if(isset($_POST["pfdg_report_end_date"])){
			$pfdg_report_end_date = removeslashes($_POST["pfdg_report_end_date"]);
		
			$sets[] = "pfdg_report_end_date = STR_TO_DATE('$pfdg_report_end_date', '%m/%d/%Y %l:%i %p' )";
		} 
		
		if(isset($_POST["pfdg_report_hours"])){
			$pfdg_report_hours = intval(removeslashes($_POST["pfdg_report_hours"]));
		
			if($pfdg_report_hours == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
			
			$sets[] = "pfdg_report_hours = " . $pfdg_report_hours;
			
		}
		
		if(isset($_POST["pfdg_report_description"])){
			$pfdg_report_description = mysqli_real_escape_string($conn, removeslashes($_POST["pfdg_report_description"]));
		
			$sets[] = "pfdg_report_description = '" . $pfdg_report_description . "'";
		}
		
		if(count($sets) < 1){
			echo "Nothing to update";
			DBClose($conn);
			return;
		}
		
		$result = update($prefix . "_fdg_reports", $sets, $where, 2, $conn);
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		DBClose($conn);
		return;
	}
	
	
	echo "Opcode not found.";
	DBClose($conn);
	return;
	
	} else {
		echo "bad request";
		return;
	}
	?>