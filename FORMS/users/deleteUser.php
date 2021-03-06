<?php 
session_start();

require_once "../../SCRIPTS/db_connect.inc";

$conn = DBConnect();

 if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][2] == 1) == false){

	header("location: index.php");
	die();
}

?><body>

<script>

$(document).ready (function(){
	
	function showMessage(result){
		 if(result === "success"){
			  $("#error_area").queue(function(){
			  $("#error_area").text("User Deleted.");
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

    var grid = $("#grid-command-buttons").bootgrid({
        ajax: true,
        post: function ()
        {
            return {
                id: "b0df282a-0d67-40e5-8558-c9e93b7befed"
            };
        },
        url: "SCRIPTS/json_source/users/getusers.php",
        formatters: {
            "commands": function(column, row)
            { 
                   return "<button type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-row-fname=\"" + row.usr_fname + "\" data-row-lname=\"" + row.usr_lname + "\" data-row-id=\"" + row.usr_school_id + "\"><span class=\"fa fa-trash-o\"></span></button>";
            }
        }
    }).on("loaded.rs.jquery.bootgrid", function()
    {
        /* Executes after data is loaded and rendered */
        grid.find(".command-delete").on("click", function(e)
        {
 
            if(confirm("Are you sure you want to delete " + $(this).data("row-fname") + " " + $(this).data("row-lname") + " from the database?")){
            	
            	$.ajax( {
            		type: 'POST',
                    url: '/SCRIPTS/requests/userrequest.php',
                    data: {
                    	'deleteuserform' : '1',
                    	'opcode' : '2',
                    	'school_id' : $(this).data("row-id")
                    },
                    dataType: "text",
                    success:function(data) {
                       
                    	if(data === "success"){
                    		$("#grid-command-buttons").bootgrid("reload");
                    	} else {
                    		//Do Nothing
                    	}
                    	
                    	showMessage(data);
                    	
                    }
                 });
            	
            } else {
            	//Do nothing
            }
            
        });
    });


	
});

</script>

<form>
<fieldset>
<legend>Delete Users</legend>
</fieldset>
</form>

   

    

    <table id="grid-command-buttons" class="table table-condensed table-hover table-striped">
        <thead>
            <tr>
                <th data-column-id="usr_school_id" data-type="numeric" data-identifier="true">School ID</th>
                <th data-column-id="usr_fname">First Name</th>
                <th data-column-id="usr_lname" data-order="desc">Last Name</th>
                <th data-column-id="usr_school_email" >School Email</th>
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
