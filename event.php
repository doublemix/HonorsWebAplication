<?php

session_start();

require_once 'template.inc';
require_once 'SCRIPTS/get_permissions.inc';
require_once 'SCRIPTS/db_utils.php';

$type = filter_input(INPUT_GET, "type", FILTER_VALIDATE_INT);
$id = filter_input(INPUT_GET, "id", FILTER_VALIDATE_INT);

/*
 * $type
 * 1 = PIF
 * 2 = FDG Report (Meeting)
 * 3 = Activity Group
 * 4 = Event
 * 5 = CCE (prev. Academic Event)
 * 6 = FDG Event
 */

if ($type !== 5) {
    // Only showing this page for CCEs, redirect to index therwie
    header("Location: index.php");
    die();
}

$academiceventsTable = DB_getPrefixedTable("academicevents");

$sql = "SELECT "
    . "acad_title AS `title`, "
    . "acad_description AS `desc`, "
    . "DATE_FORMAT(acad_start_date, '%W, %M %D, %Y - %l:%i %p') AS `start` "
    . "FROM $academiceventsTable "
    . "WHERE acad_id = $id "
    . "LIMIT 1";
$cce = DB_executeAndFetchOne($sql);

HTML_StartHead();

AddTitle($cce['title']);

AddCSS("all.css");
AddCSS("bootstrap.min.css");

HTML_EndHead();

HTML_StartBody();

Body_CreateSideNav();

Body_CreateHeader("Events");

Body_CreateStickyNav();
?>

<div class="container">
    <h2>
        <?php echo htmlspecialchars($cce["title"]) ?> <small><?php
            echo $cce["start"];
        ?></small>
    </h2>
    <p><?php echo htmlspecialchars($cce["desc"]) ?></p>
</div>

<?php

Body_AddScript("jquery-1.12.3.min.js");
Body_AddScript("bootstrap.min.js");
Body_AddScript("all.js");

HTML_End();

?>