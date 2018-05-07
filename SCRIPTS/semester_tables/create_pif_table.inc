<?php
/*

create_pif_table.inc

Created By: William Grove

6/15/2016

Please make sure this the first table script
is run after create_fdg_event_attendence_table.inc

*/


function createPifTable($conn, $prefix){

	$statement =

	"create table if not exists " . $prefix . "_pif (

pif_id integer not null auto_increment,

primary key (pif_id),

pif_start_date datetime not null,

pif_end_date datetime not null,

pif_title varchar(60) not null,

pif_description varchar(250),

pif_bg_color varchar(7) default '#0000ff',

pif_ft_color varchar(7) default '#ffffff'

) ENGINE = INNODB";

	$result = mysqli_query($conn, $statement);

if($result == false){

		echo "There was an error creating the " . $prefix ."_pif Table.";
		echo "Please contact the System Administrator.";
		return false;
	} else {
		return true;
	}
}

?>



