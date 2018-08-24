<?php
require_once "../send_json.inc";
require_once "../../db_connect.inc";

$rows = 25;
$current = 1;
$limit_l = ($current * $rows) - ($rows);
$limit_h = $limit_l + $rows;
$limit = "";
$order = "";
$prefix = "";
$cces = "";
$com_hours = "";
$fdg = "";
$capstone = "";
$f_cces = "";

$conn = DBConnect();

if ($conn != false) {

	$json = array();
	$searchPhrase = "";

	if(isset($_POST["prefix"])){
		$prefix = removeslashes($_POST["prefix"]);
	} else {
		DBClose($conn);
		die();
	}
	if(isset($_POST["cces"])){
		$cces = removeslashes($_POST["cces"]);
	} else {
		DBClose($conn);
		die();
	}
	if(isset($_POST["com_hours"])){
		$com_hours = removeslashes($_POST["com_hours"]);
	} else {
		DBClose($conn);
		die();
	}
	if(isset($_POST["fdg"])){
		$fdg = removeslashes($_POST["fdg"]);
	} else {
		DBClose($conn);
		die();
	}
	if(isset($_POST["capstone"])){
		$capstone = removeslashes($_POST["capstone"]);
	} else {
		DBClose($conn);
		die();
	}
	if(isset($_POST["f_cces"])){
		$f_cces = removeslashes($_POST["f_cces"]);
	} else {
		DBClose($conn);
		die();
	}

	if (isset ( $_POST ["rowCount"] )) {
		$rows = removeslashes ( $_POST ["rowCount"] );
	}

	if (isset ( $_POST ["current"] )) {
		$current = removeslashes ( $_POST ["current"] );

		$limit_l = ($current * $rows) - ($rows);
		$limit_h = $rows;
	}

	if (isset ( $_POST ["searchPhrase"] )) {
		$searchPhrase = $conn->real_escape_string ( $_POST ["searchPhrase"] );
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

	$case = "CASE ";
	$case .=   "WHEN usr_id IN(SELECT usr_id FROM users WHERE usr_education = 1) THEN ";
	$case .=      "CASE ";
	$case .=          "When acad_events >= $f_cces AND com_hours >= $com_hours AND fdg >= $fdg THEN 'YES' ";
	$case .=		  "ELSE 'NO' ";
	$case .=      "END ";
	$case .=   "ELSE ";
	$case .=       "CASE ";
	$case .=           "WHEN acad_events >= $cces AND com_hours >= $com_hours AND capstone >= $capstone THEN 'YES' ";
	$case .=           "ELSE 'NO' ";
	$case .=       "END ";
	$case .="END ";
	$query = "SELECT usr_fname, usr_lname, usr_school_id, ($case) AS reqed, acad_events AS cces, com_hours, fdg, capstone FROM " . $prefix . "_stats WHERE usr_id IN(SELECT pstu_id FROM $prefix"."_currentstudents) AND (CONCAT_WS(' ', usr_fname, usr_lname) LIKE('$searchPhrase%') OR usr_school_id LIKE('$searchPhrase%') OR usr_fname LIKE ('$searchPhrase%') OR usr_lname LIKE('$searchPhrase%')) $order $limit";

	$result = mysqli_query ( $conn, $query );
	file_put_contents("log.txt", $query);

	$res_array = array();

	while ( $this_row = mysqli_fetch_assoc ( $result ) ) {
		$res_array [] = $this_row;
	}

	$json = json_encode ( $res_array );

	$query = "SELECT usr_school_id FROM " . $prefix . "_stats WHERE usr_id IN(SELECT pstu_id FROM $prefix"."_currentstudents) AND (CONCAT_WS(' ', usr_fname, usr_lname) LIKE('$searchPhrase%') OR usr_school_id LIKE('$searchPhrase%') OR usr_fname LIKE ('$searchPhrase%') OR usr_lname LIKE('$searchPhrase%'))";

	$result = mysqli_query ( $conn, $query );

	$trows = (int) mysqli_num_rows($result);


	echo "{ \"current\": $current, \"rowCount\":$rows, \"rows\": " . $json . ", \"total\": $trows }";
}
die ();

?>
