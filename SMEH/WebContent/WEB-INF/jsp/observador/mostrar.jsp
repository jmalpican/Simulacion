<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <div>
        <h1>Observador Detalle</h1>
        <br />

        <div class="row">
            <label class="col-sm-2">ID</label>
            <div class="col-sm-10">${observador.id}</div>
        </div>

        <div class="row">
            <label class="col-sm-2">Nombre</label>
            <div class="col-sm-10">${observador.nombre}</div>
        </div>

        <div class="row">
            <label class="col-sm-2">Dni</label>
            <div class="col-sm-10">${observador.dni}</div>
        </div>

        <div class="row">
            <label class="col-sm-2">Telefono Fijo</label>
            <div class="col-sm-10">${observador.fijo}</div>
        </div>

        <div class="row">
            <label class="col-sm-2">Direccion</label>
            <div class="col-sm-10">${observador.direccion}</div>
        </div>

        <div class="row">
            <label class="col-sm-2">Referencia</label>
            <div class="col-sm-10">${observador.referencia}</div>
        </div>

        <div class="row">
            <label class="col-sm-2">E-mail</label>
            <div class="col-sm-10">${observador.mail}</div>
        </div>

    </div>

</div>
</body>
</html>