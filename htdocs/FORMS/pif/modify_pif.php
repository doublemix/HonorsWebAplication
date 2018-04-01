<?php 
session_start();

require_once "../../SCRIPTS/db_connect.inc";

$conn = DBConnect();

 if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][8] == 1) == false){

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


var grid = $("#grid-command-buttons-pif").bootgrid({
    ajax: true,
    post: function ()
    {
        
        return {
            id: "b0df282a-0d67-40e5-8558-c9e93b7befed",
            prefix: $("#sem_select").val()
        };
    },
    url: "/SCRIPTS/json_source/pif/get_pifs_for_update.php",
    formatters: {
        "commands": function(column, row)
        {
            
            return "<button id=\"" + row.pif_id + "t0" + "\" type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-row-id=\"" + row.pif_id + "\"><i id=\"btn" + row.pif_id +"\" class=\"fa fa-pencil\"></i></button> " +
            "<button id=\"" + row.pif_id + "t3" + "\" type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-row-id=\"" + row.pif_id + "\" data-event-name=\"" + row.pif_title +"\"><i id=\"btn" + row.pif_id + "del\" class=\"fa fa-trash-o\"></i></button>";

            	  
        },

        "pif_title": function(column, row)
    	{
    		return "<input id=\"" + row.pif_id + "t1" + "\" type=\"text\" class=\"form-control\" data-row-id=\"" + row.pif_id + "\" data-orig=\"" + row.pif_title + "\" value=\"" + row.pif_title +  "\">";
    	},

    	"pif_bg_color": function(column, row)
    	{
    		return "<input id=\"" + row.pif_id + "t6" + "\" type=\"text\" class=\"form-control\" data-row-id=\"" + row.pif_id + "\" data-orig=\"" + row.pif_bg_color + "\" value=\"" + row.pif_bg_color +  "\">";
    	},

    	"pif_ft_color": function(column, row)
    	{
    		return "<input id=\"" + row.pif_id + "t7" + "\" type=\"text\" class=\"form-control\" data-row-id=\"" + row.pif_id + "\" data-orig=\"" + row.pif_ft_color + "\" value=\"" + row.pif_ft_color +  "\">";
    	},
        
        "pif_description": function(column, row)
    	{
        	return "<textarea id=\"" + row.pif_id + "t2" + "\" class=\"form-control\" data-row-id=\"" + row.pif_id+ "\" data-orig=\"" + row.pif_description + "\" >" + row.pif_description +  "</textarea>";
    	},
    
        
        "pif_start_date": function(column, row)
    	{
        	var t = moment(row.pif_start_date, "YYYY-MM-DD HH:mm:ss");
    		return "<input id=\"" + row.pif_id + "t4" + "\" type=\"text\" class=\"form-control datepicker_dynamic\" data-row-id=\"" + row.pif_id + "\" data-orig=\"" + t.format("MM/DD/YYYY hh:mm a") + "\"  value=\"" + t.format("MM/DD/YYYY hh:mm a") +  "\">";
    	},
        
    	"pif_end_date": function(column, row)
    	{
    		var t = moment(row.pif_end_date, "YYYY-MM-DD HH:mm:ss");
    		return "<input id=\"" + row.pif_id + "t5" + "\" type=\"text\" class=\"form-control datepicker_dynamic\" data-row-id=\"" + row.pif_id+ "\" data-orig=\"" + t.format("MM/DD/YYYY hh:mm a") + "\"  value=\"" + t.format("MM/DD/YYYY hh:mm a") +  "\">";
    	}
    
    }
}).on("loaded.rs.jquery.bootgrid", function()
{
    /* Executes after data is loaded and rendered */
	grid.find(".command-delete").on("click", function(e){

    	if(confirm("Are you sure you want to remove the : \"" + $(this).data("event-name") + "\" PIF?")){

    	
        	$.ajax( {
        		type: 'POST',
                url: '/SCRIPTS/requests/pifrequest.php',
                data: {
                	'publicissuesforumrequest' : '1',
                	'opcode' : '2',
                	'pif_id' : $(this).data("row-id"),
                	'prefix' : $("#sem_select").val()
                },
                dataType: "text",
                success:function(data) {
                   
                	if(data == "success"){
                		$("#grid-command-buttons-pif").bootgrid("reload");
                	} else {
                		//Do Nothing
                	}
                	
                	showMessage(data, "PIF Removed.");
                	
                }
             });
    	} else {
			//Do Nothing
    	}
       
    	     }).end().find(".command-edit").on("click", function(e)
    	    		    {

    	     	var id = $(this).data("row-id");
    	         var pif_description = $("#" + id + "t2").val();
    	         var pif_title = $("#" + id + "t1").val();
    	         var pif_start_date = $("#" + id + "t4").val();
    	         var pif_end_date = $("#" + id + "t5").val();
    	         var pif_bg_color = $("#" + id + "t6").val();
    	         var pif_ft_color = $("#" + id + "t7").val();
    	         
    	 		var button_id = "#btn" + id;

    	         
    	         $(button_id).removeClass("fa-pencil");
    	         $(button_id).addClass("fa-cog fa-spin");
    	     	
    	         	$.ajax( {
    	         		type: 'POST',
    	                 url: '/SCRIPTS/requests/pifrequest.php',
    	                 data: {
    	                 	'publicissuesforumrequest' : '1',
    	                 	'prefix' : $("#sem_select").val(),
    	                 	'opcode' : '3',
    	                 	'pif_id' : id,
    	                 	'pif_title' : pif_title,
    	                 	'pif_start_date' : pif_start_date,
    	                 	'pif_end_date' : pif_end_date,
    	                 	'pif_description' : pif_description,
    	                 	'pif_bg_color' : pif_bg_color,
    	                 	'pif_ft_color' : pif_ft_color
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
    	 				       		$("#" + id + "t2").data({"orig": pif_description});
    	 				         	$("#" + id + "t1").data({"orig": pif_title});
    	 				        	$("#" + id + "t4").data({"orig": pif_start_date});
   	 				         		$("#" + id + "t5").data({"orig": pif_end_date});
   	 				         		$("#" + id + "t6").data({"orig": pif_bg_color});
   	 				       			$("#" + id + "t7").data({"orig": pif_ft_color});
    	 					}	
    	                 	
    	                 	showMessage(data, "PIF Updated");
    	                 	
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
        		$("#grid-command-buttons-pif").bootgrid("reload");
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

<form id="pif_update_form" method="post" action="#" name="publicissuesforumrequest" class="form-horizontal">

<fieldset>

<!-- Form Name -->

<legend>Update PIF</legend>

<div class="form-group">
  <label class="col-md-4 control-label" for="sem_select">Semester:</label>  
  <div class="col-md-4">
  <select id="sem_select" name="prefix" class="form-control"><?php 
  	
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
	
  	?></select> 
  </div>
</div>	
</fieldset>
</form>


<table id="grid-command-buttons-pif" class="table table-condensed table-hover table-striped">
        <thead>
            <tr>
                <th data-column-id="pif_title" data-formatter="pif_title" data-type="text" >PIF Title</th>
                <th data-column-id="pif_description" data-formatter="pif_description" data-type="text" >Description</th>
                <th data-column-id="pif_start_date" data-formatter="pif_start_date" data-type="text" >Start Time</th>
                <th data-column-id="pif_end_date" data-formatter="pif_end_date" data-type="text" >End Time</th>
                <th data-column-id="pif_bg_color" data-formatter="pif_bg_color" data-type="text" >BG Color</th>
                <th data-column-id="pif_ft_color" data-formatter="pif_ft_color" data-type="text" >Font Color</th>
                <th data-column-id="pif_id" data-type="numeric" data-identifier="true" data-visible="false">PIF ID</th>
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