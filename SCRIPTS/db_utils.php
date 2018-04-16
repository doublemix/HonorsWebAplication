<?php

require_once 'db_connect.inc';

$conn = DBConnect();

function DB_executeQuery ($sql) {
    global $conn;
    return $conn->query($sql);
}

function DB_executeAndFetchOne ($sql, $fetchMode = MYSQLI_ASSOC) {
    global $conn;
    $result = $conn->query($sql);
    if ($result === false) {
        throw new \Exception($conn->error);
    }
    return $result->fetch_array($fetchMode);
}

function DB_executeAndFetchAll ($sql, $fetchMode = MYSQLI_ASSOC) {
    global $conn;
    $result = $conn->query($sql);
    if ($result === false) {
        echo $conn->error;
        throw new \Exception($conn->error);
    }
    return $result->fetch_all($fetchMode);
}
function DB_getCurrentPrefix () {
    $sql = "SELECT sem_prefix FROM semesters Order By sem_id desc LIMIT 1";

    $result = DB_executeAndFetchOne($sql, MYSQLI_NUM);

    return $result[0];
}
function DB_getPrefixedTable($tableName, $prefix = null) {
    $prefix = $prefix === null ? DB_getCurrentPrefix() : $prefix;
    return "{$prefix}_{$tableName}";
}

function DB_tableExists($tableName) {
    $tables = DB_executeAndFetchAll("SHOW TABLES LIKE '$tableName'");
    return count($tables) > 0;
}
?>