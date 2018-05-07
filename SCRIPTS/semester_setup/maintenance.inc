<?php

/*
 * Create by Mitchel Myers
 *
 * The purpose of this file is to add new tables to previous semesters. This is to ensure new features
 * won't produce unexpected errors if try to use with semesters before them.
 */

require_once '../semester_setup/create_semester.inc';

function fillSemestersWithTables ($conn) {
    $query = 'SELECT sem_prefix FROM semesters';

    $result = $conn->query($query);

    if (!$result) {
        return "Error filling semesters with tables";
    }


    while ($semester = $result->fetch_assoc()) {
        $prefix = $semester["sem_prefix"];
        $result = createTables($prefix, $conn);
        if ($result !== true) {
            return "Error filling semester $prefix with tables: $result";
        }
    }

    return true;
}

