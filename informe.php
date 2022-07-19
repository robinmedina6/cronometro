<head>
<title>informe</title>
</head>
 
<?php
 session_start();
include("plano.php");
include('funciones.php');
if (isset($_SESSION['nombre'])){
	
}else{header("location:login.php");}

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
 
   for($i=1;$i<count($rawdata[0]);$i=$i+2){
      next($rawdata[0]);
      echo "<th><b>".key($rawdata[0])."</b></th>";
      next($rawdata[0]);
   }
 
   for($i=0;$i<$filas;$i++){
 
      echo "<tr>";
      for($j=0;$j<$columnas;$j++){
         echo "<td>".$rawdata[$i][$j]."</td>";
 
      }
      echo "</tr>";
   }
 
   echo '</table>';
 
}
	$sql = "SELECT * FROM tiempo WHERE hllegada!='' AND id_competencia=(SELECT id FROM competencia WHERE estado='1') ORDER BY diferencia";
	echo $sql;
	displayTable($sql);
 


?>