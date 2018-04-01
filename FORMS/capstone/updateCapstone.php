<?php 
session_start();

require_once "../../SCRIPTS/db_connect.inc";

$conn = DBConnect();

if (($_SESSION ["permissions"] [0] == 1) == false) {
	
	header("location: index.php");
	die();
}

?><body>

<script>

$(document).ready (function(){
	
	function showMessage(result){
		 if(result === "success"){
			  $("#error_area").queue(function(){
			  $("#error_area").text("User Updated.");
			  $("#error_area").css("color", "green");
			  $("#error_area").fadeIn(500).delay( 4000 ).fadeOut(500);
			 $(this).dequeue();
			  });
			 
			  } else {
			 var err = "Error: " + result;
			  $("#error_area").queue(function(){
			   $("#error_area").text("");
			  $("#error_area").text(err);
			  $("#error_area").css("color", "red");
			  $("#error_area").fadeIn(500).delay( 4000 ).fadeOut(500);
			 $(this).dequeue();
			  })
		}
	}

    var grid = $("#grid-command-buttons-capstone").bootgrid({
        ajax: true,
        post: function ()
        {
            return {
                id: "b0df282a-0d67-40e5-8558-c9e93b7befed"
            };
        },
        url: "/SCRIPTS/json_source/capstones/getcapstoneupdateinfo.php",
        formatters: {
            "commands": function(column, row)
            {
                return "<button id=\"" + row.capstone_id + "t0" + "\" type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-row-id=\"" + row.capstone_id + "\"><i id=\"btn" + row.usr_id +"\" class=\"fa fa-pencil\"></i></button> ";
            },
        
        	"capstone_name": function(column, row)
        	{
        		return "<input id=\"" + row.capstone_id + "t1" + "\" type=\"text\" maxlength=\"100\" class=\"form-control\" name=\"capstone_name\"  data-row-id=\"" + row.capstone_id + "\" data-orig=\"" + row.capstone_name + "\" value=\"" + row.capstone_name +  "\">";
        	},
            
            "capstone_description": function(column, row)
        	{
            	return "<textarea id=\"" + row.capstone_id + "t2" + "\" class=\"form-control\" maxlength=\"500\" name=\"capstone_description\"  data-row-id=\"" + row.capstone_id + "\" data-orig=\"" + row.capstone_description + "\">" + row.capstone_description + "</textarea>";
        	},
        
            
            "capstone_requirements": function(column, row)
        	{
        		return "<textarea id=\"" + row.capstone_id + "t3" + "\" class=\"form-control\" maxlength=\"200\" name=\"capstone_requirements\" data-row-id=\"" + row.capstone_id + "\" data-orig=\"" + row.capstone_requirements + "\">" + row.capstone_requirements + "</textarea>";
        	},
        
            
            "capstone_advisor": function(column, row)
        	{
        		
        		return "<textarea id=\"" + row.capstone_id + "t4" + "\" class=\"form-control\" maxlength=\"60\" name=\"capstone_advisor\" data-orig=\"" + row.capstone_advisor + "\" data-row-id=\"" + row.capstone_id + "\">" + row.capstone_advisor + "</textarea>";
        		
        		
        	},
        
            
            "capstone_startdate": function(column, row)
        	{
        		
        		var t = moment(row.capstone_startdate, "YYYY-MM-DD HH:mm:ss");

        		return "<input type=\"text\" id=\"" + row.capstone_id + "t5" + "\" class=\"form-control datepicker_dynamic\" name=\"capstone_startdate\" data-orig=\"" + t.format("MM/DD/YYYY hh:mm a") + "\" value=\"" + t.format("MM/DD/YYYY hh:mm a") + "\"  data-row-id=\"" + row.capstone_id + "\">";
        		
        		
        	},
        
            
            "capstone_enddate": function(column, row)
        	{

        		var t = moment(row.capstone_enddate, "YYYY-MM-DD HH:mm:ss");

            	
            	return "<input type=\"text\" id=\"" + row.capstone_id + "t6" + "\" class=\"form-control datepicker_dynamic\" name=\"capstone_enddate\" data-orig=\"" + t.format("MM/DD/YYYY hh:mm a") + "\" value=\"" + t.format("MM/DD/YYYY hh:mm a") + "\"  data-row-id=\"" + row.capstone_id + "\">";
        	
        	},
        
        	 "capstone_complete": function(column, row)
         	{

        		 var cap_string = "";
         		
         		cap_string = "<select id=\"" + row.capstone_id + "t7" + "\" class=\"form-control\" name=\"capstone_complete\" data-orig=\"" + row.capstone_complete + "\" data-row-id=\"" + row.capstone_id + "\">";
         		
         		if(row.capstone_complete == 0){
         			cap_string += "<option value=\"0\" selected>Pending</option>";
         		} else {
         			cap_string += "<option value=\"0\">Pending</option>";
         		}
         		
         		if(row.capstone_complete == 1){
         			cap_string += "<option value=\"1\" Selected>Approved</option>";
         		} else {
         			cap_string += "<option value=\"1\">Approved</option>";
         		}
         		
         		if(row.capstone_complete == 2){
         			cap_string += "<option value=\"2\" Selected>Rejected</option>";
         		} else {
         			cap_string += "<option value=\"2\">Rejected</option>";
         		}
         		
         	
         		
         		cap_string += "</select>";
         		
         		return cap_string;
         	
         	}
        }
    }).on("loaded.rs.jquery.bootgrid", function()
    {
        /* Executes after data is loaded and rendered */
        grid.find(".command-edit").on("click", function(e)
        {

        	var id = $(this).data("row-id");
            var capstone_name = $("#" + id + "t1").val();
            var capstone_description = $("#" + id + "t2").val();
            var capstone_requirements = $("#" + id + "t3").val();
            var capstone_advisor = $("#" + id + "t4").val();
            var capstone_startdate = $("#" + id + "t5").val();
            var capstone_enddate = $("#" + id + "t6").val();
            var capstone_complete = $("#" + id + "t7").val();
			var button_id = "#btn" + id;

            
            $(button_id).removeClass("fa-pencil");
            $(button_id).addClass("fa-cog fa-spin");
        	
            	$.ajax( {
            		type: 'POST',
                    url: '/SCRIPTS/requests/capstonerequest.php',
                    data: {
                    	'capstonechangerequest' : '1',
                    	'opcode' : '5',
                    	'capstone_id' : id,
                    	'capstone_name' : capstone_name,
                    	'capstone_description' : capstone_description,
                    	'capstone_requirements' : capstone_requirements,
                    	'capstone_advisor' : capstone_advisor,
                    	'capstone_startdate' : capstone_startdate,
                    	'capstone_enddate' : capstone_enddate,
                    	'capstone_complete' : capstone_complete
                    },
                    dataType: "text",
                    success:function(data) {

						if(data === "success"){
							 $("#" + id + "t2").css({"background-color": ""});
					         $("#" + id + "t1").css({"background-color": ""});
					         $("#" + id + "t3").css({"background-color": ""});
					         $("#" + id + "t4").css({"background-color": ""});
					         $("#" + id + "t5").css({"background-color": ""});
					         $("#" + id + "t6").css({"background-color": ""});
					         $("#" + id + "t7").css({"background-color": ""});
					         $("#" + id + "t2").data({"orig": capstone_description});
					         $("#" + id + "t1").data({"orig": capstone_name});
					         $("#" + id + "t3").data({"orig": capstone_requirements });
					         $("#" + id + "t4").data({"orig": capstone_advisor });
					         $("#" + id + "t5").data({"orig": capstone_startdate });
					         $("#" + id + "t6").data({"orig": capstone_enddate });
					         $("#" + id + "t7").data({"orig": capstone_complete });
						}	
                    	
                    	showMessage(data);
                    	
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
	
    $('body').on('focus',".datepicker_dynamic", function(){
        $(this).datetimepicker({
        	timeInput: true,
        	timeFormat: "hh:mm tt"
        });
    });
    
});

</script>



   

    

    <table id="grid-command-buttons-capstone" class="table table-condensed table-hover table-striped">
        <thead>
            <tr>
                <th data-column-id="capstone_id" data-type="numeric" data-identifier="true" >Capstone ID</th>
                <th data-column-id="usr_fname">First Name</th>
                <th data-column-id="usr_lname">Last Name</th>
                <th data-column-id="capstone_name" data-formatter="capstone_name">Cap. Name</th>
                <th data-column-id="capstone_description" data-formatter="capstone_description" >Description</th>
                <th data-column-id="capstone_requirements"  data-formatter="capstone_requirements">Requirements</th>
                <th data-column-id="capstone_advisor" data-formatter="capstone_advisor">Advisors</th>
                <th data-column-id="capstone_startdate"  data-formatter="capstone_startdate" data-sortable="false">Start Date</th>
                <th data-column-id="capstone_enddate" data-formatter="capstone_enddate" data-sortable="false">End Date</th>
                <th data-column-id="capstone_complete" data-type="numeric" data-formatter="capstone_complete">Status</th>
                <th data-column-id="commands" data-formatter="commands" data-type="text" data-sortable="false">Commands</th>
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
