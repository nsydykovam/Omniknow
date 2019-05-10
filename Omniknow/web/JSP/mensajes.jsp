<%-- 
    Document   : mensajes
    Created on : 22/02/2019, 12:08:05 PM
    Author     : Profesor
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="impDao.impChat"%>
<%@page import="impDao.impChat"%>
<%@page import="DAO.iChat"%>
<%@page import="DAO.iChat"%>
<%@page import="modelo.Mensaje"%>
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
            int idConversacion = 0;
            String idEnc = "";
            if (request.getParameter("idUser") != null) 
            {
                iChat chat = new impChat();

                idEnc = request.getParameter("id");
                int idUserReceptor = Integer.parseInt(request.getParameter("idUser"));
                idConversacion = chat.traeChat(Integer.parseInt(ses.getAttribute("id") + ""),idUserReceptor);
                //Si ya existe una conversacion con esa persona
                if (idConversacion != 0) 
                {
                    ArrayList<Mensaje> listaMensajes = new ArrayList();
                    listaMensajes = chat.traeMensajes(idConversacion);
                    for (int i = listaMensajes.size() - 1; i >= 0; i--) 
                    {
                        int idMsj = listaMensajes.get(i).getIdMensaje();
                        String contenido = listaMensajes.get(i).getContenido();
                        int idEmisor = listaMensajes.get(i).getIdEmisor();
                        int idReceptor = listaMensajes.get(i).getIdReceptor();
                        if (idEmisor == Integer.parseInt(ses.getAttribute("id") + "")) 
                        {
            %>  <div class="msj"><div class="msjEmisor" ><%=contenido%></div></div>  <%                
                        }else
                        {
            %>  <div class="msj"><div class="msjReceptor"><%=contenido%></div></div>  <%
                        }
                    }

            %>
                </div>
            <%
                }
            }
        %>
    </body>
</html>
