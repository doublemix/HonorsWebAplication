<?php

session_start();

require_once "../../SCRIPTS/db_utils.php";
require_once "./exemption_reasons.php";

?><body>
<script type="text/javascript">

function showMessage(result){
	 if(result === "success"){
		  $("#error_area").queue(function(){
		  $("#error_area").text("Exemption Grant Requested.");
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

function checkCurrentRequestStatus() {
    $.ajax({
        type: 'POST',
        url: 'SCRIPTS/json_source/exemption_requests/check_for_existing_exception_request.php',
        cache: false,
        dataType: 'json',
        success: function(result){
            if (result !== null) {
                // an existing request was found

                // show the status line
                $('#status-group').show();
                $('#status-box').text(result.exrq_status);

                // update checkboxes
                var halfExemptionReasons = JSON.parse(result.exrq_half_req);
                var fullExemptionReasons = JSON.parse(result.exrq_full_req);
                $('#cce_half_reason_list :checkbox').filter(function () {
                    return $.inArray(this.value, halfExemptionReasons) >= 0;
                }).prop('checked', true);
                $('#cce_full_reason_list :checkbox').filter(function () {
                    return $.inArray(this.value, fullExemptionReasons) >= 0;
                }).prop('checked', true);

                // show details
                $('#details').val(result.exrq_details);

                if (result.exrq_status !== 'Pending') {
                    // if it's no longer pending (then it's accepted or rejected and should not be editable
                    $('#submit_exception_grant_form input, #submit_exception_grant_form textarea, #submit_exception_grant_form button')
                            .prop('disabled', true);
                }

            }
        }
    });
}

$(document).ready (function(){

var subbutton = document.getElementById("submitButton");

    $(subbutton).click(function() {
        // Stop the browser from submitting the form.

        var form = $('#submit_exception_grant_form');
        var formData = $(form).serialize();

        $.ajax({
            type: 'POST',
            url: "SCRIPTS/requests/requestexceptionrequest.php",
            data: formData,
            cache: false,
            dataType: "text",
            success: function(result){
                if(result === "success"){
                    checkCurrentRequestStatus();
                } else {
                }

                showMessage(result);
            }
        })

    });

    checkCurrentRequestStatus();

});




</script>

<form id="submit_exception_grant_form" method="post" name="requestexceptiongrant">
<fieldset>

<!-- Form Name -->
<legend>Request Exemption</legend>

<div class="form-group" id="status-group" style="display: none;">
    <label class="control-label">Request Status: <span id="status-box"></span></label>
</div>

<!-- Checkbox Group -->
<div class="form-group">
    <label for="cce_half_reason_select[]" class="control-label">I am requesting exemption from TWO CCE's for the following reason(s):</label>
    <div id="cce_half_reason_list">
        Check all that apply<br/>
        <?php
        foreach (HALF_EXEMPTION_REASONS as $key => $value) {
            ?>
            <div class="checkbox">
                <label><input type="checkbox" name="cce_half_reason_select[]" value="<?php echo htmlspecialchars($key); ?>"><?php echo htmlspecialchars($value); ?></label>
            </div>
            <?php
        }
        ?>
    </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="control-label" for="details">Please use this section to elaborate on any items necessary.</label>
  <div>
    <textarea name="details" maxlength="500" class="form-control" id="details"></textarea>
  </div>
</div>

<!-- Checkbox Group -->
<div class="form-group">
    <label for="cce_full_reason_select[]" class="control-label">I am requesting exemption from ALL CCE's for the following reason(s):</label>
    <div id="cce_full_reason_list">
        Check all that apply<br/>
        <?php
        foreach (FULL_EXEMPTION_REASONS as $key => $value) {
            ?>
            <div class="checkbox">
                <label><input type="checkbox" name="cce_full_reason_select[]" value="<?php echo htmlspecialchars($key); ?>"><?php echo htmlspecialchars($value); ?></label>
            </div>
            <?php
        }
        ?>
    </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="control-label" for="submitButton"></label>
  <div>
    <button type="button" id="submitButton" name="submitButton" class="btn btn-primary">Submit</button>
  </div>
</div>

</fieldset>
<input type="hidden" name="opcode" value="request"/>
<input type="hidden" name="requestexceptionrequest" value="1"/>

</form>

<div class="form-group">
  <label class="col-md-4 control-label" for="error_area"></label>
  <div class="col-md-4">
    <span id="error_area"></span>
  </div>
</div>

</body>
