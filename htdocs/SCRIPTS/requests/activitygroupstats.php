<?php

session_start();

require_once '../access_semester_tables/modify_activitygroupstats.inc';
require_once '../get_permissions.inc';
require_once '../db_connect.inc';
require_once '../update_factory/update_factory.inc';

if(isset($_POST["activitygroupstatsrequest"])){

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
		
		$pstu_id = 0;
		$agses_id = 0;
		
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
		
		if(isset($_POST["agses_id"])){
			$agses_id = intval(removeslashes($_POST["agses_id"]));
		
			if($agses_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Activity Group Session not set.";
			DBClose($conn);
			return;
		}
		
		$result = addActivityGroupStat($pstu_id, $agses_id, $conn, $prefix);
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		DBClose($conn);
		return;
		
	}
	
	if($opcode == 2){
		
		$agstat_id = 0;
		
		if(isset($_POST["agstat_id"])){
			$agstat_id = intval(removeslashes($_POST["agstat_id"]));
		
			if($agstat_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Activity Group Stat not set.";
			DBClose($conn);
			return;
		}
		
		$result = deleteActivityGroupStat($conn, $prefix, $agstat_id);
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		
		DBClose($conn);
		return;
		
	}
	
	/* Update not necessary, becuase there is
	 * Only two variables, however, if you
	 * need to implement this functionality,
	 * Insert it below
	if($opcode == 3){
		
	}
	*/
	
	echo "OPCODE Not Recognized.";
	DBClose($conn);
	return;
	
} else {
	echo "Malformed request";
	return;
}