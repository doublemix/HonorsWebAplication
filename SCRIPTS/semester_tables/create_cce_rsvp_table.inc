<?php

function createCceRsvpTable ($conn, $prefix) {
    $statement = <<<EOT
CREATE TABLE ghpcoc5_honors.${prefix}_cce_rsvp (
    rsvp_id INT(11) NOT NULL AUTO_INCREMENT,
    acad_id INT(11) DEFAULT NULL,
    pstu_id INT(11) DEFAULT NULL,
    PRIMARY KEY (rsvp_id),
    FOREIGN KEY (acad_id)
        REFERENCES ghpcoc5_honors.${prefix}_academicevents(acad_id) ON DELETE NO ACTION ON UPDATE RESTRICT,
    FOREIGN KEY (pstu_id)
        REFERENCES ghpcoc5_honors.${prefix}_currentstudents(pstu_id) ON DELETE NO ACTION ON UPDATE RESTRICT
) ENGINE = INNODB";
EOT;
     $result = mysqli_query($conn, $statement);

     if ($result == false) {
         echo "There was an error creating the ${prefix}_cce_rsvp table.";
         echo "Please contact the System Administrator.";
         return false;
     } else {
         return true;
     }
}

?>
