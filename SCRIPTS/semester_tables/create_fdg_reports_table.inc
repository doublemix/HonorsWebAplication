<?php
/*

create_fdg_reports_table.inc

Created By: William Grove

6/15/2016

Please make sure this the first table script
is run after create_fdg_members_table.inc

*/


function createFDGReportsTable($conn, $prefix){

	$statement =

	"create table " . $prefix . "_fdg_reports (

pfdg_report_id integer not null auto_increment,

primary key (pfdg_report_id),

pfdg_id integer not null,

pfdg_report_start_date datetime not null,

pfdg_report_end_date datetime not null,			
			
pfdg_report_hours Decimal(5,1),

pfdg_report_description varchar(500),

foreign key (pfdg_id) references " . $prefix . "_fdg(pfdg_id)   on delete cascade

) ENGINE = INNODB";

	$result = mysqli_query($conn, $statement);
	
if($result == false){
		
		echo "There was an error creating the " . $prefix ."_fdg_reports Table.";
		echo "Please contact the System Administrator.";
		return false;
	} else {
		return true;
	}
}

?>



