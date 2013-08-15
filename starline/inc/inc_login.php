<?php
//session_start();
require 'inc/DB.php';



if(isset($_SESSION['user'])){
   header('location: index.php');
}

$errorLogin = false;
$loginSet = false;

if (isset($_POST['login']) && isset($_POST['pass'])) {
        $loginSet = true;
        if (!empty($_POST['login']) && !empty($_POST['pass'])) {
        $login = $_POST['login'];
        $pass = $_POST['pass'];
        $query = "SELECT * FROM user WHERE Login = '".mysql_real_escape_string($login)."'";
        $result = mysql_query($query);
        $numrows = mysql_num_rows($result);
        $resultData = mysql_fetch_assoc($result);
            if ($numrows == 0) {
                $errorLogin = true;
                $errorMsg = 'ERROR! Login INVALID!';
            }
            else if ($resultData["Password"] == $pass) {
                $_SESSION['user'] = $resultData["UserID"];
                $_POST['UserID'] = $resultData["UserID"];
            }
            else {
                $errorLogin = true;
                $errorMsg = 'ERROR! Password INCORRECT!';
            }
        
        }     
        else {
           if (empty($_POST['login']) && empty($_POST['pass'])) {
               $errorLogin = true;
               $errorMsg = 'ERROR! Login & Password cannot be empty';
               }
           else if (empty($_POST['pass'])) {
               $errorLogin = true;
               $errorMsg = 'ERROR! Password cannot be empty';
           }
           else if (empty($_POST['login'])) {
               $errorLogin = true;
               $errorMsg = 'ERROR! Password cannot be empty';
           }
        }       
    }
    function getLoginForm() {
        $form = '<div id="serviceform">';
        $form .= '<form action="login.php" method ="POST">';
        $form .= 'Login: <br/> <input type="text" name="login" maxlength="30"> <br/>';
        $form .= 'Password:<br/> <input type="password" name="pass"';
        $form .= '<br/><br/><br/><input type="submit" value="Submit">'; 
        $form .= '</form></div>';

        echo $form;
    }
    
    function returnError($errorMsg) {
    $errmsg = '<div class="errors">';
    $errmsg .= '<br/>'.$errorMsg.'<br/></br>';
    $errmsg .= '</div>';
    
    echo $errmsg;
    }
?>

<div id="jQueryUITabs1">
  <ul>
    <li><a href="#Login"><span>Login</span></a></li>
  </ul>
  <div id="Login"> <br />
 
        <?php 
        if ($loginSet == false) {
           getLoginForm(); 
           
        }
        else {
            if ($errorLogin == true) {
                getLoginForm(); 
                returnError($errorMsg);
            }
            else {
              header('location: index.php');
//              echo '<div id ="changeform">You Have Successfully Logged In!';
//              echo '<br/><a href="index.php">Click Here To Continue</a></div>';                
            }
        }
       ?>
    
  </div>
</div>
<script type="text/javascript">$(function(){$("#jQueryUITabs1").tabs();$("#datepicker").datepicker();});</script>