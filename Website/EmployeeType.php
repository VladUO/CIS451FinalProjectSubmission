<?php

include('connectionData.txt');

$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');

?>

<html>
<head>
  <title>Getting a full list of either mechanics or staff.</title>
  </head>
  
  <body bgcolor="white">
  
  
  <hr>
  
  
<?php
$EmployeeType = $_POST['EmployeeType'];
$EmployeeShop = $_POST['EmployeeShop'];
$ShowSsn = $_POST['ShowSsn'];
error_log($EmployeeType);
error_log($EmployeeShop);

$query = "SELECT e.eid, e.fname, e.lname, s.Name, e.Shop_Address $ShowSsn
          FROM Employee e JOIN {$EmployeeType} USING (eid)
                          JOIN Shop s ON (e.Shop_Address = s.Address) 
          WHERE s.Name {$EmployeeShop}"; 
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
print "<h3>Getting a full list of either mechanics or staff with an option to list by store.</h3>";
print "<h3>Employee id, first name, last name, shop name, shop address, and the employee ssn if that option was selected.</h3>";
while($row = mysqli_fetch_array($result, MYSQLI_BOTH))
  {
    print "\n";
    print "$row[eid] $row[fname]  $row[lname] $row[Name] $row[Shop_Address] $row[ssn]";
  }
print "</pre>";

mysqli_free_result($result);

mysqli_close($conn);

?>

 
</body>
</html>