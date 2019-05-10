<%-- 
    Document   : problema
    Created on : 3/04/2019, 05:25:41 PM
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
		res = sta.executeQuery("select * from reportes where id_inge='" + ses.getAttribute("ID").toString() + "' and ID_REPORTE = '" + id + "';");
		int i = 1;
		res.next();
		int idRep = res.getInt("ID_REPORTE");
		String correo = res.getString("CORREO");
		String problema = res.getString("PROBLEMA");
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
			<div class="meta">
			    <!--<time class="published" datetime="2015-11-01">November 1, 2015</time>-->
			</div>
		    </header>
		    <h2>Problema:</h2>
		    <p>
			<%=problema%>
		    </p>
		    <h2>Solucion:</h2>
		    <form action="guardarSolucion.jsp" method="post">
			<input type="hidden" value="<%=id%>" id="algo" name="algo">
			<textarea placeholder="Escriba la solucion al problema" rows="7" id="txtSol" name="txtSol" ></textarea>
			<input type="submit" value="guardar">
		    </form>
			<a href="mantenimiento.jsp?algo=<%=id%>" > Enviar a Mantenimiento</a>

		</article>
	    </div>
	    <%@include file="links.jsp" %>
	</div>
    </body>
</html>