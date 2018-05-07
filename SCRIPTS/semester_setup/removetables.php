<?php

require_once '../db_connect.inc';

$prefix = $argv[1];

$conn = DBConnect();

if (mysqli_query($conn, "drop table " . $prefix . "_cce_rsvp")== false) {
    echo "\nFailed to drop cce_rsvp table";
}

if(mysqli_query($conn, "drop table " . $prefix . "_events")== false){
	echo "\nFailed to drop events\n";
}

if(mysqli_query($conn, "drop table " . $prefix . "_pif_stats")== false){
	echo "\nFailed to drop pif_stats\n";
}

if(mysqli_query($conn, "drop table " . $prefix . "_pif")== false){
	echo "\nFailed to drop pif\n";
}

if (mysqli_query($conn, "drop table " . $prefix . "_exception_request")== false) {
    echo "\nFailed to drop exception_request table";
}

if(mysqli_query($conn, "drop table " . $prefix . "_exception_grants")== false){
	echo "\nFailed to drop exception grants\n";
}

if(mysqli_query($conn, "drop table " . $prefix . "_exceptions")== false){
	echo "\nFailed to drop exceptions\n";
}

if(mysqli_query($conn, "drop table " . $prefix . "_com_serv")== false){
	echo "\nFailed to drop com_serv\n";
}

if(mysqli_query($conn, "drop table " . $prefix . "_academicevent_attendence")== false){
	echo "\nFailed to drop academicevent_attendence\n";
}

if(mysqli_query($conn, "drop table " . $prefix . "_academicevents")== false){
	echo "\nFailed to drop academicevents\n";
}

if(mysqli_query($conn, "drop table " . $prefix . "_activitygroupstats")== false){
	echo "\nFailed to drop activitygroupstats\n";
}

if(mysqli_query($conn, "drop table " . $prefix . "_activitygroupsession")== false){
	echo "\nFailed to drop activitygroupsession\n";
}

if(mysqli_query($conn, "drop table " . $prefix . "_activitygroupleaders")== false){
	echo "\nFailed to drop activitygroupleaders\n";
}

if(mysqli_query($conn, "drop table " . $prefix . "_activitygroup")== false){
	echo "\nFailed to drop activitygroup\n";
}

if(mysqli_query($conn, "drop table " . $prefix . "_fdg_points")== false){
	echo "\nFailed to drop fdg_points\n";
}

if(mysqli_query($conn, "drop table " . $prefix . "_fdg_event_attendence")== false){
	echo "\nFailed to drop fdg_event_attendence\n";
}

if(mysqli_query($conn, "drop table " . $prefix . "_fdg_event")== false){
	echo "\nFailed to drop fdg_event\n";
}

if(mysqli_query($conn, "drop table " . $prefix . "_fdg_attendence")== false){
	echo "\nFailed to drop fdg_attendence\n";
}

if(mysqli_query($conn, "drop table " . $prefix . "_fdg_reports")== false){
	echo "\nFailed to drop _fdg_reports\n";
}

if(mysqli_query($conn, "drop table " . $prefix . "_fdg_members")== false){
	echo "\nFailed to drop fdg_memberss\n";
}

if(mysqli_query($conn, "drop table " . $prefix . "_fdg_leaders")== false){
	echo "\nFailed to drop fdg_leaders\n";
}

if(mysqli_query($conn, "drop table " . $prefix . "_fdg")== false){
	echo "\nFailed to drop fdg\n";
}

if(mysqli_query($conn, "drop table " . $prefix . "_currentstudents")== false){
	echo "\nFailed to drop currentstudents\n";
}

if(mysqli_query($conn, "DELETE FROM semesters where sem_prefix =  '" . $prefix . "'")== false){
	echo "\nFailed to drop semester\n";
}

DBClose($conn);
die();

?>