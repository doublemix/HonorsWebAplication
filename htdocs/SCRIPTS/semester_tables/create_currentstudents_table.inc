<?php
/*

create_currentstudents_table.inc

Created By: William Grove

6/15/2016

Please make sure this the first table script run when creating a semester.

*/

/**
 * IF pstu_in_fdg = 1 then
 * Freshman goes in FDG pool.
 * 
 * @return boolean
 */
function createCurrentStudentsTable($conn, $prefix){

	$statement =

	"create table " . $prefix . "_currentstudents (

pstu_id integer not null,
			
pstu_in_fdg integer not null default 0,

primary key (pstu_id),

foreign key (pstu_id) references users(usr_id)  on delete cascade

) ENGINE = INNODB";

	$result = mysqli_query($conn, $statement);
	
if($result == false){
		
		echo "There was an error creating the " . $prefix ."_currentstudents Table.";
		echo "Please contact the System Administrator.";
		return false;
	} else {
		return true;
	}
}

?>

