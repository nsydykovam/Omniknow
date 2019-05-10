<%-- 
    Document   : enviarRespuesta
    Created on : 3/04/2019, 06:25:34 PM
    Author     : jorgeantoniojuarezleyva
--%>

<%@page import="Sesion.mail"%>
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
	String nombre = request.getParameter("name").toString();
	String problema = request.getParameter("problem").toString();
	String solucion = request.getParameter("sol").toString();
	String correo = request.getParameter("mail").toString();
	
	String asunto = "Solucion a tu problema";
	String cuerpo = "Estimado " + nombre + "."
		+ "\n Su problema:\n"
		+ problema + "\n"
		+ "Ha sido resuelto, esta fue la solucion que le dió un personal de nuestro equipo de soporte\n"
		+ solucion;
	
	mail.enviar(correo, asunto, cuerpo);
	
	%>
	<script>
	    alert('A sido enviada la respuesta');
	    window.open('verReportes.jsp','_Self');
	</script>
    </body>
</html>
