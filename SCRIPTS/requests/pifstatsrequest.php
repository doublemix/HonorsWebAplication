<?php

session_start();

require_once '../access_semester_tables/modify_pif_stats.inc';
require_once '../get_permissions.inc';
require_once '../db_connect.inc';
require_once '../update_factory/update_factory.inc';


if(isset($_POST["publicissuesforumstatsrequest"])){
	
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
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][8] == 1 ) == false){
		echo "You do not have permission to modify the image slide.";
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
		$pif_id = 0;
		
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
		
		if(isset($_POST["pif_id"])){
			$pif_id = intval(removeslashes($_POST["pif_id"]));
		
			if($pif_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Public Issues Forum ID not set.";
			DBClose($conn);
			return;
		}
		
		$result = addPifStat($pstu_id, $pif_id, $conn, $prefix);
		
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
		
		$pifstat_id = 0;
		
		if(isset($_POST["pifstat_id"])){
			$pifstat_id = intval(removeslashes($_POST["pifstat_id"]));
		
			if($pifstat_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Public Issues Forum Stat ID not set.";
			DBClose($conn);
			return;
		}
		
		$result = deletePifStat($pifstat_id, $conn, $prefix );
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		DBClose($conn);
		return;
	}
	
	//Update
	/* 
	 * THIS IS WHERE UPDATE WOULD GO....
	 * 
	 * if it had one  :'(
	 * 
	if($opcode == 3){
		
	}
	*/
	echo "Opcode not found.";
	DBClose($conn);
	return;
	
	} else {
		echo "bad request";
		return;
	}
	?>