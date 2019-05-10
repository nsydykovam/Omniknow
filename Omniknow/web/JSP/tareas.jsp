<%@page import="Conexiones.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList,java.util.Date"%>
<%@page import="java.sql.*,java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Tareas y soluciones</title>
        <!--Cosas para evitar trampas de regresos-->
         <%
            HttpSession sesion=request.getSession();
            HttpServletResponse resp=(HttpServletResponse)response;
            if(sesion.isNew()){
                resp.sendRedirect("index.jsp");
            }
         %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body onload="cActive()">
        <div id="wrapper">
            <%@include file="barraSuperior.jsp" %>
            <div id="main">
                <div id="particles-js" style=" background-color: rgba(255,255,255,0); position: fixed; width: 100%; height: 100%"></div>
                <article class="post">
                    <section>
                        <form action="respuestas.jsp" method="get" id="formTarea">
                            <%--
                            ESTO TAMBIÉN DEBE SER OCULTADO, es un text que sólo sirve para cargar
                            información al siguiente JSP, woo usaste mi idea, genial, por cierto le puse un hidden,
                            JAJAJAJAAJ nuria si ves esto yo tambien estoy flipando con nuestros yo's pasados
                            --%>
                            <input type="text" name="txtid" id="txtid" readonly style="visibility: hidden;">
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
                                    <th>Tarea</th>
                                    <th>Solución</th>
                                    <th>Fecha límite</th>
                                    <th>Estatus</th>
                                </tr>
                            <%
                                ArrayList hechoAL = new ArrayList();
                            
                            try {
                                s.executeUpdate("USE OMNIKNOW;");
                                rHecho = s.executeQuery("SELECT * FROM RESPUESTAS WHERE ID_PARTICIPANTE='"+sesion.getAttribute("id")+"'");
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
                                r = s.executeQuery("SELECT * FROM INFOS_TAREAS WHERE GRADO_TAREA = '"+sesion.getAttribute("grado")+"' AND DISPONIBLE = '1';");
                                if(r.next()) {
                                    do {
                                        String nombreTarea = r.getString("NOMBRE_PROBLEMA");
                                        String tarea = r.getString("ARCHIVO_PROBLEMA");
                                        String nombreSoluciones = r.getString("NOMBRE_SOLUCION");
                                        String fechaLimite = r.getString("FECHA_FINAL");
                                        String soluc = r.getString("ARCHIVO_SOLUCION");
                
                                        if(hechoAL.contains(r.getString("ID_TAREA")))
                                            hecho = "Enviada";
                                        else
                                            hecho = "No enviada";
                                        out.println("<tr>");
//                                        out.println("<td onClick='verCualTarea(this.id)' id='" + "id_Tarea" + "'>"+"Nombre tarea"+"</td>");
                                        Date hoy = new Date();
                                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                        Date limite = sdf.parse(fechaLimite);
                             %>
                                            <td><a href="../PDF/<%=tarea%>" target="_blank"> <%=tarea%> </a></td>
                            <%
                                            if(limite.before(hoy))
                                                out.println("<td onClick='verCualSolucion(this.id)' id='"+r.getString("ID_TAREA")+"'>"+"<a href='../PDF/"+soluc+"' target='_blank'> "+soluc+"  </a>"+"</td>");
                                            else
                                                out.println("<td>Solución no disponible</td>");
                            %>
                                            
                                            <!--<td><%//=nombreSoluciones%></td>-->
                                            <td><%=fechaLimite%></td>
                                            <td><%=hecho%></td>
                                        </tr>
                            <%
                                    } while(r.next());
                                }
                            }
                            catch(SQLException error) {
                                out.print("ERROR TRES:\n"+error.toString());
                            }
                        %>
                            </table>
                        </form>
                    </section>
                </article>
            </div>
            <section id="sidebar">
                <section id="intro">
                    <header>
                        <h2>Tareas y soluciones</h2>
                        <p>
                            Aquí podras ver todos los archivos de las tareas con sus respectivas soluciones
                        </p>
                    </header>
                </section>       
            </section>
        </div>
        <%@include file="links.jsp"%>
    </body>
</html>