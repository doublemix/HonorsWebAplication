<?php
/*

create_activitygroupstats_table.inc

Created By: William Grove

6/15/2016

Please make sure this the first table script
is run after create_activitygroupsession_table.inc

*/


function createActivityGroupStatsTable($conn, $prefix){

	$statement =

	"create table if not exists " . $prefix . "_activitygroupstats (

agstat_id integer not null auto_increment,

primary key (agstat_id),

pstu_id integer not null,

agses_id integer not null,

foreign key (pstu_id) references " . $prefix . "_currentstudents(pstu_id)  on delete cascade,

foreign key (agses_id) references " . $prefix . "_activitygroupsession(agses_id)  on delete cascade,

unique key one_stat_per_agses (pstu_id, agses_id)

) ENGINE = INNODB";

	$result = mysqli_query($conn, $statement);

if($result == false){

		echo "There was an error creating the " . $prefix ."_activitygroupstats Table.";
		echo "Please contact the System Administrator.";
		return false;
	} else {
		return true;
	}
}

?>

