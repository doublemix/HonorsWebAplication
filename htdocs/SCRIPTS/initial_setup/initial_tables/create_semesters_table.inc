<?php
/*

create_semesters_table.inc

Created By: William Grove

6/15/2016

Please make sure this script is run after create_users_table.inc

*/


function createSemestersTable($conn){

	$statement =

	"create table semesters (

sem_id Integer not null auto_increment,

primary key (sem_id),

sem_prefix varchar(20) not null,

sem_name varchar(20) not null,

sem_active integer not null,

sem_start_date datetime not null,

sem_end_date datetime,
			
carry_over_fdg integer not null default 0,
			
carry_over_com_serv integer not null default 0,

unique(sem_prefix),
			
unique(sem_name)

)";
		
	if(!$result = mysqli_query($conn, $statement)){
		
		echo "\n<p>There was an error creating the Semesters Table";
		echo "Please contact the System Administrator</p>";
		return false;
	} else {
		mysqli_free_result($result);
		echo "\n<p>Semesters Table was created successfully.</p>";
		return true;
	}
}

?>