<?php

  function getInternForm() {

        $form = '<div>';
        $form .= '<form action="index.php#Interns" method ="POST">'; 
        $form .= 'Select Specific Group of Interns to View <select name="internType">';
        $form .= '<option value="0">All</option>';
        $form .= '<option value="5">Intern</option>';
        $form .= '<option value="6">Resident 1st Year</option>';
        $form .= '<option value="7">Resident 2nd Year</option>';
        $form .= '<option value="8">Resident 3rd Year</option>';
        $form .= '</select>';  
        $form .= '<input name="submit_change" type="submit" value="Go">'; 
        $form .= '</form></div>';

        echo $form;

    }


function getInternTable($id) {
        $query = "SELECT e.EmployeeID, e.FirstName, e.LastName, u.Name AS unitName, j.Name
                FROM employee as e, jobpayroll as j, unit as u ";
                if($id==0){
					$query.=" WHERE e.JobID > 4 AND e.jobid<9
							  AND j.jobID=e.jobID
							  AND e.unitID=u.unitID
							  ORDER BY e.jobid";
                }
				else{
					$query.=" WHERE e.JobID=$id 
							  AND j.jobID=$id
							  AND e.unitID=u.unitID
							  ORDER BY e.UnitID";
				}

        $result = mysql_query($query);
        $table = '<div><table border="1" width ="700px">';
        $table .= '    <tr> <th class="tableHeaders" width ="100px">Employee ID</th>';
        $table .= '         <th class="tableHeaders" width ="100px">First Name</th>';
        $table .= '         <th class="tableHeaders" width ="100px">Last Name</th>';
        $table .= '         <th class="tableHeaders" width ="100px">Unit ID </th>'; 
        $table .= '         <th class="tableHeaders" width ="200px">Position </th>';       
        $table .= '    </tr>';
        
        while ($row = mysql_fetch_assoc($result)) {
            $eID=$row["EmployeeID"];
            $fname =  $row["FirstName"];
            $lname = $row["LastName"];
            $unitID =  $row["unitName"];
            $jobID =  $row["Name"];
       
        $table .= '    <tr> <td> '. $eID . ' </td>';
        $table .= '         <td> '. $fname . ' </td>';
        $table .= '         <td> '. $lname . ' </td>';  
        $table .= '         <td> '. $unitID. ' </td>';       
        $table .= '         <td> '. $jobID . ' </td>';
        //$table .= '         <td> '. $notes . ' </td>';  
        $table .= '    </tr>';

        
        }
        $table .= '   </table> </div>';  
        
        return $table;        
    }

?>
