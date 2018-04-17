<?php 
session_start();

require_once "../../SCRIPTS/db_connect.inc";

$conn = DBConnect();

if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][5] == 1) == false){
	
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
	    // Stop the browser from submitting the form.		
	    
	    $("#datetimepicker").val($("#datetimepicker").val().toUpperCase());
	    $("#datetimepickerend").val($("#datetimepickerend").val().toUpperCase());
	    var form = $('#acad_event_add_form');
	    var formData = $(form).serialize();
	    
	    $.ajax({
	        type: 'POST',
	        url: "SCRIPTS/requests/academiceventrequest.php",
	        data: formData,
	        cache: false,
	        dataType: "text",
	        success: function(result){
	        	if(result === "success"){
	        		$("#acad_title").val("");
	        		$("#acad_description").val("");
	        		$("#datetimepicker").val("");
	        		$("#datetimepickerend").val("");
	        	} else {
	        	}
	        	
	        	showMessage(result);
	        }
	    })
	    
	    
	    
	});

	$('#datetimepicker').datetimepicker({
		timeInput: true,
		timeFormat: "hh:mm tt"
	});

	$('#datetimepickerend').datetimepicker({
		timeInput: true,
		timeFormat: "hh:mm tt"
	});

	$( '#datetimepicker' ).change(function() {

		var newtime = $('#datetimepicker').datetimepicker('getDate');
		
		newtime.setHours(newtime.getHours() + 1);
		
		$('#datetimepickerend').datetimepicker('setDate', newtime );
		
		});

	
	});




</script>





<form id="acad_event_add_form" method="post" action="#" name="academiceventsrequest" class="form-horizontal">

<fieldset>

<!-- Form Name -->

<legend>Add Freshman Event</legend><?php 
  
	
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
<!-- Date Picker -->
<div class="form-group">
  <label class="col-md-4 control-label" for="acad_title">Title:</label>
  <div class="col-md-4">                     
      <input id="acad_title" maxlength="60" class="form-control" type="text" name="acad_title"></input>
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="acad_description">Description</label>
  <div class="col-md-4">                     
    <textarea name="acad_description" maxlength="200" class="form-control" id="acad_description"></textarea>
  </div>
</div>

<!-- Date Picker -->
<div class="form-group">
  <label class="col-md-4 control-label" for="datetimepicker">Start Time:</label>
  <div class="col-md-4">                     
    <div class="input-append date">
      <input id="datetimepicker" class="form-control" type="text" name="acad_start_date"></input>
      <span class="add-on">
        <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
      </span>
    </div>
  </div>
</div>

<!-- Date Picker -->
<div class="form-group">
  <label class="col-md-4 control-label" for="datetimepickerend">End Time:</label>
  <div class="col-md-4">                     
    <div class="input-append date">
      <input id="datetimepickerend" type="text" name="acad_end_date" class="form-control"></input>
      <span class="add-on">
        <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
      </span>
    </div>
  </div>
</div>

</fieldset>


<input type="hidden" name="opcode" value="1"/>
<input type="hidden" name="academiceventsrequest" value="1"/>



<div class="form-group">
  <label class="col-md-4 control-label" for="submitButton"></label>
  <div class="col-md-4">
    <button type="button" id="submitButton" name="submitButton" class="btn btn-primary">Submit</button>
  </div>
</div>

</form>
<div class="form-group">
  <label class="col-md-4 control-label" for="error_area"></label>
  <div class="col-md-4">                     
    <span id="error_area"></span>
  </div>
</div>
</body>

