<?php
/*
 *  login_script.inc
 *
 *  Created By: William Grove
 *  For the Global Honors Program at
 *  Lock Haven University of Pennsylvania
 *
 *  Created On: 5/17/2016
 *
 */

 //require "database connect script"
 
 //session_start();
 require "db_connect.inc"; 

 $error='';
 $username = ''; 

 if (isset($_POST['submit'])) {
        if (empty($_POST['username']) || empty($_POST['password'])) {
                $error = "Username or Password is empty.";
        }
        else
        {
		/*/Add code to check for credentials
		$_SESSION["username"] = $_POST['username'];
		$_SESSION["name"] = "Test";
		$_SESSION["permission"] = 3;
		header("location: index.php");
		/*/
		
		$username = removeslashes($_POST['username']);
		$password = crypt(removeslashes($_POST['password']), '$2a$10$leskfiqamdhjthrjwsksdidfhrjrkdlsldlkfjjgird$');

		$conn = DBConnect();

		if(mysqli_connect_errno() == 0){

		$Query = "SELECT usr_id, usr_username, usr_fname, usr_status FROM users WHERE usr_username = '$username' AND usr_password = '$password'";

                        $result = mysqli_query($conn, $Query);

                        $number_of_rows = 0;

						session_start();

						if ($result){
						
                        while ($row=mysqli_fetch_row($result)) {
                                $number_of_rows = $number_of_rows + 1;
                                $_SESSION["userid"] = $row[0];
                                $_SESSION["username"] = $row[1];
                                $_SESSION["name"] = $row[2];
                                $_SESSION["status"] = $row[3];
                        }

						}

						mysqli_free_result($result);
						
			if($number_of_rows > 0){
			
				if($_SESSION["status"] != 6) {
				
				$array = array();				

				$Query = "Select perm_admin, perm_worker, perm_users, perm_fdg, perm_exemptions, perm_academic_events, perm_activity_groups, perm_comm_serv, perm_pif, perm_image_slides, perm_events, perm_news, perm_stats FROM permissions WHERE usr_id =" .  $_SESSION["userid"];

				$resulttwo = mysqli_query($conn, $Query);

			 while ($row=mysqli_fetch_row($resulttwo)){
   				 for($r = 0; $r < count($row); $r++){
					$array[] = intval($row[$r]);
				   }	
             		       }

             mysqli_free_result($resulttwo);
             		       
				$_SESSION["permissions"] = $array;
	
				DBClose($conn);

				header("location: index.php");

				} else {
					DBClose($conn);
					$error='Access Denied';
				}

			} else {
				DBClose($conn);
				$error='Username or Password Incorrect';
			}

		} else {
			$error='Could Not Connect To Database';
		}
	}

}
?>