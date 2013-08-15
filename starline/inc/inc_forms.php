<?php

    function getAdminTasks($tabName) {
        $form = '<div>';
        $form .= '<form action="index.php#'.$tabName.'" method ="POST">'; 
        $form .= 'Select Task to Perform <select name="task">';
        $form .= '<option value="null">---------</option>';
        if ($tabName == "Services") {
            $form .= '<option value="View">View Service</option>';
            $form .= '<option value="Add">Add Service</option>';
            $form .= '<option value="Delete Service">Delete</option>';
        } else if($tabName == "Supplies") {
            $form .= '<option value="Order">Order Supplies</option>';
        }  else if($tabName == "Surgeries") {
            $form .= '<option value="ScheduleSurgery">Schedule Surgeryies</option>';
        }
        
        $form .= '</select>';  
        $form .= '<input name="submit_change" type="submit" value="Go">'; 
        $form .= '</form></div>';

        echo $form;
    }


?>