<?php
/*

create_fdg_attendence_table.inc

Created By: William Grove

6/15/2016

Please make sure this the first table script
is run after create_fdg_reports_table.inc

*/


function createFDGAttendenceTable($conn, $prefix){

	$statement =

	"create table " . $prefix . "_fdg_attendence (

pfdg_att_id integer not null auto_increment,

primary key (pfdg_att_id),

pfdg_report_id integer not null,

pstu_id integer not null,

foreign key (pfdg_report_id) references " . $prefix . "_fdg_reports(pfdg_report_id)   on delete cascade,

foreign key (pstu_id) references " . $prefix . "_currentstudents(pstu_id)   on delete cascade,

unique key one_att_per_fdg_member(pfdg_report_id, pstu_id)
		
) ENGINE = INNODB";

	$result = mysqli_query($conn, $statement);
	
if($result == false){
		
		echo "There was an error creating the " . $prefix ."_fdg_attendence Table.";
		echo "Please contact the System Administrator.";
		return false;
	} else {
		return true;
	}
}

?>



