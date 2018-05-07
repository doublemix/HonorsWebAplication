<?php
/*

create_pif_stats_table.inc

Created By: William Grove

6/15/2016

Please make sure this the first table script
is run after create_pif_table.inc

*/


function createPifStatsTable($conn, $prefix){

	$statement =

	"create table if not exists " . $prefix . "_pif_stats(

pifstat_id integer not null auto_increment,

primary key (pifstat_id),

pstu_id integer not null,

pif_id integer not null,

foreign key (pstu_id) references " . $prefix . "_currentstudents(pstu_id)   on delete cascade,

foreign key (pif_id) references  " . $prefix . "_pif(pif_id)  on delete cascade,

unique key one_pif_count_per_stu(pstu_id, pif_id)

) ENGINE = INNODB";

	$result = mysqli_query($conn, $statement);

if($result == false){

		echo "There was an error creating the " . $prefix ."_pif_stats Table.";
		echo "Please contact the System Administrator.";
		return false;
	} else {
		return true;
	}
}

?>



