<%@page import="Conexiones.Base"%>
<%@page import="Sesion.*" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*,java.io.*" %>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Selección de tarea</title>
        <!--Cosas para evitar trampas de regresos-->
         <%
            HttpSession sesion=request.getSession();
            HttpServletResponse resp=(HttpServletResponse)response;
            if(sesion.isNew()){
                resp.sendRedirect("index.jsp");
            }else{
         %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body >
        <div id="wrapper">
            <%@include file="barraSuperior.jsp" %>
            <div id="main">
                <div id="particles-js" style=" background-color: rgba(255,255,255,0); position: fixed; width: 100%; height: 100%"></div>
                <article class="post">
                    <form action="respuestas.jsp" method="post" id="formTarea">
                        <%--ESTO TAMBIÉN DEBE SER OCULTADO, deacuerdo, ocultado--%>
                        
                        <%
                            Base conexion = new Base();
        
                            Connection c = null;
                            Statement s = null;
                            ResultSet r = null;
                            ResultSet rHecho = null;
        
                            c = conexion.getConnection();
                            s = c.createStatement();
                        %>
                        <table >
                            <tr>
                                <th>Nombre de la tarea</th>
                                <th>Fecha límite</th>
                                <th>Estatus(click para enviar)</th>
                            </tr>
                        <%
                            ArrayList hechoAL = new ArrayList();
    
                        try {
                            s.executeUpdate("USE OMNIKNOW;");
                            rHecho = s.executeQuery("SELECT * FROM RESPUESTAS WHERE ID_PARTICIPANTE ='"+sesion.getAttribute("id")+"'");
                            if(rHecho.next()) {
                                do {
                                    hechoAL.add(rHecho.getString("ID_TAREA"));
                                } while(rHecho.next());
                            }
                        }
                        catch(SQLException error) {
                            out.print("ERROR DOS:\n"+error.toString());
                        }
    
                        try {
                            String hecho;
                            s.executeUpdate("USE OMNIKNOW;");
                            r = s.executeQuery("SELECT * FROM INFOS_TAREAS WHERE GRADO_TAREA = '"+sesion.getAttribute("grado") +"' AND FECHA_FINAL > CURDATE() AND DISPONIBLE = '1';");
                            int n = 0;
                            while(r.next()) 
                            {
                                String nombreTarea = r.getString("NOMBRE_PROBLEMA");
                                String fechaLimite = r.getString("FECHA_FINAL");
    
                                if(hechoAL.contains(r.getString("ID_TAREA")))
                                    hecho = "Enviada";
                                else
                                    hecho = "No enviada";

				int id = Integer.parseInt(r.getString("ID_TAREA") + "");
                                out.println("<tr onClick='verCual(" + id + ")'>" );
                        %>
                                    <td id="loco"><%=nombreTarea%></td>
                                    <td><%=fechaLimite%></td>
                                    <td><%=hecho%></td>
                                </tr>
                        <%
                            n++;
                            } 
                            if (n == 0) {
                                    out.print("<H2>No tienes tareas disponibles.</H2>");
                                }
                        }catch(SQLException error) {
                            out.print("ERROR TRES:\n"+error.toString());
                        }
                        %>
                        </table>
			<input type="text" name="txtid" id="txtid"  readonly style="visibility: hidden;"/>
                    </form>
                </article>
            </div>
            <section id="sidebar">
                <section id="intro">
                    <header>
                        <h2>Enviar respuestas</h2>
                        <p>
                            Selecciona la tarea para enviar tu respuesta
                        </p>
                    </header>
                </section>       
            </section>
        </div>
            <%}%>
            <%@include file="links.jsp"%>
    </body>
</html>