<?php
session_start();
$ar=array('a'=>0);
$_SESSION=$ar;
session_destroy();
header("location:login.php");
?>