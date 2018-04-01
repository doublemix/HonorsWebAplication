<?php
/*

create_permissions_table.inc

Created By: William Grove

6/15/2016

Please make sure this script is run after create_capstone_table.inc

*/


function createPermissionsTable($conn){

	$statement =

	"create table permissions (

perm_id Integer not null auto_increment,

primary key (perm_id),

usr_id integer not null,

perm_admin integer not null,

perm_worker integer not null,

perm_users integer not null,

perm_fdg integer not null,

perm_exemptions integer not null,

perm_academic_events integer not null,

perm_activity_groups integer not null,

perm_comm_serv integer not null,

perm_pif integer not null,
			
perm_image_slides integer not null,
			
perm_events integer not null,
			
perm_news integer not null,
			
perm_groups integer not null,

perm_stats integer not null, 
			
unique(usr_id),			
			
foreign key (usr_id) references users(usr_id) on delete cascade

)";

	if(!$result = mysqli_query($conn, $statement)){
		
		echo "\n<p>There was an error creating the Permissions Table";
		echo "Please contact the System Administrator</p>";
		return false;
	} else {
		mysqli_free_result($result);
		echo "\n<p>Permissions Table was created successfully.</p>";
		return true;
	}
}

?>