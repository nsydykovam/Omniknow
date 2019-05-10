<%@page import="Conexiones.Base"%>
<%@page import="Sesion.*" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*,java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Tareas y soluciones</title>
        <!--Cosas para evitar trampas de regresos-->
         <%
            HttpSession sesion=request.getSession();
            HttpServletResponse resp=(HttpServletResponse)response;
            if(sesion.isNew()){
                resp.sendRedirect("index.jsp");
            }else{
         %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <script>
            function cUNO(boton,num)
            {
                txtBoton.value = boton;
                txtNombreTarea.value = document.getElementById("nameT"+num).value;
                document.getElementById("formTarea").submit();
            }
            function cDOS(boton,num)
            {
                txtBoton.value = boton;
                txtNombreTarea.value = document.getElementById("nameT"+num).value;
                var vf =confirm("¿Estás seguro de que quieres borrar la tarea?");
                if (vf === true) 
                    document.getElementById("formTarea").submit();
            }
             
        </script>
        
    </head>
    <body onload="cActive()">
        <div id="wrapper">
            <%@include file="barraSuperior.jsp"%>
            <div id="main">
                <div id="particles-js" style=" background-color: rgba(255,255,255,0); position: fixed; width: 100%; height: 100%"></div>
                <article class="post">
                    <form action="cambiosBajas.jsp" method="post" id="formTarea">
                        <input type="text" name="txtid" id="txtid" readonly="true" style="display:none "/>
                    <%
                        Base con = new Base();
                        Base conexion = new Base();
                        Connection c = null;
                        Statement s = null;
                        ResultSet r = null;
                        
                        c = conexion.getConnection();
                        s = c.createStatement();
                    %>
                        <table border="1" style="width: 100%;">
                            <tr>
                                <th>Nombre Tarea</th>
                                <th>Fecha límite</th>
                                <th>Nivel</th>
                                <th>Grado</th>
                                <th>Cambiar</th>
                                <th>Borrar</th>
                            </tr>
                        <%
                        try {
                            s.executeUpdate("USE OMNIKNOW;");
                            r = s.executeQuery("SELECT * FROM INFOS_TAREAS WHERE DISPONIBLE = '1';");
                            int i = 1;
                            while(r.next() == true) 
                            {
                                String nombreTarea = r.getString("NOMBRE_PROBLEMA");
                                String fechaLimite = r.getString("FECHA_FINAL");
                                int grado = Integer.parseInt(r.getString("GRADO_TAREA"));
                                String nivel = "";
                                if (grado < 4) 
                                    nivel = "Secundaria" ;  
                                else
                                    nivel = "Primaria" ; 


                            out.println("<tr>"
                                    + "<td name='loco"+i+"' id='loco"+i+"'>"+nombreTarea+""
                                    + "<br><input type='text' name='nameT"+i+"' id='nameT"+i+"' value='"+ nombreTarea +"' style='visibility: hidden'>"
                                    + ""
                                    + "</td>");
                        %>
                                <td><%out.print(fechaLimite);%></td>
                                <td><%out.print(nivel);%></td>
                                <td><%out.print(grado);%></td>
                                <td onclick="cUNO(1,<%out.print(i);%>);"><img src="../Imagenes/iCambios.png" width="30"></td>
                                <td onclick="cDOS(2,<%out.print(i);%>);"><img src="../Imagenes/iBorrar.png" width="30"></td>
                            </tr>

                        <%
                            i++;
                            }
                        }
                        catch(SQLException error) {
                            out.print("ERROR DOS:\n"+error.toString());
                        }
                    %>

                        </table>
                        <input type="text" name="txtBoton" id="txtBoton" style="display: none" ><br>
                        <input type="text" name="txtNombreTarea" id="txtNombreTarea"  style="display:none " ><br>
                    </form>
                </article>
            </div>
            <section id="sidebar">
                <section id="intro">
                    <header>
                        <h2>Ver tareas</h2>
                        <p>Aqui puedes ver todas las tareas, modificarlas o borrarlas, solo debes dar click en el boton correspondiente</p>
                    </header>
                </section>
            </section>
        </div>
            <%}%>
            <%@include file="links.jsp" %>
    </body>
</html>