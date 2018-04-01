<?php 
session_start();

require_once "../../SCRIPTS/db_connect.inc";

$conn = DBConnect();

 if(($_SESSION["permissions"][0] == 1) == false){

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

var grid = $("#grid-command-buttons-probations").bootgrid({
	ajax: true,
    post: function ()
    {
        return {
            id: "b0df282a-0d67-40e5-8558-c9e93b7befed"
        };
    },
    url: "SCRIPTS/json_source/probations/getinformationforprobationmodify.php",
    formatters: {
        "commands": function(column, row)
        {
            return "<button id=\"" + row.probation_id + "t0" + "\" type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-row-id=\"" + row.probation_id + "\"><i id=\"btn" + row.probation_id +"\" class=\"fa fa-pencil\"></i></button> " +
            	   "<button id=\"" + row.probation_id + "t3" + "\" type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-row-id=\"" + row.probation_id + "\" data-probation-name=\"" + row.probation_name + "\"><i id=\"btn" + row.probation_id + "del\" class=\"fa fa-trash-o\"></i></button>";
        },
    
    	"probation_name": function(column, row)
    	{
    		return "<input id=\"" + row.probation_id + "t1" + "\" type=\"text\" class=\"form-control\" maxlength=\"60\" name=\"probation_name\"   data-orig=\"" + row.probation_name + "\" value=\"" + row.probation_name +  "\">";
    	},
        
        "probation_type": function(column, row)
    	{
        	var probation_string = "";
    		
    		probation_string = "<select id=\"" + row.probation_id + "t2" + "\" class=\"form-control\" name=\"probationtype\" data-orig=\"" + row.probation_type + "\" data-row-id=\"" + row.probation_type + "\">";
    		
    		if(row.probation_type == 0){
    			probation_string += "<option value=\"0\" selected>Activity Groups</option>";
    		} else {
    			probation_string += "<option value=\"0\">Activity Groups</option>";
    		}
    		
    		if(row.probation_type == 1){
    			probation_string += "<option value=\"1\" selected>Academic Events</option>";
    		} else {
    			probation_string += "<option value=\"1\">Academic Events</option>";
    		}
    		
    		if(row.probation_type == 2){
    			probation_string += "<option value=\"2\" Selected>Community Service</option>";
    		} else {
    			probation_string += "<option value=\"2\">Community Service</option>";
    		}
    		
    		if(row.probation_type == 3){
    			probation_string += "<option value=\"3\" Selected>Academic Probation</option>";
    		} else {
    			probation_string += "<option value=\"3\">Academic Probation</option>";
    		}
    		if(row.probation_type == 4){
    			probation_string += "<option value=\"4\" Selected>Honors Credits</option>";
    		} else {
    			probation_string += "<option value=\"4\">Honors Credits</option>";
    		}
    		if(row.probation_type == 5){
    			probation_string += "<option value=\"5\" Selected>Behavioral</option>";
    		} else {
    			probation_string += "<option value=\"5\">Behavioral</option>";
    		}
    		
    		probation_string += "</select>";
    		
    		return probation_string;    	}
    
    }
}).on("loaded.rs.jquery.bootgrid", function()
{
    /* Executes after data is loaded and rendered */
    grid.find(".command-edit").on("click", function(e)
    {

    	var id = $(this).data("row-id");
        var probation_type = $("#" + id + "t2").val();
        var probation_name = $("#" + id + "t1").val();
		var button_id = "#btn" + id;

        
        $(button_id).removeClass("fa-pencil");
        $(button_id).addClass("fa-cog fa-spin");
    	
        	$.ajax( {
        		type: 'POST',
                url: '/SCRIPTS/requests/probationsrequest.php',
                data: {
                	'probationsmodifyrequest' : '1',
                	'opcode' : '3',
                	'probation_id' : id,
                	'probation_name' : probation_name,
                	'probation_type' : probation_type
                },
                dataType: "text",
                success:function(data) {

					if(data == "success"){
						 $("#" + id + "t2").css({"background-color": ""});
				         $("#" + id + "t1").css({"background-color": ""});
				         $("#" + id + "t2").data({"orig": probation_type});
				         $("#" + id + "t1").data({"orig": probation_name});
					}	
                	
                	showMessage(data, "Probation Updated");
                	
                }
             });
        	
        	$(button_id).removeClass("fa-cog fa-spin");
        	$(button_id).addClass("fa-pencil");
    }).end().find(".command-delete").on("click", function(e){
    		    
    	
    	if(confirm("Are you sure you want to delete the Probation: \"" + $(this).data("probation_name") + "\" from the database?")){
        	
        	$.ajax( {
        		type: 'POST',
                url: '/SCRIPTS/requests/probationsrequest.php',
                data: {
                	'probationsmodifyrequest' : '1',
                	'opcode' : '2',
                	'probation_id' : $(this).data("row-id")
                },
                dataType: "text",
                success:function(data) {
                   
                	if(data == "success"){
                		$("#grid-command-buttons-probations").bootgrid("reload");
                	} else {
                		//Do Nothing
                	}
                	
                	showMessage(data, "Probation Deleted.");
                	
                }
             });
        	
        } else {
        	//Do nothing lol
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

    
    
    var form = $('#probations_form');
    var formData = $(form).serialize();
    
    $.ajax({
        type: 'POST',
        url: $(form).attr('action'),
        data: formData,
        cache: false,
        dataType: "text",
        success: function(result){
        	if(result == "success"){
        		$("#probations_form").trigger("reset");
        		$("#grid-command-buttons-probations").bootgrid("reload");
        	} else {
        	}
        	
        	showMessage(result, "Probation Added.");
        }
    })
    
    
    
});

});



</script>



<form id="probations_form" method="post" action="SCRIPTS/requests/probationsrequest.php" name="probationsmodifyrequest" class="form-horizontal">

<fieldset>

<!-- Form Name -->
<legend>Create Probation</legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="probation_name">Probation Name:</label>  
  <div class="col-md-4">
  <input id="probation_name" maxlength="60" name="probation_name" placeholder="Probation Name" class="form-control input-md" required type="text">  
  </div>
</div>
<!-- <div class="form-group">
  <label class="col-md-4 control-label" for="probation_type">Probation Type:</label>  
  <div class="col-md-4">
  <select id="probation_type" name="probation_type" class="form-control input-md" required>
  		<option value="0" selected="selected">Activity Groups</option>
  		<option value="1">Academic Events</option>
  		<option value="2">Community Service</option>
  		<option value="3">Academic</option>
  		<option value="4">Honors Credits</option>
  		<option value="5">Behavioral</option>
  		
  </select>  
  </div>
</div>
-->
<input type="hidden" id="probation_type" name="probation_type" value="0">

</fieldset>
<input type="hidden" name="opcode" value="1"/>
<input type="hidden" name="probationsmodifyrequest" value="1"/>



<div class="form-group">
  <label class="col-md-4 control-label" for="submitButton"></label>
  <div class="col-md-4">
    <button type="button" id="submitButton" name="submitButton" class="btn btn-primary">Submit</button>
  </div>
</div>

</form>

<table id="grid-command-buttons-probations" class="table table-condensed table-hover table-striped">
        <thead>
            <tr>
                <th data-column-id="probation_name" data-type="text" data-formatter="probation_name" >Probation Name</th>
               <!-- <th data-column-id="probation_type" data-type="numeric" data-formatter="probation_type">Probation Type</th> -->
                <th data-column-id="probation_id" data-type="numeric" data-identifier="true">Probation ID</th>
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