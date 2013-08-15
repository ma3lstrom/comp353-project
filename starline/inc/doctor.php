<?php
require 'inc/inc_global.php';
require 'inc/inc_patients.php';
require 'inc/inc_interns.php';

?>
<div id="jQueryUITabs1">
  <ul>
    <li><a href="#Home"><span>Home</span></a></li>
    <li><a href="#Patients"><span>Patients</span></a></li>
   <li><a href="#Interns"><span>Intern and Residents</span></a></li>
    <li><a href="#Surgeries"><span>Surgeries</span></a></li>
    <li><a href="#Schedules"><span>Schedules</span></a></li>
    <li><a href="#Reports"><span>Reports</span></a></li>
  </ul>
    
  <div id="Home"><br>
      <?php
        getCurrentPay();
      ?>
  </div>
  
  <div id="Patients"><br>
      <?php
		echo getPatientTable($_SESSION['EmployeeID']);
      ?>
  </div> 
  
   <div id="Interns"><br>
      <?php
      
      ?>
  </div>  
   
  <div id="Surgeries"><br>
      <?php 

     ?>      
  </div>
    
  <div id="Schedules"><br>
  </div>
  
  <div id="Reports"><br>
  </div>   
    
</div>
<script type="text/javascript">$(function(){$("#jQueryUITabs1").tabs();$(".datepicker").datetimepicker({
	timeFormat: 'HH:mm:ss',
	stepHour: 2,
	stepMinute: 10,
	stepSecond: 10,
        dateFormat:'yy-mm-dd'
})});</script>
