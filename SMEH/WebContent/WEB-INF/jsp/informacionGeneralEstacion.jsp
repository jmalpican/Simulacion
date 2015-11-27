<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
 
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap-theme.min.css">
 	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
	<link href="https://cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css" rel="stylesheet">
 
    
    <style type="text/css">
	    body {
		    margin: 5px;
		    background: #A6A6A6
		}
		/* Tab Navigation */
		.nav-tabs {
		    margin: 0;
		    padding: 0;
		    border: 0;    
		}
		.nav-tabs > li > a {
		    background: #DADADA;
		    border-radius: 0;
		    box-shadow: inset 0 -8px 7px -9px rgba(0,0,0,.4),-2px -2px 5px -2px rgba(0,0,0,.4);
		}
		.nav-tabs > li.active > a,
		.nav-tabs > li.active > a:hover {
		    background: #F5F5F5;
		    box-shadow: inset 0 0 0 0 rgba(0,0,0,.4),-2px -3px 5px -2px rgba(0,0,0,.4);
		}
		
		/* Tab Content */
		.tab-pane {
		    background: #F5F5F5;
		    box-shadow: 0 0 4px rgba(0,0,0,.4);
		    border-radius: 0;
		    padding: 10px;
		}
		
		li{
			width: 14%;
		}
		
		a{
			height: 62px;
			overflow: hidden;
		}
		
		.test{}
    
    </style>
    
  </head>
  <body>
  

	    
    <div class="panel panel-primary" align="center">
		<div class="panel-body padding-body">
			<div class="table-responsive">
				<table id="tblInformacionGeneralEstacion" class="display" cellspacing="0" width="70%">
				<tr><td>Nombre de la Estación :</td><td><input type="text" id="estacionName" class="form-control input-sm chat-input" placeholder="Estacion" /></td></tr>
                <tr><td>Alias:</td><td><input type="text" id="alias" class="form-control input-sm chat-input" placeholder="Alias" /></td></tr>
                <tr><td>Código SENAMHI :</td><td><input type="text" id="codigoSenamhi" class="form-control input-sm chat-input" placeholder="Codigo Senamhi" /></td></tr>
                <tr><td>Código OMM:</td><td><input type="text" id="codigoOmm" class="form-control input-sm chat-input" placeholder="Codigo OMM" /></td></tr>
                <tr><td>Otro Código:</td><td><input type="text" id="otroCodigo" class="form-control input-sm chat-input" placeholder="Otro Codigo" /></td></tr>				
                <tr><td>Clasificación de Estación :</td><td> <select name="cmbClasfEstacion" id="cmbClasfEstacion" class="form-control"></select> <td></tr>
                <tr><td>Subclasificación1 de Estación :</td><td> <select name="cmbSubClasfEstacion1" id="cmbSubClasfEstacion1" class="form-control"></select> <td></tr>
                <tr><td>Subclasificación2 de Estación :</td><td> <select name="cmbSubClasfEstacion2" id="cmbSubClasfEstacion2" class="form-control"></select> <td></tr>
                <tr><td>Subclasificación3 de Estación :</td><td> <select name="cmbSubClasfEstacion3" id="cmbSubClasfEstacion3" class="form-control"></select> <td></tr>


                <tr><td>Tipo de Estación (Conv/Auto) :</td><td> <select name="cmbTipoEstacion" id="cmbTipoEstacion" class="form-control"></select> <td></tr>
                <tr><td>Es Mixta?:</td><td> <select name="cmbMixta" id="cmbMixta" class="form-control" "></select> <td></tr>
                <tr><td>Fecha de inicio:</td> <td><input type="text" id="fecIni"  class="form-control input-sm chat-input" placeholder="Fecha Inicial" />	</td> </tr> 
                <tr><td>Autorizacion:</td><td><input type="text" id="autorizacionIni" class="form-control input-sm chat-input" placeholder="Autorizacion" />	</td></tr>
                <tr><td>Fecha de cierre (clausura):</td><td><input type="text" id="fecFin" class="form-control input-sm chat-input" placeholder="Fecha Fin" />	</td></tr>
                <tr><td>Autorizacion:</td><td><input type="text" id="autorizacionFin" class="form-control input-sm chat-input" placeholder="Autorizacion" />	</td></tr>
                <tr><td>Propiedad de la Estacion:</td><td><input type="text" id="propiedadEstacion" class="form-control input-sm chat-input" placeholder="Propiedad" />	</td></tr>
                <tr><td>Situacion Legal:</td><td> <select name="cmbSituacionLegal" id="cmbSituacionLegal" class="form-control"></select> <td></tr>

                <tr><td>Nombre de la Red a la que pertenece:</td><td><input type="text" id="nombreRed" class="form-control input-sm chat-input" placeholder="Red" />	</td></tr>
                <tr><td>Proposito de la Estacion/Red:</td><td> <select name="cmbEstacionRed" id="cmbEstacionRed" class="form-control" "></select> <td></tr>
				
				</table>
			</div>
		</div>
		
		<div class="modal-footer">
					<button class="btn btn-primary" id="btnGuardar">Guardar</button>
					<button class="btn btn btn-default" id="btnLimpiar">Limpiar</button>
				</div>
	</div>


	
  
    <script src="http://code.jquery.com/jquery.js"></script>
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>

    
       
	<script>
		$(document).ready(function() {
		
			
		    Limpiar();
		  
			var cmbSituacionLegal=null;
			var cmbClasfEstacion=null;
			var cmbSubClasfEstacion1=null;
			var cmbSubClasfEstacion2=null;
			var cmbSubClasfEstacion3=null;
			var cmbEstacionRed=null;
			var cmbTipoEstacion=null;
			var cmbMixta =null;
			var estacionName =null;
			
			estacionName = $("#estacionName");
			
			var alias = $("#alias");
			var codigoSenamhi = $("#codigoSenamhi");
			var codigoOmm = $("#codigoOmm");
			var otroCodigo	= $("#otroCodigo");	 	
			var fecIni = $("#fecIni");
			var autorizacionIni = $("#autorizacionIni");
			var fecFin = $("#fecFin");
			var autorizacionFin = $("#autorizacionFin");
			var propiedadEstacion = $("#propiedadEstacion");
			var nombreRed = $("#nombreRed");
			
			
			
			cmbClasfEstacion = $("#cmbClasfEstacion");
	    	lstClasificacionEstacion = ${lstClasificacionEstacion};
	    	cmbClasfEstacion.append($("<option></option>").attr("value","000").text("Seleccionar"));
	    	$.each(lstClasificacionEstacion, function(i, item) {
	    		cmbClasfEstacion.append($("<option></option>").attr("value",lstClasificacionEstacion[i].codigo).text(lstClasificacionEstacion[i].descripcion)); 
	    	});
	    	
	    	
			cmbSubClasfEstacion1 = $("#cmbSubClasfEstacion1");
			lstSubEstacion1 = ${lstSubEstacion1};
    	    cmbSubClasfEstacion1.append($("<option></option>").attr("value","000").text("Seleccionar"));
			/*-----------------------------------------*/
			$('#cmbClasfEstacion').change(function() {   
				
				  $.ajax({
		                url: "/SMEH/selectComboClasificacion",
		                type: "GET",
		                dataType: "json",
	            		async : false,
	        			cache : false,
		                data : {codigo : cmbClasfEstacion.val()},
		                success: function(objJson) {
	                	       cmbSubClasfEstacion1.empty();
	                	       cmbSubClasfEstacion1.append($("<option></option>").attr("value","000").text("Seleccionar"));
	                	       cmbSubClasfEstacion2.empty();
	                	       cmbSubClasfEstacion2.append($("<option></option>").attr("value","000").text("Seleccionar"));
	                	       cmbSubClasfEstacion3.empty();
			                   cmbSubClasfEstacion3.append($("<option></option>").attr("value","000").text("Seleccionar"));
		                	$.each(objJson, function(i,data){
		                	    cmbSubClasfEstacion1.append($("<option></option>").attr("value",objJson[i].codigo_sub).text(objJson[i].descripcion)); 

		                	});

		                }

		            });
				 
				  
			});
			/*-----------------------------------------*/
            cmbSubClasfEstacion2 = $("#cmbSubClasfEstacion2");
			lstSubEstacion2 = ${lstSubEstacion2};
			cmbSubClasfEstacion2.append($("<option></option>").attr("value","000").text("Seleccionar"));
			
			$('#cmbSubClasfEstacion1').change(function() {   
				
				  $.ajax({
		                url: "/SMEH/selectComboSub1",
		                type: "GET",
		                dataType: "json",
	            		async : false,
	        			cache : false,
		                data : {codigo : cmbSubClasfEstacion1.val()},
		                success: function(objJson) {
		                	cmbSubClasfEstacion2.empty();
		                	cmbSubClasfEstacion2.append($("<option></option>").attr("value","000").text("Seleccionar"));
		                	cmbSubClasfEstacion3.empty();
		                	cmbSubClasfEstacion3.append($("<option></option>").attr("value","000").text("Seleccionar"));
		                	$.each(objJson, function(i,data){
		                		cmbSubClasfEstacion2.append($("<option></option>").attr("value",objJson[i].codigo_sub2).text(objJson[i].descripcion)); 

		                	});

		                }

		            });
				 
				  
			});
			/*-----------------------------------------*/
	
		    cmbSubClasfEstacion3 = $("#cmbSubClasfEstacion3");
			lstSubEstacion3 = ${lstSubEstacion3};
			cmbSubClasfEstacion3.append($("<option></option>").attr("value","000").text("Seleccionar"));
	    	
			$('#cmbSubClasfEstacion2').change(function() {   
				
				  $.ajax({
		                url: "/SMEH/selectComboSub2",
		                type: "GET",
		                dataType: "json",
	            		async : false,
	        			cache : false,
		                data : {codigo : cmbSubClasfEstacion2.val()},
		                success: function(objJson) {
		                	cmbSubClasfEstacion3.empty();
		                	cmbSubClasfEstacion3.append($("<option></option>").attr("value","000").text("Seleccionar"));
		                	$.each(objJson, function(i,data){
		                		cmbSubClasfEstacion3.append($("<option></option>").attr("value",objJson[i].codigo_sub3).text(objJson[i].descripcion)); 

		                	});

		                }

		            });
				 
				  
			});
	    
	
			
	    	
			cmbSituacionLegal = $("#cmbSituacionLegal");
			lstSituacionLegal = ${lstSituacionLegal};
			cmbSituacionLegal.append($("<option></option>").attr("value","000").text("Seleccionar"));
	    	$.each(lstSituacionLegal, function(i, item) {
	    		cmbSituacionLegal.append($("<option></option>").attr("value",lstSituacionLegal[i].codigo).text(lstSituacionLegal[i].descripcion)); 
	    	});
	    	
			cmbEstacionRed = $("#cmbEstacionRed");
			lstPropositoRed = ${lstPropositoRed};
			cmbEstacionRed.append($("<option></option>").attr("value","000").text("Seleccionar"));
	    	$.each(lstPropositoRed, function(i, item) {
	    		cmbEstacionRed.append($("<option></option>").attr("value",lstPropositoRed[i].codigo).text(lstPropositoRed[i].descripcion)); 
	    	});
			
	
			
			cmbTipoEstacion = $("#cmbTipoEstacion");
			lstTipoEstacion = ${lstTipoEstacion};
			cmbTipoEstacion.append($("<option></option>").attr("value","000").text("Seleccionar"));
	    	$.each(lstTipoEstacion, function(i, item) {
	    		cmbTipoEstacion.append($("<option></option>").attr("value",lstTipoEstacion[i].codigo).text(lstTipoEstacion[i].descripcion)); 
	    	});
	    	
	
			
			cmbMixta = $("#cmbMixta");
			cmbMixta.append($("<option></option>").attr("value","000").text("Seleccionar"));
			cmbMixta.append($("<option></option>").attr("value","1").text("SI"));
			cmbMixta.append($("<option></option>").attr("value","2").text("NO"));
			
			var btnGuardar = $("#btnGuardar");
			var btnLimpiar = $("#btnLimpiar");
			
		
			
			btnGuardar.bind("click",function(event) {
	  	    	$.ajax({
	                url: "/SMEH/registrarInformacionEstacion",
	                type: "POST",
	                dataType: "json",
            		async : false,
        			cache : false,
	                data : {
	                	nombreEstacion  : estacionName.val(),
	                	alias  :  alias.val(),
	                	codigoSenamhi  : codigoSenamhi.val(),
	        			codigoOmm  : codigoOmm.val(),
	        			otroCodigo	 : otroCodigo.val(),	
	        			fecIni :fecIni.val(),
	        			autorizacionIni  :autorizacionIni.val(),
	        			fecFin  : fecFin.val(),
	        			autorizacionFin : autorizacionFin.val(),
	        			propiedadEstacion : propiedadEstacion.val(),
	        			nombreRed  : nombreRed.val(),
	        			tipoestacionRed  : cmbEstacionRed.val(),
	                	mixta  : cmbMixta.val(),
	                	tipoEstacion  : cmbTipoEstacion.val(),
	                	tipoClasEstacion  : cmbClasfEstacion.val(),
	                	tipoSubClasEstacion1  : cmbSubClasfEstacion1.val(),
	                	tipoSubClasEstacion2  : cmbSubClasfEstacion2.val(),
	                	tipoSubClasEstacion3  : cmbSubClasfEstacion3.val(),
	                	tipoSituacion  : cmbSituacionLegal.val()
	                	
	
	      
	                	
	                }
	            }).done(function(paramJson) {
	            	if(paramJson=="1"){
	            		alert("Ingreso exitoso.");
	            		
	            	}
	            	else{
	            		alert("Datos no se ingresaron");
	            		
	            	}
	            		
	        		    Limpiar();
	            }).fail(function( jqXHR, textStatus, errorThrown ) {
	 				alert("Datos no grabados");
	  			});
	 
	 
	   	  	});
	
			function mostrarPopUp(title,message){
				lblHeader.html(title);
		       	lblMensaje.html(message);
				popup.modal({backdrop: 'static', keyboard: false, show: true});
			}
			
			btnLimpiar.bind("click",function(event) {
				Limpiar();
			
	   	  	});
			
			
			
			
			  function Limpiar(){
				  
					 $("#estacionName").val('');
					 $("#alias").val('');
					 $("#codigoSenamhi").val('');
					 $("#codigoOmm").val('');
					 $("#otroCodigo").val('');
					 $("#autorizacionIni").val('');
					 $("#autorizacionFin").val('');
					 $("#propiedadEstacion").val('');
					 $("#nombreRed").val('');
					 $("#fecIni").val('');
					 $("#fecFin").val('');
					 
					$("#cmbMixta").prop('selectedIndex', "000");
					$("#cmbEstacionRed").prop('selectedIndex', "000");
					$("#cmbTipoEstacion").prop('selectedIndex', "000");
					$("#cmbClasfEstacion").prop('selectedIndex', "000");
					$("#cmbSituacionLegal").prop('selectedIndex', "000");
					$("#cmbSubClasfEstacion1").prop('selectedIndex', "000");
					$("#cmbSubClasfEstacion2").prop('selectedIndex', "000");
					$("#cmbSubClasfEstacion3").prop('selectedIndex', "000");
				  
				  
			  }

		});
		

	
	</script>
  </body>
</html>