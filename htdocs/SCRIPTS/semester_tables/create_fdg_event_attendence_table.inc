<?php
/*

create_fdg_event_attendence_table.inc

Created By: William Grove

6/15/2016

Please make sure this the first table script
is run after create_fdg_points_table.inc

*/


function createFDGEventAttendenceTable($conn, $prefix){

	$statement =

	"create table " . $prefix . "_fdg_event_attendence (

pfdg_eve_att_id integer not null auto_increment,

primary key (pfdg_eve_att_id),

pfdg_event_id integer not null,

pstu_id integer not null,

foreign key (pfdg_event_id) references  " . $prefix . "_fdg_event(pfdg_event_id)  on delete cascade,

foreign key (pstu_id) references " . $prefix . "_currentstudents(pstu_id)  on delete cascade,

unique key one_event_att_per_stu (pfdg_event_id, pstu_id)		
		
) ENGINE = INNODB";

	$result = mysqli_query($conn, $statement);
	
if($result == false){
		
		echo "There was an error creating the " . $prefix ."_fdg_event_attendence Table.";
		echo "Please contact the System Administrator.";
		return false;
	} else {
		return true;
	}
}

?>



