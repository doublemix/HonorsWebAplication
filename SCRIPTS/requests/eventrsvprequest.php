<?php

session_start();

require_once '../db_utils.php';
require_once '../get_permissions.inc';

function finishRequest ($message = "success") {
    global $conn;
    echo $message;
    DBClose($conn);
}

if (isset($_POST["eventrsvprequest"])) {
    if (!getPermissions($conn)) {
        finishRequest("Unable to retrieve permissions");
        return;
    }

    if (!isset($_POST["opcode"])) {
        finishRequest("Opcode is not set");
        return;
    }

    $opcode = filter_input(INPUT_POST, "opcode");

    if ($opcode === "add-rsvp") {

        $event_id = filter_input(INPUT_POST, "event_id", FILTER_VALIDATE_INT);
        $user_id = intval($_SESSION["userid"]);

        if ($event_id === false || $event_id === null || $user_id === null) {
            finishRequest("Malformed request");
            return;
        }

        $currentstudentsTable = DB_getPrefixedTable("currentstudents");
        $pstuIdQuery = "SELECT pstu_id FROM $currentstudentsTable WHERE pstu_id = $user_id LIMIT 1";
        $pstuId = DB_executeAndFetchOne($pstuIdQuery)["pstu_id"];

        if ($pstuId === false) {
            finishRequest("User is not current student");
            return;
        }

        $rsvpTable = DB_getPrefixedTable("cce_rsvp");
        $query = "INSERT INTO $rsvpTable(acad_id, pstu_id) VALUES ($event_id, $pstuId)";
        if (!DB_executeQuery($query)) {
            finishRequest("Unable to make RSVP: ($query) " . $conn->error);
            return;
        } else {
            finishRequest();
            return;
        }
    } else {
        finishRequest("Unknown opcode");
        return;
    }
} else {
    finishRequest("Invalid request");
    return;
}