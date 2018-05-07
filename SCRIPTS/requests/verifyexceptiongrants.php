<?php

session_start();

require_once '../access_semester_tables/modify_exception_grants.inc';
require_once '../access_semester_tables/modify_exception_request.inc';
require_once '../get_permissions.inc';
require_once '../db_utils.php';
require_once '../update_factory/update_factory.inc';

if (isset($_POST["verifyexceptiongrants"])) {

    if (!$conn) {
        echo "Unable to connect to database.";
        return;
    }

    if (!getPermissions($conn)) {
        echo "Unable to retrieve permissions.";
        DBClose($conn);
        return;
    }

    $opcode = filter_input(INPUT_POST, 'opcode');

    if (!$opcode) {
        echo "Opcode not set.";
        DBClose($conn);
        return;
    }

    $prefix = filter_input(INPUT_POST, "prefix");

    if (!$prefix) {
        echo "Prefix not set";
        DBClose($conn);
        return;
    }

    if ($opcode === "accept") {
        $exrq_id = filter_input(INPUT_POST, "exrq_id", FILTER_VALIDATE_INT);
        $excptn_id = filter_input(INPUT_POST, "excptn_id", FILTER_VALIDATE_INT);

        if (!$exrq_id) {
            echo "Exemption Request ID not set";
            DBClose($conn);
            return;
        }

        if (!$excptn_id) {
            echo "Exemption Type ID not set";
            DBClose($conn);
            return;
        }

        $result = DB_executeAndFetchOne(
            "SELECT "
            . "pstu_id "
            . "FROM {$prefix}_exception_request "
            . "WHERE exrq_id = $exrq_id "
            . "LIMIT 1"
        );

        $pstu_id = $result["pstu_id"];

        $result = assignException($excptn_id, $pstu_id, $prefix, $conn);

        if ($result !== true) {
            echo $result;
            DBClose($conn);
            return;
        }

        $result = acceptExceptionRequest($exrq_id, $prefix, $conn);

        if ($result === true) {
            echo "success";
        } else {
            echo $result;
            DBClose($conn);
            return;
        }

        DBClose($conn);
        return;

    } elseif ($opcode === "reject") {
        $exrq_id = filter_input(INPUT_POST, "exrq_id", FILTER_VALIDATE_INT);

        if (!$exrq_id) {
            echo "Exemption Request ID not set";
            DBClose($conn);
            return;
        }

        $result = rejectExceptionRequest($exrq_id, $prefix, $conn);

        if ($result === true) {
            echo "success";
        } else {
            echo $result;
            DBClose($conn);
            return;
        }

        DBClose($conn);
        return;
    }
}