<?php
/**********************************

        stats.php

        Created By: William Grove
        On Behalf of Lock Haven's
        GHP.

**********************************/

session_start();

require ('template.inc');
require_once "SCRIPTS/get_permissions.inc";
require_once 'SCRIPTS/db_connect.inc';

$conn = DBConnect();
getPermissions($conn);


if(!isset($_SESSION["userid"])){
header("location: index.php");
}



 HTML_StartHead();

 AddTitle("Stats");
 
 AddCSS( "all.css" );
 AddCSS( "stats.css");
 AddCSS( "jquery-ui.min.css");

 
 //Optional theme
 

 
 Body_AddScript( "jquery-1.12.3.min.js" );
 
 Body_AddScript( "jquery-ui.min.js" );
  
 Body_AddScript("all.js");

 
 HTML_EndHead();
 
 HTML_StartBody();
 
 Body_CreateSideNav();
 
 Body_CreateHeader( "Stats" );
 
 Body_CreateStickyNav();
 ?><div id="outer" style="width:100%">  
  <div id="inner"><h2>Stats For: <?php 
  
  $result = mysqli_query($conn, "SELECT usr_school_id FROM users WHERE usr_id = " . $_SESSION["userid"]);
  
  $row = mysqli_fetch_row($result);
  
  echo $_SESSION["name"] . " - " . $row[0]; 
  
  ?></h2> </div>
  </div>
 
 <ul class="statlist"><?php 
 
 
 
 $result = mysqli_query($conn, "SELECT sem_prefix, carry_over_fdg, carry_over_com_serv FROM semesters Order BY sem_id desc LIMIT 1");
 
 if(mysqli_num_rows($result) < 1){
 	die();
 }
 
 $row = mysqli_fetch_row($result);
 
 $prefix = $row[0];
 $fdg = intval($row[1]);
 $com_serv = intval($row[1]);
 
 //acad_events | ags   | com_hours | pifs | fdg  | capstone 
 $result = mysqli_query($conn, "SELECT acad_events, ags, com_hours, pifs, fdg FROM $prefix"."_stats WHERE usr_id = " . $_SESSION["userid"]);
 
 $stats = mysqli_fetch_row($result);
 
 $result = mysqli_query($conn, "SELECT * FROM $prefix"."_currentstudents WHERE pstu_id = " . $_SESSION["userid"]);
 
 if(mysqli_num_rows($result) < 1){
 	die();
 }
 
 $result = mysqli_query($conn, "SELECT usr_education FROM users WHERE usr_id = " . $_SESSION["userid"]);
 $row = mysqli_fetch_row($result);
 
 $freshman = intval($row[0]);
 
 $ae_requirements = 0;
 $ag_requirements = 10;
 $com_hours_requirements = 0;
 $pif_requirements = 0;
 $fdg_requirements = 0;
 
 	//Academic event requirement
 	if($freshman == 1){
 		$ae_requirements = 4;
 	} else {
 		$ae_requirements = 2;
 	}
 	
 	//Community Service Requirements
 	if($com_serv == 1){
 		$com_hours_requirements = 10;
 	}
 	
 	//Pif Requirements 
 	if($freshman == 1){
 		$pif_requirements = 1;
 	}
 	
 	//FDG Requirements
 	if($freshman == 1){
 		if($fdg == 1){
 			$fdg_requirements = 22;
 		} else {
 			$fdg_requirements = 12;
 		}
 	}
 	
 	$pass = true;
 	
 	if($stats[0] < $ae_requirements){
 	$pass = false;
 	}
 	
 	if($stats[1] < $ag_requirements){
 	$pass = false;
 	}
 	
 	if($stats[2] < $com_hours_requirements){
 	$pass = false;
 	}
 	
 	if($stats[3] < $pif_requirements){
 	$pass = false;
 	}
 	
 	if($stats[4] < $fdg_requirements){
 	$pass = false;
 	}
 
 	echo "<li>Requirements met: ";
 	if($pass == true){
 		echo "Yes";
 	} else {
 		echo "No";
 	}
 	echo "</li>";
 
 $sql = "SELECT acad_title as title, DATE_FORMAT(acad_start_date, '%m/%d/%Y %l:%i %p' ) as datelo FROM $prefix"."_academicevents JOIN $prefix" . "_academicevent_attendence USING(acad_id) WHERE pstu_id = " . $_SESSION["userid"] . " UNION ALL SELECT CONCAT('PIF: - ', pif_title) as title, DATE_FORMAT(pif_start_date, '%m/%d/%Y %l:%i %p' ) as datelo FROM $prefix" . "_pif JOIN $prefix" . "_pif_stats WHERE pstu_id = " . $_SESSION["userid"];
  
 $result = mysqli_query($conn, $sql);

 echo "<li>Academic Events : " . $stats[0];
 
 echo "<ul>";
 
 while($row = mysqli_fetch_row($result)){
 	echo"<li>" . $row[0] . " - " . $row[1] . "</li>";
 }
 
 echo "</ul>";
 
 echo "</li>";
 
 $result = mysqli_query($conn, "SELECT ag_title, DATE_FORMAT(agses_start_time, '%m/%d/%Y %l:%i %p' ) FROM $prefix" . "_activitygroup JOIN $prefix" . "_activitygroupsession USING(ag_id) JOIN $prefix"."_activitygroupstats USING(agses_id) WHERE pstu_id = ". $_SESSION["userid"]);
 
 echo "<li>Activity Group : " . $stats[1];
 
 echo "<ul>";
 
 while($row = mysqli_fetch_row($result)){
 	echo"<li>" . $row[0] . " - " . $row[1] . "</li>";
 }
 
 echo "</ul>";
 
 echo "</li>";
 

 
 echo "<li>Community Service : " . $stats[2];
 
 $result = mysqli_query($conn, "SELECT com_title, DATE_FORMAT(com_date, '%m/%d/%Y' ), com_hours FROM $prefix" . "_com_serv WHERE pstu_id = ". $_SESSION["userid"] . " AND com_verified = 2");
 
 echo "<ul>";
 
 while($row = mysqli_fetch_row($result)){
 	echo"<li>" . $row[0] . " - " . $row[1] . ", " . $row[2] . " Hour(s)</li>";
 }
 
 echo "</ul>";
 
 echo "</li>";
 
 $result = mysqli_query($conn, "SELECT * from users where usr_education = 1 AND usr_status = 2 AND usr_id = " . $_SESSION["userid"]);
 
 if(mysqli_num_rows($result) > 0){
 	
 	$resultTwo = mysqli_query($conn, "SELECT pif_title, DATE_FORMAT(pif_start_date, '%m/%d/%Y %l:%i %p' ) FROM $prefix" . "_pif JOIN $prefix" . "_pif_stats WHERE pstu_id = " . $_SESSION["userid"]);
 	
 	echo "<li>PIFs : " . $stats[3];
 	
 	echo "<ul>";
 	
 	while($row = mysqli_fetch_row($resultTwo)){
 		echo"<li>" . $row[0] . " - " . $row[1] . "</li>";
 	}
 	
 	echo "</ul>";
 	
 	echo "</li>";
 	
 	$resultTwo = mysqli_query($conn, "SELECT fdg_name, DATE_FORMAT(pfdg_report_start_date, '%m/%d/%Y %l:%i %p' ) FROM $prefix" . "_fdg_reports JOIN $prefix"."_fdg_attendence USING(pfdg_report_id) JOIN fdg ON(pfdg_id = fdg_id) WHERE pstu_id = " . $_SESSION["userid"]);
 	
 	echo "<li>FDG Groups : " . $stats[4];
 	
 	echo "<ul>";
 	
 	while($row = mysqli_fetch_row($resultTwo)){
 		echo"<li>" . $row[0] . " - " . $row[1] . "</li>";
 	}
 	
 	echo "</ul>";
 	
 	echo "</li>";
 }
 
 $result = mysqli_query($conn, "SELECT capstone_name, capstone_enddate FROM capstone WHERE capstone_complete = 1 AND usr_id = " . $_SESSION["userid"]);
 
 if(mysqli_num_rows($result) > 0){
 	echo "<li>Capstone";
 	
 	echo "<ul>";
 	
 	while($row = mysqli_fetch_row($result)){
 		echo"<li>" . $row[0] . " - " . $row[1] . "</li>";
 	}
 	
 	echo "</ul>";
 	
 	echo "</li>";
 	
 }
 
 $case = "CASE ";
 $case .=    "WHEN excptn_type = 1 THEN 'Activity Group' ";
 $case .=    "WHEN excptn_type = 4 THEN 'FDG Groups' ";
 $case .=	"WHEN excptn_type = 3 THEN 'Community Service' ";
 $case .=	"WHEN excptn_type = 2 THEN 'Academic Events' ";
 $case .=   "ELSE 'Unknown' ";
 $case .=   "END";
 
 $result = mysqli_query($conn, "SELECT excptn_name, excptn_value, ($case) FROM $prefix"."_exceptions JOIN $prefix"."_exception_grants USING(excptn_id) WHERE pstu_id = " . $_SESSION["userid"]);
 
 if(mysqli_num_rows($result) > 0){
 	echo "<li>Exemptions";
 
 	echo "<ul>";
 
 	while($row = mysqli_fetch_row($result)){
 		echo"<li>" . $row[0] . " - " . $row[2] . " = " . $row[1] . "</li>";
 	}
 
 	echo "</ul>";
 
 	echo "</li>";
 
 }
 
 $case = "CASE ";
 $case .=    "WHEN probation_type = 3 THEN 'Academic' ";
 $case .=    "WHEN probation_type = 0 THEN 'Activity Groups' ";
 $case .=	"WHEN probation_type = 2 THEN 'Community Service' ";
 $case .=	"WHEN probation_type = 1 THEN 'Academic Events' ";
 $case .=	"WHEN probation_type = 5 THEN 'Behavioral' ";
 $case .=	"WHEN probation_type = 4 THEN 'Honors Credits' ";
 $case .=   "ELSE 'Unknown' ";
 $case .=   "END";
 $result = mysqli_query($conn, "SELECT probation_name, probation_grant_requirement, ($case) FROM probations JOIN probation_grants USING(probation_id) WHERE usr_id = " . $_SESSION["userid"]);
 
 if(mysqli_num_rows($result) > 0){
 	echo "<li>Probations";
 
 	echo "<ul>";
 
 	while($row = mysqli_fetch_row($result)){
 		echo"<li>" . $row[0] . "</li>";
 	}
 
 	echo "</ul>";
 
 	echo "</li>";
 
 }
 
 
 ?></ul>
 
 <?php 
 
 HTML_End();
 
 ?>