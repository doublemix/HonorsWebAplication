<?php

function createDatesView($conn, $prefix){
	
	$sql = "CREATE VIEW $prefix" . "_dates 
			AS
				SELECT 
					pif_start_date AS \"start\", 
					pif_end_date AS \"end\", 
					pif_title AS \"title\", 
					1 AS \"event_id\",
					pif_id AS \"group\",
					pif_bg_color AS \"back_color\",
					pif_ft_color AS \"font_color\"
					
				FROM 
					$prefix" . "_pif
			UNION All
				SELECT
					pfdg_report_start_date AS \"start\",
					pfdg_report_end_date AS \"end\",
					fdg_name AS \"title\",
					2 AS \"event_id\",
					fdg_id AS \"group\",
					fdg_bg_color AS \"back_color\",
					fdg_ft_color AS \"font_color\" 
				FROM 
						$prefix" . "_fdg_reports
					JOIN
						fdg
					ON (pfdg_id = fdg_id)
			UNION All
				SELECT
					agses_start_time AS \"start\",
					agses_end_time AS \"end\",
					ag_title AS \"title\",
					3 AS \"event_id\",
					ag_id AS \"group\",
					ag_bg_color AS \"back_color\",
					ag_ft_color AS \"font_color\"
				FROM
						$prefix" . "_activitygroupsession
					Join
						$prefix" . "_activitygroup
					USING(ag_id)
			UNION All 
				SELECT 
					event_start_date AS \"start\", 
					event_end_date AS \"end\", 
					event_title AS \"title\", 
					4 AS \"event_id\", 
					event_id AS \"group\", 
					event_bg_color AS \"back_color\", 
					event_ft_color AS \"font_color\" 
				From 
					$prefix" . "_events
			UNION All 
				SELECT 
					acad_start_date AS \"start\", 
					acad_end_date AS \"end\", 
					acad_title AS \"title\", 
					5 AS \"event_id\", 
					acad_id AS \"group\", 
					acad_bg_color AS \"back_color\", 
					acad_ft_color AS \"font_color\" 
				From 
					$prefix" . "_academicevents
			UNION ALL
				SELECT
					pfdg_start_date AS \"start\",
					pfdg_end_date AS \"end\",
					pfdg_event_name AS \"title\",
					6 AS \"event_id\",
					pfdg_event_id AS \"group\",
					pfdg_event_bg_color AS \"back_color\",
					pfdg_event_ft_color AS \"font_color\"
				From
					$prefix" . "_fdg_event
			";
	
					if(!$result = mysqli_query($conn, $sql)){
					
						echo "\n<p>There was an error creating the Events View";
						echo "Please contact the System Administrator</p>";
						return false;
					} else {
						mysqli_free_result($result);
						echo "\n<p>Events View was created successfully.</p>";
						return true;
					}
	
}


?>