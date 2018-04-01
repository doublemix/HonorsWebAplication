<?php 
session_start();

require_once "../../SCRIPTS/db_connect.inc";

$conn = DBConnect();

 if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][9] == 1) == false){

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
			  });
		}
	}

	 var grid = $("#grid-command-buttons-image").bootgrid({
	        ajax: true,
	        post: function ()
	        {
	            return {
	                id: "b0df282a-0d67-40e5-8558-c9e93b7befed"
	            };
	        },
	        url: "/SCRIPTS/json_source/image_slide/display_images.php",
	        formatters: {
	            "commands": function(column, row)
	            {
	                return "<button id=\"" + row.slide_id + "t0" + "\" type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-row-id=\"" + row.slide_id + "\"><i id=\"btn" + row.slide_id +"\" class=\"fa fa-pencil\"></i></button> " +
	                "<button id=\"" + row.slide_id  + "t4" + "\" type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-slide=\"" + row.slide_name + "\" data-row-id=\"" + row.slide_id  + "\"><i id=\"btn" + row.slide_id  + "del\" class=\"fa fa-trash-o\"></i></button>";
	            },
	        
	        	"slide_name": function(column, row)
	        	{
	        		return "<input id=\"" + row.slide_id + "t1" + "\" type=\"text\" class=\"form-control\" maxlength=\"50\" name=\"news_title\"  data-row-id=\"" + row.slide_id + "\" data-orig=\"" + row.slide_name + "\" value=\"" + row.slide_name +  "\">";
	        	},
	            
	            "slide_text": function(column, row)
	        	{
	            	return "<textarea id=\"" + row.slide_id + "t2" + "\" class=\"form-control\" name=\"news_text\" maxlength=\"60\" data-row-id=\"" + row.slide_id + "\" data-orig=\"" + row.slide_text + "\">" + row.slide_text + "</textarea>";
	        	},

	        	"slide_isactive": function(column, row)
	        	{
	        		var widget_string = "";
	        		
	        		widget_string = "<select id=\"" + row.slide_id + "t3" + "\" class=\"form-control\" name=\"status\" data-orig=\"" + row.slide_isactive + "\" data-row-id=\"" + row.slide_id + "\">";
	        		
	        		if(row.slide_isactive == 1){
	        			widget_string += "<option value=\"1\" selected>Yes</option>";
	        		} else {
	        			widget_string += "<option value=\"1\">Yes</option>";
	        		}
	        		
	        		if(row.slide_isactive == 2){
	        			widget_string += "<option value=\"2\" selected>No</option>";
	        		} else {
	        			widget_string += "<option value=\"2\">No</option>";
	        		}
	        		
	        		widget_string += "</select>";
	        		
	        		return widget_string;
	        		
	        	},
	        	
	        	"slide_pos": function(column, row)
	        	{
	            	return "<input id=\"" + row.slide_id + "t5" + "\" class=\"form-control\" name=\"news_text\"  data-row-id=\"" + row.slide_id + "\" data-orig=\"" + row.slide_pos + "\" value=\"" + row.slide_pos + "\"/>";
	        	}
	            
	            
	        }
	    }).on("loaded.rs.jquery.bootgrid", function()
	    {
	        /* Executes after data is loaded and rendered */
	        grid.find(".command-edit").on("click", function(e)
	        {

	        	var id = $(this).data("row-id");
	            var slide_name = $("#" + id + "t1").val();
	            var slide_text = $("#" + id + "t2").val();
	            var slide_isactive = $("#" + id + "t3").val();
	            var slide_pos = $("#" + id + "t5").val();
				var button_id = "#btn" + id;

	            
	            $(button_id).removeClass("fa-pencil");
	            $(button_id).addClass("fa-cog fa-spin");
	        	
	            	$.ajax( {
	            		type: 'POST',
	                    url: '/SCRIPTS/requests/imagesliderequest.php',
	                    data: {
	                    	'imagerequest' : '1',
	                    	'opcode' : '3',
	                    	'slide_id' : id,
	                    	'slide_name' : slide_name,
	                    	'slide_text' : slide_text,
	                    	'slide_isactive' : slide_isactive,
	                    	'slide_pos' : slide_pos
	                    },
	                    dataType: "text",
	                    success:function(data) {

							if(data === "success"){
								 $("#" + id + "t2").css({"background-color": ""});
						         $("#" + id + "t1").css({"background-color": ""});
						         $("#" + id + "t3").css({"background-color": ""});
						         $("#" + id + "t5").css({"background-color": ""});
						         $("#" + id + "t2").data({"orig": slide_text});
						         $("#" + id + "t1").data({"orig": slide_name});
						         $("#" + id + "t3").data({"orig": slide_isactive});
						         $("#" + id + "t5").data({"orig": slide_pos});
						    
							}	
	                    	
	                    	showMessage(data, "Slide updated.");
	                    	
	                    }
	                 })
	            	
	            	$(button_id).removeClass("fa-cog fa-spin");
	            	$(button_id).addClass("fa-pencil");
	            	
	        }).end().find(".command-delete").on("click", function(e){
			    
	        	
	        	if(confirm("Are you sure you want to delete the slide: \"" + $(this).data("slide") + "\" from the database?")){
	            	
	            	$.ajax( {
	            		type: 'POST',
	                    url: '/SCRIPTS/requests/imagesliderequest.php',
	                    data: {
	                    	'imagerequest' : '1',
	                    	'opcode' : '2',
	                    	'slide_id' : $(this).data("row-id")
	                    },
	                    dataType: "text",
	                    success:function(data) {
	                       
	                    	if(data == "success"){
	                    		$("#grid-command-buttons-image").bootgrid("reload");
	                    	} else {
	                    		//Do Nothing
	                    	}
	                    	
	                    	showMessage(data, "Image Deleted.");
	                    	
	                    }
	                 });
	            	
	            } else {
	            	//Do nothing lol
	            }
	        	     });
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

$(document).on('change','input[data-orig]',function(){
    $(this).toggleClass("txt_change");

	var now = $(this).val();
	var orig = $(this).data("orig");

	if(now == orig){
		$(this).css({"background-color": ""});
	} else {
		$(this).css({"background-color": "#ccffcc"});
	}
	
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
    
});


$("#formContent").submit(function(e){
 
var formdata = new FormData(this);

$.ajax({
	url: "/SCRIPTS/requests/imageupload.php", 
	type: "POST",            
	data: new FormData(this), 
	contentType: false,       
	cache: false,             
	processData:false,        
	success:function(data) {
        
    	if(data == "success"){
    		$("#grid-command-buttons-image").bootgrid("reload");
    	} else {
    		//Do Nothing
    	}
    	
    	showMessage(data, "Slide Added.");
    	
    }
	
	});

return false;
  });



	
    
});








</script>

<form action="this.preventDefault();" id="formContent" method="post" enctype="multipart/form-data" >

<fieldset>

<!-- Form Name -->

<legend>Image Slides</legend>




         <input type="file" name="file" id="file" required />
<input type="submit" value="Upload" class="submit" />



</fieldset>

</form>


<table id="grid-command-buttons-image" class="table table-condensed table-hover table-striped">
        <thead>
            <tr>
                <th data-column-id="slide_name" data-formatter="slide_name" data-type="text" >Slide Name</th>
                <th data-column-id="slide_text" data-formatter="slide_text" data-type="text" >Slide Text</th>
				<th data-column-id="slide_isactive" data-formatter="slide_isactive" data-type="numeric"  >Active?</th>
				<th data-column-id="slide_pos" data-formatter="slide_pos" data-type="numeric"  >Position</th>
				<th data-column-id="slide_imagename" data-type="text"  >Filename</th>
				<th data-column-id="slide_id" data-type="numeric" data-visible="false" data-identifier="true">Slide ID</th>
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
