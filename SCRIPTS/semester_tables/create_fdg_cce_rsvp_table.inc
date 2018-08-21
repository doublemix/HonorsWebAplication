<?php

function createFdgCceRsvpTable($conn, $prefix) {
    $statement = <<<EOT
CREATE TABLE IF NOT EXISTS ${prefix}_fdg_cce_rsvp (
    rsvp_id INT(11) NOT NULL AUTO_INCREMENT,
    event_id INT(11) DEFAULT NULL,
    pstu_id INT(11) DEFAULT NULL,
    PRIMARY KEY (rsvp_id),
    FOREIGN KEY (event_id)
        REFERENCES ${prefix}_fdg_event(pfdg_event_id) ON DELETE CASCADE,
    FOREIGN KEY (pstu_id)
        REFERENCES ${prefix}_currentstudents(pstu_id) ON DELETE CASCADE
) ENGINE = INNODB
EOT;
    $result = mysqli_query($conn, $statement);

    if ($result == false) {
        echo "There was an error creating the ${prefix}_fdg_cce_rsvp table.";
        echo "Please contact the System Administrator.";
        return false;
    } else {
        return true;
    }
}

?>
