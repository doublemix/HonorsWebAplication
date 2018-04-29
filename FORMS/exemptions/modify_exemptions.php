<?php
session_start();

require_once "../../SCRIPTS/db_connect.inc";

$conn = DBConnect();

if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][4] == 1) == false){

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

var grid = $("#grid-command-buttons-exemptions").bootgrid({
	ajax: true,
    post: function ()
    {
        return {
            id: "b0df282a-0d67-40e5-8558-c9e93b7befed",
            prefix: $("#sem_select").val()
        };
    },
    url: "SCRIPTS/json_source/exemptions/get_exemptions_for_update.php",
    formatters: {
        "commands": function(column, row)
        {
            return "<button id=\"" + row.excptn_id + "t0" + "\" type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-row-id=\"" + row.excptn_id + "\"><i id=\"btn" + row.excptn_id +"\" class=\"fa fa-pencil\"></i></button> " +
            	   "<button id=\"" + row.excptn_id + "t3" + "\" type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-row-id=\"" + row.excptn_id + "\" data-probation-name=\"" + row.excptn_name + "\"><i id=\"btn" + row.excptn_id + "del\" class=\"fa fa-trash-o\"></i></button>";
        },

    	"excptn_name": function(column, row)
    	{
    		return "<input id=\"" + row.excptn_id + "t1" + "\" type=\"text\" maxlength=\"60\" class=\"form-control\" name=\"excptn_name\"   data-orig=\"" + row.excptn_name + "\" value=\"" + row.excptn_name +  "\">";
    	},
    	"excptn_value": function(column, row)

    	{
    		return "<input id=\"" + row.excptn_id + "t4" + "\" type=\"text\" maxlength=\"8\" class=\"form-control\" name=\"excptn_name\"   data-orig=\"" + row.excptn_value + "\" value=\"" + row.excptn_value +  "\">";
    	},
        "excptn_type": function(column, row)
    	{
        	var probation_string = "";

    		probation_string = "<select id=\"" + row.excptn_id + "t2" + "\" class=\"form-control\" name=\"probationtype\" data-orig=\"" + row.excptn_type + "\" data-row-id=\"" + row.excptn_type + "\">";

    		if(row.excptn_type == 1){
    			probation_string += "<option value=\"1\" selected>Activity Groups</option>";
    		} else {
    			probation_string += "<option value=\"1\">Activity Groups</option>";
    		}

    		if(row.excptn_type == 2){
    			probation_string += "<option value=\"2\" selected>CCEs</option>";
    		} else {
    			probation_string += "<option value=\"2\">CCEs</option>";
    		}

    		if(row.excptn_type == 3){
    			probation_string += "<option value=\"3\" Selected>Community Service</option>";
    		} else {
    			probation_string += "<option value=\"3\">Community Service</option>";
    		}

    		if(row.excptn_type == 4){
    			probation_string += "<option value=\"4\" Selected>FDG Group</option>";
    		} else {
    			probation_string += "<option value=\"4\">FDG Group</option>";
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
        var excptn_type = $("#" + id + "t2").val();
        var excptn_name = $("#" + id + "t1").val();
        var excptn_value = $("#" + id + "t4").val();
		var button_id = "#btn" + id;


        $(button_id).removeClass("fa-pencil");
        $(button_id).addClass("fa-cog fa-spin");

        	$.ajax( {
        		type: 'POST',
                url: '/SCRIPTS/requests/exceptionsrequest.php',
                data: {
                    'prefix' : $('#sem_select').val(),
                	'exceptiongrantsrequest' : '1',
                	'opcode' : '3',
                	'excptn_id' : id,
                	'excptn_name' : excptn_name,
                	'excptn_type' : excptn_type
                },
                dataType: "text",
                success:function(data) {

					if(data == "success"){
						 $("#" + id + "t2").css({"background-color": ""});
				         $("#" + id + "t1").css({"background-color": ""});
				         $("#" + id + "t4").css({"background-color": ""});
				         $("#" + id + "t2").data({"orig": excptn_type});
				         $("#" + id + "t1").data({"orig": excptn_name});
				         $("#" + id + "t4").data({"orig": excptn_value});
					}

                	showMessage(data, "Exemption Updated");

                }
             });

        	$(button_id).removeClass("fa-cog fa-spin");
        	$(button_id).addClass("fa-pencil");
    }).end().find(".command-delete").on("click", function(e){


    	if(confirm("Are you sure you want to delete this Exemption?")){

        	$.ajax( {
        		type: 'POST',
                url: '/SCRIPTS/requests/exceptionsrequest.php',
                data: {
                    'prefix' : $('#sem_select').val(),
                	'exceptiongrantsrequest' : '1',
                	'opcode' : '2',
                	'excptn_id' : $(this).data("row-id")
                },
                dataType: "text",
                success:function(data) {

                	if(data == "success"){
                		$("#grid-command-buttons-exemptions").bootgrid("reload");
                	} else {
                		//Do Nothing
                	}

                	showMessage(data, "Exception Deleted.");

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

var subbutton = document.getElementById("submitButton");
$(subbutton).click(function() {
    // Stop the browser from submitting the form.



    var form = $('#exemption_form');
    var formData = $(form).serialize();

    $.ajax({
        type: 'POST',
        url: "/SCRIPTS/requests/exceptionsrequest.php",
        data: formData,
        cache: false,
        dataType: "text",
        success: function(result){
        	if(result == "success"){
        		$("#exemption_form").trigger("reset");;
        		$("#grid-command-buttons-exemptions").bootgrid("reload");
        	} else {
        	}

        	showMessage(result, "Exemption Added.");
        }
    })



});

$("#sem_select").change(function(){
	$("#grid-command-buttons-exemptions").bootgrid("reload");
});

});



</script>



<form id="exemption_form" method="post" action="#" name="exceptiongrantsrequest" class="form-horizontal">

<fieldset>

<!-- Form Name -->
<legend>Modify Exemptions</legend>


<div class="form-group">
<label class="col-md-4 control-label" for="sem_select">Semester:</label>
<div class="col-md-4">
<select id="sem_select" name="prefix" class="form-control"><?php


$result = mysqli_query($conn, "SELECT sem_name, sem_prefix from semesters order by sem_id desc");

$count = 0;
while($row = mysqli_fetch_row($result)){
	if($count == 0){

		echo "<option value=\"" . $row[1] . "\" selected>Current Semester</option>\n";
	} else {
		echo "<option value=\"" . $row[1] . "\">" . $row[0] . "</option>\n";
	}
	$count++;

	mysqli_free_result($result);
	DBClose($conn);


}

?></select>
</div>
	</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="excptn_name">Exemption Name:</label>
  <div class="col-md-4">
  <input id="excptn_name" maxlength="60" name="excptn_name" placeholder="Name" class="form-control input-md" required type="text">
  </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label" for="excptn_type">Exemption Type:</label>
  <div class="col-md-4">
  <select id="excptn_type" name="excptn_type" class="form-control input-md" required>
<!--  		<option value="1" selected="selected">Activity Groups</option>-->
  		<option value="2" selected="selected">CCEs</option>
  		<option value="3">Community Service</option>
  		<option value="4">FDG Groups</option>


  </select>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="excptn_value">Exemption Value:</label>
  <div class="col-md-4">
  <input id="excptn_value" maxlength="8" name="excptn_value" placeholder="Value" class="form-control input-md" required type="text">
  </div>
</div>

</fieldset>
<input type="hidden" name="opcode" value="1"/>
<input type="hidden" name="exceptiongrantsrequest" value="1"/>



<div class="form-group">
  <label class="col-md-4 control-label" for="submitButton"></label>
  <div class="col-md-4">
    <button type="button" id="submitButton" name="submitButton" class="btn btn-primary">Submit</button>
  </div>
</div>

</form>

<table id="grid-command-buttons-exemptions" class="table table-condensed table-hover table-striped">
        <thead>
            <tr>
                <th data-column-id="excptn_name" data-type="text" data-formatter="excptn_name" >Exemption Name</th>
                <th data-column-id="excptn_type" data-type="numeric" data-formatter="excptn_type">Type</th>
                <th data-column-id="excptn_value" data-type="numeric" data-formatter="excptn_value" data-identifier="true">Value</th>
                <th data-column-id="excptn_id" data-type="numeric" data-identifier="true">Exemption ID</th>
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
