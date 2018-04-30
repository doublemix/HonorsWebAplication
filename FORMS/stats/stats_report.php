<?php
session_start();

require_once "../../SCRIPTS/db_connect.inc";

$conn = DBConnect();

 if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][12] == 1) == false){

	header("location: index.php");
	die();
}

?><body>
<script type="text/javascript">

function showMessage(result){
	if(result === "success"){
        $("#error_area").queue(function(){
            $("#error_area").text("Report Added.");
            $("#error_area").css("color", "green");
            $("#error_area").fadeIn(2000).delay( 6000 ).fadeOut(2000);
            $(this).dequeue();
        });
	} else {
        var err = "Error: " + result;
		$("#error_area").queue(function(){
            $("#error_area").text("");
            $("#error_area").text(err);
            $("#error_area").css("color", "red");
            $("#error_area").fadeIn(2000).delay( 6000 ).fadeOut(2000);
            $(this).dequeue();
		});
	}
}

function debounced (f, delay) {
    var timeout = null;
    return function () {
        if (timeout !== null) {
            clearTimeout(timeout);
        }
        timeout = setTimeout(function () {
            f();
            timeout = null;
        }, delay);
    };
}

$(document).ready (function(){

    var resetbutton = document.getElementById("resetButton");

	$(resetbutton).click(function() {
	    if(confirm("Reset the current stats?")){
	    	$("#cces").val('5');
			$("#f_cces").val('5');
			$("#com_hours").val('10');
			$("#fdg").val('20');
			$("#capstone").val('0');
			$("#grid-command-buttons-stats").bootgrid("reload");
        }
	});

	var grid = $("#grid-command-buttons-stats").bootgrid({
	    ajax: true,
	    post: function ()
	    {
	        return {
	            id: "b0df282a-0d67-40e5-8558-c9e93b7befed",
	            prefix: $("#sem_select").val(),
	            cces : $("#cces").val(),
	            com_hours : $("#com_hours").val(),
	            fdg : $("#fdg").val(),
	            capstone : $("#capstone").val(),
	            f_cces : $("#f_cces").val(),
	        };
	    },
	    url: "/SCRIPTS/json_source/stats/display_stats.php"

	});

	$("#sem_select").change(function(){
		$("#cces").val('5');
		$("#f_cces").val('5');
		$("#com_hours").val('10');
		$("#fdg").val('20');
		$("#capstone").val('0');
		$("#grid-command-buttons-stats").bootgrid("reload");
	});

    $("#cces, #f_cces, #com_hours, #fdg, #capstone").change(debounced(function () {
        console.log("reload");
		$("#grid-command-buttons-stats").bootgrid("reload");
    }, 1000));

});

</script>

<form id="stats_form" method="post" action="#" class="form-horizontal">

<fieldset>

<!-- Form Name -->

<legend>Stat Review</legend><?php

	$result = mysqli_query($conn, "SELECT sem_name, sem_prefix from semesters order by sem_id desc;");

	echo "<div class=\"form-group\">\n";
	echo "<label class=\"col-md-4 control-label\" for=\"sem_select\">Semester:</label>\n";
	echo "<div class=\"col-md-4\">";
	echo "<select id=\"sem_select\" name=\"prefix\" class=\"form-control\">";

	$count = 0;
	while($row = mysqli_fetch_row($result)){
		if($count == 0){
			echo "<option value=\"" . $row[1] . "\" selected>Current Semester</option>\n";
		} else {
			echo "<option value=\"" . $row[1] . "\">" . $row[0] . "</option>\n";
		}
		$count++;

	}

	echo "</select>";
	echo "</div>";
	echo "</div>";
?>

<div class="form-group">
    <label class="col-md-4 control-label" for="value">Required CCEs (Upperclassmen):</label>
    <div class="col-md-4">
        <input id="cces" class="form-control" type="number" value="5"/>
    </div>
</div>
<div class="form-group">
    <label class="col-md-4 control-label" for="value">Required CCEs (Freshmen):</label>
    <div class="col-md-4">
        <input id="f_cces" class="form-control" type="number" value="5"/>
    </div>
</div>
<div class="form-group">
    <label class="col-md-4 control-label" for="value">Required Comm Service Hours:</label>
    <div class="col-md-4">
        <input id="com_hours" class="form-control" type="number" value="10"/>
    </div>
</div>
<div class="form-group">
    <label class="col-md-4 control-label" for="value">Required FDGs (Freshmen only):</label>
    <div class="col-md-4">
        <input id="fdg" class="form-control" type="number" value="20"/>
    </div>
</div>
<div class="form-group">
    <label class="col-md-4 control-label" for="value">Required Capstones (Upperclassmen only):</label>
    <div class="col-md-4">
        <input id="capstone" class="form-control" type="number" value="0"/>
    </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="resetButton"></label>
  <div class="col-md-4">
    <button type="button" id="resetButton" name="resetButton" class="btn btn-primary">Reset</button>
  </div>
</div>

</fieldset>

</form>

<table id="grid-command-buttons-stats" class="table table-condensed table-hover table-striped">
    <thead>
        <tr>
            <th data-column-id="usr_fname" data-type="numeric" >First Name</th>
            <th data-column-id="usr_lname" data-type="numeric" >Last Name</th>
            <th data-column-id="usr_school_id" data-type="numeric" >School ID</th>
            <th data-column-id="reqed" data-type="Text" >Met Req's?</th>
            <th data-column-id="cces" data-type="numeric" >CCEs</th>
            <th data-column-id="com_hours" data-type="numeric" >Comm Service Hours</th>
            <th data-column-id="fdg" data-type="numeric" >FDGs</th>
            <th data-column-id="capstone" data-type="numeric" >Capstone</th>
        </tr>
    </thead>
</table>

<div class="form-group">
    <label class="col-md-4 control-label" for="error_area"></label>
    <div class="col-md-4">
        <span id="error_area"></span>
    </div>
</div>

</body>
