<?php

/*
 * create_image_slide_table.inc
 * 
 * Created By: William Grove
 * 
 * 6/17/2016
 * 
 * Makes sure this script is run after create_grant_probations_table.inc
 * 
 */

function createImageSlideTable($conn){
	
	$statement = 
	
	"create table image_slide(
			
		slide_id Integer not null auto_increment,
		
		primary key (slide_id),
			
		slide_name varchar(50) not null,
			
		slide_text varchar(60) not null,
		
		slide_imagename varchar(60) not null,
			
		slide_isactive Integer not null default 2,
			
		slide_pos Integer not null default 0,
			
		unique(slide_imagename)
			)";
	
	$result = mysqli_query($conn, $statement);
	
	if($result == false){
		echo "\n<p>There was an error creating the image_slide Table. ";
		echo "Please contact the System Administrator</p>";
	} else {
		return true;
	}
	
	
}

?>