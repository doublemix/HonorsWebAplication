<?php 

session_start();

require_once "../../SCRIPTS/db_connect.inc";

$conn = DBConnect();

?><body>

<script type="text/javascript">

function showMessage(result){
	 if(result === "success"){
		  $("#error_area").queue(function(){
		  $("#error_area").text("Community Service Reported.");
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

    var form = $('#addcom_serv_form');
    var formData = $(form).serialize();
    
    $.ajax({
        type: 'POST',
        url: "SCRIPTS/requests/comservrequest.php",
        data: formData,
        cache: false,
        dataType: "text",
        success: function(result){
        	if(result === "success"){
        		$("#addcom_serv_form").trigger("reset");
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

<?php

if($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1){

	echo "$(\"#user_name\").autocomplete({\n
	 minLength: 0,\n
	 source: function(request, response) {\n
		    $.ajax({\n
		        url: \"/SCRIPTS/json_source/com_serv/getstudentsforcomserv.php\",\n
		        dataType: \"json\",\n
		        data: {\n
		            term : request.term,\n
		            prefix : $(\"#sem_select\").val()\n
		        },\n
		        success: function(data) {\n
		            response(data);\n
		        }\n
		    });\n
		},\n
   focus: function( event, ui ) {\n
       $( \"#user_name\" ).val( ui.item.value );\n
       return false;\n
   },\n
   select: function( event, ui ) {\n
       $( \"#user_name\" ).val( ui.item.value );\n
       $(\"#usr_submit_id\").val(ui.item.id);\n
       return false;\n
	 }\n
});\n";

}
	?>

});




</script>

<form id="addcom_serv_form" method="post" name="communityservicerequest" class="form-horizontal">
<fieldset>

<!-- Form Name -->
<legend>Community Service Report</legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="com_title">Title</label>  
  <div class="col-md-4">
  <input name="com_title" maxlength="50" class="form-control input-md" id="com_title" name="com_title" required type="text" placeholder="Title">
    
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="com_description">Description</label>
  <div class="col-md-4">                     
    <textarea name="com_description" maxlength="500" class="form-control" id="com_description"></textarea>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="com_advisor">Advisor</label>  
  <div class="col-md-4">
  <input name="com_advisor" maxlength="60" class="form-control" id="com_advisor" required type="text" placeholder="Advisor(s)">
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="com_advisor_contact">Advisor Contact</label>  
  <div class="col-md-4">
  <input name="com_advisor_contact" maxlength="60" class="form-control input-md" id="com_advisor_contact" required type="text" placeholder="Contact Info">
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="datetimepicker">Start Date:</label>
  <div class="col-md-4">                     
    <div class="input-append date">
      <input id="datetimepicker" type="text" name="com_date" class="form-control"></input>
      <span class="add-on">
        <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
      </span>
    </div>
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="com_hours">Hours</label>
  <div class="col-md-4">                     
    <input type="text" maxlength="6" name="com_hours" class="form-control" id="com_hours" ></input>
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
<input type="hidden" name="communityservicerequest" value="1"/>

<?php 

if($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1){
	
	echo "<div class=\"form-group\">\n";
	echo "<label class=\"col-md-4 control-label\" for=\"sem_select\">Semester:</label>\n";
	echo "<div class=\"col-md-4\">\n";
	echo "<select id=\"sem_select\" name=\"prefix\" class=\"form-control\">\n";
	
	$result = mysqli_query($conn, "SELECT sem_name, sem_prefix from semesters order by sem_id desc");
	
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
	
	echo "<div class=\"form-group\">\n";
	echo "<label class=\"col-md-4 control-label\" for=\"user_name\">Student:</label>\n";
	echo "<div class=\"col-md-4\">\n";
	echo "<input id=\"user_name\" placeholder=\"Student Name\" class=\"form-control input-md\" required type=\"text\">\n";
	echo "<input type=\"hidden\" id=\"usr_submit_id\" name=\"pstu_id\" value=\"\"/>\n";
	echo "</div>\n";
	echo "</div>\n";
	
} else {
	
	$query = "SELECT sem_prefix FROM semesters WHERE sem_id IN(SELECT MAX(sem_id) FROM semesters)";
	
	$result = mysqli_query($conn, $query);
	
	$prefix = "";
	if(mysqli_num_rows($result) > 0){
		$row = mysqli_fetch_row($result);
		$prefix = $row[0];
	}
	
	
	$pstu_id = intval($_SESSION["userid"]);
	
	echo "<input type=\"hidden\" name=\"prefix\" value=\"$prefix\"/>\n";
	
	echo "<input type=\"hidden\" name=\"pstu_id\" value=\"$pstu_id\"/>\n";
}





?>

</form>

<div class="form-group">
  <label class="col-md-4 control-label" for="error_area"></label>
  <div class="col-md-4">                     
    <span id="error_area"></span>
  </div>
</div>





</body>
