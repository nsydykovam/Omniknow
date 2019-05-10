<%-- 
    Document   : FAQS
    Created on : 13/02/2019, 11:30:23 AM
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
            if (request.getParameter("btnOK") != null)
            {
                try{
                    String ques =request.getParameter("textoPregunta");
                    Base b = new Base();
                    Connection con = null;
                    Statement sta = null;
                    ResultSet res = null;

                    con = b.getConnection();
                    sta = con.createStatement();
                    sta.execute("use omniknow");

                    res = sta.executeQuery("select max(id_faq) as jj from faqs;");
                    res.next();
                    int id = res.getInt("jj")+1;
                    System.out.println("\n\n\n\nESTE ES EL ID"+id+"\n\n\n\n");


                    sta.execute("insert into faqs values("+id+",'"+ques+"',0);");
                    
                    con.close();
                    b.cerrar();
                } catch(Exception e) {
                    System.out.println("\n\n\n\nHubo un error en FAQS.jsp");
                }
            }
                %>
                <script>window.open('maspreguntas.jsp','_self');</script>
    </body>
</html>
