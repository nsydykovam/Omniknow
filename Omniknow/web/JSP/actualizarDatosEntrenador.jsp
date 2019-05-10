<%--ESTA PÁGINA DURA UN SEGUNDO--%>

<%@page import="Conexiones.Base"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //CONEXIÓN A LA BASE - inicio
            Base conexion = new Base();
            
            Connection con = null;
            Statement sta = null;
            CallableStatement cs = null;
            
            con = conexion.getConnection();
            sta = con.createStatement();
            //CONEXIÓN A LA BASE - fin
            
            String usuario = request.getParameter("txtUsuario");
            String pass = request.getParameter("txtPassNew1");
            String claveM = request.getParameter("txtClaveMaestra");
            
            try {
                sta.executeUpdate("USE OMNIKNOW;");
                cs = con.prepareCall("CALL CAMBIAR_ENTRENADOR(?,?,?);");
                cs.setString(1,usuario);
                cs.setString(2,pass);
                cs.setString(3,claveM);
                cs.execute();
                
                out.print("<script>alert('Datos Cambiados'); window.open('opcionesSesion.jsp','_self');</script>");
            } catch (Exception e) {
                out.print("ERROR DOS:\n" + e.toString());
            }
        
        %>
    </body>
</html>
