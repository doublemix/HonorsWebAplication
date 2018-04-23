<?php

session_start();

require_once "../../SCRIPTS/db_utils.php";

?><body>

<script type="text/javascript">

function showMessage(result){
	 if(result === "success"){
		  $("#error_area").queue(function(){
		  $("#error_area").text("Exemption Grant Reported.");
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

    var form = $('#submit_exception_grant_form');
    var formData = $(form).serialize();

    $.ajax({
        type: 'POST',
        url: "SCRIPTS/requests/requestexceptionrequest.php",
        data: formData,
        cache: false,
        dataType: "text",
        success: function(result){
        	if(result === "success"){
        		$("#submit_exception_grant_form").trigger("reset");
        	} else {
        	}

        	showMessage(result);
        }
    })



});


});




</script>

<form id="submit_exception_grant_form" method="post" name="requestexceptiongrant">
<fieldset>

<!-- Form Name -->
<legend>Request Exemption</legend>

<!-- Checkbox Group -->
<div class="form-group">
    <label for="cce_half_reason_select[]" class="control-label">I am requesting exemption from TWO CCE's for the following reason(s):</label>
    <div>
        Check all that apply<br/>
        <div class="checkbox">
            <label><input type="checkbox" name="cce_half_reason_select[]" value="athelete_in" />Varsity Athlete OUT of Playing Season (Specify below for half exemption)</label>
        </div>
        <div class="checkbox">
            <label><input type="checkbox" name="cce_half_reason_select[]" value="athelete_out" />Varsity Athlete IN Playing Season (Please specify below)</label>
        </div>
        <div class="checkbox">
            <label><input type="checkbox" name="cce_half_reason_select[]" value="capstone" />Varsity Athlete IN Playing Season (Please specify below)</label>
        </div>
        <div class="checkbox">
            <label><input type="checkbox" name="cce_half_reason_select[]" value="atep_block" />Athetic Training (ATEP) Block</label>
        </div>
        <div class="checkbox">
            <label><input type="checkbox" name="cce_half_reason_select[]" value="nano" />Nanoscience Scholar</label>
        </div>
        <div class="checkbox">
            <label><input type="checkbox" name="cce_half_reason_select[]" value="fdg_leader" />FDG Leader</label>
        </div>
        <div class="checkbox">
            <label><input type="checkbox" name="cce_half_reason_select[]" value="edu_block" />Professional Semester Education Block</label>
        </div>
        <div class="checkbox">
            <label><input type="checkbox" name="cce_half_reason_select[]" value="other" />Other</label>
        </div>
    </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="control-label" for="details">Please use this section to elaborate on any items necessary.</label>
  <div>
    <textarea name="details" maxlength="500" class="form-control" id="com_description"></textarea>
  </div>
</div>

<!-- Checkbox Group -->
<div class="form-group">
    <label for="cce_full_reason_select[]" class="control-label">I am requesting exemption from ALL CCE's for the following reason(s):</label>
    <div>
        Check all that apply<br/>
        <div class="checkbox">
            <label><input type="checkbox" name="cce_full_reason_select[]" value="student_teaching" />Student Teaching</label>
        </div>
        <div class="checkbox">
            <label><input type="checkbox" name="cce_full_reason_select[]" value="study_abroad" />Studying Abroad</label>
        </div>
        <div class="checkbox">
            <label><input type="checkbox" name="cce_full_reason_select[]" value="internship" />Internship</label>
        </div>
    </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="control-label" for="submitButton"></label>
  <div>
    <button type="button" id="submitButton" name="submitButton" class="btn btn-primary">Submit</button>
  </div>
</div>

</fieldset>
<input type="hidden" name="opcode" value="request"/>
<input type="hidden" name="requestexceptionrequest" value="1"/>

</form>

<div class="form-group">
  <label class="col-md-4 control-label" for="error_area"></label>
  <div class="col-md-4">
    <span id="error_area"></span>
  </div>
</div>

</body>
