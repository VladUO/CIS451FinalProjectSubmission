<?php

include('connectionData.txt');

$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');

?>

<html>
<head>
  <title>Getting a full list of completed or pending contracts.</title>
  </head>
  
  <body bgcolor="white">
  
  
  <hr>
  
  
<?php
$Contract = $_POST['Contract'];
error_log($Contract);
$query = "SELECT c.cnumber, ca.year, ca.manufacturer, ca.model, c.completed_on 
          FROM Contract c JOIN Car ca USING (Vin)
          WHERE c.completed_on $Contract"; 
error_log($querry);         
?>

<p>
The query:
<p>
<?php
print $query;
?>

<hr>
<p>
Result of query:
<p>

<?php
$result = mysqli_query($conn, $query)
or die(mysqli_error($conn));

print "<pre>";
print "<h3>Getting a full list of completed or pending contracts.</h3>";
print "<h3>Contract number, model year, manufacturer, vehicle model, date contract completed on if completed.</h3>";
while($row = mysqli_fetch_array($result, MYSQLI_BOTH))
  {
    print "\n";
    print "$row[cnumber]  $row[year] $row[manufacturer] $row[model] $row[completed_on] ";
  }
print "</pre>";

mysqli_free_result($result);

mysqli_close($conn);

?>

 
</body>
</html>