<?php 
session_start();

require_once "../../SCRIPTS/db_connect.inc";

$conn = DBConnect();

 if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][11] == 1) == false){

	header("location: index.php");
	die();
}

?><body>

<script type="text/javascript">

function showMessage(result, success){
	 if(result === "success"){
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

   
    var form = $('#addnewsstory_form');
    var formData = $(form).serialize();
    
    $.ajax({
        type: 'POST',
        url: "SCRIPTS/requests/newsrequest.php",
        data: formData,
        cache: false,
        dataType: "text",
        success: function(result){
        	if(result === "success"){
        		$("#addnewsstory_form").trigger("reset");
        		
        	} else {
        	}
        	
        	showMessage(result, "Story Added");
        }
    });
});
});



</script>

<form id="addnewsstory_form" method="post" name="accessnewsrequest" class="form-horizontal" action="#">
<fieldset>

<!-- Form Name -->
<legend>Add News Story</legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="news_title">Story Title</label>  
  <div class="col-md-4">
  <input name="news_title" maxlength="40" class="form-control input-md" id="news_title" required type="text" placeholder="Title">
    
  </div>
</div>


<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="news_text">Story Text:</label>
  <div class="col-md-4">                     
    <textarea name="news_text" maxlength="500" class="form-control" id="news_text"></textarea>
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
<input type="hidden" name="accessnewsrequest" value="1"/>


<div class="form-group">
  <label class="col-md-4 control-label" for="error_area"></label>
  <div class="col-md-4">                     
    <span id="error_area"></span>
  </div>
</div>
</form>




</body>
