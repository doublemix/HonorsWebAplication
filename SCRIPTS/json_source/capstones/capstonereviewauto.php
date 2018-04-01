<?php

require_once "../../db_connect.inc";

if(isset($_GET["term"])){
	
	$term = removeslashes($_GET["term"]);
	
	$conn = DBConnect();
	
	$result = mysqli_query($conn, "SELECT CONCAT(usr_fname, ' ', usr_lname) as smithy FROM users Where (CONCAT(usr_fname, ' ', usr_lname) LIKE('$term%') OR CONCAT(usr_lname, ' ', usr_fname) LIKE('$term%')) AND capstone_complete = 0");
	
	$response = "[ ";
	
	//$totalRows = mysqli_num_rows($result);
	
	$i = 0;

	while($row = mysqli_fetch_row($result)){
		
		if($i != 0){
			
			$response .= ", ";
			
		}
		
		$response .= '"' . $row[0] . '"';
		$i++;
	}
	
	mysqli_free_result($result);
	DBClose($conn);
	
	$response .= " ]";
	
	echo $response;
	
}



























?>