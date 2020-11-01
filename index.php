<?php
session_start();
include("plano.php");
include("funciones.php");
if (isset($_SESSION['nombre'])){
	confsesion();
	
}else{header("location:login.php");}


          $sql="select * from competencia WHERE estado=1 ORDER BY  id DESC";
		  $rta=ejecutarsql($sql);
		  if($rta){
			  $numrows=mysqli_num_rows($rta);
				if($numrows>0){
					$rowcompetencia=mysqli_fetch_array($rta);
						
						
				}else{//si la consulta no encuentra competencias activas
				header("location:crearcomp.php");
				}	
		  }else{}
		  ?>
<!DOCTYPE html>
<html>
<title>Cronometro</title>
<head>
<link rel="stylesheet" type="text/css" href="css/cssindex.css" >
<script src="jquery-1.11.2.min.js"></script>
<style>

</style>
<script>
		  
		  	  var vhor;
			  var vmin;
			  var vseg;
			  var vmil;
			  vhora=new Date ()
		  function acthoras(){
			  vhora=new Date ()
			  vhor=(vhora.getHours());
			  vmin=(vhora.getMinutes());
			  vseg=(vhora.getSeconds());
			  vmil=(vhora.getMilliseconds());
			  $("#divhora").html(vhor+":"+vmin+":"+vseg+":"+vmil);
			  setTimeout("acthoras();",1000);
			  }
			  acthoras();
          
</script>
</head>
<body>
<h3 id="marca" style="position:absolute; right:0px; top:0px; margin:0px;  0px 0px 100px; color:rgba(0,153,0,1); background-color:rgba(240,240,240,1);">RJME</h3>
	<div id="container">
      <div class="contpes">
      <div class="titulo">
      </div>
      <div id="pestanas">
          <ul id=lista>
              <li id="p1">
              
              
              
              </li>
          </ul>
      </div>
 
      <div id="contenidopestanas">
          <div id="cpestana1">
          
          <table border="1">
          <tr><th>id</th><td><?php echo $rowcompetencia['id'];?></td></tr>
          <tr><th>competencia</th><td><?php echo $rowcompetencia['nombre'];?></td></tr>
          <tr><th>Hora Actual</th><td><div id="divhora"></div></td></tr>
          <tr><th>TEST INTERNET</th><td><input type="button" value="test" onClick="test()"/></td></tr>
          </table>
          <hr/>
          	<table border="1" id="mainparticipantes">
            <tr><th>numero</th><th>nombre</th><th>hsalida</th><th>hllegada</th><th>diferencia</th><th>observacion</th><th>salida</th><th>Eliminar</th></tr>      
                          
            </table>
            <hr />
            <table>
            <tr><td><input name="btnnparticipante" type="button" onClick="cnpartic();" value="agregar" /></td></tr>
            </table>
          </div>
  	</div>
</div>
</body>
</html>
<script>
function test(){
		var url="test.php";
		$.ajax({
		  type: "POST",
		  dataType:"json",
		   url: url,
		   data:{n:""},
		   beforeSend: function(){},
		   error: function(){alert("fallo de test verifique internet");},
		  success: function(data){
			 alert(data.test);
		  }
	  });
	}

var nparte=0;//calcula el numero del participante siguiente este puede incluso cambiar en el campo
var idupte=0;//calcula el id siguiente para la transaccion es muy importante se registra en la bd
function nparticipante(){
	nparte++;
	
	cad="<tr><td><input id='txtnumero"+idupte+"' type='text' value='"+nparte+"' /></td>";
	cad+="<td><input id='txtnombre"+idupte+"' type='text' value='' onclick='' /></td>";
	cad+="<td><input id='txthsalida"+idupte+"' type='text' value='' /></td>";
	cad+="<td><input id='txthllegada"+idupte+"' type='text' value='' /></td>";
	cad+="<td><input id='txtdiferencia"+idupte+"' type='text' value='' /></td>";
	cad+="<td><input id='txtobservacion"+idupte+"' type='text' value='' /></td>";
	cad+="<td><input id='btnsalida"+idupte+"' type='button' value='salida' onclick='salidap("+idupte+")' /></td>";
	cad+="<td><input id='btneliminar"+idupte+"' type='button' value='eliminar' onclick='eliminar("+idupte+")' /></td>";
	cad+="</tr>";
	idupte++;
	$("#mainparticipantes").append(cad);
	}
function cnpartic(){
	var url="cargarid.php";
	$.ajax({
		  type: "POST",
		  dataType:"json",
		   url: url,
		   data:{},
		   beforeSend: function(){},
		   error: function(){},
		  success: function(data){
			idupte=data.idsiguiente;
			nparticipante();
		  }
	  });
	}
