var tableObs;
var tableCap;
var SELECTOR_ERRORS = $('.error_box');

var pickerFechaIngreso = new Pikaday({
    field: document.getElementById('fechaIngreso'),
    firstDay: 1,
    format: 'DD-MM-YYYY'
});

$('#auto-obs').autocomplete({
    serviceUrl: '/SMEH/api/getEstacion',
    onSelect: function (suggestion) {
        if (tableObs) {
            tableObs.destroy();
        }
        resetForm();
        document.getElementById("idest").value = suggestion.data;
        populateObservador();
    }
});

$("#observador-form").submit(function(event) {
    // Prevent the form from submitting via the browser.
    event.preventDefault();

    $('#observador-form').parsley().validate();
    if (true === $('#observador-form').parsley().isValid()) {

        var observador = {}
        observador["id"] = $("#idobs").val();
        observador["estacionId"] = $("#idest").val();
        observador["nombre"] = $("#nombre").val();
        observador["dni"] = $("#dni").val();
        observador["fijo"] = $("#fijo").val() || "";
        observador["celular"] = $("#celular").val() || "";
        observador["direccion"] = $("#direccion").val() || "";
        observador["referencia"] = $("#referencia").val() || "";
        observador["mail"] = $("#mail").val() || "";
        observador["fechaIngreso"] = pickerFechaIngreso.toString('DD-MM-YYYY');

        $.ajax({
            type : "POST",
            url : "/SMEH/api/saveObservador",
            data : observador,
            dataType : 'json',
            timeout : 100000,
            success : function(data) {
                console.log("SUCCESS: ", data);
                resetForm();
                tableObs.ajax.reload();
                alert(data.message);
            },
            error : function(e) {
                console.log("ERROR: ", e);
            }
        });
    }

});

var populateObservador = function(){
    tableObs = $("#tblObservador").DataTable({
        ajax: {
            type : "GET",
            url : "/SMEH/api/getObservador/estacion/"+$("#idest").val(),
            dataSrc: ""
        },
        columns: [
            {data:'id', sClass: 'text-left'},
            {data:'nombre', sClass: 'text-left'},
            {data:'dni', sClass: 'text-left'},
            {
                data: null,
                className: "center",
                defaultContent: '<button type="button" class="btn btn-info">Capacitaciones</button>'
            }
        ],
        searching: false,
        bLengthChange: false
    });

    $('#tblObservador tbody').on( 'click', 'tr', function () {
        //console.log( tableObs.row( this ).data() );
        populateForm(tableObs.row( this ).data());
    } );

    $('#tblObservador tbody').on( 'click', 'button', function () {
        var data = tableObs.row( $(this).parents('tr') ).data();
        document.getElementById('titleModalCap').innerText = "Capacitaciones de " + data.nombre;
        document.getElementById("idobsModal").value = data.id;
        if (tableCap) {
            tableCap.destroy();
        }
        resetFormCapacitacion();
        populateCapacitacion(data.id);
        $('#divModificarCapacitacion').modal('show');
    });
}

var populateForm = function(data){
    console.log(data);
    document.getElementById("idobs").value = data.id;
    document.getElementById("nombre").value = data.nombre;
    document.getElementById("dni").value = data.dni;
    document.getElementById("fijo").value = data.celular || "";
    document.getElementById("celular").value = data.celular || "";
    document.getElementById("direccion").value = data.direccion || "";
    document.getElementById("referencia").value = data.referencia || "";
    pickerFechaIngreso.setDate(data.fechaIngreso);
}

var resetForm = function(){
    document.getElementById("idobs").value = "";
    document.getElementById("observador-form").reset();
    SELECTOR_ERRORS.css({ display: 'none' });
}

var destroyTable = function(){
    $("#tblObservador").DataTable().destroy();
}


/***********/


var populateCapacitacion = function(observadorId){
    tableCap = $("#tblCapacitacion").DataTable({
        ajax: {
            type : "GET",
            url : "/SMEH/api/getCapacitacion/observador/"+observadorId,
            dataSrc: ""
        },
        columns: [
            {data:'id', sClass: 'text-left'},
            {data:'duracion', sClass: 'text-left'},
            {data:'lugar', sClass: 'text-left'},
            {data:'certificado', sClass: 'text-left'},
            {
                data: null,
                className: "center",
                defaultContent: '<button type="button" class="btn btn-danger">Eliminar</button>'
            }
        ],
        searching: false,
        bLengthChange: false
    });

    $('#tblCapacitacion tbody').on( 'click', 'button', function () {
        var dataCap = tableCap.row( $(this).parents('tr') ).data();
        $.ajax({
            type : "DELETE",
            url : "/SMEH/api/capacitacion/"+dataCap.id,
            timeout : 100000,
            success : function(data) {
                console.log("SUCCESS: ", data);
                resetFormCapacitacion();
                tableCap.ajax.reload();
                alert(data.message);
            },
            error : function(e) {
                console.log("ERROR: ", e);
            }
        });
    });
}

$("#capacitacion-form").submit(function(event) {
    // Prevent the form from submitting via the browser.
    event.preventDefault();

    var capacitacion = {}
    capacitacion["observadorId"] = $("#idobsModal").val();
    capacitacion["nombre"] = $("#nombreEvento").val();
    capacitacion["duracion"] = $("#duracion").val() || "";
    capacitacion["lugar"] = $("#lugar").val() || "";
    capacitacion["certificado"] = $("#certificado").val() || "";
    capacitacion["organizador"] = $("#organizador").val() || "";
    capacitacion["observacion"] = $("#observacion").val() || "";

    $.ajax({
        type : "POST",
        url : "/SMEH/api/saveCapacitacion",
        data : capacitacion,
        dataType : 'json',
        timeout : 100000,
        success : function(data) {
            console.log("SUCCESS: ", data);
            resetFormCapacitacion();
            tableCap.ajax.reload();
            alert(data.message);
        },
        error : function(e) {
            console.log("ERROR: ", e);
        }
    });
});

var resetFormCapacitacion = function(){
    document.getElementById("capacitacion-form").reset();
}
