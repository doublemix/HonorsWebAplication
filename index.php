<?php
/*
 *  index.php
 *
 *  Created By: William Grove
 *  For the Global Honors Program at
 *  Lock Haven University of Pennsylvania
 *
 *  Created On: 5/16/2016
 *
 */
 session_start();
 require_once ('template.inc');

 require_once 'SCRIPTS/db_connect.inc';

 HTML_StartHead();

 AddTitle("Home");

 AddCSS( "all.css" );
 AddCSS( "index.css" );

 HTML_EndHead();

 HTML_StartBody();

 Body_CreateSideNav();

 Body_CreateHeader( "Welcome to the GHP!" );

 Body_CreateStickyNav();

 $conn = DBConnect();
?>

<div class="content-table">
<div class="Row">





<?php



?>

<div class="cycle-slideshow" data-cycle-auto-height="1:1">
<div class="cycle-overlay increase_index"></div><?php

$query = "SELECT slide_name, slide_text, slide_imagename FROM image_slide WHERE slide_isactive = 1 ORDER BY slide_pos";

$result = mysqli_query($conn, $query);

if(mysqli_num_rows($result) > 0){

	while($row = mysqli_fetch_row($result)){
		echo "<img src=\"IMG/slides/" . $row[2] . "\" data-cycle-title=\"" . $row[0] . "\" data-cycle-desc=\"" . $row[1] . "\">";
	}

} else {
	echo "<img src=\"IMG/none/none.jpg\" data-cycle-title=\"No Slides\" data-cycle-desc=\"No slides are set for display\">";
}

?></div> <!-- .cycle-slideshow -->

<div class="dates">
<div class="dates-table-wrapper">
<div class="dates-table">
<div class="dates-table-row">
<div class="dates-table-cell">
<span class="heading_text">Events</span>
</div> <!-- .dates-table-cell -->
</div> <!-- .dates-table-row -->

<?php

$result = mysqli_query($conn, "SELECT sem_prefix FROM semesters ORDER BY sem_id desc LIMIT 1");

if(mysqli_num_rows($result) > 0){

	$row = mysqli_fetch_row($result);

	$prefix = $row[0];

	$resultTwo = mysqli_query($conn, "SELECT title, DATE_FORMAT(start, '%W, %M %D, %Y - %l:%i %p') FROM $prefix"."_dates where start > NOW() AND event_id NOT IN (2, 6) Order BY start LIMIT 5");

	if($resultTwo === false || mysqli_num_rows($resultTwo) < 1){


		echo "<div class=\"dates-table-row\">\n";
		echo "<div class=\"dates-table-cell\">\n";
		echo "<h5>No Dates Available</h5>\n";
		echo "</div>\n"; // </div.dates-table-cell>
		echo "</div>\n"; // </div.dates-table-row>

	} else {

		while($row = mysqli_fetch_row($resultTwo)){

			echo "<div class=\"dates-table-row\">\n";
			echo "<div class=\"dates-table-cell\">\n";
			echo "<h5>" . $row[0] . "</h5>\n";

			echo "<p class=\"story\">" . $row[1] . "</p>\n";
			echo "</div>\n"; // </div.dates-table-cell>
			echo "</div>\n"; // </div.dates-table-row>
		}


	}
} else {
	echo "<div class=\"dates-table-row\">\n";
	echo "<div class=\"dates-table-cell\">\n";
	echo "<h5>No Dates Available</h5>\n";
	echo "</div>\n"; // </div.dates-table-cell>
	echo "</div>\n"; // </div.dates-table-row>

}


?>

</div> <!-- .dates-table -->
</div> <!-- .dates-table-wrapper -->
</div> <!-- .dates -->
</div> <!-- .Row -->
</div> <!-- .content-table -->

<?php

 Body_AddScript( "jquery-1.12.3.min.js" );
 Body_AddScript( "jquery.cycle2.min.js" );
 Body_AddScript( "bootstrap.min.js" );
 Body_AddScript( "all.js" );




 HTML_End();
?>