<?php
/**********************************

        tools.php

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

 AddTitle("Tools");

 AddCSS( "all.css" );
 AddCSS( "jquery-ui.min.css");
 AddCSS("tools.css");
 echo "<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css\" integrity=\"sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7\" crossorigin=\"anonymous\">";

 //Optional theme
 echo "<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css\" integrity=\"sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r\" crossorigin=\"anonymous\">";
 AddCSS("jquery.bootgrid.min.css");

 AddCSS("jquery-ui-timepicker-addon.css");

 Body_AddScript( "jquery-1.12.3.min.js" );

 Body_AddScript( "jquery-ui.min.js" );

 Body_AddScript("all.js");

 Body_AddScript("bootstrap.min.js");

 Body_AddScript("jquery.bootgrid.min.js");

 Body_AddScript("moment-with-locales.min.js");

 Body_AddScript("jquery-ui-timepicker-addon.js");

 echo "<script src=\"https://use.fontawesome.com/ac70f8b488.js\"></script>";


 HTML_EndHead();

 HTML_StartBody();

 Body_CreateSideNav();

 Body_CreateHeader( "Tools" );

 Body_CreateStickyNav();
 ?>

<script type="text/javascript">

$(document).ready(function() {
    var menu = $("ul.droopin").menu();
    $(function() {
        $( "#menu" ).menu();
    });
    $(menu).mouseleave(function () {
        menu.menu('collapseAll');
  	});

    const toolsContainer = $('#tools-container');
    toolsContainer.hide();

    $("li[data-linkhtml]").click(function() {
        var pagename = $(this).attr("data-linkhtml");
        $('#tools-container').load('FORMS/' + pagename, undefined, function () {
            toolsContainer.show();
        });
    });

    /*
    setInterval(function() {
        $.ajax({
            type: 'POST',
            url: "SCRIPTS/requests/sessionrequest.php",
            data: {
                'sessionrequest' : '1'
            },
            cache: false,
            dataType: "text",
            success: function(result){
                if(result !== "success"){
                    location.reload(true);
                }

            }
        });

    }, 60 * 1000);
    */
});

