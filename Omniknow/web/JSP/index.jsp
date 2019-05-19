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
            
                <%@include file="barraSuperior.jsp" %>
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

                    <%                    if (tipo == 0) {
                    %>
                    <section>
                        <h3>Inicio de sesión</h3>
                        <form method="post" action="/Omniknow/ContrIniciarSesion" class="row">
                            <div class="col-12 col-12-xsmall">
                                <input type="text" name="usuarioInicio" id="txtUsuarioInicio" value="" placeholder="Usuario" />
                            </div>
                            <div class="col-12 col-12-xsmall">
                                <input type="password" name="contrasenaInicio" id="txtContrasenaInicio" value="" placeholder="Contraseña" />
                            </div>
                            <div class="col-6 col-12-xsmall">
                                <input type="submit" class="button small fit" value="Acceder">
                            </div>
                            <div class="col-6 col-12-xsmall">
                                <a onclick="poner('recuperarContra')" > Recuperar contraseña</a>
                            </div>
                        </form>
                        <form action="/Omniknow/ContrEnviarContra" method="post" >
                            <div class="row" id="recuperarContra" style="display: none">
                                <div class="col-12">
                                    <input type="text" name="txtUsuario" id="txtUsuario" value="" placeholder="Usuario" />
                                </div>
                                <div class="col-6 col-12-small">
                                    <input type="submit" class=" button" value="recuperar">
                                </div>
                            </div>
                        </form>
                    </section>
                    <section>
                        <h2></h2><h4></h4>
                        <p><a class="" onclick="poner('registrate')">Regístrate</a></p>
                        <section id="registrate" style="display: none; padding: 20px;">
                            <form method="post" action="/Omniknow/ContrRegistroUsuario">
                                <div class="row gtr-uniform">
                                    <div class="col-12">
                                        <input type="text"  id="txtNombrePart" name="nombreParticipante" value="" placeholder="Nombre" />
                                    </div>
                                    <div class="col-12">
                                        <input type="text"  id="txtApellidoPPart" name="apellidoPParticipante" value="" placeholder="Apellido paterno" />
                                    </div>
                                    <div class="col-12">
                                        <input type="text"  id="txtApellidoMPart" name="apellidoMParticipante" value="" placeholder="Apellido materno" />
                                    </div>
                                    <div class="col-12">
                                        <input type="text"  id="txtEscuelaPart" name="escuelaParticipante" value="" placeholder="Escuela" />
                                    </div>
                                    <div class="col-12">
                                        <input type="text"  id="txtCorreoPart" name="correoParticipante" value="" placeholder="Correo" />
                                    </div>
                                    <div class="col-12">
                                        <input type="text"  id="txtUsuarioPart" name="usuarioParticipante" value="" placeholder="Usuario" />
                                    </div>
                                    <div class="col-12">
                                        <input type="text"  id="txtContraPart" name="contrasenaParticipante" value="" placeholder="Contraseña" />
                                    </div>
                                    <div class="col-12">
                                        <input type="text"  id="txtContraPart2" name="txtContraPart2" value="" placeholder="Vefificar contraseña" />
                                    </div>
                                    <div class="col-12">
                                        <input type="text"  id="txtClavePart" name="claveParticipante" value="" placeholder="Clave de acceso" />
                                    </div>
                                    <div class="col-6" onChange="cambiarCombo(comboNivel)">
                                        <select id="comboNivel" onChange="cambiarCombo(comboNivel)" > 
                                            <option>Nivel</option>
                                            <option>Primaria</option>
                                            <option>Secundaria</option>
                                        </select>

                                    </div>
                                    <div class="col-6">
                                        <select id="comboGrado"  name="gradoParticipante" onchange="despliegaCombo()" > 
                                            <option>Grado</option>
                                        </select><input type="text" name="txtGrado" id="txtGrado" style="visibility: hidden">
                                    </div>
                                    <div class="col-6">
                                        <input type="submit" class="button" value="Registrarme">
                                    </div>
                                </div>
                            </form>
                        </section>
                    </section>
                    <section>
                        <h2></h2><h4></h4>
                        <p><a class=""  onclick="poner('solicitClav')">Solicitar Clave</a></p>
                        <section id="solicitClav" style="display: none; padding: 20px;">
                            <form method="post" action="/Omniknow/ContrSolicitarClave">
                                <div class="row gtr-uniform">
                                    <div class="col-12 col-12-xsmall">
                                        <input type="text"  id="txtN" name="txtN" value="" placeholder="Nombre" />
                                    </div>
                                    <div class="col-12 col-12-xsmall">
                                        <input type="text"  id="txtL1" name="txtL1" value="" placeholder="Apellido Paterno" />
                                    </div>
                                    <div class="col-12 col-12-xsmall">
                                        <input type="text"  id="txtL2" name="txtL2" value="" placeholder="Apellido Materno" />
                                    </div>
                                    <div class="col-12 col-12-xsmall">
                                        <input type="text"  id="txtM" name="txtM" value="" placeholder="Correo" />
                                    </div>
                                    <div class="col-6 col-12-xsmall">
                                        <input type="submit" class="button small fit" value="Solicitar">
                                    </div>
                                </div>
                            </form>
                        </section>
                    </section>
                    <%}%>

                    <section>
                        <h3>¿Tienes dudas en como usar algo?</h3>
                        <div class="mini-posts">
                            <article class="mini-post">
                                <header>
                                    <h3><a  onclick="poner('Inicio')">Inicio</a></h3>
                                </header>
                                <section id="Inicio" style="display: none;">
                                    En este módulo podrás consultar el tutorial si es que tienes dudas acerca del programa
                                </section>
                            </article>


                            <article class="mini-post">
                                <header>
                                    <h3><a  onclick="poner('Tareas')">Tareas</a></h3>
                                </header>
                                <section id="Tareas" style="display: none;">
                                    <div class="row gtr-uniform">
                                        <center><h3>TAREAS </h3></center>
                                        <p align="center">En este módulo podrás consultar las tareas disponibles si das clic en "TAREAS"</p>

                                        <br>
                                        <div class="col-12 col-12-xsmall">
                                            <a href="single.html" class="image featured"><img src="../Imagenes/fTareas1.png" alt="fotoTareas"></a>
                                        </div>
                                        <p align="center"> 
                                            Una vez estés ahí te aparecerá una tabla donde te indicará el número de tarea, 
                                            la fecha y el día máximo para subir tu solución, también te aparecerá el estado 
                                            en el que está la tarea, es decir, si ya la enviaste aparecerá "ENVIADO", 
                                            si aún no la envias mostrará "NO ENVIADO"
                                        </p>
                                        <div class="col-12 col-12-xsmall">
                                            <a href="single.html" class="image featured"><img src="../Imagenes/fTareas2.png" alt="fotoTareas"></a>
                                        </div>
                                        <center><h3>SOLUCIONES</h3></center>
                                        <p align="center">
                                            Si deseas ver alguna solución podrás acceder al módulo soluciones, dando clic en "SOLUCIONES"
                                        </p>
                                        <div class="col-12 col-12-xsmall">
                                            <a href="single.html" class="image featured"><img src="../Imagenes/fTareas4.png" alt="fotoTareas"></a>
                                        </div>
                                        <p align="center">
                                            Aquí podrás visualizar una tabla donde te pondrá el número de la solución que es el mismo que
                                            tiene la tarea; te aparecerá el estado de la solución, si está disponible, podrás descargar el 
                                            archivo de lo contrario no, y tendrás que esperar hasta que finalice el tiempo límite para
                                            enviar la tarea o que el entrenador ponga la solucion disponible.

                                        </p>
                                        <div class="col-12 col-12-xsmall">
                                            <a href="single.html" class="image featured"><img src="../Imagenes/fTareas3.png" alt="fotoTareas"></a>
                                        </div>
                                    </div>
                                </section>
                            </article>


                            <article class="mini-post">
                                <header>
                                    <h3><a  onclick="poner('Enviar')">Enviar respuestas</a></h3>
                                </header>
                                <section id="Enviar" style="display: none;">
                                    <div class="row gtr-uniform">
                                        <center>
                                            <h3>ENVIAR RESPUESTAS</h3>
                                            <i class="iTeclado"></i>
                                            <p> 
                                                Aquí podrás enviar tus respuestas cuando las tengas listas, y si es necesario
                                                podrás hacer uso del teclado con símbolos personalizados, para escribir más cómodamente tus respuestas.
                                            </p>
                                            <br><br>
                                            <p> 
                                                Para enviar tus respuestas, deberás seleccionar la tarea correspondiente, 
                                            </p>
                                            <div class="col-12 col-12-xsmall">
                                                <a href="single.html" class="image featured"><img src="../Imagenes/fResp1.png" alt="fotoTareas"></a>
                                            </div>
                                            <p>
                                                y después escribir la respuesta que se relacione a cada pregunta.
                                            </p>
                                            <div class="col-12 col-12-xsmall">
                                                <a href="single.html" class="image featured"><img src="../Imagenes/fResp2.png" alt="fotoTareas"></a>
                                            </div>
                                            <br><br>
                                            <h3>TECLADO</h3>
                                            <p> 
                                                Para hacer uso del teclado solo deberás de dar clic aquí y se desplegará.
                                            </p>
                                            <div class="col-12 col-12-xsmall">
                                                <a href="single.html" class="image featured"><img src="../Imagenes/fResp3.png" alt="fotoTareas"></a>
                                            </div>
                                            <br><br>
                                            <p> 
                                                Luego sólo deberás presionar los signos necesarios para que 
                                                se escriban en el campo de texto correspondiente.
                                            </p>
                                            <div class="col-12 col-12-xsmall">
                                                <a href="single.html" class="image featured"><img src="../Imagenes/fResp4.png" alt="fotoTareas"></a>
                                            </div>
                                            <BR><BR>
                                            <H3>ENVIAR</H3>
                                            <p> 
                                                Para enviar tus respuestas sólo es necesario que presiones el botón enviar.
                                            </p>
                                            <div class="col-12 col-12-xsmall">
                                                <a href="single.html" class="image featured"><img src="../Imagenes/fResp5.png" alt="fotoTareas"></a>
                                            </div>
                                        </center>
                                        <br><br>
                                    </div>
                                </section>
                            </article>


                            <article class="mini-post">
                                <header>
                                    <h3><a  onclick="poner('Estadi')">Estadisticas</a></h3>
                                </header>
                                <section id="Estadi" style="display: none;">
                                    <div class="row gtr-uniform">
                                        <h3>ESTADÍSTICAS</h3>
                                        <p>Aquí podrás ver tu avance y el de tu grupo.</p>
                                        <div class="col-12 col-12-xsmall">
                                            <a href="single.html" class="image featured"><img src="../Imagenes/fEst1.png" alt="fotoTareas"></a>
                                        </div>
                                        <br><br>
                                        <h3>Avance Individual</h3>
                                        <p align="justify">
                                            Para ver el Avance Individual sólo debes de dar clic aquí
                                        </p>
                                        <p align="justify">
                                            y te aparecerá una gráfica 
                                            donde mostrará el número del cuestionario(en la parte inferior), y tu puntaje(en la derecha).
                                        </p>
                                        <div class="col-12 col-12-xsmall">
                                            <a href="single.html" class="image featured"><img src="../Imagenes/fEst2.png" alt="fotoTareas"></a>
                                        </div>
                                        <h3>Avance Grupal</h3>
                                        <p align="justify">
                                            Para ver el Avance Grupal sólo debes de dar clic aquí
                                        </p>
                                        <p align="justify">
                                            y te aparecerá una gráfica que mostrará el número del cuestionario(en la parte inferior),
                                            y el puntaje promedio de tu grupo(en la derecha).
                                        </p>
                                        <div class="col-12 col-12-xsmall">
                                            <a href="single.html" class="image featured"><img src="../Imagenes/fEst3.png" alt="fotoTareas"></a>
                                        </div>
                                    </div>
                                </section>
                            </article>
                        </div>
                    </section>

                    <!-- Posts List -->
                    <section>
                        <article class="post">
                                <h3 onclick="poner('FAQS')">Preguntas frecuentes</h3>
                            <section id="FAQS" style="display: none;">
                            <br><br>
                            <ul class="posts">
