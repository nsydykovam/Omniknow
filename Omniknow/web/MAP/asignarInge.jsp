<%-- 
    Document   : asignarInge
    Created on : 28/03/2019, 11:43:47 PM
    Author     : jorgeantoniojuarezleyva
--%>

<%@page import="Conexiones.Base"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
	<%
            request.setCharacterEncoding("UTF-8");
	    String inge = request.getParameter("comboInges");
	    String idRep = request.getParameter("reporte");

	    Connection con = null;
	    Statement sta = null;
	    ResultSet res = null;
	    Base db = new Base();
	    con = db.getConnection();
	    sta = con.createStatement();
	    sta.executeUpdate("UPDATE REPORTES SET ID_INGE = '" + inge + "' WHERE ID_REPORTE = '" + idRep + "' ;");
	%>
	<script>
	    window.open('verGerente.jsp','_Self');
	</script>
    </body>
</html>
