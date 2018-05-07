<?php
session_start();

include_once '../../db_connect.inc';
include_once '../../get_permissions.inc';

if(isset($_SESSION["userid"])){

	$conn = DBConnect();

	if (!getPermissions($conn) || !hasAnyOfPermission([PERM_ADMIN, PERM_WORKER, PERM_EXEMPTIONS])) {
        echo json_encode(null);
        die();
    }

    $prefix = removeslashes($_POST["prefix"]);

    $query = "SELECT "
        . "CONCAT(usr_fname, ' ', usr_lname) AS 'usr_name', "
        . "usr_school_id, "
        . "usr_education, "
        . "exrq_id, "
        . "exrq_half_req, "
        . "exrq_full_req, "
        . "exrq_details "
        . "FROM {$prefix}_exception_request "
        . "JOIN users ON (pstu_id = usr_id) "
        . "WHERE exrq_status = 'Pending' "
        . "ORDER BY exrq_reqdate ASC "
        . "LIMIT 1";
    $result = mysqli_query($conn, $query);

    file_put_contents("log.txt", mysqli_error($conn));

    if ($result === false) {
        echo json_encode(null);
        die();
    }

    $row = mysqli_fetch_assoc($result);

    if ($row === false) {
        echo json_encode(null);
        die();
    }

    //$json = json_encode ( $res_array );
    echo json_encode($row);
}

die();

?>
