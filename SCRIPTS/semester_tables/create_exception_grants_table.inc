<?php
/*

create_exception_grants_table.inc

Created By: William Grove

6/15/2016

Please make sure this the first table script
is run after create_exceptions_table.inc

*/


function createExceptionGrantsTable($conn, $prefix){

	$statement =

	"create table if not exists " . $prefix . "_exception_grants (

grant_id integer not null auto_increment,

primary key (grant_id),

excptn_id integer not null,

pstu_id integer not null,

foreign key (pstu_id) references " . $prefix . "_currentstudents(pstu_id)  on delete cascade,

foreign key (excptn_id) references  " . $prefix . "_exceptions(excptn_id)  on delete cascade,

unique key only_grant_each_exception_once_per_student(excptn_id, pstu_id)

) ENGINE = INNODB";

	$result = mysqli_query($conn, $statement);

if($result == false){

		echo "There was an error creating the " . $prefix ."_exception_grants Table.";
		echo "Please contact the System Administrator.";
		return false;
	} else {
		return true;
	}
}

?>




