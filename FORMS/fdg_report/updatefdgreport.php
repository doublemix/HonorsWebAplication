<?php

  	session_start();

	require_once "../../SCRIPTS/db_connect.inc";

	$conn = DBConnect();

	$is_leader = false;

	$result = mysqli_query($conn, "SELECT sem_prefix FROM semesters WHERE sem_active = 1");

	$prefix = "";

	$row = "";

	if(mysqli_num_rows($result) > 0){
		$row = mysqli_fetch_row($result);
		$result = mysqli_query($conn, "SELECT * FROM " . $row[0] . "_fdg_leaders WHERE pstu_id = " . $_SESSION["userid"]);

		if(mysqli_num_rows($result) > 0){
			$is_leader = true;
		}
	}

	if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][3] == 1 || $is_leader) == false){
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

	    var starttime = $('#datetimepicker').datetimepicker('getDate');
	    var endtime = $('#datetimepickerend').datetimepicker('getDate');

	    var hours = endtime.getHours() - starttime.getHours();

	    $("#pfdg_report_hours").val(hours);

	    $("#datetimepicker").val($("#datetimepicker").val().toUpperCase());
	    $("#datetimepickerend").val($("#datetimepickerend").val().toUpperCase());
	    var form = $('#fdg_add_report_form');
	    var formData = $(form).serialize();

	    $.ajax({
	        type: 'POST',
	        url: "SCRIPTS/requests/fdgreportsrequest.php",
	        data: formData,
	        cache: false,
	        dataType: "text",
	        success: function(result){
	        	if(result === "success"){

	        	} else {
	        	}

	        	showMessage(result, "Report Updated.");
	        }
	    })



	});

	var deletebutton = document.getElementById("deleteButton");
	$(deletebutton).click(function() {

		if(confirm("Are you sure you want to remove this report?")){

	    $.ajax({
	        type: 'POST',
	        url: "SCRIPTS/requests/fdgreportsrequest.php",
	        data: {
				'opcode' : '2',
				'fdgreportrequest' : '1',
				'prefix' : $("#sem_select").val(),
				'pfdg_report_id' : $("#report_select").val()

	        },
	        cache: false,
	        dataType: "text",
	        success: function(result){
	        	if(result === "success"){
	        		$("#pfdg_report_description").val("");
	        		$("#datetimepicker").val("");
	        		$("#datetimepickerend").val("");
	        		$("#fdg_select").trigger("change");
	        	} else {
	        	}

	        	showMessage(result, "Deleted report.");
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
	        url: '/SCRIPTS/json_source/fdg_leaders/getfdgsinsemester.php',
	        data: {
	        	'prefix' : $("#sem_select").val()
	        },
	        dataType: "json",
	        success:function(data) {

	        		$('#fdg_select').empty();

	        		$.each(data.rows, function(index, element) {

	        			$('#fdg_select').append("<option value=\"" + element.fdg_id + "\">" + element.fdg_name + "</option>");

	        		});

	        		$("#fdg_select").trigger("change");

	        }
	     });
	});

	$("#fdg_select").change(function(){
		$.ajax( {
			type: 'GET',
	        url: '/SCRIPTS/json_source/fdg_report/getreportsnodate.php',
	        data: {
	        	'prefix' : $("#sem_select").val(),
	        	'pfdg_id' : $("#fdg_select").val()
	        },
	        dataType: "json",
	        success:function(data) {

	        		$('#report_select').empty();

	        		$.each(data.rows, function(index, element) {

	        			$('#report_select').append("<option value=\"" + element.pfdg_report_id + "\">" + element.fdate + "</option>");

	        		});

					$("#report_select").trigger("change");

	        }
	     });
	});

	$("#report_select").change(function(){
		$.ajax( {
			type: 'GET',
	        url: '/SCRIPTS/json_source/fdg_report/getreportinformation.php',
	        data: {
	        	'prefix' : $("#sem_select").val(),
	        	'pfdg_report_id' : $("#report_select").val()
	        },
	        dataType: "json",
	        success:function(data) {

	        	$("#datetimepicker").val("");
    			$("#datetimepickerend").val("");
    			$("#pfdg_report_hours").val("");
    			$("#pfdg_report_description").val("");

	        		$.each(data.rows, function(index, element) {

						var start = new moment(element.pfdg_report_start_date);
						var end = new moment(element.pfdg_report_end_date);

	        			$("#datetimepicker").datetimepicker('setDate',start.toDate() );
	        			$("#datetimepickerend").datetimepicker('setDate',end.toDate() );
	        			$("#pfdg_report_hours").val(element.pfdg_report_hours);
	        			$("#pfdg_report_description").val(element.pfdg_report_description);


	        		});
	        		if($("#pfdg_report_description").val() == ""){
	    				$("#submitButton").prop('disabled', true);
	    				$("#deleteButton").prop('disabled', true);
	    			} else {
	    				$("#submitButton").prop('disabled', false);
	    				$("#deleteButton").prop('disabled', false);
	    			}
	        }
	     });



	});

	$("#fdg_select").trigger("change");

	});