</script>

 <?php

 $prefix = false;

 $result = mysqli_query($conn, "SELECT sem_prefix FROM semesters WHERE sem_active = 1");

 if(mysqli_num_rows($result) > 0){

 	$row = mysqli_fetch_row($result);

 	$prefix = $row[0];
 }

 //Create the nav menu

 echo "<div class=\"content_div_in_tools\">\n";
 echo "<div class=\"left\">\n";
 echo "<ul id=\"menu\" class=\"droopin\">\n";

 if($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][5] == 1){

 	echo " <li>CCE's\n";
 	echo "  <ul>\n";
 	echo "  <li>Upperclassmen CCE's\n";
	echo "  <ul>\n";
	echo "   <li data-linkhtml = \"academic_event/add_academic_event.php\">Add CCE</li>\n";
 	echo "   <li data-linkhtml = \"academic_event/update_academic_event.php\">Edit CCE</li>\n";
 	echo "   <li data-linkhtml = \"academic_event_attendance/modify_acad_event_attendance.php\">CCE Attendance</li>\n";
	echo "  </ul>\n";
	echo " </li>\n";
	echo "  <li>Freshman CCE's\n";
	echo "  <ul>\n";
	echo "   <li data-linkhtml = \"fdg/adminfdg.php\">Add Freshman CCE</li>\n";
 		echo "   <li data-linkhtml = \"current_fdgs/modifyfdgactivestatus.php\">Active Freshman CCE's</li>\n";
 		echo "   		<li data-linkhtml = \"fdg_event/modifyfdgevent.php\">Modify CCE's</li>\n";
 		echo "   		<li data-linkhtml = \"fdg_points/fdg_points.php\">FDG Points</li>\n";
 		echo "   <li data-linkhtml = \"fdg_members/fdg_members.php\">Freshman Members</li>\n";
 		echo "   <li data-linkhtml = \"fdg_leaders/modify_fdg_leaders.php\">Freshman Leaders</li>\n";
 	echo "  </ul>\n";
 	echo " </li>\n";
	echo "  </ul>\n";
 	echo " </li>\n";
 }

 $is_leader = false;

 if($prefix !== false){

 	$result = mysqli_query($conn, "Select * from " . $prefix . "_activitygroupleaders where pstu_id = " . $_SESSION["userid"]);

 	if(mysqli_num_rows($result) > 0){
 		$is_leader = true;
 	}

 }







 if($_SESSION["permissions"][0] == 1){

 echo " <li>Admin\n";
 echo "  <ul>\n";
 echo "	  <li data-linkhtml = \"password/admin_password_modify.php\">Change Password</li>\n";
 echo "   <li data-linkhtml = \"permissions/editpermissions.php\">Permissions</li>\n";
 echo "	  <li>Probations\n";
 echo "      <ul>\n";
 echo "   		<li data-linkhtml = \"probations/modifyprobations.php\">Modify Probations</li>\n";
 echo "   		<li data-linkhtml = \"probation_grants/modifyprobationgrants.php\">Grant Probations</li>\n";
 echo "      </ul>\n";
 echo "   </li>\n";
 echo "   <li>Semester\n";
 echo "   	<ul>\n";

 				$result = mysqli_query($conn, "SELECT sem_id FROM semesters WHERE sem_active = 1");

 				if(mysqli_num_rows($result) > 0){
 					echo "   		<li data-linkhtml = \"semesters/endsemester.php\">End Semester</li>\n";
 				} else {
 					echo "   		<li data-linkhtml = \"semesters/startsemester.php\">Start Semester</li>\n";
 				}
  echo "   		<li data-linkhtml = \"semesters/modifysemesters.php\">Modify Semesters</li>\n";

  echo "	</ul>\n";
  echo "  </li>\n";
 echo "  </ul>\n";
 echo " </li>\n";

 }

 if ($_SESSION ["permissions"] [0] == 1) {

 	echo " <li>Capstones\n";
 	echo "  <ul>\n";
 	echo "   <li data-linkhtml = \"capstone/addCapstone.php\">Add Capstone</li>\n";
 	echo "   <li data-linkhtml = \"capstone/confirmCapstone.php\">Approve Capstones</li>\n";
 	echo "   <li data-linkhtml = \"capstone/updateCapstone.php\">Update Capstones</li>\n";
 	echo "  </ul>\n";
 	echo " </li>\n";

 }

 echo " <li>Community Service";
 echo "  <ul>\n";
 echo "   <li data-linkhtml = \"com_serv/com_serv_report.php\">Submit Community Service</li>\n";

 if($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][7] == 1){

 	echo "   <li data-linkhtml = \"com_serv/com_serv_review.php\">Verify Community Service</li>\n";
 	echo "   <li data-linkhtml = \"com_serv/com_serv_update.php\">Modify Comm-Serv Records</li>\n";
 }

 echo "  </ul>\n";
 echo " </li>";

 /**if($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][10] == 1){
 	echo " <li>Events\n";
 	echo "  <ul>\n";
 	echo "   <li data-linkhtml = \"events/add_event.php\">Add Event</li>\n";
 	echo "   <li data-linkhtml = \"events/update_event.php\">Modify Events</li>\n";
 	echo "  </ul>\n";
 	echo " </li>\n";
 }**/

echo " <li>Exemptions\n";
echo "    <ul>\n";
 if($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][4] == 1){

 	echo "      <li data-linkhtml = \"exemptions/verify_exemptions.php\">Verify Exemptions</li>\n";
 	echo " 		<li data-linkhtml = \"exemptions/modify_exemptions.php\">Modify Exemptions</li>\n";
 	echo "      <li data-linkhtml = \"exemption_grants/modify_exemption_grants.php\">Exemption Grants</li>\n";
 } else {
    echo "      <li data-linkhtml = \"exemption_grants/submit_exemption_grants.php\">Submit Exemptions</li>";
 }
