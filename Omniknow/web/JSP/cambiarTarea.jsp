<%--ESTA PÁGINA DURA UN SEGUNDO--%>

<%@page import="Conexiones.Base"%>
<%@page import="java.sql.*,java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Subiendo tarea</title>
        <!--Icono de pestaña-->
        <link rel="icon" href="../Imagenes/Omniknow solo.png"> 
        <link rel="stylesheet" href="../CSS/encabezado.css" type="text/css"/>
        
        
    </head>
    <body>
        <%
            //CONEXIÓN A LA BASE - inicio
            Base conexion = new Base();
            
                //Lo viejo
            Connection conV = null;
            Statement staV = null;
            ResultSet resV = null;
            
                //Lo nuevo
            Connection conN = null;
            Statement staN = null;
            ResultSet resN = null;
            
            CallableStatement cs = null;
            
            conV = conexion.getConnection();
            conN = conexion.getConnection();
            staV = conV.createStatement();
            staN = conN.createStatement();
            //CONEXIÓN A LA BASE - fin
            
            try {
                String idTa = request.getParameter("txtID");
                String nomT = request.getParameter("tareaNombre");
                String nomS = request.getParameter("solucionNombre");
                int gra = Integer.parseInt(request.getParameter("comboGrado"));
                String fechaFinal = request.getParameter("fechaLimite");
                String co1 = request.getParameter("latex1");
                String co2 = request.getParameter("latex2");
                String co3 = request.getParameter("latex3");
                String co4 = request.getParameter("latex4");
                String co5 = request.getParameter("latex5");
                String aPDFT = request.getParameter("txtPDFT");
                String aPDFS = request.getParameter("txtPDFS");
                
                
                staN.executeUpdate("USE OMNIKNOW;");
                resN = staN.executeQuery("SELECT * FROM INFOS_TAREAS WHERE NOMBRE_PROBLEMA = '"+nomT+"' AND DISPONIBLE = '1';"); //¡¿Que no pensabas revisar las soluciones también?!
                Boolean n = resN.next();        
                
                staV.executeUpdate("USE OMNIKNOW;");
                resV = staV.executeQuery("SELECT * FROM INFOS_TAREAS WHERE ID_TAREA = '"+idTa+"';");
                resV.next();
                String nameV = resV.getString("NOMBRE_PROBLEMA");   
//                Boolean v = resV.next(); //NI SIQUIERA USABAS ESTO, ¿Por qué lo pusiste? Es obviamente verdadero siempre
                
                //Si no existe una tarea que tiene ese nombre o bien, no le cambió el nombre
                if (n == false || nomT.equals(nameV)) 
                {
//                      String nameR = resN.getString("NOMBRE_PROBLEMA");
                        cs = conN.prepareCall("CALL CAMBIAR_TAREA(?,?,?,?,?,?,?,?,?,?,?,?);");
                        cs.setString(1,nomT);
                        cs.setString(2,nomS);
                        cs.setInt(3,gra);
                        cs.setString(4,aPDFT);
                        cs.setString(5,aPDFS);
                        cs.setString(6,co1);
                        cs.setString(7,co2);
                        cs.setString(8,co3);
                        cs.setString(9,co4);
                        cs.setString(10,co5);
                        cs.setString(11,fechaFinal);
                        cs.setString(12,idTa);
                        cs.execute();
        %>
        
        <script>alert("Tarea cambiada.");</script>
        <script>window.open('verEntrenador.jsp','_self');</script>
        
        <%            
                }
                else //Ya existía una tarea con ese nombre y además es diferente
                {
        %>
        
        <script>alert("Ya existe otra tarea con ese nombre.");</script>
        <script>window.open('verEntrenador.jsp','_self');</script>
        
        <%
                }
            }
            catch(Exception error) {
                out.print("ERROR DOS:\n"+error.toString());
            }
        %>
        <br>
    </body>
</html>

