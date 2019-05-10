<%-- 
    Document   : verReportes
    Created on : 27/03/2019, 08:38:03 AM
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
<link rel="stylesheet" href="../assets/css/main.css" />
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
                            <td>FOLIO</td>
                            <td>CORREO</td>
                            <td>PROBLEMA</td>
                            <td>INGENIERO</td>
                            <td>ESTADO</td>
                        </tr>
                        <%  
                            request.setCharacterEncoding("UTF-8");
                            Connection con = null;
                            Statement sta = null;
                            ResultSet res = null;
                            CallableStatement cs = null;
                            Base db = new Base();
                            con = db.getConnection();
                            sta = con.createStatement();
                            res = sta.executeQuery("select * from reportes order by id_Reporte desc;");
                            while (res.next()) {
                                int idRep = res.getInt("ID_REPORTE");
                                String correo = res.getString("CORREO");
                                String problema = res.getString("PROBLEMA");
                                String solucion = res.getString("SOLUCION");
                                int idInge = res.getInt("ID_INGE");
                                String inge = "";
                                if (idInge == 0) {
                                    inge = "Sin asignar";
                                } else if(idInge == 4){
				    inge = "Gerente";
				}else{
                                    inge = idInge + "";
                                }
                                String estado = res.getString("ESTADO");
                        %>
                        <tr>
                            <td>RE-00<%=idRep%></td>
                            <td><%=correo%></td>
                            <td><%=problema%></td>
                            <td><%=inge%></td>
			<%
			    if (estado.equals("CERRADO")) {
				    
			%>
			    <td><a href="verSol.jsp?algo=<%=idRep%>"><%=estado%></a></td>
                        
			<%
			}else
{
			%>
<td><a ><%=estado%></a></td>


                        <%
			    }
%>
			</tr>
			    <%
                            }
                        %>
                    </table>
                </article>

            </div>
        </div>
        <%@include file="links.jsp" %>
    </body>
</html>
