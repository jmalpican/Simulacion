<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
 
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap-theme.min.css">
 	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
 	
	<link href="https://cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css" rel="stylesheet">
      <link href="/SMEH/js/pikaday.css" rel="stylesheet">
	
    <!-- librerías opcionales que activan el soporte de HTML5 para IE8 -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
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
			width: 12.5%;
		}
		
		a{
			height: 62px;
			overflow: hidden;
		}
		
		.test{}
    
        .error_box {
            display: none;
            background-color: #f2dede;
            text-align: left;
            padding: 10px;
            margin-bottom: 5px;
        }
    
    </style>
    
  </head>
  <body>
  
  	<div class="container">
	    
	    <!-- Nav tabs -->
	    <ul class="nav nav-tabs" role="tablist">
	      <li class="test active">
	          <a href="#home" onclick="getTab(this);" role="tab" data-toggle="tab">
	              <icon class="fa fa-home"></icon> Registro Metadatos
	          </a>
	      </li>
	      <li class="test">
	      	<a href="#profile" onclick="getTab(this);" role="tab" data-toggle="tab">
	          <i class="fa fa-user"></i> Informacion Estacion
	          </a>
	      </li>
	      <li class="test">
	          <a href="#messages" onclick="getTab(this);" role="tab" data-toggle="tab">
	              <i class="fa fa-envelope"></i> Ubicacion Estacion
	          </a>
	      </li>
	      <li class="test">
	          <a href="#settings" onclick="getTab(this);" role="tab" data-toggle="tab">
	              <i class="fa fa-cog"></i> Informacion Observador
	          </a>
	      </li>
	      <li class="test">
	          <a href="#settings1" onclick="getTab(this);" role="tab" data-toggle="tab">
	              <i class="fa fa-cog"></i> Información de los Instrumentos/Sensores
	          </a>
	      </li>
	      <li class="test">
	          <a href="#settings2" onclick="getTab(this);" role="tab" data-toggle="tab">
	              <i class="fa fa-cog"></i> Informacion de la Instalación/Montaje de los Instrumentos de la Estación
	          </a>
	      </li>
	      <li class="test">
	          <a href="#settings3" onclick="getTab(this);" role="tab" data-toggle="tab">
	              <i class="fa fa-cog"></i> Mapa
	          </a>
	      </li>
	      <li class="test">
	          <a href="#mantCombo" onclick="getTab(this);" role="tab" data-toggle="tab">
	              <i class="fa fa-cog"></i> Mantenimiento de Combos
	          </a>
	      </li>
	    </ul>
	    
	    <!-- Tab panes -->
	    <div class="tab-content">
	      <div class="tab-pane fade active in" id="home">
	          <h2>Registro de Metadatos</h2>
			  <jsp:include page="registrarMetadatos.jsp" />
	      </div>
	      <div class="tab-pane fade" id="profile">
	          <h2>Informacion General de la Estacion</h2>
	           <jsp:include page="informacionGeneralEstacion.jsp" />
	      </div>
	      <div class="tab-pane fade" id="messages">
	          <h2>Información de la Ubicación de la Estación</h2>
	      </div>
	      <div class="tab-pane fade" id="settings">
	          <h2>Información del Observador (incluye capacitación)</h2>
              <jsp:include page="registrarObservador.jsp" />
	      </div>
	      <div class="tab-pane fade" id="settings1">
	          <h2> Información de los Instrumentos/Sensores</h2>
	      </div>
	      <div class="tab-pane fade" id="settings2">
	          <h2>Informacion de la Instalación/Montaje de los Instrumentos de l Estación</h2>
