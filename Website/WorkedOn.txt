<?php

include('connectionData.txt');

$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');

?>

<html>
<head>
  <title>Getting a list of mechanics that worked on a particular contract.</title>
  </head>
  
  <body bgcolor="white">
  
  
  <hr>
  
  
<?php
$contract_ID = $_POST['contract_ID'];
error_log($contract_ID);
$query = "SELECT c.cnumber, e.fname, e.lname, e.eid
          FROM Worked_on w JOIN Employee e USING (eid)
		                   JOIN Contract c USING (cnumber)	
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
print "<h3>Getting a list of mechanics that worked on a particular contract.</h3>";
print "<h3>Contract number, employee first name, last name, employee ID.</h3>";
while($row = mysqli_fetch_array($result, MYSQLI_BOTH))
  {
    print "\n";
    print "$row[cnumber]  $row[fname] $row[lname] $row[eid]";
  }
print "</pre>";

mysqli_free_result($result);

mysqli_close($conn);

?>

 
</body>
</html>