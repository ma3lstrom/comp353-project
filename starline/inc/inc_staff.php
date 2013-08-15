<?php

    function getStaffForm() {

        $form = '<div>';
        $form .= '<form action="index.php#Staff" method ="POST">'; 
        $form .= 'Select Specific Group of Staff to View <select name="staffType">';
        $form .= '<option value="0">All</option>';
        $form .= '<option value="1">Director</option>';
        $form .= '<option value="2">Senior Administrator</option>';
        $form .= '<option value="3">Administrator</option>';
        $form .= '<option value="4">Doctor</option>';
        $form .= '<option value="5">Intern</option>';
        $form .= '<option value="6">Resident 1st Year</option>';
        $form .= '<option value="7">Resident 2nd Year</option>';
        $form .= '<option value="8">Resident 3rd Year</option>';
        $form .= '<option value="9">Supervisor Nurse</option>';
        $form .= '<option value="10">Nurse</option>';
        $form .= '<option value="11">Technicia X-Ray</option>';
        $form .= '<option value="12">Technicia Computer</option>';
        $form .= '<option value="13">Technicia Blood-Work</option>';
        $form .= '<option value="14">Technicia Sterrilization</option>';
        $form .= '<option value="15">Technicia Pediatric</option>';
        $form .= '</select>';  
        $form .= '<input name="submit_change" type="submit" value="Go">'; 
        $form .= '</form></div>';

        echo $form;

    }
   

    
    function getStaffTable($id) {
        $query = "SELECT e.EmployeeID, e.FirstName, e.LastName, e.address, e.PhoneNumber, e.PostalCode, e.StartDate, j.Name 
                FROM employee as e, jobpayroll as j 
                WHERE e.JobID = j.JobID ";
        if ($id != 0) {
            $query .= "AND e.JobID = $id";
        }
        $result = mysql_query($query);
        $table = '<div><table border="1" width ="700px">';
        $table .= '    <tr> <th class="tableHeaders" width ="100px">First Name</th>';
        $table .= '         <th class="tableHeaders" width ="100px">Last Name </th>';
        $table .= '         <th class="tableHeaders" width ="100px">Job Title </th>'; 
        $table .= '         <th class="tableHeaders" width ="125px">Address </th>';
        $table .= '         <th class="tableHeaders" width ="90px">Phone Number </th>';
        $table .= '         <th class="tableHeaders" width ="85px">Postal Code </th>';
        $table .= '         <th class="tableHeaders" width ="100px">Start Date </th>';             
        $table .= '    </tr>';
        
        while ($row = mysql_fetch_assoc($result)) {
            $fname =  $row["FirstName"];
            $lname = $row["LastName"];
            $addr =  $row["address"];
            $ph =  $row["PhoneNumber"];
            $pc =  $row["PostalCode"];
            $sd = $row["StartDate"];
            $jname =  $row["Name"];
       
        $table .= '    <tr> <td> '. $fname . ' </td>';
        $table .= '         <td> '. $lname . ' </td>';
        $table .= '         <td> '. $jname . ' </td>';  
        $table .= '         <td> '. $addr . ' </td>';       
        $table .= '         <td> '. $ph . ' </td>';
        $table .= '         <td> '. $pc . ' </td>';  
        $table .= '         <td> '. $sd . ' </td>';
        $table .= '    </tr>';

        
        }
        $table .= '   </table> </div>';  
        
        return $table;        
    }
    
    
?>