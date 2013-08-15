<?php

function getPatientTable($id) {
        $query = "SELECT * 
                FROM patient as p ";

        $result = mysql_query($query);
        $table = '<div><table border="1" width ="700px">';
        $table .= '    <tr> <th class="tableHeaders" width ="100px">Hospital Card ID</th>';
        $table .= '         <th class="tableHeaders" width ="100px">Medicare Number</th>';
        $table .= '         <th class="tableHeaders" width ="100px">First Name</th>';
        $table .= '         <th class="tableHeaders" width ="100px">Last Name</th>';
        $table .= '         <th class="tableHeaders" width ="100px">Medication List ID </th>'; 
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

