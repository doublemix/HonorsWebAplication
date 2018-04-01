<?php
/*

create_activitygroupleaders_table.inc

Created By: William Grove

6/15/2016

Please make sure this the first table script
is run after create_activitygroup_table.inc

*/


function createActivityGroupLeadersTable($conn, $prefix){

	$statement =

	"create table " . $prefix . "_activitygroupleaders (

ag_leaders integer not null auto_increment,

primary key (ag_leaders),

ag_id integer not null,

pstu_id integer not null,

foreign key (ag_id) references " . $prefix . "_activitygroup(ag_id)  on delete cascade,

foreign key (pstu_id) references " . $prefix . "_currentstudents(pstu_id)  on delete cascade,		
		
UNIQUE KEY one_leader (ag_id, pstu_id)		
		
) ENGINE = INNODB";

	$result = mysqli_query($conn, $statement);	
	
if($result == false){
		
		echo "There was an error creating the " . $prefix ."_activitygroupleaders Table.";
		echo "Please contact the System Administrator.";
		return false;
	} else {
		return true;
	}
}

?>

