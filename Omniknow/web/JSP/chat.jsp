<%-- 
    Document   : chat
    Created on : 21/02/2019, 11:38:50 AM
    Author     : Profesor
--%>

<%@page import="java.util.Date"%>
<%@page import="modelo.Mensaje"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Conexiones.Base"%>
<%@page import="java.sql.Connection"%>
<%@page import="Conexiones.Base"%>
<%@page import="Sesion.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="impDao.impChat"%>
<%@page import="DAO.iChat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
          <script src="../assets/js/jquery.min.js"></script>
<script src="../assets/js/breakpoints.min.js"></script>
<script src="../assets/js/util.js"></script>
<script src="../assets/js/main.js"></script>
        <style>
            .msjEmisor
            {
                position: relative;
                background-color: rgb(80,60,120);
                color: white;
                border-radius: 10px;
                padding: 3px;
                right: 0px;
                
            }
            .msjReceptor
            {
                position: relative;
                background-color: rgb(240,240,240);
                border-radius: 10px;
                padding: 3px;
                right: 0px;
                
            }
            .msj
            {
                padding: 3px;
            }
            
        </style>
        
            <%
                String idEnc = request.getParameter("idUser") + "" ;
            %>
            
            <script>
                $(document).ready
        (
            function() 
            {
                var refreshId =  setInterval
                ( 
                    function()
                    {
                        $('#divChat').load('mensajes.jsp?idUser=<%=idEnc%>');//actualizas el div
                    }
                    ,
                    1300 
                );
            }
        );
        function enviar()
        {
            var form = document.getElementById("formMsj");
            form.submit();
            
        }
	
	function cambiarUser(xx)
	{
	    document.getElementById("txt").innerHTML = xx;
	    
	}
            </script>    

    </head>
    <body >
        <div id="wrapper">
            <%@include file="barraSuperior.jsp" %>
            <div id="main">
                <div class="box alt" >
                    <article class="post">
                        <div class="row">
                            <div class="col-2" >
                                <ul class="alt" style="overflow: scroll;height: 700px;">
                                    <div class="meta">
					<h1 id="txt">Selecciona un chat para dialogar</h1>
                                      <%
                                            Base conexion = new Base();
                                            HttpSession ses = request.getSession();
                                            Connection c = null;
                                            Statement s = null;
                                            CallableStatement cs = null;
                                             ResultSet res = null;

                                            c = conexion.getConnection();
                                            s = c.createStatement();
                                            res = s.executeQuery("select * from infos_participantes");
                                            
                                            
                                           while (res.next())                                                    
                                            {
                                                if (res.getInt("ID_PARTICIPANTE") != Integer.parseInt(ses.getAttribute("id") + "")) 
                                                {
                                                    String nombreC = res.getString("NOMBRE");
                                                    String idEnc2 = res.getString("ID_PARTICIPANTE");
                                        %>
                                        <a href="chat.jsp?idUser=<%=idEnc2%>" class="author" onclick="cambiarUser('<%=nombreC%>');"><span class="name"><%=nombreC%></span></a><br>                                                    
                                        <%
                                                }
                                            }
                                        
                                        %>
                                    </div>
                                    
                                </ul>
                            </div>
                            <div class="col-10 col-10-xlarge">
                                <div class="box alt">
                                    <article>
                                        <div class="row">
                                            <!--ESTE ES EL DIV CAMBIANTE DE LOS CHATS!!-->
                                                <%
                                                int idConversacion = 0;
                                                if (request.getParameter("idUser") != null) 
                                                {
                                                    impChat chat = new impChat();
//                                                    
                                                    int idUserReceptor = Integer.parseInt(request.getParameter("idUser"));
                                                    idConversacion = chat.traeChat(Integer.parseInt(ses.getAttribute("id") + ""),idUserReceptor);
//                                                    //Si ya existe una conversacion con esa persona
                                                    if (idConversacion != 0) 
                                                    {
                                                        ArrayList<Mensaje> listaMensajes = new ArrayList();
                                                        listaMensajes = chat.traeMensajes(idConversacion);
                                                %>
                                                    <div class="col-12" style="">
                                                        <iframe id="iFrame" name="iFrame" style="position: absolute; width: 0px; height: 0px;"></iframe>
                                                        <form action="chatEnvio.jsp" method="get" target="iFrame" id="formMsj" name="formMsj">
                                                            <div class="row">
                                                                <div class="col-10">
                                                                    <textarea id="contenido" name="contenido" rows="5" placeholder="Escribe algo"></textarea>
                                                                </div>
                                                                <div class="col-2">
                                                                    <input type="hidden" id="idConv" name="idConv" value="<%=idConversacion%>" >
                                                                    <input type="hidden" id="idOtro" name="idOtro" value="<%=idUserReceptor%>" >
                                                                    <input type="submit" onclick="enviar();"class="button small" id="btnEnviar" name="btnEnviar"  value="enviar">
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                    <div id="divChat" name="divChat" class="col-12 col-12-xlarge" style="max-height: 480px;overflow: scroll;padding: 2px;">
                                                <%        
                                                        for (int i = listaMensajes.size() - 1; i >= 0; i--) 
                                                        {
                                                            int idMsj = listaMensajes.get(i).getIdMensaje();
                                                            String contenido = listaMensajes.get(i).getContenido();
                                                            int idEmisor = listaMensajes.get(i).getIdEmisor();
                                                            int idReceptor = listaMensajes.get(i).getIdReceptor();
                                                            if (idEmisor == Integer.parseInt(ses.getAttribute("id") + "")) 
                                                            {
                                                %>  
                                                <div class="msj"><div class="msjEmisor" > <%=contenido%></div></div>  
                                                <%                
                                                            }else
                                                            {
                                                %>  
                                                <div class="msj"><div class="msjReceptor"> <%=contenido%> </div></div>  
                                                <%
                                                            }
                                                        }
                                                        
                                                %>
                                                    </div>
                                                <%
                                                    }
                                                }
//                                                else
//                                                {
                                                %>
                                                
                                                <% 
//                                                }
                                                %> 
                                        </div>
                                    </article>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
            </div>
        </div>
        <%
//            }
        %>
    </body>
  

</html>
