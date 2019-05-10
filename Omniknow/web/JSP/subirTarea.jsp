<%--ESTA PÁGINA DURA UN SEGUNDO--%>
<%@page import="Conexiones.Base"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Subiendo tarea</title>
        <!--Icono de pestaña-->
        <link rel="icon" href="../Imagenes/Omniknow solo.png"> 
    </head>
    <body onload="cActive()">
        <%
            //CONEXIÓN A LA BASE - inicio
            Base conexion = new Base();
            
            Connection c = null;
            Statement s = null;
            ResultSet rT = null;
            ResultSet rS = null;
            CallableStatement cs = null;
            
            c = conexion.getConnection();
            s = c.createStatement();
            //CONEXIÓN A LA BASE - fin 
            
            //Ver si ya existe el nombre de la tarea
            try {
                s.executeUpdate("USE OMNIKNOW;");
                rT = s.executeQuery("SELECT * FROM INFOS_TAREAS WHERE NOMBRE_PROBLEMA ='"+request.getParameter("tareaNombre")+"' and disponible=1;");
                if(rT.next()) {//Si existe una tarea con ese nombre...
                    out.println("<script>alert('Ya existe una tarea con ese nombre')</script>");
                    out.println("<script>history.back()</script>");
                }
                else {//Si no existe una tarea con ese nombre
                    //Ver si ya existe el nombre de la solución
                    s.executeUpdate("USE OMNIKNOW;");
                    rS = s.executeQuery("SELECT * FROM INFOS_TAREAS WHERE NOMBRE_SOLUCION ='"+request.getParameter("solucionNombre")+"';");
                    if(rS.next()) {//Si existe una solución con ese nombre...
                        out.println("<script>alert('Ya existe una solución con ese nombre')</script>");
                        out.println("<script>history.back()</script>");
                    }
                    else {//Si no existe una solución con ese nombre...
                        try {
                            
                            s.executeUpdate("USE OMNIKNOW;");
                            String nomT = request.getParameter("tareaNombre");
                            String nomS = request.getParameter("solucionNombre");
                            String graS = request.getParameter("txtGrado");//lo mismo que abajo  vvvv
                            int gra = Integer.parseInt(graS);
                            String fecha = request.getParameter("txtFecha");//son cuadros de texto por la cosa de enctype, para los pdf,jiji
                            String co1 = request.getParameter("latex1");
                            String co2 = request.getParameter("latex2");
                            String co3 = request.getParameter("latex3");
                            String co4 = request.getParameter("latex4");
                            String co5 = request.getParameter("latex5");
                            String aPDFT = request.getParameter("txtPDFT");
                            String aPDFS = request.getParameter("txtPDFS");
                            
                            cs = c.prepareCall("CALL CREAR_TAREA(?,?,?,?,?,?,?,?,?,?,?);");
                            cs.setInt(1,gra);
                            cs.setString(2,nomT);
                            cs.setString(3,nomS);
                            cs.setString(4,aPDFT);
                            cs.setString(5,aPDFS);
                            cs.setString(6,co1);
                            cs.setString(7,co2);
                            cs.setString(8,co3);
                            cs.setString(9,co4);
                            cs.setString(10,co5);
                            cs.setString(11,fecha);
                            cs.execute();
                            out.println("<script>alert('Tarea subida con éxito')</script>");
                        }
                        catch(SQLException error) {
                            out.print(error.toString());
                        }
                    }
                }
            }
            catch(SQLException error) {
                out.print("ERROR DOS:\n"+error.toString());
            }
                        
            out.println("<script>window.open('subirEntrenador.jsp','_self')</script>");
        %>
        <br>
        <a href="subirEntrenador.jsp" target="_self">Volver</a>
    </body>
</html>
