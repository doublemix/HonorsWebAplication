<?php
session_start();

require_once "../../SCRIPTS/db_connect.inc";

$conn = DBConnect();

 if(($_SESSION["permissions"][0] == 1) == false){

	header("location: index.php");
	die();
}

?><body>

<script>

$(document).ready (function(){

	function showMessage(result, successMessage = undefined){
		 if(result.indexOf("success") > -1){
			  $("#error_area").queue(function(){
			  $("#error_area").text(successMessage || "Semester Updated.");
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

    var grid = $("#grid-command-buttons-semester").bootgrid({
        ajax: true,
        post: function ()
        {
            return {
                id: "b0df282a-0d67-40e5-8558-c9e93b7befed"
            };
        },
        url: "SCRIPTS/json_source/semesters/getsemesterupdateinfo.php",
        formatters: {
            "commands": function(column, row)
            {
                return "<button id=\"" + row.sem_id + "t0" + "\" type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-row-id=\"" + row.sem_id + "\"><i id=\"btn" + row.sem_id +"\" class=\"fa fa-pencil\"></i></button> ";
            },

        	"sem_name": function(column, row)
        	{
        		return "<input id=\"" + row.sem_id + "t1" + "\" type=\"text\" maxlength=\"20\" class=\"form-control\" name=\"fname\"  data-row-id=\"" + row.sem_id + "\" data-orig=\"" + row.sem_name + "\" value=\"" + row.sem_name +  "\">";
        	},

            "sem_active": function(column, row)
        	{
            	if(row.sem_active == 1){
					return "Yes";
            	} else {
					return "No";
            	}
        	},


            "carry_over_fdg": function(column, row)
        	{
            	if(row.carry_over_fdg == 1){
					return "Yes";
            	} else {
					return "No";
            	}
            },

        	"carry_over_com_serv": function(column, row)
        	{
        		if(row.carry_over_com_serv == 1){
					return "Yes";
            	} else {
					return "No";
            	}
            }









        }
    }).on("loaded.rs.jquery.bootgrid", function()
    {
        /* Executes after data is loaded and rendered */
        grid.find(".command-edit").on("click", function(e)
        {

        	var id = $(this).data("row-id");
            var sem_name = $("#" + id + "t1").val();
            var button_id = "#btn" + id;

            $(button_id).removeClass("fa-pencil");
            $(button_id).addClass("fa-cog fa-spin");

            	$.ajax( {
            		type: 'POST',
                    url: '/SCRIPTS/requests/semestersrequest.php',
                    data: {
                    	'semesterrequestdgjdfls' : '1',
                    	'opcode' : '3',
                    	'sem_id' : id,
                    	'sem_name' : sem_name
                    },
                    dataType: "text",
                    success:function(data) {

						if(data.indexOf("success") > -1){
					         $("#" + id + "t1").css({"background-color": ""});
					         $("#" + id + "t1").data({"orig": sem_name});
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

    $("#addTablesButton").click(function () {
        $.ajax({
            type: 'POST',
            url: '/SCRIPTS/requests/tablemaintenancerequest.php',
            data: {
                'tablemaintenancerequest': true,
                'opcode': 'fill-tables',
            },
            dataType: 'text',
            success: function (data) {
                showMessage(data, 'Tables added to semesters');
            },
        });
    });

});

</script>


<form action="#">
<fieldset>
<legend>Edit Semesters</legend>
</fieldset>
</form>




    <table id="grid-command-buttons-semester" class="table table-condensed table-hover table-striped">
        <thead>
            <tr>
                <th data-column-id="sem_name" data-type="text" data-formatter="sem_name">Name</th>
                <th data-column-id="sem_prefix" data-type="text">Prefix</th>
                <th data-column-id="sem_active" data-formatter="sem_active">Active</th>
                <th data-column-id="sem_start_date" data-type="text" data-sortable="false">Start Date</th>
                <th data-column-id="sem_end_date" data-type="text" data-sortable="false">End Date</th>
                <th data-column-id="carry_over_fdg" data-formatter="carry_over_fdg">FDG Preserved</th>
                <th data-column-id="carry_over_com_serv" data-formatter="carry_over_com_serv">ComServe Preserved</th>
                <th data-column-id="sem_id" data-type="numeric" data-identifier="true">Semester ID</th>
                <th data-column-id="commands" data-formatter="commands" data-sortable="false">Commands</th>
            </tr>
        </thead>
    </table>

<div class="row">
    <div class="col-md-12">
        Maintenance: <button type="button" class="btn btn-primary" id="addTablesButton" >Add new tables to all semesters</button>
    </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="error_area"></label>
  <div class="col-md-4">
    <span id="error_area"></span>
  </div>
</div>




</body>
