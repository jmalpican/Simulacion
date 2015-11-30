<div class="panel panel-primary" align="center">
		<div class="panel-body padding-body">
			<div class="modal-body">
		  <table id="tblMontaje" class="display" cellspacing="0" width="50%">
		        <tr><td>Instrumento/Sensor :</td><td><input type="text" id="instrumento" class="form-control input-sm chat-input"/></td></tr>
                <tr><td>Fecha de Instalaci�n:</td><td><input type="text" id="fechaIni" class="form-control input-sm chat-input" /></td></tr>
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
					<button class="btn btn-primary" id="btnGuardar-se">Guardar</button>
					<button class="btn btn btn-default" id="btnLimpiar-se">Limpiar</button>
				</div>
	</div>

<script src="http://code.jquery.com/jquery.js"></script>
<script src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>

<script>
	$(document).ready(function() {

		var cmbGradoInterferencia=null;
		var cmbTipoSuperficie=null;
		var cmbTipoBase=null;

		var instrumento = $("#instrumento");
		var fechaIni = $("#fechaIni");
		var instalado = $("#instalado");
		var empresa	= $("#empresa");
		var area = $("#area");
		var distancia = $("#distancia");
		var altura = $("#altura");
		var material = $("#material");
		var notas = $("#notas");
		var esquema = $("#esquema");

		cmbGradoInterferencia = $("#cmbGradoInterferencia");
		var lstGradoInterferencia = ${lstGradoInterferencia};
		cmbGradoInterferencia.append($("<option></option>").attr("value","000").text("Seleccionar"));
		$.each(lstGradoInterferencia, function(i, item) {
			cmbGradoInterferencia.append($("<option></option>").attr("value",lstGradoInterferencia[i].codigo).text(lstGradoInterferencia[i].descripcion));
		});

		cmbTipoSuperficie = $("#cmbTipoSuperficie");
		var lstTipoSurperficie = ${lstTipoSurperficie};
		cmbTipoSuperficie.append($("<option></option>").attr("value","000").text("Seleccionar"));
		$.each(lstTipoSurperficie, function(i, item) {
			cmbTipoSuperficie.append($("<option></option>").attr("value",lstTipoSurperficie[i].codigo).text(lstTipoSurperficie[i].descripcion));
		});

		cmbTipoBase = $("#cmbTipoBase");
		var lstTipoBase = ${lstTipoBase};
		cmbTipoBase.append($("<option></option>").attr("value","000").text("Seleccionar"));
		$.each(lstTipoBase, function(i, item) {
			cmbTipoBase.append($("<option></option>").attr("value",lstTipoBase[i].codigo).text(lstTipoBase[i].descripcion));
		});

		limpiarForm();

		$("#btnGuardar-se").bind("click",function(event) {
			$.ajax({
				url: "/SMEH/registrarSensor",
				type: "POST",
				dataType: "json",
				async : false,
				cache : false,
				data : {
					instrumento  : instrumento.val(),
					fechaIni  :  fechaIni.val(),
					instalado  : instalado.val(),
					empresa  : empresa.val(),
					area	 : area.val(),
					distancia :distancia.val(),
					material  :material.val(),
					notas  : notas.val(),
					altura : altura.val(),
					esquema : esquema.val(),
					gradoInterferencia  : cmbGradoInterferencia.val(),
					tipoSuperficie  : cmbTipoSuperficie.val(),
					tipoBase  : cmbTipoBase.val()
				}
			}).done(function(paramJson) {
				if(paramJson=="1"){
					alert("Ingreso exitoso.");
				}
				else{
					alert("Datos no se ingresaron");
				}
				limpiarForm();
			}).fail(function( jqXHR, textStatus, errorThrown ) {
				alert("Datos no grabados");
			});

		});

		$("#btnLimpiar-se").bind("click",function(event) {
			limpiarForm();
		});

		function limpiarForm(){
			instrumento.val('');
			fechaIni.val('');
			instalado.val('');
			empresa.val('');
			area.val('');
			distancia.val('');
			altura.val('');
			material.val('');
			notas.val('');
			esquema.val('');

			cmbTipoBase.prop('selectedIndex', "000");
			cmbGradoInterferencia.prop('selectedIndex', "000");
			cmbTipoSuperficie.prop('selectedIndex', "000");
		}

	});

</script>