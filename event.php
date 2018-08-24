<?php

session_start();

require_once 'template.inc';
require_once 'SCRIPTS/get_permissions.inc';
require_once 'SCRIPTS/db_utils.php';
require_once 'SCRIPTS/get_permissions.inc';

$type = filter_input(INPUT_GET, "type", FILTER_VALIDATE_INT);
$eventId = filter_input(INPUT_GET, "id", FILTER_VALIDATE_INT);

/*
 * $type
 * 1 = PIF
 * 2 = FDG Report (Meeting)
 * 3 = Activity Group
 * 4 = Event
 * 5 = CCE (prev. Academic Event)
 * 6 = FDG Event
 */

if (!($type === 5 || $type === 6 || $type === 4)) {
    // Only showing this page for CCEs and Freshman CCE, redirect to index otherwise
    header("Location: index.php");
    die();
}

$typeParameters = [
    5 => [
        "requestName" => "ccersvprequest",
        "eventTable" => [
            "name" => "academicevents",
            "title" => "acad_title",
            "desc" => "acad_description",
            "startDate" => "acad_start_date",
            "id" => "acad_id",
        ],
        "rsvpTable" => [
            "name" => "cce_rsvp",
            "eventId" => "acad_id",
        ],
        "attdTable" => [
            "name" => "academicevent_attendence",
            "id" => "acad_att_id",
            "eventId" => "acad_id",
        ],
    ],
    6 => [
        "requestName" => "fdgeventrsvprequest",
        "eventTable" => [
            "name" => "fdg_event",
            "title" => "pfdg_event_name",
            "desc" => "pfdg_event_description",
            "startDate" => "pfdg_start_date",
            "id" => "pfdg_event_id",
        ],
        "rsvpTable" => [
            "name" => "fdg_cce_rsvp",
            "eventId" => "event_id",
        ],
        "attdTable" => [
            "name" => "fdg_event_attendence",
            "id" => "pfdg_eve_att_id",
            "eventId" => "pfdg_event_id",
        ],
    ],
    4 => [
        "requestName" => "eventrsvprequest",
        "eventTable" => [
            "name" => "events",
            "title" => "event_title",
            "desc" => "event_description",
            "startDate" => " event_start_date",
            "id" => "event_id",
        ],
        "rsvpTable" => [
            "name" => "event_rsvp",
            "eventId" => "event_id",
        ],
        "attdTable" => null,
    ]
][$type];

$loggedIn = getPermissions($conn);

if ($loggedIn) {
    $userId = ((int) $_SESSION["userid"]);
    $isAdmin = hasPermission(PERM_ADMIN);
} else {
    $userId = null;
    $isAdmin = false;
}

$table = DB_getPrefixedTable($typeParameters["eventTable"]["name"]);
$titleCol = $typeParameters["eventTable"]["title"];
$descCol = $typeParameters["eventTable"]["desc"];
$startDateCol = $typeParameters["eventTable"]["startDate"];
$idCol = $typeParameters["eventTable"]["id"];

$sql = "SELECT "
    . "$titleCol AS `title`, "
    . "$descCol AS `desc`, "
    . "DATE_FORMAT($startDateCol, '%W, %M %D, %Y - %l:%i %p') AS `start`, " // the formatted text for output
    . "$startDateCol AS `start_date`" // the standardized text to be parsed
    . "FROM $table "
    . "WHERE $idCol = $eventId "
    . "LIMIT 1";
$cce = DB_executeAndFetchOne($sql);

$cceStart = \DateTimeImmutable::createFromFormat('Y-m-d H:i:s', $cce['start_date']);
$now = new \DateTimeImmutable();

// if logged in and is not an admin (the admin cannot register for events) and time has not passed
if ($loggedIn && !$isAdmin && $cceStart > $now) {

    $canRsvp = true;

    $currentstudentsTable = DB_getPrefixedTable("currentstudents");
    $cceRsvpTable = DB_getPrefixedTable($typeParameters["rsvpTable"]["name"]);
    $eventIdCol = $typeParameters["rsvpTable"]["eventId"];

    $rsvpSql = "SELECT "
        . "rsvp.rsvp_id "
        . "FROM users usr "
        . "JOIN $currentstudentsTable pstu ON (usr.usr_id = pstu.pstu_id) "
        . "JOIN $cceRsvpTable rsvp ON (pstu.pstu_id = rsvp.pstu_id) "
        . "WHERE rsvp.$eventIdCol = $eventId AND usr.usr_id = $userId "
        . "LIMIT 1";

    $isRsvpd = count(DB_executeAndFetchAll($rsvpSql)) === 1;
} else {
    $canRsvp = false;
    $isRsvpd = false;
}

if ($loggedIn && $typeParameters["attdTable"] !== null) {
    $attendenceTable = DB_getPrefixedTable($typeParameters["attdTable"]["name"]);
    $attdIdCol = $typeParameters["attdTable"]["id"];
    $eventIdCol = $typeParameters["attdTable"]["eventId"];
    $isAttend = count(DB_executeAndFetchOne("SELECT $attdIdCol AS `id` FROM $attendenceTable "
        . "WHERE pstu_id = $userId AND $eventIdCol = $eventId "
        . "LIMIT 1")) > 0;
} else {
    $isAttend = false;
}

