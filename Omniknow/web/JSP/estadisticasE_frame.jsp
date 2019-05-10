<%@page import="Conexiones.Base"%>
<%@page import="Sesion.Usuario"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="background-color: rgb(255,255,255)">
    <head>
        <title>Graficas</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../CSS/cssGraficas.css" type="text/css"  rel="stylesheet">
        <!--========================================================-->
        <!--Icono de pestaña-->
        <link rel="icon" href="../Imagenes/Omniknow solo.png">
        <!--Archivo CSS-->
        <link rel="stylesheet" type="text/css" href="">
        <link rel="stylesheet" href="../CSS/encabezado.css" type="text/css"/>
        <link rel="stylesheet" href="../CSS/vModales.css" type="text/css">
        <link href="../CSS/cssGraficas.css" type="text/css"  rel="stylesheet">
        <!--Archivo JS-->
        <script src="../JS/inicioSesion.js"></script>
        <script src="../JS/seleccionTarea.js"></script>
        <link rel="stylesheet" href="../assets/css/main.css" />
    </head>
    <body style="width: 100%;overflow-x:hidden; background-color: rgb(255,255,255)" >
        <%
            //CONEXIÓN A LA BASE - inicio
            Base conexion = new Base();
            
            Connection c = null;
            Statement s = null;
            ResultSet r = null;
            
            c = conexion.getConnection();
            s = c.createStatement();
            //CONEXIÓN A LA BASE - fin
            
            int grado = Integer.parseInt(request.getParameter("txtG"));
        %>
        <div id="divEstadisticasFrame">
            <form action="estadisticasE_grafica.jsp" id="formEstadisticas">
                <input type="text" name="txtid" id="txtid" readonly="true" style="visibility: hidden;"/>
                <table border="1" class="tablaEstadisticas">
                    <tr>
                        <th>Nombre Tarea</th>
                    </tr>
                <%
                try {
                    s.executeUpdate("USE OMNIKNOW;");
                    //No existe la tabla cualtarea, no muy bien que se supopne hacia esa cosa jijiji
                    r = s.executeQuery("select * from cualtarea where grado_tarea = "+grado+";");
                    int i = 1;
                    while(r.next() == true) 
                    {
                        String nombreTarea = r.getString("NOMBRE_PROBLEMA");


                    out.println("<tr onClick='verGrafica(this.id)' id='"+r.getString("ID_TAREA")+"'>");
                    out.println(""
                            + "<td>"+nombreTarea+""
                            + "<br><input type='text' name='nameT"+i+"' id='nameT"+i+"' value='"+ nombreTarea +"' style='visibility: hidden'>"
                            + "</td></tr>");
                    i++;
                    }
                }
                catch(SQLException error) {
                    out.print("ERROR DOS:\n"+error.toString());
                }
            %>

                </table>
            </form>
        </div>

    </body>
</html>
