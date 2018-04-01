<?php

function createAdmin($conn){



echo 'Blowfish:     ' . crypt('rasmuslerdorf', '$2a$10$leskfiqamdhjthrjwsksdidfhrjrkdlsldlkfjjgird$') . "\n";


$username = "admin";
$fname = "Admin";
$lname = "Admin";
$school_id = "-1";
$usr_status = "1";
$usr_education = "6";
$imagepath = "";
$password = stripslashes(crypt('AdminPassword', '$2a$10$leskfiqamdhjthrjwsksdidfhrjrkdlsldlkfjjgird$'));
$usr_school_email = "admin@lhup.edu";
$usr_perm_email = "admin@gmail.com";
$fdg_name = "None";
$fdg_imagepath = "";

$stmnt = "Insert into fdg values (null, '$fdg_name', '$fdg_imagepath','#0000ff','#ffffff')";

mysqli_query($conn, $stmnt);

$stmnt = "Insert into users values (null, '$username', '$fname', '$lname', $school_id, '$usr_school_email', '$usr_perm_email', $usr_status, $usr_education,'$imagepath', '$password')";

mysqli_query($conn, $stmnt);

$stmnt = "insert into permissions values (null, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)";

mysqli_query($conn, $stmnt);

return true;

}
?>
