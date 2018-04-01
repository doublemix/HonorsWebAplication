<body><?php 
 
 require_once '../../SCRIPTS/db_connect.inc';
 
 	session_start();
 
 	$conn = DBConnect();
 	
 	if(!isset($_GET["query"])){
 		
 		$query = $_GET["query"];
 		
 		$result = mysqli_query($conn, $query);
 		
 		if($result === false){
 			echo "<p>There was an error creating the report:</p><p>" . mysqli_errno($conn) . "</p>";
 			echo "</body>";
 			die();
 		}
 		echo "<script>\n";
 		echo "var grid = $(\"#grid-report\").bootgrid();\n";
 		echo "</script>\n";
 		
 		
 		echo "<table id=\"grid-report\" class=\"table table-condensed table-hover table-striped\">";
 		echo "<thead>";
 		echo "<tr>";
 		
 		$info = mysqli_fetch_fields($result);
 		
 		foreach ($info as $val) {
 			echo "<th data-column-id=\"" . $val->name . "\">" . $val->name . "</th>";
 			
 		}
 		
 		echo "</tr>";
 		echo "</thead>";
 		echo "<tbody>";
 		
 		while($row = mysqli_fetch_row($result)){
 			
 			echo "<tr>";
 			
 			foreach ($row as &$value){
 				echo "<td>" . $value . "</td>";
 			}
 			
 			unset($value);
 			
 			echo "</tr>";
 			
 		}
 		
 		echo "</tbody>";
 		echo "</table>";
 		echo "</body>";
 	}
 
 ?>