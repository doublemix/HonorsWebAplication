<?php
/***************************
* db_connect.inc
*
* Created By: William Grove
*
* Creates a connection between the
* Database and PHP processor.
*
****************************/
function
 DBConnect() {


$conn = mysqli_connect('127.0.0.1', 'ghpcoc5_butler', 'password', 'ghpcoc5_honors');

  return $conn;


}


function DBClose( $conn ) {


        $result = mysqli_close( $conn );

        return $result;

}


function removeslashes($string){

    $string=implode("",explode("\\",$string));

    return stripslashes(trim($string));
}

?>
