<%--ESTA PÁGINA DURA UN SEGUNDO--%>

<%@page import="Sesion.*" %>
<%@page import="Conexiones.*" %>
<%@page import="java.sql.*,java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciando sesión</title>
        <!--Archivo CSS-->
        <link rel="stylesheet" href="../CSS/encabezado.css" type="text/css"/>
        <link rel="stylesheet" href="../CSS/vModales.css" type="text/css"/>
        <!--Icono de pestaña-->
        <link rel="icon" href="../Imagenes/Omniknow solo.png">
        <!--Archivo JS-->
        <script src="../JS/validaciones.js"></script>
        <script src="../JS/alerts.js"></script>
    </head>
    <body>
        <!--Aquí se busca un usuario y contraseña que coincidan-->
        <%
            String usuarioInicio = request.getParameter("usuarioInicio");
            String contrasenaInicio = request.getParameter("contrasenaInicio");
            
            HttpSession sesion = request.getSession();
            out.print(Guardar.iniciarSesion(usuarioInicio, contrasenaInicio, sesion));
        %>
        <br>
    </body>
</html>
