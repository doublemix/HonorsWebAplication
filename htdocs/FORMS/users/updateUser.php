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
			  $("#error_area").text("User Updated.");
			  $("#error_area").css("color", "green");
			  $("#error_area").fadeIn(500).delay( 4000 ).fadeOut(500);
			 $(this).dequeue();
			  });
			 
			  } else {
			 var err = "Error: " + result;
			  $("#error_area").queue(function(){
			   $("#error_area").text("");
			  $("#error_area").text(err);
			  $("#error_area").css("color", "red");
			  $("#error_area").fadeIn(500).delay( 4000 ).fadeOut(500);
			 $(this).dequeue();
			  })
		}
	}

    var grid = $("#grid-command-buttons-update").bootgrid({
        ajax: true,
        post: function ()
        {
            return {
                id: "b0df282a-0d67-40e5-8558-c9e93b7befed"
            };
        },
        url: "SCRIPTS/json_source/users/getusersforupdate.php",
        formatters: {
            "commands": function(column, row)
            {
                return "<button id=\"" + row.usr_id + "t0" + "\" type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-row-id=\"" + row.usr_id + "\"><i id=\"btn" + row.usr_id +"\" class=\"fa fa-pencil\"></i></button> ";
            },
        
        	"usr_fname": function(column, row)
        	{
        		return "<input id=\"" + row.usr_id + "t1" + "\" type=\"text\" maxlength=\"20\" class=\"form-control\" name=\"fname\"  data-row-id=\"" + row.usr_school_id + "\" data-orig=\"" + row.usr_fname + "\" value=\"" + row.usr_fname +  "\">";
        	},
            
            "usr_lname": function(column, row)
        	{
            	return "<input id=\"" + row.usr_id + "t2" + "\" type=\"text\" maxlength=\"35\" class=\"form-control\" name=\"lname\"  data-row-id=\"" + row.usr_school_id + "\" data-orig=\"" + row.usr_lname + "\" value=\"" + row.usr_lname +  "\">";
        	},
        
            
            "usr_perm_email": function(column, row)
        	{
        		return "<input id=\"" + row.usr_id + "t3" + "\" type=\"text\" maxlength=\"60\" class=\"form-control\" name=\"perm_email\" data-row-id=\"" + row.usr_school_id + "\" data-orig=\"" + row.usr_perm_email + "\"  value=\"" + row.usr_perm_email +  "\">";
        	},
        
            
            "usr_status": function(column, row)
        	{
        		var widget_string = "";
        		
        		widget_string = "<select id=\"" + row.usr_id + "t4" + "\" class=\"form-control\" name=\"status\" data-orig=\"" + row.usr_status + "\" data-row-id=\"" + row.usr_school_id + "\">";
        		
        		if(row.usr_status == 2){
        			widget_string += "<option value=\"2\" selected>Student</option>";
        		} else {
        			widget_string += "<option value=\"2\">Student</option>";
        		}
        		
        		if(row.usr_status == 3){
        			widget_string += "<option value=\"3\" selected>Graduate</option>";
        		} else {
        			widget_string += "<option value=\"3\">Graduate</option>";
        		}
        		
        		if(row.usr_status == 4){
        			widget_string += "<option value=\"4\" Selected>Inactive</option>";
        		} else {
        			widget_string += "<option value=\"4\">Inactive</option>";
        		}
        		
        		if(row.usr_status == 5){
        			widget_string += "<option value=\"5\" Selected>Professor</option>";
        		} else {
        			widget_string += "<option value=\"5\">Professor</option>";
        		}
        		if(row.usr_status == 6){
        			widget_string += "<option value=\"6\" Selected>Removed From Program</option>";
        		} else {
        			widget_string += "<option value=\"6\">Removed From Program</option>";
        		}
        		
        		widget_string += "</select>";
        		
        		return widget_string;
        		
        	},
        
            
            "usr_education": function(column, row)
        	{
        		var edu_string = "";
        		
        		edu_string = "<select id=\"" + row.usr_id + "t5" + "\" class=\"form-control\" name=\"education\" data-orig=\"" + row.usr_education + "\" data-row-id=\"" + row.usr_school_id + "\">";
        		
        		if(row.usr_education == 1){
        			edu_string += "<option value=\"1\" selected>Freshman</option>";
        		} else {
        			edu_string += "<option value=\"1\">Freshman</option>";
        		}
        		
        		if(row.usr_education == 2){
        			edu_string += "<option value=\"2\" Selected>Sophomore</option>";
        		} else {
        			edu_string += "<option value=\"2\">Sophomore</option>";
        		}
        		
        		if(row.usr_education == 3){
        			edu_string += "<option value=\"3\" Selected>Junior</option>";
        		} else {
        			edu_string += "<option value=\"3\">Junior</option>";
        		}
        		
        		if(row.usr_education == 4){
        			edu_string += "<option value=\"4\" Selected>Senior +</option>";
        		} else {
        			edu_string += "<option value=\"4\">Senior +</option>";
        		}
        		
        		if(row.usr_education == 5){
        			edu_string += "<option value=\"5\" Selected>Graduate</option>";
        		} else {
        			edu_string += "<option value=\"5\">Graduate</option>";
        		}
        		
        		if(row.usr_education == 6){
        			edu_string += "<option value=\"6\" Selected>Professor</option>";
        		} else {
        			edu_string += "<option value=\"6\">Professor</option>";
        		}
        		
        		edu_string += "</select>";
        		
        		return edu_string;
        		
        	}
        
        }
    }).on("loaded.rs.jquery.bootgrid", function()
    {
        /* Executes after data is loaded and rendered */
        grid.find(".command-edit").on("click", function(e)
        {

        	var id = $(this).data("row-id");
            var lname = $("#" + id + "t2").val();
            var fname = $("#" + id + "t1").val();
            var permemail = $("#" + id + "t3").val();
            var status = $("#" + id + "t4").val();
            var education = $("#" + id + "t5").val();
            
			var button_id = "#btn" + id;

            
            $(button_id).removeClass("fa-pencil");
            $(button_id).addClass("fa-cog fa-spin");
        	
            	$.ajax( {
            		type: 'POST',
                    url: '/SCRIPTS/requests/userrequest.php',
                    data: {
                    	'updateuserform' : '1',
                    	'opcode' : '3',
                    	'usr_id' : id,
                    	'fname' : fname,
                    	'lname' : lname,
                    	'perm_email' : permemail,
                    	'status' : status,
                    	'education' : education
                    },
                    dataType: "text",
                    success:function(data) {

						if(data === "success"){
							 $("#" + id + "t2").css({"background-color": ""});
					         $("#" + id + "t1").css({"background-color": ""});
					         $("#" + id + "t3").css({"background-color": ""});
					         $("#" + id + "t4").css({"background-color": ""});
					         $("#" + id + "t5").css({"background-color": ""});
					         $("#" + id + "t2").data({"orig": lname});
					         $("#" + id + "t1").data({"orig": fname});
					         $("#" + id + "t3").data({"orig": permemail });
					         $("#" + id + "t4").data({"orig": status });
					         $("#" + id + "t5").data({"orig": education });
						}	
                    	
                    	showMessage(data);
                    	
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
	
});

</script>

<form>
<fieldset>
<legend>
Edit Users
</legend>
</fieldset>
</form>
    <table id="grid-command-buttons-update" class="table table-condensed table-hover table-striped">
        <thead>
            <tr>
                <th data-column-id="usr_school_id" data-type="numeric" data-identifier="true" >School ID</th>
                <th data-column-id="usr_school_email">School Email</th>
                <th data-column-id="usr_fname" data-formatter="usr_fname">First Name</th>
                <th data-column-id="usr_lname" data-order="desc" data-formatter="usr_lname">Last Name</th>
                <th data-column-id="usr_perm_email" data-formatter="usr_perm_email" >Permanent Email</th>
                <th data-column-id="usr_status" data-type="numeric" data-formatter="usr_status">Status</th>
                <th data-column-id="usr_education" data-type="numeric" data-formatter="usr_education">Education</th>
                <th data-column-id="commands" data-formatter="commands" data-sortable="false">Commands</th>
                <th data-column-id="usr_id" data-type="numeric" data-visible="false">User ID</th>
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
