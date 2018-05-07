<?php

/*
 * Created By Mitchel Myers
 */

session_start();

require_once '../db_utils.php';
require_once '../get_permissions.inc';
require_once '../semester_setup/maintenance.inc';

if ($conn === false) {
    echo "Unable to connect to database.";
    return;
}

if (isset($_POST["tablemaintenancerequest"])) {

    if (getPermissions($conn) === false) {
        echo "Unable to retrieve permissions";
        DBClose($conn);
        return;
    }

    if (!hasPermission(PERM_ADMIN)) {
        echo "Only Admin is able to do table maintenance";
        DBClose($conn);
        return;
    }

    $opcode = filter_input(INPUT_POST, "opcode");
    if ($opcode === null) {
        echo "Opcode not set";
        DBClose($conn);
        return;
    }

    if ($opcode === "fill-tables") {
        $result = fillSemestersWithTables($conn);
        if ($result !== true) {
            echo $result;
        } else {
            echo "success";
        }

        DBClose($conn);
        return;
    }
} else {
    echo "Invalid request";
    DBClose($conn);
    return;
}