<jsp:include page="sensor.jsp" />	      
</div>
	      <div class="tab-pane fade" id="settings3">
	          <h2>Mapa</h2>
	          <jsp:include page="mapa.jsp" />
	      </div>
	      <div class="tab-pane fade" id="mantCombo">
	          <h2>Mantenimiento de Combos</h2>
	          <jsp:include page="mantenimientoCombo.jsp" />
	      </div>
	    </div>
	    
	</div>
	
	<jsp:include page="combo.jsp" />
	<jsp:include page="tabla.jsp" />
	
	<div class="modal fade" id="popup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<label id="lblHeader"></label>
				</div>
				<div class="modal-body">
					<label id="lblMensaje"></label>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal" id="btnAceptarPopup">Aceptar</button>
				</div>
			</div>
		</div>
	</div> 
	
	
  
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.5.1/moment.min.js"></script>
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
    <script src="/SMEH/js/jquery.autocomplete.js"></script>
    <script src="/SMEH/js/parsley.min.js"></script>
    <script src="/SMEH/js/pikaday.js"></script>
    <script src="/SMEH/js/observador.js"></script>
	
	<script>
		$(document).ready(function() {
		    iniVariables();
		    iniComponentes();
		});
		
		var btnModal02Actua=null;
		var btnModal02Cancel=null;
		var tblRegistroMetadatos=null;

		var txtFecha=null;
		var txtDocuAuto=null;
		var cmbResponsable=null;
		var cmbMotivo=null;
		var datos=null;
		
		//PopUp
		var popup=null;		
		var lblHeader=null;		
		var lblMensaje=null;	
		var btnAceptarPopup=null;	
		

		var btnComboResp=null;	
		var btnComboMoti=null;	
		
		//MODAL COMBO
		var indMantCombo=null;	
		var tabla=null;	
		var divModalCombo=null;		
		var divModalContenidoCombo=null;		
		var h4TitleCombo=null;		
		var lblTitleCombo=null;			
		var txtCodigoCombo=null;		
		var txtDescCombo=null;			
		var btnModalComboGuardar=null;			
		var btnModalComboCancel=null;	
		
		//Mantenimiento tabla
		var divModalTabla=null;		
		var divModalContenidoTabla=null;		
		var h4TitleTabla=null;		
		var lblTitleTabla=null;			
		var txtDescTabla=null;			
		var btnModalTablaGuardar=null;			
		var btnModalTablaCancel=null;	
		
