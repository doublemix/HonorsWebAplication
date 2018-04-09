<?php
/**********************************

        calendar.php

        Created By: William Grove
        On Behalf of Lock Haven's
        GHP.

**********************************/

session_start();

require_once ('template.inc');
require_once "SCRIPTS/get_permissions.inc";
require_once 'SCRIPTS/db_connect.inc';

$conn = DBConnect();





 HTML_StartHead();

 AddTitle("Calendar");

 //CSS


 //AddCSS( "bootstrap.min.css");
  AddCSS( "jquery-ui.min.css");
 AddCSS("fullcalendar.min.css");

//AddCSS("fullcalendar.print.css");

 AddCSS("bootstrap-fullcalendar.css");
 AddCSS( "all.css" );
AddCSS( "index.css" );


  //JavaScript

 HTML_EndHead();

 HTML_StartBody();

 Body_CreateSideNav();

 Body_CreateHeader( "Calendar" );

 Body_CreateStickyNav();
 Body_AddScript( "jquery-1.12.3.min.js" );
 ?>

 <script type="text/javascript">

 $(document).ready(function() {


	    $('#calendar').fullCalendar({
			theme: true,
			header: {
			left: 'prev,next today',
			center : 'title',
			right: 'month,agendaWeek,agendaDay'
			},
	        eventSources: [<?php

				require_once 'SCRIPTS/db_connect.inc';

				$conn = DBConnect();

				$query = "SELECT sem_prefix FROM semesters Order By sem_id desc LIMIT 1";

				$result = mysqli_query($conn, $query);

				if($result !== false){

				$row = mysqli_fetch_row($result);

				$prefix = $row[0];
				 //                0     1     2       3           4           5        6
				$query = "SELECT start, end, title, back_color, font_color, event_id, `group` FROM $prefix" . "_dates";

				$result = mysqli_query($conn, $query);

                if ($result === false) {
                    echo mysqli_error($conn);
                }

				$count = 0;

				while($row = mysqli_fetch_row($result)){

					if($count != 0){
						echo ",";
					}


					echo "{\n";
					echo "	events: [ \n";
					echo "	{\n";
					echo "title : '" . $row[2] . "',\n";
					echo "start : '" . $row[0] . "',\n";
					echo "end : '" . $row[1] . "',\n";
                    if (((int) $row[5]) === 5) {
                        echo "url: '/event.php?type=" . urlencode($row[5]) . "&id=" . urlencode($row[6]) . "',\n";
                    }
					echo "	}\n";
					echo "	],\n";
					echo "color: '" . $row[3] . "',\n";
					echo "textColor: '" . $row[4] . "',\n";
					echo "}";

					$count++;
				}

				}

				?>]
	    })

	});

 </script>

<div id='calendar'></div>


 <?php
 echo "</div>\n";




 Body_AddScript("bootstrap.min.js");
 Body_AddScript( "jquery-ui.min.js" );
 Body_AddScript("moment-with-locales.min.js");

 Body_AddScript("fullcalendar.min.js");
  Body_AddScript("all.js");

 HTML_End();

?>
