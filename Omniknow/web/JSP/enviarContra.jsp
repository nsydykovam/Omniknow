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
        <title>Recuperando contraseña</title>
    </head>
    <body>
        <%
            //CONEXIÓN A LA BASE - inicio
            Base conexion = new Base();
            
            Connection con = null;
            Statement sta = null;
            ResultSet res = null;
            
            con = conexion.getConnection();
            sta = con.createStatement();
            //CONEXIÓN A LA BASE - fin
            
            String usuario = request.getParameter("txtUsuario");
            String maill = "";
            String asunto = "Recuperación de contraseña OMDF";
            String cuerpo = "Tu contraseña es:     ";
            out.print(maill + "<br>" + asunto + "<br>" + cuerpo);
            
            try {
                sta.executeUpdate("USE OMNIKNOW;");
                res = sta.executeQuery("SELECT * FROM INFOS_PARTICIPANTES WHERE USUARIO='"+usuario+"';");
                Boolean j = res.next();
                if (j == true) 
                {
                    String cla= res.getString("CONTRASEÑA");
                    maill = res.getString("CORREO");
                    cuerpo = cuerpo + cla;
                    mail.enviar(maill, asunto, cuerpo);
                    out.print("<br>" + cuerpo + "<br>");
                    out.print("<script>alert('Te será enviada una clave.');window.open('index.jsp','_self'); </script>");
                }
                else
                {
                    out.print("<script>alert('No existe ese usuario.');window.open('index.jsp','_self'); </script>");
                }
            } catch (Exception e) {
                out.print("ERROR DOS:\n"+e.toString());
            }
            
        %>
    </body>
</html>
