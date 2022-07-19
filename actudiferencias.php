<?php
session_start();
include("plano.php");
include('funciones.php');

function RestarHoras($horaini,$horafin)
{
	$horai=substr($horaini,0,2);
	$mini=substr($horaini,3,2);
	$segi=substr($horaini,6,2);
	$mili=substr($horaini,9,3);
 
	$horaf=substr($horafin,0,2);
	$minf=substr($horafin,3,2);
	$segf=substr($horafin,6,2);
	$milf=substr($horafin,9,3);
 
	$ini=($horai*3600000)+($mini*60000)+($segi*1000)+$mili;
	$fin=($horaf*3600000)+($minf*60000)+($segf*1000)+$milf;
 
	$dif=$fin-$ini;
 
	$difh=floor($dif/3600000);
	$difm=floor(($dif-($difh*3600000))/60000);
	$difs=floor(($dif-($difh*3600000)-($difm*60000))/1000);
	$difml=$dif-($difs*1000)-($difm*60000)-($difh*3600000);
	//return date("H:i:s",mktime($difh,$difm,$difs).$difml);
	return str_pad($difh,2, "0", STR_PAD_LEFT).":".str_pad($difm,2, "0", STR_PAD_LEFT).":".str_pad($difs,2, "0", STR_PAD_LEFT).".".str_pad($difml,3, "0", STR_PAD_LEFT); 
}


escribir("se envia datos para modificar campo");
$t = explode(" ",microtime());
$time= date("H:i:s",$t[1]).substr((string)$t[0],1,4);
$data=array('el'=>array(),'hora'=>$time);
$msj="";
if(isset($_SESSION['nombre'])){
		$sqla="SELECT * FROM tiempo";
		$rtaa=ejecutarsql($sqla);
		if($rtaa){
			echo "<table border='1'>";
			echo "<tr><th>id</th><th>numero</th><th>nombre</th><th>hsalida</th><th>hllegada</th><th>diferencia</th><th>observacion</th><th>id_comp</th></tr>";
		while($rowa=mysqli_fetch_array($rtaa)){
			$sql="SELECT * FROM tiempo WHERE id='".$rowa['id']."'";
					 $rta=ejecutarsql($sql);
					 if($rta){
						 $numrows=mysqli_num_rows($rta);
						 if($numrows>0){
							 $rowcompetencia=mysqli_fetch_array($rta);
							 if($rowcompetencia['hsalida']!=""){
								 if($_SESSION['nombre']=="rjme"){
									  $time= $rowcompetencia['hllegada'];
									  if($time!=""){
										  $id=$rowcompetencia['id'];
										  $hsalida=$rowcompetencia['hsalida'];
										  $dif=restarhoras($hsalida,$time);
										  $data['diferencia']=$dif;
										  $sql="UPDATE tiempo SET  diferencia='".$dif."' WHERE id=$id";
										  $data['sql']=$sql;
										  $rtain=ejecutarsql($sql);
										  if($rtain){
											  $sql="SELECT * FROM tiempo WHERE id=$id";
											  $rtadi=ejecutarsql($sql);
											  if($rtadi){
												  $numrowsdi=mysqli_num_rows($rtadi);
												  if($numrowsdi>0){
													  $rowrtadi=mysqli_fetch_array($rtadi);
													  $data['el'][]=array('id'=>$rowrtadi['id'],'numero'=>$rowrtadi['numero'],'nombre'=>$rowrtadi['nombre'],'hsalida'=>$rowrtadi['hsalida'],'hllegada'=>$rowrtadi['hllegada'],'diferencia'=>$rowrtadi['diferencia'],'observacion'=>$rowrtadi['observacion']);
													  echo"<tr><td>".$rowrtadi['id']."</td><td>".$rowrtadi['numero']."</td><td>".$rowrtadi['nombre']."</td><td>".$rowrtadi['hsalida']."</td><td>".$rowrtadi['hllegada']."</td><td>".$rowrtadi['diferencia']."<td>".$rowrtadi['observacion']."</td><td>".$rowrtadi['id_competencia']."</td></td></tr>";
												  }else{$msj="no hay registros despues de insersion";}
											  }else{$msj="no se encontro el registro despues de insercion";}
										  }else{$msj="error registrar hllegada";}
									  }else{$msj="no tiene registro de llegada";}
								 }else{$msj="su usuario no puede registrar horas de llegada";}
							 }else{$msj="no tiene registro hora de salida";}
						   }else{$msj="sin datos competencia";}
					 }else{$msj="error datos competencia";}
			}//fin del ciclo
			echo "</table>";
		}else{$msj="no hubo respuesta";}
}else{$msj="no hay session activa";}
$data['msj']=$msj;
echo json_encode($data);
?>