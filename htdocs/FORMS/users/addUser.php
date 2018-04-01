<?php 
session_start();

require_once "../../SCRIPTS/db_connect.inc";

$conn = DBConnect();

 if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][2] == 1) == false){

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

    
    
    var form = $('#users_form');
    var formData = $(form).serialize();
    
    $.ajax({
        type: 'POST',
        url: $(form).attr('action'),
        data: formData,
        cache: false,
        dataType: "text",
        success: function(result){
        	if(result === "success"){
        		$("#users_form").trigger("reset");
        	} else {
        	}
        	
        	showMessage(result);
        }
    })
    
    
    
});

});



</script>



<form id="users_form" method="post" action="SCRIPTS/requests/userrequest.php" name="adduserform" class="form-horizontal">

<fieldset>

<!-- Form Name -->
<legend>Add Users</legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="school_email">School Email</label>  
  <div class="col-md-4">
  <input id="school_email" name="school_email" maxlength="60" placeholder="School Email" class="form-control input-md" required type="text">
  <span class="help-block">Enter School Email</span>  
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="fname">First Name</label>  
  <div class="col-md-4">
  <input id="fname" name="fname" placeholder="First Name" maxlength="20" class="form-control input-md" required type="text">
  <span class="help-block">First Name of user</span>  
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="lname">Last Name</label>  
  <div class="col-md-4">
  <input id="lname" name="lname" placeholder="Last Name" maxlength="35" class="form-control input-md" required type="text">
  <span class="help-block">Last Name of user</span>  
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="school_id">School ID</label>  
  <div class="col-md-4">
  <input id="school_id" name="school_id" placeholder="School ID" maxlength="6" class="form-control input-md" required type="text">
  <span class="help-block">School ID of user</span>  
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="perm_email">Permanent Email</label>  
  <div class="col-md-4">
  <input id="perm_email" name="perm_email" placeholder="Permanent Email" maxlength="60" class="form-control input-md" type="text">
  <span class="help-block">Permanent Email of user</span>  
  </div>
</div>

<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="status">Status</label>
  <div class="col-md-4">
    <select id="status" name="status" class="form-control">
      <option value="2" selected>Student</option>
      <option value="3">Graduate</option>
      <option value="4">Inactive</option>
      <option value="5">Professor</option>
      <option value="6">Removed From Program</option>
    </select>
  </div>
</div>

<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="education">Education</label>
  <div class="col-md-4">
    <select id="education" name="education" class="form-control">
      <option value="1" selected>Freshman</option>
      <option value="2">Sophomore</option>
      <option value="3">Junior</option>
      <option value="4">Senior +</option>
      <option value="5">Graduate</option>
      <option value="6">Professor</option>
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
<input type="hidden" name="adduserform" value="1"/>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="error_area"></label>
  <div class="col-md-4">                     
    <span id="error_area"></span>
  </div>
</div>

</form>


	
</body>
