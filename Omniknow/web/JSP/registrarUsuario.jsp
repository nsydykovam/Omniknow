<%--ESTA PÁGINA DURA UN SEGUNDO--%>

<%@page import="Conexiones.*"%>
<%@page import="java.sql.*,java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registrando usuario</title>
        <!--Icono de pestaña-->
        <link rel="icon" href="../Imagenes/Omniknow solo.png">
        <!--Archivo CSS-->
        <link rel="stylesheet" type="text/css" href="">
        <link rel="stylesheet" href="../CSS/encabezado.css" type="text/css"/>
        <!--Archivo JS-->
        <script src="registroUsuario.js"></script>     
    </head>
    <body onload="cActive()">
        <h2>Registro de usuario</h2>
        <!--Aquí se busca la clave en la base de datos y si existe lo que puso el estudiante, se hace el registro-->
        <%
            //Datos que envía el usuario
            String nom = request.getParameter("nombreParticipante");
            String ape1 = request.getParameter("apellidoPParticipante");
            String ape2 = request.getParameter("apellidoMParticipante");
            int gra = Integer.parseInt(request.getParameter("gradoParticipante"));
            String esc = request.getParameter("escuelaParticipante");
            String cor = request.getParameter("correoParticipante");
            String usu = request.getParameter("usuarioParticipante");
            String con = request.getParameter("contrasenaParticipante");
            String clave = request.getParameter("claveParticipante");

            out.print(Guardar.registrarUsuario(nom, ape1, ape2, gra, esc, cor, usu, con, clave));
        %>
        <br>
        <a href="registroUsuario.jsp" target="_self">Volver</a>
    </body>
</html>
