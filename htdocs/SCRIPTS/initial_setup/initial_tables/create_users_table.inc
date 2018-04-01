<?php
/*

create_users_table.inc

Created By: William Grove

6/15/2016

Please make sure this script is run after
the create_fdg_table.inc script

Requires All Tables to be completed first.

*/

/*
 * User Statuses:
 *
 * 1 - Admin
 * 2 - Student
 * 3 - Graduate
 * 4 - Inactive
 * 5 - Professor
 * 6 - Removed From Program
 *
 */

/*
 * User Education:
 * 1 - Freshman
 * 2 - Sophomore
 * 3 - Junior
 * 4 - Seniors+
 * 5 - Professor
 * 6 - Admin
 */

function createUsersTable($conn){

$statement = 

"create table users (

usr_id Integer not null auto_increment,

primary key (usr_id),

usr_username varchar(15) not null,

usr_fname varchar(20) not null,

usr_lname varchar(35) not null,

usr_school_id varchar(4) not null,

usr_school_email varchar(60) not null,

usr_perm_email varchar(60),

usr_status integer not null,

usr_education Integer not null,

usr_imagepath varchar(30),

usr_password varchar(80) not null,

unique(usr_username),

unique(usr_school_id),
		
unique(usr_school_email)

)";
			
	if(!$result = mysqli_query($conn, $statement)){
		
		echo "\n<p>There was an error creating the Users Table.";
		echo "Please contact the System Administrator</p>";
		return false;
	} else {
		mysqli_free_result($result);
		echo "\n<p>Users Table was created successfully.</p>";
		return true;
	}
}
?>			