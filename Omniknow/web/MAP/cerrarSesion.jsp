<%--ESTA PÁGINA DURA UN SEGUNDO--%>

<%@page import="Sesion.Barra"%>
<%@page import="Sesion.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="../CSS/encabezado.css" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Icono de pestaña-->
        <link rel="icon" href="../Imagenes/Omniknow solo.png">
        <title>Cerrando sesión</title>
    </head>
    <body>
        <h1>Cerrando sesión</h1>
        <%
            request.setCharacterEncoding("UTF-8");
            HttpSession sesion=request.getSession();
            sesion.invalidate();
            HttpServletResponse resp=(HttpServletResponse)response;
            resp.sendRedirect("InicioSesion.jsp");
        
        %>
        <br>
        <a href="../index.html" target="_self">Cerrar</a>
    </body>
</html>
