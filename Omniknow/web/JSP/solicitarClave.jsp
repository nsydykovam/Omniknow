<%--ESTA PÁGINA DURA UN SEGUNDO--%>

<%@page import="Conexiones.Base"%>
<%@page import="Sesion.mail"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page import="javax.mail.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Solicitando clave</title>
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
            
            String maill = request.getParameter("txtM");
            String name = request.getParameter("txtN");
            String lastP = request.getParameter("txtL1");
            String lastM = request.getParameter("txtL2");

            try {
                sta.executeUpdate("USE OMNIKNOW;");
                cs = con.prepareCall("CALL CREAR_PENDIENTE(?,?,?,?)");
                cs.setString(1, name);
                cs.setString(2, lastP);
                cs.setString(3, lastM);
                cs.setString(4, maill);
                cs.execute();
                out.print("<script>alert('Te será enviado un correo cuando los entrenadores acepten tu solicitud');window.open('index.jsp','_self'); </script>");
            } catch (Exception e) {
                out.print("ERROR DOS:\n"+e.toString());
            }
        %>
    </body>
</html>
