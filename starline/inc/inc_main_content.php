<?php
session_start();
require 'inc/DB.php';
if (!isset($_SESSION['user']) || empty($_SESSION['user'])){
    header('Location: login.php');
}
$userID =  $_SESSION['user'];
$query = "SELECT e.FirstName, e.LastName, e.UnitID, e.JobID, u.EmployeeID  FROM employee AS e, user AS u WHERE e.EmployeeID = u.EmployeeID AND u.UserID = $userID";
$result = mysql_query($query);
$resultData = mysql_fetch_assoc($result);
$_SESSION['EmployeeID'] = $resultData["EmployeeID"];
$jobID = $resultData["JobID"];
$_SESSION['JobID'] = $jobID;
$userName = $resultData["FirstName"] . ' ' . $resultData["LastName"];

echo "<h3>Welcome!</h3>";
echo '<div>'.$userName.'<br/><a href="logout.php">Logout</a><br></div><br>';

if($jobID == 1 || $jobID == 2 || $jobID == 3) {
    include 'admin.php';
}
else if($jobID==4){
	include 'doctor.php';
}



?>
