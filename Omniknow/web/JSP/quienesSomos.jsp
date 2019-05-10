<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Sesion.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>¿Quiénes somos?</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body onload="cActive()">
        <div id="wrapper">
            <%@include file="barraSuperior.jsp" %>  
            <div id="main">
                <div id="particles-js" style=" background-color: rgba(255,255,255,0); position: fixed; width: 100%; height: 100%"></div>
                <article class="post">
                    <header>
                        <div class="title">
                            <h2><a href="single.html">Misión</a></h2>
                        </div>
                    </header>
                    <a href="single.html" class="image featured"><img src="images/pic03.jpg" alt="" /></a>
                    <p>
                        Nix desarrolla software específico a las necesidades del cliente y con 
                        aplicación web segura y escalable, optimizando recursos haciendo más 
                        eficientes las actividades, realizado por jóvenes emprendedores y comprometidos 
                        con su profesión. 
                    </p>
                </article>
                <article class="post">
                    <header>
                        <div class="title">
                            <h2><a href="single.html">Visión</a></h2>
                        </div>
                    </header>
                    <a href="single.html" class="image featured"><img src="images/pic03.jpg" alt="" /></a>
                    <p>
                        Nix será una empresa desarrolladora de software confiable 
                        y reconocida por su calidad de productos a nivel internacional.
                    </p>
                </article>
                <article class="post">
                    <header>
                        <div class="title">
                            <h2><a href="single.html">OBJETIVOS</a></h2>
                        </div>
                    </header>
                    <a href="single.html" class="image featured"><img src="images/pic03.jpg" alt="" /></a>
                    <p>
                        Desarrollar programas web que generen herramientas de difusión y práctica de actividades extracurriculares.
                    </p>
                    <ul type="circle" style="background-color: rgba(0,0,0,0);">
                        <li class="l">Proporcionar una herramienta intuitiva para preparar a los jóvenes con interés en las ciencias exactas.</li>
                        <li class="l">Motivar el constante desarrollo de nuevos conocimientos desde los hogares de los usuarios.</li>
                        <li class="l">Promover el razonamiento, la curiosidad, la creatividad y la persistencia en los jóvenes de la CDMX. </li>
                        <li class="l">Apoyar nuevas iniciativas de integración de tecnologías en cursos de preparación para jóvenes talentosos.</li>
                    </ul>
                </article>
            </div>
            <section id="sidebar">
                <section id="intro">
                    <a href="#" class="logo"><img src="../Imagenes/logoNix.png" alt="LOGO eMPRESA" /></a>
                    <header>
                        <h2>JOINDERS</h2>
                        <p>Programando desarrollamos al mundo</p>
                    </header>
                </section>
            </section>
        </div>
        <%@include file="links.jsp" %>%>
    </body>
</html>
