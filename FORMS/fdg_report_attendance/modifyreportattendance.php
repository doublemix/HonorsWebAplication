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
		
	    
	    var form = $('#fdg_add_report_attendence');
	    var formData = $(form).serialize();
	    
	    $.ajax({
	        type: 'POST',
	        url: "SCRIPTS/requests/fdgattendencerequest.php",
	        data: formData,
	        cache: false,
	        dataType: "text",
	        success: function(result){
	        	if(result === "success"){
	        		$("#grid-command-buttons-fdgreportattendence").bootgrid("reload");
	        		$("#user_name").val("");
	        	} else {
	        	}
	        	
	        	showMessage(result, "Report Attendance Updated.");
	        }
	    })
	    
	    
	    
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
	        url: '/SCRIPTS/json_source/fdg_report/getreports.php',
	        data: {
	        	'prefix' : $("#sem_select").val(),
	        	'pfdg_id' : $("#fdg_select").val()
	        },
	        dataType: "json",
	        success:function(data) {

	        		$('#report_select').empty();
	        		$("#submitButton").prop('disabled', true);
	        		$.each(data.rows, function(index, element) {

	        			$('#report_select').append("<option value=\"" + element.pfdg_report_id + "\">" + element.fdate + "</option>");
	        			$("#submitButton").prop('disabled', false);
	        		});

					$("#report_select").trigger("change");
	        		
	        }
	     });
	});

	$("#report_select").change(function(){
		$("#grid-command-buttons-fdgreportattendence").bootgrid("reload");
		$("#user_name").val("");
	});

	$("#user_name").autocomplete({


		 minLength: 0,
		 source: function(request, response) {
			    $.ajax({
			        url: "/SCRIPTS/json_source/fdg_report_attendence/fetstudentsinfdg.php",
			        dataType: "json",
			        data: {
			            term : request.term,
			            prefix : $("#sem_select").val(),
			            pfdg_id : $("#fdg_select").val(),
			            pfdg_report_id : $("#report_select").val()
			        },
			        success: function(data) {
			            response(data);
			        }
			    });
			},
	    focus: function( event, ui ) {
	        $( "#user_name" ).val( ui.item.value );
	        return false;
	    },
	    select: function( event, ui ) {
	        $( "#user_name" ).val( ui.item.value );
	        $("#usr_submit_id").val(ui.item.id);    
	        return false;
		 }
	});
	
	var grid = $("#grid-command-buttons-fdgreportattendence").bootgrid({
	    ajax: true,
	    post: function ()
	    {
	        
	        return {
	            id: "b0df282a-0d67-40e5-8558-c9e93b7befed",
	            prefix: $("#sem_select").val(),
	            pfdg_report_id: $("#report_select").val()
	        };
	    },
	    url: "/SCRIPTS/json_source/fdg_report_attendence/display_fdg_attendence.php",
	    formatters: {
	        "commands": function(column, row)
	        {
	            return "<button id=\"" + row.pfdg_att_id + "t3" + "\" type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-row-id=\"" + row.pfdg_att_id + "\" data-student-name=\"" + row.usr_fname + " " + row.usr_lname + "\"><i id=\"btn" + row.pfdg_att_id + "del\" class=\"fa fa-trash-o\"></i></button>";
	  	  
	        }
	        
	        
	    
	    }
	}).on("loaded.rs.jquery.bootgrid", function()
	{
	    /* Executes after data is loaded and rendered */
		grid.find(".command-delete").on("click", function(e){

	    	if(confirm("Are you sure you want to remove: \"" + $(this).data("student-name") + "\" from the report?")){

	    	
	        	$.ajax( {
	        		type: 'POST',
	                url: '/SCRIPTS/requests/fdgattendencerequest.php',
	                data: {
	                	'fdgattendencerequest' : '1',
	                	'opcode' : '2',
	                	'pfdg_att_id' : $(this).data("row-id"),
	                	'prefix' : $("#sem_select").val()
	                },
	                dataType: "text",
	                success:function(data) {
	                   
	                	if(data == "success"){
	                		$("#grid-command-buttons-fdgreportattendence").bootgrid("reload");
	                	} else {
	                		//Do Nothing
	                	}
	                	
	                	showMessage(data, "Member Removed.");
	                	
	                }
	             });
	    	} else {
				//Do Nothing
	    	}
	    	     });
	});
		
	$("#fdg_select").trigger("change");
	});

</script>





<form id="fdg_add_report_attendence" method="post" action="#" name="fdgattendencerequest" class="form-horizontal">

<fieldset>

<!-- Form Name -->

<legend>FDG Report Attendance</legend><?php 
	
	$result = mysqli_query($conn, "SELECT sem_name, sem_prefix from semesters order by sem_id desc");
	
	
	echo "<div class=\"form-group\">\n";
	echo "<label class=\"col-md-4 control-label\" for=\"sem_select\">Semester:</label>\n";
	echo "<div class=\"col-md-4\">";
	echo "<select id=\"sem_select\" name=\"prefix\" class=\"form-control\">";
	
	$count = 0;
	while($row = mysqli_fetch_row($result)){
		if($count == 0){
			$prefix = $row[1];
			echo "<option value=\"" . $row[1] . "\" selected>Current Semester</option>\n";
			if($is_leader == true){
				break;
			}
		} else {
			echo "<option value=\"" . $row[1] . "\">" . $row[0] . "</option>\n";
		}
		$count++;
		
	}
	
	echo "</select>";
	echo "</div>";
	echo "</div>";
	
	?>
	
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
  <label class="col-md-4 control-label" for="fdg_select">Report:</label>  
  <div class="col-md-4">
  <select id="report_select" name="pfdg_report_id" class="form-control"></select> 
  </div>
</div>	
	

<div class="form-group">
  <label class="col-md-4 control-label" for="user_name">Student:</label>  
  <div class="col-md-4">
  <input id="user_name" placeholder="Student Name" class="form-control input-md" required type="text">
  <input type="hidden" id="usr_submit_id" name="pstu_id" value=""/>  
  </div>
</div>


</fieldset>




<div class="form-group">
  <label class="col-md-4 control-label" for="submitButton"></label>
  <div class="col-md-8">
    <button type="button" class="btn btn-primary" id="submitButton" disabled>Submit</button>
  </div>
</div>
<!-- Text input-->

<input type="hidden" name="opcode" value="1"/>
<input type="hidden" name="fdgattendencerequest" value="1"/>

</form>

<table id="grid-command-buttons-fdgreportattendence" class="table table-condensed table-hover table-striped">
        <thead>
            <tr>
                <th data-column-id="usr_fname" data-type="text" >First Name</th>
                <th data-column-id="usr_lname" data-type="text" >Last Name</th>
                <th data-column-id="usr_school_id" data-type="text" >Student ID</th>
                <th data-column-id="commands" data-formatter="commands" data-sortable="false" >Commands</th>
            </tr>
        </thead>
    </table>
<div class="form-group">
  <label class="col-md-4 control-label" for="error_area"></label>
  <div class="col-md-4">                     
    <span id="error_area"></span>
  </div>
</div>
</body>


