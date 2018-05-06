<?php

/**
 * verify_exemption_grants.php
 *
 * Created By: Mitchel Myers
 *
 * Tool to allow admins to verify submitted request for exemptions
 */

session_start();

require "../../SCRIPTS/db_utils.php";
require "../../SCRIPTS/get_permissions.inc";

if(!hasAnyOfPermission([PERM_ADMIN, PERM_WORKER, PERM_EXEMPTIONS])){
	header("location: index.php");
	die();
}

?><body>

<script type="text/javascript">

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

$(document).ready (function(){
	function getNextForm(sem_prefix){
		$.ajax({
	        type: 'POST',
	        url: "SCRIPTS/json_source/exemption_grants/get_exemption_for_review.php",
	        data: {
                "prefix" : sem_prefix
            },
	        cache: false,
	        dataType: "json",
	        success: function(result){
                if (result !== null) {
                    $("#student").val(result.usr_name);
                    $("#studentid").val(result.usr_school_id);
                    $("#year").val(result.usr_education);
                    $("#details").val(result.exrq_details);
                    $("#exrq_id").val(result.exrq_id);

                    const halfCceList = $("#half_cce_list");
                    halfCceList.empty();
                    JSON.parse(result.exrq_half_req).forEach(function (reason) {
                        $("<li></li>", { text: reason }).appendTo(halfCceList);
                    })
                    const fullCceList = $("#full_cce_list");
                    fullCceList.empty();
                    JSON.parse(result.exrq_full_req).forEach(function (reason) {
                        $("<li></li>", { text: reason }).appendTo(fullCceList);
                    });

                } else {
                    $("#student").val('');
                    $("#studentid").val('');
                    $("#year").val('');
                    $("#details").val('');
                    $("#exrq_id").val('');

                    $("#half_cce_list").empty();
                    $("#full_cce_list").empty();

                }
	        },
	    });
	}

    function updateExemptionList(){
        $.ajax( {
			type: 'GET',
	        url: '/SCRIPTS/json_source/exemption_grants/get_exemptions_in_semester.php',
	        data: {
	        	'prefix' : $("#sem_select").val()
	        },
	        dataType: "json",
	        success: function(data) {

                $('#excptn_id').empty();
                $('#submitButton').prop('disabled', true);

                $.each(data.rows, function(index, element) {
                    $('#submitButton').prop('disabled', false);
                    $("<option />", {
                        value: element.excptn_id,
                        text: element.excptn_name,
                    }).appendTo($("#excptn_id"));
                });
                $("#excptn_id").val('');

	        }
	    });
    }

    $("#submitButton").click(function() {});

    $('#acceptButton').click(function(){
        $.ajax({
	        type: 'POST',
	        url: "SCRIPTS/requests/verifyexceptiongrants.php",
	        data: {
		        'verifyexceptiongrants' : '1',
                'opcode' : 'accept',
				'prefix' : $('#sem_select').val(),
				'exrq_id' : $('#exrq_id').val(),
				'excptn_id' : $('#excptn_id').val(),
	        },
	        cache: false,
	        dataType: "text",
	        success: function(result){
	        	if(result === "success"){
	        		getNextForm($('#sem_select').val())
	        	} else {

	        	}
	        	showMessage(result, "Exemption Grant Accepted.");
	        }
	    });
    });

    $('#rejectButton').click(function(){
        if(confirm("Are you sure you want to reject this request?")){
          $.ajax({
                type: 'POST',
                url: "SCRIPTS/requests/verifyexceptiongrants.php",
                data: {
                    'verifyexceptiongrants' : '1',
                    'opcode' : 'reject',
                    'prefix' : $('#sem_select').val(),
                    'exrq_id' : $('#exrq_id').val()
                },
                cache: false,
                dataType: "text",
                success: function(result){
                    if(result === "success"){
                        getNextForm($('#sem_select').val())
                    } else {

                    }
                    showMessage(result, "Exemption Grant Rejected.");
                }
            });
        }
    });

    $("#sem_select").change(function(){
        getNextForm($("#sem_select").val());
        updateExemptionList();
    });

    getNextForm($("#sem_select").val());
    updateExemptionList();
});

