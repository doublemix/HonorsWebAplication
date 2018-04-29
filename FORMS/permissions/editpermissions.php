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

	function showMessage(result){
		 if(result === "success"){
			  $("#error_area").queue(function(){
			  $("#error_area").text("User Permissions Updated.");
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

    var grid = $("#grid-command-buttons-update").bootgrid({
        ajax: true,
        post: function ()
        {
            return {
                id: "b0df282a-0d67-40e5-8558-c9e93b7befed"
            };
        },
        url: "SCRIPTS/json_source/permissions/getpermissionsforupdate.php",
        formatters: {
            "commands": function(column, row)
            {
                return "<button id=\"" + row.perm_id + "t0" + "\" type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-row-id=\"" + row.perm_id + "\"><i id=\"btn" + row.perm_id +"\" class=\"fa fa-pencil\"></i></button> ";
            },

            "perm_worker": function(column, row)
        	{
        		var widget_string = "";

        		 widget_string = "<select id=\"" + row.perm_id + "t1" + "\" class=\"form-control\" name=\"perm_worker\" data-orig=\"" + row.perm_worker + "\" >";

        		if(row.perm_worker == 0){
        			 widget_string += "<option value=\"0\" selected>No</option>";
        		} else {
        			 widget_string += "<option value=\"0\">NO</option>";
        		}

        		if(row.perm_worker == 1){
        			 widget_string += "<option value=\"1\" Selected>Yes</option>";
        		} else {
        			 widget_string += "<option value=\"1\">Yes</option>";
        		}


        		 widget_string += "</select>";

        		return  widget_string;

        	},


            "perm_stats": function(column, row)
        	{
        		var widget_string = "";

        		 widget_string = "<select id=\"" + row.perm_id + "t2" + "\" class=\"form-control\" name=\"perm_stats\" data-orig=\"" + row.perm_stats + "\" >";

        		if(row.perm_stats == 0){
        			 widget_string += "<option value=\"0\" selected>No</option>";
        		} else {
        			 widget_string += "<option value=\"0\">NO</option>";
        		}

        		if(row.perm_stats == 1){
        			 widget_string += "<option value=\"1\" Selected>Yes</option>";
        		} else {
        			 widget_string += "<option value=\"1\">Yes</option>";
        		}


        		 widget_string += "</select>";

        		return  widget_string;

        	},


        	"perm_users": function(column, row)
        	{
        		var widget_string = "";

        		 widget_string = "<select id=\"" + row.perm_id + "t3" + "\" class=\"form-control\" name=\"perm_users\" data-orig=\"" + row.perm_users + "\" >";

        		if(row.perm_users == 0){
        			 widget_string += "<option value=\"0\" selected>No</option>";
        		} else {
        			 widget_string += "<option value=\"0\">NO</option>";
        		}

        		if(row.perm_users == 1){
        			 widget_string += "<option value=\"1\" Selected>Yes</option>";
        		} else {
        			 widget_string += "<option value=\"1\">Yes</option>";
        		}


        		 widget_string += "</select>";

        		return  widget_string;

        	},

        	"perm_events": function(column, row)
        	{
        		var widget_string = "";

        		 widget_string = "<select id=\"" + row.perm_id + "t4" + "\" class=\"form-control\" name=\"perm_events\" data-orig=\"" + row.perm_events + "\" >";

        		if(row.perm_events == 0){
        			 widget_string += "<option value=\"0\" selected>No</option>";
        		} else {
        			 widget_string += "<option value=\"0\">NO</option>";
        		}

        		if(row.perm_events == 1){
        			 widget_string += "<option value=\"1\" Selected>Yes</option>";
        		} else {
        			 widget_string += "<option value=\"1\">Yes</option>";
        		}


        		 widget_string += "</select>";

        		return  widget_string;

        	},

        	"perm_fdg": function(column, row)
        	{
        		var widget_string = "";

        		 widget_string = "<select id=\"" + row.perm_id + "t5" + "\" class=\"form-control\" name=\"perm_fdg\" data-orig=\"" + row.perm_fdg + "\" >";

        		if(row.perm_fdg == 0){
        			 widget_string += "<option value=\"0\" selected>No</option>";
        		} else {
        			 widget_string += "<option value=\"0\">NO</option>";
        		}

        		if(row.perm_fdg == 1){
        			 widget_string += "<option value=\"1\" Selected>Yes</option>";
        		} else {
        			 widget_string += "<option value=\"1\">Yes</option>";
        		}


        		 widget_string += "</select>";

        		return  widget_string;

        	},

        	"perm_academic_events": function(column, row)
        	{
        		var widget_string = "";

        		 widget_string = "<select id=\"" + row.perm_id + "t6" + "\" class=\"form-control\" name=\"perm_academic_events\" data-orig=\"" + row.perm_academic_events + "\" >";

        		if(row.perm_academic_events == 0){
        			 widget_string += "<option value=\"0\" selected>No</option>";
        		} else {
        			 widget_string += "<option value=\"0\">NO</option>";
        		}

        		if(row.perm_academic_events == 1){
        			 widget_string += "<option value=\"1\" Selected>Yes</option>";
        		} else {
        			 widget_string += "<option value=\"1\">Yes</option>";
        		}


        		 widget_string += "</select>";

        		return  widget_string;

        	},

        	"perm_activity_groups": function(column, row)
        	{
        		var widget_string = "";

        		 widget_string = "<select id=\"" + row.perm_id + "t7" + "\" class=\"form-control\" name=\"perm_activity_groups\" data-orig=\"" + row.perm_activity_groups + "\" >";

        		if(row.perm_activity_groups == 0){
        			 widget_string += "<option value=\"0\" selected>No</option>";
        		} else {
        			 widget_string += "<option value=\"0\">NO</option>";
        		}

        		if(row.perm_activity_groups == 1){
        			 widget_string += "<option value=\"1\" Selected>Yes</option>";
        		} else {
        			 widget_string += "<option value=\"1\">Yes</option>";
        		}


        		 widget_string += "</select>";

        		return  widget_string;

        	},

        	"perm_comm_serv": function(column, row)
        	{
        		var widget_string = "";

        		 widget_string = "<select id=\"" + row.perm_id + "t8" + "\" class=\"form-control\" name=\"perm_comm_serv\" data-orig=\"" + row.perm_comm_serv + "\" >";

        		if(row.perm_comm_serv == 0){
        			 widget_string += "<option value=\"0\" selected>No</option>";
        		} else {
        			 widget_string += "<option value=\"0\">NO</option>";
        		}

        		if(row.perm_comm_serv == 1){
        			 widget_string += "<option value=\"1\" Selected>Yes</option>";
        		} else {
        			 widget_string += "<option value=\"1\">Yes</option>";
        		}


        		 widget_string += "</select>";

        		return  widget_string;

        	},

        	"perm_pif": function(column, row)
        	{
        		var widget_string = "";

        		 widget_string = "<select id=\"" + row.perm_id + "t9" + "\" class=\"form-control\" name=\"perm_pif\" data-orig=\"" + row.perm_pif + "\" >";

        		if(row.perm_pif == 0){
        			 widget_string += "<option value=\"0\" selected>No</option>";
        		} else {
        			 widget_string += "<option value=\"0\">NO</option>";
        		}

        		if(row.perm_pif == 1){
        			 widget_string += "<option value=\"1\" Selected>Yes</option>";
        		} else {
        			 widget_string += "<option value=\"1\">Yes</option>";
        		}


        		 widget_string += "</select>";

        		return  widget_string;

        	},

        	"perm_image_slides": function(column, row)
        	{
        		var widget_string = "";

        		 widget_string = "<select id=\"" + row.perm_id + "t10" + "\" class=\"form-control\" name=\"perm_image_slides\" data-orig=\"" + row.perm_image_slides + "\" >";

        		if(row.perm_image_slides == 0){
        			 widget_string += "<option value=\"0\" selected>No</option>";
        		} else {
        			 widget_string += "<option value=\"0\">NO</option>";
        		}

        		if(row.perm_image_slides == 1){
        			 widget_string += "<option value=\"1\" Selected>Yes</option>";
        		} else {
        			 widget_string += "<option value=\"1\">Yes</option>";
        		}


        		 widget_string += "</select>";

        		return  widget_string;

        	},

        	"perm_news": function(column, row)
        	{
        		var widget_string = "";

        		 widget_string = "<select id=\"" + row.perm_id + "t11" + "\" class=\"form-control\" name=\"perm_news\" data-orig=\"" + row.perm_news + "\" >";

        		if(row.perm_news == 0){
        			 widget_string += "<option value=\"0\" selected>No</option>";
        		} else {
        			 widget_string += "<option value=\"0\">NO</option>";
        		}

        		if(row.perm_news == 1){
        			 widget_string += "<option value=\"1\" Selected>Yes</option>";
        		} else {
        			 widget_string += "<option value=\"1\">Yes</option>";
        		}


        		 widget_string += "</select>";

        		return  widget_string;

        	},

        	"perm_exemptions": function(column, row)
        	{
        		var widget_string = "";

        		 widget_string = "<select id=\"" + row.perm_id + "t12" + "\" class=\"form-control\" name=\"perm_exemptions\" data-orig=\"" + row.perm_exemptions + "\" >";

        		if(row.perm_exemptions == 0){
        			 widget_string += "<option value=\"0\" selected>No</option>";
        		} else {
        			 widget_string += "<option value=\"0\">NO</option>";
        		}

        		if(row.perm_exemptions == 1){
        			 widget_string += "<option value=\"1\" Selected>Yes</option>";
        		} else {
        			 widget_string += "<option value=\"1\">Yes</option>";
        		}


        		 widget_string += "</select>";

        		return  widget_string;

        	}





        }
    }).on("loaded.rs.jquery.bootgrid", function()
    {
        /* Executes after data is loaded and rendered */
        grid.find(".command-edit").on("click", function(e)
        {

        	var id = $(this).data("row-id");
            var perm_worker = $("#" + id + "t1").val();
            var perm_stats = $("#" + id + "t2").val();
            var perm_users = $("#" + id + "t3").val();
            var perm_events = $("#" + id + "t4").val();
            var perm_fdg = $("#" + id + "t5").val();
            var perm_academic_events = $("#" + id + "t6").val();
            var perm_activity_groups = $("#" + id + "t7").val();
            var perm_comm_serv = $("#" + id + "t8").val();
            var perm_pif = $("#" + id + "t9").val();
            var perm_image_slides = $("#" + id + "t10").val();
            var perm_news = $("#" + id + "t11").val();
            var perm_exemptions = $("#" + id + "t12").val();
			var button_id = "#btn" + id;

            //TODO
            $(button_id).removeClass("fa-pencil");
            $(button_id).addClass("fa-cog fa-spin");

            	$.ajax( {
            		type: 'POST',
                    url: '/SCRIPTS/requests/permissionsrequest.php',
                    data: {
                    	'permissionchangerequest' : '1',
                    	'opcode' : '1',
                    	'perm_id' : id,
                    	'perm_worker' : perm_worker,
                    	'perm_stats' : perm_stats,
                    	'perm_users' : perm_users,
                    	'perm_events' : perm_events,
                    	'perm_fdg' : perm_fdg,
                    	'perm_academic_events' : perm_academic_events,
                    	'perm_activity_groups' : perm_activity_groups,
                    	'perm_comm_serv' : perm_comm_serv,
                    	'perm_pif' : perm_pif,
                    	'perm_image_slides': perm_image_slides,
                    	'perm_news' : perm_news,
                    	'perm_exemptions': perm_exemptions

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
					         $("#" + id + "t8").css({"background-color": ""});
					         $("#" + id + "t9").css({"background-color": ""});
					         $("#" + id + "t10").css({"background-color": ""});
					         $("#" + id + "t11").css({"background-color": ""});
					         $("#" + id + "t12").css({"background-color": ""});
					         $("#" + id + "t2").data({"orig": perm_stats});
					         $("#" + id + "t1").data({"orig": perm_worker});
					         $("#" + id + "t3").data({"orig": perm_users });
					         $("#" + id + "t4").data({"orig": perm_events });
					         $("#" + id + "t5").data({"orig": perm_fdg });
					         $("#" + id + "t6").data({"orig": perm_academic_events });
					         $("#" + id + "t7").data({"orig": perm_activity_groups });
					         $("#" + id + "t8").data({"orig": perm_comm_serv});
					         $("#" + id + "t9").data({"orig": perm_pif});
					         $("#" + id + "t10").data({"orig": perm_image_slides });
					         $("#" + id + "t11").data({"orig": perm_news });
					         $("#" + id + "t12").data({"orig": perm_exemptions});
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

});

</script>







    <table id="grid-command-buttons-update" class="table table-condensed table-hover table-striped">
        <thead>
            <tr>
            	<th data-column-id="usr_id" data-type="numeric" data-visible="false">User ID</th>
            	<th data-column-id="usr_fname">First Name</th>
                <th data-column-id="usr_lname" data-order="desc">Last Name</th>
                <th data-column-id="usr_school_email" data-visible="false">School Email</th>
                <th data-column-id="usr_school_id" data-type="numeric" data-visible="false">School ID</th>
                <th data-column-id="perm_id" data-type="numeric" data-identifier="true" data-visible="false">Perm ID</th>
                <th data-column-id="perm_worker" data-formatter="perm_worker" >Worker</th>
                <th data-column-id="perm_users" data-type="numeric" data-formatter="perm_users">Users</th>
				<th data-column-id="perm_exemptions" data-type="numeric" data-formatter="perm_exemptions">Exemptions</th>
                <th data-column-id="perm_fdg" data-formatter="perm_fdg" >FDG</th>
                <th data-column-id="perm_academic_events" data-formatter="perm_academic_events" >CCEs</th>
<!--                <th data-column-id="perm_activity_groups" data-formatter="perm_activity_groups" >Activity Groups</th>-->
                <th data-column-id="perm_comm_serv" data-formatter="perm_comm_serv" >Comm Service</th>
                <th data-column-id="perm_pif" data-formatter="perm_pif" >PIF</th>
                <th data-column-id="perm_image_slides" data-formatter="perm_image_slides" >Image Slides</th>
                <th data-column-id="perm_news" data-formatter="perm_news" >News</th>
                <th data-column-id="perm_stats" data-type="numeric" data-formatter="perm_stats">Stats</th>
                <th data-column-id="perm_events" data-type="numeric" data-formatter="perm_events">Events</th>
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
