<?php 
session_start();

require_once "../../SCRIPTS/db_connect.inc";

$conn = DBConnect();

 if(($_SESSION["permissions"][0] == 1) == false){

	header("location: index.php");
	die();
}

?><body>

<script type="text/javascript">

function showMessage(result){
	if(result === "success"){
		$("#error_area").queue(function(){
			$("#error_area").text("User Added.");
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

		var r = confirm("Are you sure you want to end the semester?");

		if(r == true){

		var m = confirm("Are you absolutely sure?");

		if(m == true){

		var d = prompt("Type \"yes\" to continue...", "");

		if(d == "yes"){
			
		var form = $('#semester_end_form');
		var formData = $(form).serialize();

		$.ajax({
			type: 'POST',
			url: "/SCRIPTS/requests/semestersrequest.php",
			data: formData,
			cache: false,
			dataType: "text",
			success: function(result){
				location.reload(true);
			}
		})

		}

		}

		}

	});

});



	</script>



	<form id="semester_end_form" method="post" action="#" name="semesterrequestdgjdfls" class="form-horizontal">

	<fieldset>

	<!-- Form Name -->
	<legend>End Semester</legend>

	<div class="form-group">
	<label class="col-md-4 control-label" for="submitButton"></label>
	<div class="col-md-4">
	<span>By Clicking the following button, you will end the semester. By ending the semester,
	 automatic inserts will no longer be provided. All inserts will have to be done manually by workers. 
	 All community service hours entered by students will still be stored in the previous community service table. 
	 However, upon the start of the next semester, all records completed AFTER the end date will carry over into 
	 the next semester, regardless of whether "Carry Over Comunity Service" is selected or not. To make starting 
	 the next semester easier, wait until all new students have been entered into the system.</span>
	</div>
	</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="sem_end">Increase Year Level:</label>  
  <div class="col-md-4">
  <select id="sem_end" name="increase_edu" class="form-control">
  <option value="2">NO</option>
  <option value="1">Yes</option>
  </select> 
  </div>
</div>	

	<!-- Button -->
	<div class="form-group">
	<label class="col-md-4 control-label" for="submitButton"></label>
	<div class="col-md-4">
	<button type="button" id="submitButton" name="submitButton" class="btn btn-primary">Submit</button>
	</div>
	</div>

	

	</fieldset>
	<input type="hidden" name="opcode" value="4"/>
	<input type="hidden" name="semesterrequestdgjdfls" value="1"/>

	<!-- Textarea -->
	<div class="form-group">
	<label class="col-md-4 control-label" for="error_area"></label>
	<div class="col-md-4">
	<span id="error_area"></span>
	</div>
	</div>

	</form>



	</body>




