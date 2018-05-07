<?php
/*

create_exceptions_table.inc

Created By: Mitchel Myers

Must run after the creation of the currentstudents and exceptions tables

*/

function createExceptionRequestTable($conn, $prefix){

	$statement = <<<EOT
CREATE TABLE IF NOT EXISTS {$prefix}_exception_request (
    exrq_id INT(11) NOT NULL AUTO_INCREMENT,
    pstu_id INT(11) NOT NULL,
    exrq_half_req VARCHAR(255) DEFAULT NULL,
    exrq_full_req VARCHAR(255) DEFAULT NULL,
    exrq_details VARCHAR(500) DEFAULT NULL,
    exrq_status VARCHAR(255) NOT NULL DEFAULT 'Pending',
    exrq_reqdate VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (exrq_id),
    UNIQUE INDEX (pstu_id),
    FOREIGN KEY (pstu_id) REFERENCES {$prefix}_currentstudents(pstu_id) ON DELETE CASCADE
)ENGINE = INNODB
EOT;

	$result = mysqli_query($conn, $statement);

if($result == false){

		echo "There was an error creating the " . $prefix ."_exception_request Table.";
		echo "Please contact the System Administrator.";
		return false;
	} else {
		return true;
	}
}

?>




