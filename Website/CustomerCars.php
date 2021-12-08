<?php

include('connectionData.txt');

$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');

?>

<html>
<head>
  <title>Getting a list of cars belonging to a particular customer.</title>
  </head>
  
  <body bgcolor="white">
  
  
  <hr>
  
  
<?php
  
$customer_ID = $_POST['customer_ID'];
error_log($customer_ID);

$customer_ID = mysqli_real_escape_string($conn, $customer_ID);
// this is a small attempt to avoid SQL injection
// better to use prepared statements

$query = "SELECT c.cid, c.fname, c.lname, c.phone, ca.year, ca.manufacturer, ca.model, ca.Vin  
          FROM Car ca JOIN Customer c ON (ca.Customer_cid = c.cid)
          WHERE c.cid = {$customer_ID}";
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
print "<h3>Getting a list of cars belonging to a particular customer.</h3>";
print "<h3>Customer ID, first name, last name and phone number, vehicle year, manufacturer, model, vin.</h3>";
while($row = mysqli_fetch_array($result, MYSQLI_BOTH))
  {
    print "\n";
    print "$row[cid] $row[fname]  $row[lname] $row[phone] $row[year] $row[manufacturer] $row[model] $row[Vin]";
  }
print "</pre>";

mysqli_free_result($result);

mysqli_close($conn);

?>

 
</body>
</html>