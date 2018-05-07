<?php

session_start();

require_once '../../db_utils.php';
require_once '../../get_permissions.inc';

if(isset($_SESSION["userid"])){

    $userId = $_SESSION["userid"];

	if (!getPermissions($conn)) {
        echo json_encode(null);
        die();
    }

    $exceptionRequestTable = DB_getPrefixedTable('exception_request');

    $query = "SELECT "
        . "exrq_id, "
        . "exrq_half_req, "
        . "exrq_full_req, "
        . "exrq_details, "
        . "exrq_status "
        . "FROM $exceptionRequestTable "
        . "WHERE pstu_id = {$userId} "
        . "LIMIT 1";
    $result = mysqli_query($conn, $query);

    file_put_contents("log.txt", mysqli_error($conn));

    if ($result === false) {
        echo json_encode(null);
        die();
    }

    $row = mysqli_fetch_assoc($result);

    if ($row === null) {
        echo json_encode(null);
        die();
    }

    echo json_encode($row);
} else {

    echo json_encode(null);
}

die();

?>
