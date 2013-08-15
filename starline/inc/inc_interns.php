<?php

function getPatientTable($id) {
        $query = "SELECT e.EmployeeID, e.FirstName, e.LastName,  j.Name, e.UnitID
                FROM employee as e, jobpayroll as j".
                "WHERE e.JobID > 4 AND e,JobID < 9";

        $result = mysql_query($query);
        $table = '<div><table border="1" width ="700px">';
        $table .= '    <tr> <th class="tableHeaders" width ="100px">Employee ID</th>';
        $table .= '         <th class="tableHeaders" width ="100px">First Name</th>';
        $table .= '         <th class="tableHeaders" width ="100px">Last Name</th>';
        $table .= '         <th class="tableHeaders" width ="100px">Position </th>'; 
        $table .= '         <th class="tableHeaders" width ="200px">Doctor notes </th>';       
        $table .= '    </tr>';
        
        while ($row = mysql_fetch_assoc($result)) {
            $hcard=$row["HospitalCardID"];
            $medicare=$row["MedicareNumber"];
            $fname =  $row["FirstName"];
            $lname = $row["LastName"];
            $medlist =  $row["MedicationListID"];
            $notes =  $row["DoctorNotes"];
       
        $table .= '    <tr> <td> '. $hcard . ' </td>';
        $table .= '         <td> '. $medicare . ' </td>';
        $table .= '         <td> '. $fname . ' </td>';  
        $table .= '         <td> '. $lname. ' </td>';       
        $table .= '         <td> '. $medlist . ' </td>';
        $table .= '         <td> '. $notes . ' </td>';  
        $table .= '    </tr>';

        
        }
        $table .= '   </table> </div>';  
        
        return $table;        
    }

?>
