<%-- 
    Document   : responderGerente
    Created on : 4/04/2019, 01:45:48 PM
    Author     : Alumno
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="Conexiones.Base"%>
<%@page import="Conexiones.Base"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="barraSuperior.jsp"%>
            <div id="main">
                <article class="post">
		    <table>
                        <tr>
                            <th>FOLIO</th>
                            <th>CORREO</th>
                            <th>PROBLEMA</th>
                            <th>ESTADO</th>
                            <th>RESPONDER</th>
                        </tr>
                        <%      
                            request.setCharacterEncoding("UTF-8");
                        
                            ses = request.getSession();
                            Connection con = null;
                            Statement sta = null;
                            ResultSet res = null;
                            CallableStatement cs = null;
                            Base db = new Base();
                            con = db.getConnection();
                            sta = con.createStatement();
                            res = sta.executeQuery("select * from reportes where solucion = '' and id_inge = '0' or id_inge = '4' and estado = 'ABIERTO' or estado = 'MANTENIMIENTO';");
                            int i = 1;
                            while (res.next()) {
                                int idRep = res.getInt("ID_REPORTE");
                                String correo = res.getString("CORREO");
                                String problema = res.getString("PROBLEMA");
                                String inge = "";
                                String estado = res.getString("ESTADO");
                        %>
                        <tr>
                            <td>RE-00<%=idRep%></td>
                            <td><%=correo%></td>
                            <td><%=problema%></td>
                            <td><%=estado%></td>
                            <td><a href="problemaInge.jsp?algo=<%=idRep%>" >Ver reporte</a></td>
                        </tr>
                        <%
                        i++;
                            }
                        %>
                    </table>    

                </article>

            </div>
        </div>
        <%@include file="links.jsp" %>

    </body>
</html>
