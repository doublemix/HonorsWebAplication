<?php
/*

create_fdg_members_table.inc

Created By: William Grove

6/15/2016

Please make sure this the first table script
is run after create_fdg_leaders_table.inc

*/


function createFDGMembersTable($conn, $prefix){

	$statement =

	"create table " . $prefix . "_fdg_members (

pfdg_member_id integer not null auto_increment,

primary key (pfdg_member_id),

pfdg_id integer not null,

pstu_id integer not null,

foreign key (pfdg_id) references " . $prefix . "_fdg(pfdg_id)   on delete cascade,

foreign key (pstu_id) references " . $prefix . "_currentstudents(pstu_id)   on delete cascade,

unique(pstu_id)		
		
) ENGINE = INNODB";

	$result = mysqli_query($conn, $statement);
	
if($result == false){
		
		echo "There was an error creating the " . $prefix ."_fdg_members Table.";
		echo "Please contact the System Administrator.";
		return false;
	} else {
		return true;
	}
}

?>


