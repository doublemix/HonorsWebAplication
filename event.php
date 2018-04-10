<?php

session_start();

require_once 'template.inc';
require_once 'SCRIPTS/get_permissions.inc';
require_once 'SCRIPTS/db_utils.php';
require_once 'SCRIPTS/get_permissions.inc';

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

// if logged in and is not an admin (the admin cannot register for events) and time has not passed
if (isset($_SESSION["userid"])
    && getPermissions($conn)
    && $_SESSION["permissions"][PERM_ADMIN] !== 1
    && ) {

    $canRsvp = true;

    $currentstudentsTable = DB_getPrefixedTable("currentstudents");
    $cceRsvpTable = DB_getPrefixedTable("cce_rsvp");

    $userId = ((int) $_SESSION["userid"]);

    $rsvpSql = "SELECT "
        . "rsvp.rsvp_id "
        . "FROM users usr "
        . "JOIN $currentstudentsTable pstu ON (usr.usr_id = pstu.pstu_id) "
        . "JOIN $cceRsvpTable rsvp ON (pstu.pstu_id = rsvp.pstu_id) "
        . "WHERE rsvp.acad_id = $id AND usr.usr_id = $userId "
        . "LIMIT 1";

    $isRsvpd = count(DB_executeAndFetchAll($rsvpSql)) === 1;
} else {
    $canRsvp = false;
    $isRsvpd = false;
}

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
    <form id="rsvp_form" action="#" onsubmit="doRsvp(); return false;">
    <?php
    if ($canRsvp) {
        if ($isRsvpd) {
            ?><button type="button" disabled="true" class="btn btn-primary">You are RSVP'd for this event</button><?php
        } else { ?>
            <button id="rsvp_btn" type="submit" class="btn btn-primary" onclick="doRsvp();">RSVP for this event</button> <span id="message-box"></span>
            <input id="rsvp_validator" type="hidden" name="eventrsvprequest" value="on">
            <input id="rsvp_opcode" type="hidden" name="opcode" value="add-rsvp">
            <input id="rsvp_event_id" type="hidden" name="event_id" value="<?php echo $id ?>">
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
                        url: "SCRIPTS/requests/eventrsvprequest.php",
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
    </p>
    <p><?php echo htmlspecialchars($cce["desc"]) ?></p>
</div>

<?php

Body_AddScript("jquery-1.12.3.min.js");
Body_AddScript("bootstrap.min.js");
Body_AddScript("all.js");

HTML_End();

?>