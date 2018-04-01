<?php 
session_start();

require_once "../../SCRIPTS/db_connect.inc";

$conn = DBConnect();

if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][3] == 1) == false) {
	
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
	        url: "SCRIPTS/requests/fdgpointsrequest.php",
	        data: formData,
	        cache: false,
	        dataType: "text",
	        success: function(result){
	        	if(result === "success"){
	        		$("#grid-command-buttons-fdgreportattendence").bootgrid("reload");
	        		$("#user_name").val("");
	        	} else {
	        	}
	        	
	        	showMessage(result, "Points Added.");
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

	        		
	        		
	        }
	     });
		$.ajax( {
			type: 'GET',
	        url: '/SCRIPTS/json_source/fdg_points/get_fdg_events_in_semester.php',
	        data: {
	        	'prefix' : $("#sem_select").val()
	        },
	        dataType: "json",
	        success:function(data) {

	        		$('#report_select').empty();

	        		$.each(data.rows, function(index, element) {

	        			$('#report_select').append("<option value=\"" + element.pfdg_event_id + "\">" + element.pfdg_event_name + "</option>");
	        		    
	        		});

	        		
	        			$("#grid-command-buttons-fdgreportattendence").bootgrid("reload");
	        		
	        		
	        }
	     });
	});
	
	
		

	$("#report_select").change(function(){
		$("#grid-command-buttons-fdgreportattendence").bootgrid("reload");
	});

	$("#totalButton").click(function(){
		$("#opcode").val("2");
		$("#grid-command-buttons-fdgreportattendence").bootgrid("reload");
		$("#opcode").val("1");
	});
	
	var grid = $("#grid-command-buttons-fdgreportattendence").bootgrid({
	    ajax: true,
	    post: function ()
	    {
	        
	        return {
	            id: "b0df282a-0d67-40e5-8558-c9e93b7befed",
	            prefix: $("#sem_select").val(),
	            pfdg_event_id: $("#report_select").val(),
	            opcode : $("#opcode").val()
	        };
	    },
	    url: "/SCRIPTS/json_source/fdg_points/display_fdg_points.php",
	    formatters: {
	        "commands": function(column, row)
	        {
	            return "<button id=\"" + row.pfdg_points_id + "t0" + "\" type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-row-id=\"" + row.pfdg_points_id + "\"><i id=\"btn" + row.pfdg_points_id +"\" class=\"fa fa-pencil\"></i></button> " + 
	            "<button id=\"" + row.pfdg_points_id + "t3" + "\" type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-row-id=\"" + row.pfdg_points_id + "\" data-student-name=\"" + row.fdg_name + "\"><i id=\"btn" + row.pfdg_points_id + "del\" class=\"fa fa-trash-o\"></i></button>";
	  	  
	        },
	        "pfdg_points_points": function(column, row)
	        {

				if($("#opcode").val() == 1) {
		        
        		return "<input id=\"" + row.pfdg_points_id + "t1" + "\" type=\"text\" class=\"form-control\" name=\"capstone_name\"  data-row-id=\"" + row.pfdg_points_id + "\" data-orig=\"" + row.pfdg_points_points + "\" value=\"" + row.pfdg_points_points +  "\">";

				} else {

					return row.pfdg_points_points;

				}
					
	        }
	        
	        
	    
	    }
	}).on("loaded.rs.jquery.bootgrid", function()
	{
	    /* Executes after data is loaded and rendered */
		grid.find(".command-delete").on("click", function(e){

	    	if(confirm("Are you sure you want to remove: \"" + $(this).data("student-name") + "\" from the report?")){

	    	
	        	$.ajax( {
	        		type: 'POST',
	                url: '/SCRIPTS/requests/fdgpointsrequest.php',
	                data: {
	                	'fdgpointsrequest' : '1',
	                	'opcode' : '2',
	                	'pfdg_points_id' : $(this).data("row-id"),
	                	'prefix' : $("#sem_select").val()
	                },
	                dataType: "text",
	                success:function(data) {
	                   
	                	if(data == "success"){
	                		$("#grid-command-buttons-fdgreportattendence").bootgrid("reload");
	                	} else {
	                		//Do Nothing
	                	}
	                	
	                	showMessage(data, "Points Removed.");
	                	
	                }
	             });
	    	} else {
				//Do Nothing
	    	}
	       
	    	     }).end().find(".command-edit").on("click", function(e)
	    	    	        {

	    	        	var id = $(this).data("row-id");
	    	            var pfdg_points_points = $("#" + id + "t1").val();
	    	            
	    				var button_id = "#btn" + id;

	    	            
	    	            $(button_id).removeClass("fa-pencil");
	    	            $(button_id).addClass("fa-cog fa-spin");
	    	        	
	    	            	$.ajax( {
	    	            		type: 'POST',
	    	                    url: '/SCRIPTS/requests/fdgpointsrequest.php',
	    	                    data: {
	    	                    	'fdgpointsrequest' : '1',
	    	                    	'prefix' : $('#sem_select').val(),
	    	                    	'opcode' : '3',
	    	                    	'pfdg_points_id' : id,
	    	                    	'pfdg_points_points' : pfdg_points_points
	    	                    },
	    	                    dataType: "text",
	    	                    success:function(data) {

	    							if(data === "success"){
	    								
	    						         $("#" + id + "t1").css({"background-color": ""});
	    						       
	    						        
	    						         $("#" + id + "t1").data({"orig": pfdg_points_points});
	    						    
	    							}	
	    	                    	
	    	                    	showMessage(data, "Points Updated.");
	    	                    	
	    	                    }
	    	                 });
	    	            	
	    	            	$(button_id).removeClass("fa-cog fa-spin");
	    	            	$(button_id).addClass("fa-pencil");
	    	        });
	});

	$(document).on('change','input[data-orig]',function(){
	    $(this).toggleClass("txt_change");

		var now = $(this).val();
		var orig = $(this).data("orig");

		if(now == orig){
			$(this).css({"background-color": ""});
		} else {
			$(this).css({"background-color": "#ccffcc"});
		}
});

});

