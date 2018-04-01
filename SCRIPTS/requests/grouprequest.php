<?php
session_start ();

require_once '../access_tables/modify_groups.inc';
require_once '../get_permissions.inc';
require_once '../db_connect.inc';
require_once '../update_factory/update_factory.inc';

if (isset ( $_POST ["grouprequest"] )) {
	
	$conn = DBConnect ();
	
	if ($conn == false) {
		echo "Unable to Connect to Database.";
		return;
	}
	
	if (get_permissions ( $conn ) == false) {
		echo "Unable to retrieve permissions.";
		DBClose ( $conn );
		return;
	}
	
	$opcode = 0;
	
	if (isset ( $_POST ["opcode"] )) {
		$opcode = intval ( removeslashes ( $_POST ["opcode"] ) );
		
		if ($opcode == 0) {
			echo "Malformed Operation.";
			DBClose ( $conn );
			return;
		}
	} else {
		echo "Opcode not set.";
		DBClose ( $conn );
		return;
	}
	
	//Add
	if($opcode == 1){
		
		$name = "";
		$description = "";
		$admin = 0;
		$imagename = "";
		$grouptype = 0;
		
		if(isset($_POST["name"])){
			$name = removeslashes($_POST["name"]);
		
		} else {
			echo "Group Name not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["description"])){
			$description = removeslashes($_POST["description"]);
		
		} 
		
		if(isset($_POST["admin"])){
			$admin = intval(removeslashes($_POST["admin"]));
		
			if($admin == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Admin ID not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["imagename"])){
			$imagename = removeslashes($_POST["imagename"]);
		
		} 
		
		if(isset($_POST["grouptype"])){
			$grouptype = intval(removeslashes($_POST["grouptype"]));
		
			if($grouptype == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Group Type not set.";
			DBClose($conn);
			return;
		}
		
		$result = addGroup($name, $description, $admin, $imagename, $grouptype, $conn);
		
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
		
		$group_id = 0;
		
		if(isset($_POST["group_id"])){
			$group_id = intval(removeslashes($_POST["group_id"]));
		
			if($group_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Group ID not set.";
			DBClose($conn);
			return;
		}
		
		$result = deleteGroup($group_id, $conn);
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		DBClose($conn);
		return;
		
	}
	
	//update
	if($opcode == 3){
		
		$name = "";
		$description = "";
		$admin = 0;
		$imagename = "";
		$grouptype = 0;
		$group_id = 0;
		
		$where = "group_id = ";
		$sets = array();
		
		$is_admin = false;
		$current_group_type = 0;
		

		if(isset($_POST["group_id"])){
			$group_id = intval(removeslashes($_POST["group_id"]));
		
			if($group_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
			
			$result = mysqli_query($conn, "SELECT group_type, group_admin FROM groups WHERE group_id = " . $group_id);
			if($result != false){
			
			while($row = mysqli_fetch_row($result)){
			if(intval($row[0]) != 0){
				$grouptype = $row[0];
			} else {
				echo "Unable to retrieve group type";
				DBClose($conn);
				return;
			}
			
			if(intval($row[1]) != 0){
				if($row[1] == $_SESSION["userid"]){
					$is_admin = true;
				}
			} else {
				echo "Unable to retrieve admin";
				DBClose($conn);
				return;
			}
			
		}
			
			} else {
				echo "Unable to retrieve group type and admin";
				DBClose($conn);
				return;
			}
			
			
			
			$where = "group_id = " . $group_id;
			
		} else {
			echo "Group ID not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["name"])){
			$name = removeslashes($_POST["name"]);
		
			$sets[] = "group_name = " . $name;
		} 
		
		if(isset($_POST["description"])){
			$description = removeslashes($_POST["description"]);
		
			$sets[] = "group_description = " . $description;
		}
		
		if(isset($_POST["admin"])){
			$admin = intval(removeslashes($_POST["admin"]));
		
			if($admin == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
			
			$sets[] = "group_admin = " . $admin;
			
		} 
		
		if(isset($_POST["imagename"])){
			$imagename = removeslashes($_POST["imagename"]);
			
			$sets[] = "group_imagepath = " . $imagename;
		
		}
		
		if(isset($_POST["grouptype"])){
			$grouptype = intval(removeslashes($_POST["grouptype"]));
		
			if($grouptype == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
			
			
			if($grouptype == 3){
		if (($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][4] == 1) == false){
			return "You do not have permission to make a permanent group.";
			DBClose($conn);
			return;
		} 
			}
			$sets[] = "group_type = " . $grouptype;
			
		}
		
		if(count($sets) < 1){
			echo "Nothing to update.";
			DBClose($conn);
			return;
		}
		
		if (($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][4] == 1 || $is_admin == true) == false){
			return "You do not have permission to make a permanent group.";
			DBClose($conn);
			return;
		}
		
		$result = update("groups", $sets, $where, 2, $conn);
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		DBClose($conn);
		return;
		
	}
	
	
} else {
	echo "bad request";
	return;
}
?>