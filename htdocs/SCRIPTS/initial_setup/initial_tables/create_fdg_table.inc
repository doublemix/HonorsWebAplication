<?php
/*

create_fdg_table.inc

Created By: William Grove

6/15/2016

Please make sure this script is run first.

*/


function createFDGTable($conn){

$statement = 

	"create table fdg(

fdg_id integer not null auto_increment,

primary key (fdg_id),

fdg_name varchar(25) not null,

fdg_imagepath varchar(60),
		
fdg_bg_color varchar(7) default '#0000ff',

fdg_ft_color varchar(7) default '#ffffff',
		
unique(fdg_name)

)";
if(!$result = mysqli_query($conn, $statement)){
		
		echo "\n<p>There was an error creating the FDG Table";
		echo "Please contact the System Administrator</p>";
		return false;
	} else {
		mysqli_free_result($result);
		echo "\n<p>FDG Table was created successfully.</p>";
		return true;
	}
}		

?>