<?php
session_start();

require_once "../../SCRIPTS/db_connect.inc";

$conn = DBConnect();

if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][5] == 1) == false){

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


var grid = $("#grid-command-buttons-acad-event-update").bootgrid({
    ajax: true,
    post: function ()
    {

        return {
            id: "b0df282a-0d67-40e5-8558-c9e93b7befed",
            prefix: $("#sem_select").val()
        };
    },
    url: "/SCRIPTS/json_source/academic_event/get_academic_events_for_update.php",
    formatters: {
        "commands": function(column, row)
        {

            return "<button id=\"" + row.acad_id + "t0" + "\" type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-row-id=\"" + row.acad_id + "\"><i id=\"btn" + row.acad_id +"\" class=\"fa fa-pencil\"></i></button> " +
            "<button id=\"" + row.acad_id + "t3" + "\" type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-row-id=\"" + row.acad_id + "\" data-event-name=\"" + row.acad_title +"\"><i id=\"btn" + row.acad_id + "del\" class=\"fa fa-trash-o\"></i></button>";


        },

        "acad_title": function(column, row)
    	{
    		return "<input id=\"" + row.acad_id + "t1" + "\" type=\"text\" maxlength=\"60\" class=\"form-control\" data-row-id=\"" + row.acad_id + "\" data-orig=\"" + row.acad_title + "\" value=\"" + row.acad_title +  "\">";
    	},

    	"acad_bg_color": function(column, row)
    	{
    		return "<input id=\"" + row.acad_id + "t6" + "\" type=\"text\" maxlength=\"7\" class=\"form-control\" data-row-id=\"" + row.acad_id + "\" data-orig=\"" + row.acad_bg_color + "\" value=\"" + row.acad_bg_color +  "\">";
    	},

    	"acad_ft_color": function(column, row)
    	{
    		return "<input id=\"" + row.acad_id + "t7" + "\" type=\"text\" maxlength=\"7\" class=\"form-control\" data-row-id=\"" + row.acad_id + "\" data-orig=\"" + row.acad_ft_color + "\" value=\"" + row.acad_ft_color +  "\">";
    	},

        "acad_description": function(column, row)
    	{
        	return "<textarea id=\"" + row.acad_id + "t2" + "\" type=\"text\" maxlength=\"60\" class=\"form-control\" data-row-id=\"" + row.acad_id+ "\" data-orig=\"" + row.acad_description + "\" >" + row.acad_description + "</textarea>";
    	},


        "acad_start_date": function(column, row)
    	{
        	var t = moment(row.acad_start_date, "YYYY-MM-DD HH:mm:ss");

    		return "<input id=\"" + row.acad_id + "t4" + "\" type=\"text\" class=\"form-control datepicker_dynamic\" data-row-id=\"" + row.acad_id + "\" data-orig=\"" + t.format("MM/DD/YYYY hh:mm a") + "\"  value=\"" + t.format("MM/DD/YYYY hh:mm a") +  "\">";
    	},

    	"acad_end_date": function(column, row)
    	{
    		var t = moment(row.acad_end_date, "YYYY-MM-DD HH:mm:ss");

    		return "<input id=\"" + row.acad_id + "t5" + "\" type=\"text\" class=\"form-control datepicker_dynamic\" ndata-row-id=\"" + row.acad_id+ "\" data-orig=\"" + t.format("MM/DD/YYYY hh:mm a") + "\"  value=\"" + t.format("MM/DD/YYYY hh:mm a") +  "\">";
    	}

    }
}).on("loaded.rs.jquery.bootgrid", function()
{
    /* Executes after data is loaded and rendered */
	grid.find(".command-delete").on("click", function(e){

    	if(confirm("Are you sure you want to remove the : \"" + $(this).data("event-name") + "\" event?")){


        	$.ajax( {
        		type: 'POST',
                url: '/SCRIPTS/requests/academiceventrequest.php',
                data: {
                	'academiceventsrequest' : '1',
                	'opcode' : '2',
                	'acad_id' : $(this).data("row-id"),
                	'prefix' : $("#sem_select").val()
                },
                dataType: "text",
                success:function(data) {

                	if(data == "success"){
                		$("#grid-command-buttons-acad-event-update").bootgrid("reload");
                	} else {
                		//Do Nothing
                	}

                	showMessage(data, "Student Removed.");

                }
             });
    	} else {
			//Do Nothing
    	}

    	     }).end().find(".command-edit").on("click", function(e)
    	    		    {

    	     	var id = $(this).data("row-id");
    	         var acad_description = $("#" + id + "t2").val();
    	         var acad_title = $("#" + id + "t1").val();
    	         var acad_start_date = $("#" + id + "t4").val();
    	         var acad_end_date = $("#" + id + "t5").val();
    	         var acad_bg_color = $("#" + id + "t6").val();
    	         var acad_ft_color = $("#" + id + "t7").val();

    	 		var button_id = "#btn" + id;


    	         $(button_id).removeClass("fa-pencil");
    	         $(button_id).addClass("fa-cog fa-spin");

    	         	$.ajax( {
    	         		type: 'POST',
    	                 url: '/SCRIPTS/requests/academiceventrequest.php',
    	                 data: {
    	                 	'academiceventsrequest' : '1',
    	                 	'opcode' : '3',
    	                 	'prefix' : $("#sem_select").val(),
    	                 	'acad_id' : id,
    	                 	'acad_title' : acad_title,
    	                 	'acad_start_date' : acad_start_date,
    	                 	'acad_end_date' : acad_end_date,
    	                 	'acad_description' : acad_description,
    	                 	'acad_bg_color' : acad_bg_color,
    	                 	'acad_ft_color' : acad_ft_color
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
    	 				         $("#" + id + "t2").data({"orig": acad_description});
    	 				         $("#" + id + "t1").data({"orig": acad_title});
    	 				         $("#" + id + "t4").data({"orig": acad_start_date});
   	 				             $("#" + id + "t5").data({"orig": acad_end_date});
   	 				         	 $("#" + id + "t6").data({"orig": acad_bg_color});
   	 				     		 $("#" + id + "t7").data({"orig": acad_ft_color});
    	 					}

    	                 	showMessage(data, "FDG Event Updated");

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

var subbutton = document.getElementById("submitButton");
$(subbutton).click(function() {
    // Stop the browser from submitting the form.



    var form = $('#acad_events_form');
    var formData = $(form).serialize();

    $.ajax({
        type: 'POST',
        url: "SCRIPTS/requests/academiceventrequest.php",
        data: formData,
        cache: false,
        dataType: "text",
        success: function(result){
        	if(result == "success"){

        		$("#grid-command-buttons-acad-event-update").bootgrid("reload");
        	} else {
				//Do nothing, I guess....
            	}
        	showMessage(result, "Student Added");
        }
    })



});


$("#sem_select").change(function(){
        		$("#grid-command-buttons-acad-event-update").bootgrid("reload");
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

<form id="acad_events_form" method="post" action="#" name="academiceventsrequest" class="form-horizontal">

<fieldset>

<!-- Form Name -->

<legend>Update CCE</legend>

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


<table id="grid-command-buttons-acad-event-update" class="table table-condensed table-hover table-striped">
        <thead>
            <tr>
                <th data-column-id="acad_title" data-formatter="acad_title" data-type="text" >Event Title</th>
                <th data-column-id="acad_description" data-formatter="acad_description" data-type="text" >Description</th>
                <th data-column-id="acad_start_date" data-formatter="acad_start_date" data-type="text" >Start Time</th>
                <th data-column-id="acad_end_date" data-formatter="acad_end_date" data-type="text" >End Time</th>
                <th data-column-id="acad_bg_color" data-formatter="acad_bg_color" data-type="text" >BG Color</th>
                <th data-column-id="acad_ft_color" data-formatter="acad_ft_color" data-type="text" >Font Color</th>
                <th data-column-id="acad_id" data-type="numeric" data-identifier="true" data-visible="false">Event ID</th>
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
