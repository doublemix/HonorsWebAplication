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


var grid = $("#grid-command-buttons-fdgactive").bootgrid({
    ajax: true,
    post: function ()
    {
        
        return {
            id: "b0df282a-0d67-40e5-8558-c9e93b7befed",
            prefix: $("#sem_select").val()
        };
    },
    url: "/SCRIPTS/json_source/current_fdg/getcurrentfdgforupdate.php",
    formatters: {
        "commands": function(column, row)
        {
            return "<button id=\"" + row.fdg_id + "t0" + "\" type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-row-id=\"" + row.fdg_id + "\"><i id=\"btn" + row.fdg_id +"\" class=\"fa fa-trash-o\"></i></button>";
            	   
        }
        
        
    
    }
}).on("loaded.rs.jquery.bootgrid", function()
{
    /* Executes after data is loaded and rendered */
    grid.find(".command-edit").on("click", function(e)
    {

    	var id = $(this).data("row-id");
        
		var button_id = "#btn" + id;
		var prefix = $("#sem_select").val();
       

		
            
        $(button_id).removeClass("fa-pencil");
        $(button_id).addClass("fa-cog fa-spin");
    	
        	$.ajax( {
        		type: 'POST',
                url: '/SCRIPTS/requests/currentfdgrequest.php',
                data: {
                	'currentfdgrequest' : '1',
                	'opcode' : '2',
                	'fdg_id' : id,
                	'prefix' : prefix
                },
                dataType: "text",
                success:function(data) {

					if(data == "success"){
						$("#grid-command-buttons-fdgactive").bootgrid("reload");
					}	
                	
                	showMessage(data, "Student Record Updated");
                	
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

        		$("#grid-command-buttons-fdgactive").bootgrid("reload");
        		
        }
     });
});


var subbutton = document.getElementById("submitButton");
$(subbutton).click(function() {
    // Stop the browser from submitting the form.

    
    
    var form = $('#active_fdg_form');
    var formData = $(form).serialize();
    
    $.ajax({
        type: 'POST',
        url: "SCRIPTS/requests/currentfdgrequest.php",
        data: formData,
        cache: false,
        dataType: "text",
        success: function(result){
        	if(result == "success"){
        		$("#active_fdg_form").trigger("reset");
        		$("#grid-command-buttons-fdgactive").bootgrid("reload");
        	} else {
				//Do nothing, I guess....
            	}
        	
        
    }
    
    
    
});

});

});

</script>



<form id="active_fdg_form" method="post" action="#" name="currentfdgrequest" class="form-horizontal">

<fieldset>

<!-- Form Name -->

<legend>Set Active FDGs</legend>

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
	
	
	
  	?>
  </select> 
  </div>
</div>	

<div class="form-group">
  <label class="col-md-4 control-label" for="fdg_select">FDG:</label>  
  <div class="col-md-4">
  <select id="fdg_select" name="fdg_id" class="form-control"><?php 
  		
  
  	
  	
  	
  	$result = mysqli_query($conn, "SELECT sem_prefix FROM semesters WHERE sem_id in (SELECT MAX(sem_id) From semesters)");
  	
  	$row = mysqli_fetch_row($result);
  	
  	$sem = $row[0];
  	
  	$result = mysqli_query($conn, "SELECT fdg_name, fdg_id FROM fdg WHERE fdg_id NOT IN (SELECT pfdg_id FROM " . $sem . "_fdg) AND fdg_id != 1" );
  	
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

<input type="hidden" name="opcode" value="1"/>
<input type="hidden" name="currentfdgrequest" value="1"/>
</fieldset>
</form>

<table id="grid-command-buttons-fdgactive" class="table table-condensed table-hover table-striped">
        <thead>
            <tr>
                <th data-column-id="fdg_name" data-type="text" >FDG Name</th>
                <th data-column-id="fdg_id" data-type="numeric" >FDG ID</th>
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

