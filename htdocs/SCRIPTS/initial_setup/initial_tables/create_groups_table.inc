<?php
/*

create_groups_table.inc

Created By: William Grove

6/15/2016

Please make sure this script is run after create_permissions_table.inc

*/


function createGroupsTable($conn){

	$statement =

	"create table groups(

group_id Integer not null auto_increment,

primary key (group_id),

group_name varchar(50) not null,

group_description varchar(200),

group_admin integer not null,

group_imagepath varchar(60),

group_type integer not null,

unique(group_name),
			
foreign key (group_admin) references users(usr_id)  on delete cascade

)";

	if(!$result = mysqli_query($conn, $statement)){
		
		echo "\n<p>There was an error creating the Groups Table";
		echo "Please contact the System Administrator</p>";
		return false;
	} else {
		mysqli_free_result($result);
		echo "\n<p>Groups Table was created successfully.</p>";
		return true;
	}
}

?>