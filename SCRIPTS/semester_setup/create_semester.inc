<?php
/*
 * create_semester.inc
 *
 * Created By: William Grove
 *
 * Date: 6/18/2016
 *
 * Creates a semester with the given prefix
 *
 */

require_once '../get_permissions.inc';
require_once '../access_tables/modify_semesters.inc';
require_once '../access_semester_tables/modify_currentstudents.inc';
require_once '../update_factory/update_factory.inc';

//Bring in all of the tables required to create the semester
require_once '../semester_tables/create_academicevent_attendence_table.inc';
require_once '../semester_tables/create_academicevents_table.inc';
require_once '../semester_tables/create_activitygroup_table.inc';
require_once '../semester_tables/create_activitygroupleaders_table.inc';
require_once '../semester_tables/create_activitygroupsession_table.inc';
require_once '../semester_tables/create_activitygroupstats_table.inc';
require_once '../semester_tables/create_com_serv_table.inc';
require_once '../semester_tables/create_current_fdg_table.inc';
require_once '../semester_tables/create_currentstudents_table.inc';
require_once '../semester_tables/create_exception_grants_table.inc';
require_once '../semester_tables/create_exceptions_table.inc';
require_once '../semester_tables/create_exception_request_table.inc';
require_once '../semester_tables/create_fdg_attendence_table.inc';
require_once '../semester_tables/create_fdg_event_attendence_table.inc';
require_once '../semester_tables/create_fdg_event_table.inc';
require_once '../semester_tables/create_fdg_leaders_table.inc';
require_once '../semester_tables/create_fdg_members_table.inc';
require_once '../semester_tables/create_fdg_points_table.inc';
require_once '../semester_tables/create_fdg_reports_table.inc';
require_once '../semester_tables/create_pif_stats_table.inc';
require_once '../semester_tables/create_pif_table.inc';
require_once '../semester_tables/create_events_table.inc';
require_once '../semester_tables/create_cce_rsvp.inc';

//Bring in the Views created using the tables
require_once '../views/dates_view.inc';
require_once '../views/new_stats_view.inc';

function create_new_semester($sem_prefix, $sem_name, $set_active_students, $add_freshmen_to_fdg, $carry_over_fdg, $carry_over_com_serv, $conn){



	if(getPermissions($conn) === false){
		return "Was not able to retrieve updated permissions.";
	}

	if(($_SESSION["permissions"][0] == 1) == false){
		return "You are not permitted to start a new semester.";
	}

	$result = startSemester($sem_prefix, $sem_name, $conn);

	if($result !== true){
		return $result;
	}

	file_put_contents("log.txt", "daft10\n", 8);
	$tables_added = addSemesterTables($sem_prefix, $set_active_students, $add_freshmen_to_fdg, $carry_over_fdg, $carry_over_com_serv, $conn);

	if($tables_added !== true){
		file_put_contents("log.txt", "$tables_added", 8);
		rollbackTables($sem_prefix, $conn);
		return $tables_added;
	}

	return true;

}

