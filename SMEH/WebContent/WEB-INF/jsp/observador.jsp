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

    <button class="btn btn-primary"
            onclick="location.href='/observador/nuevo'">Agregar observador</button>
    <div>
        <table id="estacion-table" class="display" cellspacing="0" width="100%">
            <thead>
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Dni</th>
                <th>Fecha Ingreso</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="observador" items="${observadores}">
                <tr>
                    <td>
                        ${observador.id}
                    </td>
                    <td>${observador.nombre}</td>
                    <td>${observador.dni}</td>
                    <td>${observador.fechaIngreso}</td>
                    <td>
                        <spring:url value="/estacion/${observador.id}/delete" var="deleteUrl" />
                        <spring:url value="/estacion/${observador.id}/update" var="updateUrl" />

                        <button class="btn btn-primary"
                                onclick="location.href='${updateUrl}'">Update</button>
                        <button class="btn btn-danger"
                                onclick="this.disabled=true;post('${deleteUrl}')">Delete</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

</div>
<script>
    $(document).ready(function() {
        $('#estacion-table').DataTable();
    } );
</script>
</body>
</html>