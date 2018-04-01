<?php

session_start();

require_once '../access_semester_tables/modify_activitygroupsession.inc';
require_once '../get_permissions.inc';
require_once '../db_connect.inc';
require_once '../update_factory/update_factory.inc';

if(isset($_POST["activitygroupsession"])){

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
		$agses_start_time = "";
		$agses_end_time = "";
		$agses_description = "";
		
		if(isset($_POST["ag_id"])){
			$ag_id = intval(removeslashes($_POST["ag_id"]));
		
			if($ag_id == 0){
				echo "Malformed AG ID Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Activity Group Session ID not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["agses_start_time"])){
			$agses_start_time = mysqli_real_escape_string($conn, removeslashes($_POST["agses_start_time"]));
		} else {
			echo "Malformed Agses Start Time Operation.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["agses_end_time"])){
			$agses_end_time = mysqli_real_escape_string($conn, removeslashes($_POST["agses_end_time"]));
		} else {
			echo "Malformed Agses End Time Operation.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["agses_description"])){
			$agses_description = mysqli_real_escape_string($conn, removeslashes($_POST["agses_description"]));

			
		} else {
			echo "Malformed Agses End Time Operation.";
			DBClose($conn);
			return;
		}
		
		$result = addActivityGroupSession($ag_id, $agses_start_time, $agses_end_time, $agses_description,$conn, $prefix);
		
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
		
		$agses_id = 0;
		
		if(isset($_POST["agses_id"])){
			$agses_id = intval(removeslashes($_POST["agses_id"]));
		
			if($agses_id == 0){
				echo "Malformed Agses ID Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Activity Group Session ID not set.";
			DBClose($conn);
			return;
		}
		
		$result = deleteActivityGroupSession($conn, $prefix, $agses_id);
		
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
		
		getPermissions($conn);
		
		
		
		$is_leader = false;
		
		$result = mysqli_query($conn, "Select * from " . $prefix . "_activitygroupleaders where pstu_id = " . $_SESSION["userid"]);
		
		if(mysqli_num_rows($result) > 0){
			$is_leader = true;
		}
		
		if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][6] == 1 || $is_leader == true) == false){
			echo "User Not Permitted to Add, Modify, or Delete Activity Group Leaders";
			DBClose($conn);
			return;
		}
		
		$sets = array();
		$where = "agses_id = ";
		
		$agses_id = 0;
		$ag_id = 0;
		$agses_start_time = "";
		$agses_end_time = "";
		
		if(isset($_POST["agses_id"])){
			$agses_id = intval(removeslashes($_POST["agses_id"]));
		
			if($agses_id == 0){
				echo "Malformed Agses ID Operation.";
				DBClose($conn);
				return;
			}
			
			$where = $where . $agses_id;
			
		} else {
			echo "Activity Group Session ID not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["ag_id"])){
			$ag_id = intval(removeslashes($_POST["ag_id"]));
		
			if($ag_id == 0){
				echo "Malformed AG ID Operation.";
				DBClose($conn);
				return;
			}
			
			$sets[] = "ag_id = " . $ag_id;
			
		} 
		
		
		if(isset($_POST["agses_start_time"])){
			$agses_start_time = mysqli_real_escape_string($conn, removeslashes($_POST["agses_start_time"]));
			
			$sets[] = "agses_start_time = STR_TO_DATE('$agses_start_time', '%m/%d/%Y %l:%i %p' )";
		} 
		
		if(isset($_POST["agses_end_time"])){
			$agses_end_time = mysqli_real_escape_string($conn, removeslashes($_POST["agses_end_time"]));
			
			$sets[] = "agses_end_time = STR_TO_DATE('$agses_end_time', '%m/%d/%Y %l:%i %p' )";
		} 
		
		if(isset($_POST["agses_description"])){
			$agses_description = mysqli_real_escape_string($conn, removeslashes($_POST["agses_description"]));
				
			if(strlen(trim($agses_description)) < 1){
				echo "Activity Group Session Description is Blank.";
				DBClose($conn);
				die();
			}
			
			$sets[] = "agses_description = '" . $agses_description . "'";
		}
		
		$result = update($prefix . "_activitygroupsession", $sets, $where, 2, $conn);
	
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		
		DBClose($conn);
		return;
		
	}
		
	echo "Invalid Opcode";
	DBClose($conn);
	return;
	
} else {
	echo "Malformed request.";
	return;
}

?>