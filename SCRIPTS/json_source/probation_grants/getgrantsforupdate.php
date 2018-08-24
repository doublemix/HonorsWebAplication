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
		$searchPhrase = $conn->real_escape_string ( $_POST ["searchPhrase"] );
	}

	if (isset ( $_POST ['sort'] ) && is_array ( $_POST ['sort'] )) {
		$order = "";
		foreach ( $_POST ['sort'] as $key => $value ) {
			$order .= " $key $value";
		}
	}

	if ($rows == -1) {
		$limit = "";
	} else {
		$limit = " LIMIT $limit_l,$limit_h ";
	}

	$query = "SELECT probation_grant_id, probation_grant_requirement, probation_name, usr_fname, usr_lname, probation_type FROM probation_grants JOIN probations USING(probation_id) JOIN users USING(usr_id) WHERE (CONCAT_WS(' ', usr_fname, usr_lname) LIKE('$searchPhrase%') OR usr_school_id LIKE('$searchPhrase%') OR probation_name LIKE('$searchPhrase%')) AND usr_id != 1 $order $limit";


	$result = mysqli_query ( $conn, $query );


	$res_array = array();

	while ( $this_row = mysqli_fetch_assoc ( $result ) ) {
		$res_array [] = $this_row;
	}

	$json = json_encode ( $res_array );

	$query = "SELECT probation_grant_id, probation_grant_requirement, probation_name, usr_fname, usr_lname, probation_type FROM probation_grants JOIN probations USING(probation_id) JOIN users USING(usr_id) WHERE (CONCAT_WS(' ', usr_fname, usr_lname) LIKE('$searchPhrase%') OR usr_school_id LIKE('$searchPhrase%') OR probation_name LIKE('$searchPhrase%')) AND usr_id != 1";

	$result = mysqli_query ( $conn, $query );

	$trows = mysqli_num_rows($result);


	echo "{ \"current\": $current, \"rowCount\":$rows, \"rows\": " . $json . ", \"total\": $trows }";
}
die ();

?>