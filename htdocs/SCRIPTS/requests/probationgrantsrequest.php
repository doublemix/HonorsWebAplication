<?php

session_start();

require_once '../access_tables/modify_probation_grants.inc';
require_once '../get_permissions.inc';
require_once '../db_connect.inc';
require_once '../update_factory/update_factory.inc';


if(isset($_POST["probationgrantrequest"])){
	
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
	
	if($_SESSION["permissions"][0] != 1){
		echo "You are not allowed to update permissions.";
		die();
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
		
		$probation_id = 0;
		$usr_id = 0;
		$probation_grant_requirement = 0;
		
		if(isset($_POST["probation_id"])){
			$probation_id = intval(removeslashes($_POST["probation_id"]));
		
			if($probation_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Probation ID Not Set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["usr_id"])){
			$usr_id = intval(removeslashes($_POST["usr_id"]));
		
			if($usr_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "User ID not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["probation_grant_requirement"])){
			$probation_grant_requirement = floatval(removeslashes($_POST["probation_grant_requirement"]));
		
		} else {
			echo "Probation Grant Requirement not set.";
			DBClose($conn);
			return;
		}
		
		$result = addProbationGrant($probation_id, $usr_id, $probation_grant_requirement, $conn);
		
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
		
		$probation_grant_id = 0;
		
		if(isset($_POST["probation_grant_id"])){
			$probation_grant_id = intval(removeslashes($_POST["probation_grant_id"]));
		
			if($probation_grant_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Probation Grant ID.";
			DBClose($conn);
			return;
		}
		
		$result = deleteProbationGrant($probation_grant_id, $conn);
		

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
		
		if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][7] == 1) == false){
			echo "User Not Permitted to Add, Modify, or Delete Probations";
			DBClose($conn);
			return;
		}
		
		$probation_grant_requirement = 0;
		$probation_grant_id = 0;
		
		$where = "probation_grant_id = ";
		$set = "probation_grant_requirement = ";
		
		if(isset($_POST["probation_grant_id"])){
			$probation_grant_id = intval(removeslashes($_POST["probation_grant_id"]));
		
			if($probation_grant_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
			
			$where = $where . $probation_grant_id;
			
		} else {
			echo "Probation Grant ID Not Set.";
			DBClose($conn);
			return;
		}
		
						
		if(isset($_POST["probation_grant_requirement"])){
			$probation_grant_requirement = floatval(removeslashes($_POST["probation_grant_requirement"]));
		
			$set = $set . $probation_grant_requirement;
			
		} else {
			echo "Nothing To Update.";
			DBClose($conn);
			return;
		}
		
		$result = update("probation_grants", $set, $where, 0, $conn);
		
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