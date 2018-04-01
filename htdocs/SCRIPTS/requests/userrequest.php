<?php

session_start();

require_once '../access_tables/modify_users.inc';
require_once '../get_permissions.inc';
require_once '../db_connect.inc';
require_once '../update_factory/update_factory.inc';


if(isset($_POST["adduserform"]) || isset($_POST["deleteuserform"]) || isset($_POST["updateuserform"])){
	
	session_start();
	
	$type = intval(removeslashes($_POST["opcode"]));
	
	if($type == 0){
		echo "Incorrect Operations Code.";
		exit;
	}
	
	//Add
	if($type == 1){
		
		$conn = DBConnect();
		
		if($conn == false){
			echo "Could not connect to database.";
			exit;
		}
		
		$school_email = "";
		$fname = "";
		$lname = "";
		$school_id = "";
		$perm_email = "";
		$status = "";
		$education = "";
		
		
		$school_email = removeslashes($_POST["school_email"]);
		
		if(strlen(trim($school_email)) < 1){
			echo "School Email is blank.";
			DBClose($conn);
			die();
		}
		
		$fname = mysqli_real_escape_string($conn, removeslashes($_POST["fname"]));
		
		if(strlen(trim($fname)) < 1){
			echo "First Name is blank.";
			DBClose($conn);
			die();
		}
		
		$lname = mysqli_real_escape_string($conn, removeslashes($_POST["lname"]));
		
		if(strlen(trim($lname)) < 1){
			echo "Last Name is blank.";
			DBClose($conn);
			die();
		}
		
		$school_id = mysqli_real_escape_string($conn, trim(removeslashes($_POST["school_id"])));
		
		if(strlen(trim($school_id . "")) != 4 || intval(trim($school_id)) == 0){
			echo "School ID must be 4 digits";
			DBClose($conn);
			die();
		}
		
		$perm_email = mysqli_real_escape_string($conn, removeslashes($_POST["perm_email"]));
		
		$status = removeslashes($_POST["status"]);
		
		if(strlen(trim($status . "")) < 1){
			echo "Status is blank.";
			DBClose($conn);
			die();
		}
		$education = removeslashes($_POST["education"]);
		if(strlen(trim($education . "")) < 1){
			echo "Education is blank.";
			DBClose($conn);
			die();
		}
		
		
		$result = add_user($school_email, $fname, $lname, $school_id, $perm_email, 
				$status, $education, $conn);
		
		DBClose($conn);
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		
		exit;
	}
	
	
	//Delete
	if($type == 2){
	
		$conn = DBConnect();
		
		if($conn == false){
			echo "Could not connect to database.";
			exit;
		}
		
		$username = "";
		$email = "";
		$school_id = "";
		
		$school_id = removeslashes($_POST["school_id"]);
		
		$result = deleteUser($username, $email, $school_id, $conn);
		
		DBClose($conn);
		
		if($result !== false){
			echo "success";
		} else {
			echo $result;
		}
		
		exit;
		
	}
	
	//Update
	if($type == 3){
				
		$conn = DBConnect();
		
		if($conn == false){
			echo "Could not establish database connection.";
			return;
		}
				
		getPermissions($conn);
				
		if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][2] == 1) == false){
			echo "You do not have permissions to update users.";
			exit;
		}
		
		
		
		$set = array();
		$where = "usr_id = ";
		
		if(isset($_POST["usr_id"])){
			
			if(intval(removeslashes($_POST["usr_id"])) == 0){
				echo "Invalid user id passed";
				DBClose($conn);
				return;
			}
			
			
			
			$where = $where . removeslashes($_POST["usr_id"]);
		} else {
			echo "No user id found.";
			return;
		}
		
		if(isset($_POST["fname"])){
			$set[] = "usr_fname = '" . mysqli_real_escape_string($conn, removeslashes($_POST["fname"])) . "'";
		}
		
		if(isset($_POST["lname"])){
			$set[] = "usr_lname = '" . mysqli_real_escape_string($conn, removeslashes($_POST["lname"])) . "'";
		}
		
		if(isset($_POST["school_id"])){
			$set[] = "usr_school_id = " . mysqli_real_escape_string($conn, removeslashes($_POST["school_id"]));
		}
		
		if(isset($_POST["school_email"])){
			$set[] = "usr_school_email = '" . mysqli_real_escape_string($conn, removeslashes($_POST["school_email"])) . "'";
		}
		
		if(isset($_POST["perm_email"])){
			$set[] = "usr_perm_email = '" . mysqli_real_escape_string($conn, removeslashes($_POST["perm_email"])) . "'";
		}
		
		if(isset($_POST["status"])){
			$set[] = "usr_status = " . removeslashes($_POST["status"]);
		}
		
		if(isset($_POST["education"])){
			$set[] = "usr_education = " . removeslashes($_POST["education"]);
		}
		
		if(isset($_POST["user_imagename"])){
			$set[] = "usr_imagepath = '" . removeslashes($_POST["user_imagename"]) . "'";
		}
		
		if(count($set) < 1){
			echo "Nothing to update";
			DBClose($conn);
			return;
		}
				
		$result = update("users",$set, $where, 2, $conn);
		
	
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		
		DBClose($conn);
		exit;
		
	}
	
	
} else {
	echo "Invalid Form Call";
}

?>