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
$pfdg_event_id = "";
$opcode = "";


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

	if(isset($_POST["opcode"])){
		$opcode = intval(removeslashes($_POST["opcode"]));

		if($opcode == 0){
			die(); //VIOLENTLY :D
		}

	} else {
		DBClose($conn);
		die();
	}

	if(isset($_POST["pfdg_event_id"])){
		$pfdg_event_id = removeslashes($_POST["pfdg_event_id"]);

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
		$order = " ORDER BY " . $order;
	}

	if ($rows == -1) {
		$limit = "";
	} else {
		$limit = " LIMIT $limit_l,$limit_h ";
	}

	$query = "";

	if($opcode == 1){

	$query = "SELECT fdg_name, pfdg_points_points, pfdg_points_id FROM  " . $prefix . "_fdg_points JOIN fdg ON(fdg_id = pfdg_id) WHERE (fdg_name LIKE('$searchPhrase%')) AND pfdg_event_id = " . $pfdg_event_id . " $order $limit";

	} else {

	$query = "SELECT fdg_name, SUM(pfdg_points_points) AS 'pfdg_points_points' FROM  " . $prefix . "_fdg_points JOIN fdg ON(fdg_id = pfdg_id) group by fdg_name order by `pfdg_points_points` desc";

	}

	$result = mysqli_query ( $conn, $query );


	$res_array = array();

	while ( $this_row = mysqli_fetch_assoc ( $result ) ) {
		$res_array [] = $this_row;
	}

	$json = json_encode ( $res_array );

	if($opcode == 1){

	$query = "SELECT pfdg_points_id FROM  " . $prefix . "_fdg_points JOIN fdg ON(fdg_id = pfdg_id) WHERE (fdg_name LIKE('$searchPhrase%')) AND pfdg_event_id = " . $pfdg_event_id;

	} else {

		$query = "SELECT fdg_name, SUM(pfdg_points_points) AS 'pfdg_points_points' FROM  " . $prefix . "_fdg_points JOIN fdg ON(fdg_id = pfdg_id) group by fdg_name order by `pfdg_points_points` desc";


	}
	$result = mysqli_query ( $conn, $query );

	$trows = mysqli_num_rows($result);


	echo "{ \"current\": $current, \"rowCount\":$rows, \"rows\": " . $json . ", \"total\": $trows }";
}
die ();

?>
