<?php 
session_start();

require_once "../../SCRIPTS/db_connect.inc";

$conn = DBConnect();

if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][3] == 1) == false) {
	
	header("location: index.php");
	die();
}

?>
<body>

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


var grid = $("#grid-command-buttons-fdgevent").bootgrid({
    ajax: true,
    post: function ()
    {
        
        return {
            id: "b0df282a-0d67-40e5-8558-c9e93b7befed",
            prefix: $("#sem_select").val()
        };
    },
    url: "/SCRIPTS/json_source/fdg_events/geteventsforupdate.php",
    formatters: {
        "commands": function(column, row)
        {
            return "<button id=\"" + row.pfdg_event_id + "t0" + "\" type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-row-id=\"" + row.pfdg_event_id + "\"><i id=\"btn" + row.pfdg_event_id +"\" class=\"fa fa-pencil\"></i></button> " + 
            "<button id=\"" + row.pfdg_event_id + "t3" + "\" type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-row-id=\"" + row.pfdg_event_id + "\" data-student-name=\"" + row.pfdg_event_name +"\"><i id=\"btn" + row.pfdg_event_id + "del\" class=\"fa fa-trash-o\"></i></button>";

            	  
        },

        "pfdg_event_name": function(column, row)
    	{
    		return "<input id=\"" + row.pfdg_event_id + "t1" + "\" type=\"text\" maxlength=\"60\" class=\"form-control\" name=\"fname\"  data-row-id=\"" + row.pfdg_event_id + "\" data-orig=\"" + row.pfdg_event_name + "\" value=\"" + row.pfdg_event_name +  "\">";
    	},
        
        "pfdg_event_description": function(column, row)
    	{
        	return "<textarea id=\"" + row.pfdg_event_id + "t2" + "\" type=\"text\" maxlength=\"500\" class=\"form-control\" name=\"lname\"  data-row-id=\"" + row.pfdg_event_id + "\" data-orig=\"" + row.pfdg_event_description + "\">" + row.pfdg_event_description  + "</textarea>";
    	},
    
        
        "pfdg_start_date": function(column, row)
    	{
			var t = moment(row.pfdg_start_date, "YYYY-MM-DD HH:mm:ss");

			
        	
    		return "<input id=\"" + row.pfdg_event_id + "t4" + "\" type=\"text\" class=\"form-control datepicker_dynamic\" name=\"perm_email\" data-row-id=\"" + row.pfdg_event_id + "\" data-orig=\"" + t.format("MM/DD/YYYY hh:mm a") + "\"  value=\"" + t.format("MM/DD/YYYY hh:mm a") +  "\">";
    	},

    	 "pfdg_event_bg_color": function(column, row)
     	{
     		return "<input id=\"" + row.pfdg_event_id + "t6" + "\" type=\"text\" maxlength=\"7\" class=\"form-control\" name=\"fname\"  data-row-id=\"" + row.pfdg_event_id + "\" data-orig=\"" + row.pfdg_event_bg_color + "\" value=\"" + row.pfdg_event_bg_color +  "\">";
     	},

     	 "pfdg_event_ft_color": function(column, row)
     	{
     		return "<input id=\"" + row.pfdg_event_id + "t7" + "\" type=\"text\" maxlength=\"7\" class=\"form-control\" name=\"fname\"  data-row-id=\"" + row.pfdg_event_id + "\" data-orig=\"" + row.pfdg_event_ft_color + "\" value=\"" + row.pfdg_event_ft_color +  "\">";
     	},
        
    	"pfdg_end_date": function(column, row)
    	{
    		var t = moment(row.pfdg_end_date, "YYYY-MM-DD HH:mm:ss");
			
    		return "<input id=\"" + row.pfdg_event_id + "t5" + "\" type=\"text\" class=\"form-control datepicker_dynamic\" name=\"perm_email\" data-row-id=\"" + row.pfdg_event_id + "\" data-orig=\"" + t.format("MM/DD/YYYY hh:mm a") + "\"  value=\"" + t.format("MM/DD/YYYY hh:mm a") +  "\">";
    	}
    
    }
}).on("loaded.rs.jquery.bootgrid", function()
{
    /* Executes after data is loaded and rendered */
	grid.find(".command-delete").on("click", function(e){

    	if(confirm("Are you sure you want to remove: \"" + $(this).data("student-name") + "\" from FDG Events?")){

    	
        	$.ajax( {
        		type: 'POST',
                url: '/SCRIPTS/requests/fdgeventrequest.php',
                data: {
                	'fdgeventrequest' : '1',
                	'opcode' : '2',
                	'pfdg_event_id' : $(this).data("row-id"),
                	'prefix' : $("#sem_select").val()
                },
                dataType: "text",
                success:function(data) {
                   
                	if(data == "success"){
                		$("#grid-command-buttons-fdgevent").bootgrid("reload");
                	} else {
                		//Do Nothing
                	}
                	
                	showMessage(data, "Event Removed.");
                	
                }
             });
    	} else {
			//Do Nothing
    	}
       
    	     }).end().find(".command-edit").on("click", function(e)
    	    		    {

    	     	var id = $(this).data("row-id");
    	         var pfdg_event_description = $("#" + id + "t2").val();
    	         var pfdg_event_name = $("#" + id + "t1").val();
    	         var pfdg_start_date = $("#" + id + "t4").val();
    	         var pfdg_end_date = $("#" + id + "t5").val();
    	         var pfdg_event_bg_color = $("#" + id + "t6").val();
    	         var pfdg_event_ft_color = $("#" + id + "t7").val();
    	         
    	 		var button_id = "#btn" + id;

    	         
    	         $(button_id).removeClass("fa-pencil");
    	         $(button_id).addClass("fa-cog fa-spin");
    	     	
    	         	$.ajax( {
    	         		type: 'POST',
    	                 url: '/SCRIPTS/requests/fdgeventrequest.php',
    	                 data: {
    	                 	'fdgeventrequest' : '1',
    	                 	'opcode' : '3',
    	                 	'prefix' : $("#sem_select").val(),
    	                 	'pfdg_event_id' : id,
    	                 	'pfdg_event_name' : pfdg_event_name,
    	                 	'pfdg_start_date' : pfdg_start_date,
    	                 	'pfdg_end_date' : pfdg_end_date,
    	                 	'pfdg_event_description' : pfdg_event_description,
    	                 	'pfdg_event_bg_color' : pfdg_event_bg_color,
    	                 	'pfdg_event_ft_color' : pfdg_event_ft_color
    	                 },
    	                 dataType: "text",
    	                 success:function(data) {

    	 					if(data == "success"){
    	 						 $("#" + id + "t2").css({"background-color": ""});
    	 				         $("#" + id + "t1").css({"background-color": ""});
    	 				        $("#" + id + "t4").css({"background-color": ""});
   	 				         $("#" + id + "t5").css({"background-color": ""});
   	 				     $("#" + id + "t6").css({"background-color": ""});
   	 				 $("#" + id + "t7").css({"background-color": ""});
    	 				         $("#" + id + "t2").data({"orig": pfdg_event_description});
    	 				         $("#" + id + "t1").data({"orig": pfdg_event_name});
    	 				        $("#" + id + "t4").data({"orig": pfdg_start_date});
   	 				         $("#" + id + "t5").data({"orig": pfdg_end_date});
   	 				     $("#" + id + "t6").data({"orig": pfdg_event_bg_color});
   	 				 $("#" + id + "t7").data({"orig": pfdg_event_ft_color});
    	 					}	
    	                 	
    	                 	showMessage(data, "FDG Event Added");
    	                 	
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

var subbutton = document.getElementById("submitButton");
$(subbutton).click(function() {
    // Stop the browser from submitting the form.

    
    
    var form = $('#fdg_events_form');
    var formData = $(form).serialize();
    
    $.ajax({
        type: 'POST',
        url: "SCRIPTS/requests/fdgeventrequest.php",
        data: formData,
        cache: false,
        dataType: "text",
        success: function(result){
        	if(result == "success"){
        		$("#fdg_events_form").trigger("reset");
        		$("#grid-command-buttons-fdgevent").bootgrid("reload");
        	} else {
				//Do nothing, I guess....
            	}
        	showMessage(result, "Student Added");
        }
    })
    
    
    
});


$("#sem_select").change(function(){
        		$("#grid-command-buttons-fdgevent").bootgrid("reload");
});

$('#datetimepicker').datetimepicker({
	timeInput: true,
	timeFormat: "hh:mm tt"
});

$('#datetimepickerend').datetimepicker({
	timeInput: true,
	timeFormat: "hh:mm tt"
});

$( '#datetimepicker' ).change(function() {

	var newtime = $('#datetimepicker').datetimepicker('getDate');
	
	newtime.setHours(newtime.getHours() + 1);
	
	$('#datetimepickerend').datetimepicker('setDate', newtime );
	
	});

$('body').on('focus',".datepicker_dynamic", function(){
    $(this).datetimepicker({
    	timeInput: true,
    	timeFormat: "hh:mm tt"
    });

	
    
});

});






</script>

<form id="fdg_events_form" method="post" action="#" name="fdgeventrequest" class="form-horizontal">

<fieldset>

<!-- Form Name -->

<legend>FDG Event</legend>

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
  <label class="col-md-4 control-label" for="pfdg_event_name">Event Title</label>  
  <div class="col-md-4">
  <input name="pfdg_event_name" maxlength="60" class="form-control input-md" id="pfdg_event_name" required type="text" placeholder="Title">
    
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="pfdg_event_description">Description</label>
  <div class="col-md-4">                     
    <textarea name="pfdg_event_description" maxlength="500" class="form-control" id="pfdg_event_description" ></textarea>
  </div>
</div>
 
<div class="form-group">
  <label class="col-md-4 control-label" for="datetimepicker">Start Date:</label>
  <div class="col-md-4">                     
      <input id="datetimepicker" type="text" name="pfdg_start_date" class="form-control"></input>
      <span class="add-on">
        <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
      </span>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="datetimepickerend">End Date:</label>
  <div class="col-md-4">                     
      <input id="datetimepickerend" type="text" name="pfdg_end_date" class="form-control"></input>
      <span class="add-on">
        <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
      </span>
  </div>
</div>
</fieldset>

<input type="hidden" name="opcode" value="1"/>
<input type="hidden" name="fdgeventrequest" value="1"/>



<div class="form-group">
  <label class="col-md-4 control-label" for="submitButton"></label>
  <div class="col-md-4">
    <button type="button" id="submitButton" name="submitButton" class="btn btn-primary">Submit</button>
  </div>
</div>

</form>


<table id="grid-command-buttons-fdgevent" class="table table-condensed table-hover table-striped">
        <thead>
            <tr>
                <th data-column-id="pfdg_event_name" data-formatter="pfdg_event_name" data-type="text" >Event Title</th>
                <th data-column-id="pfdg_event_description" data-formatter="pfdg_event_description" data-type="text" >Description</th>
                <th data-column-id="pfdg_start_date" data-formatter="pfdg_start_date" data-type="text" >Start Date</th>
                <th data-column-id="pfdg_end_date" data-formatter="pfdg_end_date" data-type="text" >End Date</th>
                <th data-column-id="pfdg_event_bg_color" data-formatter="pfdg_event_bg_color" data-type="text" >BG Color</th>
                <th data-column-id="pfdg_event_ft_color" data-formatter="pfdg_event_ft_color" data-type="text" >Font Color</th>
                <th data-column-id="pfdg_event_id" data-type="numeric" data-identifier="true" data-visible="false">Member ID</th>
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


