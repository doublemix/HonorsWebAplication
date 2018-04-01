<?php

session_start();


include_once '../access_tables/modify_passwords.inc';
include_once '../get_permissions.inc';
include_once '../update_factory/update_factory.inc';
include_once '../db_connect.inc';

if(isset($_POST["passwordchangerequest"]) && isset($_SESSION["userid"])){
	
	$conn = DBConnect();
	
	if(getPermissions($conn) == false){
		echo "Was not able to retrieve updated permissions.";
		DBClose($conn);
		return;
	}
	
	if(isset($_POST["usr_username"]) && isset($_POST["new_pass"]) && isset($_POST["confirm_pass"])){
	
	$usr_username = removeslashes($_POST["usr_username"]);
	
	$new_pass = removeslashes($_POST["new_pass"]);
	$confirm_pass = removeslashes($_POST["confirm_pass"]);
	$admin = false;
	$user = intval($_SESSION["userid"]);
	
	if($_SESSION["userid"] == 1 && isset($_POST["remember_to_drink_your_ovaltine"])){
		if(intval($_POST["remember_to_drink_your_ovaltine"]) == 1){
			$admin = true;
		}
	}
	
	$old_pass = "";
	
	if(!$admin){
	
	if(isset($_POST["old_pass"])){

	$old_pass = removeslashes($_POST["old_pass"]);
	} else {
	echo "You are missing a field.";
	DBClose($conn);
	return;
	}
	
	} else {
	$old_pass = "admin";
	}
		$result = changePassword($usr_username, $old_pass, $new_pass, $confirm_pass, $user, $admin, $conn);
	//$result = changePassword($usr_username, $old_pass, $new_pass, $confirm_pass, $user, $admin, $conn);
	
	if($result !== true){
		echo $result;
	} else {
		echo "success";
	}
	
	DBClose($conn);
	die();
	
	} else {
		echo "You are missing a field.";
	}
	
} else {
	echo "You are Logged Out.";
}

