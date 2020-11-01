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

$msj="";
if(isset($_SESSION['nombre'])){
	if(isset($_POST['id'])){
		$id=$_POST['id'];
		//hora de salida de javascript ccompletarla con 0 a la izquerda
		//hora de salida de javascript ccompletarla con 0 a la izquerda
		$vhor=str_pad($_POST['vhor'],2,"0",STR_PAD_LEFT);
		$vmin=str_pad($_POST['vmin'],2,"0",STR_PAD_LEFT);
		$vseg=str_pad($_POST['vseg'],2,"0",STR_PAD_LEFT);
		$vmil=str_pad($_POST['vmil'],3,"0",STR_PAD_LEFT);
		$time=$vhor.":".$vmin.":".$vseg.".".$vmil;
		
		$t = explode(" ",microtime());
		$time= date("H:i:s",$t[1]).substr((string)$t[0],1,4);//hora con e reloj servidor
		$time=$vhor.":".$vmin.":".$vseg.".".$vmil;//hora con el reloj del hosts
		$data=array('el'=>array(),'hora'=>$time);
		
		$sql="SELECT * FROM tiempo WHERE id='$id'";
				 $rta=ejecutarsql($sql);
				 if($rta){
					 $numrows=mysqli_num_rows($rta);
					 if($numrows>0){
						 $rowcompetencia=mysqli_fetch_array($rta);
						 if($rowcompetencia['hllegada']==""){
							 if($_SESSION['nombre']=="rjme"){
								  $t = explode(" ",microtime());
								  
								  $hsalida=$rowcompetencia['hsalida'];
								  $dif=restarhoras($hsalida,$time);
								  $data['diferencia']=$dif;
								  $sql="UPDATE tiempo SET hllegada='".$time."', diferencia='".$dif."' WHERE id=$id";
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
										  }else{$msj="no hay registros despues de insersion";}
									  }else{$msj="no se encontro el registro despues de insercion";}
								  }else{$msj="error registrar hllegada";}
							 }else{$msj="su usuario no puede registrar horas de llegada";}
						 }else{$msj="ya se registro hora de llegada";}
					   }else{$msj="sin datos competencia";}
				 }else{$msj="error datos competencia";}
	}else{$msj="no hay datos para registrar";}
	
}else{$msj="no hay session activa";}
$data['msj']=$msj;
echo json_encode($data);
?>