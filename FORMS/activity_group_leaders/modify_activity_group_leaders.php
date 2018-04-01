<?php 
session_start();

require_once "../../SCRIPTS/db_connect.inc";

$conn = DBConnect();

if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][6] == 1 || $is_leader == true) == false){
	
	header("location: index.php");
	die();
}

?><body>

<script type="text/javascript">



$(document).ready (function(){

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


var grid = $("#grid-command-buttons-ag_leaders").bootgrid({
    ajax: true,
    post: function ()
    {
        
        return {
            id: "b0df282a-0d67-40e5-8558-c9e93b7befed",
            prefix: $("#sem_select").val()
        };
    },
    url: "/SCRIPTS/json_source/activity_group_leaders/display_activity_group_leaders.php",
    formatters: {
        "commands": function(column, row)
        {
            return "<button id=\"" + row.ag_leaders + "t0" + "\" type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-student-name=\"" + row.usr_fname  + " "  +  row.usr_lname +  "\"  data-row-id=\"" + row.ag_leaders + "\"><i id=\"btn" + row.ag_leaders +"\" class=\"fa fa-trash-o\"></i></button> "; 
            	  
        }
        
        
    
    }
}).on("loaded.rs.jquery.bootgrid", function()
{
    /* Executes after data is loaded and rendered */
	grid.find(".command-delete").on("click", function(e){

    	if(confirm("Are you sure you want to remove: \"" + $(this).data("student-name") + "\" from AG Leader?")){

    	
        	$.ajax( {
        		type: 'POST',
                url: '/SCRIPTS/requests/activitygroupleadersrequest.php',
                data: {
                	'activitygroupleaders' : '1',
                	'opcode' : '2',
                	'ag_leaders' : $(this).data("row-id"),
                	'prefix' : $("#sem_select").val()
                },
                dataType: "text",
                success:function(data) {
                   
                	if(data == "success"){
                		$("#grid-command-buttons-ag_leaders").bootgrid("reload");
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

var subbutton = document.getElementById("submitButton");
$(subbutton).click(function() {
    // Stop the browser from submitting the form.

    
    
    var form = $('#activity_group_leaders_form');
    var formData = $(form).serialize();
    
    $.ajax({
        type: 'POST',
        url: "SCRIPTS/requests/activitygroupleadersrequest.php",
        data: formData,
        cache: false,
        dataType: "text",
        success: function(result){
        	if(result == "success"){
        		$("#activity_group_leaders_form").trigger("reset");
        		$("#grid-command-buttons-ag_leaders").bootgrid("reload");
        	} else {
				//Do nothing, I guess....
            	}

        	showMessage(result, "Student Added.");
        	
        }
    })
    
    
    
});



$("#user_name").autocomplete({
	 minLength: 0,
    source: function(request, response) {
	    $.ajax({
	        url: "/SCRIPTS/json_source/activity_group_leaders/get_students_for_ag_leader_autocompelte.php",
	        dataType: "json",
	        data: {
	            term : request.term,
	            prefix : $("#sem_select").val()
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
})


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
        		$("#grid-command-buttons-ag_leaders").bootgrid("reload");
        }
     });
});

});



</script>

<form id="activity_group_leaders_form" method="post" action="#" name="activitygroupleaders" class="form-horizontal">

<fieldset>

<!-- Form Name -->

<legend>Leader Assignment</legend>

<div class="form-group">
  <label class="col-md-4 control-label" for="sem_select">Semester:</label>  
  <div class="col-md-4">
  <select id="sem_select" name="prefix" class="form-control">
  	<?php 
  	
	$result = mysqli_query($conn, "SELECT sem_name, sem_prefix from semesters order by sem_id desc;");
	
	$count = 0;
	while($row = mysqli_fetch_row($result)){
		if($count == 0){
			echo "<option value=\"" . $row[1] . "\" selected>Current Semester</option>\n";
		} else {
			echo "<option value=\"" . $row[1] . "\" >" . $row[0] . "</option>\n";
		}
		$count++;
		
	}
	
	DBClose($conn);
	
  	?>
  </select> 
  </div>
</div>	


<div class="form-group">
  <label class="col-md-4 control-label" for="ag_select">Activity Group:</label>  
  <div class="col-md-4">
  <select id="ag_select" name="ag_id" class="form-control"><?php 
  		
  	$conn = DBConnect();
  	
  	
  	
  	$result = mysqli_query($conn, "SELECT sem_prefix FROM semesters WHERE sem_id in (SELECT MAX(sem_id) From semesters)");
  	
  	$row = mysqli_fetch_row($result);
  	
  	mysqli_free_result($result);
  	
  	$result = mysqli_query($conn, "SELECT ag_title, ag_id FROM " . $row[0] . "_activitygroup order by ag_title" );
  	
  	while($row = mysqli_fetch_row($result)){
  		echo "<option value=\"" . $row[1] . "\">" . $row[0] . "</option>";
  	}
  	
  	mysqli_free_result($result);
  	DBClose($conn);
  	
  	?></select> 
  </div>
</div>	 

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="user_name">Student:</label>  
  <div class="col-md-4">
  <input id="user_name" placeholder="Student Name" class="form-control input-md" required type="text">
  <input type="hidden" id="usr_submit_id" name="pstu_id" value=""/>  
  </div>
</div>
</fieldset>

<input type="hidden" name="opcode" value="1"/>
<input type="hidden" name="activitygroupleaders" value="1"/>



<div class="form-group">
  <label class="col-md-4 control-label" for="submitButton"></label>
  <div class="col-md-4">
    <button type="button" id="submitButton" name="submitButton" class="btn btn-primary">Submit</button>
  </div>
</div>

</form>


<table id="grid-command-buttons-ag_leaders" class="table table-condensed table-hover table-striped">
        <thead>
            <tr>
                <th data-column-id="usr_fname" data-type="text" >First Name</th>
                <th data-column-id="usr_lname" data-type="text" >Last Name</th>
                <th data-column-id="usr_school_id" data-type="text" >Student ID</th>
                <th data-column-id="ag_title" data-type="text" >AG Title</th>
                <th data-column-id="ag_leaders" data-type="numeric" data-identifier="true" data-visible="false">Leader ID</th>
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


