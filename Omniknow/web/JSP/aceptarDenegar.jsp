<%--ESTA PÁGINA DURA UN SEGUNDO--%>
<%@page import="Conexiones.Base"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="java.sql.*"%>
<%@page import="Sesion.mail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Respondiendo solicitud</title>
    </head>
    <body>
        <%
            int id = Integer.parseInt(request.getParameter("txtID"));
            int tipo = Integer.parseInt(request.getParameter("txtTipo"));
            out.print(id + "===" + tipo);
            String asunto = "", cuerpo = "", mail = "";
            
            //CONEXIÓN A LA BASE - inicio
            Base conexion = new Base();
            
            Connection con = null;
            Statement sta = null;
            ResultSet res = null;
            CallableStatement cs = null;
            
            con = conexion.getConnection();
            sta = con.createStatement();
            //CONEXIÓN A LA BASE - fin
            
            try {
                sta.executeUpdate("USE OMNIKNOW;");
                res = sta.executeQuery("SELECT * FROM INFOS_PENDIENTES WHERE ID_PENDIENTE = '"+id+"';");
                res.next();
                String name = res.getString("NOMBRE");
                mail = res.getString("CORREO");
                asunto = "Respuesta solicitud de clave de OMNIKNOW";
                res = sta.executeQuery("SELECT * FROM ENTRENADORES;");
                res.next();
                String clave = res.getString("CLAVE_MAESTRA");
                if(tipo == 1)
                {
                    cuerpo = "Hola, "+name+", la clave para completar tu registro es: "+clave;

        %>
        <script>
            alert("Alumno aceptado");
        </script>
        <%
                }
                else
                {
                    cuerpo = "Lo sentimos, parece que no eres preseleccionado, por lo tanto no puedes registrarte.";//despues hayq ue cambiar esto, listo, cambiado!
        %>
        <script>
            alert("Alumno rechazado");
        </script>
        <%
                }
                mail m = new mail();
                m.enviar(mail,asunto,cuerpo);
//                sta.executeUpdate("delete from pendientes where idPendiente = '" + id + "';");
                cs = con.prepareCall("CALL BORRAR_PENDIENTE(?)");
                cs.setInt(1, id);
                cs.execute();
            } catch (Exception e) {
                out.print("ERROR DOS:\n"+e.toString());
            }
        
        %>
        <script>
            window.open('aceptarParticipantes.jsp','_self');
        </script>
    </body>
</html>
