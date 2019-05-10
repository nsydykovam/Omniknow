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
			Base conexion = new Base();
            HttpSession sesion=request.getSession();
            Connection c = null;
            Statement s = null;
            ResultSet r1 = null;
            
	    
            c = conexion.getConnection();
            s = c.createStatement();
            r1 = s.executeQuery("select * from respuestasFaqs inner join faqs on respuestasFaqs.id_faq = faqs.id_faq;");
            while(r1.next()){
                String pregunta = r1.getString("pregunta");
                String respuesta = r1.getString("respuesta");
	    
		    %>
                    <article class="post">
                        <header>
                            <div class="title">
                                <h2><a href=""><%=pregunta%></a></h2>
                            </div>
                        </header>
			    <p><%=respuesta%></p>
                    </article>
	    <%}%>
                </div>
                <section id="sidebar">
                    <section id="intro">
                        <h2>Foro de preguntas</h2>
                    </section>
                    <!-- About -->
                    <section class="blurb">
                        <h2>About</h2>
                        <p>
                            Joinders es una empresa desarrolladora de software comprometida con su trabajo.
                        </p>
                        <ul class="actions">
                            <li><a href="quienesSomos.jsp" class="button ">Acerca de nosotros</a></li>
                        </ul>
                        <ul class="actions">
                             <%
                                HttpSession ses = request.getSession();
                                if( !(ses.getAttribute("grado") == null || ses.getAttribute("grado").toString().equals("")) && !ses.getAttribute("grado").toString().equals("7") )
                                {
                            %>
                            <li><a href="crearTicket.jsp" class="button ">¿Tienes otro problema? contáctanos</a></li>
                            
                            
                            <%
                                }
                            
                            %>
                        </ul>
                    </section>
                </section>
               
            </div>
        <%@include file="links.jsp" %>
    </body>
</html>




