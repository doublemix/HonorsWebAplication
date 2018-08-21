<?php

require_once "../../db_utils.php";

$rows = 25;
$current = 1;
$order = "";
$prefix = "";
$event_id = "";

if ($conn != false) {
    $json = array();
    $searchPhrase = "";

    if (isset($_POST["prefix"])) {
        $prefix = removeslashes($_POST["prefix"]);
    } else {
        DBClose($conn);
        die();
    }

    if (isset($_POST["event_id"])) {
        $event_id = removeslashes($_POST["event_id"]);
    } else {
        DBClose($conn);
        die();
    }

    if (isset($_POST["rowCount"])) {
        $rows = (int) removeslashes($_POST["rowCount"]);
    }

    if (isset($_POST["current"])) {
        $current = (int) removeslashes($_POST["current"]);
    }

    // dangerous, unused
//    if (isset($_POST["searchPhrase"])) {
//        $searchPhrase = removeslashes($_POST["searchPhrase"]);
//    }

    if (isset($_POST["sort"]) && is_array($_POST["sort"])) {
        $order = "";
        foreach ($_POST["sort"] as $key => $value) {
            $order .= " $key $value";
        }
        $order = "ORDER BY" . $order;
    }

    if ($rows === -1) {
        $limit = "";
    } else {
        $limit_l = ($current * $rows) - ($rows);
        $limit_h = $limit_l + $rows;
        $limit = "LIMIT $limit_l,$limit_h";
    }

    $searchString = "\"%$searchPhrase%\"";


    $rsvpTable = DB_getPrefixedTable('fdg_cce_rsvp', $prefix);
    if (!DB_tableExists($rsvpTable)) {
        DBClose($conn);
        die();
    }

    $studentsTable = DB_getPrefixedTable('currentstudents', $prefix);
    $sql = "SELECT usr.usr_id, usr.usr_fname, usr.usr_lname, usr.usr_school_id, rsvp.rsvp_id "
        . "FROM $rsvpTable rsvp "
        . "JOIN $studentsTable pstu ON (rsvp.pstu_id = pstu.pstu_id) "
        . "JOIN users usr ON (pstu.pstu_id = usr.usr_id) "
        . "WHERE rsvp.event_id = '$event_id' "
        . "$order $limit";

    $queryResult = $conn->query($sql);

    $resultRows = $queryResult->fetch_all(MYSQLI_ASSOC);

    $totalSql = "SELECT rsvp_id FROM $rsvpTable WHERE event_id = '$event_id'";

    $totalQueryResult = $conn->query($totalSql);

    $total = $totalQueryResult->num_rows;

    $jsonObj = [
        "current" => $current,
        "rowCount" => $rows,
        "rows" => $resultRows,
        "total" => $total,
    ];

    echo json_encode($jsonObj);
}
die();

?>


}
