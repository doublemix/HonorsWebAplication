<?php

session_start();


if(isset($_POST["sessionrequest"])){
	
	if(isset($_SESSION["userid"])){
		echo "success";
	} else {
		echo "Get this person Outta Here!";
	}
	
}

?>