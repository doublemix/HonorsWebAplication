<?php
session_start();

require_once "../../SCRIPTS/db_connect.inc";

$conn = DBConnect();

if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][10] == 1) == false){

	header("location: index.php");
	die();
}

?><body>
<script type="text/javascript">

function showMessage(result, success){
	 if(result === "success" || success){
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


$(document).ready (function(){

	$("#sem_select").change(function(){
		$.ajax( {
			type: 'POST',
	        url: '/SCRIPTS/json_source/events/get_events_for_update.php',
	        data: {
	        	'prefix' : $("#sem_select").val()
	        },
	        dataType: "json",
	        success:function(data) {

	        		$('#event_select').empty();
	        		$.each(data.rows, function(index, element) {
	        			$('#event_select').append("<option value=\"" + element.event_id + "\">" + element.event_title + "</option>");
	        		});

	        		$("#event_select").trigger("change");

	        }
	     });
	});

	$("#event_select").change(function(){
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
        url: "/SCRIPTS/json_source/event_rsvp/display_rsvp_list.php",
        formatters: {
            commands: function (column, row) {
                return "<button id='" + row.rsvp_id + "-attend' type='button' class='btn btn-xs btn-default command-attend' "
                        + "data-rsvp-id='" + row.rsvp_id + "' data-user-id='" + row.usr_id + "'>"
                        + "<i id='btn-" + row.rsvp_id + "-attend' class='fa fa-check'></i></button> ";
            },
        }
    }).on('loaded.rs.jquery.bootgrid', function () {
        rsvpGrid.find('.command-delete').on('click', function (e) {
            if (confirm("Are you sure you want to remove this student from the RSVP list?")) {
                $.ajax({
                    type: 'POST',
                    url: '/SCRIPTS/requests/eventrsvprequest.php',
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
                            $("#grid-command-buttons-rsvp").bootgrid("reload");
                            showMessage("RSVP deleted", true);
                        } else {
                            // do nothing
                        }
                    },
                });
            } else {
                // do nothing
            }
        });
    });

	$('#sem_select').trigger('change');
 });

</script>

<div id="add_acad_event_attendence" class="form-horizontal">

<fieldset>

<!-- Form Name -->

<legend>Events RSVPs</legend><?php
	$result = mysqli_query($conn, "SELECT sem_name, sem_prefix from semesters order by sem_id desc;");

	echo "<div class=\"form-group\">\n";
	echo "<label class=\"col-md-4 control-label\" for=\"sem_select\">Semester:</label>\n";
	echo "<div class=\"col-md-4\">";
	echo "<select id=\"sem_select\" name=\"prefix\" class=\"form-control\">";

	$count = 0;
	while($row = mysqli_fetch_row($result)){
		if($count == 0){
			$prefix = $row[1];
			echo "<option value=\"" . $row[1] . "\" selected>Current Semester</option>\n";
		} else {
			echo "<option value=\"" . $row[1] . "\">" . $row[0] . "</option>\n";
		}
		$count++;

	}

	echo "</select>";
	echo "</div>";
	echo "</div>";
?>

<div class="form-group">
  <label class="col-md-4 control-label" for="event_select">Event:</label>
  <div class="col-md-4">
  <select id="event_select" name="acad_id" class="form-control"></select>
  </div>
</div>

</fieldset>

</div>

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

<div class="form-group">
  <label class="col-md-4 control-label" for="error_area"></label>
  <div class="col-md-4">
    <span id="error_area"></span>
  </div>
</div>
</body>