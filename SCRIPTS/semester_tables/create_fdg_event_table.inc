<?php
/*

create_fdg_event_table.inc

Created By: William Grove

6/15/2016

Please make sure this the first table script
is run after create_fdg_attendence_table.inc

*/


function createFDGEventTable($conn, $prefix){

	$statement =

	"create table " . $prefix . "_fdg_event (

pfdg_event_id integer not null auto_increment,

primary key (pfdg_event_id),

pfdg_event_name varchar(60) not null,

pfdg_event_description varchar(500),			
			
pfdg_start_date datetime not null,
			
pfdg_end_date datetime not null,
			
pfdg_event_bg_color varchar(7) default '#0000ff',

pfdg_event_ft_color varchar(7) default '#ffffff'

) ENGINE = INNODB";

	$result = mysqli_query($conn, $statement);
	
if($result == false){
		
		echo "There was an error creating the " . $prefix ."_fdg_event.";
		echo "Please contact the System Administrator.";
		return false;
	} else {
		return true;
	}
}

?>



