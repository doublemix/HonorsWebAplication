<!DOCTYPE>
<html>
<head>

<?php 
session_start();

require ('template.inc');
require_once "SCRIPTS/get_permissions.inc";
require_once 'SCRIPTS/db_connect.inc';

$conn = DBConnect();
getPermissions($conn);
DBClose($conn);



echo "<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css\" integrity=\"sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7\" crossorigin=\"anonymous\">";

//Optional theme
//echo "<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css\" integrity=\"sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r\" crossorigin=\"anonymous\">";
AddCSS("jquery.bootgrid.min.css");



//Body_AddScript( "jquery-1.12.3.min.js" );
echo "<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js\"></script>";


Body_AddScript("bootstrap.min.js");
Body_AddScript("jquery.bootgrid.min.js");



//echo "<script src=\"https://use.fontawesome.com/ac70f8b488.js\"></script>";


?>

</head>
<body>
<script>

$(document).ready (function(){


    var grid = $("#grid-command-buttons").bootgrid({
        ajax: true,
        post: function ()
        {
            return {
                id: "b0df282a-0d67-40e5-8558-c9e93b7befed"
            };
        },
        url: "http://www.jquery-bootgrid.com/api/data/basic",
        formatters: {
            "commands": function(column, row)
            {
                return "<button type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-row-id=\"" + row.id + "\"><span class=\"fa fa-pencil\"></span></button> " + 
                    "<button type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-row-id=\"" + row.id + "\"><span class=\"fa fa-trash-o\"></span></button>";
            }
        }
    }).on("loaded.rs.jquery.bootgrid", function()
    {
        /* Executes after data is loaded and rendered */
        grid.find(".command-edit").on("click", function(e)
        {
            alert("You pressed edit on row: " + $(this).data("row-id"));
        }).end().find(".command-delete").on("click", function(e)
        {
            alert("You pressed delete on row: " + $(this).data("row-id"));
        });
    });



 
});

</script>



   

    

   

    <table id="grid-command-buttons" class="table table-condensed table-hover table-striped">
        <thead>
            <tr>
                <th data-column-id="id" data-type="numeric">ID</th>
                <th data-column-id="sender">Sender</th>
                <th data-column-id="received" data-order="desc">Received</th>
                <th data-column-id="commands" data-formatter="commands" data-sortable="false">Commands</th>
            </tr>
        </thead>
    </table>




</body>
</html>
