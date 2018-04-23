<?php
session_start();

require_once "../../SCRIPTS/db_connect.inc";

$conn = DBConnect();

 if(($_SESSION["permissions"][0] == 1) == false){

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

var grid = $("#grid-command-buttons-probation-grants").bootgrid({
    ajax: true,
    post: function ()
    {
        return {
            id: "b0df282a-0d67-40e5-8558-c9e93b7befed"
        };
    },
    url: "/SCRIPTS/json_source/probation_grants/getgrantsforupdate.php",
    formatters: {
        "commands": function(column, row)
        {
            return "<button id=\"" + row.probation_grant_id + "t0" + "\" type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-row-id=\"" + row.probation_grant_id + "\"><i id=\"btn" + row.probation_grant_id +"\" class=\"fa fa-pencil\"></i></button> " +
            	   "<button id=\"" + row.probation_grant_id + "t3" + "\" type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-row-id=\"" + row.probation_grant_id + "\" data-probation-name=\"" + row.probation_name + "\"><i id=\"btn" + row.probation_grant_id + "del\" class=\"fa fa-trash-o\"></i></button>";
        },

    	"probation_grant_requirement": function(column, row)
    	{
    		return "<input id=\"" + row.probation_grant_id + "t1" + "\" type=\"text\" class=\"form-control\" name=\"probation_grant_requirement\"   data-orig=\"" + row.probation_grant_requirement + "\" value=\"" + row.probation_grant_requirement +  "\">";
    	},

        "probation_type": function(column, row)
    	{
        	var probation_string = "";

    		if(row.probation_type == 0){
    			probation_string += "Activity Groups";
    		}

    		if(row.probation_type == 1){
    			probation_string += "CCEs";
    		}

    		if(row.probation_type == 2){
    			probation_string += "Community Service";
    		}

    		if(row.probation_type == 3){
    			probation_string += "Academic Probation";
    		}
    		if(row.probation_type == 4){
    			probation_string += "Honors Credits";
    		}
    		if(row.probation_type == 5){
    			probation_string += "Behavioral";
    		}

    		return probation_string;

    		}

    }
}).on("loaded.rs.jquery.bootgrid", function()
{
    /* Executes after data is loaded and rendered */
    grid.find(".command-edit").on("click", function(e)
    {

    	var id = $(this).data("row-id");
        var probation_grant_requirement = $("#" + id + "t1").val();
		var button_id = "#btn" + id;


        $(button_id).removeClass("fa-pencil");
        $(button_id).addClass("fa-cog fa-spin");

        	$.ajax( {
        		type: 'POST',
                url: '/SCRIPTS/requests/probationgrantsrequest.php',
                data: {
                	'probationgrantrequest' : '1',
                	'opcode' : '3',
                	'probation_grant_id' : id,
                	'probation_grant_requirement' : probation_grant_requirement
                },
                dataType: "text",
                success:function(data) {

					if(data == "success"){
				         $("#" + id + "t1").css({"background-color": ""});
				         $("#" + id + "t1").data({"orig": probation_grant_requirement});
					}

                	showMessage(data, "Probation Updated");

                }
             });

        	$(button_id).removeClass("fa-cog fa-spin");
        	$(button_id).addClass("fa-pencil");
    }).end().find(".command-delete").on("click", function(e){


    	if(confirm("Are you sure you want to delete the Probation from the database?")){

        	$.ajax( {
        		type: 'POST',
                url: '/SCRIPTS/requests/probationgrantsrequest.php',
                data: {
                	'probationgrantrequest' : '1',
                	'opcode' : '2',
                	'probation_grant_id' : $(this).data("row-id")
                },
                dataType: "text",
                success:function(data) {

                	if(data == "success"){
                		$("#grid-command-buttons-probation-grants").bootgrid("reload");
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

var subbutton = document.getElementById("submitButton");
$(subbutton).click(function() {
    // Stop the browser from submitting the form.



    var form = $('#probation_grants_form');
    var formData = $(form).serialize();

    $.ajax({
        type: 'POST',
        url: "SCRIPTS/requests/probationgrantsrequest.php",
        data: formData,
        cache: false,
        dataType: "text",
        success: function(result){
        	if(result == "success"){
        		$("#probation_grants_form").trigger("reset");
        		$("#grid-command-buttons-probation-grants").bootgrid("reload");
        	} else {
        	}

        	showMessage(result, "Probation Added.");
        }
    })



});

var probation_list = [
				<?php

						$result = mysqli_query($conn, "SELECT probation_name, probation_id FROM probations");

						$count = 0;
						$limit = mysqli_num_rows($result);
						while($row = mysqli_fetch_row($result)){

							$str = "{ value: \"" . $row[0] . "\", id: \"" . $row[1] . "\"}";
							$count++;

							if($count < $limit){
								$str.= ",";
							}

							echo $str;

						}

						mysqli_free_result($result);

						DBClose($conn);


					?>];

$("#probation_name").autocomplete({


	 minLength: 0,
     source: probation_list,
     focus: function( event, ui ) {
         $( "#probation_name" ).val( ui.item.value );
         return false;
     },
     select: function( event, ui ) {
         $( "#probation_name" ).val( ui.item.value );
         $("#probation_submit_id").val(ui.item.id);
         return false;
	 }
});

$("#usr_id_select").autocomplete({


	 minLength: 0,
    source: "/SCRIPTS/json_source/probation_grants/getusersforautocomplete.php",
    focus: function( event, ui ) {
        $( "#usr_id_select" ).val( ui.item.value );
        return false;
    },
    select: function( event, ui ) {
        $( "#usr_id_select" ).val( ui.item.value );
        $("#usr_submit_id").val(ui.item.id);
        return false;
	 }
})

});



</script>



<form id="probation_grants_form" method="post" action="#" name="probationgrantrequest" class="form-horizontal">

<fieldset>

<!-- Form Name -->
<legend>Grant Probation</legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="probation_name">Probation Name:</label>
  <div class="col-md-4">
  <input id="probation_name" placeholder="Probation Name" class="form-control input-md" required type="text">
  <input type="hidden" id="probation_submit_id" name="probation_id" value=""/>
  </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label" for="probation_name">Student Name:</label>
  <div class="col-md-4">
  <input id="usr_id_select" placeholder="Student" class="form-control input-md" required type="text">
  <input type="hidden" id="usr_submit_id" name="usr_id" value=""/>
  </div>
</div>

  <input type="hidden" id="probation_value_sub" name="probation_grant_requirement" value="0">


</fieldset>

<input type="hidden" name="opcode" value="1"/>
<input type="hidden" name="probationgrantrequest" value="1"/>



<div class="form-group">
  <label class="col-md-4 control-label" for="submitButton"></label>
  <div class="col-md-4">
    <button type="button" id="submitButton" name="submitButton" class="btn btn-primary">Submit</button>
  </div>
</div>

</form>

<table id="grid-command-buttons-probation-grants" class="table table-condensed table-hover table-striped">
        <thead>
            <tr>
                <th data-column-id="usr_fname" data-type="text" >First Name</th>
                <th data-column-id="usr_lname" data-type="text" >Last Name</th>
                <th data-column-id="probation_name" data-type="text" >Probation Name</th>
                <th data-column-id="probation_grant_id" data-type="numeric" data-identifier="true" data-visible="false">Probation ID</th>
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