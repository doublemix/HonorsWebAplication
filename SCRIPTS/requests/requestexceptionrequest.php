<?php

session_start();

require_once '../db_utils.php';
require_once '../get_permissions.inc';

if (isset($_POST["requestexceptionrequest"])) {

    if ($conn === false) {
        echo "Unable to connect to database.";
        return;
    }

    if (getPermissions($conn) === false) {
        echo "Unable to retrieve permissions";
        DBClose($conn);
        return;
    }

    $opcode = filter_input(INPUT_POST, "opcode");
    if ($opcode === null) {
        echo "Opcode not set";
        DBClose($conn);
        return;
    }

    if ($opcode === "request") {
        $userid = $_SESSION["userid"];

        $studentsTable = DB_getPrefixedTable("currentstudents");
        $result = DB_executeAndFetchOne(
            "SELECT pstu_id "
            . "FROM users "
            . "JOIN $studentsTable "
            . "ON (users.usr_id = $studentsTable.pstu_id) "
            . "WHERE users.usr_id = '$userid'"
            . "LIMIT 1"
        );
        if ($result === false) {
            echo "Not a current student";
            DBClose($conn);
            return;
        }
        $pstu_id = $result["pstu_id"];

        if (!isset($_POST["cce_half_reason_select"])) {
            $halfExemptionReasons = [];
        } else {
            $halfExemptionReasons = $_POST["cce_half_reason_select"];
        }

        if (!isset($_POST["cce_full_reason_select"])) {
            $fullExemptionReasons = [];
        } else {
            $fullExemptionReasons = $_POST["cce_full_reason_select"];
        }

        if (!isset($_POST["details"])) {
            $details = "";
        } else {
            $details = $_POST["details"];
        }

        if (count($halfExemptionReasons) + count($fullExemptionReasons) <= 0) {
            echo "No reason selected.";
            DBClose($conn);
            return;
        }

        $jsonHalf = json_encode($halfExemptionReasons);
        $jsonFull = json_encode($fullExemptionReasons);

        $escapedJsonHalf = $conn->real_escape_string($jsonHalf);
        $escapedJsonFull = $conn->real_escape_string($jsonFull);
        $escapedDetails = $conn->real_escape_string($details);

        $exceptionRequestTable = DB_getPrefixedTable('exception_request');

        // check to see if there is an existing record, update it if so (and allowed), else create new
        $checkQuery = "SELECT exrq_id, exrq_status FROM $exceptionRequestTable WHERE pstu_id = $pstu_id LIMIT 1";
        $existingRecord = DB_executeAndFetchOne($checkQuery);
        if ($existingRecord === null) {
            // no existing record
            $insertQuery = "INSERT INTO $exceptionRequestTable("
                . "pstu_id, exrq_half_req, exrq_full_req, exrq_details, exrq_status, exrq_reqdate)"
                . "VALUES ($pstu_id, '$escapedJsonHalf', '$escapedJsonFull', '$escapedDetails', 'Pending', NOW())";

            if (!DB_executeQuery($insertQuery)) {
                echo "Error creating record";
                DBClose($conn);
                return;
            }
        } else {
            if ($existingRecord["exrq_status"] !== "Pending") {
                echo "Cannot update this request";
                DBClose($conn);
                return;
            }
            $updateQuery = "UPDATE $exceptionRequestTable SET "
                . "exrq_half_req = '$escapedJsonHalf', "
                . "exrq_full_req = '$escapedJsonFull', "
                . "exrq_details = '$escapedDetails' "
                . "WHERE pstu_id = $pstu_id "
                . "LIMIT 1";
            if (!DB_executeQuery($updateQuery)) {
                echo "Error updating record";
                DBClose($conn);
                return;
            }
        }

        echo "success";
        DBClose($conn);
        return;
    }
}