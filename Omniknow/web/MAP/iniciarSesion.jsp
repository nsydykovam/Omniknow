<%-- 
    Document   : iniciarSesion
    Created on : 28/03/2019, 11:15:02 PM
    Author     : jorgeantoniojuarezleyva
--%>

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
	    String user = request.getParameter("user");
	    String pass = request.getParameter("pass");

	    HttpSession ses = request.getSession();
	    if (user.equals("operador1") && pass.equals("operator")) {
		ses.setAttribute("user", "operador1");
                ses.setAttribute("tipo", "1");
	%>
                <script>window.open('index.jsp','_Self');</script>
	<%
		
	    }else if(user.equals("operador2") && pass.equals("operator")){
		ses.setAttribute("user", "operador2");
                ses.setAttribute("tipo", "1");
	%>
                <script>window.open('index.jsp','_Self');</script>
	<%
	    }else if(user.equals("Gerente") && pass.equals("manager")){
		ses.setAttribute("user", "Gerente");
                ses.setAttribute("tipo", "3");
	%>
                <script>window.open('index.jsp','_Self');</script>
	<%
	    }else if(user.equals("inge1") && pass.equals("ingenier")){
		ses.setAttribute("user", "inge1");
		ses.setAttribute("ID", "1");
                ses.setAttribute("tipo", "2");
	%>
                <script>window.open('index.jsp','_Self');</script>
	<%
	    }else if(user.equals("inge2") && pass.equals("ingenier")){
		ses.setAttribute("user", "inge2");
		ses.setAttribute("ID", "2");
                ses.setAttribute("tipo", "2");
	%>
                <script>window.open('index.jsp','_Self');</script>
	<%
	    }else if(user.equals("inge3") && pass.equals("ingenier")){
		ses.setAttribute("user", "inge3");
		ses.setAttribute("ID", "3");
                ses.setAttribute("tipo", "2");
	%>
                <script>window.open('index.jsp','_Self');</script>
	<%
	    }else if(user.equals("gerenteMantenimiento") && pass.equals("1")){
		ses.setAttribute("user", "gerenteMantenimiento");
                ses.setAttribute("tipo", "4"); // Gerente de mantenimiento
	%>
                <script>window.open('index.jsp','_Self');</script>
	<%
	    }else if(user.equals("programador") && pass.equals("1")){
		ses.setAttribute("user", "programador");
                ses.setAttribute("tipo", "5"); // Programador
	%>
                <script>window.open('index.jsp','_Self');</script>
	<%
	    }else{
	%>
	<script>alert('Usuario o Contraseñas incorrectas');window.open('InicioSesion.jsp','_Self');</script>
	<%
	    }
	%>
    </body>
</html>
