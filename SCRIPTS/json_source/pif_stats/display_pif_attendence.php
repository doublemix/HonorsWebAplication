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
$pif_id = "";
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

	if(isset($_POST["pif_id"])){
		$pif_id = removeslashes($_POST["pif_id"]);
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

	$query = "SELECT usr_fname, usr_lname, usr_school_id, pifstat_id FROM users JOIN " . $prefix . "_pif_stats ON (usr_id = pstu_id) WHERE pif_id = $pif_id AND (usr_school_id LIKE('$searchPhrase%') OR CONCAT_WS(' ', usr_fname, usr_lname) LIKE('$searchPhrase%') OR usr_fname LIKE ('$searchPhrase%') OR usr_lname LIKE('$searchPhrase%') OR usr_school_email LIKE ('$searchPhrase%')) AND usr_id != 1 $order $limit";


	$result = mysqli_query ( $conn, $query );


	$res_array = array();

	while ( $this_row = mysqli_fetch_assoc ( $result ) ) {
		$res_array [] = $this_row;
	}

	$json = json_encode ( $res_array );

	$query = "SELECT pifstat_id FROM users JOIN " . $prefix . "_pif_stats ON (usr_id = pstu_id) WHERE pif_id = $pif_id AND (usr_school_id LIKE('$searchPhrase%') OR CONCAT_WS(' ', usr_fname, usr_lname) LIKE('$searchPhrase%') OR usr_fname LIKE ('$searchPhrase%') OR usr_lname LIKE('$searchPhrase%') OR usr_school_email LIKE ('$searchPhrase%')) AND usr_id != 1";

	$result = mysqli_query ( $conn, $query );

	$trows = mysqli_num_rows($result);


	echo "{ \"current\": $current, \"rowCount\":$rows, \"rows\": " . $json . ", \"total\": $trows }";
}
die ();

?>

