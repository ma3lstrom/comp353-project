<?php

    function getCurrentPay() {
        $empID = $_SESSION['EmployeeID'];
        $jobID = $_SESSION['JobID'];
        $query = "SELECT j.wagerate, j.payroll FROM employee as e, jobpayroll as j WHERE e.EmployeeID = $empID AND e.JobID = j.JobID";
        $result = mysql_query($query); 
        $resultdata = mysql_fetch_assoc($result);
        $wage =  $resultdata['wagerate'];
        $payroll = $resultdata['payroll'];
        
        if ($wage == 'year' && $jobID  < 4) {
            if ($jobID < 4) {
                $query = "SELECT FLOOR(DATEDIFF( CURDATE( ) , startdate ) /365 ) AS year, multiply FROM employee, yearsofserviceadjustement as y WHERE EmployeeID = $empID AND y.JobID = $jobID";
                $result = mysql_query($query); 
                $resultdata = mysql_fetch_assoc($result);
                $numYears = $resultdata['year'];
                $multiply = $resultdata['multiply'];
                while ($numYears > 0) {
                    $payroll = $payroll * $multiply;
                    $numYears--;
                }
                $payroll = round($payroll, 2);
            }
           
           $currentPay = round($payroll/26, 2);
           echo "Your current bi-weekly period pay is $$currentPay <br>";
           echo "Your total current yearly pay is $$payroll";
        }
        if ($jobID == 4 && $wage =='service'){
			echo "Your weekly pay is determined upon services completed \n";
		 
		}

    }

    
?>