<?php

session_start();

require_once '../access_semester_tables/modify_pif.inc';
require_once '../get_permissions.inc';
require_once '../db_connect.inc';
require_once '../update_factory/update_factory.inc';


if(isset($_POST["publicissuesforumrequest"])){
	
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
		echo "You do not have permission to modify PIFS.";
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
	
		$pif_start_date = "";
		$pif_end_date = "";
		$pif_title = "";
		$pif_description = "";
		
		if(isset($_POST["pif_start_date"])){
			$pif_start_date = removeslashes($_POST["pif_start_date"]);
		} else {
			echo "PIF Start Date not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["pif_end_date"])){
			$pif_end_date = removeslashes($_POST["pif_end_date"]);
		} else {
			echo "PIF End Date not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["pif_title"])){
			$pif_title = mysqli_real_escape_string($conn, removeslashes($_POST["pif_title"]));
			
			if(strlen(trim($pif_title)) < 1){
				echo "PIF Title is blank.";
				DBClose($conn);
				die();
			}
			
		} else {
			echo "PIF Title not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["pif_description"])){
			$pif_description = mysqli_real_escape_string($conn, removeslashes($_POST["pif_description"]));
			
			if(strlen(trim($pif_description)) < 1){
				echo "PIF Description is blank.";
				DBClose($conn);
				die();
			}
		} else {
			echo "PIF Description not set.";
			DBClose($conn);
			return;
		}
		
		$result = addPif($pif_start_date, $pif_end_date, $pif_title, $pif_description, $conn, $prefix);
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		DBClose($conn);
		return;
		
	}
	
	if($opcode == 2){
		
		$pif_id = 0;
		
		if(isset($_POST["pif_id"])){
			$pif_id = intval(removeslashes($_POST["pif_id"]));
		
			if($pif_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "PIF ID not set.";
			DBClose($conn);
			return;
		}
		
		$result = deletePif($pif_id, $conn, $prefix);
		
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
		
		if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1) == false){
			
			echo "You do not have permission to add Pifs";
			DBClose($conn);
			return;
		}
		
		$pif_id = 0;
		$pif_start_date = "";
		$pif_end_date = "";
		$pif_title = "";
		$pif_description = "";
		$pif_bg_color = "";
		$pif_ft_color = "";
		
		$sets = array();
		$where = "pif_id = ";
		
		
		
		if(isset($_POST["pif_id"])){
			$pif_id = intval(removeslashes($_POST["pif_id"]));
		
			if($pif_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
			
			$where = $where . $pif_id;
			
		} else {
			echo "PIF ID not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["pif_start_date"])){
			$pif_start_date = removeslashes($_POST["pif_start_date"]);
			
			$sets[] = "pif_start_date = STR_TO_DATE('$pif_start_date', '%m/%d/%Y %l:%i %p' )";
		} 
		
		
		if(isset($_POST["pif_end_date"])){
			$pif_end_date = removeslashes($_POST["pif_end_date"]);
			
			$sets[] = "pif_end_date = STR_TO_DATE('$pif_end_date', '%m/%d/%Y %l:%i %p' )";
		} 
		
		if(isset($_POST["pif_title"])){
			$pif_title = mysqli_real_escape_string($conn, removeslashes($_POST["pif_title"]));
			
			if(strlen(trim($pif_title)) < 1){
				echo "PIF Title is blank.";
				DBClose($conn);
				die();
			}
			
			$sets[] = "pif_title = '" . $pif_title . "'";
		} 
		
		if(isset($_POST["pif_description"])){
			$pif_description = mysqli_real_escape_string($conn, removeslashes($_POST["pif_description"]));
			
			if(strlen(trim($pif_description)) < 1){
				echo "PIF Description is blank.";
				DBClose($conn);
				die();
			}
			
			$sets[] = "pif_description = '" . $pif_description . "'";
		} 
		
		if(isset($_POST["pif_bg_color"])){
			$pif_bg_color = removeslashes($_POST["pif_bg_color"]);
			
			if(!preg_match('/^#[a-f0-9]{6}$/i', $pif_bg_color))
			{
				echo "Invalid Font color code.";
				die();
			}
			
			$sets[] = "pif_bg_color = '" . $pif_bg_color . "'";
		}
		
		if(isset($_POST["pif_ft_color"])){
			$pif_ft_color = removeslashes($_POST["pif_ft_color"]);
			
			if(!preg_match('/^#[a-f0-9]{6}$/i', $pif_ft_color))
			{
				echo "Invalid Font color code.";
				die();
			}
			
			$sets[] = "pif_ft_color = '" . $pif_ft_color . "'";
		}
		
		if(count($sets) < 1){
			
			echo "Nothing to update";
			DBClose($conn);
			return;
			
		}
				
		$result = update($prefix . "_pif", $sets, $where, 2, $conn);
		
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