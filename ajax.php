<?php
session_start();
include("plano.php");
include('funciones.php');
escribir("se envia datos para modificar campo");
$data=array('el'=>array(),'hora'=>date("H:i:s"));
$msj="";
if(isset($_SESSION['nombre'])){
	if(isset($_POST['tipo'])){
		$tipo=$_POST['tipo'];
		$idpte=$_POST['idpte'];
		
		switch (intval($tipo)){
			case 0 :
				 $sql="SELECT * FROM competencia WHERE estado='1'";
				 $rta=ejecutarsql($sql);
				 if($rta){
					 $numrows=mysqli_num_rows($rta);
					 if($numrows>0){
						$rowcompetencia=mysqli_fetch_array($rta);
							$sql="select * FROM tiempo WHERE id_competencia=".$rowcompetencia['id'];
							$rta=ejecutarsql($sql);
							 if($rta){
								 $numrows=mysqli_num_rows($rta);
								 if($numrows>0){
									while($rowtiempo=mysqli_fetch_array($rta)){
										$data['el'][]=array('id'=>$rowtiempo['id'],'numero'=>$rowtiempo['numero'],'nombre'=>$rowtiempo['nombre'],'hsalida'=>$rowtiempo['hsalida'],'hllegada'=>$rowtiempo['hllegada'],'diferencia'=>$rowtiempo['diferencia'],'observacion'=>$rowtiempo['observacion']);
										}							
								 }else{$msj ="error no se encuentraron tiempos";}
							 }else{$msj="error de respuesta tiempo";}
					 }else{$msj= "error no se encuentraron competencias";}
				 }else{$msj= "error de respuesta competencia";}
				 
				 echo json_encode($data);
				break;
			case 1 :
				$sql="SELECT * FROM competencia WHERE estado='1'";
				 $rta=ejecutarsql($sql);
				 if($rta){
					 $numrows=mysqli_num_rows($rta);
					 if($numrows>0){
						$rowcompetencia=mysqli_fetch_array($rta);
							$sql="select * FROM tiempo WHERE id > $idpte AND id_competencia=".$rowcompetencia['id'];
							$data['sql']=$sql;
							$rta=ejecutarsql($sql);
							 if($rta){
								 $numrows=mysqli_num_rows($rta);
								 if($numrows>0){
									while($rowtiempo=mysqli_fetch_array($rta)){
										$data['el'][]=array('id'=>$rowtiempo['id'],'numero'=>$rowtiempo['numero'],'nombre'=>$rowtiempo['nombre'],'hsalida'=>$rowtiempo['hsalida'],'hllegada'=>$rowtiempo['hllegada'],'diferencia'=>$rowtiempo['diferencia'],'observacion'=>$rowtiempo['observacion']);
										}							
								 }else{$msj ="error no se encuentraron tiempos";}
							 }else{$msj="error de respuesta tiempo";}
					 }else{$msj= "error no se encuentraron competencias";}
				 }else{$msj= "error de respuesta competencia";}
				 
				 echo json_encode($data);
			break;
			
			}
	}
	
}

?>