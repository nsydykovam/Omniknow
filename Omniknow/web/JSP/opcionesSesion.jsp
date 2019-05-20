<%@page import="Conexiones.Base"%>
<%@page import="Sesion.*" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*,java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Inicio</title>
        <!--Cosas para evitar trampas de regresos-->
         <%
            HttpSession sesion=request.getSession();
            HttpServletResponse resp=(HttpServletResponse)response;
            if(sesion.isNew()){
                resp.sendRedirect("index.jsp");
            }else{
         %>
    </head>
    
    <%
            Base conexion = new Base();
            
            Connection con = null;
            Statement sta = null;
            ResultSet res = null;
            
            con = conexion.getConnection();
            sta = con.createStatement();
    %>
    
    <body onload="cActive()">
        <div id="wrapper">
            <%@include file="barraSuperior.jsp" %>
            <div id="main">
                <div id="particles-js" style=" background-color: rgba(255,255,255,0); position: fixed; width: 100%; height: 100%"></div>
                <article class="post" id="info">
                    <%
                        try {
                            sta.executeUpdate("USE OMNIKNOW;");
                                res = sta.executeQuery("SELECT * FROM INFOS_ENTRENADORES;");
                                res.next();
                                String usuario = res.getString("USUARIO");
                                String claveMa = res.getString("CLAVE_MAESTRA");
                    %>
                    <section>
                        Usuario:            &nbsp;  <%out.print(usuario);%>  <br>
                        Clave de acceso:    &nbsp;  <%out.print(claveMa);%><br>
                        <hr>
                        <input type="button" class="button" value="Cambiar datos" onClick="poner('cambiosEntr');poner('info')"  >
                    </section>
                    <%
                    } catch (Exception e) {
                                out.print("ERROR DOS:\n"+e.toString());
                            }

                    %>
                </article>
                <article class="post" id="cambiosEntr" style="display: none">
                    <form action="/Omniknow/ContrActualizarDatosEntrenador" method="post">
                        <%
                            try {
                                sta.executeUpdate("USE OMNIKNOW;");
                                    res = sta.executeQuery("SELECT * FROM INFOS_ENTRENADORES;");
                                    res.next();
                                    String usuario = res.getString("USUARIO");
                                    String claveMa = res.getString("CLAVE_MAESTRA");
                                    String passOld = res.getString("CONTRASEÑA");
                        %>

                        <input type="text" name="txtUsuario" id="txtUsuario" value="<%out.print(usuario);%>" placeholder="usuario">  <BR>    
                        <input type="text" name="txtClaveMaestra" id="txtClaveMaestra" value="<%out.print(claveMa);%>" placeholder="Clave de acceso">  <br>
                        <input type="password" name="txtPassNew1" id="txtPassNew1" placeholder="Contraseña nueva"><br>
                        <input type="password" name="txtPassNew2" id="txtPassNew2" placeholder="Verificar contraseña">
                        <br>
                        <!--BOTÓN PARA INGRESAR-->
                        <input type="button" class="button" value="Cancelar" onClick="poner('info');poner('cambiosEntr')" >
                        <input type="submit" class="button" value="Cambiar" onClick="return validar();"">
                    </form>
                        <%
                        } catch (Exception e) {
                                    out.print("ERROR DOS:\n"+ e.toString());
                                }

                        %>
                </article>
            </div>
            <section id="sidebar">
                <section id="intro">
                    <header>
                        <h2>Hola entrenador</h2>
                        <p>Aqui puedes modificar tu informaciond e ingreso, asi como la clave de acceso</p>
                    </header>
                    <a class="small but"href="cerrarSesion.jsp">Cerrar Sesion</a>
                </section>
            </section>
        </div>
        <%}%>
        <%@include file="links.jsp"%>
    </body>
</html>