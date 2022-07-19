<head>
<title>Resultados</title>
<link rel="stylesheet" type="text/css" href="css/cssindex.css" >
<style>

/* Curso CSS estilos aprenderaprogramar.com*/

</style>
</head>
 <table>
   <tr>
		<td>COMPETENCIA BALINERAS RACE SAMACA</td>   
   </tr>
 </table>
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


function displayTable($sql){
   //generamos la consulta
   if(!$result = ejecutarsql($sql)) die();
 
   $rawdata = array();
   //guardamos en un array multidimensional todos los datos de la consulta
   $i=0;
 
   while($row = mysqli_fetch_array($result))
   {
       $rawdata[$i] = $row;
       $i++;
   }
 
 
   //DIBUJAMOS LA TABLA
 
   echo '<table width="100%" border="1" style="text-align:center;">';
   $columnas = count($rawdata[0])/2;
   //echo $columnas;
   $filas = count($rawdata);
   //echo "<br>".$filas."<br>";
 
   //Añadimos los titulos
 echo "<th><b>"."Posicion"."</b></th>";
  echo "<th><b>"."Numero"."</b></th>";
   echo "<th><b>"."Nombres"."</b></th>";
    echo "<th><b>"."Hsalida"."</b></th>";
	 echo "<th><b>"."Hllegada"."</b></th>";
	  echo "<th><b>"."Tiempo"."</b></th>";
	   echo "<th><b>"."Diferencia"."</b></th>";
 
   for($i=0;$i<$filas;$i++){
	  if($i==0){$pert=$rawdata[0][5];}
      echo "<tr>";
	  echo "<td>".($i+1)."</td>";
      echo "<td>".$rawdata[$i][1]."</td>";
	  echo "<td>".$rawdata[$i][2]."</td>";
	  echo "<td>".$rawdata[$i][3]."</td>";
	  echo "<td>".$rawdata[$i][4]."</td>";
	  echo "<td>".$rawdata[$i][5]."</td>";
	  echo "<td>".RestarHoras($pert,$rawdata[$i][5])."</td>";
   }
 
   echo '</table>';
 
}
	$sql = "SELECT * FROM tiempo WHERE hllegada!='' AND id_competencia=(SELECT id FROM competencia WHERE estado='1') ORDER BY diferencia";
	//echo $sql;
	displayTable($sql);
 


?>
 <table>
   <tr>
		<td>Desarrollado: Robinson Medina</td>   
   </tr>
 </table>