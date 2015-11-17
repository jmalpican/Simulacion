<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
                        <li class="active"><a href="#">Estaciones</a></li>
                        <li><a href="#">Observador</a></li>
                        <li><a href="#">Metadatos</a></li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div><!--/.container-fluid -->
        </nav>

        <div>
            <h1> Agregar nueva estación</h1>
            <spring:url value="/estacion/nuevo" var="estacionActionUrl" />
            <form:form class="form-horizontal" method="post"
                       modelAttribute="estacionForm" action="${estacionActionUrl}">
                <div class="form-group">
                    <label class="col-sm-2 control-label">Alias</label>
                    <div class="col-sm-10">
                    <form:input path="alias" type="text" class="form-control"
                                id="alias" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Nombre</label>
                    <div class="col-sm-10">
                    <form:input path="nombre" type="text" class="form-control"
                                id="nombre" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Codigo Senamhi</label>
                    <div class="col-sm-10">
                    <form:input path="codSenamhi" type="text" class="form-control"
                                id="codSenamhi" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">Guardar</button>
                    </div>
                </div>
            </form:form>
        </div>

    </div>
    <script>
        $(document).ready(function() {
            $('#estacion-table').DataTable();
        } );
    </script>
</body>
</html>
