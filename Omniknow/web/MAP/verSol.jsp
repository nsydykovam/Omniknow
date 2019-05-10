<%-- 
    Document   : verSol
    Created on : 3/04/2019, 06:22:29 PM
    Author     : jorgeantoniojuarezleyva
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Future Imperfect by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->

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
<html>
    <head>
	<title>Single - Future Imperfect by HTML5 UP</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
    </head>
    <body class="single is-preload">
	<div id="wrapper" class="panel">
	    <%@include file="barraSuperior.jsp" %>
	    <%	    
                request.setCharacterEncoding("UTF-8");
		int id = Integer.parseInt(request.getParameter("algo").toString());
		Connection con = null;
		Statement sta = null;
		ResultSet res = null;
		CallableStatement cs = null;
		Base db = new Base();
		con = db.getConnection();
		sta = con.createStatement();
		res = sta.executeQuery("select * from reportes where ID_REPORTE = '" + id + "';");
		int i = 1;
		res.next();
		int idRep = res.getInt("ID_REPORTE");
		String correo = res.getString("CORREO");
		String problema = res.getString("PROBLEMA");
		String solucion = res.getString("SOLUCION");
		String nombre = res.getString("NOMBRE");
		int idInge = res.getInt("ID_INGE");
		String inge = "";
		if (idInge == 0) {
		    inge = "Sin asignar";
		} else {
		    inge = idInge + "";
		}
		String estado = res.getString("ESTADO");
	    %>
	    <div id="main">
		<article class="post">
		    <header>
			<div class="title">
			    <h2><a href="">RE-00<%=id%></a></h2>
			</div>
		    </header>
		    <h2>Problema:</h2>
		    <p>
			<%=problema%>
		    </p>
		    <h2>Solucion:</h2>
		    <p>
			<%=solucion%>
		    </p>
		    <form action="enviarRespuesta.jsp" method="post">
			<input type="hidden" value="<%=problema%>" id="problem" name="problem">
			<input type="hidden" value="<%=solucion%>" id="sol" name="sol">
			<input type="hidden" value="<%=nombre%>" id="name" name="name">
			<input type="hidden" value="<%=correo%>" id="mail" name="mail">
			<input type="submit" value="Enviar respuesta al usuario">
		    </form>
		</article>
	    </div>
	    <%@include file="links.jsp" %>
	</div>
    </body>
</html>
