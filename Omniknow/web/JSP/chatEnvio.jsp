<%-- 
    Document   : chatEnvio
    Created on : 21/02/2019, 12:11:59 PM
    Author     : Profesor
--%>

<%@page import="impDao.impChat"%>
<%@page import="java.util.Date"%>
<%@page import="modelo.Mensaje"%>
<%@page import="DAO.iChat"%>
<%@page import="DAO.iChat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession ses = request.getSession();
            int idMensaje = 0;
            int idConversacion = Integer.parseInt(request.getParameter("idConv") + "");
            int idReceptor = Integer.parseInt(request.getParameter("idOtro") + "");
            int idEmisor = Integer.parseInt(ses.getAttribute("id") + "");
            String txt = request.getParameter("contenido");
            Date fecha = new Date();
            iChat chat = new impChat();
            Mensaje msj = new Mensaje(idMensaje, txt, fecha, idEmisor, idReceptor, idConversacion);
            if (txt != null || txt != "") {
                                chat.agregarMensaje(msj);

                }
        
        %>
    </body>
</html>
