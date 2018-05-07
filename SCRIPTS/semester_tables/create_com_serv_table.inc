<?php
/*

create_com_serv_table.inc

Created By: William Grove

6/15/2016

Please make sure this the first table script
is run after create_academicevent_attendence_table.inc

*/


function createComServTable($conn, $prefix){

	$statement =

	"create table if not exists " . $prefix . "_com_serv (

com_id integer not null auto_increment,

primary key (com_id),

pstu_id integer not null,

com_title varchar(50) not null,

com_advisor varchar(60) not null,

com_advisor_contact varchar(60) not null,

com_description varchar(500) not null,

com_date datetime not null,

com_hours Decimal(5,1) not null,

com_verified integer not null,

foreign key (pstu_id) references " . $prefix . "_currentstudents(pstu_id)  on delete cascade
) ENGINE = INNODB";

	$result = mysqli_query($conn, $statement);

if($result == false){

		echo "There was an error creating the " . $prefix ."_com_serv Table.";
		echo "Please contact the System Administrator.";
		return false;
	} else {
		return true;
	}
}

?>


