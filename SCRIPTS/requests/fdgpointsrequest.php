<?php

session_start();

require_once '../access_semester_tables/modify_fdg_points.inc';
require_once '../get_permissions.inc';
require_once '../db_connect.inc';
require_once '../update_factory/update_factory.inc';


if(isset($_POST["fdgpointsrequest"])){
	
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
		
		$pfdg_id = 0;
		$pfdg_event_id = 0;
		$pfdg_points_points = 0;
		
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
		
		if(isset($_POST["pfdg_event_id"])){
			$pfdg_event_id = intval(removeslashes($_POST["pfdg_event_id"]));
		
			if($pfdg_event_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "FDG EVENT ID not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["pfdg_points_points"])){
			$pfdg_points_points = intval(removeslashes($_POST["pfdg_points_points"]));
		
			if($pfdg_points_points == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "FDG Points not set.";
			DBClose($conn);
			return;
		}
		
		
		$result = addFDGPoints($pfdg_id, $pfdg_event_id, $pfdg_points_points, $conn, $prefix);
		
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
		
		$pfdg_points_id = 0;
		
		if(isset($_POST["pfdg_points_id"])){
			$pfdg_points_id = intval(removeslashes($_POST["pfdg_points_id"]));
		
			if($pfdg_points_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "FDG EVENT ID not set.";
			DBClose($conn);
			return;
		}
		
		$result = deleteFDGPoints($pfdg_points_id, $conn, $prefix);
		
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
		
		if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][3] == 1 ) == false){
			echo "You do not have permission to modify FDG points.";
			DBClose($conn);
			return;
			
		}
		
		$pfdg_points_id = 0;
		$pfdg_points_points = 0;
		
		$sets = array();
		$where = "pfdg_points_id = ";
		
		if(isset($_POST["pfdg_points_id"])){
			$pfdg_points_id = intval(removeslashes($_POST["pfdg_points_id"]));
		
			if($pfdg_points_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
			
			$where = $where . $pfdg_points_id;
			
		} else {
			echo "FDG Points ID not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["pfdg_points_points"])){
			$pfdg_points_points = intval(removeslashes($_POST["pfdg_points_points"]));
		
			if($pfdg_points_points == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
			
			$sets[] = "pfdg_points_points = " . $pfdg_points_points;
			
		} else {
			echo "FDG Points not set.";
			DBClose($conn);
			return;
		}
		
		if(count($sets) < 1){
			echo "Nothing to Update";
			DBClose($conn);
			return;
		}
		
		$result = update($prefix . "_fdg_points", $sets, $where, 2, $conn);
		
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