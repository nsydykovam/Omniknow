<%@page import="Conexiones.Base"%>
<%@page import="Sesion.*" %>
<%@page import="java.sql.*,java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Resultados</title>
        <!--Cosas para evitar trampas de regresos-->
         <%
            HttpSession sesion=request.getSession();
            HttpServletResponse resp=(HttpServletResponse)response;
            if(sesion.isNew()){
            resp.sendRedirect("index.jsp");
            }else{
         %>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="barraSuperior.jsp"%>
            <div id="main">
                <div id="particles-js" style=" background-color: rgba(255,255,255,0); position: fixed; width: 100%; height: 100%"></div>
                <article class="post">
                    <table>
                        <tr>
                            <th>Pregunta</th>
                            <th>Puntuación</th>
                        </tr>   
                        <%
                            Base conexion = new Base();
                            
                            Connection c = null;
                            Statement s = null;
                            ResultSet r = null;
                            
                            c = conexion.getConnection();
                            s = c.createStatement();
                            
                            int[] puntajes = new int[6];
                            
                            try{
                                s.executeUpdate("USE OMNIKNOW");
                                r = s.executeQuery("SELECT * FROM RESPUESTAS_REVISADAS WHERE ID_TAREA ='"+Tarea.id+"' AND ID_PARTICIPANTE = '"+sesion.getAttribute("id")+"'");
                                r.next();
                            
                            
                                for(int i=1; i<6; i++) 
                                {
                                    puntajes[i-1] = Integer.parseInt(r.getString("REVISADA"+i));
                                }
                                puntajes[5] = Integer.parseInt(r.getString("TOTAL"));
                
                                for(int i=0; i<5; i++) 
                                {
                        %>
                                    <tr>
                                        <td>Respuesta <%=i+1%></td>
                                        <td>
                                            <%
                                                if(puntajes[i]==1) {
                                                    out.print("¡Correcta!");
                                                }
                                                else {
                                                    out.print("Incorrecta");
                                                }
                                            %>
                                        </td>
                                    </tr>
                          <% 
                                }
                            }
                            catch(SQLException e) {
                                e.toString();
                            }
                          %>
                    </table>
                    <br>
		    <a class="button" onClick="window.open('seleccionarTarea.jsp','_self')">OK</a>
                </article>
            </div>
            <section id="sidebar">
                <section id="intro">
                     <header>
                        <h2>RESULTADOS</h2>
                        <p>Total de respuestas correctas: <%=puntajes[5]%></p><br>
                        <p>Podrás ver las respuestas correctas cuando acabe el tiempo para enviar respuestas de esta tarea.</p>
                    </header>
                    
                </section>
            </section>
        </div>
        <%}%>
        <%@include file="links.jsp" %>
    </body>
</html>
