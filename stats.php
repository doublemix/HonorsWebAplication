<?php
/**********************************

        stats.php

        Created By: William Grove
        Modified By: Mitchel Myers
        On Behalf of Lock Haven's
        GHP.

**********************************/

session_start();

require ('template.inc');
require_once "SCRIPTS/get_permissions.inc";
require_once 'SCRIPTS/db_utils.php';

function generateList($source, $itemCallback, $empty = null) {
    $isEmpty = count($source) === 0;

    if (!$isEmpty || !is_null($empty)) {
        echo "<ul class='stats-card-inset-shadow'>";
        if ($isEmpty && !is_null($empty)) {
            echo "<li>$empty</li>";
        }
        foreach ($source as $item) {
            $itemSrc = $itemCallback($item);
            echo "<li>$itemSrc</li>";
        }
        echo "</ul>";
    }
}

function generateCase($field, $map, $default = 'Unknown') {
    $case = "CASE $field ";
    foreach ($map as $key => $value) {
        $case .= "WHEN '$key' THEN '$value' ";
    }
    $case .= "ELSE '$default' END";
    return $case;
}

if (!getPermissions($conn)) {
    header("location: index.php");
    exit();
}

if (hasPermission(PERM_ADMIN)) {
    header("location: index.php");
    exit();
}

if(!isset($_SESSION["userid"])){
    header("location: index.php");
    exit();
}

$userId = $_SESSION["userid"];

$studentSchoolId = DB_executeAndFetchOne("SELECT usr_school_id FROM users WHERE usr_id = " . $_SESSION["userid"])["usr_school_id"];

$semester = DB_executeAndFetchOne("SELECT sem_prefix, carry_over_fdg, carry_over_com_serv FROM semesters Order BY sem_id desc LIMIT 1");
if (!$semester) {
    header("location: index.php");
    exit();
}

$prefix = $semester["sem_prefix"];
$fdg = intval($semester["carry_over_fdg"]);
$com_serv = intval($semester["carry_over_com_serv"]);

$statsTable = DB_getPrefixedTable("stats");
//acad_events | ags   | com_hours | pifs | fdg  | capstone
$stats = DB_executeAndFetchOne("SELECT acad_events, ags, com_hours, pifs, fdg FROM $statsTable WHERE usr_id = $userId LIMIT 1");

if (!$stats) {
    header("location: index.php");
    exit();
}

$studentsTable = DB_getPrefixedTable("currentstudents");
$student = Db_executeAndFetchOne("SELECT * FROM $studentsTable WHERE pstu_id = $userId LIMIT 1");

if(!$student){
    header("location: index.php");
    die();
}

$user = DB_executeAndFetchOne("SELECT usr_education FROM users WHERE usr_id = $userId LIMIT 1");

$isFreshman = intval($user["usr_education"]) === 1;

// TODO find a way to read these from the database rather than hardcoded
$cceRequirements = 5;
$comHoursRequirements = 10;
$comRequiredThisSemester = false;
$pifRequirements = 0;
$fdgRequirements = 0;

//Community Service Requirements
if($com_serv == 1){
    $comHoursRequirements = 10;
    $comRequiredThisSemester = true;
}

//Pif Requirements
if($isFreshman == 1){
    $pifRequirements = 1;
}

//FDG Requirements
if($isFreshman){
    if($fdg == 1){
        $fdgRequirements = 22;
    } else {
        $fdgRequirements = 12;
    }
}

$pass = true;

if($stats["acad_events"] < $cceRequirements){
    $pass = false;
}

if($comRequiredThisSemester && $stats["com_hours"] < $comHoursRequirements){
    $pass = false;
}

if($stats["pifs"] < $pifRequirements){
    $pass = false;
}

if($stats["fdg"] < $fdgRequirements){
    $pass = false;
}

$academiceventsTable = DB_getPrefixedTable("academicevents");
$academiceventAttendanceTable = DB_getPrefixedTable("academicevent_attendence");
$pifTable = DB_getPrefixedTable("pif");
$pifStatsTable = DB_getPrefixedTable("pif_stats");
$attendedEvents = DB_executeAndFetchAll(
    "SELECT acad_title as title, "
    . "DATE_FORMAT(acad_start_date, '%m/%d/%Y %l:%i %p' ) as start "
    . "FROM $academiceventsTable JOIN $academiceventAttendanceTable USING(acad_id) "
    . "WHERE pstu_id = $userId "
    . "UNION ALL "
    . "SELECT CONCAT('PIF: - ', pif_title), "
    . "DATE_FORMAT(pif_start_date, '%m/%d/%Y %l:%i %p' ) "
    . "FROM $pifTable JOIN $pifStatsTable USING (pif_id) "
    . "WHERE pstu_id = $userId"
);

$comServTable = DB_getPrefixedTable("com_serv");
$comServEvents = DB_executeAndFetchAll(
    "SELECT com_title AS `title`, DATE_FORMAT(com_date, '%m/%d/%Y') AS `date`, com_hours AS `hours` "
    . "FROM $comServTable "
    . "WHERE pstu_id = $userId "
    . "AND com_verified = 2"
);

$isFreshmanGroups = (bool) DB_executeAndFetchOne("SELECT usr_id FROM users WHERE usr_education = 1 AND usr_status = 2 AND usr_id = $userId LIMIT 1");

if ($isFreshmanGroups) {
    $fdgReportsTable = DB_getPrefixedTable('fdg_reports');
    $fdgAttendenceTable = DB_getPrefixedTable('fdg_attendence');
    $fdgGroups = DB_executeAndFetchAll(
        "SELECT fdg_name AS `name`, "
        . "DATE_FORMAT(pfdg_report_start_date, '%m/%d/%Y %l:%i %p') AS `start` "
        . "FROM $fdgReportsTable "
        . "JOIN $fdgAttendenceTable USING (pfdg_report_id) "
        . "JOIN fdg ON (pfdg_id = fdg_id) "
        . "WHERE pstu_id = $userId"
    );
} else {
    $fdgGroups = [];
}

