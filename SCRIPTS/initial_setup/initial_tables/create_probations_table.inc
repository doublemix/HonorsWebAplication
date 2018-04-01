<?php
/*

create_probations_table.inc

Created By: William Grove

6/15/2016

Please make sure this script is run after create_groups_table.inc

*/


function createProbationsTable($conn){

	$statement =

	"create table probations(

probation_id Integer not null auto_increment,

primary key (probation_id),

probation_name VARCHAR(60) not null,
probation_type Integer not null,


Unique (probation_name)

)";

	if(!$result = mysqli_query($conn, $statement)){
		
		echo "\n<p>There was an error creating the Probations Tbale.";
		echo "Please contact the System Administrator</p>";
		return false;
	} else {
		mysqli_free_result($result);
		echo "\n<p>Probations Table was created successfully.</p>";
		return true;
	}
}

?>
