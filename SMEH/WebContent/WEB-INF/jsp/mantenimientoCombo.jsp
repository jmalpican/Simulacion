	<div class="panel panel-primary" style="margin-top: 5px;margin-bottom: 10px;min-width:200px">
		<div class="panel-heading">
			<h3 class="panel-title">Mantenimiento Combos</h3>
		</div>
		<div class="panel-body">
			<form class="form-horizontal">
				<div class="form-group">
					<label  class="col-md-2 control-label">Tabla:</label>
					<div class="col-md-7">
						<select name="cmbTablaCombo" id="cmbTablaCombo" class="form-control"></select>
					</div>
					<div class="col-md-3">
						<button type="button" class="btn btn-primary" id="btnTablaCombo">Crear Tabla</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	
	<div class="panel panel-primary" align="center">
		<div class="panel-body padding-body">
			<div align="left">
				<button type="button" class="btn btn-primary" id="btnAddComboDesc">Agregar descripcion</button>
			</div>
			<div class="table-responsive">
				<table id="tblCombo" class="display" cellspacing="0"
					width="100%">
					<thead>
						<tr>
							<th>codigo</th>
							<th>descripcion</th>
							<th>Modificar</th>
							<th>Eliminar</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
	