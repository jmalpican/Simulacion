<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title></title>

    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap-theme.min.css">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

    <link href="https://cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Project name</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="#">Estaciones</a></li>
                    <li class="active"><a href="#">Observador</a></li>
                    <li><a href="#">Metadatos</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
    </nav>

    <spring:url value="/" var="home" />

    <form id="capacitacion-form" class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-2 control-label">Nombre del evento</label>
            <div class="col-sm-10">
                <input type="text" class="form-control"
                       id="nombre" />
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

    <div>
        <table id="capacitacion-table" class="display" cellspacing="0" width="100%">
            <thead>
            <tr>
                <th>Id</th>
                <th>Nombre del evento</th>
                <th>Fecha</th>
                <th>Lugar</th>
                <th>Diploma/Certificado</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="capacitacion" items="${capacitaciones}">
                <tr>
                    <td>
                        ${capacitacion.id}
                    </td>
                    <td>${capacitacion.nombre}</td>
                    <td>${capacitacion.fecha}</td>
                    <td>${capacitacion.lugar}</td>
                    <td>${capacitacion.certificado}</td>
                    <td>
                        <spring:url value="/observador/${observador.id}/del" var="deleteUrl" />

                        <button class="btn btn-danger"
                                onclick="this.disabled=true;post('${deleteUrl}')">Delete</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

</div>

<script src="http://code.jquery.com/jquery.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
<script>
    $(document).ready(function() {
        $('#capacitacion-table').DataTable();

        $("#capacitacion-form").submit(function(event) {

            enableAddButton(false);
            event.preventDefault();

            var capacitacion = {}
            capacitacion["nombre"] = $("#nombre").val();
            capacitacion["duracion"] = $("#duracion").val();
            capacitacion["lugar"] = $("#lugar").val();
            capacitacion["certificado"] = $("#certificado").val();
            capacitacion["organizador"] = $("#organizador").val();
            capacitacion["observacion"] = $("#observacion").val();

            $.ajax({
                type : "POST",
                contentType: "application/json; charset=utf-8",
                url : "${actionUrl}/api/capacitacion/create",
                data : JSON.stringify(capacitacion),
                dataType : 'json',
                timeout : 100000,
                success : function(data) {
                    console.log("SUCCESS: ", data);
//                    display(data);
                },
                error : function(e) {
                    console.log("ERROR: ", e);
                    display(e);
                },
                done : function(e) {
                    console.log("DONE");
                    enableAddButton(true);
                }
            });
        });
    } );

    function enableAddButton(flag) {
        $("#btn-add").prop("disabled", flag);
    }

</script>
</body>
</html>