<?php
/*

create_exceptions_table.inc

Created By: William Grove

6/15/2016

Please make sure this the first table script
run after create_augmentations_table.inc

*/

/*
 * Types
 * 
 * 0 - Activity Group
 * 1 - FDG Group
 * 2 - Community Service
 * 3 - Academic Event
 * 
 */

function createExceptionsTable($conn, $prefix){

	$statement =

	"create table " . $prefix . "_exceptions (

excptn_id integer not null auto_increment,

primary key (excptn_id),

excptn_name varchar(60) not null,

excptn_type integer not null,
			
excptn_value decimal(5,2) not null default 0,
			
unique(excptn_name)

) ENGINE = INNODB";

	$result = mysqli_query($conn, $statement);
	
if($result == false){
		
		echo "There was an error creating the " . $prefix ."_exceptions Table.";
		echo "Please contact the System Administrator.";
		return false;
	} else {
		return true;
	}
}

?>




