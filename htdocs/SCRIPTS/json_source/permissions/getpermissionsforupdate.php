<?php
require_once "../send_json.inc";
require_once "../../db_connect.inc";

$rows = 25;
$current = 1;
$limit_l = ($current * $rows) - ($rows);
$limit_h = $limit_l + $rows;
$limit = "";

$conn = DBConnect();

if ($conn != false) {
	
	$json = array ();
	
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
	
	if ($rows == - 1) {
		$limit = "";
	} else {
		$limit = " LIMIT $limit_l,$limit_h ";
	}
	
	$query = "SELECT usr_id, usr_fname, usr_lname, usr_school_email, usr_school_id, perm_worker, perm_users, perm_fdg, perm_exemptions, perm_academic_events, perm_activity_groups, perm_comm_serv, perm_pif, perm_image_slides, perm_events, perm_news, perm_stats, perm_id FROM permissions LEFT JOIN users USING(usr_id) WHERE (CONCAT_WS(' ', usr_fname, usr_lname) LIKE('$searchPhrase%') OR usr_lname LIKE('$searchPhrase%') OR usr_school_email LIKE('$searchPhrase%') OR usr_school_id LIKE('$searchPhrase%')) AND usr_id != 1 $order $limit";
	
	$result = mysqli_query ( $conn, $query );
	
	
	$res_array = array ();
	
	while ( $this_row = mysqli_fetch_assoc ( $result ) ) {
		$res_array [] = $this_row;
	}
	
	$json = json_encode ( $res_array );
	
	$total_rows = mysqli_query ( $conn, "SELECT usr_id FROM permissions JOIN users USING(usr_id) WHERE (CONCAT_WS(' ', usr_fname, usr_lname) LIKE('$searchPhrase%') OR usr_lname LIKE('$searchPhrase%') OR usr_school_email LIKE('$searchPhrase%') OR usr_school_id LIKE('$searchPhrase%')) AND usr_id != 1" );
	
	$trows = mysqli_num_rows($total_rows);
	
	echo "{ \"current\": $current, \"rowCount\":$rows, \"rows\": " . $json . ", \"total\": $trows }";
	$season = json_decode ( $str, true );
}
die ();

?>