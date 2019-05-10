/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* global txtUsuario, txtClaveMaestra, txtPass1, txtPass2, txtPassNew2, txtPassNew1 */

function validar()
{
    var vf = false;
    if (txtUsuario.value === "") 
    {
        alert("Completa tu usuario");
        txtUsuario.focus();
    }
    else
    if (txtClaveMaestra.value === "") 
    {
        alert("Completa la clave");
        txtClaveMaestra.focus();
    }
    else
    if (txtPassNew1.value === "") 
    {
        alert("Completa tu contraseña;");
        txtPassNew1.focus();
    }
    else
    if (txtPassNew2.value === "") 
    {
        alert("Vuelve a escribir tu contraseña;");
        txtPassNew2.focus();
    }
    else
    if (txtPassNew2.value !== txtPassNew1.value) 
    {
        alert("Las contraseñas no coinciden");
        txtPassNew1.focus();
    }
    else
    {
        vf = confirm("¿Estás seguro?");
    }
    if (vf === true) return true;
    else return false;
}
