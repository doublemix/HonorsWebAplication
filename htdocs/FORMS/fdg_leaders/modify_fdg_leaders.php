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


var grid = $("#grid-command-buttons-fdgleader").bootgrid({
    ajax: true,
    post: function ()
    {
        
        return {
            id: "b0df282a-0d67-40e5-8558-c9e93b7befed",
            prefix: $("#sem_select").val()
        };
    },
    url: "/SCRIPTS/json_source/fdg_leaders/display_leaders.php",
    formatters: {
        "commands": function(column, row)
        {
            return "<button id=\"" + row.pfdg_leader_id + "t0" + "\" type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-row-id=\"" + row.pfdg_leader_id + "\"><i id=\"btn" + row.pfdg_leader_id +"\" class=\"fa fa-trash-o\"></i></button> "; 
            	  
        }
        
        
    
    }
}).on("loaded.rs.jquery.bootgrid", function()
{
    /* Executes after data is loaded and rendered */
	grid.find(".command-delete").on("click", function(e){

    	if(confirm("Are you sure you want to remove the leader from FDG Leaders?")){

    	
        	$.ajax( {
        		type: 'POST',
                url: '/SCRIPTS/requests/fdgleadersrequest.php',
                data: {
                	'fdgleadersrequest' : '1',
                	'opcode' : '2',
                	'pfdg_leader_id' : $(this).data("row-id"),
                	'prefix' : $("#sem_select").val()
                },
                dataType: "text",
                success:function(data) {
                   
                	if(data == "success"){
                		$("#grid-command-buttons-fdgleader").bootgrid("reload");
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

    
    
    var form = $('#fdg_leaders_form');
    var formData = $(form).serialize();
    
    $.ajax({
        type: 'POST',
        url: "SCRIPTS/requests/fdgleadersrequest.php",
        data: formData,
        cache: false,
        dataType: "text",
        success: function(result){
        	if(result == "success"){
        		$("#fdg_leaders_form").trigger("reset");
        		$("#grid-command-buttons-fdgleader").bootgrid("reload");
        	} else {
				//Do nothing, I guess....
            	}
        	
        }
    })
    
    
    
});



$("#user_name").autocomplete({


	 minLength: 0,
	 source: function(request, response) {
		    $.ajax({
		        url: "/SCRIPTS/json_source/fdg_leaders/getstudentsinsemester.php",
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
        		$("#grid-command-buttons-fdgleader").bootgrid("reload");
        }
     });
});

});



</script>

<form id="fdg_leaders_form" method="post" action="#" name="fdgleadersrequest" class="form-horizontal">

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

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="user_name">Student:</label>  
  <div class="col-md-4">
  <input id="user_name" placeholder="Student Name" class="form-control input-md" required type="text">
  <input type="hidden" id="usr_submit_id" name="pstu_id" value=""/>  
  </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label" for="fdg_select">FDG:</label>  
  <div class="col-md-4">
  <select id="fdg_select" name="pfdg_id" class="form-control"><?php 
  		
  	$conn = DBConnect();
  	
  	
  	
  	$result = mysqli_query($conn, "SELECT sem_prefix FROM semesters WHERE sem_id in (SELECT MAX(sem_id) From semesters)");
  	
  	$row = mysqli_fetch_row($result);
  	
  	mysqli_free_result($result);
  	
  	$result = mysqli_query($conn, "SELECT fdg_name, fdg_id FROM fdg WHERE fdg_id IN (SELECT pfdg_id FROM " . $row[0] . "_fdg)" );
  	
  	while($row = mysqli_fetch_row($result)){
  		echo "<option value=\"" . $row[1] . "\">" . $row[0] . "</option>";
  	}
  	
  	mysqli_free_result($result);
  	DBClose($conn);
  	
  	?></select> 
  </div>
</div>	 

<div class="form-group">
  <label class="col-md-4 control-label" for="submitButton"></label>
  <div class="col-md-4">
    <button type="button" id="submitButton" name="submitButton" class="btn btn-primary">Submit</button>
  </div>
</div>

</fieldset>

<input type="hidden" name="opcode" value="1"/>
<input type="hidden" name="fdgleadersrequest" value="1"/>

</form>


<table id="grid-command-buttons-fdgleader" class="table table-condensed table-hover table-striped">
        <thead>
            <tr>
                <th data-column-id="usr_fname" data-type="text" >First Name</th>
                <th data-column-id="usr_lname" data-type="text" >Last Name</th>
                <th data-column-id="usr_school_id" data-type="text" >Student ID</th>
                <th data-column-id="fdg_name" data-type="text" >FDG</th>
                <th data-column-id="pfdg_leader_id" data-type="numeric" data-identifier="true" data-visible="false">Leader ID</th>
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

