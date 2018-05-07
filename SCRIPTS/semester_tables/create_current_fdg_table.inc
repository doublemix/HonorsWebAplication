<?php
/*

create_current_fdg_table.inc

Created By: William Grove

6/15/2016

Please make sure this the first table script
is run after create_com_serv_table.inc

*/


function createCurrentFDGTable($conn, $prefix){

	$statement =

	"create table if not exists " . $prefix . "_fdg (

pfdg_id integer not null,

primary key (pfdg_id),

foreign key (pfdg_id) references fdg(fdg_id)   on delete cascade

) ENGINE = INNODB";

	$result = mysqli_query($conn, $statement);

if($result == false){

		echo "There was an error creating the " . $prefix ."_fdg Table.";
		echo "Please contact the System Administrator.";
		return false;
	} else {
		return true;
	}
}

?>


