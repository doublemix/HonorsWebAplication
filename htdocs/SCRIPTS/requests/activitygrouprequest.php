<?php

session_start();

require_once '../access_semester_tables/modify_activitygroup.inc';
require_once '../get_permissions.inc';
require_once '../db_connect.inc';
require_once '../update_factory/update_factory.inc';

if(isset($_POST["activitygrouprequest"])){

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
		
		$ag_title = "";
		$ag_description = "";
		$ag_imagepath = "";
		
		
		if(isset($_POST["ag_title"])){
			$ag_title = mysqli_real_escape_string($conn, removeslashes($_POST["ag_title"]));
			
			if(strlen(trim($ag_title)) < 1){
				echo "Title field is blank.";
				DBClose($conn);
				die();
			}
			
		} else {
			echo "Activity Group Title not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["ag_description"])){
			$ag_description = mysqli_real_escape_string($conn, removeslashes($_POST["ag_description"]));
			
			if(strlen(trim($ag_description)) < 1){
				echo "Description field is blank.";
				DBClose($conn);
				die();
			}
			
		} else {
			echo "Activity Group Description not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["ag_imagepath"])){
			$ag_imagepath = removeslashes($_POST["ag_imagepath"]);
		} 
		
		$result = addActivityGroup($ag_title, $ag_description, $ag_imagepath, $conn, $prefix);
		
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
		
		$ag_id = 0;
		
		if(isset($_POST["ag_id"])){
			$ag_id = intval(removeslashes($_POST["ag_id"]));
		
			if($ag_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Activity Group ID not set.";
			DBClose($conn);
			return;
		}
		
		$result = deleteActivityGroup($conn, $prefix, $ag_id);
		
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
		
		$ag_id = 0;
		$ag_title = "";
		$ag_description = "";
		$ag_imagepath = "";
		$ag_bg_color = "";
		$ag_ft_color = "";
		
		$where = "ag_id = ";
		$sets = array();
		
			$is_agleader = false;
			
			$result = mysqli_query($conn, 'SELECT pstu_id FROM ' . $prefix . '_activitygroupleaders WHERE pstu_id = ' . $_SESSION["userid"]);
			
			if($result !== false){
				
				$row_cnt = mysqli_num_rows($result);
				
				if($row_cnt > 0){
					$is_agleader = true;
				}
				
			} else {
				DBClose($conn);
				echo "Could not determine AG Leader status";
				return;
			}
		
		
			if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][6] == 1) == false){
				echo "You do not have permissions to update Activity Groups.";
				die();
			}
			
		if(isset($_POST["ag_id"])){
			
			
			$ag_id = intval(removeslashes($_POST["ag_id"]));
		
			if($ag_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
			
			$where = $where . $ag_id;
			
		} else {
			echo "Activity Group ID not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["ag_title"])){
			
			if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1) == false){
				echo "You do not have permissions to update ag_title.";
				DBClose($conn);
				return;
			}
			
			$ag_title = mysqli_real_escape_string($conn, removeslashes($_POST["ag_title"]));
			
			if(strlen(trim($ag_title)) < 1){
				echo "Title field is blank.";
				DBClose($conn);
				die();
			}
			
			$sets[] = "ag_title = '" . $ag_title . "'";
			
		} 
		
		if(isset($_POST["ag_bg_color"])){
				
			if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1) == false){
				echo "You do not have permissions to update ag_bg_color.";
				DBClose($conn);
				return;
			}
				
			$ag_bg_color = mysqli_real_escape_string($conn, removeslashes($_POST["ag_bg_color"]));
				
			if(!preg_match('/^#[a-f0-9]{6}$/i', $ag_bg_color))
			{
				echo "Invalid Background color code.";
				die();
			}
			
			$sets[] = "ag_bg_color = '" . $ag_bg_color . "'";
				
		}
		
		if(isset($_POST["ag_ft_color"])){
				
			if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1) == false){
				echo "You do not have permissions to update ag_ft_color.";
				DBClose($conn);
				return;
			}
				
			$ag_ft_color = mysqli_real_escape_string($conn, removeslashes($_POST["ag_ft_color"]));
				
			if(!preg_match('/^#[a-f0-9]{6}$/i', $ag_ft_color))
			{
				echo "Invalid FONT color code.";
				die();
			}
			
			$sets[] = "ag_ft_color = '" . $ag_ft_color . "'";
				
		}
		
		if(isset($_POST["ag_description"])){
			
			if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $is_agleader == true) == false){
				echo "You do not have permissions to update Activity Group Description.";
				DBClose($conn);
				return;
			}
			
			$ag_description = mysqli_real_escape_string($conn, removeslashes($_POST["ag_description"]));
			
			if(strlen(trim($ag_description)) < 1){
				echo "Description field is blank.";
				DBClose($conn);
				die();
			}
			
			$sets[] = "ag_description = '" . $ag_description . "'";
			
		} 
		
		if(isset($_POST["ag_imagepath"])){
			
			if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $is_agleader == true) == false){
				echo "You do not have permissions to update Activity Group Imagepath.";
				DBClose($conn);
				return;
			}
			
			$ag_imagepath = removeslashes($_POST["ag_imagepath"]);
			
			$sets[] = "ag_imagepath = '" . $ag_imagepath . "'";
			
		}
		
		if(count($sets) < 1){
			echo "Nothing to update";
			DBClose($conn);
			return;
		}
		
		$result = update($prefix . "_activitygroup", $sets, $where, 2, $conn);
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		
		die();
		
	}
	
	
	echo "Opcode not valid";
	DBClose($conn);
	return;
	
	
	
	
} else {
	echo "Invalid request";
	return;
}
