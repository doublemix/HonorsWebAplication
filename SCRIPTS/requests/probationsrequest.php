<?php


session_start();

require_once '../access_tables/modify_probations.inc';
require_once '../get_permissions.inc';
require_once '../db_connect.inc';
require_once '../update_factory/update_factory.inc';


if(isset($_POST["probationsmodifyrequest"])){

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
	
	$opcode = intval(stripslashes($_POST["opcode"]));

	if($opcode == 0){
		echo "Malformed Operation.";
		DBClose($conn);
		return;
	}
	
	if($_SESSION["permissions"][0] != 1){
		echo "You do not have permission to modify probations.";
		DBClose($conn);
	}
	
	//Add
	if($opcode == 1){
		
		$probation_name = "";
		$probation_type = 0;
		
		if(isset($_POST["probation_name"])){
			$probation_name = mysqli_real_escape_string($conn, stripslashes($_POST["probation_name"]));
			
			if(strlen(trim($probation_name)) < 1){
				echo "Probation Name is blank.";
				DBClose($conn);
				die();
			}
		} else {
			echo "Probation Name Required.";
			DBClose();
			return;
		}
		
		if(isset($_POST["probation_type"])){
			$probation_type = intval(stripslashes($_POST["probation_type"]));
			
			if($probation_type < 0 || $probation_type > 5){
				echo "Probation Type Not Recognized.";
				DBClose($conn);
				return;
			}
			
		} else {
			echo "Probation Type Required.";
			DBClose($conn);
			return;
		}
		
		$result = addProbation($probation_name, $probation_type, $conn);
		
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
		
		$probation_id = 0;
		
		if(isset($_POST["probation_id"])){
			
			$probation_id = intval(removeslashes($_POST["probation_id"]));
			
			if($probation_id == 0){
				echo "Malformed Probation ID.";
				DBClose($conn);
				return;
			}
			
		}
		
		$result = deleteProbation($probation_id);
		
		if($result === true){
			DBClose($conn);
			echo "success";
			return;
		} else {
			DBClose($conn);
			echo $result;
			return;
		}
		
	}
	
	//Update
	if($opcode == 3){
		
		$sets = array();
		$where = "probation_id = ";
		$probation_id = 0;
		
		if(isset($_POST["probation_id"])){
				
			$probation_id = intval(removeslashes($_POST["probation_id"]));
				
			if($probation_id == 0){
				echo "Malformed Probation ID.";
				DBClose($conn);
				return;
			}
		
		
	} else {
		DBClose($conn);
		echo "Probation ID required.";
		return;
	}
	
	
	$where = $where . $probation_id;
	
	if(isset($_POST["probation_name"])){
		
		if(strlen(trim($_POST["probation_name"])) < 1){
			echo "Probation Name is blank.";
			DBClose($conn);
			die();
		}
		
		$sets[] = "probation_name = '" . mysqli_real_escape_string($conn, removeslashes($_POST["probation_name"])) . "'";
	}
	
	if(isset($_POST["probation_type"])){
		$probation_type = intval(removeslashes($_POST["probation_type"]));
			
		if($probation_type < 0 || $probation_type > 5){
			echo "Probation Type Not Recognized.";
			DBClose($conn);
			return;
		}
		
		$sets[] = "probation_type = " . $probation_type;
	}
	
	if(count($sets) < 1){
		echo "Nothing to Update";
		DBClose($conn);
		return;
	}
	
	$results = update("probations", $sets, $where, 2, $conn);
	
	if($results === true){
		echo "success";
		DBClose($conn);
		return;
	} else {
		echo $results;
		DBClose($conn);
		return;
	}
	
	}

} else {
	echo "Malformed Request.";
	return;
}


?>