function addSemesterTables($sem_prefix, $set_active_students, $add_freshmen_to_fdg, $carry_over_fdg, $carry_over_com_serv, $conn){

	file_put_contents("log.txt", "daft10\n", 8);
	$table_result = createTables($sem_prefix, $conn);


	if($table_result !== true){
		return $table_result;
	}

	$sql = "SELECT sem_prefix from semesters where sem_active != 1 Order By sem_id desc LIMIT 1";

	$result = mysqli_query($conn, $sql);

	$last_prefix = false;
	if(mysqli_num_rows($result) > 0){
		$row = mysqli_fetch_row($result);
		$last_prefix = $row[0];
	}



	if($set_active_students === true){
		file_put_contents("log.txt", "daft12\n", 8);
		$sql = "SELECT usr_id FROM users WHERE usr_status = 2";

		$result = mysqli_query($conn, $sql);

		while($row = mysqli_fetch_row($result)){
			addCurrentStudent($row[0], $conn, $sem_prefix);
		}

	}

	if($add_freshmen_to_fdg == true && $set_active_students == true){
		file_put_contents("log.txt", "daft13\n", 8);
		$sql = "SELECT usr_id FROM users WHERE usr_education = 1";

		$result = mysqli_query($conn, $sql);

		while($row = mysqli_fetch_row($result)){
			$update = update($sem_prefix . "_currentstudents","pstu_in_fdg = 1", "pstu_id = " . $row[0], 0, $conn);

			if($update !== true){
				return "Failed to perform all operations. Deleting semester tables. Error Transferring freshmen to fdg pool.";
			}
		}

	}

	if($carry_over_fdg === true && $set_active_students === true && $add_freshmen_to_fdg == true){

		if($last_prefix === false){
			return "No former semesters 3.";
		}



		//Transfer Current FDG's
		$sql = "INSERT INTO " . $sem_prefix . "_fdg select * from " . $last_prefix . "_fdg";

		$result = mysqli_query($conn, $sql);

		if($result === false){
			return "Failed to transfer current fdg data. prefix_fdg table. Rolling back tables.";
		}

		//Transfer Current FDG Members, if they are still in the program.
		$sql = "INSERT INTO $sem_prefix"."_fdg_members SELECT * from $last_prefix"."_fdg_members where pstu_id in (SELECT pstu_id from $sem_prefix"."_currentstudents)";

		$result = mysqli_query($conn, $sql);

		if($result === false){
			return "Failed to transfer fdg member data. prefix_fdg table. Rolling back tables.";
		}

		//Transfer FDG Leaders, if they are still in the program
		$sql = "INSERT INTO " .$sem_prefix . "_fdg_leaders SELECT * from $last_prefix"."_fdg_leaders where pstu_id IN(SELECT pstu_id from $sem_prefix"."_currentstudents)";

		$result = mysqli_query($conn, $sql);

		if($result === false){
			return "Failed to transfer fdg leader data. prefix_fdg table. Rolling back tables.";
		}

		//Transfer FDG Events
		$sql = "INSERT INTO " . $sem_prefix . "_fdg_event select * from " . $last_prefix . "_fdg_event";

		$result = mysqli_query($conn, $sql);

		if($result === false){
			return "Failed to transfer fdg events data. prefix_fdg table. Rolling back tables.";
		}

		//Transfer FDG Points

		$sql = "INSERT INTO " . $sem_prefix . "_fdg_points select * from " . $last_prefix . "_fdg_points";

		$result = mysqli_query($conn, $sql);

		if($result === false){
			return "Failed to transfer fdg points data. prefix_fdg table. Rolling back tables.";
		}

		$sql = "UPDATE semesters SET carry_over_fdg = 1 Where sem_prefix = '" . $sem_prefix . "'";

		$result = mysqli_query($conn, $sql);

		if($result === false){

			return "Failed to set carry_over_fdg.";
		}

	}

	if($carry_over_com_serv === true && $set_active_students === true){

		if($last_prefix === false){
			return "No former semesters 1.";
		}

		$sql = "INSERT INTO " . $sem_prefix . "_com_serv select * from " . $last_prefix . "_com_serv where pstu_id in (Select pstu_id FROM " . $sem_prefix . "_currentstudents)";

		$result = mysqli_query($conn, $sql);

		if($result === false){
			return "Failed to transfer community servcie data. prefix_com_serv table. Rolling back tables.";
		}

		$sql = "UPDATE semesters SET carry_over_com_serv = 1 Where sem_prefix = '" . $sem_prefix . "'";

		$result = mysqli_query($conn, $sql);

		if($result === false){

			return "Failed to set carry_over_com_serv.";
		}

	} else {

		if($last_prefix === false){
			return true;
		}

		$sql = "INSERT INTO " . $sem_prefix . "_com_serv select * from " . $last_prefix . "_com_serv where pstu_id in (Select pstu_id FROM " . $sem_prefix . "_currentstudents) and com_date > (SELECT sem_end_date FROM semesters where sem_prefix = '$last_prefix')";

		$result = mysqli_query($conn, $sql);

		if($result === false){
			return "Failed to transfer community servcie data. prefix_com_serv table. Rolling back tables.";
		}

	}
	file_put_contents("log.txt", "daft16\n", 8);
	return true;

}

