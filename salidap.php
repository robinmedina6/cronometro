<?php
session_start();
include("plano.php");
include('funciones.php');
escribir("se envia datos para modificar campo");
$t = explode(" ",microtime());
$time= date("H:i:s",$t[1]).substr((string)$t[0],1,4);
$data=array('el'=>array(),'hora'=>$time);
$msj="";
if(isset($_SESSION['nombre'])){
	if(isset($_POST['nrop'])){
		$nrop=$_POST['nrop'];
		$nombre=$_POST['nombre'];
		$observacion=$_POST['observacion'];
		//hora de salida de javascript ccompletarla con 0 a la izquerda
		$vhor=str_pad($_POST['vhor'],2,"0",STR_PAD_LEFT);
		$vmin=str_pad($_POST['vmin'],2,"0",STR_PAD_LEFT);
		$vseg=str_pad($_POST['vseg'],2,"0",STR_PAD_LEFT);
		$vmil=str_pad($_POST['vmil'],3,"0",STR_PAD_LEFT);
		
		
		$sql="SELECT * FROM competencia WHERE estado='1'";
				 $rta=ejecutarsql($sql);
				 if($rta){
					 $numrows=mysqli_num_rows($rta);
					 if($numrows>0){
						$rowcompetencia=mysqli_fetch_array($rta);
						$id=generarid("tiempo");
						$sql="SELECT * FROM tiempo WHERE numero=$nrop AND id_competencia=".$rowcompetencia['id'];
						$rtarep=ejecutarsql($sql);
						if($rtarep){
							$numrowrep=mysqli_num_rows($rtarep);
							if($numrowrep==0){
								$t = explode(" ",microtime());
								$time= date("H:i:s",$t[1]).substr((string)$t[0],1,4);
								$time=$vhor.":".$vmin.":".$vseg.".".$vmil;
								$sql="INSERT INTO `tiempo`(`id`, `numero`, `nombre`, `hsalida`, `hllegada`, `diferencia`, `observacion`, `id_competencia`) VALUES ('$id','$nrop','$nombre','".$time."','','','$observacion','".$rowcompetencia['id']."')";
								$rtain=ejecutarsql($sql);
								if($rtain){
									$sql="SELECT * FROM tiempo WHERE id=$id";
									$rtadi=ejecutarsql($sql);
									if($rtadi){
										$numrowsdi=mysqli_num_rows($rtadi);
										if($numrowsdi>0){
											$rowrtadi=mysqli_fetch_array($rtadi);
											$data['el'][]=array('id'=>$rowrtadi['id'],'numero'=>$rowrtadi['numero'],'nombre'=>$rowrtadi['nombre'],'hsalida'=>$rowrtadi['hsalida'],'hllegada'=>$rowrtadi['hllegada'],'diferencia'=>$rowrtadi['diferencia'],'observacion'=>$rowrtadi['observacion']);
										}else{$msj="no hay registros despues de insersion";}
									}else{$msj="no se encontro el registro despues de insercion";}
								}else{$msj="el registro no ha sido insertado";}
							}else{$msj="el numero ya existe";}
						}else{$msj="sin rta repetido";}	
					 }else{$msj="sin datos competencia";}
				 }else{$msj="error datos competencia";}
	}else{$msj="no hay datos para registrar";}
	
}else{$msj="no hay session activa";}
$data['msj']=$msj;
echo json_encode($data);
?>