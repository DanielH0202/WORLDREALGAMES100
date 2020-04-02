$(document).ready(function(){
    $('.textBox').val("");
    
    $('#btnCancelar').click(function(){
        history.back();
    });
    
    $('#btnGuardar').click(function(){
        validarDatos();
    });
});

function validarDatos(){
    var email1 = $('#txtEmail').val();
    var email2 = $('#txtConfirEmail').val();
    var pass = $('#txtPass').val();
    
    if(email1 == ""){
        alert("El campo email no puede estar vacío");
        $('#txtEmail').focus();
    }
    else if(email2 == ""){
        alert("El campo confirmar email no puede estar vacío");
        $('#txtConfirEmail').focus();
    }
    else if(pass == ""){
        alert("El campo contraseña no puede estar vacío");
        $('#txtPass').focus();
    }
    else{
        if(email1 == email2){
            $('#frmModificarEmail').submit();
        }
        else{
            alert("Los correos electrónicos no son iguales");
            $('#txtConfirEmail').val("");
            $('#txtConfirEmail').focus();
        }
    }
}