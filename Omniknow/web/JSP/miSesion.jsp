
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*,java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Inicio</title>
        <!--Cosas para evitar trampas de regresos-->
        <%
            HttpSession sesion = request.getSession();
            HttpServletResponse resp = (HttpServletResponse) response;
            if (sesion.isNew()) {
                resp.sendRedirect("index.jsp");
            } else {
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Icono de pestaña-->
    </head>
    <body class="is-preload">
        <div id="wrapper">
            <%@include file="barraSuperior.jsp" %>
            <div id="main">
                <div id="particles-js" style=" background-color: rgba(255,255,255,0); position: fixed; width: 100%; height: 100%"></div>
                <article class="post" id="miInfo">
                    <header>
                        <div class="title">
                            <h2><a href="single.html">Mi información</a></h2>
                        </div>
                    </header>
                    <section>
                        Usuario:   <%out.print(sesion.getAttribute("usuario"));%><BR> 
                        Nombre: <%out.print(sesion.getAttribute("nombre")+ " " +sesion.getAttribute("apellidoP") + " " + sesion.getAttribute("apellidoM"));%><br>
                        Nivel:<%
                            int nivel = Integer.parseInt("" + sesion.getAttribute("grado"));
                            if (nivel < 4)/* secundaria */ {
                                out.print("Secundaria");
                            } else {
                                out.print("Primaria");
                            }
                        %><br>
                        Grado: &nbsp;&nbsp;   <%out.print(sesion.getAttribute("grado"));%><br>
                        Escuela:&nbsp;&nbsp;  <%out.print(sesion.getAttribute("escuela"));%><br>
                        Correo:&nbsp;&nbsp;  <%out.print(sesion.getAttribute("correo"));%><br>
                    </section>
                    <footer>
                        <ul class="actions">
                            <li><a  onclick="poner('ModificarInfo');poner('miInfo')" class="button large">Modificar mi información</a></li>
                        </ul>
                    </footer>
                        <h3></h3>
                    </footer>
                </article>
                <%
                    if (sesion.getAttribute("nombre") == null) {
                    } else {
                        String name = sesion.getAttribute("nombre").toString();
                        String lastP = sesion.getAttribute("apellidoP").toString();
                        String lastM = sesion.getAttribute("apellidoM").toString();
                        int grado = Integer.parseInt("" + sesion.getAttribute("grado"));
                        String escuela = sesion.getAttribute("escuela").toString();
                        String mail = sesion.getAttribute("correo").toString();
                        String usuario = sesion.getAttribute("usuario").toString();
                        String pass = sesion.getAttribute("contra").toString();
                        String nivels = "";
                        int pos1 = 0, pos2 = 0;

                        if (grado < 4) {
                            pos1 = 2;
                            pos2 = grado;
                        } else {
                            pos1 = 1;
                            pos2 = grado - 3;
                        }

                %>

                    <article class="post" id="ModificarInfo" style="display: none;">
                        <section  >
                            <form action="cambiarDatos.jsp" method="post"><!--La información se manda a un JSP que la sube a la base de datos-->
                                <input type="text"     id="txtNombrePart"     name="nombreParticipante"     onKeyPress="alfabeto()"               onInput="mayus(txtNombrePart)"    maxlength="40"  autocomplete="off" onkeydown="return control(event);" placeholder="Nombre"               value="<%out.print(name);%>"     /> <br>
                                <input type="text"     id="txtApellidoPPart"  name="apellidoPParticipante"  onKeyPress="alfabeto()"               onInput="mayus(txtApellidoPPart)" maxlength="30"  autocomplete="off" onkeydown="return control(event);" placeholder="Apellido paterno"     value="<%out.print(lastP);%>"    /> <br>
                                <input type="text"     id="txtApellidoMPart"  name="apellidoMParticipante"  onKeyPress="alfabeto()"               onInput="mayus(txtApellidoMPart)" maxlength="30"  autocomplete="off" onkeydown="return control(event);" placeholder="Apellido materno"     value="<%out.print(lastM);%>"    /> <br>
                                <input type="text"     id="txtEscuelaPart"    name="escuelaParticipante"    onKeyPress="alfabetoEscuela()"        onInput="mayus(txtEscuelaPart)"   maxlength="100" autocomplete="off" onkeydown="return control(event);" placeholder="Escuela"              value="<%out.print(escuela);%>"  /> <br>
                                <input type="text"     id="txtCorreoPart"     name="correoParticipante"     onKeyPress="correo()"                 onInput="minus(txtCorreoPart)"    maxlength="70"  autocomplete="off" onkeydown="return control(event);" placeholder="Correo"               value="<%out.print(mail);%>"  /> <br>
                                <input type="text"     id="txtUsuarioPart"    name="usuarioParticipante"                                                                            maxlength="30"  autocomplete="off" onkeydown="return control(event);" placeholder="Usuario"              value="<%out.print(usuario);%>" /> <br>
                                <input type="password" id="txtContraPart"     name="contrasenaParticipante"                                                                         maxlength="20"  autocomplete="off" onkeydown="return control(event);" placeholder="Contraseña"            value="<%out.print(pass);%>"/> <br>
                                <input type="password" id="txtContraPart2"    name="txtContraPart2"                        oninput="validPass();" class="textos dos"                maxlength="20"  autocomplete="off" onkeydown="return control(event);" placeholder="Vefificar contraseña" />
                                <!--COMBO NIVEL-->
                                <br><br>
                                <select id="comboNivel" onChange="cambiarCombo(comboNivel)"> 
                                    <option>Nivel</option>
                                    <option <%if (pos1 == 1) out.print("selected");%>>Primaria</option>
                                    <option <%if (pos1 == 2) out.print("selected");%>>Secundaria</option>
                                </select>
                                <!--COMBO GRADO-->
                                <select id="comboGrado"  name="gradoParticipante" > 
                                    <option>Grado</option>
                                </select>
                                <script>
                                    cambiarCombos();
                                </script>
                                <br><br>
                                <!--BOTÓN PARA ENVIAR INFORMACIÓN-->
                                <center>

                                    <input type="submit" value="Cambiar" class="large button" onClick="return enviar()" > 
                                    <a class="large button" onclick="poner('ModificarInfo'); poner('miInfo')">Cancelar</a>
                                </center>
                            </form>
                        </section>
                    </article>
                <%
                    }
                %>
            </div>
            <section id="sidebar">
                 <section id="intro">
                    <header>
                        <h2><%out.print(sesion.getAttribute("usuario"));%></h2>
                        <p><%out.print(sesion.getAttribute("nombre") + " " + sesion.getAttribute("apellidoP") + " " + sesion.getAttribute("apellidoM"));%></p>
                    </header>
                    <a class="small but"href="cerrarSesion.jsp">Cerrar Sesion</a>
                </section>
            </section>
        </div>
        <%}%>
        <%@include file="links.jsp" %>
    </body>
</html>
