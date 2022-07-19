<?php
session_start();
include("plano.php");
include("funciones.php");
if($_SESSION['nombre']){
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Documento sin título</title>
</head>

<body>
<?php
print_r($_POST);
if(isset($_POST['btncrear'])){
	
	$nombre=$_POST['nombre'];
	$sql="UPDATE `competencia` SET `estado`='0' WHERE 1";
	$rta=ejecutarsql($sql);
	$sql="INSERT INTO `competencia`(`id`, `nombre`, `largada`, `estado`, `observacion`) VALUES ('','".$nombre."','".date("Y-m-d H:i:s")."','1','')";
	$rta=ejecutarsql($sql);
	if($rta){
		header("location:index.php");
		}
	}
?>
<form method="post">
<table>
<tr><td>nombre</td><td><input name="nombre" type="text" /></td></tr>
<tr><td>crear</td><td><input name="btncrear" value="crear" type="submit" /></td></tr>
</table>
</form>
</body>
</html>
<?php
}
?>