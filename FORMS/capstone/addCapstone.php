<?php 
session_start();

require_once "../../SCRIPTS/db_connect.inc";

$conn = DBConnect();

if (($_SESSION ["permissions"] [0] == 1) == false) {
	
	header("location: index.php");
	die();
}

?><body>

<script type="text/javascript">

function showMessage(result){
	 if(result === "success"){
		  $("#error_area").queue(function(){
		  $("#error_area").text("Capstone Added.");
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
    var form = $('#addcapstone_form');
    var formData = $(form).serialize();
    
    $.ajax({
        type: 'POST',
        url: "SCRIPTS/requests/capstonerequest.php",
        data: formData,
        cache: false,
        dataType: "text",
        success: function(result){
        	if(result === "success"){
        		$("#addcapstone_form").trigger("reset");
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

<form id="addcapstone_form" method="post" name="capstonechangerequest" class="form-horizontal">
<fieldset>

<!-- Form Name -->
<legend>Add Capstone</legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="usr_school_id">User School ID</label>  
  <div class="col-md-4">
  <input name="usr_school_id" class="form-control input-md" maxlength="6" id="usr_school_id" name="usr_school_id" required type="text" placeholder="School ID">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="capstone_name">Project Title</label>  
  <div class="col-md-4">
  <input name="capstone_name" maxlength="100" class="form-control input-md" id="capstone_name" name="capstone_title" required type="text" placeholder="Title">
    
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="capstone_description">Description</label>
  <div class="col-md-4">                     
    <textarea name="capstone_description" maxlength="500" class="form-control" id="capstone_description" name="capstone_description"></textarea>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="capstone_advisor">Advisor</label>  
  <div class="col-md-4">
  <input name="capstone_advisor" maxlength="60" class="form-control input-md" id="capstone_advisor" name="capstone_advisor" required type="text" placeholder="Advisor(s)">
    
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="capstone_requirements">Requirements</label>
  <div class="col-md-4">                     
    <textarea name="capstone_requirements" maxlength="200" class="form-control" id="capstone_requirements" name="capstone_requirements"></textarea>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="datetimepicker">Start Date:</label>
  <div class="col-md-4">                     
      <input id="datetimepicker" type="text" name="capstone_startdate" class="form-control"></input>
      <span class="add-on">
        <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
      </span>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="datetimepickerend">End Date:</label>
  <div class="col-md-4">                     
      <input id="datetimepickerend" type="text" name="capstone_enddate" class="form-control"></input>
      <span class="add-on">
        <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
      </span>
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
<input type="hidden" name="capstonechangerequest" value="1"/>


<div class="form-group">
  <label class="col-md-4 control-label" for="error_area"></label>
  <div class="col-md-4">                     
    <span id="error_area"></span>
  </div>
</div>
</form>




</body>
