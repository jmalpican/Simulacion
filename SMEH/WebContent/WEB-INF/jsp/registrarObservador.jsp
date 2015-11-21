	<div class="panel panel-primary" align="center">
		<div class="panel-body padding-body">
            <input type="text" name="estacion" id="auto-obs"/>
		</div>

        <div>
            <h1>Observador</h1>
            <form class="form-horizontal" id="observador-form">
                <input id="idest" type="hidden" />
                <input id="idobs" type="hidden" />
                <div class="form-group">
                    <label class="col-sm-2 control-label">Nombre</label>
                    <div class="col-sm-10">
                        <input path="nombre" type="text" class="form-control"
                                    id="nombre" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Dni</label>
                    <div class="col-sm-10">
                        <input path="dni" type="text" class="form-control"
                                    id="dni" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Celular</label>
                    <div class="col-sm-10">
                        <input path="celular" type="text" class="form-control"
                                    id="celular" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Telefono fijo</label>
                    <div class="col-sm-10">
                        <input path="fijo" type="text" class="form-control"
                                    id="fijo" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Direccion</label>
                    <div class="col-sm-10">
                        <input path="direccion" type="text" class="form-control"
                                    id="direccion" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Referencia</label>
                    <div class="col-sm-10">
                        <input path="referencia" type="text" class="form-control"
                                    id="referencia" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">E-mail</label>
                    <div class="col-sm-10">
                        <input path="mail" type="text" class="form-control"
                                    id="mail" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="button" class="btn btn-default" onclick="resetForm()">Nuevo</button>
                        <button type="submit" class="btn btn-default">Guardar</button>
                    </div>
                </div>
            </form>
        </div>

        <div class="table-responsive">
            <table id="tblObservador" class="display" cellspacing="0"
                   width="100%">
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Dni</th>
                    <th> - </th>
                </tr>
                </thead>
            </table>
        </div>

	</div>