</script>





<form id="fdg_add_report_form" method="post" action="#" name="fdgreportrequest" class="form-horizontal">

<fieldset>

<!-- Form Name -->

<legend>Update FDG Report</legend><?php

	$result = mysqli_query($conn, "SELECT sem_name, sem_prefix from semesters order by sem_id desc");

	if(!$is_leader){
	echo "<div class=\"form-group\">\n";
	echo "<label class=\"col-md-4 control-label\" for=\"sem_select\">Semester:</label>\n";
	echo "<div class=\"col-md-4\">";
	echo "<select id=\"sem_select\" name=\"prefix\" class=\"form-control\">";

	$count = 0;
	while($row = mysqli_fetch_row($result)){
		if($count == 0){
			$prefix = $row[1];
			echo "<option value=\"" . $row[1] . "\" selected>Current Semester</option>\n";
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
  <label class="col-md-4 control-label" for="fdg_select">FDG:</label>
  <div class="col-md-4">
  <select id="fdg_select" name="pfdg_id" class="form-control"><?php

  	if(!$is_leader){

  	$result = mysqli_query($conn, "SELECT fdg_name, fdg_id FROM fdg WHERE fdg_id IN (SELECT pfdg_id FROM " . $prefix . "_fdg)" );

  	while($row = mysqli_fetch_row($result)){
  		echo "<option value=\"" . $row[1] . "\">" . $row[0] . "</option>";
  	}
  	} else {
  		$result = mysqli_query($conn, "SELECT fdg_name, fdg_id FROM fdg Where fdg_id IN (SELECT pfdg_id FROM " . $prefix . "_fdg_leaders WHERE pstu_id = " . $_SESSION["userid"] . ")");
  		while($row = mysqli_fetch_row($result)){
  			echo "<option value=\"" . $row[1] . "\" selected>" . $row[0] . "</option>";
  		}
  	}



  	?></select>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="report_select">Report:</label>
  <div class="col-md-4">
  <select id="report_select" name="pfdg_report_id" class="form-control"></select>
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="pfdg_report_description">Description</label>
  <div class="col-md-4">
    <textarea name="pfdg_report_description" maxlength="500" class="form-control" id="pfdg_report_description"></textarea>
  </div>
</div>



<!-- Date Picker -->
<div class="form-group">
  <label class="col-md-4 control-label" for="datetimepicker">Start Date:</label>
  <div class="col-md-4">
    <div class="input-append date">
      <input id="datetimepicker" class="form-control" type="text" name="pfdg_report_start_date"></input>
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
      <input id="datetimepickerend" type="text" name="pfdg_report_end_date" class="form-control"></input>
      <span class="add-on">
        <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
      </span>
    </div>
  </div>
</div>

</fieldset>

<?php

if($is_leader){
	echo "<input id=\"pfdg_report_hours\" type=\"hidden\" name=\"pfdg_report_hours\" value=\"1\"/>";
} else {
	echo "<div class=\"form-group\">\n";
	echo "<label class=\"col-md-4 control-label\" for=\"pfdg_report_hours\">Hours</label>\n";
	echo "<div class=\"col-md-4\">\n";
	echo "<input id=\"pfdg_report_hours\" maxlength=\"7\" type=\"text\" class=\"form-control\" name=\"pfdg_report_hours\" value=\"1\"/>\n";
	echo "</div>\n";
	echo "</div>\n";
}
mysqli_free_result($result);
DBClose($conn);
?>



<div class="form-group">
  <label class="col-md-4 control-label" for="accept_button"></label>
  <div class="col-md-8">
    <button type="button" class="btn btn-success" id="submitButton" disabled>Update</button>
    <button type="button" class="btn btn-danger" id="deleteButton" disabled>Delete</button>
  </div>
</div>

<input type="hidden" name="opcode" value="3"/>
<input type="hidden" name="fdgreportrequest" value="1"/>

</form>
<div class="form-group">
  <label class="col-md-4 control-label" for="error_area"></label>
  <div class="col-md-4">
    <span id="error_area"></span>
  </div>
</div>
</body>

