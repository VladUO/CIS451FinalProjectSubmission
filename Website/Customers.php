<?php

include('connectionData.txt');

$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');

?>

<html>
<head>
  <title>Getting a full list of customers.</title>
  </head>
  
  <body bgcolor="white">
  
  
  <hr>
  
  
<?php
$query = "SELECT c.cid, c.fname, c.lname, c.phone, c.address, c.email
          FROM Customer c;"; 
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
print "<h3>Getting a full list of customers.</h3>";
print "<h3>Customer ID, first name, last name, phone number, address and email.</h3>";
while($row = mysqli_fetch_array($result, MYSQLI_BOTH))
  {
    print "\n";
    print "$row[cid] $row[fname]  $row[lname] $row[phone] $row[address] $row[email]";
  }
print "</pre>";

mysqli_free_result($result);

mysqli_close($conn);

?>

 
</body>
</html>