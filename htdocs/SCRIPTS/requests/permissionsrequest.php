<?php

session_start();

require_once '../get_permissions.inc';
require_once '../db_connect.inc';
require_once '../access_tables/modify_permissions.inc';
require_once '../update_factory/update_factory.inc';


if(isset($_POST["permissionchangerequest"])){
	
	$conn = DBConnect();
	
	if($conn == false){
		echo "Could not connect to database.";
		return;
	}
	
	if(getPermissions($conn) == false){
		echo "Could not update permissions.";
		DBClose($conn);
		return;
		
	}
	
	if($_SESSION["permissions"][0] != 1){
		echo "You do not have permission to change permissions (Irony).";
		DBClose($conn);
		return;
	}
	
	$opcode = intval(removeslashes($_POST["opcode"]));
	
	if($opcode == 0){
		echo "Incorrect operations code.";
		DBClose($conn);
		return;
	}
	
	//Update
	if($opcode == 1){
		
		$set = array();
		$where = "perm_id = ";
		
		if(isset($_POST["perm_id"])){
			
			if(intval(removeslashes($_POST["perm_id"])) == 0){
				echo "Invalid user id passed";
				DBClose($conn);
				return;
			}
			
			$where = $where . intval(removeslashes($_POST["perm_id"]));
		} else {
			echo "No user id found.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["perm_worker"])){
			$set[] = "perm_worker = " . intval(removeslashes($_POST["perm_worker"]));
		}
		
		if(isset($_POST["perm_stats"])){
			$set[] = "perm_stats = " . intval(removeslashes($_POST["perm_stats"]));
		}
		
		if(isset($_POST["perm_users"])){
			$set[] = "perm_users = " . intval(removeslashes($_POST["perm_users"]));
		}
		
		if(isset($_POST["perm_groups"])){
			$set[] = "perm_groups = " . intval(removeslashes($_POST["perm_groups"]));
		}
		
		if(isset($_POST["perm_events"])){
			$set[] = "perm_events = " . intval(removeslashes($_POST["perm_events"]));
		}
		
		if(isset($_POST["perm_exemptions"])){
			$set[] = "perm_exemptions = " . intval(removeslashes($_POST["perm_exemptions"]));
		}
		
		if(isset($_POST["perm_fdg"])){
			$set[] = "perm_fdg = " . intval(removeslashes($_POST["perm_fdg"]));
		}
		
		if(isset($_POST["perm_academic_events"])){
			$set[] = "perm_academic_events = " . intval(removeslashes($_POST["perm_academic_events"]));
		}
		
		if(isset($_POST["perm_activity_groups"])){
			$set[] = "perm_activity_groups = " . intval(removeslashes($_POST["perm_activity_groups"]));
		}
		
		if(isset($_POST["perm_comm_serv"])){
			$set[] = "perm_comm_serv = " . intval(removeslashes($_POST["perm_comm_serv"]));
		}
		
		if(isset($_POST["perm_news"])){
			$set[] = "perm_news = " . intval(removeslashes($_POST["perm_news"]));
		}
		
		if(isset($_POST["perm_image_slides"])){
			$set[] = "perm_image_slides = " . intval(removeslashes($_POST["perm_image_slides"]));
		}
		
		if(isset($_POST["perm_pif"])){
			$set[] = "perm_pif = " . intval(removeslashes($_POST["perm_pif"]));
		}
		
		if(count($set) == 0){
			echo "Nothing to update";
			DBClose($conn);
			return;
		}
		
		
		$result = update("permissions", $set, $where, 2,$conn);
		
		if($result === true){
			echo "success";
			DBClose($conn);
			return;
		} else {
			echo "Update Failed.";
			DBClose($conn);
			return;
		}
		
	} else {
		echo "Malformed Change Request.";
		DBClose($conn);
		return;
	}
	
	
	
}

?>
