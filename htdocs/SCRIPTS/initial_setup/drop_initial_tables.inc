<?php
/*
 *  drop_initial_tables.inc
 * 
 *  Created By: William Grove
 *  
 *  Date: 6/17/2016
 * 
 *  Used to drop tables on initial table
 *  creation failure. 
 *  
 *  !!!!!  WARNING  !!!!!
 *  
 *  DO NOT RUN THIS SCRIPT. THIS
 *  SCRIPT IS MEANT FOR THE INITIAL
 *  TABLE CREATION SCRIPT ONLY.
 *  
 *  
 */

/*
	String of letters appended to end of function
	name, helps prevent unintentional calling.
*/
function dropInitialTables_asldkfffignrmsdmsicigfjkdo
($conn){
	
	if(mysqli_query($conn, "DROP TABLE news")== false){
		echo "\nFailed to drop fdg\n";
	}
	
	if(mysqli_query($conn, "DROP TABLE image_slide")== false){
		echo "\nFailed to drop fdg\n";
	}
	
	if(mysqli_query($conn, "DROP TABLE probation_grants") == false){
		echo "\nFailed to drop probation_grants\n";
	}
	
	if(mysqli_query($conn, "DROP TABLE probations")== false){
		echo "\nFailed to drop probations\n";
	}
	
	if(mysqli_query($conn, "DROP TABLE groups")== false){
		echo "\nFailed to drop groups\n";
	}
	
	if(mysqli_query($conn, "DROP TABLE permissions")== false){
		echo "\nFailed to drop permissions\n";
	}
	
	if(mysqli_query($conn, "DROP TABLE capstone")== false){
		echo "\nFailed to drop capstone\n";
	}
	
	if(mysqli_query($conn, "DROP TABLE semesters")== false){
		echo "\nFailed to drop semesters\n";
	}
	
	if(mysqli_query($conn, "DROP TABLE users")== false){
		echo "\nFailed to drop users\n";
	}
	
	if(mysqli_query($conn, "DROP TABLE fdg")== false){
		echo "\nFailed to drop fdg\n";
	}
	
	
	
	return;
}
	

?>