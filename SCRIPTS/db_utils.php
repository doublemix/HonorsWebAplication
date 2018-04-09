<?php

require_once 'db_connect.inc';

$db_util_conn = DBConnect();

function DB_executeAndFetchOne ($sql, $fetchMode = MYSQLI_ASSOC) {
    global $db_util_conn;
    $result = $db_util_conn->query($sql);
    if ($result === false) {
        throw new \Exception($db_util_conn->error);
    }
    return $result->fetch_array($fetchMode);
}

function DB_executeAndFetchAll ($sql, $fetchMode = MYSQLI_ASSOC) {
    global $db_util_conn;
    $result = $db_util_conn->query($sql);
    if ($result === false) {
        throw new \Exception($db_util_conn->error);
    }
    return $result->fetch_all($fetchMode);
}
function DB_getCurrentPrefix () {
    $sql = "SELECT sem_prefix FROM semesters Order By sem_id desc LIMIT 1";

    $result = DB_executeAndFetchOne($sql, MYSQLI_NUM);

    return $result[0];
}
function DB_getPrefixedTable($tableName) {
    $prefix = DB_getCurrentPrefix();
    return "{$prefix}_{$tableName}";
}
?>