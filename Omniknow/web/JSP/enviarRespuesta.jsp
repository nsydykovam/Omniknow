<%--ESTA PÁGINA DURA UN SEGUNDO--%>
<%@page import="Conexiones.Base"%>
<%@page import="Sesion.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="../CSS/encabezado.css" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Enviando respuestas</title>
        <!--Icono de pestaña-->
        <link rel="icon" href="../Imagenes/Omniknow solo.png">
    </head>
    <body>
        <%
            //CONEXIÓN A LA BASE - inicio
            Base conexion = new Base();
            HttpSession sesion=request.getSession();
            Connection c = null;
            Statement s = null;
            CallableStatement cs = null;
            
            c = conexion.getConnection();
            s = c.createStatement();
            //CONEXIÓN A LA BASE - fin
            
            try {
                s.executeUpdate("USE OMNIKNOW;");
                String re1 = request.getParameter("latex1");
                String re2 = request.getParameter("latex2");
                String re3 = request.getParameter("latex3");
                String re4 = request.getParameter("latex4");
                String re5 = request.getParameter("latex5");
                
                cs = c.prepareCall("CALL ENVIAR_RESPUESTAS(?,?,?,?,?,?,?);");
                cs.setInt(1,Integer.parseInt(""+sesion.getAttribute("id")));
                cs.setInt(2,Tarea.id);
                cs.setString(3,re1);
                cs.setString(4,re2);
                cs.setString(5,re3);
                cs.setString(6,re4);
                cs.setString(7,re5);
                cs.execute();
//                s.executeUpdate("insert into respuestas value (null,'"+Usuario.participante_id+"','"+Tarea.id+"','"+re1+"','"+re2+"','"+re3+"','"+re4+"','"+re5+"',curdate())");
                out.println("<script>alert('Respuestas enviadas con éxito.')</script>");
            }
            catch(SQLException error) {
                out.print("ERROR DOS:\n"+error.toString());
            }
                        
            out.println("<script>window.open('correctoIncorrecto.jsp','_self')</script>");
        %>
    </body>
</html>
