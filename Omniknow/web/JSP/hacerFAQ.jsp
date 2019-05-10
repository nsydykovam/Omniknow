<%-- 
    Document   : hacerFAQ
    Created on : 18/02/2019, 11:11:45 AM
    Author     : Profesor
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Conexiones.Base"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
	    int id = Integer.parseInt(request.getParameter("elID"));
	    String respuesta = request.getParameter("respuestaFAQ");
	    //CONEXIÓN A LA BASE - inicio
	    Base conexion = new Base();
	    HttpSession sesion = request.getSession();
	    Connection c = null;
	    Statement s = null;
	    ResultSet r = null;

	    c = conexion.getConnection();
	    s = c.createStatement();
	    s.execute("use omniknow");

	    if (request.getParameter("hacerFAQ") != null) {
		r = s.executeQuery("select max(id_faqF) as jj from faqs_fija;");
		r.next();
		int idFAQ = r.getInt("jj") + 1;
		s.execute("insert into faqs_fija values(" + idFAQ + "," + id + ",'" + respuesta + "');");
		s.execute("update faqs set contestada=1 where id_faq=" + id + ";");
	    } else {
		r = s.executeQuery("select max(id_respuesta) as jj from respuestasFaqs;");
		r.next();
		int idFAQ = r.getInt("jj")+1;
		s.execute("insert into respuestasFaqs values(" + idFAQ + "," + id + ",'" + respuesta + "','1');");
		s.execute("update faqs set contestada=1 where id_faq=" + id + ";");
	    }

	    c.close();
        %>
        <script>window.open('masPreguntasE.jsp', '_self');</script>
    </body>
</html>
