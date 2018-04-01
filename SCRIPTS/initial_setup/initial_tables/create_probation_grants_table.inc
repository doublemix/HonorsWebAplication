<?php
/*

create_probation_grants_table.inc

Created By: William Grove

6/15/2016

Please make sure this script is run after create_probation_table.inc

*/


function createProbationGrantsTable($conn){

	$statement =

	"create table probation_grants(
			
probation_grant_id Integer not null auto_increment,

primary key (probation_grant_id),
			
probation_id Integer not null,
			
usr_id Integer Not Null,
			
probation_grant_requirement Decimal(5,1) not null,

foreign key (probation_id) references probations(probation_id)  on delete cascade,
			
foreign key (usr_id) references users(usr_id)  on delete cascade,

UNIQUE KEY one_probation (probation_id, usr_id)			
			
)";

	if(!$result = mysqli_query($conn, $statement)){
		
		echo "\n<p>There was an error creating the Probation_Grants Tbale.";
		echo "Please contact the System Administrator</p>";
		return false;
	} else {
		mysqli_free_result($result);
		echo "\n<p>Probation_Grants Table was created successfully.</p>";
		return true;
	}
}

?>

