<?php
session_start();
include("plano.php");
include('funciones.php');

escribir("se envia datos para modificar hacer test");
$t = explode(" ",microtime());
$time= date("H:i:s",$t[1]).substr((string)$t[0],1,4);
$data=array('el'=>array(),'hora'=>$time);
$msj="";
if(isset($_SESSION['nombre'])){
	if(isset($_POST['n'])){
		$sql="select * from competencia WHERE estado=1";
		$rta=ejecutarsql($sql);
		if($rta){
			$numrows=mysqli_num_rows($rta);
			if($numrows>0){
				$rowt=mysqli_fetch_array($rta);
					  $data['test']=$rowt['nombre']." test completo";
			}else{$msj="sin registros con id";}
		}else{$msj="sin respuesta de registro";}
		
		
	}else{$msj="no hay datos para registrar";}
	
}else{$msj="no hay session activa";}
$data['msj']=$msj;
echo json_encode($data);
?>