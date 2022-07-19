<?php
session_start();
include("plano.php");
include('funciones.php');
escribir("se envia datos para modificar campo");
$data=array('el'=>array(),'hora'=>date("Y-m-d H:i:s"));
$msj="";
if(isset($_SESSION['nombre'])){

$id=generarid("tiempo");
$data['idsiguiente']=$id;
}else{$msj="no hay session activa";}
$data['msj']=$msj;
echo json_encode($data);
?>