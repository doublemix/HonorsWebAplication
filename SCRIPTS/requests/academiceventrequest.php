<?php

session_start();

require_once '../access_semester_tables/modify_academicevents.inc';
require_once '../get_permissions.inc';
require_once '../db_connect.inc';
require_once '../update_factory/update_factory.inc';

if(isset($_POST["academiceventsrequest"])){

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

		$acad_title = "";
		$acad_description = "";
		$acad_start_date = "";
		$acad_end_date = "";

		if(isset($_POST["acad_title"])){
			$acad_title = mysqli_real_escape_string($conn, removeslashes($_POST["acad_title"]));

			if(strlen(trim($acad_title)) < 1){
				echo "CCE title is blank.";
				DBClose($conn);
				die();
			}

		} else {
			echo "CCE name not set.";
			DBClose($conn);
			return;
		}

		if(isset($_POST["acad_description"])){
			$acad_description = mysqli_real_escape_string($conn, removeslashes($_POST["acad_description"]));
			if(strlen(trim($acad_description)) < 1){
				echo "CCE description is blank.";
				DBClose($conn);
				die();
			}
		} else {
			echo "CCE description not set.";
			DBClose($conn);
			return;
		}

		if(isset($_POST["acad_start_date"])){
			$acad_start_date = mysqli_real_escape_string($conn, removeslashes($_POST["acad_start_date"]));
		} else {
			echo "CCE start date not set.";
			DBClose($conn);
			return;
		}

		if(isset($_POST["acad_end_date"])){
			$acad_end_date = mysqli_real_escape_string($conn, removeslashes($_POST["acad_end_date"]));
		} else {
			echo "CCE end date not set.";
			DBClose($conn);
			return;
		}

		$result = addAcademicEvent($acad_title, $acad_description, $acad_start_date, $acad_end_date,
				$conn, $prefix);

		if($result === true){
			echo "success";
			DBClose($conn);
			return;
		} else {
			echo $result;
			DBClose($conn);
			return;
		}
	}

	//Delete
	if($opcode == 2){

		$acad_id = 0;

		if(isset($_POST["acad_id"])){
			$acad_id = intval(removeslashes($_POST["acad_id"]));

			if($acad_id == 0){
				echo "Academic ID Malformed.";
				DBClose($conn);
				return;
			}
		} else {
			echo "CCE id not set";
			DBClose($conn);
			return;
		}

		$result = deleteAcademicEvent($acad_id, $conn, $prefix);

		if($result === true){
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

		$sets = array();
		$where = "acad_id = ";

		$acad_id = 0;
		$acad_title = "";
		$acad_description = "";
		$acad_start_date = "";
		$acad_end_date = "";
		$acad_ft_color = "";
		$acad_bg_color = "";

		if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][5] == 1) == false){
			echo "You do not have permissions to update CCEs.";
			die();
		}

		if(isset($_POST["acad_id"])){
			$acad_id = intval(removeslashes($_POST["acad_id"]));



			if($acad_id == 0){
				echo "Academic ID Malformed.";
				DBClose($conn);
				return;
			}

			$where = $where . $acad_id;

		} else {
			echo "CCE id not set.";
			DBClose($conn);
			return;
		}


		if(isset($_POST["acad_title"])){
			$acad_title = mysqli_real_escape_string($conn, removeslashes($_POST["acad_title"]));

			if(strlen(trim($acad_title)) < 1){
				echo "CCE title is blank.";
				DBClose($conn);
				die();
			}

			$sets[] = "acad_title = '" . $acad_title . "'";
		}

		if(isset($_POST["acad_description"])){
			$acad_description = mysqli_real_escape_string($conn, removeslashes($_POST["acad_description"]));

			if(strlen(trim($acad_description)) < 1){
				echo "CCE description is blank.";
				DBClose($conn);
				die();
			}

			$sets[] = "acad_description = '" . $acad_description . "'";
		}

		if(isset($_POST["acad_bg_color"])){
			$acad_bg_color = mysqli_real_escape_string($conn, trim(removeslashes($_POST["acad_bg_color"])));

			if(!preg_match('/^#[a-f0-9]{6}$/i', $acad_bg_color))
			{
				echo "Invalid Background color code.";
				die();
			}

			$sets[] = "acad_bg_color = '" . $acad_bg_color . "'";
		}

		if(isset($_POST["acad_ft_color"])){
			$acad_ft_color = mysqli_real_escape_string($conn, trim(removeslashes($_POST["acad_ft_color"])));

			if(!preg_match('/^#[a-f0-9]{6}$/i', $acad_ft_color))
			{
				echo "Invalid Font color code.";
				die();
			}

			$sets[] = "acad_ft_color = '" . $acad_ft_color . "'";
		}

		if(isset($_POST["acad_start_date"])){
			$acad_start_date = mysqli_real_escape_string($conn, removeslashes($_POST["acad_start_date"]));

			$sets[] = "acad_start_date = STR_TO_DATE('$acad_start_date', '%m/%d/%Y %l:%i %p' )";
		}

		if(isset($_POST["acad_end_date"])){
			$acad_end_date = mysqli_real_escape_string($conn, removeslashes($_POST["acad_end_date"]));

			$sets[] = "acad_end_date = STR_TO_DATE('$acad_end_date', '%m/%d/%Y %l:%i %p' )";

		}

		if(count($sets) < 1){
			echo "Nothing to update";
			DBClose($conn);
			return;
		}

		$result = update($prefix . "_academicevents", $sets, $where, 2, $conn);

		if($result === true){
			echo "success";
			DBClose($conn);
			return;
		} else {
			echo $result;
			DBClose($conn);
			return;
		}

	}

	echo "Opcode not valid";
	DBClose($conn);
	return;
} else {
	echo "Invalid request";
	return;
}