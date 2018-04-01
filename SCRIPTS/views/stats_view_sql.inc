<?php
/*

stats_view_sql.inc

Created By: William Grove

6/15/2016

Please make sure this script is run after
Other tables have been completed successfully.

Requires All Tables to be completed first.

*/


function createCurrentStudentStatView($prefix, $conn){

$statement = 

"Create or Replace View " . $prefix . "_pstu_stats_view As

Select " . $prefix . "_currentstudents.pstu_id,
	   users.usr_username,
	   users.usr_fname,
	   users.usr_lname,
	   users.usr_school_id,
	   users.usr_school_email,
			(Select sum(" . $prefix . "_activitygroupstats.agstat_points) 
			 From " . $prefix . "_activitygroupstats
			 Where " . $prefix . "_currentstudents.pstu_id = 
				   " . $prefix . "_activitygroupstats.pstu_id
			
			) 
		As Activity_Groups,
			(Select Count(" . $prefix . "_academicevent_attendence.acad_att_id) 
			 From " . $prefix . "_academicevent_attendence
			 Where " . $prefix . "_currentstudents.pstu_id = 
				   " . $prefix . "_academicevent_attendence.pstu_id
			
			) 
		As Academic_Events,
			(Select sum(" . $prefix . "_com_serv.com_hours) From " . $prefix . "_com_serv
			 Where 
				   " . $prefix . "_currentstudents.pstu_id =
			       " . $prefix . "_com_serv.pstu_id
			 AND
				   " . $prefix . "_com_serv.com_verified = 2
			
			)
		As Community_Servcie,
			(Select sum(" . $prefix . "_fdg_reports.pfdg_report_hours)
			From " . $prefix . "_fdg_reports
				 Left Join
				 " . $prefix . "_fdg_attendence
				 On " . $prefix . "_fdg_reports.pfdg_report_id = " . $prefix . "_fdg_attendence.pfdg_report_id
			Where 
				 " . $prefix . "_currentstudents.pstu_id =
				 " . $prefix . "_fdg_attendence.pstu_id
			)
		As FDG_Hours
		
	From " . $prefix . "_currentstudents
		 Left Join
		 users
		 ON " . $prefix . "_currentstudents.pstu_id =
			users.usr_id";
			
	if(!$result = $conn->query($statement)){
		$result->free();
		echo "<p>There was an error creating the " . $prefix . "_pstu_stats_view View.";
		echo "Please contact the System Administrator</p>";
		return false;
	} else {
		$result->free();
		echo "<p>". $prefix . "_pstu_stats_view View was created successfully.</p>";
		return true;
	}
}
?>			