<?php

/*
 * create_news_table.inc
 * 
 * Created By: William Grove
 * 
 * 6/17/2016
 * 
 * Makes sure this script is run after create_image_slides_table.inc
 * 
 */

function createNewsTable($conn){
	
	$statement = 
	
	"create table news(
			
		news_id Integer not null auto_increment,
		
		primary key (news_id),
			
		news_title varchar(40) not null,
			
		news_text varchar(500) not null,
		
		news_date date not null
			
			)";
	
	$result = mysqli_query($conn, $statement);
	
	if($result == false){
		echo "\n<p>There was an error creating the news Table. ";
		echo "Please contact the System Administrator</p>";
	} else {
		return true;
	}
	
	
}

?>