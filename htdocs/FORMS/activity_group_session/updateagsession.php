<?php 
  	
  	session_start();
						
	require_once "../../SCRIPTS/db_connect.inc";
	require_once '../../SCRIPTS/get_permissions.inc';		
	
	$conn = DBConnect();
  	
$is_leader = false;
	
	$result = mysqli_query($conn, "SELECT sem_prefix FROM semesters WHERE sem_active = 1");
	
	$prefix = "";
	
	$row = "";
	
	if(mysqli_num_rows($result) > 0){
		$row = mysqli_fetch_row($result);
		$result = mysqli_query($conn, "SELECT * FROM " . $row[0] . "_activitygroupleaders  WHERE pstu_id = " . $_SESSION["userid"]);
		
		if(mysqli_num_rows($result) > 0){
			$is_leader = true;
		}
	}
	
	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][6] == 1 || $is_leader == true) == false){
		
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

	    
	    $("#datetimepicker").val($("#datetimepicker").val().toUpperCase());
	    $("#datetimepickerend").val($("#datetimepickerend").val().toUpperCase());
	    var form = $('#ag_update_session_form');
	    var formData = $(form).serialize();
	    
	    $.ajax({
	        type: 'POST',
	        url: "SCRIPTS/requests/activitygroupsession.php",
	        data: formData,
	        cache: false,
	        dataType: "text",
	        success: function(result){
	        	if(result === "success"){
	        		
	        	} else {
	        	}
	        	
	        	showMessage(result, "Session Updated.");
	        }
	    })
	    
	    
	    
	});

	var deletebutton = document.getElementById("deleteButton");
	$(deletebutton).click(function() {

		if(confirm("Are you sure you want to remove this session?")){
	    
	    $.ajax({
	        type: 'POST',
	        url: "SCRIPTS/requests/activitygroupsession.php",
	        data: {
				'opcode' : '2',
				'activitygroupsession' : '1',
				'prefix' : $("#sem_select").val(),
				'agses_id' : $("#session_select").val()

	        },
	        cache: false,
	        dataType: "text",
	        success: function(result){
	        	if(result === "success"){
	        		$("#agses_description").val("");
	        		$("#datetimepicker").val("");
	        		$("#datetimepickerend").val("");
	        		$("#ag_select").trigger("change");
	        	} else {
	        	}
	        	
	        	showMessage(result, "Deleted Session.");
	        }
	    })
	    
		}
	    
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


	$("#sem_select").change(function(){
		$.ajax( {
			type: 'GET',
	        url: '/SCRIPTS/json_source/activity_group_leaders/get_activity_groups_in_semester.php',
	        data: {
	        	'prefix' : $("#sem_select").val()
	        },
	        dataType: "json",
	        success:function(data) {

	        		$('#ag_select').empty();

	        		$.each(data.rows, function(index, element) {

	        			$('#ag_select').append("<option value=\"" + element.ag_id + "\">" + element.ag_title + "</option>");
	        		    
	        		});
	        		$("#ag_select").trigger('change');
	        }
	     });
		
	});

	$("#ag_select").change(function(){
		$.ajax( {
			type: 'GET',
	        url: '/SCRIPTS/json_source/activity_group_session/getsessions.php',
	        data: {
	        	'prefix' : $("#sem_select").val(),
	        	'ag_id' : $("#ag_select").val()
	        },
	        dataType: "json",
	        success:function(data) {

	        		$('#session_select').empty();

	        		$.each(data.rows, function(index, element) {

	        			$('#session_select').append("<option value=\"" + element.agses_id + "\">" + element.fdate + "</option>");
	        		    
	        		});

					$("#session_select").trigger("change");
	        		
	        }
	     });
	});

	$("#session_select").change(function(){
		$.ajax( {
			type: 'GET',
	        url: '/SCRIPTS/json_source/activity_group_session/get_session_information.php',
	        data: {
	        	'prefix' : $("#sem_select").val(),
	        	'agses_id' : $("#session_select").val()
	        },
	        dataType: "json",
	        success:function(data) {

	        	$("#datetimepicker").val("");
    			$("#datetimepickerend").val("");
    			$("#pfdg_report_hours").val("");
    			$("#agses_description").val("");
					
	        		$.each(data.rows, function(index, element) {

						var start = new moment(element.agses_start_time);
						var end = new moment(element.agses_end_time);
		        		
	        			$("#datetimepicker").datetimepicker('setDate',start.toDate() );
	        			$("#datetimepickerend").datetimepicker('setDate',end.toDate() );
	        			$("#agses_description").val(element.agses_description);

	        			
	        		});
	        		if($("#agses_description").val() == ""){
	    				$("#submitButton").prop('disabled', true);
	    				$("#deleteButton").prop('disabled', true);
	    			} else {
	    				$("#submitButton").prop('disabled', false);
	    				$("#deleteButton").prop('disabled', false);
	    			}
	        }
	     });

		
	     
	});

	$("#ag_select").trigger('change');
	
	});

	


