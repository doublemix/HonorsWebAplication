<?php
/*
 * modify_password.inc
 *
 * Created By: William Grove
 *
 * Date: 6/17/2016
 *
 *
 * Adds/Deletes values from the news table
 *
 */



require_once '../get_permissions.inc';

	

function changePassword($usr_username, $old_pass, $new_pass, $confirm_pass, $user, $admin, $conn){
	
	getPermissions($conn);
	
	if(strlen($new_pass) < 6){
		return "New password is invalid.\nPassword must be at least 6 characters, and can include only the following symbols: .#!_&+-$";
	}
	
	$result = "";
	
	if(!$admin){
	$result = mysqli_query($conn, "SELECT usr_password, usr_id FROM users WHERE usr_username = '" . $usr_username . "' AND usr_password = '" . crypt($old_pass, '$2a$10$leskfiqamdhjthrjwsksdidfhrjrkdlsldlkfjjgird$') ."'");
	
	} else {
	$result = mysqli_query($conn, "SELECT usr_password, usr_id FROM users WHERE usr_username = '" . $usr_username . "'");
	}
	
	if(mysqli_num_rows($result) < 1){
		return "Incorrect Username or Password.";
	}
	
	$row = mysqli_fetch_row($result);
	
	$requested_password = $row[0];
	$requested_user = intval($row[1]);
	
	if($_SESSION["permissions"][0] != 1 || $admin == false){
		if($requested_user != $_SESSION["userid"]){
			return "Please, only change your own Password. Thanks!";
		}
	}
	
	if(validatePassword($new_pass) == false){
		return "New password is invalid.\nPassword must be at least 6 characters, and can include only the following symbols: .#!_&+-$";
	}
	
	
	if($_SESSION["permissions"][0] != 1 || $admin == false){
	if(strcmp(crypt($old_pass, '$2a$10$leskfiqamdhjthrjwsksdidfhrjrkdlsldlkfjjgird$'), $requested_password) != 0){
		return "Incorrect Username or Password.";
	}
	}
	
	if(strcmp($new_pass, $confirm_pass) != 0){
		return "New Password does not match Confirmation Password.";
	}
	
	$password = crypt($new_pass, '$2a$10$leskfiqamdhjthrjwsksdidfhrjrkdlsldlkfjjgird$');
	
	$result = mysqli_query($conn, "UPDATE users SET usr_password = '$password' WHERE usr_id = " . $requested_user);
	
	if($result === false){
		echo "Failed to change password";
	} else {
		return true;
	}
}

function validatePassword($str) {
	return !preg_match('/[^A-Za-z0-9.#!_&+\\-$]/', $str);
}

?>