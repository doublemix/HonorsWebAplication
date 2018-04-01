<?php

session_start();

require_once '../access_tables/modify_image_slide.inc';
require_once '../get_permissions.inc';
require_once '../db_connect.inc';
require_once '../update_factory/update_factory.inc';


if(isset($_POST["imagerequest"])){
	
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
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][9] == 1 ) == false){
		echo "You do not have permission to modify the image slide.";
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
	
	//Delete
	if($opcode == 2){
		
		$slide_id = 0;
		
		if(isset($_POST["slide_id"])){
			$slide_id = intval(removeslashes($_POST["slide_id"]));
		
			if($slide_id == 0){
				echo "Malformed Operation.";
				DBClose($conn);
				return;
			}
		} else {
			echo "Slide ID not set.";
			DBClose($conn);
			return;
		}
		
		$result = deleteImageSlide($slide_id, $conn);
		
		if($result === true){
			echo "success";
		} else {
			echo $result;
		}
		DBClose($conn);
		return;
		
	}
	
	
	if($opcode == 3){
		
		$slide_id = 0;
		$slide_name = "";
		$slide_text = "";
		$slide_isactive = 0;
		$slide_pos = 0;
		
		$where = "slide_id = ";
		$sets = array();
		
	
	
	if(isset($_POST["slide_id"])){
		$slide_id = intval(removeslashes($_POST["slide_id"]));
	
		if($slide_id == 0){
			echo "Malformed Operation.";
			DBClose($conn);
			return;
		}
			
		$where = $where . $slide_id;
			
	} else {
		echo "Slide ID not set.";
		DBClose($conn);
		return;
	}
	
	if(isset($_POST["slide_isactive"])){
		$slide_isactive = intval(removeslashes($_POST["slide_isactive"]));
	
		if($slide_isactive == 0){
			echo "Malformed Operation.";
			DBClose($conn);
			return;
		}
		$sets[] = "slide_isactive = '" . $slide_isactive . "'";
		
			
	} else {
		echo "Slide Activity not set.";
		DBClose($conn);
		return;
	}
	
	if(isset($_POST["slide_pos"])){
		$slide_pos = intval(removeslashes($_POST["slide_pos"]));
	
		
		$sets[] = "slide_pos = " . $slide_pos;
		
			
	} else {
		echo "Slide Activity not set.";
		DBClose($conn);
		return;
	}
	
	if(isset($_POST["slide_text"])){
		$slide_text = mysqli_real_escape_string($conn, removeslashes($_POST["slide_text"]));
			
		$sets[] = "slide_text = '" . $slide_text . "'";
			
	}
	
	if(isset($_POST["slide_name"])){
		$slide_name = mysqli_real_escape_string($conn, removeslashes($_POST["slide_name"]));
			
		$sets[] = "slide_name = '" . $slide_name . "'";
			
	}
	
	if(count($sets) < 1){
		echo "Nothing to update";
		DBClose($conn);
		return;
	}
	
	$result = update("image_slide", $sets, $where, 2, $conn);
	
	if($result === true){
		echo "success";
	} else {
		echo $result;
	}
	
	DBClose($conn);
	return;
	
}
	echo "Opcode not present.";
	DBClose($conn);
	return;
	
} else {
	echo "bad request";
	return;
}
?>