if ($isAdmin) {
    $rsvpTable = DB_getPrefixedTable($typeParameters["rsvpTable"]["name"]);
    $studentsTable = DB_getPrefixedTable("currentstudents");
    $eventIdCol = $typeParameters["rsvpTable"]["eventId"];

    $attendanceSheet = DB_executeAndFetchAll(
        "SELECT "
        . "CONCAT(users.usr_fname, ' ', users.usr_lname) AS `name` "
        . "FROM $rsvpTable rsvp "
        . "JOIN $studentsTable pstu ON rsvp.pstu_id = pstu.pstu_id "
        . "JOIN users ON pstu.pstu_id = users.usr_id "
        . "WHERE rsvp.$eventIdCol = $eventId "
        . "ORDER BY `name`"
    );
}

HTML_StartHead();

AddTitle($cce['title']);

AddCSS("all.css");
AddCSS("jquery-ui.min.css");
echo "<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css\" integrity=\"sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7\" crossorigin=\"anonymous\">";
echo "<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css\" integrity=\"sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r\" crossorigin=\"anonymous\">";
AddCSS("jquery.bootgrid.min.css");
AddCSS("event.css");

Body_AddScript("jquery-1.12.3.min.js");
Body_AddScript("jquery-ui.min.js");
Body_AddScript("bootstrap.min.js");
Body_AddScript("jquery.bootgrid.min.js");
Body_AddScript("all.js");

HTML_EndHead();

HTML_StartBody();

Body_CreateSideNav();

Body_CreateHeader("Events");

Body_CreateStickyNav();
?>

<div class="container event-container">
    <h2>
        <?php echo htmlspecialchars($cce["title"]) ?> <small><?php
            echo $cce["start"];
        ?></small>
    </h2>
    <form id="rsvp_form" action="#" onsubmit="doRsvp(); return false;">
    <?php
    if ($canRsvp) {
        if ($isRsvpd) {
            ?><button type="button" disabled="true" class="btn btn-primary">You are RSVP'd for this event</button><?php
        } else { ?>
            <button id="rsvp_btn" type="submit" class="btn btn-primary">RSVP for this event</button> <span id="message-box"></span>
            <input id="rsvp_validator" type="hidden" name="eventrsvprequest" value="on">
            <input id="rsvp_opcode" type="hidden" name="opcode" value="add-rsvp">
            <input id="rsvp_event_id" type="hidden" name="event_id" value="<?php echo $eventId ?>">
            <script type="text/javascript">
                function doRsvp () {
                    const rsvpButton = $("#rsvp_btn");
                    const messageBox = $("#message-box");

                    rsvpButton.text("Making RSVP...");
                    rsvpButton.attr("disabled", true);
                    messageBox.text("");

                    const form = $("#rsvp_form");
                    const formData = form.serialize();

                    $.ajax({
                        type: 'POST',
                        url: "SCRIPTS/requests/<?php echo $typeParameters["requestName"]; ?>.php",
                        data: formData,
                        cache: false,
                        dataType: "text",
                        success: function (result) {
                            if (result === "success") {
                                rsvpButton.text("You are RSVP'd for this event");
                                rsvpButton.attr("disabled", true);
                                messageBox.text("");
                            } else {
                                rsvpButton.text("RSVP for this event");
                                rsvpButton.attr("disabled", false);
                                messageBox.text("An error occurred, try again. If the problem persists let an administrator know.");
                            }
                        },
                        error: function () {
                            rsvpButton.text("RSVP for this event");
                            rsvpButton.attr("disabled", false);
                            messageBox.text("An error occurred, try again. If the problem persists let an administrator know.");
                        },
                    });
                }
            </script>
        <?php }
    }
    ?>
    </form><?php
    if ($isAttend) {
        ?><p class="alert-box">You have attended this event.</p><?php
    }
    ?><p><?php echo htmlspecialchars($cce["desc"]) ?></p><?php
    if (isset($attendanceSheet)) { ?>
        <h3>RSVP List</h3>
        <table id="rsvp_table" class="table table-hover table-striped">
            <thead>
                <tr>
                    <th data-column-id="name" data-converter="string">
                        Name
                    </th>
                </tr>
            </thead>
        </table>
        <script type="text/javascript">
            const data = <?php echo json_encode($attendanceSheet); ?>;

            $(document).ready(function () {
                const rsvpTable = $("#rsvp_table");
                rsvpTable.bootgrid({
                    data: data,
                    columnSelection: false,
                    rowCount: -1, // display all
                    caseSensitive: false,
                });
                rsvpTable.bootgrid("append", data);
                rsvpTable.bootgrid("sort", {name: "asc"});
            });
        </script>
    <?php } ?>
</div>

<?php

HTML_End();

?>