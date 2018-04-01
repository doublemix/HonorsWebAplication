<?php
/*

create_academicevents_table.inc

Created By: William Grove

6/15/2016

Please make sure this the first table script
is run after create_activitygroupstats_table.inc

*/


function createAcademicEventsTable($conn, $prefix){

	$statement =

	"create table " . $prefix . "_academicevents (

acad_id integer not null auto_increment,

primary key (acad_id),

acad_title varchar(60) not null,

acad_description varchar(200) not null,

acad_start_date datetime not null,
			
acad_end_date datetime not null,
			
acad_bg_color varchar(7) default '#0000ff',

acad_ft_color varchar(7) default '#ffffff'

) ENGINE = INNODB";

$result = mysqli_query($conn, $statement);
	
	if($result == false){
		
		echo "There was an error creating the " . $prefix ."_academicevents Table.";
		echo "Please contact the System Administrator.";
		return false;
	} else {
		return true;
	}
}

?>


