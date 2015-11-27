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
			<div class="modal-body">
		  <table id="tblMontaje" class="display" cellspacing="0" width="50%">
		        <tr><td>Instrumento/Sensor :</td><td><input type="text" id="instrumento" class="form-control input-sm chat-input"/></td></tr>
                <tr><td>Fecha de Instalación:</td><td><input type="text" id="fechaIni" class="form-control input-sm chat-input" /></td></tr>
                <tr><td>Instalado por :</td><td><input type="text" id="instalado" class="form-control input-sm chat-input"  /></td></tr>
                <tr><td>Empresa:</td><td><input type="text" id="empresa" class="form-control input-sm chat-input" /></td></tr>
                <tr><td>Area responsable:</td><td><input type="text" id="area" class="form-control input-sm chat-input"  /></td></tr>		
                <tr><td>Instrumento que influye en mediciones:</td><td><input type="text" id="instrumento2" class="form-control input-sm chat-input"  /></td></tr>	
                <tr><td>Distancia:</td><td><input type="text" id="distancia" class="form-control input-sm chat-input"  /></td></tr>											
                <tr><td>Grado de Interferencia :</td><td> <select name="cmbGradoInterferencia" id="cmbGradoInterferencia" class="form-control"></select> <td></tr>
                <tr><td>Tipo Superficie bajo el sensor :</td><td> <select name="cmbTipoSuperficie" id="cmbTipoSuperficie" class="form-control"></select> <td></tr>
                <tr><td>Tipo de Base  :</td><td> <select name="cmbTipoBase" id="cmbTipoBase" class="form-control"></select> <td></tr>
                <tr><td>Altura de Base/Soporte:</td><td><input type="text" id="altura" class="form-control input-sm chat-input"  /></td></tr>											
                <tr><td>Material:</td><td><input type="text" id="material" class="form-control input-sm chat-input"  /></td></tr>											
                <tr><td>Notas:</td><td><input type="text" id="notas" class="form-control input-sm chat-input"  /></td></tr>											
                <tr><td>Esquema de instalacion del sensor:</td><td><input type="text" id="esquema" class="form-control input-sm chat-input"  /></td></tr>											
               
               
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
		
	
	</script>
  </body>
</html>