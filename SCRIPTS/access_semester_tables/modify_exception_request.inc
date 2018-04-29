<?php
/*
 * modify_exception_request.inc
 *
 * Created By: Mitchel Myers
 *
 * Adds/Delete/Modify values to the
 * (prefix)_exception_request table
 *
 *
 */

require_once '../get_permissions.inc';

const EXEMPTION_PERMISSIONS = [PERM_ADMIN, PERM_WORKER, PERM_EXEMPTIONS];

function deleteExceptionRequest($exrq_id, $prefix, $conn){

	getPermissions($conn);

    if (!hasAnyOfPermission(EXEMPTION_PERMISSIONS)) {
		return "You do not have permissions to delete exemption requests.";
	}

    $sql = "DELETE FROM " . $prefix . "_exception_request WHERE exrq_id = " . $exrq_id;

	$result = mysqli_query($conn, $sql);

	if($result == false){
		return "Failed to delete exemption request.";
	} else {
		return true;
	}

}

function rejectExceptionRequest($exrq_id, $prefix, $conn){

	getPermissions($conn);

    if (!hasAnyOfPermission(EXEMPTION_PERMISSIONS)) {
        return "You do not have permissions to reject exemption requests.";
    }

    $sql = "UPDATE " . $prefix . "_exception_request "
        . "SET exrq_status = 'Rejected' "
        . "WHERE exrq_id = " . $exrq_id;

	$result = mysqli_query($conn, $sql);

	if($result == false){
		return "Failed to reject exemption request.";
	} else {
		return true;
	}

}