$('#auto-obs').autocomplete({
    serviceUrl: '/api/getEstacion',
    onSelect: function (suggestion) {
        document.getElementById("idest").value = suggestion.data;
        searchObservadores(suggestion.data);
    }
});

$("#observador-form").submit(function(event) {
    // Prevent the form from submitting via the browser.
    event.preventDefault();

    var observador = {}
    observador["id"] = $("#idobs").val();
    observador["estacion_id"] = $("#idest").val();
    observador["nombre"] = $("#nombre").val();
    observador["dni"] = $("#dni").val();
    observador["fijo"] = $("#fijo").val();
    observador["celular"] = $("#celular").val();
    observador["direccion"] = $("#direccion").val();
    observador["referencia"] = $("#referencia").val();

    $.ajax({
        type : "POST",
        url : "/api/saveObservador",
        data : observador,
        dataType : 'json',
        timeout : 100000,
        success : function(data) {
            console.log("SUCCESS: ", data);
            resetForm();
            destroyTable();
            searchObservadores($("#idest").val());
            alert(data.message);
        },
        error : function(e) {
            console.log("ERROR: ", e);
        }
    });
});

var searchObservadores = function(estacionId) {
    $.ajax({
        type : "GET",
        url : "/api/getObservador/estacion/"+estacionId,
        dataType : 'json',
        timeout : 100000,
        success : function(data) {
            console.log("SUCCESS: ", data);
            populateObservador(data);
        },
        error : function(e) {
            console.log("ERROR: ", e);
        }
    });
}

var populateObservador = function(data){
    var table = $("#tblObservador").DataTable({
        data:data,
        columns: [
            {data:'id', sClass: 'text-left'},
            {data:'nombre', sClass: 'text-left'},
            {data:'dni', sClass: 'text-left'},
            {data:'fechaIngreso', sClass: 'text-center'}
        ],
        searching: false,
        bLengthChange: false
    });

    $('#tblObservador tbody').on( 'click', 'tr', function () {
        console.log( table.row( this ).data() );
        populateForm(table.row( this ).data());
    } );
}

var populateForm = function(data){
    document.getElementById("idobs").value = data.id;
    document.getElementById("nombre").value = data.nombre;
    document.getElementById("dni").value = data.dni;
    document.getElementById("fijo").value = data.celular || "";
    document.getElementById("celular").value = data.celular || "";
    document.getElementById("direccion").value = data.direccion || "";
    document.getElementById("referencia").value = data.referencia || "";
}

var resetForm = function(){
    document.getElementById("idobs").value = "";
    document.getElementById("observador-form").reset();
}

var destroyTable = function(){
    $("#tblObservador").DataTable().destroy();
}