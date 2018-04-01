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

function showMessage(result, success){
	if(result.indexOf("success") > -1){
		$("#error_area").queue(function(){
			$("#error_area").text(success);
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



		var form = $('#semester_add_form');
		var formData = $(form).serialize();

		$.ajax({
			type: 'POST',
			url: "/SCRIPTS/requests/semestersrequest.php",
			data: formData,
			cache: false,
			dataType: "text",
			success: function(result){
				if(result.indexOf("success") > -1){
					$("#semester_add_form").trigger("reset");
				} else {
				}
				 
				showMessage(result, "Semester was Started.");
				location.reload(true);
			}
		})



	});

});



	</script>



	<form id="semester_add_form" method="post" action="#" name="semesterrequestdgjdfls" class="form-horizontal">

	<fieldset>

	<!-- Form Name -->
	<legend>Start Semester</legend>

	

	<!-- Text input-->
	<div class="form-group">
	<label class="col-md-4 control-label" for="sem_name">Semester Name:</label>
	<div class="col-md-4">
	<input id="sem_name" name="sem_name" maxlength="20" placeholder="Semester Name" class="form-control input-md" required type="text">
	<span class="help-block">Name as it will Appear - Must be Unique</span>
	</div>
	</div>

	<!-- Text input-->
	<div class="form-group">
	<label class="col-md-4 control-label" for="sem_prefix">Semester Prefix:</label>
	<div class="col-md-4">
	<input id="sem_prefix" maxlength="20" name="sem_prefix" placeholder="Semester Prefix" class="form-control input-md" required type="text">
	<span class="help-block">Prefix of Semester - Must be Unique</span>
	</div>
	</div>

	<!-- Select Basic -->
	<div class="form-group">
	<label class="col-md-4 control-label" for="set_active_students">Set Active Students:</label>
	<div class="col-md-4">
	<select id="set_active_students" name="set_active_students" class="form-control">
	<option value="1" selected>Yes</option>
	<option value="2">No</option>
	</select>
	</div>
	</div>
	
	
	<div class="form-group">
	<label class="col-md-4 control-label" for="add_freshmen_to_fdg">Add Freshmen to FDG:</label>
	<div class="col-md-4">

	<select id="add_freshmen_to_fdg" name="add_freshmen_to_fdg" class="form-control">
	<option value="1" selected>Yes</option>
	<option value="2">No</option>
	</select>
	</div>
	</div>
	
	
	<div class="form-group">
	<label class="col-md-4 control-label" for="carry_over_fdg">Carry Over FDG:</label>
	<div class="col-md-4">
	<?php 
	$preserve = -1;
	$result = mysqli_query($conn, "Select MAX(sem_id) from semesters");
	
	$id = 0;
	
	while($row = mysqli_fetch_row($result)){
		$id = intval($row[0]);
	}
	
	if($id  <= 0){
		echo '<select id="carry_over_fdg" name="carry_over_fdg" class="form-control" disbaled>';
		echo '<option value="2" selected>No</option>';
	} else {
		
		$result = mysqli_query($conn, "Select carry_over_fdg from semesters WHERE sem_id = " . $id);
		
		
		
		while($row = mysqli_fetch_row($result)){
			$preserve = intval($row[0]);
		}
		
		if($preserve == 1){
			echo '<select id="carry_over_fdg" name="carry_over_fdg" class="form-control">';
			echo '<option value="1" >Yes</option>';
			echo '<option value="2" selected>No</option>';
		} else {
			echo '<select id="carry_over_fdg" name="carry_over_fdg" class="form-control">';
			echo '<option value="1" selected>Yes</option>';
			echo '<option value="2">No</option>';
		}
		
		
	}
	
	
	echo "</select>\n";
	
	
	echo "</div>\n";
	echo "</div>\n";
	
	
	$preserve = -1;
	
	echo '<div class="form-group">';
	echo '<label class="col-md-4 control-label" for="carry_over_com_serv">Carry Over Community Service:</label>';
	echo '<div class="col-md-4">';
	
	if($id <= 0){
		echo '<select id="carry_over_com_serv" name="carry_over_com_serv" class="carry_over_com_serv">';
		echo '<option value="2" selected>No</option>';
	} else {
	
		$result = mysqli_query($conn, "Select carry_over_com_serv from semesters WHERE sem_id = " . $id);
		
		while($row = mysqli_fetch_row($result)){
			$preserve = intval($row[0]);
		}
		
		
		if($preserve == 1){
			echo '<select id="carry_over_com_serv" name="carry_over_com_serv" class="form-control">';
			echo '<option value="1" >Yes</option>';
			echo '<option value="2" selected>No</option>';
		
		} else {
			echo '<select id="carry_over_com_serv" name="carry_over_com_serv" class="form-control">';
			echo '<option value="1" selected>Yes</option>';
			echo '<option value="2">No</option>';
		
		}
	
	}
	
	?>
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
	<input type="hidden" name="opcode" value="1"/>
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




