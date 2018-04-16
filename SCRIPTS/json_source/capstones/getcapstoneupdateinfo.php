<?php
require_once "../send_json.inc";
require_once "../../db_connect.inc";

$rows = 25;
$current = 1;
$limit_l = ($current * $rows) - ($rows);
$limit_h = $limit_l + $rows;
$limit = "";
$order = "";

$conn = DBConnect();

if ($conn != false) {

	$json = array();
	$searchPhrase = "";

	if (isset ( $_POST ["rowCount"] )) {
		$rows = removeslashes ( $_POST ["rowCount"] );
	}

	if (isset ( $_POST ["current"] )) {
		$current = removeslashes ( $_POST ["current"] );

		$limit_l = ($current * $rows) - ($rows);
		$limit_h = $rows;
	}

	if (isset ( $_POST ["searchPhrase"] )) {
		$searchPhrase = removeslashes ( $_POST ["searchPhrase"] );
	}

	if (isset ( $_POST ['sort'] ) && is_array ( $_POST ['sort'] )) {
		$order = "";
		foreach ( $_POST ['sort'] as $key => $value ) {
			$order .= " $key $value";
		}
		$order = " ORDER BY" . $order;
	}

	if ($rows == -1) {
		$limit = "";
	} else {
		$limit = " LIMIT $limit_l,$limit_h ";
	}

	$query = "SELECT capstone_id, usr_fname, usr_lname, capstone_name, capstone_description, capstone_requirements, capstone_advisor, capstone_startdate, capstone_enddate, capstone_complete FROM capstone JOIN users USING(usr_id) WHERE (concat_ws(' ',usr_fname,usr_lname) LIKE('$searchPhrase%') OR capstone_name LIKE('$searchPhrase%') OR capstone_id LIKE('$searchPhrase%') OR usr_school_id LIKE('$searchPhrase%')) AND usr_id != 1 $order $limit";


	$result = mysqli_query ( $conn, $query );

	$res_array = array();

	while ( $this_row = mysqli_fetch_assoc ( $result ) ) {
		$res_array [] = $this_row;
	}

	$json = json_encode ( $res_array );

	$result = mysqli_query ( $conn, "SELECT capstone_id, usr_fname, usr_lname, capstone_name, capstone_description, capstone_requirements, capstone_advisor, DATE_FORMAT(capstone_startdate,'%m/%d/%Y %I:%i %p') as \"capstone_startdate\", DATE_FORMAT(capstone_enddate,'%m/%d/%Y %I:%i %p') as \"capstone_enddate\", capstone_complete FROM capstone JOIN users USING(usr_id) WHERE (concat_ws(' ',usr_fname,usr_lname) LIKE('$searchPhrase%') OR capstone_name LIKE('$searchPhrase%') OR capstone_id LIKE('$searchPhrase%') OR usr_school_id LIKE('$searchPhrase%')) AND usr_id != 1 $order" );

	$trows = mysqli_num_rows($result);

	/*
	$trows = 0;

	$tots_rows = mysqli_fetch_row ( $total_rows );

	$trows = intval ( $tots_rows [0] );

	*/

	echo "{ \"current\": $current, \"rowCount\":$rows, \"rows\": " . $json . ", \"total\": $trows }";
}
die ();

?>