</script>

<form id="exemption_grant_verify_form" method="post" name="exemptionrequest" class="form-horizontal">
<fieldset>

<!-- Form Name -->
<legend>Exemption Grant Request Review</legend>

<div class="form-group">
    <label class="col-md-4 control-label" for="sem_select">Semester:</label>
    <div class="col-md-4">
        <select id="sem_select" name="prefix" class="form-control">
            <?php

            $result = DB_executeAndFetchAll("SELECT sem_name, sem_prefix from semesters order by sem_id desc");

            $count = 0;
            foreach ($result as $row) {
                if($count === 0){
                    echo "<option value=\"" . $row["sem_prefix"] . "\" selected>Current Semester</option>\n";
                } else {
                    echo "<option value=\"" . $row["sem_prefix"] . "\">" . $row["sem_name"] . "</option>\n";
                }
                $count++;
            }
            ?>
        </select>
    </div>
</div>

<!-- Text input-->
<div class="form-group">
    <label class="col-md-4 control-label" for="student">Student:</label>
    <div class="col-md-4">
        <input class="form-control input-md" id="student"  required type="text" placeholder="Name" readonly>
    </div>
</div>

<div class="form-group">
    <label class="col-md-4 control-label" for="studentid">Student ID:</label>
    <div class="col-md-4">
        <input name="usr_student_id" class="form-control input-md" id="studentid" required type="text" placeholder="ID" readonly>
    </div>
</div>

<div class="form-group">
    <label class="col-md-4 control-label" for="year">Year:</label>
    <div class="col-md-4">
        <select name="usr_education" class="form-control input-md" id="year" required type="text" placeholder="Year" disabled>
            <option value="1">Freshman</option>
            <option value="2">Sophomore</option>
            <option value="3">Junior</option>
            <option value="4">Senior +</option>
            <option value="5">Graduate</option>
            <option value="6">Professor</option>
        </select>
    </div>
</div>

<div class="form-group">
    <label class="col-md-4 control-label">Half CCE Exemption Reason(s):</label>
    <div class="col-md-4">
        <ul id="half_cce_list"></ul>
    </div>
</div>

<!-- Textarea -->
<div class="form-group">
    <label class="col-md-4 control-label" for="details">Additional Details:</label>
    <div class="col-md-4">
        <textarea name="details" class="form-control" id="details" readonly></textarea>
    </div>
</div>

<div class="form-group">
    <label class="col-md-4 control-label">Full CCE Exemption Reason(s):</label>
    <div class="col-md-4">
        <ul id="full_cce_list"></ul>
    </div>
</div>

<div class="form-group">
    <label for="excptn_id" class="col-md-4 control-label">Exemption To Grant:</label>
    <div class="col-md-4">
        <select name="usr_education" class="form-control input-md" id="excptn_id" required type="text" placeholder="Year">

        </select>
    </div>
</div>

<!-- Button (Double) -->
<div class="form-group">
    <label class="col-md-4 control-label" for="accept_button">Action</label>
    <div class="col-md-8">
        <button type="button" name="accept_button" class="btn btn-success" id="acceptButton" >Accept</button>
        <button type="button" name="reject_button" class="btn btn-danger" id="rejectButton" >Reject</button>
    </div>
</div>

</fieldset>
<input type="hidden" name="verify_exemption_request" value="1"/>
<input id="exrq_id" type="hidden" name="exrq_id" value=""/>

</form>

<div class="form-group">
  <label class="col-md-4 control-label" for="error_area"></label>
  <div class="col-md-4">
    <span id="error_area"></span>
  </div>
</div>





</body>

