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

	$query = "SELECT sem_id, sem_prefix, sem_name, sem_active, DATE_FORMAT(sem_start_date, '%c/%e/%Y') as \"sem_start_date\", DATE_FORMAT(sem_end_date, '%c/%e/%Y') as \"sem_end_date\", carry_over_fdg, carry_over_com_serv FROM semesters WHERE sem_name LIKE('$searchPhrase%') order by sem_id desc $limit";


	$result = mysqli_query ( $conn, $query );


	$res_array = array();

	while ( $this_row = mysqli_fetch_assoc ( $result ) ) {
		$res_array[] = $this_row;
	}

	$json = json_encode ( $res_array );

	$query = "SELECT sem_id FROM semesters WHERE sem_name LIKE('$searchPhrase%')";
	$result = mysqli_query ( $conn, $query );

	$trows = mysqli_num_rows($result);


	echo "{ \"current\": $current, \"rowCount\":$rows, \"rows\": " . $json . ", \"total\": $trows }";
}
die ();
?>