</script>





<form id="ag_update_session_form" method="post" action="#" name="activitygroupsession" class="form-horizontal">

<fieldset>

<!-- Form Name -->

<legend>Update Activity Group Session</legend>
	<?php
	
	$result = mysqli_query($conn, "SELECT sem_name, sem_prefix from semesters order by sem_id desc;");
	
	if(!$is_leader){
	echo "<div class=\"form-group\">\n";
	echo "<label class=\"col-md-4 control-label\" for=\"sem_select\">Semester:</label>\n";
	echo "<div class=\"col-md-4\">";
	echo "<select id=\"sem_select\" name=\"prefix\" class=\"form-control\">";
	
	$count = 0;
	while($row = mysqli_fetch_row($result)){
		if($count == 0){
			echo "<option value=\"" . $row[1] . "\" selected>Current Semester</option>\n";
			$prefix = $row[1];
		} else {
			echo "<option value=\"" . $row[1] . "\">" . $row[0] . "</option>\n";
		}
		$count++;
		
	}
	
	echo "</select>";
	echo "</div>";
	echo "</div>";
	
	} else {
		$row = mysqli_fetch_row($result);
		$prefix = $row[1];
		echo "<input id=\"sem_select\" type=\"hidden\" name=\"prefix\" value=\"$prefix\"/>\n";
	}?>
	
	<div class="form-group">
  <label class="col-md-4 control-label" for="ag_select">Activity Group:</label>  
  <div class="col-md-4">
  <select id="ag_select" name="ag_id" class="form-control"><?php 
  	
if(!$is_leader){
  
  	$result = mysqli_query($conn, "SELECT ag_title, ag_id FROM " . $prefix . "_activitygroup" );
  	
  	while($row = mysqli_fetch_row($result)){
  		echo "<option value=\"" . $row[1] . "\">" . $row[0] . "</option>";
  	}
  	} else {
  		$result = mysqli_query($conn, "SELECT ag_title, ag_id FROM " . $prefix . "_activitygroup Where ag_id IN (SELECT ag_id FROM " . $prefix . "_activitygroupleaders WHERE pstu_id = " . $_SESSION["userid"] . ")");
  		while($row = mysqli_fetch_row($result)){
  			echo "<option value=\"" . $row[1] . "\" selected>" . $row[0] . "</option>";
  		}
  	}
  	
  	mysqli_free_result($result);
  	DBClose($conn);
  	
  	?></select> 
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="ag_select">Session:</label>  
  <div class="col-md-4">
  <select id="session_select" name="agses_id" class="form-control"></select> 
  </div>
</div>	
	
<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="agses_description">Description</label>
  <div class="col-md-4">                     
    <textarea name="agses_description" maxlength="500" class="form-control" id="agses_description"></textarea>
  </div>
</div>



<!-- Date Picker -->
<div class="form-group">
  <label class="col-md-4 control-label" for="datetimepicker">Start Date:</label>
  <div class="col-md-4">                     
    <div class="input-append date">
      <input id="datetimepicker" class="form-control" type="text" name="agses_start_time"></input>
      <span class="add-on">
        <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
      </span>
    </div>
  </div>
</div>

<!-- Date Picker -->
<div class="form-group">
  <label class="col-md-4 control-label" for="datetimepickerend">End Date:</label>
  <div class="col-md-4">                     
    <div class="input-append date">
      <input id="datetimepickerend" type="text" name="agses_end_time" class="form-control"></input>
      <span class="add-on">
        <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
      </span>
    </div>
  </div>
</div>

</fieldset>

<div class="form-group">
  <label class="col-md-4 control-label" for="accept_button">Action</label>
  <div class="col-md-8">
    <button type="button" class="btn btn-success" id="submitButton" disabled>Update</button>
    <button type="button" class="btn btn-danger" id="deleteButton" disabled>Delete</button>
  </div>
</div>

<input type="hidden" name="opcode" value="3"/>
<input type="hidden" name="activitygroupsession" value="1"/>

</form>
<div class="form-group">
  <label class="col-md-4 control-label" for="error_area"></label>
  <div class="col-md-4">                     
    <span id="error_area"></span>
  </div>
</div>
</body>

