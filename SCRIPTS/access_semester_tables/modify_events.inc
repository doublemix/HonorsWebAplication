<?php
/*
 * modify_events.inc
 *
 * Created By: William Grove
 *
 * Date: 6/27/2016
 *
 *
 * Adds/Deletes values from the
 * (prefix)_events table
 *
 *
 */
require_once '../get_permissions.inc';
function addEvent($event_title, $event_description, $event_start_date, $event_end_date, $conn, $prefix) {
	getPermissions ( $conn );
	
	if (($_SESSION ["permissions"] [0] == 1 || $_SESSION ["permissions"] [1] == 1 || $_SESSION ["permissions"] [10] == 1) == false) {
		return "User Not Permitted to Add, Modify, or Delete Academic Events.";
	}
	
	$sql = "INSERT INTO " . $prefix . "_events VALUES(null, '$event_title', '$event_description', STR_TO_DATE('$event_start_date', '%m/%d/%Y %I:%i %p' ), STR_TO_DATE('$event_end_date', '%m/%d/%Y %I:%i %p' ), '#0000ff', '#ffffff')";
	
	$result = mysqli_query ( $conn, $sql );
	
	if ($result == false) {
		return "Failed to insert Academic Event Record.";
	} else {
		return true;
	}
}
function deleteEvent($event_id, $conn, $prefix) {
	getPermissions ( $conn );
	
	if (($_SESSION ["permissions"] [0] == 1 || $_SESSION ["permissions"] [1] == 1 || $_SESSION ["permissions"] [10] == 1) == false) {
		return "User Not Permitted to Add, Modify, or Delete Academic Events.";
	}
	
	$sql = "DELETE FROM " . $prefix . "_events where event_id = " . $event_id;
	
	$result = mysqli_query ( $conn, $sql );
	
	if ($result == false) {
		return "Failed to delete Academic Event Record.";
	} else {
		return true;
	}
}

?>