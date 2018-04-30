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
		  })
	}
}


$(document).ready (function(){

	var subbutton = document.getElementById("submitButton");

	$(subbutton).click(function() {

		var option = $("#val_select").val();
		var newval = $("#value").val();

		if(option == 1){
		$("#acad_events").val(newval);
		}
		if(option == 2){
			$("#ags").val(newval);
			}
		if(option == 3){
			$("#com_hours").val(newval);
			}
		if(option == 4){
			$("#pifs").val(newval);
			}
		if(option == 5){
			$("#fdg").val(newval);
			}
		if(option == 6){
			$("#f_acad_event").val(newval);
			}
		if(option == 7){
			$("#capstone").val(newval);
			}


		$("#grid-command-buttons-stats").bootgrid("reload");

	});


	var resetbutton = document.getElementById("resetButton");

	$(resetbutton).click(function() {

	    if(confirm("Reset the current stats?")){
	    	$("#acad_events").val('2');
			$("#ags").val('10');
			$("#com_hours").val('10');
			$("#pifs").val('1');
			$("#fdg").val('25');
			$("#capstone").val('0');
			$("#f_acad_event").val('4');
			$("#grid-command-buttons-stats").bootgrid("reload");

	    }



	});

	$("#val_select").change(function (){

		var option = $("#val_select").val();

		if(option == 1){
			$("#value").val($("#acad_events").val());
			}

			if(option == 2){
				$("#value").val($("#ags").val());
				}
			if(option == 3){
				$("#value").val($("#com_hours").val());
				}
			if(option == 4){
				$("#value").val($("#pifs").val());
				}
			if(option == 5){
				$("#value").val($("#fdg").val());
				}
			if(option == 6){
				$("#value").val($("#f_acad_event").val());
				}
			if(option == 7){
				$("#value").val($("#capstone").val());
				}
	});

	var grid = $("#grid-command-buttons-stats").bootgrid({
	    ajax: true,
	    post: function ()
	    {

	        return {
	            id: "b0df282a-0d67-40e5-8558-c9e93b7befed",
	            prefix: $("#sem_select").val(),
	            acad_events : $("#acad_events").val(),
	            ags : $("#ags").val(),
	            com_hours : $("#com_hours").val(),
	            pifs : $("#pifs").val(),
	            fdg : $("#fdg").val(),
	            capstone : $("#capstone").val(),
	            f_acad_events : $("#f_acad_event").val()

	        };
	    },
	    url: "/SCRIPTS/json_source/stats/display_stats.php"

	});


	$("#sem_select").change(function(){
		$("#acad_events").val('2');
		$("#ags").val('10');
		$("#com_hours").val('10');
		$("#pifs").val('1');
		$("#fdg").val('25');
		$("#capstone").val('0');
		$("#f_acad_event").val('4');
		$("#grid-command-buttons-stats").bootgrid("reload");
	});

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
  <label class="col-md-4 control-label" for="val_select">Stat:</label>
  <div class="col-md-4">
  <select id="val_select">
  <option value="1">CCEs</option>
  <option value="2">Activity Groups</option>
  <option value="3">Community Service</option>
  <option value="4">PIFs</option>
  <option value="5">FDGs</option>
  <option value="6">Freshmen CCEs</option>
  <option value="7">Capstone</option>
  </select>
  </div>
  </div>

	<div class="form-group">
  <label class="col-md-4 control-label" for="value">Value:</label>
  <div class="col-md-4">
  <input id="value" class="form-control" maxlength="9" type="text" value="4"></input>
  </div>
  </div>

      <input id="acad_events" type="hidden" name="acad_events" value="2"></input>
      <input id="ags" type="hidden" name="ags" value="10"></input>
      <input id="com_hours" type="hidden" name="com_hours" value="0"></input>
      <input id="pifs" type="hidden" name="pifs" value="1"></input>
      <input id="fdg" type="hidden" name="fdg" value="20"></input>
      <input id="f_acad_event" type="hidden" name="f_acad_event" value="4"></input>
      <input id="capstone" type="hidden" name="capstone" value="0"></input>

<div class="form-group">
  <label class="col-md-4 control-label" for="submitButton"></label>
  <div class="col-md-4">
    <button type="button" id="submitButton" name="submitButton" class="btn btn-primary">Change</button>
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
                <th data-column-id="acad_events" data-type="numeric" >CCEs</th>
                <th data-column-id="ags" data-type="numeric" >Activity Groups</th>
                <th data-column-id="com_hours" data-type="numeric" >Comm Service Hours</th>
                <th data-column-id="pifs" data-type="numeric" >PIFs</th>
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

