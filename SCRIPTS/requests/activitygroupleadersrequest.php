<?php 
session_start();

require_once '../access_semester_tables/modify_activitygroupleaders.inc';
require_once '../get_permissions.inc';
require_once '../db_connect.inc';
require_once '../update_factory/update_factory.inc';

if(isset($_POST["activitygroupleaders"])){

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
		
		
		$ag_id = 0;
		$pstu_id = 0;
		
		if(isset($_POST["ag_id"])){
			$ag_id = intval(removeslashes($_POST["ag_id"]));
		
			if($ag_id == 0){
				echo "Malformed Activity Group.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Activity Group ID Not Set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["pstu_id"])){
			$pstu_id = intval(removeslashes($_POST["pstu_id"]));
		
			if($pstu_id == 0){
				echo "Malformed Student ID.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Current Student ID Not Set.";
			DBClose($conn);
			return;
		}
		
		
	$result = addActivityGroupLeader($ag_id, $pstu_id, $conn, $prefix);
	
	
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
		
		$ag_leaders = 0;
		
		if(isset($_POST["ag_leaders"])){
			$ag_leaders = intval(removeslashes($_POST["ag_leaders"]));
		
			if($ag_leaders == 0){
				echo "Malformed Activity Group Leader ID.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Activity Group Leader ID Not Set.";
			DBClose($conn);
			return;
		}
		
		$result = deleteActivityGroupLeader($conn, $prefix, $ag_leaders);
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		
		DBClose($conn);
		return;
	}
	
	/*
	 * Only two variables, no need to update
	 * If in the future this function is required,
	 * insert it here.
	if($opcode == 3){
		
	}
	*/
	
	echo "Opcode not recognized";
	DBClose($conn);
	return;
	
} else {
	echo "Malformed Request.";
			return;
}
?>