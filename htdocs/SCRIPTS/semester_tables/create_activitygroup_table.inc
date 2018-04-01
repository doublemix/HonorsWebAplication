<?php
/*

create_activitygroup_table.inc

Created By: William Grove

6/15/2016

Please make sure this the first table script
is run after create_currentstudents_table.inc

*/


function createActivityGroupTable($conn, $prefix){

	$statement =

	"create table " . $prefix . "_activitygroup (

ag_id integer not null auto_increment,

primary key (ag_id),

ag_title varchar(40) not null,

ag_description varchar(500) not null,

ag_imagepath varchar(30),
			
ag_bg_color varchar(7) default '#0000ff',

ag_ft_color varchar(7) default '#ffffff',
			
UNIQUE(ag_title)

) ENGINE = INNODB";

	$result = mysqli_query($conn, $statement);	
	
if($result == false){
		
		echo "There was an error creating the " . $prefix ."_activitygroup Table.";
		echo "Please contact the System Administrator.";
		return false;
	} else {
		return true;
	}
}

?>

