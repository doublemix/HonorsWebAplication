<?php 
session_start();

require_once "../../SCRIPTS/db_connect.inc";

$conn = DBConnect();

 if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][7] == 1) == false){
	
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


var grid = $("#grid-command-buttons-comserv").bootgrid({
    ajax: true,
    post: function ()
    {
        
        return {
            id: "b0df282a-0d67-40e5-8558-c9e93b7befed",
            prefix: $("#sem_select").val()
        };
    },
    url: "/SCRIPTS/json_source/com_serv/get_comserv_for_update.php",
    formatters: {
        "commands": function(column, row)
        {
            return "<button id=\"" + row.com_id + "t0" + "\" type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-usr-id=\"" + row.usr_id + "\" data-row-id=\"" + row.com_id + "\"><i id=\"btn" + row.com_id +"\" class=\"fa fa-pencil\"></i></button> " +
            	   "<button id=\"" + row.com_id + "t3" + "\" type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-row-id=\"" + row.com_id + "\" data-student-name=\"" + row.usr_fname + " " + row.usr_lname + "\"><i id=\"btn" + row.com_id + "del\" class=\"fa fa-trash-o\"></i></button>";
        },
    
    	"com_description": function(column, row)
        	{
            	return "<textarea id=\"" + row.com_id + "t2" + "\" class=\"form-control\" maxlength=\"500\" name=\"capstone_description\"  data-row-id=\"" + row.com_id + "\" data-orig=\"" + row.com_description + "\" readonly>" + row.com_description + "</textarea>";
        	},
    
    "com_advisor_contact": function(column, row)
        	{
            	return "<textarea id=\"" + row.com_id + "t2" + "\" class=\"form-control\" maxlength=\"500\" name=\"capstone_description\"  data-row-id=\"" + row.com_id + "\" data-orig=\"" + row.com_advisor_contact + "\" readonly>" + row.com_advisor_contact + "</textarea>";
        	},
        	
        	"com_advisor": function(column, row)
        	{
            	return "<textarea id=\"" + row.com_id + "t2" + "\" class=\"form-control\" maxlength=\"500\" name=\"capstone_description\"  data-row-id=\"" + row.com_id + "\" data-orig=\"" + row.com_advisor + "\" readonly>" + row.com_advisor + "</textarea>";
        	},
        	
        	
    
    	"com_verified": function(column, row)
    	{
    		var str =  "<select class=\"form-control\"id=\"" + row.com_id + "t1" + "\" data-orig=\"" + row.com_verified + "\">";

			if(row.com_verified != 1){
				str+= "<option value=\"1\">Pending</option>";
			} else {
				str+= "<option value=\"1\" selected>Pending</option>";
			}

			if(row.com_verified != 2){
				str+= "<option value=\"2\">Approved</option>";
			} else {
				str+= "<option value=\"2\" selected>Approved</option>";
			}


			if(row.com_verified != 3){
				str+= "<option value=\"3\">Rejected</option>";
			} else {
				str+= "<option value=\"3\" selected>Rejected</option>";
			}
			str += "</select>";

			return str;
    		
    	},
    	"com_hours": function(column, row)
    	{
            	return "<input id=\"" + row.com_id + "t2" + "\" type=\"text\" maxlength=\"6\" class=\"form-control\" data-row-id=\"" + row.com_id + "\" data-orig=\"" + row.com_hours + "\" value=\"" + row.com_hours +  "\">";
        }
    
    }
}).on("loaded.rs.jquery.bootgrid", function()
{
    /* Executes after data is loaded and rendered */
    grid.find(".command-edit").on("click", function(e)
    {

    	var id = $(this).data("row-id");
        var com_verified = $("#" + id + "t1").val();
		var com_hours = $("#" + id + "t2").val();
		var button_id = "#btn" + id;
		var prefix = $("#sem_select").val();
        
        $(button_id).removeClass("fa-pencil");
        $(button_id).addClass("fa-cog fa-spin");
    	
        	$.ajax( {
        		type: 'POST',
                url: '/SCRIPTS/requests/comservrequest.php',
                data: {
                	'communityservicerequest' : '1',
                	'opcode' : '5',
                	'com_id' : id,
                	'pstu_id' : $(this).data("usr_id"),
                	'com_verified' : com_verified,
                	'com_hours' : com_hours,
                	'prefix' : prefix
                },
                dataType: "text",
                success:function(data) {

					if(data == "success"){
				         $("#" + id + "t1").css({"background-color": ""});
				         $("#" + id + "t1").data({"orig": com_verified});
				         $("#" + id + "t2").css({"background-color": ""});
				         $("#" + id + "t2").data({"orig": com_hours});
					}	
                	
                	showMessage(data, "Service Updated");
                	
                }
             });
        	
        	$(button_id).removeClass("fa-cog fa-spin");
        	$(button_id).addClass("fa-pencil");
    }).end().find(".command-delete").on("click", function(e){

    	if(confirm("Are you sure you want to remove: \"" + $(this).data("student-name") + "\"'s Community Service?")){

    	
        	$.ajax( {
        		type: 'POST',
                url: '/SCRIPTS/requests/comservrequest.php',
                data: {
                	'communityservicerequest' : '1',
                	'opcode' : '2',
                	'com_id' : $(this).data("row-id"),
                	'prefix' : $("#sem_select").val()
                },
                dataType: "text",
                success:function(data) {
                   
                	if(data == "success"){
                		$("#grid-command-buttons-comserv").bootgrid("reload");
                	} else {
                		//Do Nothing
                	}
                	
                	showMessage(data, "Service Removed.");
                	
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
	
	$("#sem_select").change(function(){
		$("#grid-command-buttons-comserv").bootgrid("reload");
	});

});



</script>



<form id="current_students_form" method="post" action="#" name="currentstudentsrequest" class="form-horizontal">

<fieldset>

<!-- Form Name -->

<legend>Update Community Service Requests</legend>

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


</fieldset>

</form>

<table id="grid-command-buttons-comserv" class="table table-condensed table-hover table-striped">
        <thead>
            <tr>
                <th data-column-id="usr_fname" data-type="text" >First Name</th>
                <th data-column-id="usr_lname" data-type="text" >Last Name</th>
                <th data-column-id="usr_school_id" data-type="text" >School ID</th>
                <th data-column-id="com_title" data-type="text" data-visible="false">Title</th>
                <th data-column-id="com_advisor" data-type="text" data-formatter="com_advisor">Advisor(s)</th>
                <th data-column-id="com_advisor_contact" data-type="text" data-formatter="com_advisor_contact">Contact Info</th>
                <th data-column-id="com_description" data-type="text" data-formatter="com_description">Description</th>
                <th data-column-id="com_date" data-type="text">Date</th>
                <th data-column-id="com_hours" data-type="numeric" data-formatter="com_hours">Hours</th>
                <th data-column-id="com_verified" data-formatter="com_verified" >Verified</th>
                <th data-column-id="com_id" data-type="numeric" data-identifier="true" data-visible="false">Com Serv ID</th>
                <th data-column-id="usr_id" data-type="numeric" data-identifier="true" data-visible="false">User ID</th>
                
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
