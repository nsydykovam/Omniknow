/* global txtNombrePart, txtApellidoPPart, txtApellidoMPart, txtCorreoPart, txtUsuarioPart, txtContraPart, comboGrado, txtEscuelaPart, comboNivel, txtContraPart2 */
//Enviar toda la información al JSP (registrarUsuario.jsp) que pedirá la clave a la persona que desee registrarse
function enviar() {
    var vf=false;
    if (txtNombrePart.value === ""){
        mostrarMsj("Escribe tu nombre");
    }
    else{
    if (txtApellidoPPart.value === "") 
        mostrarMsj("Escribe tu apellido paterno");
    else
    if (txtApellidoMPart.value === "") 
        mostrarMsj("Escribe tu apellido materno");
    else
    if (txtEscuelaPart.value === "") 
        mostrarMsj("Escribe tu escuela");
    else
    if (txtCorreoPart.value === "") 
        mostrarMsj("Escribe tu correo");
    else
    if (txtCorreoPart.value.indexOf('@') === -1 || txtCorreoPart.value.indexOf('.') === -1) 
        mostrarMsj("Correo incorrecto");
    else
    if (txtUsuarioPart.value === "") 
        mostrarMsj("Escribe tu usuario");
    else
    if (txtContraPart.value === "") 
        mostrarMsj("Escribe tu contraseña");
    else
    if (txtContraPart2.value === "") 
        mostrarMsj("Vuelve a escribir tu contraseña");
    else
    if (txtContraPart.value !== txtContraPart2.value ) 
        mostrarMsj("Las contraseñas no coinciden");
    else
    if (comboNivel.selectedIndex === 0) 
        mostrarMsj("Selecciona tu nivel");
    else
    if (comboGrado.selectedIndex === 0) 
        mostrarMsj("Selecciona tu grado");
    else 
        vf = confirm("¿Estás seguro?");
    }
    if(vf===true)
            return true;
        else return false;
}

function cambiarCombo(combo1)
{
    var combo2 = document.getElementById("comboGrado");
    var pos = combo1.selectedIndex;
    for (var i = 0, max = 30; i < max; i++) 
    {
        combo2.options[1] = null;
    }
    for (var i = 0, max = 3; i < max; i++) 
    {
        if (pos === 2) 
            combo2.options[i+1] = new Option(""+(i+1));
        else
            combo2.options[i+1] = new Option(""+(i+4));
    }
}


//Vacía todos los campos
function limpiar() {
    txtNombrePart.value="";
    txtApellidoPPart.value="";
    txtApellidoMPart.value="";
    txtEscuelaPart.value="";
    txtCorreoPart.value="";
    txtUsuarioPart.value="";
    txtContraPart.value="";
    comboGrado.selectedIndex = 0;
    comboNivel.selectedIndex = 0;
}

function mostrarMsj(textoMensaje) {
    alert(textoMensaje);
    cliick2();
}
function cliick2() {
    if (txtNombrePart.value === "") 
        txtNombrePart.focus();
    else
    if (txtApellidoPPart.value === "") 
        txtApellidoPPart.focus();
    else
    if (txtApellidoMPart.value === "") 
        txtApellidoMPart.focus();
    else
    if (txtEscuelaPart.value === "") 
        txtEscuelaPart.focus();
    else
    if (txtCorreoPart.value === "") 
        txtCorreoPart.focus();
    else
    if (txtCorreoPart.value.indexOf('@') === -1 || txtCorreoPart.value.indexOf('.') === -1) 
        txtCorreoPart.focus();
    else
    if (txtUsuarioPart.value === "") 
        txtUsuarioPart.focus();
    else
    if (txtContraPart.value === "") 
        txtContraPart.focus();
    else
    if (txtContraPart2.value === "") 
        txtContraPart2.focus();
    else
    if (txtContraPart.value !== txtContraPart2.value ) 
        txtContraPart2.focus();
    else
    if (comboNivel.selectedIndex === 0) 
        comboNivel.focus();
    else
    if (comboGrado.selectedIndex === 0) 
        comboGrado.focus();
}



//para cambiar datos