// 		Mantenimiento COMBO
		var tblCombo=null;
		var btnAddComboDesc=null;
		var btnTablaCombo=null;
		var cmbTablaCombo=null;

		var tblTest=null;
		
	    function iniVariables(){
	    	btnModal02Actua = $("#btnModal02Actua");
	    	btnModal02Cancel = $("#btnModal02Cancel");
	    	tblRegistroMetadatos=$("#tblRegistroMetadatos");
	    	
	    	txtFecha = $("#txtFecha");
	    	txtDocuAuto = $("#txtDocuAuto");
	    	cmbResponsable = $("#cmbResponsable");
	    	cmbMotivo = $("#cmbMotivo");
	    	
	    	//popup
	    	popup=$("#popup");
	    	lblHeader=$("#lblHeader");
	    	lblMensaje=$("#lblMensaje");
	    	btnAceptarPopup = $("#btnAceptarPopup");
	    	

	    	btnComboResp = $("#btnComboResp");
	    	btnComboMoti = $("#btnComboMoti");
	    	
	    	//popup
	    	tabla=$("#tabla");
	    	divModalCombo=$("#divModalCombo");
	    	divModalContenidoCombo=$("#divModalContenidoCombo");
	    	h4TitleCombo=$("#h4TitleCombo");
	    	lblTitleCombo=$("#lblTitleCombo");
	    	txtCodigoCombo=$("#txtCodigoCombo");
	    	txtDescCombo=$("#txtDescCombo");
	    	btnModalComboGuardar=$("#btnModalComboGuardar");
	    	btnModalComboCancel=$("#btnModalComboCancel");
	    	
//	 		Mantenimiento COMBO
			tblCombo=$("#tblCombo");
			btnAddComboDesc=$("#btnAddComboDesc");
			btnTablaCombo=$("#btnTablaCombo");
			cmbTablaCombo=$("#cmbTablaCombo");
			
			//Mantenimiento Tabla
	    	divModalTabla=$("#divModalTabla");
	    	divModalContenidoTabla=$("#divModalContenidoTabla");
	    	h4TitleTabla=$("#h4TitleTabla");
	    	lblTitleTabla=$("#lblTitleTabla");
	    	txtDescTabla=$("#txtDescTabla");
	    	btnModalTablaGuardar=$("#btnModalTablaGuardar");
	    	btnModalTablaCancel=$("#btnModalTablaCancel");
	    	
	    }
		    
		function iniComponentes(){
		
			lstResponsables = ${lstResponsables};
			cmbResponsable.append($("<option></option>").attr("value","000").text("Seleccionar"));
	    	$.each(lstResponsables, function(i, item) {
	    		cmbResponsable.append($("<option></option>").attr("value",lstResponsables[i].idResp).text(lstResponsables[i].nombre + ' ' + lstResponsables[i].apellido)); 
	    	});
	    	
	    	lstMotivo = ${lstMotivo};
	    	cmbMotivo.append($("<option></option>").attr("value","000").text("Seleccionar"));
	    	$.each(lstMotivo, function(i, item) {
	    		cmbMotivo.append($("<option></option>").attr("value",lstMotivo[i].codigo).text(lstMotivo[i].descripcion)); 
	    	});
	    	
	    	var lstMetadatos=${lstMetadatos};
	    	getListaMetadatos(lstMetadatos);
	   	  	
	   		$('#tblRegistroMetadatos tbody').on( 'click', 'button', function () {
	   			datos = tblRegistroMetadatos.DataTable().rows($(this).parents('tr')).data().toArray()[0];
				txtFecha.val(datos.fecha);
				txtDocuAuto.val(datos.autorizado);
				cmbMotivo.val(datos.idMotivo);
				cmbResponsable.val(datos.idResp);
				$('#divModificarMetadata').modal('show');
			} );
	   		
	   		btnAceptarPopup.bind("click",function(event) {
	   			
		   	  	//Iniciar Grilla
            	popup.modal('hide');
            	$('#divModificarMetadata').modal('hide');
	   		} );
	   		
	   		btnModal02Actua.bind("click",function(event) {
	   	    	$.ajax({
	                url: "/SMEH/actualizarMetadatos",
	                type: "POST",
	                dataType: "json",
            		async : false,
        			cache : false,
	                data : {
	                	idMetadatos : datos.idMetadatos,
	                	idMotivo : cmbMotivo.val(),
	   	    			idResp : cmbResponsable.val()
	                }
	            }).done(function(paramJson) {
	            	tblRegistroMetadatos.DataTable().destroy();
	            	getListaMetadatos(paramJson);
	            	mostrarPopUp('Mensaje','Actualizo correctamente.');
	 			}).fail(function( jqXHR, textStatus, errorThrown ) {
	 				alert("No actualizo.");
	  			});
	 
	   	  	});
	   		
	   		btnModal02Cancel.bind("click",function(event) {
	   			$('#divModificarMetadata').modal('hide');
	   		} );
	   		
	   		//////////////////////////////////////////////Modal
	   		btnModalComboGuardar.bind("click",function(event) {
	   	    	$.ajax({
	                url: "/SMEH/guardarCombo",
	                type: "POST",
	                dataType: "json",
            		async : false,
        			cache : false,
	                data : {
	                	tabla		: tabla.val(),
	                	codigo 		: txtCodigoCombo.val(),
	   	    			descripcion : txtDescCombo.val()
	                }
	            }).done(function(paramJson) {
					if (indMantCombo != null) {
						getListaTablaCombo();
						indMantCombo = null;
					}
	            	divModalCombo.modal('hide');
	 			}).fail(function( jqXHR, textStatus, errorThrown ) {
	 				indMantCombo = null;
	 				alert("No actualizo.");
	  			});
	 
	   	  	});
	   		
	   		btnModalComboCancel.bind("click",function(event) {
	   			divModalCombo.modal('hide');
	   		} );
	   		
	   		btnComboResp.bind("click",function(event) {
	   			tabla.val('responsable');
	   			modalCombo('Registrar Responsable');
	   		} );
	   		
	   		btnComboMoti.bind("click",function(event) {
	   			tabla.val('motivo');
	   			modalCombo('Registrar Motivo');
	   		} );
	   		
	   		//Mantenimiento COMBO
	   		
	   		lstTablas = ${lstTablas};
	   		cmbTablaCombo.append($("<option></option>").attr("value","000").text("Seleccionar"));
	    	$.each(lstTablas, function(i, item) {
	    		cmbTablaCombo.append($("<option></option>").attr("value",lstTablas[i].codigo).text(lstTablas[i].tabla)); 
	    	});
	   		
	   		//Iniciar Grilla
	   	  	tblCombo.DataTable({
	 	       	    searching: false,
	 	       	 	bLengthChange: false
		    });
	   		
		 	$('#tblCombo tbody').on( 'click', 'button', function () {
		 		datos = tblCombo.DataTable().rows($(this).parents('tr')).data().toArray()[0];
		 		nameTabla = $("#cmbTablaCombo option:selected").text();
		   		tabla.val(nameTabla);
	   			modalCombo('Modificar '+nameTabla);
		   		txtCodigoCombo.val(datos.codigo);
		   		txtDescCombo.val(datos.descripcion);
		   		indMantCombo = true;
			} );
		   	 
		   	$('#tblCombo tbody').on( 'click', 'input', function () {
	   			datos = tblCombo.DataTable().rows($(this).parents('tr')).data().toArray()[0];
				$.ajax({
	                url: "/SMEH/eliminarCombo",
	                type: "POST",
	                dataType: "json",
	        		async : false,
	    			cache : false,
	                data : {
	                	tabla		: $("#cmbTablaCombo option:selected").text(),
	                	codigo 		: datos.codigo
	                	}
	            }).done(function(paramJson) {
	            	getListaTablaCombo();
	 			}).fail(function( jqXHR, textStatus, errorThrown ) {
	 				alert("No elimino.");
	  			});
			} );
		   	
		   	btnAddComboDesc.bind("click",function(event) {
		 		nameTabla = $("#cmbTablaCombo option:selected").text();
		   		tabla.val(nameTabla);
	   			modalCombo('Registrar '+nameTabla);
	   			indMantCombo = true;
	   		} );
		   	
		   	btnTablaCombo.bind("click",function(event) {
		   		indMantCombo = true;
	   			modalTabla('Registrar Tabla');
	   		} );
		   	
		   	//Mantenimiento Tabla
		   	btnModalTablaGuardar.bind("click",function(event) {
	   	    	$.ajax({
	                url: "/SMEH/createTablaCombo",
	                type: "POST",
	                dataType: "json",
            		async : false,
        			cache : false,
	                data : {
	   	    			tabla : txtDescTabla.val()
	                }
	            }).done(function(paramJson) {
	            	cmbTablaCombo.find('option').remove().end();
	    	   		cmbTablaCombo.append($("<option></option>").attr("value","000").text("Seleccionar"));
	    	    	$.each(paramJson, function(i, item) {
	    	    		cmbTablaCombo.append($("<option></option>").attr("value",paramJson[i].codigo).text(paramJson[i].tabla)); 
	    	    	});
	            	divModalTabla.modal('hide');
	 			}).fail(function( jqXHR, textStatus, errorThrown ) {
	 				alert("No actualizo.");
	  			});
	 
	   	  	});
	   		
	   		btnModalTablaCancel.bind("click",function(event) {
	   			divModalTabla.modal('hide');
	   		} );
	   		
	   		cmbTablaCombo.change(function() {
	   			getListaTablaCombo();
	        });
	   		
	   		
	   	        	  	
	    }
		
		function getTab(){
			setTimeout(function(){
				$("li.active").width("auto");
				
				total=$("div.container").width();
				restar=$("li.active").width();
				restante=total-restar;
				uno=restante/7;
				
				$("li").width(uno+"px");
				$("li.active").width("auto");
			}, 50);
		}
		
		function getListaTablaCombo(){
			
			$.ajax({
                url: "/SMEH/getAllCombo",
                type: "POST",
                dataType: "json",
        		async : false,
    			cache : false,
                data : {
   	    			tabla : $("#cmbTablaCombo option:selected").text()
                }
            }).done(function(paramJson) {
            	tblCombo.DataTable().destroy();
            	tblCombo.DataTable({
			    	data:paramJson,
			    	columns: [
			    	          {data:'codigo', sClass: 'text-left'},
			    	          {data:'descripcion', sClass: 'text-left'},
			    	          {
			    	        	  data: null,
			    	        	  defaultContent: '<button type="button" class="btn btn-primary">Modificar</button>', 
			    	        	  sClass: 'text-center'
			    	          },
			    	          {
			    	        	  data: null,
			    	        	  defaultContent: '<input type="button" class="btn btn-default" value="Eliminar">', 
			    	        	  sClass: 'text-center'
			    	          }
			    	         ],
		 	       	    searching: false,
		 	       	 	bLengthChange: false
			    });
 			}).fail(function( jqXHR, textStatus, errorThrown ) {
 				alert("No hay.");
  			});
		}
		
		function getListaMetadatos(lstMetadatos){
			
	   	  	//Iniciar Grilla
	   	  	tblRegistroMetadatos.DataTable({
		    	data:lstMetadatos,
		    	columns: [
		    	          {data:'fecha', sClass: 'text-left'},
		    	          {data:'nombreCompleto', sClass: 'text-left'},
		    	          {data:'autorizado', sClass: 'text-center'},
		    	          {data:'motivo', sClass: 'text-left'},
		    	          {
		    	        	  data: null,
		    	        	  defaultContent: '<button type="button" class="btn btn-primary">Modificar</button>', 
		    	        	  sClass: 'text-center'
		    	          }
		    	         ],
	 	       	    searching: false,
	 	       	 	bLengthChange: false
		    });
		}
		
		function mostrarPopUp(title,message){
			lblHeader.html(title);
	       	lblMensaje.html(message);
			popup.modal({backdrop: 'static', keyboard: false, show: true});
		}
		
		function modalCombo(title){
			lblTitleCombo.html(title);
			txtCodigoCombo.val('');
	    	txtDescCombo.val('');
	       	divModalCombo.modal({backdrop: 'static', keyboard: false, show: true});
		}
		
		function modalTabla(title){
			lblTitleTabla.html(title);
	    	txtDescTabla.val('');
	       	divModalTabla.modal({backdrop: 'static', keyboard: false, show: true});
		}
	
	</script>
  </body>
</html>