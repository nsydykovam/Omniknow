<%-- 
    Document   : mantenimiento
    Created on : 5/04/2019, 07:30:16 AM
    Author     : Profesor
--%>

<%@page import="Conexiones.Base"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
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
            
            HttpSession ses = request.getSession();
        String id = request.getParameter("algo");
        Connection con = null;
        Statement sta = null;
	ResultSet res = null;
	CallableStatement cs = null;
	Base db = new Base();
	con = db.getConnection();
	sta = con.createStatement();
	sta.execute("update reportes set ESTADO = 'MANTENIMIENTO' where id_reporte = '" + id + "' ;");
        
        if (ses.getAttribute("tipo").toString().equals("3")) {
            sta.execute("update reportes set ID_INGE = '4', ESTADO = 'MANTENIMIENTO' where id_reporte = '" + id + "' ;");
            %>
        
            <script>
                window.open('responderGerente.jsp','_Self');
            </script>
        <%    
            }else
        {
         %>
        
            <script>
                window.open('verRepInge.jsp','_Self');
            </script>
        <%    
        }
        %>
        
    </body>
</html>
