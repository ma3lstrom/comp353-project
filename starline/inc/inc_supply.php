<?php

    function getOrderSupplyForm() {

        $form = '<div>';
        $form .= '<form action="index.php#Supplies" method ="POST">'; 
        $form .= 'Select The Supply Type to Order <select name="supplyType">';
        $form .= '<option value="null">---------</option>';
        $form .= '<option value="medical">Medical</option>';
        $form .= '<option value="nonmedical">Non-Medical</option>';
        $form .= '<option value="nutrition">Nutrition</option>';
        $form .= '</select>';  
        $form .= '<input name="submit_change" type="submit" value="Go">'; 
        $form .= '</form></div>';

        echo $form;

    }
   
    function getSpecificSupplyForm($type) {
        $form = '<div>';
        $form .= '<form action="index.php#Supplies" method ="POST">'; 
        $form .= 'Select The Supply Type to Order <select name="supplySpecificType">';
        $form .= '<option value="null">---------</option>';
        
        if($type == 'medical') {
            $form .= '<option value="medication">Medication</option>';
            $form .= '<option value="surgical">Surgical Equipment</option>';
            $form .= '<option value="support">Supporting Devices</option>';
        } else  if ($type == 'nonmedical') {
            $form .= '<option value="patient">Basic Patient</option>';
            $form .= '<option value="administrative">Administrative</option>';
        } 
        $form .= '</select>';  
        $form .= '<input name="submit_change" type="submit" value="Go">'; 
        $form .= '</form></div>';

        echo $form;
    }
    
    function getAddForm($type) {
        switch ($type) {
            case 'medication': { getMedicationForm(); break; }
            case 'surgical': { getSurgicalForm(); break; }             
            case 'support': { getSupportForm(); break; }              
            case 'patient': { getPatientForm(); break; }            
            case 'administrative': { getAdministrativeForm(); break; }    
        }
    }
    
    function getMedicationForm() {
        $query = "SELECT me.MedicalSupplyID AS 'sID', me.SupplyTypeID, m.Description, m.LastOrdered, m.Cost, sr.SupplyRoomNumber, u.UnitID 
            FROM Medication AS m, MedicalSupplies as me, medication_has_supplyroom as mhs, vendor_has_medication as vhm, supplyroom as sr, unit as u
            WHERE m.MedicalSupplyID = me.MedicalSupplyID;";
        $result = mysql_query($query);
        echo "<div> Medication Supplies </div><br>";
        echo getTable($result, "MedicalSupplies");
    }
    
    function getSurgicalForm() {
        $query = "SELECT me.MedicalSupplyID AS 'sID', me.SupplyTypeID, se.Description, se.LastOrdered, se.Cost, u.Name 
            FROM SurgicalEquipment AS se, MedicalSupplies as me, unit as u 
            WHERE se.MedicalSupplyID = me.MedicalSupplyID AND se.UnitID = u.UnitID";
        $result = mysql_query($query);
        echo "<div> Surgical Supplies </div><br>";
        echo getTable($result, "SurgicalEquipment");
    }
    
    function getSupportForm() {
        $query = "SELECT me.MedicalSupplyID AS 'sID', me.SupplyTypeID, sd.Description, sd.LastOrdered, sd.Cost 
            FROM SupportingDevices AS sd, MedicalSupplies as me 
            WHERE sd.MedicalSupplies_MedicalSupplyID = me.MedicalSupplyID;";
        $result = mysql_query($query);        
        echo "<div> Support Supplies </div><br>";
        echo getTable($result, "SupportingDevices");
    }
    
    function getPatientForm() {
        $query = "SELECT me.NonMedicalSupplyID AS 'sID', me.Supplies_SupplyTypeID, p.Description, p.LastOrdered, p.Cost
            FROM basicpatientsupply AS p, nonmedicalsupplies as me 
            WHERE p.NonMedicalSupplies_NonMedicalSupplyID = me.NonMedicalSupplyID;";
        $result = mysql_query($query);
        echo "<div> Patient Supplies </div><br>";
        echo getTable($result, "basicpatientsupply");
    }
    
    function getAdministrativeForm() {
        $query = "SELECT me.NonMedicalSupplyID AS 'sID', me.Supplies_SupplyTypeID, a.Description, a.LastOrdered, a.Cost
            FROM administrativesupply AS a, nonmedicalsupplies as me 
            WHERE a.NonMedicalSupplies_NonMedicalSupplyID = me.NonMedicalSupplyID";
        $result = mysql_query($query);
        echo "<div> Administrative Supplies </div><br>";
        echo getTable($result, "administrativesupply");
    }
    
    function getNutritionForm() {
        $query = "SELECT n.NutritionalSupplyID AS 'sID', n.Supplies_SupplyTypeID, n.Type AS 'Description', n.LastOrdered 
                FROM nutritionalsupply AS n";
        $result = mysql_query($query);
        echo "<div> Nutrition Supplies </div><br>";
        echo getTable($result, "nutritionalsupply");
    }
    
    function orderSupply() {
         echo 'SUPPLY ORDER GETS PROCESSED HERE';
        // DO STUFF HERE
    }
    
    function getTable($result, $tableName) {
        $table = '<div><table border="1" width ="600px">';
        $table .= '    <tr> <th class="tableHeaders" width ="150px">Description </th>';
//        $table .= '         <th class="tableHeaders" width ="150px">Unit </th>';
//        $table .= '         <th class="tableHeaders" width ="150px">Supply Room </th>';
        $table .= '         <th class="tableHeaders" width ="150px">Last Ordered </th>';
        $table .= '         <th class="tableHeaders" width ="150px">Cost </th>';
        $table .= '         <th class="tableHeaders" width ="150px">Order Now </th>';                      
        $table .= '    </tr>';
        
        while ($row = mysql_fetch_assoc($result)) {
            $desc =  $row["Description"];
            $lo =  $row["LastOrdered"];
            $cost =  $row["Cost"];
       
        $table .= '    <tr> <td> '. $desc . ' </td>';
        $table .= '         <td> '. $lo . ' </td>';
        $table .= '         <td> '. $cost . ' </td>';
        if ($_SESSION['JobID'] == 2 || $_SESSION['JobID'] == 3) {
            $table .= '         <td> <a href="index.php?tname='.$tableName.'&id='.$row["sID"].'"> Submit Order </a> </td>';  
        } else {
            $table .= '         <td> Not Allowed </td>';
        }
        $table .= '    </tr>';

        
        }
        $table .= '   </table> </div>';  
        
        return $table;        
    }
    
    
?>