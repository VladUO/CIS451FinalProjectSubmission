<?php

include('connectionData.txt');

$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');

?>

<html>
<head>
  <title>Getting a list of jobs done as a part of a particular contract.</title>
  </head>
  
  <body bgcolor="white">
  
  
  <hr>
  
  
<?php
$contract_ID = $_POST['contract_ID'];
error_log($contract_ID);
$query = "SELECT w.Contract_cnumber, w.description, ca.year, ca.manufacturer, ca.model, ca.Vin, ca.license_plate
          FROM Work_done w JOIN  Contract c ON (w.Contract_cnumber = c.cnumber)
		   		           JOIN Car ca USING (Vin)	
          WHERE c.cnumber = {$contract_ID}";                      
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
print "<h3>Getting a list of jobs done as a part of a particular contract.</h3>";
print "<h3>Contract number, job description, vehicle year, make, model, vin and license plate.</h3>";
while($row = mysqli_fetch_array($result, MYSQLI_BOTH))
  {
    print "\n";
    print "$row[Contract_cnumber]  $row[description] $row[year] $row[manufacturer] $row[model] $row[Vin] $row[license_plate]";
  }
print "</pre>";

mysqli_free_result($result);

mysqli_close($conn);

?>

 
</body>
</html>