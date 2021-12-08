<?php

include('connectionData.txt');

$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');

?>

<html>
<head>
  <title>Getting a full list of employees from all the shops.</title>
  </head>
  
  <body bgcolor="white">
  
  
  <hr>
  
  
<?php
$query = "SELECT e.eid, e.fname, e.lname, s.Name, e.Shop_Address
          FROM Employee e JOIN Shop s ON (e.Shop_Address = s.Address)"; 
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
print "<h3>Getting a full list of employees from all the shops.</h3>";
print "<h3>Employee id, first name, last name, name and address of the shop they work in.</h3>";
while($row = mysqli_fetch_array($result, MYSQLI_BOTH))
  {
    print "\n";
    print "$row[eid] $row[fname]  $row[lname] $row[Name] $row[Shop_Address]";
  }
print "</pre>";

mysqli_free_result($result);

mysqli_close($conn);

?>

 
</body>
</html>