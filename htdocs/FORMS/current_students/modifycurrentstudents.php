<?php 
session_start();

require_once "../../SCRIPTS/db_connect.inc";

$conn = DBConnect();

 if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][2] == 1) == false){
	
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


var grid = $("#grid-command-buttons-currstus").bootgrid({
    ajax: true,
    post: function ()
    {
        
        return {
            id: "b0df282a-0d67-40e5-8558-c9e93b7befed",
            prefix: $("#sem_select").val()
        };
    },
    url: "/SCRIPTS/json_source/current_students/getcurrentstudentsdata.php",
    formatters: {
        "commands": function(column, row)
        {
            return "<button id=\"" + row.pstu_id + "t0" + "\" type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-row-id=\"" + row.pstu_id + "\"><i id=\"btn" + row.pstu_id +"\" class=\"fa fa-pencil\"></i></button> " +
            	   "<button id=\"" + row.pstu_id + "t3" + "\" type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-row-id=\"" + row.pstu_id + "\" data-student-name=\"" + row.usr_fname + " " + row.usr_lname + "\"><i id=\"btn" + row.pstu_id + "del\" class=\"fa fa-trash-o\"></i></button>";
        },
    
    	"pstu_in_fdg": function(column, row)
    	{
    		var str =  "<select class=\"form-control\"id=\"" + row.pstu_id + "t1" + "\" data-orig=\"" + row.pstu_in_fdg + "\">";

			if(row.pstu_in_fdg == 1){
				str+= "<option value=\"2\">No</option><option value=\"1\" selected>Yes</option>";
			} else {
				str+= "<option value=\"2\" selected>No</option><option value=\"1\">Yes</option>";
			}

			str += "</select>";

			return str;
    		
    	}
        
        
    
    }
}).on("loaded.rs.jquery.bootgrid", function()
{
    /* Executes after data is loaded and rendered */
    grid.find(".command-edit").on("click", function(e)
    {

    	var id = $(this).data("row-id");
        var pstu_in_fdg = $("#" + id + "t1").val();
		var button_id = "#btn" + id;
		var prefix = $("#sem_select").val();
        
        $(button_id).removeClass("fa-pencil");
        $(button_id).addClass("fa-cog fa-spin");
    	
        	$.ajax( {
        		type: 'POST',
                url: '/SCRIPTS/requests/currentstudentrequest.php',
                data: {
                	'currentstudentsrequest' : '1',
                	'opcode' : '3',
                	'pstu_id' : id,
                	'pstu_in_fdg' : pstu_in_fdg,
                	'prefix' : prefix
                },
                dataType: "text",
                success:function(data) {

					if(data == "success"){
				         $("#" + id + "t1").css({"background-color": ""});
				         $("#" + id + "t1").data({"orig": pstu_in_fdg});
					}	
                	
                	showMessage(data, "Student Record Updated");
                	
                }
             });
        	
        	$(button_id).removeClass("fa-cog fa-spin");
        	$(button_id).addClass("fa-pencil");
    }).end().find(".command-delete").on("click", function(e){

    	if(confirm("Are you sure you want to remove: \"" + $(this).data("student-name") + "\" from the active student list?")){

    	
        	$.ajax( {
        		type: 'POST',
                url: '/SCRIPTS/requests/currentstudentrequest.php',
                data: {
                	'currentstudentsrequest' : '',
                	'opcode' : '2',
                	'pstu_id' : $(this).data("row-id"),
                	'prefix' : $("#sem_select").val()
                },
                dataType: "text",
                success:function(data) {
                   
                	if(data == "success"){
                		$("#grid-command-buttons-currstus").bootgrid("reload");
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

$(document).on('change','select[data-orig]',function(){
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

    
    
    var form = $('#current_students_form');
    var formData = $(form).serialize();
    
    $.ajax({
        type: 'POST',
        url: "SCRIPTS/requests/currentstudentrequest.php",
        data: formData,
        cache: false,
        dataType: "text",
        success: function(result){
        	if(result == "success"){
        		$("#current_students_form").trigger("reset");
        		$("#grid-command-buttons-currstus").bootgrid("reload");
        	} else {
        	}
        	
        	showMessage(result, "Student Added.");
        }
    });
    
    
    
});



$("#user_name").autocomplete({


	 minLength: 0,
	 source: function(request, response) {
		    $.ajax({
		        url: "/SCRIPTS/json_source/current_students/getstudentsforautocomplete.php",
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
	$("#grid-command-buttons-currstus").bootgrid("reload");
});

});



</script>



<form id="current_students_form" method="post" action="#" name="currentstudentsrequest" class="form-horizontal">

<fieldset>

<!-- Form Name -->

<legend>Current Students</legend>

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
			echo "<option value=\"" . $row[1] . "\">" . $row[0] . "</option>\n";
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
  <label class="col-md-4 control-label" for="fdg_select">Add to FDG Pool:</label>  
  <div class="col-md-4">
  <select id="fdg_select" name="pstu_in_fdg" class="form-control">
  	<option value="2" selected>No</option>
  	<option value="1">Yes</option>
  </select> 
  </div>
</div>	 

</fieldset>

<input type="hidden" name="opcode" value="1"/>
<input type="hidden" name="currentstudentsrequest" value="1"/>



<div class="form-group">
  <label class="col-md-4 control-label" for="submitButton"></label>
  <div class="col-md-4">
    <button type="button" id="submitButton" name="submitButton" class="btn btn-primary">Submit</button>
  </div>
</div>

</form>

<table id="grid-command-buttons-currstus" class="table table-condensed table-hover table-striped">
        <thead>
            <tr>
                <th data-column-id="usr_fname" data-type="text" >First Name</th>
                <th data-column-id="usr_lname" data-type="text" >Last Name</th>
                <th data-column-id="usr_school_id" data-type="text" >School ID</th>
                <th data-column-id="pstu_in_fdg" data-formatter="pstu_in_fdg" >FDG Pool</th>
                <th data-column-id="pstu_id" data-type="numeric" data-identifier="true" >Student ID</th>
                <th data-column-id="commands" data-formatter="commands" data-sortable="false">Commands</th>
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
