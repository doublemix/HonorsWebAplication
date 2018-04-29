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
            return;
        }

        $jsonHalf = json_encode($halfExemptionReasons);
        $jsonFull = json_encode($fullExemptionReasons);

        $escapedJsonHalf = $conn->real_escape_string($jsonHalf);
        $escapedJsonFull = $conn->real_escape_string($jsonFull);
        $escapedDetails = $conn->real_escape_string($details);

        $exceptionRequestTable = DB_getPrefixedTable('exception_request');
        $insertQuery = "INSERT INTO $exceptionRequestTable("
            . "pstu_id, exrq_half_req, exrq_full_req, exrq_details, exrq_status, exrq_reqdate)"
            . "VALUES ($pstu_id, '$escapedJsonHalf', '$escapedJsonFull', '$escapedDetails', 'Pending', NOW())";

        if (!DB_executeQuery($insertQuery)) {
            echo "Error creating record";
            return;
        }

        echo "success";
        DBClose($conn);
        return;
    }
}