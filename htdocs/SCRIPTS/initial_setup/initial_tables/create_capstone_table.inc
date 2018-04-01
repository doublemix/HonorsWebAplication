<?php
/*

create_capstone_table.inc

Created By: William Grove

6/15/2016

Please make sure this script is run after create_semesters_table.inc

*/


function createCapstoneTable($conn){

	$statement =

	"create table capstone(

capstone_id Integer not null auto_increment,

primary key (capstone_id),

usr_id integer not null,			

capstone_name varchar(100) not null,			
			
capstone_description varchar(500) not null,

capstone_advisor varchar(60) not null,

capstone_requirements varchar(200) not null,

capstone_startdate datetime not null,

capstone_enddate datetime not null,

capstone_complete integer not null,

foreign key (usr_id) references users(usr_id) on delete cascade

)";
	
	if(!$result = mysqli_query($conn, $statement)){
		
		echo "\n<p>There was an error creating the Capstone Table";
		echo "Please contact the System Administrator</p>";
		return false;
	} else {
		mysqli_free_result($result);
		echo "\n<p>Capstone Table was created successfully.</p>";
		return true;
	}
}

?>