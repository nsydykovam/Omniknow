<%-- 
    Document   : InicioSesion
    Created on : 28/03/2019, 11:05:53 PM
    Author     : jorgeantoniojuarezleyva
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
	<link rel="stylesheet" href="../assets/css/main.css" />
    </head>
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
                    <section>
                        <h3>Inicio de sesión</h3>
                        <form method="post" action="iniciarSesion.jsp" class="row">
                            <div class="col-12 col-12-xsmall">
                                <input type="text" name="user" id="user" value="" placeholder="Usuario" />
                            </div>
                            <div class="col-12 col-12-xsmall">
                                <input type="password" name="pass" id="pass" value="" placeholder="Contraseña" />
                            </div>
                            <div class="col-6 col-12-xsmall">
                                <input type="submit" class="button small fit" value="Acceder">
                            </div>
                        </form>
                    </section>
                </section>
    </div>
    
<script src="../assets/js/jquery.min.js"></script>
<script src="../assets/js/browser.min.js"></script>
<script src="../assets/js/breakpoints.min.js"></script>
<script src="../assets/js/util.js"></script>
<script src="../assets/js/main.js"></script>
    </body>
</html>
