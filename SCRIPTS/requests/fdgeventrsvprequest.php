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
    $user_id = intval($_SESSION["userid"]);


    if ($opcode === "add-rsvp") {
        $event_id = filter_input(INPUT_POST, "event_id", FILTER_VALIDATE_INT);
        if ($event_id === false || $event_id === null || $user_id === null) {
            finishRequest("Malformed request");
            return;
        }

        $eventsTable = DB_getPrefixedTable("fdg_event");
        $event = DB_executeAndFetchOne("SELECT pfdg_start_date FROM $eventsTable WHERE pfdg_event_id = $event_id LIMIT 1");
        $startDate = new \DateTimeImmutable($event['pfdg_start_date']);

        if ($startDate < new \DateTimeImmutable()) {
            finishRequest('Cannot RSVP for event which has already occured');
            return;
        }

        $currentstudentsTable = DB_getPrefixedTable("currentstudents");
        $pstuIdQuery = "SELECT pstu_id FROM $currentstudentsTable WHERE pstu_id = $user_id LIMIT 1";
        $pstuId = DB_executeAndFetchOne($pstuIdQuery)["pstu_id"];

        if ($pstuId === false) {
            finishRequest("User is not current student");
            return;
        }

        $rsvpTable = DB_getPrefixedTable("fdg_cce_rsvp");
        $query = "INSERT INTO $rsvpTable(event_id, pstu_id) VALUES ($event_id, $pstuId)";
        if (!DB_executeQuery($query)) {
            finishRequest("Unable to make RSVP: ($query) " . $conn->error);
            return;
        } else {
            finishRequest();
            return;
        }
    } else if ($opcode === 'attend') {

        if (!hasPermission(PERM_ADMIN)) {
            finishRequest("Insufficient permissions");
            return;
        }

        $prefix = filter_input(INPUT_POST, 'prefix');
        $rsvpId = filter_input(INPUT_POST, 'rsvp_id', FILTER_VALIDATE_INT);
        $acadId = filter_input(INPUT_POST, 'event_id', FILTER_VALIDATE_INT);
        $pstuId = filter_input(INPUT_POST, 'user_id', FILTER_VALIDATE_INT);

        $rsvpTable = DB_getPrefixedTable('fdg_cce_rsvp', $prefix);
        if (!DB_tableExists($rsvpTable)) {
            finishRequest("This semester does not support RSVPs");
            return;
        }

        DB_executeQuery("DELETE FROM $rsvpTable WHERE rsvp_id = $rsvpId LIMIT 1");

        $attendenceTable = DB_getPrefixedTable('fdg_event_attendence', $prefix);
        DB_executeQuery("INSERT INTO $attendenceTable(pfdg_event_id, pstu_id) VALUES ('$acadId', '$pstuId')");

        finishRequest();
        return;

    } else if ($opcode === 'delete') {

        if (!hasPermission(PERM_ADMIN)) {
            finishRequest("Insufficient permissions");
            return;
        }

        $prefix = filter_input(INPUT_POST, 'prefix');
        $rsvpId = filter_input(INPUT_POST, 'rsvp_id', FILTER_VALIDATE_INT);

        $rsvpTable = DB_getPrefixedTable('fdg_cce_rsvp', $prefix);
        if (!DB_tableExists($rsvpTable)) {
            finishRequest("This semester does not support RSVPs");
            return;
        }

        DB_executeQuery("DELETE FROM $rsvpTable WHERE rsvp_id = $rsvpId LIMIT 1");

        finishRequest();
        return;

    } else {
        finishRequest("Unknown opcode");
        return;
    }
} else {
    finishRequest("Invalid request");
    return;
}