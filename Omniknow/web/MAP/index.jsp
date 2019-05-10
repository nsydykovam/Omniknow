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
            <%@include file="barraSuperior.jsp"%>
                <div id="main">
                    <article class="post">
                        <header>
                            <div class="title">
                                <a href="" class="image featured"><img src="../Imagenes/LogoOMDF.png" /></a>
                                <h2><a href="single.html">Omniknow</a></h2>
                                <p>En omniknow puedes resolver las tareas que te deje tu entrenador de una manera eficiente</p>
                            </div>
                        </header>

                    </article>
                </div>
                <section id="sidebar">
                   
                    <!-- Posts List -->
                   

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




