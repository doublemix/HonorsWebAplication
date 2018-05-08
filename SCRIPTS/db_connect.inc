<?php

/* * *************************
 * db_connect.inc
 *
 * Created By: William Grove
 * Updated By: Mitchel Myers
 *
 * Creates a connection between the
 * Database and PHP processor.
 *
 * ************************** */

require __DIR__ . '/settings.inc';

function DBConnect() {
    $settings = SETTINGS['database'];
    $host = $settings['host'];
    $user = $settings['user'];
    $pass = $settings['pass'];
    $db = $settings['db'];

    $conn = mysqli_connect($host, $user, $pass, $db);

    return $conn;
}

function DBClose($conn) {


    $result = mysqli_close($conn);

    return $result;
}

function removeslashes($string) {

    $string = implode("", explode("\\", $string));

    return stripslashes(trim($string));
}

?>
