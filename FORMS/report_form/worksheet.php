
<body>
<script type="text/javascript">


$(document).ready (function(){

	var subbutton = document.getElementById("submitButton");

	$(subbutton).click(function() {

		$("#worksheet_report").load("/FORMS/report_form/report_template?query=" + $("#query").val());
	    
	    
	    
	});

	
	});

	


</script>





<form id="fdg_add_report_attendence" method="post" action="#" name="fdgattendencerequest" class="form-horizontal">

<fieldset>

<!-- Form Name -->

<legend>FDG Report Attendence</legend>
  	
  	
 

	

<div class="form-group">
  <label class="col-md-4 control-label" for="query">Query:</label>  
  <div class="col-md-4">
  <input id="query" placeholder="Query" class="form-control input-md" type="text">
  </div>
</div>


</fieldset>




<div class="form-group">
  <label class="col-md-4 control-label" for="submitButton"></label>
  <div class="col-md-8">
    <button type="button" class="btn btn-primary" id="submitButton" disabled>Submit</button>
  </div>
</div>

</form>


<div id="worksheet_report" style="width: 100%; height: auto;"></div>

  

</body>



