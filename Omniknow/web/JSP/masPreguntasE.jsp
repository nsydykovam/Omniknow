<%-- 
    Document   : index
    Created on : 7/05/2018, 11:34:15 AM
    Author     : Alumno
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Conexiones.Base"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="Controlador.FAQS"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--        <link rel="icon" href="../Imagenes/Omniknow solo.png">
                <link rel="stylesheet" href="../CSS/encabezado.css" type="text/css"/>
                <link rel="stylesheet" type="text/css" href="../CSS/vModales.css">-->
        <!--Archivo CSS-->
        <!--<link rel="stylesheet" type="text/css" href="../CSS/encabezado.css">-->
        <title>Inicio</title>
        
        <!--<script src="JSBarra.js"></script>-->
    </head>
    <body>
           
        <!-- particles.js container -->
        <div id="wrapper" class="panel" style="z-index: 1;">
            
                <%@include file="barraSuperior.jsp" %>
                <div id="main">
                        <article class="post">
                            <header>
                                <div class="title">
                                    <h2><a href="single.html">Escribe tu pregunta</a></h2>
                                </div>
                            </header>
                            <form action="FAQS.jsp" method="post">
                                <textarea placeholder="Escribe tu pregunta" name="textoPregunta"></textarea>
                            
                                        <input type="submit" class="button large" name="btnOK">
                            </form>
                        </article>
<%
            //CONEXIÓN A LA BASE - inicio
            Base conexion = new Base();
            HttpSession sesion=request.getSession();
            Connection c = null;
            Statement s = null;
            ResultSet r = null;
            
            c = conexion.getConnection();
            s = c.createStatement();
            r = s.executeQuery("select * from faqs where contestada=0 order by id_faq desc;");
//            r = s.executeQuery("select * from contestada order by id_faq desc where id_fa;");
            int i = 0;
            while(r.next()){
                
                int id = r.getInt("id_faq");
                String pregunta = r.getString("pregunta");
%>

                    <article class="post">
                        <header>
                            <div class="title">
                                <h2><a><%=pregunta%></a></h2>
                            </div>
                            <div class="meta">
                                <input type="submit" value="Responder" onclick="poner(<%=i%>)"/>
                            </div>
                        </header>
                                <div id="<%=i%>" style="display: none">
                                <form action="hacerFAQ.jsp">
                                    <textarea name="respuestaFAQ" placeholder="Escribe la respuesta a la pregunta"></textarea>
                                    <input type="hidden" value="<%=id%>" name="elID"/>
                                    <input type="submit" name="hacerFAQ" value="Hacer frecuente"/>
                                    <input type="submit" name="responder" value="Responder"/>
                                </form>
                            </div>
                    </article>
<%          i++;}
%>
                </div>
                <section id="sidebar">
                    <!-- About -->
                    <section class="blurb">
                        <h2>About</h2>
                        <p>
                            Joinders es una empresa desarrolladora de software comprometida con su trabajo.
                        </p>
                        <ul class="actions">
                            <li><a href="quienesSomos.jsp" class="button ">Acerca de nosotros</a></li>
                        </ul>
                    </section>
                </section>
               
            </div>
        <%@include file="links.jsp" %>
    </body>
</html>




