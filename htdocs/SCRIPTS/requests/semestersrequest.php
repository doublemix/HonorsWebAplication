<?php
session_start();


require_once "../semester_setup/create_semester.inc";
require_once '../get_permissions.inc';
require_once '../db_connect.inc';
require_once '../update_factory/update_factory.inc';
require_once '../access_tables/modify_semesters.inc';


if(isset($_POST["semesterrequestdgjdfls"])){
	
	$conn = DBConnect();
	file_put_contents("log.txt", "HOOG1\n", 8);
	if($conn == false){
		echo "Unable to Connect to Database.";
		return;
	}
	
	if(getPermissions($conn) == false){
		echo "Unable to retrieve permissions.";
		DBClose($conn);
		return;
	}
	
	file_put_contents("log.txt", "HOOG2\n", 8);
	if($_SESSION["permissions"][0] != 1){
		echo "You are not allowed to update Semesters.";
		die();
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
	file_put_contents("log.txt", "HOOG3");
	//Add
	if($opcode == 1){
		
		$sem_prefix = "";
		$sem_name = "";
		$set_active_students = false;
		$add_freshmen_to_fdg = false;
		$carry_over_fdg = false;
		$carry_over_com_serv = false;
		$option = 0;
		
		if(isset($_POST["sem_prefix"])){
			$sem_prefix = removeslashes($_POST["sem_prefix"]);
			
			if(strlen(trim($sem_prefix)) < 1){
				echo "Semester Prefix is blank.";
				DBClose($conn);
				die();
			}
			
		} else {
			echo "Semester Prefix not set.";
			DBClose($conn);
			return;
		}
		file_put_contents("log.txt", "HOOG4\n", 8);
		if(isset($_POST["sem_name"])){
			$sem_name = mysqli_real_escape_string($conn, removeslashes($_POST["sem_name"]));
				
			if(strlen(trim($sem_name)) < 1){
				echo "Semester Name is blank.";
				DBClose($conn);
				die();
			}
			
		} else {
			echo "Semester Name not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["set_active_students"])){
			$option = intval(removeslashes($_POST["set_active_students"]));
		
			if($option == 1){
				$set_active_students = true;
			} else {
				
				if($option == 2){
					$set_active_students = false;
				} else {
					DBClose($conn);
					return "Active student option error";
				}
				
				
			}
			file_put_contents("log.txt", "HOOG5\n", 8);
		} else {
			echo "Active student option could not be read.";
			DBClose($conn);
			return;
		}
		file_put_contents("log.txt", "HOOG6\n", 8);
		if(isset($_POST["carry_over_fdg"])){
			$option = intval(removeslashes($_POST["carry_over_fdg"]));
		
			if($option == 1){
				$carry_over_fdg = true;
			} else {
			
				if($option == 2){
					$carry_over_fdg = false;
				} else {
					DBClose($conn);
					return "Active student option error";
				}
			}
			
		} else {
			echo "Carry Over FDG option could not be read";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["add_freshmen_to_fdg"])){
			$option = intval(removeslashes($_POST["add_freshmen_to_fdg"]));
		
			if($option == 1){
				$add_freshmen_to_fdg = true;
			} else {
			
				if($option == 2){
					$add_freshmen_to_fdg = false;
				} else {
					DBClose($conn);
					return "Active student option error";
				}
			
			
			}
			
		} else {
			echo "Add Freshmen Option Could Not Be Read.";
			DBClose($conn);
			return;
		}
		file_put_contents("log.txt", "HOOG7\n", 8);
		if(isset($_POST["carry_over_com_serv"])){
			$option = intval(removeslashes($_POST["carry_over_com_serv"]));
		
			if($option == 1){
				$carry_over_com_serv = true;
			} else {
			
				if($option == 2){
					$carry_over_com_serv = false;
				} else {
					DBClose($conn);
					return "Active student option error";
				}
			
			
			}
			
		} else {
			echo "Carry Over Community Service Could not be read..";
			DBClose($conn);
			return;
		}
		file_put_contents("truthlog.txt", "$sem_prefix, $sem_name, $set_active_students, $add_freshmen_to_fdg, $carry_over_fdg,  $carry_over_com_serv", FILE_APPEND);
		$result =  create_new_semester($sem_prefix, $sem_name, $set_active_students, $add_freshmen_to_fdg, $carry_over_fdg, $carry_over_com_serv, $conn);
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		DBClose($conn);
		return;
	}
	
	/*Semesters are not meant to be deleted.
	 * But can be added in the future.
	if($opcode == 2){
		
	}
	*/
	//Update
	if($opcode == 3){
		/*
		 * Only the semester name can be updated.
		 * Updating anything else breaks the integrity of
		 * the website. PLEASE DO NOT UPDATE
		 * ANYTHING ELSE!!! You've been warned!
		 * 
		 * 
		 *    \\ //
		 *    O   O
		 *      <
		 *  ____________
		 * |            |
		 * 
		 * 
		 */
		if(($_SESSION["permissions"][0] == 1) == false){
			return "User Not Permitted to Create Semester";
		}
		
		$sem_id = 0;
		$sem_name = "";
		
		$set = "sem_name = ";
		$where = "sem_id = ";
		
		if(isset($_POST["sem_id"])){
			$sem_id = intval(removeslashes($_POST["sem_id"]));
		
			if($sem_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
			
			$where = $where . $sem_id;
			
		} else {
			echo "Semester ID not set.";
			DBClose($conn);
			return;
		}
		
		if(isset($_POST["sem_name"])){
			$sem_name = mysqli_real_escape_string($conn, removeslashes($_POST["sem_name"]));
		
			$set = $set . "'" . $sem_name . "'";
			
		} else {
			echo "Nothing to update";
			DBClose($conn);
			return;
		}
		
		$result = update("semesters", $set, $where, 0, $conn);
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		DBClose($conn);
		return;
		
	}
	
	if($opcode == 4){
		
		$increase_edu = 0;
		
		if(isset($_POST["increase_edu"])){
			
			$increase_edu = intval($_POST["increase_edu"]);
			
			if($increase_edu == 0){
				echo "Increase_edu value is corrupt. Please, retry!";
				die();
			}
			
		} else {
			echo "Increase_edu not set.";
			die();
			
		}
		
		
		$result = endSemester($conn, $increase_edu);
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