<%
            //CONEXIÓN A LA BASE - inicio
            Base conexion = new Base();
            HttpSession sesion=request.getSession();
            Connection c = null;
            Statement s = null;
            ResultSet r = null;
            
            c = conexion.getConnection();
            s = c.createStatement();
            r = s.executeQuery("select * from FAQindex;");
            while(r.next()){
                String pregunta = r.getString("pregunta");
                String respuesta = r.getString("respuesta");
            %>
                                <li>
                                    <article>
                                        <header>
                                            <h3><a ><%=pregunta%></a></h3>
                                            <section>
                                                <%=respuesta%>
                                            </section>
                                        </header>
                                    </article>
                                </li>
            <%}
            //CONEXIÓN A LA BASE - fin
%>    
                                <li>
                                    <article>
                                        <header>
                                            <h3><a >Si he olvidado mi contraseña ¿Cómo la recupero?</a></h3>
                                            <section>
                                                En inicio de sesión en la parte inferior hay una opción que dice "Recuperar contraseña", una vez des click, te enviará al formulario para que recuperes tu contraseña.
                                            </section>
                                        </header>
                                    </article>
                                </li>
                                <li>
                                    <article>
                                        <header>
                                            <h3><a >Es válido tener dos cuentas?</a></h3>
                                            <section>
                                                No, solamente puedes tener una, en caso de que registres otra cuenta, los entrenadores solamente tomarán en cuenta la primera.
                                            </section>
                                        </header>
                                    </article>
                                </li>
                                <li>
                                    <article>
                                        <header>
                                            <h3><a >¿A quién puedo enviarle mis quejas o sugerencias?</a></h3>
                                            <section>
                                                De momento no es posible,estamos trabajando en ello, sin embargo puedes notificárselo a tu entrenador.
                                            </section>
                                        </header>
                                    </article>
                                </li>
                                <li>
                                    <article>
                                        <header>
                                            <h3><a >¿Cómo me contacto con el entrenador?</a></h3>
                                            <section>
                                                De momento no es posible, estamos trabajando en un chat para que existe un diálogo y en un foro para discutir las tareas. 
                                            </section>
                                        </header>
                                    </article>
                                </li>
                                <li>
                                    <article>
                                        <header>
                                            <h3><a>¿A qué página acudo para las fechas de presentación de la olimpiada?</a></h3>
                                            <section>
                                                En la página oficial de la OMDF, en la página principal encontrarás un link que te llevará a ella.
                                            </section>
                                        </header>
                                    </article>
                                </li>
                                <li>
                                    <article>
                                        <header>
                                            <h3><a>Si envié mis respuestas olvidando algún valor importante ¿Cómo las puedo cambiar?</a></h3>
                                            <section>
                                                No es posible cambiar tus respuestas.
                                            </section>
                                        </header>
                                    </article>
                                </li>
                                <li>
                                    <article>
                                        <header>
                                            <h3><a>¿De que manera puedo subir mis respuestas?</a></h3>
                                            <section>
                                                En la página de inicio encontraras unas flechas con informacion, debes darle click a ellas.
                                            </section>
                                        </header>
                                    </article>
                                </li>
                                <li>
                                    <article>
                                        <header>
                                            <h3><a>¿Como consulto mi avance?</a></h3>
                                            <section>
                                                En la página de inicio encontraras unas flechas con informacion, debes darle click a ellas.
                                            </section>
                                        </header>
                                    </article>
                                </li>
                                <li>
                                    <article>
                                        <header>
                                            <h3><a>¿Como consulto el avance grupal?</a></h3>
                                            <section>
                                                En la página de inicio encontraras unas flechas con informacion, debes darle click a ellas.
                                            </section>
                                        </header>
                                    </article>
                                </li>
                                <li>
                                    <article>
                                        <header>
                                            <h3><a>¿Que es la olimpiada de Matemáticas del Distrito Federal?</a></h3>
                                            <section>
                                                Es un concurso que se realiza anualmente para estudiantes de tercero de primaria hasta tercero de secundaria.
                                                En la página de inicio encontraras un link a la pagina oficial de la OMDF.
                                            </section>
                                        </header>
                                    </article>
                                </li>
                                <li>
                                    <article>
                                        <header>
                                            <h3><a>¿Cual es el proceso de seleccion para participar en la olimpiada?</a></h3>
                                            <section>
                                                El proceso lo realiza cada escuela hasta la segunda etapa, despues de ahi tendras que acudir a la UNAM para seguir con los concursos.
                                                En la página de inicio encontraras un link a la pagina oficial de la OMDF.
                                            </section>
                                        </header>
                                    </article>
                                </li>
                                <li>
                                    <article>
                                        <header>
                                            <h3><a>¿Existe un entrenamiento especial?</a></h3>
                                            <section>
                                                En la pagina oficial de la OMDF encontraras guías de estudio.
                                                En la página de inicio encontraras un link a la pagina oficial de la OMDF.
                                            </section>
                                        </header>
                                    </article>
                                </li>
                                <li>
                                    <article>
                                        <header>
                                            <h3><a>¿Cuánto tiempo tengo para responder los ejercicios?</a></h3>
                                            <section>
                                                El tiempo que el entrenador haya indicado, en la sección de Tareas y soluciones, viene indicada la fecha máxima de entrega.
                                            </section>
                                        </header>
                                    </article>
                                </li>
                                <li>
                                    <article>
                                        <header>
                                            <h3><a>¿Cómo consulto los resultados?</a></h3>
                                            <section>
                                                En la página oficial de la OMDF
                                            </section>
                                        </header>

                                    </article>
                                </li>
                                <li>
                                    <article>
                                        <header>
                                            <h3><a>¿Qué premio reciben los ganadores?</a></h3>
                                            <section>
                                                Pasar a la siguiente etapa
                                            </section>
                                        </header>
                                    </article>
                                </li>
                            </ul>

                            <article>
                                <header>
                                    <h3><a>¿Tienes otra pregunta?</a></h3>
                                    <section>
                                         <a href="maspreguntas.jsp" class="button">Hacer pregunta</a>
                                    </section>
                                </header>
                            </article>
                        </section>
                        </article>
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
                    </section>
                </section>
            </div>
        <%@include file="links.jsp" %>
    </body>
</html>




