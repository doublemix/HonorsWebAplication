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

	$query = "SELECT a.usr_fname as \"usr_fname\", a.usr_lname as \"usr_lname\", a.usr_school_id as \"usr_school_id\", c.ag_title as \"ag_title\", b.ag_leaders as \"ag_leaders\" FROM users  a JOIN " . $prefix . "_activitygroupleaders b ON(a.usr_id = b.pstu_id) JOIN " . $prefix . "_activitygroup c ON (b.ag_id = c.ag_id)  WHERE (CONCAT_WS(' ', a.usr_fname, a.usr_lname) LIKE('$searchPhrase%') OR a.usr_school_id LIKE('$searchPhrase%') OR c.ag_title LIKE('$searchPhrase%')) $order $limit";


	$result = mysqli_query ( $conn, $query );


	$res_array = array();

	while ( $this_row = mysqli_fetch_assoc ( $result ) ) {
		$res_array [] = $this_row;
	}

	$json = json_encode ( $res_array );

	$query = "SELECT b.ag_leaders FROM users  a JOIN " . $prefix . "_activitygroupleaders b ON(a.usr_id = b.pstu_id) JOIN " . $prefix . "_activitygroup c ON (b.ag_id = c.ag_id)  WHERE (CONCAT_WS(' ', a.usr_fname, a.usr_lname) LIKE('$searchPhrase%') OR a.usr_school_id LIKE('$searchPhrase%') OR c.ag_title LIKE('$searchPhrase%')) $order $limit";

	$result = mysqli_query ( $conn, $query );

	$trows = mysqli_num_rows($result);


	echo "{ \"current\": $current, \"rowCount\":$rows, \"rows\": " . $json . ", \"total\": $trows }";
}
die ();

?>

