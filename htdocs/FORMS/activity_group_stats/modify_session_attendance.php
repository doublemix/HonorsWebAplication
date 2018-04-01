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
		
	    
	    var form = $('#ag_ses_attendence');
	    var formData = $(form).serialize();
	    
	    $.ajax({
	        type: 'POST',
	        url: "SCRIPTS/requests/activitygroupstats.php",
	        data: formData,
	        cache: false,
	        dataType: "text",
	        success: function(result){
	        	if(result === "success"){
	        		$("#grid-command-buttons-agsesattend").bootgrid("reload");
	        		$("#user_name").val("");
	        	} else {
	        	}
	        	
	        	showMessage(result, "Activity Group Attendance Updated.");
	        }
	    })
	    
	    
	    
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
	        		$("#ag_select").trigger("change");
	        }
	     });
	});

	$("#ag_select").change(function(){
		$.ajax( {
			type: 'GET',
	        url: '/SCRIPTS/json_source/activity_group_stats/get_sessions_by_date.php',
	        data: {
	        	'prefix' : $("#sem_select").val(),
	        	'ag_id' : $("#ag_select").val()
	        },
	        dataType: "json",
	        success:function(data) {

	        		$('#session_select').empty();
					$("#submitButton").prop('disabled', true);
	        		$.each(data.rows, function(index, element) {
					$("#submitButton").prop('disabled', false);
	        			$('#session_select').append("<option value=\"" + element.agses_id + "\">" + element.fdate + "</option>");
	        		    
	        		});

					$("#session_select").trigger("change");
	        		
	        }
	     });
	});
	

	$("#session_select").change(function(){
		$("#grid-command-buttons-agsesattend").bootgrid("reload");
		$("#user_name").val("");
	});

	$("#user_name").autocomplete({


		 minLength: 0,
		 source: function(request, response) {
			    $.ajax({
			        url: "/SCRIPTS/json_source/activity_group_stats/get_students_for_ag_stat.php",
			        dataType: "json",
			        data: {
			            term : request.term,
			            prefix : $("#sem_select").val(),
			            ag_id : $("#ag_select").val(),
			            agses_id : $("#session_select").val()
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
	
	var grid = $("#grid-command-buttons-agsesattend").bootgrid({
	    ajax: true,
	    post: function ()
	    {
	        
	        return {
	            id: "b0df282a-0d67-40e5-8558-c9e93b7befed",
	            prefix: $("#sem_select").val(),
	            agses_id: $("#session_select").val()
	        };
	    },
	    url: "/SCRIPTS/json_source/activity_group_stats/get_students_in_session.php",
	    formatters: {
	        "commands": function(column, row)
	        {
	            return "<button id=\"" + row.agstat_id + "t3" + "\" type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-row-id=\"" + row.agstat_id + "\" data-student-name=\"" + row.usr_fname + " " + row.usr_lname + "\"><i id=\"btn" + row.agstat_id + "del\" class=\"fa fa-trash-o\"></i></button>";
	  	  
	        }
	        
	        
	    
	    }
	}).on("loaded.rs.jquery.bootgrid", function()
	{
	    /* Executes after data is loaded and rendered */
		grid.find(".command-delete").on("click", function(e){

	    	if(confirm("Are you sure you want to remove: \"" + $(this).data("student-name") + "\" from this Session?")){

	    	
	        	$.ajax( {
	        		type: 'POST',
	                url: '/SCRIPTS/requests/activitygroupstats.php',
	                data: {
	                	'activitygroupstatsrequest' : '1',
	                	'opcode' : '2',
	                	'agstat_id' : $(this).data("row-id"),
	                	'prefix' : $("#sem_select").val()
	                },
	                dataType: "text",
	                success:function(data) {
	                   
	                	if(data == "success"){
	                		$("#grid-command-buttons-agsesattend").bootgrid("reload");
	                	} else {
	                		//Do Nothing
	                	}
	                	
	                	showMessage(data, "Student Removed.");
	                	
	                }
	             });
	    	} else {
				//Do Nothing
	    	}
	       
	    	     });

	    
	    
	});
		
	$("#ag_select").trigger('change');
	});

	


</script>





<form id="ag_ses_attendence" method="post" action="#" name="activitygroupstatsrequest" class="form-horizontal">

<fieldset>

<!-- Form Name -->

<legend>Activity Group Attendance</legend>
	
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
  <label class="col-md-4 control-label" for="session_select">Session:</label>  
  <div class="col-md-4">
  <select id="session_select" name="agses_id" class="form-control"></select> 
  </div>
</div>	
	

<div class="form-group">
  <label class="col-md-4 control-label" for="user_name">Student:</label>  
  <div class="col-md-4">
  <input id="user_name"  placeholder="Student Name" class="form-control input-md" required type="text">
  <input type="hidden" id="usr_submit_id" name="pstu_id" value=""/>  
  </div>
</div>


</fieldset>




<div class="form-group">
  <label class="col-md-4 control-label" for="submitButton">Action</label>
  <div class="col-md-8">
    <button type="button" class="btn btn-primary" id="submitButton" disabled>Submit</button>
  </div>
</div>
<!-- Text input-->

<input type="hidden" name="opcode" value="1"/>
<input type="hidden" name="activitygroupstatsrequest" value="1"/>

</form>

<table id="grid-command-buttons-agsesattend" class="table table-condensed table-hover table-striped">
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


