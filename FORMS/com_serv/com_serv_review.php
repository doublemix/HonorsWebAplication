<?php 
session_start();

require_once "../../SCRIPTS/db_connect.inc";

$conn = DBConnect();

 if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][7] == 1) == false){

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


	function getNextForm(sem_prefix){

		$.ajax({
	        type: 'POST',
	        url: "SCRIPTS/json_source/com_serv/getcomservforreview.php",
	        data: {
					"prefix" : sem_prefix
	            },
	        cache: false,
	        dataType: "json",
	        success: function(result){
	        	
	        	$("#student").val(result.usr_fname + " " + result.usr_lname);
	        	$("#studentid").val(result.usr_school_id);
	        	$("#com_title").val(result.com_title);
	        	$("#com_description").val(result.com_description);
	        	$("#com_advisor").val(result.com_advisor);
	        	$("#com_advisor_contact").val(result.com_advisor_contact);

	        	var start = moment(result.com_date);
	        	$('#datetimepicker').val(start.format("MM/DD/YYYY hh:mm a"));
	        	$("#com_id").val(result.com_id);
	        	$("#com_hours").val(result.com_hours);
	        	
	        }
	    });
		
	}
	
var subbutton = document.getElementById("submitButton");
$(subbutton).click(function() {
    
  
    
    
    
});

$('#acceptButton').click( function(){
	  $.ajax({
	        type: 'POST',
	        url: "SCRIPTS/requests/comservrequest.php",
	        data: {
		        'communityservicerequest' : '1',
				'opcode' : '3',
				'prefix' : $('#sem_select').val(),
				'com_id' : $('#com_id').val(),
				'com_hours' : $('#com_hours').val()
	        	
	        },
	        cache: false,
	        dataType: "text",
	        success: function(result){
	        	if(result === "success"){
	        		getNextForm($('#sem_select').val())
	        	} else {
	        	}
	        	
	        	showMessage(result, "Community Service accepted.");
	        }
	    });
});

$('#rejectButton').click( function(){

	if(confirm("Are you sure you want to reject this request?")){

		
	
	  $.ajax({
	        type: 'POST',
	        url: "SCRIPTS/requests/comservrequest.php",
	        data: {
		        'communityservicerequest' : '1',
				'opcode' : '4',
				'prefix' : $('#sem_select').val(),
				'com_id' : $('#com_id').val()
	        },
	        cache: false,
	        dataType: "text",
	        success: function(result){
	        	if(result === "success"){
	        		getNextForm($('#sem_select').val())
	        	} else {
	        	}
	        	
	        	showMessage(result, "Community Service Rejected.");
	        }
	    });

	}
});



$("#sem_select").change(function(){

	getNextForm($("#sem_select").val());

});

getNextForm($("#sem_select").val());
	
});




</script>

<form id="addcom_serv_form" method="post" name="communityservicerequest" class="form-horizontal">
<fieldset>

<!-- Form Name -->
<legend>Community Service Review</legend>
<?php 

	echo "<div class=\"form-group\">\n";
	echo "<label class=\"col-md-4 control-label\" for=\"sem_select\">Semester:</label>\n";
	echo "<div class=\"col-md-4\">\n";
	echo "<select id=\"sem_select\" name=\"prefix\" class=\"form-control\">\n";
	
	$result = mysqli_query($conn, "SELECT sem_name, sem_prefix from semesters order by sem_id desc;");
	
	$count = 0;
	while($row = mysqli_fetch_row($result)){
		if($count == 0){
			echo "<option value=\"" . $row[1] . "\" selected>Current Semester</option>\n";
		} else {
			echo "<option value=\"" . $row[1] . "\">" . $row[0] . "</option>\n";
		}
		$count++;
	
	}
	echo "</select>\n";
	echo "</div>\n";
	echo "</div>\n";

?>
<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="student">Student:</label>  
  <div class="col-md-4">
  <input class="form-control input-md" id="student"  required type="text" placeholder="Name" readonly>
    
  </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label" for="com_title">Student ID:</label>  
  <div class="col-md-4">
  <input name="usr_student_id" class="form-control input-md" id="studentid" required type="text" placeholder="ID" readonly>
    
  </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label" for="com_title">Title</label>  
  <div class="col-md-4">
  <input name="com_title" class="form-control input-md" id="com_title" required type="text" placeholder="Title" readonly>
    
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="com_description">Description</label>
  <div class="col-md-4">                     
    <textarea name="com_description" class="form-control" id="com_description" readonly></textarea>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="com_advisor">Advisor</label>  
  <div class="col-md-4">
  <input name="com_advisor" class="form-control" id="com_advisor" required type="text" placeholder="Advisor(s)" readonly>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="com_advisor_contact">Advisor Contact</label>  
  <div class="col-md-4">
  <input name="com_advisor_contact" class="form-control input-md" id="com_advisor_contact" required type="text" placeholder="Contact Info" readonly>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="datetimepicker" >Date:</label>
  <div class="col-md-4">                     
    <div class="input-append date">
      <input id="datetimepicker" type="text" class="form-control" name="com_date" readonly></input>
    </div>
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="com_hours">Hours</label>
  <div class="col-md-4">                     
    <input name="com_hours" maxlength="6" class="form-control" id="com_hours" >
  </div>
</div>

<!-- Button (Double) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="accept_button">Action</label>
  <div class="col-md-8">
    <button type="button" name="accept_button" class="btn btn-success" id="acceptButton" >Accept</button>
    <button type="button" name="reject_button" class="btn btn-danger" id="rejectButton" >Reject</button>
  </div>
</div>

</fieldset>
<input type="hidden" name="communityservicerequest" value="1"/>
<input id="com_id" type="hidden" name="com_id" value=""/>

</form>

<div class="form-group">
  <label class="col-md-4 control-label" for="error_area"></label>
  <div class="col-md-4">                     
    <span id="error_area"></span>
  </div>
</div>





</body>

