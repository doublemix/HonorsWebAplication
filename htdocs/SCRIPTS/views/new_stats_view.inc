<?php 

function createStatsView($conn, $prefix){

$sql = "CREATE VIEW $prefix" . "_stats 
			AS SELECT 
			a.usr_fname AS \"usr_fname\", 
			a.usr_lname AS \"usr_lname\", 
			a.usr_school_id AS \"usr_school_id\",
			a.usr_id AS \"usr_id\",
			(
				(SELECT count(pifstat_id) from 
				$prefix"."_pif_stats 
				where pstu_id = a.usr_id
				)
				+
				(SELECT count(acad_att_id) from 
				$prefix"."_academicevent_attendence 
				where pstu_id = a.usr_id
				) 
				+
				IFNULL((SELECT sum(excptn_value) 
					FROM $prefix"."_exceptions 
					JOIN $prefix"."_exception_grants USING(excptn_id) 
					WHERE pstu_id = a.usr_id AND excptn_type = 2
				), 0)  
				-
				IFNULL((SELECT sum(probation_grant_requirement)
					FROM probation_grants
					JOIN probations USING(probation_id) 
					where probation_type = 1
					AND usr_id = a.usr_id
				), 0)
			)			
				AS \"acad_events\",
				(
				(SELECT count(agstat_id) from 
				$prefix"."_activitygroupstats 
				where pstu_id = a.usr_id
				)  + 
				IFNULL((SELECT sum(excptn_value) 
					FROM $prefix"."_exceptions 
					JOIN $prefix"."_exception_grants USING(excptn_id) 
					WHERE pstu_id = a.usr_id AND excptn_type = 1), 0) - 
				IFNULL((SELECT sum(probation_grant_requirement)
					FROM probation_grants
					JOIN probations USING(probation_id) 
					where probation_type = 0
					AND usr_id = a.usr_id), 0)
				)			
				AS \"ags\",			
				(
				IFNULL((SELECT sum(com_hours) from 
				$prefix"."_com_serv 
				where pstu_id = a.usr_id 
				AND com_verified = 2
				), 0) + 
				IFNULL((SELECT sum(excptn_value) 
					FROM $prefix"."_exceptions 
					JOIN $prefix"."_exception_grants USING(excptn_id) 
					WHERE pstu_id = a.usr_id AND excptn_type = 3), 0) - 
				IFNULL((SELECT sum(probation_grant_requirement)
					FROM probation_grants
					JOIN probations USING(probation_id) 
					where probation_type = 2
					AND usr_id = a.usr_id), 0)
				)			
				AS \"com_hours\",				
				
				(SELECT count(pifstat_id) from 
				$prefix"."_pif_stats 
				where pstu_id = a.usr_id
				) AS \"pifs\",			
				(
				(SELECT count(pfdg_att_id) from 
				$prefix"."_fdg_attendence 
				where pstu_id = a.usr_id
				) + 
				IFNULL((SELECT sum(excptn_value) 
					FROM $prefix"."_exceptions 
					JOIN $prefix"."_exception_grants USING(excptn_id) 
					WHERE pstu_id = a.usr_id AND excptn_type = 4), 0)
				) 
				AS \"fdg\",
				
				(Select count(capstone_id) 
				 FROM capstone 
				 Where 
					 usr_id = a.usr_id 
					 AND capstone_complete = 1) AS \"capstone\"
				
				FROM users a";

				if(!$result = mysqli_query($conn, $sql)){
				
					echo "\n<p>There was an error creating the Stats View";
					echo "Please contact the System Administrator</p>";
					return false;
				} else {
					mysqli_free_result($result);
					echo "\n<p>Stats View was created successfully.</p>";
					return true;
				}	
				
}

?>