$capstones = DB_executeAndFetchAll(
    "SELECT capstone_name AS `name`, capstone_enddate AS `end_date`"
    . "FROM capstone "
    . "WHERE capstone_complete = 1 AND usr_id = $userId"
);

$exemptionCase = generateCase('excptn_type', [
    1 => 'Activity Group',
    4 => 'FDG Groups',
    3 => 'Community Service',
    2 => 'CCEs',
], 'Unknown');
$exceptionsTable = DB_getPrefixedTable('exceptions');
$exceptionGrantTable = DB_getPrefixedTable('exception_grants');
$exemptions = DB_executeAndFetchAll(
    "SELECT excptn_name AS `name`, excptn_value AS `value`, ($exemptionCase) AS `type` "
    . "FROM $exceptionsTable JOIN $exceptionGrantTable USING (excptn_id) "
    . "WHERE pstu_id = $userId"
);

$probationCase = generateCase('probation_type', [
    3 => 'Academic',
    0 => 'Activity Groups',
    2 => 'Community Service',
    1 => 'Academic Events',
    5 => 'Behavioral',
    4 => 'Honors Credits',
], 'Unknown');
$probations = DB_executeAndFetchAll(
    "SELECT probation_name AS `name`, probation_grant_requirement AS `req`, ($probationCase) AS `type` "
    . "FROM probations JOIN probation_grants USING (probation_id) "
    . "WHERE usr_id = $userId"
);

// begin HTML
HTML_StartHead();

AddTitle("Stats");

AddCSS("all.css" );
AddCSS("stats.css");
AddCSS("jquery-ui.min.css");
AddCSS("bootstrap.min.css");

//Optional theme

Body_AddScript( "jquery-1.12.3.min.js" );
Body_AddScript( "jquery-ui.min.js" );
Body_AddScript("all.js");

HTML_EndHead();

HTML_StartBody();

Body_CreateSideNav();
Body_CreateHeader( "Stats" );
Body_CreateStickyNav();

?><div class="container stats-container">
<div class="stats-card">
    <div class="stats-card-header stats-card-title">Stats For: <?php echo $_SESSION["name"] . " - " . $studentSchoolId; ?></div>
    <div class="stats-card-inset-shadow stats-requirements-<?php echo $pass ? "pass" : "fail"?>">Requirements met: <?php echo $pass ? "Yes" : "No"; ?></div>
</div>
<div class="stats-card">
    <div class="stats-card-header">Academic Events: <?php echo (int) ($stats["acad_events"]) . " of " . $cceRequirements; ?></div>
    <?php
    generateList($attendedEvents, function ($event) {
        $title = $event["title"];
        $start = $event["start"];
        return "$title - $start</li>";
    }, "No events attended");
    ?>
</div>
<?php
// Activity groups don't exist anymore
// $result = mysqli_query($conn, "SELECT ag_title, DATE_FORMAT(agses_start_time, '%m/%d/%Y %l:%i %p' ) FROM $prefix" . "_activitygroup JOIN $prefix" . "_activitygroupsession USING(ag_id) JOIN $prefix"."_activitygroupstats USING(agses_id) WHERE pstu_id = ". $_SESSION["userid"]);
//
// echo "<li>Activity Group : " . $stats[1];
//
// echo "<ul>";
//
// while($row = mysqli_fetch_row($result)){
// 	echo"<li>" . $row[0] . " - " . $row[1] . "</li>";
// }
//
// echo "</ul>";
//
// echo "</li>";
?>
<div class="stats-card">
    <div class="stats-card-header">Community Service: <?php echo $stats["com_hours"] . " of " . $comHoursRequirements; ?></div>
    <?php
    generateList($comServEvents, function ($event) {
        $title = $event['title'];
        $date = $event['date'];
        $hours = $event['hours'];
        return "$title - $date, $hours Hour(s)";
    }, "No community service hours");
    ?>
</div>

<?php
 if ($isFreshmanGroups) {
    ?>
    <div class="stats-card">
        <div class="stats-card-header">FDG Groups: <?php echo (int) ($stats['fdg']) . " of " . $fdgRequirements ?></div>
        <?php
        generateList($fdgGroups, function ($row) {
            return $row['name'] . " - " . $row['start'];
        }, "No FDG's attended");
        ?>
    </div>
    <?php
}

if(count($capstones) > 0){
    ?>
    <div class="stats-card">
        <div class="stats-card-header">Capstone</div>
        <?php
        generateList($capstones, function ($capstone) {
            $name = $capstone['name'];
            $endDate = $capstone['end_date'];
            return "$name - $endDate";
        }, "No capstones");
        ?>
    </div>
    <?php
}


if(count($exemptions) > 0) {
    ?>
    <div class="stats-card">
        <div class="stats-card-header">Exemptions</div>
        <?php
        generateList($exemptions, function ($exemption) {
            $name = $exemption['name'];
            $type = $exemption['type'];
            $value = $exemption['value'];
            return "$name - $type = $value";
        }, "No exemptions");
        ?>
    </div>
    <?php
}

if (count($probations) > 0){
 	?>
    <div class="stats-card">
        <div class="stats-card-header">Probations</div>
        <?php
        generateList($probations, function ($probation) {
            $name = $probation['name'];
            return $name;
        }, "No probations");
        ?>
    </div>
    <?php
 }


 ?>
 </div>

 <?php

 HTML_End();

 ?>