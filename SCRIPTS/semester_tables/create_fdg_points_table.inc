<?php
/*

create_fdg_points_table.inc

Created By: William Grove

6/15/2016

Please make sure this the first table script
is run after create_fdg_event_table.inc

*/


function createFDGPointsTable($conn, $prefix){

	$statement =

	"create table " . $prefix . "_fdg_points (

pfdg_points_id integer not null auto_increment,

primary key (pfdg_points_id),

pfdg_id integer not null,

pfdg_event_id integer not null,

pfdg_points_points Decimal(5,1) not null default 0,

foreign key (pfdg_id) references " . $prefix . "_fdg(pfdg_id)  on delete cascade,

foreign key (pfdg_event_id) references " . $prefix . "_fdg_event(pfdg_event_id)   on delete cascade,
		
unique key one_assign_per_event(pfdg_id, pfdg_event_id)

) ENGINE = INNODB";

	$result = mysqli_query($conn, $statement);
	
if($result == false){
		
		echo "There was an error creating the " . $prefix ."_fdg_points Table.";
		echo "Please contact the System Administrator.";
		return false;
	} else {
		return true;
	}
}

?>



