ls<?php

/*
 * 	create_initial_table_set.inc
 * 
 * 	Created By: William Grove
 * 
 * 	Date: 6/15/2016
 * 
 * 	Calls the scripts to create the initial
 * 	table set. Caution: These tables have
 * 	no data, not even and admin user. Please
 * 	create the admin user by making sure
 * 	the header points to -> create_initial_admin_user.php.
 * 
 */


//Table scripts - Call functions in this order
require "initial_tables/create_fdg_table.inc";
require "initial_tables/create_users_table.inc";
require "initial_tables/create_semesters_table.inc";
require "initial_tables/create_capstone_table.inc";
require "initial_tables/create_permissions_table.inc";
require "initial_tables/create_groups_table.inc";
require "initial_tables/create_probations_table.inc";
require "initial_tables/create_probation_grants_table.inc";
require "initial_tables/create_image_slide_table.inc";
require "initial_tables/create_news_table.inc";

//Drops the tables in the case of error
//Faster for the admin to recover.
//ONLY USE THIS FUNCTION IN THIS FILE.
require "drop_initial_tables.inc";

function createInitialTableSet($conn){
	
	//Make sure the tables are
	//Created in this order!
	
	
	
	if (createFDGTable($conn)){ 
		
		if (createUsersTable($conn)){
			
			if (createSemestersTable($conn)){
				
				if (createCapstoneTable($conn)){
					
					if (createPermissionsTable($conn)){
						
						if (createGroupsTable($conn)){
							
							if (createProbationsTable($conn)){
								
								if (createProbationGrantsTable($conn)){
									
									if(createImageSlideTable($conn)){
										
										if(createNewsTable($conn)){
											
											/*
											 * If all tables are made successfully,
											 * return true.
											 */
											
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
	
	/*
	 * Else, drop the tables,
	 * faster for admin to recover.
	 * ONLY USE THIS FUNCTION HERE.
	 */
	
	dropInitialTables_asldkfffignrmsdmsicigfjkdo($conn);
	
	return false;

	
}

?>