function npartic(id,nro,nombre,hsalida,hllegada,diferencia,observacion,btnsalida){
	nparte=nro;
	idpte=id;
	idupte=id;
	cad="<tr><td><input id='txtnumero"+idupte+"' type='text' value='"+nparte+"' /></td>";
	cad+="<td><input id='txtnombre"+idupte+"' type='text' value='"+nombre+"' onchange=\"editar("+idupte+",'nombre',this)\" /></td>";
	cad+="<td><input id='txthsalida"+idupte+"' type='text' value='"+hsalida+"' /></td>";
	cad+="<td><input id='txthllegada"+idupte+"' type='text' value='"+hllegada+"' /></td>";
	cad+="<td><input id='txtdiferencia"+idupte+"' type='text' value='"+diferencia+"' /></td>";
	cad+="<td><input id='txtobservacion"+idupte+"' type='text' value='"+observacion+"' onchange=\"editar("+idupte+",'observacion',this)\" /></td>";
	cad+="<td><input id='btnsalida"+idupte+"' type='button' value='"+btnsalida+"' onclick='llegada("+idupte+")' /></td>";
	cad+="<td><input id='btneliminar"+idupte+"' type='button' value='eliminar' onclick='eliminar("+idupte+")' /></td>";
	cad+="</tr>";
	$("#mainparticipantes").append(cad);
}
var idpte=0;
var pend=0;
function tpates(){
		var tipo=0;
		if(pend==0){
		if(idpte==0){}else{tipo=1;}
		var url="ajax.php";
		$.ajax({
		  type: "POST",
		  dataType:"json",
		   url: url,
		   data:{tipo:tipo,idpte:idpte},
		   beforeSend: function(){pend=1;},
		   error: function(){pend=0;},
		  success: function(data){
			  pend=0;
			  hora=data.hora;
			$.each(data.el,function(index,value){
				npartic(value['id'],value['numero'],value['nombre'],value['hsalida'],value['hllegada'],value['diferencia'],value['observacion'],"llegada");
				
				});	
		  }
	  });
		}else{console.log("no se envio porque ya hay un xhr");}
	}
function salidap(nrop){
	acthoras();
	var horsalida=vhor+":"+vmin+":"+vseg+":"+vmil;
	$("#marca").html(horsalida);
	var npte=$("#txtnumero"+nrop).val();
	var vnombre=$("#txtnombre"+nrop).val()
	var vobservacion=$("#txtobservacion"+nrop).val();
	var url="salidap.php";
	  $.ajax({
		  type: "POST",
		  dataType:"json",
		   url: url,
		   data:{nrop:npte,nombre:vnombre,observacion:vobservacion,vhor:vhor,vmin:vmin,vseg:vseg,vmil:vmil},
		   beforeSend: function(){},
		   error: function(){alert("error Guarde la hora de marca");},
		  success: function(datas){
			  $("#marca").html("RJME");
		   $.each(datas.el,function(index,value){
			   var num=value['id'];
			    idpte=value['id'];//para sumarle a id participante en pagina
				$("#txtnumero"+num).val(value['numero']);
				$("#txtnombre"+num).val(value['nombre']);
				$("#txthsalida"+num).val(value['hsalida']);
				$("#txthllegada"+num).val(value['hllegada']);
				$("#txtdiferencia"+num).val(value['diferencia']);
				$("#txtobservacion"+num).val(value['observacion']);
				$("#btnsalida"+num).val("llegada");
				$("#btnsalida"+num).attr('onclick',"llegada("+value['id']+")");				
				});
				if(datas.msj!=""){alert(datas.msj);}
		  }
	  });
	}
function llegada(id){
	acthoras();
	var horsalida=vhor+":"+vmin+":"+vseg+":"+vmil;
	$("#marca").html(horsalida);
	var url="llegada.php";
	  $.ajax({
		  type: "POST",
		  dataType:"json",
		   url: url,
		   data:{id:id,vhor:vhor,vmin:vmin,vseg:vseg,vmil:vmil},
		   beforeSend: function(){},
		   error: function(){alert("error Guarde la hora de marca");},
		  success: function(datas){
			  $("#marca").html("RJME");
		   $.each(datas.el,function(index,value){
			   var num=value['id'];
			   //idpte=value['id'];//para sumarle a id participante en pagina
				$("#txtnumero"+num).val(value['numero']);
				$("#txtnombre"+num).val(value['nombre']);
				$("#txthsalida"+num).val(value['hsalida']);
				$("#txthllegada"+num).val(value['hllegada']);
				$("#txtdiferencia"+num).val(value['diferencia']);
				$("#txtobservacion"+num).val(value['observacion']);
				});
				if(datas.msj!=""){alert(datas.msj);}
		  }
	  });
	}

function eliminar(id){
	
	var confirma=window.confirm("desea eliminar el registro con el id:"+id+" numero:"+$("#txtnumero"+id).val()+" nombre:"+$("#txtnombre"+id).val());
	if(confirma==true){
		  var url="eliminar.php";
		  $.ajax({
			type: "POST",
			dataType:"json",
			 url: url,
			 data:{idreg:id},
			 beforeSend: function(){},
			 error: function(){},
			success: function(data){
				if(data.vb==true){
				$("#txtnumero"+id).remove();
				$("#txtnombre"+id).remove();
				$("#txthsalida"+id).remove();
				$("#txthllegada"+id).remove();
				$("#txtdiferencia"+id).remove();
				$("#txtobservacion"+id).remove();
				$("#btnsalida"+id).remove();
				$("#btneliminar"+id).remove();
				}else{alert(data.msj);}
				}
			});
		}else{
			alert("no se ra eliminado");
			
	}
	
	}
	
function editar(id,campo,elemento){
	var valor=$(elemento).val();
	if(valor != ""){
		var confirma=window.confirm("desea acualizar "+campo+" id: "+id+" valor: " + valor);
		if(confirma==true){
			  var url="edita.php";
			  $.ajax({
				type: "POST",
				dataType:"json",
				 url: url,
				 data:{idreg:id,campo:campo,valor:valor},
				 beforeSend: function(){},
				 error: function(){},
				success: function(data){
					if(data.vb==true){
					alert("el campo se edito correctamente");
					}else{alert(data.msj);}
					}
				});
			}else{}
	}else{alert("no se enviaron datos para editar");}
	}
	setInterval(function(){ tpates() }, 5000);
	tpates();
</script>
	<?php
?>


