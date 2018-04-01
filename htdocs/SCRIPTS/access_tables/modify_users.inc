<?php
/*
 * 	modify_users.inc
 * 
 *  Created By: William Charles Grove
 *  
 *  Date: 6/16/16
 *  
 *  Contains functions to add and
 *  delete users. Please add users
 *  before starting a semester.
 *  (Time saver.)
 * 
 */


/*
 * User Statuses:
 * 
 * 1 - Admin
 * 2 - Student
 * 3 - Graduate
 * 4 - Inactive
 * 5 - Professor
 * 6 - Removed From Program
 * 
 */

/*
 * User Education:
 * 1 - Freshman
 * 2 - Sophmore
 * 3 - Junior
 * 4 - Seniors+
 * 5 - Professor
 * 6 - Admin
 */

require_once "../get_permissions.inc";

function add_user($school_email, $fname, $lname, $school_id, $perm_email, $status, $education, $conn){
	
	if (getPermissions($conn) == false){
		return "Unable to get Permissions";
	}
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][2] == 1 || $_SESSION["permissions"][1] == 1) == false){
		return "User Not Permitted to Add, Modify, or Delete Users";
	}
	
	$email_pieces = explode("@", $school_email);
	
	if (count($email_pieces) == 2){
		if(strcmp($email_pieces[1], "lhup.edu") != 0){
			return "Invalid school email address, bad domain: " . $email_pieces[1];
		}
	} else {
		return "Invalid school email address";
	}
	
	$username = $email_pieces[0];
	
	$user_password = "temp!" . $school_id;
	
	$password = crypt($user_password, '$2a$10$leskfiqamdhjthrjwsksdidfhrjrkdlsldlkfjjgird$');
	
	$sql = "insert into users values (null, '$username', '$fname', '$lname', '$school_id', '$school_email', '$perm_email', $status, $education,'', '$password')";
	
	$query = mysqli_query($conn, $sql);
	
	if($query == false){
		return "Failed to insert user $username. Check to see if user exists.";
	} 
		
	$user_id = 0;
	
	$sql = "SELECT MAX(usr_id) FROM users";
		
		$result = mysqli_query($conn, $sql);
		
		
		
		if($result == false){
			return "Failed to write permissions";
		} 
			if(mysqli_num_rows($result) < 1){
				return "No user with the id.";
			}
			
			while($row = mysqli_fetch_row($result)){
				$user_id = intval($row[0]);
			}
			
			
			$stmnt = "insert into permissions values (null, $user_id, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)";

			$result = mysqli_query($conn, $stmnt);
		
			if($result == false){
				return "Unable to add user permissions.";
			}
		
		return true;
	}
	
	



function deleteUser($username, $email, $school_id, $conn){
	
	$sql = "delete from users where ";
	
	if (getPermissions($conn) == false){
		return "Unable to get Permissions";
	}
	
if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][2] == 1 || $_SESSION["permissions"][1] == 1) == false){
		return "User Not Permitted to Add, Modify, or Delete Users";
	}
	
	$found_val = false;
	
if(intval($school_id) === -1){
		return "You cannot Delete the Admin. Request Refused.";
	}
	
	if(intval($school_id) != 0){
		$found_val = true;
		$sql = $sql . "usr_school_id = '$school_id'";
	}
	
	else {
		return "All values are empty.";
	}
	
	$query = mysqli_query($conn, $sql);
	
	if($query == false){
		return "Failed to delete user. Check to see if user exists.";
	} else {
		
		return;
	}
	
}


?>