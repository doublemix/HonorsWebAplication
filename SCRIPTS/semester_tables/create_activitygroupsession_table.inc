<?php
/*

create_activitygroupsession_table.inc

Created By: William Grove

6/15/2016

Please make sure this the first table script
is run after create_activitygroupleaders_table.inc

*/


function createActivityGroupSessionTable($conn, $prefix){

	$statement =

	"create table if not exists " . $prefix . "_activitygroupsession (

agses_id integer not null auto_increment,

primary key (agses_id),

ag_id integer not null,

agses_start_time datetime not null,

agses_end_time datetime not null,

agses_description varchar(500) not null,

foreign key (ag_id) references " . $prefix . "_activitygroup(ag_id)  on delete cascade

) ENGINE = INNODB";

	$result = mysqli_query($conn, $statement);

if($result == false){

		echo "There was an error creating the " . $prefix ."_activitygroupsession Table.";
		echo "Please contact the System Administrator.";
		return false;
	} else {
		return true;
	}
}

?>

