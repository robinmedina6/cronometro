<?php
session_start();
include("plano.php");
include('funciones.php');
escribir("se envia datos para eliminar campo");
$t = explode(" ",microtime());
$time= date("H:i:s",$t[1]).substr((string)$t[0],1,4);
$data=array('el'=>array(),'hora'=>$time);
$msj="";
if(isset($_SESSION['nombre'])){
	if(isset($_POST['idreg'])){
		$idreg=$_POST['idreg'];
		$sql="select * from tiempo WHERE id=".$idreg;
		$rta=ejecutarsql($sql);
		if($rta){
			$numrows=mysqli_num_rows($rta);
			if($numrows>0){
				$rowt=mysqli_fetch_array($rta);
				if($_SESSION['nombre']=="jvz"){//para que solo pueda eliminar el que envia|
				if($rowt['hllegada']==""){
					
					$sql="UPDATE tiempo SET id_competencia=3 WHERE id=".$idreg." ";
					$rta=ejecutarsql($sql);
					if($rta){
						$data['vb']=true;
					}else{$msj="no se elimino el dato error de update";}
					}else{$msj="ya se registro la hora de llegada";}
				}else{$msj="su usuario no puede eliminar";}
			}else{$msj="sin registros con id";}
		}else{$msj="sin respuesta de registro";}
		
		
	}else{$msj="no hay datos para registrar";}
	
}else{$msj="no hay session activa";}
$data['msj']=$msj;
echo json_encode($data);
?>