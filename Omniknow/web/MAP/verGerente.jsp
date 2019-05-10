<%-- 
    Document   : verGerente
    Created on : 28/03/2019, 11:23:32 PM
    Author     : jorgeantoniojuarezleyva
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
    <script>
	function cambiar(algo)
            {
                var x = document.getElementById(algo);
                if (x.style.display === 'none') {
                    x.style.display = 'block';
                } else {
                    x.style.display = 'none';
                }

            }
    </script>
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
		<th>INGENIERO</th>
		<th>ESTADO</th>
		<th>ASIGNAR INGENIERO</th>
            </tr>
	    <%
                request.setCharacterEncoding("UTF-8");
		Connection con = null;
		Statement sta = null;
		ResultSet res = null;
		Base db = new Base();
		con = db.getConnection();
		sta = con.createStatement();
		res = sta.executeQuery("select * from reportes order by id_Reporte;");
		int i = 1;
		while (res.next()) {
		    int idRep = res.getInt("ID_REPORTE");
		    String correo = res.getString("CORREO");
		    String problema = res.getString("PROBLEMA");
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
		<td><%=estado%></td>
		<td>
	    <%
		if (idInge == 0) {
	    %>
		    <a onclick="cambiar('reporte<%=i%>');">Asignar</a>
		    <form id="reporte<%=i%>" method="post" action="asignarInge.jsp" style="display: none">
			<select id="comboInges" name="comboInges" > 
			    <option value="1">Inge1</option>
			    <option value="2">Inge2</option>
			    <option value="3">Inge3</option>
			</select>
			<input type="hidden" id="reporte" name="reporte" value="<%=i%>">
			<input type="submit" value="Asignar">
		    </form>
	    <%}%>
		</td>
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
