/* global txtUsuarioInicio, txtContrasenaInicio */


function entrar() {
    
    if (txtUsuarioInicio.value === "") {
        alert("Completa tu usuario");
        txtUsuarioInicio.focus();
        event.returnValue = false;
        
    }
    else
    if (txtContrasenaInicio.value === "") {
        alert("Completa tu contraseña");
        txtContrasenaInicio.focus();
        event.returnValue = false;
    }
}