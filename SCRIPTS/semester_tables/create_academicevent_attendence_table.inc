<?php
/*

create_academicevent_attendence_table.inc

Created By: William Grove

6/15/2016

Please make sure this the first table script
is run after create_academicevents_table.inc

*/


function createAcademicEventAttendenceTable($conn, $prefix){

	$statement =

	"create table " . $prefix . "_academicevent_attendence (

acad_att_id integer not null auto_increment,

primary key (acad_att_id),

acad_id integer not null,

pstu_id integer not null,

foreign key (pstu_id) references " . $prefix . "_currentstudents(pstu_id)  on delete cascade,

foreign key (acad_id) references " . $prefix . "_academicevents(acad_id)  on delete cascade,

UNIQUE KEY one_acad_event (acad_id, pstu_id)		
		
) ENGINE = INNODB";

	$result = mysqli_query($conn, $statement);
	
	if($result == false){
		
		echo "There was an error creating the " . $prefix ."_academicevent_attendence Table.";
		echo "Please contact the System Administrator.";
		return false;
	} else {
		return true;
	}
}

?>