function createTables($prefix, $conn){

	file_put_contents("log.txt", "daft40\n", 8);

	if(createCurrentStudentsTable($conn, $prefix) === true){
		if(createCurrentFDGTable($conn, $prefix) === true){
			if(createFDGLeadersTable($conn, $prefix) === true){
				if(createFDGMembersTable($conn, $prefix) === true){
					if(createFDGReportsTable($conn, $prefix) === true){
						if(createFDGAttendenceTable($conn, $prefix) === true){
							if(createFDGEventTable($conn, $prefix) === true){
								if(createFDGEventAttendenceTable($conn, $prefix) === true){
									if(createFDGPointsTable($conn, $prefix) === true){
										if(createActivityGroupTable($conn, $prefix) === true){
											if(createActivityGroupLeadersTable($conn, $prefix) === true){
												if(createActivityGroupSessionTable($conn, $prefix) === true){
													if(createActivityGroupStatsTable($conn, $prefix) === true){
														if(createAcademicEventsTable($conn, $prefix) === true){
															if(createAcademicEventAttendenceTable($conn, $prefix) === true){
                                                                if(createComServTable($conn, $prefix) === true){
                                                                    if(createExceptionsTable($conn, $prefix) === true){
                                                                        if(createExceptionGrantsTable($conn, $prefix) === true){
                                                                            if (createExceptionRequestTable($conn, $prefix) === true){
                                                                                if(createPifTable($conn, $prefix) === true){
                                                                                    if(createPifStatsTable($conn, $prefix) === true){
                                                                                        if(createEventsTable($conn, $prefix) === true){
                                                                                            if (createCceRsvpTable($conn, $prefix) === true){
                                                                                                if(createDatesView($conn, $prefix) === true){
                                                                                                    if(createStatsView($conn, $prefix) === true){
                                                                                                        return true;
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}

	file_put_contents("log.txt", mysqli_error($conn));

	return "Failed to create tables.";

}

function rollbackTables($prefix, $conn){

	if(mysqli_query($conn, "drop view " . $prefix . "_dates")== false){
		echo "\nFailed to drop dates views\n";
	}

	if(mysqli_query($conn, "drop view " . $prefix . "_stats")== false){
		echo "\nFailed to drop stats view\n";
	}

	if(mysqli_query($conn, "drop table " . $prefix . "_events")== false){
		echo "\nFailed to drop pif_stats\n";
	}

	if(mysqli_query($conn, "drop table " . $prefix . "_pif_stats")== false){
		echo "\nFailed to drop pif_stats\n";
	}

	if(mysqli_query($conn, "drop table " . $prefix . "_pif")== false){
		echo "\nFailed to drop pif\n";
	}

	if(mysqli_query($conn, "drop table " . $prefix . "_exception_grants")== false){
		echo "\nFailed to drop exception grants\n";
	}

	if(mysqli_query($conn, "drop table " . $prefix . "_exceptions")== false){
		echo "\nFailed to drop exceptions\n";
	}

	if(mysqli_query($conn, "drop table " . $prefix . "_com_serv")== false){
		echo "\nFailed to drop com_serv\n";
	}

	if(mysqli_query($conn, "drop table " . $prefix . "_augmentations")== false){
		echo "\nFailed to drop augmentations\n";
	}

	if(mysqli_query($conn, "drop table " . $prefix . "_augmentation_info")== false){
		echo "\nFailed to drop augmentation_info\n";
	}

	if(mysqli_query($conn, "drop table " . $prefix . "_academicevent_attendence")== false){
		echo "\nFailed to drop academicevent_attendence\n";
	}

	if(mysqli_query($conn, "drop table " . $prefix . "_academicevents")== false){
		echo "\nFailed to drop academicevents\n";
	}

	if(mysqli_query($conn, "drop table " . $prefix . "_activitygroupstats")== false){
		echo "\nFailed to drop activitygroupstats\n";
	}

	if(mysqli_query($conn, "drop table " . $prefix . "_activitygroupsession")== false){
		echo "\nFailed to drop activitygroupsession\n";
	}

	if(mysqli_query($conn, "drop table " . $prefix . "_activitygroupleaders")== false){
		echo "\nFailed to drop activitygroupleaders\n";
	}

	if(mysqli_query($conn, "drop table " . $prefix . "_activitygroup")== false){
		echo "\nFailed to drop activitygroup\n";
	}

	if(mysqli_query($conn, "drop table " . $prefix . "_fdg_points")== false){
		echo "\nFailed to drop fdg_points\n";
	}

	if(mysqli_query($conn, "drop table " . $prefix . "_fdg_event_attendence")== false){
		echo "\nFailed to drop fdg_event_attendence\n";
	}

	if(mysqli_query($conn, "drop table " . $prefix . "_fdg_event")== false){
		echo "\nFailed to drop fdg_event\n";
	}

	if(mysqli_query($conn, "drop table " . $prefix . "_fdg_attendence")== false){
		echo "\nFailed to drop fdg_attendence\n";
	}

	if(mysqli_query($conn, "drop table " . $prefix . "_fdg_reports")== false){
		echo "\nFailed to drop _fdg_reports\n";
	}

	if(mysqli_query($conn, "drop table " . $prefix . "_fdg_members")== false){
		echo "\nFailed to drop fdg_memberss\n";
	}

	if(mysqli_query($conn, "drop table " . $prefix . "_fdg_leaders")== false){
		echo "\nFailed to drop fdg_leaders\n";
	}

	if(mysqli_query($conn, "drop table " . $prefix . "_fdg")== false){
		echo "\nFailed to drop fdg\n";
	}

	if(mysqli_query($conn, "drop table " . $prefix . "_currentstudents")== false){
		echo "\nFailed to drop currentstudents\n";
	}

	if(mysqli_query($conn, "DELETE FROM semesters where sem_prefix =  '" . $prefix . "'")== false){
		echo "\nFailed to drop semester\n";
	}

	return;
}
?>