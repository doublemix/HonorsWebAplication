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


    var grid = $("#grid-command-buttons-eventattendence").bootgrid({
        ajax: true,
        post: function ()
        {

            return {
                id: "b0df282a-0d67-40e5-8558-c9e93b7befed",
                prefix: $("#sem_select").val(),
                event_id : $("#event_select").val()
            };
        },
        url: "/SCRIPTS/json_source/fdg_event_attendence/getfdgeventattendenceforupdate.php",
        formatters: {
            "commands": function(column, row)
            {
                return "<button id=\"" + row.pfdg_eve_att_id + "t3" + "\" type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-row-id=\"" + row.pfdg_eve_att_id + "\" data-student-name=\"" + row.usr_fname + " " + row.usr_lname + "\"><i id=\"btn" + row.pfdg_eve_att_id + "del\" class=\"fa fa-trash-o\"></i></button>";


            }



        }
    }).on("loaded.rs.jquery.bootgrid", function()
    {
        /* Executes after data is loaded and rendered */
        grid.find(".command-delete").on("click", function(e){

            if(confirm("Are you sure you want to remove: \"" + $(this).data("student-name") + "\" from this event?")){


                $.ajax( {
                    type: 'POST',
                    url: '/SCRIPTS/requests/fdgeventattendencerequest.php',
                    data: {
                        'fdgeventattendencerequest' : '1',
                        'opcode' : '2',
                        'pfdg_eve_att_id' : $(this).data("row-id"),
                        'prefix' : $("#sem_select").val()
                    },
                    dataType: "text",
                    success:function(data) {

                        if(data == "success"){
                            $("#grid-command-buttons-eventattendence").bootgrid("reload");
                            $("#grid-command-buttons-rsvp").bootgrid("reload");
                        } else {
                            //Do Nothing
                        }

                        showMessage(data, "Student Removed.");

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

    var subbutton = document.getElementById("submitButton");
    $(subbutton).click(function() {
        // Stop the browser from submitting the form.



        var form = $('#fdg_event_attendence_form');
        var formData = $(form).serialize();

        $.ajax({
            type: 'POST',
            url: "SCRIPTS/requests/fdgeventattendencerequest.php",
            data: formData,
            cache: false,
            dataType: "text",
            success: function(result){
                if(result == "success"){
                    $("#user_name").val("");
                    $("#grid-command-buttons-eventattendence").bootgrid("reload");
                    $("#grid-command-buttons-rsvp").bootgrid("reload");
                } else {
                    //Do nothing, I guess....
                    }
                showMessage(result, "Student Added");
            }
        });



    });



    $("#user_name").autocomplete({


         minLength: 0,
         source: function(request, response) {
                $.ajax({
                    url: "/SCRIPTS/json_source/fdg_event_attendence/getusersforeventattendence.php",
                    dataType: "json",
                    data: {
                        term : request.term,
                        prefix : $("#sem_select").val(),
                        event_id : $("#event_select").val()
                    },
                    success: function(data) {
                        response(data);
                    }
                });
            },
        focus: function( event, ui ) {
            $( "#user_name" ).val( ui.item.value );
            return false;
        },
        select: function( event, ui ) {
            $( "#user_name" ).val( ui.item.value );
            $("#usr_submit_id").val(ui.item.id);
            return false;
         }
    });


    $("#sem_select").change(function(){
        $.ajax( {
            type: 'GET',
            url: '/SCRIPTS/json_source/fdg_event_attendence/getfdgeventsinsemester.php',
            data: {
                'prefix' : $("#sem_select").val()
            },
            dataType: "json",
            success:function(data) {

                    $('#event_select').empty();

                    $.each(data.rows, function(index, element) {

                        $('#event_select').append("<option value=\"" + element.pfdg_event_id + "\">" + element.pfdg_event_name + "</option>");

                    });
                    $("#grid-command-buttons-eventattendence").bootgrid("reload");
                    $("#grid-command-buttons-rsvp").bootgrid("reload");
            }
         });
    });

    $("#event_select").change(function() {
        $("#grid-command-buttons-eventattendence").bootgrid("reload");
        $("#grid-command-buttons-rsvp").bootgrid("reload");
    });

    // Set up RSVP table
    const rsvpGrid = $('#grid-command-buttons-rsvp').bootgrid({
        ajax: true,
        post: function () {
            return {
                id: "b0df282a-0d67-40e5-8558-c9e93b7befed",
                prefix: $("#sem_select").val(),
                event_id: $("#event_select").val(),
            };
        },
        url: "/SCRIPTS/json_source/fdg_cce_rsvp/display_rsvp_list.php",
        formatters: {
            commands: function (column, row) {
                return "<button id='" + row.rsvp_id + "-attend' type='button' class='btn btn-xs btn-default command-attend' "
                        + "data-rsvp-id='" + row.rsvp_id + "' data-user-id='" + row.usr_id + "'>"
                        + "<i id='btn-" + row.rsvp_id + "-attend' class='fa fa-check'></i></button> "
                        + "<button id='" + row.rsvp_id + "-delete' type='button' class='btn btn-xs btn-default command-delete' "
                        + "data-rsvp-id='" + row.rsvp_id + "'>"
                        + "<i id='btn-" +row.rsvp_id + "-delete' class='fa fa-trash-o'></i></button>";
            },
        },
    }).on('loaded.rs.jquery.bootgrid', function () {
        rsvpGrid.find('.command-attend').on('click', function (e) {
            $.ajax({
                type: 'POST',
                url: '/SCRIPTS/requests/fdgeventrsvprequest.php',
                data: {
                    eventrsvprequest: true,
                    opcode: 'attend',
                    user_id: $(this).data("user-id"),
                    rsvp_id: $(this).data("rsvp-id"),
                    event_id: $("#event_select").val(),
                    prefix: $('#sem_select').val(),
                },
                dataType: "text",
                success: function (data) {
                    if (data === "success") {
                        $("#grid-command-buttons-eventattendance").bootgrid("reload");
                        $("#grid-command-buttons-rsvp").bootgrid("reload");
                        showMessage(data, "Student attended");
                    } else {
                        showMessage(data);
                    }
                },
            });
        });
                rsvpGrid.find('.command-delete').on('click', function (e) {
            if (confirm("Are you sure you want to remove this student from the RSVP list?")) {
                $.ajax({
                    type: 'POST',
                    url: '/SCRIPTS/requests/fdgeventrsvprequest.php',
                    opcode: 'delete',
                    data: {
                        eventrsvprequest: true,
                        opcode: 'delete',
                        rsvp_id: $(this).data("rsvp-id"),
                        prefix: $('#sem_select').val(),
                    },
                    dataType: 'text',
                    success: function (data) {
                        if (data === 'success') {
                            $("#grid-command-buttons-eventattendence").bootgrid("reload");
                            $("#grid-command-buttons-rsvp").bootgrid("reload");
                        } else {
                            // do nothing
                        }
                        showMessage(data, "RSVP deleted");
                    },
                });
            } else {
                // do nothing
            }
        });
        if (rsvpGrid.bootgrid("getTotalRowCount") > 0) {
            $("#rsvp-list-container").show();
        } else {
            $("#rsvp-list-container").hide();
        }
    });
});

//# sourceURL=tools/fdgeventattendance.js

</script>

<form id="fdg_event_attendence_form" method="post" action="#" name="fdgeventattendencerequest" class="form-horizontal">

<fieldset>

<!-- Form Name -->

<legend>FDG Event Attendance</legend>

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

<div class="form-group">
  <label class="col-md-4 control-label" for="event_select">Event:</label>
  <div class="col-md-4">
  <select id="event_select" name="pfdg_event_id" class="form-control input-md"><?php

  	$conn = DBConnect();



  	$result = mysqli_query($conn, "SELECT sem_prefix FROM semesters WHERE sem_id in (SELECT MAX(sem_id) From semesters)");

  	$row = mysqli_fetch_row($result);



  	$result = mysqli_query($conn, "SELECT pfdg_event_name, pfdg_event_id FROM " . $row[0] . "_fdg_event WHERE pfdg_start_date <= NOW() ORDER BY pfdg_start_date desc" );

  	while($row = mysqli_fetch_row($result)){
  		echo "<option value=\"" . $row[1] . "\">" . $row[0] . "</option>";
  	}

  	mysqli_free_result($result);
  	DBClose($conn);

  	?></select>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="user_name">Student:</label>
  <div class="col-md-4">
  <input id="user_name" placeholder="Student Name" class="form-control input-md" required type="text">
  <input type="hidden" id="usr_submit_id" name="pstu_id" value=""/>
  </div>
</div>

</fieldset>

<input type="hidden" name="opcode" value="1"/>
<input type="hidden" name="fdgeventattendencerequest" value="1"/>



<div class="form-group">
  <label class="col-md-4 control-label" for="submitButton"></label>
  <div class="col-md-4">
    <button type="button" id="submitButton" name="submitButton" class="btn btn-primary">Submit</button>
  </div>
</div>

</form>

<div id="rsvp-list-container">
    <h4>RSVP List</h4>
        <table id="grid-command-buttons-rsvp" class="table table-condensed table-hover table-striped">
        <thead>
            <tr>
                <th data-column-id="usr_id" data-identifier="true" data-visible="false"></th>
                <th data-column-id="usr_fname" data-type="text">First Name</th>
                <th data-column-id="usr_lname" data-type="text">Last Name</th>
                <th data-column-id="usr_school_id" data-type="text">Student ID</th>
                <th data-column-id="commands" data-formatter="commands" data-sortable="false">Attend</th>
            </tr>
        </thead>
    </table>

</div>


<table id="grid-command-buttons-eventattendence" class="table table-condensed table-hover table-striped">
    <thead>
        <tr>
            <th data-column-id="usr_fname" data-type="text" >First Name</th>
            <th data-column-id="usr_lname" data-type="text" >Last Name</th>
            <th data-column-id="usr_school_id" data-type="text" >School ID</th>
            <th data-column-id="usr_id" data-type="numeric" data-identifier="true" data-visible="false">Student ID</th>
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