</script>

<form id="fdg_add_report_attendence" method="post" action="#" name="fdgpointsrequest" class="form-horizontal">

<fieldset>

<!-- Form Name -->

<legend>FDG Event Points</legend><?php 
  	
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
	
	
	$result = mysqli_query($conn, "SELECT sem_name, sem_prefix from semesters order by sem_id desc;");
	
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
		echo "<input type=\"hidden\" name=\"prefix\" value=\"$prefix\"/>\n";
	}?>
	


<div class="form-group">
  <label class="col-md-4 control-label" for="report_select">Event:</label>  
  <div class="col-md-4">
  <select id="report_select" name="pfdg_event_id" class="form-control"><?php 
  	
  $result = mysqli_query($conn, "SELECT pfdg_event_name, pfdg_event_id FROM $prefix" . "_fdg_event WHERE pfdg_start_date < NOW() order by pfdg_start_date desc" );
   
  while($row = mysqli_fetch_row($result)){
  	echo "<option value=\"" . $row[1] . "\">" . $row[0] . "</option>";
  }
  
  ?></select> 
  </div>
</div>	
	
	<div class="form-group">
  <label class="col-md-4 control-label" for="fdg_select">FDG:</label>  
  <div class="col-md-4">
  <select id="fdg_select" name="pfdg_id" class="form-control"><?php 
  	
  
  
  	$result = mysqli_query($conn, "SELECT fdg_name, fdg_id FROM fdg WHERE fdg_id IN (SELECT pfdg_id FROM " . $prefix . "_fdg)" );
  	
  	while($row = mysqli_fetch_row($result)){
  		echo "<option value=\"" . $row[1] . "\">" . $row[0] . "</option>";
  	}
  	
  	
  	
  	
  	?></select> 
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="pfdg_points_points">Points:</label>  
  <div class="col-md-4">
  <input id="pfdg_points_points" placeholder="Points" name="pfdg_points_points" class="form-control input-md" required type="text">
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="submitButton">Action</label>
  <div class="col-md-8">
    <button type="button" class="btn btn-primary" id="submitButton" >Submit</button>
  </div>
</div>


<div class="form-group">
  <label class="col-md-4 control-label" for="totalButton">Action</label>
  <div class="col-md-8">
    <button type="button" class="btn btn-primary" id="totalButton" >Show Total Points</button>
  </div>
</div>
</fieldset>




<!-- Text input-->

<input id="opcode" type="hidden" name="opcode" value="1"/>
<input type="hidden" name="fdgpointsrequest" value="1"/>

</form>

<table id="grid-command-buttons-fdgreportattendence" class="table table-condensed table-hover table-striped">
        <thead>
            <tr>
                <th data-column-id="fdg_name" data-type="text" >FDG</th>
                <th data-column-id="pfdg_points_points" data-formatter="pfdg_points_points" data-type="text" >Points</th>
                
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



