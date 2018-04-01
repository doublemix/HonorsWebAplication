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

	 $(document).ready(function() {
		    
		$("#capstone_list").change(function () {

			var newValue = $("#capstone_list").val();
			
			$.ajax( {
        		type: 'POST',
                url: '/SCRIPTS/json_source/capstones/getcapstoneinfoforreview.php',
                data: {
                	'usr_id' : newValue,
                	'capstonereviewdata' : 1
                },
                dataType: "json",
                success:function(data) {

					//capstone_name, capstone_description, capstone_requirements, capstone_advisor
					$("#capstone_id").val(data[0]);
					$("#capstone_name").val(data[1]);
					$("#capstone_description").val(data[2]);
					$("#capstone_requirements").val(data[3]);
					$("#capstone_advisor").val(data[4]);

					$('#reject_button').prop("disabled", false);
					$('#accept_button').prop("disabled", false);
                }
             });
	        
	  	 });

		$("#accept_button").click(function () {

			var capstone_id = $("#capstone_id").val();
			
			$.ajax( {
        		type: 'POST',
                url: '/SCRIPTS/requests/capstonerequest.php',
                data: {
                	'capstone_id' : capstone_id,
                	'capstonechangerequest' : 1,
                	'opcode' : 3
                },
                dataType: "text",
                success:function(data) {

                	var userid = $("#capstone_list").val();
                	showMessage(data, "Capstone Approved.");
                	$('#cpop' + userid).remove();
                	$('#capstone_list option').eq(0).prop('selected', true);

                	$("#capstone_id").val("");
					$("#capstone_name").val("");
					$("#capstone_description").val("");
					$("#capstone_requirements").val("");
					$("#capstone_advisor").val("");

					$('#reject_button').prop("disabled", true);
					$('#accept_button').prop("disabled", true);
                }
             });
	        
	  	 });

		$("#reject_button").click(function () {

			var capstone_id = $("#capstone_id").val();
			
			$.ajax( {
        		type: 'POST',
                url: '/SCRIPTS/requests/capstonerequest.php',
                data: {
                	'capstone_id' : capstone_id,
                	'capstonechangerequest' : 1,
                	'opcode' : 4
                },
                dataType: "text",
                success:function(data) {
					var userid = $("#capstone_list").val();
                	showMessage(data, "Capstone Denied.");
                	$('#cpop' + userid).remove();
                	$('#capstone_list option').eq(0).prop('selected', true);

                	$("#capstone_id").val("");
					$("#capstone_name").val("");
					$("#capstone_description").val("");
					$("#capstone_requirements").val("");
					$("#capstone_advisor").val("");

					$('#reject_button').prop("disabled", true);
					$('#accept_button').prop("disabled", true);
                }
             });
	        
	  	 });
	    
		});	



</script>

<form class="form-horizontal">
<fieldset>

<!-- Form Name -->
<legend>Capstone Review</legend>

<div class="form-group">
  <label class="col-md-4 control-label" for="usr_school_id">Capstones:</label>  
  <div class="col-md-4">
  <select class="form-control input-md diggity" id="capstone_list">
  <option disabled selected> -- select user -- </option>
    <?php 
    
    require_once '../../SCRIPTS/db_connect.inc';
    
    $conn = DBConnect();
    
    $sql = "SELECT usr_id, usr_fname, usr_lname FROM users Join capstone Using(usr_id) Where capstone_complete = 0";
    
    $result = mysqli_query($conn, $sql);
    
    while($row = mysqli_fetch_row($result)){
    	echo "<option id=\"cpop" . $row[0] . "\" value=\"" . $row[0] . "\">" . $row[1] . " " . $row[2] . "</option>";
    }
    
    mysqli_free_result($result);
    
    DBClose($conn);
    
    ?>
  </select>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="capstone_name">Project Title</label>  
  <div class="col-md-4">
  <input name="capstone_name" class="form-control input-md" id="capstone_name" required type="text" placeholder="Title" readonly="readonly">
    
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="capstone_description">Description</label>
  <div class="col-md-4">                     
    <textarea name="capstone_description" class="form-control" id="capstone_description" readonly="readonly"></textarea>
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="capstone_requirements">Requirements</label>
  <div class="col-md-4">                     
    <textarea name="capstone_requirements" class="form-control" id="capstone_requirements" readonly="readonly"></textarea>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="capstone_advisor">Advisor</label>  
  <div class="col-md-4">
  <input name="capstone_advisor" class="form-control input-md" id="capstone_advisor" required type="text" placeholder="Advisor(s)" readonly="readonly">
    
  </div>
</div>



<!-- Button (Double) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="accept_button">Action</label>
  <div class="col-md-8">
    <button type="button" name="accept_button" class="btn btn-success" id="accept_button" disabled>Accept</button>
    <button type="button" name="reject_button" class="btn btn-danger" id="reject_button" disabled>Reject</button>
  </div>
</div>

<!-- Hidden Capstone ID -->
<input type="hidden" id="capstone_id">
</fieldset>
</form>
<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="error_area"></label>
  <div class="col-md-4">                     
    <span id="error_area"></span>
  </div>
</div>
</body>
