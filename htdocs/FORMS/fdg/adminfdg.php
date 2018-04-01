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

var grid = $("#grid-command-buttons-fdg").bootgrid({
    ajax: true,
    post: function ()
    {
        return {
            id: "b0df282a-0d67-40e5-8558-c9e93b7befed"
        };
    },
    url: "SCRIPTS/json_source/fdg/getfdgforupdate.php",
    formatters: {
        "commands": function(column, row)
        {
            return "<button id=\"" + row.fdg_id + "t0" + "\" type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-row-id=\"" + row.fdg_id + "\"><i id=\"btn" + row.fdg_id +"\" class=\"fa fa-pencil\"></i></button> " +
            	   "<button id=\"" + row.fdg_id + "t3" + "\" type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-fdg_name=\"" + row.fdg_name + "\" data-row-id=\"" + row.fdg_id + "\"><i id=\"btn" + row.fdg_id + "del\" class=\"fa fa-trash-o\"></i></button>";
        },
    
    	"fdg_name": function(column, row)
    	{
    		return "<input id=\"" + row.fdg_id + "t1" + "\" type=\"text\" class=\"form-control\" name=\"fdg_name\" maxlength=\"25\"  data-orig=\"" + row.fdg_name + "\" value=\"" + row.fdg_name +  "\">";
    	},
    	
    	"fdg_bg_color": function(column, row)
    	{
    		return "<input id=\"" + row.fdg_id + "t4" + "\" type=\"text\" class=\"form-control\" name=\"fdg_bg_color\" maxlength=\"7\"  data-orig=\"" + row.fdg_bg_color + "\" value=\"" + row.fdg_bg_color +  "\">";
    	},
    	
    	"fdg_ft_color": function(column, row)
    	{
    		return "<input id=\"" + row.fdg_id + "t5" + "\" type=\"text\" class=\"form-control\" name=\"fdg_ft_color\" maxlength=\"7\"  data-orig=\"" + row.fdg_ft_color + "\" value=\"" + row.fdg_ft_color +  "\">";
    	},
        
        "fdg_imagepath": function(column, row)
    	{
        	return "<input id=\"" + row.fdg_id + "t2" + "\" type=\"text\" class=\"form-control\" name=\"fdg_imagepath\" maxlength=\"60\" data-orig=\"" + row.fdg_imagepath + "\" value=\"" + row.fdg_imagepath +  "\">";
    	}
    
    }
}).on("loaded.rs.jquery.bootgrid", function()
{
    /* Executes after data is loaded and rendered */
    grid.find(".command-edit").on("click", function(e)
    {

    	var id = $(this).data("row-id");
        var fdg_imagepath = $("#" + id + "t2").val();
        var fdg_name = $("#" + id + "t1").val();
        var fdg_bg_color = $("#" + id + "t4").val();
        var fdg_ft_color = $("#" + id + "t5").val();
		var button_id = "#btn" + id;

        
        $(button_id).removeClass("fa-pencil");
        $(button_id).addClass("fa-cog fa-spin");
    	
        	$.ajax( {
        		type: 'POST',
                url: '/SCRIPTS/requests/fdgrequest.php',
                data: {
                	'fdgmodifyrequest' : '1',
                	'opcode' : '3',
                	'fdg_id' : id,
                	'fdg_name' : fdg_name,
                	'fdg_bg_color' : fdg_bg_color,
                	'fdg_ft_color' : fdg_ft_color,
                	'fdg_imagepath' : fdg_imagepath
                },
                dataType: "text",
                success:function(data) {

					if(data == "success"){
						 $("#" + id + "t2").css({"background-color": ""});
				         $("#" + id + "t1").css({"background-color": ""});
				         $("#" + id + "t4").css({"background-color": ""});
				         $("#" + id + "t5").css({"background-color": ""});
				         $("#" + id + "t2").data({"orig": fdg_imagepath});
				         $("#" + id + "t1").data({"orig": fdg_name});
				         $("#" + id + "t4").data({"orig": fdg_bg_color});
				         $("#" + id + "t5").data({"orig": fdg_ft_color});
					}	
                	
                	showMessage(data, "FDG Updated");
                	
                }
             });
        	
        	$(button_id).removeClass("fa-cog fa-spin");
        	$(button_id).addClass("fa-pencil");
    }).end().find(".command-delete").on("click", function(e){
    		    
    	
    	if(confirm("Are you sure you want to delete the FDG: \"" + $(this).data("fdg_name") + "\" from the database?")){
        	
        	$.ajax( {
        		type: 'POST',
                url: '/SCRIPTS/requests/fdgrequest.php',
                data: {
                	'fdgmodifyrequest' : '1',
                	'opcode' : '2',
                	'fdg_id' : $(this).data("row-id"),
                	'fdgmodifyrequest' : '1'
                },
                dataType: "text",
                success:function(data) {
                   
                	if(data == "success"){
                		$("#grid-command-buttons-fdg").bootgrid("reload");
                	} else {
                		//Do Nothing
                	}
                	
                	showMessage(data, "User Deleted.");
                	
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

    
    
    var form = $('#fdg_form');
    var formData = $(form).serialize();
    
    $.ajax({
        type: 'POST',
        url: $(form).attr('action'),
        data: formData,
        cache: false,
        dataType: "text",
        success: function(result){
        	if(result == "success"){
        		$("#fdg_form").trigger("reset");
        		$("#grid-command-buttons-fdg").bootgrid("reload");
        	} else {
        	}
        	
        	showMessage(result, "FDG Added.");
        }
    })
    
    
    
});

});



</script>



<form id="fdg_form" method="post" action="SCRIPTS/requests/fdgrequest.php" name="fdgmodifyrequest" class="form-horizontal">

<fieldset>

<!-- Form Name -->
<legend>Add FDG</legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="fdg_name">FDG Name:</label>  
  <div class="col-md-4">
  <input id="fdg_name" name="fdg_name" placeholder="FDG Name" class="form-control input-md" required type="text">  
  </div>
</div>


</fieldset>
<input type="hidden" name="opcode" value="1"/>
<input type="hidden" name="fdgmodifyrequest" value="1"/>



<div class="form-group">
  <label class="col-md-4 control-label" for="submitButton"></label>
  <div class="col-md-4">
    <button type="button" id="submitButton" name="submitButton" class="btn btn-primary">Submit</button>
  </div>
</div>

</form>

<table id="grid-command-buttons-fdg" class="table table-condensed table-hover table-striped">
        <thead>
            <tr>
                <th data-column-id="fdg_name" data-type="text" data-formatter="fdg_name" >FDG Name</th>
                <th data-column-id="fdg_imagepath" data-type="text">Image</th>
                <th data-column-id="fdg_bg_color" data-type="text" data-formatter="fdg_bg_color" >BG Color</th>
                <th data-column-id="fdg_ft_color" data-type="text" data-formatter="fdg_ft_color" >Font Color</th>
                <th data-column-id="fdg_id" data-type="numeric" data-identifier="true">FDG ID</th>
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
