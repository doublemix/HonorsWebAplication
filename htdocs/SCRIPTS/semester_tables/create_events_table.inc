<?php
/*

create_events_table.inc

Created By: William Grove

7/27/2016


*/


function createEventsTable($conn, $prefix){

	$statement =

	"create table " . $prefix . "_events (

event_id integer not null auto_increment,

primary key (event_id),

event_title varchar(60) not null,

event_description varchar(200) not null,

event_start_date datetime not null,
			
event_end_date datetime not null,
			
event_bg_color varchar(7) default '#0000ff',

event_ft_color varchar(7) default '#ffffff'

) ENGINE = INNODB";

	$result = mysqli_query($conn, $statement);
	
	if($result == false){
		
		echo "There was an error creating the " . $prefix ."_events Table.";
		echo "Please contact the System Administrator.";
		return false;
	} else {
		return true;
	}
}

?>


