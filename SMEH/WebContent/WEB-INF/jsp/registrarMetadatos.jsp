	<div class="panel panel-primary" align="center">
		<div class="panel-body padding-body">
			<div class="table-responsive">
				<table id="tblRegistroMetadatos" class="display" cellspacing="0"
					width="100%">
					<thead>
						<tr>
							<th>Fecha</th>
							<th>Responsable</th>
							<th>Documento de autorizacion</th>
							<th>Motivo</th>
							<th>Modificar</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
	
		<div class="modal fade" id="divModificarMetadata" tabindex="-1" role="dialog" aria-labelledby="h4ModalLabel02">
		<div class="modal-dialog" role="document">
			<div class="modal-content"  id="divModalContenido02" >
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Cerrar"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="h4ModalLabel02">Actualizar Registro de Metadatos</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">


					<div class="form-group">
						<label for="cmb101" class="col-md-4 control-label">Fecha:</label>
						<div class="col-md-8">
							<input type="text" class="form-control" id="txtFecha" placeholder="">
						</div>
					</div>

					<div class="form-group">
						<label for="cmb101" class="col-md-4 control-label">Documento autorizado:</label>
						<div class="col-md-8">
							<input type="text" class="form-control" id="txtDocuAuto" placeholder="" style="width: 45%; display: inline;">
						</div>
					</div>



					<div class="form-group">
						<label  class="col-md-4 control-label">Responsable:</label>
						<div class="col-md-8">
							<select name="cmbResponsable" id="cmbResponsable" class="form-control"></select>
						</div>
					</div>

					
					
					<div class="form-group">
						<label class="col-md-4 control-label">Motivo:</label>
						<div class="col-md-8">
							<select name="cmbMotivo" id="cmbMotivo" class="form-control"></select>
						</div>
					</div>


					</form>


					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btnModal02Actua">Actualizar</button>
					<button type="button" class="btn btn-default" id="btnModal02Cancel">Cancelar</button>
				</div>
			</div>
		</div>
	</div>
