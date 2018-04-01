<?php 
session_start();

require_once "../../SCRIPTS/db_connect.inc";

$conn = DBConnect();

 if(($_SESSION["permissions"][0] == 1 || $_SESSION["permissions"][1] == 1 || $_SESSION["permissions"][11] == 1) == false){

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

    var grid = $("#grid-command-buttons-news").bootgrid({
        ajax: true,
        post: function ()
        {
            return {
                id: "b0df282a-0d67-40e5-8558-c9e93b7befed"
            };
        },
        url: "/SCRIPTS/json_source/news/getstoriesforupdate.php",
        formatters: {
            "commands": function(column, row)
            {
                return "<button id=\"" + row.news_id + "t0" + "\" type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-row-id=\"" + row.news_id + "\"><i id=\"btn" + row.news_id +"\" class=\"fa fa-pencil\"></i></button> " +
                "<button id=\"" + row.news_id  + "t4" + "\" type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-story-name=\"" + row.news_title + "\" data-row-id=\"" + row.news_id  + "\"><i id=\"btn" + row.news_id  + "del\" class=\"fa fa-trash-o\"></i></button>";
            },
        
        	"news_title": function(column, row)
        	{
        		return "<input id=\"" + row.news_id + "t1" + "\" type=\"text\" class=\"form-control\" name=\"news_title\" maxlength=\"40\" data-row-id=\"" + row.news_id + "\" data-orig=\"" + row.news_title + "\" value=\"" + row.news_title +  "\">";
        	},
            
            "news_text": function(column, row)
        	{
            	return "<textarea id=\"" + row.news_id + "t2" + "\" class=\"form-control\" name=\"news_text\" maxlength=\"500\" data-row-id=\"" + row.news_id + "\" data-orig=\"" + row.news_text + "\">" + row.news_text + "</textarea>";
        	},
            
            "news_date": function(column, row)
        	{
        		return "<input type=\"text\" id=\"" + row.news_id + "t3" + "\" class=\"form-control\" name=\"news_date\" data-orig=\"" + row.news_date + "\" value=\"" + row.news_date + "\"  data-row-id=\"" + row.news_id + "\">";	
        	}
        }
    }).on("loaded.rs.jquery.bootgrid", function()
    {
        /* Executes after data is loaded and rendered */
        grid.find(".command-edit").on("click", function(e)
        {

        	var id = $(this).data("row-id");
            var news_title = $("#" + id + "t1").val();
            var news_text = $("#" + id + "t2").val();
            var news_date = $("#" + id + "t3").val();
			var button_id = "#btn" + id;

            
            $(button_id).removeClass("fa-pencil");
            $(button_id).addClass("fa-cog fa-spin");
        	
            	$.ajax( {
            		type: 'POST',
                    url: '/SCRIPTS/requests/newsrequest.php',
                    data: {
                    	'accessnewsrequest' : '1',
                    	'opcode' : '3',
                    	'news_id' : id,
                    	'news_title' : news_title,
                    	'news_text' : news_text,
                    	'news_date' : news_date
                    },
                    dataType: "text",
                    success:function(data) {

						if(data === "success"){
							 $("#" + id + "t2").css({"background-color": ""});
					         $("#" + id + "t1").css({"background-color": ""});
					         $("#" + id + "t3").css({"background-color": ""});

					         $("#" + id + "t2").data({"orig": news_text});
					         $("#" + id + "t1").data({"orig": news_title});
					         $("#" + id + "t3").data({"orig": news_date });
					    
						}	
                    	
                    	showMessage(data, "Story updated.");
                    	
                    }
                 })
            	
            	$(button_id).removeClass("fa-cog fa-spin");
            	$(button_id).addClass("fa-pencil");
            	
        }).end().find(".command-delete").on("click", function(e){
		    
        	
        	if(confirm("Are you sure you want to delete the Store: \"" + $(this).data("news_title") + "\" from the database?")){
            	
            	$.ajax( {
            		type: 'POST',
                    url: '/SCRIPTS/requests/newsrequest.php',
                    data: {
                    	'accessnewsrequest' : '1',
                    	'opcode' : '2',
                    	'news_id' : $(this).data("row-id")
                    },
                    dataType: "text",
                    success:function(data) {
                       
                    	if(data == "success"){
                    		$("#grid-command-buttons-news").bootgrid("reload");
                    	} else {
                    		//Do Nothing
                    	}
                    	
                    	showMessage(data, "News Story Deleted.");
                    	
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
	
});

</script>



   

    <form>
    <fieldset>
    <legend>
    Modify Stories
    </legend>
    </fieldset>
    </form>

    <table id="grid-command-buttons-news" class="table table-condensed table-hover table-striped">
        <thead>
            <tr>
                <th data-column-id="news_id" data-type="news_id" data-identifier="true" >News ID</th>
                <th data-column-id="news_title" data-formatter="news_title">News Title</th>
                <th data-column-id="news_text" data-formatter="news_text" >Story</th>
                <th data-column-id="news_date"  data-formatter="news_date" >Date</th>
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
