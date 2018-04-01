<?php

session_start();

require_once '../access_tables/modify_fdg.inc';
require_once '../get_permissions.inc';
require_once '../db_connect.inc';
require_once '../update_factory/update_factory.inc';

if(isset($_POST["fdgmodifyrequest"])){
	
	$conn = DBConnect();
	
	
	
	if($conn === false){
		echo "Unable to Connect to Database.";
		return;
	}
	
	
	if(getPermissions($conn) == false){
		echo "Unable to retrieve permissions.";
		DBClose($conn);
		return;
	}
	
	$opcode = intval(removeslashes($_POST["opcode"]));
	
	if($opcode == 0){
		echo "Malformed Operation.";
		DBClose($conn);
		return;
	}
	
	//Add
	if($opcode == 1){
			
		if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][3] == 1 ) == false){
			echo "You do not have permission to add FDG's.";
			DBClose($conn);
			return;
		}
				
		$fdg_name = "";
		$fdg_imagepath = "";
		
		if(isset($_POST["fdg_name"])){
			$fdg_name = mysqli_real_escape_string($conn, removeslashes($_POST["fdg_name"]));
			
			if(strlen(trim($fdg_name)) < 1){
				echo "FDG Name is Blank.";
				DBClose($conn);
				die();
			}
			
		} else {
			echo "FDG name required!";
			DBClose($conn);
			return;
		}
		
		
		if(isset($_POST["fdg_imagepath"])){
			$fdg_imagepath = removeslashes($_POST["fdg_imagepath"]);
		}
				
		$result = createFDG ($fdg_name, $fdg_imagepath, $conn);
				
		if($result === true){
			echo "success";
			DBClose($conn);
			return;
		} else {
			echo "Could not create FDG.";
			DBClose($conn);
			return;
		}
	}
	
	//Delete
	if($opcode == 2){
		
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][3] == 1 ) == false){
			echo "You do not have permission to remove FDG's.";
			DBClose($conn);
			return;
		}
		
		if(!isset($_POST["fdg_id"])){
			echo "Could not find fdg_id";
			DBClose($conn);
			return;
		}
		
		$fdg_id = intval(strip_tags($_POST["fdg_id"]));
		
		if($fdg_id == 0){
			echo "Malformed FDG ID.";
			DBClose($conn);
			return;
		}
		
		if($fdg_id == 1){
			echo "Deleting this will break the Database. Delete Refused.";
			DBClose($conn);
			return;
		}
		
		$result = removeFDG($fdg_id, $conn);
		
		if ($result === true){
			echo "success";
			DBClose($conn);
			return;
		} else {
			echo $result;
			DBClose($conn);
			return;
		}
		
	}
	
	//Update
	if($opcode == 3){
		
		if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][3] == 1 ) == false){
			echo "You do not have permission to update FDG's.";
			DBClose($conn);
			return;
		}
		
		$result = mysqli_query($conn, "SELECT * FROM fdg_leaders WHERE pstu_id = " . $_SESSION["userid"]);
		
		
		
		$sets = array();
		$where = "fdg_id = ";
		
		if(!isset($_POST["fdg_id"])){
			echo "Could not find fdg_id";
			DBClose($conn);
			return;
		}
		
		$fdg_id = intval(removeslashes($_POST["fdg_id"]));
		
		if($fdg_id == 0){
			echo "Malformed FDG ID.";
			DBClose($conn);
			return;
		}
		
		$where = $where . $fdg_id;
		
		if(isset($_POST["fdg_name"])){
			
			if(strlen(trim($_POST["fdg_name"])) < 1){
				echo "FDG Name is Blank.";
				DBClose($conn);
				die();
			}
			
			$sets[] = "fdg_name = '" . mysqli_real_escape_string($conn, removeslashes($_POST["fdg_name"])) . "'";
			
		}
		
		if(isset($_POST["fdg_bg_color"])){
				
				
			if(!preg_match('/^#[a-f0-9]{6}$/i', $_POST["fdg_bg_color"]))
			{
				echo "Invalid Font color code.";
				die();
			}
			
			$sets[] = "fdg_bg_color = '" . removeslashes($_POST["fdg_bg_color"]) . "'";
				
		}
		
		if(isset($_POST["fdg_ft_color"])){
				
			if(!preg_match('/^#[a-f0-9]{6}$/i', $_POST["fdg_ft_color"]))
			{
				echo "Invalid Font color code.";
				die();
			}
				
			$sets[] = "fdg_ft_color = '" . removeslashes($_POST["fdg_ft_color"]) . "'";
				
		}
		
		if(isset($_POST["fdg_imagepath"])){
			
			
			$sets[] = "fdg_imagepath = " . removeslashes($_POST["fdg_imagepath"]);
			
		}
		
		if(count($sets) < 1){
			echo "Nothing to update";
			DBClose($conn);
			return;
		}
		
		$result = update("fdg", $sets, $where, 2, $conn);

		if($result === true){
			echo "success";
			DBClose();
			return;
		} else {
			echo "Failed to update.";
			DBClose();
			return;
		}
		
	}
	
	echo "Unknown Operation Requested.";
	
} else {
	echo "Malformed Request.";
	return;
}


?>
