<%@page import="Conexiones.Base"%>
<%@page import="java.sql.*"%>
<%@page import="Sesion.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Aceptar Participantes</title>
         <%
            HttpSession sesion=request.getSession();
            HttpServletResponse resp=(HttpServletResponse)response;
            if(sesion.isNew()){
            resp.sendRedirect("index.jsp");
            }else{
         %>
        <script>
            function enviarr(id)
            {
                txtID.value = id;
                txtTipo.value = 1;
                document.getElementById("form").submit();
            }
            function cancelar(id)
            {
                txtID.value = id;
                txtTipo.value = 2;
                document.getElementById("form").submit();
            }
            
        </script>
    </head>
    <body >
        <div id="wrapper">
            <%@include file="barraSuperior.jsp" %>
            <div id="main">
                <div id="particles-js" style=" background-color: rgba(255,255,255,0); position: fixed; width: 100%; height: 100%"></div>
                <article class="post">
                    <form name="formulario" id="form" action="aceptarDenegar.jsp" method="post">
                        <table>
                            <tr>
                                <td>Nombre</td>
                                <td>Apellido Paterno</td>
                                <td>Apellido Materno</td>
                                <td>Aceptar</td>
                                <td>Rechazar</td>
                            </tr>
                            <input type="text" id="txtID"    name="txtID"   style="display:  none" >
                            <input type="text" id="txtTipo"  name="txtTipo" style="display:  none" >
                            <%
                                Base conexion = new Base();
                
                                Connection con = null;
                                Statement sta = null;
                                ResultSet res = null;
                
                                con = conexion.getConnection();
                                sta = con.createStatement();
                                
                                try {
                                    sta.executeUpdate("USE OMNIKNOW;");
                                    res = sta.executeQuery("SELECT * FROM INFOS_PENDIENTES;");
                                    Boolean j = res.next();
                                    int id = 0;
                                    int i = 0;
                                    if(j == true)
                                    {
                                        while (j == true) 
                                        {
                                            String name = res.getString("NOMBRE");
                                            String lastP = res.getString("APELLIDO_PATERNO");
                                            String lastM = res.getString("APELLIDO_MATERNO");
                                            id = Integer.parseInt(res.getString("ID_PENDIENTE"));
                            %>
                                            <tr>
                                                <td><%=name%></td>
                                                <td><%=lastP%></td>
                                                <td><%=lastM%></td>
                                                <td><img src="../Imagenes/iAceptarP.png" onclick="enviarr(<%=id%>)" width="30"></td>
                                                <td><img src="../Imagenes/iDenegarP.png" onclick="cancelar(<%=id%>)" width="30"></td>
                                            </tr>
                            <%  
                                            i++;
                                            j = res.next();
                                        }
                                    }
                                    else
                                    {
                                    
                                    }
                                } catch (Exception e) {
                                    out.print("<script>alert('No hay solicitudes pendientes.')</script>");
                                }

                            %>

                        </table>
                    </form>
                </article>
            </div>
            <section id="sidebar">
                <section id="intro">
                    <header>
                        <h2>Aceptar participantes</h2>
                        <p>Aqui puedes aceptar a los participantes</p>
                    </header>
                </section>
            </section>
        </div>
            <%}%>
            <%@include file="links.jsp" %>
    </body>
</html>