echo "    </ul>\n";
echo " </li>\n";



 $is_fdg_leader = false;

 if($prefix !== false){

 	$sql = "SELECT * FROM " . $prefix . "_fdg_leaders where pstu_id = " . $_SESSION["userid"];

 	$result = mysqli_query($conn, $sql);

 	if(mysqli_num_rows($result) > 0){
 		$is_fdg_leader = true;
 	}
 }

 if($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][3] == 1 || $is_fdg_leader){

 	echo "   <li> FDG Reports\n";
 	echo "       <ul>\n";
 	echo "   		<li data-linkhtml = \"fdg_report/fdgaddreport.php\">Add Report</li>\n";
 	echo "   		<li data-linkhtml = \"fdg_report/updatefdgreport.php\">Update Report</li>\n";
 	echo "   		<li data-linkhtml = \"fdg_report_attendance/modifyreportattendance.php\">Report Attendance</li>\n";
 	echo "       </ul>";
 	echo "	  </li>";

 }

 /*
  * Not yet included in final product.
  * Stub left for future work.
  *
 if ($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][4] == 1){

 	echo " <li>Groups\n";
 	echo "  <ul>\n";
 	echo "   <li data-linkhtml = \"semester.php\">Add/Change Group</li>\n";
 	echo "   <li data-linkhtml = \"semester.php\">Edit Group Messages</li>\n";
 	echo "  </ul>\n";
 	echo " </li>\n";

 }
 */

 /*
  * Not yet included in final product.
  * Stub left for future work.
  *
 if($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1){

 	echo " <li data-linkhtml = \"semester.php\">Image Slidese</li>\n";

 }
 */
 if($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][9] == 1){

 	echo "      <li data-linkhtml = \"image/image_slides.php\">Image Slides</li>\n";
 }
 if($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][11] == 1){

 	echo " <li>News\n";
 	echo "    <ul>\n";
 	echo " 		<li data-linkhtml = \"news/addnews.php\">Add Story</li>\n";
 	echo "      <li data-linkhtml = \"news/modifynews.php\">Modify Stories</li>\n";
 	echo "    </ul>\n";
 	echo " </li>\n";
 }


	echo " <li>Password\n";
	echo " 		<ul>\n";
	echo "			<li data-linkhtml = \"password/password_change.php\">Change Password</li>\n";
	echo "		</ul>\n";
	echo " </li>\n";

 if($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][8] == 1){

 	echo " <li>PIF\n";
 	echo "    <ul>\n";
 	echo " 		<li data-linkhtml = \"pif/add_pif.php\">Add PIF</li>\n";
 	echo "      <li data-linkhtml = \"pif/modify_pif.php\">Update PIF</li>\n";
 	echo "      <li data-linkhtml = \"pif_stats/modify_pif_stats.php\">PIF Attendance</li>\n";
 	echo "    </ul>\n";
 	echo " </li>\n";

  }

  if($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][12] == 1){

  	echo " <li data-linkhtml = \"stats/stats_report.php\">Stats</li>\n";

  }

 if($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][2] == 1){

 	echo " <li data-linkhtml = \"current_students/modifycurrentstudents.php\">Students</li>\n";

 }

 if($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][2] == 1){

 	echo " <li>Users\n";
 	echo "  <ul>\n";
 	echo "   <li data-linkhtml = \"users/addUser.php\">Add User</li>\n";
 	echo "   <li data-linkhtml = \"users/updateUser.php\">Edit User</li>\n";
 	echo "   <li  data-linkhtml = \"users/deleteUser.php\">Delete User</li>\n";
 	echo "  </ul>\n";
 	echo " </li>\n ";

 }

 echo "</ul>\n";
 echo "</div>\n";
 echo "<div class=\"right\" id=\"right\">\n";

 ?>

<div id="tools-container">
 <div id="message_container">
<div id="success_box" class="alert_box success">
<h1 class="alert_text success_text">
</h1>
</div>
<div id="failure_box" class="alert_box failure">
<h1 class="alert_text failure_text" id="text_failure">
</h1>
</div>
</div>
</div>

 <?php
 echo "</div>\n";

 HTML_End();

?>

