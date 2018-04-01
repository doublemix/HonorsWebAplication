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
			  });
		}
	}


var grid = $("#grid-command-buttons-ag").bootgrid({
    ajax: true,
    post: function ()
    {
        
        return {
            id: "b0df282a-0d67-40e5-8558-c9e93b7befed",
            prefix: $("#sem_select").val()
        };
    },
    url: "/SCRIPTS/json_source/activity_group/get_activity_groups_for_update.php",
    formatters: {
        "commands": function(column, row)
        {
            return "<button id=\"" + row.ag_id + "t0" + "\" type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-row-id=\"" + row.ag_id + "\"><i id=\"btn" + row.ag_id +"\" class=\"fa fa-pencil\"></i></button>"
            	   + "<button id=\"" + row.ag_id + "t3" + "\" type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-row-id=\"" + row.ag_id + "\" data-activity-name=\"" + row.ag_title +"\"><i id=\"btn" + row.ag_id + "del\" class=\"fa fa-trash-o\"></i></button>";
            	   
        },
        
        "ag_title": function(column, row)
    	{
    		return "<input id=\"" + row.ag_id + "t1" + "\" type=\"text\" maxlength=\"40\" class=\"form-control\" data-row-id=\"" + row.ag_id + "\" data-orig=\"" + row.ag_title + "\" value=\"" + row.ag_title +  "\">";
    	},

    	"ag_bg_color": function(column, row)
    	{
    		return "<input id=\"" + row.ag_id + "t4" + "\" type=\"text\" maxlength=\"7\" class=\"form-control\" data-row-id=\"" + row.ag_id + "\" data-orig=\"" + row.ag_bg_color + "\" value=\"" + row.ag_bg_color +  "\">";
    	},

    	"ag_ft_color": function(column, row)
    	{
    		return "<input id=\"" + row.ag_id + "t5" + "\" type=\"text\" maxlength=\"7\" class=\"form-control\" data-row-id=\"" + row.ag_id + "\" data-orig=\"" + row.ag_ft_color + "\" value=\"" + row.ag_ft_color +  "\">";
    	},
        
        "ag_description": function(column, row)
    	{
        	return "<textarea id=\"" + row.ag_id + "t2" + "\" type=\"text\" maxlength=\"500\" class=\"form-control\" data-row-id=\"" + row.ag_id + "\" data-orig=\"" + row.ag_description + "\">" + row.ag_description + "</textarea>";
    	},
        
        
    
    }
}).on("loaded.rs.jquery.bootgrid", function()
{
    /* Executes after data is loaded and rendered */
    grid.find(".command-edit").on("click", function(e)
    {

    	var id = $(this).data("row-id");
		var ag_title = $("#" + id + "t1").val();
        var ag_description = $("#" + id + "t2").val();
        var ag_bg_color = $("#" + id + "t4").val();
        var ag_ft_color = $("#" + id + "t5").val();
		var button_id = "#btn" + id;
		var prefix = $("#sem_select").val();
       

		
            
        $(button_id).removeClass("fa-pencil");
        $(button_id).addClass("fa-cog fa-spin");
    	
        	$.ajax( {
        		type: 'POST',
                url: '/SCRIPTS/requests/activitygrouprequest.php',
                data: {
                	'activitygrouprequest' : '1',
                	'opcode' : '3',
                	'ag_id' : id,
                	'ag_title' : ag_title,
                	'ag_description' : ag_description,
                	'ag_bg_color' : ag_bg_color,
                	'ag_ft_color' : ag_ft_color,
                	'prefix' : prefix
                	
                },
                dataType: "text",
                success:function(data) {

					if(data == "success"){
						$("#" + id + "t2").css({"background-color": ""});
				         $("#" + id + "t1").css({"background-color": ""});
				         $("#" + id + "t4").css({"background-color": ""});
				         $("#" + id + "t5").css({"background-color": ""});
				         $("#" + id + "t1").data({"orig": ag_title});
				         $("#" + id + "t2").data({"orig": ag_description});
				         $("#" + id + "t4").data({"orig": ag_bg_color});
				         $("#" + id + "t5").data({"orig": ag_ft_color});
						//$("#grid-command-buttons-fdgactive").bootgrid("reload");
					}	
                	
                	showMessage(data, "Activity Group Updated");
                	
                }
             });
        	
        	$(button_id).removeClass("fa-cog fa-spin");
        	$(button_id).addClass("fa-pencil");

        
        	
    }).end().find(".command-delete").on("click", function(e){
    		    
    	
    	if(confirm("Are you sure you want to delete the Activity Group: \"" + $(this).data("activity-name") + "\" from the database?")){
        	
        	$.ajax( {
        		type: 'POST',
                url: '/SCRIPTS/requests/activitygrouprequest.php',
                data: {
                	'activitygrouprequest' : '1',
                	'opcode' : '2',
                	'prefix' : $('#sem_select').val(),
                	'ag_id' : $(this).data("row-id")
                },
                dataType: "text",
                success:function(data) {
                   
                	if(data == "success"){
                		$("#grid-command-buttons-ag").bootgrid("reload");
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


$(document).on('change','textarea[data-orig]',function(){
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
        		$("#grid-command-buttons-ag").bootgrid("reload");
        }
     });
});


var subbutton = document.getElementById("submitButton");
$(subbutton).click(function() {
    // Stop the browser from submitting the form.

    
    
    var form = $('#activity_group_form');
    var formData = $(form).serialize();
    
    $.ajax({
        type: 'POST',
        url: "SCRIPTS/requests/activitygrouprequest.php",
        data: formData,
        cache: false,
        dataType: "text",
        success: function(result){
        	if(result == "success"){
        		$("#ag_title").val("");
        		$("#ag_description").val("");
        		$("#grid-command-buttons-ag").bootgrid("reload");
        		showMessage(data, "Activity Group Added");
        	} else {
				//Do nothing, I guess....
            	}
        	
        
    }
    
    
    
});

});

});

</script>



<form id="activity_group_form" method="post" action="#" name="activitygrouprequest" class="form-horizontal">

<fieldset>

<!-- Form Name -->

<legend>Modify Activity Group</legend>

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

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="ag_title">Activity Group Title</label>  
  <div class="col-md-4">
  <input name="ag_title" maxlength="40" class="form-control input-md" id="ag_title" required type="text" placeholder="Title">
    
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="ag_description">Description</label>
  <div class="col-md-4">                     
    <textarea name="ag_description" maxlength="500" class="form-control" id="ag_description" ></textarea>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="submitButton"></label>
  <div class="col-md-4">
    <button type="button" id="submitButton" name="submitButton" class="btn btn-primary">Submit</button>
  </div>
</div>

<input type="hidden" name="opcode" value="1"/>
<input type="hidden" name="activitygrouprequest" value="1"/>
</fieldset>
</form>

<table id="grid-command-buttons-ag" class="table table-condensed table-hover table-striped">
        <thead>
            <tr>
                <th data-column-id="ag_title" data-type="text" data-formatter="ag_title">AG Title</th>
                <th data-column-id="ag_description" data-type="text" data-formatter="ag_description">Description</th>
                <th data-column-id="ag_bg_color" data-type="text" data-formatter="ag_bg_color">BG Color</th>
                <th data-column-id="ag_ft_color" data-type="text" data-formatter="ag_ft_color">Font Color</th>
                <th data-column-id="ag_id" data-type="numeric" data-visible="false">AG ID</th>
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


