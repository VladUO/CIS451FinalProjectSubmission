<?php

include('connectionData.txt');

$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');

?>

<html>
<head>
  <title>Getting a list of customers a staff member works with.</title>
  </head>
  
  <body bgcolor="white">
  
  
  <hr>
  
  
<?php
$WorksWith = $_POST['WorksWith'];
error_log($WorksWith);
$query = "SELECT e.eid, e.fname AS efname, e.lname AS elname, c.cid, c.fname AS cfname, c.lname AS clname
          FROM  Works_with w JOIN Customer c USING (cid)
				             JOIN (Staff s JOIN Employee e USING (eid)) USING (eid)
          WHERE eid = {$WorksWith}";                       
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
print "<h3>Getting a list of customers a staff member works with.</h3>";
print "<h3>Employee ID, employee first name, last name, customer ID, customer first name, last name.</h3>";
while($row = mysqli_fetch_array($result, MYSQLI_BOTH))
  {
    print "\n";
    print "$row[eid]  $row[efname] $row[elname] $row[cid] $row[cfname] $row[clname]";
  }
print "</pre>";

mysqli_free_result($result);

mysqli_close($conn);

?>

 
</body>
</html>