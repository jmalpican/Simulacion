	<div class="panel panel-primary" align="center">
		<div class="panel-body padding-body">
            <div class="well">
                <p class="lead">Buscar estacion</p>
                <input type="text" name="estacion" id="auto-obs"/>
            </div>
		</div>

        <div>
            <h1>Observador</h1>
            <div class="error_box"></div>
            <form class="form-horizontal" id="observador-form">
                <input id="idest" type="hidden" />
                <input id="idobs" type="hidden" />
                <div class="form-group">
                    <label class="col-sm-3 col-sm-offset-2 control-label">Nombre</label>
                    <div class="col-sm-5">
                        <input path="nombre" type="text" class="form-control"
                                    id="nombre" required=""/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 col-sm-offset-2 control-label">Dni</label>
                    <div class="col-sm-5">
                        <input path="dni" type="text" class="form-control"
                                    id="dni" required=""/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 col-sm-offset-2 control-label">Celular</label>
                    <div class="col-sm-5">
                        <input path="celular" type="text" class="form-control"
                                    id="celular" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 col-sm-offset-2 control-label">Telefono fijo</label>
                    <div class="col-sm-5">
                        <input path="fijo" type="text" class="form-control"
                                    id="fijo" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 col-sm-offset-2 control-label">Fecha ingreso</label>
                    <div class="col-sm-5">
                        <input path="mail" type="text" class="form-control"
                               id="fechaIngreso" required=""/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 col-sm-offset-2 control-label">Direccion</label>
                    <div class="col-sm-5">
                        <input path="direccion" type="text" class="form-control"
                                    id="direccion" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 col-sm-offset-2 control-label">Referencia</label>
                    <div class="col-sm-5">
                        <input path="referencia" type="text" class="form-control"
                                    id="referencia" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 col-sm-offset-2 control-label">E-mail</label>
                    <div class="col-sm-5">
                        <input path="mail" type="text" class="form-control"
                                    id="mail" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-5 col-sm-3">
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

        <div class="modal fade" id="divModificarCapacitacion" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="titleModalCap"></h4>
                    </div>
                    <div class="modal-body">
                        <form id="capacitacion-form" class="form-horizontal">
                            <input id="idobsModal" type="hidden" />
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Nombre del evento</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control"
                                           id="nombreEvento" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Duracion</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control"
                                           id="duracion" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Lugar</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control"
                                           id="lugar" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Certificado/Diploma</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control"
                                           id="certificado" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Organizador</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control"
                                           id="organizador" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Observacion</label>
                                <div class="col-sm-10">
                                    <textarea class="form-control" id="observacion" ></textarea>
                                </div>
                            </div>
                            <button id="btn-add" class="btn btn-primary">Agregar capacitacion</button>
                        </form>

                        <table id="tblCapacitacion" class="display" cellspacing="0"
                           width="100%">
                        <thead>
                        <tr>
                            <th>Id</th>
                            <th>Duracion</th>
                            <th>Lugar</th>
                            <th>Certificado</th>
                            <th> - </th>
                        </tr>
                        </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
	</div>

