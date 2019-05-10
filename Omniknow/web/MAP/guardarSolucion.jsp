<%-- 
    Document   : guardarSolucion
    Created on : 3/04/2019, 05:51:29 PM
    Author     : jorgeantoniojuarezleyva
--%>

<%@page import="java.sql.Statement"%>
<%@page import="Conexiones.Base"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
	<%@include file="barraSuperior.jsp" %>
	<%
            request.setCharacterEncoding("UTF-8");
        ses = request.getSession();
	String solucion = request.getParameter("txtSol").toString() + "";
	String id = request.getParameter("algo");
	Connection con = null;
	Statement sta = null;
	ResultSet res = null;
	CallableStatement cs = null;
	Base db = new Base();
	con = db.getConnection();
	sta = con.createStatement();
	sta.execute("update reportes set solucion = '" + solucion + "', ESTADO = 'CERRADO' where id_reporte = '" + id + "' ;");
        if(ses.getAttribute("tipo").toString().equals("3"))
        {
            sta.execute("update reportes set solucion = '" + solucion + "', ESTADO = 'CERRADO', ID_INGE = '4' where id_reporte = '" + id + "' ;");
        %>
        
        <script>
	    alert('Guardado');
	    window.open('responderGerente.jsp','_Self');
	</script>
        
        <%
        }else{
sta.execute("update reportes set solucion = '" + solucion + "', ESTADO = 'CERRADO' where id_reporte = '" + id + "' ;");
	%>
	
	<script>
	    alert('Guardado');
	    window.open('verRepInge.jsp','_Self');
	    
	</script>
        <%}%>
    </body>
</html>
