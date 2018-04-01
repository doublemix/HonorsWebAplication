
<body>

<script type="text/javascript">

function showMessage(result){
	 if(result === "success"){
		  $("#error_area").queue(function(){
		  $("#error_area").text("Password Changed.");
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

    var form = $('#password_change_form');
    var formData = $(form).serialize();
    
    $.ajax({
        type: 'POST',
        url: "SCRIPTS/requests/passwordchangerequest.php",
        data: formData,
        cache: false,
        dataType: "text",
        success: function(result){
        	if(result === "success"){
        		$("#password_change_form").trigger("reset");
        	} else {
        	}
        	
        	showMessage(result);
        }
    });
    
    
    
});



});



</script>

<form id="password_change_form" method="post" name="passwordchangerequest" class="form-horizontal">
<fieldset>

<!-- Form Name -->
<legend>Change Password</legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="usr_username">Your Username:</label>  
  <div class="col-md-4">
  <input name="usr_username" class="form-control input-md" id="usr_username" required type="text" maxlength="20" placeholder="Username">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="old_pass">Old Password:</label>  
  <div class="col-md-4">
  <input class="form-control input-md" id="old_pass" name="old_pass" required type="password" maxlength="80" placeholder="Old Password">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="new_pass">New Password:</label>  
  <div class="col-md-4">
  <input name="new_pass" class="form-control input-md" id="new_pass" required type="password" maxlength="80" placeholder="New Password">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="confirm_pass">Confirm New Password</label>  
  <div class="col-md-4">
  <input name="confirm_pass" class="form-control input-md" id="confirm_pass" required type="password" maxlength="80" placeholder="Retype New Password">
    
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

<input type="hidden" name="passwordchangerequest" value="1"/>


<div class="form-group">
  <label class="col-md-4 control-label" for="error_area"></label>
  <div class="col-md-4">                     
    <span id="error_area"></span>
  </div>
</div>
</form>




</body>

